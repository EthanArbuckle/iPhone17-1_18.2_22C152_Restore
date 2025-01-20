@interface UIViewController
- (void)_clearRemoteSetupUX;
- (void)_remoteSetupCancelled;
- (void)_remoteSetupCompleted;
- (void)_remoteSetupConfiguring;
- (void)_remoteSetupFailed;
- (void)_remoteSetupPresentAuthentication:(id)a3;
- (void)_remoteSetupRequestAuthentication:(id)a3;
- (void)configureForRemoteSetup;
- (void)unConfigureForRemoteSetup;
@end

@implementation UIViewController

- (void)configureForRemoteSetup
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_remoteSetupPresentAuthentication:" name:@"CBRemoteSetupAuthenticaitonDisplayNotification" object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_remoteSetupRequestAuthentication:" name:@"CBRemoteSetupAuthenticationRequestNotification" object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_remoteSetupFailed" name:@"CBRemoteSetupFailedNotification" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_remoteSetupConfiguring" name:@"CBRemoteSetupConfiguringNotification" object:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_remoteSetupCompleted" name:@"CBRemoteSetupCompletedNotification" object:0];

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_remoteSetupCancelled" name:@"CBRemoteSetupCancelledNotification" object:0];

  v9 = +[CBRemoteSetupManager sharedInstance];
  [(UIViewController *)self setRemoteSetupManager:v9];

  [(UIViewController *)self setRemoteSetupAuthController:0];
  [(UIViewController *)self setRemoteSetupConfiguringController:0];
  [(UIViewController *)self setRemoteSetupQRCodeScannerController:0];
  [(UIViewController *)self setRemoteSetupQRCodeScanner:0];
  v10 = +[NSUserDefaults standardUserDefaults];
  if (!v10 || ([v10 BOOLForKey:@"remoteSetupCompleted"] & 1) == 0)
  {
    v11 = +[CBRemoteSetupManager sharedInstance];
    [v11 startRemoteSetupBroadcast];
  }

  _objc_release_x1();
}

- (void)unConfigureForRemoteSetup
{
  v3 = +[CBRemoteSetupManager sharedInstance];
  [v3 endRemoteSetupBroadcast];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"CBRemoteSetupAuthenticaitonDisplayNotification" object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"CBRemoteSetupFailedNotification" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:@"CBRemoteSetupConfiguringNotification" object:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:@"CBRemoteSetupCompletedNotification" object:0];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:@"CBRemoteSetupCancelledNotification" object:0];
}

- (void)_remoteSetupPresentAuthentication:(id)a3
{
  id v4 = a3;
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 userInfo];
    int v34 = 138412290;
    v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote setup is requesting we present authentication with info: %@", (uint8_t *)&v34, 0xCu);
  }
  v7 = [v4 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"type"];

  v9 = [v4 userInfo];
  v10 = [v9 objectForKeyedSubscript:@"pin"];

  v11 = [(UIViewController *)self remoteSetupAuthController];

  if (v11)
  {
    v12 = [(UIViewController *)self remoteSetupAuthController];
    [v12 dismissViewControllerAnimated:1 completion:0];
  }
  if (v10) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v14 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000489F0(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  else
  {
    if ([v8 isEqualToValue:&off_10007CBE8])
    {
      v22 = +[NSBundle mainBundle];
      v14 = [v22 localizedStringForKey:@"REMOTE_SETUP_PIN_AUTH_TITLE" value:&stru_10007A9F8 table:0];

      v23 = +[NSBundle mainBundle];
      v24 = v23;
      CFStringRef v25 = @"REMOTE_SETUP_PIN_AUTH_DETAIL";
LABEL_16:
      v27 = [v23 localizedStringForKey:v25 value:&stru_10007A9F8 table:0];

      v28 = [[CBRemoteSetupAuthenticationViewController alloc] initWithTitle:v14 detailText:v27 icon:0];
      [(UIViewController *)self setRemoteSetupAuthController:v28];

      v29 = [(UIViewController *)self remoteSetupAuthController];
      [v29 setPairingCode:v10];

      id v30 = [v8 intValue];
      v31 = [(UIViewController *)self remoteSetupAuthController];
      [v31 setPasswordType:v30];

      v32 = [(UIViewController *)self remoteSetupAuthController];
      [(UIViewController *)self presentViewController:v32 animated:1 completion:0];

      goto LABEL_20;
    }
    if ([v8 isEqualToValue:&off_10007CC00])
    {
      v26 = +[NSBundle mainBundle];
      v14 = [v26 localizedStringForKey:@"REMOTE_SETUP_QR_AUTH_TITLE" value:&stru_10007A9F8 table:0];

      v23 = +[NSBundle mainBundle];
      v24 = v23;
      CFStringRef v25 = @"REMOTE_SETUP_QR_AUTH_DETAIL";
      goto LABEL_16;
    }
    v33 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100048978((uint64_t)v8, v33);
    }

    v14 = [(UIViewController *)self remoteSetupManager];
    [v14 setupFailed];
  }
LABEL_20:
}

- (void)_remoteSetupRequestAuthentication:(id)a3
{
  id v4 = a3;
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote setup wants us to answer authenticiation with info: %@", buf, 0xCu);
  }

  v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"type"];

  if ([v7 isEqualToValue:&off_10007CC00])
  {
    CFStringRef v8 = @"REMOTE_SETUP_QR_SCAN_DETAIL";
  }
  else
  {
    if (([v7 isEqualToValue:&off_10007CBE8] & 1) == 0)
    {
      v24 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_100048A60((uint64_t)v7, v24);
      }
      goto LABEL_15;
    }
    CFStringRef v8 = @"REMOTE_SETUP_ACC_SCAN_DETAIL";
  }
  v9 = [(UIViewController *)self remoteSetupQRCodeScannerController];

  if (v9)
  {
    v10 = [(UIViewController *)self remoteSetupQRCodeScannerController];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100005EDC;
    v36[3] = &unk_1000794E0;
    v36[4] = self;
    [v10 dismissViewControllerAnimated:1 completion:v36];

    [(UIViewController *)self setRemoteSetupQRCodeScannerController:0];
  }
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100005F54;
  v35[3] = &unk_100079508;
  v35[4] = self;
  v11 = [[CBQRCodeScanner alloc] initWithScanCompletion:v35];
  [(UIViewController *)self setRemoteSetupQRCodeScanner:v11];

  v12 = [(UIViewController *)self remoteSetupQRCodeScanner];

  if (!v12)
  {
    v24 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100048A28(v24, v25, v26, v27, v28, v29, v30, v31);
    }
LABEL_15:

    v32 = [(UIViewController *)self remoteSetupManager];
    [v32 setupFailed];

    goto LABEL_16;
  }
  BOOL v13 = [CBRemoteSetupQRCodeScanViewController alloc];
  v14 = +[NSBundle mainBundle];
  [v14 localizedStringForKey:@"REMOTE_SETUP_QR_SCAN_TITLE" value:&stru_10007A9F8 table:0];
  v33 = v7;
  v16 = id v15 = v4;
  uint64_t v17 = +[NSBundle mainBundle];
  uint64_t v18 = [v17 localizedStringForKey:v8 value:&stru_10007A9F8 table:0];
  uint64_t v19 = [(UIViewController *)self remoteSetupManager];
  uint64_t v20 = [(UIViewController *)self remoteSetupQRCodeScanner];
  uint64_t v21 = [v20 captureSession];
  v22 = [(CBRemoteSetupQRCodeScanViewController *)v13 initWithTitle:v16 detailText:v18 icon:0 remoteSetupManager:v19 captureSession:v21];
  [(UIViewController *)self setRemoteSetupQRCodeScannerController:v22];

  id v4 = v15;
  v7 = v33;

  v23 = [(UIViewController *)self remoteSetupQRCodeScannerController];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100006094;
  v34[3] = &unk_1000794E0;
  v34[4] = self;
  [(UIViewController *)self presentViewController:v23 animated:1 completion:v34];

LABEL_16:
}

- (void)_remoteSetupConfiguring
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote setup is now configuring", v13, 2u);
  }

  id v4 = [(UIViewController *)self remoteSetupAuthController];

  if (v4)
  {
    v5 = [(UIViewController *)self remoteSetupAuthController];
    [v5 dismissViewControllerAnimated:1 completion:0];

    [(UIViewController *)self setRemoteSetupAuthController:0];
  }
  v6 = [CBRemoteSetupConfiguringViewController alloc];
  v7 = +[NSBundle mainBundle];
  CFStringRef v8 = [v7 localizedStringForKey:@"REMOTE_SETUP_CONFIGURING_TITLE" value:&stru_10007A9F8 table:0];
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"REMOTE_SETUP_CONFIGURING_DETAIL" value:&stru_10007A9F8 table:0];
  v11 = [(CBRemoteSetupConfiguringViewController *)v6 initWithTitle:v8 detailText:v10 icon:0];
  [(UIViewController *)self setRemoteSetupConfiguringController:v11];

  v12 = [(UIViewController *)self remoteSetupConfiguringController];
  [(UIViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_remoteSetupCompleted
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote setup complete. Leaving breadcrumb prior to restart.", buf, 2u);
  }

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setBool:1 forKey:@"remoteSetupCompleted"];
  v5 = [(UIViewController *)self remoteSetupManager];
  v6 = [v5 remoteLocaleCode];

  if (v6)
  {
    v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Applying language from remote setup", v12, 2u);
    }

    CFStringRef v8 = +[CBLocationController sharedLocationController];
    [v8 selectLanguage:v6 restartAfterCompletion:0];
  }
  v9 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restarting CheckerBoard to complete remote setup.", v11, 2u);
  }

  v10 = +[FBSystemService sharedInstance];
  [v10 exitAndRelaunch:1];
}

- (void)_clearRemoteSetupUX
{
  v3 = [(UIViewController *)self remoteSetupConfiguringController];

  if (v3)
  {
    id v4 = [(UIViewController *)self remoteSetupConfiguringController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    [(UIViewController *)self setRemoteSetupConfiguringController:0];
  }
  v5 = [(UIViewController *)self remoteSetupAuthController];

  if (v5)
  {
    v6 = [(UIViewController *)self remoteSetupAuthController];
    [v6 dismissViewControllerAnimated:1 completion:0];

    [(UIViewController *)self setRemoteSetupAuthController:0];
  }
  v7 = [(UIViewController *)self remoteSetupQRCodeScannerController];

  if (v7)
  {
    CFStringRef v8 = [(UIViewController *)self remoteSetupQRCodeScannerController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006614;
    v9[3] = &unk_1000794E0;
    v9[4] = self;
    [v8 dismissViewControllerAnimated:1 completion:v9];

    [(UIViewController *)self setRemoteSetupQRCodeScannerController:0];
  }
}

- (void)_remoteSetupCancelled
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote setup cancelled.", v4, 2u);
  }

  [(UIViewController *)self _clearRemoteSetupUX];
}

- (void)_remoteSetupFailed
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Remote setup failed. Restarting broadcast after alert.", buf, 2u);
  }

  [(UIViewController *)self _clearRemoteSetupUX];
  id v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"REMOTE_SETUP_FAILED_TITLE" value:&stru_10007A9F8 table:0];
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"REMOTE_SETUP_FAILED_DETAIL" value:&stru_10007A9F8 table:0];
  CFStringRef v8 = +[UIAlertController alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"DISMISS" value:&stru_10007A9F8 table:0];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000068F4;
  v12[3] = &unk_100079530;
  v12[4] = self;
  v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:v12];
  [v8 addAction:v11];

  [(UIViewController *)self presentViewController:v8 animated:1 completion:0];
}

@end