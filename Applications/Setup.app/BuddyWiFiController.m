@interface BuddyWiFiController
+ (BOOL)controllerAffectedByTapFreeSetup;
+ (BOOL)isTrailingWithEnvironment:(id)a3;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)preheat;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerNeedsToRun;
- (BOOL)preventNextButtonCreation;
- (BOOL)showNetworkSettings;
- (BOOL)supportsCellularActivation;
- (BOOL)willPush;
- (BuddyMiscState)miscState;
- (BuddyNetworkProvider)networkProvider;
- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController;
- (BuddyWiFiController)init;
- (DMCReturnToServiceController)mdmReturnToServiceController;
- (NSTimer)rtsTimeoutTimer;
- (OBAnimationController)animationController;
- (ProximitySetupController)proximitySetupController;
- (id)_createAnimationController;
- (id)showModalWiFiSettingsBlock;
- (id)viewController;
- (void)_clearReturnToServiceTimer;
- (void)_clearWifiTimeoutTimer;
- (void)_confirmThenFlowItemDoneWithResetActivationMethod:(BOOL)a3;
- (void)_flowItemDone;
- (void)_flowItemDoneWithResetActivationMethod:(BOOL)a3;
- (void)_nextTapped:(id)a3;
- (void)_resetWifiControllerTimeoutSpinner;
- (void)_showNavBarSpinner;
- (void)_startReturnToServiceTimer;
- (void)_updateActivationMethod;
- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4;
- (void)buddyViewControllerDidPressAlternateSetupButton:(id)a3;
- (void)controllerWasPopped;
- (void)controllerWillNotRun;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6;
- (void)reachabilityChanged:(BOOL)a3;
- (void)setAnimationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMdmReturnToServiceController:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPreventNextButtonCreation:(BOOL)a3;
- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRtsTimeoutTimer:(id)a3;
- (void)setShowModalWiFiSettingsBlock:(id)a3;
- (void)setShowNetworkSettings:(BOOL)a3;
- (void)setSupportsCellularActivation:(BOOL)a3;
- (void)setWillPush:(BOOL)a3;
- (void)startScanningIfNecessary;
- (void)stopScanning;
- (void)updateNextButton;
- (void)wifiNetworkJoinFinished:(id)a3;
- (void)wifiTimeoutFired:(id)a3;
@end

@implementation BuddyWiFiController

+ (void)preheat
{
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyWiFiController *)self networkProvider];
  unsigned __int8 v3 = [(BuddyNetworkProvider *)v2 connectedOverWiFiAndNetworkReachable];
  char v6 = 0;
  unsigned __int8 v4 = 0;
  if ((v3 & 1) == 0)
  {
    v7 = [(BuddyWiFiController *)self networkProvider];
    char v6 = 1;
    unsigned __int8 v4 = [(BuddyNetworkProvider *)v7 supportsWiFi];
  }
  char v9 = v4 & 1;
  if (v6) {

  }
  return v9 & 1;
}

- (void)controllerWillNotRun
{
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipWiFi;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

+ (BOOL)isTrailingWithEnvironment:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] proximitySetupController];
  unsigned __int8 v4 = [v3 hasAppliedSettings];

  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BuddyWiFiController)init
{
  SEL v18 = a2;
  id location = 0;
  v17.receiver = self;
  v17.super_class = (Class)BuddyWiFiController;
  v2 = [(BuddyWiFiController *)&v17 init];
  id location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    id v3 = +[BuddyActivationConfiguration currentConfiguration];
    [v3 addDelegate:location];

    id v4 = objc_alloc_init((Class)sub_1001CD318());
    v5 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v4;

    [*((id *)location + 1) setBuddyDelegate:location];
    [*((id *)location + 1) setShowNetworkSettings:0];
    char v6 = (void *)*((void *)location + 1);
    id v7 = +[BuddyActivationConfiguration currentConfiguration];
    objc_msgSend(v6, "setSupportsCellularActivation:", (unint64_t)objc_msgSend(v7, "supportsCellularActivation") & 1);

    id v8 = [location _createAnimationController];
    [location setAnimationController:v8];

    char v9 = +[NSNotificationCenter defaultCenter];
    id v10 = location;
    id v11 = sub_1001CD430();
    [(NSNotificationCenter *)v9 addObserver:v10 selector:"wifiNetworkJoinFinished:" name:v11 object:0];

    id v12 = objc_alloc((Class)sub_1001CD53C());
    id v13 = [v12 initWithViewController:*((void *)location + 1)];
    v14 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v13;
  }
  v15 = (BuddyWiFiController *)location;
  objc_storeStrong(&location, 0);
  return v15;
}

- (void)startScanningIfNecessary
{
  id v7 = self;
  oslog[1] = (os_log_t)a2;
  if ([(BuddyWiFiController *)self controllerNeedsToRun])
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = oslog[0];
      os_log_type_t v3 = v5;
      sub_10004B24C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Starting early Wi-Fi pane scan..", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    [(WFNetworkListController *)v7->_wifiManager startScanning];
  }
}

- (void)stopScanning
{
  id v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Stopping Wi-Fi pane scan..", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(WFNetworkListController *)v7->_wifiManager stopScanning];
}

- (id)viewController
{
  return self->_viewController;
}

- (void)setNavigationController:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v7->_navigationController);
  BOOL v4 = WeakRetained == 0;

  if (v4)
  {
    objc_storeWeak((id *)&v7->_navigationController, location[0]);
    id v5 = objc_loadWeakRetained((id *)&v7->_navigationController);
    [v5 addDelegateObserver:v7];
  }
  objc_storeStrong(location, 0);
}

- (void)controllerWasPopped
{
  v2 = [(BuddyWiFiController *)self miscState];
  [(BuddyMiscState *)v2 setUserSkippedWiFi:0];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  int64_t v25 = a5;
  BOOL v24 = a6;
  if (v26 == v28->_viewController || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(BuddyWiFiController *)v28 setWillPush:0];
    [(BuddyWiFiController *)v28 setPreventNextButtonCreation:0];
    [(BuddyWiFiController *)v28 updateNextButton];
    id v10 = [(BuddyWiFiController *)v28 proximitySetupController];
    unsigned __int8 v11 = [(ProximitySetupController *)v10 hasConnection];

    if (v11)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = oslog;
        os_log_type_t v13 = v21;
        sub_10004B24C(v20);
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Skipping beginning advertising for device enrollment; we're already performing proximity setup",
          (uint8_t *)v20,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    else
    {
      v14 = [(BuddyWiFiController *)v28 proximityAutomatedDeviceEnrollmentController];
      [(BuddyProximityAutomatedDeviceEnrollmentController *)v14 beginAdvertising];
    }
    [(WFNetworkListController *)v28->_wifiManager startScanning];
    if (v25 == 1)
    {
      [(BuddyWiFiController *)v28 _updateActivationMethod];
      v15 = [(BuddyWiFiController *)v28 animationController];

      if (v15)
      {
        id v16 = [(BuddyWiFiController *)v28 _createAnimationController];
        [(BuddyWiFiController *)v28 setAnimationController:v16];
      }
      objc_super v17 = [(BuddyWiFiController *)v28 animationController];
      [(OBAnimationController *)v17 startAnimation];

      SEL v18 = [(BuddyWiFiController *)v28 mdmReturnToServiceController];
      unsigned __int8 v19 = [(DMCReturnToServiceController *)v18 shouldDoReturnToService];

      if (v19) {
        [(BuddyWiFiController *)v28 _startReturnToServiceTimer];
      }
    }
    int v23 = 0;
  }
  else
  {
    char v9 = [(BuddyWiFiController *)v28 proximityAutomatedDeviceEnrollmentController];
    [(BuddyProximityAutomatedDeviceEnrollmentController *)v9 endAdvertising];

    int v23 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (id)_createAnimationController
{
  return [(WFBuddyViewController *)self->_viewController buddy_animationController:@"WIFI", a2, self];
}

- (void)setShowNetworkSettings:(BOOL)a3
{
}

- (void)_flowItemDone
{
}

- (void)_flowItemDoneWithResetActivationMethod:(BOOL)a3
{
  if (![(BuddyWiFiController *)self willPush])
  {
    if (a3)
    {
      os_log_type_t v3 = [(BuddyWiFiController *)self miscState];
      [(BuddyMiscState *)v3 setUserSelectedCellularActivation:0];

      BOOL v4 = [(BuddyWiFiController *)self miscState];
      [(BuddyMiscState *)v4 setUserSelectedTetheredActivation:0];
    }
    else
    {
      BOOL v4 = (BuddyMiscState *)+[BuddyActivationConfiguration currentConfiguration];
      unsigned __int8 v5 = [(BuddyMiscState *)v4 supportsCellularActivation];
      char v6 = [(BuddyWiFiController *)self miscState];
      [(BuddyMiscState *)v6 setUserSelectedCellularActivation:v5 & 1];
    }
    [(BuddyWiFiController *)self setWillPush:1];
    id v7 = [(BuddyWiFiController *)self viewController];
    id v8 = [v7 navigationController];
    char v9 = (WFBuddyViewController *)[v8 topViewController];
    viewController = self->_viewController;

    if (v9 == viewController)
    {
      unsigned __int8 v11 = [(BuddyWiFiController *)self delegate];
      [(BFFFlowItemDelegate *)v11 flowItemDone:self];
    }
    [(BuddyWiFiController *)self stopScanning];
  }
}

- (void)_confirmThenFlowItemDoneWithResetActivationMethod:(BOOL)a3
{
  v22 = self;
  SEL v21 = a2;
  BOOL v20 = a3;
  os_log_type_t v3 = [(BuddyWiFiController *)self networkProvider];
  char v4 = ![(BuddyNetworkProvider *)v3 networkReachable];

  if (v4)
  {
    id location = +[BuddySkipWiFiAlertController alertController];
    id v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_1001CDF6C;
    id v16 = &unk_1002B1130;
    objc_super v17 = v22;
    BOOL v18 = v20;
    [location setSkipWiFi:&v12];
    char v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    char v9 = sub_1001CDFD8;
    id v10 = &unk_1002B0D20;
    unsigned __int8 v11 = v22;
    [location setUseWiFi:&v6];
    id v5 = [(BuddyWiFiController *)v22 viewController];
    [v5 presentViewController:location animated:1 completion:0];

    objc_storeStrong((id *)&v11, 0);
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    [(BuddyWiFiController *)v22 _flowItemDoneWithResetActivationMethod:v20];
  }
}

- (void)_nextTapped:(id)a3
{
  int v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v3 = [(BuddyWiFiController *)v13 networkProvider];
  BOOL v4 = 0;
  if (![(BuddyNetworkProvider *)v3 networkReachable]) {
    BOOL v4 = v13->_wifiTimeoutTimer != 0;
  }

  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = oslog;
      os_log_type_t v6 = v10;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Waiting for Wi-Fi Network", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v7 = [(BuddyWiFiController *)v13 viewController];
    id v8 = [v7 view];
    [v8 setUserInteractionEnabled:0];

    [(BuddyWiFiController *)v13 _showNavBarSpinner];
  }
  else
  {
    [(BuddyWiFiController *)v13 _confirmThenFlowItemDoneWithResetActivationMethod:1];
  }
  objc_storeStrong(location, 0);
}

- (void)reachabilityChanged:(BOOL)a3
{
  if (a3)
  {
    if (self->_showingWifiTimeoutSpinner)
    {
      [(BuddyWiFiController *)self setPreventNextButtonCreation:1];
      [(BuddyWiFiController *)self _clearWifiTimeoutTimer];
      [(BuddyWiFiController *)self _resetWifiControllerTimeoutSpinner];
      [(BuddyWiFiController *)self _flowItemDone];
    }
    else
    {
      os_log_type_t v3 = [(BuddyWiFiController *)self mdmReturnToServiceController];
      unsigned __int8 v4 = 1;
      if (([(DMCReturnToServiceController *)v3 shouldDoReturnToService] & 1) == 0)
      {
        unsigned __int8 v4 = 0;
        if (+[DMCMultiUserModeUtilities inSharediPadUserSession](DMCMultiUserModeUtilities, "inSharediPadUserSession"))unsigned __int8 v4 = +[DMCMultiUserModeUtilities awaitUserConfigurationEnabled]; {
      }
        }

      if (v4) {
        [(BuddyWiFiController *)self _flowItemDone];
      }
    }
    [(BuddyWiFiController *)self _clearReturnToServiceTimer];
  }
  [(BuddyWiFiController *)self updateNextButton];
  id v5 = [(BuddyWiFiController *)self viewController];
  id v6 = [v5 navigationController];
  id v7 = [v6 topViewController];
  id v8 = (UIAlertController *)[v7 presentedViewController];
  BOOL v9 = v8 == self->_badWifiAlert;

  os_log_type_t v10 = [(BuddyWiFiController *)self networkProvider];
  BOOL v11 = 0;
  if ([(BuddyNetworkProvider *)v10 connectedOverWiFiAndNetworkReachable]) {
    BOOL v11 = v9;
  }

  if (v11)
  {
    [(UIAlertController *)self->_badWifiAlert dismissViewControllerAnimated:1 completion:0];
    objc_storeStrong((id *)&self->_badWifiAlert, 0);
  }
}

- (void)updateNextButton
{
  BOOL v9 = self;
  v8[1] = (id)a2;
  v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_1001CE404;
  id v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)_showNavBarSpinner
{
  if (!self->_showingWifiTimeoutSpinner)
  {
    id v2 = [(BuddyWiFiController *)self viewController];
    +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v2 identifier:@"WifiSpinner"];

    self->_showingWifiTimeoutSpinner = 1;
  }
}

- (void)_resetWifiControllerTimeoutSpinner
{
  if (self->_showingWifiTimeoutSpinner)
  {
    id v2 = [(BuddyWiFiController *)self viewController];
    id v3 = [v2 view];
    [v3 setUserInteractionEnabled:1];

    self->_showingWifiTimeoutSpinner = 0;
    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:@"WifiSpinner"];
    [(BuddyWiFiController *)self updateNextButton];
  }
}

- (void)wifiNetworkJoinFinished:(id)a3
{
  BOOL v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] userInfo];
  id v4 = sub_1001CEC44();
  id v22 = [v3 objectForKey:v4];

  if (v22)
  {
    os_log_t v18 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      char v16 = 0;
      char v14 = 0;
      if (_BYIsInternalInstall())
      {
        int v13 = (NSString *)v22;
      }
      else
      {
        id v17 = [v22 domain];
        char v16 = 1;
        int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v17, [v22 code]);
        v15 = v13;
        char v14 = 1;
      }
      sub_10004BB7C((uint64_t)v25, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "WiFi Join Failed: %{public}@", v25, 0xCu);
      if (v14) {

      }
      if (v16) {
    }
      }
    objc_storeStrong((id *)&v18, 0);
    [(BuddyWiFiController *)v24 _clearWifiTimeoutTimer];
    [(BuddyWiFiController *)v24 _resetWifiControllerTimeoutSpinner];
  }
  else
  {
    int v5 = [(BuddyWiFiController *)v24 networkProvider];
    unsigned __int8 v6 = [(BuddyNetworkProvider *)v5 networkReachable];

    if (v6)
    {
      [(BuddyWiFiController *)v24 _flowItemDone];
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      char v20 = 2;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        id v7 = oslog;
        os_log_type_t v8 = v20;
        sub_10004B24C(buf);
        _os_log_debug_impl((void *)&_mh_execute_header, v7, v8, "WiFi network joined, waiting for reachability notification", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      [(BuddyWiFiController *)v24 _clearWifiTimeoutTimer];
      BOOL v9 = +[NSTimer scheduledTimerWithTimeInterval:v24 target:"wifiTimeoutFired:" selector:0 userInfo:0 repeats:20.0];
      wifiTimeoutTimer = v24->_wifiTimeoutTimer;
      v24->_wifiTimeoutTimer = v9;

      id v11 = [(BuddyWiFiController *)v24 viewController];
      id v12 = [v11 view];
      [v12 setUserInteractionEnabled:0];

      [(BuddyWiFiController *)v24 _showNavBarSpinner];
    }
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)_clearWifiTimeoutTimer
{
}

- (void)wifiTimeoutFired:(id)a3
{
  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyWiFiController *)v55 _clearWifiTimeoutTimer];
  BOOL showingWifiTimeoutSpinner = 0;
  BOOL showingWifiTimeoutSpinner = v55->_showingWifiTimeoutSpinner;
  [(BuddyWiFiController *)v55 _resetWifiControllerTimeoutSpinner];
  id v3 = [(BuddyWiFiController *)v55 viewController];
  id v4 = [v3 navigationController];
  int v5 = (WFBuddyViewController *)[v4 topViewController];
  viewController = v55->_viewController;
  char v51 = 0;
  char v49 = 0;
  char v47 = 0;
  BOOL v7 = 1;
  if (v5 == viewController)
  {
    id v52 = [(BuddyWiFiController *)v55 viewController];
    char v51 = 1;
    id v50 = [v52 navigationController];
    char v49 = 1;
    id v48 = [v50 presentedViewController];
    char v47 = 1;
    BOOL v7 = v48 != 0;
  }
  if (v47) {

  }
  if (v49) {
  if (v51)
  }

  if (v7)
  {
    int v46 = 1;
  }
  else
  {
    os_log_type_t v8 = [(BuddyWiFiController *)v55 networkProvider];
    unsigned __int8 v9 = [(BuddyNetworkProvider *)v8 connectedOverWiFiAndNetworkReachable];

    if (v9)
    {
      int v46 = 1;
    }
    else
    {
      id v10 = +[BuddyActivationConfiguration currentConfiguration];
      BOOL v11 = 0;
      if (!v10) {
        BOOL v11 = !showingWifiTimeoutSpinner;
      }

      if (v11)
      {
        int v46 = 1;
      }
      else
      {
        int out_token = 0;
        uint64_t state64 = 0;
        if (!notify_register_check("com.apple.springboard.remoteSheetActive", &out_token)) {
          notify_get_state(out_token, &state64);
        }
        if (state64 == 1)
        {
          int v46 = 1;
        }
        else
        {
          [(BuddyWiFiController *)v55 updateNextButton];
          os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = oslog;
            os_log_type_t v13 = v42;
            sub_10004B24C(buf);
            _os_log_impl((void *)&_mh_execute_header, v12, v13, "Showing WiFi Timeout Alert", buf, 2u);
          }
          objc_storeStrong((id *)&oslog, 0);
          char v14 = +[NSBundle mainBundle];
          v15 = [(NSBundle *)v14 localizedStringForKey:@"NO_NETWORK_CONNECTION_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
          char v16 = +[NSBundle mainBundle];
          id v17 = (id)SFLocalizableWAPIStringKeyForKey();
          os_log_t v18 = [(NSBundle *)v16 localizedStringForKey:v17 value:&stru_1002B4E18 table:@"Localizable"];
          unsigned __int8 v19 = +[UIAlertController alertControllerWithTitle:v15 message:v18 preferredStyle:1];
          badWifiAlert = v55->_badWifiAlert;
          v55->_badWifiAlert = v19;

          SEL v21 = v55->_badWifiAlert;
          id v22 = +[NSBundle mainBundle];
          int v23 = [(NSBundle *)v22 localizedStringForKey:@"NO_NETWORK_CONNECTION_SETTINGS" value:&stru_1002B4E18 table:@"Localizable"];
          v35 = _NSConcreteStackBlock;
          int v36 = -1073741824;
          int v37 = 0;
          v38 = sub_1001CF3D0;
          v39 = &unk_1002B1040;
          v40 = v55;
          BOOL v24 = +[UIAlertAction actionWithTitle:v23 style:1 handler:&v35];
          [(UIAlertController *)v21 addAction:v24];

          int64_t v25 = v55->_badWifiAlert;
          id v26 = +[NSBundle mainBundle];
          v27 = [(NSBundle *)v26 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
          v30 = _NSConcreteStackBlock;
          uint64_t v31 = 3221225472;
          v32 = sub_1001CF454;
          v33 = &unk_1002B1040;
          v34 = v55;
          v28 = +[UIAlertAction actionWithTitle:v27 style:0 handler:&v30];
          -[UIAlertController addAction:](v25, "addAction:", v28, v30, v31, v32, v33);

          id v29 = [(BuddyWiFiController *)v55 viewController];
          [v29 presentViewController:v55->_badWifiAlert animated:1 completion:0];

          objc_storeStrong((id *)&v34, 0);
          objc_storeStrong((id *)&v40, 0);
          int v46 = 0;
        }
      }
    }
  }
  objc_storeStrong(location, 0);
}

- (void)_startReturnToServiceTimer
{
  os_log_type_t v13 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = location[0];
    os_log_type_t v3 = v11;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Return to Service: Waiting 30 seconds for any network...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  unsigned __int8 v6 = sub_1001CF5FC;
  BOOL v7 = &unk_1002B2528;
  os_log_type_t v8 = v13;
  id v9 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v4 block:30.0];
  -[BuddyWiFiController setRtsTimeoutTimer:](v13, "setRtsTimeoutTimer:", v9, v4, v5, v6, v7);
  objc_storeStrong(&v9, 0);
  objc_storeStrong((id *)&v8, 0);
}

- (void)_clearReturnToServiceTimer
{
  id v2 = [(BuddyWiFiController *)self rtsTimeoutTimer];
  [(NSTimer *)v2 invalidate];

  [(BuddyWiFiController *)self setRtsTimeoutTimer:0];
}

- (void)_updateActivationMethod
{
  id v2 = +[BuddyActivationConfiguration currentConfiguration];
  unsigned __int8 v3 = [v2 supportsCellularActivation];

  [(WFBuddyViewController *)self->_viewController setSupportsCellularActivation:v3 & 1];
}

- (void)buddyViewControllerDidPressAlternateSetupButton:(id)a3
{
  unsigned __int8 v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v3 = [(WFBuddyViewController *)v6->_viewController supportsCellularActivation] ^ 1;
  id v4 = [(BuddyWiFiController *)v6 miscState];
  [(BuddyMiscState *)v4 setUserSelectedTetheredActivation:v3 & 1];

  [(BuddyWiFiController *)v6 _confirmThenFlowItemDoneWithResetActivationMethod:0];
  objc_storeStrong(location, 0);
}

- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4
{
  char v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  BOOL v11 = a4;
  id v4 = &_dispatch_main_q;
  uint64_t v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = sub_1001CF9C4;
  id v9 = &unk_1002B0D20;
  id v10 = v14;
  dispatch_async((dispatch_queue_t)v4, &v5);

  objc_storeStrong((id *)&v10, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showNetworkSettings
{
  return self->_showNetworkSettings;
}

- (BOOL)supportsCellularActivation
{
  return self->_supportsCellularActivation;
}

- (void)setSupportsCellularActivation:(BOOL)a3
{
  self->_supportsCellularActivation = a3;
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyProximityAutomatedDeviceEnrollmentController)proximityAutomatedDeviceEnrollmentController
{
  return self->_proximityAutomatedDeviceEnrollmentController;
}

- (void)setProximityAutomatedDeviceEnrollmentController:(id)a3
{
}

- (id)showModalWiFiSettingsBlock
{
  return self->_showModalWiFiSettingsBlock;
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
}

- (DMCReturnToServiceController)mdmReturnToServiceController
{
  return self->_mdmReturnToServiceController;
}

- (void)setMdmReturnToServiceController:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (BOOL)willPush
{
  return self->_willPush;
}

- (void)setWillPush:(BOOL)a3
{
  self->_willPush = a3;
}

- (BOOL)preventNextButtonCreation
{
  return self->_preventNextButtonCreation;
}

- (void)setPreventNextButtonCreation:(BOOL)a3
{
  self->_preventNextButtonCreation = a3;
}

- (NSTimer)rtsTimeoutTimer
{
  return self->_rtsTimeoutTimer;
}

- (void)setRtsTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end