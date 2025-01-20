@interface CBAlertManager
+ (id)sharedInstance;
- (BOOL)_alertNotVisible;
- (BOOL)_modalNotVisible:(unint64_t)a3;
- (BOOL)alertVisible;
- (BOOL)debugInfoVisible;
- (BOOL)powerDownVisible;
- (BOOL)thermalWarningVisible;
- (BOOL)wiFiPickerVisible;
- (CBWindow)debugInfoWindow;
- (CBWindow)powerDownWindow;
- (CBWindow)thermalWarningWindow;
- (CBWindow)wiFiPickerWindow;
- (id)_init;
- (id)_pointImageOfColor:(id)a3;
- (id)powerDownResponse;
- (void)_dismissDebugInfo;
- (void)_dismissWiFiPicker;
- (void)dismissThermalWarningWithCompletion:(id)a3;
- (void)powerDownViewRequestCancel:(id)a3;
- (void)powerDownViewRequestPowerDown:(id)a3;
- (void)setAlertVisible:(BOOL)a3;
- (void)setDebugInfoVisible:(BOOL)a3;
- (void)setDebugInfoWindow:(id)a3;
- (void)setPowerDownResponse:(id)a3;
- (void)setPowerDownVisible:(BOOL)a3;
- (void)setPowerDownWindow:(id)a3;
- (void)setThermalWarningVisible:(BOOL)a3;
- (void)setThermalWarningWindow:(id)a3;
- (void)setWiFiPickerVisible:(BOOL)a3;
- (void)setWiFiPickerWindow:(id)a3;
- (void)showDebugInfoWithCompletion:(id)a3;
- (void)showExitConfirmationWithCompletion:(id)a3 response:(id)a4;
- (void)showMenuSheetWithOptions:(unint64_t)a3 completion:(id)a4 response:(id)a5;
- (void)showPowerDownWithCompletion:(id)a3 response:(id)a4;
- (void)showThermalWarningWithCompletion:(id)a3;
- (void)showWiFiPickerWithCompletion:(id)a3;
@end

@implementation CBAlertManager

+ (id)sharedInstance
{
  if (qword_10008FE88 != -1) {
    dispatch_once(&qword_10008FE88, &stru_100079FC0);
  }
  v2 = (void *)qword_10008FE80;

  return v2;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)CBAlertManager;
  v2 = [(CBAlertManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_powerDownVisible = 0;
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v3 selector:"_dismissWiFiPicker" name:@"CBNetworkViewControllerWillDismissFromDoneButtonNotification" object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    v6 = +[CBDebugInfoViewController CBDebugInfoViewDismissButtonPressedNotification];
    [v5 addObserver:v3 selector:"_dismissDebugInfo" name:v6 object:0];
  }
  return v3;
}

- (void)showMenuSheetWithOptions:(unint64_t)a3 completion:(id)a4 response:(id)a5
{
  char v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(CBAlertManager *)self _alertNotVisible]
    && [(CBAlertManager *)self _modalNotVisible:1]
    && [(CBAlertManager *)self _modalNotVisible:2])
  {
    v10 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Presenting menu sheet…", buf, 2u);
    }

    v11 = +[UIDevice currentDevice];
    unint64_t v12 = (unint64_t)[v11 userInterfaceIdiom];

    v13 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:(v12 & 0xFFFFFFFFFFFFFFFBLL) == 1];
    v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"EXIT_DIAGNOSTICS" value:&stru_10007A9F8 table:0];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10002583C;
    v45[3] = &unk_100079FE8;
    v45[4] = self;
    id v16 = v9;
    id v46 = v16;
    v17 = +[UIAlertAction actionWithTitle:v15 style:2 handler:v45];
    [v13 addAction:v17];

    if ((v6 & 1) != 0 && ![(CBAlertManager *)self wiFiPickerVisible])
    {
      int v18 = MGGetBoolAnswer();
      v19 = +[NSBundle mainBundle];
      v20 = v19;
      if (v18) {
        CFStringRef v21 = @"WLAN_SETTINGS";
      }
      else {
        CFStringRef v21 = @"WIFI_SETTINGS";
      }
      v22 = [v19 localizedStringForKey:v21 value:&stru_10007A9F8 table:0];

      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000258CC;
      v43[3] = &unk_100079FE8;
      v43[4] = self;
      id v44 = v16;
      v23 = +[UIAlertAction actionWithTitle:v22 style:0 handler:v43];
      [v13 addAction:v23];
    }
    if ((v6 & 2) != 0)
    {
      v24 = +[NSBundle mainBundle];
      v25 = [v24 localizedStringForKey:@"SHUT_DOWN" value:&stru_10007A9F8 table:0];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10002595C;
      v41[3] = &unk_100079FE8;
      v41[4] = self;
      id v42 = v16;
      v26 = +[UIAlertAction actionWithTitle:v25 style:0 handler:v41];
      [v13 addAction:v26];
    }
    if ((v6 & 4) != 0 && ![(CBAlertManager *)self debugInfoVisible])
    {
      v27 = +[NSBundle mainBundle];
      v28 = [v27 localizedStringForKey:@"[Internal Only] CheckerBoard Debug 🐜" value:&stru_10007A9F8 table:0];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000259EC;
      v39[3] = &unk_100079FE8;
      v39[4] = self;
      id v40 = v16;
      v29 = +[UIAlertAction actionWithTitle:v28 style:0 handler:v39];
      [v13 addAction:v29];
    }
    v30 = +[NSBundle mainBundle];
    v31 = [v30 localizedStringForKey:@"CANCEL" value:&stru_10007A9F8 table:0];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100025A7C;
    v37[3] = &unk_100079FE8;
    v37[4] = self;
    id v38 = v16;
    v32 = +[UIAlertAction actionWithTitle:v31 style:1 handler:v37];
    [v13 addAction:v32];

    [(CBAlertManager *)self setAlertVisible:1];
    v33 = +[CBWindowManager sharedInstance];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100025B0C;
    v35[3] = &unk_100079BD8;
    id v36 = v8;
    id v34 = [v33 presentViewController:v13 onLayer:2 backgroundTunnel:0 statusBarVisible:0 animated:1 completion:v35];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

- (void)showExitConfirmationWithCompletion:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CBAlertManager *)self _alertNotVisible])
  {
    id v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Presenting exit CheckerBoard confirmation alert…", buf, 2u);
    }

    id v9 = +[UIDevice currentDevice];
    unint64_t v10 = (unint64_t)[v9 userInterfaceIdiom];

    v11 = +[NSBundle mainBundle];
    unint64_t v12 = [v11 localizedStringForKey:@"ARE_YOU_SURE" value:&stru_10007A9F8 table:0];
    v13 = +[UIAlertController alertControllerWithTitle:v12 message:0 preferredStyle:(v10 & 0xFFFFFFFFFFFFFFFBLL) == 1];

    v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"EXIT_DIAGNOSTICS" value:&stru_10007A9F8 table:0];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100025F20;
    v27[3] = &unk_100079FE8;
    v27[4] = self;
    id v16 = v7;
    id v28 = v16;
    v17 = +[UIAlertAction actionWithTitle:v15 style:2 handler:v27];
    [v13 addAction:v17];

    int v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_10007A9F8 table:0];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100025F6C;
    v25[3] = &unk_100079FE8;
    v25[4] = self;
    id v26 = v16;
    v20 = +[UIAlertAction actionWithTitle:v19 style:1 handler:v25];
    [v13 addAction:v20];

    [(CBAlertManager *)self setAlertVisible:1];
    CFStringRef v21 = +[CBWindowManager sharedInstance];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100025FB8;
    v23[3] = &unk_100079BD8;
    id v24 = v6;
    id v22 = [v21 presentViewController:v13 onLayer:2 backgroundTunnel:0 statusBarVisible:0 animated:1 completion:v23];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)showWiFiPickerWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(CBAlertManager *)self _modalNotVisible:0])
  {
    v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presenting Wi-Fi picker…", buf, 2u);
    }

    id v6 = [[CBNetworkViewController alloc] initWithSetupPresentationTheme:0];
    id v7 = +[UIColor whiteColor];
    id v8 = [(CBNetworkViewController *)v6 view];
    [v8 setBackgroundColor:v7];

    id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
    [(CBAlertManager *)self setWiFiPickerVisible:1];
    unint64_t v10 = +[CBWindowManager sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100026214;
    v12[3] = &unk_100079BD8;
    id v13 = v4;
    v11 = [v10 presentViewController:v9 onLayer:2 backgroundTunnel:0 statusBarVisible:1 animated:1 completion:v12];
    [(CBAlertManager *)self setWiFiPickerWindow:v11];
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)showThermalWarningWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(CBAlertManager *)self _modalNotVisible:1])
  {
    v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presenting thermal warning UI…", buf, 2u);
    }

    id v6 = objc_alloc_init(CBTemperatureWarningViewController);
    [(CBTemperatureWarningViewController *)v6 setModalPresentationStyle:5];
    [(CBTemperatureWarningViewController *)v6 setModalTransitionStyle:2];
    id v7 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
    id v8 = +[UIColor colorWithWhite:0.0 alpha:1.0];
    id v9 = [(CBAlertManager *)self _pointImageOfColor:v8];

    unint64_t v10 = [v7 navigationBar];
    [v10 setBackgroundImage:v9 forBarMetrics:0];

    [(CBAlertManager *)self setThermalWarningVisible:1];
    v11 = +[CBWindowManager sharedInstance];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000264A8;
    v13[3] = &unk_100079BD8;
    id v14 = v4;
    unint64_t v12 = [v11 presentViewController:v7 onLayer:2 backgroundTunnel:0 statusBarVisible:0 animated:1 completion:v13];
    [(CBAlertManager *)self setThermalWarningWindow:v12];
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)showPowerDownWithCompletion:(id)a3 response:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CBAlertManager *)self _modalNotVisible:2])
  {
    id v8 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Presenting power down UI…", buf, 2u);
    }

    [(CBAlertManager *)self setPowerDownResponse:v7];
    id v9 = +[SBUIPowerDownViewControllerFactory newPowerDownViewController];
    unint64_t v10 = +[UIColor lightGrayColor];
    v11 = [v9 view];
    [v11 setBackgroundColor:v10];

    [v9 setPowerDownDelegate:self];
    [v9 setModalPresentationStyle:5];
    [v9 setModalTransitionStyle:2];
    [(CBAlertManager *)self setPowerDownVisible:1];
    unint64_t v12 = +[CBWindowManager sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100026720;
    v14[3] = &unk_100079BD8;
    id v15 = v6;
    id v13 = [v12 presentViewController:v9 onLayer:2 backgroundTunnel:0 statusBarVisible:0 animated:1 completion:v14];
    [(CBAlertManager *)self setPowerDownWindow:v13];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)showDebugInfoWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(CBAlertManager *)self _modalNotVisible:3])
  {
    v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presenting debug info UI...", buf, 2u);
    }

    id v6 = objc_alloc_init(CBDebugInfoViewController);
    id v7 = +[UIColor whiteColor];
    id v8 = [(CBDebugInfoViewController *)v6 view];
    [v8 setBackgroundColor:v7];

    id v9 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
    [(CBAlertManager *)self setDebugInfoVisible:1];
    unint64_t v10 = +[CBWindowManager sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100026974;
    v12[3] = &unk_100079BD8;
    id v13 = v4;
    v11 = [v10 presentViewController:v9 onLayer:2 backgroundTunnel:0 statusBarVisible:1 animated:1 completion:v12];
    [(CBAlertManager *)self setDebugInfoWindow:v11];
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)dismissThermalWarningWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(CBAlertManager *)self _modalNotVisible:1])
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing thermal warning.", v7, 2u);
    }

    id v6 = [(CBAlertManager *)self thermalWarningWindow];
    [v6 dismissViewControllerAnimated:1];

    [(CBAlertManager *)self setThermalWarningVisible:0];
    [(CBAlertManager *)self setThermalWarningWindow:0];
  }
}

- (void)powerDownViewRequestCancel:(id)a3
{
  id v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Power down request canceled - dismissing power down UI.", v7, 2u);
  }

  [(CBAlertManager *)self setPowerDownVisible:0];
  v5 = [(CBAlertManager *)self powerDownWindow];
  [v5 dismissViewControllerAnimated:1];

  [(CBAlertManager *)self setPowerDownWindow:0];
  id v6 = [(CBAlertManager *)self powerDownResponse];
  v6[2](v6, 1);
}

- (void)powerDownViewRequestPowerDown:(id)a3
{
  id v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Power down requested.", v6, 2u);
  }

  [(CBAlertManager *)self setPowerDownVisible:0];
  v5 = [(CBAlertManager *)self powerDownResponse];
  v5[2](v5, 0);
}

- (id)_pointImageOfColor:(id)a3
{
  id v3 = a3;
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContext(v7);
  [v3 set];

  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  UIRectFill(v8);
  id v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v4;
}

- (void)_dismissWiFiPicker
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing Wi-Fi picker.", v5, 2u);
  }

  [(CBAlertManager *)self setWiFiPickerVisible:0];
  id v4 = [(CBAlertManager *)self wiFiPickerWindow];
  [v4 dismissViewControllerAnimated:1];

  [(CBAlertManager *)self setWiFiPickerWindow:0];
}

- (void)_dismissDebugInfo
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing Debug Info view", v5, 2u);
  }

  [(CBAlertManager *)self setDebugInfoVisible:0];
  id v4 = [(CBAlertManager *)self debugInfoWindow];
  [v4 dismissViewControllerAnimated:1];

  [(CBAlertManager *)self setDebugInfoWindow:0];
}

- (BOOL)_alertNotVisible
{
  if ([(CBAlertManager *)self alertVisible])
  {
    id v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "An alert is already visible.", v5, 2u);
    }
  }
  return ![(CBAlertManager *)self alertVisible];
}

- (BOOL)_modalNotVisible:(unint64_t)a3
{
  if (!a3)
  {
    if ([(CBAlertManager *)self wiFiPickerVisible]) {
      goto LABEL_9;
    }
    return 1;
  }
  if (a3 == 2)
  {
    if ([(CBAlertManager *)self powerDownVisible]) {
      goto LABEL_9;
    }
    return 1;
  }
  if (a3 != 1 || ![(CBAlertManager *)self thermalWarningVisible]) {
    return 1;
  }
LABEL_9:
  v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Modal (%ld) is already visible.", (uint8_t *)&v6, 0xCu);
  }

  return 0;
}

- (BOOL)powerDownVisible
{
  return self->_powerDownVisible;
}

- (void)setPowerDownVisible:(BOOL)a3
{
  self->_powerDownVisible = a3;
}

- (BOOL)alertVisible
{
  return self->_alertVisible;
}

- (void)setAlertVisible:(BOOL)a3
{
  self->_alertVisible = a3;
}

- (BOOL)wiFiPickerVisible
{
  return self->_wiFiPickerVisible;
}

- (void)setWiFiPickerVisible:(BOOL)a3
{
  self->_wiFiPickerVisible = a3;
}

- (BOOL)thermalWarningVisible
{
  return self->_thermalWarningVisible;
}

- (void)setThermalWarningVisible:(BOOL)a3
{
  self->_thermalWarningVisible = a3;
}

- (BOOL)debugInfoVisible
{
  return self->_debugInfoVisible;
}

- (void)setDebugInfoVisible:(BOOL)a3
{
  self->_debugInfoVisible = a3;
}

- (CBWindow)wiFiPickerWindow
{
  return self->_wiFiPickerWindow;
}

- (void)setWiFiPickerWindow:(id)a3
{
}

- (CBWindow)thermalWarningWindow
{
  return self->_thermalWarningWindow;
}

- (void)setThermalWarningWindow:(id)a3
{
}

- (CBWindow)powerDownWindow
{
  return self->_powerDownWindow;
}

- (void)setPowerDownWindow:(id)a3
{
}

- (CBWindow)debugInfoWindow
{
  return self->_debugInfoWindow;
}

- (void)setDebugInfoWindow:(id)a3
{
}

- (id)powerDownResponse
{
  return self->_powerDownResponse;
}

- (void)setPowerDownResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_powerDownResponse, 0);
  objc_storeStrong((id *)&self->_debugInfoWindow, 0);
  objc_storeStrong((id *)&self->_powerDownWindow, 0);
  objc_storeStrong((id *)&self->_thermalWarningWindow, 0);

  objc_storeStrong((id *)&self->_wiFiPickerWindow, 0);
}

@end