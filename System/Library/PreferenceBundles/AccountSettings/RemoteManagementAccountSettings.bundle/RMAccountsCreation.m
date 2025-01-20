@interface RMAccountsCreation
- (DMCEnrollmentInterface)enrollmentInterface;
- (RMAccountsCreation)init;
- (id)accountCreationCompletionHandler;
- (void)beginAccountCreationWithSpecifier:(id)a3 fromViewController:(id)a4 completion:(id)a5;
- (void)setAccountCreationCompletionHandler:(id)a3;
- (void)setEnrollmentInterface:(id)a3;
@end

@implementation RMAccountsCreation

- (RMAccountsCreation)init
{
  v3.receiver = self;
  v3.super_class = (Class)RMAccountsCreation;
  return [(RMAccountsCreation *)&v3 init];
}

- (void)beginAccountCreationWithSpecifier:(id)a3 fromViewController:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = objc_retainBlock(v7);
  id accountCreationCompletionHandler = self->_accountCreationCompletionHandler;
  self->_id accountCreationCompletionHandler = v9;

  id v11 = objc_alloc((Class)DMCEnrollmentInterface);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_3438;
  v15[3] = &unk_40D0;
  id v16 = v7;
  id v12 = v7;
  id v13 = [v11 initFromViewController:v8 enrollmentResultBlock:v15];

  [(RMAccountsCreation *)self setEnrollmentInterface:v13];
  v14 = [(RMAccountsCreation *)self enrollmentInterface];
  [v14 startBYODEnrollment];
}

- (id)accountCreationCompletionHandler
{
  return self->_accountCreationCompletionHandler;
}

- (void)setAccountCreationCompletionHandler:(id)a3
{
}

- (DMCEnrollmentInterface)enrollmentInterface
{
  return self->_enrollmentInterface;
}

- (void)setEnrollmentInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentInterface, 0);

  objc_storeStrong(&self->_accountCreationCompletionHandler, 0);
}

@end