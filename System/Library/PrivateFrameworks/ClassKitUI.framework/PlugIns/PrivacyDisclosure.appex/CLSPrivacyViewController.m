@interface CLSPrivacyViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (void)dismiss;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CLSPrivacyViewController

- (void)viewDidAppear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CLSPrivacyViewController;
  [(CLSPrivacyViewController *)&v20 viewDidAppear:a3];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"ALERT_TITLE" value:&stru_100004180 table:@"Localizeable"];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"ALERT_MESSAGE" value:&stru_100004180 table:@"Localizeable"];
  v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  objc_initWeak(&location, self);
  v9 = +[NSBundle bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"Settings" value:&stru_100004180 table:@"Localizeable"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100003614;
  v17[3] = &unk_1000040E0;
  objc_copyWeak(&v18, &location);
  v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v17];

  [v8 addAction:v11];
  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"OK" value:&stru_100004180 table:@"Localizeable"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000036A4;
  v15[3] = &unk_1000040E0;
  objc_copyWeak(&v16, &location);
  v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v15];

  [v8 addAction:v14];
  [(CLSPrivacyViewController *)self presentViewController:v8 animated:1 completion:&stru_100004120];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)dismiss
{
  id v2 = [(CLSPrivacyViewController *)self _remoteViewControllerProxy];
  [v2 dismissViewControllerAnimated:1 completion:&stru_100004140];
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLSServiceViewControllerInterface];
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLSRemoteViewControllerInterface];
}

@end