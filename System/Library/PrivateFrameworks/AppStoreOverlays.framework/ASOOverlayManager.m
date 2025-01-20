@interface ASOOverlayManager
- (ASOOverlayManager)initWithScene:(id)a3;
- (ASOOverlayManager)initWithWindowScene:(id)a3;
- (ASOOverlayViewController)viewController;
- (ASOOverlayWindow)window;
- (UIScene)_scene;
- (id)makeViewControllerIfNeeded;
- (void)_setScene:(id)a3;
- (void)didFinishDismissingOverlay;
- (void)dismissOverlay;
- (void)presentOverlay:(id)a3;
- (void)setViewController:(id)a3;
- (void)willStartPresentingOverlay;
@end

@implementation ASOOverlayManager

- (ASOOverlayManager)initWithScene:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASOOverlayManager;
  v5 = [(ASOOverlayManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_scene, v4);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v9 = [[ASOOverlayWindow alloc] initWithWindowScene:v4];
      window = v6->_window;
      v6->_window = v9;

      [(ASOOverlayWindow *)v6->_window setHidden:0];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Attempted to create overlay manager without a window scene", v12, 2u);
    }
  }

  return v6;
}

- (ASOOverlayManager)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASOOverlayManager;
  v5 = [(ASOOverlayManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    id v7 = [[ASOOverlayWindow alloc] initWithWindowScene:v4];
    window = v6->_window;
    v6->_window = v7;
  }
  return v6;
}

- (void)presentOverlay:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Overlay manager received present overlay call: %@", buf, 0xCu);
  }
  v5 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (v6 == 6
    || ([(ASOOverlayManager *)self window],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__ASOOverlayManager_presentOverlay___block_invoke;
    v8[3] = &unk_26431CE10;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v8);
  }
}

void __36__ASOOverlayManager_presentOverlay___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) makeViewControllerIfNeeded];
  [v8 setOverlayManager:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) overlayConfiguration];
  v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 bundleIdentifier];
  [v2 setAdditionalValue:v4 forKey:@"ASOOverlayConfigurationParameterHostBundleID"];

  v5 = [*(id *)(a1 + 40) overlayConfiguration];
  uint64_t v6 = [*(id *)(a1 + 32) _scene];
  id v7 = [v6 _sceneIdentifier];
  [v5 setAdditionalValue:v7 forKey:@"ASOOverlayConfigurationParameterHostSceneIdentifier"];

  [v8 presentOverlay:*(void *)(a1 + 40)];
}

- (void)dismissOverlay
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218366000, &_os_log_internal, OS_LOG_TYPE_INFO, "Overlay manager received dismiss overlay call", buf, 2u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ASOOverlayManager_dismissOverlay__block_invoke;
  block[3] = &unk_26431CD10;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __35__ASOOverlayManager_dismissOverlay__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewController];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) viewController];
    [v3 dismissOverlay];
  }
}

- (void)willStartPresentingOverlay
{
  id v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 != 6)
  {
    v5 = [(ASOOverlayManager *)self window];
    uint64_t v6 = [v5 rootViewController];

    if (!v6)
    {
      id v7 = [(ASOOverlayManager *)self window];
      id v8 = [(ASOOverlayManager *)self viewController];
      [v7 setRootViewController:v8];
    }
    id v9 = [(ASOOverlayManager *)self window];
    [v9 setHidden:0];
  }
}

- (void)didFinishDismissingOverlay
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ASOOverlayManager_didFinishDismissingOverlay__block_invoke;
  block[3] = &unk_26431CD10;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __47__ASOOverlayManager_didFinishDismissingOverlay__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 != 6)
  {
    uint64_t v4 = [*(id *)(a1 + 32) window];
    [v4 setHidden:1];

    id v5 = [*(id *)(a1 + 32) window];
    [v5 setRootViewController:0];
  }
}

- (id)makeViewControllerIfNeeded
{
  uint64_t v3 = [(ASOOverlayManager *)self viewController];

  if (!v3)
  {
    uint64_t v4 = objc_opt_new();
    [(ASOOverlayManager *)self setViewController:v4];

    id v5 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6 != 6)
    {
      id v7 = [(ASOOverlayManager *)self window];
      id v8 = [(ASOOverlayManager *)self viewController];
      [v7 setRootViewController:v8];
    }
    id v9 = [(ASOOverlayManager *)self viewController];
    [v9 loadViewIfNeeded];
  }

  return [(ASOOverlayManager *)self viewController];
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (ASOOverlayWindow)window
{
  return self->_window;
}

- (ASOOverlayViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_window, 0);

  objc_destroyWeak((id *)&self->_scene);
}

@end