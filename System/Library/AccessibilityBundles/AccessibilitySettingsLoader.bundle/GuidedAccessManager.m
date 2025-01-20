@interface GuidedAccessManager
+ (void)initializeMonitoring;
- (BOOL)_isValidClientApp;
- (BOOL)applicationIsEntitledForUnmanagedASAM;
- (GuidedAccessManager)init;
- (id)notificationToken;
- (void)_loadClientBundle;
- (void)_loadRequiredBundles;
- (void)_loadSpringboardServerBundle;
- (void)dealloc;
- (void)loadRequiredBundlesForUnmanagedASAM;
- (void)setNotificationToken:(id)a3;
@end

@implementation GuidedAccessManager

void __40__GuidedAccessManager__isValidClientApp__block_invoke()
{
  id v2 = [MEMORY[0x263EFFA08] setWithArray:&unk_26F3FFF30];
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];
  _isValidClientApp_IsValidClientApp = [v2 containsObject:v1] ^ 1;
}

uint64_t __43__GuidedAccessManager_initializeMonitoring__block_invoke()
{
  initializeMonitoring_SharedManager = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (GuidedAccessManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)GuidedAccessManager;
  id v2 = [(GuidedAccessManager *)&v14 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263F8B1D8];
    v5 = [MEMORY[0x263F08A48] mainQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __27__GuidedAccessManager_init__block_invoke;
    v12[3] = &unk_26509DC08;
    v6 = v2;
    v13 = v6;
    uint64_t v7 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v12];
    id notificationToken = v6->_notificationToken;
    v6->_id notificationToken = (id)v7;

    if ([(GuidedAccessManager *)v6 applicationIsEntitledForUnmanagedASAM])
    {
      [(GuidedAccessManager *)v6 loadRequiredBundlesForUnmanagedASAM];
    }
    else if (_AXSGuidedAccessRequiresApplicationAccessibility())
    {
      [(GuidedAccessManager *)v6 _loadRequiredBundles];
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_handleGuidedAccessActiveStatusDidChangeBroadcastNotification, @"AXGuidedAccessActiveStatusDidChangeBroadcastNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
    v10 = v6;
  }
  return v2;
}

- (BOOL)applicationIsEntitledForUnmanagedASAM
{
  if (![(GuidedAccessManager *)self _isValidClientApp]) {
    return 0;
  }
  id v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (_hasBooleanEntitlement(v2, (void *)*MEMORY[0x263F8B0B0])
    || _hasBooleanEntitlement(v2, (void *)*MEMORY[0x263F8B0A8]))
  {
    BOOL hasBooleanEntitlement = 1;
    if (!v2) {
      return hasBooleanEntitlement;
    }
    goto LABEL_8;
  }
  BOOL hasBooleanEntitlement = _hasBooleanEntitlement(v2, (void *)*MEMORY[0x263F8B0C0]);
  if (v2) {
LABEL_8:
  }
    CFRelease(v2);
  return hasBooleanEntitlement;
}

- (BOOL)_isValidClientApp
{
  if (_isValidClientApp_onceToken != -1) {
    dispatch_once(&_isValidClientApp_onceToken, &__block_literal_global_284);
  }
  return _isValidClientApp_IsValidClientApp;
}

+ (void)initializeMonitoring
{
  if (initializeMonitoring_onceToken != -1) {
    dispatch_once(&initializeMonitoring_onceToken, &__block_literal_global_1);
  }
}

uint64_t __27__GuidedAccessManager_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadRequiredBundles];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"AXGuidedAccessActiveStatusDidChangeBroadcastNotification", 0);
  v4.receiver = self;
  v4.super_class = (Class)GuidedAccessManager;
  [(GuidedAccessManager *)&v4 dealloc];
}

- (void)loadRequiredBundlesForUnmanagedASAM
{
  [(GuidedAccessManager *)self _loadRequiredBundles];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v2 = (void *)getAXReplayerClass_softClass;
  uint64_t v9 = getAXReplayerClass_softClass;
  if (!getAXReplayerClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getAXReplayerClass_block_invoke;
    v5[3] = &unk_26509DAA8;
    v5[4] = &v6;
    __getAXReplayerClass_block_invoke((uint64_t)v5);
    id v2 = (void *)v7[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v6, 8);
  objc_super v4 = [v3 replayer];
  [v4 replayWithName:@"Ping BackBoard for unmanaged ASAM" attempts:10 interval:1 async:MEMORY[0x263EF83A0] queue:&__block_literal_global_279 replayBlock:&__block_literal_global_282_0 completion:0.5];
}

uint64_t __58__GuidedAccessManager_loadRequiredBundlesForUnmanagedASAM__block_invoke()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v0 = (void *)getAXBackBoardServerClass_softClass_1;
  uint64_t v9 = getAXBackBoardServerClass_softClass_1;
  if (!getAXBackBoardServerClass_softClass_1)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getAXBackBoardServerClass_block_invoke_1;
    v5[3] = &unk_26509DAA8;
    v5[4] = &v6;
    __getAXBackBoardServerClass_block_invoke_1((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  id v2 = [v1 server];
  uint64_t v3 = [v2 loadGAXBundleForUnmanagedASAM];

  return v3;
}

void __58__GuidedAccessManager_loadRequiredBundlesForUnmanagedASAM__block_invoke_2(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__GuidedAccessManager_loadRequiredBundlesForUnmanagedASAM__block_invoke_2_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)_loadRequiredBundles
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v3 = (unsigned int (*)(void))getAXProcessIsSpringBoardSymbolLoc_ptr_1;
  uint64_t v8 = getAXProcessIsSpringBoardSymbolLoc_ptr_1;
  if (!getAXProcessIsSpringBoardSymbolLoc_ptr_1)
  {
    objc_super v4 = (void *)AccessibilityUtilitiesLibrary_2();
    v6[3] = (uint64_t)dlsym(v4, "AXProcessIsSpringBoard");
    getAXProcessIsSpringBoardSymbolLoc_ptr_1 = (_UNKNOWN *)v6[3];
    uint64_t v3 = (unsigned int (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v3) {
    soft_AXProcessIsSpringBoard_cold_1();
  }
  if (v3())
  {
    [(GuidedAccessManager *)self _loadSpringboardServerBundle];
  }
  else if ([(GuidedAccessManager *)self _isValidClientApp])
  {
    [(GuidedAccessManager *)self _loadClientBundle];
  }
}

- (void)_loadSpringboardServerBundle
{
  if (_loadSpringboardServerBundle_onceToken != -1) {
    dispatch_once(&_loadSpringboardServerBundle_onceToken, &__block_literal_global_309);
  }
}

void __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke()
{
  v0 = GAXLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v14 = 0;
    _os_log_impl(&dword_24016D000, v0, OS_LOG_TYPE_INFO, "****************** Loading GAX SpringBoard Server Bundle ****************", v14, 2u);
  }

  id v1 = (void *)MEMORY[0x263F086E0];
  id v2 = AXSystemRootDirectory();
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"/System/Library/AccessibilityBundles/GAXSpringboardServer.bundle"];
  objc_super v4 = [v1 bundleWithPath:v3];

  if (!v4)
  {
    uint64_t v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  if (([v4 loadAndReturnError:0] & 1) == 0)
  {
    uint64_t v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_3();
    }
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v5 = (void *)[v4 principalClass];
  if (objc_opt_respondsToSelector())
  {
    [v5 performSelector:sel_sharedInstance withObject:0];
  }
  else
  {
    uint64_t v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
  }
LABEL_12:
}

- (void)_loadClientBundle
{
  if (_loadClientBundle_onceToken != -1) {
    dispatch_once(&_loadClientBundle_onceToken, &__block_literal_global_316);
  }
}

void __40__GuidedAccessManager__loadClientBundle__block_invoke()
{
  v0 = GAXLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v14 = 0;
    _os_log_impl(&dword_24016D000, v0, OS_LOG_TYPE_INFO, "****************** Loading GAX Client Bundle ****************", v14, 2u);
  }

  id v1 = (void *)MEMORY[0x263F086E0];
  id v2 = AXSystemRootDirectory();
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"/System/Library/AccessibilityBundles/GAXClient.bundle"];
  objc_super v4 = [v1 bundleWithPath:v3];

  if (!v4)
  {
    uint64_t v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  if (([v4 loadAndReturnError:0] & 1) == 0)
  {
    uint64_t v6 = GAXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_3();
    }
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v5 = (void *)[v4 principalClass];
  if (objc_opt_respondsToSelector())
  {
    [v5 performSelector:sel_sharedInstance];
  }
  else
  {
    uint64_t v7 = GAXLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_2((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }
  }
LABEL_12:
}

- (id)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(id)a3
{
}

- (void).cxx_destruct
{
}

void __58__GuidedAccessManager_loadRequiredBundlesForUnmanagedASAM__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24016D000, v0, v1, "**** AX Error: Could not load GAXSpringboard bundle. bundleWithPath came back nil", v2, v3, v4, v5, v6);
}

void __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__GuidedAccessManager__loadSpringboardServerBundle__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24016D000, v0, v1, "**** AX Error: Accessibility: Could not load GAXSpringboard bundle", v2, v3, v4, v5, v6);
}

void __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24016D000, v0, v1, "**** AX Error: Could not load GAX Client bundle. bundleWithPath came back nil", v2, v3, v4, v5, v6);
}

void __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __40__GuidedAccessManager__loadClientBundle__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24016D000, v0, v1, "**** AX Error: Accessibility: Could not load GAX Client bundle", v2, v3, v4, v5, v6);
}

@end