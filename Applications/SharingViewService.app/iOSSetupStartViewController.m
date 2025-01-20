@interface iOSSetupStartViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)autoStart;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (void)handleDeviceSetupNotification:(id)a3;
- (void)handleDismissButton:(id)a3;
- (void)handleStartButton:(id)a3;
- (void)handleTapOutsideView:(id)a3;
- (void)setAutoStart:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation iOSSetupStartViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_progressLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressSpinner + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);

  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)setAutoStart:(BOOL)a3
{
  BYTE2(self->_startButton) = a3;
}

- (BOOL)autoStart
{
  return BYTE2(self->_startButton);
}

- (void)handleTapOutsideView:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController dismiss:1];
}

- (void)handleStartButton:(id)a3
{
  id v4 = a3;
  if (BYTE2(self->_startButton)) {
    goto LABEL_31;
  }
  uint64_t v5 = WiFiManagerClientCreate();
  if (v5)
  {
    v6 = (const void *)v5;
    int Power = WiFiManagerClientGetPower();
    CFRelease(v6);
  }
  else
  {
    int Power = 0;
  }
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
  {
    v8 = "on";
    if (!Power) {
      v8 = "off";
    }
    v14 = v8;
    LogPrintF();
  }
  if (Power)
  {
LABEL_31:
    if (!BYTE1(self->_startButton))
    {
      BYTE1(self->_startButton) = 1;
      if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v9 = [(SVSBaseViewController *)self containerView];
      [v9 setSwipeDismissible:0];

      if (v4 && MKBGetDeviceLockState() - 1 <= 1)
      {
        if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        v18 = _NSConcreteStackBlock;
        uint64_t v19 = 3221225472;
        v20 = sub_100104ABC;
        v21 = &unk_1001A0F08;
        v22 = self;
        id v23 = [UIApp beginBackgroundTaskWithExpirationHandler:&stru_1001A0EB8];
        SBSRequestPasscodeUnlockUI();
      }
      else
      {
        [*(id *)((char *)&self->_progressView + 1) setHidden:0];
        [*(id *)((char *)&self->_progressView + 1) startAnimating];
        [*(id *)((char *)&self->_imageView + 1) setHidden:0];
        [*(id *)((char *)&self->_progressLabel + 1) setHidden:1];
        if ([self->super.super._mainController testMode])
        {
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_100104C58;
          handler[3] = &unk_1001A1B88;
          dispatch_source_t v16 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
          v17 = self;
          v10 = v16;
          dispatch_source_set_event_handler(v10, handler);
          SFDispatchTimerSet();
          dispatch_resume(v10);
        }
        else
        {
          id v11 = objc_alloc_init((Class)SFDevice);
          v12 = [self->super.super._mainController userInfo];
          [v11 setOsVersion:CFDictionaryGetInt64Ranged()];

          v13 = [self->super.super._mainController deviceIdentifier];
          [v11 setIdentifier:v13];

          [self->super.super._mainController _sessionStart:v11];
        }
      }
    }
  }
  else
  {
    [self->super.super._mainController showWiFi];
  }
}

- (void)handleDeviceSetupNotification:(id)a3
{
  id v4 = a3;
  if (!BYTE1(self->_startButton))
  {
    id v15 = v4;
    uint64_t v5 = [v4 name];
    v6 = [v15 userInfo];
    if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize()))
    {
      CFStringRef v7 = &stru_1001A1DC0;
      if (v6) {
        CFStringRef v7 = v6;
      }
      v13 = v5;
      CFStringRef v14 = v7;
      LogPrintF();
    }
    v8 = [v15 name:v13, v14];
    unsigned int v9 = [v8 isEqual:@"com.apple.sharing.DeviceSetup"];

    if (v9 && !CFDictionaryGetInt64())
    {
      v10 = [self->super.super._mainController userInfo];
      CFStringGetTypeID();
      id v11 = CFDictionaryGetTypedValue();

      CFStringGetTypeID();
      v12 = CFDictionaryGetTypedValue();
      if ([v12 isEqual:v11])
      {
        if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [self->super.super._mainController dismiss:16];
      }
    }
    id v4 = v15;
  }
}

- (void)handleDismissButton:(id)a3
{
  id v4 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [self->super.super._mainController dismiss:5];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (BYTE1(self->_startButton)) {
    return 0;
  }
  id v6 = a3;
  CFStringRef v7 = [a4 view];
  v8 = [v6 view];

  BOOL v4 = v7 == v8;
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v6.receiver = self;
  v6.super_class = (Class)iOSSetupStartViewController;
  [(iOSSetupStartViewController *)&v6 viewDidDisappear:v3];
  uint64_t v5 = +[NSDistributedNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"com.apple.sharing.DeviceSetup" object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (dword_1001CC338 <= 30 && (dword_1001CC338 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v60.receiver = self;
  v60.super_class = (Class)iOSSetupStartViewController;
  [(SVSBaseViewController *)&v60 viewWillAppear:v3];
  uint64_t v5 = [self->super.super._mainController _remoteViewControllerProxy];
  [v5 setStatusBarHidden:1 withDuration:0.0];

  id v6 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTapOutsideView:"];
  [v6 setDelegate:self];
  [v6 setNumberOfTapsRequired:1];
  [v6 setCancelsTouchesInView:0];
  CFStringRef v7 = [(iOSSetupStartViewController *)self view];
  [v7 addGestureRecognizer:v6];

  unsigned int v8 = [self->super.super._mainController otherDeviceClassCode] - 1;
  if (v8 > 6) {
    CFStringRef v9 = @"_IPHONE";
  }
  else {
    CFStringRef v9 = off_1001A18E0[v8];
  }
  v10 = [@"IOS_SETUP_START_TITLE" stringByAppendingString:v9];
  id v11 = sub_100138280(@"Localizable", v10);
  [*(id *)((char *)&self->_dismissButton + 1) setText:v11];

  v12 = [*(id *)((char *)&self->_progressLabel + 1) titleLabel];
  [v12 setAdjustsFontSizeToFitWidth:1];

  unsigned __int8 v13 = [self->super.super._mainController otherDeviceClassCode];
  unsigned int v14 = [self->super.super._mainController otherDeviceModelCode] - 1;
  if (v14 < 3)
  {
    id v15 = off_1001A1918;
LABEL_12:
    CFStringRef v16 = v15[v14];
    goto LABEL_14;
  }
  LOBYTE(v14) = v13 - 2;
  if ((v13 - 2) < 4u)
  {
    id v15 = off_1001A1930;
    goto LABEL_12;
  }
  CFStringRef v16 = @"ProxiPhoneGeneric.png";
LABEL_14:
  v17 = +[UIImage imageNamed:v16];
  if (v17) {
    [*(id *)((char *)&self->_infoLabel + 1) setImage:v17];
  }
  unsigned int v18 = MKBGetDeviceLockState() - 1;
  uint64_t v19 = *(UILabel **)((char *)&self->_progressLabel + 1);
  v20 = +[NSBundle mainBundle];
  v21 = v20;
  if (v18 >= 2) {
    CFStringRef v22 = @"IOS_SETUP_CONTINUE";
  }
  else {
    CFStringRef v22 = @"IOS_SETUP_UNLOCK_TO_CONTINUE";
  }
  id v23 = [v20 localizedStringForKey:v22 value:&stru_1001A1DC0 table:@"Localizable"];
  [v19 setTitle:v23 forState:0];

  [*(id *)((char *)&self->_progressLabel + 1) setHidden:BYTE1(self->_startButton)];
  if (v18 < 2) {
    goto LABEL_24;
  }
  id v24 = objc_alloc_init((Class)ACAccountStore);
  v25 = [v24 aa_primaryAppleAccount];
  v26 = [v25 username];
  if (![v26 length])
  {

LABEL_24:
    unsigned int v28 = [self->super.super._mainController otherDeviceClassCode] - 1;
    if (v28 > 6) {
      CFStringRef v29 = @"_IPHONE";
    }
    else {
      CFStringRef v29 = off_1001A18E0[v28];
    }
    id v24 = [@"IOS_SETUP_START_INFO" stringByAppendingString:v29];
    v25 = sub_100138280(@"Localizable", v24);
    [*(id *)((char *)&self->_titleLabel + 1) setText:v25];
    goto LABEL_35;
  }
  if ([v26 rangeOfString:@"@"] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    SFLocalizePhoneNumber();
    id v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v27 = v26;
  }
  uint64_t v30 = (uint64_t)v27;
  unsigned int v31 = [self->super.super._mainController otherDeviceClassCode] - 1;
  v58 = v17;
  v57 = v26;
  if (v31 > 6) {
    CFStringRef v32 = @"_IPHONE";
  }
  else {
    CFStringRef v32 = off_1001A18E0[v31];
  }
  v33 = [@"IOS_SETUP_START_INFO_APPLE_ID" stringByAppendingString:v32];
  v34 = sub_100138280(@"Localizable", v33);

  v56 = (void *)v30;
  sub_100138494(@"QUOTED_STRING", v35, v36, v37, v38, v39, v40, v41, v30);
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  v42 = @"<BOLD_APPLE_ID>";
  id v43 = v34;
  id v44 = objc_alloc((Class)NSMutableAttributedString);
  NSAttributedStringKey v63 = NSFontAttributeName;
  v45 = +[UIFont systemFontOfSize:15.0];
  v64 = v45;
  v46 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  id v47 = [v44 initWithString:v43 attributes:v46];

  id v48 = [v43 rangeOfString:@"<BOLD_APPLE_ID>"];
  uint64_t v50 = v49;

  if (v48 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [v47 replaceCharactersInRange:v48 withString:v50];
    id v55 = [v59 length];
    NSAttributedStringKey v61 = NSFontAttributeName;
    v51 = +[UIFont systemFontOfSize:15.0 weight:UIFontWeightSemibold];
    v62 = v51;
    v52 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    [v47 setAttributes:v52 range:v48];
  }
  [*(id *)((char *)&self->_titleLabel + 1) setAttributedText:v47];

  [self->super.super._mainController setMyAppleID:v57];
  v17 = v58;
LABEL_35:

  if (!BYTE1(self->_startButton))
  {
    v53 = +[NSDistributedNotificationCenter defaultCenter];
    [v53 addObserver:self selector:"handleDeviceSetupNotification:" name:@"com.apple.sharing.DeviceSetup" object:0 suspensionBehavior:4];
  }
  v54 = [(SVSBaseViewController *)self containerView];
  [v54 setSwipeDismissible:1];

  if (BYTE2(self->_startButton))
  {
    [(iOSSetupStartViewController *)self handleStartButton:self];
    BYTE2(self->_startButton) = 0;
  }
}

@end