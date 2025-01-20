@interface AOLRemoteAccountCreationController
+ (OS_os_log)log;
- (ACUIRemoteAccountHostProtocol)host;
- (Class)accountClass;
- (PSViewController)hostingViewController;
- (UIViewController)authController;
- (void)beginAccountCreation;
@end

@implementation AOLRemoteAccountCreationController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_23588;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7368 != -1) {
    dispatch_once(&qword_D7368, block);
  }
  v2 = (void *)qword_D7360;

  return (OS_os_log *)v2;
}

- (void)beginAccountCreation
{
  id v3 = objc_alloc((Class)SLAOLWebAuthController);
  v4 = +[AOLAccount displayedAccountTypeString];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_23774;
  v9[3] = &unk_B8F98;
  v9[4] = self;
  id v5 = [v3 initWithAccountDescription:v4 presentationBlock:v9];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_237FC;
  v6[3] = &unk_B8FC0;
  objc_copyWeak(&v7, &location);
  [v5 setCompletion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (PSViewController)hostingViewController
{
  return self->_hostingViewController;
}

- (ACUIRemoteAccountHostProtocol)host
{
  return self->_host;
}

- (UIViewController)authController
{
  return self->_authController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_host, 0);

  objc_storeStrong((id *)&self->_hostingViewController, 0);
}

@end