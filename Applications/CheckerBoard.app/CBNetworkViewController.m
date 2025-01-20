@interface CBNetworkViewController
- (BOOL)isPresentedForSetupFlow;
- (BOOL)networkConnectionInProgress;
- (BOOL)networkListViewControllerCurrentPowerState:(id)a3;
- (BOOL)networkListViewControllerIsAutoUnlockEnabled:(id)a3;
- (BOOL)networkListViewControllerIsManagedAppleID:(id)a3;
- (BOOL)networkListViewControllerLockdownModeActive:(id)a3;
- (BOOL)networkListViewControllerNetworkRestrictionActive:(id)a3;
- (BOOL)networkListViewControllerPowerModificationDisabled:(id)a3;
- (BOOL)networkListViewControllerWAPIEnabled:(id)a3;
- (BOOL)networkReachable;
- (BOOL)networkViewControllerVisible;
- (CBBootIntentManager)bootIntentManager;
- (CBNetworkListRecord)targetNetworkForBootIntent;
- (CBNetworkViewController)initWithSetupPresentationTheme:(BOOL)a3;
- (CBWiFiManager)wifiManager;
- (CBWindow)otherNetworkWindow;
- (NSTimer)wifiTimeoutTimer;
- (OBTrayButton)continueButton;
- (UIBarButtonItem)customBackButton;
- (int64_t)networkListViewControllerAutoInstantHotspotOption:(id)a3;
- (unint64_t)networkListViewControllerCurrentPowerStateToggle:(id)a3;
- (void)_attemptingToAssociateToOpenNetwork:(id)a3;
- (void)_deregisterNotifications;
- (void)_disableUIAndDisplaySpinnerBarItem;
- (void)_enableAndUpdateUI;
- (void)_presentAlternateNetworkViewControllerWithInfo:(id)a3;
- (void)_presentAlternateNetworkViewControllerWithInfo:(id)a3 password:(id)a4 ssid:(id)a5;
- (void)_presentEncryptedNetworkAssociationScene:(id)a3;
- (void)_presentExitDiagnosticsAlert;
- (void)_presentOpenNetworkAssociationFailureAlert:(id)a3;
- (void)_presentOpenNetworkAssociationFailureAlertWithNetworkName:(id)a3;
- (void)_presentWiFiNetworkTimeoutAlert;
- (void)_reachabilityChanged:(id)a3;
- (void)_registerForNotifications;
- (void)_startNetworkScan;
- (void)_startWiFiScan:(id)a3;
- (void)_stopNetworkScan;
- (void)_stopWiFiScan:(id)a3;
- (void)_stopWiFiTimeroutTimer;
- (void)_updatePowerState;
- (void)_wifiNetworkAssociationCompleted:(id)a3;
- (void)_wifiNetworkScanCompleted;
- (void)_wifiTimeoutFired:(id)a3;
- (void)autoAdvanceToNextScene;
- (void)backButtonTapped:(id)a3;
- (void)cleanUp;
- (void)continueTapped;
- (void)dealloc;
- (void)disableBackButton;
- (void)doneTapped;
- (void)enableBackButton;
- (void)enableContinueButton:(BOOL)a3;
- (void)hideBackButton;
- (void)networkListViewController:(id)a3 didTapRecord:(id)a4;
- (void)networkListViewControllerDidTapOtherNetwork:(id)a3;
- (void)reevaluateNetworkList;
- (void)reloadNetworkList;
- (void)setBootIntentManager:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setContinueButtonAvailable;
- (void)setContinueButtonBusy;
- (void)setCustomBackButton:(id)a3;
- (void)setIsPresentedForSetupFlow:(BOOL)a3;
- (void)setNetworkConnectionInProgress:(BOOL)a3;
- (void)setNetworkReachable:(BOOL)a3;
- (void)setNetworkViewControllerVisible:(BOOL)a3;
- (void)setOtherNetworkWindow:(id)a3;
- (void)setTargetNetworkForBootIntent:(id)a3;
- (void)setWifiManager:(id)a3;
- (void)setWifiTimeoutTimer:(id)a3;
- (void)setupView;
- (void)showBackButton;
- (void)updateNetworkList;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CBNetworkViewController

- (CBNetworkViewController)initWithSetupPresentationTheme:(BOOL)a3
{
  int v5 = MGGetBoolAnswer();
  v6 = +[NSBundle mainBundle];
  v7 = v6;
  if (v5) {
    CFStringRef v8 = @"CHOOSE_WLAN_HEADER";
  }
  else {
    CFStringRef v8 = @"CHOOSE_WIFI_HEADER";
  }
  v9 = [v6 localizedStringForKey:v8 value:&stru_10007A9F8 table:0];

  v17.receiver = self;
  v17.super_class = (Class)CBNetworkViewController;
  v10 = [(CBNetworkViewController *)&v17 initWithTitle:v9 detailText:0 icon:0 adoptTableViewScrollView:1];
  v11 = v10;
  if (v10)
  {
    v10->_BOOL isPresentedForSetupFlow = a3;
    v10->_networkReachable = 0;
    uint64_t v12 = +[CBBootIntentManager sharedInstance];
    bootIntentManager = v11->_bootIntentManager;
    v11->_bootIntentManager = (CBBootIntentManager *)v12;

    v11->_networkConnectionInProgress = 0;
    v14 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isPresentedForSetupFlow = v11->_isPresentedForSetupFlow;
      *(_DWORD *)buf = 67109120;
      BOOL v19 = isPresentedForSetupFlow;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Initializing Network View Controller with [Next] button (%d)", buf, 8u);
    }
  }
  return v11;
}

- (void)viewDidLoad
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Wi-Fi picker pane loaded", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)CBNetworkViewController;
  [(CBNetworkViewController *)&v5 viewDidLoad];
  [(CBNetworkViewController *)self setupView];
  v4 = +[CBWiFiManager sharedInstance];
  [(CBNetworkViewController *)self setWifiManager:v4];

  [(CBNetworkViewController *)self _updatePowerState];
  [(CBNetworkViewController *)self _registerForNotifications];
  [(CBNetworkViewController *)self setListDelegate:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)CBNetworkViewController;
  [(CBNetworkViewController *)&v17 viewDidAppear:a3];
  v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi picker pane did appear. Beginning observation for reachability changes", v16, 2u);
  }

  objc_super v5 = +[CPNetworkObserver sharedNetworkObserver];
  [v5 addObserver:self selector:"_reachabilityChanged:" forHostname:@"apple.com"];
  v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Performing immediate reachability check", v16, 2u);
  }

  if (v5 && [v5 isNetworkReachable])
  {
    v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Network is immediately reachable", v16, 2u);
    }

    [(CBNetworkViewController *)self setNetworkReachable:1];
    [(CBNetworkViewController *)self _enableAndUpdateUI];
  }
  CFStringRef v8 = [(CBNetworkViewController *)self bootIntentManager];
  v9 = [v8 bootIntentWifiSSID];

  if (v9)
  {
    v10 = [CBNetworkListRecord alloc];
    v11 = [(CBNetworkViewController *)self bootIntentManager];
    uint64_t v12 = [v11 bootIntentWifiSSID];
    v13 = [(CBNetworkViewController *)self bootIntentManager];
    v14 = [v13 bootIntentWifiPassword];
    v15 = [(CBNetworkListRecord *)v10 initWithBootIntentSSID:v12 passwordProtected:v14 != 0];
    [(CBNetworkViewController *)self setTargetNetworkForBootIntent:v15];
  }
}

- (void)setupView
{
  id v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 localizedStringForKey:@"BACK" value:&stru_10007A9F8 table:0];
  id v6 = [v3 initWithTitle:v5 style:0 target:self action:"backButtonTapped:"];
  [(CBNetworkViewController *)self setCustomBackButton:v6];

  v7 = [(CBNetworkViewController *)self customBackButton];
  [v7 _setShowsBackButtonIndicator:1];

  if ([(CBNetworkViewController *)self isPresentedForSetupFlow])
  {
    [(CBNetworkViewController *)self showBackButton];
    CFStringRef v8 = +[OBBoldTrayButton boldButton];
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"CONTINUE" value:&stru_10007A9F8 table:0];
    [v8 setTitle:v10 forState:0];

    [v8 addTarget:self action:"continueTapped" forControlEvents:64];
    v11 = [(CBNetworkViewController *)self buttonTray];
    [v11 addButton:v8];

    [(CBNetworkViewController *)self setContinueButton:v8];
    [(CBNetworkViewController *)self enableContinueButton:0];
    uint64_t v12 = +[OBLinkTrayButton linkButton];
    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"CANCEL" value:&stru_10007A9F8 table:0];
    [v12 setTitle:v14 forState:0];

    [v12 addTarget:self action:"_presentExitDiagnosticsAlert" forControlEvents:64];
    v15 = [(CBNetworkViewController *)self buttonTray];
    [v15 addButton:v12];
  }
  else
  {
    [(CBNetworkViewController *)self hideBackButton];
    CFStringRef v8 = +[OBBoldTrayButton boldButton];
    v16 = +[NSBundle mainBundle];
    objc_super v17 = [v16 localizedStringForKey:@"DONE" value:&stru_10007A9F8 table:0];
    [v8 setTitle:v17 forState:0];

    [v8 addTarget:self action:"doneTapped" forControlEvents:64];
    v18 = [(CBNetworkViewController *)self buttonTray];
    [v18 addButton:v8];

    [(CBNetworkViewController *)self setContinueButton:v8];
  }

  [(CBNetworkViewController *)self setShowNetworkSettings:0];
  [(CBNetworkViewController *)self setSupportsCellularActivation:0];
  [(CBNetworkViewController *)self setShowOtherNetwork:1];
  id v20 = +[UIColor systemWhiteColor];
  BOOL v19 = [(CBNetworkViewController *)self tableView];
  [v19 setBackgroundColor:v20];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network view controller will appear", buf, 2u);
  }

  [(CBNetworkViewController *)self setNetworkViewControllerVisible:1];
  v6.receiver = self;
  v6.super_class = (Class)CBNetworkViewController;
  [(CBNetworkViewController *)&v6 viewWillAppear:v3];
  [(CBNetworkViewController *)self cleanUp];
  [(CBNetworkViewController *)self _startNetworkScan];
}

- (void)_startNetworkScan
{
  BOOL v3 = [(CBNetworkViewController *)self wifiManager];
  [v3 startWiFiNetworkScanRequestFrom:self];

  v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi scan started", v5, 2u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network view controller will disappear", buf, 2u);
  }

  [(CBNetworkViewController *)self setNetworkViewControllerVisible:0];
  v7.receiver = self;
  v7.super_class = (Class)CBNetworkViewController;
  [(CBNetworkViewController *)&v7 viewWillDisappear:v3];
  [(CBNetworkViewController *)self cleanUp];
  if ([(CBNetworkViewController *)self isMovingFromParentViewController])
  {
    objc_super v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network view controller is moving from parent. Clearing notification handling", buf, 2u);
    }

    [(CBNetworkViewController *)self _deregisterNotifications];
  }
}

- (void)cleanUp
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cleaning up Network View Controller…", v4, 2u);
  }

  [(CBNetworkViewController *)self _stopNetworkScan];
}

- (void)_stopNetworkScan
{
  BOOL v3 = [(CBNetworkViewController *)self wifiManager];
  [v3 stopWiFiNetworkScanRequestFrom:self];

  v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi scan stopped", v5, 2u);
  }
}

- (void)dealloc
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dealloc was called", buf, 2u);
  }

  [(CBNetworkViewController *)self cleanUp];
  v4.receiver = self;
  v4.super_class = (Class)CBNetworkViewController;
  [(CBNetworkViewController *)&v4 dealloc];
}

- (void)_registerForNotifications
{
  [(CBNetworkViewController *)self _deregisterNotifications];
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for notifications…", v14, 2u);
  }

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_updatePowerState" name:@"CBWiFiPowerStateDidChangeNotification" object:0];

  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_wifiNetworkScanCompleted" name:@"CBWiFiNetworkScanCompletedNotification" object:0];

  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"_wifiNetworkAssociationCompleted:" name:@"CBWiFiNetworkAssociationCompletedNotification" object:0];

  objc_super v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_attemptingToAssociateToOpenNetwork:" name:@"CBWiFiManagerWillAssociateToOpenNetworkNotification" object:0];

  CFStringRef v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"_presentOpenNetworkAssociationFailureAlert:" name:@"CBWiFiManagerAssociateToOpenNetworkFailedNotification" object:0];

  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_attemptingToAssociateToOpenNetwork:" name:@"CBWiFiManagerWillAssociateToEncryptedNetworkNotification" object:0];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"_startWiFiScan:" name:@"CBScreenDidUndimNotification" object:0];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"_stopWiFiScan:" name:@"CBScreenDidDimNotification" object:0];

  uint64_t v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"_deregisterNotifications" name:@"CBNetworkViewControllerDidAdvanceToNextSceneNotification" object:0];

  v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:self selector:"_deregisterNotifications" name:@"CBNetworkViewControllerWillDismissFromDoneButtonNotification" object:0];
}

- (void)_deregisterNotifications
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deregistering notifications…", v15, 2u);
  }

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"CBWiFiPowerStateDidChangeNotification" object:0];

  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"CBWiFiNetworkScanCompletedNotification" object:0];

  objc_super v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:@"CBWiFiNetworkAssociationCompletedNotification" object:0];

  objc_super v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:@"CBWiFiManagerWillAssociateToOpenNetworkNotification" object:0];

  CFStringRef v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:@"CBWiFiManagerAssociateToOpenNetworkFailedNotification" object:0];

  v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:@"CBWiFiManagerWillAssociateToEncryptedNetworkNotification" object:0];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 removeObserver:self name:@"CBScreenDidUndimNotification" object:0];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 removeObserver:self name:@"CBScreenDidDimNotification" object:0];

  uint64_t v12 = +[NSNotificationCenter defaultCenter];
  [v12 removeObserver:self name:@"CBNetworkViewControllerDidAdvanceToNextSceneNotification" object:0];

  v13 = +[NSNotificationCenter defaultCenter];
  [v13 removeObserver:self name:@"CBNetworkViewControllerWillDismissFromDoneButtonNotification" object:0];

  v14 = +[CPNetworkObserver sharedNetworkObserver];
  [v14 removeObserver:self forHostname:@"apple.com"];
}

- (void)_updatePowerState
{
  v2 = [(CBNetworkViewController *)self wifiManager];
  unsigned int v3 = [v2 isWiFiPoweredOn];

  objc_super v4 = CheckerBoardLogHandleForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      __int16 v9 = 0;
      objc_super v6 = "Wi-Fi is on";
      objc_super v7 = (uint8_t *)&v9;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if (v5)
  {
    __int16 v8 = 0;
    objc_super v6 = "Wi-Fi is off…";
    objc_super v7 = (uint8_t *)&v8;
    goto LABEL_6;
  }
}

- (void)_wifiNetworkScanCompleted
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000132D4;
  v2[3] = &unk_100079608;
  objc_copyWeak(&v3, &location);
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_wifiNetworkAssociationCompleted:(id)a3
{
  id v4 = a3;
  BOOL v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Wi-Fi network association completed notification sent", (uint8_t *)&v14, 2u);
  }

  objc_super v6 = [(CBNetworkViewController *)self otherNetworkWindow];

  if (v6)
  {
    objc_super v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dismissing Alternate Network View Controller…", (uint8_t *)&v14, 2u);
    }

    __int16 v8 = [(CBNetworkViewController *)self otherNetworkWindow];
    [v8 dismissViewControllerAnimated:1];

    [(CBNetworkViewController *)self setOtherNetworkWindow:0];
    [(CBNetworkViewController *)self _startNetworkScan];
  }
  [(CBNetworkViewController *)self _disableUIAndDisplaySpinnerBarItem];
  __int16 v9 = [v4 userInfo];

  v10 = [v9 objectForKeyedSubscript:@"CBWiFiManagerErrorKey"];
  v11 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Association completed with error (%@)", (uint8_t *)&v14, 0xCu);
  }

  if (v10)
  {
    [(CBNetworkViewController *)self _enableAndUpdateUI];
  }
  else
  {
    uint64_t v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting Wi-Fi timeout timer…", (uint8_t *)&v14, 2u);
    }

    v13 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_wifiTimeoutFired:" selector:0 userInfo:0 repeats:20.0];
    [(CBNetworkViewController *)self setWifiTimeoutTimer:v13];
  }
}

- (void)_attemptingToAssociateToOpenNetwork:(id)a3
{
  id v4 = [a3 name];
  if ([v4 isEqualToString:@"CBWiFiManagerWillAssociateToEncryptedNetworkNotification"]&& (-[CBNetworkViewController targetNetworkForBootIntent](self, "targetNetworkForBootIntent"), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_super v6 = (void *)v5;
    objc_super v7 = [(CBNetworkViewController *)self currentNetwork];
    __int16 v8 = [(CBNetworkViewController *)self targetNetworkForBootIntent];
    unsigned __int8 v9 = [v7 isEquivalentRecord:v8];

    if ((v9 & 1) == 0)
    {
      v10 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Attempting to associate to open network, but the network is encrypted and not a boot intent target. Ignoring", buf, 2u);
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  [(CBNetworkViewController *)self _disableUIAndDisplaySpinnerBarItem];
  v11 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting Wi-Fi timeout timer…", v12, 2u);
  }

  v10 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_wifiTimeoutFired:" selector:0 userInfo:0 repeats:20.0];
  [(CBNetworkViewController *)self setWifiTimeoutTimer:v10];
LABEL_10:
}

- (void)_presentOpenNetworkAssociationFailureAlert:(id)a3
{
  id v6 = [a3 userInfo];
  id v4 = [v6 objectForKeyedSubscript:@"CBNetworkInfoKey"];
  uint64_t v5 = [v4 networkName];
  [(CBNetworkViewController *)self _presentOpenNetworkAssociationFailureAlertWithNetworkName:v5];
}

- (void)_presentOpenNetworkAssociationFailureAlertWithNetworkName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presenting open network association failure alert…", buf, 2u);
  }

  id v6 = +[NSBundle mainBundle];
  objc_super v7 = [v6 localizedStringForKey:@"UNABLE_TO_JOIN_NETWORK_TITLE" value:&stru_10007A9F8 table:0];
  __int16 v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v4);

  unsigned __int8 v9 = +[UIAlertController alertControllerWithTitle:v8 message:0 preferredStyle:1];

  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"DISMISS" value:&stru_10007A9F8 table:0];
  uint64_t v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:0];
  [v9 addAction:v12];

  [(CBNetworkViewController *)self presentViewController:v9 animated:1 completion:0];
  uint64_t v13 = [(CBNetworkViewController *)self targetNetworkForBootIntent];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(CBNetworkViewController *)self currentNetwork];
    v16 = [(CBNetworkViewController *)self targetNetworkForBootIntent];
    unsigned int v17 = [v15 isEquivalentRecord:v16];

    if (v17)
    {
      [(CBNetworkViewController *)self setTargetNetworkForBootIntent:0];
      [(CBNetworkViewController *)self setCurrentNetwork:0];
      [(CBNetworkViewController *)self setCurrentNetworkState:0];
      [(CBNetworkViewController *)self reloadNetworkList];
    }
  }
}

- (void)_presentEncryptedNetworkAssociationScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presenting (Enter the password) network scene…", v8, 2u);
  }

  id v6 = [v4 userInfo];

  objc_super v7 = [v6 objectForKeyedSubscript:@"CBNetworkInfoKey"];
  [(CBNetworkViewController *)self _presentAlternateNetworkViewControllerWithInfo:v7];
}

- (void)_presentExitDiagnosticsAlert
{
  v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Exit Diagnostics] button tapped", v4, 2u);
  }

  id v3 = +[CBAlertManager sharedInstance];
  [v3 showExitConfirmationWithCompletion:0 response:&stru_100079940];
}

- (void)_startWiFiScan:(id)a3
{
  if ([(CBNetworkViewController *)self networkViewControllerVisible])
  {
    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Screen undimmed. Starting Wi-Fi scan…", v5, 2u);
    }

    [(CBNetworkViewController *)self _startNetworkScan];
  }
}

- (void)_stopWiFiScan:(id)a3
{
  if ([(CBNetworkViewController *)self networkViewControllerVisible])
  {
    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Screen dimmed. Stopping Wi-Fi scan…", v5, 2u);
    }

    [(CBNetworkViewController *)self _stopNetworkScan];
  }
}

- (void)_reachabilityChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:CPNetworkObserverReachable];
  -[CBNetworkViewController setNetworkReachable:](self, "setNetworkReachable:", [v6 BOOLValue]);

  objc_super v7 = [v4 userInfo];

  __int16 v8 = [v7 objectForKeyedSubscript:CPNetworkObserverReachableFlags];

  id v9 = v8;
  unsigned int v10 = *(_DWORD *)[v9 bytes];
  v11 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109376;
    v15[1] = [(CBNetworkViewController *)self networkReachable];
    __int16 v16 = 1024;
    BOOL v17 = ((v10 >> 18) & 1) == 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Network reachability changed (%d) and is connected over Wi-Fi (%d)", (uint8_t *)v15, 0xEu);
  }

  if ([(CBNetworkViewController *)self networkReachable])
  {
    uint64_t v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Network became reachable", (uint8_t *)v15, 2u);
    }

    uint64_t v13 = [(CBNetworkViewController *)self wifiTimeoutTimer];

    if (v13)
    {
      int v14 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Wi-Fi timeout timer exists…", (uint8_t *)v15, 2u);
      }

      [(CBNetworkViewController *)self _stopWiFiTimeroutTimer];
      [(CBNetworkViewController *)self _enableAndUpdateUI];
      [(CBNetworkViewController *)self autoAdvanceToNextScene];
    }
  }
  else
  {
    [(CBNetworkViewController *)self reevaluateNetworkList];
  }
}

- (void)updateNetworkList
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating the network list…", buf, 2u);
  }

  id v4 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v5 = dispatch_get_global_queue(0, 0);
  objc_super v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_100013FF0;
  unsigned int v10 = &unk_1000795E0;
  v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(v5, &v7);

  [(CBNetworkViewController *)self reloadNetworkList];
}

- (void)reloadNetworkList
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reloading the network list…", v4, 2u);
  }

  [(CBNetworkViewController *)self refresh];
}

- (void)reevaluateNetworkList
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Wi-Fi pane reevaluating network list", v4, 2u);
  }

  [(CBNetworkViewController *)self reloadNetworkList];
  [(CBNetworkViewController *)self setContinueButtonAvailable];
  [(CBNetworkViewController *)self enableContinueButton:[(CBNetworkViewController *)self networkReachable]];
}

- (void)_disableUIAndDisplaySpinnerBarItem
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Disabling UI…", v5, 2u);
  }

  [(CBNetworkViewController *)self disableBackButton];
  id v4 = [(CBNetworkViewController *)self tableView];
  [v4 setUserInteractionEnabled:0];

  [(CBNetworkViewController *)self setNetworkConnectionInProgress:1];
  [(CBNetworkViewController *)self setContinueButtonBusy];
}

- (void)_enableAndUpdateUI
{
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Enabling and updating UI…", v5, 2u);
  }

  [(CBNetworkViewController *)self enableBackButton];
  id v4 = [(CBNetworkViewController *)self tableView];
  [v4 setUserInteractionEnabled:1];

  [(CBNetworkViewController *)self setNetworkConnectionInProgress:0];
  [(CBNetworkViewController *)self reevaluateNetworkList];
}

- (void)setContinueButtonBusy
{
  if ([(CBNetworkViewController *)self isPresentedForSetupFlow])
  {
    id v3 = [(CBNetworkViewController *)self continueButton];

    if (v3)
    {
      id v4 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting continue button to busy", v6, 2u);
      }

      uint64_t v5 = [(CBNetworkViewController *)self continueButton];
      [v5 showsBusyIndicator];
    }
  }
}

- (void)setContinueButtonAvailable
{
  if ([(CBNetworkViewController *)self isPresentedForSetupFlow])
  {
    id v3 = [(CBNetworkViewController *)self continueButton];

    if (v3)
    {
      id v4 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting continue button to not busy", v6, 2u);
      }

      uint64_t v5 = [(CBNetworkViewController *)self continueButton];
      [v5 hidesBusyIndicator];
    }
  }
}

- (void)enableContinueButton:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CBNetworkViewController *)self isPresentedForSetupFlow])
  {
    uint64_t v5 = [(CBNetworkViewController *)self continueButton];

    if (v5)
    {
      id v6 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v7 = @"disabled";
        if (v3) {
          CFStringRef v7 = @"enabled";
        }
        int v9 = 138412290;
        CFStringRef v10 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Continue button is %@", (uint8_t *)&v9, 0xCu);
      }

      uint64_t v8 = [(CBNetworkViewController *)self continueButton];
      [v8 setEnabled:v3];
    }
  }
}

- (void)_presentAlternateNetworkViewControllerWithInfo:(id)a3
{
}

- (void)_presentAlternateNetworkViewControllerWithInfo:(id)a3 password:(id)a4 ssid:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v14 = [[CBAlternateNetworkViewController alloc] initWithScanResult:v10 prepopulatedPassword:v9 prepopulatedSSID:v8];

  [(CBNetworkViewController *)self _stopNetworkScan];
  id v11 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v14];
  id v12 = +[CBWindowManager sharedInstance];
  uint64_t v13 = [v12 presentViewController:v11 onLayer:2 backgroundTunnel:0 statusBarVisible:1 animated:1 completion:&stru_100079960];
  [(CBNetworkViewController *)self setOtherNetworkWindow:v13];
}

- (void)_presentWiFiNetworkTimeoutAlert
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Presenting Wi-Fi timeout alert…", v15, 2u);
  }

  int v4 = MGGetBoolAnswer();
  uint64_t v5 = +[NSBundle mainBundle];
  id v6 = v5;
  if (v4) {
    CFStringRef v7 = @"NO_NETWORK_CONNECTION_MESSAGE_WLAN";
  }
  else {
    CFStringRef v7 = @"NO_NETWORK_CONNECTION_MESSAGE_WIFI";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_10007A9F8 table:0];

  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"NO_NETWORK_CONNECTION_TITLE" value:&stru_10007A9F8 table:0];
  id v11 = +[UIAlertController alertControllerWithTitle:v10 message:v8 preferredStyle:1];

  id v12 = +[NSBundle mainBundle];
  uint64_t v13 = [v12 localizedStringForKey:@"OK" value:&stru_10007A9F8 table:0];
  int v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];
  [v11 addAction:v14];

  [(CBNetworkViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)_wifiTimeoutFired:(id)a3
{
  int v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi timeout fired…", v5, 2u);
  }

  [(CBNetworkViewController *)self _stopWiFiTimeroutTimer];
  [(CBNetworkViewController *)self _enableAndUpdateUI];
  [(CBNetworkViewController *)self _presentWiFiNetworkTimeoutAlert];
}

- (void)_stopWiFiTimeroutTimer
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating Wi-Fi timeout timer…", v5, 2u);
  }

  int v4 = [(CBNetworkViewController *)self wifiTimeoutTimer];
  [v4 invalidate];

  [(CBNetworkViewController *)self setWifiTimeoutTimer:0];
}

- (void)autoAdvanceToNextScene
{
  if ([(CBNetworkViewController *)self isPresentedForSetupFlow])
  {
    BOOL v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Auto advancing to next pane", v4, 2u);
    }

    [(CBNetworkViewController *)self continueTapped];
  }
}

- (void)continueTapped
{
  BOOL v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Continue] button tapped", v11, 2u);
  }

  int v4 = [(CBNetworkViewController *)self currentNetwork];
  uint64_t v5 = [(CBNetworkViewController *)self targetNetworkForBootIntent];
  if ([v4 isEquivalentRecord:v5])
  {
    unsigned __int8 v6 = [(CBNetworkViewController *)self networkReachable];

    if ((v6 & 1) == 0)
    {
      CFStringRef v7 = [(CBNetworkViewController *)self targetNetworkForBootIntent];
      [(CBNetworkViewController *)self networkListViewController:self didTapRecord:v7];
      goto LABEL_9;
    }
  }
  else
  {
  }
  CFStringRef v7 = objc_alloc_init(CBEndgameViewController);
  id v8 = [(CBNetworkViewController *)self navigationController];
  [v8 pushViewController:v7 animated:1];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 postNotificationName:@"CBNetworkViewControllerDidAdvanceToNextSceneNotification" object:0];

  id v10 = [(CBNetworkViewController *)self targetNetworkForBootIntent];

  if (v10) {
    [(CBNetworkViewController *)self setTargetNetworkForBootIntent:0];
  }
LABEL_9:
}

- (void)doneTapped
{
  v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[Done] button tapped", v4, 2u);
  }

  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"CBNetworkViewControllerWillDismissFromDoneButtonNotification" object:0];
}

- (void)networkListViewController:(id)a3 didTapRecord:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if ([v6 isBootIntentRecord]) {
      goto LABEL_5;
    }
    uint64_t v7 = [(CBNetworkViewController *)self targetNetworkForBootIntent];
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = [(CBNetworkViewController *)self targetNetworkForBootIntent];
      unsigned int v10 = [v6 isEquivalentRecord:v9];

      if (v10)
      {
LABEL_5:
        id v11 = [(CBNetworkViewController *)self bootIntentManager];
        id v12 = [v11 bootIntentWifiSSID];

        uint64_t v13 = [(CBNetworkViewController *)self bootIntentManager];
        int v14 = [v13 bootIntentWifiPassword];

        v15 = [(CBNetworkViewController *)self wifiManager];
        __int16 v16 = v15;
        if (v14) {
          [v15 associateToHiddenEncryptedNetworkWithName:v12 password:v14];
        }
        else {
          [v15 associateToHiddenUnencryptedNetworkWithName:v12];
        }

        goto LABEL_16;
      }
    }
    if (![v6 isSecure])
    {
      id v12 = [(CBNetworkViewController *)self wifiManager];
      v18 = [v6 ssid];
      [v12 associateToHiddenUnencryptedNetworkWithName:v18];

      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v6 scanResult];
      [(CBNetworkViewController *)self _presentAlternateNetworkViewControllerWithInfo:v12];
LABEL_16:
    }
  }
  else
  {
    BOOL v17 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100048DA0(v17);
    }

    id v6 = [v5 title];
    [(CBNetworkViewController *)self _presentOpenNetworkAssociationFailureAlertWithNetworkName:v6];
  }
}

- (void)networkListViewControllerDidTapOtherNetwork:(id)a3
{
  int v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Choose Another Network] button tapped", v5, 2u);
  }

  [(CBNetworkViewController *)self _presentAlternateNetworkViewControllerWithInfo:0];
}

- (BOOL)networkListViewControllerCurrentPowerState:(id)a3
{
  return 1;
}

- (unint64_t)networkListViewControllerCurrentPowerStateToggle:(id)a3
{
  return 1;
}

- (BOOL)networkListViewControllerWAPIEnabled:(id)a3
{
  return MGGetBoolAnswer();
}

- (BOOL)networkListViewControllerNetworkRestrictionActive:(id)a3
{
  return 0;
}

- (BOOL)networkListViewControllerLockdownModeActive:(id)a3
{
  return 0;
}

- (int64_t)networkListViewControllerAutoInstantHotspotOption:(id)a3
{
  return 0;
}

- (BOOL)networkListViewControllerPowerModificationDisabled:(id)a3
{
  return 0;
}

- (BOOL)networkListViewControllerIsManagedAppleID:(id)a3
{
  return 0;
}

- (BOOL)networkListViewControllerIsAutoUnlockEnabled:(id)a3
{
  return 0;
}

- (void)backButtonTapped:(id)a3
{
  id v4 = [(CBNetworkViewController *)self navigationController];
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)disableBackButton
{
  id v3 = [(CBNetworkViewController *)self navigationItem];
  v2 = [v3 leftBarButtonItem];
  [v2 setEnabled:0];
}

- (void)enableBackButton
{
  id v3 = [(CBNetworkViewController *)self navigationItem];
  v2 = [v3 leftBarButtonItem];
  [v2 setEnabled:1];
}

- (void)hideBackButton
{
  id v3 = [(CBNetworkViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:0];

  id v4 = [(CBNetworkViewController *)self navigationItem];
  [v4 setHidesBackButton:1];
}

- (void)showBackButton
{
  id v4 = [(CBNetworkViewController *)self customBackButton];
  id v3 = [(CBNetworkViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:v4];
}

- (CBWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
}

- (CBWindow)otherNetworkWindow
{
  return self->_otherNetworkWindow;
}

- (void)setOtherNetworkWindow:(id)a3
{
}

- (BOOL)isPresentedForSetupFlow
{
  return self->_isPresentedForSetupFlow;
}

- (void)setIsPresentedForSetupFlow:(BOOL)a3
{
  self->_BOOL isPresentedForSetupFlow = a3;
}

- (BOOL)networkViewControllerVisible
{
  return self->_networkViewControllerVisible;
}

- (void)setNetworkViewControllerVisible:(BOOL)a3
{
  self->_networkViewControllerVisible = a3;
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  self->_continueButton = (OBTrayButton *)a3;
}

- (UIBarButtonItem)customBackButton
{
  return self->_customBackButton;
}

- (void)setCustomBackButton:(id)a3
{
}

- (NSTimer)wifiTimeoutTimer
{
  return self->_wifiTimeoutTimer;
}

- (void)setWifiTimeoutTimer:(id)a3
{
}

- (BOOL)networkReachable
{
  return self->_networkReachable;
}

- (void)setNetworkReachable:(BOOL)a3
{
  self->_networkReachable = a3;
}

- (CBBootIntentManager)bootIntentManager
{
  return self->_bootIntentManager;
}

- (void)setBootIntentManager:(id)a3
{
}

- (CBNetworkListRecord)targetNetworkForBootIntent
{
  return self->_targetNetworkForBootIntent;
}

- (void)setTargetNetworkForBootIntent:(id)a3
{
}

- (BOOL)networkConnectionInProgress
{
  return self->_networkConnectionInProgress;
}

- (void)setNetworkConnectionInProgress:(BOOL)a3
{
  self->_networkConnectionInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNetworkForBootIntent, 0);
  objc_storeStrong((id *)&self->_bootIntentManager, 0);
  objc_storeStrong((id *)&self->_wifiTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_customBackButton, 0);
  objc_storeStrong((id *)&self->_otherNetworkWindow, 0);

  objc_storeStrong((id *)&self->_wifiManager, 0);
}

@end