@interface CPSBaseTemplateViewController
- (BOOL)_wantsNowPlayingButton;
- (BOOL)didDisappear;
- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4;
- (BOOL)isNowPlayingApp;
- (BOOL)isPopping;
- (CPSBaseTemplateViewController)initWithTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5;
- (CPSTemplateEnvironment)templateEnvironment;
- (CPSTemplateViewControllerDelegate)viewControllerDelegate;
- (CPTemplate)associatedTemplate;
- (CPTemplateDelegate)templateDelegate;
- (NAFuture)templateProviderFuture;
- (UITapGestureRecognizer)backGestureRecognizer;
- (id)_barButtonItemForBarButton:(id)a3;
- (id)_barButtonItemForIdentifier:(id)a3;
- (id)_nowPlayingBarButtonItem;
- (void)_addGestureRecognizerIfNecessary;
- (void)_backGestureFired:(id)a3;
- (void)_cleanup;
- (void)_cps_viewControllerWasPopped;
- (void)_dismissTemplateViewController;
- (void)_nowPlayingButtonTapped:(id)a3;
- (void)_updateBarButtonAXLabels;
- (void)_updateLeadingBarButtons;
- (void)_updateTemplate:(id)a3;
- (void)_updateTrailingBarButtons;
- (void)_viewDidLoad;
- (void)applicationDidBecomeNowPlayingApp:(BOOL)a3;
- (void)dealloc;
- (void)didSelectButton:(id)a3;
- (void)invalidate;
- (void)removeFromParentViewController;
- (void)setAssociatedTemplate:(id)a3;
- (void)setBackGestureRecognizer:(id)a3;
- (void)setBarButton:(id)a3 image:(id)a4;
- (void)setBarButton:(id)a3 title:(id)a4;
- (void)setControl:(id)a3 enabled:(BOOL)a4;
- (void)setControl:(id)a3 selected:(BOOL)a4;
- (void)setDidDisappear:(BOOL)a3;
- (void)setHostBackButton:(id)a3;
- (void)setIsNowPlayingApp:(BOOL)a3;
- (void)setIsPopping:(BOOL)a3;
- (void)setLeadingNavigationBarButtons:(id)a3;
- (void)setTemplateDelegate:(id)a3;
- (void)setTrailingNavigationBarButtons:(id)a3;
- (void)setViewControllerDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CPSBaseTemplateViewController

- (CPSBaseTemplateViewController)initWithTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5
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
  v13.super_class = (Class)CPSBaseTemplateViewController;
  v12 = [(CPSBaseTemplateViewController *)&v13 init];
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    uint64_t v6 = objc_opt_new();
    templateProviderFuture = v17->_templateProviderFuture;
    v17->_templateProviderFuture = (NAFuture *)v6;

    objc_storeStrong((id *)&v17->_templateEnvironment, v14);
    objc_storeStrong((id *)&v17->_templateDelegate, v15);
    [(CPSBaseTemplateViewController *)v17 _updateTemplate:location[0]];
    if ([v14 canBecomeNowPlayingApp]) {
      [v14 addTemplateEnvironmentDelegate:v17];
    }
    if ([v14 isNowPlayingApp]) {
      [(CPSBaseTemplateViewController *)v17 _updateTrailingBarButtons];
    }
  }
  v9 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v9;
}

- (void)_dismissTemplateViewController
{
  v8[2] = self;
  v8[1] = (id)a2;
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  uint64_t v6 = __63__CPSBaseTemplateViewController__dismissTemplateViewController__block_invoke;
  v7 = &unk_2648A3BE0;
  v8[0] = self;
  -[CPSBaseTemplateViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong(v8, 0);
}

void __63__CPSBaseTemplateViewController__dismissTemplateViewController__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) viewControllerDelegate];
  [v2 templateViewControllerDidDismiss:*(void *)(a1 + 32)];
}

- (BOOL)_wantsNowPlayingButton
{
  return 0;
}

- (void)_updateTemplate:(id)a3
{
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v31->_associatedTemplate, location[0]);
  v23 = [(CPSBaseTemplateViewController *)v31 associatedTemplate];
  v24 = [(CPTemplate *)v23 tabImage];

  if (v24)
  {
    v21 = [(CPSBaseTemplateViewController *)v31 associatedTemplate];
    v29 = [(CPTemplate *)v21 tabTitle];

    char v27 = 0;
    char v22 = 0;
    if (!v29)
    {
      v28 = [(CPSBaseTemplateViewController *)v31 associatedTemplate];
      char v27 = 1;
      char v22 = objc_opt_respondsToSelector();
    }
    if (v27) {

    }
    if (v22)
    {
      v20 = [(CPSBaseTemplateViewController *)v31 associatedTemplate];
      uint64_t v3 = (NSString *)(id)[(CPTemplate *)v20 title];
      int v4 = v29;
      v29 = v3;
    }
    id v16 = objc_alloc(MEMORY[0x263F1CA38]);
    id v15 = v29;
    v19 = [(CPSBaseTemplateViewController *)v31 associatedTemplate];
    v18 = [(CPTemplate *)v19 tabImage];
    id v17 = (id)objc_msgSend(v16, "initWithTitle:image:tag:", v15);
    -[CPSBaseTemplateViewController setTabBarItem:](v31, "setTabBarItem:");

    objc_storeStrong((id *)&v29, 0);
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x263F1CA38]);
    id v14 = [(CPSBaseTemplateViewController *)v31 associatedTemplate];
    id v13 = (id)objc_msgSend(v12, "initWithTabBarSystemItem:tag:", -[CPTemplate tabSystemItem](v14, "tabSystemItem"), 0);
    -[CPSBaseTemplateViewController setTabBarItem:](v31, "setTabBarItem:");
  }
  v10 = [(CPSBaseTemplateViewController *)v31 associatedTemplate];
  BOOL v11 = [(CPTemplate *)v10 showsTabBadge];

  if (v11)
  {
    id v9 = (id)[(CPSBaseTemplateViewController *)v31 tabBarItem];
    [v9 setBadgeValue:&stru_26DEE39C0];
  }
  else
  {
    id v8 = (id)[(CPSBaseTemplateViewController *)v31 tabBarItem];
    [v8 setBadgeValue:0];
  }
  UIOffsetMake();
  double v25 = v5;
  double v26 = v6;
  id v7 = (id)[(CPSBaseTemplateViewController *)v31 tabBarItem];
  objc_msgSend(v7, "setBadgeOffset:", v25, v26);

  objc_storeStrong(location, 0);
}

- (void)_cps_viewControllerWasPopped
{
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
  id v7 = __67__CPSBaseTemplateViewController_applicationDidBecomeNowPlayingApp___block_invoke;
  id v8 = &unk_2648A4748;
  id v9 = v13;
  BOOL v10 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
}

uint64_t __67__CPSBaseTemplateViewController_applicationDidBecomeNowPlayingApp___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTrailingBarButtons];
}

- (void)invalidate
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v4, (uint64_t)v3);
    _os_log_impl(&dword_22B689000, oslog[0], OS_LOG_TYPE_DEFAULT, "Invalidating %@", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)&v3->_templateProviderFuture, 0);
}

- (void)viewDidLoad
{
  int v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSBaseTemplateViewController;
  [(CPSBaseTemplateViewController *)&v4 viewDidLoad];
  id v2 = (id)[(CPSBaseTemplateViewController *)v6 navigationController];
  [v2 setNavigationBarHidden:0 animated:1];

  [(CPSBaseTemplateViewController *)v6 _viewDidLoad];
  uint64_t v3 = [(CPSBaseTemplateViewController *)v6 templateProviderFuture];
  [(NAFuture *)v3 finishWithResult:v6];
}

- (void)_viewDidLoad
{
  id v2 = (id)[(CPSBaseTemplateViewController *)self navigationItem];
  [v2 setLeftItemsSupplementBackButton:1];

  [(CPSBaseTemplateViewController *)self _updateLeadingBarButtons];
  [(CPSBaseTemplateViewController *)self _updateTrailingBarButtons];
}

- (void)setIsPopping:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 != self->_isPopping)
  {
    self->_isPopping = a3;
    if ([(CPSBaseTemplateViewController *)self didDisappear] && v3) {
      [(CPSBaseTemplateViewController *)self _cleanup];
    }
  }
}

- (void)setDidDisappear:(BOOL)a3
{
  if (self->_didDisappear != a3)
  {
    self->_didDisappear = a3;
    if (a3 && [(CPSBaseTemplateViewController *)self isPopping]) {
      [(CPSBaseTemplateViewController *)self _cleanup];
    }
  }
}

- (void)removeFromParentViewController
{
  objc_super v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSBaseTemplateViewController;
  [(CPSBaseTemplateViewController *)&v2 removeFromParentViewController];
  [(CPSBaseTemplateViewController *)v4 _cleanup];
}

- (void)_cleanup
{
  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
  objc_super v2 = [(CPSBaseTemplateViewController *)self viewControllerDelegate];
  [(CPSTemplateViewControllerDelegate *)v2 templateViewControllerDidPop:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSBaseTemplateViewController;
  [(CPSBaseTemplateViewController *)&v8 viewWillAppear:a3];
  [(CPSBaseTemplateViewController *)v11 setDidDisappear:0];
  [(CPSBaseTemplateViewController *)v11 setIsPopping:0];
  int v6 = [(CPSBaseTemplateViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    SEL v5 = [(CPSBaseTemplateViewController *)v11 templateDelegate];
    objc_super v4 = [(CPSBaseTemplateViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateWillAppearWithIdentifier:animated:](v5, "templateWillAppearWithIdentifier:animated:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSBaseTemplateViewController;
  [(CPSBaseTemplateViewController *)&v8 viewDidAppear:a3];
  int v6 = [(CPSBaseTemplateViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    SEL v5 = [(CPSBaseTemplateViewController *)v11 templateDelegate];
    objc_super v4 = [(CPSBaseTemplateViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateDidAppearWithIdentifier:animated:](v5, "templateDidAppearWithIdentifier:animated:");
  }
  [(CPSBaseTemplateViewController *)v11 _addGestureRecognizerIfNecessary];
}

- (void)_addGestureRecognizerIfNecessary
{
  SEL v10 = self;
  v9[1] = (id)a2;
  id v6 = (id)[(CPSBaseTemplateViewController *)self navigationController];
  id v5 = (id)[v6 view];
  objc_super v4 = [(CPSBaseTemplateViewController *)v10 backGestureRecognizer];
  objc_msgSend(v5, "removeGestureRecognizer:");

  char v7 = [(CPSBaseTemplateViewController *)v10 associatedTemplate];
  id v8 = (id)[(CPTemplate *)v7 backButton];

  if (v8)
  {
    v9[0] = (id)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v10 action:sel__backGestureFired_];
    [v9[0] setAllowedPressTypes:&unk_26DF06B80];
    [v9[0] setDelegate:v10];
    id v3 = (id)[(CPSBaseTemplateViewController *)v10 navigationController];
    id v2 = (id)[v3 view];
    [v2 addGestureRecognizer:v9[0]];

    [(CPSBaseTemplateViewController *)v10 setBackGestureRecognizer:v9[0]];
    objc_storeStrong(v9, 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPSBaseTemplateViewController;
  [(CPSBaseTemplateViewController *)&v11 viewWillDisappear:a3];
  BOOL v9 = [(CPSBaseTemplateViewController *)v14 templateDelegate];
  char v10 = [(CPTemplateDelegate *)v9 conformsToProtocol:&unk_26DF72840];

  if (v10)
  {
    id v8 = [(CPSBaseTemplateViewController *)v14 templateDelegate];
    char v7 = [(CPSBaseTemplateViewController *)v14 associatedTemplate];
    id v6 = (id)[(CPTemplate *)v7 identifier];
    -[CPTemplateDelegate templateWillDisappearWithIdentifier:animated:](v8, "templateWillDisappearWithIdentifier:animated:");
  }
  id v5 = (id)[(CPSBaseTemplateViewController *)v14 navigationController];
  id v4 = (id)[v5 view];
  id v3 = [(CPSBaseTemplateViewController *)v14 backGestureRecognizer];
  objc_msgSend(v4, "removeGestureRecognizer:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSBaseTemplateViewController;
  [(CPSBaseTemplateViewController *)&v8 viewDidDisappear:a3];
  id v6 = [(CPSBaseTemplateViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    id v5 = [(CPSBaseTemplateViewController *)v11 templateDelegate];
    id v4 = [(CPSBaseTemplateViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateDidDisappearWithIdentifier:animated:](v5, "templateDidDisappearWithIdentifier:animated:");
  }
  [(CPSBaseTemplateViewController *)v11 setDidDisappear:1];
}

- (void)dealloc
{
  id v5 = self;
  SEL v4 = a2;
  id v2 = (id)[MEMORY[0x263F08A00] defaultCenter];
  [v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)CPSBaseTemplateViewController;
  [(CPSBaseTemplateViewController *)&v3 dealloc];
}

- (void)didSelectButton:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = (id)[location[0] identifier];
  id v12 = CarPlaySupportGeneralLogging();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v16, (uint64_t)v15, (uint64_t)v13);
    _os_log_impl(&dword_22B689000, (os_log_t)v12, v11, "%@: button selected with UUID: %@", v16, 0x16u);
  }
  objc_storeStrong(&v12, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (void *)MEMORY[0x263F6C760];
    objc_super v8 = [(CPSBaseTemplateViewController *)v15 templateEnvironment];
    char v7 = [(CPSTemplateEnvironment *)v8 bundleIdentifier];
    id v10 = (id)objc_msgSend(v6, "messageComposeDirectActionWithAppBundleId:");

    BOOL v9 = [(CPSBaseTemplateViewController *)v15 viewControllerDelegate];
    [(CPSTemplateViewControllerDelegate *)v9 templateViewController:v15 shouldActivateSiriWithDirectActionContext:v10];

    objc_storeStrong(&v10, 0);
  }
  else
  {
    SEL v4 = [(CPSBaseTemplateViewController *)v15 templateDelegate];
    char v5 = [(CPTemplateDelegate *)v4 conformsToProtocol:&unk_26DF72840];

    if (v5)
    {
      objc_super v3 = [(CPSBaseTemplateViewController *)v15 templateDelegate];
      [(CPTemplateDelegate *)v3 handleActionForControlIdentifier:v13];
    }
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (id)_barButtonItemForIdentifier:(id)a3
{
  double v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v17 = 0;
  v18 = &v17;
  int v19 = 838860800;
  int v20 = 48;
  v21 = __Block_byref_object_copy__0;
  char v22 = __Block_byref_object_dispose__0;
  id v23 = 0;
  id v9 = (id)[(CPSBaseTemplateViewController *)v25 navigationItem];
  id v8 = (id)[v9 leftBarButtonItems];
  id v7 = (id)[(CPSBaseTemplateViewController *)v25 navigationItem];
  id v6 = (id)[v7 rightBarButtonItems];
  id v16 = (id)objc_msgSend(v8, "arrayByAddingObjectsFromArray:");

  id v5 = v16;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = __61__CPSBaseTemplateViewController__barButtonItemForIdentifier___block_invoke;
  id v14 = &unk_2648A4AA8;
  v15[0] = location[0];
  v15[1] = &v17;
  [v5 enumerateObjectsUsingBlock:&v10];
  id v4 = (id)v18[5];
  objc_storeStrong(v15, 0);
  objc_storeStrong(&v16, 0);
  _Block_object_dispose(&v17, 8);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);

  return v4;
}

void __61__CPSBaseTemplateViewController__barButtonItemForIdentifier___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v12 = a3;
  int v11 = a4;
  v10[1] = a1;
  id v4 = objc_opt_class();
  v10[0] = CPSSafeCast_11(v4, location[0]);
  id v8 = (id)[v10[0] identifier];
  char v9 = [v8 isEqual:a1[4]];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v10[0]);
    *int v11 = 1;
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (id)_nowPlayingBarButtonItem
{
  char v9 = self;
  v8[1] = (id)a2;
  id v4 = objc_alloc(MEMORY[0x263F31390]);
  id v6 = [(CPSBaseTemplateViewController *)v9 templateEnvironment];
  id v5 = [(CPSTemplateEnvironment *)v6 bundleIdentifier];
  v8[0] = (id)objc_msgSend(v4, "initWithBundleIdentifier:");

  [v8[0] addTarget:v9 action:sel__nowPlayingButtonTapped_ forControlEvents:64];
  id v2 = objc_alloc(MEMORY[0x263F1C468]);
  id v7 = (void *)[v2 initWithCustomView:v8[0]];
  objc_storeStrong(v8, 0);

  return v7;
}

- (id)_barButtonItemForBarButton:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = [CPSBarButtonItem alloc];
  id v6 = [(CPSBarButtonItem *)v3 initWithCPBarButton:location[0]];
  [(CPSBarButtonItem *)v6 setDelegate:v8];
  id v5 = v6;
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v6 = (UITapGestureRecognizer *)location[0];
  id v7 = [(CPSBaseTemplateViewController *)v15 backGestureRecognizer];
  char v11 = 0;
  char v9 = 0;
  BOOL v8 = 0;
  if (v6 == v7)
  {
    uint64_t v12 = [(CPSBaseTemplateViewController *)v15 associatedTemplate];
    char v11 = 1;
    id v10 = (id)[(CPTemplate *)v12 backButton];
    char v9 = 1;
    BOOL v8 = v10 != 0;
  }
  if (v9) {

  }
  if (v11) {
  BOOL v16 = v8;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (void)_backGestureFired:(id)a3
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = [(CPSBaseTemplateViewController *)v9 associatedTemplate];
  id v7 = (id)[(CPTemplate *)v6 backButton];

  if (v7)
  {
    objc_super v3 = v9;
    id v5 = [(CPSBaseTemplateViewController *)v9 associatedTemplate];
    id v4 = (id)[(CPTemplate *)v5 backButton];
    -[CPSBaseTemplateViewController didSelectButton:](v3, "didSelectButton:");
  }
  objc_storeStrong(location, 0);
}

- (void)_nowPlayingButtonTapped:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = CarPlaySupportGeneralLogging();
  os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
  {
    log = v31;
    os_log_type_t type = v30;
    __os_log_helper_16_0_0(v29);
    _os_log_impl(&dword_22B689000, log, type, "System Now Playing button tapped", v29, 2u);
  }
  objc_storeStrong(&v31, 0);
  memset(__b, 0, sizeof(__b));
  id v15 = (id)[(CPSBaseTemplateViewController *)v33 navigationController];
  id obj = (id)[v15 viewControllers];

  uint64_t v17 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
  if (v17)
  {
    uint64_t v12 = *(void *)__b[2];
    uint64_t v13 = 0;
    unint64_t v14 = v17;
    while (1)
    {
      uint64_t v11 = v13;
      if (*(void *)__b[2] != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v28 = *(void *)(__b[1] + 8 * v13);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      ++v13;
      if (v11 + 1 >= v14)
      {
        uint64_t v13 = 0;
        unint64_t v14 = [obj countByEnumeratingWithState:__b objects:v34 count:16];
        if (!v14) {
          goto LABEL_13;
        }
      }
    }
    os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      char v9 = oslog;
      os_log_type_t v10 = v25;
      __os_log_helper_16_0_0(v24);
      _os_log_impl(&dword_22B689000, v9, v10, "Popping to existing now playing view controller.", v24, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v8 = (id)[(CPSBaseTemplateViewController *)v33 navigationController];
    id v3 = (id)[v8 popToViewController:v28 animated:1];

    int v23 = 1;
  }
  else
  {
LABEL_13:
    int v23 = 0;
  }

  if (!v23)
  {
    os_log_t v22 = (os_log_t)CarPlaySupportGeneralLogging();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v22;
      os_log_type_t v7 = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_impl(&dword_22B689000, v6, v7, "Requesting Now Playing from client.", v20, 2u);
    }
    objc_storeStrong((id *)&v22, 0);
    id v5 = [(CPSBaseTemplateViewController *)v33 templateEnvironment];
    id v4 = [(CPSTemplateEnvironment *)v5 templateProvider];
    [(CPTemplateProviding *)v4 clientRequestNowPlayingTemplateAnimated:1];

    int v23 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)setHostBackButton:(id)a3
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  os_log_type_t v7 = __51__CPSBaseTemplateViewController_setHostBackButton___block_invoke;
  id v8 = &unk_2648A3990;
  char v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __51__CPSBaseTemplateViewController_setHostBackButton___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) associatedTemplate];
  [v2 setBackButton:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 32) _updateLeadingBarButtons];
}

- (void)_updateLeadingBarButtons
{
  v31[1] = *MEMORY[0x263EF8340];
  uint64_t v28 = self;
  v27[1] = (id)a2;
  v27[0] = (id)objc_opt_new();
  id v19 = (id)[(CPSBaseTemplateViewController *)v28 view];
  id v18 = (id)[v19 window];
  uint64_t v17 = [(CPSBaseTemplateViewController *)v28 backGestureRecognizer];
  objc_msgSend(v18, "removeGestureRecognizer:");

  int v20 = [(CPSBaseTemplateViewController *)v28 associatedTemplate];
  id v21 = (id)[(CPTemplate *)v20 backButton];

  if (v21)
  {
    id v11 = (id)[(CPSBaseTemplateViewController *)v28 navigationItem];
    [v11 setHidesBackButton:1];

    uint64_t v12 = [CPSBarBackButtonItem alloc];
    unint64_t v14 = [(CPSBaseTemplateViewController *)v28 associatedTemplate];
    id v13 = (id)[(CPTemplate *)v14 backButton];
    double v26 = -[CPSBarBackButtonItem initWithCPBarButton:](v12, "initWithCPBarButton:");

    [(CPSBarBackButtonItem *)v26 setAccessibilityIdentifier:@"CPBackButton"];
    id v16 = (id)CPUILocalizedStringForKey();
    v31[0] = v16;
    id v15 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
    -[CPSBarBackButtonItem setAccessibilityUserInputLabels:](v26, "setAccessibilityUserInputLabels:");

    [(CPSBarButtonItem *)v26 setDelegate:v28];
    [v27[0] addObject:v26];
    [(CPSBaseTemplateViewController *)v28 _addGestureRecognizerIfNecessary];
    objc_storeStrong((id *)&v26, 0);
  }
  memset(__b, 0, sizeof(__b));
  id v8 = [(CPSBaseTemplateViewController *)v28 associatedTemplate];
  id obj = (id)[(CPTemplate *)v8 internalLeadingBarButtons];

  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void *)(__b[1] + 8 * v6);
      id v23 = [(CPSBaseTemplateViewController *)v28 _barButtonItemForBarButton:v25];
      [v27[0] addObject:v23];
      objc_storeStrong(&v23, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v7) {
          break;
        }
      }
    }
  }

  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v29, (uint64_t)v28, (uint64_t)v27[0]);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "%@: Updating leading bar buttons: %@", v29, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v2 = v27[0];
  id v3 = (id)[(CPSBaseTemplateViewController *)v28 navigationItem];
  [v3 setLeftBarButtonItems:v2];

  [(CPSBaseTemplateViewController *)v28 _updateBarButtonAXLabels];
  objc_storeStrong(v27, 0);
}

- (void)_updateTrailingBarButtons
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  uint64_t v12 = [(CPSBaseTemplateViewController *)v20 associatedTemplate];
  id obj = (id)[(CPTemplate *)v12 internalTrailingBarButtons];

  uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
  if (v14)
  {
    uint64_t v9 = *(void *)__b[2];
    uint64_t v10 = 0;
    unint64_t v11 = v14;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)__b[2] != v9) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(__b[1] + 8 * v10);
      id v16 = [(CPSBaseTemplateViewController *)v20 _barButtonItemForBarButton:v18];
      [v19[0] addObject:v16];
      objc_storeStrong(&v16, 0);
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }

  uint64_t v6 = [(CPSBaseTemplateViewController *)v20 templateEnvironment];
  BOOL v7 = 0;
  if ([(CPSTemplateEnvironment *)v6 canBecomeNowPlayingApp])
  {
    BOOL v7 = 0;
    if ([(CPSBaseTemplateViewController *)v20 isNowPlayingApp]) {
      BOOL v7 = [(CPSBaseTemplateViewController *)v20 _wantsNowPlayingButton];
    }
  }

  if (v7)
  {
    id v4 = v19[0];
    id v5 = [(CPSBaseTemplateViewController *)v20 _nowPlayingBarButtonItem];
    objc_msgSend(v4, "insertObject:atIndex:");
  }
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v21, (uint64_t)v20, (uint64_t)v19[0]);
    _os_log_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEFAULT, "%@: Updating trailing bar buttons: %@", v21, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v2 = v19[0];
  id v3 = (id)[(CPSBaseTemplateViewController *)v20 navigationItem];
  [v3 setRightBarButtonItems:v2];

  [(CPSBaseTemplateViewController *)v20 _updateBarButtonAXLabels];
  objc_storeStrong(v19, 0);
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = __64__CPSBaseTemplateViewController_setLeadingNavigationBarButtons___block_invoke;
  uint64_t v8 = &unk_2648A3990;
  uint64_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __64__CPSBaseTemplateViewController_setLeadingNavigationBarButtons___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) associatedTemplate];
  [v2 setInternalLeadingBarButtons:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 32) _updateLeadingBarButtons];
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  BOOL v7 = __65__CPSBaseTemplateViewController_setTrailingNavigationBarButtons___block_invoke;
  uint64_t v8 = &unk_2648A3990;
  uint64_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __65__CPSBaseTemplateViewController_setTrailingNavigationBarButtons___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) associatedTemplate];
  [v2 setInternalTrailingBarButtons:*(void *)(a1 + 40)];

  return [*(id *)(a1 + 32) _updateTrailingBarButtons];
}

- (void)setControl:(id)a3 enabled:(BOOL)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v14 = a4;
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __52__CPSBaseTemplateViewController_setControl_enabled___block_invoke;
  id v10 = &unk_2648A4828;
  unint64_t v11 = v16;
  id v12 = location[0];
  BOOL v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSBaseTemplateViewController_setControl_enabled___block_invoke(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)[*(id *)(a1 + 32) _barButtonItemForIdentifier:*(void *)(a1 + 40)];
  [v2[0] setEnabled:*(unsigned char *)(a1 + 48) & 1];
  objc_storeStrong(v2, 0);
}

- (void)setControl:(id)a3 selected:(BOOL)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)setBarButton:(id)a3 image:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __52__CPSBaseTemplateViewController_setBarButton_image___block_invoke;
  id v10 = &unk_2648A4AD0;
  unint64_t v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSBaseTemplateViewController_setBarButton_image___block_invoke(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)[*(id *)(a1 + 32) _barButtonItemForIdentifier:*(void *)(a1 + 40)];
  [v2[0] setImage:*(void *)(a1 + 48)];
  objc_storeStrong(v2, 0);
}

- (void)setBarButton:(id)a3 title:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __52__CPSBaseTemplateViewController_setBarButton_title___block_invoke;
  id v10 = &unk_2648A4AD0;
  unint64_t v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSBaseTemplateViewController_setBarButton_title___block_invoke(uint64_t a1)
{
  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)[*(id *)(a1 + 32) _barButtonItemForIdentifier:*(void *)(a1 + 40)];
  [v2[0] setTitle:*(void *)(a1 + 48)];
  objc_storeStrong(v2, 0);
}

- (void)_updateBarButtonAXLabels
{
  id v12 = self;
  v11[1] = (id)a2;
  id v9 = (id)[(CPSBaseTemplateViewController *)self navigationItem];
  id v10 = (id)[v9 leftBarButtonItems];
  if (v10) {
    id v2 = v10;
  }
  else {
    id v2 = MEMORY[0x263EFFA68];
  }
  v11[0] = v2;

  id v6 = (id)[(CPSBaseTemplateViewController *)v12 navigationItem];
  id v7 = (id)[v6 rightBarButtonItems];
  id v8 = (id)objc_msgSend(v7, "bs_reverse");
  if (v8) {
    id v5 = v8;
  }
  else {
    id v5 = (id)MEMORY[0x263EFFA68];
  }
  id v3 = (id)[v11[0] arrayByAddingObjectsFromArray:v5];
  id v4 = v11[0];
  v11[0] = v3;

  [v11[0] enumerateObjectsUsingBlock:&__block_literal_global_6];
  objc_storeStrong(v11, 0);
}

void __57__CPSBaseTemplateViewController__updateBarButtonAXLabels__block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v19 = a3;
  v18[2] = a4;
  v18[1] = a1;
  v18[0] = (id)[location[0] customView];
  id v17 = (id)[MEMORY[0x263EFF980] array];
  id v4 = (id)[v18[0] accessibilityLabel];
  BOOL v16 = v4 == 0;

  if (!v16)
  {
    id v12 = (id)[v18[0] accessibilityLabel];
    objc_msgSend(v17, "addObject:");
  }
  if (v19)
  {
    uint64_t v6 = v19;
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    char v5 = 0;
  }
  if ((v5 & 1) == 0)
  {
    switch(v6)
    {
      case 0:
        id v11 = (id)CPUILocalizedStringForKey();
        objc_msgSend(v17, "addObject:");

        break;
      case 1:
        id v10 = (id)CPUILocalizedStringForKey();
        objc_msgSend(v17, "addObject:");

        break;
      case 2:
        id v9 = (id)CPUILocalizedStringForKey();
        objc_msgSend(v17, "addObject:");

        break;
      case 3:
        id v8 = (id)CPUILocalizedStringForKey();
        objc_msgSend(v17, "addObject:");

        break;
      default:
        JUMPOUT(0);
    }
  }
  id v7 = (id)[v17 copy];
  objc_msgSend(v18[0], "setAccessibilityUserInputLabels:");

  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
  objc_storeStrong(location, 0);
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
  return self->_templateEnvironment;
}

- (BOOL)isPopping
{
  return self->_isPopping;
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (BOOL)isNowPlayingApp
{
  return self->_isNowPlayingApp;
}

- (void)setIsNowPlayingApp:(BOOL)a3
{
  self->_isNowPlayingApp = a3;
}

- (UITapGestureRecognizer)backGestureRecognizer
{
  return self->_backGestureRecognizer;
}

- (void)setBackGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end