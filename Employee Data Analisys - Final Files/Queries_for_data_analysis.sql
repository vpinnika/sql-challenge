--Data Analysis


-- 1) List the following details of each employee: employee number, last name, first name, gender, and salary.

	select emp.emp_no,
		   emp.last_name,
		   emp.first_name,
		   emp.gender,
		   sal.salary
	from employees emp,
		 salaries sal
	where emp.emp_no = sal.emp_no;

-- 2) List employees who were hired in 1986.

	select emp.emp_no,
		   emp.last_name,
		   emp.first_name,
		   emp.hire_date
	from employees emp
	where emp.hire_date between '1986-01-01' and '1986-12-31' ;


-- 3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

	select dept.dept_no,
		   dept.dept_name,
		   emp.emp_no,
		   emp.last_name,
		   emp.first_name,
		   dept_mgr.from_date,
		   dept_mgr.to_date
	from employees emp,
		 departments dept,
		 dept_manager dept_mgr
	where dept_mgr.emp_no = emp.emp_no
	and   dept_mgr.dept_no = dept.dept_no;

-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.

	select emp.emp_no,
		   emp.last_name,
		   emp.first_name,
		   dept.dept_name
	from employees emp,
		 departments dept,
		 dept_emp dept_emp
	where dept_emp.emp_no = emp.emp_no
	and   dept_emp.dept_no = dept.dept_no;


-- 5) List all employees whose first name is "Hercules" and last names begin with "B."

	select emp.emp_no,
		   emp.last_name,
		   emp.first_name	   
	from employees emp
	where emp.first_name ='Hercules'
	and emp.last_name like 'B%';


-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.

	select emp.emp_no,
		   emp.last_name,
		   emp.first_name,
		   dept.dept_name
	from employees emp,
		 departments dept,
		 dept_emp dept_emp
	where dept_emp.emp_no = emp.emp_no
	and   dept_emp.dept_no = dept.dept_no
	and dept.dept_name = 'Sales';


-- 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

	select emp.emp_no,
		   emp.last_name,
		   emp.first_name,
		   dept.dept_name
	from employees emp,
		 departments dept,
		 dept_emp dept_emp
	where dept_emp.emp_no = emp.emp_no
	and   dept_emp.dept_no = dept.dept_no
	and (dept.dept_name = 'Sales' or dept_name='Development');


-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

	select last_name,
			count(*) "frequency_count"        
	from employees
	group by last_name 
	order by count(*) desc;
	
	
