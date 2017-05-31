require 'rails_helper'

feature  "Employee" do
  before :each do
    login(User.create(email: "paromitadgp@gmail.com"))
  end

  scenario "index page" do
    visit employees_path

    expect(page).to have_css('table.table-last')
  end

  scenario "new employee page" do
    visit new_employee_path

    find_button('Create')
  end

  scenario "create new employee" do
    visit new_employee_path

    fill_in "Name", with: "paromita"
    fill_in "Email", with: "pgorai@kreeti.com"
    expect { click_button 'Create' }.to change(Employee, :count).by(1)
  end

  scenario "edit employee page" do
    employee = FactoryGirl.create(:employee)
    visit edit_employee_path(employee)

    find_button('Update')
  end

  scenario "update employee" do
    employee = FactoryGirl.create(:employee)
    visit edit_employee_path(employee)

    employee.reload
    expect(current_path) == employees_path
  end
end
