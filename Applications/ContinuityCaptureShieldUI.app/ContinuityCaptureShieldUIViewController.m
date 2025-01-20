@interface ContinuityCaptureShieldUIViewController
+ (BOOL)_isPad;
+ (BOOL)_refreshConnectionType;
+ (BOOL)_refreshUIState;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isOnLockScreen;
- (BOOL)_shouldShowHowToReconnectDialog;
- (ContinuityCaptureShieldUIViewController)initWithSceneSessionRole:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (void)_disconnectFaceTimeIfNecessary;
- (void)_disconnectSession;
- (void)_pullConversation:(id)a3 deviceHandle:(id)a4 completion:(id)a5;
- (void)_showDedicatedDisconnectDialog;
- (void)_showHowToReconnectDialog;
- (void)_tearDownShield;
- (void)_updateUI;
- (void)_updateUIForClientInformation;
- (void)_updateUIForConnectionType;
- (void)_updateUIForPlacementStep;
- (void)_updateUIForUIState;
- (void)contentViewDidSelectDisconnectButton:(id)a3;
- (void)contentViewDidSelectFaceTimeButton:(id)a3 completion:(id)a4;
- (void)contentViewDidSelectFavoritesButton:(id)a3;
- (void)contentViewDidSelectPauseButton:(id)a3;
- (void)contentViewDidSelectSkipButton:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)tearDownShield;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ContinuityCaptureShieldUIViewController

- (ContinuityCaptureShieldUIViewController)initWithSceneSessionRole:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ContinuityCaptureShieldUIViewController;
  v6 = [(ContinuityCaptureShieldUIViewController *)&v12 initWithNibName:0 bundle:0];
  if (v6)
  {
    v7 = sub_10000AB00();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[ContinuityCaptureShieldUIViewController initWithSceneSessionRole:]";
      __int16 v15 = 2048;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_sessionRole, a3);
    v8 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    [v8 addObserver:v6 forKeyPath:@"active" options:3 context:0];

    v9 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    [v9 addObserver:v6 forKeyPath:@"activeConfiguration" options:3 context:0];

    v10 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    [v10 addObserver:v6 forKeyPath:@"inFaceTime" options:3 context:0];

    atomic_store(1u, (unsigned __int8 *)&v6->_observingKVO);
  }

  return v6;
}

- (void)dealloc
{
  v3 = sub_10000AB00();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[ContinuityCaptureShieldUIViewController dealloc]";
    __int16 v11 = 2048;
    objc_super v12 = self;
    __int16 v13 = 2080;
    v14 = "-[ContinuityCaptureShieldUIViewController dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: <%p> %s", buf, 0x20u);
  }

  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_observingKVO);
  if (v4)
  {
    id v5 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    [v5 removeObserver:self forKeyPath:@"active" context:0];

    v6 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    [v6 removeObserver:self forKeyPath:@"activeConfiguration" context:0];

    v7 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    [v7 removeObserver:self forKeyPath:@"inFaceTime" context:0];

    atomic_store(0, (unsigned __int8 *)&self->_observingKVO);
  }
  v8.receiver = self;
  v8.super_class = (Class)ContinuityCaptureShieldUIViewController;
  [(ContinuityCaptureShieldUIViewController *)&v8 dealloc];
}

- (void)loadView
{
  v3 = objc_alloc_init(ContinuityCaptureShieldUIContentView);
  [(ContinuityCaptureShieldUIContentView *)v3 setDelegate:self];
  [(ContinuityCaptureShieldUIViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3 = sub_10000AB00();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[ContinuityCaptureShieldUIViewController viewDidLoad]";
    __int16 v12 = 2048;
    __int16 v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
  }

  v9.receiver = self;
  v9.super_class = (Class)ContinuityCaptureShieldUIViewController;
  [(ContinuityCaptureShieldUIViewController *)&v9 viewDidLoad];
  unsigned __int8 v4 = +[UIColor clearColor];
  id v5 = [(ContinuityCaptureShieldUIViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(ContinuityCaptureShieldUIViewController *)self view];
  [v6 setOverrideUserInterfaceStyle:2];

  v7 = [(ContinuityCaptureShieldUIViewController *)self view];
  [v7 _setOverrideUserInterfaceRenderingMode:2];

  objc_super v8 = [(ContinuityCaptureShieldUIViewController *)self view];
  [v8 _setOverrideVibrancyTrait:2];

  [(ContinuityCaptureShieldUIViewController *)self _updateUI];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000AB00();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v8 = "-[ContinuityCaptureShieldUIViewController viewWillAppear:]";
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureShieldUIViewController;
  [(ContinuityCaptureShieldUIViewController *)&v6 viewWillAppear:v3];
  [(ContinuityCaptureShieldUIViewController *)self _updateUI];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000AB00();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v8 = "-[ContinuityCaptureShieldUIViewController viewDidAppear:]";
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureShieldUIViewController;
  [(ContinuityCaptureShieldUIViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000AB00();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v8 = "-[ContinuityCaptureShieldUIViewController viewWillDisappear:]";
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureShieldUIViewController;
  [(ContinuityCaptureShieldUIViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10000AB00();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v8 = "-[ContinuityCaptureShieldUIViewController viewDidDisappear:]";
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: <%p> Called", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)ContinuityCaptureShieldUIViewController;
  [(ContinuityCaptureShieldUIViewController *)&v6 viewDidDisappear:v3];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"active"])
  {
    __int16 v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    if ([v13 BOOLValue])
    {
    }
    else
    {
      __int16 v15 = [v12 objectForKeyedSubscript:NSKeyValueChangeOldKey];
      unsigned int v16 = [v15 BOOLValue];

      if (v16) {
        [(ContinuityCaptureShieldUIViewController *)self tearDownShield];
      }
    }
  }
  else
  {
    if ([v10 isEqualToString:@"activeConfiguration"])
    {
      +[ContinuityCaptureShieldUIViewController _refreshUIState];
      +[ContinuityCaptureShieldUIViewController _refreshConnectionType];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100006868;
      v19[3] = &unk_10001C570;
      v19[4] = self;
      v14 = v19;
    }
    else
    {
      if (![v10 isEqualToString:@"inFaceTime"])
      {
        v17.receiver = self;
        v17.super_class = (Class)ContinuityCaptureShieldUIViewController;
        [(ContinuityCaptureShieldUIViewController *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
        goto LABEL_12;
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000692C;
      block[3] = &unk_10001C570;
      block[4] = self;
      v14 = block;
    }
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
LABEL_12:
}

- (BOOL)_isOnLockScreen
{
  return self->_sessionRole == (NSString *)_UIWindowSceneSessionTypeCoverSheet;
}

- (BOOL)_shouldShowHowToReconnectDialog
{
  v2 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  BOOL v3 = [v2 activeConfiguration];

  if (v3) {
    BOOL v4 = [v3 clientDeviceModel] == (id)1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_showHowToReconnectDialog
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  unsigned int v3 = +[ContinuityCaptureShieldUIViewController _isPad];
  BOOL v4 = +[NSBundle mainBundle];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"ALERT_DISCONNECTED_TITLE_IPAD";
  }
  else {
    CFStringRef v6 = @"ALERT_DISCONNECTED_TITLE_IPHONE";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_10001CA18 table:0];
  objc_super v8 = +[NSString stringWithFormat:v7];
  __int16 v9 = +[NSBundle mainBundle];
  id v10 = v9;
  if (v3) {
    CFStringRef v11 = @"ALERT_DISCONNECTED_MESSAGE_IPAD";
  }
  else {
    CFStringRef v11 = @"ALERT_DISCONNECTED_MESSAGE_IPHONE";
  }
  id v12 = [v9 localizedStringForKey:v11 value:&stru_10001CA18 table:0];
  __int16 v13 = +[UIAlertController alertControllerWithTitle:v8 message:v12 preferredStyle:1];

  v14 = +[NSBundle mainBundle];
  __int16 v15 = [v14 localizedStringForKey:@"ALERT_DISCONNECTED_BUTTON_TITLE_DISCONNECT" value:&stru_10001CA18 table:0];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100006DAC;
  v22[3] = &unk_10001C598;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  unsigned int v16 = +[UIAlertAction actionWithTitle:v15 style:2 handler:v22];
  [v13 addAction:v16];

  objc_super v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"ALERT_DISCONNECTED_BUTTON_TITLE_CANCEL" value:&stru_10001CA18 table:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100006E88;
  v20[3] = &unk_10001C598;
  objc_copyWeak(&v21, &location);
  v20[4] = self;
  v19 = +[UIAlertAction actionWithTitle:v18 style:1 handler:v20];
  [v13 addAction:v19];

  [(ContinuityCaptureShieldUIViewController *)self presentViewController:v13 animated:1 completion:0];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

- (void)_showDedicatedDisconnectDialog
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  unsigned int v3 = +[NSBundle mainBundle];
  BOOL v4 = [v3 localizedStringForKey:@"ALERT_DISCONNECTED_DEDICATED_TITLE" value:&stru_10001CA18 table:0];
  id v5 = +[NSString stringWithFormat:v4];
  CFStringRef v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"ALERT_DISCONNECTED_DEDICATED_MESSAGE" value:&stru_10001CA18 table:0];
  objc_super v8 = +[NSString stringWithFormat:v7];
  __int16 v9 = +[UIAlertController alertControllerWithTitle:v5 message:v8 preferredStyle:1];

  id v10 = +[NSBundle mainBundle];
  CFStringRef v11 = [v10 localizedStringForKey:@"ALERT_DISCONNECTED_BUTTON_TITLE_DISCONNECT" value:&stru_10001CA18 table:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100007284;
  v18[3] = &unk_10001C598;
  objc_copyWeak(&v19, &location);
  v18[4] = self;
  id v12 = +[UIAlertAction actionWithTitle:v11 style:2 handler:v18];
  [v9 addAction:v12];

  __int16 v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"ALERT_DISCONNECTED_BUTTON_TITLE_CANCEL" value:&stru_10001CA18 table:0];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007360;
  v16[3] = &unk_10001C598;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  __int16 v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:v16];
  [v9 addAction:v15];

  [(ContinuityCaptureShieldUIViewController *)self presentViewController:v9 animated:1 completion:0];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

- (void)_updateUIForConnectionType
{
  unsigned int v3 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v16 = [v3 activeConfiguration];

  BOOL v4 = v16;
  if (v16)
  {
    id v5 = [v16 clientDeviceModel];
    CFStringRef v6 = [(ContinuityCaptureShieldUIViewController *)self view];
    if ((unint64_t)v5 >= 2)
    {
      if (v5 == (id)2)
      {
        id v10 = +[CMContinuityCaptureUIStateTracker sharedInstance];
        id v11 = [v10 connectionType];

        if (!v11)
        {
          CFStringRef v9 = @"appletv.fill";
          goto LABEL_15;
        }
        if (v11 == (id)1)
        {
          CFStringRef v12 = @"appletv_mic";
        }
        else
        {
          if (v11 != (id)2) {
            goto LABEL_20;
          }
          CFStringRef v12 = @"appletv_camera";
        }
        __int16 v13 = +[UIImage imageNamed:v12];
LABEL_18:
        v14 = v13;
        if (v13)
        {
          __int16 v15 = [v13 imageWithRenderingMode:2];

          [v6 setImage:v15];
        }
      }
    }
    else
    {
      v7 = +[CMContinuityCaptureUIStateTracker sharedInstance];
      id v8 = [v7 connectionType];

      if (!v8)
      {
        CFStringRef v9 = @"video.slash.fill";
        goto LABEL_15;
      }
      if (v8 == (id)1)
      {
        CFStringRef v9 = @"mic.circle.fill";
        goto LABEL_15;
      }
      if (v8 == (id)2)
      {
        CFStringRef v9 = @"video.circle.fill";
LABEL_15:
        __int16 v13 = +[UIImage systemImageNamed:v9];
        goto LABEL_18;
      }
    }
LABEL_20:

    BOOL v4 = v16;
  }
}

- (void)_updateUIForClientInformation
{
  unsigned int v3 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v41 = [v3 activeConfiguration];

  BOOL v4 = v41;
  if (v41)
  {
    id v5 = [(ContinuityCaptureShieldUIViewController *)self view];
    CFStringRef v6 = [v41 clientName];
    unsigned int v7 = +[ContinuityCaptureShieldUIViewController _isPad];
    id v8 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    id v9 = [v8 uiState];

    id v10 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    unsigned int v11 = [v10 isInFaceTime];

    id v12 = [v41 clientDeviceModel];
    if ((unint64_t)v12 >= 2)
    {
      if (v12 != (id)2)
      {
        v20 = 0;
LABEL_52:

        BOOL v4 = v41;
        goto LABEL_53;
      }
      if (!v6 || v9)
      {
        if (!v6 || !v9)
        {
          v34 = +[NSBundle mainBundle];
          v35 = v34;
          if (v6 || v9) {
            CFStringRef v36 = @"LABEL_CONNECTED_TO_TV";
          }
          else {
            CFStringRef v36 = @"LABEL_CONNECTING_TO_TV";
          }
          v20 = [v34 localizedStringForKey:v36 value:&stru_10001CA18 table:0];

          v32 = +[NSBundle mainBundle];
          v25 = v32;
          if (v11)
          {
            CFStringRef v37 = @"SUBTITLE_DESCRIPTION_TV_FACETIME_IPHONE";
            CFStringRef v38 = @"SUBTITLE_DESCRIPTION_TV_FACETIME_IPAD";
          }
          else
          {
            CFStringRef v37 = @"SUBTITLE_DESCRIPTION_TV_IPHONE";
            CFStringRef v38 = @"SUBTITLE_DESCRIPTION_TV_IPAD";
          }
          if (v7) {
            CFStringRef v33 = v38;
          }
          else {
            CFStringRef v33 = v37;
          }
          goto LABEL_47;
        }
        id v16 = +[NSBundle mainBundle];
        id v17 = v16;
        CFStringRef v18 = @"LABEL_CONNECTED_TO_TV_WITH_NAME";
      }
      else
      {
        id v16 = +[NSBundle mainBundle];
        id v17 = v16;
        CFStringRef v18 = @"LABEL_CONNECTING_TO_TV_WITH_NAME";
      }
      id v23 = [v16 localizedStringForKey:v18 value:&stru_10001CA18 table:0];
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v6);

      v24 = +[NSBundle mainBundle];
      v25 = v24;
      if (v11)
      {
        CFStringRef v26 = @"SUBTITLE_DESCRIPTION_TV_FACETIME_WITH_NAME_IPHONE";
        CFStringRef v27 = @"SUBTITLE_DESCRIPTION_TV_FACETIME_WITH_NAME_IPAD";
      }
      else
      {
        CFStringRef v26 = @"SUBTITLE_DESCRIPTION_TV_WITH_NAME_IPHONE";
        CFStringRef v27 = @"SUBTITLE_DESCRIPTION_TV_WITH_NAME_IPAD";
      }
      if (v7) {
        CFStringRef v28 = v27;
      }
      else {
        CFStringRef v28 = v26;
      }
      v29 = [v24 localizedStringForKey:v28 value:&stru_10001CA18 table:0];
      v40 = v6;
      goto LABEL_48;
    }
    if (!v6 || v9)
    {
      if (!v6 || !v9)
      {
        id v21 = +[NSBundle mainBundle];
        v14 = v21;
        if (v6 || v9) {
          CFStringRef v22 = @"LABEL_CONNECTED_TO_MAC";
        }
        else {
          CFStringRef v22 = @"LABEL_CONNECTING_TO_MAC";
        }
        v20 = [v21 localizedStringForKey:v22 value:&stru_10001CA18 table:0];
        goto LABEL_30;
      }
      __int16 v13 = +[NSBundle mainBundle];
      v14 = v13;
      CFStringRef v15 = @"LABEL_CONNECTED_TO_MAC_WITH_NAME";
    }
    else
    {
      __int16 v13 = +[NSBundle mainBundle];
      v14 = v13;
      CFStringRef v15 = @"LABEL_CONNECTING_TO_MAC_WITH_NAME";
    }
    id v19 = [v13 localizedStringForKey:v15 value:&stru_10001CA18 table:0];
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v6);

LABEL_30:
    v30 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    id v31 = [v30 connectionType];

    if (v31 == (id)1)
    {
      v32 = +[NSBundle mainBundle];
      v25 = v32;
      CFStringRef v33 = @"LABEL_DISCONNECT_DESCRIPTION_MICROPHONE_MAC";
    }
    else if (v31 == (id)2)
    {
      v32 = +[NSBundle mainBundle];
      v25 = v32;
      CFStringRef v33 = @"LABEL_DISCONNECT_DESCRIPTION_CAMERA_MAC";
    }
    else
    {
      v32 = +[NSBundle mainBundle];
      v25 = v32;
      if (v7) {
        CFStringRef v33 = @"LABEL_DISCONNECT_IPAD_DESCRIPTION_NONE_MAC";
      }
      else {
        CFStringRef v33 = @"LABEL_DISCONNECT_DESCRIPTION_NONE_MAC";
      }
    }
LABEL_47:
    v29 = [v32 localizedStringForKey:v33 value:&stru_10001CA18 table:0];
LABEL_48:
    v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v40);

    if (v20) {
      [v5 setPrimaryText:v20];
    }
    if (v39)
    {
      [v5 setSecondaryText:v39];
    }
    goto LABEL_52;
  }
LABEL_53:
}

- (void)_updateUIForUIState
{
  id v9 = [(ContinuityCaptureShieldUIViewController *)self view];
  v2 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v3 = [v2 isInFaceTime];

  [v9 setInFaceTimeSession:v3];
  BOOL v4 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v5 = [v4 isDedicatedSession];

  [v9 setIsDedicatedSession:v5];
  [v9 setInPlacementStep:0];
  CFStringRef v6 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v7 = [v6 uiState];

  if (v7 == (id)4)
  {
    id v7 = 0;
LABEL_6:
    [v9 setPauseButtonState:v7];
    id v8 = v9;
    goto LABEL_7;
  }
  if (v7 == (id)2) {
    goto LABEL_6;
  }
  id v8 = v9;
  if (v7 == (id)1) {
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_updateUIForPlacementStep
{
  id v3 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  BOOL v4 = [v3 activeConfiguration];

  if (v4)
  {
    id v5 = [(ContinuityCaptureShieldUIViewController *)self view];
    id v6 = [v4 clientDeviceModel];
    id v7 = [v4 clientName];
    unsigned int v8 = +[ContinuityCaptureShieldUIViewController _isPad];
    id v9 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    id v10 = [v9 uiState];

    if (v10 == (id)5)
    {
      if (v6 == (id)2)
      {
        [v5 setInPlacementStep:1];
        unsigned int v11 = +[NSBundle mainBundle];
        id v12 = v11;
        if (v8) {
          CFStringRef v13 = @"LABEL_PLACE_DEVICE_TO_CONTINUE_IPAD";
        }
        else {
          CFStringRef v13 = @"LABEL_PLACE_DEVICE_TO_CONTINUE_IPHONE";
        }
        v14 = [v11 localizedStringForKey:v13 value:&stru_10001CA18 table:0];
        CFStringRef v15 = +[NSString stringWithFormat:v14];

        id v16 = +[NSBundle mainBundle];
        id v17 = v16;
        if (v7)
        {
          if (v8) {
            CFStringRef v18 = @"SUBTITLE_DESCRIPTION_PLACEMENT_WITH_NAME_IPAD";
          }
          else {
            CFStringRef v18 = @"SUBTITLE_DESCRIPTION_PLACEMENT_WITH_NAME_IPHONE";
          }
          id v19 = [v16 localizedStringForKey:v18 value:&stru_10001CA18 table:0];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v7);
        }
        else
        {
          if (v8) {
            CFStringRef v20 = @"SUBTITLE_DESCRIPTION_PLACEMENT_IPAD";
          }
          else {
            CFStringRef v20 = @"SUBTITLE_DESCRIPTION_PLACEMENT_IPHONE";
          }
          id v19 = [v16 localizedStringForKey:v20 value:&stru_10001CA18 table:0];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v23);
        id v21 = };

        [v5 setPrimaryText:v15];
        [v5 setSecondaryText:v21];
        CFStringRef v22 = +[UIImage systemImageNamed:@"tv.and.mediabox.fill"];
        [v5 setImage:v22];
      }
      else
      {
        CFStringRef v15 = sub_10000AB00();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10000FB88();
        }
      }
    }
  }
}

- (void)_updateUI
{
  id v3 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  BOOL v4 = [v3 activeConfiguration];

  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
    id v5 = sub_10000AB00();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[CMContinuityCaptureUIStateTracker sharedInstance];
      unsigned int v7 = [v6 uiState];
      unsigned int v8 = +[CMContinuityCaptureUIStateTracker sharedInstance];
      unsigned int v9 = [v8 connectionType];
      id v10 = [v4 clientName];
      int v14 = 136316674;
      CFStringRef v15 = "-[ContinuityCaptureShieldUIViewController _updateUI]";
      __int16 v16 = 2112;
      id v17 = self;
      __int16 v18 = 2080;
      id v19 = "-[ContinuityCaptureShieldUIViewController _updateUI]";
      __int16 v20 = 1024;
      unsigned int v21 = v7;
      __int16 v22 = 1024;
      unsigned int v23 = v9;
      __int16 v24 = 2112;
      v25 = v10;
      __int16 v26 = 1024;
      unsigned int v27 = [v4 compositeState];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:  %@ %s uiState %d connectionType %d clientName %@ compositeState %x", (uint8_t *)&v14, 0x3Cu);
    }
    if (!self->_terminated)
    {
      unsigned int v11 = +[CMContinuityCaptureUIStateTracker sharedInstance];
      id v12 = [v11 uiState];

      if (v12 == (id)5)
      {
        [(ContinuityCaptureShieldUIViewController *)self _updateUIForPlacementStep];
      }
      else
      {
        [(ContinuityCaptureShieldUIViewController *)self _updateUIForConnectionType];
        [(ContinuityCaptureShieldUIViewController *)self _updateUIForClientInformation];
        [(ContinuityCaptureShieldUIViewController *)self _updateUIForUIState];
      }
      CFStringRef v13 = +[ContinuityCaptureShieldUIBackgroundActivityManager sharedInstance];
      [v13 updateState:[v4 compositeState]];
    }
  }
}

- (void)_pullConversation:(id)a3 deviceHandle:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000082E4;
  v23[3] = &unk_10001C5E8;
  id v11 = v8;
  id v24 = v11;
  id v12 = v9;
  id v25 = v12;
  objc_copyWeak(&v27, &location);
  id v13 = v10;
  id v26 = v13;
  int v14 = objc_retainBlock(v23);
  if ([(ContinuityCaptureShieldUIViewController *)self _isOnLockScreen])
  {
    CFStringRef v15 = sub_10000AB00();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[ContinuityCaptureShieldUIViewController _pullConversation:deviceHandle:completion:]";
      __int16 v31 = 2112;
      v32 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: %@ pull conversation back to phone selected on lock screen. Removing shield from lock screen then pulling conversation", buf, 0x16u);
    }

    __int16 v16 = objc_opt_new();
    __int16 v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    __int16 v20 = sub_10000846C;
    unsigned int v21 = &unk_10001C610;
    __int16 v22 = v14;
    [v16 lockDeviceAnimated:0 withCompletion:&v18];
    [v16 invalidate:v18, v19, v20, v21];
  }
  else
  {
    id v17 = sub_10000AB00();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[ContinuityCaptureShieldUIViewController _pullConversation:deviceHandle:completion:]";
      __int16 v31 = 2112;
      v32 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: %@ pull conversation back to phone", buf, 0x16u);
    }

    ((void (*)(void *))v14[2])(v14);
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (void)contentViewDidSelectPauseButton:(id)a3
{
  id v6 = [(ContinuityCaptureShieldUIViewController *)self view];
  id v3 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v4 = [v3 uiState];

  if (v4 == (id)1)
  {
    [v6 setPauseButtonState:2];
    id v5 = +[CMContinuityCaptureXPCClientCCD sharedInstance];
    [v5 pauseSessionForEvent:0];
  }
  else
  {
    [v6 setPauseButtonState:1];
    id v5 = +[CMContinuityCaptureXPCClientCCD sharedInstance];
    [v5 resumeStreamingForEvent:0];
  }
}

- (void)contentViewDidSelectDisconnectButton:(id)a3
{
  self->_disconnectReason = 2;
  if ([(ContinuityCaptureShieldUIViewController *)self _shouldShowHowToReconnectDialog])
  {
    self->_pendingDisconnectDialogue = 1;
    [(ContinuityCaptureShieldUIViewController *)self _showHowToReconnectDialog];
  }
  else
  {
    id v4 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    unsigned int v5 = [v4 isDedicatedSession];

    if (v5)
    {
      self->_pendingDisconnectDialogue = 1;
      [(ContinuityCaptureShieldUIViewController *)self _showDedicatedDisconnectDialog];
    }
    else
    {
      [(ContinuityCaptureShieldUIViewController *)self _disconnectSession];
    }
  }
}

- (void)_disconnectFaceTimeIfNecessary
{
  id v3 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  unsigned int v4 = [v3 isInFaceTime];

  if (v4)
  {
    unsigned int v5 = +[TUCallCenter sharedInstance];
    id v6 = [v5 conversationManager];
    unsigned int v7 = [v6 activeConversations];
    id v8 = [v7 bs_firstObjectPassingTest:&stru_10001C650];

    id v9 = sub_10000AB00();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        id v11 = [v8 UUID];
        int v15 = 136315650;
        __int16 v16 = "-[ContinuityCaptureShieldUIViewController _disconnectFaceTimeIfNecessary]";
        __int16 v17 = 2112;
        __int16 v18 = self;
        __int16 v19 = 2112;
        __int16 v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@ - Disconnect pressed, leaving conversation: %@", (uint8_t *)&v15, 0x20u);
      }
      id v12 = +[TUCallCenter sharedInstance];
      id v13 = [v12 conversationManager];
      int v14 = [v8 UUID];
      [v13 leaveConversationWithUUID:v14];
    }
    else
    {
      if (v10)
      {
        int v15 = 136315394;
        __int16 v16 = "-[ContinuityCaptureShieldUIViewController _disconnectFaceTimeIfNecessary]";
        __int16 v17 = 2112;
        __int16 v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: %@ - Disconnect pressed, but not in active conversation. Disconnecting all calls", (uint8_t *)&v15, 0x16u);
      }

      id v12 = +[TUCallCenter sharedInstance];
      [v12 disconnectAllCalls];
    }
  }
}

- (void)_disconnectSession
{
  id v3 = sub_10000AB00();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v9 = "-[ContinuityCaptureShieldUIViewController _disconnectSession]";
    __int16 v10 = 2112;
    id v11 = self;
    __int16 v12 = 2080;
    id v13 = "-[ContinuityCaptureShieldUIViewController _disconnectSession]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:  %@ %s", buf, 0x20u);
  }

  [(ContinuityCaptureShieldUIViewController *)self _disconnectFaceTimeIfNecessary];
  self->_pendingDisconnectDialogue = 0;
  unsigned int v4 = +[CMContinuityCaptureXPCClientCCD sharedInstance];
  [v4 disconnectSession];

  objc_initWeak((id *)buf, self);
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000089D8;
  block[3] = &unk_10001C678;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)contentViewDidSelectFaceTimeButton:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = +[TUCallCenter sharedInstance];
  id v9 = [v8 conversationManager];
  __int16 v10 = [v9 activeConversations];
  id v11 = [v10 bs_firstObjectPassingTest:&stru_10001C698];

  __int16 v12 = +[TUCallCenter sharedInstance];
  id v13 = [v12 neighborhoodActivityConduit];
  int v14 = [v13 activeSplitSessionTV];

  if (v11 && v14)
  {
    objc_initWeak((id *)location, self);
    int v15 = +[CMContinuityCaptureXPCClientCCD sharedInstance];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100008D5C;
    v17[3] = &unk_10001C6C0;
    objc_copyWeak(&v21, (id *)location);
    id v18 = v11;
    id v19 = v14;
    __int16 v20 = v7;
    [v15 prepareForPullConversation:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    __int16 v16 = sub_10000AB00();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id location = 136315906;
      *(void *)&location[4] = "-[ContinuityCaptureShieldUIViewController contentViewDidSelectFaceTimeButton:completion:]";
      __int16 v23 = 2112;
      id v24 = self;
      __int16 v25 = 2112;
      id v26 = v14;
      __int16 v27 = 2112;
      CFStringRef v28 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: %@ facetime button tapped but deviceHandle=%@ and conversation=%@", location, 0x2Au);
    }

    v7[2](v7);
  }
}

- (void)contentViewDidSelectSkipButton:(id)a3
{
  unsigned int v4 = sub_10000AB00();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[ContinuityCaptureShieldUIViewController contentViewDidSelectSkipButton:]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:  %@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_time_t v5 = +[CMContinuityCaptureXPCClientCCD sharedInstance];
  [v5 skipPlacementStep];
}

- (void)contentViewDidSelectFavoritesButton:(id)a3
{
  unsigned int v4 = sub_10000AB00();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[ContinuityCaptureShieldUIViewController contentViewDidSelectFavoritesButton:]";
    __int16 v14 = 2112;
    int v15 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:  %@", buf, 0x16u);
  }

  v10[0] = FBSOpenApplicationOptionKeyUnlockDevice;
  v10[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v11[0] = &__kCFBooleanTrue;
  v11[1] = &__kCFBooleanTrue;
  dispatch_time_t v5 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  int v6 = +[LSApplicationWorkspace defaultWorkspace];
  id v7 = +[NSURL URLWithString:@"mobilephone-favorites://"];
  unsigned __int8 v8 = [v6 openSensitiveURL:v7 withOptions:v5];

  if ((v8 & 1) == 0)
  {
    id v9 = sub_10000AB00();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000FD4C();
    }
  }
}

+ (BOOL)_refreshUIState
{
  id v3 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  unsigned int v4 = [v3 activeConfiguration];

  if (!v4)
  {
    BOOL v13 = 0;
    goto LABEL_18;
  }
  id v5 = [v4 compositeState];
  int v6 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v7 = [v6 uiState];

  unsigned __int8 v8 = [v4 placementStepSkipped];
  id v9 = v8;
  if (v8 && ([v8 BOOLValue] & 1) == 0)
  {
    __int16 v10 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    id v11 = v10;
    uint64_t v12 = 5;
    goto LABEL_15;
  }
  if (v5)
  {
    __int16 v10 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    id v11 = v10;
    uint64_t v12 = 2;
    goto LABEL_15;
  }
  if ((v5 & 8) != 0)
  {
    __int16 v10 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    id v11 = v10;
    uint64_t v12 = 0;
    goto LABEL_15;
  }
  if ((v5 & 0x10) != 0)
  {
    __int16 v10 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    id v11 = v10;
    goto LABEL_14;
  }
  __int16 v10 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v11 = v10;
  if (!v5)
  {
LABEL_14:
    uint64_t v12 = 4;
    goto LABEL_15;
  }
  uint64_t v12 = 1;
LABEL_15:
  [v10 setUiState:v12];

  __int16 v14 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  id v15 = [v14 uiState];
  BOOL v13 = v7 != v15;

  __int16 v16 = sub_10000AB00();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v17 = v7 != v15;
    id v18 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    int v20 = 136316162;
    id v21 = "+[ContinuityCaptureShieldUIViewController _refreshUIState]";
    __int16 v22 = 2112;
    id v23 = a1;
    __int16 v24 = 1024;
    int v25 = (int)v7;
    __int16 v26 = 1024;
    unsigned int v27 = [v18 uiState];
    __int16 v28 = 1024;
    BOOL v29 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: %@ updated uiState (%d -> %d) refresh %d", (uint8_t *)&v20, 0x28u);
  }
LABEL_18:

  return v13;
}

+ (BOOL)_refreshConnectionType
{
  id v3 = +[CMContinuityCaptureUIStateTracker sharedInstance];
  unsigned int v4 = [v3 activeConfiguration];

  if (v4)
  {
    unsigned __int8 v5 = [v4 compositeState];
    int v6 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    id v7 = [v6 connectionType];

    if ((v5 & 6) == 2)
    {
      unsigned __int8 v8 = +[CMContinuityCaptureUIStateTracker sharedInstance];
      id v9 = v8;
      uint64_t v10 = 1;
    }
    else
    {
      unsigned __int8 v8 = +[CMContinuityCaptureUIStateTracker sharedInstance];
      id v9 = v8;
      if ((v5 & 4) != 0) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 0;
      }
    }
    [v8 setConnectionType:v10];

    uint64_t v12 = +[CMContinuityCaptureUIStateTracker sharedInstance];
    id v13 = [v12 connectionType];
    BOOL v11 = v7 != v13;

    __int16 v14 = sub_10000AB00();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v15 = v7 != v13;
      __int16 v16 = +[CMContinuityCaptureUIStateTracker sharedInstance];
      int v18 = 136316162;
      id v19 = "+[ContinuityCaptureShieldUIViewController _refreshConnectionType]";
      __int16 v20 = 2112;
      id v21 = a1;
      __int16 v22 = 1024;
      int v23 = (int)v7;
      __int16 v24 = 1024;
      unsigned int v25 = [v16 connectionType];
      __int16 v26 = 1024;
      BOOL v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: %@ updated connectionType (%d -> %d) refresh %d", (uint8_t *)&v18, 0x28u);
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)_isPad
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

- (void)tearDownShield
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100009570;
  v2[3] = &unk_10001C678;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_tearDownShield
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_terminated)
  {
    id v3 = sub_10000AB00();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v24 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]";
      __int16 v25 = 2112;
      __int16 v26 = self;
      unsigned int v4 = "%s: %@ termination in progress";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 0x16u);
    }
  }
  else
  {
    BOOL pendingDisconnectDialogue = self->_pendingDisconnectDialogue;
    id v3 = sub_10000AB00();
    BOOL v6 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (pendingDisconnectDialogue)
    {
      if (v6)
      {
        *(_DWORD *)buf = 136315394;
        __int16 v24 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]";
        __int16 v25 = 2112;
        __int16 v26 = self;
        unsigned int v4 = "%s: %@ skip shield teardown since we have pending user dialogue for disconnect";
        goto LABEL_7;
      }
    }
    else
    {
      if (v6)
      {
        *(_DWORD *)buf = 136315394;
        __int16 v24 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]";
        __int16 v25 = 2112;
        __int16 v26 = self;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %@ Tearing down shieldUI", buf, 0x16u);
      }

      self->_terminated = 1;
      unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_observingKVO);
      if (v7)
      {
        unsigned __int8 v8 = +[CMContinuityCaptureUIStateTracker sharedInstance];
        [v8 removeObserver:self forKeyPath:@"active" context:0];

        id v9 = +[CMContinuityCaptureUIStateTracker sharedInstance];
        [v9 removeObserver:self forKeyPath:@"activeConfiguration" context:0];

        uint64_t v10 = +[CMContinuityCaptureUIStateTracker sharedInstance];
        [v10 removeObserver:self forKeyPath:@"inFaceTime" context:0];

        atomic_store(0, (unsigned __int8 *)&self->_observingKVO);
      }
      BOOL v11 = +[ContinuityCaptureShieldUIBackgroundActivityManager sharedInstance];
      [v11 updateState:16];

      uint64_t v12 = [(ContinuityCaptureShieldUIViewController *)self view];
      id v13 = [v12 window];
      __int16 v14 = [v13 windowScene];
      id v3 = [v14 _FBSScene];

      id v15 = [objc_alloc((Class)UIDestroySceneAction) initWithPersistedIdentifiers:0 preferredAnimationType:1 forDestroyingSession:1 userOriginatedRequest:0 callbackQueue:&_dispatch_main_q completion:&stru_10001C700];
      if ([(ContinuityCaptureShieldUIViewController *)self _isOnLockScreen])
      {
        if (self->_disconnectReason != 1)
        {
          __int16 v16 = objc_opt_new();
          [v16 lockDeviceAnimated:1 withCompletion:0];
          [v16 invalidate];
        }
        dispatch_time_t v17 = dispatch_time(0, 2000000000);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100009AE8;
        v20[3] = &unk_10001C728;
        id v21 = v3;
        id v22 = v15;
        dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, v20);

        int v18 = v21;
      }
      else
      {
        id v19 = sub_10000AB00();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v24 = "-[ContinuityCaptureShieldUIViewController _tearDownShield]";
          __int16 v25 = 2112;
          __int16 v26 = (ContinuityCaptureShieldUIViewController *)v3;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: destroy scene: %@ in unlock mode", buf, 0x16u);
        }

        int v18 = +[NSSet setWithObject:v15];
        [v3 sendActions:v18];
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end