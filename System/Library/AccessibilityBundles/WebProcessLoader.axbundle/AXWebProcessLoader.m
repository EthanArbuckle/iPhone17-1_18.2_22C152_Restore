@interface AXWebProcessLoader
+ (void)_accessibilityLoadWebCoreAXBundle;
+ (void)_axUpdated:(id)a3;
+ (void)_registerForAccessibility;
+ (void)initialize;
@end

@implementation AXWebProcessLoader

+ (void)_axUpdated:(id)a3
{
  dispatch_time_t v3 = dispatch_time(0, 50000000);
  v4 = MEMORY[0x263EF83A0];

  dispatch_after(v3, v4, &__block_literal_global);
}

void __33__AXWebProcessLoader__axUpdated___block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v0 = _AXSApplicationAccessibilityEnabled();
  v1 = AXLogCommon();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    v2[0] = 67109120;
    v2[1] = v0 != 0;
    _os_log_impl(&dword_2404D0000, v1, OS_LOG_TYPE_INFO, "WebProcess loader updated: checking whether to load: %d", (uint8_t *)v2, 8u);
  }

  if (v0)
  {
    if (MACancelDownloadErrorDomain_block_invoke_onceToken != -1) {
      dispatch_once(&MACancelDownloadErrorDomain_block_invoke_onceToken, &__block_literal_global_268);
    }
  }
}

void __33__AXWebProcessLoader__axUpdated___block_invoke_266()
{
  if (_CFMZEnabled()) {
    AXAccessibilityMacCatalystBundlesDirectory();
  }
  else {
  int v0 = AXAccessibilityBundlesDirectory();
  }
  v1 = (void *)MEMORY[0x263F086E0];
  v2 = [v0 stringByAppendingPathComponent:@"WebProcess.axbundle"];
  uint64_t v3 = [v1 bundleWithPath:v2];

  id v8 = 0;
  int v4 = [v3 loadAndReturnError:&v8];
  id v5 = v8;
  if (v4)
  {
    id v6 = (id)objc_msgSend((id)objc_msgSend(v3, "principalClass"), "safeValueForKey:", @"accessibilityInitializeBundle");
  }
  else
  {
    v7 = AXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __33__AXWebProcessLoader__axUpdated___block_invoke_266_cold_1();
    }
  }
}

+ (void)_registerForAccessibility
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:a1 selector:sel__axUpdated_ name:*MEMORY[0x263F8B120] object:0];
}

+ (void)initialize
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__AXWebProcessLoader_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

uint64_t __32__AXWebProcessLoader_initialize__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = _AXSApplicationAccessibilityEnabled();
  id v3 = AXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5[0] = 67109120;
    v5[1] = v2 != 0;
    _os_log_impl(&dword_2404D0000, v3, OS_LOG_TYPE_INFO, "WebProcess loader checking whether to load: %d", (uint8_t *)v5, 8u);
  }

  if (v2) {
    [*(id *)(a1 + 32) _accessibilityLoadWebCoreAXBundle];
  }
  [*(id *)(a1 + 32) _axUpdated:0];
  return [*(id *)(a1 + 32) _registerForAccessibility];
}

+ (void)_accessibilityLoadWebCoreAXBundle
{
  if (_accessibilityLoadWebCoreAXBundle_onceToken != -1) {
    dispatch_once(&_accessibilityLoadWebCoreAXBundle_onceToken, &__block_literal_global_277);
  }
}

void __55__AXWebProcessLoader__accessibilityLoadWebCoreAXBundle__block_invoke()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (_CFMZEnabled()) {
    AXAccessibilityMacCatalystBundlesDirectory();
  }
  else {
  int v0 = AXAccessibilityBundlesDirectory();
  }
  v1 = (void *)MEMORY[0x263F086E0];
  int v2 = [v0 stringByAppendingPathComponent:@"WebCore.axbundle"];
  id v3 = [v1 bundleWithPath:v2];

  int v4 = AXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_2404D0000, v4, OS_LOG_TYPE_INFO, "Loading WebCore bundle: %@", buf, 0xCu);
  }

  id v9 = 0;
  int v5 = [v3 loadAndReturnError:&v9];
  id v6 = v9;
  if (v5)
  {
    id v7 = (id)objc_msgSend((id)objc_msgSend(v3, "principalClass"), "safeValueForKey:", @"accessibilityInitializeBundle");
  }
  else
  {
    id v8 = AXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __33__AXWebProcessLoader__axUpdated___block_invoke_266_cold_1();
    }
  }
}

void __33__AXWebProcessLoader__axUpdated___block_invoke_266_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2404D0000, v0, v1, "Error loading bundle: %@ %@");
}

@end