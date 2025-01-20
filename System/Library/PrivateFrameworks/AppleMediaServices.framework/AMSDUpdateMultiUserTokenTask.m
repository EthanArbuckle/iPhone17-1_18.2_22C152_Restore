@interface AMSDUpdateMultiUserTokenTask
- (ACAccount)account;
- (AMSDHome)home;
- (AMSDMultiUserController)controller;
- (AMSDMultiUserMetrics)metrics;
- (AMSDUpdateMultiUserTokenTask)initWithController:(id)a3 account:(id)a4 home:(id)a5;
- (AMSDUpdateMultiUserTokenTask)initWithController:(id)a3 home:(id)a4;
- (id)performTask;
- (void)setMetrics:(id)a3;
@end

@implementation AMSDUpdateMultiUserTokenTask

- (AMSDUpdateMultiUserTokenTask)initWithController:(id)a3 home:(id)a4
{
  return [(AMSDUpdateMultiUserTokenTask *)self initWithController:a3 account:0 home:a4];
}

- (AMSDUpdateMultiUserTokenTask)initWithController:(id)a3 account:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDUpdateMultiUserTokenTask;
  v12 = [(AMSDUpdateMultiUserTokenTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_controller, a3);
    objc_storeStrong((id *)&v13->_account, a4);
    objc_storeStrong((id *)&v13->_home, a5);
  }

  return v13;
}

- (id)performTask
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000604D0;
  v4[3] = &unk_100111EF8;
  v4[4] = self;
  v2 = [(AMSDUpdateMultiUserTokenTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

- (AMSDMultiUserController)controller
{
  return self->_controller;
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSDHome)home
{
  return self->_home;
}

- (AMSDMultiUserMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end