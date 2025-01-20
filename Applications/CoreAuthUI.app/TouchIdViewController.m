@interface TouchIdViewController
- (BOOL)_isSensorActive;
- (ScreenDimmingView)dimmingView;
- (void)_addFrontMostSubview:(id)a3;
- (void)_configureUI;
- (void)_dismissUIWithCompletionHandler:(id)a3;
- (void)_handleBiometryNoMatch;
- (void)_handleBiometryRequiredEnterPasscode;
- (void)_handleBiometryRequiredFailure;
- (void)_presentUI:(id)a3;
- (void)_setupAlertController;
- (void)_setupAlertControllerActions:(id)a3;
- (void)_setupUI;
- (void)_uiCancelWithUnderlyingError;
- (void)didReceiveAuthenticationData;
- (void)dismissChildWithCompletionHandler:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation TouchIdViewController

- (void)loadView
{
  v3 = (ScreenDimmingView *)objc_opt_new();
  dimmingView = self->_dimmingView;
  self->_dimmingView = v3;

  [(TouchIdViewController *)self setView:v3];
  self->_state = 0;
  v5 = objc_alloc_init(TouchIdViewModel);
  viewModel = self->_viewModel;
  self->_viewModel = v5;

  [(TouchIdViewController *)self _setupUI];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TouchIdViewController;
  [(TransitionViewController *)&v7 viewDidAppear:a3];
  if (!self->_state)
  {
    self->_state = 1;
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000EA08;
    v4[3] = &unk_1000860D8;
    objc_copyWeak(&v5, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TouchIdViewController;
  [(TouchIdViewController *)&v10 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  viewModel = self->_viewModel;
  v6 = [(TransitionViewController *)self options];
  objc_super v7 = [(TouchIdViewModel *)viewModel alertTintFromOptions:v6];
  v8 = [(TouchIdViewController *)self view];
  v9 = [v8 window];
  [v9 setTintColor:v7];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TouchIdViewController;
  [(TouchIdViewController *)&v5 dismissViewControllerAnimated:a3 completion:a4];
  self->_state = 5;
}

- (void)_setupUI
{
  [(TouchIdViewController *)self _setupAlertController];

  [(TouchIdViewController *)self _configureUI];
}

- (void)_presentUI:(id)a3
{
}

- (void)_dismissUIWithCompletionHandler:(id)a3
{
}

- (void)_addFrontMostSubview:(id)a3
{
  alertController = self->_alertController;
  id v5 = a3;
  v6 = [(TouchIdAlertController *)alertController view];
  objc_super v7 = [v6 superview];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(TouchIdViewController *)self view];
  }
  id v10 = v9;

  [v10 addSubview:v5];
  [v10 bringSubviewToFront:v5];
}

- (void)_setupAlertController
{
  v3 = objc_alloc_init(TouchIdAlertController);
  alertController = self->_alertController;
  self->_alertController = v3;

  id v5 = self->_alertController;
  v6 = [(TransitionViewController *)self authenticationTitle];
  [(TouchIdAlertController *)v5 setTitle:v6];

  objc_super v7 = self->_alertController;
  v8 = [(TransitionViewController *)self authenticationSubtitle];
  [(TouchIdAlertController *)v7 setMessage:v8];

  viewModel = self->_viewModel;
  id v12 = [(TransitionViewController *)self options];
  id v10 = [v12 copy];
  v11 = [(TouchIdViewModel *)viewModel alertActionsFromOptions:v10 event:0];
  [(TouchIdViewController *)self _setupAlertControllerActions:v11];
}

- (void)_uiCancelWithUnderlyingError
{
}

- (void)_setupAlertControllerActions:(id)a3
{
  id v5 = a3;
  v6 = objc_opt_new();
  objc_initWeak(location, self);
  objc_super v7 = [v5 objectForKeyedSubscript:&off_10008A2B8];

  if (v7)
  {
    v8 = [v5 objectForKeyedSubscript:&off_10008A2B8];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000F180;
    v29[3] = &unk_100086260;
    objc_copyWeak(&v30, location);
    id v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v29];
    [v6 addObject:v9];

    objc_destroyWeak(&v30);
  }
  id v10 = [v5 objectForKeyedSubscript:&off_10008A2D0];
  v11 = v10;
  if (v10 && [v10 count] == (id)2)
  {
    id v12 = [v11 objectAtIndexedSubscript:0];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000F1E4;
    v27[3] = &unk_100086260;
    objc_copyWeak(&v28, location);
    v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v27];
    [v6 addObject:v13];

    objc_destroyWeak(&v28);
  }
  v14 = [v5 objectForKeyedSubscript:&off_10008A2E8];

  if (v14)
  {
    v15 = [v5 objectForKeyedSubscript:&off_10008A2E8];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000F254;
    v25[3] = &unk_100086260;
    objc_copyWeak(&v26, location);
    v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v25];
    [v6 addObject:v16];

    objc_destroyWeak(&v26);
  }
  v17 = [v5 objectForKeyedSubscript:&off_10008A300];

  if (v17)
  {
    v18 = [v5 objectForKeyedSubscript:&off_10008A300];
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_10000F298;
    v23 = &unk_100086260;
    objc_copyWeak(&v24, location);
    v19 = +[UIAlertAction actionWithTitle:v18 style:0 handler:&v20];
    [v6 addObject:v19, v20, v21, v22, v23];

    objc_destroyWeak(&v24);
  }
  objc_storeStrong((id *)&self->_actions, a3);
  [(TouchIdAlertController *)self->_alertController setActions:v6];

  objc_destroyWeak(location);
}

- (BOOL)_isSensorActive
{
  return (unint64_t)(self->_state - 5) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)_configureUI
{
  int64_t state = self->_state;
  switch(state)
  {
    case 4:
      [(TouchIdViewController *)self _handleBiometryRequiredEnterPasscode];
      break;
    case 3:
      [(TouchIdViewController *)self _handleBiometryRequiredFailure];
      break;
    case 2:
      [(TouchIdViewController *)self _handleBiometryNoMatch];
      break;
  }
  if ([(TouchIdViewController *)self _isSensorActive]) {
    +[UIColor systemPinkColor];
  }
  else {
  id v6 = +[UIColor tertiaryLabelColor];
  }
  v4 = [(TouchIdAlertController *)self->_alertController _headerContentViewController];
  id v5 = [v4 view];
  [v5 setTintColor:v6];
}

- (void)_handleBiometryNoMatch
{
  viewModel = self->_viewModel;
  v4 = [(TransitionViewController *)self options];
  id v5 = [v4 copy];
  id v14 = [(TouchIdViewModel *)viewModel alertActionsFromOptions:v5 event:1];

  id v6 = [(TransitionViewController *)self options];
  objc_super v7 = [v6 objectForKeyedSubscript:&off_10008A318];
  if ([v7 BOOLValue])
  {
  }
  else
  {
    unsigned __int8 v8 = +[LAUtils isLocationBasedPolicy:[(TransitionViewController *)self policy]];

    if (v8)
    {
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      id v10 = v9;
      CFStringRef v11 = @"TOUCH_ID_REQUIRED";
      goto LABEL_6;
    }
  }
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = v9;
  CFStringRef v11 = @"TRY_AGAIN";
LABEL_6:
  id v12 = [v9 localizedStringForKey:v11 value:&stru_100088CF0 table:@"MobileUI"];

  v13 = [(TransitionViewController *)self authenticationTitle];

  if (v13 != v12)
  {
    [(TransitionViewController *)self setAuthenticationTitle:v12];
    [(TouchIdAlertController *)self->_alertController setTitle:v12];
  }
  if (![(NSDictionary *)self->_actions isEqualToDictionary:v14]) {
    [(TouchIdViewController *)self _setupAlertControllerActions:v14];
  }
  [(TouchIdAlertController *)self->_alertController shake];
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v12);
}

- (void)_handleBiometryRequiredFailure
{
  v21[0] = &off_10008A2D0;
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"LEARN_MORE" value:&stru_100088CF0 table:@"MobileUI"];
  v20[0] = v4;
  id v5 = +[LACUIDTOUtilities dtoLearnMoreLinkURL];
  v20[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v20 count:2];
  v21[1] = &off_10008A300;
  v22[0] = v6;
  objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v8 = [v7 localizedStringForKey:@"OK" value:&stru_100088CF0 table:@"MobileUI"];
  v22[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  if (![(NSDictionary *)self->_actions isEqualToDictionary:v9])
  {
    [(TouchIdViewController *)self _setupAlertControllerActions:v9];
    alertController = self->_alertController;
    CFStringRef v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v12 = [v11 localizedStringForKey:@"TOUCH_ID_REQUIRED" value:&stru_100088CF0 table:@"MobileUI"];
    [(TouchIdAlertController *)alertController setTitle:v12];

    v13 = self->_alertController;
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"DTO_IS_ACTIVE" value:&stru_100088CF0 table:@"MobileUI-Ratchet"];
    [(TouchIdAlertController *)v13 setMessage:v15];
  }
  v16 = [(TouchIdAlertController *)self->_alertController actions];
  v17 = [v16 objectAtIndexedSubscript:0];
  [(TouchIdAlertController *)self->_alertController setPreferredAction:v17];

  [(TouchIdAlertController *)self->_alertController shake];
  LODWORD(v16) = UIAccessibilityAnnouncementNotification;
  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  v19 = [v18 localizedStringForKey:@"TOUCH_ID_REQUIRED" value:&stru_100088CF0 table:@"MobileUI-Ratchet"];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v16, v19);
}

- (void)_handleBiometryRequiredEnterPasscode
{
  viewModel = self->_viewModel;
  v4 = [(TransitionViewController *)self options];
  id v5 = [v4 copy];
  id v6 = [(TouchIdViewModel *)viewModel fallbackActionFromOptions:v5];
  objc_super v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v9 localizedStringForKey:@"ENTER_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
  }
  v23[0] = &off_10008A2B8;
  v23[1] = &off_10008A2E8;
  v24[0] = v8;
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_100088CF0 table:@"MobileUI"];
  v24[1] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

  if (![(NSDictionary *)self->_actions isEqualToDictionary:v12])
  {
    [(TouchIdViewController *)self _setupAlertControllerActions:v12];
    alertController = self->_alertController;
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = [v14 localizedStringForKey:@"PASSCODE_TO_RETRY_TOUCH_ID" value:&stru_100088CF0 table:@"MobileUI"];
    [(TouchIdAlertController *)alertController setTitle:v15];

    v16 = self->_alertController;
    v17 = +[NSBundle bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"DTO_IS_ACTIVE" value:&stru_100088CF0 table:@"MobileUI-Ratchet"];
    [(TouchIdAlertController *)v16 setMessage:v18];
  }
  v19 = [(TouchIdAlertController *)self->_alertController actions];
  v20 = [v19 objectAtIndexedSubscript:0];
  [(TouchIdAlertController *)self->_alertController setPreferredAction:v20];

  [(TouchIdAlertController *)self->_alertController shake];
  LODWORD(v19) = UIAccessibilityAnnouncementNotification;
  uint64_t v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"PASSCODE_TO_RETRY_TOUCH_ID" value:&stru_100088CF0 table:@"MobileUI-Ratchet"];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v19, v22);
}

- (void)didReceiveAuthenticationData
{
  v11.receiver = self;
  v11.super_class = (Class)TouchIdViewController;
  [(TransitionViewController *)&v11 didReceiveAuthenticationData];
  v3 = [(TransitionViewController *)self authenticationTitle];
  id v4 = [v3 length];

  if (!v4)
  {
    id v5 = [(TransitionViewController *)self callerBundleId];
    if ((v5 || [(TransitionViewController *)self callerNameOverride])
      && ([(TransitionViewController *)self callerName],
          id v6 = objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"APP_ASKING_TOUCH" value:&stru_100088CF0 table:@"MobileUI"];
      id v9 = [(TransitionViewController *)self callerName];
      id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);
      [(TransitionViewController *)self setAuthenticationTitle:v10];
    }
    else
    {
      objc_super v7 = +[NSBundle bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"TOUCH_ID" value:&stru_100088CF0 table:@"MobileUI"];
      [(TransitionViewController *)self setAuthenticationTitle:v8];
    }
  }
}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_state == 5)
  {
    v8.receiver = self;
    v8.super_class = (Class)TouchIdViewController;
    [(TransitionViewController *)&v8 dismissChildWithCompletionHandler:v4];
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000FE78;
    v6[3] = &unk_100086320;
    v6[4] = self;
    id v7 = v4;
    [(TouchIdViewController *)self _dismissUIWithCompletionHandler:v6];
  }
}

- (void)mechanismEvent:(int64_t)a3 value:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  id v10 = LACLogTouchIDUI();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v11 = NSStringFromMechanismEventAndValue();
    *(_DWORD *)buf = 138543874;
    v33 = self;
    __int16 v34 = 1024;
    int v35 = a3;
    __int16 v36 = 2112;
    v37 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ has received mechanism event %d (%@)", buf, 0x1Cu);
  }
  int64_t state = self->_state;
  if (state != 5 && state != 0)
  {
    id v14 = v8;
    v15 = [v14 objectForKeyedSubscript:&off_10008A330];
    unsigned int v16 = [v15 BOOLValue];

    v17 = [v14 objectForKeyedSubscript:&off_10008A348];
    unsigned int v18 = [v17 BOOLValue];

    underlyingError = self->_underlyingError;
    self->_underlyingError = 0;

    if (a3 != 7)
    {
      if (a3 != 1)
      {
        int64_t v22 = 1;
        goto LABEL_22;
      }
      if (((+[LAUtils isLocationBasedPolicy:[(TransitionViewController *)self policy]] & v16 ^ 1 | v18) & 1) == 0)
      {
        v20 = [v14 objectForKeyedSubscript:&off_10008A360];
        uint64_t v21 = self->_underlyingError;
        self->_underlyingError = v20;

        int64_t v22 = 3;
LABEL_22:
        self->_int64_t state = v22;
LABEL_25:
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000101F4;
        block[3] = &unk_100085F40;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        if (v9) {
          v9[2](v9);
        }

        goto LABEL_28;
      }
LABEL_21:
      int64_t v22 = 2;
      goto LABEL_22;
    }
    unsigned int v23 = +[LAUtils isLocationBasedPolicy:[(TransitionViewController *)self policy]];
    id v24 = [(TransitionViewController *)self options];
    [v24 objectForKeyedSubscript:&off_10008A318];
    id v26 = v25 = v18;
    unsigned int v30 = [v26 BOOLValue];

    if ((v23 ^ 1 | v25))
    {
      if ((v23 & v25 & 1) == 0) {
        goto LABEL_21;
      }
      int64_t v27 = 4;
      if (v30) {
        int64_t v27 = 2;
      }
      self->_int64_t state = v27;
      if (v30) {
        goto LABEL_25;
      }
    }
    else
    {
      self->_int64_t state = 3;
    }
    id v28 = [v14 objectForKeyedSubscript:&off_10008A360];
    v29 = self->_underlyingError;
    self->_underlyingError = v28;

    goto LABEL_25;
  }
  if (v9) {
    v9[2](v9);
  }
LABEL_28:
}

- (ScreenDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end