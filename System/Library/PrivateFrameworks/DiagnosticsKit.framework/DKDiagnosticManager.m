@interface DKDiagnosticManager
- (BOOL)_checkPrerequisitesForDiagnostic:(id)a3 parameters:(id)a4 error:(id *)a5;
- (BOOL)_freeSpaceAvailable:(id)a3;
- (BOOL)_isDeviceLocked;
- (BOOL)pluginReloadRequested;
- (DKAccessoryResponder)accessoryResponder;
- (DKAssetResponder)assetResponder;
- (DKBrightnessResponder)brightnessResponder;
- (DKDiagnosticAllowList)allowList;
- (DKDiagnosticManager)init;
- (DKDiagnosticManager)initWithBundleIdentifier:(id)a3;
- (DKDiagnosticManager)initWithBundleIdentifier:(id)a3 connectionRoute:(unint64_t)a4;
- (DKDiagnosticRegistry)registry;
- (DKExtensionDiscovery)discovery;
- (DKProgressResponder)progressResponder;
- (DKStatusBarResponder)statusBarResponder;
- (DKUserAlertResponder)userAlertResponder;
- (DKViewControllerDelegate)viewControllerDelegate;
- (DKVolumeHUDResponder)volumeHUDResponder;
- (NSString)bundleIdentifier;
- (OS_dispatch_queue)diagnosticListQueue;
- (OS_dispatch_queue)diagnosticsManagerQueue;
- (id)adapterForIdentifier:(id)a3;
- (id)attributesForIdentifier:(id)a3;
- (unint64_t)connectionRoute;
- (void)_reloadUpdatedPlugins;
- (void)allowSessionAccessoryDisconnectForDuration:(id)a3;
- (void)beginDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5;
- (void)cancelAllDiagnostics;
- (void)clearAllowSessionAccessoryDisconnect;
- (void)diagnosticsWithCompletion:(id)a3;
- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6;
- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10;
- (void)enableVolumeHUD:(BOOL)a3;
- (void)getAsset:(id)a3 completion:(id)a4;
- (void)hideStatusBar;
- (void)request:(id)a3 dismissViewController:(id)a4 completion:(id)a5;
- (void)request:(id)a3 presentViewController:(id)a4 completion:(id)a5;
- (void)requestPluginReloadOnFinishWithCompletion:(id)a3;
- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3;
- (void)setAccessoryResponder:(id)a3;
- (void)setAllowList:(id)a3;
- (void)setAssetResponder:(id)a3;
- (void)setBrightnessResponder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setConnectionRoute:(unint64_t)a3;
- (void)setDiagnosticListQueue:(id)a3;
- (void)setDiagnosticsManagerQueue:(id)a3;
- (void)setDiscovery:(id)a3;
- (void)setPluginReloadRequested:(BOOL)a3;
- (void)setProgressResponder:(id)a3;
- (void)setRegistry:(id)a3;
- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4;
- (void)setStatusBarResponder:(id)a3;
- (void)setStatusBarStyle:(int64_t)a3;
- (void)setUserAlertResponder:(id)a3;
- (void)setViewControllerDelegate:(id)a3;
- (void)setVolumeHUDResponder:(id)a3;
- (void)showStatusBar;
- (void)unpairSessionAccessoryOnTestCompletion;
- (void)updateProgress:(id)a3 forTest:(id)a4;
- (void)uploadAssets:(id)a3 completion:(id)a4;
@end

@implementation DKDiagnosticManager

- (DKDiagnosticManager)init
{
  return [(DKDiagnosticManager *)self initWithBundleIdentifier:@"Default"];
}

- (DKDiagnosticManager)initWithBundleIdentifier:(id)a3
{
  return [(DKDiagnosticManager *)self initWithBundleIdentifier:a3 connectionRoute:0];
}

- (DKDiagnosticManager)initWithBundleIdentifier:(id)a3 connectionRoute:(unint64_t)a4
{
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DKDiagnosticManager;
  v8 = [(DKDiagnosticManager *)&v22 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_bundleIdentifier, a3);
    v9->_connectionRoute = a4;
    v9->_pluginReloadRequested = 0;
    v10 = MEMORY[0x263EF83A8];
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.DiagnosticsKit.diagnosticsManager", MEMORY[0x263EF83A8]);
    diagnosticsManagerQueue = v9->_diagnosticsManagerQueue;
    v9->_diagnosticsManagerQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.DiagnosticsKit.diagnosticsList", v10);
    diagnosticListQueue = v9->_diagnosticListQueue;
    v9->_diagnosticListQueue = (OS_dispatch_queue *)v13;

    if (!a4)
    {
      uint64_t v15 = objc_opt_new();
      registry = v9->_registry;
      v9->_registry = (DKDiagnosticRegistry *)v15;

      v17 = v9->_registry;
      v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.diagnostics-service", @"com.apple.diagnostics-ui-service", @"com.apple.diagnostics-restricted-service", @"com.apple.diagnostics-restricted-ui-service", 0);
      uint64_t v19 = +[DKExtensionDiscovery discoveryUsingExtensionRegistry:v17 services:v18 bundleIdentifier:v9->_bundleIdentifier];
      discovery = v9->_discovery;
      v9->_discovery = (DKExtensionDiscovery *)v19;
    }
  }

  return v9;
}

- (void)beginDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = [(DKDiagnosticManager *)self diagnosticsManagerQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke;
  v15[3] = &unk_264E86980;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke(uint64_t a1)
{
  v39[1] = *MEMORY[0x263EF8340];
  v3 = [*(id *)(a1 + 32) adapterForIdentifier:*(void *)(a1 + 40)];
  v4 = (void *)MEMORY[0x23ECF6C10](*(void *)(a1 + 56));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_2;
  v30[3] = &unk_264E86AC8;
  id v31 = *(id *)(a1 + 56);
  objc_copyWeak(&v32, &location);
  v5 = (void *)MEMORY[0x23ECF6C10](v30);

  if (!v3)
  {
    v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v38 = *MEMORY[0x263F08320];
    v24 = DKErrorLocalizedDescriptionForCode(-1000);
    v39[0] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    id v9 = [v23 errorWithDomain:@"DKErrorDomain" code:-1000 userInfo:v25];

    if (v9) {
      goto LABEL_15;
    }
  }
  v6 = *(void **)(a1 + 32);
  id v7 = [v3 extensionAttributes];
  uint64_t v8 = *(void *)(a1 + 48);
  id v29 = 0;
  [v6 _checkPrerequisitesForDiagnostic:v7 parameters:v8 error:&v29];
  id v9 = v29;

  if (v9) {
    goto LABEL_15;
  }
  id v10 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)(a1 + 40) longValue];
    *(_DWORD *)buf = 134217984;
    uint64_t v37 = v11;
    _os_log_impl(&dword_23D039000, v10, OS_LOG_TYPE_DEFAULT, "Found diagnostic for ID: %ld", buf, 0xCu);
  }

  id v12 = [v3 extensionAttributes];
  id v13 = +[DKExtensionRequest requestWithExtensionAttributes:v12];

  [v13 setHostServicesDelegate:*(void *)(a1 + 32)];
  if (!v13)
  {
    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    v27 = DKErrorLocalizedDescriptionForCode(-1001);
    v35 = v27;
    v28 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    id v9 = [v26 errorWithDomain:@"DKErrorDomain" code:-1001 userInfo:v28];

    if (!v9) {
      goto LABEL_16;
    }
LABEL_15:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_16;
  }
  id v14 = [*(id *)(a1 + 32) allowList];
  if (v14)
  {
    uint64_t v15 = [*(id *)(a1 + 32) allowList];
    char v16 = [v15 containsIdentifier:*(void *)(a1 + 40)];

    if ((v16 & 1) == 0)
    {
      id v17 = [*(id *)(a1 + 32) attributesForIdentifier:*(void *)(a1 + 40)];
      id v18 = DiagnosticsKitLogHandleForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        uint64_t v19 = *(void *)(a1 + 40);
        v20 = [v17 name];
        __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_cold_1(v19, v20, buf, v18);
      }

      v21 = [*(id *)(a1 + 32) allowList];
      objc_super v22 = [v21 contactMessage];
      [v13 setNotAllowListedWithContactMessage:v22];
    }
  }
  [v3 beginRequest:v13 payload:*(void *)(a1 + 48) completion:v5];

  id v9 = 0;
LABEL_16:
  objc_destroyWeak(&v32);

  objc_destroyWeak(&location);
}

void __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v2);
  int v4 = [WeakRetained pluginReloadRequested];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 _reloadUpdatedPlugins];
  }
}

- (void)diagnosticsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DKDiagnosticManager *)self diagnosticListQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__DKDiagnosticManager_diagnosticsWithCompletion___block_invoke;
  v7[3] = &unk_264E86828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __49__DKDiagnosticManager_diagnosticsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) discovery];
  [v2 waitUntilComplete];

  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) registry];
  id v4 = [v5 diagnostics];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (id)attributesForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DKDiagnosticManager *)self discovery];
  [v5 waitUntilComplete];

  id v6 = [(DKDiagnosticManager *)self registry];
  id v7 = [v6 diagnosticForIdentifier:v4];

  return v7;
}

- (id)adapterForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DKDiagnosticManager *)self discovery];
  [v5 waitUntilComplete];

  id v6 = [(DKDiagnosticManager *)self registry];
  id v7 = [v6 adapterForIdentifier:v4];

  return v7;
}

- (void)cancelAllDiagnostics
{
  id v2 = [(DKDiagnosticManager *)self registry];
  [v2 enumerateExtensionAdaptersWithBlock:&__block_literal_global_11];
}

uint64_t __43__DKDiagnosticManager_cancelAllDiagnostics__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelAll];
}

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(DKDiagnosticManager *)self progressResponder];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [(DKDiagnosticManager *)self progressResponder];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(DKDiagnosticManager *)self progressResponder];
      [v11 updateProgress:v12 forTest:v6];
    }
  }
}

- (void)getAsset:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(DKDiagnosticManager *)self assetResponder];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(DKDiagnosticManager *)self assetResponder];
    [v9 getAsset:v10 completion:v6];
  }
}

- (void)uploadAssets:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(DKDiagnosticManager *)self assetResponder];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(DKDiagnosticManager *)self assetResponder];
    [v9 uploadAssets:v10 completion:v6];
  }
}

- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(DKDiagnosticManager *)self accessoryResponder];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(DKDiagnosticManager *)self accessoryResponder];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(DKDiagnosticManager *)self accessoryResponder];
      [v8 requestSessionAccessoryIdentifierWithCompletion:v9];
    }
  }
}

- (void)unpairSessionAccessoryOnTestCompletion
{
  uint64_t v3 = [(DKDiagnosticManager *)self accessoryResponder];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = [(DKDiagnosticManager *)self accessoryResponder];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(DKDiagnosticManager *)self accessoryResponder];
      [v7 unpairSessionAccessoryOnTestCompletion];
    }
  }
}

- (void)allowSessionAccessoryDisconnectForDuration:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(DKDiagnosticManager *)self accessoryResponder];
  if (v4)
  {
    id v5 = (void *)v4;
    char v6 = [(DKDiagnosticManager *)self accessoryResponder];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      char v8 = [(DKDiagnosticManager *)self accessoryResponder];
      [v8 allowSessionAccessoryDisconnectForDuration:v9];
    }
  }
}

- (void)clearAllowSessionAccessoryDisconnect
{
  uint64_t v3 = [(DKDiagnosticManager *)self accessoryResponder];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = [(DKDiagnosticManager *)self accessoryResponder];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(DKDiagnosticManager *)self accessoryResponder];
      [v7 clearAllowSessionAccessoryDisconnect];
    }
  }
}

- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(DKDiagnosticManager *)self userAlertResponder];
  if (v13)
  {
    id v14 = (void *)v13;
    uint64_t v15 = [(DKDiagnosticManager *)self userAlertResponder];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = [(DKDiagnosticManager *)self userAlertResponder];
      [v17 displayAlertWithHeader:v18 message:v10 buttonStrings:v11 completion:v12];
    }
  }
}

- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10
{
  uint64_t v14 = *(void *)&a4;
  id v36 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  uint64_t v22 = [(DKDiagnosticManager *)self userAlertResponder];
  if (v22)
  {
    v23 = (void *)v22;
    [(DKDiagnosticManager *)self userAlertResponder];
    v35 = self;
    id v24 = v21;
    id v25 = v20;
    id v26 = v19;
    id v27 = v18;
    id v28 = v17;
    id v29 = v16;
    id v31 = v30 = v14;
    char v32 = objc_opt_respondsToSelector();

    uint64_t v33 = v30;
    id v16 = v29;
    id v17 = v28;
    id v18 = v27;
    id v19 = v26;
    id v20 = v25;
    id v21 = v24;

    if (v32)
    {
      uint64_t v34 = [(DKDiagnosticManager *)v35 userAlertResponder];
      [v34 displayInstructions:v36 style:v33 imageLocators:v16 title:v17 subtitle:v18 iconLocator:v19 options:v20 completion:v24];
    }
  }
}

- (void)showStatusBar
{
  uint64_t v3 = [(DKDiagnosticManager *)self statusBarResponder];

  if (v3)
  {
    id v4 = [(DKDiagnosticManager *)self statusBarResponder];
    [v4 showStatusBar];
  }
}

- (void)hideStatusBar
{
  uint64_t v3 = [(DKDiagnosticManager *)self statusBarResponder];

  if (v3)
  {
    id v4 = [(DKDiagnosticManager *)self statusBarResponder];
    [v4 hideStatusBar];
  }
}

- (void)setStatusBarStyle:(int64_t)a3
{
  id v5 = [(DKDiagnosticManager *)self statusBarResponder];

  if (v5)
  {
    id v6 = [(DKDiagnosticManager *)self statusBarResponder];
    [v6 setStatusBarStyle:a3];
  }
}

- (void)request:(id)a3 presentViewController:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  char v8 = [(DKDiagnosticManager *)self viewControllerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    [v11 setModalPresentationStyle:0];
    id v10 = [(DKDiagnosticManager *)self viewControllerDelegate];
    [v10 diagnosticManager:self presentViewController:v11 completion:v7];
  }
}

- (void)request:(id)a3 dismissViewController:(id)a4 completion:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  char v8 = [(DKDiagnosticManager *)self viewControllerDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(DKDiagnosticManager *)self viewControllerDelegate];
    [v10 diagnosticManager:self dismissViewController:v11 completion:v7];
  }
}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(DKDiagnosticManager *)self brightnessResponder];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v10 = [(DKDiagnosticManager *)self brightnessResponder];
    *(float *)&double v9 = a3;
    [v10 setScreenToBrightness:v4 animate:v9];
  }
}

- (void)enableVolumeHUD:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DKDiagnosticManager *)self volumeHUDResponder];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(DKDiagnosticManager *)self volumeHUDResponder];
    [v7 enableVolumeHUD:v3];
  }
}

- (void)requestPluginReloadOnFinishWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  id v5 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_23D039000, v5, OS_LOG_TYPE_DEFAULT, "Plugin reload was requested by the running DK extension", v6, 2u);
  }

  [(DKDiagnosticManager *)self setPluginReloadRequested:1];
  v4[2](v4);
}

- (void)_reloadUpdatedPlugins
{
  BOOL v3 = [(DKDiagnosticManager *)self registry];
  BOOL v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"com.apple.diagnostics-service", @"com.apple.diagnostics-ui-service", @"com.apple.diagnostics-restricted-service", @"com.apple.diagnostics-restricted-ui-service", 0);
  id v5 = [(DKDiagnosticManager *)self bundleIdentifier];
  char v6 = +[DKExtensionDiscovery discoveryUsingExtensionRegistry:v3 services:v4 bundleIdentifier:v5];
  [(DKDiagnosticManager *)self setDiscovery:v6];

  id v7 = [(DKDiagnosticManager *)self discovery];
  [v7 waitUntilComplete];

  [(DKDiagnosticManager *)self setPluginReloadRequested:0];
}

- (BOOL)_checkPrerequisitesForDiagnostic:(id)a3 parameters:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  double v9 = [a4 specifications];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v10 = 0;
LABEL_7:
    id v11 = [v8 freeSpaceRequired];

    goto LABEL_8;
  }
  id v10 = [v9 objectForKeyedSubscript:@"freeSpaceRequired"];
  if (!v10) {
    goto LABEL_7;
  }
  objc_opt_class();
  id v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
LABEL_8:
  BOOL v12 = [(DKDiagnosticManager *)self _freeSpaceAvailable:v11];
  char v13 = v12;
  if (a5 && !v12)
  {
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08320];
    uint64_t v15 = DKErrorLocalizedDescriptionForCode(-1005);
    v25[0] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    *a5 = [v14 errorWithDomain:@"DKErrorDomain" code:-1005 userInfo:v16];
  }
  if ([v8 requiresUnlock])
  {
    int v17 = ![(DKDiagnosticManager *)self _isDeviceLocked];
    v13 &= v17;
    if (a5)
    {
      if ((v17 & 1) == 0)
      {
        id v18 = (void *)MEMORY[0x263F087E8];
        uint64_t v22 = *MEMORY[0x263F08320];
        id v19 = DKErrorLocalizedDescriptionForCode(-1007);
        v23 = v19;
        id v20 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        *a5 = [v18 errorWithDomain:@"DKErrorDomain" code:-1007 userInfo:v20];

        char v13 = 0;
      }
    }
  }

  return v13;
}

- (BOOL)_isDeviceLocked
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = MGGetBoolAnswer();
  BOOL v3 = DiagnosticsKitLogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_23D039000, v3, OS_LOG_TYPE_DEFAULT, "Device lock status: %d", (uint8_t *)v5, 8u);
  }

  return v2;
}

- (BOOL)_freeSpaceAvailable:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = [NSURL fileURLWithPath:@"/private/var"];
  id v13 = 0;
  uint64_t v5 = *MEMORY[0x263EFF858];
  id v12 = 0;
  [v4 getResourceValue:&v13 forKey:v5 error:&v12];
  id v6 = v13;
  id v7 = v12;
  id v8 = DiagnosticsKitLogHandleForCategory(1);
  double v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = v3;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_23D039000, v9, OS_LOG_TYPE_DEFAULT, "Free space required by diagnostic: %@, available space: %@", buf, 0x16u);
    }

    BOOL v10 = [v6 compare:v3] != -1;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[DKDiagnosticManager _freeSpaceAvailable:]((uint64_t)v7, v9);
    }

    BOOL v10 = 1;
  }

  return v10;
}

- (DKProgressResponder)progressResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressResponder);
  return (DKProgressResponder *)WeakRetained;
}

- (void)setProgressResponder:(id)a3
{
}

- (DKAssetResponder)assetResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetResponder);
  return (DKAssetResponder *)WeakRetained;
}

- (void)setAssetResponder:(id)a3
{
}

- (DKAccessoryResponder)accessoryResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessoryResponder);
  return (DKAccessoryResponder *)WeakRetained;
}

- (void)setAccessoryResponder:(id)a3
{
}

- (DKUserAlertResponder)userAlertResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_userAlertResponder);
  return (DKUserAlertResponder *)WeakRetained;
}

- (void)setUserAlertResponder:(id)a3
{
}

- (DKDiagnosticAllowList)allowList
{
  return self->_allowList;
}

- (void)setAllowList:(id)a3
{
  self->_allowList = (DKDiagnosticAllowList *)a3;
}

- (OS_dispatch_queue)diagnosticsManagerQueue
{
  return self->_diagnosticsManagerQueue;
}

- (void)setDiagnosticsManagerQueue:(id)a3
{
}

- (OS_dispatch_queue)diagnosticListQueue
{
  return self->_diagnosticListQueue;
}

- (void)setDiagnosticListQueue:(id)a3
{
}

- (DKDiagnosticRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (DKExtensionDiscovery)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (unint64_t)connectionRoute
{
  return self->_connectionRoute;
}

- (void)setConnectionRoute:(unint64_t)a3
{
  self->_connectionRoute = a3;
}

- (DKBrightnessResponder)brightnessResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_brightnessResponder);
  return (DKBrightnessResponder *)WeakRetained;
}

- (void)setBrightnessResponder:(id)a3
{
}

- (DKVolumeHUDResponder)volumeHUDResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_volumeHUDResponder);
  return (DKVolumeHUDResponder *)WeakRetained;
}

- (void)setVolumeHUDResponder:(id)a3
{
}

- (DKStatusBarResponder)statusBarResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarResponder);
  return (DKStatusBarResponder *)WeakRetained;
}

- (void)setStatusBarResponder:(id)a3
{
}

- (DKViewControllerDelegate)viewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerDelegate);
  return (DKViewControllerDelegate *)WeakRetained;
}

- (void)setViewControllerDelegate:(id)a3
{
}

- (BOOL)pluginReloadRequested
{
  return self->_pluginReloadRequested;
}

- (void)setPluginReloadRequested:(BOOL)a3
{
  self->_pluginReloadRequested = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerDelegate);
  objc_destroyWeak((id *)&self->_statusBarResponder);
  objc_destroyWeak((id *)&self->_volumeHUDResponder);
  objc_destroyWeak((id *)&self->_brightnessResponder);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong((id *)&self->_registry, 0);
  objc_storeStrong((id *)&self->_diagnosticListQueue, 0);
  objc_storeStrong((id *)&self->_diagnosticsManagerQueue, 0);
  objc_destroyWeak((id *)&self->_userAlertResponder);
  objc_destroyWeak((id *)&self->_accessoryResponder);
  objc_destroyWeak((id *)&self->_assetResponder);
  objc_destroyWeak((id *)&self->_progressResponder);
}

void __75__DKDiagnosticManager_beginDiagnosticWithIdentifier_parameters_completion___block_invoke_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_23D039000, log, OS_LOG_TYPE_FAULT, "This DiagnosticsKit extension (%@ - %@) is not allow listed with the DK host application", buf, 0x16u);
}

- (void)_freeSpaceAvailable:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D039000, a2, OS_LOG_TYPE_ERROR, "Unable to check available disk space prior to running diagnostic with error: %@", (uint8_t *)&v2, 0xCu);
}

@end