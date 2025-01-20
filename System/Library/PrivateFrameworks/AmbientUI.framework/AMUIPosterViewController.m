@interface AMUIPosterViewController
+ (NSArray)suggestedInstanceIdentifiers;
- (AMUIPosterAppearanceTransitionCoordinator)appearanceTransitionCoordinator;
- (AMUIPosterViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)handleDismiss;
- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (NSDictionary)activeConfigurationMetadata;
- (PRUISAmbientPosterViewController)_posterViewController;
- (double)appearanceTransitionProgress;
- (id)_posterExtensionDisplayNameWithBundleIdentifier:(id)a3;
- (id)_snapshotController;
- (id)ambientPosterViewControllerRequestExtensionInstanceIdentifier:(id)a3;
- (int64_t)chromeOrientationPolicy;
- (int64_t)contentMode;
- (int64_t)effectiveContentMode;
- (unint64_t)ambientPosterViewController:(id)a3 titleAlignmentForInterfaceOrientation:(int64_t)a4;
- (void)_evaluateAuthenticationWithConfiguration:(id)a3;
- (void)_triggerTapEvent:(id)a3;
- (void)_updateStateForContentMode:(int64_t)a3;
- (void)ambientPosterViewController:(id)a3 relinquishExtensionInstanceIdentifier:(id)a4;
- (void)ambientPosterViewController:(id)a3 setChromeVisibility:(BOOL)a4 withAnimationSettings:(id)a5 animationFence:(id)a6;
- (void)invalidate;
- (void)setAppearanceTransitionCoordinator:(id)a3;
- (void)setAppearanceTransitionProgress:(double)a3;
- (void)setChromeOrientationPolicy:(int64_t)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AMUIPosterViewController

- (void)setContentMode:(int64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    [(AMUIPosterViewController *)self _updateStateForContentMode:[(AMUIPosterViewController *)self effectiveContentMode]];
    self->_appearanceTransitionProgress = 1.0;
    self->_appearanceTransitionCoordinator = objc_alloc_init(AMUIPosterAppearanceTransitionCoordinator);
    MEMORY[0x270F9A758]();
  }
}

- (int64_t)effectiveContentMode
{
  return self->_contentMode;
}

- (void)setAppearanceTransitionCoordinator:(id)a3
{
  p_appearanceTransitionCoordinator = &self->_appearanceTransitionCoordinator;
  id v9 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_appearanceTransitionCoordinator, a3);
    v6 = *p_appearanceTransitionCoordinator;
    if (!*p_appearanceTransitionCoordinator)
    {
      v7 = objc_alloc_init(AMUIPosterAppearanceTransitionCoordinator);
      v8 = *p_appearanceTransitionCoordinator;
      *p_appearanceTransitionCoordinator = v7;

      v6 = *p_appearanceTransitionCoordinator;
    }
    [(AMUIPosterAppearanceTransitionCoordinator *)v6 setPosterViewController:self progress:self->_appearanceTransitionProgress];
  }
}

- (void)setAppearanceTransitionProgress:(double)a3
{
  self->_appearanceTransitionProgress = a3;
  -[AMUIPosterAppearanceTransitionCoordinator setPosterViewController:progress:](self->_appearanceTransitionCoordinator, "setPosterViewController:progress:", self);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)AMUIPosterViewController;
  [(AMUIPosterViewController *)&v12 viewDidLoad];
  v3 = [(AMUIPosterViewController *)self view];
  v4 = [MEMORY[0x263F1C550] blackColor];
  [v3 setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x263F1CB60]);
  [v3 bounds];
  v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
  [(UIView *)v6 setAutoresizingMask:18];
  v7 = [(UIView *)v6 layer];
  [v7 setHitTestsAsOpaque:1];

  [v3 addSubview:v6];
  touchBlockingView = self->_touchBlockingView;
  self->_touchBlockingView = v6;
  id v9 = v6;

  v10 = (UIGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__triggerTapEvent_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v10;

  [(UIGestureRecognizer *)self->_tapGestureRecognizer setName:@"AmbientTap"];
  [(UIView *)self->_touchBlockingView addGestureRecognizer:self->_tapGestureRecognizer];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMUIPosterViewController;
  [(AMUIPosterViewController *)&v4 viewWillAppear:a3];
  [(AMUIPosterViewController *)self _evaluateAuthenticationWithConfiguration:self->_configuration];
  [(PRUISAmbientPosterViewController *)self->_posterViewController setVisibility:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMUIPosterViewController;
  [(AMUIPosterViewController *)&v4 viewDidAppear:a3];
  [(PRUISAmbientPosterViewController *)self->_posterViewController setVisibility:2];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMUIPosterViewController;
  [(AMUIPosterViewController *)&v4 viewWillDisappear:a3];
  [(PRUISAmbientPosterViewController *)self->_posterViewController setVisibility:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMUIPosterViewController;
  [(AMUIPosterViewController *)&v4 viewDidDisappear:a3];
  [(PRUISAmbientPosterViewController *)self->_posterViewController setVisibility:0];
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_posterViewController = &self->_posterViewController;
  if ([(PRUISAmbientPosterViewController *)self->_posterViewController updateConfiguration:v7])
  {
    char v10 = 1;
  }
  else if (v7)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    v11 = *p_posterViewController;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke;
    v33[3] = &unk_265224858;
    v33[4] = self;
    objc_super v12 = v11;
    v34 = v12;
    v13 = (void *)MEMORY[0x24C5614A0](v33);
    id v14 = objc_alloc_init((Class)getPRUISAmbientPosterViewControllerClass());
    v15 = [v14 view];
    v16 = [(AMUIPosterViewController *)self view];
    [v16 bounds];
    objc_msgSend(v15, "setFrame:");

    [v15 setAutoresizingMask:18];
    [v15 setAlpha:0.0];
    if (v8)
    {
      v17 = [v15 layer];
      [v17 setAllowsGroupOpacity:1];
    }
    [(AMUIPosterViewController *)self bs_addChildViewController:v14];
    v18 = [(AMUIPosterViewController *)self view];
    [v18 bringSubviewToFront:self->_touchBlockingView];

    objc_storeStrong((id *)&self->_posterViewController, v14);
    [(PRUISAmbientPosterViewController *)*p_posterViewController setDelegate:self];
    v19 = *p_posterViewController;
    v20 = [(AMUIPosterViewController *)self _snapshotController];
    [(PRUISAmbientPosterViewController *)v19 setSnapshotController:v20];

    [(PRUISAmbientPosterViewController *)*p_posterViewController setVisibleSnapshotLayers:1];
    char v10 = [(PRUISAmbientPosterViewController *)*p_posterViewController updateConfiguration:v7];
    v21 = *p_posterViewController;
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    v27 = __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_2;
    v28 = &unk_265224978;
    v29 = self;
    id v30 = v14;
    id v31 = v8;
    id v32 = v13;
    id v22 = v13;
    id v23 = v14;
    [(PRUISAmbientPosterViewController *)v21 activateWithCompletion:&v25];
    [(AMUIPosterViewController *)self _updateStateForContentMode:[(AMUIPosterViewController *)self effectiveContentMode]];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

uint64_t __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:", *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 40);

  return [v2 invalidate];
}

void __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_2(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  v2 = *(void **)(*(void *)(a1 + 32) + 976);
  if (v2 == *(void **)(a1 + 40))
  {
    objc_super v4 = (void *)MEMORY[0x263F29D20];
    uint64_t v5 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_3;
    v8[3] = &unk_2652247E0;
    id v9 = v2;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_4;
    v6[3] = &unk_265224788;
    id v7 = *(id *)(a1 + 56);
    [v4 animateWithSettings:v5 actions:v8 completion:v6];
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

void __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __76__AMUIPosterViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
}

+ (NSArray)suggestedInstanceIdentifiers
{
  id PRUISAmbientPosterViewControllerClass = getPRUISAmbientPosterViewControllerClass();

  return (NSArray *)[PRUISAmbientPosterViewControllerClass suggestedInstanceIdentifiers];
}

- (BOOL)handleDismiss
{
  return 0;
}

- (NSDictionary)activeConfigurationMetadata
{
  return 0;
}

- (void)ambientPosterViewController:(id)a3 setChromeVisibility:(BOOL)a4 withAnimationSettings:(id)a5 animationFence:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = [(AMUIPosterViewController *)self delegate];
  [v11 posterViewController:self setChromeVisibility:v7 withAnimationSettings:v10 animationFence:v9];
}

- (id)ambientPosterViewControllerRequestExtensionInstanceIdentifier:(id)a3
{
  objc_super v4 = [(AMUIPosterViewController *)self delegate];
  uint64_t v5 = [v4 posterViewControllerRequestExtensionInstanceIdentifier:self];

  return v5;
}

- (void)ambientPosterViewController:(id)a3 relinquishExtensionInstanceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(AMUIPosterViewController *)self delegate];
  [v6 posterViewController:self relinquishExtensionInstanceIdentifier:v5];
}

- (unint64_t)ambientPosterViewController:(id)a3 titleAlignmentForInterfaceOrientation:(int64_t)a4
{
  int64_t chromeOrientationPolicy = self->_chromeOrientationPolicy;
  if (chromeOrientationPolicy == 2)
  {
    if (a4 == 3) {
      return 3;
    }
    else {
      return 2 * (a4 == 4);
    }
  }
  else if (chromeOrientationPolicy == 1)
  {
    return 5;
  }
  else if (chromeOrientationPolicy)
  {
    return 0;
  }
  else
  {
    return 4;
  }
}

- (id)_snapshotController
{
  if (_snapshotController_onceToken != -1) {
    dispatch_once(&_snapshotController_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_snapshotController___sharedSnapshotController;

  return v2;
}

void __47__AMUIPosterViewController__snapshotController__block_invoke()
{
  v0 = [getPRUISAmbientPosterViewControllerClass() defaultSnapshotCacheURL];
  id v1 = [MEMORY[0x263F08850] defaultManager];
  id v9 = 0;
  char v2 = [v1 createDirectoryAtURL:v0 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v3 = v9;

  if ((v2 & 1) == 0)
  {
    objc_super v4 = AMUILogSwitcher();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __47__AMUIPosterViewController__snapshotController__block_invoke_cold_1();
    }
  }
  uint64_t v11 = 0;
  objc_super v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v5 = (void *)getPRUISPosterSnapshotControllerClass_softClass;
  uint64_t v14 = getPRUISPosterSnapshotControllerClass_softClass;
  if (!getPRUISPosterSnapshotControllerClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getPRUISPosterSnapshotControllerClass_block_invoke;
    v10[3] = &unk_2652248F0;
    v10[4] = &v11;
    __getPRUISPosterSnapshotControllerClass_block_invoke((uint64_t)v10);
    id v5 = (void *)v12[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v11, 8);
  uint64_t v7 = [[v6 alloc] initWithCacheURL:v0];
  id v8 = (void *)_snapshotController___sharedSnapshotController;
  _snapshotController___sharedSnapshotController = v7;
}

- (void)_updateStateForContentMode:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = 2;
  }
  else
  {
    if (a3) {
      return;
    }
    uint64_t v3 = 1;
  }
  [(PRUISAmbientPosterViewController *)self->_posterViewController setPresentationMode:v3];
}

- (void)_triggerTapEvent:(id)a3
{
  [a3 locationInView:self->_touchBlockingView];
  posterViewController = self->_posterViewController;

  -[PRUISAmbientPosterViewController userTapEventOccurredWithLocation:](posterViewController, "userTapEventOccurredWithLocation:");
}

- (void)_evaluateAuthenticationWithConfiguration:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v17 = 0;
  id v5 = objc_msgSend(v4, "pr_loadAmbientConfigurationWithError:", &v17);
  id v6 = v17;
  if (v5)
  {
    uint64_t v7 = [(AMUIPosterViewController *)self delegate];
    uint64_t v8 = [v7 posterViewControllerIsAuthenticated:self];
    uint64_t v9 = [v7 posterViewControllerHasInlineAuthenticated:self];
    int v10 = [v5 needsAuthentication];
    if (!v8 && !v9 && v10)
    {
      uint64_t v11 = AMUILogSwitcher();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v12 = MEMORY[0x24C560F30](v8);
        uint64_t v13 = MEMORY[0x24C560F30](v9);
        uint64_t v14 = MEMORY[0x24C560F30](1);
        *(_DWORD *)buf = 138543874;
        v19 = v12;
        __int16 v20 = 2114;
        v21 = v13;
        __int16 v22 = 2114;
        id v23 = v14;
        _os_log_impl(&dword_247837000, v11, OS_LOG_TYPE_DEFAULT, "Poster configuration requesting in-line authentication... isAuthenticated: %{public}@, hasInlineAuthenticated: %{public}@, configurationNeedsAuthentication: %{public}@", buf, 0x20u);
      }
      v15 = [v4 providerBundleIdentifier];
      v16 = [(AMUIPosterViewController *)self _posterExtensionDisplayNameWithBundleIdentifier:v15];
      [v7 posterViewController:self didRequestInlineAuthenticationWithUnlockDestination:v16];
    }
  }
  else
  {
    uint64_t v7 = AMUILogSwitcher();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AMUIPosterViewController _evaluateAuthenticationWithConfiguration:]();
    }
  }
}

- (id)_posterExtensionDisplayNameWithBundleIdentifier:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F01858];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 error:0];

  id v6 = [v5 localizedName];

  return v6;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (int64_t)chromeOrientationPolicy
{
  return self->_chromeOrientationPolicy;
}

- (void)setChromeOrientationPolicy:(int64_t)a3
{
  self->_int64_t chromeOrientationPolicy = a3;
}

- (AMUIPosterAppearanceTransitionCoordinator)appearanceTransitionCoordinator
{
  return self->_appearanceTransitionCoordinator;
}

- (double)appearanceTransitionProgress
{
  return self->_appearanceTransitionProgress;
}

- (AMUIPosterViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIPosterViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PRUISAmbientPosterViewController)_posterViewController
{
  return self->_posterViewController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appearanceTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchBlockingView, 0);

  objc_storeStrong((id *)&self->_posterViewController, 0);
}

void __47__AMUIPosterViewController__snapshotController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_247837000, v0, v1, "Failed to create cache directory at URL \"%{public}@\". Error %@");
}

- (void)_evaluateAuthenticationWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_247837000, v0, v1, "Failed to load ambient configuration from configuration %@ with error %@");
}

@end