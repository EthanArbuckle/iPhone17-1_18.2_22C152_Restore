@interface AMUIAmbientViewController
+ (void)prewarm;
- (AMUIAmbientViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AMUIAmbientViewControllerDelegate)delegate;
- (AMUIDateProviding)dateProvider;
- (AMUIPosterSelectionCoordinating)_posterSelectionCoordinator;
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleDismiss;
- (BOOL)isAuthenticated;
- (BOOL)isConfiguringUIVisible;
- (BOOL)isTemporaryOverlayVisible;
- (BOOL)posterSwitcherViewController:(id)a3 wantsBiometricAuthenticationBlockedForDeepUserInteraction:(BOOL)a4;
- (BOOL)posterSwitcherViewControllerHasInlineAuthenticated:(id)a3;
- (BOOL)posterSwitcherViewControllerIsAuthenticated:(id)a3;
- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4;
- (NSDictionary)activeConfigurationMetadata;
- (PRSPosterConfiguration)activeConfiguration;
- (UIView)backgroundView;
- (UIView)contentView;
- (id)_defaultPosterSelectionCoordinator;
- (id)ambientDefaultsForViewController:(id)a3;
- (id)createUnlockRequestForViewController:(id)a3;
- (id)defaultWidgetDescriptorStacksForViewController:(id)a3;
- (id)posterSelectionCoordinatorRequestsConnectedChargerId:(id)a3;
- (id)posterSwitcherViewController:(id)a3 requestsLastSelectedConfigurationUUIDForProviderBundleIdentifier:(id)a4;
- (id)posterSwitcherViewControllerAuthenticationHandler:(id)a3;
- (id)widgetHostManagerForViewController:(id)a3;
- (unint64_t)notificationCount;
- (unint64_t)supportedInterfaceOrientations;
- (void)_animateAllOverlayUIAppearance;
- (void)_animateAllOverlayUIDismissal;
- (void)_animateBatteryViewAppearanceIfNecessary;
- (void)_animateBatteryViewDismissalIfNecessary;
- (void)_animateNotificationIndicatorViewAppearanceIfNecessary;
- (void)_animateNotificationIndicatorViewRemoval;
- (void)_configureNotificationIndicatorViewIfNecessary;
- (void)_dismissPosterEditingSwitcher;
- (void)_handleAuthenticationChanged:(BOOL)a3;
- (void)_handlePosterEditingSwitcherGesture:(id)a3;
- (void)_refreshPosterConfigurationsAnimated:(BOOL)a3;
- (void)_setNotificationIndicatorHidden:(BOOL)a3;
- (void)_setPosterSelectionCoordinator:(id)a3;
- (void)_setupPosterEditingSwitcherGestureRecognizer;
- (void)_updateBatteryViewLayout;
- (void)_updateNotificationIndicatorViewLayout;
- (void)_willBeginConfiguration;
- (void)_willEndConfiguration;
- (void)dealloc;
- (void)invalidate;
- (void)posterSelectionCoordinator:(id)a3 didUpdateLastSelectedPosterConfiguration:(id)a4;
- (void)posterSwitcherModel:(id)a3 didUpdateActiveConfiguration:(id)a4;
- (void)posterSwitcherModel:(id)a3 didUpdateConfigurations:(id)a4;
- (void)posterSwitcherViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4;
- (void)posterSwitcherViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4;
- (void)posterSwitcherViewController:(id)a3 didSetPasscodeVisible:(BOOL)a4;
- (void)posterSwitcherViewController:(id)a3 didSettleOnConfiguration:(id)a4 interactive:(BOOL)a5;
- (void)posterSwitcherViewController:(id)a3 isTransitioningSettled:(BOOL)a4;
- (void)posterSwitcherViewController:(id)a3 willSwitchFromConfiguration:(id)a4 interactive:(BOOL)a5;
- (void)posterSwitcherViewControllerDidSuccessfullyCompleteInlineAuthentication:(id)a3;
- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)setAuthenticated:(BOOL)a3;
- (void)setConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (void)setConfiguringUIVisible:(BOOL)a3;
- (void)setDateProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotificationCount:(unint64_t)a3;
- (void)setTemporaryOverlayVisible:(BOOL)a3;
- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4;
- (void)viewControllerWillBeginConfiguration:(id)a3;
- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3;
- (void)viewControllerWillEndConfiguration:(id)a3;
- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMUIAmbientViewController

- (AMUIAmbientViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)AMUIAmbientViewController;
  v4 = [(AMUIAmbientViewController *)&v14 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(AMUIAmbientViewController *)v4 _defaultPosterSelectionCoordinator];
    [v6 setDelegate:v5];
    objc_storeWeak((id *)&v5->_posterSelectionCoordinator, v6);
    v7 = objc_alloc_init(AMUIPosterSwitcherViewController);
    posterSwitcherViewController = v5->_posterSwitcherViewController;
    v5->_posterSwitcherViewController = v7;

    [(AMUIPosterSwitcherViewController *)v5->_posterSwitcherViewController setDelegate:v5];
    uint64_t v9 = +[AMUIPosterSwitcherModel sharedInstance];
    posterSwitcherModel = v5->_posterSwitcherModel;
    v5->_posterSwitcherModel = (AMUIPosterSwitcherModel *)v9;

    [(AMUIPosterSwitcherModel *)v5->_posterSwitcherModel addObserver:v5];
    [(AMUIAmbientViewController *)v5 _refreshPosterConfigurationsAnimated:0];
    v11 = objc_alloc_init(AMUIBatteryChargingViewController);
    batteryChargingViewController = v5->_batteryChargingViewController;
    v5->_batteryChargingViewController = v11;
  }
  return v5;
}

- (void)dealloc
{
  [(AMUIPosterSwitcherViewController *)self->_posterSwitcherViewController invalidate];
  [(AMUIPosterSwitcherModel *)self->_posterSwitcherModel removeObserver:self];
  batteryChargingViewController = self->_batteryChargingViewController;
  self->_batteryChargingViewController = 0;

  v4.receiver = self;
  v4.super_class = (Class)AMUIAmbientViewController;
  [(AMUIAmbientViewController *)&v4 dealloc];
}

+ (void)prewarm
{
  id v2 = +[AMUIPosterSwitcherModel sharedInstance];
}

- (void)setConfiguration:(id)a3 withAnimationSettings:(id)a4
{
}

- (BOOL)handleDismiss
{
  if (self->_posterEditingSwitcherVC)
  {
    [(AMUIPosterEditingSwitcherViewController *)self->_posterEditingSwitcherVC handleDismiss];
    return 1;
  }
  else
  {
    posterSwitcherViewController = self->_posterSwitcherViewController;
    return [(AMUIPosterSwitcherViewController *)posterSwitcherViewController handleDismiss];
  }
}

- (void)invalidate
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (objc_opt_respondsToSelector())
    {
      v7 = [obj ambientDefaultsForAmbientViewController:self];
      ambientDefaults = self->_ambientDefaults;
      self->_ambientDefaults = v7;

      [(AMUIDefaultSelectedPosterCoordinator *)self->_defaultPosterSelectionCoordinator setAmbientDefaults:self->_ambientDefaults];
    }
    uint64_t v5 = [(AMUIPosterSwitcherViewController *)self->_posterSwitcherViewController noteAmbientViewControllingDelegateDidUpdate];
    id v6 = obj;
  }

  MEMORY[0x270F9A758](v5, v6);
}

- (void)setNotificationCount:(unint64_t)a3
{
  if (self->_notificationCount != a3)
  {
    self->_notificationCount = a3;
    if (a3)
    {
      notificationIndicatorView = self->_notificationIndicatorView;
      if (notificationIndicatorView) {
        -[AMUINotificationIndicatorView setNotificationCount:](notificationIndicatorView, "setNotificationCount:");
      }
    }
    else
    {
      [(AMUIAmbientViewController *)self _animateNotificationIndicatorViewRemoval];
    }
    id v5 = [(AMUIAmbientViewController *)self viewIfLoaded];
    [v5 setNeedsLayout];
  }
}

- (UIView)contentView
{
  return [(AMUIPosterSwitcherViewController *)self->_posterSwitcherViewController contentView];
}

- (UIView)backgroundView
{
  return [(AMUIPosterSwitcherViewController *)self->_posterSwitcherViewController backgroundView];
}

- (void)_setPosterSelectionCoordinator:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(AMUIAmbientViewController *)self _defaultPosterSelectionCoordinator];
  }
  id obj = v4;
  p_posterSelectionCoordinator = &self->_posterSelectionCoordinator;
  id WeakRetained = objc_loadWeakRetained((id *)p_posterSelectionCoordinator);

  v7 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_posterSelectionCoordinator, obj);
    v7 = obj;
  }
}

- (void)setDateProvider:(id)a3
{
  p_dateProvider = &self->_dateProvider;
  objc_storeStrong((id *)&self->_dateProvider, a3);
  id v6 = a3;
  [(AMUIPosterSwitcherViewController *)self->_posterSwitcherViewController setDateProvider:*p_dateProvider];
}

- (PRSPosterConfiguration)activeConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_posterSelectionCoordinator);
  id v4 = [WeakRetained lastSelectedPosterConfiguration];

  if (!v4)
  {
    id v4 = [(AMUIPosterSwitcherViewController *)self->_posterSwitcherViewController mostVisibleConfiguration];
  }

  return (PRSPosterConfiguration *)v4;
}

- (NSDictionary)activeConfigurationMetadata
{
  return [(AMUIPosterSwitcherViewController *)self->_posterSwitcherViewController activeConfigurationMetadata];
}

- (void)setAuthenticated:(BOOL)a3
{
  if (self->_authenticated != a3)
  {
    self->_authenticated = a3;
    -[AMUIAmbientViewController _handleAuthenticationChanged:](self, "_handleAuthenticationChanged:");
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AMUIAmbientViewController;
  [(AMUIAmbientViewController *)&v5 viewDidLoad];
  v3 = [(AMUIAmbientViewController *)self view];
  [v3 setAccessibilityIdentifier:@"amui-ambient-view"];
  id v4 = [(AMUIPosterSwitcherViewController *)self->_posterSwitcherViewController view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 setAutoresizingMask:18];
  [(AMUIAmbientViewController *)self bs_addChildViewController:self->_posterSwitcherViewController];
  [(AMUIAmbientViewController *)self _setupPosterEditingSwitcherGestureRecognizer];
  [(AMUIAmbientViewController *)self bs_addChildViewController:self->_batteryChargingViewController];
  [(AMUIAmbientViewController *)self _updateBatteryViewLayout];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMUIAmbientViewController;
  [(AMUIAmbientViewController *)&v4 viewDidAppear:a3];
  [(AMUIAmbientViewController *)self _animateBatteryViewAppearanceIfNecessary];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIAmbientViewController;
  [(AMUIAmbientViewController *)&v3 viewWillLayoutSubviews];
  [(AMUIAmbientViewController *)self _configureNotificationIndicatorViewIfNecessary];
  [(AMUIAmbientViewController *)self _updateNotificationIndicatorViewLayout];
  [(AMUIAmbientViewController *)self _updateBatteryViewLayout];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)AMUIAmbientViewController;
  [(AMUIAmbientViewController *)&v16 viewDidLayoutSubviews];
  objc_super v3 = [(AMUIAmbientViewController *)self view];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  if (!CGRectEqualToRect(self->_lastViewFrame, v20))
  {
    self->_lastViewFrame.origin.x = v5;
    self->_lastViewFrame.origin.y = v7;
    self->_lastViewFrame.size.width = v9;
    self->_lastViewFrame.size.height = v11;
    v12 = [(AMUIPosterSwitcherModel *)self->_posterSwitcherModel activeConfiguration];
    v13 = AMUILogSwitcher();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v14 = [v12 serverUUID];
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_247837000, v13, OS_LOG_TYPE_DEFAULT, "switcher resetting scroll position after layout (scrolling to %{public}@)", buf, 0xCu);
    }
    v15 = [MEMORY[0x263F1CB60] _currentAnimationSettings];
    [(AMUIAmbientViewController *)self setConfiguration:v12 withAnimationSettings:v15];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AMUIAmbientViewController;
  [(AMUIAmbientViewController *)&v5 viewWillDisappear:a3];
  [(AMUIAmbientViewController *)self _animateBatteryViewDismissalIfNecessary];
  if ([(AMUIAmbientViewController *)self isConfiguringUIVisible])
  {
    posterEditingSwitcherVC = self->_posterEditingSwitcherVC;
    if (posterEditingSwitcherVC) {
      [(AMUIPosterEditingSwitcherViewController *)posterEditingSwitcherVC handleDismiss];
    }
    else {
      [(AMUIAmbientViewController *)self _willEndConfiguration];
    }
  }
}

- (void)_setupPosterEditingSwitcherGestureRecognizer
{
  if (!self->_posterEditingSwitcherGestureRecognizer)
  {
    objc_super v3 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel__handlePosterEditingSwitcherGesture_];
    posterEditingSwitcherGestureRecognizer = self->_posterEditingSwitcherGestureRecognizer;
    self->_posterEditingSwitcherGestureRecognizer = v3;

    [(UILongPressGestureRecognizer *)self->_posterEditingSwitcherGestureRecognizer setMinimumPressDuration:0.3];
    [(UILongPressGestureRecognizer *)self->_posterEditingSwitcherGestureRecognizer setDelegate:self];
    objc_super v5 = [(AMUIAmbientViewController *)self view];
    [v5 addGestureRecognizer:self->_posterEditingSwitcherGestureRecognizer];
  }
  if (!self->_posterEditingSwitcherFeedbackGenerator)
  {
    double v6 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F1C810]);
    posterEditingSwitcherFeedbackGenerator = self->_posterEditingSwitcherFeedbackGenerator;
    self->_posterEditingSwitcherFeedbackGenerator = v6;
    MEMORY[0x270F9A758](v6, posterEditingSwitcherFeedbackGenerator);
  }
}

- (void)_handlePosterEditingSwitcherGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    objc_super v5 = AMUILogEditingSwitcher();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_247837000, v5, OS_LOG_TYPE_DEFAULT, "Poster Editing Switcher - gesture recognized", (uint8_t *)buf, 2u);
    }

    double v6 = [(AMUIPosterSwitcherViewController *)self->_posterSwitcherViewController view];
    objc_initWeak(buf, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __65__AMUIAmbientViewController__handlePosterEditingSwitcherGesture___block_invoke;
    v12[3] = &unk_265224B60;
    objc_copyWeak(&v14, buf);
    id v7 = v6;
    id v13 = v7;
    double v8 = (void (**)(void, void))MEMORY[0x24C5614A0](v12);
    CGFloat v9 = [(AMUIAmbientViewController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      double v10 = objc_alloc_init(AMUIConcreteUnlockRequest);
      [v9 ambientViewController:self requestsUnlock:v10 withCompletion:v8];
    }
    else
    {
      if ([v9 ambientViewControllerIsAuthenticated:self])
      {
        v8[2](v8, 1);
        goto LABEL_9;
      }
      [(UINotificationFeedbackGenerator *)self->_posterEditingSwitcherFeedbackGenerator notificationOccurred:2];
      AMUILogEditingSwitcher();
      double v10 = (AMUIConcreteUnlockRequest *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CGFloat v11 = 0;
        _os_log_impl(&dword_247837000, &v10->super, OS_LOG_TYPE_DEFAULT, "Poster Editing Switcher - gesture failed because device has not been authenticated", v11, 2u);
      }
    }

LABEL_9:
    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
}

void __65__AMUIAmbientViewController__handlePosterEditingSwitcherGesture___block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained _willBeginConfiguration];
      objc_super v5 = AMUILogEditingSwitcher();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        Class isa = v4[131].isa;
        int v12 = 138543362;
        Class v13 = isa;
        _os_log_impl(&dword_247837000, v5, OS_LOG_TYPE_DEFAULT, "Presenting Poster Editing Switcher with activeConfig: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      id v7 = [[AMUIPosterEditingSwitcherViewController alloc] initWithActiveConfiguration:v4[131].isa transitionOverlayView:*(void *)(a1 + 32)];
      [(AMUIPosterEditingSwitcherViewController *)v7 setDelegate:v4];
      double v8 = [(AMUIPosterEditingSwitcherViewController *)v7 view];
      CGFloat v9 = [v4 view];
      [v9 bounds];
      objc_msgSend(v8, "setFrame:");

      [v8 setAutoresizingMask:18];
      [v4 bs_addChildViewController:v7];
      Class v10 = v4[130].isa;
      v4[130].Class isa = (Class)v7;
      CGFloat v11 = v7;

      [(objc_class *)v4[129].isa notificationOccurred:0];
    }
  }
  else
  {
    id v4 = AMUILogEditingSwitcher();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_247837000, v4, OS_LOG_TYPE_DEFAULT, "Not presenting Poster Editing Switcher because device authentication failed", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)_dismissPosterEditingSwitcher
{
  if (self->_posterEditingSwitcherVC)
  {
    -[AMUIAmbientViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    posterEditingSwitcherVC = self->_posterEditingSwitcherVC;
    self->_posterEditingSwitcherVC = 0;

    [(AMUIAmbientViewController *)self _willEndConfiguration];
  }
}

- (void)posterSwitcherModel:(id)a3 didUpdateConfigurations:(id)a4
{
}

- (void)posterSwitcherModel:(id)a3 didUpdateActiveConfiguration:(id)a4
{
}

- (void)posterSwitcherViewController:(id)a3 didSettleOnConfiguration:(id)a4 interactive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = AMUILogSwitcher();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 1024;
    BOOL v13 = v5;
    _os_log_impl(&dword_247837000, v8, OS_LOG_TYPE_DEFAULT, "switcher didSettleOnConfiguration:%@ interactive:%{BOOL}u", (uint8_t *)&v10, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_posterSelectionCoordinator);
  [WeakRetained updateLastSelectedPosterConfiguration:v7 fromUserAction:v5];
}

- (void)posterSwitcherViewController:(id)a3 willSwitchFromConfiguration:(id)a4 interactive:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = AMUILogSwitcher();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 1024;
    BOOL v13 = v5;
    _os_log_impl(&dword_247837000, v8, OS_LOG_TYPE_DEFAULT, "switcher willSwitchFromConfiguration:%@ interactive:%{BOOL}u", (uint8_t *)&v10, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_posterSelectionCoordinator);
  [WeakRetained updateLastSelectedPosterConfiguration:v7 fromUserAction:v5];
}

- (void)posterSwitcherViewController:(id)a3 isTransitioningSettled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(AMUIAmbientViewController *)self delegate];
  if (v6)
  {
    id v7 = (void *)v6;
    if (objc_opt_respondsToSelector()) {
      [v7 ambientViewController:self isTransitioningSettled:v4];
    }
  }

  MEMORY[0x270F9A790]();
}

- (id)createUnlockRequestForViewController:(id)a3
{
  objc_super v3 = objc_alloc_init(AMUIConcreteUnlockRequest);

  return v3;
}

- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  double v8 = [(AMUIAmbientViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v8 ambientViewController:self requestsUnlock:v9 withCompletion:v7];
  }
}

- (void)viewControllerWillBeginConfiguration:(id)a3
{
  [(AMUIAmbientViewController *)self _willBeginConfiguration];
  posterSwitcherViewController = self->_posterSwitcherViewController;

  [(AMUIPosterSwitcherViewController *)posterSwitcherViewController setSwitchingEnabled:0];
}

- (void)viewControllerWillEndConfiguration:(id)a3
{
  [(AMUIAmbientViewController *)self _willEndConfiguration];
  posterSwitcherViewController = self->_posterSwitcherViewController;

  [(AMUIPosterSwitcherViewController *)posterSwitcherViewController setSwitchingEnabled:1];
}

- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4
{
  id v7 = a4;
  BOOL v5 = [(AMUIAmbientViewController *)self delegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v6 = [(AMUIAmbientViewController *)self activeConfiguration];
    [v5 ambientViewController:self didUpdateActiveConfiguration:v6 withMetadata:v7];
  }
}

- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3
{
  [(AMUIAmbientViewController *)self setTemporaryOverlayVisible:1];

  [(AMUIAmbientViewController *)self _animateAllOverlayUIDismissal];
}

- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3
{
  [(AMUIAmbientViewController *)self setTemporaryOverlayVisible:0];

  [(AMUIAmbientViewController *)self _animateAllOverlayUIAppearance];
}

- (id)widgetHostManagerForViewController:(id)a3
{
  BOOL v4 = [(AMUIAmbientViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [v4 widgetHostManagerForAmbientViewController:self];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)ambientDefaultsForViewController:(id)a3
{
  return self->_ambientDefaults;
}

- (id)defaultWidgetDescriptorStacksForViewController:(id)a3
{
  BOOL v4 = [(AMUIAmbientViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [v4 defaultWidgetDescriptorStacksForAmbientViewController:self];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(AMUIAmbientViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 ambientViewController:self isApplicationVisibleWithBundleIdentifier:v5];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)posterSwitcherViewControllerIsAuthenticated:(id)a3
{
  objc_super v3 = self;
  BOOL v4 = [(AMUIAmbientViewController *)self delegate];
  LOBYTE(v3) = [v4 ambientViewControllerIsAuthenticated:v3];

  return (char)v3;
}

- (id)posterSwitcherViewControllerAuthenticationHandler:(id)a3
{
  BOOL v4 = [(AMUIAmbientViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 ambientViewControllerAuthenticationHandler:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)posterSwitcherViewController:(id)a3 didSetPasscodeVisible:(BOOL)a4
{
}

- (void)posterSwitcherViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AMUIAmbientViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 ambientViewController:self didSetInlineAuthenticationViewVisible:v4];
  }
}

- (void)posterSwitcherViewControllerDidSuccessfullyCompleteInlineAuthentication:(id)a3
{
  self->_hasInlineAuthenticated = 1;
}

- (BOOL)posterSwitcherViewControllerHasInlineAuthenticated:(id)a3
{
  return self->_hasInlineAuthenticated;
}

- (id)posterSwitcherViewController:(id)a3 requestsLastSelectedConfigurationUUIDForProviderBundleIdentifier:(id)a4
{
  p_posterSelectionCoordinator = &self->_posterSelectionCoordinator;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_posterSelectionCoordinator);
  char v7 = [WeakRetained lastSelectedPosterConfigurationUUIDForProviderBundleIdentifier:v5];

  return v7;
}

- (void)posterSwitcherViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AMUIAmbientViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 ambientViewController:self didSetBiometricAuthenticationDisabled:v4];
  }
}

- (BOOL)posterSwitcherViewController:(id)a3 wantsBiometricAuthenticationBlockedForDeepUserInteraction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AMUIAmbientViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 ambientViewController:self wantsBiometricAuthenticationBlockedForDeepUserInteraction:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([a3 isEqual:self->_posterEditingSwitcherGestureRecognizer])
  {
    posterConfigurationForEditingSwitcher = self->_posterConfigurationForEditingSwitcher;
    self->_posterConfigurationForEditingSwitcher = 0;

    id v5 = [(AMUIAmbientViewController *)self activeConfiguration];
    id v18 = 0;
    id v6 = objc_msgSend(v5, "pr_loadAmbientConfigurationWithError:", &v18);
    id v7 = v18;
    double v8 = AMUILogEditingSwitcher();
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = [(AMUIAmbientViewController *)self activeConfiguration];
        *(_DWORD *)buf = 138543618;
        CGRect v20 = v10;
        __int16 v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_247837000, v9, OS_LOG_TYPE_DEFAULT, "Checking if editing gesture recognizer should begin for activeConfig: %{public}@ with ambientConfig: %{public}@", buf, 0x16u);
      }
      uint64_t v11 = [v6 editingBehavior];
      uint64_t v12 = [v6 deletionBehavior];
      if (v11 == 1 && v12 == 2) {
        goto LABEL_14;
      }
      BOOL v13 = [v5 providerBundleIdentifier];
      int v14 = [v13 isEqualToString:@"com.apple.ambient.AmbientUI.InfographPoster"];

      if (!v14)
      {
        objc_super v16 = self->_posterConfigurationForEditingSwitcher;
        self->_posterConfigurationForEditingSwitcher = (PRSPosterConfiguration *)v5;
        BOOL v15 = 1;
        id v5 = v6;
        goto LABEL_15;
      }
      id v9 = AMUILogEditingSwitcher();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AMUIAmbientViewController gestureRecognizerShouldBegin:](v9);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [(AMUIAmbientViewController *)(uint64_t)self gestureRecognizerShouldBegin:v9];
    }

LABEL_14:
    BOOL v15 = 0;
    objc_super v16 = (PRSPosterConfiguration *)v6;
LABEL_15:

    return v15;
  }
  return 1;
}

- (void)posterSelectionCoordinator:(id)a3 didUpdateLastSelectedPosterConfiguration:(id)a4
{
  id v7 = a4;
  id v5 = [(AMUIAmbientViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(AMUIAmbientViewController *)self activeConfigurationMetadata];
    [v5 ambientViewController:self didUpdateActiveConfiguration:v7 withMetadata:v6];
  }
}

- (id)posterSelectionCoordinatorRequestsConnectedChargerId:(id)a3
{
  BOOL v4 = [(AMUIAmbientViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 ambientViewControllerRequestsConnectedChargerId:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_refreshPosterConfigurationsAnimated:(BOOL)a3
{
  posterSwitcherViewController = self->_posterSwitcherViewController;
  id v6 = [(AMUIPosterSwitcherModel *)self->_posterSwitcherModel posterConfigurations];
  [(AMUIPosterSwitcherViewController *)posterSwitcherViewController setConfigurations:v6];

  id v7 = self->_posterSwitcherViewController;
  id v9 = [(AMUIPosterSwitcherModel *)self->_posterSwitcherModel activeConfiguration];
  if (a3)
  {
    double v8 = [MEMORY[0x263F29BC8] settingsWithDuration:0.3];
    [(AMUIPosterSwitcherViewController *)v7 updatePosterConfiguration:v9 withAnimationSettings:v8];
  }
  else
  {
    [(AMUIPosterSwitcherViewController *)v7 updatePosterConfiguration:v9 withAnimationSettings:0];
  }
}

- (id)_defaultPosterSelectionCoordinator
{
  defaultPosterSelectionCoordinator = self->_defaultPosterSelectionCoordinator;
  if (!defaultPosterSelectionCoordinator)
  {
    BOOL v4 = objc_alloc_init(AMUIDefaultSelectedPosterCoordinator);
    id v5 = self->_defaultPosterSelectionCoordinator;
    self->_defaultPosterSelectionCoordinator = v4;

    [(AMUIDefaultSelectedPosterCoordinator *)self->_defaultPosterSelectionCoordinator setAmbientDefaults:self->_ambientDefaults];
    defaultPosterSelectionCoordinator = self->_defaultPosterSelectionCoordinator;
  }

  return defaultPosterSelectionCoordinator;
}

- (void)_animateAllOverlayUIAppearance
{
  [(AMUIAmbientViewController *)self _animateNotificationIndicatorViewAppearanceIfNecessary];

  [(AMUIAmbientViewController *)self _animateBatteryViewAppearanceIfNecessary];
}

- (void)_animateAllOverlayUIDismissal
{
  [(AMUIAmbientViewController *)self _animateNotificationIndicatorViewRemoval];

  [(AMUIAmbientViewController *)self _animateBatteryViewDismissalIfNecessary];
}

- (void)_willBeginConfiguration
{
  if (![(AMUIAmbientViewController *)self isConfiguringUIVisible])
  {
    [(AMUIAmbientViewController *)self setConfiguringUIVisible:1];
    [(AMUIAmbientViewController *)self _animateAllOverlayUIDismissal];
    id v3 = [(AMUIAmbientViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 ambientViewControllerWillBeginConfiguration:self];
    }
  }
}

- (void)_willEndConfiguration
{
  if ([(AMUIAmbientViewController *)self isConfiguringUIVisible])
  {
    [(AMUIAmbientViewController *)self setConfiguringUIVisible:0];
    [(AMUIAmbientViewController *)self _animateAllOverlayUIAppearance];
    id v3 = [(AMUIAmbientViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 ambientViewControllerWillEndConfiguration:self];
    }
  }
}

- (void)_handleAuthenticationChanged:(BOOL)a3
{
  if (!a3) {
    [(AMUIPosterEditingSwitcherViewController *)self->_posterEditingSwitcherVC handleDismiss];
  }
}

- (void)_configureNotificationIndicatorViewIfNecessary
{
  if (!self->_notificationIndicatorView && [(AMUIAmbientViewController *)self notificationCount])
  {
    id v3 = [[AMUINotificationIndicatorView alloc] initWithNotificationCount:[(AMUIAmbientViewController *)self notificationCount]];
    notificationIndicatorView = self->_notificationIndicatorView;
    self->_notificationIndicatorView = v3;

    id v5 = [(AMUIAmbientViewController *)self view];
    [v5 addSubview:self->_notificationIndicatorView];

    id v6 = self->_notificationIndicatorView;
    [(AMUINotificationIndicatorView *)v6 setAlpha:0.0];
  }
}

- (void)_animateNotificationIndicatorViewAppearanceIfNecessary
{
  notificationIndicatorView = self->_notificationIndicatorView;
  if (notificationIndicatorView)
  {
    [(AMUINotificationIndicatorView *)notificationIndicatorView alpha];
    if (v4 == 0.0
      && ![(AMUIAmbientViewController *)self isConfiguringUIVisible]
      && ![(AMUIAmbientViewController *)self isTemporaryOverlayVisible])
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __83__AMUIAmbientViewController__animateNotificationIndicatorViewAppearanceIfNecessary__block_invoke;
      v5[3] = &unk_2652247E0;
      v5[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v5 options:0 animations:0.2 completion:0.0];
    }
  }
}

uint64_t __83__AMUIAmbientViewController__animateNotificationIndicatorViewAppearanceIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setAlpha:1.0];
}

- (void)_animateNotificationIndicatorViewRemoval
{
  notificationIndicatorView = self->_notificationIndicatorView;
  if (notificationIndicatorView)
  {
    double v4 = notificationIndicatorView;
    id v5 = (void *)MEMORY[0x263F1CB60];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__AMUIAmbientViewController__animateNotificationIndicatorViewRemoval__block_invoke;
    v10[3] = &unk_2652247E0;
    uint64_t v11 = v4;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __69__AMUIAmbientViewController__animateNotificationIndicatorViewRemoval__block_invoke_2;
    v8[3] = &unk_265224B88;
    id v9 = v11;
    id v6 = v11;
    [v5 animateWithDuration:0 delay:v10 options:v8 animations:0.2 completion:0.0];
    id v7 = self->_notificationIndicatorView;
    self->_notificationIndicatorView = 0;
  }
}

uint64_t __69__AMUIAmbientViewController__animateNotificationIndicatorViewRemoval__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __69__AMUIAmbientViewController__animateNotificationIndicatorViewRemoval__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_updateNotificationIndicatorViewLayout
{
  if (self->_notificationIndicatorView)
  {
    id v3 = [(AMUIAmbientViewController *)self view];
    [v3 bringSubviewToFront:self->_notificationIndicatorView];

    double v4 = [(AMUIAmbientViewController *)self view];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double v10 = v9;
    double v12 = v11;

    [(AMUINotificationIndicatorView *)self->_notificationIndicatorView frame];
    -[AMUINotificationIndicatorView sizeThatFits:](self->_notificationIndicatorView, "sizeThatFits:", v10, v12);
    UIRectCenteredXInRect();
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    -[AMUINotificationIndicatorView setFrame:](self->_notificationIndicatorView, "setFrame:", v14, CGRectGetHeight(v20) * 0.02, v16, v18);
    [(AMUIAmbientViewController *)self _animateNotificationIndicatorViewAppearanceIfNecessary];
  }
}

- (void)_setNotificationIndicatorHidden:(BOOL)a3
{
  objc_initWeak(&location, self->_notificationIndicatorView);
  double v4 = (void *)MEMORY[0x263F1CB60];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__AMUIAmbientViewController__setNotificationIndicatorHidden___block_invoke;
  v5[3] = &unk_265224950;
  objc_copyWeak(&v6, &location);
  BOOL v7 = a3;
  [v4 animateWithDuration:0 delay:v5 options:0 animations:0.2 completion:0.0];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__AMUIAmbientViewController__setNotificationIndicatorHidden___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  double v3 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  [WeakRetained setAlpha:v3];
}

- (void)_animateBatteryViewAppearanceIfNecessary
{
  if (self->_batteryChargingViewController
    && ![(AMUIAmbientViewController *)self isConfiguringUIVisible]
    && ![(AMUIAmbientViewController *)self isTemporaryOverlayVisible]
    && ([(AMAmbientDefaults *)self->_ambientDefaults isFirstPresentation] & 1) == 0)
  {
    double v3 = self->_batteryChargingViewController;
    id v4 = [(AMUIBatteryChargingViewController *)v3 view];
    objc_initWeak(&location, self);
    double v5 = (void *)MEMORY[0x263F1CB60];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke;
    v11[3] = &unk_2652247E0;
    id v6 = v4;
    id v12 = v6;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke_2;
    v8[3] = &unk_265224BB0;
    BOOL v7 = v3;
    double v9 = v7;
    objc_copyWeak(&v10, &location);
    [v5 animateWithDuration:0 delay:v11 options:v8 animations:0.2 completion:0.0];
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
}

uint64_t __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke_3;
  v2[3] = &unk_265224808;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  [v1 performChargingAnimation:v2];
  objc_destroyWeak(&v3);
}

void __69__AMUIAmbientViewController__animateBatteryViewAppearanceIfNecessary__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _animateBatteryViewDismissalIfNecessary];
}

- (void)_animateBatteryViewDismissalIfNecessary
{
  batteryChargingViewController = self->_batteryChargingViewController;
  if (batteryChargingViewController)
  {
    id v4 = batteryChargingViewController;
    double v5 = [(AMUIBatteryChargingViewController *)v4 view];
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x263F1CB60];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__AMUIAmbientViewController__animateBatteryViewDismissalIfNecessary__block_invoke;
    v12[3] = &unk_2652247E0;
    id v7 = v5;
    id v13 = v7;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__AMUIAmbientViewController__animateBatteryViewDismissalIfNecessary__block_invoke_2;
    v9[3] = &unk_265224B60;
    objc_copyWeak(&v11, &location);
    CGFloat v8 = v4;
    id v10 = v8;
    [v6 animateWithDuration:0 delay:v12 options:v9 animations:0.3 completion:0.0];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

uint64_t __68__AMUIAmbientViewController__animateBatteryViewDismissalIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __68__AMUIAmbientViewController__animateBatteryViewDismissalIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_msgSend(WeakRetained, "bs_removeChildViewController:", *(void *)(a1 + 32));
    id v3 = (void *)v4[127];
    v4[127] = 0;

    id WeakRetained = v4;
  }
}

- (void)_updateBatteryViewLayout
{
  batteryChargingViewController = self->_batteryChargingViewController;
  if (batteryChargingViewController)
  {
    id v8 = [(AMUIBatteryChargingViewController *)batteryChargingViewController view];
    id v4 = [(AMUIAmbientViewController *)self view];
    [v4 bounds];
    objc_msgSend(v8, "setBounds:");

    double v5 = [(AMUIAmbientViewController *)self view];
    [v5 frame];
    objc_msgSend(v8, "setFrame:");

    [v8 setAutoresizingMask:18];
    id v6 = [(AMUIAmbientViewController *)self view];
    id v7 = [(AMUIBatteryChargingViewController *)self->_batteryChargingViewController view];
    [v6 bringSubviewToFront:v7];
  }
}

- (unint64_t)notificationCount
{
  return self->_notificationCount;
}

- (AMUIPosterSelectionCoordinating)_posterSelectionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_posterSelectionCoordinator);

  return (AMUIPosterSelectionCoordinating *)WeakRetained;
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (AMUIAmbientViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIAmbientViewControllerDelegate *)WeakRetained;
}

- (BOOL)isConfiguringUIVisible
{
  return self->_configuringUIVisible;
}

- (void)setConfiguringUIVisible:(BOOL)a3
{
  self->_configuringUIVisible = a3;
}

- (BOOL)isTemporaryOverlayVisible
{
  return self->_temporaryOverlayVisible;
}

- (void)setTemporaryOverlayVisible:(BOOL)a3
{
  self->_temporaryOverlayVisible = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_destroyWeak((id *)&self->_posterSelectionCoordinator);
  objc_storeStrong((id *)&self->_posterConfigurationForEditingSwitcher, 0);
  objc_storeStrong((id *)&self->_posterEditingSwitcherVC, 0);
  objc_storeStrong((id *)&self->_posterEditingSwitcherFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_posterEditingSwitcherGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_batteryChargingViewController, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_defaultPosterSelectionCoordinator, 0);
  objc_storeStrong((id *)&self->_notificationIndicatorView, 0);
  objc_storeStrong((id *)&self->_posterSwitcherModel, 0);

  objc_storeStrong((id *)&self->_posterSwitcherViewController, 0);
}

- (void)gestureRecognizerShouldBegin:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v5 = [*(id *)(a1 + 976) mostVisibleConfiguration];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_247837000, a3, OS_LOG_TYPE_ERROR, "Failed to load ambient configuration from configuration %@ with error %@", (uint8_t *)&v6, 0x16u);
}

- (void)gestureRecognizerShouldBegin:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_247837000, log, OS_LOG_TYPE_ERROR, "Infograph is able to enter editing switcher but it should not be.", v1, 2u);
}

@end