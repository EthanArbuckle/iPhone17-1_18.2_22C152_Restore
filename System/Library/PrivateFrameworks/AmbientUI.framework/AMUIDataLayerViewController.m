@interface AMUIDataLayerViewController
+ (Class)_dataLayerClassForConfiguration:(id)a3;
+ (int64_t)_dataLayoutForDataLayerClass:(Class)a3;
+ (int64_t)dataLayoutForConfiguration:(id)a3;
- (AMUIDataLayerViewControllerDelegate)delegate;
- (AMUIDateProviding)dateProvider;
- (BOOL)_canShowWhileLocked;
- (BOOL)handleDismiss;
- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4;
- (NSDictionary)activeConfigurationMetadata;
- (UIView)viewForOpacityAdjustment;
- (id)ambientDefaultsForViewController:(id)a3;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (id)createUnlockRequestForViewController:(id)a3;
- (id)defaultWidgetDescriptorStacksForViewController:(id)a3;
- (id)widgetHostManagerForViewController:(id)a3;
- (int64_t)chromeOrientationPolicy;
- (int64_t)currentDataLayout;
- (void)_registerForAmbientPresentationTraitChanges;
- (void)_updateRedModeFiltersForTraitEnvironment:(id)a3 previousTraitCollection:(id)a4 animated:(BOOL)a5;
- (void)invalidate;
- (void)loadView;
- (void)noteAmbientViewControllingDelegateDidUpdate;
- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)setChromeOrientationPolicy:(int64_t)a3;
- (void)setChromeVisibility:(BOOL)a3 withAnimationSettings:(id)a4 animationFence:(id)a5;
- (void)setDateProvider:(id)a3;
- (void)setDateTimeLayerHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4;
- (void)viewControllerWillBeginConfiguration:(id)a3;
- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3;
- (void)viewControllerWillEndConfiguration:(id)a3;
- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3;
- (void)viewDidLoad;
@end

@implementation AMUIDataLayerViewController

- (void)setChromeVisibility:(BOOL)a3 withAnimationSettings:(id)a4 animationFence:(id)a5
{
  id v8 = a4;
  if (a5)
  {
    id v9 = a5;
    v10 = [(AMUIDataLayerViewController *)self view];
    v11 = [v10 window];
    v12 = [v11 windowScene];

    [v12 _synchronizeDrawingWithFence:v9];
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __88__AMUIDataLayerViewController_setChromeVisibility_withAnimationSettings_animationFence___block_invoke;
  v13[3] = &unk_265224D18;
  v13[4] = self;
  BOOL v14 = a3;
  [MEMORY[0x263F29D20] animateWithSettings:v8 actions:v13];
}

void __88__AMUIDataLayerViewController_setChromeVisibility_withAnimationSettings_animationFence___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewForOpacityAdjustment];
  id v4 = v2;
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
}

- (void)setChromeOrientationPolicy:(int64_t)a3
{
  self->_chromeOrientationPolicy = a3;
  concreteDataLayerViewController = self->_concreteDataLayerViewController;
  uint64_t v5 = objc_opt_class();
  v6 = concreteDataLayerViewController;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  [(AMUIAmbientViewControlling *)v8 setChromeOrientationPolicy:self->_chromeOrientationPolicy];
}

- (void)setDateProvider:(id)a3
{
  id v11 = a3;
  p_dateProvider = &self->_dateProvider;
  objc_storeStrong((id *)&self->_dateProvider, a3);
  concreteDataLayerViewController = self->_concreteDataLayerViewController;
  uint64_t v7 = objc_opt_class();
  id v8 = concreteDataLayerViewController;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  v10 = v9;

  [(AMUIAmbientViewControlling *)v10 setDateProvider:*p_dateProvider];
}

- (int64_t)currentDataLayout
{
  v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();

  return [v2 _dataLayoutForDataLayerClass:v3];
}

+ (int64_t)dataLayoutForConfiguration:(id)a3
{
  uint64_t v4 = [a1 _dataLayerClassForConfiguration:a3];

  return [a1 _dataLayoutForDataLayerClass:v4];
}

- (void)setDateTimeLayerHidden:(BOOL)a3
{
  if ([(AMUIAmbientViewControlling *)self->_concreteDataLayerViewController isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = [(AMUIAmbientViewControlling *)self->_concreteDataLayerViewController view];
    v6 = (void *)MEMORY[0x263F1CB60];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __54__AMUIDataLayerViewController_setDateTimeLayerHidden___block_invoke;
    v8[3] = &unk_265224D18;
    id v9 = v5;
    BOOL v10 = a3;
    id v7 = v5;
    [v6 animateWithDuration:v8 animations:0.2];
  }
}

uint64_t __54__AMUIDataLayerViewController_setDateTimeLayerHidden___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (UIView)viewForOpacityAdjustment
{
  if (objc_opt_respondsToSelector()) {
    [(AMUIAmbientViewControlling *)self->_concreteDataLayerViewController viewForOpacityAdjustment];
  }
  else {
  uint64_t v3 = [(AMUIDataLayerViewController *)self view];
  }

  return (UIView *)v3;
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_concreteDataLayerViewController = &self->_concreteDataLayerViewController;
  if (!-[AMUIAmbientViewControlling isMemberOfClass:](self->_concreteDataLayerViewController, "isMemberOfClass:", [(id)objc_opt_class() _dataLayerClassForConfiguration:v6])|| (-[AMUIAmbientViewControlling updatePosterConfiguration:withAnimationSettings:](*p_concreteDataLayerViewController, "updatePosterConfiguration:withAnimationSettings:", v6, v7) & 1) == 0)
  {
    id v9 = *p_concreteDataLayerViewController;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke;
    v37[3] = &unk_265224858;
    v37[4] = self;
    v31 = v9;
    v38 = v31;
    BOOL v10 = (void *)MEMORY[0x24C5614A0](v37);
    id v11 = objc_alloc_init((Class)[(id)objc_opt_class() _dataLayerClassForConfiguration:v6]);
    uint64_t v12 = objc_opt_class();
    id v13 = v11;
    if (v12)
    {
      if (objc_opt_isKindOfClass()) {
        BOOL v14 = v13;
      }
      else {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
    id v15 = v14;

    [v15 setDelegate:self];
    uint64_t v16 = objc_opt_class();
    id v17 = v13;
    if (v16)
    {
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
    id v19 = v18;

    [v19 setChromeOrientationPolicy:self->_chromeOrientationPolicy];
    uint64_t v20 = objc_opt_class();
    id v21 = v17;
    if (v20)
    {
      if (objc_opt_isKindOfClass()) {
        v22 = v21;
      }
      else {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
    id v23 = v22;

    [v23 setDateProvider:self->_dateProvider];
    v24 = [(AMUIDataLayerViewController *)self view];
    v25 = [v21 view];
    [v24 bounds];
    objc_msgSend(v25, "setFrame:");
    [v25 setAutoresizingMask:18];
    [v25 setAlpha:0.0];
    if (v7)
    {
      v26 = [v25 layer];
      [v26 setAllowsGroupOpacity:1];
    }
    [(AMUIDataLayerViewController *)self bs_addChildViewController:v21];
    objc_storeStrong((id *)&self->_concreteDataLayerViewController, v11);
    [(AMUIAmbientViewControlling *)*p_concreteDataLayerViewController updatePosterConfiguration:v6 withAnimationSettings:0];
    v27 = (void *)MEMORY[0x263F29D20];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_2;
    v35[3] = &unk_2652247E0;
    id v36 = v21;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_3;
    v32[3] = &unk_265224D40;
    v32[4] = self;
    id v33 = v36;
    id v34 = v10;
    id v28 = v10;
    id v29 = v36;
    [v27 animateWithSettings:v7 actions:v35 completion:v32];
  }
  return 1;
}

uint64_t __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:", *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 40);

  return [v2 invalidate];
}

void __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

uint64_t __79__AMUIDataLayerViewController_updatePosterConfiguration_withAnimationSettings___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)invalidate
{
  [(AMUIDataLayerViewController *)self bs_removeChildViewController:self->_concreteDataLayerViewController];
  [(AMUIAmbientViewControlling *)self->_concreteDataLayerViewController invalidate];
  concreteDataLayerViewController = self->_concreteDataLayerViewController;
  self->_concreteDataLayerViewController = 0;
}

- (NSDictionary)activeConfigurationMetadata
{
  return (NSDictionary *)[(AMUIAmbientViewControlling *)self->_concreteDataLayerViewController activeConfigurationMetadata];
}

- (void)noteAmbientViewControllingDelegateDidUpdate
{
}

- (BOOL)handleDismiss
{
  return [(AMUIAmbientViewControlling *)self->_concreteDataLayerViewController handleDismiss];
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(AMUIAmbientViewControlling *)self->_concreteDataLayerViewController cancelTouchesForCurrentEventInHostedContent];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)loadView
{
  uint64_t v3 = objc_alloc_init(AMUITouchPassthroughView);
  [(AMUIDataLayerViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIDataLayerViewController;
  [(AMUIDataLayerViewController *)&v3 viewDidLoad];
  [(AMUIDataLayerViewController *)self _registerForAmbientPresentationTraitChanges];
  [(AMUIDataLayerViewController *)self _updateRedModeFiltersForTraitEnvironment:self previousTraitCollection:0 animated:0];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)createUnlockRequestForViewController:(id)a3
{
  uint64_t v4 = [(AMUIDataLayerViewController *)self delegate];
  uint64_t v5 = [v4 createUnlockRequestForViewController:self];

  return v5;
}

- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(AMUIDataLayerViewController *)self delegate];
  [v9 requestUnlockForViewController:self withRequest:v8 completion:v7];
}

- (void)viewControllerWillBeginConfiguration:(id)a3
{
  id v4 = [(AMUIDataLayerViewController *)self delegate];
  [v4 viewControllerWillBeginConfiguration:self];
}

- (void)viewControllerWillEndConfiguration:(id)a3
{
  id v4 = [(AMUIDataLayerViewController *)self delegate];
  [v4 viewControllerWillEndConfiguration:self];
}

- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4
{
  id v5 = a4;
  id v6 = [(AMUIDataLayerViewController *)self delegate];
  [v6 viewController:self didUpdateActiveConfigurationMetadata:v5];
}

- (id)widgetHostManagerForViewController:(id)a3
{
  id v4 = [(AMUIDataLayerViewController *)self delegate];
  id v5 = [v4 widgetHostManagerForViewController:self];

  return v5;
}

- (id)ambientDefaultsForViewController:(id)a3
{
  id v4 = [(AMUIDataLayerViewController *)self delegate];
  id v5 = [v4 ambientDefaultsForViewController:self];

  return v5;
}

- (id)defaultWidgetDescriptorStacksForViewController:(id)a3
{
  id v4 = [(AMUIDataLayerViewController *)self delegate];
  id v5 = [v4 defaultWidgetDescriptorStacksForViewController:self];

  return v5;
}

- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(AMUIDataLayerViewController *)self delegate];
  [v5 viewControllerWillBeginShowingTemporaryOverlay:v4];
}

- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(AMUIDataLayerViewController *)self delegate];
  [v5 viewControllerWillEndShowingTemporaryOverlay:v4];
}

- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMUIDataLayerViewController *)self delegate];
  char v9 = [v8 viewController:v7 isApplicationVisibleWithBundleIdentifier:v6];

  return v9;
}

+ (Class)_dataLayerClassForConfiguration:(id)a3
{
  id v3 = a3;
  id v14 = 0;
  id v4 = objc_msgSend(v3, "pr_loadAmbientConfigurationWithError:", &v14);
  id v5 = v14;
  if (v4)
  {
    uint64_t v6 = [v4 supportedDataLayout];
    if (v6 == 1 || v6 == 2) {
      BOOL v10 = objc_opt_class();
    }
    else {
      BOOL v10 = 0;
    }
    id v9 = v10;
    goto LABEL_10;
  }
  id v7 = [v3 providerBundleIdentifier];
  int v8 = [v7 isEqualToString:@"com.apple.ambient.AmbientUI.InfographPoster"];

  if (v8)
  {
    objc_opt_class();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    id v11 = v9;
    goto LABEL_11;
  }
  id v13 = AMUILogDataLayer();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    +[AMUIDataLayerViewController _dataLayerClassForConfiguration:v13];
  }

  id v11 = 0;
LABEL_11:

  return (Class)v11;
}

+ (int64_t)_dataLayoutForDataLayerClass:(Class)a3
{
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return 2;
  }
  if ([(objc_class *)a3 isEqual:objc_opt_class()]) {
    return 1;
  }
  return 3;
}

- (void)_registerForAmbientPresentationTraitChanges
{
  v6[1] = *MEMORY[0x263EF8340];
  id v3 = self;
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = (id)[(AMUIDataLayerViewController *)self registerForTraitChanges:v4 withHandler:&__block_literal_global_6];
}

uint64_t __74__AMUIDataLayerViewController__registerForAmbientPresentationTraitChanges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 _updateRedModeFiltersForTraitEnvironment:a2 previousTraitCollection:a3 animated:1];
}

- (void)_updateRedModeFiltersForTraitEnvironment:(id)a3 previousTraitCollection:(id)a4 animated:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(AMUIDataLayerViewController *)self view];
  BOOL v10 = [v8 traitCollection];

  id v11 = self;
  [v10 valueForNSIntegerTrait:v11];
  int IsRedMode = AMUIAmbientDisplayStyleIsRedMode();

  id v13 = self;
  [v7 valueForNSIntegerTrait:v13];

  int v14 = AMUIAmbientDisplayStyleIsRedMode();
  if (v7 && IsRedMode == v14)
  {
    id v21 = AMUILogDataLayer();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218240;
      id v23 = self;
      __int16 v24 = 1024;
      LODWORD(v25) = IsRedMode;
      _os_log_impl(&dword_247837000, v21, OS_LOG_TYPE_DEFAULT, "0x%p: Not changing red mode filters because red mode trait did not change(isRedModeEnabled=%{BOOL}u)", (uint8_t *)&v22, 0x12u);
    }
  }
  else
  {
    id v15 = AMUILogDataLayer();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (IsRedMode)
    {
      if (v16)
      {
        id v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        int v22 = 134218242;
        id v23 = self;
        __int16 v24 = 2112;
        v25 = v18;
        _os_log_impl(&dword_247837000, v15, OS_LOG_TYPE_DEFAULT, "0x%p: Applying red mode filter on the concreteDataLayerViewController of type:%@", (uint8_t *)&v22, 0x16u);
      }
      objc_msgSend(v9, "amui_applyRedModeFilterAnimated:withCompletion:", 1, 0);
    }
    else
    {
      if (v16)
      {
        id v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        int v22 = 134218242;
        id v23 = self;
        __int16 v24 = 2112;
        v25 = v20;
        _os_log_impl(&dword_247837000, v15, OS_LOG_TYPE_DEFAULT, "0x%p: Clearing red mode filter on the concreteDataLayerViewController of type:%@", (uint8_t *)&v22, 0x16u);
      }
      objc_msgSend(v9, "amui_clearRedModeFilterAnimated:withCompletion:", 1, 0);
    }
  }
}

- (int64_t)chromeOrientationPolicy
{
  return self->_chromeOrientationPolicy;
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (AMUIDataLayerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIDataLayerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);

  objc_storeStrong((id *)&self->_concreteDataLayerViewController, 0);
}

+ (void)_dataLayerClassForConfiguration:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_247837000, log, OS_LOG_TYPE_ERROR, "Failed to load ambient configuration from configuration %@ with error %@", (uint8_t *)&v3, 0x16u);
}

@end