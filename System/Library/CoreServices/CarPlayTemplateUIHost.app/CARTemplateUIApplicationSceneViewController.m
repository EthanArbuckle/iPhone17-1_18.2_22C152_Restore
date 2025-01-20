@interface CARTemplateUIApplicationSceneViewController
- (BOOL)invalidated;
- (CARTemplateUIApplicationSceneViewController)initWithWindowScene:(id)a3 templateInstance:(id)a4;
- (CPSTemplateInstance)templateInstance;
- (CRSUIApplicationSceneSettingsDiffInspector)appSettingsDiffInspector;
- (FBApplicationUpdateScenesTransaction)currentTransaction;
- (FBApplicationUpdateScenesTransaction)pendingTransaction;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSSceneSettingsDiffInspector)settingsDiffInspector;
- (FBScene)scene;
- (NSString)applicationIdentifier;
- (NSString)requester;
- (UIActivityContinuationAction)pendingActivityContinuationAction;
- (UIScenePresentation)sceneHostView;
- (UIScenePresenter)scenePresenter;
- (UIViewController)overlayViewController;
- (UIWindowScene)windowScene;
- (id)_frameRateLimit;
- (id)_sceneSettings;
- (int64_t)_mapStyle;
- (void)_handleActivityContinuationAction:(id)a3;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_updateUserInterfaceStyle;
- (void)dealloc;
- (void)forwardActivityContinuationAction:(id)a3 fromScene:(id)a4;
- (void)invalidate;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)sendSceneUpdate:(BOOL)a3 openURLContexts:(id)a4;
- (void)setAppSettingsDiffInspector:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setOverlayViewController:(id)a3;
- (void)setPendingActivityContinuationAction:(id)a3;
- (void)setPendingTransaction:(id)a3;
- (void)setRequester:(id)a3;
- (void)setScene:(id)a3;
- (void)setSceneHostView:(id)a3;
- (void)setScenePresenter:(id)a3;
- (void)setSettingsDiffInspector:(id)a3;
- (void)setTemplateInstance:(id)a3;
- (void)setWindowScene:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation CARTemplateUIApplicationSceneViewController

- (CARTemplateUIApplicationSceneViewController)initWithWindowScene:(id)a3 templateInstance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)CARTemplateUIApplicationSceneViewController;
  v8 = [(CARTemplateUIApplicationSceneViewController *)&v41 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_windowScene, v6);
    objc_storeStrong((id *)&v9->_templateInstance, a4);
    v10 = (FBSSceneSettingsDiffInspector *)objc_alloc_init((Class)FBSSceneSettingsDiffInspector);
    settingsDiffInspector = v9->_settingsDiffInspector;
    v9->_settingsDiffInspector = v10;

    objc_initWeak(&location, v9);
    v12 = v9->_settingsDiffInspector;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10000CD00;
    v38[3] = &unk_10001C468;
    objc_copyWeak(&v39, &location);
    [(FBSSceneSettingsDiffInspector *)v12 observeFrameWithBlock:v38];
    v42 = v9;
    v13 = +[NSArray arrayWithObjects:&v42 count:1];
    [v6 _registerSettingsDiffActionArray:v13 forKey:@"settingsObserver"];

    v14 = (CRSUIApplicationSceneSettingsDiffInspector *)objc_alloc_init((Class)CRSUIApplicationSceneSettingsDiffInspector);
    appSettingsDiffInspector = v9->_appSettingsDiffInspector;
    v9->_appSettingsDiffInspector = v14;

    v16 = v9->_appSettingsDiffInspector;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000CE0C;
    v36[3] = &unk_10001C468;
    objc_copyWeak(&v37, &location);
    [(CRSUIApplicationSceneSettingsDiffInspector *)v16 observeMapStyleWithBlock:v36];
    v17 = v9->_appSettingsDiffInspector;
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    v33 = sub_10000CF2C;
    v34 = &unk_10001C468;
    objc_copyWeak(&v35, &location);
    [(CRSUIApplicationSceneSettingsDiffInspector *)v17 observeFrameRateLimitWithBlock:&v31];
    objc_opt_class();
    v18 = [v6 _FBSScene];
    id v19 = [v18 settings];
    if (v19 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }

    uint64_t v21 = [v20 proxiedApplicationBundleIdentifier];
    applicationIdentifier = v9->_applicationIdentifier;
    v9->_applicationIdentifier = (NSString *)v21;

    v23 = [v6 _FBSScene];
    v24 = [v23 settings];
    uint64_t v25 = [v24 displayConfiguration];
    displayConfiguration = v9->_displayConfiguration;
    v9->_displayConfiguration = (FBSDisplayConfiguration *)v25;

    [v6 setDelegate:v9];
    v27 = +[BSDescriptionBuilder descriptionForObject:v9];
    uint64_t v28 = +[NSString stringWithFormat:@"%@-%u", v27, ++dword_100025A58, v31, v32, v33, v34];
    requester = v9->_requester;
    v9->_requester = (NSString *)v28;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)dealloc
{
  v3 = [(CARTemplateUIApplicationSceneViewController *)self scenePresenter];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CARTemplateUIApplicationSceneViewController;
  [(CARTemplateUIApplicationSceneViewController *)&v4 dealloc];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CARTemplateUIApplicationSceneViewController;
  [(CARTemplateUIApplicationSceneViewController *)&v4 traitCollectionDidChange:a3];
  [(CARTemplateUIApplicationSceneViewController *)self _updateUserInterfaceStyle];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CARTemplateUIApplicationSceneViewController;
  [(CARTemplateUIApplicationSceneViewController *)&v5 viewDidLoad];
  v3 = [(CARTemplateUIApplicationSceneViewController *)self templateInstance];
  objc_super v4 = [v3 overlayViewController];
  [(CARTemplateUIApplicationSceneViewController *)self setOverlayViewController:v4];
}

- (void)setOverlayViewController:(id)a3
{
  id v5 = a3;
  p_overlayViewController = &self->_overlayViewController;
  overlayViewController = self->_overlayViewController;
  v22 = v5;
  if (overlayViewController)
  {
    [(UIViewController *)overlayViewController willMoveToParentViewController:0];
    v8 = [(UIViewController *)*p_overlayViewController view];
    [v8 removeFromSuperview];

    [(UIViewController *)*p_overlayViewController removeFromParentViewController];
    v9 = *p_overlayViewController;
    *p_overlayViewController = 0;

    id v5 = v22;
  }
  if (v5)
  {
    [(CARTemplateUIApplicationSceneViewController *)self addChildViewController:v22];
    v10 = [(CARTemplateUIApplicationSceneViewController *)self view];
    v11 = [v22 view];
    [v10 addSubview:v11];

    v12 = [(CARTemplateUIApplicationSceneViewController *)self view];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    uint64_t v21 = [v22 view];
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    [v22 didMoveToParentViewController:self];
    objc_storeStrong((id *)&self->_overlayViewController, a3);
  }

  _objc_release_x1();
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
}

- (void)setScene:(id)a3
{
  id v5 = a3;
  id v6 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setScene: %@", buf, 0xCu);
  }

  id v7 = [(CARTemplateUIApplicationSceneViewController *)self scenePresenter];
  [v7 invalidate];

  [(CARTemplateUIApplicationSceneViewController *)self setScenePresenter:0];
  v8 = [(CARTemplateUIApplicationSceneViewController *)self sceneHostView];
  [v8 removeFromSuperview];

  [(CARTemplateUIApplicationSceneViewController *)self setSceneHostView:0];
  p_scene = &self->_scene;
  scene = self->_scene;
  self->_scene = 0;

  if (v5)
  {
    objc_storeStrong((id *)&self->_scene, a3);
    v11 = [(CARTemplateUIApplicationSceneViewController *)self templateInstance];
    [v11 setScene:v5];

    v12 = [(FBScene *)*p_scene uiPresentationManager];
    double v13 = [(CARTemplateUIApplicationSceneViewController *)self requester];
    double v14 = [v12 createPresenterWithIdentifier:v13 priority:1];
    [(CARTemplateUIApplicationSceneViewController *)self setScenePresenter:v14];

    double v15 = [(CARTemplateUIApplicationSceneViewController *)self scenePresenter];
    [v15 modifyPresentationContext:&stru_10001C658];

    double v16 = [(CARTemplateUIApplicationSceneViewController *)self scenePresenter];
    [v16 activate];

    double v17 = [(CARTemplateUIApplicationSceneViewController *)self scenePresenter];
    double v18 = [v17 presentationView];
    [(CARTemplateUIApplicationSceneViewController *)self setSceneHostView:v18];

    double v19 = [(CARTemplateUIApplicationSceneViewController *)self view];
    double v20 = [(CARTemplateUIApplicationSceneViewController *)self sceneHostView];
    [v19 insertSubview:v20 atIndex:0];

    double y = CGPointZero.y;
    v22 = [(FBScene *)*p_scene settings];
    [v22 frame];
    double v24 = v23;
    double v26 = v25;
    v27 = [(CARTemplateUIApplicationSceneViewController *)self sceneHostView];
    objc_msgSend(v27, "setFrame:", CGPointZero.x, y, v24, v26);

    uint64_t v28 = [(CARTemplateUIApplicationSceneViewController *)self view];
    [v28 setNeedsLayout];

    v29 = [(CARTemplateUIApplicationSceneViewController *)self pendingActivityContinuationAction];

    if (v29)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000D6CC;
      block[3] = &unk_10001C518;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v3 = a3;
  objc_super v4 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "sceneDidDisconnect: %@", (uint8_t *)&v5, 0xCu);
  }

  [v3 setDelegate:0];
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3 = a3;
  objc_super v4 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "sceneDidBecomeActive: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = a3;
  objc_super v4 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "sceneWillResignActive: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  int v5 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "sceneWillEnterForeground: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CARTemplateUIApplicationSceneViewController *)self sendSceneUpdate:1 openURLContexts:0];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  int v5 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "sceneDidEnterBackground: %@", (uint8_t *)&v6, 0xCu);
  }

  [(CARTemplateUIApplicationSceneViewController *)self sendSceneUpdate:0 openURLContexts:0];
}

- (void)forwardActivityContinuationAction:(id)a3 fromScene:(id)a4
{
  id v6 = a3;
  int v5 = [(CARTemplateUIApplicationSceneViewController *)self scene];

  if (v5) {
    [(CARTemplateUIApplicationSceneViewController *)self _handleActivityContinuationAction:v6];
  }
  else {
    [(CARTemplateUIApplicationSceneViewController *)self setPendingActivityContinuationAction:v6];
  }
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10 = a5;
  id v11 = a4;
  v12 = [(CARTemplateUIApplicationSceneViewController *)self settingsDiffInspector];
  [v12 inspectDiff:v10 withContext:0];

  id v13 = [(CARTemplateUIApplicationSceneViewController *)self appSettingsDiffInspector];
  [v13 inspectDiff:v10 withContext:v11];
}

- (void)sendSceneUpdate:(BOOL)a3 openURLContexts:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(CARTemplateUIApplicationSceneViewController *)self invalidated])
  {
    id v7 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100011B70((uint64_t)self, v7);
    }
  }
  else
  {
    id v35 = v6;
    id v7 = objc_alloc_init((Class)CPUITemplateApplicationSceneSpecification);
    v8 = [(CARTemplateUIApplicationSceneViewController *)self scene];

    if (v8)
    {
      id v9 = [(CARTemplateUIApplicationSceneViewController *)self scene];
      id v10 = [v9 settings];
      id v11 = [v10 mutableCopy];
    }
    else
    {
      id v9 = objc_alloc_init((Class)[v7 settingsClass]);
      id v11 = [v9 mutableCopy];
    }

    id v36 = objc_alloc_init((Class)[v7 transitionContextClass]);
    v12 = [(CARTemplateUIApplicationSceneViewController *)self displayConfiguration];
    [v11 setDisplayConfiguration:v12];

    id v13 = [(CARTemplateUIApplicationSceneViewController *)self view];
    [v13 bounds];
    objc_msgSend(v11, "setFrame:");

    [v11 setLevel:1.0];
    [v11 setInterfaceOrientation:1];
    [v11 setForeground:v4];
    double v14 = [(CARTemplateUIApplicationSceneViewController *)self templateInstance];
    double v15 = [v14 endpoint];
    [v11 setEndpoint:v15];

    double v16 = [(CARTemplateUIApplicationSceneViewController *)self traitCollection];
    objc_msgSend(v11, "setUserInterfaceStyle:", objc_msgSend(v16, "userInterfaceStyle"));

    objc_msgSend(v11, "setMapStyle:", -[CARTemplateUIApplicationSceneViewController _mapStyle](self, "_mapStyle"));
    double v17 = [(CARTemplateUIApplicationSceneViewController *)self _frameRateLimit];
    [v11 setFrameRateLimit:v17];

    double v18 = +[FBSMutableSceneParameters parametersForSpecification:v7];
    [v18 setSettings:v11];
    double v19 = [(CARTemplateUIApplicationSceneViewController *)self applicationIdentifier];
    uint64_t v20 = +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:v19];

    id v21 = objc_alloc((Class)FBApplicationUpdateScenesTransaction);
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10000E188;
    v45[3] = &unk_10001C540;
    id v33 = v11;
    v34 = (void *)v20;
    id v46 = v33;
    location[1] = _NSConcreteStackBlock;
    location[2] = (id)3221225472;
    location[3] = sub_10000E1EC;
    location[4] = &unk_10001C568;
    id v22 = [v21 initWithProcessIdentity:v20 executionContextProvider:v45];
    id v44 = v22;
    double v23 = BSLogAddStateCaptureBlockWithTitle();
    objc_initWeak(location, self);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10000E254;
    v39[3] = &unk_10001C680;
    id v24 = v23;
    id v40 = v24;
    objc_copyWeak(&v42, location);
    id v25 = v35;
    id v41 = v25;
    [v22 setCompletionBlock:v39];
    if (v25)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10000E404;
      v37[3] = &unk_10001C5B8;
      id v26 = objc_alloc_init((Class)NSMutableSet);
      id v38 = v26;
      [v25 enumerateObjectsUsingBlock:v37];
      [v36 setActions:v26];
    }
    v27 = [(CARTemplateUIApplicationSceneViewController *)self displayConfiguration];
    uint64_t v28 = [v27 identity];
    v29 = [(CARTemplateUIApplicationSceneViewController *)self applicationIdentifier];
    v30 = +[NSString stringWithFormat:@"%@:%@", v28, v29];

    [v22 setWaitsForSceneCommits:0];
    v31 = +[FBSSceneIdentity identityForIdentifier:v30 workspaceIdentifier:@"kCARTemplateUIAppWorkspaceIdentifier"];
    [v22 updateSceneWithIdentity:v31 parameters:v18 transitionContext:v36];
    id v32 = [(CARTemplateUIApplicationSceneViewController *)self currentTransaction];

    if (v32)
    {
      [(CARTemplateUIApplicationSceneViewController *)self setPendingTransaction:v22];
    }
    else
    {
      [(CARTemplateUIApplicationSceneViewController *)self setCurrentTransaction:v22];
      [v22 begin];
    }

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);

    id v6 = v35;
  }
}

- (void)_handleActivityContinuationAction:(id)a3
{
  id v4 = a3;
  int v5 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CARTemplateUIApplicationSceneViewController *)self scene];
    *(_DWORD *)buf = 138543618;
    id v12 = v4;
    __int16 v13 = 2114;
    double v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Forwarding activity continuation action %{public}@ to scene: %{public}@", buf, 0x16u);
  }
  id v7 = [(CARTemplateUIApplicationSceneViewController *)self scene];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000E658;
  v9[3] = &unk_10001C6A8;
  id v10 = v4;
  id v8 = v4;
  [v7 updateUISettingsWithTransitionBlock:v9];
}

- (void)_updateUserInterfaceStyle
{
  id v3 = [(CARTemplateUIApplicationSceneViewController *)self scene];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E74C;
  v4[3] = &unk_10001C490;
  v4[4] = self;
  [v3 updateUISettingsWithBlock:v4];
}

- (void)invalidate
{
  [(CARTemplateUIApplicationSceneViewController *)self setInvalidated:1];
  id v3 = [(CARTemplateUIApplicationSceneViewController *)self windowScene];
  [v3 _unregisterSettingsDiffActionArrayForKey:@"settingsObserver"];
}

- (id)_sceneSettings
{
  id v3 = [(CARTemplateUIApplicationSceneViewController *)self windowScene];
  id v4 = [v3 _FBSScene];
  int v5 = [v4 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(CARTemplateUIApplicationSceneViewController *)self windowScene];
    id v8 = [v7 _FBSScene];
    id v9 = [v8 settings];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (int64_t)_mapStyle
{
  v2 = [(CARTemplateUIApplicationSceneViewController *)self _sceneSettings];
  id v3 = [v2 mapStyle];

  return (int64_t)v3;
}

- (id)_frameRateLimit
{
  v2 = [(CARTemplateUIApplicationSceneViewController *)self _sceneSettings];
  id v3 = [v2 frameRateLimit];

  return v3;
}

- (UIViewController)overlayViewController
{
  return self->_overlayViewController;
}

- (FBScene)scene
{
  return self->_scene;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setDisplayConfiguration:(id)a3
{
}

- (FBApplicationUpdateScenesTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (FBApplicationUpdateScenesTransaction)pendingTransaction
{
  return self->_pendingTransaction;
}

- (void)setPendingTransaction:(id)a3
{
}

- (UIScenePresenter)scenePresenter
{
  return self->_scenePresenter;
}

- (void)setScenePresenter:(id)a3
{
}

- (UIScenePresentation)sceneHostView
{
  return self->_sceneHostView;
}

- (void)setSceneHostView:(id)a3
{
}

- (NSString)requester
{
  return self->_requester;
}

- (void)setRequester:(id)a3
{
}

- (FBSSceneSettingsDiffInspector)settingsDiffInspector
{
  return self->_settingsDiffInspector;
}

- (void)setSettingsDiffInspector:(id)a3
{
}

- (CRSUIApplicationSceneSettingsDiffInspector)appSettingsDiffInspector
{
  return self->_appSettingsDiffInspector;
}

- (void)setAppSettingsDiffInspector:(id)a3
{
}

- (CPSTemplateInstance)templateInstance
{
  return self->_templateInstance;
}

- (void)setTemplateInstance:(id)a3
{
}

- (UIActivityContinuationAction)pendingActivityContinuationAction
{
  return self->_pendingActivityContinuationAction;
}

- (void)setPendingActivityContinuationAction:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  return (UIWindowScene *)WeakRetained;
}

- (void)setWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_pendingActivityContinuationAction, 0);
  objc_storeStrong((id *)&self->_templateInstance, 0);
  objc_storeStrong((id *)&self->_appSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_settingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_requester, 0);
  objc_storeStrong((id *)&self->_sceneHostView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_pendingTransaction, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_scene, 0);

  objc_storeStrong((id *)&self->_overlayViewController, 0);
}

@end