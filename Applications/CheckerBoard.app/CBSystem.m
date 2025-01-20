@interface CBSystem
+ (void)_checkOutUserSettings;
+ (void)checkoutAndReboot:(BOOL)a3 userInitiated:(BOOL)a4;
- (BSInvalidatable)touchSensitiveButtonEnabledAssertion;
- (CBSystem)init;
- (CBWiFiManager)wifiManager;
- (NSMutableDictionary)shutdownTasks;
- (OS_dispatch_semaphore)shutdownTasksPendingSemaphore;
- (PCPersistentTimer)inactivityTimer;
- (id)proxyServer;
- (void)_connectToSSID:(id)a3 password:(id)a4 completion:(id)a5;
- (void)_deregisterNotifications;
- (void)_inactivityTimerFired:(id)a3;
- (void)_registerForNotifications;
- (void)_runShutdownImminentCompletions;
- (void)_startInactivityTimer;
- (void)_stopInactivityTimer;
- (void)_stopInactivityTimer:(id)a3;
- (void)addShutdownTask:(id)a3 forReason:(id)a4;
- (void)connectToSSID:(id)a3 completion:(id)a4;
- (void)connectToSSID:(id)a3 password:(id)a4 completion:(id)a5;
- (void)connectedNetwork:(id)a3;
- (void)currentLocaleIdentifier:(id)a3;
- (void)diagnosticsRunning:(id)a3;
- (void)dimDisplay;
- (void)disableNetworkReconnect;
- (void)disableTouchButtonEvents;
- (void)displayDimmed:(id)a3;
- (void)enableNetworkReconnect;
- (void)enableTouchButtonEvents;
- (void)exitRequestedWithServer:(id)a3;
- (void)hideSceneStatusBar;
- (void)launchDiagnostics;
- (void)networkReconnectEnabled:(id)a3;
- (void)networkScanWithCompletion:(id)a3;
- (void)removeShutdownTask:(id)a3;
- (void)setInactivityTimer:(id)a3;
- (void)setLocaleIdentifier:(id)a3 completion:(id)a4;
- (void)setShutdownTasks:(id)a3;
- (void)setShutdownTasksPendingSemaphore:(id)a3;
- (void)setTouchSensitiveButtonEnabledAssertion:(id)a3;
- (void)setWifiManager:(id)a3;
- (void)showSceneStatusBar;
- (void)start;
- (void)statusBarStyle:(int64_t)a3;
- (void)undimDisplay;
@end

@implementation CBSystem

- (CBSystem)init
{
  v11.receiver = self;
  v11.super_class = (Class)CBSystem;
  v2 = [(CBSystem *)&v11 init];
  if (v2)
  {
    v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up the system…", v10, 2u);
    }

    uint64_t v4 = +[CBWiFiManager sharedInstance];
    wifiManager = v2->_wifiManager;
    v2->_wifiManager = (CBWiFiManager *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    shutdownTasks = v2->_shutdownTasks;
    v2->_shutdownTasks = v6;

    touchSensitiveButtonEnabledAssertion = v2->_touchSensitiveButtonEnabledAssertion;
    v2->_touchSensitiveButtonEnabledAssertion = 0;
  }
  return v2;
}

- (void)start
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enabling CheckerBoard services…", buf, 2u);
  }

  if (+[CBUtilities isInternalInstall])
  {
    uint64_t v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unsetting default…", v10, 2u);
    }

    +[CBInternalSettings setPreferencesValue:&__kCFBooleanFalse key:@"LaunchCheckerBoard" domain:@"com.apple.CheckerBoard"];
  }
  v5 = +[CBShellServer sharedInstance];
  id v6 = +[CBAppManager sharedInstance];
  v7 = +[CBIdleSleepManager sharedInstance];
  [v7 enableIdleSleep];

  id v8 = +[CBStatusBarStateAggregator sharedInstance];
  v9 = +[CBThermalManager sharedInstance];
  [v9 startListeningForThermalEvents];

  [v5 setSystemServicesDelegate:self];
  [v5 start];
  [(CBSystem *)self _registerForNotifications];
  [(CBSystem *)self _startInactivityTimer];
}

+ (void)checkoutAndReboot:(BOOL)a3 userInitiated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CheckerBoard is checking out and will reboot (%d)", buf, 8u);
  }

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"SystemWillReboot" object:0];

  +[CBSystem _checkOutUserSettings];
  id v8 = +[CBBootIntentManager sharedInstance];
  [v8 deleteBootIntentSourceData];

  if (v4) {
    +[CBSNVRamUtil clearNVRamVariable:@"boot-command"];
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100032C80;
  v15[3] = &unk_10007A450;
  BOOL v16 = v5;
  v9 = objc_retainBlock(v15);
  v10 = +[CBRemoteSetupManager sharedInstance];
  objc_super v11 = v10;
  if (v10 && (unint64_t)[v10 setupState] >= 2)
  {
    [v11 endRemoteSetupBroadcast];
    dispatch_time_t v12 = dispatch_time(0, 1000000000);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100032D0C;
    v13[3] = &unk_100079BD8;
    v14 = v9;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v13);
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }
}

+ (void)_checkOutUserSettings
{
  v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking out and resetting back to user's settings…", buf, 2u);
  }

  +[CBUserSettings sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100032E38;
  v5[3] = &unk_1000794E0;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  BOOL v4 = objc_retainBlock(v5);
  if (+[NSThread isMainThread]) {
    ((void (*)(void *))v4[2])(v4);
  }
  else {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

- (void)exitRequestedWithServer:(id)a3
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Exiting CheckerBoard", v4, 2u);
  }

  +[CBSystem checkoutAndReboot:1 userInitiated:0];
}

- (id)proxyServer
{
  v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Get proxyServer.", v6, 2u);
  }

  id v3 = +[CBUserSettings sharedInstance];
  BOOL v4 = [v3 proxyServer];

  return v4;
}

- (void)showSceneStatusBar
{
  id v2 = +[CBSceneManager sharedInstance];
  [v2 showSceneStatusBar];
}

- (void)hideSceneStatusBar
{
  id v2 = +[CBSceneManager sharedInstance];
  [v2 hideSceneStatusBar];
}

- (void)statusBarStyle:(int64_t)a3
{
  id v4 = +[CBSceneManager sharedInstance];
  [v4 statusBarStyle:a3];
}

- (void)dimDisplay
{
  id v2 = +[CBIdleSleepManager sharedInstance];
  [v2 dimDisplay];
}

- (void)undimDisplay
{
  id v2 = +[CBIdleSleepManager sharedInstance];
  [v2 undimDisplay];
}

- (void)enableTouchButtonEvents
{
  [(CBSystem *)self disableTouchButtonEvents];
  BKSHIDTouchSensitiveButtonRequestScanMode();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(CBSystem *)self setTouchSensitiveButtonEnabledAssertion:v3];
}

- (void)disableTouchButtonEvents
{
  id v3 = [(CBSystem *)self touchSensitiveButtonEnabledAssertion];

  if (v3)
  {
    id v4 = [(CBSystem *)self touchSensitiveButtonEnabledAssertion];
    [v4 invalidate];

    [(CBSystem *)self setTouchSensitiveButtonEnabledAssertion:0];
  }
}

- (void)addShutdownTask:(id)a3 forReason:(id)a4
{
  id v6 = a4;
  id v8 = objc_retainBlock(a3);
  v7 = [(CBSystem *)self shutdownTasks];
  [v7 setObject:v8 forKeyedSubscript:v6];
}

- (void)removeShutdownTask:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CBSystem *)self shutdownTasks];
  [v5 removeObjectForKey:v4];

  v7 = [(CBSystem *)self shutdownTasks];
  if (![v7 count])
  {
    id v6 = [(CBSystem *)self shutdownTasksPendingSemaphore];

    if (!v6) {
      return;
    }
    v7 = [(CBSystem *)self shutdownTasksPendingSemaphore];
    dispatch_semaphore_signal(v7);
  }
}

- (void)disableNetworkReconnect
{
  id v2 = +[CBWiFiManager sharedInstance];
  [v2 setAttemptsNetworkReconnect:0];
}

- (void)enableNetworkReconnect
{
  id v2 = +[CBWiFiManager sharedInstance];
  [v2 setAttemptsNetworkReconnect:1];
}

- (void)launchDiagnostics
{
  id v2 = +[UIApplication sharedApplication];
  id v4 = [v2 delegate];

  id v3 = v4;
  if (v4)
  {
    [v4 launchDiagnosticsApp];
    id v3 = v4;
  }
}

- (void)diagnosticsRunning:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = +[CBAppManager sharedInstance];
  id v5 = [v4 currentOpenAppBundleIDs];

  v3[2](v3, [v5 containsObject:@"com.apple.Diagnostics"]);
}

- (void)connectToSSID:(id)a3 completion:(id)a4
{
}

- (void)connectToSSID:(id)a3 password:(id)a4 completion:(id)a5
{
}

- (void)_connectToSSID:(id)a3 password:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = sub_100033980;
  v56 = sub_100033990;
  id v57 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = sub_100033980;
  v50 = sub_100033990;
  id v51 = 0;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100033998;
  v42[3] = &unk_10007A478;
  id v10 = a5;
  v44 = &v52;
  v45 = &v46;
  v42[4] = self;
  id v43 = v10;
  objc_super v11 = objc_retainBlock(v42);
  dispatch_time_t v12 = +[NSNotificationCenter defaultCenter];
  v13 = +[NSOperationQueue mainQueue];
  uint64_t v14 = [v12 addObserverForName:@"CBWiFiManagerDidAssociateToEncryptedNetworkNotification" object:0 queue:v13 usingBlock:v11];
  v15 = (void *)v53[5];
  v53[5] = v14;

  BOOL v16 = +[NSNotificationCenter defaultCenter];
  v17 = +[NSOperationQueue mainQueue];
  uint64_t v18 = [v16 addObserverForName:@"CBWiFiManagerDidAssociateToOpenNetworkNotification" object:0 queue:v17 usingBlock:v11];
  v19 = (void *)v47[5];
  v47[5] = v18;

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_100033980;
  v40 = sub_100033990;
  id v41 = 0;
  objc_initWeak(&location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100033B34;
  v30[3] = &unk_10007A4A0;
  v33 = &v36;
  objc_copyWeak(&v34, &location);
  id v20 = v8;
  id v31 = v20;
  id v21 = v9;
  id v32 = v21;
  v22 = objc_retainBlock(v30);
  v23 = +[NSNotificationCenter defaultCenter];
  v24 = +[NSOperationQueue mainQueue];
  uint64_t v25 = [v23 addObserverForName:@"CBWiFiNetworkScanCompletedNotification" object:0 queue:v24 usingBlock:v22];
  v26 = (void *)v37[5];
  v37[5] = v25;

  v27 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Starting network scan for CBSystem as part of network association attempt", v29, 2u);
  }

  v28 = +[CBWiFiManager sharedInstance];
  [v28 startWiFiNetworkScanRequestFrom:self];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
}

- (void)networkScanWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100033980;
  v23 = sub_100033990;
  id v24 = 0;
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100034064;
  v14[3] = &unk_10007A4C8;
  BOOL v16 = &v19;
  objc_copyWeak(&v17, &location);
  id v5 = v4;
  id v15 = v5;
  id v6 = objc_retainBlock(v14);
  v7 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting network scan for CBSystem (without association)", v13, 2u);
  }

  id v8 = +[NSNotificationCenter defaultCenter];
  id v9 = +[NSOperationQueue mainQueue];
  uint64_t v10 = [v8 addObserverForName:@"CBWiFiNetworkScanCompletedNotification" object:0 queue:v9 usingBlock:v6];
  objc_super v11 = (void *)v20[5];
  v20[5] = v10;

  dispatch_time_t v12 = +[CBWiFiManager sharedInstance];
  [v12 startWiFiNetworkScanRequestFrom:self];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v19, 8);
}

- (void)connectedNetwork:(id)a3
{
  v7 = (void (**)(id, void *))a3;
  id v3 = +[CBWiFiManager sharedInstance];
  unsigned int v4 = [v3 isAssociatedToNetwork];

  if (v4)
  {
    id v5 = +[CBWiFiManager sharedInstance];
    id v6 = [v5 currentNetworkSSID];
    v7[2](v7, v6);
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)displayDimmed:(id)a3
{
  id v4 = a3;
  id v5 = +[CBIdleSleepManager sharedInstance];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 isDisplayDim]);
}

- (void)networkReconnectEnabled:(id)a3
{
  id v4 = a3;
  id v5 = +[CBWiFiManager sharedInstance];
  (*((void (**)(id, id))a3 + 2))(v4, [v5 attemptsNetworkReconnect]);
}

- (void)currentLocaleIdentifier:(id)a3
{
  id v4 = a3;
  id v6 = +[NSLocale currentLocale];
  id v5 = [v6 localeIdentifier];
  (*((void (**)(id, void *))a3 + 2))(v4, v5);
}

- (void)setLocaleIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[CBLocationController sharedLocationController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000345F8;
  v9[3] = &unk_100079BD8;
  id v10 = v5;
  id v8 = v5;
  [v7 selectLanguage:v6 restartAfterCompletion:v9];
}

- (void)_registerForNotifications
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for notifications…", v6, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_stopInactivityTimer:" name:@"CBEndGameViewControllerLaunchingDiagnosticsNotification" object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_runShutdownImminentCompletions" name:@"SystemWillReboot" object:0];
}

- (void)_deregisterNotifications
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deregistering notifications…", v5, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"CBEndGameViewControllerLaunchingDiagnosticsNotification" object:0];
}

- (void)_stopInactivityTimer:(id)a3
{
  id v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stop inactivity timer notification sent", v5, 2u);
  }

  [(CBSystem *)self _stopInactivityTimer];
}

- (void)_startInactivityTimer
{
  id v3 = [(CBSystem *)self inactivityTimer];

  if (!v3)
  {
    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting inactivity timer…", v11, 2u);
    }

    id v5 = +[NSDate date];
    id v6 = +[NSDate dateWithTimeInterval:v5 sinceDate:300.0];

    id v7 = [objc_alloc((Class)PCPersistentTimer) initWithFireDate:v6 serviceIdentifier:@"com.apple.CheckerBoard.inactivitytimer" target:self selector:"_inactivityTimerFired:" userInfo:0];
    [(CBSystem *)self setInactivityTimer:v7];

    id v8 = [(CBSystem *)self inactivityTimer];
    [v8 setMinimumEarlyFireProportion:1.0];

    id v9 = [(CBSystem *)self inactivityTimer];
    id v10 = +[NSRunLoop mainRunLoop];
    [v9 scheduleInRunLoop:v10];
  }
}

- (void)_stopInactivityTimer
{
  [(CBSystem *)self _deregisterNotifications];
  id v3 = [(CBSystem *)self inactivityTimer];

  if (v3)
  {
    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating inactivity timer…", v6, 2u);
    }

    id v5 = [(CBSystem *)self inactivityTimer];
    [v5 invalidate];

    [(CBSystem *)self setInactivityTimer:0];
  }
}

- (void)_inactivityTimerFired:(id)a3
{
  id v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Inactivity timeout fired…", v5, 2u);
  }

  [(CBSystem *)self _stopInactivityTimer];
  +[CBSystem checkoutAndReboot:1 userInitiated:0];
}

- (void)_runShutdownImminentCompletions
{
  id v3 = [(CBSystem *)self shutdownTasks];
  id v4 = [v3 count];

  if (v4)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    [(CBSystem *)self setShutdownTasksPendingSemaphore:v5];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = [(CBSystem *)self shutdownTasks];
    id v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          dispatch_time_t v12 = CheckerBoardLogHandleForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v24 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Running shutdown imminent completion for reason %@", buf, 0xCu);
          }

          v13 = [(CBSystem *)self shutdownTasks];
          uint64_t v14 = [v13 objectForKeyedSubscript:v11];
          v14[2]();
        }
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v8);
    }

    id v15 = [(CBSystem *)self shutdownTasksPendingSemaphore];
    dispatch_time_t v16 = dispatch_time(0, 5000000000);
    intptr_t v17 = dispatch_semaphore_wait(v15, v16);

    if (v17)
    {
      uint64_t v18 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000496EC(v18);
      }
    }
  }
}

- (CBWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
}

- (PCPersistentTimer)inactivityTimer
{
  return self->_inactivityTimer;
}

- (void)setInactivityTimer:(id)a3
{
}

- (NSMutableDictionary)shutdownTasks
{
  return self->_shutdownTasks;
}

- (void)setShutdownTasks:(id)a3
{
}

- (OS_dispatch_semaphore)shutdownTasksPendingSemaphore
{
  return self->_shutdownTasksPendingSemaphore;
}

- (void)setShutdownTasksPendingSemaphore:(id)a3
{
}

- (BSInvalidatable)touchSensitiveButtonEnabledAssertion
{
  return self->_touchSensitiveButtonEnabledAssertion;
}

- (void)setTouchSensitiveButtonEnabledAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchSensitiveButtonEnabledAssertion, 0);
  objc_storeStrong((id *)&self->_shutdownTasksPendingSemaphore, 0);
  objc_storeStrong((id *)&self->_shutdownTasks, 0);
  objc_storeStrong((id *)&self->_inactivityTimer, 0);

  objc_storeStrong((id *)&self->_wifiManager, 0);
}

@end