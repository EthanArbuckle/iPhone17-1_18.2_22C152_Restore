@interface CBAppDelegate
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (CBLocalServiceClient)localServiceClient;
- (CBNavigationController)mainNavigationController;
- (CBSensorActivityDataProvider)sensorActivityDataProvider;
- (CBSystem)system;
- (STDynamicActivityAttributionManager)dynamicAttributionManager;
- (STDynamicActivityAttributionMonitor)systemStatusDynamicAttributionMonitor;
- (STStatusServer)systemStatusServer;
- (UIWindow)window;
- (void)_startSystemStatusServer;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)applicationWillTerminate:(id)a3;
- (void)launchDiagnosticsApp;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setDynamicAttributionManager:(id)a3;
- (void)setLocalServiceClient:(id)a3;
- (void)setMainNavigationController:(id)a3;
- (void)setSystem:(id)a3;
- (void)setSystemStatusDynamicAttributionMonitor:(id)a3;
- (void)setSystemStatusServer:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation CBAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Finished launching", (uint8_t *)buf, 2u);
  }

  [(CBAppDelegate *)self _startSystemStatusServer];
  [v6 _createInitialAppScene];
  v9 = objc_alloc_init(CBSystem);
  [(CBAppDelegate *)self setSystem:v9];

  v10 = [(CBAppDelegate *)self system];
  [v10 start];

  v11 = +[CBBootIntentManager sharedInstance];
  v12 = [v11 bootIntentLocale];

  v13 = +[CBBootIntentManager sharedInstance];
  unsigned int v14 = [v13 isCurrentProcessFirstToReadIntent];

  if (v12 && v14)
  {
    v15 = +[CBShellServer sharedInstance];
    v16 = [v15 systemServicesDelegate];
    [v16 setLocaleIdentifier:v12 completion:&stru_1000799D0];
  }
  id v17 = +[CBLocationController sharedLocationController];
  v18 = +[CBOpeningViewController openingViewControllerForBootIntent];
  v19 = [[CBNavigationController alloc] initWithRootViewController:v18];
  [(CBAppDelegate *)self setMainNavigationController:v19];

  v20 = [(CBAppDelegate *)self mainNavigationController];
  [v20 setDelegate:self];

  v21 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Start CBDLocalServiceClient.", (uint8_t *)buf, 2u);
  }

  v22 = [CBLocalServiceClient alloc];
  v23 = [(CBAppDelegate *)self mainNavigationController];
  v24 = [(CBLocalServiceClient *)v22 initWithMainNavController:v23];
  [(CBAppDelegate *)self setLocalServiceClient:v24];

  v25 = [(CBAppDelegate *)self localServiceClient];
  [v25 resume];

  objc_initWeak(buf, self);
  v26 = +[NSNotificationCenter defaultCenter];
  v27 = +[CBAppManager sharedInstance];
  v28 = +[NSOperationQueue mainQueue];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100017060;
  v43[3] = &unk_1000799F8;
  objc_copyWeak(&v44, buf);
  v43[4] = self;
  id v29 = [v26 addObserverForName:@"AppManagerPrimaryAppDidExit" object:v27 queue:v28 usingBlock:v43];

  v30 = +[BFFStyle sharedStyle];
  v31 = [(CBAppDelegate *)self mainNavigationController];
  [v30 applyThemeToNavigationController:v31];

  v32 = +[CBWindowManager sharedInstance];
  v33 = [(CBAppDelegate *)self mainNavigationController];
  v34 = [v32 presentViewController:v33 onLayer:0 backgroundTunnel:1 statusBarVisible:0 animated:0 completion:0];
  [(CBAppDelegate *)self setWindow:v34];

  id v35 = +[CBIdleSleepManager sharedInstance];
  v36 = +[CBUserSettings sharedInstance];
  v37 = [(CBAppDelegate *)self mainNavigationController];
  [v36 applyPostUISettingsFromNvramWithNavigationController:v37];

  if (+[CBUtilities wasRemoteSetupPerformed])
  {
    v38 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "CheckerBoard has ran before and completed remote setup. Launching Diagnostics app.", v42, 2u);
    }

    v39 = dispatch_get_global_queue(0, 0);
    dispatch_async(v39, &stru_100079A18);

    [(CBAppDelegate *)self launchDiagnosticsApp];
  }
  v40 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Resetting media services..", v42, 2u);
  }

  AVResetMediaServices();
  objc_destroyWeak(&v44);
  objc_destroyWeak(buf);

  return 1;
}

- (void)applicationWillResignActive:(id)a3
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resigning active", v4, 2u);
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Entered background", v4, 2u);
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Entering foreground", v4, 2u);
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Became active", v4, 2u);
  }
}

- (void)applicationWillTerminate:(id)a3
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Terminating process", v4, 2u);
  }
}

- (void)launchDiagnosticsApp
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Launching Diagnostics.", v6, 2u);
  }

  v4 = objc_alloc_init(CBEndgameViewController);
  v5 = [(CBAppDelegate *)self mainNavigationController];
  [v5 pushViewController:v4 animated:1];
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([v6 viewControllers],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 firstObject],
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9 != v7))
  {
LABEL_4:
    v10 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Root view controller no longer displayed. Unconfiguring for Remote Setup", v14, 2u);
    }

    v11 = [v6 viewControllers];
    v12 = [v11 firstObject];
    [v12 unConfigureForRemoteSetup];
  }
  else
  {
    v13 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Root view controller displayed. Configuring forSyst Remote Setup", buf, 2u);
    }

    [v7 configureForRemoteSetup];
  }
}

- (void)_startSystemStatusServer
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting system status server", buf, 2u);
  }

  v4 = (STStatusServer *)objc_alloc_init((Class)STStatusServer);
  systemStatusServer = self->_systemStatusServer;
  self->_systemStatusServer = v4;

  id v6 = (STDynamicActivityAttributionManager *)objc_alloc_init((Class)STDynamicActivityAttributionManager);
  dynamicAttributionManager = self->_dynamicAttributionManager;
  self->_dynamicAttributionManager = v6;

  v8 = (STDynamicActivityAttributionMonitor *)[objc_alloc((Class)STDynamicActivityAttributionMonitor) initWithServerHandle:self->_dynamicAttributionManager];
  systemStatusDynamicAttributionMonitor = self->_systemStatusDynamicAttributionMonitor;
  self->_systemStatusDynamicAttributionMonitor = v8;

  [(STDynamicActivityAttributionMonitor *)self->_systemStatusDynamicAttributionMonitor activate];
  v10 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Creating sensor activity data provider", v13, 2u);
  }

  v11 = [[CBSensorActivityDataProvider alloc] initWithSystemStatusServer:self->_systemStatusServer];
  sensorActivityDataProvider = self->_sensorActivityDataProvider;
  self->_sensorActivityDataProvider = v11;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (STStatusServer)systemStatusServer
{
  return self->_systemStatusServer;
}

- (void)setSystemStatusServer:(id)a3
{
}

- (CBSensorActivityDataProvider)sensorActivityDataProvider
{
  return self->_sensorActivityDataProvider;
}

- (CBSystem)system
{
  return self->_system;
}

- (void)setSystem:(id)a3
{
}

- (CBNavigationController)mainNavigationController
{
  return self->_mainNavigationController;
}

- (void)setMainNavigationController:(id)a3
{
}

- (CBLocalServiceClient)localServiceClient
{
  return self->_localServiceClient;
}

- (void)setLocalServiceClient:(id)a3
{
}

- (STDynamicActivityAttributionManager)dynamicAttributionManager
{
  return self->_dynamicAttributionManager;
}

- (void)setDynamicAttributionManager:(id)a3
{
}

- (STDynamicActivityAttributionMonitor)systemStatusDynamicAttributionMonitor
{
  return self->_systemStatusDynamicAttributionMonitor;
}

- (void)setSystemStatusDynamicAttributionMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemStatusDynamicAttributionMonitor, 0);
  objc_storeStrong((id *)&self->_dynamicAttributionManager, 0);
  objc_storeStrong((id *)&self->_localServiceClient, 0);
  objc_storeStrong((id *)&self->_mainNavigationController, 0);
  objc_storeStrong((id *)&self->_system, 0);
  objc_storeStrong((id *)&self->_sensorActivityDataProvider, 0);
  objc_storeStrong((id *)&self->_systemStatusServer, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end