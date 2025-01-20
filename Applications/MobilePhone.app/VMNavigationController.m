@interface VMNavigationController
- (VMNavigationController)init;
- (VMNavigationController)initWithCoder:(id)a3;
- (VMNavigationController)initWithManager:(id)a3;
- (VMNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (VMNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (VMNavigationController)initWithRootViewController:(id)a3;
- (VMVoicemailManager)manager;
@end

@implementation VMNavigationController

- (VMNavigationController)initWithManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VMNavigationController;
  v6 = [(VMNavigationController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_manager, a3);
  }

  return v7;
}

- (VMNavigationController)init
{
  return 0;
}

- (VMNavigationController)initWithCoder:(id)a3
{
  return 0;
}

- (VMNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (VMNavigationController)initWithRootViewController:(id)a3
{
  return 0;
}

- (VMNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  return 0;
}

- (VMVoicemailManager)manager
{
  return self->_manager;
}

- (void).cxx_destruct
{
}

@end