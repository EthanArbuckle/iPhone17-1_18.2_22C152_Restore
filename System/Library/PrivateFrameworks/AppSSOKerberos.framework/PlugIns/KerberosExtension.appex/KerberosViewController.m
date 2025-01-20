@interface KerberosViewController
- (KerberosViewController)initWithCoder:(id)a3;
- (KerberosViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)nibName;
- (void)resetUI;
@end

@implementation KerberosViewController

- (id)nibName
{
  return @"KerberosViewController";
}

- (KerberosViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)KerberosViewController;
  v8 = [(KerberosBaseViewController *)&v16 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v9 = +[NSNotificationCenter defaultCenter];
    v10 = +[NSOperationQueue mainQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000CE50;
    v13[3] = &unk_1000147E0;
    objc_copyWeak(&v14, &location);
    id v11 = [v9 addObserverForName:@"com.apple.KerberosExtension.requestFinished" object:0 queue:v10 usingBlock:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (KerberosViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KerberosViewController;
  return [(KerberosBaseViewController *)&v4 initWithCoder:a3];
}

- (void)resetUI
{
  if (qword_10001AAF0 != -1) {
    dispatch_once(&qword_10001AAF0, &stru_100014800);
  }
  v3 = (void *)qword_10001AAF8;
  if (os_log_type_enabled((os_log_t)qword_10001AAF8, OS_LOG_TYPE_DEBUG)) {
    sub_10000D988(v3, self);
  }
  objc_super v4 = [(KerberosBaseViewController *)self loginViewController];
  [v4 resetUI];

  [(KerberosBaseViewController *)self setLoginViewController:0];
  [(KerberosBaseViewController *)self setPasswordViewController:0];
}

@end