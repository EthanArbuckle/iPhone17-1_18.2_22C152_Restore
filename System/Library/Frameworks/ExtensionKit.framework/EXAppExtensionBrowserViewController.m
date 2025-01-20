@interface EXAppExtensionBrowserViewController
- (_EXHostViewController)hostViewController;
- (void)beginHosting;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EXAppExtensionBrowserViewController

- (void)loadView
{
  v21[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  v4 = objc_alloc_init(_EXHostViewController);
  hostViewController = self->_hostViewController;
  self->_hostViewController = v4;

  v6 = [(_EXHostViewController *)self->_hostViewController view];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v6];
  v15 = (void *)MEMORY[0x263F08938];
  v20 = [v6 leftAnchor];
  v19 = [v3 leftAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  v17 = [v6 topAnchor];
  v16 = [v3 topAnchor];
  v14 = [v17 constraintEqualToAnchor:v16];
  v21[1] = v14;
  v7 = [v6 rightAnchor];
  v8 = [v3 rightAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v21[2] = v9;
  v10 = [v6 bottomAnchor];
  v11 = [v3 bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v21[3] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
  [v15 activateConstraints:v13];

  [(EXAppExtensionBrowserViewController *)self addChildViewController:self->_hostViewController];
  [(EXAppExtensionBrowserViewController *)self setView:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(EXAppExtensionBrowserViewController *)self beginHosting];
  v5.receiver = self;
  v5.super_class = (Class)EXAppExtensionBrowserViewController;
  [(EXAppExtensionBrowserViewController *)&v5 viewWillAppear:v3];
}

- (void)beginHosting
{
  id v3 = objc_alloc(MEMORY[0x263F04DE8]);
  v4 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_0];
  objc_super v5 = (void *)[v3 initWithExtensionPointIdentifier:@"com.apple.extensionkit.app-extension-management" predicate:v4];

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x263F04DF0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_2;
  v7[3] = &unk_264258660;
  objc_copyWeak(&v8, &location);
  [v6 executeQuery:v5 completionHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

BOOL __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 bundleIdentifier];
  if ([v3 isEqual:@"com.apple.extensionkit.AppExtensionManagement"])
  {
    v4 = [v2 entitlementNamed:@"com.apple.private.extensionkit.extension-management" ofClass:objc_opt_class()];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 firstObject];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_17;
    v8[3] = &unk_264258638;
    objc_copyWeak(&v10, (id *)(a1 + 32));
    id v9 = v5;
    id v6 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    v7 = _EXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_2_cold_1(v7);
    }

    __break(1u);
  }
}

void __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = [[_EXHostViewControllerConfiguration alloc] initWithExtensionIdentity:*(void *)(a1 + 32)];
    [(_EXHostViewControllerConfiguration *)v2 setSceneIdentifier:@"default"];
    id v3 = [WeakRetained hostViewController];
    [v3 setConfiguration:v2];
  }
}

- (_EXHostViewController)hostViewController
{
  return (_EXHostViewController *)objc_getProperty(self, a2, 976, 1);
}

- (void).cxx_destruct
{
}

void __51__EXAppExtensionBrowserViewController_beginHosting__block_invoke_2_cold_1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = "identity";
  __int16 v3 = 2080;
  int v1 = 136315650;
  uint64_t v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionKit/ExtensionKit/Source/ExtensionManagement/EXAppExtensionBrowserViewController.m";
  __int16 v5 = 1024;
  int v6 = 70;
  _os_log_fault_impl(&dword_2156DD000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Failed to find management extension.", (uint8_t *)&v1, 0x1Cu);
}

@end