@interface CPSTabBarViewController
- (BOOL)_isEligibleForNowPlayingButton;
- (BOOL)restoresFocusAfterTransition;
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (CPSTabBarViewController)initWithTabBarTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5;
- (CPSTemplateEnvironment)templateEnvironment;
- (CPSTemplateViewControllerDelegate)viewControllerDelegate;
- (CPTemplate)associatedTemplate;
- (CPTemplateDelegate)templateDelegate;
- (NAFuture)templateProviderFuture;
- (NSArray)tabBarButtons;
- (id)tabBarTemplate;
- (id)tabBarTemplateDelegate;
- (void)_cleanup;
- (void)_nowPlayingButtonTapped;
- (void)_updateNowPlayingButtonIfNeeded;
- (void)_updateTitle;
- (void)applicationDidBecomeNowPlayingApp:(BOOL)a3;
- (void)invalidate;
- (void)removeFromParentViewController;
- (void)setAssociatedTemplate:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)setTemplateDelegate:(id)a3;
- (void)setTemplateEnvironment:(id)a3;
- (void)setViewControllerDelegate:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)showNowPlayingButton:(BOOL)a3;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CPSTabBarViewController

- (CPSTabBarViewController)initWithTabBarTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  v5 = v17;
  v17 = 0;
  v13.receiver = v5;
  v13.super_class = (Class)CPSTabBarViewController;
  v12 = [(CPSTabBarViewController *)&v13 init];
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    objc_storeStrong((id *)&v17->_associatedTemplate, location[0]);
    objc_storeStrong((id *)&v17->_templateDelegate, v15);
    uint64_t v6 = objc_opt_new();
    templateProviderFuture = v17->_templateProviderFuture;
    v17->_templateProviderFuture = (NAFuture *)v6;

    objc_storeWeak((id *)&v17->_templateEnvironment, v14);
    [(CPSTabBarViewController *)v17 setDelegate:v17];
    if ([v14 canBecomeNowPlayingApp]) {
      [v14 addTemplateEnvironmentDelegate:v17];
    }
    if ([v14 isNowPlayingApp]) {
      [(CPSTabBarViewController *)v17 showNowPlayingButton:1];
    }
  }
  v9 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v9;
}

- (id)tabBarTemplate
{
  v3 = objc_opt_class();
  v4 = [(CPSTabBarViewController *)self associatedTemplate];
  id v5 = CPSSafeCast_6(v3, v4);

  return v5;
}

- (id)tabBarTemplateDelegate
{
  return [(CPSTabBarViewController *)self templateDelegate];
}

- (void)invalidate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v15 = self;
  location[1] = (id)a2;
  location[0] = CarPlaySupportGeneralLogging();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v15);
    _os_log_impl(&dword_22B689000, (os_log_t)location[0], v13, "Invalidating %@", v17, 0xCu);
  }
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15->_templateProviderFuture, 0);
  id v6 = (id)[(CPSTabBarViewController *)v15 viewControllers];
  id v12 = (id)[v6 copy];

  memset(__b, 0, sizeof(__b));
  id obj = v12;
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v8)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0;
    unint64_t v5 = v8;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(__b[1] + 8 * v4);
      id v9 = CPSSafeProtocolCast_1(&unk_26DF174A8, v11);
      [v9 invalidate];
      objc_storeStrong(&v9, 0);
      ++v4;
      if (v2 + 1 >= v5)
      {
        uint64_t v4 = 0;
        unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v12, 0);
}

- (void)viewDidLayoutSubviews
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSTabBarViewController;
  [(CPSTabBarViewController *)&v2 viewDidLayoutSubviews];
  [(CPSTabBarViewController *)v4 _updateNowPlayingButtonIfNeeded];
}

- (void)showNowPlayingButton:(BOOL)a3
{
  v32 = self;
  SEL v31 = a2;
  BOOL v30 = a3;
  id v17 = (id)[(CPSTabBarViewController *)self _accessoryView];
  BOOL v18 = 0;
  if (v17) {
    BOOL v18 = v30;
  }

  if (v18)
  {
    id location = CarPlaySupportGeneralLogging();
    os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      log = location;
      os_log_type_t type = v28;
      __os_log_helper_16_0_0(v27);
      _os_log_impl(&dword_22B689000, log, type, "Accessory View already set", v27, 2u);
    }
    objc_storeStrong(&location, 0);
  }
  else if (v30)
  {
    id v26 = CarPlaySupportGeneralLogging();
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v13 = v26;
      os_log_type_t v14 = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_impl(&dword_22B689000, v13, v14, "Showing Now Playing button in Tab Bar", v24, 2u);
    }
    objc_storeStrong(&v26, 0);
    id v7 = objc_alloc(MEMORY[0x263F31398]);
    id v10 = (id)[(CPSTabBarViewController *)v32 tabBar];
    [v10 bounds];
    CGRectGetHeight(v33);
    CGRectMake_1();
    double v19 = v3;
    double v20 = v4;
    double v21 = v5;
    double v22 = v6;
    id v9 = [(CPSTabBarViewController *)v32 templateEnvironment];
    uint64_t v8 = [(CPSTemplateEnvironment *)v9 bundleIdentifier];
    id v23 = (id)objc_msgSend(v7, "initWithFrame:bundleIdentifier:", v19, v20, v21, v22);

    id v11 = (id)[v23 nowPlayingButton];
    [v11 addTarget:v32 action:sel__nowPlayingButtonTapped forControlEvents:64];

    id v12 = (id)[v23 nowPlayingButton];
    [v12 setAccessibilityIdentifier:@"CPTabBarNowPlayingButton"];

    [(CPSTabBarViewController *)v32 _setAccessoryView:v23];
    objc_storeStrong(&v23, 0);
  }
  else
  {
    [(CPSTabBarViewController *)v32 _setAccessoryView:0];
  }
}

- (void)_nowPlayingButtonTapped
{
  double v3 = [(CPSTabBarViewController *)self templateEnvironment];
  objc_super v2 = [(CPSTemplateEnvironment *)v3 templateProvider];
  [(CPTemplateProviding *)v2 clientRequestNowPlayingTemplateAnimated:1];
}

- (NSArray)tabBarButtons
{
  v7[2] = self;
  v7[1] = (id)a2;
  id v3 = (id)[(CPSTabBarViewController *)self tabBar];
  v7[0] = (id)[v3 subviews];

  id v6 = (id)objc_msgSend(v7[0], "cps_filter:", &__block_literal_global_5);
  id v5 = (id)[v6 sortedArrayUsingComparator:&__block_literal_global_140];
  id v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(v7, 0);

  return (NSArray *)v4;
}

uint64_t __40__CPSTabBarViewController_tabBarButtons__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

uint64_t __40__CPSTabBarViewController_tabBarButtons__block_invoke_2(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  [location[0] frame];
  double MinX = CGRectGetMinX(v10);
  [v7 frame];
  double v5 = CGRectGetMinX(v11);
  if (MinX >= v5) {
    uint64_t v9 = MinX > v5;
  }
  else {
    uint64_t v9 = -1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (void)_updateTitle
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  double v19 = self;
  v18[1] = (id)a2;
  id v12 = objc_opt_class();
  id v13 = (id)[(CPSTabBarViewController *)v19 selectedViewController];
  v18[0] = CPSSafeCast_6(v12, v13);

  id v14 = (id)[v18[0] associatedTemplate];
  id location = (id)[v14 identifier];

  if (location)
  {
    memset(__b, 0, sizeof(__b));
    uint64_t v9 = [(CPSTabBarViewController *)v19 associatedTemplate];
    id obj = (id)[(CPTemplate *)v9 templates];

    uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
    if (v11)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0;
      unint64_t v8 = v11;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(id *)(__b[1] + 8 * v7);
        id v3 = (id)[v16 identifier];
        char v4 = [v3 isEqual:location];

        if (v4) {
          break;
        }
        ++v7;
        if (v5 + 1 >= v8)
        {
          uint64_t v7 = 0;
          unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v20 count:16];
          if (!v8) {
            goto LABEL_10;
          }
        }
      }
      id v2 = (id)[v16 backTitle];
      -[CPSTabBarViewController setTitle:](v19, "setTitle:");
    }
LABEL_10:
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v18, 0);
}

- (void)setSelectedIndex:(unint64_t)a3
{
  uint64_t v6 = self;
  SEL v5 = a2;
  unint64_t v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSTabBarViewController;
  [(CPSTabBarViewController *)&v3 setSelectedIndex:a3];
  [(CPSTabBarViewController *)v6 _updateTitle];
}

- (void)applicationDidBecomeNowPlayingApp:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __61__CPSTabBarViewController_applicationDidBecomeNowPlayingApp___block_invoke;
  unint64_t v8 = &unk_2648A4748;
  uint64_t v9 = v13;
  BOOL v10 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __61__CPSTabBarViewController_applicationDidBecomeNowPlayingApp___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isEligibleForNowPlayingButton]) {
    return [*(id *)(a1 + 32) showNowPlayingButton:*(unsigned char *)(a1 + 40) & 1];
  }
  else {
    return [*(id *)(a1 + 32) showNowPlayingButton:0];
  }
}

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  SEL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v4 = (id)[(CPSTabBarViewController *)v12 selectedViewController];
  BOOL v8 = v4 != v10;

  if (!v8)
  {
    int v5 = objc_opt_class();
    id v9 = CPSSafeCast_6(v5, v10);
    if (v9) {
      [v9 scrollToTop];
    }
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = (id)[v13 associatedTemplate];
    id v4 = (id)[v9 identifier];
    id v5 = v12;
    id v12 = v4;

    id v10 = (id)[(CPSTabBarViewController *)v15 navigationController];
    [v10 setNavigationBarHidden:1];
  }
  [(CPSTabBarViewController *)v15 _updateTitle];
  id v7 = [(CPSTabBarViewController *)v15 tabBarTemplateDelegate];
  BOOL v8 = 0;
  if ([v7 conformsToProtocol:&unk_26DF72840]) {
    BOOL v8 = v12 != 0;
  }

  if (v8)
  {
    id v6 = [(CPSTabBarViewController *)v15 tabBarTemplateDelegate];
    [v6 handleActionForControlIdentifier:v12];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)removeFromParentViewController
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSTabBarViewController;
  [(CPSTabBarViewController *)&v2 removeFromParentViewController];
  [(CPSTabBarViewController *)v4 _cleanup];
}

- (void)_cleanup
{
  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
  objc_super v2 = [(CPSTabBarViewController *)self viewControllerDelegate];
  [(CPSTemplateViewControllerDelegate *)v2 templateViewControllerDidPop:self];
}

- (void)viewDidLoad
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSTabBarViewController;
  [(CPSTabBarViewController *)&v3 viewDidLoad];
  id v2 = (id)[(CPSTabBarViewController *)v5 tabBar];
  [v2 setAccessibilityIdentifier:@"CPTabBar"];

  [(CPSTabBarViewController *)v5 _updateTitle];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSTabBarViewController;
  [(CPSTabBarViewController *)&v8 viewWillAppear:a3];
  id v6 = [(CPSTabBarViewController *)v11 tabBarTemplateDelegate];
  char v7 = [v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    id v5 = [(CPSTabBarViewController *)v11 tabBarTemplateDelegate];
    SEL v4 = [(CPSTabBarViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    objc_msgSend(v5, "templateWillAppearWithIdentifier:animated:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSTabBarViewController;
  [(CPSTabBarViewController *)&v8 viewDidAppear:a3];
  id v6 = [(CPSTabBarViewController *)v11 tabBarTemplateDelegate];
  char v7 = [v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    id v5 = [(CPSTabBarViewController *)v11 tabBarTemplateDelegate];
    SEL v4 = [(CPSTabBarViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    objc_msgSend(v5, "templateDidAppearWithIdentifier:animated:");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSTabBarViewController;
  [(CPSTabBarViewController *)&v8 viewWillDisappear:a3];
  id v6 = [(CPSTabBarViewController *)v11 tabBarTemplateDelegate];
  char v7 = [v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    id v5 = [(CPSTabBarViewController *)v11 tabBarTemplateDelegate];
    SEL v4 = [(CPSTabBarViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    objc_msgSend(v5, "templateWillDisappearWithIdentifier:animated:");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSTabBarViewController;
  [(CPSTabBarViewController *)&v8 viewDidDisappear:a3];
  id v6 = [(CPSTabBarViewController *)v11 tabBarTemplateDelegate];
  char v7 = [v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    id v5 = [(CPSTabBarViewController *)v11 tabBarTemplateDelegate];
    SEL v4 = [(CPSTabBarViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    objc_msgSend(v5, "templateDidDisappearWithIdentifier:animated:");
  }
}

- (BOOL)restoresFocusAfterTransition
{
  id v3 = (id)[(CPSTabBarViewController *)self selectedViewController];
  char v4 = [v3 restoresFocusAfterTransition];

  return v4 & 1;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)CPSTabBarViewController;
  [(CPSTabBarViewController *)&v5 setViewControllers:location[0] animated:a4];
  [(CPSTabBarViewController *)v8 _updateNowPlayingButtonIfNeeded];
  objc_storeStrong(location, 0);
}

- (BOOL)_isEligibleForNowPlayingButton
{
  BOOL v6 = [(CPSTabBarViewController *)self templateEnvironment];
  BOOL v7 = [(CPSTemplateEnvironment *)v6 canBecomeNowPlayingApp];

  if (!v7) {
    return 0;
  }
  id v4 = (id)[(CPSTabBarViewController *)self viewControllers];
  BOOL v5 = (unint64_t)[v4 count] > 4;

  if (!v5) {
    return 1;
  }
  id v3 = (id)[(CPSTabBarViewController *)self view];
  [v3 bounds];
  BOOL v9 = CGRectGetWidth(v10) >= 440.0;

  return v9;
}

- (void)_updateNowPlayingButtonIfNeeded
{
  id v2 = (id)[(CPSTabBarViewController *)self _accessoryView];
  BOOL v3 = v2 != 0;

  BOOL v4 = 0;
  if (v3) {
    BOOL v4 = [(CPSTabBarViewController *)self _isEligibleForNowPlayingButton];
  }
  if (v3 != v4) {
    [(CPSTabBarViewController *)self showNowPlayingButton:v4];
  }
}

- (NAFuture)templateProviderFuture
{
  return self->_templateProviderFuture;
}

- (CPTemplate)associatedTemplate
{
  return self->_associatedTemplate;
}

- (void)setAssociatedTemplate:(id)a3
{
}

- (CPTemplateDelegate)templateDelegate
{
  return self->_templateDelegate;
}

- (void)setTemplateDelegate:(id)a3
{
}

- (CPSTemplateViewControllerDelegate)viewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerDelegate);

  return (CPSTemplateViewControllerDelegate *)WeakRetained;
}

- (void)setViewControllerDelegate:(id)a3
{
}

- (CPSTemplateEnvironment)templateEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templateEnvironment);

  return (CPSTemplateEnvironment *)WeakRetained;
}

- (void)setTemplateEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end