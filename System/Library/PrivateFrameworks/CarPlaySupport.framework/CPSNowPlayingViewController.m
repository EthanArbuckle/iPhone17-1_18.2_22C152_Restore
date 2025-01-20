@interface CPSNowPlayingViewController
- (BOOL)didDisappear;
- (BOOL)isPopping;
- (CPSAudioPlaybackManager)audioPlaybackManager;
- (CPSNowPlayingViewController)initWithNowPlayingTemplate:(id)a3 templateDelegate:(id)a4 environment:(id)a5;
- (CPSTemplateEnvironment)templateEnvironment;
- (CPSTemplateViewControllerDelegate)viewControllerDelegate;
- (CPTemplate)associatedTemplate;
- (CPTemplateDelegate)templateDelegate;
- (CPUIThrottle)updateThrottle;
- (NAFuture)templateProviderFuture;
- (id)nowPlayingTemplate;
- (void)_cleanup;
- (void)_cps_viewControllerWasPopped;
- (void)didSelectButton:(id)a3;
- (void)invalidate;
- (void)reloadData;
- (void)removeFromParentViewController;
- (void)setAssociatedTemplate:(id)a3;
- (void)setControl:(id)a3 enabled:(BOOL)a4;
- (void)setControl:(id)a3 selected:(BOOL)a4;
- (void)setDidDisappear:(BOOL)a3;
- (void)setIsPopping:(BOOL)a3;
- (void)setTemplateDelegate:(id)a3;
- (void)setTemplateEnvironment:(id)a3;
- (void)setTemplateProviderFuture:(id)a3;
- (void)setUpdateThrottle:(id)a3;
- (void)setViewControllerDelegate:(id)a3;
- (void)updateNowPlayingTemplate:(id)a3 withProxyDelegate:(id)a4 canThrottle:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CPSNowPlayingViewController

- (CPSNowPlayingViewController)initWithNowPlayingTemplate:(id)a3 templateDelegate:(id)a4 environment:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  id v29 = 0;
  objc_storeStrong(&v29, a5);
  v5 = [CPSAudioPlaybackManager alloc];
  id v28 = [(CPSAudioPlaybackManager *)v5 initWithNowPlayingTemplate:location[0] templateDelegate:v30 environment:v29];
  v23 = v32;
  id v24 = (id)[v29 bundleIdentifier];
  v32 = 0;
  v27.receiver = v23;
  v27.super_class = (Class)CPSNowPlayingViewController;
  v25 = -[CPUINowPlayingViewController initWithBundleIdentifier:dataSource:delegate:](&v27, sel_initWithBundleIdentifier_dataSource_delegate_);
  v32 = v25;
  objc_storeStrong((id *)&v32, v25);

  if (v25)
  {
    objc_storeStrong((id *)&v32->_audioPlaybackManager, v28);
    [(CPSAudioPlaybackManager *)v32->_audioPlaybackManager setNowPlayingViewController:v32];
    uint64_t v6 = [objc_alloc(MEMORY[0x263F313E8]) initWithBase:2.0];
    updateThrottle = v32->_updateThrottle;
    v32->_updateThrottle = (CPUIThrottle *)v6;

    objc_storeWeak((id *)&v32->_templateEnvironment, v29);
    objc_storeStrong((id *)&v32->_associatedTemplate, location[0]);
    objc_storeStrong((id *)&v32->_templateDelegate, v30);
    id v20 = (id)[location[0] tabImage];

    if (v20)
    {
      id v16 = objc_alloc(MEMORY[0x263F1CA38]);
      id v19 = (id)[location[0] tabTitle];
      id v18 = (id)[location[0] tabImage];
      id v17 = (id)objc_msgSend(v16, "initWithTitle:image:tag:", v19);
      -[CPSNowPlayingViewController setTabBarItem:](v32, "setTabBarItem:");
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x263F1CA38]);
      id v13 = (id)objc_msgSend(v12, "initWithTabBarSystemItem:tag:", objc_msgSend(location[0], "tabSystemItem"), 0);
      -[CPSNowPlayingViewController setTabBarItem:](v32, "setTabBarItem:");

      id v15 = (id)[(CPSNowPlayingViewController *)v32 tabBarItem];
      id v14 = (id)[location[0] tabTitle];
      objc_msgSend(v15, "_setInternalTitle:");
    }
    id v26 = CarPlaySupportGeneralLogging();
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v32);
      _os_log_impl(&dword_22B689000, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "%@: Creating now playing Future", v33, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    v8 = (NAFuture *)(id)[MEMORY[0x263F58190] futureWithResult:v32];
    templateProviderFuture = v32->_templateProviderFuture;
    v32->_templateProviderFuture = v8;
  }
  v11 = v32;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v32, 0);
  return v11;
}

- (id)nowPlayingTemplate
{
  v3 = objc_opt_class();
  v4 = [(CPSNowPlayingViewController *)self associatedTemplate];
  id v5 = CPSSafeCast_7(v3, v4);

  return v5;
}

- (void)viewDidLoad
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSNowPlayingViewController;
  [(CPUINowPlayingViewController *)&v3 viewDidLoad];
  id v2 = (id)[(CPSNowPlayingViewController *)v5 navigationController];
  [v2 setNavigationBarHidden:0 animated:1];
}

- (void)invalidate
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  objc_super v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v4, (uint64_t)v3);
    _os_log_impl(&dword_22B689000, oslog[0], OS_LOG_TYPE_DEFAULT, "Invalidating %@", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)&v3->_templateProviderFuture, 0);
  objc_storeStrong((id *)&v3->_audioPlaybackManager, 0);
}

- (void)updateNowPlayingTemplate:(id)a3 withProxyDelegate:(id)a4 canThrottle:(id)a5
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  queue = MEMORY[0x263EF83A0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  v11 = __86__CPSNowPlayingViewController_updateNowPlayingTemplate_withProxyDelegate_canThrottle___block_invoke;
  id v12 = &unk_2648A4360;
  id v13 = v20;
  id v14 = location[0];
  id v15 = v18;
  id v16 = v17;
  dispatch_async(queue, &v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __86__CPSNowPlayingViewController_updateNowPlayingTemplate_withProxyDelegate_canThrottle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAssociatedTemplate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setTemplateDelegate:*(void *)(a1 + 48)];
  id v1 = (id)[*(id *)(a1 + 32) audioPlaybackManager];
  [v1 updateNowPlayingTemplate:*(void *)(a1 + 40) templateDelegate:*(void *)(a1 + 48)];

  char v4 = 0;
  char v3 = 1;
  if ([*(id *)(a1 + 56) BOOLValue])
  {
    id v5 = (id)[*(id *)(a1 + 32) updateThrottle];
    char v4 = 1;
    char v3 = [v5 incrementAttempts];
  }
  if (v4) {

  }
  if (v3) {
    [*(id *)(a1 + 32) reloadData];
  }
}

- (void)reloadData
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CPSNowPlayingViewController;
  [(CPUINowPlayingViewController *)&v3 reloadData];
  id v2 = [(CPSNowPlayingViewController *)v5 updateThrottle];
  [(CPUIThrottle *)v2 unthrottle];
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
  int v9 = __50__CPSNowPlayingViewController_setControl_enabled___block_invoke;
  int v10 = &unk_2648A4828;
  v11 = v16;
  id v12 = location[0];
  BOOL v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __50__CPSNowPlayingViewController_setControl_enabled___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  memset(__b, 0, sizeof(__b));
  id v8 = (id)[*(id *)(a1 + 32) playModeControlView];
  id obj = (id)[v8 mediaButtons];

  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v10)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v10;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v5);
      id v1 = (id)[v12 identifier];
      char v2 = [v1 isEqual:*(void *)(a1 + 40)];

      if (v2) {
        [v12 setEnabled:*(unsigned char *)(a1 + 48) & 1];
      }
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
}

- (void)setControl:(id)a3 selected:(BOOL)a4
{
  uint64_t v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v14 = a4;
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __51__CPSNowPlayingViewController_setControl_selected___block_invoke;
  uint64_t v10 = &unk_2648A4828;
  v11 = v16;
  id v12 = location[0];
  BOOL v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __51__CPSNowPlayingViewController_setControl_selected___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  memset(__b, 0, sizeof(__b));
  id v8 = (id)[*(id *)(a1 + 32) playModeControlView];
  id obj = (id)[v8 mediaButtons];

  uint64_t v10 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
  if (v10)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v10;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v5);
      id v1 = (id)[v12 identifier];
      char v2 = [v1 isEqual:*(void *)(a1 + 40)];

      if (v2) {
        [v12 setSelected:*(unsigned char *)(a1 + 48) & 1];
      }
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v15 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }
}

- (void)_cps_viewControllerWasPopped
{
}

- (void)setIsPopping:(BOOL)a3
{
  if (a3 != self->_isPopping) {
    self->_isPopping = a3;
  }
  if (self->_didDisappear && a3) {
    [(CPSNowPlayingViewController *)self _cleanup];
  }
}

- (void)setDidDisappear:(BOOL)a3
{
  if (self->_didDisappear != a3) {
    self->_didDisappear = a3;
  }
  if (a3 && self->_isPopping) {
    [(CPSNowPlayingViewController *)self _cleanup];
  }
}

- (void)removeFromParentViewController
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSNowPlayingViewController;
  [(CPSNowPlayingViewController *)&v2 removeFromParentViewController];
  [(CPSNowPlayingViewController *)v4 _cleanup];
}

- (void)_cleanup
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v4 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, (uint64_t)v4);
    _os_log_impl(&dword_22B689000, oslog[0], OS_LOG_TYPE_DEFAULT, "Cleaning up %@", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)&v4->_templateProviderFuture, 0);
  objc_super v2 = [(CPSNowPlayingViewController *)v4 viewControllerDelegate];
  [(CPSTemplateViewControllerDelegate *)v2 templateViewControllerDidPop:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSNowPlayingViewController;
  [(CPUINowPlayingViewController *)&v8 viewWillAppear:a3];
  [(CPSNowPlayingViewController *)v11 setIsPopping:0];
  [(CPSNowPlayingViewController *)v11 setDidDisappear:0];
  uint64_t v6 = [(CPSNowPlayingViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    uint64_t v5 = [(CPSNowPlayingViewController *)v11 templateDelegate];
    uint64_t v4 = [(CPSNowPlayingViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateWillAppearWithIdentifier:animated:](v5, "templateWillAppearWithIdentifier:animated:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSNowPlayingViewController;
  [(CPSNowPlayingViewController *)&v8 viewDidAppear:a3];
  uint64_t v6 = [(CPSNowPlayingViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    uint64_t v5 = [(CPSNowPlayingViewController *)v11 templateDelegate];
    uint64_t v4 = [(CPSNowPlayingViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateDidAppearWithIdentifier:animated:](v5, "templateDidAppearWithIdentifier:animated:");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSNowPlayingViewController;
  [(CPUINowPlayingViewController *)&v8 viewWillDisappear:a3];
  uint64_t v6 = [(CPSNowPlayingViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    uint64_t v5 = [(CPSNowPlayingViewController *)v11 templateDelegate];
    uint64_t v4 = [(CPSNowPlayingViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateWillDisappearWithIdentifier:animated:](v5, "templateWillDisappearWithIdentifier:animated:");
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPSNowPlayingViewController;
  [(CPUINowPlayingViewController *)&v8 viewDidDisappear:a3];
  uint64_t v6 = [(CPSNowPlayingViewController *)v11 templateDelegate];
  char v7 = [(CPTemplateDelegate *)v6 conformsToProtocol:&unk_26DF72840];

  if (v7)
  {
    uint64_t v5 = [(CPSNowPlayingViewController *)v11 templateDelegate];
    uint64_t v4 = [(CPSNowPlayingViewController *)v11 associatedTemplate];
    id v3 = (id)[(CPTemplate *)v4 identifier];
    -[CPTemplateDelegate templateDidDisappearWithIdentifier:animated:](v5, "templateDidDisappearWithIdentifier:animated:");
  }
  [(CPSNowPlayingViewController *)v11 setDidDisappear:1];
}

- (void)didSelectButton:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[location[0] identifier];
  os_log_t oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)v9, (uint64_t)v7);
    _os_log_debug_impl(&dword_22B689000, oslog, OS_LOG_TYPE_DEBUG, "%@: button selected with UUID: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  uint64_t v4 = [(CPSNowPlayingViewController *)v9 templateDelegate];
  char v5 = [(CPTemplateDelegate *)v4 conformsToProtocol:&unk_26DF72840];

  if (v5)
  {
    id v3 = [(CPSNowPlayingViewController *)v9 templateDelegate];
    [(CPTemplateDelegate *)v3 handleActionForControlIdentifier:v7];
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (CPSAudioPlaybackManager)audioPlaybackManager
{
  return self->_audioPlaybackManager;
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

- (NAFuture)templateProviderFuture
{
  return self->_templateProviderFuture;
}

- (void)setTemplateProviderFuture:(id)a3
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

- (BOOL)isPopping
{
  return self->_isPopping;
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (CPUIThrottle)updateThrottle
{
  return self->_updateThrottle;
}

- (void)setUpdateThrottle:(id)a3
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