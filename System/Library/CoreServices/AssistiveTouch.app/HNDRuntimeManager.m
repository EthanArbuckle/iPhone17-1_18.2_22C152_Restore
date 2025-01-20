@interface HNDRuntimeManager
- (AXEventProcessor)eventProcessor;
- (BOOL)_accessibilityHandleAccessibilityEvent:(id)a3;
- (BOOL)_handleSoundEvent:(int64_t)a3;
- (BOOL)_urlMatchesLoadableCode:(id)a3;
- (BOOL)setupRuntime;
- (BOOL)shouldStop;
- (BOOL)systemAppReady;
- (HNDRuntimeManager)init;
- (HNDRuntimeManagerDelegate)delegate;
- (void)_assistAppValidationMode;
- (void)_assistiveTouchEnabledChange;
- (void)_assistiveTouchSettingsChanged;
- (void)_attemptStopAfterDelay;
- (void)_disableUserInterfaceClient;
- (void)_languageChanged:(id)a3;
- (void)_scannerEnabledChange;
- (void)_sendASTEnabledTipSignal;
- (void)_springBoardDied:(id)a3;
- (void)_startAccessibilityEventProcessor;
- (void)_stopEventProcessor;
- (void)cleanupRuntime;
- (void)dealloc;
- (void)initializeSystemSettings;
- (void)setDelegate:(id)a3;
- (void)setEventProcessor:(id)a3;
- (void)setShouldStop:(BOOL)a3;
- (void)setSystemAppReady:(BOOL)a3;
- (void)showBannerWithTitle:(id)a3 text:(id)a4;
- (void)startRuntime;
- (void)stop;
- (void)stopIfAllowed;
@end

@implementation HNDRuntimeManager

- (HNDRuntimeManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)HNDRuntimeManager;
  v2 = [(HNDRuntimeManager *)&v10 init];
  if (v2)
  {
    v3 = ASTLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Observing notifications at startup.", v9, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000C084C, AXSystemAppServerReadyNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_springBoardDied:" name:AXSystemAppServerDiedNotification object:0];

    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)sub_1000C08B8, @"com.apple.language.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, v2, (CFNotificationCallback)sub_1000C08B8, @"com.apple.purplebuddy.LanguageResetReady", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (BOOL)setupRuntime
{
  if (AXIsInternalInstall())
  {
    objc_initWeak(location, self);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000C0FA4;
    v48[3] = &unk_1001AAA68;
    objc_copyWeak(&v49, location);
    v3 = objc_retainBlock(v48);
    v4 = +[AXSettings sharedInstance];
    unsigned int v5 = [v4 appValidationTestingMode];

    if (v5)
    {
      AXPerformBlockOnMainThreadAfterDelay();
    }
    else
    {
      v6 = +[AXSettings sharedInstance];
      [v6 registerUpdateBlock:v3 forRetrieveSelector:"appValidationTestingMode" withListener:self];
    }
    objc_destroyWeak(&v49);
    objc_destroyWeak(location);
  }
  v47 = +[NSProcessInfo processInfo];
  v7 = [v47 environment];
  v8 = [v7 objectForKey:@"AX_DEBUG_SCAT"];

  if (v8)
  {
    v9 = ASTLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Launched via external tool.", (uint8_t *)location, 2u);
    }

    _AXSAssistiveTouchScannerSetEnabled();
  }
  else if (_AXSAssistiveTouchScannerEnabled())
  {
    v23 = +[AXSettings sharedInstance];
    unsigned int v24 = [v23 switchControlIsEnabledAsReceiver];

    if (v24)
    {
      v25 = ASTLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Switch Control was only enabled because it was a receiver. We should disable it now.", (uint8_t *)location, 2u);
      }

      v26 = +[AXSettings sharedInstance];
      [v26 setSwitchControlIsEnabledAsReceiver:0];

      _AXSAssistiveTouchScannerSetEnabled();
      goto LABEL_52;
    }
  }
  AXPerformBlockOnMainThreadAfterDelay();
  id v10 = +[SCATScannerManager sharedManager];
  int v11 = AXInPreboardScenario();
  v12 = ASTLogCommon();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "In PreBoard, so not bothering to wait for SpringBoard server.  Registering for notification when PreBoard status changes...", (uint8_t *)location, 2u);
    }

    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)sub_1000C1058, AXInPreBoardScenarioUpdatedNotification, 0, CFNotificationSuspensionBehaviorCoalesce);
    goto LABEL_48;
  }
  if (v13)
  {
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Checking in with system app.", (uint8_t *)location, 2u);
  }

  v15 = +[AXSystemAppServer server];
  int v16 = [v15 pid];

  if (v16 <= 0)
  {
    BOOL v22 = 0;
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    ((void (*)(void))-[HNDHandManager screenFrame:]_0)();
    double v17 = -[HNDHandManager screenFrame:]_0();
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    BOOL v22 = v21 != height || v18 != CGSizeZero.width;
  }
  self->_systemAppReady = v22;
  v27 = +[NSDate date];
  *(void *)&long long v28 = 67109120;
  long long v46 = v28;
  while (![(HNDRuntimeManager *)self systemAppReady])
  {
    if ([(HNDRuntimeManager *)self shouldStop])
    {
      v39 = ASTLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_1001156D0(v39);
      }
      goto LABEL_45;
    }
    if (v16 <= 0) {
      double v29 = 1.0;
    }
    else {
      double v29 = 0.0500000007;
    }
    uint64_t v30 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, v29, 0);
    if (v16 <= 0
      && (+[AXSystemAppServer server],
          v31 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v31 pid],
          v31,
          v16 < 1))
    {
      BOOL v33 = 0;
    }
    else
    {
      -[HNDHandManager screenFrame:]_0(v30);
      -[HNDHandManager screenFrame:]_0();
      BOOL v33 = v32 != width;
      if (v34 != height) {
        BOOL v33 = 1;
      }
    }
    self->_systemAppReady = v33;
    v35 = ASTLogCommon();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      location[0] = (id)__PAIR64__(v16, v46);
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Waiting on screen bounds and system app: %d.", (uint8_t *)location, 8u);
    }

    v36 = +[NSDate date];
    [v36 timeIntervalSinceDate:v27];
    BOOL v38 = v37 > 180.0;

    if (v38)
    {
      v39 = ASTLogCommon();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Timed out waiting for system app.", (uint8_t *)location, 2u);
      }
LABEL_45:

      break;
    }
  }
  if (![(HNDRuntimeManager *)self systemAppReady])
  {
    v44 = ASTLogCommon();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "System app not running. Exiting.", (uint8_t *)location, 2u);
    }

LABEL_52:
    BOOL v43 = 0;
    goto LABEL_53;
  }

LABEL_48:
  v41 = +[SCATScannerManager sharedManager];
  [v41 setDelegate:self];

  -[HNDHandManager screenFrame:]_0(v42);
  BOOL v43 = 1;
LABEL_53:

  return v43;
}

- (void)initializeSystemSettings
{
  BKSHIDEventRegisterEventCallback();
  id v3 = +[HNDSecureIntentManager sharedInstance];
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_1000C11F8, kAXSAssistiveTouchEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  unsigned int v5 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)sub_1000C11F8, kAXSAssistiveTouchScannerEnabledNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)sub_1000C11F8, kAXSAssistiveTouchSettingsChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  [(HNDRuntimeManager *)self _assistiveTouchSettingsChanged];
  v7 = +[AXBackBoardServer server];
  [v7 registerAssistiveTouchPID:getpid()];

  v8 = +[UIPeripheralHost sharedInstance];
  [v8 setKeyboardFencingEnabled:0];

  [(HNDRuntimeManager *)self _sendASTEnabledTipSignal];
}

- (void)startRuntime
{
  id v3 = +[HNDHandManager sharedManager];
  [v3 setupNonSceneUI:0];

  v4 = +[HNDHandManager sharedManager];
  [v4 systemServerConnected];

  unsigned int v5 = +[HNDDeviceManager sharedManager];
  [v5 setDetectDevices:1];

  id v6 = +[SCATScannerManager sharedManager];

  [(HNDRuntimeManager *)self _startAccessibilityEventProcessor];
}

- (void)cleanupRuntime
{
  id v2 = +[SCATScannerManager sharedManager];
  [v2 unloadScanner];
}

- (void)dealloc
{
  [(HNDRuntimeManager *)self _stopEventProcessor];
  id v3 = +[SCATScannerManager sharedManager];
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)HNDRuntimeManager;
  [(HNDRuntimeManager *)&v4 dealloc];
}

- (void)_languageChanged:(id)a3
{
  id v3 = a3;
  objc_super v4 = ASTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "*** Detected language change. Will restart now", v5, 2u);
  }

  exit(1);
}

- (void)_springBoardDied:(id)a3
{
  id v3 = a3;
  objc_super v4 = ASTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SpringBoard died. Terminating.", v5, 2u);
  }

  exit(0);
}

- (void)_attemptStopAfterDelay
{
  id v2 = ASTLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Will attempt stop after delay.", buf, 2u);
  }

  AXPerformBlockOnMainThreadAfterDelay();
}

- (void)_assistiveTouchEnabledChange
{
  if (_AXSAssistiveTouchEnabled())
  {
    objc_super v4 = +[HNDDeviceManager sharedManager];
    [v4 restartDeviceDetection];

    unsigned int v5 = +[HNDHandManager sharedManager];
    [v5 restartEverything];
  }
  else if (!_AXSAssistiveTouchEnabled())
  {
    id v6 = +[HNDHandManager sharedManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000C17B4;
    v7[3] = &unk_1001AB6D8;
    v7[4] = a2;
    [v6 enumerateDisplayManagersWithBlock:v7];

    [(HNDRuntimeManager *)self _attemptStopAfterDelay];
  }
  [(HNDRuntimeManager *)self _sendASTEnabledTipSignal];
}

- (void)_sendASTEnabledTipSignal
{
  BOOL v2 = _AXSAssistiveTouchEnabled() != 0;
  id v3 = +[BMStreams discoverabilitySignal];
  objc_super v4 = [v3 source];
  id v5 = objc_alloc((Class)BMDiscoverabilitySignalEvent);
  CFStringRef v9 = @"enabled";
  id v6 = +[NSNumber numberWithBool:v2];
  id v10 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v8 = [v5 initWithIdentifier:@"com.apple.assistivetouchd.ios-enabled" bundleID:@"com.apple.assistivetouchd" context:@"AssistiveTouch" userInfo:v7];

  [v4 sendEvent:v8];
}

- (void)_scannerEnabledChange
{
  if (_AXSAssistiveTouchScannerEnabled())
  {
    id v3 = +[HNDDeviceManager sharedManager];
    [v3 restartDeviceDetection];

    id v4 = +[HNDHandManager sharedManager];
    [v4 enumerateDisplayManagersWithBlock:&stru_1001AE160];
  }
  else
  {
    AXPerformBlockAsynchronouslyOnMainThread();
    [(HNDRuntimeManager *)self _attemptStopAfterDelay];
  }
}

- (void)_assistiveTouchSettingsChanged
{
  BOOL v2 = ASTLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AST settings changed", v4, 2u);
  }

  id v3 = +[HNDHandManager sharedManager];
  [v3 updateAllSettings];
}

- (void)stop
{
  id v3 = ASTLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping now.", buf, 2u);
  }

  id v4 = +[HNDEventManager sharedManager];
  [v4 resetEventManager];

  id v5 = +[HNDEventManager sharedManager];
  [v5 setDisableSystemGesturesAssertion:0];

  if (_AXSApplicationAccessibilityEnabled() && _AXSCanDisableApplicationAccessibility()) {
    _AXSApplicationAccessibilitySetEnabled();
  }
  id v6 = +[NSNotificationCenter defaultCenter];
  v7 = +[NSOperationQueue currentQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000C1D20;
  v9[3] = &unk_1001AE1E8;
  v9[4] = self;
  id v8 = [v6 addObserverForName:@"HNDEventManagerReset" object:0 queue:v7 usingBlock:v9];
}

- (void)stopIfAllowed
{
  if (_AXSAssistiveTouchEnabled()
    || _AXSAssistiveTouchScannerEnabled()
    || (+[SCATScannerManager sharedManager],
        id v3 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v4 = [v3 isHandlingInterDeviceCommunication],
        v3,
        (v4 & 1) != 0))
  {
    id v5 = ASTLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = _AXSAssistiveTouchEnabled();
      int v7 = _AXSAssistiveTouchScannerEnabled();
      id v8 = +[SCATScannerManager sharedManager];
      v10[0] = 67109632;
      v10[1] = v6;
      __int16 v11 = 1024;
      int v12 = v7;
      __int16 v13 = 1024;
      unsigned int v14 = [v8 isHandlingInterDeviceCommunication];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not allowed to stop. AST: %i, Switch Control: %i, inter device communication: %i", (uint8_t *)v10, 0x14u);
    }
  }
  else
  {
    _AXSAssistiveTouchSetEnabled();
    _AXSAssistiveTouchScannerSetEnabled();
    CFStringRef v9 = ASTLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AssistiveTouch preference was not enabled. Shutting down", (uint8_t *)v10, 2u);
    }

    [(HNDRuntimeManager *)self stop];
  }
}

- (BOOL)_urlMatchesLoadableCode:(id)a3
{
  id v3 = [a3 absoluteString];
  if (([v3 containsString:@"AccessibilityBundles"] & 1) != 0
    || ([v3 containsString:@"Accessibility.framework"] & 1) != 0
    || [v3 containsString:@"AX"]
    && ([v3 containsString:@"ServerInstance"] & 1) != 0)
  {
LABEL_5:
    unsigned __int8 v4 = 0;
    goto LABEL_6;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = [&off_1001BBA00 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_9:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(&off_1001BBA00);
      }
      if ([v3 containsString:*(void *)(*((void *)&v10 + 1) + 8 * v9)]) {
        goto LABEL_5;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [&off_1001BBA00 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_9;
        }
        break;
      }
    }
  }
  if ([v3 hasSuffix:@"bundle/"]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 hasSuffix:@"framework/"];
  }
LABEL_6:

  return v4;
}

- (void)_assistAppValidationMode
{
  id v3 = +[AXSettings sharedInstance];
  unsigned __int8 v4 = [v3 appValidationTestingMode];

  if (v4)
  {
    id v5 = +[HNDDefaults sharedDefaults];
    [v5 setPreference:&__kCFBooleanTrue forKey:@"AppValidationAssistanceInProgress"];

    id v6 = ASTLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Assisting app validation by loading everything on the system", buf, 2u);
    }

    id v7 = +[NSFileManager defaultManager];
    uint64_t v8 = +[NSURL fileURLWithPath:@"/System/Library"];
    NSURLResourceKey v26 = NSURLIsDirectoryKey;
    uint64_t v9 = +[NSArray arrayWithObjects:&v26 count:1];
    long long v10 = [v7 enumeratorAtURL:v8 includingPropertiesForKeys:v9 options:0 errorHandler:&stru_1001AE228];

    NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)nullsub_6);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v20;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          if ([(HNDRuntimeManager *)self _urlMatchesLoadableCode:v15])
          {
            int v16 = ASTLogCommon();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v24 = v15;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Loading: %@", buf, 0xCu);
            }

            double v17 = +[NSBundle bundleWithURL:v15];
            [v17 load];
          }
        }
        id v12 = [v11 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v12);
    }

    double v18 = +[HNDDefaults sharedDefaults];
    [v18 setPreference:&__kCFBooleanFalse forKey:@"AppValidationAssistanceInProgress"];
  }
  else
  {
    long long v11 = ASTLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "App validation mode not enabled, not loading code", buf, 2u);
    }
  }
}

- (void)_startAccessibilityEventProcessor
{
  id v3 = [(HNDRuntimeManager *)self eventProcessor];
  if (!v3)
  {
    id v3 = [objc_alloc((Class)AXEventProcessor) initWithHIDTapIdentifier:@"AX AssistiveTouch" HIDEventTapPriority:25 systemEventTapIdentifier:0 systemEventTapPriority:25];
    [v3 setHIDEventFilterMask:32];
    objc_initWeak(&location, self);
    unsigned __int8 v4 = _NSConcreteStackBlock;
    uint64_t v5 = 3221225472;
    id v6 = sub_1000C25D8;
    id v7 = &unk_1001ACF78;
    objc_copyWeak(&v8, &location);
    [v3 setHIDEventHandler:&v4];
    objc_msgSend(v3, "beginHandlingHIDEventsForReason:", @"AX AssistiveTouch Accessibility Event Handler", v4, v5, v6, v7);
    [(HNDRuntimeManager *)self setEventProcessor:v3];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_stopEventProcessor
{
  id v2 = [(HNDRuntimeManager *)self eventProcessor];
  [v2 endHandlingHIDEventsForReason:@"AX AssistiveTouch Accessibility Event Handler"];
}

- (BOOL)_accessibilityHandleAccessibilityEvent:(id)a3
{
  unsigned __int8 v4 = [a3 accessibilityData];
  if ([v4 page] == (id)3) {
    BOOL v5 = -[HNDRuntimeManager _handleSoundEvent:](self, "_handleSoundEvent:", [v4 usage]);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_handleSoundEvent:(int64_t)a3
{
  BOOL v5 = +[AXSettings sharedInstance];
  id v6 = [v5 assistiveTouchActionsBySoundAction];
  id v7 = +[NSNumber numberWithLong:a3];
  id v8 = [v7 stringValue];
  uint64_t v9 = [v6 objectForKeyedSubscript:v8];

  if (v9)
  {
    if ((unint64_t)(a3 - 1) > 0xD) {
      long long v10 = 0;
    }
    else {
      long long v10 = *(&off_1001AE248 + a3 - 1);
    }
    long long v11 = sub_100040EC8(@"SOUND_ACTION_ALERT_TITLE");
    id v12 = sub_100040EC8(v10);
    [(HNDRuntimeManager *)self showBannerWithTitle:v11 text:v12];

    uint64_t v13 = +[HNDHandManager sharedManager];
    unsigned int v14 = [v13 currentDisplayManager];
    [v14 activateAssistiveTouchAction:v9 fromButtonPress:1];
  }
  return v9 != 0;
}

- (void)showBannerWithTitle:(id)a3 text:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_disableUserInterfaceClient" object:0];
  id v8 = +[HNDHandManager sharedManager];
  uint64_t v9 = [v8 currentDisplayManager];
  [v9 addUserInterfaceClientEnabler:@"AssistiveTouchSoundActions"];

  long long v10 = +[HNDHandManager sharedManager];
  long long v11 = [v10 currentDisplayManager];
  [v11 showSimpleBannerWithTitle:v7 text:v6];

  [(HNDRuntimeManager *)self performSelector:"_disableUserInterfaceClient" withObject:0 afterDelay:15.0];
}

- (void)_disableUserInterfaceClient
{
  id v3 = +[HNDHandManager sharedManager];
  id v2 = [v3 currentDisplayManager];
  [v2 removeUserInterfaceClientEnabler:@"AssistiveTouchSoundActions"];
}

- (HNDRuntimeManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HNDRuntimeManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (BOOL)systemAppReady
{
  return self->_systemAppReady;
}

- (void)setSystemAppReady:(BOOL)a3
{
  self->_systemAppReady = a3;
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventProcessor, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end