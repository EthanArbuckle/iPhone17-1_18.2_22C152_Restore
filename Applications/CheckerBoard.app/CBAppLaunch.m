@interface CBAppLaunch
- (CBAppLaunch)init;
- (CBAppLaunch)initWithBundleID:(id)a3 backgrounded:(BOOL)a4 native:(BOOL)a5;
- (CBWindowRepresentation)windowRepresentation;
- (FBApplicationUpdateScenesTransaction)sceneTransaction;
- (NSString)bundleID;
- (id)onExit;
- (id)onLaunch;
- (void)applicationProcessDidExit:(id)a3 withContext:(id)a4;
- (void)launch;
- (void)setOnExit:(id)a3;
- (void)setOnLaunch:(id)a3;
- (void)setSceneTransaction:(id)a3;
- (void)setWindowRepresentation:(id)a3;
- (void)transaction:(id)a3 didCommitSceneUpdate:(id)a4;
- (void)transaction:(id)a3 didLaunchProcess:(id)a4;
- (void)transaction:(id)a3 willCommitSceneUpdate:(id)a4;
- (void)transaction:(id)a3 willLaunchProcess:(id)a4;
@end

@implementation CBAppLaunch

- (CBAppLaunch)init
{
  return [(CBAppLaunch *)self initWithBundleID:&stru_10007A9F8 backgrounded:0 native:1];
}

- (CBAppLaunch)initWithBundleID:(id)a3 backgrounded:(BOOL)a4 native:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CBAppLaunch;
  v10 = [(CBAppLaunch *)&v34 init];
  if (v10)
  {
    v11 = (FBApplicationUpdateScenesTransaction *)[objc_alloc((Class)FBApplicationUpdateScenesTransaction) initWithApplicationBundleID:v9 executionContextProvider:&stru_100079D98];
    sceneTransaction = v10->_sceneTransaction;
    v10->_sceneTransaction = v11;

    [(FBApplicationUpdateScenesTransaction *)v10->_sceneTransaction setCompletionBlock:&stru_100079DB8];
    double v13 = 1.0;
    if (v5)
    {
      v14 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Native App Launch", buf, 2u);
      }

      v15 = +[CBWindowManager sharedInstance];
      uint64_t v16 = [v15 createRepresentationWithIdentifier:v9];
      windowRepresentation = v10->_windowRepresentation;
      v10->_windowRepresentation = (CBWindowRepresentation *)v16;

      [(CBWindowRepresentation *)v10->_windowRepresentation windowLevel];
      double v13 = v18;
    }
    id v19 = objc_alloc_init((Class)UIMutableApplicationSceneSettings);
    v20 = +[UIApplicationSceneSpecification specification];
    v21 = +[UIScreen mainScreen];
    [v21 _referenceBounds];
    [v19 setFrame:];

    v22 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting App Launch scene level to: %f", buf, 0xCu);
    }

    [v19 setLevel:v13];
    [v19 setInterfaceOrientation:1];
    [v19 setForeground:!v6];
    v23 = +[FBDisplayManager mainConfiguration];
    [v19 setDisplayConfiguration:v23];

    v24 = +[UIApplication sharedApplication];
    v25 = [v24 windows];
    v26 = [v25 firstObject];
    v27 = [v26 windowScene];
    v28 = [v27 statusBarManager];
    [v28 statusBarFrame];
    double v30 = v29;

    [v19 setSafeAreaInsetsPortrait:v30, 0.0, 0.0, 0.0];
    v31 = +[UIScreen mainScreen];
    [v31 _peripheryInsets];
    [v19 setPeripheryInsets:];

    v32 = +[FBSMutableSceneParameters parametersForSpecification:v20];
    [v32 setSettings:v19];
    [(FBApplicationUpdateScenesTransaction *)v10->_sceneTransaction addObserver:v10];
    [(FBApplicationUpdateScenesTransaction *)v10->_sceneTransaction updateSceneWithIdentifier:v9 parameters:v32 transitionContext:0];
    objc_storeStrong((id *)&v10->_bundleID, a3);
  }
  return v10;
}

- (void)launch
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting transaction.", v5, 2u);
  }

  v4 = [(CBAppLaunch *)self sceneTransaction];
  [v4 begin];
}

- (void)applicationProcessDidExit:(id)a3 withContext:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020888;
  block[3] = &unk_1000794E0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)transaction:(id)a3 willLaunchProcess:(id)a4
{
}

- (void)transaction:(id)a3 willCommitSceneUpdate:(id)a4
{
  id v4 = [(CBAppLaunch *)self windowRepresentation];
  [v4 willLaunchApp];
}

- (void)transaction:(id)a3 didCommitSceneUpdate:(id)a4
{
  id v4 = [(CBAppLaunch *)self windowRepresentation];
  [v4 didLaunchApp];
}

- (void)transaction:(id)a3 didLaunchProcess:(id)a4
{
  BOOL v5 = [(CBAppLaunch *)self onLaunch];

  if (v5)
  {
    BOOL v6 = [(CBAppLaunch *)self onLaunch];
    v6[2](v6, 0);
  }
  v7 = +[CBSceneManager sharedInstance];
  [v7 addScene:2];

  id v8 = +[CBStatusBarStateAggregator sharedInstance];
  [v8 forceUpdateStatusBarData];
}

- (id)onLaunch
{
  return self->_onLaunch;
}

- (void)setOnLaunch:(id)a3
{
}

- (id)onExit
{
  return self->_onExit;
}

- (void)setOnExit:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (FBApplicationUpdateScenesTransaction)sceneTransaction
{
  return self->_sceneTransaction;
}

- (void)setSceneTransaction:(id)a3
{
}

- (CBWindowRepresentation)windowRepresentation
{
  return self->_windowRepresentation;
}

- (void)setWindowRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowRepresentation, 0);
  objc_storeStrong((id *)&self->_sceneTransaction, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong(&self->_onExit, 0);

  objc_storeStrong(&self->_onLaunch, 0);
}

@end