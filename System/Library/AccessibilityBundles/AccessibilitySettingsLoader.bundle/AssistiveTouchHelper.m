@interface AssistiveTouchHelper
+ (void)initializeMonitoring;
- (AssistiveTouchHelper)init;
- (id)_astDispatchQueue;
- (void)_sendKeyboardStatusUpdate;
- (void)_sendKeyboardStatusUpdate:(CGRect)a3;
- (void)_sendKeyboardStatusUpdateHidden;
- (void)dealloc;
- (void)enable;
- (void)installKeyboardListener;
- (void)loadBuddyBundles;
@end

@implementation AssistiveTouchHelper

+ (void)initializeMonitoring
{
  if (initializeMonitoring_onceToken_0 != -1) {
    dispatch_once(&initializeMonitoring_onceToken_0, &__block_literal_global_301);
  }
}

uint64_t __44__AssistiveTouchHelper_initializeMonitoring__block_invoke()
{
  initializeMonitoring_Helper = objc_alloc_init(AssistiveTouchHelper);

  return MEMORY[0x270F9A758]();
}

- (AssistiveTouchHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)AssistiveTouchHelper;
  v2 = [(AssistiveTouchHelper *)&v6 init];
  if (v2)
  {
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)_accessibilityASTEnabled, (CFStringRef)*MEMORY[0x263F8B130], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(AssistiveTouchHelper *)v2 enable];
    v4 = v2;
  }

  return v2;
}

- (void)enable
{
  if (_AXSAssistiveTouchEnabled() && (soft_AXProcessIsAssistiveTouch() & 1) == 0)
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __30__AssistiveTouchHelper_enable__block_invoke;
    v14 = &unk_26509DBB0;
    v15 = self;
    if (enable_onceToken != -1) {
      dispatch_once(&enable_onceToken, &v11);
    }
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    v3 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))getAXProcessIsSetupSymbolLoc_ptr_0;
    v24 = getAXProcessIsSetupSymbolLoc_ptr_0;
    if (!getAXProcessIsSetupSymbolLoc_ptr_0)
    {
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      v18 = __getAXProcessIsSetupSymbolLoc_block_invoke_0;
      v19 = &unk_26509DAA8;
      v20 = &v21;
      v4 = (void *)AccessibilityUtilitiesLibrary_3();
      v5 = dlsym(v4, "AXProcessIsSetup");
      *(void *)(v20[1] + 24) = v5;
      getAXProcessIsSetupSymbolLoc_ptr_0 = *(_UNKNOWN **)(v20[1] + 24);
      v3 = (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v3) {
      -[AccessibilitySettingsLoader _initializeDelayedAccessibilitySettings]();
    }
    if (v3(v6, v7, v8, v9, v10)) {
      [(AssistiveTouchHelper *)self loadBuddyBundles];
    }
  }
}

- (id)_astDispatchQueue
{
  if (_astDispatchQueue_onceToken != -1) {
    dispatch_once(&_astDispatchQueue_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)_astDispatchQueue_bgQueue;

  return v2;
}

uint64_t __41__AssistiveTouchHelper__astDispatchQueue__block_invoke()
{
  _astDispatchQueue_bgQueue = (uint64_t)dispatch_queue_create("ASTDispatch", 0);

  return MEMORY[0x270F9A758]();
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AssistiveTouchHelper;
  [(AssistiveTouchHelper *)&v4 dealloc];
}

- (void)_sendKeyboardStatusUpdate
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"CGRect soft_AXUIKeyboardScreenFrame(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 43, @"%s", dlerror());

  __break(1u);
}

- (void)_sendKeyboardStatusUpdateHidden
{
  v3 = (void *)[objc_allocWithZone(MEMORY[0x263EFF9A0]) init];
  [v3 setObject:*MEMORY[0x263EFFB38] forKey:@"visible"];
  objc_super v4 = [NSNumber numberWithInt:getpid()];
  [v3 setObject:v4 forKey:@"pid"];

  v5 = [(AssistiveTouchHelper *)self _astDispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__AssistiveTouchHelper__sendKeyboardStatusUpdateHidden__block_invoke;
  block[3] = &unk_26509DBB0;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __55__AssistiveTouchHelper__sendKeyboardStatusUpdateHidden__block_invoke(uint64_t a1)
{
  return [(id)ASTNotificationCenter sendMessageName:@"UIAXASTKeyboardStatus" userInfo:*(void *)(a1 + 32)];
}

- (void)_sendKeyboardStatusUpdate:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = [(AssistiveTouchHelper *)self _astDispatchQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__AssistiveTouchHelper__sendKeyboardStatusUpdate___block_invoke;
  v8[3] = &__block_descriptor_64_e5_v8__0l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  *(CGFloat *)&v8[6] = width;
  *(CGFloat *)&v8[7] = height;
  dispatch_async(v7, v8);
}

void __50__AssistiveTouchHelper__sendKeyboardStatusUpdate___block_invoke(NSRect *a1)
{
  id v4 = (id)[objc_allocWithZone(MEMORY[0x263EFF9A0]) init];
  [v4 setObject:*MEMORY[0x263EFFB40] forKey:@"visible"];
  v2 = NSStringFromRect(a1[1]);
  [v4 setObject:v2 forKey:@"frame"];

  v3 = [NSNumber numberWithInt:getpid()];
  [v4 setObject:v3 forKey:@"pid"];

  [(id)ASTNotificationCenter sendMessageName:@"UIAXASTKeyboardStatus" userInfo:v4];
}

- (void)installKeyboardListener
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"BOOL soft_AXProcessIsSpotlight(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 69, @"%s", dlerror());

  __break(1u);
}

uint64_t __47__AssistiveTouchHelper_installKeyboardListener__block_invoke(uint64_t a1)
{
  uint64_t result = _AXSAssistiveTouchEnabled();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 _sendKeyboardStatusUpdate];
  }
  return result;
}

void __47__AssistiveTouchHelper_installKeyboardListener__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ASTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_24016D000, v4, OS_LOG_TYPE_INFO, "Home Screen displayed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__AssistiveTouchHelper_installKeyboardListener__block_invoke_289(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ASTLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_24016D000, v4, OS_LOG_TYPE_INFO, "Home Screen displayed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__AssistiveTouchHelper_installKeyboardListener__block_invoke_290(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (_AXSAssistiveTouchEnabled())
  {
    id v4 = ASTLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v15 = 138543362;
      id v16 = v3;
      _os_log_impl(&dword_24016D000, v4, OS_LOG_TYPE_INFO, "Keyboard shown notification: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    int v5 = [v3 userInfo];
    id v6 = [v5 objectForKey:*MEMORY[0x263F1D428]];
    [v6 rectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    objc_msgSend(*(id *)(a1 + 32), "_sendKeyboardStatusUpdate:", v8, v10, v12, v14);
  }
}

void __47__AssistiveTouchHelper_installKeyboardListener__block_invoke_291(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (_AXSAssistiveTouchEnabled())
  {
    id v4 = ASTLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_24016D000, v4, OS_LOG_TYPE_INFO, "Keyboard hidden notification: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) _sendKeyboardStatusUpdateHidden];
  }
}

- (void)loadBuddyBundles
{
  if (loadBuddyBundles_onceToken != -1) {
    dispatch_once(&loadBuddyBundles_onceToken, &__block_literal_global_293);
  }
}

void __40__AssistiveTouchHelper_loadBuddyBundles__block_invoke()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263F086E0];
  v1 = AXAccessibilityBundlesDirectory();
  v2 = [v1 stringByAppendingPathComponent:@"/UIKit.axbundle"];
  id v3 = [v0 bundleWithPath:v2];

  if (([v3 isLoaded] & 1) == 0)
  {
    id v10 = 0;
    int v4 = [v3 loadAndReturnError:&v10];
    int v5 = v10;
    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    if (v6)
    {
      [v3 principalClass];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend((id)objc_msgSend(v3, "principalClass"), "_accessibilityStartServer");
      }
      uint64_t v7 = ASTLogCommon();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      double v9 = (void *)[v3 principalClass];
      *(_DWORD *)buf = 138543362;
      double v12 = v9;
      double v8 = v9;
      _os_log_impl(&dword_24016D000, v7, OS_LOG_TYPE_INFO, "Loading: %{public}@", buf, 0xCu);
    }
    else
    {
      uint64_t v7 = v5;
      double v8 = ASTLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __50__AXInvertColorsController_loadInvertColorsBundle__block_invoke_cold_1((uint64_t)v3, (uint64_t)v7, v8);
      }
    }

LABEL_13:
  }
}

uint64_t __30__AssistiveTouchHelper_enable__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F255B0] centerNamed:@"UIASTNotificationCenter"];
  id v3 = (void *)ASTNotificationCenter;
  ASTNotificationCenter = v2;

  int v4 = *(void **)(a1 + 32);

  return [v4 installKeyboardListener];
}

@end