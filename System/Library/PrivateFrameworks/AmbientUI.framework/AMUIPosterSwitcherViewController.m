@interface AMUIPosterSwitcherViewController
- (AMUIDateProviding)dateProvider;
- (AMUIPosterSwitcherViewControllerDelegate)delegate;
- (BOOL)_canShowWhileLocked;
- (BOOL)handleDismiss;
- (BOOL)isCircular;
- (BOOL)isSwitchingEnabled;
- (BOOL)posterCategoryViewController:(id)a3 wantsBiometricAuthenticationBlockedForDeepUserInteraction:(BOOL)a4;
- (BOOL)posterCategoryViewControllerHasInlineAuthenticated:(id)a3;
- (BOOL)posterCategoryViewControllerIsAuthenticated:(id)a3;
- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4;
- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4;
- (NSArray)configurations;
- (NSDictionary)activeConfigurationMetadata;
- (PRSPosterConfiguration)mostVisibleConfiguration;
- (UIView)backgroundView;
- (UIView)contentView;
- (double)spacing;
- (id)_switcherItemForConfiguration:(id)a3;
- (id)_unsettledSentinel;
- (id)ambientDefaultsForViewController:(id)a3;
- (id)createUnlockRequestForViewController:(id)a3;
- (id)defaultWidgetDescriptorStacksForViewController:(id)a3;
- (id)posterCategoryViewControllerAuthenticationHandler:(id)a3;
- (id)switcher:(id)a3 itemAtIndex:(int64_t)a4;
- (id)widgetHostManagerForViewController:(id)a3;
- (int64_t)switcherAxis;
- (int64_t)switcherNumberOfItems:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)noteAmbientViewControllingDelegateDidUpdate;
- (void)posterCategoryViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4;
- (void)posterCategoryViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4;
- (void)posterCategoryViewController:(id)a3 didSetPasscodeVisible:(BOOL)a4;
- (void)posterCategoryViewController:(id)a3 didSettleOnConfiguration:(id)a4 interactive:(BOOL)a5;
- (void)posterCategoryViewControllerDidSuccessfulyCompleteInlineAuthentication:(id)a3;
- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)setConfigurations:(id)a3;
- (void)setDateProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSwitchingEnabled:(BOOL)a3;
- (void)switcher:(id)a3 didSettleOnItem:(id)a4 interactive:(BOOL)a5;
- (void)switcher:(id)a3 transitionDidBegin:(id)a4;
- (void)switcher:(id)a3 transitionDidEnd:(id)a4;
- (void)switcher:(id)a3 transitioningFromItem:(id)a4 toItem:(id)a5 progress:(double)a6;
- (void)switcher:(id)a3 updateItem:(id)a4 view:(id)a5 forPresentationProgress:(double)a6;
- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4;
- (void)viewControllerWillBeginConfiguration:(id)a3;
- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3;
- (void)viewControllerWillEndConfiguration:(id)a3;
- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3;
- (void)viewDidLoad;
@end

@implementation AMUIPosterSwitcherViewController

- (void)dealloc
{
  [(AMUIPosterSwitcherViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterSwitcherViewController;
  [(AMUIPosterSwitcherViewController *)&v3 dealloc];
}

- (void)setConfigurations:(id)a3
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v72 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v91 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        v9 = [v8 providerBundleIdentifier];
        char v10 = [v9 isEqual:@"com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"];

        if (v10)
        {
          id v89 = 0;
          v11 = objc_msgSend(v8, "pr_loadAmbientConfigurationWithError:", &v89);
          id v12 = v89;
          if (v11)
          {
            if (([v11 hidden] & 1) == 0) {
              [v72 addObject:v8];
            }
          }
          else
          {
            v13 = AMUILogSwitcher();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v99 = v8;
              __int16 v100 = 2112;
              id v101 = v12;
              _os_log_error_impl(&dword_247837000, v13, OS_LOG_TYPE_ERROR, "Failed to load ambient configuration from configuration %@ with error %@", buf, 0x16u);
            }
          }
        }
        else
        {
          [v72 addObject:v8];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v90 objects:v102 count:16];
    }
    while (v5);
  }

  v14 = (NSArray *)[v72 copy];
  configurations = self->_configurations;
  self->_configurations = v14;

  id v16 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v17 = self->_configurations;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v85 objects:v97 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v86;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v86 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v85 + 1) + 8 * j) providerBundleIdentifier];
        [v16 addObject:v22];
      }
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v85 objects:v97 count:16];
    }
    while (v19);
  }

  v23 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v24 = self->_configurations;
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v81 objects:v96 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v82;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v82 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v81 + 1) + 8 * k);
        v30 = [v29 providerBundleIdentifier];
        v31 = [v23 objectForKeyedSubscript:v30];
        if (!v31)
        {
          v31 = [MEMORY[0x263EFF980] array];
          [v23 setObject:v31 forKeyedSubscript:v30];
        }
        [v31 addObject:v29];
      }
      uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v81 objects:v96 count:16];
    }
    while (v26);
  }

  v32 = self;
  uint64_t v33 = [(NSArray *)self->_items bs_map:&__block_literal_global_2];
  v34 = (void *)v33;
  v35 = (NSArray *)MEMORY[0x263EFFA68];
  if (v33) {
    v36 = (void *)v33;
  }
  else {
    v36 = (void *)MEMORY[0x263EFFA68];
  }
  id v37 = v36;

  v38 = [v16 array];
  v39 = [v38 differenceFromArray:v37];

  v68 = v39;
  if ([v39 hasChanges])
  {
    id v66 = v37;
    v40 = [MEMORY[0x263EFF9A0] dictionary];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v41 = self->_items;
    uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v77 objects:v95 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v78;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v78 != v44) {
            objc_enumerationMutation(v41);
          }
          uint64_t v46 = *(void *)(*((void *)&v77 + 1) + 8 * v45);
          if (v46) {
            uint64_t v47 = *(void *)(v46 + 32);
          }
          else {
            uint64_t v47 = 0;
          }
          [v40 setObject:v46 forKeyedSubscript:v47];
          ++v45;
        }
        while (v43 != v45);
        uint64_t v48 = [(NSArray *)v41 countByEnumeratingWithState:&v77 objects:v95 count:16];
        uint64_t v43 = v48;
      }
      while (v48);
    }
    id v67 = v16;

    if (self->_items) {
      items = self->_items;
    }
    else {
      items = v35;
    }
    v50 = (void *)[(NSArray *)items mutableCopy];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v70 = v68;
    uint64_t v51 = [v70 countByEnumeratingWithState:&v73 objects:v94 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v74;
      do
      {
        for (uint64_t m = 0; m != v52; ++m)
        {
          if (*(void *)v74 != v53) {
            objc_enumerationMutation(v70);
          }
          v55 = *(void **)(*((void *)&v73 + 1) + 8 * m);
          uint64_t v56 = [v55 changeType];
          if (v56 == 1)
          {
            objc_msgSend(v50, "removeObjectAtIndex:", objc_msgSend(v55, "index"));
          }
          else if (!v56)
          {
            v57 = [v55 object];
            v58 = [v23 objectForKeyedSubscript:v57];
            v59 = [v40 objectForKeyedSubscript:v57];
            if (!v59)
            {
              v59 = +[AMUIPosterExtensionSwitcherItem itemWithProviderBundleIdentifier:configurations:posterCategoryViewControllerDelegate:dateProvider:]((uint64_t)AMUIPosterExtensionSwitcherItem, v57, v58, self, self->_dateProvider);
            }
            objc_msgSend(v50, "insertObject:atIndex:", v59, objc_msgSend(v55, "index"));
          }
        }
        uint64_t v52 = [v70 countByEnumeratingWithState:&v73 objects:v94 count:16];
      }
      while (v52);
    }

    v60 = (NSArray *)[v50 copy];
    v32 = self;
    v61 = self->_items;
    self->_items = v60;

    [(AMUISwitcherViewController *)self->_extensionSwitcherViewController reload];
    id v16 = v67;
    id v37 = v66;
  }
  if ([(NSArray *)v32->_items count])
  {
    unint64_t v62 = 0;
    do
    {
      v63 = [v16 objectAtIndexedSubscript:v62];
      v64 = [(NSArray *)v32->_items objectAtIndexedSubscript:v62];
      v65 = [v23 objectForKeyedSubscript:v63];
      -[AMUIPosterExtensionSwitcherItem setConfigurations:]((uint64_t)v64, v65);

      ++v62;
    }
    while (v62 < [(NSArray *)v32->_items count]);
  }
}

id __54__AMUIPosterSwitcherViewController_setConfigurations___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return *(id *)(a2 + 32);
  }
  else {
    return 0;
  }
}

- (UIView)contentView
{
  v2 = [(AMUISwitcherViewController *)self->_extensionSwitcherViewController visibleItems];
  if ([v2 count] == 1)
  {
    id v3 = [v2 firstObject];
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    v8 = v6;

    if (v8)
    {
      v9 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v8);
      v7 = [v9 contentView];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return (UIView *)v7;
}

- (UIView)backgroundView
{
  id v3 = [(AMUIPosterSwitcherViewController *)self view];
  uint64_t v4 = [(AMUISwitcherViewController *)self->_extensionSwitcherViewController visibleItems];
  if ([v4 count] == 1)
  {
    id v5 = [v4 firstObject];
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    if (v9)
    {
      char v10 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v9);
      uint64_t v11 = [v10 backgroundView];

      id v3 = (void *)v11;
    }
  }

  return (UIView *)v3;
}

- (PRSPosterConfiguration)mostVisibleConfiguration
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [(AMUISwitcherViewController *)self->_extensionSwitcherViewController visibleItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        char v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [(AMUISwitcherViewController *)self->_extensionSwitcherViewController presentationProgressForItem:v10];
        if (v11 > v8)
        {
          double v12 = v11;
          id v13 = v10;

          double v8 = v12;
          uint64_t v6 = v13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  v14 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController]((id *)v6);
  v15 = [v14 mostVisibleConfiguration];

  return (PRSPosterConfiguration *)v15;
}

- (BOOL)isSwitchingEnabled
{
  return [(AMUISwitcherViewController *)self->_extensionSwitcherViewController isScrollEnabled];
}

- (void)setSwitchingEnabled:(BOOL)a3
{
}

- (void)setDateProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_dateProvider = (void **)&self->_dateProvider;
  objc_storeStrong((id *)&self->_dateProvider, a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_items;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[AMUIPosterExtensionSwitcherItem setDateProvider:](*(void *)(*((void *)&v12 + 1) + 8 * v11++), *p_dateProvider);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)AMUIPosterSwitcherViewController;
  [(AMUIPosterSwitcherViewController *)&v17 viewDidLoad];
  id v3 = +[AMUIPosterSwitcherDomain rootSettings];
  settings = self->_settings;
  self->_settings = v3;

  id v5 = [(AMUIPosterSwitcherViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  long long v14 = [[AMUISwitcherViewController alloc] initWithLayout:self];
  extensionSwitcherViewController = self->_extensionSwitcherViewController;
  self->_extensionSwitcherViewController = v14;

  [(AMUISwitcherViewController *)self->_extensionSwitcherViewController setDataSource:self];
  [(AMUISwitcherViewController *)self->_extensionSwitcherViewController setDelegate:self];
  id v16 = [(AMUISwitcherViewController *)self->_extensionSwitcherViewController view];
  objc_msgSend(v16, "setFrame:", v7, v9, v11, v13);
  [v16 setAutoresizingMask:18];
  [(AMUIPosterSwitcherViewController *)self bs_addChildViewController:self->_extensionSwitcherViewController];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)updatePosterConfiguration:(id)a3 withAnimationSettings:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(AMUIPosterSwitcherViewController *)self loadViewIfNeeded];
  if ([(AMUISwitcherViewController *)self->_extensionSwitcherViewController isScrollingInteractively])
  {
    double v8 = AMUILogSwitcher();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_12:
      BOOL v15 = 0;
      goto LABEL_13;
    }
    double v9 = [v6 serverUUID];
    int v17 = 138543362;
    long long v18 = v9;
    _os_log_impl(&dword_247837000, v8, OS_LOG_TYPE_INFO, "horizontal switcher ignoring update to %{public}@ due to interactive scroll", (uint8_t *)&v17, 0xCu);
LABEL_11:

    goto LABEL_12;
  }
  double v8 = [(AMUIPosterSwitcherViewController *)self _switcherItemForConfiguration:v6];
  if (!v8)
  {
    double v9 = AMUILogSwitcher();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AMUIPosterSwitcherViewController updatePosterConfiguration:withAnimationSettings:](v6, v9);
    }
    goto LABEL_11;
  }
  double v10 = [(AMUISwitcherViewController *)self->_extensionSwitcherViewController visibleItems];
  int v11 = [v10 containsObject:v8];

  double v12 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController]((id *)&v8->isa);
  double v13 = v12;
  if (v11) {
    id v14 = v7;
  }
  else {
    id v14 = 0;
  }
  [v12 updatePosterConfiguration:v6 withAnimationSettings:v14];

  [(AMUISwitcherViewController *)self->_extensionSwitcherViewController scrollToItem:v8 animated:v7 != 0];
  BOOL v15 = 1;
LABEL_13:

  return v15;
}

- (void)invalidate
{
  [(AMUIPosterSwitcherViewController *)self setConfigurations:MEMORY[0x263EFFA68]];
  unsettledAssertion = self->_unsettledAssertion;

  [(BSInvalidatable *)unsettledAssertion invalidate];
}

- (NSDictionary)activeConfigurationMetadata
{
  v2 = [(AMUISwitcherViewController *)self->_extensionSwitcherViewController visibleItems];
  if ([v2 count] == 1)
  {
    id v3 = [v2 firstObject];
    uint64_t v4 = objc_opt_class();
    id v5 = v3;
    if (v4)
    {
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    double v8 = v6;

    if (v8)
    {
      double v9 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v8);
      id v7 = [v9 activeConfigurationMetadata];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return (NSDictionary *)v7;
}

- (void)noteAmbientViewControllingDelegateDidUpdate
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_items;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](*(id **)(*((void *)&v8 + 1) + 8 * v6));
        objc_msgSend(v7, "noteAmbientViewControllingDelegateDidUpdate", (void)v8);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)handleDismiss
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_items;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v8 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](*(id **)(*((void *)&v10 + 1) + 8 * i));
        v5 |= objc_msgSend(v8, "handleDismiss", (void)v10);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (int64_t)switcherNumberOfItems:(id)a3
{
  return [(NSArray *)self->_items count];
}

- (id)switcher:(id)a3 itemAtIndex:(int64_t)a4
{
  return [(NSArray *)self->_items objectAtIndexedSubscript:a4];
}

- (void)switcher:(id)a3 didSettleOnItem:(id)a4 interactive:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  long long v8 = [(AMUIPosterSwitcherViewController *)self delegate];
  uint64_t v9 = objc_opt_class();
  id v15 = v7;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      long long v10 = v15;
    }
    else {
      long long v10 = 0;
    }
  }
  else
  {
    long long v10 = 0;
  }
  long long v11 = v10;

  long long v12 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v11);

  long long v13 = [v12 visibleConfigurations];

  if ([v13 count] == 1)
  {
    id v14 = [v13 firstObject];
    [v8 posterSwitcherViewController:self didSettleOnConfiguration:v14 interactive:v5];
  }
}

- (void)switcher:(id)a3 transitionDidBegin:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v9 = self->_items;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v40;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](*(id **)(*((void *)&v39 + 1) + 8 * v12));
        id v14 = [v13 cancelTouchesForCurrentEventInHostedContent];
        if (v14) {
          [v8 addObject:v14];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v10);
  }

  [v7 setUserInfoObject:v8 forKey:@"cancelTouchesAssertions"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v16 = [v7 fromItem];
  uint64_t v17 = objc_opt_class();
  id v18 = v16;
  if (v17)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  long long v20 = v19;

  v21 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v20);
  uint64_t v22 = [v21 mostVisibleConfiguration];

  if (v22) {
    objc_msgSend(WeakRetained, "posterSwitcherViewController:willSwitchFromConfiguration:interactive:", self, v22, objc_msgSend(v7, "isInteractive"));
  }
  if ([v7 isInteractive])
  {
    v23 = [v7 toItem];
    uint64_t v24 = objc_opt_class();
    id v25 = v23;
    if (v24)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = 0;
      }
    }
    else
    {
      uint64_t v26 = 0;
    }
    uint64_t v27 = v26;

    if (v27)
    {
      id v28 = v27[4];
      v29 = [WeakRetained posterSwitcherViewController:self requestsLastSelectedConfigurationUUIDForProviderBundleIdentifier:v28];

      if (v29)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        uint64_t v44 = __Block_byref_object_copy_;
        uint64_t v45 = __Block_byref_object_dispose_;
        id v46 = 0;
        id v30 = v27[2];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __64__AMUIPosterSwitcherViewController_switcher_transitionDidBegin___block_invoke;
        v36[3] = &unk_2652249D8;
        id v37 = v29;
        v38 = buf;
        [v30 enumerateObjectsUsingBlock:v36];

        id v31 = *(id *)(*(void *)&buf[8] + 40);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        id v31 = 0;
      }
    }
    else
    {
      id v31 = 0;
    }
    v32 = AMUILogSwitcher();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      if (v27) {
        id v33 = v27[4];
      }
      else {
        id v33 = 0;
      }
      id v34 = v33;
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_247837000, v32, OS_LOG_TYPE_DEFAULT, "Interactive transition beginning to provider %@. Pre-selecting configuration %@", buf, 0x16u);
    }
    if (v31)
    {
      v35 = -[AMUIPosterExtensionSwitcherItem posterCategoryViewController](v27);
      [v35 updatePosterConfiguration:v31 withAnimationSettings:0];
    }
  }
}

void __64__AMUIPosterSwitcherViewController_switcher_transitionDidBegin___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 serverUUID];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)switcher:(id)a3 transitioningFromItem:(id)a4 toItem:(id)a5 progress:(double)a6
{
  id v8 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v8 posterSwitcherViewController:self isTransitioningSettled:a6 == 1.0];
}

- (void)switcher:(id)a3 transitionDidEnd:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a4 userInfoObjectForKey:@"cancelTouchesAssertions"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) invalidate];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)posterCategoryViewController:(id)a3 didSettleOnConfiguration:(id)a4 interactive:(BOOL)a5
{
  BOOL v5 = a5;
  v13[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [(AMUIPosterSwitcherViewController *)self _switcherItemForConfiguration:v7];
  long long v9 = [(AMUISwitcherViewController *)self->_extensionSwitcherViewController visibleItems];
  v13[0] = v8;
  long long v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  int v11 = BSEqualArrays();

  if (v11)
  {
    long long v12 = [(AMUIPosterSwitcherViewController *)self delegate];
    [v12 posterSwitcherViewController:self didSettleOnConfiguration:v7 interactive:v5];
  }
}

- (id)createUnlockRequestForViewController:(id)a3
{
  uint64_t v4 = [(AMUIPosterSwitcherViewController *)self delegate];
  BOOL v5 = [v4 createUnlockRequestForViewController:self];

  return v5;
}

- (void)requestUnlockForViewController:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v9 requestUnlockForViewController:self withRequest:v8 completion:v7];
}

- (void)viewControllerWillBeginConfiguration:(id)a3
{
  id v4 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v4 viewControllerWillBeginConfiguration:self];
}

- (void)viewControllerWillEndConfiguration:(id)a3
{
  id v4 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v4 viewControllerWillEndConfiguration:self];
}

- (void)viewController:(id)a3 didUpdateActiveConfigurationMetadata:(id)a4
{
  id v5 = a4;
  id v6 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v6 viewController:self didUpdateActiveConfigurationMetadata:v5];
}

- (void)viewControllerWillBeginShowingTemporaryOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v5 viewControllerWillBeginShowingTemporaryOverlay:v4];
}

- (void)viewControllerWillEndShowingTemporaryOverlay:(id)a3
{
  id v4 = a3;
  id v5 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v5 viewControllerWillEndShowingTemporaryOverlay:v4];
}

- (id)widgetHostManagerForViewController:(id)a3
{
  id v4 = [(AMUIPosterSwitcherViewController *)self delegate];
  id v5 = [v4 widgetHostManagerForViewController:self];

  return v5;
}

- (id)ambientDefaultsForViewController:(id)a3
{
  id v4 = [(AMUIPosterSwitcherViewController *)self delegate];
  id v5 = [v4 ambientDefaultsForViewController:self];

  return v5;
}

- (BOOL)viewController:(id)a3 isApplicationVisibleWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMUIPosterSwitcherViewController *)self delegate];
  char v9 = [v8 viewController:v7 isApplicationVisibleWithBundleIdentifier:v6];

  return v9;
}

- (id)defaultWidgetDescriptorStacksForViewController:(id)a3
{
  id v4 = [(AMUIPosterSwitcherViewController *)self delegate];
  id v5 = [v4 defaultWidgetDescriptorStacksForViewController:self];

  return v5;
}

- (BOOL)posterCategoryViewControllerIsAuthenticated:(id)a3
{
  uint64_t v3 = self;
  id v4 = [(AMUIPosterSwitcherViewController *)self delegate];
  LOBYTE(v3) = [v4 posterSwitcherViewControllerIsAuthenticated:v3];

  return (char)v3;
}

- (id)posterCategoryViewControllerAuthenticationHandler:(id)a3
{
  id v4 = [(AMUIPosterSwitcherViewController *)self delegate];
  id v5 = [v4 posterSwitcherViewControllerAuthenticationHandler:self];

  return v5;
}

- (void)posterCategoryViewController:(id)a3 didSetPasscodeVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v6 posterSwitcherViewController:self didSetPasscodeVisible:v4];
}

- (void)posterCategoryViewController:(id)a3 didSetInlineAuthenticationViewVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v6 posterSwitcherViewController:self didSetInlineAuthenticationViewVisible:v4];
}

- (void)posterCategoryViewControllerDidSuccessfulyCompleteInlineAuthentication:(id)a3
{
  id v4 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v4 posterSwitcherViewControllerDidSuccessfullyCompleteInlineAuthentication:self];
}

- (BOOL)posterCategoryViewControllerHasInlineAuthenticated:(id)a3
{
  uint64_t v3 = self;
  id v4 = [(AMUIPosterSwitcherViewController *)self delegate];
  LOBYTE(v3) = [v4 posterSwitcherViewControllerHasInlineAuthenticated:v3];

  return (char)v3;
}

- (void)posterCategoryViewController:(id)a3 didSetBiometricAuthenticationDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AMUIPosterSwitcherViewController *)self delegate];
  [v6 posterSwitcherViewController:self didSetBiometricAuthenticationDisabled:v4];
}

- (BOOL)posterCategoryViewController:(id)a3 wantsBiometricAuthenticationBlockedForDeepUserInteraction:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = [(AMUIPosterSwitcherViewController *)self delegate];
  LOBYTE(v4) = [v6 posterSwitcherViewController:self wantsBiometricAuthenticationBlockedForDeepUserInteraction:v4];

  return v4;
}

- (int64_t)switcherAxis
{
  return 0;
}

- (BOOL)isCircular
{
  return [(AMUIPosterSwitcherSettings *)self->_settings horizontalSwitcherCircular];
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
  uint64_t v14 = [(AMUIPosterSwitcherViewController *)self _unsettledSentinel];
  [(AMUICountingSentinel *)v14 increment];
  if (!self->_unsettledAssertion)
  {
    id v16 = [(AMUISwitcherViewController *)self->_extensionSwitcherViewController acquireUnsettledAssertionForReason:@"posterExtensionSwitcherTransition"];
    unsettledAssertion = self->_unsettledAssertion;
    self->_unsettledAssertion = v16;

    objc_initWeak(&location, self);
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke;
    v39[3] = &unk_265224808;
    objc_copyWeak(&v40, &location);
    -[AMUICountingSentinel performWhenCountAtZero:]((uint64_t)v14, v39);
    objc_destroyWeak(&v40);
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
  v21 = self->_settings;
  id location = 0;
  double v38 = 0.0;
  [(AMUIPosterSwitcherSettings *)v21 horizontalScaleDampingRatio];
  double v23 = v22;
  [(AMUIPosterSwitcherSettings *)v21 horizontalScaleResponse];
  AMUIConvertSpringDampingRatioAndResponseToTensionAndFriction((double *)&location, &v38, v23, v24);
  id v25 = (void *)MEMORY[0x263F1CB60];
  id v26 = location;
  double v27 = v38;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_2;
  v33[3] = &unk_265224A00;
  id v34 = v21;
  id v35 = v12;
  double v36 = v20;
  double v37 = a6;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_3;
  v31[3] = &unk_265224A28;
  id v32 = v14;
  id v28 = v14;
  id v29 = v12;
  id v30 = v21;
  [v25 _animateUsingSpringWithTension:1 friction:v33 interactive:v31 animations:*(double *)&v26 completion:v27];
}

void __85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[126] invalidate];
    id v2 = v3[126];
    v3[126] = 0;

    id WeakRetained = v3;
  }
}

uint64_t __85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) horizontalExitingCardTargetScale];
  BSFloatByLinearlyInterpolatingFloats();
  id v2 = *(void **)(a1 + 40);
  CGAffineTransformMakeScale(&v5, v3, v3);
  [v2 setTransform:&v5];
  [*(id *)(a1 + 32) exitingCardTargetOpacity];
  BSFloatByLinearlyInterpolatingFloats();
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:");
}

void *__85__AMUIPosterSwitcherViewController_switcher_updateItem_view_forPresentationProgress___block_invoke_3(uint64_t a1, const char *a2)
{
  return [(AMUICountingSentinel *)*(void **)(a1 + 32) decrement];
}

- (id)_switcherItemForConfiguration:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  CGAffineTransform v5 = self->_items;
  id v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v8);
        if (v9) {
          id v10 = (void *)v9[2];
        }
        else {
          id v10 = 0;
        }
        if (objc_msgSend(v10, "containsObject:", v4, (void)v13))
        {
          id v6 = v9;
          goto LABEL_15;
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      uint64_t v11 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      id v6 = (void *)v11;
    }
    while (v11);
  }
LABEL_15:

  return v6;
}

- (id)_unsettledSentinel
{
  lazy_unsettledSentinel = self->_lazy_unsettledSentinel;
  if (!lazy_unsettledSentinel)
  {
    id v4 = objc_alloc_init(AMUICountingSentinel);
    CGAffineTransform v5 = self->_lazy_unsettledSentinel;
    self->_lazy_unsettledSentinel = v4;

    lazy_unsettledSentinel = self->_lazy_unsettledSentinel;
  }

  return lazy_unsettledSentinel;
}

- (NSArray)configurations
{
  return self->_configurations;
}

- (AMUIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (AMUIPosterSwitcherViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMUIPosterSwitcherViewControllerDelegate *)WeakRetained;
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
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_extensionSwitcherViewController, 0);
}

- (void)updatePosterConfiguration:(void *)a1 withAnimationSettings:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = [a1 serverUUID];
  CGAffineTransform v5 = [a1 providerBundleIdentifier];
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  char v9 = v5;
  _os_log_error_impl(&dword_247837000, a2, OS_LOG_TYPE_ERROR, "failed to find configuration with UUID %{public}@ bundle ID %{public}@", (uint8_t *)&v6, 0x16u);
}

@end