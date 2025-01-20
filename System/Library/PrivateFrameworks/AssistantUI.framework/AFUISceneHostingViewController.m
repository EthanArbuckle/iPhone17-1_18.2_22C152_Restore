@interface AFUISceneHostingViewController
- (AFUISceneConfiguration)configuration;
- (AFUISceneController)sceneController;
- (AFUISceneHostingViewController)init;
- (AFUISceneHostingViewController)initWithCoder:(id)a3;
- (BOOL)_hasScene;
- (BOOL)_shouldDeferHIDEventsForMode;
- (BOOL)clippingDisabled;
- (BOOL)isDeferringHIDEvents;
- (BOOL)isHostingScene;
- (BOOL)isInFluidDismissal;
- (BOOL)isSceneActive;
- (BOOL)pauseDeferrals;
- (BOOL)safeAreaInsetsAreSuspended;
- (BSInvalidatable)predicateInvalidationHandler;
- (CGRect)currentFrame;
- (FBScene)scene;
- (UIEdgeInsets)effectiveSafeAreaInsets;
- (UIEdgeInsets)suspendedSafeAreaInsets;
- (UIScenePresenter)presentation;
- (UIView)windowSceneHostingView;
- (id)sceneConfigurationForDelegate;
- (int64_t)currentOrientation;
- (int64_t)deferralMode;
- (void)_commonInit;
- (void)_registerForAmbientPresentationTraitChange;
- (void)_transitionContentsWithView:(id)a3 forContentState:(int64_t)a4;
- (void)_updateDeferralChainWithWindow:(id)a3;
- (void)_updateSceneSettingsForAmbient;
- (void)_updateSceneSettingsToSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 withAnimationSettings:(id)a5 animationFence:(id)a6;
- (void)_updateSceneUIApplicationSceneSettingsWithBlock:(id)a3;
- (void)deactivateScene;
- (void)invalidateAndPauseDeferringHIDEvents;
- (void)invalidateSceneForReason:(unint64_t)a3 explanation:(id)a4;
- (void)reactivateScene;
- (void)sceneController:(id)a3 sceneContentStateDidChange:(id)a4;
- (void)sceneController:(id)a3 sceneDidUpdateClientSettings:(id)a4;
- (void)sceneController:(id)a3 sceneWasInvalidated:(id)a4 forReason:(unint64_t)a5;
- (void)setClippingDisabled:(BOOL)a3;
- (void)setCurrentFrame:(CGRect)a3;
- (void)setCurrentOrientation:(int64_t)a3;
- (void)setEffectiveSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setInFluidDismissal:(BOOL)a3;
- (void)setPauseDeferrals:(BOOL)a3;
- (void)setPredicateInvalidationHandler:(id)a3;
- (void)setPresentation:(id)a3;
- (void)setSafeAreaInsetsAreSuspended:(BOOL)a3;
- (void)setScene:(id)a3;
- (void)setSceneController:(id)a3;
- (void)setSuspendedSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setWindowSceneHostingView:(id)a3;
- (void)startDeferringHIDEventsIfNeeded;
- (void)startHostingSceneForConfiguration:(id)a3 withCompletionBlock:(id)a4;
- (void)stopHostingScene;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSceneDeactivationReasonMask:(unint64_t)a3;
- (void)updateSceneWithConfiguration:(id)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AFUISceneHostingViewController

- (AFUISceneHostingViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AFUISceneHostingViewController;
  v2 = [(AFUISceneHostingViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AFUISceneHostingViewController *)v2 _commonInit];
  }
  return v3;
}

- (AFUISceneHostingViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AFUISceneHostingViewController;
  v3 = [(AFUISceneHostingViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AFUISceneHostingViewController *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = objc_alloc_init(AFUISceneController);
  sceneController = self->_sceneController;
  self->_sceneController = v3;

  [(AFUISceneController *)self->_sceneController setDelegate:self];
  self->_deferralMode = 0;
  self->_pauseDeferrals = 1;

  [(AFUISceneHostingViewController *)self _registerForAmbientPresentationTraitChange];
}

- (void)_registerForAmbientPresentationTraitChange
{
  v9[1] = *MEMORY[0x263EF8340];
  [(AFUISceneHostingViewController *)self _updateSceneSettingsForAmbient];
  objc_initWeak(&location, self);
  v3 = self;
  v9[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__AFUISceneHostingViewController__registerForAmbientPresentationTraitChange__block_invoke;
  v6[3] = &unk_264691798;
  objc_copyWeak(&v7, &location);
  id v5 = (id)[(AFUISceneHostingViewController *)self registerForTraitChanges:v4 withHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __76__AFUISceneHostingViewController__registerForAmbientPresentationTraitChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSceneSettingsForAmbient];
}

- (void)_updateSceneSettingsForAmbient
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __64__AFUISceneHostingViewController__updateSceneSettingsForAmbient__block_invoke;
  v2[3] = &unk_2646917C0;
  v2[4] = self;
  [(AFUISceneHostingViewController *)self _updateSceneUIApplicationSceneSettingsWithBlock:v2];
}

void __64__AFUISceneHostingViewController__updateSceneSettingsForAmbient__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    v3 = [*(id *)(a1 + 32) traitCollection];
    uint64_t v4 = [v3 isAmbientPresented];

    [v5 setAmbientPresented:v4];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFUISceneHostingViewController;
  [(AFUISceneHostingViewController *)&v5 viewWillAppear:a3];
  if (!self->_currentOrientation)
  {
    uint64_t v4 = [MEMORY[0x263F82438] sharedApplication];
    self->_currentOrientation = [v4 activeInterfaceOrientation];
  }
}

- (void)_updateSceneSettingsToSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 withAnimationSettings:(id)a5 animationFence:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  v13 = (os_log_t *)MEMORY[0x263F28348];
  v14 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[AFUISceneHostingViewController _updateSceneSettingsToSize:interfaceOrientation:withAnimationSettings:animationFence:]";
    _os_log_impl(&dword_223099000, v14, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if ((unint64_t)(a4 - 3) >= 2) {
    double v15 = width;
  }
  else {
    double v15 = height;
  }
  if ((unint64_t)(a4 - 3) < 2) {
    double height = width;
  }
  v16 = [(AFUISceneHostingViewController *)self scene];
  v17 = [v16 settings];
  char v18 = [v17 isForeground];

  if (self->_currentOrientation != a4
    || (v40.origin.CGFloat x = 0.0,
        v40.origin.CGFloat y = 0.0,
        v40.size.double width = v15,
        v40.size.double height = height,
        !CGRectEqualToRect(v40, self->_currentFrame)))
  {
    self->_currentOrientation = a4;
    self->_currentFrame.origin.CGFloat x = 0.0;
    self->_currentFrame.origin.CGFloat y = 0.0;
    self->_currentFrame.size.double width = v15;
    self->_currentFrame.size.double height = height;
    os_log_t v19 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat x = self->_currentFrame.origin.x;
      CGFloat y = self->_currentFrame.origin.y;
      CGFloat v22 = self->_currentFrame.size.width;
      CGFloat v23 = self->_currentFrame.size.height;
      v24 = v19;
      v41.origin.CGFloat x = x;
      v41.origin.CGFloat y = y;
      v41.size.double width = v22;
      v41.size.double height = v23;
      v25 = NSStringFromCGRect(v41);
      *(_DWORD *)buf = 136315650;
      v34 = "-[AFUISceneHostingViewController _updateSceneSettingsToSize:interfaceOrientation:withAnimationSettings:animationFence:]";
      __int16 v35 = 2112;
      v36 = v25;
      __int16 v37 = 2048;
      int64_t v38 = a4;
      _os_log_impl(&dword_223099000, v24, OS_LOG_TYPE_DEFAULT, "%s Updating scene with frame: %@, interfaceOrientation: %zd", buf, 0x20u);
    }
    scene = self->_scene;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __119__AFUISceneHostingViewController__updateSceneSettingsToSize_interfaceOrientation_withAnimationSettings_animationFence___block_invoke;
    v27[3] = &unk_2646917E8;
    char v32 = v18;
    id v28 = v12;
    v30 = self;
    int64_t v31 = a4;
    id v29 = v11;
    [(FBScene *)scene updateSettingsWithTransitionBlock:v27];
    [(AFUISceneHostingViewController *)self updateRemoteSceneWithFrontMostAppInterfaceOrientation:self->_currentOrientation];
  }
}

id __119__AFUISceneHostingViewController__updateSceneSettingsToSize_interfaceOrientation_withAnimationSettings_animationFence___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v4 = objc_opt_new();
    [v4 setAnimationFence:*(void *)(a1 + 32)];
    [v4 setAnimationSettings:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([v3 isUISubclass])
  {
    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = v3;
    [v6 setInterfaceOrientation:v5];
    objc_msgSend(v6, "setFrame:", *(double *)(*(void *)(a1 + 48) + 1048), *(double *)(*(void *)(a1 + 48) + 1056), *(double *)(*(void *)(a1 + 48) + 1064), *(double *)(*(void *)(a1 + 48) + 1072));
  }

  return v4;
}

- (void)startHostingSceneForConfiguration:(id)a3 withCompletionBlock:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    double v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"AFUISceneHostingViewController.m", 173, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"AFUISceneHostingViewController.m", 174, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_5;
  }
LABEL_3:
  int64_t v11 = [v8 preferredDeferralMode];
  self->_deferralMode = v11;
  self->_pauseDeferrals = v11 != 1;
  id v12 = [(AFUISceneHostingViewController *)self traitCollection];
  objc_msgSend(v8, "setUserInterfaceStyle:", objc_msgSend(v12, "userInterfaceStyle"));

  objc_storeStrong((id *)&self->_configuration, a3);
  objc_initWeak(&location, self);
  sceneController = self->_sceneController;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__AFUISceneHostingViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke;
  v17[3] = &unk_264691830;
  objc_copyWeak(&v19, &location);
  id v14 = v10;
  id v18 = v14;
  [(AFUISceneController *)sceneController requestSceneViewWithConfiguration:v8 completionBlock:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __88__AFUISceneHostingViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (os_log_t *)MEMORY[0x263F28348];
  if (v6)
  {
    id v8 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      v10 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v28 = "-[AFUISceneHostingViewController startHostingSceneForConfiguration:withCompletionBlock:]_block_invoke";
      __int16 v29 = 2112;
      v30 = v10;
      _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting Error requesting scene: %@ ", buf, 0x16u);
    }
  }
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v12 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v13 = [WeakRetained scene];
      id v14 = (void *)v13;
      if ((id)v13 == v5)
      {
        id v19 = [v12 presentation];
      }
      else
      {
        if (v13)
        {
          v25 = [MEMORY[0x263F08690] currentHandler];
          v26 = [NSString stringWithUTF8String:"-[AFUISceneHostingViewController startHostingSceneForConfiguration:withCompletionBlock:]_block_invoke"];
          [v25 handleFailureInFunction:v26, @"AFUISceneHostingViewController.m", 199, @"#sceneHosting scene mismatch : old=%@ new=%@", v14, v5 file lineNumber description];
        }
        [v12 setScene:v5];
        [v12 _updateSceneSettingsForAmbient];
        double v15 = [v5 uiPresentationManager];
        v16 = NSString;
        v17 = [v5 identifier];
        id v18 = [v16 stringWithFormat:@"PresentationManager-Scene%@", v17];
        id v19 = [v15 createPresenterWithIdentifier:v18];

        [v19 modifyPresentationContext:&__block_literal_global];
        [v12 setPresentation:v19];
      }
      [v19 activate];
      os_log_t v20 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v20;
        CGFloat v22 = [v5 identifier];
        *(_DWORD *)buf = 136315906;
        id v28 = "-[AFUISceneHostingViewController startHostingSceneForConfiguration:withCompletionBlock:]_block_invoke";
        __int16 v29 = 2112;
        v30 = v19;
        __int16 v31 = 2112;
        char v32 = v22;
        __int16 v33 = 2112;
        id v34 = v5;
        _os_log_impl(&dword_223099000, v21, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting Completed scene request with presenter %@ for scene (ID: %@) %@", buf, 0x2Au);
      }
      CGFloat v23 = [v19 presentationView];
      objc_msgSend(v12, "_transitionContentsWithView:forContentState:", v23, objc_msgSend(v5, "contentState"));
    }
  }
  v24 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v28 = "-[AFUISceneHostingViewController startHostingSceneForConfiguration:withCompletionBlock:]_block_invoke";
    _os_log_impl(&dword_223099000, v24, OS_LOG_TYPE_DEFAULT, "%s #sceneHosting calling completion block for startHostingSceneForConfiguration", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__AFUISceneHostingViewController_startHostingSceneForConfiguration_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAppearanceStyle:2];
  [v2 setPresentedLayerTypes:26];
}

- (void)stopHostingScene
{
  [(AFUISceneHostingViewController *)self _audioCategoriesDisablingVolumeHUDDidChangeTo:0];
  [(AFUISceneHostingViewController *)self _transitionContentsWithView:0 forContentState:0];
  presentation = self->_presentation;

  [(UIScenePresenter *)presentation deactivate];
}

- (void)invalidateSceneForReason:(unint64_t)a3 explanation:(id)a4
{
  id v6 = a4;
  [(AFUISceneHostingViewController *)self stopHostingScene];
  [(AFUISceneController *)self->_sceneController invalidateSceneForReason:a3 explanation:v6];

  presentation = self->_presentation;
  self->_presentation = 0;

  [(AFUISceneHostingViewController *)self setScene:0];
}

- (BOOL)isHostingScene
{
  windowSceneHostingView = self->_windowSceneHostingView;
  if (!windowSceneHostingView) {
    return 0;
  }
  id v3 = [(UIView *)windowSceneHostingView superview];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isDeferringHIDEvents
{
  return self->_predicateInvalidationHandler != 0;
}

- (void)startDeferringHIDEventsIfNeeded
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  self->_pauseDeferrals = 0;
  id v3 = [(AFUISceneHostingViewController *)self view];
  BOOL v4 = [v3 window];

  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[AFUISceneHostingViewController startDeferringHIDEventsIfNeeded]";
    __int16 v10 = 2112;
    int64_t v11 = v4;
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s #siriHID Starting HID deferrals and resuming until asked to pause again: %@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = [(AFUISceneHostingViewController *)self view];
  id v7 = [v6 window];
  [(AFUISceneHostingViewController *)self _updateDeferralChainWithWindow:v7];
}

- (void)invalidateAndPauseDeferringHIDEvents
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[AFUISceneHostingViewController invalidateAndPauseDeferringHIDEvents]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #siriHID Invalidating HID deferrals and pausing until asked to start again", (uint8_t *)&v4, 0xCu);
  }
  [(BSInvalidatable *)self->_predicateInvalidationHandler invalidate];
  self->_pauseDeferrals = 1;
}

- (void)updateSceneWithConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
  id v5 = a3;
  [(AFUISceneController *)self->_sceneController updateSceneViewWithConfiguration:v5];
}

- (void)_transitionContentsWithView:(id)a3 forContentState:(int64_t)a4
{
  id v13 = a3;
  p_windowSceneHostingView = &self->_windowSceneHostingView;
  [(UIView *)self->_windowSceneHostingView removeFromSuperview];
  windowSceneHostingView = self->_windowSceneHostingView;
  self->_windowSceneHostingView = 0;

  if (v13)
  {
    objc_storeStrong((id *)&self->_windowSceneHostingView, a3);
    int v8 = *p_windowSceneHostingView;
    id v9 = [(AFUISceneHostingViewController *)self view];
    [v9 bounds];
    -[UIView setFrame:](v8, "setFrame:");

    __int16 v10 = [(AFUISceneHostingViewController *)self view];
    [v10 addSubview:*p_windowSceneHostingView];

    int64_t v11 = [(AFUISceneHostingViewController *)self view];
    uint64_t v12 = [v11 window];
    [(AFUISceneHostingViewController *)self _updateDeferralChainWithWindow:v12];
  }
}

- (void)setWindowSceneHostingView:(id)a3
{
}

- (void)_updateSceneUIApplicationSceneSettingsWithBlock:(id)a3
{
  id v4 = a3;
  scene = self->_scene;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__AFUISceneHostingViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke;
  v7[3] = &unk_264691858;
  id v8 = v4;
  id v6 = v4;
  [(FBScene *)scene updateSettingsWithBlock:v7];
}

void __82__AFUISceneHostingViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __82__AFUISceneHostingViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke_cold_1(v4);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AFUISceneHostingViewController;
  id v4 = a3;
  [(AFUISceneHostingViewController *)&v9 traitCollectionDidChange:v4];
  id v5 = [(AFUISceneHostingViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  uint64_t v7 = [v4 userInterfaceStyle];
  if (v6 != v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__AFUISceneHostingViewController_traitCollectionDidChange___block_invoke;
    v8[3] = &__block_descriptor_40_e43_v16__0__UIMutableApplicationSceneSettings_8l;
    v8[4] = v6;
    [(AFUISceneHostingViewController *)self _updateSceneUIApplicationSceneSettingsWithBlock:v8];
  }
}

uint64_t __59__AFUISceneHostingViewController_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:*(void *)(a1 + 32)];
}

- (UIEdgeInsets)effectiveSafeAreaInsets
{
  if ([(AFUISceneHostingViewController *)self safeAreaInsetsAreSuspended])
  {
    [(AFUISceneHostingViewController *)self suspendedSafeAreaInsets];
  }
  else
  {
    uint64_t v7 = [(AFUISceneHostingViewController *)self view];
    [v7 safeAreaInsets];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v3 = v9;
    double v4 = v11;
    double v5 = v13;
    double v6 = v15;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)AFUISceneHostingViewController;
  [(AFUISceneHostingViewController *)&v4 viewSafeAreaInsetsDidChange];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__AFUISceneHostingViewController_viewSafeAreaInsetsDidChange__block_invoke;
  v3[3] = &unk_2646917C0;
  v3[4] = self;
  [(AFUISceneHostingViewController *)self _updateSceneUIApplicationSceneSettingsWithBlock:v3];
}

void __61__AFUISceneHostingViewController_viewSafeAreaInsetsDidChange__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  double v5 = [v3 view];
  [v5 safeAreaInsets];
  objc_msgSend(v4, "setSafeAreaInsetsPortrait:");

  double v6 = [*(id *)(a1 + 32) view];
  [v6 safeAreaInsets];
  objc_msgSend(v4, "setSafeAreaInsetsLandscapeLeft:");

  uint64_t v7 = [*(id *)(a1 + 32) view];
  [v7 safeAreaInsets];
  objc_msgSend(v4, "setSafeAreaInsetsLandscapeRight:");

  id v8 = [*(id *)(a1 + 32) view];
  [v8 safeAreaInsets];
  objc_msgSend(v4, "setSafeAreaInsetsPortraitUpsideDown:");
}

- (void)setSafeAreaInsetsAreSuspended:(BOOL)a3
{
  if (self->_safeAreaInsetsAreSuspended != a3)
  {
    if (a3)
    {
      double v5 = [(AFUISceneHostingViewController *)self view];
      [v5 safeAreaInsets];
      -[AFUISceneHostingViewController setSuspendedSafeAreaInsets:](self, "setSuspendedSafeAreaInsets:");

      self->_safeAreaInsetsAreSuspended = a3;
    }
    else
    {
      self->_safeAreaInsetsAreSuspended = 0;
      [(AFUISceneHostingViewController *)self viewSafeAreaInsetsDidChange];
    }
  }
}

- (void)setInFluidDismissal:(BOOL)a3
{
  self->_inFluidDismissal = a3;
  -[AFUISceneHostingViewController setSafeAreaInsetsAreSuspended:](self, "setSafeAreaInsetsAreSuspended:");
}

- (void)setClippingDisabled:(BOOL)a3
{
  if (self->_clippingDisabled != a3)
  {
    self->_clippingDisabled = a3;
    id v4 = [(AFUISceneHostingViewController *)self presentation];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __54__AFUISceneHostingViewController_setClippingDisabled___block_invoke;
    v5[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
    BOOL v6 = a3;
    [v4 modifyPresentationContext:v5];
  }
}

uint64_t __54__AFUISceneHostingViewController_setClippingDisabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setClippingDisabled:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)isSceneActive
{
  id v2 = [(AFUISceneHostingViewController *)self configuration];
  BOOL v3 = [v2 deactivationReasonMask] == 0;

  return v3;
}

- (void)reactivateScene
{
  if (![(AFUISceneHostingViewController *)self isSceneActive])
  {
    [(AFUISceneHostingViewController *)self updateSceneDeactivationReasonMask:0];
  }
}

- (void)deactivateScene
{
  if ([(AFUISceneHostingViewController *)self isSceneActive])
  {
    [(AFUISceneHostingViewController *)self updateSceneDeactivationReasonMask:16];
  }
}

- (void)updateSceneDeactivationReasonMask:(unint64_t)a3
{
  double v5 = [(AFUISceneHostingViewController *)self configuration];
  id v7 = (id)[v5 copy];

  [v7 setDeactivationReasonMask:a3];
  BOOL v6 = [(AFUISceneHostingViewController *)self traitCollection];
  objc_msgSend(v7, "setUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  [(AFUISceneHostingViewController *)self updateSceneWithConfiguration:v7];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    double v9 = "-[AFUISceneHostingViewController viewDidMoveToWindow:shouldAppearOrDisappear:]";
    __int16 v10 = 1024;
    BOOL v11 = v4;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #siriHID viewDidMoveToWindow:shouldAppearOrDisappear: %d", (uint8_t *)&v8, 0x12u);
  }
  [(AFUISceneHostingViewController *)self _updateDeferralChainWithWindow:v6];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AFUISceneHostingViewController;
  -[AFUISceneHostingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  int v8 = [v7 containerView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [v8 window];
  }
  __int16 v10 = v9;
  BOOL v11 = SBFWindowForViewControllerTransition();
  uint64_t v12 = [v11 _toWindowOrientation];

  double v13 = (void *)MEMORY[0x263F29BC8];
  [v7 transitionDuration];
  double v14 = objc_msgSend(v13, "settingsWithDuration:");
  double v15 = [v10 windowScene];
  v16 = [v15 _synchronizedDrawingFence];

  -[AFUISceneHostingViewController _updateSceneSettingsToSize:interfaceOrientation:withAnimationSettings:animationFence:](self, "_updateSceneSettingsToSize:interfaceOrientation:withAnimationSettings:animationFence:", v12, v14, v16, width, height);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __85__AFUISceneHostingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_2646918C0;
  v17[5] = 0;
  v17[6] = 0;
  void v17[4] = self;
  *(double *)&v17[7] = width;
  *(double *)&v17[8] = height;
  [v7 animateAlongsideTransition:v17 completion:&__block_literal_global_46];
}

void __85__AFUISceneHostingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)AFUISceneHostingViewController;
  [(AFUISceneHostingViewController *)&v5 viewWillLayoutSubviews];
  windowSceneHostingView = self->_windowSceneHostingView;
  BOOL v4 = [(AFUISceneHostingViewController *)self view];
  [v4 bounds];
  -[UIView setFrame:](windowSceneHostingView, "setFrame:");
}

- (BOOL)_shouldDeferHIDEventsForMode
{
  return self->_deferralMode != 0;
}

- (void)_updateDeferralChainWithWindow:(id)a3
{
  *(void *)&v34[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(AFUISceneHostingViewController *)self _shouldDeferHIDEventsForMode])
  {
    if (self->_pauseDeferrals)
    {
      objc_super v5 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 136315138;
        char v32 = "-[AFUISceneHostingViewController _updateDeferralChainWithWindow:]";
        id v6 = "%s #siriHID skipping deferral of HID events until un-paused";
        id v7 = v5;
        uint32_t v8 = 12;
LABEL_7:
        _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v31, v8);
      }
    }
    else
    {
      if (self->_predicateInvalidationHandler)
      {
        BOOL v11 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 136315138;
          char v32 = "-[AFUISceneHostingViewController _updateDeferralChainWithWindow:]";
          _os_log_impl(&dword_223099000, v11, OS_LOG_TYPE_DEFAULT, "%s #siriHID invalidating defer HID events assertion", (uint8_t *)&v31, 0xCu);
        }
        [(BSInvalidatable *)self->_predicateInvalidationHandler invalidate];
      }
      scene = self->_scene;
      if (scene)
      {
        double v13 = [(FBScene *)scene uiClientSettings];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v14 = [(FBScene *)self->_scene uiClientSettings];
        }
        else
        {
          double v14 = 0;
        }

        uint64_t v15 = [v4 _contextId];
        uint64_t v16 = [v14 clientWindowContextID];
        uint64_t v17 = v16;
        if (v15) {
          BOOL v18 = v16 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        int v19 = v18;
        if (!v4 || (v19 & 1) != 0)
        {
          if (v19)
          {
            v30 = *MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
            {
              int v31 = 136315650;
              char v32 = "-[AFUISceneHostingViewController _updateDeferralChainWithWindow:]";
              __int16 v33 = 1024;
              *(_DWORD *)id v34 = v15;
              v34[2] = 1024;
              *(_DWORD *)&v34[3] = v17;
              _os_log_impl(&dword_223099000, v30, OS_LOG_TYPE_DEFAULT, "%s #siriHID Skipped deferring HID events because of an invalid contextID (%u) or clientContextID (%u)", (uint8_t *)&v31, 0x18u);
            }
          }
        }
        else
        {
          os_log_t v20 = [MEMORY[0x263F29828] tokenForIdentifierOfCAContext:v15];
          id v21 = objc_alloc_init(MEMORY[0x263F29880]);
          [v21 setDisplay:0];
          [v21 setToken:v20];
          CGFloat v22 = [MEMORY[0x263F29820] keyboardFocusEnvironment];
          [v21 setEnvironment:v22];

          CGFloat v23 = [MEMORY[0x263F29828] tokenForIdentifierOfCAContext:v17];
          id v24 = objc_alloc_init(MEMORY[0x263F29888]);
          v25 = [(FBScene *)self->_scene clientProcess];
          objc_msgSend(v24, "setPid:", objc_msgSend(v25, "pid"));

          [v24 setToken:v23];
          v26 = [MEMORY[0x263F29830] sharedInstance];
          v27 = [v26 deferEventsMatchingPredicate:v21 toTarget:v24 withReason:@"launching Siri.app"];
          predicateInvalidationHandler = self->_predicateInvalidationHandler;
          self->_predicateInvalidationHandler = v27;

          __int16 v29 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
          {
            int v31 = 136315138;
            char v32 = "-[AFUISceneHostingViewController _updateDeferralChainWithWindow:]";
            _os_log_impl(&dword_223099000, v29, OS_LOG_TYPE_DEFAULT, "%s #siriHID Started deferring HID events to Siri.app", (uint8_t *)&v31, 0xCu);
          }
        }
      }
    }
  }
  else
  {
    id v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int64_t deferralMode = self->_deferralMode;
      int v31 = 136315394;
      char v32 = "-[AFUISceneHostingViewController _updateDeferralChainWithWindow:]";
      __int16 v33 = 2048;
      *(void *)id v34 = deferralMode;
      id v6 = "%s #siriHID _shouldDeferHIDEventsForMode returned false for current deferral mode: %zd";
      id v7 = v9;
      uint32_t v8 = 22;
      goto LABEL_7;
    }
  }
}

- (id)sceneConfigurationForDelegate
{
  return self->_configuration;
}

- (void)sceneController:(id)a3 sceneContentStateDidChange:(id)a4
{
  id v9 = a4;
  objc_super v5 = [(AFUISceneHostingViewController *)self presentation];

  if (v5)
  {
    id v6 = [(AFUISceneHostingViewController *)self presentation];
    id v7 = [v6 presentationView];
    -[AFUISceneHostingViewController _transitionContentsWithView:forContentState:](self, "_transitionContentsWithView:forContentState:", v7, [v9 contentState]);
  }
  if ([v9 contentState] == 2 && objc_msgSend(v9, "isValid"))
  {
    uint32_t v8 = [v9 identifier];
    [(AFUISceneHostingViewController *)self _handleSceneDidActivateWithIdentifier:v8];
  }
}

- (void)sceneController:(id)a3 sceneWasInvalidated:(id)a4 forReason:(unint64_t)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint32_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v11 = "-[AFUISceneHostingViewController sceneController:sceneWasInvalidated:forReason:]";
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  [(AFUISceneHostingViewController *)self _updateDeferralChainWithWindow:0];
  id v9 = [NSString stringWithFormat:@"Scene was invalidated - scene=%@", v7];
  [(AFUISceneHostingViewController *)self _handleInvalidationForReason:a5 explanation:v9];
}

- (void)sceneController:(id)a3 sceneDidUpdateClientSettings:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    BOOL v11 = "-[AFUISceneHostingViewController sceneController:sceneDidUpdateClientSettings:]";
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #siriHID sceneDidUpdateClientSettings", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [(AFUISceneHostingViewController *)self view];
  uint32_t v8 = [v7 window];
  [(AFUISceneHostingViewController *)self _updateDeferralChainWithWindow:v8];

  id v9 = [v5 audioCategoriesDisablingVolumeHUD];
  [(AFUISceneHostingViewController *)self _audioCategoriesDisablingVolumeHUDDidChangeTo:v9];
}

- (BOOL)_hasScene
{
  return self->_scene != 0;
}

- (int64_t)deferralMode
{
  return self->_deferralMode;
}

- (AFUISceneConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isInFluidDismissal
{
  return self->_inFluidDismissal;
}

- (BOOL)clippingDisabled
{
  return self->_clippingDisabled;
}

- (AFUISceneController)sceneController
{
  return self->_sceneController;
}

- (void)setSceneController:(id)a3
{
}

- (UIView)windowSceneHostingView
{
  return self->_windowSceneHostingView;
}

- (UIScenePresenter)presentation
{
  return self->_presentation;
}

- (void)setPresentation:(id)a3
{
}

- (FBScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
}

- (BSInvalidatable)predicateInvalidationHandler
{
  return self->_predicateInvalidationHandler;
}

- (void)setPredicateInvalidationHandler:(id)a3
{
}

- (BOOL)pauseDeferrals
{
  return self->_pauseDeferrals;
}

- (void)setPauseDeferrals:(BOOL)a3
{
  self->_pauseDeferrals = a3;
}

- (int64_t)currentOrientation
{
  return self->_currentOrientation;
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
}

- (CGRect)currentFrame
{
  double x = self->_currentFrame.origin.x;
  double y = self->_currentFrame.origin.y;
  double width = self->_currentFrame.size.width;
  double height = self->_currentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCurrentFrame:(CGRect)a3
{
  self->_currentFrame = a3;
}

- (BOOL)safeAreaInsetsAreSuspended
{
  return self->_safeAreaInsetsAreSuspended;
}

- (void)setEffectiveSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_effectiveSafeAreaInsets = a3;
}

- (UIEdgeInsets)suspendedSafeAreaInsets
{
  double top = self->_suspendedSafeAreaInsets.top;
  double left = self->_suspendedSafeAreaInsets.left;
  double bottom = self->_suspendedSafeAreaInsets.bottom;
  double right = self->_suspendedSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setSuspendedSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_suspendedSafeAreaInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_windowSceneHostingView, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

void __82__AFUISceneHostingViewController__updateSceneUIApplicationSceneSettingsWithBlock___block_invoke_cold_1(void *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v3 = 136315394;
  id v4 = "-[AFUISceneHostingViewController _updateSceneUIApplicationSceneSettingsWithBlock:]_block_invoke";
  __int16 v5 = 2112;
  id v6 = (id)objc_opt_class();
  id v2 = v6;
  _os_log_error_impl(&dword_223099000, v1, OS_LOG_TYPE_ERROR, "%s #sceneHosting Expected scene's settings to be UIMutableApplicationSceneSettings, but they weren't {actualClass: %@}", (uint8_t *)&v3, 0x16u);
}

@end