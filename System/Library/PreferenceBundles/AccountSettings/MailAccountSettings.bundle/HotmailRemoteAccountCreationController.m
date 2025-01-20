@interface HotmailRemoteAccountCreationController
+ (OS_os_log)log;
- (ACUIRemoteAccountHostProtocol)host;
- (Class)accountClass;
- (PSViewController)hostingViewController;
- (UIViewController)authController;
- (id)supportedDataclasses;
- (void)beginAccountCreation;
@end

@implementation HotmailRemoteAccountCreationController

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6E764;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D74F8 != -1) {
    dispatch_once(&qword_D74F8, block);
  }
  v2 = (void *)qword_D74F0;

  return (OS_os_log *)v2;
}

- (void)beginAccountCreation
{
  id v3 = objc_alloc(off_D7120());
  v4 = +[HotmailAccount displayedAccountTypeString];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_6E970;
  v10[3] = &unk_B9AA0;
  v10[4] = self;
  LOBYTE(v6) = 1;
  id v5 = [v3 initWithAccount:0 accountStore:0 authURI:0 accountType:2 userName:0 accountDescription:v4 isFirstTimeSetup:v6 presentationBlock:v10];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_6E9F8;
  v7[3] = &unk_B9AC8;
  objc_copyWeak(&v8, &location);
  [v5 setCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (id)supportedDataclasses
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", kAccountDataclassMail, 0);
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