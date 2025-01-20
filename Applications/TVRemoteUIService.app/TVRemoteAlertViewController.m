@interface TVRemoteAlertViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)isWakingToLockScreen;
- (BOOL)prefersStatusBarHidden;
- (BSAction)dismissalAction;
- (BSAction)presentationAction;
- (NSString)activationReason;
- (NSString)deviceIdentifier;
- (NSString)lastActiveEndpointIdentifier;
- (TVRMaterialView)backgroundMaterialView;
- (TVRUIHintsViewController)hintsViewController;
- (TVRUIRemoteViewController)remoteControlViewController;
- (TVRemoteAlertVisualStyleProviding)visualStyle;
- (int64_t)deviceIdentifierType;
- (int64_t)deviceType;
- (int64_t)launchContext;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss;
- (void)_dismissPresentedContentAnimated:(BOOL)a3;
- (void)alertDidFinishDismissal:(BOOL)a3;
- (void)alertDidFinishPresentation:(BOOL)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setActivationReason:(id)a3;
- (void)setBackgroundMaterialView:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceIdentifierType:(int64_t)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setDismissalAction:(id)a3;
- (void)setHintsViewController:(id)a3;
- (void)setLastActiveEndpointIdentifier:(id)a3;
- (void)setLaunchContext:(int64_t)a3;
- (void)setPresentationAction:(id)a3;
- (void)setRemoteControlViewController:(id)a3;
- (void)setVisualStyle:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TVRemoteAlertViewController

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)TVRemoteAlertViewController;
  [(TVRemoteAlertViewController *)&v47 viewDidLoad];
  v3 = [(TVRemoteAlertViewController *)self traitCollection];
  v4 = +[TVRemoteAlertVisualStyleProviding visualStyleForIdiom:](TVRemoteAlertVisualStyleProviding, "visualStyleForIdiom:", [v3 userInterfaceIdiom]);
  [(TVRemoteAlertViewController *)self setVisualStyle:v4];

  v5 = [(TVRemoteAlertViewController *)self visualStyle];
  v6 = [v5 backgroundMaterialView];
  [(TVRemoteAlertViewController *)self setBackgroundMaterialView:v6];

  v7 = [(TVRemoteAlertViewController *)self visualStyle];
  LODWORD(v6) = [v7 allowsTapToDismiss];

  if (v6)
  {
    id v8 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_dismiss"];
    v9 = [(TVRemoteAlertViewController *)self backgroundMaterialView];
    [v9 addGestureRecognizer:v8];
  }
  id v10 = objc_alloc_init((Class)TVRUIHintsViewController);
  [(TVRemoteAlertViewController *)self setHintsViewController:v10];

  v11 = [(TVRemoteAlertViewController *)self view];
  [v11 bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(TVRemoteAlertViewController *)self hintsViewController];
  v21 = [v20 view];
  [v21 setFrame:v13, v15, v17, v19];

  v22 = _TVRUIServiceLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = [(TVRemoteAlertViewController *)self remoteControlViewController];
    *(_DWORD *)buf = 138412290;
    v49 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Creating new RemoteViewController. Existing %@", buf, 0xCu);
  }
  id v24 = objc_alloc_init((Class)TVRUIRemoteViewController);
  [(TVRemoteAlertViewController *)self setRemoteControlViewController:v24];

  v25 = [(TVRemoteAlertViewController *)self hintsViewController];
  v26 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  [v26 setDelegate:v25];

  v27 = [(TVRemoteAlertViewController *)self visualStyle];
  v28 = [(TVRemoteAlertViewController *)self view];
  [v27 frameForParentView:v28];
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  v37 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  v38 = [v37 view];
  [v38 setFrame:v30, v32, v34, v36];

  v39 = [(TVRemoteAlertViewController *)self visualStyle];
  [v39 maximizedCornerRadius];
  double v41 = v40;
  v42 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  [v42 setBackgroundCornerRadius:v41];

  v43 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  v44 = [v43 view];
  [v44 setClipsToBounds:1];

  v45 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  [(TVRemoteAlertViewController *)self bs_addChildViewController:v45];

  v46 = [(TVRemoteAlertViewController *)self hintsViewController];
  [(TVRemoteAlertViewController *)self bs_addChildViewController:v46];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TVRemoteAlertViewController;
  [(TVRemoteAlertViewController *)&v6 viewWillAppear:a3];
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v4 = TVRViewServiceWillAppearNotificationName;
  [v3 postNotificationName:TVRViewServiceWillAppearNotificationName object:0];

  v5 = _TVRUIServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote Alert posted NSDistributedNotifiction: %{public}@", buf, 0xCu);
  }
}

- (void)viewWillLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)TVRemoteAlertViewController;
  [(TVRemoteAlertViewController *)&v28 viewWillLayoutSubviews];
  v3 = [(TVRemoteAlertViewController *)self visualStyle];
  uint64_t v4 = [(TVRemoteAlertViewController *)self view];
  [v3 frameForParentView:v4];
  double v6 = v5;
  double v8 = v7;

  v9 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  id v10 = [v9 view];
  [v10 setBounds:0.0, 0.0, v6, v8];

  v11 = [(TVRemoteAlertViewController *)self view];
  [v11 bounds];
  CGFloat v12 = CGRectGetWidth(v29) * 0.5;
  double v13 = [(TVRemoteAlertViewController *)self view];
  [v13 bounds];
  CGFloat v14 = CGRectGetHeight(v30) * 0.5;
  double v15 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  double v16 = [v15 view];
  [v16 setCenter:v12, v14];

  double v17 = [(TVRemoteAlertViewController *)self view];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [(TVRemoteAlertViewController *)self hintsViewController];
  v27 = [v26 view];
  [v27 setFrame:v19, v21, v23, v25];
}

- (void)viewDidAppear:(BOOL)a3
{
  v41.receiver = self;
  v41.super_class = (Class)TVRemoteAlertViewController;
  [(TVRemoteAlertViewController *)&v41 viewDidAppear:a3];
  id v4 = objc_alloc_init((Class)_UIViewControllerOneToOneTransitionContext);
  double v5 = [(TVRemoteAlertViewController *)self view];
  [v4 _setFromView:v5];

  double v6 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  double v7 = [v6 view];
  [v4 _setToView:v7];

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = __45__TVRemoteAlertViewController_viewDidAppear___block_invoke;
  v40[3] = &unk_100018AB0;
  v40[4] = self;
  [v4 _setCompletionHandler:v40];
  if ([(TVRemoteAlertViewController *)self isWakingToLockScreen])
  {
    double v8 = _TVRUIServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Waking to lock screen, no animator being run", v39, 2u);
    }

    v9 = [(TVRemoteAlertViewController *)self backgroundMaterialView];
    [v9 setWeighting:1.0];

    id v10 = [(TVRemoteAlertViewController *)self view];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = [(TVRemoteAlertViewController *)self backgroundMaterialView];
    [v19 setFrame:v12, v14, v16, v18];

    double v20 = [(TVRemoteAlertViewController *)self backgroundMaterialView];
    [v20 setAutoresizingMask:18];

    double v21 = [(TVRemoteAlertViewController *)self view];
    double v22 = [(TVRemoteAlertViewController *)self backgroundMaterialView];
    [v21 insertSubview:v22 atIndex:0];

    [(TVRemoteAlertViewController *)self alertDidFinishPresentation:0];
  }
  else
  {
    int v23 = _AXSReduceMotionEnabled();
    double v24 = _TVRUIServiceLog();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        *(_WORD *)v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Using TVRemoteAlertFadeAnimationController", v39, 2u);
      }

      id v26 = objc_alloc((Class)TVRUIAlertFadeAnimationController);
      v27 = [(TVRemoteAlertViewController *)self visualStyle];
      id v28 = [v26 initWithAnimationType:0 visualStyle:v27];
    }
    else
    {
      if (v25)
      {
        *(_WORD *)v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Using TVRemoteAlertAnimationController", v39, 2u);
      }

      id v29 = objc_alloc((Class)TVRUIAlertAnimationController);
      CGRect v30 = [(TVRemoteAlertViewController *)self visualStyle];
      id v28 = [v29 initWithAnimationType:0 visualStyle:v30];

      v27 = [(TVRemoteAlertViewController *)self backgroundMaterialView];
      [v28 setBackgroundMaterialView:v27];
    }

    [v28 animateTransition:v4];
  }
  uint64_t v31 = [(TVRemoteAlertViewController *)self presentationAction];
  if (v31)
  {
    double v32 = (void *)v31;
    double v33 = [(TVRemoteAlertViewController *)self presentationAction];
    unsigned int v34 = [v33 canSendResponse];

    if (v34)
    {
      double v35 = _TVRUIServiceLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Remote Alert presentation action provided, sending back animation response", v39, 2u);
      }

      id v36 = objc_alloc_init((Class)BSMutableSettings);
      [v36 setObject:&off_1000191A8 forSetting:1];
      id v37 = [objc_alloc((Class)BSActionResponse) initWithInfo:v36 error:0];
      v38 = [(TVRemoteAlertViewController *)self presentationAction];
      [v38 sendResponse:v37];

      [(TVRemoteAlertViewController *)self setPresentationAction:0];
    }
  }
}

id __45__TVRemoteAlertViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) alertDidFinishPresentation:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TVRemoteAlertViewController;
  [(TVRemoteAlertViewController *)&v6 viewWillDisappear:a3];
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v4 = TVRViewServiceWillDisappearNotificationName;
  [v3 postNotificationName:TVRViewServiceWillDisappearNotificationName object:0];

  double v5 = _TVRUIServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote Alert posted NSDistributedNotifiction: %{public}@", buf, 0xCu);
  }
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(TVRemoteAlertViewController *)self traitCollection];
  if ([v2 userInterfaceIdiom] == (id)1) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (void)alertDidFinishPresentation:(BOOL)a3
{
  unint64_t v3 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v4 = TVRViewServiceDidAppearNotificationName;
  [v3 postNotificationName:TVRViewServiceDidAppearNotificationName object:0];

  double v5 = _TVRUIServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote Alert posted NSDistributedNotifiction: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)alertDidFinishDismissal:(BOOL)a3
{
  uint64_t v4 = [(TVRemoteAlertViewController *)self _remoteViewControllerProxy];
  double v5 = _TVRUIServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote Alert deactivating", (uint8_t *)&v15, 2u);
  }

  int v6 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  [v6 willMoveToParentViewController:0];

  uint64_t v7 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  uint64_t v8 = [v7 view];
  [v8 removeFromSuperview];

  v9 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  [v9 removeFromParentViewController];

  id v10 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  [v10 setView:0];

  double v11 = _TVRUIServiceLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removed child RemoteViewController from remote alert", (uint8_t *)&v15, 2u);
  }

  [v4 deactivate];
  double v12 = +[NSDistributedNotificationCenter defaultCenter];
  uint64_t v13 = TVRViewServiceDidDisappearNotificationName;
  [v12 postNotificationName:TVRViewServiceDidDisappearNotificationName object:0];

  double v14 = _TVRUIServiceLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    uint64_t v16 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remote Alert posted NSDistributedNotifiction: %{public}@", (uint8_t *)&v15, 0xCu);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v8 = _TVRUIServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remote Alert -prepareForActivationWithContext: %{public}@", buf, 0xCu);
  }

  v9 = [v6 reason];
  [(TVRemoteAlertViewController *)self setActivationReason:v9];

  id v10 = _TVRUIServiceLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = [(TVRemoteAlertViewController *)self activationReason];
    *(_DWORD *)buf = 138543362;
    id v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Remote Alert activation reason: %{public}@", buf, 0xCu);
  }
  [(TVRemoteAlertViewController *)self setDeviceIdentifierType:0];
  if ([(TVRemoteAlertViewController *)self isWakingToLockScreen])
  {
    double v12 = +[TVRCPreferredDeviceManager sharedInstance];
    uint64_t v13 = [v12 preferredDeviceIdentifier];
    [(TVRemoteAlertViewController *)self setDeviceIdentifier:v13];

    [(TVRemoteAlertViewController *)self setLaunchContext:2];
    double v14 = _TVRUIServiceLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [(TVRemoteAlertViewController *)self deviceIdentifier];
      int64_t v16 = [(TVRemoteAlertViewController *)self deviceIdentifierType];
      *(_DWORD *)buf = 138412546;
      id v31 = v15;
      __int16 v32 = 2048;
      int64_t v33 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remote Alert is waking to lock screen, overriding with: device=%@, type=%ld", buf, 0x16u);
    }
  }
  double v17 = [(TVRemoteAlertViewController *)self deviceIdentifier];

  if (v17)
  {
    double v18 = [(TVRemoteAlertViewController *)self deviceIdentifier];
    double v19 = _TVRUIServiceLog();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:

      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    id v31 = v18;
    double v20 = "Specific device identifier specified to connect %@";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
    goto LABEL_17;
  }
  if ((id)[(TVRemoteAlertViewController *)self launchContext] == (id)11)
  {
    double v19 = _TVRUIServiceLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[TVRemoteAlertViewController prepareForActivationWithContext:completion:](v19);
    }
    double v18 = 0;
    goto LABEL_17;
  }
  double v18 = [(TVRemoteAlertViewController *)self lastActiveEndpointIdentifier];
  v27 = _TVRUIServiceLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No specific device identifier specified checking last active endpoint %@", buf, 0xCu);
  }

  if (!v18)
  {
    id v28 = +[TVRCPreferredDeviceManager sharedInstance];
    double v18 = [v28 preferredDeviceIdentifier];

    double v19 = _TVRUIServiceLog();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412290;
    id v31 = v18;
    double v20 = "No last active endpoint specified checking last connected identifier %@";
    goto LABEL_12;
  }
LABEL_18:
  double v21 = _TVRUIServiceLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v22 = [(TVRemoteAlertViewController *)self deviceIdentifierType];
    int64_t v23 = [(TVRemoteAlertViewController *)self deviceType];
    int64_t v24 = [(TVRemoteAlertViewController *)self launchContext];
    *(_DWORD *)buf = 138413058;
    id v31 = v18;
    __int16 v32 = 2048;
    int64_t v33 = v22;
    __int16 v34 = 2048;
    int64_t v35 = v23;
    __int16 v36 = 2048;
    int64_t v37 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Configuring RemoteControlViewController (deviceID=%@, deviceIdentifierType=%ld, deviceType=%ld, launchContext=%ld", buf, 0x2Au);
  }

  BOOL v25 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  [v25 configureWithDeviceIdentifier:v18 identifierType:[self deviceIdentifierType] deviceType:[self deviceType] launchContext:[self launchContext]];

  id v26 = [v6 actions];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __74__TVRemoteAlertViewController_prepareForActivationWithContext_completion___block_invoke;
  v29[3] = &unk_100018AD8;
  v29[4] = self;
  [v26 enumerateObjectsUsingBlock:v29];

  v7[2](v7);
}

void __74__TVRemoteAlertViewController_prepareForActivationWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 info];
  double v5 = [v4 objectForSetting:1];

  if (v5)
  {
    id v6 = _TVRUIServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Remote Alert received presentation animation action", buf, 2u);
    }

    [*(id *)(a1 + 32) setPresentationAction:v3];
  }
  uint64_t v7 = [v3 info];
  uint64_t v8 = [v7 objectForSetting:2];

  if (v8)
  {
    v9 = _TVRUIServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remote Alert received dismissal animation action", v10, 2u);
    }

    [*(id *)(a1 + 32) setDismissalAction:v3];
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _TVRUIServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remote Alert -configureWithContext: %{public}@", buf, 0xCu);
  }

  v9 = [(TVRemoteAlertViewController *)self _remoteViewControllerProxyWithErrorHandler:&__block_literal_global];
  if (v9)
  {
    id v10 = objc_alloc((Class)TVRViewServiceConfigContext);
    double v11 = [v6 userInfo];
    double v12 = [v10 _initWithUserInfo:v11];

    uint64_t v13 = [v12 deviceIdentifier];
    [(TVRemoteAlertViewController *)self setDeviceIdentifier:v13];

    double v14 = _TVRUIServiceLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = [(TVRemoteAlertViewController *)self deviceIdentifier];
      *(_DWORD *)buf = 138412290;
      id v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Remote Alert received device id %@", buf, 0xCu);
    }
    [(TVRemoteAlertViewController *)self setDeviceIdentifierType:[v12 deviceIdentifierType]];
    [(TVRemoteAlertViewController *)self setDeviceType:[v12 deviceType]];
    [(TVRemoteAlertViewController *)self setLaunchContext:[v12 launchContext]];
    int64_t v16 = [v12 lastActiveEndpointIdentifier];
    [(TVRemoteAlertViewController *)self setLastActiveEndpointIdentifier:v16];

    double v17 = _TVRUIServiceLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = [v12 lastActiveEndpointIdentifier];
      *(_DWORD *)buf = 138412290;
      id v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Remote Alert received last active identifier %@", buf, 0xCu);
    }
    if ([v12 dismissalType]
      || ([(TVRemoteAlertViewController *)self visualStyle],
          double v19 = objc_claimAutoreleasedReturnValue(),
          unsigned int v20 = [v19 allowsSwipeToDismiss],
          v19,
          !v20))
    {
      [v9 setSwipeDismissalStyle:0];
      double v21 = _TVRUIServiceLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int64_t v22 = "Remote alert proxy configured with swipe dismissal style SBUIRemoteAlertSwipeDismissalStyleNone";
        goto LABEL_14;
      }
    }
    else
    {
      [v9 setSwipeDismissalStyle:1];
      double v21 = _TVRUIServiceLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int64_t v22 = "Remote alert proxy configured with swipe dismissal style SBUIRemoteAlertSwipeDismissalStyleDismissToCurrentApps";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
      }
    }

    [v9 setAllowsAlertStacking:1];
    [v9 setDismissalAnimationStyle:0];
    [v9 setAllowsMenuButtonDismissal:1];
    [v9 setDesiredHardwareButtonEvents:22];
    int64_t v23 = _TVRUIServiceLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Remote alert proxy configured with context: %{public}@", buf, 0xCu);
    }

    v24.receiver = self;
    v24.super_class = (Class)TVRemoteAlertViewController;
    [(TVRemoteAlertViewController *)&v24 configureWithContext:v6 completion:v7];
    goto LABEL_20;
  }
  double v12 = _TVRUIServiceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[TVRemoteAlertViewController configureWithContext:completion:](v12);
  }
LABEL_20:
}

void __63__TVRemoteAlertViewController_configureWithContext_completion___block_invoke(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = _TVRUIServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __63__TVRemoteAlertViewController_configureWithContext_completion___block_invoke_cold_1(v2, v3);
  }
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  double v5 = _TVRUIServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Remote Alert -handleButtonActions: %{public}@", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __51__TVRemoteAlertViewController_handleButtonActions___block_invoke;
  v6[3] = &unk_100018B40;
  v6[4] = self;
  [v4 enumerateObjectsUsingBlock:v6];
}

void __51__TVRemoteAlertViewController_handleButtonActions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 events] & 0x10) != 0)
  {
    id v6 = _TVRUIServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SBUIRemoteAlertServiceButtonEventHomeButton button action, dismissing", buf, 2u);
    }

    id v7 = [*(id *)(a1 + 32) hintsViewController];
    unsigned int v8 = [v7 hasPresentedContent];

    v9 = *(void **)(a1 + 32);
    if (!v8)
    {
      double v11 = [v9 remoteControlViewController];
      [v11 _disconnectUserInitiated];

      [*(id *)(a1 + 32) _dismiss];
      goto LABEL_16;
    }
    double v5 = [v9 hintsViewController];
    [v5 dismissPresentedContentAnimated:1 completion:0];
    goto LABEL_14;
  }
  if (([v3 events] & 2) != 0)
  {
    id v10 = _TVRUIServiceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SBUIRemoteAlertServiceButtonEventVolumeUpButton button action", v13, 2u);
    }

    double v5 = [*(id *)(a1 + 32) remoteControlViewController];
    [v5 volumeUpEventGenerated];
    goto LABEL_14;
  }
  if (([v3 events] & 4) != 0)
  {
    id v4 = _TVRUIServiceLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SBUIRemoteAlertServiceButtonEventVolumeDownButton button action", v12, 2u);
    }

    double v5 = [*(id *)(a1 + 32) remoteControlViewController];
    [v5 volumeDownEventGenerated];
LABEL_14:
  }
LABEL_16:
}

- (void)_dismiss
{
  id v3 = _TVRUIServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing alert", buf, 2u);
  }

  [(TVRemoteAlertViewController *)self _dismissPresentedContentAnimated:0];
  id v4 = [(TVRemoteAlertViewController *)self hintsViewController];
  [v4 remoteWillBeDismissed];

  double v5 = [(TVRemoteAlertViewController *)self hintsViewController];
  [v5 dismissHints];

  id v6 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  [v6 _disconnectUserInitiated];

  id v7 = objc_alloc_init((Class)_UIViewControllerOneToOneTransitionContext);
  unsigned int v8 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  v9 = [v8 view];
  [v7 _setFromView:v9];

  id v10 = [(TVRemoteAlertViewController *)self view];
  [v7 _setToView:v10];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __39__TVRemoteAlertViewController__dismiss__block_invoke;
  v23[3] = &unk_100018AB0;
  v23[4] = self;
  [v7 _setCompletionHandler:v23];
  LODWORD(v9) = _AXSReduceMotionEnabled();
  double v11 = _TVRUIServiceLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dismissing with TVRemoteAlertFadeAnimationController", buf, 2u);
    }

    id v13 = objc_alloc((Class)TVRUIAlertFadeAnimationController);
    double v14 = [(TVRemoteAlertViewController *)self visualStyle];
    id v15 = [v13 initWithAnimationType:1 visualStyle:v14];
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dismissing with TVRUIAlertAnimationController", buf, 2u);
    }

    id v16 = objc_alloc((Class)TVRUIAlertAnimationController);
    double v17 = [(TVRemoteAlertViewController *)self visualStyle];
    id v15 = [v16 initWithAnimationType:1 visualStyle:v17];

    double v14 = [(TVRemoteAlertViewController *)self backgroundMaterialView];
    [v15 setBackgroundMaterialView:v14];
  }

  [v15 animateTransition:v7];
  double v18 = [(TVRemoteAlertViewController *)self dismissalAction];

  if (v18)
  {
    double v19 = _TVRUIServiceLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Remote Alert dismissal action provided, sending back animation response", buf, 2u);
    }

    id v20 = objc_alloc_init((Class)BSMutableSettings);
    [v20 setObject:&off_1000191A8 forSetting:2];
    id v21 = [objc_alloc((Class)BSActionResponse) initWithInfo:v20 error:0];
    int64_t v22 = [(TVRemoteAlertViewController *)self dismissalAction];
    [v22 sendResponse:v21];

    [(TVRemoteAlertViewController *)self setDismissalAction:0];
  }
}

id __39__TVRemoteAlertViewController__dismiss__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backgroundMaterialView];
  [v2 removeFromSuperview];

  id v3 = *(void **)(a1 + 32);

  return [v3 alertDidFinishDismissal:1];
}

- (void)_dismissPresentedContentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(TVRemoteAlertViewController *)self remoteControlViewController];
  unsigned int v6 = [v5 hasPresentedContent];

  if (v6)
  {
    id v7 = [(TVRemoteAlertViewController *)self remoteControlViewController];
    [v7 dismissPresentedContentAnimated:v3 completion:0];
  }
  unsigned int v8 = [(TVRemoteAlertViewController *)self hintsViewController];
  unsigned int v9 = [v8 hasPresentedContent];

  if (v9)
  {
    id v10 = [(TVRemoteAlertViewController *)self hintsViewController];
    [v10 dismissPresentedContentAnimated:v3 completion:0];
  }
}

- (BOOL)isWakingToLockScreen
{
  v2 = [(TVRemoteAlertViewController *)self activationReason];
  unsigned __int8 v3 = [v2 isEqualToString:SBSRemoteAlertActivationReasonWakeTo];

  return v3;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (TVRUIRemoteViewController)remoteControlViewController
{
  return self->_remoteControlViewController;
}

- (void)setRemoteControlViewController:(id)a3
{
}

- (TVRUIHintsViewController)hintsViewController
{
  return self->_hintsViewController;
}

- (void)setHintsViewController:(id)a3
{
}

- (TVRemoteAlertVisualStyleProviding)visualStyle
{
  return self->_visualStyle;
}

- (void)setVisualStyle:(id)a3
{
}

- (TVRMaterialView)backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (void)setBackgroundMaterialView:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (int64_t)deviceIdentifierType
{
  return self->_deviceIdentifierType;
}

- (void)setDeviceIdentifierType:(int64_t)a3
{
  self->_deviceIdentifierType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (int64_t)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(int64_t)a3
{
  self->_launchContext = a3;
}

- (NSString)lastActiveEndpointIdentifier
{
  return self->_lastActiveEndpointIdentifier;
}

- (void)setLastActiveEndpointIdentifier:(id)a3
{
}

- (BSAction)presentationAction
{
  return self->_presentationAction;
}

- (void)setPresentationAction:(id)a3
{
}

- (BSAction)dismissalAction
{
  return self->_dismissalAction;
}

- (void)setDismissalAction:(id)a3
{
}

- (NSString)activationReason
{
  return self->_activationReason;
}

- (void)setActivationReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationReason, 0);
  objc_storeStrong((id *)&self->_dismissalAction, 0);
  objc_storeStrong((id *)&self->_presentationAction, 0);
  objc_storeStrong((id *)&self->_lastActiveEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_hintsViewController, 0);

  objc_storeStrong((id *)&self->_remoteControlViewController, 0);
}

- (void)prepareForActivationWithContext:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Sharing provided a nil deviceIdentifier after tap-to-setup", v1, 2u);
}

- (void)configureWithContext:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SBUIRemoteAlertHostInterface proxy is nil", v1, 2u);
}

void __63__TVRemoteAlertViewController_configureWithContext_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  unsigned __int8 v3 = [a1 localizedDescription];
  int v4 = 138543362;
  double v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Remote alert failed to obtain proxy %{public}@", (uint8_t *)&v4, 0xCu);
}

@end