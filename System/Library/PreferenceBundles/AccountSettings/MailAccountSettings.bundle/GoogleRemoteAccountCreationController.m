@interface GoogleRemoteAccountCreationController
+ (OS_os_log)log;
- (ACUIRemoteAccountHostProtocol)host;
- (Class)accountClass;
- (PSViewController)hostingViewController;
- (UIViewController)authController;
- (void)beginAccountCreation;
@end

@implementation GoogleRemoteAccountCreationController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6E1BC;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D74E8 != -1) {
    dispatch_once(&qword_D74E8, block);
  }
  v2 = (void *)qword_D74E0;

  return (OS_os_log *)v2;
}

- (void)beginAccountCreation
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)SLGoogleAuthController);
  v4 = +[GmailAccount displayedAccountTypeString];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6E3B0;
  v8[3] = &unk_B9A70;
  v8[4] = self;
  id v5 = [v3 initWithAccountDescription:v4 presentationBlock:v8];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_6E47C;
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