@interface BKUIPearlJindoEnrollViewController
- (BKUIHostedJindoPresentable)presentable;
- (BOOL)_isDarkMode;
- (BOOL)jindoNeedsResignActiveRevoke;
- (CGSize)_fullEnrollViewSize;
- (NSLayoutConstraint)bottomContainerTopConstraint;
- (NSLayoutConstraint)hostedTutorialMicaViewCenterConstraint;
- (UITraitChangeRegistration)traitChangeRegistration;
- (UIView)hostedTutorialMicaView;
- (id)_startOverTitleForState:(int)a3;
- (id)buttonTray;
- (id)escapeHatchButton;
- (id)escapeHatchButton:(id)a3 state:(int)a4;
- (id)nextStateButton;
- (id)nextStateButtonContainer;
- (id)retryMatchOperationButton;
- (id)startOverButtonForState:(int)a3;
- (void)_handleEnrollStateOnAppear;
- (void)_postBannerToDestinationWithInitialStateCollapsed:(BOOL)a3;
- (void)_postBannerToDestinationWithInitialStateCollapsed:(BOOL)a3 enrollViewStateConfiguration:(id)a4;
- (void)_prepEnrollViewAndEnrollTutorialMica;
- (void)_sceneDidActivate:(id)a3;
- (void)_sceneWillDeactivate:(id)a3;
- (void)_setupUI;
- (void)alertActionTappedFromAlert;
- (void)animateToSuccessCompletionLayout:(int64_t)a3;
- (void)didBecomeActive:(id)a3;
- (void)didChangeActiveLayoutMode:(id)a3;
- (void)navigateToMidFlowPeriocularSplashScreenWithPrepareAction:(id)a3 completionAction:(id)a4;
- (void)nextStateButtonPressed:(id)a3;
- (void)prepareBottomContainerForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6;
- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)setBottomContainerTopConstraint:(id)a3;
- (void)setHostedTutorialMicaView:(id)a3;
- (void)setHostedTutorialMicaViewCenterConstraint:(id)a3;
- (void)setJindoNeedsResignActiveRevoke:(BOOL)a3;
- (void)setPresentable:(id)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)stateTransitionDidComplete;
- (void)transitionToSuccessFromPeriocularSplash;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willResignActive:(id)a3;
@end

@implementation BKUIPearlJindoEnrollViewController

- (void)viewDidLoad
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)BKUIPearlJindoEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v13 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__sceneWillDeactivate_ name:*MEMORY[0x1E4F43CA0] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__sceneDidActivate_ name:*MEMORY[0x1E4F43C78] object:0];

  objc_initWeak(&location, self);
  v14[0] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __49__BKUIPearlJindoEnrollViewController_viewDidLoad__block_invoke;
  v10 = &unk_1E6EA2070;
  objc_copyWeak(&v11, &location);
  v6 = [(BKUIPearlJindoEnrollViewController *)self registerForTraitChanges:v5 withHandler:&v7];
  -[BKUIPearlJindoEnrollViewController setTraitChangeRegistration:](self, "setTraitChangeRegistration:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__BKUIPearlJindoEnrollViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained instructionView];
  objc_msgSend(v1, "setDarkMode:", objc_msgSend(WeakRetained, "_isDarkMode"));
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlJindoEnrollViewController;
  [(BKUIPearlJindoEnrollViewController *)&v5 viewWillDisappear:a3];
  v4 = [(BKUIPearlJindoEnrollViewController *)self presentable];
  [v4 revoke];
}

- (void)navigateToMidFlowPeriocularSplashScreenWithPrepareAction:(id)a3 completionAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __112__BKUIPearlJindoEnrollViewController_navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke;
  v11[3] = &unk_1E6EA2098;
  objc_copyWeak(&v12, &location);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__BKUIPearlJindoEnrollViewController_navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2;
  v9[3] = &unk_1E6EA2098;
  objc_copyWeak(&v10, &location);
  v8.receiver = self;
  v8.super_class = (Class)BKUIPearlJindoEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v8 navigateToMidFlowPeriocularSplashScreenWithPrepareAction:v11 completionAction:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __112__BKUIPearlJindoEnrollViewController_navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained presentable];
  [v1 revoke];
}

void __112__BKUIPearlJindoEnrollViewController_navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _postBannerToDestinationWithInitialStateCollapsed:0];
}

- (void)transitionToSuccessFromPeriocularSplash
{
  v3 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v3 setHidden:1];

  dispatch_time_t v4 = dispatch_time(0, 650000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

void __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  v3 = [v2 view];
  dispatch_time_t v4 = [v3 layer];
  [v4 removeAllAnimations];

  [MEMORY[0x1E4F39CF8] flush];
  objc_super v5 = [*(id *)(a1 + 32) delegate];
  id v6 = [v5 containerView];
  id v7 = [*(id *)(a1 + 32) view];
  [v6 bringSubviewToFront:v7];

  objc_super v8 = [*(id *)(a1 + 32) view];
  objc_msgSend(v8, "setOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  v9 = +[BKUIPearlEnrollAnimationManager sharedManager];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  objc_super v13 = __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_2;
  v14 = &unk_1E6EA20C0;
  uint64_t v15 = v10;
  objc_msgSend(v9, "transitionTo:completion:");
}

void __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  v3 = [v2 view];
  [v3 removeFromSuperview];

  dispatch_time_t v4 = [*(id *)(a1 + 32) parentViewController];
  objc_super v5 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  [v4 removeChildViewController:v5];

  [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
  [*(id *)(a1 + 32) _postBannerToDestinationWithInitialStateCollapsed:1];
  id v6 = [*(id *)(a1 + 32) presentable];
  [v6 collapse];

  dispatch_time_t v7 = dispatch_time(0, 150000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_3;
  block[3] = &unk_1E6EA20C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
}

void __77__BKUIPearlJindoEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:10 animated:1];
  id v2 = [*(id *)(a1 + 32) enrollView];
  [v2 setHidden:0];
}

- (void)animateToSuccessCompletionLayout:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKUIPearlJindoEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v7 animateToSuccessCompletionLayout:a3];
  dispatch_time_t v4 = [(BKUIPearlJindoEnrollViewController *)self presentable];
  [v4 collapse];

  dispatch_time_t v5 = dispatch_time(0, 4000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__BKUIPearlJindoEnrollViewController_animateToSuccessCompletionLayout___block_invoke;
  block[3] = &unk_1E6EA20C0;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

void __71__BKUIPearlJindoEnrollViewController_animateToSuccessCompletionLayout___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentable];
  [v1 revoke];
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  if ([(BKUIPearlEnrollViewController *)self isGlassesEnrollmentOnly])
  {
    id v4 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    [v4 matchUserForSecondPhaseEnrollmentWithCompletionAction:0];
  }
}

- (void)_postBannerToDestinationWithInitialStateCollapsed:(BOOL)a3
{
}

- (void)_postBannerToDestinationWithInitialStateCollapsed:(BOOL)a3 enrollViewStateConfiguration:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v5 = (void (**)(void))a4;
  uint64_t v6 = [(BKUIPearlJindoEnrollViewController *)self presentable];
  if (v6)
  {
    objc_super v7 = (void *)v6;
    objc_super v8 = [(BKUIPearlJindoEnrollViewController *)self presentable];
    uint64_t v9 = [v8 activeLayoutMode];

    if (v9 != -1)
    {
      uint64_t v10 = [(BKUIPearlJindoEnrollViewController *)self presentable];
      [v10 revoke];
    }
  }
  uint64_t v11 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v11 removeFromSuperview];

  uint64_t v12 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v12 setAlpha:1.0];

  if (v5) {
    v5[2](v5);
  }
  objc_super v13 = (void *)MEMORY[0x1E4F4F5B8];
  v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 bundleIdentifier];
  v16 = [v13 bannerSourceForDestination:0 forRequesterIdentifier:v15];

  v17 = [BKUIHostedJindoPresentable alloc];
  v18 = [(BKUIPearlEnrollViewController *)self enrollView];
  v19 = [(BKUIHostedJindoPresentable *)v17 initWithCustomLayout:2 enrollView:v18 destination:0];
  [(BKUIPearlJindoEnrollViewController *)self setPresentable:v19];

  v20 = [(BKUIPearlJindoEnrollViewController *)self presentable];
  [v20 setObservingDelegate:self];

  id v21 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v22 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v22);
  v24 = objc_msgSend(v21, "initWithObjectsAndKeys:", v23, @"Key", 0);

  uint64_t v25 = [(BKUIHostedJindoPresentable *)self->_presentable userInfoForPosting];
  [v24 addEntriesFromDictionary:v25];

  presentable = self->_presentable;
  id v29 = 0;
  LOBYTE(v25) = [v16 postPresentable:presentable options:1 userInfo:v24 error:&v29];
  id v27 = v29;
  if ((v25 & 1) == 0)
  {
    v28 = _BKUILoggingFacility();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v31 = v27;
      _os_log_impl(&dword_1E4B6C000, v28, OS_LOG_TYPE_DEFAULT, "Error attempting to post: %{public}@", buf, 0xCu);
    }
  }
}

- (void)_sceneWillDeactivate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  dispatch_time_t v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 description];
    int v14 = 138412290;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "Scene will deactivate %@", (uint8_t *)&v14, 0xCu);
  }
  objc_super v7 = [v4 object];
  objc_super v8 = [(BKUIPearlJindoEnrollViewController *)self view];
  uint64_t v9 = [v8 window];
  uint64_t v10 = [v9 windowScene];

  if (v7 != v10)
  {
    uint64_t v11 = _BKUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "Scene will deactivate early exit due to non matching windowScene", (uint8_t *)&v14, 2u);
    }
    goto LABEL_9;
  }
  uint64_t v12 = [(BKUIPearlEnrollViewController *)self enrollView];
  int v13 = [v12 isTransitioningToState];

  if (!v13)
  {
    uint64_t v11 = [(BKUIPearlJindoEnrollViewController *)self presentable];
    [v11 revoke];
LABEL_9:

    goto LABEL_10;
  }
  [(BKUIPearlJindoEnrollViewController *)self setJindoNeedsResignActiveRevoke:1];
LABEL_10:
}

- (void)_sceneDidActivate:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  dispatch_time_t v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 description];
    int v12 = 138412290;
    int v13 = v6;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "Scene did activate %@", (uint8_t *)&v12, 0xCu);
  }
  objc_super v7 = [v4 object];
  objc_super v8 = [(BKUIPearlJindoEnrollViewController *)self view];
  uint64_t v9 = [v8 window];
  uint64_t v10 = [v9 windowScene];

  if (v7 == v10)
  {
    [(BKUIPearlJindoEnrollViewController *)self didBecomeActive:v4];
  }
  else
  {
    uint64_t v11 = _BKUILoggingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "Scene did activate, early exit due to non matching windowScene", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)_setupUI
{
  v142[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 URLForResource:@"Enrollment-rings-alpha~iphone" withExtension:@"mov"];

  v138 = (void *)v4;
  dispatch_time_t v5 = [MEMORY[0x1E4F166C8] assetWithURL:v4];
  [v5 loadValuesAsynchronouslyForKeys:&unk_1F4094660 completionHandler:0];
  uint64_t v6 = [MEMORY[0x1E4F153E0] sharedInstance];
  [v6 setCategory:*MEMORY[0x1E4F14F68] withOptions:1 error:0];

  v136 = [MEMORY[0x1E4F16620] playerItemWithAsset:v5];
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F16608]) initWithPlayerItem:v136];
  [v7 setMuted:1];
  [v7 setAllowsExternalPlayback:0];
  objc_super v8 = [(BKUIPearlJindoEnrollViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  uint64_t v11 = [(BKUIPearlJindoEnrollViewController *)self view];
  [v11 bounds];
  double v13 = v12;

  uint64_t v14 = [BKUIPearlMovieLoopView alloc];
  double v15 = *MEMORY[0x1E4F1DB28];
  double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v137 = v5;
  v19 = -[BKUIPearlMovieLoopView initWithFrame:player:asset:](v14, "initWithFrame:player:asset:", v7, v5, *MEMORY[0x1E4F1DB28], v16, v17, v18);
  [(BKUIPearlMovieLoopView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  v135 = v7;
  [v7 play];
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v15, v16, v17, v18);
  [(BKUIPearlJindoEnrollViewController *)self setHostedTutorialMicaView:v20];

  id v21 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
  [v21 addSubview:v19];

  v119 = (void *)MEMORY[0x1E4F28DC8];
  v131 = [(BKUIPearlMovieLoopView *)v19 widthAnchor];
  v128 = [v131 constraintEqualToConstant:v10 + -52.0];
  v142[0] = v128;
  v125 = [(BKUIPearlMovieLoopView *)v19 heightAnchor];
  v122 = [v125 constraintEqualToConstant:v13 + -52.0];
  v142[1] = v122;
  v22 = [(BKUIPearlMovieLoopView *)v19 bottomAnchor];
  v23 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
  v24 = [v23 bottomAnchor];
  uint64_t v25 = [v22 constraintEqualToAnchor:v24];
  v142[2] = v25;
  v134 = v19;
  v26 = [(BKUIPearlMovieLoopView *)v19 centerXAnchor];
  id v27 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
  v28 = [v27 centerXAnchor];
  id v29 = [v26 constraintEqualToAnchor:v28];
  v142[3] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:4];
  [v119 activateConstraints:v30];

  id v31 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v32 = [(BKUIPearlJindoEnrollViewController *)self view];
  v33 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
  [v32 addSubview:v33];

  v117 = (void *)MEMORY[0x1E4F28DC8];
  v132 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
  v126 = [v132 topAnchor];
  v129 = [(BKUIPearlJindoEnrollViewController *)self view];
  v123 = [v129 topAnchor];
  v120 = [v126 constraintEqualToAnchor:v123];
  v141[0] = v120;
  v34 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
  v35 = [v34 heightAnchor];
  v36 = [(BKUIPearlJindoEnrollViewController *)self view];
  [v36 bounds];
  v38 = [v35 constraintEqualToConstant:v37 + 26.0];
  v141[1] = v38;
  v39 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
  v40 = [v39 widthAnchor];
  v41 = [(BKUIPearlJindoEnrollViewController *)self view];
  [v41 bounds];
  v43 = [v40 constraintEqualToConstant:v42];
  v141[2] = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v141 count:3];
  [v117 activateConstraints:v44];

  v45 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
  v46 = [v45 centerXAnchor];
  v47 = [(BKUIPearlJindoEnrollViewController *)self view];
  v48 = [v47 centerXAnchor];
  v49 = [v46 constraintEqualToAnchor:v48];
  [(BKUIPearlJindoEnrollViewController *)self setHostedTutorialMicaViewCenterConstraint:v49];

  v50 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaViewCenterConstraint];
  [v50 setActive:1];

  [(BKUIPearlJindoEnrollViewController *)self _prepEnrollViewAndEnrollTutorialMica];
  v51 = [BKUIButtonTray alloc];
  v52 = [(BKUIPearlJindoEnrollViewController *)self view];
  [v52 bounds];
  v53 = -[BKUIButtonTray initWithFrame:](v51, "initWithFrame:");
  [(BKUIPearlEnrollViewController *)self setButtonTray:v53];

  v54 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
  v55 = [v54 bottomLinkButton];
  [(BKUIPearlEnrollViewController *)self setEscapeHatchButton:v55];

  v56 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
  v57 = [v56 nextStateButton];
  [(BKUIPearlEnrollViewController *)self setNextStateButton:v57];

  v58 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
  v59 = [v58 nextStateButtonContainer];
  [(BKUIPearlEnrollViewController *)self setNextStateButtonContainer:v59];

  v60 = [(BKUIPearlJindoEnrollViewController *)self view];
  [v60 frame];
  double v62 = v61;
  v63 = [(BKUIPearlJindoEnrollViewController *)self view];
  [v63 bounds];
  double v65 = v64;

  v66 = -[BKUIButtonTray initWithFrame:willUseActionDelegate:]([BKUIButtonTray alloc], "initWithFrame:willUseActionDelegate:", 1, 0.0, 0.0, v62, v65);
  v67 = -[BKUIButtonTray initWithFrame:willUseActionDelegate:]([BKUIButtonTray alloc], "initWithFrame:willUseActionDelegate:", 1, 0.0, 0.0, v62, v65);
  v68 = [BKUIJindoBottomContainer alloc];
  BOOL v69 = [(BKUIPearlEnrollViewController *)self inBuddy];
  v133 = v66;
  v70 = -[BKUIJindoContainerScrollview initWithFrame:buttonTray:]([BKUIJindoContainerScrollview alloc], "initWithFrame:buttonTray:", v66, 0.0, 0.0, v62, v65);
  v130 = v67;
  v71 = -[BKUIJindoContainerScrollview initWithFrame:buttonTray:]([BKUIJindoContainerScrollview alloc], "initWithFrame:buttonTray:", v67, 0.0, 0.0, v62, v65);
  v72 = -[BKUIPearlEnrollViewBottomContainer initWithFrame:inBuddy:scrollView:overlapScrollView:delegate:squareNeedsPositionLayout:](v68, "initWithFrame:inBuddy:scrollView:overlapScrollView:delegate:squareNeedsPositionLayout:", v69, v70, v71, self, 1, 0.0, 0.0, v62, v65);
  [(BKUIPearlEnrollViewController *)self setBottomContainer:v72];

  v73 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
  v74 = [v73 topLinkButton];
  [(BKUIPearlEnrollViewController *)self setRetryMatchOperationButton:v74];

  v75 = [(BKUIPearlJindoEnrollViewController *)self retryMatchOperationButton];
  v76 = [v75 titleLabel];
  [v76 setAdjustsFontSizeToFitWidth:1];

  v77 = [(BKUIPearlJindoEnrollViewController *)self retryMatchOperationButton];
  [v77 addTarget:self action:sel_retryPressed forControlEvents:64];

  v78 = [(BKUIPearlJindoEnrollViewController *)self nextStateButton];
  [v78 addTarget:self action:sel_nextStateButtonPressed_ forControlEvents:0x2000];

  v79 = [(BKUIPearlJindoEnrollViewController *)self escapeHatchButton];
  [v79 addTarget:self action:sel_escapeHatchButtonPressed forControlEvents:0x2000];

  v80 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
  v81 = [v80 bottomLinkButton];
  [(BKUIPearlEnrollViewController *)self setEscapeHatchButton:v81];

  v82 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v82 setTranslatesAutoresizingMaskIntoConstraints:0];

  v83 = [(BKUIPearlJindoEnrollViewController *)self view];
  v84 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v83 addSubview:v84];

  v85 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  v86 = [v85 topAnchor];
  v87 = [(BKUIPearlJindoEnrollViewController *)self view];
  v88 = [v87 topAnchor];
  v89 = [v86 constraintEqualToAnchor:v88];
  [(BKUIPearlJindoEnrollViewController *)self setBottomContainerTopConstraint:v89];

  v113 = (void *)MEMORY[0x1E4F28DC8];
  v127 = [(BKUIPearlJindoEnrollViewController *)self bottomContainerTopConstraint];
  v140[0] = v127;
  v124 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  v118 = [v124 bottomAnchor];
  v121 = [(BKUIPearlJindoEnrollViewController *)self view];
  v116 = [v121 bottomAnchor];
  v115 = [v118 constraintEqualToAnchor:v116];
  v140[1] = v115;
  v114 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  v112 = [v114 leadingAnchor];
  v90 = [(BKUIPearlJindoEnrollViewController *)self view];
  v91 = [v90 leadingAnchor];
  v92 = [v112 constraintEqualToAnchor:v91];
  v140[2] = v92;
  v93 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  v94 = [v93 trailingAnchor];
  v95 = [(BKUIPearlJindoEnrollViewController *)self view];
  v96 = [v95 trailingAnchor];
  v97 = [v94 constraintEqualToAnchor:v96];
  v140[3] = v97;
  v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v140 count:4];
  [v113 activateConstraints:v98];

  v99 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v99 setupInitialUI];

  [(BKUIPearlEnrollViewController *)self _updateLeftBarButtonItem];
  v100 = [(BKUIPearlJindoEnrollViewController *)self view];
  v101 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [v100 setBackgroundColor:v101];

  v102 = [(BKUIPearlJindoEnrollViewController *)self view];
  v103 = [v102 superview];
  v104 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  [v103 setBackgroundColor:v104];

  v105 = [(BKUIPearlEnrollViewController *)self instructionView];
  objc_msgSend(v105, "setDarkMode:", -[BKUIPearlJindoEnrollViewController _isDarkMode](self, "_isDarkMode"));

  [(BKUIPearlJindoEnrollViewController *)self setNeedsStatusBarAppearanceUpdate];
  v106 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
  [v106 updateButtonLayout];

  v107 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v107 setTransitionDelegate:self];

  if ([(BKUIPearlEnrollViewController *)self isGlassesEnrollmentOnly])
  {
    v139[0] = MEMORY[0x1E4F143A8];
    v139[1] = 3221225472;
    v139[2] = __46__BKUIPearlJindoEnrollViewController__setupUI__block_invoke;
    v139[3] = &unk_1E6EA20C0;
    v139[4] = self;
    [(BKUIPearlJindoEnrollViewController *)self _postBannerToDestinationWithInitialStateCollapsed:0 enrollViewStateConfiguration:v139];
  }
  v108 = [(BKUIPearlJindoEnrollViewController *)self view];
  [v108 bounds];
  double v110 = v109 + 26.0 + 40.0;
  v111 = [(BKUIPearlJindoEnrollViewController *)self bottomContainerTopConstraint];
  [v111 setConstant:v110];
}

void __46__BKUIPearlJindoEnrollViewController__setupUI__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hostedTutorialMicaView];
  [v2 setAlpha:0.0];

  v3 = [*(id *)(a1 + 32) enrollView];
  [v3 setPillsHidden:1];

  [*(id *)(a1 + 32) setState:2 animated:0];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__BKUIPearlJindoEnrollViewController__setupUI__block_invoke_2;
  v5[3] = &unk_1E6EA2098;
  objc_copyWeak(&v6, &location);
  [v4 _setState:3 animated:0 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __46__BKUIPearlJindoEnrollViewController__setupUI__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained enrollView];
  [v1 setNeedsLayout];
}

- (void)prepareBottomContainerForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  if (a4 == 2)
  {
    double v10 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaViewCenterConstraint];
    [v10 setActive:0];

    id v13 = [(BKUIPearlEnrollViewController *)self bottomContainer];
    uint64_t v11 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
    double v12 = [(BKUIPearlJindoEnrollViewController *)self view];
    [v13 prepareForAnimationToState:v8 fromState:2 subState:v7 advancing:v6 tagAlong:v11 parentView:v12];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)BKUIPearlJindoEnrollViewController;
    [(BKUIPearlEnrollViewController *)&v14 prepareBottomContainerForAnimationToState:*(void *)&a3 fromState:*(void *)&a4 subState:*(void *)&a5 advancing:a6];
  }
}

- (void)willResignActive:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIPearlJindoEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v5 willResignActive:a3];
  uint64_t v4 = [(BKUIPearlJindoEnrollViewController *)self presentable];
  [v4 revoke];
}

- (void)didBecomeActive:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlJindoEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v11 didBecomeActive:a3];
  uint64_t v4 = [(BKUIPearlJindoEnrollViewController *)self view];
  objc_super v5 = [v4 window];

  if (v5)
  {
    BOOL v6 = [(BKUIPearlJindoEnrollViewController *)self parentViewController];
    uint64_t v7 = [v6 childViewControllers];
    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global];
    double v9 = [v7 filteredArrayUsingPredicate:v8];
    uint64_t v10 = [v9 count];

    if (!v10
      && [(BKUIPearlEnrollViewController *)self state] != 10
      && [(BKUIPearlEnrollViewController *)self state] != 2)
    {
      [(BKUIPearlJindoEnrollViewController *)self _postBannerToDestinationWithInitialStateCollapsed:0];
    }
  }
}

uint64_t __54__BKUIPearlJindoEnrollViewController_didBecomeActive___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)nextStateButtonPressed:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BKUIPearlJindoEnrollViewController *)self nextStateButton];
  [v5 setEnabled:0];

  if (![(BKUIPearlEnrollViewController *)self isGlassesEnrollmentOnly]
    && [(BKUIPearlEnrollViewController *)self state] == 2)
  {
    if ([(BKUIPearlEnrollViewController *)self state] == 2)
    {
      BOOL v6 = _BKUILoggingFacility();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Next state button pressed, startEnroll...", buf, 2u);
      }

      uint64_t v7 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      if ([v7 supportsPeriocularEnrollment])
      {
        uint64_t v8 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        char v9 = [v8 isEnrollmentAugmentationOnly];

        if (v9)
        {
          uint64_t v10 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
          [v10 matchUserForSecondPhaseEnrollmentWithCompletionAction:0];

          goto LABEL_12;
        }
      }
      else
      {
      }
      [(BKUIPearlEnrollViewController *)self startEnroll];
    }
LABEL_12:
    dispatch_time_t v12 = dispatch_time(0, 400000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__BKUIPearlJindoEnrollViewController_nextStateButtonPressed___block_invoke;
    block[3] = &unk_1E6EA20C0;
    block[4] = self;
    dispatch_after(v12, MEMORY[0x1E4F14428], block);
    goto LABEL_13;
  }
  v13.receiver = self;
  v13.super_class = (Class)BKUIPearlJindoEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v13 nextStateButtonPressed:v4];
  objc_super v11 = [(BKUIPearlJindoEnrollViewController *)self nextStateButton];
  [v11 setEnabled:1];

LABEL_13:
}

uint64_t __61__BKUIPearlJindoEnrollViewController_nextStateButtonPressed___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__BKUIPearlJindoEnrollViewController_nextStateButtonPressed___block_invoke_2;
  v3[3] = &unk_1E6EA20C0;
  v3[4] = v1;
  return [v1 _postBannerToDestinationWithInitialStateCollapsed:0 enrollViewStateConfiguration:v3];
}

void __61__BKUIPearlJindoEnrollViewController_nextStateButtonPressed___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hostedTutorialMicaView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) nextStateButton];
  [v3 setEnabled:1];
}

- (BOOL)_isDarkMode
{
  id v2 = [(BKUIPearlJindoEnrollViewController *)self traitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == 2;

  return v3;
}

- (CGSize)_fullEnrollViewSize
{
  BOOL v3 = +[BKUIDevice sharedInstance];
  int v4 = [v3 isZoomEnabled];

  objc_super v5 = [(BKUIPearlJindoEnrollViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  uint64_t v8 = [(BKUIPearlJindoEnrollViewController *)self view];
  [v8 bounds];
  double v10 = v9;

  double v11 = 30.0;
  if (!v4) {
    double v11 = -15.0;
  }
  double v12 = v7 + v11;
  double v13 = v10 + v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_handleEnrollStateOnAppear
{
  if (![(BKUIPearlEnrollViewController *)self isGlassesEnrollmentOnly])
  {
    v8.receiver = self;
    v8.super_class = (Class)BKUIPearlJindoEnrollViewController;
    [(BKUIPearlEnrollViewController *)&v8 _handleEnrollStateOnAppear];
    BOOL v3 = [(BKUIPearlEnrollViewController *)self enrollView];
    [v3 setAlpha:0.0];

    objc_initWeak(&location, self);
    int v4 = [(BKUIPearlEnrollViewController *)self enrollView];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __64__BKUIPearlJindoEnrollViewController__handleEnrollStateOnAppear__block_invoke;
    v5[3] = &unk_1E6EA2098;
    objc_copyWeak(&v6, &location);
    [v4 setState:3 completion:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __64__BKUIPearlJindoEnrollViewController__handleEnrollStateOnAppear__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained enrollView];
  [v1 setNeedsLayout];

  id v2 = [WeakRetained enrollView];
  [v2 layoutIfNeeded];
}

- (void)_prepEnrollViewAndEnrollTutorialMica
{
  v32[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [BKUIJindoPositioningGuideView alloc];
  v28 = -[BKUIPearlPositioningGuideView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  int v4 = [BKUIPearlEnrollView alloc];
  [(BKUIPearlJindoEnrollViewController *)self _fullEnrollViewSize];
  double v6 = v5;
  [(BKUIPearlJindoEnrollViewController *)self _fullEnrollViewSize];
  double v8 = v7;
  double v9 = [(BKUIPearlEnrollViewController *)self preloadedState];
  double v10 = [v9 acquireCachedVideoCaptureSession];
  double v11 = -[BKUIPearlEnrollView initWithFrame:videoCaptureSession:inSheet:positioningGuideView:squareNeedsPositionLayout:](v4, "initWithFrame:videoCaptureSession:inSheet:positioningGuideView:squareNeedsPositionLayout:", v10, [(BKUIPearlEnrollViewController *)self inSheet], v28, 1, 0.0, 0.0, v6, v8);
  [(BKUIPearlEnrollViewController *)self setEnrollView:v11];

  double v12 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v27 = (void *)MEMORY[0x1E4F28DC8];
  double v13 = [(BKUIPearlEnrollViewController *)self enrollView];
  objc_super v14 = [v13 widthAnchor];
  [(BKUIPearlJindoEnrollViewController *)self _fullEnrollViewSize];
  double v15 = objc_msgSend(v14, "constraintEqualToConstant:");
  v32[0] = v15;
  double v16 = [(BKUIPearlEnrollViewController *)self enrollView];
  double v17 = [v16 heightAnchor];
  double v18 = [(BKUIPearlEnrollViewController *)self enrollView];
  v19 = [v18 widthAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  v32[1] = v20;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  [v27 activateConstraints:v21];

  v22 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v22 preEnrollActivate];

  if (![(BKUIPearlEnrollViewController *)self isGlassesEnrollmentOnly])
  {
    v23 = [(BKUIPearlJindoEnrollViewController *)self hostedTutorialMicaView];
    v24 = [(BKUIPearlEnrollViewController *)self enrollView];
    [v23 addSubview:v24];

    uint64_t v25 = [(BKUIPearlEnrollViewController *)self enrollView];
    [v25 setAlpha:0.0];

    objc_initWeak(&location, self);
    v26 = [(BKUIPearlEnrollViewController *)self enrollView];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __74__BKUIPearlJindoEnrollViewController__prepEnrollViewAndEnrollTutorialMica__block_invoke;
    v29[3] = &unk_1E6EA2098;
    objc_copyWeak(&v30, &location);
    [v26 setState:2 completion:v29];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
}

void __74__BKUIPearlJindoEnrollViewController__prepEnrollViewAndEnrollTutorialMica__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained enrollView];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__BKUIPearlJindoEnrollViewController__prepEnrollViewAndEnrollTutorialMica__block_invoke_2;
  v4[3] = &unk_1E6EA2098;
  objc_copyWeak(&v5, v1);
  [v3 setState:3 completion:v4];

  objc_destroyWeak(&v5);
}

void __74__BKUIPearlJindoEnrollViewController__prepEnrollViewAndEnrollTutorialMica__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained enrollView];
  [v1 setNeedsLayout];

  id v2 = [WeakRetained enrollView];
  [v2 layoutIfNeeded];
}

- (void)stateTransitionDidComplete
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(BKUIPearlJindoEnrollViewController *)self jindoNeedsResignActiveRevoke])
  {
    [(BKUIPearlJindoEnrollViewController *)self setJindoNeedsResignActiveRevoke:0];
    id v3 = [(BKUIPearlJindoEnrollViewController *)self presentable];
    [v3 revoke];
  }
}

- (id)escapeHatchButton:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  double v7 = objc_opt_class();
  double v8 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  double v9 = [v8 poseStatus];
  if ([v7 _shouldShowAccessibilityOptionForState:v4 poseStatus:v9])
  {
    double v10 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    [v10 bioKitCompletionPercentage];
    double v12 = v11;

    if (v12 >= 1.0)
    {
      double v13 = [v6 buttonTray];
      uint64_t v14 = [v13 topLinkButton];
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v13 = [v6 buttonTray];
  uint64_t v14 = [v13 bottomLinkButton];
LABEL_6:
  double v15 = (void *)v14;

  return v15;
}

- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6
{
  uint64_t v6 = *(void *)&a3;
  v19.receiver = self;
  v19.super_class = (Class)BKUIPearlJindoEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v19 prepareForAnimationToState:*(void *)&a3 fromState:*(void *)&a4 subState:*(void *)&a5 advancing:a6];
  double v8 = [(BKUIPearlJindoEnrollViewController *)self startOverButtonForState:v6];
  double v9 = [(BKUIPearlJindoEnrollViewController *)self _startOverTitleForState:v6];
  [v8 setTitle:v9 forState:0];

  BOOL v10 = [(BKUIPearlEnrollViewController *)self inBuddy];
  if ((v6 - 3) <= 1 && v10)
  {
    double v11 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
    double v12 = [v11 topLinkButton];
    double v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS" value:&stru_1F4081468 table:@"Pearl-periocular"];
    [v12 setTitle:v14 forState:0];
  }
  double v15 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  double v16 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  double v17 = [v16 onScreenScrollview];
  [v15 bringSubviewToFront:v17];

  double v18 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v18 updateButtonVisibility];
}

- (id)_startOverTitleForState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v4 = (a3 > 0xA) | (0x2BFu >> a3);
  id v5 = [(BKUIPearlJindoEnrollViewController *)self _jindoBottomContainer];
  int v6 = [v5 showStartOverForState:v3];

  double v7 = 0;
  if ((v4 & 1) != 0 && v6)
  {
    double v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v7 = [v8 localizedStringForKey:@"START_OVER" value:&stru_1F4081468 table:@"Pearl-periocular"];
  }

  return v7;
}

- (id)nextStateButton
{
  id v2 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  uint64_t v3 = [v2 nextStateButton];

  return v3;
}

- (id)escapeHatchButton
{
  unsigned int v3 = [(BKUIPearlEnrollViewController *)self state];
  if (v3 > 0xA)
  {
    id v5 = 0;
  }
  else
  {
    if (((1 << v3) & 0x747) != 0)
    {
      unsigned int v4 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
      [v4 bottomLinkButton];
    }
    else
    {
      unsigned int v4 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
      [v4 topLinkButton];
    id v5 = };
  }

  return v5;
}

- (id)buttonTray
{
  id v2 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  unsigned int v3 = [v2 buttonTray];

  return v3;
}

- (id)nextStateButtonContainer
{
  id v2 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
  unsigned int v3 = [v2 nextStateButtonContainer];

  return v3;
}

- (id)retryMatchOperationButton
{
  id v2 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
  unsigned int v3 = [v2 topLinkButton];

  return v3;
}

- (id)startOverButtonForState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(BKUIPearlJindoEnrollViewController *)self _jindoBottomContainer];
  LODWORD(v3) = [v5 showStartOverForState:v3];

  if (v3)
  {
    int v6 = [(BKUIPearlJindoEnrollViewController *)self buttonTray];
    double v7 = [v6 bottomLinkButton];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 setAlertListener:self];
    BOOL v10 = [(BKUIPearlJindoEnrollViewController *)self presentable];
    [v10 revoke];
  }
  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlJindoEnrollViewController;
  [(BKUIPearlJindoEnrollViewController *)&v11 presentViewController:v8 animated:v6 completion:v9];
}

- (void)alertActionTappedFromAlert
{
  if ([(BKUIPearlEnrollViewController *)self state] != 10)
  {
    [(BKUIPearlJindoEnrollViewController *)self _postBannerToDestinationWithInitialStateCollapsed:0];
  }
}

- (void)didChangeActiveLayoutMode:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BKUIPearlJindoEnrollViewController *)self view];
  BOOL v6 = [v5 window];
  double v7 = [v6 windowScene];
  if (v7)
  {
    id v8 = [(BKUIPearlJindoEnrollViewController *)self view];
    id v9 = [v8 window];
    BOOL v10 = [v9 windowScene];
    BOOL v11 = [v10 activationState] == 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  if ([v4 activeLayoutMode] >= 2 && !v11)
  {
    double v12 = [(BKUIPearlJindoEnrollViewController *)self presentable];
    [v12 revoke];

    double v13 = _BKUILoggingFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1E4B6C000, v13, OS_LOG_TYPE_DEFAULT, "Element did clean up and auto-revoke %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (BKUIHostedJindoPresentable)presentable
{
  return self->_presentable;
}

- (void)setPresentable:(id)a3
{
}

- (NSLayoutConstraint)bottomContainerTopConstraint
{
  return self->_bottomContainerTopConstraint;
}

- (void)setBottomContainerTopConstraint:(id)a3
{
}

- (UIView)hostedTutorialMicaView
{
  return self->_hostedTutorialMicaView;
}

- (void)setHostedTutorialMicaView:(id)a3
{
}

- (NSLayoutConstraint)hostedTutorialMicaViewCenterConstraint
{
  return self->_hostedTutorialMicaViewCenterConstraint;
}

- (void)setHostedTutorialMicaViewCenterConstraint:(id)a3
{
}

- (BOOL)jindoNeedsResignActiveRevoke
{
  return self->_jindoNeedsResignActiveRevoke;
}

- (void)setJindoNeedsResignActiveRevoke:(BOOL)a3
{
  self->_jindoNeedsResignActiveRevoke = a3;
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_hostedTutorialMicaViewCenterConstraint, 0);
  objc_storeStrong((id *)&self->_hostedTutorialMicaView, 0);
  objc_storeStrong((id *)&self->_bottomContainerTopConstraint, 0);

  objc_storeStrong((id *)&self->_presentable, 0);
}

@end