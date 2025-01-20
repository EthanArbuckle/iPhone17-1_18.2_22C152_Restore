@interface TVRMContentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canDismissPresentedContent;
- (BOOL)isShowingButtonGlyph;
- (BOOL)shouldFinishTransitionToExpandedContentModule;
- (BOOL)shouldLaunchAsViewService;
- (BOOL)systemInitiatedDismissal;
- (CCUIContentModuleContext)contentModuleContext;
- (CGAffineTransform)_defaultScaledTransformForSize:(SEL)a3;
- (CGSize)transitionSize;
- (NSString)lastActiveEndpointIdentifier;
- (TVRUICubicSpringAnimator)remoteShowAnimator;
- (TVRUIHintsViewController)hintsViewController;
- (TVRUIRemoteViewController)remoteControlViewController;
- (UIViewController)backgroundViewController;
- (UIViewPropertyAnimator)customAnimator;
- (UIViewPropertyAnimator)remoteDismissAnimator;
- (double)preferredExpandedContentHeight;
- (double)preferredExpandedContentWidth;
- (double)preferredExpandedContinuousCornerRadius;
- (id)title;
- (id)valueText;
- (unint64_t)supportedInterfaceOrientations;
- (void)_createRemoteControlViewControllerIfNeeded;
- (void)_dismissChildViewControllersPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)_prewarm;
- (void)_remoteLaunchedAsViewService:(id)a3;
- (void)_requestLaunchAsViewService;
- (void)_startRemoteControlViewController;
- (void)_stopRemoteControlViewController;
- (void)buttonTapped:(id)a3 forEvent:(id)a4;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)displayWillTurnOff;
- (void)setBackgroundViewController:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setHintsViewController:(id)a3;
- (void)setLastActiveEndpointIdentifier:(id)a3;
- (void)setRemoteControlViewController:(id)a3;
- (void)setRemoteDismissAnimator:(id)a3;
- (void)setRemoteShowAnimator:(id)a3;
- (void)setSystemInitiatedDismissal:(BOOL)a3;
- (void)setTransitionSize:(CGSize)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation TVRMContentViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TVRMContentViewController;
  [(TVRMContentViewController *)&v4 viewWillAppear:a3];
  [(TVRMContentViewController *)self _prewarm];
}

- (void)viewWillLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)TVRMContentViewController;
  [(CCUIButtonModuleViewController *)&v23 viewWillLayoutSubviews];
  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    v3 = [(CCUIButtonModuleViewController *)self buttonView];
    [v3 setAlpha:0.0];

    objc_super v4 = [(TVRMContentViewController *)self remoteControlViewController];
    v5 = [v4 view];
    [v5 setAlpha:1.0];

    +[TVRMDeviceInfo expandedRoundedCornerRadius];
  }
  else
  {
    v7 = [(TVRMContentViewController *)self remoteControlViewController];
    v8 = [v7 view];
    [v8 setAlpha:0.0];

    v9 = [(CCUIButtonModuleViewController *)self buttonView];
    [v9 setAlpha:1.0];

    [(CCUIButtonModuleViewController *)self compactContinuousCornerRadius];
  }
  double v10 = v6;
  v11 = [(TVRMContentViewController *)self remoteControlViewController];
  [v11 setBackgroundCornerRadius:v10];

  v12 = [(TVRMContentViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(TVRMContentViewController *)self remoteControlViewController];
  v22 = [v21 view];
  objc_msgSend(v22, "setFrame:", v14, v16, v18, v20);
}

- (id)title
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"APP_NAME" value:&stru_26F4D14D8 table:@"Localizable"];

  return v3;
}

- (id)valueText
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(TVRMContentViewController *)self traitCollection];
  if ([v2 userInterfaceIdiom] == 1) {
    unint64_t v3 = 30;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TVRMContentViewController;
  -[TVRMContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v20, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[TVRMContentViewController setTransitionSize:](self, "setTransitionSize:", width, height);
  uint64_t v8 = [(CCUIButtonModuleViewController *)self isExpanded] ^ 1;
  v9 = [(CCUIButtonModuleViewController *)self buttonView];
  [v9 setEnabled:v8];

  if (_AXSReduceMotionEnabled())
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long buf = 0u;
    if ([(CCUIButtonModuleViewController *)self isExpanded])
    {
      long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      long long buf = *MEMORY[0x263F000D0];
      long long v22 = v10;
      long long v23 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    }
    else
    {
      [(TVRMContentViewController *)self transitionSize];
      -[TVRMContentViewController _defaultScaledTransformForSize:](self, "_defaultScaledTransformForSize:");
    }
    long long v17 = buf;
    long long v18 = v22;
    long long v19 = v23;
    v11 = [(TVRMContentViewController *)self remoteControlViewController];
    v12 = [v11 view];
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    [v12 setTransform:v16];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80__TVRMContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v15[3] = &unk_2650CF550;
  v15[4] = self;
  [v7 animateAlongsideTransition:v15 completion:0];
  double v13 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v25.double width = width;
    v25.double height = height;
    double v14 = NSStringFromCGSize(v25);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_2406AB000, v13, OS_LOG_TYPE_DEFAULT, "View will transition to size %@ requested", (uint8_t *)&buf, 0xCu);
  }
}

void __80__TVRMContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (UIViewPropertyAnimator)customAnimator
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v3 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    BOOL v12 = [(CCUIButtonModuleViewController *)self isExpanded];
    _os_log_impl(&dword_2406AB000, v3, OS_LOG_TYPE_DEFAULT, "Custom animator requested. expanded = %{BOOL}d", buf, 8u);
  }

  if ([(CCUIButtonModuleViewController *)self isExpanded])
  {
    objc_super v4 = [MEMORY[0x263F7CA80] standardSpringAnimator];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__TVRMContentViewController_customAnimator__block_invoke;
    v10[3] = &unk_2650CF578;
    v10[4] = self;
    [v4 addAnimations:v10];
    v5 = _TVRMControlCenterLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2406AB000, v5, OS_LOG_TYPE_DEFAULT, "Show animator created", buf, 2u);
    }
  }
  else
  {
    double v6 = objc_msgSend(objc_alloc(MEMORY[0x263F1C9B0]), "initWithMass:stiffness:damping:initialVelocity:", 3.0, 300.0, 55.0, 10.0, 10.0);
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F1CB78]) initWithDuration:v6 timingParameters:0.0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__TVRMContentViewController_customAnimator__block_invoke_17;
    v9[3] = &unk_2650CF578;
    v9[4] = self;
    [v4 addAnimations:v9];
    id v7 = _TVRMControlCenterLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2406AB000, v7, OS_LOG_TYPE_DEFAULT, "Dismiss animator created", buf, 2u);
    }
  }

  return (UIViewPropertyAnimator *)v4;
}

void __43__TVRMContentViewController_customAnimator__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteControlViewController];
  unint64_t v3 = [v2 view];
  [v3 setAlpha:1.0];

  objc_super v4 = [*(id *)(a1 + 32) buttonView];
  [v4 setAlpha:0.0];

  +[TVRMDeviceInfo expandedRoundedCornerRadius];
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) remoteControlViewController];
  [v7 setBackgroundCornerRadius:v6];

  uint64_t v8 = [*(id *)(a1 + 32) remoteControlViewController];
  v9 = [v8 view];
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v11[0] = *MEMORY[0x263F000D0];
  v11[1] = v10;
  v11[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v9 setTransform:v11];
}

void __43__TVRMContentViewController_customAnimator__block_invoke_17(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteControlViewController];
  unint64_t v3 = [v2 view];
  [v3 setAlpha:0.0];

  objc_super v4 = [*(id *)(a1 + 32) buttonView];
  [v4 setAlpha:1.0];

  [*(id *)(a1 + 32) compactContinuousCornerRadius];
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) remoteControlViewController];
  [v7 setBackgroundCornerRadius:v6];

  uint64_t v8 = *(void **)(a1 + 32);
  [v8 transitionSize];
  if (v8)
  {
    objc_msgSend(v8, "_defaultScaledTransformForSize:");
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
  }
  v9 = [*(id *)(a1 + 32) remoteControlViewController];
  long long v10 = [v9 view];
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  [v10 setTransform:v11];
}

- (void)_createRemoteControlViewControllerIfNeeded
{
  unint64_t v3 = [(TVRMContentViewController *)self remoteControlViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F7CA88]);
    [(TVRMContentViewController *)self setHintsViewController:v4];

    double v5 = [(TVRMContentViewController *)self view];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    long long v14 = [(TVRMContentViewController *)self hintsViewController];
    double v15 = [v14 view];
    objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);

    double v16 = [MEMORY[0x263F1C5C0] currentDevice];
    BOOL v17 = [v16 userInterfaceIdiom] != 1;

    long long v18 = [(TVRMContentViewController *)self hintsViewController];
    [v18 setAllowSiriHint:v17];

    long long v19 = [(TVRMContentViewController *)self hintsViewController];
    [v19 setAllowVolumeHint:v17];

    objc_super v20 = [(TVRMContentViewController *)self hintsViewController];
    [v20 setAllowTips:v17];

    v21 = (TVRUIRemoteViewController *)objc_alloc_init(MEMORY[0x263F7CA90]);
    remoteControlViewController = self->_remoteControlViewController;
    self->_remoteControlViewController = v21;

    long long v23 = [(TVRMContentViewController *)self hintsViewController];
    [(TVRUIRemoteViewController *)self->_remoteControlViewController setDelegate:v23];

    uint64_t v24 = [(TVRUIRemoteViewController *)self->_remoteControlViewController view];
    [v24 setAlpha:0.0];

    [(TVRMContentViewController *)self bs_addChildViewController:self->_remoteControlViewController];
    CGSize v25 = [(TVRMContentViewController *)self hintsViewController];
    [(TVRMContentViewController *)self bs_addChildViewController:v25];

    v26 = [(TVRMContentViewController *)self view];
    v27 = [(TVRMContentViewController *)self hintsViewController];
    v28 = [v27 view];
    [v26 bringSubviewToFront:v28];

    if (![(CCUIButtonModuleViewController *)self isExpanded])
    {
      v29 = [(TVRMContentViewController *)self view];
      [v29 bounds];
      -[TVRMContentViewController _defaultScaledTransformForSize:](self, "_defaultScaledTransformForSize:", v30, v31);
      v32 = [(TVRMContentViewController *)self remoteControlViewController];
      v33 = [v32 view];
      v35[0] = v35[3];
      v35[1] = v35[4];
      v35[2] = v35[5];
      [v33 setTransform:v35];

      v34 = [(TVRMContentViewController *)self view];
      [v34 layoutIfNeeded];
    }
  }
}

- (void)_startRemoteControlViewController
{
  unint64_t v3 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_2406AB000, v3, OS_LOG_TYPE_DEFAULT, "Module requesting connections to start", v7, 2u);
  }

  id v4 = [(TVRMContentViewController *)self remoteControlViewController];
  double v5 = [(TVRMContentViewController *)self lastActiveEndpointIdentifier];
  [v4 configureWithDeviceIdentifier:v5 identifierType:*MEMORY[0x263F7CAA8] deviceType:0 launchContext:1];

  double v6 = [(TVRMContentViewController *)self remoteControlViewController];
  [v6 startConnections];

  [(TVRMContentViewController *)self setSystemInitiatedDismissal:0];
}

- (void)_stopRemoteControlViewController
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unint64_t v3 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = [(TVRMContentViewController *)self systemInitiatedDismissal];
    _os_log_impl(&dword_2406AB000, v3, OS_LOG_TYPE_DEFAULT, "Module requesting connections to stop. systemInitiated %{BOOL}d", (uint8_t *)v9, 8u);
  }

  id v4 = [(TVRMContentViewController *)self hintsViewController];
  [v4 dismissHints];

  [(TVRMContentViewController *)self _dismissChildViewControllersPresentedContentAnimated:0 completion:0];
  BOOL v5 = [(TVRMContentViewController *)self systemInitiatedDismissal];
  double v6 = [(TVRMContentViewController *)self remoteControlViewController];
  double v7 = v6;
  if (v5) {
    [v6 _disconnectSystemInitiated];
  }
  else {
    [v6 _disconnectUserInitiated];
  }

  double v8 = [(TVRMContentViewController *)self remoteControlViewController];
  [v8 stopConnections];
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  if ([(TVRMContentViewController *)self shouldLaunchAsViewService])
  {
    BOOL v5 = _TVRMControlCenterLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_2406AB000, v5, OS_LOG_TYPE_DEFAULT, "Module button tapped so launching module as a view service", buf, 2u);
    }

    [(TVRMContentViewController *)self _requestLaunchAsViewService];
  }
  else
  {
    double v6 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    double v8 = _TVRMControlCenterLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 == 1)
    {
      if (v9)
      {
        *(_WORD *)double v11 = 0;
        _os_log_impl(&dword_2406AB000, v8, OS_LOG_TYPE_DEFAULT, "Module button tapped so requesting module expansion", v11, 2u);
      }

      uint64_t v10 = [(TVRMContentViewController *)self contentModuleContext];
      [v10 requestExpandModule];
    }
    else
    {
      if (v9)
      {
        *(_WORD *)double v12 = 0;
        _os_log_impl(&dword_2406AB000, v8, OS_LOG_TYPE_DEFAULT, "Module button tapped so requesting app launch", v12, 2u);
      }

      uint64_t v10 = [(TVRMContentViewController *)self contentModuleContext];
      [v10 openApplication:@"com.apple.TVRemoteUIService" completionHandler:0];
    }
  }
}

- (double)preferredExpandedContentHeight
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  CCUIScreenBounds();
  double Height = CGRectGetHeight(v8);
  if (v3 == 1)
  {
    +[TVRMDeviceInfo contentEdgeInsets];
    double v6 = Height + v5 * -2.0;
    if (v6 <= 812.0) {
      return v6;
    }
    else {
      return 812.0;
    }
  }
  return Height;
}

- (double)preferredExpandedContentWidth
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 375.0;
  }
  CCUIScreenBounds();

  return CGRectGetWidth(*(CGRect *)&v5);
}

- (double)preferredExpandedContinuousCornerRadius
{
  +[TVRMDeviceInfo expandedRoundedCornerRadius];
  return result;
}

- (BOOL)shouldFinishTransitionToExpandedContentModule
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    double v12 = "-[TVRMContentViewController shouldFinishTransitionToExpandedContentModule]";
    _os_log_impl(&dword_2406AB000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  if ([(TVRMContentViewController *)self shouldLaunchAsViewService])
  {
    id v4 = _TVRMControlCenterLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      uint64_t v5 = "Will launch module as a view service";
LABEL_12:
      _os_log_impl(&dword_2406AB000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v11, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  double v6 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  id v4 = _TVRMControlCenterLog();
  BOOL v8 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v7 != 1)
  {
    if (v8)
    {
      LOWORD(v11) = 0;
      uint64_t v5 = "Will launch app";
      goto LABEL_12;
    }
LABEL_13:
    BOOL v9 = 0;
    goto LABEL_14;
  }
  if (v8)
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2406AB000, v4, OS_LOG_TYPE_DEFAULT, "Launching module within cc and not a view service", (uint8_t *)&v11, 2u);
  }
  BOOL v9 = 1;
LABEL_14:

  return v9;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    BOOL v9 = "-[TVRMContentViewController willTransitionToExpandedContentMode:]";
    __int16 v10 = 1024;
    BOOL v11 = v3;
    _os_log_impl(&dword_2406AB000, v5, OS_LOG_TYPE_DEFAULT, "%s, expanded=%{BOOL}d", buf, 0x12u);
  }

  if (v3)
  {
    [(TVRMContentViewController *)self _createRemoteControlViewControllerIfNeeded];
    [(CCUIContentModuleContext *)self->_contentModuleContext setHomeGestureDismissalAllowed:1];
    [(TVRMContentViewController *)self _startRemoteControlViewController];
  }
  else
  {
    [(TVRMContentViewController *)self _stopRemoteControlViewController];
    double v6 = [(TVRMContentViewController *)self hintsViewController];
    [v6 remoteWillBeDismissed];
  }
  v7.receiver = self;
  v7.super_class = (Class)TVRMContentViewController;
  [(CCUIButtonModuleViewController *)&v7 willTransitionToExpandedContentMode:v3];
}

- (void)displayWillTurnOff
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [(TVRMContentViewController *)self setSystemInitiatedDismissal:1];
  [(TVRMContentViewController *)self _dismissChildViewControllersPresentedContentAnimated:0 completion:0];
  BOOL v3 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = [(CCUIButtonModuleViewController *)self isExpanded];
    _os_log_impl(&dword_2406AB000, v3, OS_LOG_TYPE_DEFAULT, "display will turn off. expanded state %{BOOL}d", (uint8_t *)v4, 8u);
  }
}

- (void)_dismissChildViewControllersPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_super v7 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v14 = "-[TVRMContentViewController _dismissChildViewControllersPresentedContentAnimated:completion:]";
    _os_log_impl(&dword_2406AB000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  BOOL v8 = [(TVRMContentViewController *)self hintsViewController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __93__TVRMContentViewController__dismissChildViewControllersPresentedContentAnimated_completion___block_invoke;
  v10[3] = &unk_2650CF5A0;
  BOOL v12 = v4;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 dismissPresentedContentAnimated:v4 completion:v10];
}

void __93__TVRMContentViewController__dismissChildViewControllersPresentedContentAnimated_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteControlViewController];
  [v2 dismissPresentedContentAnimated:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (BOOL)canDismissPresentedContent
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = [(TVRMContentViewController *)self remoteControlViewController];
  int v4 = [v3 hasPresentedContent];

  uint64_t v5 = [(TVRMContentViewController *)self hintsViewController];
  int v6 = [v5 hasPresentedContent];

  objc_super v7 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v4;
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_2406AB000, v7, OS_LOG_TYPE_DEFAULT, "Can dismiss presented content, remoteHasPresentedContent=%{BOOL}d, hintsHasPresentedContent=%{BOOL}d", (uint8_t *)v9, 0xEu);
  }

  return v4 | v6;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_super v7 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = (void *)MEMORY[0x2455F4900](v6);
    *(_DWORD *)long long buf = 138412290;
    uint64_t v15 = v8;
    _os_log_impl(&dword_2406AB000, v7, OS_LOG_TYPE_DEFAULT, "Dismiss presented content completion %@", buf, 0xCu);
  }
  id v9 = [(TVRMContentViewController *)self hintsViewController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__TVRMContentViewController_dismissPresentedContentAnimated_completion___block_invoke;
  _OWORD v11[3] = &unk_2650CF5A0;
  BOOL v13 = v4;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 dismissPresentedContentAnimated:v4 completion:v11];
}

void __72__TVRMContentViewController_dismissPresentedContentAnimated_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remoteControlViewController];
  [v2 dismissPresentedContentAnimated:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (BOOL)shouldLaunchAsViewService
{
  BOOL v3 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v3 userInterfaceIdiom])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    uint64_t v5 = [(CCUIButtonModuleViewController *)self buttonView];
    int v4 = CCUILayoutShouldBePortrait() ^ 1;
  }
  return v4;
}

- (void)_requestLaunchAsViewService
{
  BOOL v3 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v7 = 0;
    _os_log_impl(&dword_2406AB000, v3, OS_LOG_TYPE_DEFAULT, "Requesting launch of TVRemoteUI as view service", v7, 2u);
  }

  int v4 = (void *)[objc_alloc(MEMORY[0x263F7CA98]) _initWithLaunchContext:1];
  [v4 setDismissalType:1];
  uint64_t v5 = [MEMORY[0x263F087C8] defaultCenter];
  [v5 addObserver:self selector:sel__remoteLaunchedAsViewService_ name:*MEMORY[0x263F7CAB0] object:0];

  id v6 = [MEMORY[0x263F7CAA0] sharedInstance];
  [v6 presentWithContext:v4];
}

- (void)_remoteLaunchedAsViewService:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TVRMContentViewController__remoteLaunchedAsViewService___block_invoke;
  block[3] = &unk_2650CF578;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  int v4 = [MEMORY[0x263F087C8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F7CAB0] object:0];
}

void __58__TVRMContentViewController__remoteLaunchedAsViewService___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentModuleContext];
  [v1 dismissControlCenter];
}

- (CGAffineTransform)_defaultScaledTransformForSize:(SEL)a3
{
  double height = a4.height;
  double width = a4.width;
  [(TVRMContentViewController *)self preferredExpandedContentWidth];
  double v8 = 1.0;
  double v9 = 1.0;
  if (v10 > 0.0)
  {
    [(TVRMContentViewController *)self preferredExpandedContentWidth];
    double v9 = width / v11;
  }
  [(TVRMContentViewController *)self preferredExpandedContentHeight];
  if (v12 > 0.0)
  {
    [(TVRMContentViewController *)self preferredExpandedContentHeight];
    double v8 = height / v13;
  }

  return CGAffineTransformMakeScale(retstr, v9, v8);
}

- (void)_prewarm
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v2 = [(TVRMContentViewController *)self shouldLaunchAsViewService];
  BOOL v3 = [MEMORY[0x263F7CAA0] sharedInstance];
  [v3 _prewarmWithLaunchViewService:v2 fetchActiveEndpoint:1];

  int v4 = _TVRMControlCenterLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_2406AB000, v4, OS_LOG_TYPE_DEFAULT, "Module prewarm called launchAsViewService %{BOOL}d", (uint8_t *)v5, 8u);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CCUIContentModuleContext)contentModuleContext
{
  return self->_contentModuleContext;
}

- (void)setContentModuleContext:(id)a3
{
}

- (UIViewController)backgroundViewController
{
  return self->_backgroundViewController;
}

- (void)setBackgroundViewController:(id)a3
{
}

- (BOOL)isShowingButtonGlyph
{
  return self->_showButtonGlyph;
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

- (NSString)lastActiveEndpointIdentifier
{
  return self->_lastActiveEndpointIdentifier;
}

- (void)setLastActiveEndpointIdentifier:(id)a3
{
}

- (CGSize)transitionSize
{
  double width = self->_transitionSize.width;
  double height = self->_transitionSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTransitionSize:(CGSize)a3
{
  self->_transitionSize = a3;
}

- (TVRUICubicSpringAnimator)remoteShowAnimator
{
  return self->_remoteShowAnimator;
}

- (void)setRemoteShowAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)remoteDismissAnimator
{
  return self->_remoteDismissAnimator;
}

- (void)setRemoteDismissAnimator:(id)a3
{
}

- (BOOL)systemInitiatedDismissal
{
  return self->_systemInitiatedDismissal;
}

- (void)setSystemInitiatedDismissal:(BOOL)a3
{
  self->_systemInitiatedDismissal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDismissAnimator, 0);
  objc_storeStrong((id *)&self->_remoteShowAnimator, 0);
  objc_storeStrong((id *)&self->_lastActiveEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_hintsViewController, 0);
  objc_storeStrong((id *)&self->_remoteControlViewController, 0);
  objc_storeStrong((id *)&self->_backgroundViewController, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end