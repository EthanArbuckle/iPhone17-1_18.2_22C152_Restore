@interface PBAAppDelegate
- (BKSTouchStream)touchStream;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (PBADataRecoveryEngine)dataRecoveryEngine;
- (PBAStackViewController)stackViewController;
- (SBFMouseButtonDownGestureRecognizer)mouseButtonDownGestureRecognizer;
- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer;
- (UIHBClickGestureRecognizer)singlePressDownGestureRecognizer;
- (UIHBClickGestureRecognizer)triplePressUpGestureRecognizer;
- (UIRootWindowScenePresentationBinder)rootWindowScenePresentationBinder;
- (UIViewController)mainViewController;
- (UIWindow)window;
- (int64_t)_computeBootOrientation;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)_createInitialAppScene;
- (void)_createInputUIScene;
- (void)_reconfigureHomeButton;
- (void)_resetIdleTimerForReason:(id)a3;
- (void)_setupHomeButtonRecognition;
- (void)_setupMouseButtonRecognition;
- (void)_setupTapToWakeRecognition;
- (void)authenticationPolicyEncounteredPolicyError:(id)a3;
- (void)displayDidBlank:(id)a3;
- (void)displayWillUnblank:(id)a3;
- (void)homeButtonSinglePressDown:(id)a3;
- (void)homeButtonTriplePressUp:(id)a3;
- (void)mouseButtonDown:(id)a3;
- (void)presentDataRecovery;
- (void)presentDeviceUnlock;
- (void)presentLAPasscodeVerification;
- (void)sceneManager:(id)a3 didCreateScene:(id)a4;
- (void)setDataRecoveryEngine:(id)a3;
- (void)setMainViewController:(id)a3;
- (void)setMainViewController:(id)a3 animated:(BOOL)a4;
- (void)setMouseButtonDownGestureRecognizer:(id)a3;
- (void)setRootWindowScenePresentationBinder:(id)a3;
- (void)setSinglePressDownGestureRecognizer:(id)a3;
- (void)setStackViewController:(id)a3;
- (void)setTapToWakeGestureRecognizer:(id)a3;
- (void)setTouchStream:(id)a3;
- (void)setTriplePressUpGestureRecognizer:(id)a3;
- (void)setWindow:(id)a3;
- (void)tapToWake:(id)a3;
@end

@implementation PBAAppDelegate

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a3;
  v6 = +[FBSceneManager sharedInstance];
  [v6 addObserver:self];

  id v7 = objc_alloc((Class)UIRootWindowScenePresentationBinder);
  v8 = +[FBDisplayManager sharedInstance];
  v9 = [v8 mainConfiguration];
  v10 = (UIRootWindowScenePresentationBinder *)[v7 initWithPriority:0 displayConfiguration:v9];
  rootWindowScenePresentationBinder = self->_rootWindowScenePresentationBinder;
  self->_rootWindowScenePresentationBinder = v10;

  [(PBAAppDelegate *)self _createInitialAppScene];
  int64_t v12 = [(PBAAppDelegate *)self _computeBootOrientation];
  v13 = +[UIDevice currentDevice];
  [v13 setOrientation:v12];

  BKSHIDServicesLockOrientation();
  [v5 setStatusBarHidden:1 withAnimation:0];

  v14 = [PBASecureWindow alloc];
  v15 = +[UIScreen mainScreen];
  [v15 _referenceBounds];
  v16 = -[PBASecureWindow initWithFrame:](v14, "initWithFrame:");
  window = self->_window;
  self->_window = v16;

  v18 = self->_window;
  v19 = +[UIColor whiteColor];
  [(UIWindow *)v18 setBackgroundColor:v19];

  [(UIWindow *)self->_window makeKeyAndVisible];
  v20 = +[NSUserDefaults standardUserDefaults];
  LODWORD(v19) = [v20 BOOLForKey:@"PBAForceMockRecovery"];

  if (v19)
  {
    v21 = [@"111111" dataUsingEncoding:4];
    v22 = +[SBFShamMobileKeyBag shamKeyBagWithRecoveryRequired:1 correctPasscode:v21];
  }
  else
  {
    v22 = +[SBFMobileKeyBag sharedInstance];
  }
  v23 = [[PBADataRecoveryEngine alloc] initWithMobileKeyBag:v22];
  dataRecoveryEngine = self->_dataRecoveryEngine;
  self->_dataRecoveryEngine = v23;

  v25 = [[PBAStackViewController alloc] initWithNibName:0 bundle:0];
  stackViewController = self->_stackViewController;
  self->_stackViewController = v25;

  v27 = +[LAPreboard sharedInstance];
  unsigned int v28 = [v27 isRequired];

  v36 = _NSConcreteStackBlock;
  uint64_t v37 = 3221225472;
  v38 = sub_1000065B8;
  v39 = &unk_10001C7C0;
  char v41 = v28;
  v40 = self;
  AnalyticsSendEventLazy();
  if (v28)
  {
    [(PBAAppDelegate *)self presentLAPasscodeVerification];
  }
  else if ([(PBADataRecoveryEngine *)self->_dataRecoveryEngine requiresDataRecovery])
  {
    [(PBAAppDelegate *)self presentDataRecovery];
  }
  else
  {
    [(PBAAppDelegate *)self presentDeviceUnlock];
  }
  [(UIWindow *)self->_window setRootViewController:self->_stackViewController];
  [(PBAAppDelegate *)self _setupTapToWakeRecognition];
  [(PBAAppDelegate *)self _reconfigureHomeButton];
  [(PBAAppDelegate *)self _setupHomeButtonRecognition];
  id v29 = +[_UIKeyboardArbiterHost launchAdvisorWithOmniscientDelegate:0 sceneDelegate:self];
  [(PBAAppDelegate *)self _createInputUIScene];
  v30 = +[PBAHIDEventController sharedController];
  [v30 startReceivingEvents];

  v31 = +[NSNotificationCenter defaultCenter];
  [v31 addObserver:self selector:"displayDidBlank:" name:@"PBAScreenDidBlankNotification" object:0];

  v32 = +[NSNotificationCenter defaultCenter];
  [v32 addObserver:self selector:"displayWillUnblank:" name:@"PBAScreenWillUnblankNotification" object:0];

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_10001C7E0);
  v33 = sub_1000085D4();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "now running", v35, 2u);
  }

  return 1;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  int64_t v4 = [(PBAAppDelegate *)self _computeBootOrientation];
  if ((unint64_t)(v4 - 2) > 2) {
    return 2;
  }
  else {
    return qword_10001B6A0[v4 - 2];
  }
}

- (void)authenticationPolicyEncounteredPolicyError:(id)a3
{
  if ([(PBADataRecoveryEngine *)self->_dataRecoveryEngine requiresDataRecovery])
  {
    [(PBAAppDelegate *)self presentDataRecovery];
  }
}

- (void)_setupTapToWakeRecognition
{
  v3 = (SBFTapToWakeGestureRecognizer *)[objc_alloc((Class)SBFTapToWakeGestureRecognizer) initWithTarget:self action:"tapToWake:"];
  tapToWakeGestureRecognizer = self->_tapToWakeGestureRecognizer;
  self->_tapToWakeGestureRecognizer = v3;

  [(SBFTapToWakeGestureRecognizer *)self->_tapToWakeGestureRecognizer setEnabled:0];
  window = self->_window;
  v6 = self->_tapToWakeGestureRecognizer;

  [(UIWindow *)window addGestureRecognizer:v6];
}

- (void)_setupMouseButtonRecognition
{
  v3 = (SBFMouseButtonDownGestureRecognizer *)[objc_alloc((Class)SBFMouseButtonDownGestureRecognizer) initWithTarget:self action:"mouseButtonDown:"];
  mouseButtonDownGestureRecognizer = self->_mouseButtonDownGestureRecognizer;
  self->_mouseButtonDownGestureRecognizer = v3;

  window = self->_window;
  v6 = self->_mouseButtonDownGestureRecognizer;

  [(UIWindow *)window addGestureRecognizer:v6];
}

- (void)_setupHomeButtonRecognition
{
  v3 = (UIHBClickGestureRecognizer *)[objc_alloc((Class)UIHBClickGestureRecognizer) initWithTarget:self action:"homeButtonSinglePressDown:"];
  singlePressDownGestureRecognizer = self->_singlePressDownGestureRecognizer;
  self->_singlePressDownGestureRecognizer = v3;

  [(UIHBClickGestureRecognizer *)self->_singlePressDownGestureRecognizer setRecognizesOnPressPhaseBegan:1];
  [(UIHBClickGestureRecognizer *)self->_singlePressDownGestureRecognizer setClickCount:1];
  [(UIHBClickGestureRecognizer *)self->_singlePressDownGestureRecognizer setEnabled:0];
  [(UIWindow *)self->_window addGestureRecognizer:self->_singlePressDownGestureRecognizer];
  id v5 = (UIHBClickGestureRecognizer *)[objc_alloc((Class)UIHBClickGestureRecognizer) initWithTarget:self action:"homeButtonTriplePressUp:"];
  triplePressUpGestureRecognizer = self->_triplePressUpGestureRecognizer;
  self->_triplePressUpGestureRecognizer = v5;

  [(UIHBClickGestureRecognizer *)self->_triplePressUpGestureRecognizer setClickCount:3];
  window = self->_window;
  v8 = self->_triplePressUpGestureRecognizer;

  [(UIWindow *)window addGestureRecognizer:v8];
}

- (void)presentDataRecovery
{
  v3 = [[PBADataRecoveryViewController alloc] initWithContainingStackViewController:self->_stackViewController];
  [(PBADataRecoveryViewController *)v3 setDataRecoveryEngine:self->_dataRecoveryEngine];
  [(PBAAppDelegate *)self setMainViewController:v3];
}

- (void)presentDeviceUnlock
{
  int64_t v4 = objc_alloc_init(PBAAuthenticationPolicy);
  [(PBAAuthenticationPolicy *)v4 setDelegate:self];
  v3 = [(PBADevicePasscodeViewController *)[PBADeviceUnlockViewController alloc] initWithContainingStackViewController:self->_stackViewController authenticationPolicy:v4];
  [(PBAAppDelegate *)self setMainViewController:v3];
}

- (void)presentLAPasscodeVerification
{
  int64_t v4 = objc_alloc_init(PBAAuthenticationPolicy);
  [(PBAAuthenticationPolicy *)v4 setDelegate:self];
  v3 = [(PBADevicePasscodeViewController *)[PBAProtectedOptionsViewController alloc] initWithContainingStackViewController:self->_stackViewController authenticationPolicy:v4];
  [(PBAAppDelegate *)self setMainViewController:v3];
}

- (void)setMainViewController:(id)a3
{
  stackViewController = self->_stackViewController;
  id v7 = a3;
  id v5 = [(PBAStackViewController *)stackViewController topViewController];
  BOOL v6 = v5 != 0;

  [(PBAAppDelegate *)self setMainViewController:v7 animated:v6];
}

- (void)setMainViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (UIViewController *)a3;
  p_mainViewController = &self->_mainViewController;
  if (self->_mainViewController != v7)
  {
    objc_storeStrong((id *)&self->_mainViewController, a3);
    stackViewController = self->_stackViewController;
    v11 = *p_mainViewController;
    v10 = +[NSArray arrayWithObjects:&v11 count:1];
    [(PBAStackViewController *)stackViewController setViewControllers:v10 animated:v4];
  }
}

- (void)_reconfigureHomeButton
{
  CFArrayRef v2 = (const __CFArray *)_AXSTripleClickCopyOptions();
  v3 = sub_1000085D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000FE4C((uint64_t)v2, v3);
  }

  if (v2)
  {
    if (CFArrayGetCount(v2) < 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 3;
    }
    CFRelease(v2);
  }
  else
  {
    uint64_t v4 = 1;
  }
  _AXSHomeClickSpeed();
  double v6 = 0.100000001;
  if (v5 <= 0.0)
  {
    float v7 = 0.3;
  }
  else
  {
    float v7 = v5;
    v8 = sub_1000085D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "maximumMultiplePressInterval override from AX is:%g", buf, 0xCu);
    }

    if (v7 < 0.1)
    {
      v9 = sub_1000085D4();
      double v6 = v7;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        double v16 = v7;
        __int16 v17 = 2048;
        double v18 = v7;
        __int16 v19 = 2048;
        double v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "multiplePressInterval: minimum > maximum, using maximum(%g): %g > %g", buf, 0x20u);
      }
    }
  }
  v10 = +[BKSButtonHapticsDefinition definitionForHomeButton];
  [v10 setMaximumPressCount:v4];
  [v10 setMinimumMultiplePressTimeInterval:v6];
  [v10 setMaximumMultiplePressTimeInterval:v7];
  v11 = sub_1000085D4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    double v16 = *(double *)&v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "new button definition:%{public}@", buf, 0xCu);
  }

  int64_t v12 = +[BKSButtonHapticsController sharedInstance];
  v14 = v10;
  v13 = +[NSArray arrayWithObjects:&v14 count:1];
  [v12 applyDefinitions:v13];
}

- (void)_resetIdleTimerForReason:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1000085D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Resetting idle timer if needed (reason:%{public}@)", (uint8_t *)&v6, 0xCu);
  }

  float v5 = +[PBAIdleSleepController sharedController];
  if ([v5 isDisplayDim]) {
    [v5 resetIdleTimerAndUndim:1];
  }
}

- (void)homeButtonSinglePressDown:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(PBAAppDelegate *)self _resetIdleTimerForReason:@"home button single press down"];
  }
}

- (void)homeButtonTriplePressUp:(id)a3
{
  if ([a3 state] == (id)3)
  {
    id v3 = sub_1000085D4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "home button triple press up! Hello AX", v4, 2u);
    }

    _AXSHandleTripleClickHomeButtonPress();
  }
}

- (void)tapToWake:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(PBAAppDelegate *)self _resetIdleTimerForReason:@"tap to wake"];
  }
}

- (void)mouseButtonDown:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(PBAAppDelegate *)self _resetIdleTimerForReason:@"mouse button"];
  }
}

- (void)displayDidBlank:(id)a3
{
  id v4 = objc_alloc((Class)BKSTouchStream);
  id v5 = [(UIWindow *)self->_window _contextId];
  id v6 = objc_alloc_init((Class)BKSTouchStreamPolicy);
  id v7 = (BKSTouchStream *)[v4 initWithContextID:v5 displayUUID:0 identifier:1 policy:v6];
  touchStream = self->_touchStream;
  self->_touchStream = v7;

  [(SBFTapToWakeGestureRecognizer *)self->_tapToWakeGestureRecognizer setEnabled:1];
  singlePressDownGestureRecognizer = self->_singlePressDownGestureRecognizer;

  [(UIHBClickGestureRecognizer *)singlePressDownGestureRecognizer setEnabled:1];
}

- (void)displayWillUnblank:(id)a3
{
  [(UIHBClickGestureRecognizer *)self->_singlePressDownGestureRecognizer setEnabled:0];
  [(SBFTapToWakeGestureRecognizer *)self->_tapToWakeGestureRecognizer setEnabled:0];
  [(BKSTouchStream *)self->_touchStream invalidate];
  touchStream = self->_touchStream;
  self->_touchStream = 0;
}

- (void)_createInitialAppScene
{
  id v3 = +[FBSMutableSceneDefinition definition];
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 bundleIdentifier];
  id v6 = +[FBSSceneIdentity identityForIdentifier:v5];
  [v3 setIdentity:v6];

  id v7 = +[FBSSceneClientIdentity localIdentity];
  [v3 setClientIdentity:v7];

  v8 = +[UIApplicationSceneSpecification specification];
  [v3 setSpecification:v8];

  v9 = [v3 specification];
  v10 = +[FBSMutableSceneParameters parametersForSpecification:v9];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000758C;
  v19[3] = &unk_10001C828;
  v19[4] = self;
  [v10 updateSettingsWithBlock:v19];
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  double v16 = sub_10000767C;
  __int16 v17 = &unk_10001C850;
  id v18 = v10;
  id v11 = v10;
  [v11 updateClientSettingsWithBlock:&v14];
  int64_t v12 = +[FBSceneManager sharedInstance];
  v13 = [v12 createSceneWithDefinition:v3 initialParameters:v11];

  [(UIRootWindowScenePresentationBinder *)self->_rootWindowScenePresentationBinder addScene:v13];
}

- (void)_createInputUIScene
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v3 = +[NSUUID UUID];
    id v4 = [v3 UUIDString];

    id v5 = +[FBSMutableSceneDefinition definition];
    id v6 = +[FBSSceneIdentity identityForIdentifier:v4];
    [v5 setIdentity:v6];

    id v7 = +[RBSProcessIdentity identityForAngelJobLabel:@"com.apple.InputUI"];
    if (v7)
    {
      v8 = +[FBSSceneClientIdentity identityForProcessIdentity:v7];
      [v5 setClientIdentity:v8];

      v9 = +[UIApplicationSceneSpecification specification];
      [v5 setSpecification:v9];

      v10 = +[FBSceneManager sharedInstance];
      id v11 = [v10 createSceneWithDefinition:v5];

      if (v11)
      {
        +[FBDisplayManager mainConfiguration];
        v13 = _NSConcreteStackBlock;
        uint64_t v14 = 3221225472;
        uint64_t v15 = sub_100007920;
        double v16 = &unk_10001C878;
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        id v18 = self;
        int64_t v12 = v17;
        [v11 performUpdate:&v13];
        -[UIRootWindowScenePresentationBinder addScene:](self->_rootWindowScenePresentationBinder, "addScene:", v11, v13, v14, v15, v16);
      }
      else
      {
        int64_t v12 = sub_1000085D4();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10000FF08(v12);
        }
      }
    }
    else
    {
      id v11 = sub_1000085D4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10000FEC4(v11);
      }
    }
  }
}

- (int64_t)_computeBootOrientation
{
  int v2 = MGGetSInt32Answer();
  int64_t v3 = 1;
  if (v2 == 90) {
    int64_t v3 = 3;
  }
  if (v2 == 180) {
    int64_t v3 = 2;
  }
  if (v2 == 270) {
    return 4;
  }
  else {
    return v3;
  }
}

- (void)sceneManager:(id)a3 didCreateScene:(id)a4
{
  id v5 = a4;
  id v6 = (void *)_UIKeyboardArbiter_SceneIdentifier;
  id v7 = [v5 identifier];
  if ([v6 isEqualToString:v7])
  {
    unsigned __int8 v8 = +[UIKeyboard usesInputSystemUI];

    if ((v8 & 1) == 0)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100007AF8;
      v9[3] = &unk_10001C8E0;
      v9[4] = self;
      id v10 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
    }
  }
  else
  {
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (UIRootWindowScenePresentationBinder)rootWindowScenePresentationBinder
{
  return self->_rootWindowScenePresentationBinder;
}

- (void)setRootWindowScenePresentationBinder:(id)a3
{
}

- (UIViewController)mainViewController
{
  return self->_mainViewController;
}

- (UIHBClickGestureRecognizer)singlePressDownGestureRecognizer
{
  return self->_singlePressDownGestureRecognizer;
}

- (void)setSinglePressDownGestureRecognizer:(id)a3
{
}

- (UIHBClickGestureRecognizer)triplePressUpGestureRecognizer
{
  return self->_triplePressUpGestureRecognizer;
}

- (void)setTriplePressUpGestureRecognizer:(id)a3
{
}

- (SBFTapToWakeGestureRecognizer)tapToWakeGestureRecognizer
{
  return self->_tapToWakeGestureRecognizer;
}

- (void)setTapToWakeGestureRecognizer:(id)a3
{
}

- (SBFMouseButtonDownGestureRecognizer)mouseButtonDownGestureRecognizer
{
  return self->_mouseButtonDownGestureRecognizer;
}

- (void)setMouseButtonDownGestureRecognizer:(id)a3
{
}

- (BKSTouchStream)touchStream
{
  return self->_touchStream;
}

- (void)setTouchStream:(id)a3
{
}

- (PBADataRecoveryEngine)dataRecoveryEngine
{
  return self->_dataRecoveryEngine;
}

- (void)setDataRecoveryEngine:(id)a3
{
}

- (PBAStackViewController)stackViewController
{
  return self->_stackViewController;
}

- (void)setStackViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackViewController, 0);
  objc_storeStrong((id *)&self->_dataRecoveryEngine, 0);
  objc_storeStrong((id *)&self->_touchStream, 0);
  objc_storeStrong((id *)&self->_mouseButtonDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapToWakeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_triplePressUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singlePressDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_mainViewController, 0);
  objc_storeStrong((id *)&self->_rootWindowScenePresentationBinder, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end