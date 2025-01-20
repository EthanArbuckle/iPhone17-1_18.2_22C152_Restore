@interface CBApplication
+ (BOOL)registerAsSystemApp;
+ (BOOL)runStatusBarServer;
+ (id)_newApplicationInitializationContext;
+ (void)disableS2R;
+ (void)initializeAppSupportService;
- (BOOL)__handleHIDEvent:(__IOHIDEvent *)a3;
- (BOOL)_hasHomeButton;
- (BOOL)_isLockButtonTimerValid;
- (BOOL)_isSpringBoard;
- (BOOL)allowWiFiSettingsAction;
- (BOOL)disablesFrontBoardImplicitWindowScenes;
- (BOOL)homeButtonPressedWithDisplayDim;
- (BOOL)lockButtonLongPressed;
- (BOOL)lockButtonPressedWithDisplayDim;
- (BSInvalidatable)dispatchingAssertion;
- (CBApplication)init;
- (NSTimer)lockButtonTimer;
- (UINotificationFeedbackGenerator)notificationFeedbackGenerator;
- (void)_cancelLockButtonTimer;
- (void)_createInitialAppScene;
- (void)_diagsLaunchedAction;
- (void)_disableUSBRestrictedMode;
- (void)_handleHIDEvent:(__IOHIDEvent *)a3;
- (void)_handleThermalWarningScreenPresentation;
- (void)_hideWiFiSettingsAction;
- (void)_homeButtonDown;
- (void)_homeButtonUp;
- (void)_initRoutingRules;
- (void)_lockButtonDown;
- (void)_lockButtonLongPress;
- (void)_lockButtonUp;
- (void)_registerForNotifications;
- (void)_ringerSwitchDown;
- (void)_ringerSwitchUp;
- (void)_showPowerDownView;
- (void)_showWiFiSettingsAction;
- (void)_startLockButtonTimer;
- (void)batteryStatusDidChange:(id)a3;
- (void)handlePressEvent:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAllowWiFiSettingsAction:(BOOL)a3;
- (void)setDispatchingAssertion:(id)a3;
- (void)setHomeButtonPressedWithDisplayDim:(BOOL)a3;
- (void)setLockButtonLongPressed:(BOOL)a3;
- (void)setLockButtonPressedWithDisplayDim:(BOOL)a3;
- (void)setLockButtonTimer:(id)a3;
- (void)setNotificationFeedbackGenerator:(id)a3;
@end

@implementation CBApplication

- (CBApplication)init
{
  v13.receiver = self;
  v13.super_class = (Class)CBApplication;
  v2 = [(CBApplication *)&v13 init];
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Principal class created", v12, 2u);
    }

    v2->_allowWiFiSettingsAction = 0;
    id v4 = objc_alloc((Class)UINotificationFeedbackGenerator);
    v5 = +[_UINotificationFeedbackGeneratorConfiguration privateConfiguration];
    v6 = (UINotificationFeedbackGenerator *)[v4 initWithConfiguration:v5];
    notificationFeedbackGenerator = v2->_notificationFeedbackGenerator;
    v2->_notificationFeedbackGenerator = v6;

    [(CBApplication *)v2 _initRoutingRules];
    [(CBApplication *)v2 _registerForNotifications];
    id v8 = +[CBLocationController sharedLocationController];
    v9 = +[CBUserSettings sharedInstance];
    [v9 applyPreUISettingsFromNvram];

    [(CBApplication *)v2 _disableUSBRestrictedMode];
    v10 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CheckerBoard init complete", v12, 2u);
    }
  }
  return v2;
}

- (void)_initRoutingRules
{
  v2 = +[BKSHIDEventDisplay builtinDisplay];
  v3 = +[BKSHIDEventDisplay nullDisplay];
  id v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v3, 0);

  v23 = +[BKSMutableHIDEventDiscreteDispatchingPredicate defaultSystemPredicate];
  [v23 setDisplays:v4];
  v5 = +[BKSHIDEventDispatchingTarget systemTarget];
  v6 = +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:v23 toTarget:v5];

  v7 = +[BKSMutableHIDEventDiscreteDispatchingPredicate defaultFocusPredicate];
  [v7 setDisplays:v4];
  id v8 = +[BKSHIDEventDispatchingTarget keyboardFocusTarget];
  v22 = +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:v7 toTarget:v8];

  v9 = +[BKSHIDEventDescriptor descriptorWithEventType:42];
  v10 = +[BKSHIDEventVendorDefinedDescriptor descriptorWithPage:65280 usage:102];
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, v10, 0);

  id v12 = objc_alloc_init((Class)BKSMutableHIDEventDiscreteDispatchingPredicate);
  [v12 setSenderDescriptors:0];
  [v12 setDescriptors:v11];
  objc_super v13 = +[BKSHIDEventDispatchingTarget systemTarget];
  v14 = +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:v12 toTarget:v13];

  v15 = +[BKSHIDEventDeferringEnvironment ui_cameraCaptureButtonEnvironment];
  v16 = +[BKSHIDEventDispatchingTarget targetForDeferringEnvironment:v15];

  v17 = +[BKSHIDEventDiscreteDispatchingRule ruleForDispatchingDiscreteEventsMatchingPredicate:v12 toTarget:v16];
  v18 = +[BKSHIDEventDeliveryManager sharedInstance];
  v25[0] = v6;
  v25[1] = v22;
  v25[2] = v14;
  v25[3] = v17;
  v19 = +[NSArray arrayWithObjects:v25 count:4];
  v20 = [v18 dispatchDiscreteEventsForReason:@"SB-Default" withRules:v19];
  dispatchingAssertion = self->_dispatchingAssertion;
  self->_dispatchingAssertion = v20;
}

- (void)_disableUSBRestrictedMode
{
  int v4 = 3;
  char v5 = 0;
  if (!ACMKernelControl())
  {
    v2 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Disable USB restricted mode.", v3, 2u);
    }
  }
}

+ (void)initializeAppSupportService
{
  if (qword_10008FEF0 != -1) {
    dispatch_once(&qword_10008FEF0, &stru_10007A368);
  }
}

+ (void)disableS2R
{
  v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting SleepDisabled to disable S2R", v4, 2u);
  }

  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IOPower:/IOPowerConnection/IOPMrootDomain");
  IORegistryEntrySetCFProperty(v3, @"SleepDisabled", kCFBooleanTrue);
}

- (void)_registerForNotifications
{
  io_registry_entry_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for thermal notifications…", v8, 2u);
  }

  int v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleThermalWarningScreenPresentation" name:@"CBThermalBlockedDidChangeNotification" object:0];

  char v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_showWiFiSettingsAction" name:@"CBNetworkViewControllerDidAdvanceToNextSceneNotification" object:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_diagsLaunchedAction" name:@"CBEndGameViewControllerLaunchingDiagnosticsNotification" object:0];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_hideWiFiSettingsAction" name:@"AppManagerPrimaryAppDidExit" object:0];
}

- (void)_showWiFiSettingsAction
{
  io_registry_entry_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Allowing [Wi-Fi Settings] action…", v4, 2u);
  }

  [(CBApplication *)self setAllowWiFiSettingsAction:1];
}

- (void)_hideWiFiSettingsAction
{
  io_registry_entry_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Forbidding [Wi-Fi Settings] action…", v4, 2u);
  }

  [(CBApplication *)self setAllowWiFiSettingsAction:0];
}

- (void)_diagsLaunchedAction
{
  [(CBApplication *)self _showWiFiSettingsAction];
  id v2 = +[CBBootIntentManager sharedInstance];
  [v2 deleteBootIntentSourceData];
}

- (void)_handleHIDEvent:(__IOHIDEvent *)a3
{
  char v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handle HID Event: %@", buf, 0xCu);
  }

  if (![(CBApplication *)self __handleHIDEvent:a3])
  {
    v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Letting UIKit handle the HID event", buf, 2u);
    }

    v7.receiver = self;
    v7.super_class = (Class)CBApplication;
    [(CBApplication *)&v7 _handleHIDEvent:a3];
  }
}

- (void)handlePressEvent:(id)a3
{
  id v4 = a3;
  char v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handle Physical Button Event: %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [v4 _hidEvent];
  objc_super v7 = CheckerBoardLogHandleForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v8)
    {
      LOWORD(v10) = 0;
      v9 = "Physical HID button event does not exist";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v8)
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Physical HID button event exists", (uint8_t *)&v10, 2u);
  }

  if (![(CBApplication *)self __handleHIDEvent:v6])
  {
    objc_super v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      v9 = "Physical HID button was not handled";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
}

- (BOOL)__handleHIDEvent:(__IOHIDEvent *)a3
{
  char v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    *(void *)v18 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling HID Event: %@", (uint8_t *)&v17, 0xCu);
  }

  if (!a3)
  {
    objc_super v13 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "HID Event does not exist", (uint8_t *)&v17, 2u);
    }

    goto LABEL_15;
  }
  if (IOHIDEventGetType() != 3)
  {
LABEL_15:
    v14 = CheckerBoardLogHandleForCategory();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      return 0;
    }
    LOWORD(v17) = 0;
    v15 = "HID Event is not of type Keyboard";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v17, 2u);
    goto LABEL_18;
  }
  int IntegerValue = IOHIDEventGetIntegerValue();
  int v7 = IOHIDEventGetIntegerValue();
  uint64_t v8 = IOHIDEventGetIntegerValue();
  uint64_t v9 = IOHIDEventGetIntegerValue();
  unsigned int Phase = IOHIDEventGetPhase();
  id v11 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67110144;
    *(_DWORD *)v18 = IntegerValue;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = v7;
    __int16 v19 = 1024;
    BOOL v20 = v8 != 0;
    __int16 v21 = 1024;
    BOOL v22 = v9 != 0;
    __int16 v23 = 1024;
    int v24 = (Phase >> 2) & 1;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Keyboard HID Event Info] usagePage: 0x%x, usage: 0x%x, downEvent: %d, longPress: %d, terminalEvent: %d", (uint8_t *)&v17, 0x20u);
  }

  int v12 = v7 | (IntegerValue << 16);
  if (v12 == 720942)
  {
    if (v8) {
      [(CBApplication *)self _ringerSwitchDown];
    }
    else {
      [(CBApplication *)self _ringerSwitchUp];
    }
    return 1;
  }
  if (v12 == 786480)
  {
    if (v8) {
      [(CBApplication *)self _lockButtonDown];
    }
    else {
      [(CBApplication *)self _lockButtonUp];
    }
    return 1;
  }
  if (v12 != 786496)
  {
    v14 = CheckerBoardLogHandleForCategory();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    LOWORD(v17) = 0;
    v15 = "HID Event was not handle by us";
    goto LABEL_17;
  }
  if (v8) {
    [(CBApplication *)self _homeButtonDown];
  }
  else {
    [(CBApplication *)self _homeButtonUp];
  }
  return 1;
}

- (void)_homeButtonDown
{
  io_registry_entry_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Home button down", buf, 2u);
  }

  id v4 = +[CBIdleSleepManager sharedInstance];
  if ([v4 isDisplayDim])
  {
    char v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Display is off. Turning display on and resetting idle timer…", v6, 2u);
    }

    [(CBApplication *)self setHomeButtonPressedWithDisplayDim:1];
    [v4 resetIdleTimerAndUndim:1];
  }
  else
  {
    [(CBApplication *)self setHomeButtonPressedWithDisplayDim:0];
  }
}

- (void)_homeButtonUp
{
  io_registry_entry_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Home button up", buf, 2u);
  }

  if ([(CBApplication *)self homeButtonPressedWithDisplayDim])
  {
    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = [(CBApplication *)self homeButtonPressedWithDisplayDim];
      *(_DWORD *)buf = 67109120;
      unsigned int v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Preventing Home button action sheet from being presented since the screen is on (%d)", buf, 8u);
    }
  }
  else
  {
    uint64_t v6 = [(CBApplication *)self allowWiFiSettingsAction];
    if ([(CBApplication *)self _hasHomeButton]) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = v6 | 2;
    }
    uint64_t v8 = +[CBUserSettings sharedInstance];
    unsigned int v9 = [v8 shouldShowInfoPane];

    if (v9) {
      uint64_t v10 = v7 | 4;
    }
    else {
      uint64_t v10 = v7;
    }
    id v11 = +[CBAlertManager sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000313C8;
    v12[3] = &unk_10007A3D0;
    v12[4] = self;
    [v11 showMenuSheetWithOptions:v10 completion:0 response:v12];
  }
}

- (void)_ringerSwitchDown
{
  id v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)io_registry_entry_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Ringer Switch toggled Tone", v3, 2u);
  }
}

- (void)_ringerSwitchUp
{
  io_registry_entry_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ringer Switch toggled Silent", buf, 2u);
  }

  id v4 = +[UIDevice currentDevice];
  unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    uint64_t v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "🎉 Let there be vibration! 🎉", v8, 2u);
    }

    uint64_t v7 = [(CBApplication *)self notificationFeedbackGenerator];
    [v7 _privateNotificationOccurred:1004];
  }
}

- (void)_lockButtonDown
{
  io_registry_entry_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sleep/Wake Button down", buf, 2u);
  }

  id v4 = +[CBIdleSleepManager sharedInstance];
  if ([v4 isDisplayDim])
  {
    [(CBApplication *)self setLockButtonPressedWithDisplayDim:1];
    unint64_t v5 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Display is off. Turning display on and resetting idle timer…", v12, 2u);
    }

    [v4 resetIdleTimerAndUndim:1];
  }
  else
  {
    [(CBApplication *)self setLockButtonPressedWithDisplayDim:0];
  }
  uint64_t v6 = +[CBAlertManager sharedInstance];
  unsigned __int8 v7 = [v6 powerDownVisible];

  uint64_t v8 = CheckerBoardLogHandleForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not starting a timer since Power Down UI is visible", v10, 2u);
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Display should be on now with no visible Power Down UI. Starting lock button long press timer…", v11, 2u);
    }

    [(CBApplication *)self _startLockButtonTimer];
  }
}

- (void)_startLockButtonTimer
{
  [(CBApplication *)self setLockButtonLongPressed:0];
  unsigned int v3 = [(CBApplication *)self _hasHomeButton];
  double v4 = 0.4;
  if (v3) {
    double v4 = 3.0;
  }
  id v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_lockButtonLongPress" selector:0 userInfo:0 repeats:v4];
  [(CBApplication *)self setLockButtonTimer:v5];
}

- (void)_lockButtonLongPress
{
  [(CBApplication *)self setLockButtonLongPressed:1];
  if ([(CBApplication *)self _hasHomeButton])
  {
    unsigned int v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sleep/Wake Button long press - Presenting Power Down UI…", v4, 2u);
    }

    [(CBApplication *)self _showPowerDownView];
  }
  else
  {
    [(CBApplication *)self _homeButtonUp];
  }
}

- (void)_showPowerDownView
{
  id v2 = +[CBAlertManager sharedInstance];
  [v2 showPowerDownWithCompletion:0 response:&stru_10007A3F0];
}

- (BOOL)_isLockButtonTimerValid
{
  id v2 = [(CBApplication *)self lockButtonTimer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_cancelLockButtonTimer
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling lock button timer…", v4, 2u);
  }

  [(CBApplication *)self setLockButtonTimer:0];
}

- (void)setLockButtonTimer:(id)a3
{
  id v5 = (NSTimer *)a3;
  p_lockButtonTimer = &self->_lockButtonTimer;
  if (*p_lockButtonTimer != v5)
  {
    unsigned __int8 v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting lock button timer…", v8, 2u);
    }

    [(NSTimer *)*p_lockButtonTimer invalidate];
    objc_storeStrong((id *)p_lockButtonTimer, a3);
  }
}

- (void)_lockButtonUp
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sleep/Wake Button up", (uint8_t *)v13, 2u);
  }

  unsigned int v4 = [(CBApplication *)self _isLockButtonTimerValid];
  [(CBApplication *)self _cancelLockButtonTimer];
  if (!v4 || [(CBApplication *)self lockButtonPressedWithDisplayDim]) {
    goto LABEL_8;
  }
  id v5 = +[CBAlertManager sharedInstance];
  if ([v5 powerDownVisible])
  {

    goto LABEL_8;
  }
  unsigned __int8 v6 = [(CBApplication *)self lockButtonLongPressed];

  if (v6)
  {
LABEL_8:
    unsigned __int8 v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(CBApplication *)self lockButtonPressedWithDisplayDim];
      BOOL v9 = +[CBAlertManager sharedInstance];
      unsigned int v10 = [v9 powerDownVisible];
      unsigned int v11 = [(CBApplication *)self lockButtonLongPressed];
      v13[0] = 67109632;
      v13[1] = v8;
      __int16 v14 = 1024;
      unsigned int v15 = v10;
      __int16 v16 = 1024;
      unsigned int v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not turning the display off since the screen is on (%d), Power Down UI is visible (%d), and lock button was long pressed (%d)", (uint8_t *)v13, 0x14u);
    }
    goto LABEL_10;
  }
  int v12 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Display is on. Turning display off…", (uint8_t *)v13, 2u);
  }

  unsigned __int8 v7 = +[CBIdleSleepManager sharedInstance];
  [v7 dimDisplay];
LABEL_10:
}

- (void)_handleThermalWarningScreenPresentation
{
  id v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Handling thermal warning screen…", v5, 2u);
  }

  BOOL v3 = +[CBThermalManager sharedInstance];
  if ([v3 isThermalBlocked])
  {
    unsigned int v4 = +[CBAlertManager sharedInstance];
    [v4 showThermalWarningWithCompletion:0];
LABEL_7:

    goto LABEL_8;
  }
  if (([v3 isThermalBlocked] & 1) == 0)
  {
    unsigned int v4 = +[CBAlertManager sharedInstance];
    [v4 dismissThermalWarningWithCompletion:0];
    goto LABEL_7;
  }
LABEL_8:
}

- (BOOL)_hasHomeButton
{
  id v2 = +[BSPlatform sharedInstance];
  BOOL v3 = [v2 homeButtonType] != (id)2;

  return v3;
}

- (BOOL)_isSpringBoard
{
  return 1;
}

+ (BOOL)registerAsSystemApp
{
  return 0;
}

+ (BOOL)runStatusBarServer
{
  return 1;
}

- (BOOL)disablesFrontBoardImplicitWindowScenes
{
  return 1;
}

+ (id)_newApplicationInitializationContext
{
  id v2 = [objc_alloc((Class)UISMutableDeviceContext) initWithDeviceInfoValues:&__NSDictionary0__struct];
  BOOL v3 = +[BSPlatform sharedInstance];
  unsigned int v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 deviceClass]);
  [v2 setDeviceInfoValue:v4 forKey:UISDeviceContextDeviceClassKey];

  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 homeButtonType]);
  [v2 setDeviceInfoValue:v5 forKey:UISDeviceContextHomeButtonTypeKey];

  MGGetFloat32Answer();
  unsigned __int8 v6 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v2 setDeviceInfoValue:v6 forKey:UISDeviceContextDeviceCornerRadiusKey];

  id v7 = objc_alloc((Class)UISMutableDisplayContext);
  unsigned int v8 = +[FBDisplayManager sharedInstance];
  BOOL v9 = [v8 mainConfiguration];
  id v10 = [v7 initWithDisplayConfiguration:v9];

  unint64_t v11 = sub_100038930();
  int v12 = +[FBDisplayManager sharedInstance];
  objc_super v13 = [v12 mainConfiguration];
  [v10 setDisplayConfiguration:v13];

  __int16 v14 = sub_100039634(v11);
  [v10 setDisplayEdgeInfo:v14];

  unsigned int v15 = sub_1000399D0(v11);
  [v10 setExclusionArea:v15];

  [v10 setArtworkSubtype:sub_100038A34()];
  __int16 v16 = +[UIUserInterfaceStyleArbiter sharedInstance];
  unsigned int v17 = v16;
  if (v16) {
    [v10 setUserInterfaceStyle:[v16 currentStyle]];
  }
  id v18 = [objc_alloc((Class)UISMutableApplicationInitializationContext) initWithDisplayContext:v10 deviceContext:v2 persistedSceneIdentifiers:0 supportAppSceneRequests:1];
  __int16 v19 = +[NSBundle mainBundle];
  BOOL v20 = [v19 bundleIdentifier];
  __int16 v21 = +[FBSSceneIdentity identityForIdentifier:v20];

  BOOL v22 = +[FBSceneManager sharedInstance];
  id v23 = [v22 newSceneIdentityTokenForIdentity:v21];

  [v18 setDefaultSceneToken:v23];
  return v18;
}

- (void)_createInitialAppScene
{
  id v2 = +[FBSMutableSceneDefinition definition];
  BOOL v3 = +[NSBundle mainBundle];
  unsigned int v4 = [v3 bundleIdentifier];
  id v5 = +[FBSSceneIdentity identityForIdentifier:v4];
  [v2 setIdentity:v5];

  unsigned __int8 v6 = +[FBSSceneClientIdentity localIdentity];
  [v2 setClientIdentity:v6];

  id v7 = +[UIApplicationSceneSpecification specification];
  [v2 setSpecification:v7];

  unsigned int v8 = [v2 specification];
  BOOL v9 = +[FBSMutableSceneParameters parametersForSpecification:v8];

  [v9 updateSettingsWithBlock:&stru_10007A430];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_100032410;
  v13[3] = &unk_10007A2E8;
  id v14 = v9;
  id v10 = v9;
  [v10 updateClientSettingsWithBlock:v13];
  unint64_t v11 = +[FBSceneManager sharedInstance];
  id v12 = [v11 createSceneWithDefinition:v2 initialParameters:v10];
}

- (void)batteryStatusDidChange:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 objectForKey:@"AtCriticalLevel"];
  unsigned int v5 = [v4 BOOLValue];

  unsigned __int8 v6 = [v3 objectForKey:@"ExternalConnected"];

  [v6 BOOLValue];
  if (v5)
  {
    id v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Battery is at a critical level. Sending out shutdown notification before shutting down.", buf, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.springboard.deviceWillShutDown", 0, 0, 1u);
    sleep(4u);
    BSDispatchMain();
  }
}

- (BOOL)allowWiFiSettingsAction
{
  return self->_allowWiFiSettingsAction;
}

- (void)setAllowWiFiSettingsAction:(BOOL)a3
{
  self->_allowWiFiSettingsAction = a3;
}

- (BOOL)lockButtonLongPressed
{
  return self->_lockButtonLongPressed;
}

- (void)setLockButtonLongPressed:(BOOL)a3
{
  self->_lockButtonLongPressed = a3;
}

- (BOOL)homeButtonPressedWithDisplayDim
{
  return self->_homeButtonPressedWithDisplayDim;
}

- (void)setHomeButtonPressedWithDisplayDim:(BOOL)a3
{
  self->_homeButtonPressedWithDisplayDim = a3;
}

- (NSTimer)lockButtonTimer
{
  return self->_lockButtonTimer;
}

- (BOOL)lockButtonPressedWithDisplayDim
{
  return self->_lockButtonPressedWithDisplayDim;
}

- (void)setLockButtonPressedWithDisplayDim:(BOOL)a3
{
  self->_lockButtonPressedWithDisplayDim = a3;
}

- (BSInvalidatable)dispatchingAssertion
{
  return self->_dispatchingAssertion;
}

- (void)setDispatchingAssertion:(id)a3
{
}

- (UINotificationFeedbackGenerator)notificationFeedbackGenerator
{
  return self->_notificationFeedbackGenerator;
}

- (void)setNotificationFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_dispatchingAssertion, 0);

  objc_storeStrong((id *)&self->_lockButtonTimer, 0);
}

@end