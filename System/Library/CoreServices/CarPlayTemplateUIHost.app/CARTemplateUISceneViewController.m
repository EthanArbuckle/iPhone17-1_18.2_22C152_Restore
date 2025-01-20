@interface CARTemplateUISceneViewController
+ (Class)sceneSpecificationClass;
+ (id)sceneIdentifierSuffix;
- (BOOL)invalidated;
- (CARTemplateUISceneViewController)initWithWindowScene:(id)a3 templateInstance:(id)a4 bundleIdentifier:(id)a5;
- (CPSTemplateInstance)templateInstance;
- (CRSUIApplicationSceneSettingsDiffInspector)appSettingsDiffInspector;
- (FBApplicationUpdateScenesTransaction)currentTransaction;
- (FBApplicationUpdateScenesTransaction)pendingTransaction;
- (FBSDisplayConfiguration)displayConfiguration;
- (FBSSceneSettingsDiffInspector)settingsDiffInspector;
- (FBScene)scene;
- (NSNumber)frameRateLimit;
- (NSString)applicationIdentifier;
- (NSString)requester;
- (NSString)sceneID;
- (UIEdgeInsets)_safeAreaInsets;
- (UIScenePresentation)sceneHostView;
- (UIScenePresenter)scenePresenter;
- (UIViewController)overlayViewController;
- (UIWindowScene)windowScene;
- (id)workspaceIdentifier;
- (int64_t)mapStyle;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)_updateUserInterfaceStyle;
- (void)dealloc;
- (void)invalidate;
- (void)loadView;
- (void)prepareSettings:(id)a3;
- (void)removeFromParentViewController;
- (void)sceneContentStateDidChange:(id)a3;
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
- (void)setPendingTransaction:(id)a3;
- (void)setRequester:(id)a3;
- (void)setScene:(id)a3;
- (void)setSceneHostView:(id)a3;
- (void)setSceneID:(id)a3;
- (void)setScenePresenter:(id)a3;
- (void)setSettingsDiffInspector:(id)a3;
- (void)setTemplateInstance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation CARTemplateUISceneViewController

- (CARTemplateUISceneViewController)initWithWindowScene:(id)a3 templateInstance:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v35 = a4;
  id v9 = a5;
  v43.receiver = self;
  v43.super_class = (Class)CARTemplateUISceneViewController;
  v10 = [(CARTemplateUISceneViewController *)&v43 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_windowScene, v8);
    objc_storeStrong((id *)&v11->_templateInstance, a4);
    v12 = (FBSSceneSettingsDiffInspector *)objc_alloc_init((Class)FBSSceneSettingsDiffInspector);
    settingsDiffInspector = v11->_settingsDiffInspector;
    v11->_settingsDiffInspector = v12;

    objc_initWeak(&location, v11);
    v14 = v11->_settingsDiffInspector;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000082E0;
    v40[3] = &unk_10001C468;
    objc_copyWeak(&v41, &location);
    [(FBSSceneSettingsDiffInspector *)v14 observeFrameWithBlock:v40];
    v15 = (CRSUIApplicationSceneSettingsDiffInspector *)objc_alloc_init((Class)CRSUIApplicationSceneSettingsDiffInspector);
    appSettingsDiffInspector = v11->_appSettingsDiffInspector;
    v11->_appSettingsDiffInspector = v15;

    v17 = v11->_appSettingsDiffInspector;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000083EC;
    v38[3] = &unk_10001C468;
    objc_copyWeak(&v39, &location);
    [(CRSUIApplicationSceneSettingsDiffInspector *)v17 observeMapStyleWithBlock:v38];
    v18 = v11->_appSettingsDiffInspector;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000851C;
    v36[3] = &unk_10001C468;
    objc_copyWeak(&v37, &location);
    [(CRSUIApplicationSceneSettingsDiffInspector *)v18 observeFrameRateLimitWithBlock:v36];
    v44 = v11;
    v19 = +[NSArray arrayWithObjects:&v44 count:1];
    [v8 _registerSettingsDiffActionArray:v19 forKey:@"frameObserver"];

    v20 = (NSString *)[v9 copy];
    applicationIdentifier = v11->_applicationIdentifier;
    v11->_applicationIdentifier = v20;

    v22 = [v8 _FBSScene];
    v23 = [v22 settings];
    uint64_t v24 = [v23 displayConfiguration];
    displayConfiguration = v11->_displayConfiguration;
    v11->_displayConfiguration = (FBSDisplayConfiguration *)v24;

    v26 = [(FBSDisplayConfiguration *)v11->_displayConfiguration identity];
    v27 = v11->_applicationIdentifier;
    v28 = [(id)objc_opt_class() sceneIdentifierSuffix];
    uint64_t v29 = +[NSString stringWithFormat:@"%@:%@%@", v26, v27, v28];
    sceneID = v11->_sceneID;
    v11->_sceneID = (NSString *)v29;

    [v8 setDelegate:v11];
    v31 = +[BSDescriptionBuilder descriptionForObject:v11];
    uint64_t v32 = +[NSString stringWithFormat:@"%@-%u", v31, ++dword_100025998];
    requester = v11->_requester;
    v11->_requester = (NSString *)v32;

    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)dealloc
{
  v3 = [(CARTemplateUISceneViewController *)self scenePresenter];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CARTemplateUISceneViewController;
  [(CARTemplateUISceneViewController *)&v4 dealloc];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CARTemplateUISceneViewController;
  [(CARTemplateUISceneViewController *)&v4 traitCollectionDidChange:a3];
  [(CARTemplateUISceneViewController *)self _updateUserInterfaceStyle];
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)CARTemplateUISceneViewController;
  [(CARTemplateUISceneViewController *)&v4 loadView];
  v3 = [(CARTemplateUISceneViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CARTemplateUISceneViewController;
  [(CARTemplateUISceneViewController *)&v5 viewDidLayoutSubviews];
  v3 = [(CARTemplateUISceneViewController *)self scene];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008850;
  v4[3] = &unk_10001C490;
  v4[4] = self;
  [v3 updateUISettingsWithBlock:v4];
}

- (UIEdgeInsets)_safeAreaInsets
{
  v3 = [(CARTemplateUISceneViewController *)self templateInstance];
  objc_super v4 = [(CARTemplateUISceneViewController *)self scene];
  [v3 safeAreaInsetsForScene:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)removeFromParentViewController
{
  v7.receiver = self;
  v7.super_class = (Class)CARTemplateUISceneViewController;
  [(CARTemplateUISceneViewController *)&v7 removeFromParentViewController];
  v3 = [(CARTemplateUISceneViewController *)self scene];

  if (v3)
  {
    objc_super v4 = +[FBSceneManager sharedInstance];
    double v5 = [(CARTemplateUISceneViewController *)self scene];
    double v6 = [v5 identifier];
    [v4 destroyScene:v6 withTransitionContext:0];
  }
}

- (void)setScene:(id)a3
{
  id v5 = a3;
  double v6 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setScene: %@", buf, 0xCu);
  }

  objc_super v7 = [(CARTemplateUISceneViewController *)self scenePresenter];
  [v7 invalidate];

  [(CARTemplateUISceneViewController *)self setScenePresenter:0];
  double v8 = [(CARTemplateUISceneViewController *)self sceneHostView];
  [v8 removeFromSuperview];

  [(CARTemplateUISceneViewController *)self setSceneHostView:0];
  p_scene = &self->_scene;
  scene = self->_scene;
  self->_scene = 0;

  if (v5)
  {
    objc_storeStrong((id *)&self->_scene, a3);
    [(FBScene *)*p_scene addObserver:self];
    double v11 = [(FBScene *)*p_scene uiPresentationManager];
    double v12 = [(CARTemplateUISceneViewController *)self requester];
    double v13 = [v11 createPresenterWithIdentifier:v12 priority:1];
    [(CARTemplateUISceneViewController *)self setScenePresenter:v13];

    double v14 = [(CARTemplateUISceneViewController *)self scenePresenter];
    [v14 modifyPresentationContext:&stru_10001C4D0];

    double v15 = [(CARTemplateUISceneViewController *)self scenePresenter];
    [v15 activate];

    double v16 = [(CARTemplateUISceneViewController *)self scenePresenter];
    v17 = [v16 presentationView];
    [(CARTemplateUISceneViewController *)self setSceneHostView:v17];

    v18 = [(CARTemplateUISceneViewController *)self view];
    v19 = [(CARTemplateUISceneViewController *)self sceneHostView];
    [v18 insertSubview:v19 atIndex:0];

    double y = CGPointZero.y;
    v21 = [(FBScene *)*p_scene settings];
    [v21 frame];
    double v23 = v22;
    double v25 = v24;
    v26 = [(CARTemplateUISceneViewController *)self sceneHostView];
    objc_msgSend(v26, "setFrame:", CGPointZero.x, y, v23, v25);

    v27 = [(CARTemplateUISceneViewController *)self view];
    [v27 setNeedsLayout];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008D6C;
    block[3] = &unk_10001C518;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)sendSceneUpdate:(BOOL)a3 openURLContexts:(id)a4
{
  BOOL v4 = a3;
  id v29 = a4;
  if ([(CARTemplateUISceneViewController *)self invalidated])
  {
    double v6 = sub_10000A174(5uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = self;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@ has already been invalidated, ignoring scene update", buf, 0xCu);
    }
  }
  else
  {
    double v6 = objc_alloc_init((Class)[(id)objc_opt_class() sceneSpecificationClass]);
    objc_super v7 = [(CARTemplateUISceneViewController *)self scene];

    if (v7)
    {
      id v8 = [(CARTemplateUISceneViewController *)self scene];
      double v9 = [v8 settings];
      id v10 = [v9 mutableCopy];
    }
    else
    {
      id v8 = objc_alloc_init((Class)[v6 settingsClass]);
      id v10 = [v8 mutableCopy];
    }

    id v28 = objc_alloc_init((Class)[v6 transitionContextClass]);
    double v11 = [(CARTemplateUISceneViewController *)self displayConfiguration];
    [v10 setDisplayConfiguration:v11];

    double v12 = [(CARTemplateUISceneViewController *)self view];
    [v12 bounds];
    objc_msgSend(v10, "setFrame:");

    [(CARTemplateUISceneViewController *)self _safeAreaInsets];
    objc_msgSend(v10, "setSafeAreaInsetsPortrait:");
    [v10 setLevel:1.0];
    [v10 setInterfaceOrientation:1];
    [v10 setForeground:v4];
    double v13 = [(CARTemplateUISceneViewController *)self traitCollection];
    objc_msgSend(v10, "setUserInterfaceStyle:", objc_msgSend(v13, "userInterfaceStyle"));

    [(CARTemplateUISceneViewController *)self prepareSettings:v10];
    double v14 = +[FBSMutableSceneParameters parametersForSpecification:v6];
    [v14 setSettings:v10];
    double v15 = [(CARTemplateUISceneViewController *)self applicationIdentifier];
    uint64_t v26 = +[RBSProcessIdentity identityForEmbeddedApplicationIdentifier:v15];

    id v16 = objc_alloc((Class)FBApplicationUpdateScenesTransaction);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100009410;
    v36[3] = &unk_10001C540;
    id v17 = v10;
    id v37 = v17;
    v34[1] = _NSConcreteStackBlock;
    v34[2] = (id)3221225472;
    v34[3] = sub_100009474;
    v34[4] = &unk_10001C568;
    id v18 = [v16 initWithProcessIdentity:v26 executionContextProvider:v36];
    id v35 = v18;
    v19 = BSLogAddStateCaptureBlockWithTitle();
    objc_initWeak((id *)buf, self);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000094DC;
    v32[3] = &unk_10001C590;
    id v20 = v19;
    id v33 = v20;
    objc_copyWeak(v34, (id *)buf);
    [v18 setCompletionBlock:v32];
    if (v29)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100009588;
      v30[3] = &unk_10001C5B8;
      id v21 = objc_alloc_init((Class)NSMutableSet);
      id v31 = v21;
      [v29 enumerateObjectsUsingBlock:v30];
      [v28 setActions:v21];
    }
    objc_msgSend(v18, "setWaitsForSceneCommits:", 0, v26);
    sceneID = self->_sceneID;
    double v23 = [(CARTemplateUISceneViewController *)self workspaceIdentifier];
    double v24 = +[FBSSceneIdentity identityForIdentifier:sceneID workspaceIdentifier:v23];

    [v18 updateSceneWithIdentity:v24 parameters:v14 transitionContext:v28];
    double v25 = [(CARTemplateUISceneViewController *)self currentTransaction];
    LODWORD(v23) = v25 == 0;

    if (v23)
    {
      [(CARTemplateUISceneViewController *)self setCurrentTransaction:v18];
      [v18 begin];
    }
    else
    {
      [(CARTemplateUISceneViewController *)self setPendingTransaction:v18];
    }

    objc_destroyWeak(v34);
    objc_destroyWeak((id *)buf);
  }
}

- (id)workspaceIdentifier
{
  return 0;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sceneDidDisconnect: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [v3 setDelegate:0];
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sceneDidBecomeActive: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sceneWillResignActive: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  int v5 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sceneWillEnterForeground: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(CARTemplateUISceneViewController *)self sendSceneUpdate:1 openURLContexts:0];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  int v5 = sub_10000A174(5uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "sceneDidEnterBackground: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(CARTemplateUISceneViewController *)self sendSceneUpdate:0 openURLContexts:0];
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v10 = a5;
  id v11 = a4;
  double v12 = [(CARTemplateUISceneViewController *)self appSettingsDiffInspector];
  [v12 inspectDiff:v10 withContext:v11];

  id v13 = [(CARTemplateUISceneViewController *)self settingsDiffInspector];
  [v13 inspectDiff:v10 withContext:0];
}

- (void)invalidate
{
}

- (void)_updateUserInterfaceStyle
{
  id v3 = [(CARTemplateUISceneViewController *)self scene];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009B1C;
  v4[3] = &unk_10001C490;
  v4[4] = self;
  [v3 updateUISettingsWithBlock:v4];
}

- (void)sceneContentStateDidChange:(id)a3
{
  if ([a3 contentState] == (id)2)
  {
    [(CARTemplateUISceneViewController *)self contentReady];
  }
}

+ (id)sceneIdentifierSuffix
{
  return 0;
}

+ (Class)sceneSpecificationClass
{
  return 0;
}

- (void)prepareSettings:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v6 = v4;
    if ([v4 conformsToProtocol:&OBJC_PROTOCOL___CRSUIMutableFrameRateLimitProviding])
    {
      int v5 = [(CARTemplateUISceneViewController *)self frameRateLimit];
      [v6 setFrameRateLimit:v5];
    }
  }

  _objc_release_x1();
}

- (int64_t)mapStyle
{
  id v3 = [(CARTemplateUISceneViewController *)self windowScene];
  id v4 = [v3 _FBSScene];
  int v5 = [v4 settings];
  unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___CRSUIMapStyleProviding];

  if (!v6) {
    return 0;
  }
  id v7 = [(CARTemplateUISceneViewController *)self windowScene];
  id v8 = [v7 _FBSScene];
  double v9 = [v8 settings];

  id v10 = [v9 mapStyle];
  return (int64_t)v10;
}

- (NSNumber)frameRateLimit
{
  id v3 = [(CARTemplateUISceneViewController *)self windowScene];
  id v4 = [v3 _FBSScene];
  int v5 = [v4 settings];
  unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___CRSUIFrameRateLimitProviding];

  if (v6)
  {
    id v7 = [(CARTemplateUISceneViewController *)self windowScene];
    id v8 = [v7 _FBSScene];
    double v9 = [v8 settings];

    id v10 = [v9 frameRateLimit];
  }
  else
  {
    id v10 = 0;
  }

  return (NSNumber *)v10;
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  return (UIWindowScene *)WeakRetained;
}

- (UIViewController)overlayViewController
{
  return self->_overlayViewController;
}

- (void)setOverlayViewController:(id)a3
{
}

- (FBScene)scene
{
  return self->_scene;
}

- (CPSTemplateInstance)templateInstance
{
  return self->_templateInstance;
}

- (void)setTemplateInstance:(id)a3
{
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

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTransaction, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_appSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_settingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_requester, 0);
  objc_storeStrong((id *)&self->_sceneHostView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_templateInstance, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_overlayViewController, 0);

  objc_destroyWeak((id *)&self->_windowScene);
}

@end