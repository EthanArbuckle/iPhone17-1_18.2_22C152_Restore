@interface AMUIPosterCategoryViewController
- (AMUIDateProviding)dateProvider;
- (AMUIPosterCategoryViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)authenticationViewControllerWantsBiometricAuthenticationBlocked:(id)a3;
- (BOOL)handleDismiss;
- (BOOL)isCircular;
- (BOOL)posterCategorySwitcherItemHasInlineAuthenticated:(id)a3;
- (BOOL)posterCategorySwitcherItemIsAuthenticated:(id)a3;
- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4;
- (NSArray)configurations;
- (NSArray)visibleConfigurations;
- (NSDictionary)activeConfigurationMetadata;
- (PRSPosterConfiguration)mostVisibleConfiguration;
- (UIView)backgroundView;
- (UIView)contentView;
- (double)spacing;
- (id)_currentAppearanceTransitionCoordinator;
- (id)_unsettledSentinel;
- (id)ambientDefaultsForViewController:(id)a3;
- (id)cancelTouchesForCurrentEventInHostedContent;
- (id)createUnlockRequestForViewController:(id)a3;
- (id)defaultWidgetDescriptorStacksForViewController:(id)a3;
- (id)posterCategorySwitcherItemPrototypeSettings:(id)a3;
- (id)posterCategorySwitcherItemRequestInstanceIdentifier:(id)a3 preferring:(id)a4;
- (id)switcher:(id)a3 itemAtIndex:(int64_t)a4;
- (id)widgetHostManagerForViewController:(id)a3;
- (int64_t)switcherAxis;
- (int64_t)switcherNumberOfItems:(id)a3;
- (void)_addInlineAuthenticationViewWithUnlockDestination:(id)a3;
- (void)_dismissInlineAuthenticationViewAnimated:(BOOL)a3 completion:(id)a4;
- (void)_updateInlineAuthenticationViewLayout;
- (void)authenticationViewController:(id)a3 didAuthenticateWithSuccess:(BOOL)a4;
- (void)authenticationViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4;
- (void)authenticationViewController:(id)a3 setDidSetPasscodeVisible:(BOOL)a4;
- (void)dealloc;
- (void)invalidate;
- (void)noteAmbientViewControllingDelegateDidUpdate;
- (void)posterCategorySwitcherItem:(id)a3 didRequestInlineAuthenticationWithUnlockDestination:(id)a4;
- (void)posterCategorySwitcherItem:(id)a3 relinquishInstanceIdentifier:(id)a4;
- (void)posterCategorySwitcherItem:(id)a3 setChromeVisibility:(BOOL)a4 withAnimationSettings:(id)a5 animationFence:(id)a6;
- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)setConfigurations:(id)a3;
- (void)setDateProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)switcher:(id)a3 didSettleOnItem:(id)a4 interactive:(BOOL)a5;
- (void)switcher:(id)a3 transitionDidBegin:(id)a4;
- (void)switcher:(id)a3 transitionDidEnd:(id)a4;
- (void)switcher:(id)a3 transitionDidUpdate:(id)a4 withProgress:(double)a5;
- (void)switcher:(id)a3 transitioningFromItem:(id)a4 toItem:(id)a5 progress:(double)a6;
- (void)switcher:(id)a3 updateItem:(id)a4 view:(id)a5 forPresentationProgress:(double)a6;
- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4;
- (void)viewControllerWillBeginConfiguration:(id)a3;
- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3;
- (void)viewControllerWillEndConfiguration:(id)a3;
- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AMUIPosterCategoryViewController

- (void)dealloc
{
  [(AMUIPosterCategoryViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterCategoryViewController;
  [(AMUIPosterCategoryViewController *)&v3 dealloc];
}

- (void)setConfigurations:(id)a3
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(AMUISwitcherViewController *)self->_posterSwitcherViewController visibleItems];
  v6 = [v5 firstObject];
  v7 = [v6 identifier];
  uint64_t v8 = objc_opt_class();
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [(NSArray *)self->_configurations bs_map:&__block_literal_global_12];
  v13 = (void *)v12;
  v14 = (NSArray *)MEMORY[0x263EFFA68];
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = (void *)MEMORY[0x263EFFA68];
  }
  id v16 = v15;

  v17 = (NSArray *)[v4 copy];
  configurations = self->_configurations;
  self->_configurations = v17;

  uint64_t v19 = [(NSArray *)self->_configurations bs_map:&__block_literal_global_2];
  v20 = (void *)v19;
  if (v19) {
    v21 = (void *)v19;
  }
  else {
    v21 = v14;
  }
  id v22 = v21;

  v63 = [v22 differenceFromArray:v16 withOptions:0];
  if ([v63 hasChanges])
  {
    id v59 = v22;
    id v60 = v16;
    id v61 = v11;
    id v62 = v4;
    v23 = [MEMORY[0x263EFF9A0] dictionary];
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v24 = self->_configurations;
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v74 objects:v80 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v75 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          v30 = [v29 serverUUID];
          [v23 setObject:v29 forKeyedSubscript:v30];
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v74 objects:v80 count:16];
      }
      while (v26);
    }

    v31 = [MEMORY[0x263EFF9A0] dictionary];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v64 = self;
    v32 = self->_items;
    uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v70 objects:v79 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v71;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v71 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v70 + 1) + 8 * v36);
          if (v37) {
            v38 = *(void **)(v37 + 88);
          }
          else {
            v38 = 0;
          }
          id v39 = v38;
          v40 = [v39 serverUUID];
          [v31 setObject:v37 forKeyedSubscript:v40];

          ++v36;
        }
        while (v34 != v36);
        uint64_t v41 = [(NSArray *)v32 countByEnumeratingWithState:&v70 objects:v79 count:16];
        uint64_t v34 = v41;
      }
      while (v41);
    }
    v65 = v23;

    if (v64->_items) {
      items = v64->_items;
    }
    else {
      items = v14;
    }
    v43 = (void *)[(NSArray *)items mutableCopy];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v44 = v63;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v66 objects:v78 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v46; ++j)
        {
          if (*(void *)v67 != v47) {
            objc_enumerationMutation(v44);
          }
          v49 = *(void **)(*((void *)&v66 + 1) + 8 * j);
          uint64_t v50 = [v49 changeType];
          if (v50 == 1)
          {
            objc_msgSend(v43, "removeObjectAtIndex:", objc_msgSend(v49, "index"));
          }
          else if (!v50)
          {
            v51 = [v49 object];
            v52 = [v65 objectForKeyedSubscript:v51];
            v53 = [v31 objectForKeyedSubscript:v51];
            if (!v53)
            {
              v53 = +[AMUIPosterCategorySwitcherItem itemWithConfiguration:delegate:]((uint64_t)AMUIPosterCategorySwitcherItem, v52, v64);
            }
            objc_msgSend(v43, "insertObject:atIndex:", v53, objc_msgSend(v49, "index"));
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v66 objects:v78 count:16];
      }
      while (v46);
    }

    uint64_t v54 = [v43 copy];
    self = v64;
    v55 = v64->_items;
    v64->_items = (NSArray *)v54;

    [(AMUISwitcherViewController *)v64->_posterSwitcherViewController reload];
    id v11 = v61;
    id v4 = v62;
    id v16 = v60;
    id v22 = v59;
  }
  if ([(NSArray *)self->_items count])
  {
    unint64_t v56 = 0;
    do
    {
      v57 = [(NSArray *)self->_configurations objectAtIndexedSubscript:v56];
      v58 = [(NSArray *)self->_items objectAtIndexedSubscript:v56];
      -[AMUIPosterCategorySwitcherItem setConfiguration:]((uint64_t)v58, v57);

      ++v56;
    }
    while (v56 < [(NSArray *)self->_items count]);
  }
  if (v11) {
    [(AMUISwitcherViewController *)self->_posterSwitcherViewController scrollToIdentifier:v11 animated:0];
  }
}

uint64_t __54__AMUIPosterCategoryViewController_setConfigurations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serverUUID];
}

uint64_t __54__AMUIPosterCategoryViewController_setConfigurations___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 serverUUID];
}

- (NSArray)visibleConfigurations
{
  v2 = [(AMUISwitcherViewController *)self->_posterSwitcherViewController visibleItems];
  objc_super v3 = objc_msgSend(v2, "bs_compactMap:", &__block_literal_global_7_0);

  return (NSArray *)v3;
}

id __57__AMUIPosterCategoryViewController_visibleConfigurations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6) {
    v7 = (void *)v6[11];
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (PRSPosterConfiguration)mostVisibleConfiguration
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v3 = [(AMUISwitcherViewController *)self->_posterSwitcherViewController visibleItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v4)
  {

    v6 = 0;
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  v6 = 0;
  uint64_t v7 = *(void *)v18;
  double v8 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v3);
      }
      v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      [(AMUISwitcherViewController *)self->_posterSwitcherViewController presentationProgressForItem:v10];
      if (v11 > v8)
      {
        double v12 = v11;
        v13 = v10;

        double v8 = v12;
        v6 = v13;
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v5);

  if (!v6) {
    goto LABEL_13;
  }
  v14 = (void *)v6[11];
LABEL_14:
  v15 = v14;

  return v15;
}

- (UIView)contentView
{
  uint64_t v3 = [(AMUISwitcherViewController *)self->_posterSwitcherViewController visibleItems];
  if ([v3 count] == 1) {
    contentWrapperView = self->_contentWrapperView;
  }
  else {
    contentWrapperView = 0;
  }
  uint64_t v5 = contentWrapperView;

  return v5;
}

- (UIView)backgroundView
{
  uint64_t v3 = [(AMUISwitcherViewController *)self->_posterSwitcherViewController visibleItems];
  if ([v3 count] == 1) {
    posterSwitcherViewController = self->_posterSwitcherViewController;
  }
  else {
    posterSwitcherViewController = self;
  }
  uint64_t v5 = [posterSwitcherViewController view];

  return (UIView *)v5;
}

- (void)setDateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dateProvider, a3);
  id v5 = a3;
  [(AMUIDataLayerViewController *)self->_dataLayerViewController setDateProvider:v5];
  [(AMUIInlineAuthenticationViewController *)self->_inlineAuthenticationViewController setDateProvider:v5];
}

- (id)cancelTouchesForCurrentEventInHostedContent
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(AMUIDataLayerViewController *)self->_dataLayerViewController cancelTouchesForCurrentEventInHostedContent];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_addInlineAuthenticationViewWithUnlockDestination:(id)a3
{
  id v4 = a3;
  if (!self->_inlineAuthenticationViewController)
  {
    id v5 = [[AMUIInlineAuthenticationViewController alloc] initWithUnlockDestination:v4];
    inlineAuthenticationViewController = self->_inlineAuthenticationViewController;
    self->_inlineAuthenticationViewController = v5;

    [(AMUIInlineAuthenticationViewController *)self->_inlineAuthenticationViewController setDelegate:self];
    uint64_t v7 = self->_inlineAuthenticationViewController;
    double v8 = [(AMUIPosterCategoryViewController *)self delegate];
    id v9 = [v8 posterCategoryViewControllerAuthenticationHandler:self];
    [(AMUIInlineAuthenticationViewController *)v7 setAuthenticationHandler:v9];

    [(AMUIInlineAuthenticationViewController *)self->_inlineAuthenticationViewController setDateProvider:self->_dateProvider];
    objc_initWeak(&location, self);
    v10 = self->_inlineAuthenticationViewController;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __86__AMUIPosterCategoryViewController__addInlineAuthenticationViewWithUnlockDestination___block_invoke;
    v11[3] = &unk_2652251F0;
    objc_copyWeak(&v12, &location);
    [(AMUIPosterCategoryViewController *)self bs_addChildViewController:v10 animated:0 transitionBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __86__AMUIPosterCategoryViewController__addInlineAuthenticationViewWithUnlockDestination___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained[122] view];
    [v5 setAutoresizingMask:18];
    v6 = [v4 view];
    [v6 bringSubviewToFront:v5];

    uint64_t v7 = [v4 view];
    [v7 layoutIfNeeded];

    double v8 = [v4 delegate];
    [v8 posterCategoryViewController:v4 didSetInlineAuthenticationViewVisible:1];
  }
  if (v9) {
    v9[2]();
  }
}

- (void)_dismissInlineAuthenticationViewAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke;
  v17[3] = &unk_265225218;
  objc_copyWeak(&v19, &location);
  uint64_t v7 = (void (**)(void))v6;
  id v18 = v7;
  double v8 = (void (**)(void))MEMORY[0x24C5614A0](v17);
  inlineAuthenticationViewController = self->_inlineAuthenticationViewController;
  if (inlineAuthenticationViewController)
  {
    v10 = [(AMUIInlineAuthenticationViewController *)inlineAuthenticationViewController view];
    double v11 = v10;
    if (v4)
    {
      id v12 = (void *)MEMORY[0x263F1CB60];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke_2;
      v15[3] = &unk_2652247E0;
      id v16 = v10;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke_3;
      v13[3] = &unk_265224788;
      v14 = v8;
      [v12 animateWithDuration:v15 animations:v13 completion:0.2];
    }
    else
    {
      v8[2](v8);
    }
  }
  else if (v7)
  {
    v7[2](v7);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

uint64_t __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "bs_removeChildViewController:", WeakRetained[122]);
    uint64_t v3 = (void *)v7[122];
    v7[122] = 0;

    BOOL v4 = [v7 delegate];
    [v4 posterCategoryViewController:v7 didSetInlineAuthenticationViewVisible:0];

    WeakRetained = v7;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, WeakRetained);
    WeakRetained = v7;
  }

  return MEMORY[0x270F9A758](v5, WeakRetained);
}

uint64_t __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __88__AMUIPosterCategoryViewController__dismissInlineAuthenticationViewAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateInlineAuthenticationViewLayout
{
  if (self->_inlineAuthenticationViewController)
  {
    uint64_t v3 = [(AMUIPosterCategoryViewController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    id v12 = [(AMUIInlineAuthenticationViewController *)self->_inlineAuthenticationViewController view];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)AMUIPosterCategoryViewController;
  [(AMUIPosterCategoryViewController *)&v22 viewDidLoad];
  uint64_t v3 = +[AMUIPosterSwitcherDomain rootSettings];
  settings = self->_settings;
  self->_settings = v3;

  double v5 = [(AMUIPosterCategoryViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [v5 setAutoresizingMask:0];
  v14 = -[AMUITouchPassthroughView initWithFrame:]([AMUITouchPassthroughView alloc], "initWithFrame:", v7, v9, v11, v13);
  contentWrapperView = self->_contentWrapperView;
  self->_contentWrapperView = &v14->super;

  [(UIView *)self->_contentWrapperView setAutoresizingMask:18];
  [v5 addSubview:self->_contentWrapperView];
  id v16 = objc_alloc_init(AMUIDataLayerViewController);
  dataLayerViewController = self->_dataLayerViewController;
  self->_dataLayerViewController = v16;

  [(AMUIDataLayerViewController *)self->_dataLayerViewController setChromeOrientationPolicy:2];
  [(AMUIDataLayerViewController *)self->_dataLayerViewController setDelegate:self];
  [(AMUIDataLayerViewController *)self->_dataLayerViewController setDateProvider:self->_dateProvider];
  id v18 = [(AMUIDataLayerViewController *)self->_dataLayerViewController view];
  objc_msgSend(v18, "setFrame:", v7, v9, v11, v13);
  [v18 setAutoresizingMask:18];
  [(AMUIPosterCategoryViewController *)self bs_addChildViewController:self->_dataLayerViewController withSuperview:self->_contentWrapperView];
  id v19 = [[AMUISwitcherViewController alloc] initWithLayout:self];
  posterSwitcherViewController = self->_posterSwitcherViewController;
  self->_posterSwitcherViewController = v19;

  [(AMUISwitcherViewController *)self->_posterSwitcherViewController setDataSource:self];
  [(AMUISwitcherViewController *)self->_posterSwitcherViewController setDelegate:self];
  v21 = [(AMUISwitcherViewController *)self->_posterSwitcherViewController view];
  objc_msgSend(v21, "setFrame:", v7, v9, v11, v13);
  [v21 setAutoresizingMask:18];
  [(AMUIPosterCategoryViewController *)self bs_addChildViewController:self->_posterSwitcherViewController];
  [v5 bringSubviewToFront:self->_contentWrapperView];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMUIPosterCategoryViewController;
  [(AMUIPosterCategoryViewController *)&v7 viewWillAppear:a3];
  posterSwitcherViewController = self->_posterSwitcherViewController;
  double v5 = [(AMUISwitcherViewController *)posterSwitcherViewController visibleItems];
  double v6 = [v5 lastObject];
  [(AMUISwitcherViewController *)posterSwitcherViewController scrollToItem:v6 animated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AMUIPosterCategoryViewController;
  [(AMUIPosterCategoryViewController *)&v4 viewDidDisappear:a3];
  [(AMUIPosterCategoryViewController *)self _dismissInlineAuthenticationViewAnimated:0 completion:0];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterCategoryViewController;
  [(AMUIPosterCategoryViewController *)&v3 viewWillLayoutSubviews];
  [(AMUIPosterCategoryViewController *)self _updateInlineAuthenticationViewLayout];
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(AMUIPosterCategoryViewController *)self loadViewIfNeeded];
  if ([(AMUISwitcherViewController *)self->_posterSwitcherViewController isScrollingInteractively])
  {
    double v8 = AMUILogSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v9 = [v6 serverUUID];
      int v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_247837000, v8, OS_LOG_TYPE_INFO, "vertical switcher ignoring update to %{public}@ due to interactive scroll", (uint8_t *)&v14, 0xCu);
    }
    BOOL v10 = 0;
  }
  else
  {
    [(AMUIDataLayerViewController *)self->_dataLayerViewController updatePosterConfiguration:v6 withAnimationSettings:v7];
    posterSwitcherViewController = self->_posterSwitcherViewController;
    double v12 = [v6 serverUUID];
    BOOL v10 = [(AMUISwitcherViewController *)posterSwitcherViewController scrollToIdentifier:v12 animated:v7 != 0];
  }
  return v10;
}

- (void)invalidate
{
  [(AMUIPosterCategoryViewController *)self setConfigurations:MEMORY[0x263EFFA68]];
  [(AMUIDataLayerViewController *)self->_dataLayerViewController invalidate];
  unsettledAssertion = self->_unsettledAssertion;

  [(BSInvalidatable *)unsettledAssertion invalidate];
}

- (NSDictionary)activeConfigurationMetadata
{
  return [(AMUIDataLayerViewController *)self->_dataLayerViewController activeConfigurationMetadata];
}

- (void)noteAmbientViewControllingDelegateDidUpdate
{
}

- (BOOL)handleDismiss
{
  return [(AMUIDataLayerViewController *)self->_dataLayerViewController handleDismiss];
}

- (int64_t)switcherNumberOfItems:(id)a3
{
  return [(NSArray *)self->_items count];
}

- (id)switcher:(id)a3 itemAtIndex:(int64_t)a4
{
  return [(NSArray *)self->_items objectAtIndexedSubscript:a4];
}

- (void)switcher:(id)a3 transitioningFromItem:(id)a4 toItem:(id)a5 progress:(double)a6
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [(AMUIDataLayerViewController *)self->_dataLayerViewController viewForOpacityAdjustment];
  uint64_t v11 = objc_opt_class();
  id v25 = v8;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      double v12 = v25;
    }
    else {
      double v12 = 0;
    }
  }
  else
  {
    double v12 = 0;
  }
  double v13 = v12;

  uint64_t v14 = objc_opt_class();
  id v15 = v9;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  long long v17 = v16;

  if (BSFloatLessThanFloat())
  {
    id v18 = v13;
    if (!v13)
    {
LABEL_13:
      uint64_t v19 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    id v18 = v17;
    if (!v17) {
      goto LABEL_13;
    }
  }
  uint64_t v19 = v18[11];
LABEL_16:
  [(AMUIDataLayerViewController *)self->_dataLayerViewController updatePosterConfiguration:v19 withAnimationSettings:0];
  long long v20 = -[AMUIPosterCategorySwitcherItem posterViewController](v13);
  v21 = [(AMUIPosterCategoryViewController *)self _currentAppearanceTransitionCoordinator];
  [v20 setAppearanceTransitionCoordinator:v21];

  objc_super v22 = -[AMUIPosterCategorySwitcherItem posterViewController](v17);
  v23 = [(AMUIPosterCategoryViewController *)self _currentAppearanceTransitionCoordinator];
  [v22 setAppearanceTransitionCoordinator:v23];

  v24 = [(AMUIDataLayerViewController *)self->_dataLayerViewController viewForOpacityAdjustment];
  if (v24 != v10) {
    [v10 setAlpha:1.0];
  }
}

- (void)switcher:(id)a3 transitionDidBegin:(id)a4
{
  id v21 = a4;
  double v5 = [v21 fromItem];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  BOOL v10 = [v21 toItem];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      double v13 = v12;
    }
    else {
      double v13 = 0;
    }
  }
  else
  {
    double v13 = 0;
  }
  uint64_t v14 = v13;

  id v15 = -[AMUIPosterCategorySwitcherItem posterViewController](v9);
  uint64_t v16 = [(AMUIPosterCategoryViewController *)self _currentAppearanceTransitionCoordinator];
  [v15 setAppearanceTransitionCoordinator:v16];

  long long v17 = -[AMUIPosterCategorySwitcherItem posterViewController](v14);
  id v18 = [(AMUIPosterCategoryViewController *)self _currentAppearanceTransitionCoordinator];
  [v17 setAppearanceTransitionCoordinator:v18];

  -[AMUIPosterCategorySwitcherItem noteTransitionDidBegin](v9);
  -[AMUIPosterCategorySwitcherItem noteTransitionDidBegin](v14);
  if ([(AMUIDataLayerViewController *)self->_dataLayerViewController currentDataLayout] == 1
    && v9
    && v14)
  {
    uint64_t v19 = [v21 direction];
    BOOL v20 = v19 != 1;
    *((unsigned char *)v9 + 80) = 1;
    *((unsigned char *)v9 + 81) = v19 == 1;
    [v9 _updateTitleLabelVisibility];
    *((unsigned char *)v14 + 80) = 1;
    *((unsigned char *)v14 + 81) = v20;
    [v14 _updateTitleLabelVisibility];
  }
}

- (void)switcher:(id)a3 transitionDidUpdate:(id)a4 withProgress:(double)a5
{
  id v7 = a4;
  id v8 = [v7 fromItem];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  double v13 = [v7 toItem];
  uint64_t v14 = objc_opt_class();
  id v15 = v13;
  if (v14)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  long long v17 = v16;

  uint64_t v18 = [v7 direction];
  if ([(AMUIPosterSwitcherSettings *)self->_settings exitingCardBehaviorScaleDownOnly])
  {
    [(AMUIPosterSwitcherSettings *)self->_settings verticalScootch];
    if ((BSFloatIsZero() & 1) == 0)
    {
      memset(&v50, 0, sizeof(v50));
      uint64_t v19 = [v12 itemView];
      BOOL v20 = v19;
      if (v19) {
        [v19 transform];
      }
      else {
        memset(&v50, 0, sizeof(v50));
      }

      memset(&v49, 0, sizeof(v49));
      id v21 = [v17 itemView];
      objc_super v22 = v21;
      if (v21) {
        [v21 transform];
      }
      else {
        memset(&v49, 0, sizeof(v49));
      }

      [(AMUIPosterSwitcherSettings *)self->_settings verticalScootch];
      BSFloatByLinearlyInterpolatingFloats();
      CGAffineTransform v47 = v50;
      CGAffineTransformTranslate(&v48, &v47, 0.0, v23);
      CGAffineTransform v50 = v48;
      [(AMUIPosterSwitcherSettings *)self->_settings verticalScootch];
      BSFloatByLinearlyInterpolatingFloats();
      CGAffineTransform v47 = v49;
      CGAffineTransformTranslate(&v48, &v47, 0.0, v24);
      CGAffineTransform v49 = v48;
      id v25 = [v12 itemView];
      CGAffineTransform v48 = v50;
      [v25 setTransform:&v48];

      uint64_t v26 = [v17 itemView];
      CGAffineTransform v48 = v49;
      [v26 setTransform:&v48];
    }
  }
  if ([(AMUIDataLayerViewController *)self->_dataLayerViewController currentDataLayout] == 1
    && v12
    && v17)
  {
    settings = self->_settings;
    if (v18)
    {
      [(AMUIPosterSwitcherSettings *)settings reverseTimeFadeoutTargetProgress];
      double v29 = v28;
      [(AMUIPosterSwitcherSettings *)self->_settings forwardTimeFadeoutTargetProgress];
    }
    else
    {
      [(AMUIPosterSwitcherSettings *)settings forwardTimeFadeoutTargetProgress];
      double v29 = v31;
      [(AMUIPosterSwitcherSettings *)self->_settings reverseTimeFadeoutTargetProgress];
    }
    if (v29 <= a5)
    {
      double v33 = 1.0 - v30;
      double v32 = 0.0;
      if (v33 < a5) {
        double v32 = (a5 - v33) / (1.0 - v33) + 0.0;
      }
    }
    else
    {
      double v32 = 1.0 - a5 / v29;
    }
    uint64_t v34 = [(AMUIDataLayerViewController *)self->_dataLayerViewController viewForOpacityAdjustment];
    [v34 setAlpha:v32];

    [(AMUIPosterSwitcherSettings *)self->_settings chromeFadeoutTargetProgress];
    double v36 = 1.0 - v35;
    double v37 = 0.0;
    double v38 = 0.0;
    if (v35 > a5) {
      double v38 = 1.0 - a5 / v35;
    }
    if (v36 < a5) {
      double v37 = (a5 - v36) / (1.0 - v36) + 0.0;
    }
    id v39 = -[AMUIPosterCategorySwitcherItem posterViewController](v12);
    [v39 setAppearanceTransitionProgress:v38];

    v40 = -[AMUIPosterCategorySwitcherItem posterViewController](v17);
    [v40 setAppearanceTransitionProgress:v37];

    [(AMUIPosterSwitcherSettings *)self->_settings labelFadeinTargetProgress];
    double v42 = 1.0;
    double v43 = 1.0 - v41;
    double v44 = 1.0;
    if (v41 > a5) {
      double v44 = a5 / v41 + 0.0;
    }
    if (v43 < a5) {
      double v42 = 1.0 - (a5 - v43) / (1.0 - v43);
    }
    uint64_t v45 = -[AMUIPosterCategorySwitcherItem titleLabelView]((id *)v12);
    [v45 setAlpha:v44];

    uint64_t v46 = -[AMUIPosterCategorySwitcherItem titleLabelView]((id *)v17);
    [v46 setAlpha:v42];
  }
}

- (void)switcher:(id)a3 transitionDidEnd:(id)a4
{
  id v4 = a4;
  double v5 = [v4 fromItem];
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v14 = v8;

  uint64_t v9 = [v4 toItem];

  uint64_t v10 = objc_opt_class();
  id v11 = v9;
  if (v10)
  {
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  double v13 = v12;

  if (v14)
  {
    v14[40] = 0;
    [v14 _updateTitleLabelVisibility];
  }
  if (v13)
  {
    v13[40] = 0;
    [v13 _updateTitleLabelVisibility];
  }
}

- (void)switcher:(id)a3 didSettleOnItem:(id)a4 interactive:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  id v12 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v12;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v9;

  if (v10)
  {
    id v11 = [(AMUIPosterCategoryViewController *)self delegate];
    [v11 posterCategoryViewController:self didSettleOnConfiguration:v10[11] interactive:v5];
  }
}

- (int64_t)switcherAxis
{
  return 1;
}

- (BOOL)isCircular
{
  return [(AMUIPosterSwitcherSettings *)self->_settings verticalSwitcherCircular];
}

- (double)spacing
{
  return 0.0;
}

- (void)switcher:(id)a3 updateItem:(id)a4 view:(id)a5 forPresentationProgress:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = [(AMUIPosterSwitcherSettings *)self->_settings exitingCardBehaviorScaleDownOnly];
  uint64_t v14 = [(AMUIPosterCategoryViewController *)self _unsettledSentinel];
  [(AMUICountingSentinel *)v14 increment];
  if (!self->_unsettledAssertion)
  {
    uint64_t v16 = [(AMUISwitcherViewController *)self->_posterSwitcherViewController acquireUnsettledAssertionForReason:@"categorySwitcherTransition"];
    unsettledAssertion = self->_unsettledAssertion;
    self->_unsettledAssertion = v16;

    objc_initWeak(&location, self);
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke;
    v41[3] = &unk_265224808;
    objc_copyWeak(&v42, &location);
    -[AMUICountingSentinel performWhenCountAtZero:]((uint64_t)v14, v41);
    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  double v18 = fabs(a6 + -0.5);
  double v19 = v18 + v18;
  if (v13) {
    double v20 = a6;
  }
  else {
    double v20 = v19;
  }
  id v21 = self->_settings;
  id location = 0;
  double v40 = 0.0;
  [(AMUIPosterSwitcherSettings *)v21 verticalScaleDampingRatio];
  double v23 = v22;
  [(AMUIPosterSwitcherSettings *)v21 verticalScaleResponse];
  AMUIConvertSpringDampingRatioAndResponseToTensionAndFriction((double *)&location, &v40, v23, v24);
  id v25 = (void *)MEMORY[0x263F1CB60];
  id v26 = location;
  double v27 = v40;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_2;
  v34[3] = &unk_265225240;
  double v35 = v21;
  id v36 = v12;
  id v37 = v11;
  double v38 = v20;
  double v39 = a6;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_3;
  v32[3] = &unk_265224A28;
  id v33 = v14;
  id v28 = v14;
  id v29 = v11;
  id v30 = v12;
  double v31 = v21;
  [v25 _animateUsingSpringWithTension:1 friction:v34 interactive:v32 animations:*(double *)&v26 completion:v27];
}

void __85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    [WeakRetained[131] invalidate];
    id v2 = v3[131];
    v3[131] = 0;

    WeakRetained = v3;
  }
}

void __85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) verticalExitingCardTargetScale];
  BSFloatByLinearlyInterpolatingFloats();
  id v2 = *(void **)(a1 + 40);
  CGAffineTransformMakeScale(&v12, v3, v3);
  [v2 setTransform:&v12];
  id v4 = *(void **)(a1 + 48);
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = v7;

  uint64_t v9 = -[AMUIPosterCategorySwitcherItem posterView](v8);
  id v10 = v9;
  if (!v9) {
    id v10 = *(void **)(a1 + 40);
  }
  id v11 = v10;

  [*(id *)(a1 + 32) exitingCardTargetOpacity];
  BSFloatByLinearlyInterpolatingFloats();
  objc_msgSend(v11, "setAlpha:");
}

void *__85__AMUIPosterCategoryViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_3(uint64_t a1, const char *a2)
{
  return [(AMUICountingSentinel *)*(void **)(a1 + 32) decrement];
}

- (void)posterCategorySwitcherItem:(id)a3 setChromeVisibility:(BOOL)a4 withAnimationSettings:(id)a5 animationFence:(id)a6
{
}

- (id)posterCategorySwitcherItemPrototypeSettings:(id)a3
{
  return self->_settings;
}

- (id)posterCategorySwitcherItemRequestInstanceIdentifier:(id)a3 preferring:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  availableInstanceIdentifiers = self->_availableInstanceIdentifiers;
  if (availableInstanceIdentifiers)
  {
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = +[AMUIPosterViewController suggestedInstanceIdentifiers];
    id v10 = (NSMutableArray *)[v9 mutableCopy];
    id v11 = self->_availableInstanceIdentifiers;
    self->_availableInstanceIdentifiers = v10;

    availableInstanceIdentifiers = self->_availableInstanceIdentifiers;
    if (!v7) {
      goto LABEL_8;
    }
  }
  if ([(NSMutableArray *)availableInstanceIdentifiers containsObject:v7])
  {
    id v12 = v7;
    [(NSMutableArray *)self->_availableInstanceIdentifiers removeObject:v12];
    goto LABEL_10;
  }
  availableInstanceIdentifiers = self->_availableInstanceIdentifiers;
LABEL_8:
  id v12 = [(NSMutableArray *)availableInstanceIdentifiers lastObject];
  [(NSMutableArray *)self->_availableInstanceIdentifiers removeLastObject];
  if (!v12)
  {
    id v12 = [MEMORY[0x263F08C38] UUID];
  }
LABEL_10:

  return v12;
}

- (void)posterCategorySwitcherItem:(id)a3 relinquishInstanceIdentifier:(id)a4
{
  id v5 = a4;
  availableInstanceIdentifiers = self->_availableInstanceIdentifiers;
  id v10 = v5;
  if (!availableInstanceIdentifiers)
  {
    id v7 = +[AMUIPosterViewController suggestedInstanceIdentifiers];
    uint64_t v8 = (NSMutableArray *)[v7 mutableCopy];
    uint64_t v9 = self->_availableInstanceIdentifiers;
    self->_availableInstanceIdentifiers = v8;

    id v5 = v10;
    availableInstanceIdentifiers = self->_availableInstanceIdentifiers;
  }
  [(NSMutableArray *)availableInstanceIdentifiers addObject:v5];
}

- (BOOL)posterCategorySwitcherItemIsAuthenticated:(id)a3
{
  CGFloat v3 = self;
  id v4 = [(AMUIPosterCategoryViewController *)self delegate];
  LOBYTE(v3) = [v4 posterCategoryViewControllerIsAuthenticated:v3];

  return (char)v3;
}

- (void)posterCategorySwitcherItem:(id)a3 didRequestInlineAuthenticationWithUnlockDestination:(id)a4
{
}

- (BOOL)posterCategorySwitcherItemHasInlineAuthenticated:(id)a3
{
  CGFloat v3 = self;
  id v4 = [(AMUIPosterCategoryViewController *)self delegate];
  LOBYTE(v3) = [v4 posterCategoryViewControllerHasInlineAuthenticated:v3];

  return (char)v3;
}

- (id)createUnlockRequestForViewController:(id)a3
{
  id v4 = [(AMUIPosterCategoryViewController *)self delegate];
  id v5 = [v4 createUnlockRequestForViewController:self];

  return v5;
}

- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(AMUIPosterCategoryViewController *)self delegate];
  [v9 requestUnlockForViewController:self withRequest:v8 completion:v7];
}

- (void)viewControllerWillBeginConfiguration:(id)a3
{
  id v4 = [(AMUIPosterCategoryViewController *)self delegate];
  [v4 viewControllerWillBeginConfiguration:self];
}

- (void)viewControllerWillEndConfiguration:(id)a3
{
  id v4 = [(AMUIPosterCategoryViewController *)self delegate];
  [v4 viewControllerWillEndConfiguration:self];
}

- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4
{
  id v5 = a4;
  id v6 = [(AMUIPosterCategoryViewController *)self delegate];
  [v6 viewController:self didUpdateActiveConfigurationMetadata:v5];
}

- (id)widgetHostManagerForViewController:(id)a3
{
  id v4 = [(AMUIPosterCategoryViewController *)self delegate];
  id v5 = [v4 widgetHostManagerForViewController:self];

  return v5;
}

- (id)ambientDefaultsForViewController:(id)a3
{
  id v4 = [(AMUIPosterCategoryViewController *)self delegate];
  id v5 = [v4 ambientDefaultsForViewController:self];

  return v5;
}

- (id)defaultWidgetDescriptorStacksForViewController:(id)a3
{
  id v4 = [(AMUIPosterCategoryViewController *)self delegate];
  id v5 = [v4 defaultWidgetDescriptorStacksForViewController:self];

  return v5;
}

- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(AMUIPosterCategoryViewController *)self delegate];
  [v5 viewControllerWillBeginShowingTemporaryOverlay:v4];
}

- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(AMUIPosterCategoryViewController *)self delegate];
  [v5 viewControllerWillEndShowingTemporaryOverlay:v4];
}

- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMUIPosterCategoryViewController *)self delegate];
  char v9 = [v8 viewController:v7 isApplicationVisibleWithBundleIdentifier:v6];

  return v9;
}

- (id)_currentAppearanceTransitionCoordinator
{
  if ([(AMUIDataLayerViewController *)self->_dataLayerViewController currentDataLayout] == 1)
  {
    photosCoordinator = self->_photosCoordinator;
    if (!photosCoordinator)
    {
      id v4 = objc_alloc_init(AMUIPosterPhotosAppearanceTransitionCoordinator);
      id v5 = self->_photosCoordinator;
      self->_photosCoordinator = &v4->super;

      photosCoordinator = self->_photosCoordinator;
    }
    id v6 = photosCoordinator;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_unsettledSentinel
{
  lazy_unsettledSentinel = self->_lazy_unsettledSentinel;
  if (!lazy_unsettledSentinel)
  {
    id v4 = objc_alloc_init(AMUICountingSentinel);
    id v5 = self->_lazy_unsettledSentinel;
    self->_lazy_unsettledSentinel = v4;

    lazy_unsettledSentinel = self->_lazy_unsettledSentinel;
  }

  return lazy_unsettledSentinel;
}

- (void)authenticationViewController:(id)a3 didAuthenticateWithSuccess:(BOOL)a4
{
  if (a4)
  {
    id v5 = [(AMUIPosterCategoryViewController *)self delegate];
    [v5 posterCategoryViewControllerDidSuccessfulyCompleteInlineAuthentication:self];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __92__AMUIPosterCategoryViewController_authenticationViewController_didAuthenticateWithSuccess___block_invoke;
    v7[3] = &unk_265224858;
    id v8 = v5;
    char v9 = self;
    id v6 = v5;
    [(AMUIPosterCategoryViewController *)self _dismissInlineAuthenticationViewAnimated:1 completion:v7];
  }
}

uint64_t __92__AMUIPosterCategoryViewController_authenticationViewController_didAuthenticateWithSuccess___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) posterCategoryViewController:*(void *)(a1 + 40) didSetPasscodeVisible:0];
}

- (void)authenticationViewController:(id)a3 setDidSetPasscodeVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AMUIPosterCategoryViewController *)self delegate];
  [v6 posterCategoryViewController:self didSetPasscodeVisible:v4];
}

- (void)authenticationViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AMUIPosterCategoryViewController *)self delegate];
  [v6 posterCategoryViewController:self didSetBiometricAuthenticationDisabled:v4];
}

- (BOOL)authenticationViewControllerWantsBiometricAuthenticationBlocked:(id)a3
{
  CGFloat v3 = self;
  BOOL v4 = [(AMUIPosterCategoryViewController *)self delegate];
  LOBYTE(v3) = [v4 posterCategoryViewController:v3 wantsBiometricAuthenticationBlockedForDeepUserInteraction:0];

  return (char)v3;
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (AMUIPosterCategoryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIPosterCategoryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_unsettledAssertion, 0);
  objc_storeStrong((id *)&self->_lazy_unsettledSentinel, 0);
  objc_storeStrong((id *)&self->_photosCoordinator, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_availableInstanceIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentWrapperView, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_dataLayerViewController, 0);
  objc_storeStrong((id *)&self->_posterSwitcherViewController, 0);

  objc_storeStrong((id *)&self->_inlineAuthenticationViewController, 0);
}

@end