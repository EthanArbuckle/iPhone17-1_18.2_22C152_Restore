@interface VMViewController
- (VMViewController)init;
- (VMViewController)initWithCoder:(id)a3;
- (VMViewController)initWithManager:(id)a3;
- (VMViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (VMVoicemailManager)manager;
@end

@implementation VMViewController

- (VMViewController)initWithManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VMViewController;
  v6 = [(PHViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_manager, a3);
  }

  return v7;
}

- (VMViewController)init
{
  return 0;
}

- (VMViewController)initWithCoder:(id)a3
{
  return 0;
}

- (VMViewController)initWithNibName:(id)a3 bundle:(id)a4
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