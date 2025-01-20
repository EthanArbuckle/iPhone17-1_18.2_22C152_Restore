@interface HSProximityCardHostViewController
- (BOOL)_didPRXActuallyDismiss;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)isCleaningUp;
- (BOOL)isLaunchedToSetupASpecificAccessory;
- (HMSetupAccessoryDescription)setupAccessoryDescription;
- (HSEntitlementContext)entitlementContext;
- (HSProxCardCoordinator)coordinator;
- (HSProximityCardHostViewController)init;
- (MTSDeviceSetupRequest)matterDeviceSetupRequest;
- (NSArray)accessoriesToResumeSetup;
- (NSMutableArray)configurators;
- (NSString)resumeSetupHomeUUIDString;
- (SFClient)sharingFrameworkClient;
- (UINavigationController)navigationController;
- (UINavigationController)proxNavigationController;
- (id)_allHomesDescription:(id)a3;
- (id)viewControllerForCoordinator:(id)a3 step:(int64_t)a4;
- (int64_t)launchReason;
- (unint64_t)coordinatorGetNumberOfProxCards:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cleanup;
- (void)_initiateSetupFlow:(id)a3;
- (void)_presentProxCardFlowWithInitialViewController:(id)a3;
- (void)_refreshHomeGraphWithCompletion:(id)a3;
- (void)_updatePairingStatusIfNecessary:(id)a3 phase:(unint64_t)a4;
- (void)_willAppearInRemoteViewController;
- (void)configuratorDidFinish:(id)a3;
- (void)configuratorDidUpdateViewController:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)coordinator:(id)a3 updatedConfiguration:(id)a4;
- (void)coordinatorRequestedDismissal:(id)a3;
- (void)didInvalidateForRemoteAlert;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)onSetupAccessoryDescription:(id)a3 matterDeviceSetupRequest:(id)a4;
- (void)pairingController:(id)a3 didTransitionToPhase:(unint64_t)a4 statusTitle:(id)a5 statusDescription:(id)a6;
- (void)pairingPopupDidCancel:(id)a3;
- (void)pairingPopupDidFinish:(id)a3;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)setAccessoriesToResumeSetup:(id)a3;
- (void)setConfigurators:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setIsCleaningUp:(BOOL)a3;
- (void)setLaunchReason:(int64_t)a3;
- (void)setMatterDeviceSetupRequest:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setProxNavigationController:(id)a3;
- (void)setResumeSetupHomeUUIDString:(id)a3;
- (void)setSetupAccessoryDescription:(id)a3;
- (void)setSharingFrameworkClient:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HSProximityCardHostViewController

- (BOOL)isLaunchedToSetupASpecificAccessory
{
  v2 = [(HSProximityCardHostViewController *)self setupAccessoryDescription];
  unsigned __int8 v3 = [v2 hf_isKeyedToASpecificAccessory];

  return v3;
}

- (HSProximityCardHostViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)HSProximityCardHostViewController;
  v2 = [(HSProximityCardHostViewController *)&v9 init];
  if (v2)
  {
    unsigned __int8 v3 = (SFClient *)objc_alloc_init((Class)SFClient);
    sharingFrameworkClient = v2->_sharingFrameworkClient;
    v2->_sharingFrameworkClient = v3;

    v5 = v2->_sharingFrameworkClient;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10004D774;
    v7[3] = &unk_1000AAE50;
    v8 = v2;
    [(SFClient *)v5 startProxCardTransactionWithOptions:0 completion:v7];
  }
  return v2;
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)_refreshHomeGraphWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[NSDate distantFuture];
  v6 = +[NSDate now];
  v7 = +[HFHomeKitDispatcher sharedDispatcher];
  v8 = [v7 homeManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004D8FC;
  v12[3] = &unk_1000AB008;
  id v13 = v6;
  v14 = self;
  id v15 = v4;
  id v9 = v4;
  id v10 = v6;
  id v11 = [v8 _refreshBeforeDate:v5 completionHandler:v12];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
  id v9 = [(HSProximityCardHostViewController *)self _remoteViewControllerProxy];
  [v9 setAllowsAlertStacking:1];
  id v10 = [v6 userInfo];
  [(HSProximityCardHostViewController *)self setLaunchReason:+[HUHomeUIServiceLaunchUserInfo launchReasonFromUserInfo:v10]];
  id v11 = +[HSAccessoryPairingEventLogger sharedLogger];
  [v11 logHUISLaunchWithReason:[self launchReason] accessoryDescription:0];

  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[HSProximityCardHostViewController configureWithContext:completion:]";
    __int16 v23 = 2112;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s userInfo %@", buf, 0x16u);
  }

  if (![(HSProximityCardHostViewController *)self launchReason])
  {
    id v13 = [objc_alloc((Class)HMSetupAccessoryDescription) initWithDictionaryRepresentation:v10];
    if (!v13)
    {
      v16 = HFLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100068614();
      }

      id v17 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Failed to initialize setup accessory description from SBSRemoteAlertConfigurationContext user info" userInfo:0];
      objc_exception_throw(v17);
    }
    id v15 = [objc_alloc((Class)MTSDeviceSetupRequest) initWithDictionaryRepresentation:v10];
    [(HSProximityCardHostViewController *)self onSetupAccessoryDescription:v13 matterDeviceSetupRequest:v15];

    goto LABEL_15;
  }
  if ((id)[(HSProximityCardHostViewController *)self launchReason] == (id)1
    || (id)[(HSProximityCardHostViewController *)self launchReason] == (id)2
    || (id)[(HSProximityCardHostViewController *)self launchReason] == (id)3
    || (id)[(HSProximityCardHostViewController *)self launchReason] == (id)4
    || (id)[(HSProximityCardHostViewController *)self launchReason] == (id)5
    || (id)[(HSProximityCardHostViewController *)self launchReason] == (id)6)
  {
    id v13 = [v10 objectForKeyedSubscript:HUHomeUIServiceLaunchHomeUUIDString];
    id v14 = [v13 copy];
    [(HSProximityCardHostViewController *)self setResumeSetupHomeUUIDString:v14];

    objc_initWeak((id *)buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004E064;
    v18[3] = &unk_1000AB0A0;
    objc_copyWeak(&v20, (id *)buf);
    id v19 = v10;
    [(HSProximityCardHostViewController *)self _refreshHomeGraphWithCompletion:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
LABEL_15:
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(HSProximityCardHostViewController *)self traitCollection];
  if ([v2 userInterfaceIdiom] == (id)1) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HSProximityCardHostViewController;
  [(HSProximityCardHostViewController *)&v8 viewDidLoad];
  unint64_t v3 = +[UIColor hf_keyColor];
  id v4 = +[UIApplication sharedApplication];
  v5 = [v4 keyWindow];
  [v5 setTintColor:v3];

  id v6 = +[NSMutableArray array];
  [(HSProximityCardHostViewController *)self setConfigurators:v6];

  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[HSProximityCardHostViewController viewDidLoad]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSProximityCardHostViewController;
  [(HSProximityCardHostViewController *)&v5 viewDidDisappear:a3];
  if ([(HSProximityCardHostViewController *)self _didPRXActuallyDismiss])
  {
    id v4 = [(HSProximityCardHostViewController *)self coordinator];
    [v4 dismissProxCardFlowAfterExecuting:0];
  }
}

- (void)proxCardFlowWillPresent
{
  unint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[HSProximityCardHostViewController proxCardFlowWillPresent]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(HSProximityCardHostViewController *)self _remoteViewControllerProxy];
  [v4 setStatusBarHidden:1 withDuration:0.0];
  [v4 setIdleTimerDisabled:1 forReason:@"HMSetup"];
}

- (void)proxCardFlowDidDismiss
{
  unint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[HSProximityCardHostViewController proxCardFlowDidDismiss]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  if ([(HSProximityCardHostViewController *)self _didPRXActuallyDismiss]) {
    [(HSProximityCardHostViewController *)self _cleanup];
  }
}

- (BOOL)_didPRXActuallyDismiss
{
  v2 = [(HSProximityCardHostViewController *)self proxNavigationController];
  unint64_t v3 = [v2 presentedViewController];

  if (v3) {
    BOOL v4 = [v3 modalPresentationStyle] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)coordinator:(id)a3 updatedConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(HSProximityCardHostViewController *)self coordinator];
  id v9 = [v8 activeTuple];
  id v10 = [v9 currentStep];

  id v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    id v14 = +[HSSetupContentProvider stringForHSProxCardSetupUIStep:v10];
    *(_DWORD *)buf = 138413058;
    v28 = v13;
    __int16 v29 = 1024;
    int v30 = 316;
    __int16 v31 = 2080;
    v32 = "-[HSProximityCardHostViewController coordinator:updatedConfiguration:]";
    __int16 v33 = 2112;
    v34 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ %d %s: %@", buf, 0x26u);
  }
  id v15 = [(HSProximityCardHostViewController *)self coordinator];
  BOOL v16 = v15 == v6;

  if (!v16) {
    NSLog(@"Not the same coordinator");
  }
  if (v10 == (id)10)
  {
    id v17 = [(HSProximityCardHostViewController *)self coordinator];
    v18 = [v17 activeTuple];
    id v19 = [(HSProximityCardHostViewController *)self coordinator];
    id v20 = [v19 topAccessoryTuple];
    BOOL v21 = v18 == v20;

    if (!v21) {
      NSLog(@"Not configuring top accessory");
    }
    objc_initWeak((id *)buf, self);
    v22 = [(HSProximityCardHostViewController *)self coordinator];
    __int16 v23 = [v22 nextViewController];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10004EEAC;
    v25[3] = &unk_1000AB078;
    objc_copyWeak(&v26, (id *)buf);
    id v24 = [v23 addSuccessBlock:v25];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
}

- (void)coordinatorRequestedDismissal:(id)a3
{
  BOOL v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[HSProximityCardHostViewController coordinatorRequestedDismissal:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(HSProximityCardHostViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (id)viewControllerForCoordinator:(id)a3 step:(int64_t)a4
{
  if (a4 == 50)
  {
    int v5 = [HSSetupNetworkRouterConfigurator alloc];
    id v6 = [(HSProximityCardHostViewController *)self coordinator];
    id v7 = [(HSSetupNetworkRouterConfigurator *)v5 initWithCoordinator:v6];

    [(HSSetupNetworkRouterConfigurator *)v7 setConfiguratorDelegate:self];
    objc_super v8 = [(HSProximityCardHostViewController *)self configurators];
    [v8 addObject:v7];

    id v9 = [(HSSetupNetworkRouterConfigurator *)v7 currentViewController];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)coordinatorGetNumberOfProxCards:(id)a3
{
  unint64_t v3 = [(HSProximityCardHostViewController *)self proxNavigationController];
  BOOL v4 = [v3 viewControllers];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (void)configuratorDidUpdateViewController:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[HSProximityCardHostViewController configuratorDidUpdateViewController:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = [(HSProximityCardHostViewController *)self proxNavigationController];

  if (!v6) {
    NSLog(@"We must have a navigationController at this point");
  }
  id v7 = [(HSProximityCardHostViewController *)self configurators];
  unsigned __int8 v8 = [v7 containsObject:v4];

  if ((v8 & 1) == 0) {
    NSLog(@"Only my own configurators please");
  }
  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004F348;
  v10[3] = &unk_1000AB0C8;
  objc_copyWeak(&v12, (id *)buf);
  id v11 = v4;
  id v9 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)configuratorDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v16 = "-[HSProximityCardHostViewController configuratorDidFinish:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v6 = [(HSProximityCardHostViewController *)self proxNavigationController];
  BOOL v7 = v6 == 0;

  if (v7) {
    NSLog(@"We must have a navigationController at this point");
  }
  unsigned __int8 v8 = [(HSProximityCardHostViewController *)self configurators];
  unsigned __int8 v9 = [v8 containsObject:v4];

  if ((v9 & 1) == 0) {
    NSLog(@"Only my own configurators please");
  }
  objc_initWeak((id *)buf, self);
  id v10 = [(HSProximityCardHostViewController *)self coordinator];
  id v11 = [v10 nextViewController];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004F5B4;
  v13[3] = &unk_1000AB078;
  objc_copyWeak(&v14, (id *)buf);
  id v12 = [v11 addSuccessBlock:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (id)_allHomesDescription:(id)a3
{
  if (a3)
  {
    [a3 na_map:&stru_1000AB0E8];
    id v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = &off_1000B0D18;
  }
  return v4;
}

- (void)onSetupAccessoryDescription:(id)a3 matterDeviceSetupRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(HSProximityCardHostViewController *)self resumeSetupHomeUUIDString];

  if (v8)
  {
    unsigned __int8 v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000687CC(self, v9);
    }
  }
  else
  {
    id v10 = [(HSProximityCardHostViewController *)self setupAccessoryDescription];

    BOOL v11 = v10 == 0;
    id v12 = HFLogForCategory();
    unsigned __int8 v9 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v25 = v6;
        __int16 v26 = 2112;
        id v27 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "HomeUIService launched with accessoryDescription: %@ matterDeviceSetupRequest: %@", buf, 0x16u);
      }

      unsigned __int8 v9 = [v6 homeUUID];
      id v13 = [[HSEntitlementContext alloc] initWithSetupAccessoryDescription:v6];
      entitlementContext = self->_entitlementContext;
      self->_entitlementContext = v13;

      id v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v16 = [(HSProximityCardHostViewController *)self entitlementContext];
        *(_DWORD *)buf = 138412290;
        id v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Entitlement Context: %@", buf, 0xCu);
      }
      [(HSProximityCardHostViewController *)self setSetupAccessoryDescription:v6];
      [(HSProximityCardHostViewController *)self setMatterDeviceSetupRequest:v7];
      id v17 = +[HSAccessoryPairingEventLogger sharedLogger];
      int64_t v18 = [(HSProximityCardHostViewController *)self launchReason];
      id v19 = [(HSProximityCardHostViewController *)self setupAccessoryDescription];
      [v17 logHUISLaunchWithReason:v18 accessoryDescription:v19];

      id v20 = +[HSAccessoryPairingEventLogger sharedLogger];
      [v20 logLaunchedToSetupASpecificAccessory:[self isLaunchedToSetupASpecificAccessory]];

      if (!v7 || v9)
      {
        objc_initWeak((id *)buf, self);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10004FB24;
        v21[3] = &unk_1000AB0A0;
        objc_copyWeak(&v23, (id *)buf);
        unsigned __int8 v9 = v9;
        v22 = v9;
        [(HSProximityCardHostViewController *)self _refreshHomeGraphWithCompletion:v21];

        objc_destroyWeak(&v23);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [(HSProximityCardHostViewController *)self _initiateSetupFlow:0];
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      sub_100068724(self);
    }
  }
}

- (void)_initiateSetupFlow:(id)a3
{
  id v4 = a3;
  id v5 = [(HSProximityCardHostViewController *)self setupAccessoryDescription];
  id v6 = [(HSProximityCardHostViewController *)self matterDeviceSetupRequest];
  if ([(HSProximityCardHostViewController *)self isLaunchedToSetupASpecificAccessory])
  {
    id v7 = objc_alloc((Class)HFDiscoveredAccessory);
    unsigned __int8 v8 = [v5 accessoryUUID];
    unsigned __int8 v9 = [v5 accessoryName];
    id v10 = [v5 category];
    id v11 = [v7 initWithAccessoryUUID:v8 accessoryName:v9 accessoryCategory:v10];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = [v4 uuid];
    *(_DWORD *)buf = 138413826;
    v28 = v14;
    __int16 v29 = 2112;
    id v30 = v4;
    __int16 v31 = 2112;
    v32 = v15;
    __int16 v33 = 2112;
    v34 = v5;
    __int16 v35 = 2112;
    v36 = v6;
    __int16 v37 = 1024;
    unsigned int v38 = [(HSProximityCardHostViewController *)self isLaunchedToSetupASpecificAccessory];
    __int16 v39 = 2112;
    id v40 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Launching %@ with home %@ home.uuid %@ accessoryDescription %@ matterDeviceSetupRequest %@ isLaunchedToSetupASpecificAccessory %d discoveredAccessory %@", buf, 0x44u);
  }
  BOOL v16 = [HSProxCardCoordinator alloc];
  BOOL v17 = [(HSProximityCardHostViewController *)self isLaunchedToSetupASpecificAccessory];
  int64_t v18 = [(HSProximityCardHostViewController *)self entitlementContext];
  id v19 = [(HSProxCardCoordinator *)v16 initWithHome:v4 accessoryDescription:v5 matterDeviceSetupRequest:v6 setupSpecificAccessory:v17 entitlementContext:v18 discoveredAccessory:v11 delegate:self];
  [(HSProximityCardHostViewController *)self setCoordinator:v19];

  objc_initWeak((id *)buf, self);
  id v20 = [(HSProximityCardHostViewController *)self coordinator];
  BOOL v21 = [v20 nextViewController];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100050030;
  v24[3] = &unk_1000AB110;
  objc_copyWeak(&v26, (id *)buf);
  id v22 = v5;
  id v25 = v22;
  id v23 = [v21 addSuccessBlock:v24];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

- (void)_presentProxCardFlowWithInitialViewController:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___PRXCardContentProviding]) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    if (v7)
    {
      unsigned __int8 v8 = +[PRXFlowConfiguration defaultConfiguration];
      unsigned __int8 v9 = [(HSProximityCardHostViewController *)self presentProxCardFlowWithDelegate:self initialViewController:v7 configuration:v8];
      [(HSProximityCardHostViewController *)self setProxNavigationController:v9];
    }
    else
    {
      int64_t v18 = HFLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000688E8(v18, v19, v20, v21, v22, v23, v24, v25);
      }

      NSLog(@"Attempted to present a vc that is not PRXCardContentProviding %s", "-[HSProximityCardHostViewController _presentProxCardFlowWithInitialViewController:]");
    }
  }
  else
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100068870(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    NSLog(@"Attempted to present ProxCardFlow with nil initial view controller %s", "-[HSProximityCardHostViewController _presentProxCardFlowWithInitialViewController:]");
  }
}

- (void)pairingController:(id)a3 didTransitionToPhase:(unint64_t)a4 statusTitle:(id)a5 statusDescription:(id)a6
{
  id v9 = a3;
  [(HSProximityCardHostViewController *)self _updatePairingStatusIfNecessary:a6 phase:a4];
  id v10 = [v9 context];

  uint64_t v11 = [v10 setupAccessoryDescription];

  switch(a4)
  {
    case 0xAuLL:
      if ([(HSProximityCardHostViewController *)self isLaunchedToSetupASpecificAccessory])
      {
        uint64_t v16 = [(HSProximityCardHostViewController *)self coordinator];
        [v16 dismissProxCardFlowAfterExecuting:0];
      }
      break;
    case 7uLL:
      uint64_t v17 = [v11 category];
      int64_t v18 = [v17 categoryType];
      unsigned int v19 = [v18 isEqualToString:HMAccessoryCategoryTypeWiFiRouter];

      if (v19)
      {
        uint64_t v20 = [HSPCRouterReplaceViewController alloc];
        uint64_t v21 = [(HSProximityCardHostViewController *)self coordinator];
        uint64_t v15 = [(HSPCRouterReplaceViewController *)v20 initWithCoordinator:v21];

        if (v15) {
          goto LABEL_11;
        }
      }
      break;
    case 6uLL:
      uint64_t v12 = [v11 category];
      uint64_t v13 = [v12 categoryType];
      unsigned int v14 = [v13 isEqualToString:HMAccessoryCategoryTypeWiFiRouter];

      if (!v14) {
        break;
      }
      uint64_t v15 = [[HSPCSetupNetworkRouterAppPunchoutViewController alloc] initWithPopupDelegate:self setupAccessoryDescription:v11];
      if (!v15) {
        break;
      }
LABEL_11:
      objc_initWeak(&location, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100050678;
      block[3] = &unk_1000AB0C8;
      objc_copyWeak(&v25, &location);
      uint64_t v24 = v15;
      uint64_t v22 = v15;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);

      break;
    default:
      break;
  }
}

- (void)_updatePairingStatusIfNecessary:(id)a3 phase:(unint64_t)a4
{
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315394;
    int64_t v18 = "-[HSProximityCardHostViewController _updatePairingStatusIfNecessary:phase:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v17, 0x16u);
  }

  if ([v6 length])
  {
    unsigned __int8 v8 = [(HSProximityCardHostViewController *)self coordinator];
    id v9 = [v8 activeTuple];
    id v10 = [v9 currentStep];

    if (v10 == (id)10)
    {
      uint64_t v11 = [v8 activeTuple];
      uint64_t v12 = [v8 topAccessoryTuple];

      if (v11 != v12) {
        NSLog(@"Not configuring top accessory");
      }
      objc_opt_class();
      uint64_t v13 = [(HSProximityCardHostViewController *)self proxNavigationController];
      unsigned int v14 = [v13 topViewController];
      if (objc_opt_isKindOfClass()) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = 0;
      }
      id v16 = v15;

      [v16 updatePairingStatus:v6 phase:a4];
    }
  }
}

- (void)pairingPopupDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [v4 setupAccessoryDescription];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2048;
    id v16 = [v4 popupType];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@ pairingPopupDidFinish:%@ pairingPopup.popupType %lu]", (uint8_t *)&v11, 0x20u);
  }

  id v7 = [v5 category];
  unsigned __int8 v8 = [v7 categoryType];
  unsigned __int8 v9 = [v8 isEqualToString:HMAccessoryCategoryTypeWiFiRouter];

  if ((v9 & 1) == 0) {
    NSLog(@"Only Routers are handled");
  }
  if ([v4 popupType] == (id)2)
  {
    id v10 = [(HSProximityCardHostViewController *)self coordinator];
    [v10 dismissProxCardFlowAfterExecuting:0];
  }
  else
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100068960((uint64_t)self, v4);
    }
  }
}

- (void)pairingPopupDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 setupAccessoryDescription];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2048;
    id v16 = [v4 popupType];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%@ pairingPopupDidFinish:%@ pairingPopup.popupType %lu]", (uint8_t *)&v11, 0x20u);
  }

  id v7 = [v5 category];
  unsigned __int8 v8 = [v7 categoryType];
  unsigned __int8 v9 = [v8 isEqualToString:HMAccessoryCategoryTypeWiFiRouter];

  if ((v9 & 1) == 0) {
    NSLog(@"Only Routers are handled");
  }
  if ([v4 popupType] == (id)2)
  {
    id v10 = [(HSProximityCardHostViewController *)self coordinator];
    [v10 dismissProxCardFlowAfterExecuting:0];
  }
  else
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100068960((uint64_t)self, v4);
    }
  }
}

- (void)_willAppearInRemoteViewController
{
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    id v4 = "-[HSProximityCardHostViewController _willAppearInRemoteViewController]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }
}

- (void)didInvalidateForRemoteAlert
{
  int v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[HSProximityCardHostViewController didInvalidateForRemoteAlert]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(HSProximityCardHostViewController *)self _cleanup];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "dismissViewControllerAnimated: %d requesting invalidation from host", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100050EEC;
  v12[3] = &unk_1000AB138;
  objc_copyWeak(&v14, &buf);
  id v8 = v6;
  id v13 = v8;
  unsigned __int8 v9 = objc_retainBlock(v12);
  id v10 = v9;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)HSProximityCardHostViewController;
    [(HSProximityCardHostViewController *)&v11 dismissViewControllerAnimated:1 completion:v9];
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&buf);
}

- (void)_cleanup
{
  if ([(HSProximityCardHostViewController *)self isCleaningUp])
  {
    uint64_t v3 = HFLogForCategory();
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 136315138;
      id v26 = "-[HSProximityCardHostViewController _cleanup]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "%s: already cleaning up, returning early", buf, 0xCu);
    }
  }
  else
  {
    [(HSProximityCardHostViewController *)self setIsCleaningUp:1];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100051330;
    v24[3] = &unk_1000A90B0;
    void v24[4] = self;
    uint64_t v3 = objc_retainBlock(v24);
    BOOL v4 = [(HSProximityCardHostViewController *)self resumeSetupHomeUUIDString];

    if (v4)
    {
      (*(void (**)(uint64_t))(v3 + 16))(v3);
    }
    else
    {
      id v5 = [(HSProximityCardHostViewController *)self coordinator];
      id v6 = [v5 pairingFuture];
      id v7 = [v6 pairingController];

      id v8 = [v7 completedInfo];
      unsigned __int8 v9 = [(HSProximityCardHostViewController *)self coordinator];
      id v10 = [v9 topAccessoryTuple];
      objc_super v11 = [v10 configuration];
      uint64_t v12 = [v11 pairingError];

      id v13 = [(HSProximityCardHostViewController *)self setupAccessoryDescription];
      if ([v13 isSetupInitiatedByOtherMatterEcosystem])
      {
      }
      else
      {
        id v14 = [v7 pairedAccessories];
        id v15 = [v14 count];

        if (!v15 && !v12 && !v8)
        {
          id v16 = HFLogForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id buf = 136315138;
            id v26 = "-[HSProximityCardHostViewController _cleanup]";
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: determined this is an early cancellation by the user, setting error HMFErrorCodeOperationCancelled", buf, 0xCu);
          }

          uint64_t v12 = +[NSError hmfErrorWithCode:12];
        }
      }
      int v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v18 = [(HSProximityCardHostViewController *)self setupAccessoryDescription];
        *(_DWORD *)id buf = 136315906;
        id v26 = "-[HSProximityCardHostViewController _cleanup]";
        __int16 v27 = 2112;
        v28 = v8;
        __int16 v29 = 2112;
        id v30 = v12;
        __int16 v31 = 2112;
        v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Finishing accessory setup with info %@, error %@ for setupAccessoryDescription %@", buf, 0x2Au);
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000513E4;
      v22[3] = &unk_1000AA820;
      v22[4] = self;
      id v23 = (id)v3;
      __int16 v19 = objc_retainBlock(v22);
      id v20 = objc_alloc_init((Class)HMAccessorySetupManager);
      uint64_t v21 = v20;
      if (v12)
      {
        [v20 failAccessorySetupWithError:v12 completionHandler:v19];
      }
      else if (v8)
      {
        [v20 finishAccessorySetupWithSetupCompletedInfo:v8 completionHandler:v19];
      }
      else
      {
        [v20 finishAccessorySetupWithCompletionHandler:v19];
      }
    }
  }
}

- (UINavigationController)proxNavigationController
{
  return self->proxNavigationController;
}

- (void)setProxNavigationController:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (SFClient)sharingFrameworkClient
{
  return self->_sharingFrameworkClient;
}

- (void)setSharingFrameworkClient:(id)a3
{
}

- (HSEntitlementContext)entitlementContext
{
  return self->_entitlementContext;
}

- (NSMutableArray)configurators
{
  return self->_configurators;
}

- (void)setConfigurators:(id)a3
{
}

- (HMSetupAccessoryDescription)setupAccessoryDescription
{
  return self->_setupAccessoryDescription;
}

- (void)setSetupAccessoryDescription:(id)a3
{
}

- (MTSDeviceSetupRequest)matterDeviceSetupRequest
{
  return self->_matterDeviceSetupRequest;
}

- (void)setMatterDeviceSetupRequest:(id)a3
{
}

- (int64_t)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(int64_t)a3
{
  self->_launchReason = a3;
}

- (NSString)resumeSetupHomeUUIDString
{
  return self->_resumeSetupHomeUUIDString;
}

- (void)setResumeSetupHomeUUIDString:(id)a3
{
}

- (NSArray)accessoriesToResumeSetup
{
  return self->_accessoriesToResumeSetup;
}

- (void)setAccessoriesToResumeSetup:(id)a3
{
}

- (BOOL)isCleaningUp
{
  return self->_isCleaningUp;
}

- (void)setIsCleaningUp:(BOOL)a3
{
  self->_isCleaningUp = a3;
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_accessoriesToResumeSetup, 0);
  objc_storeStrong((id *)&self->_resumeSetupHomeUUIDString, 0);
  objc_storeStrong((id *)&self->_matterDeviceSetupRequest, 0);
  objc_storeStrong((id *)&self->_setupAccessoryDescription, 0);
  objc_storeStrong((id *)&self->_configurators, 0);
  objc_storeStrong((id *)&self->_entitlementContext, 0);
  objc_storeStrong((id *)&self->_sharingFrameworkClient, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->proxNavigationController, 0);
}

@end