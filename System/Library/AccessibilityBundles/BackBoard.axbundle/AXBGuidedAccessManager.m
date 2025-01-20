@interface AXBGuidedAccessManager
+ (BOOL)allowsTripleClickSheet;
+ (BOOL)inGuidedAccess;
+ (void)initializeMonitor;
- (AXBGuidedAccessManager)init;
- (id)_guidedAccessServer;
- (void)_loadBackboardServerBundle;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation AXBGuidedAccessManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken_2 != -1) {
    dispatch_once(&initializeMonitor_onceToken_2, &__block_literal_global_6);
  }
}

uint64_t __43__AXBGuidedAccessManager_initializeMonitor__block_invoke()
{
  SharedManager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (AXBGuidedAccessManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)AXBGuidedAccessManager;
  v2 = [(AXBGuidedAccessManager *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263F8B1D8];
    v5 = [MEMORY[0x263F08A48] mainQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __30__AXBGuidedAccessManager_init__block_invoke;
    v12[3] = &unk_26510B6E0;
    v6 = v2;
    v13 = v6;
    uint64_t v7 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v12];
    id notificationToken = v6->_notificationToken;
    v6->_id notificationToken = (id)v7;

    v11 = v6;
    AXPerformBlockOnMainThreadAfterDelay();
    v9 = v11;
  }
  return v2;
}

uint64_t __30__AXBGuidedAccessManager_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadBackboardServerBundle];
}

void __30__AXBGuidedAccessManager_init__block_invoke_2(uint64_t a1)
{
  if (_AXSGuidedAccessRequiresApplicationAccessibility()) {
    [*(id *)(a1 + 32) _loadBackboardServerBundle];
  }
  v2 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__AXBGuidedAccessManager_init__block_invoke_3;
  block[3] = &unk_26510B378;
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, block);
}

void __30__AXBGuidedAccessManager_init__block_invoke_3(uint64_t a1)
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53708]];
  _AXSSpeechSettingsSetDisabledByManagedConfiguration();

  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 registerObserver:*(void *)(a1 + 32)];
}

- (id)_guidedAccessServer
{
  return self->_guidedAccessServer;
}

+ (BOOL)inGuidedAccess
{
  v2 = [(id)SharedManager _guidedAccessServer];
  id v3 = [v2 safeValueForKey:@"isActive"];
  if ([v3 BOOLValue])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [v2 safeValueForKey:@"isInWorkspace"];
    char v4 = [v5 BOOLValue];
  }
  return v4;
}

+ (BOOL)allowsTripleClickSheet
{
  v2 = [(id)SharedManager _guidedAccessServer];
  char v3 = [v2 safeBoolForKey:@"allowsTripleClickSheet"];

  return v3;
}

- (void)_loadBackboardServerBundle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke;
  block[3] = &unk_26510B378;
  void block[4] = self;
  if (_loadBackboardServerBundle_onceToken != -1) {
    dispatch_once(&_loadBackboardServerBundle_onceToken, block);
  }
}

void __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke(uint64_t a1)
{
  v2 = GAXLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_INFO, "****************** Loading GAX Backboard Server Bundle ****************", v9, 2u);
  }

  char v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/AccessibilityBundles/GAXBackboardServer.bundle"];
  char v4 = v3;
  if (v3)
  {
    if ([v3 loadAndReturnError:0])
    {
      v5 = (void *)[v4 principalClass];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v6 = [v5 performSelector:sel_sharedInstance withObject:0];
        uint64_t v7 = *(void *)(a1 + 32);
        v8 = *(NSObject **)(v7 + 16);
        *(void *)(v7 + 16) = v6;
      }
      else
      {
        v8 = GAXLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_2((uint64_t)v5, v8);
        }
      }
    }
    else
    {
      v8 = GAXLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_3(v8);
      }
    }
  }
  else
  {
    v8 = GAXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_1(v8);
    }
  }
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", a3, a4);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 effectiveBoolValueForSetting:*MEMORY[0x263F53708]];
  _AXSSpeechSettingsSetDisabledByManagedConfiguration();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_guidedAccessServer, 0);

  objc_storeStrong(&self->_notificationToken, 0);
}

void __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_241F5C000, log, OS_LOG_TYPE_ERROR, "**** AX Error: Could not load GAXBackboardServer bundle. bundleWithPath came back nil", v1, 2u);
}

void __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_241F5C000, a2, OS_LOG_TYPE_ERROR, "**** AX Error: Could not initialize GAXBackboardServer instance: %@", (uint8_t *)&v2, 0xCu);
}

void __52__AXBGuidedAccessManager__loadBackboardServerBundle__block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_241F5C000, log, OS_LOG_TYPE_ERROR, "**** AX Error: Accessibility: Could not load GAXBackboardServer bundle", v1, 2u);
}

@end