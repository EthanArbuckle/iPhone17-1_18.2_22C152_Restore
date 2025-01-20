@interface AXMDisplayManager
- (AXMDisplay)coreAnimationMainDisplay;
- (AXMDisplay)frontBoardMainDisplay;
- (AXMDisplayManager)initWithCompletion:(id)a3;
- (BOOL)isInitialized;
- (FBSDisplayMonitor)displayMonitor;
- (NSString)description;
- (double)mobileGestaltOrientation;
- (id)_displayPropertiesFromMobileGestalt;
- (id)initAndWaitForMainDisplayConfiguration;
- (int64_t)_discreteOrientationForOrientation:(double)a3;
- (void)_displayPropertiesFromMobileGestalt;
- (void)_updateDisplay:(id)a3 withCADisplay:(id)a4;
- (void)_updateDisplay:(id)a3 withConfiguration:(id)a4;
- (void)_updateDisplayPropertiesWithConfiguration:(id)a3;
- (void)dealloc;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)initAndWaitForMainDisplayConfiguration;
- (void)mobileGestaltOrientation;
- (void)setDisplayMonitor:(id)a3;
- (void)setMobileGestaltOrientation:(double)a3;
@end

@implementation AXMDisplayManager

- (AXMDisplayManager)initWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_group_create();
  v31.receiver = self;
  v31.super_class = (Class)AXMDisplayManager;
  v6 = [(AXMDisplayManager *)&v31 init];
  v7 = v6;
  if (v6)
  {
    v6->_mobileGestaltOrientation = -1.0;
    dispatch_queue_t v8 = dispatch_queue_create("AXMDisplayManager", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    if (MGGetSInt32Answer() != 7)
    {
      v10 = [[AXMDisplay alloc] _initWithBackingType:2];
      queue_FrontBoardMainDisplay = v7->_queue_FrontBoardMainDisplay;
      v7->_queue_FrontBoardMainDisplay = v10;

      dispatch_group_enter(v5);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __40__AXMDisplayManager_initWithCompletion___block_invoke;
      v28[3] = &unk_1E6116F08;
      v29 = v7;
      v30 = v5;
      v12 = (void (**)(void))MEMORY[0x1BA9A1340](v28);
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        v12[2](v12);
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __40__AXMDisplayManager_initWithCompletion___block_invoke_2;
        block[3] = &unk_1E6117410;
        v27 = v12;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    v13 = [[AXMDisplay alloc] _initWithBackingType:1];
    queue_CoreAnimationMainDisplay = v7->_queue_CoreAnimationMainDisplay;
    v7->_queue_CoreAnimationMainDisplay = v13;

    v15 = v7->_queue_CoreAnimationMainDisplay;
    v16 = [MEMORY[0x1E4F39B60] mainDisplay];
    [(AXMDisplayManager *)v7 _updateDisplay:v15 withCADisplay:v16];
  }
  v17 = dispatch_get_global_queue(21, 0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __40__AXMDisplayManager_initWithCompletion___block_invoke_3;
  v23[3] = &unk_1E6116A50;
  v18 = v7;
  v24 = v18;
  id v25 = v4;
  id v19 = v4;
  dispatch_group_notify(v5, v17, v23);

  v20 = v25;
  v21 = v18;

  return v21;
}

void __40__AXMDisplayManager_initWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F62970]);
  [*(id *)(a1 + 32) setDisplayMonitor:v2];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(*(id *)(a1 + 32), "displayMonitor", 0);
  id v4 = [v3 connectedIdentities];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        v10 = [*(id *)(a1 + 32) displayMonitor];
        v11 = [v10 configurationForIdentity:v9];

        if ([v11 isMainDisplay]) {
          [*(id *)(a1 + 32) _updateDisplay:*(void *)(*(void *)(a1 + 32) + 24) withConfiguration:v11];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  v12 = [*(id *)(a1 + 32) displayMonitor];
  [v12 addObserver:*(void *)(a1 + 32)];
}

uint64_t __40__AXMDisplayManager_initWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__AXMDisplayManager_initWithCompletion___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)initAndWaitForMainDisplayConfiguration
{
  id v2 = [(AXMDisplayManager *)self initWithCompletion:0];
  if (!v2->_initialized)
  {
    CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D418];
    do
      CFRunLoopRunInMode(v3, 0.15, 1u);
    while (!v2->_initialized);
  }
  id v4 = AXLogDisplay();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(AXMDisplayManager *)(uint64_t)v2 initAndWaitForMainDisplayConfiguration];
  }

  return v2;
}

- (NSString)description
{
  CFStringRef v3 = NSString;
  BOOL initialized = self->_initialized;
  uint64_t v5 = [(AXMDisplayManager *)self frontBoardMainDisplay];
  uint64_t v6 = [(AXMDisplayManager *)self coreAnimationMainDisplay];
  uint64_t v7 = [(AXMDisplayManager *)self _displayPropertiesFromMobileGestalt];
  uint64_t v8 = [v3 stringWithFormat:@"AXMDisplayManager:<%p> Initialized %ld\n\tFrontbaord Main:%@\n\tCADisplay Main:%@\n\tStatic (gestalt) props: %@", self, initialized, v5, v6, v7];

  return (NSString *)v8;
}

- (void)dealloc
{
  CFStringRef v3 = [(AXMDisplayManager *)self displayMonitor];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXMDisplayManager;
  [(AXMDisplayManager *)&v4 dealloc];
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (double)mobileGestaltOrientation
{
  double result = self->_mobileGestaltOrientation;
  if (result == -1.0)
  {
    objc_super v4 = (void *)MGCopyAnswer();
    if (!v4)
    {
      uint64_t v5 = AXLogDisplay();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[AXMDisplayManager mobileGestaltOrientation]();
      }
    }
    uint64_t v6 = [v4 objectForKeyedSubscript:@"main-screen-orientation"];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 floatValue];
      self->_mobileGestaltOrientation = v8;
    }
    else
    {
      uint64_t v9 = AXLogDisplay();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[AXMDisplayManager mobileGestaltOrientation]();
      }
    }
    return self->_mobileGestaltOrientation;
  }
  return result;
}

- (AXMDisplay)frontBoardMainDisplay
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__AXMDisplayManager_frontBoardMainDisplay__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AXMDisplay *)v3;
}

void __42__AXMDisplayManager_frontBoardMainDisplay__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (AXMDisplay)coreAnimationMainDisplay
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AXMDisplayManager_coreAnimationMainDisplay__block_invoke;
  v5[3] = &unk_1E6116EC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AXMDisplay *)v3;
}

void __45__AXMDisplayManager_coreAnimationMainDisplay__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_displayPropertiesFromMobileGestalt
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = (void *)MGCopyAnswer();
  if (!v3)
  {
    objc_super v4 = AXLogDisplay();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[AXMDisplayManager mobileGestaltOrientation]();
    }
  }
  uint64_t v5 = [v3 objectForKeyedSubscript:@"main-screen-scale"];
  if (v5)
  {
    [v2 setObject:v5 forKeyedSubscript:@"scale"];
  }
  else
  {
    uint64_t v6 = AXLogDisplay();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[AXMDisplayManager mobileGestaltOrientation]();
    }
  }
  uint64_t v7 = [v3 objectForKeyedSubscript:@"main-screen-orientation"];

  if (v7)
  {
    [v2 setObject:v7 forKeyedSubscript:@"orientation"];
  }
  else
  {
    uint64_t v8 = AXLogDisplay();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[AXMDisplayManager _displayPropertiesFromMobileGestalt]();
    }
  }
  uint64_t v9 = [NSNumber numberWithBool:MGGetBoolAnswer()];
  [v2 setObject:v9 forKeyedSubscript:@"supportsDeepColor"];

  return v2;
}

- (void)_updateDisplay:(id)a3 withCADisplay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AXMDisplayManager__updateDisplay_withCADisplay___block_invoke;
  block[3] = &unk_1E61179A0;
  id v12 = v6;
  id v13 = v7;
  long long v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __50__AXMDisplayManager__updateDisplay_withCADisplay___block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[5] currentMode];
  objc_msgSend(a1[4], "setScale:", (double)(unint64_t)objc_msgSend(v2, "preferredScale"));

  [a1[6] mobileGestaltOrientation];
  objc_msgSend(a1[4], "setOrientation:");
  [a1[4] scale];
  double v4 = 1.0 / v3;
  [a1[5] bounds];
  double v6 = v4 * v5;
  double v8 = v4 * v7;
  double v10 = v4 * v9;
  double v12 = v4 * v11;
  [a1[4] orientation];
  double v14 = v13;
  [a1[5] bounds];
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(a1[4], "setPhysicalOrientation:", objc_msgSend(a1[6], "_discreteOrientationForOrientation:", v14));
  if (AXMFloatApproxEqual(v14, 1.57079633) || AXMFloatApproxEqual(v14, 4.71238898))
  {
    double v19 = v16;
    double v20 = v10;
  }
  else
  {
    double v19 = v18;
    double v18 = v16;
    double v20 = v12;
    double v12 = v10;
  }
  objc_msgSend(a1[4], "setReferenceBounds:", v6, v8, v12, v20);
  objc_msgSend(a1[4], "setSize:", v18, v19);
  v21 = [a1[5] name];
  [a1[4] setName:v21];

  v22 = AXLogDisplay();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = a1[4];
    int v24 = 138412290;
    id v25 = v23;
    _os_log_impl(&dword_1B57D5000, v22, OS_LOG_TYPE_DEFAULT, "Display settings after update from CADisplay.mainDisplay: %@", (uint8_t *)&v24, 0xCu);
  }
}

- (int64_t)_discreteOrientationForOrientation:(double)a3
{
  if (AXMFloatApproxEqual(a3, 0.0)) {
    return 1;
  }
  if (AXMFloatApproxEqual(a3, 1.57079633)) {
    return 3;
  }
  if (AXMFloatApproxEqual(a3, 3.14159265)) {
    return 2;
  }
  if (!AXMFloatApproxEqual(a3, 4.71238898))
  {
    double v5 = AXLogDisplay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[AXMDisplayManager _discreteOrientationForOrientation:]();
    }

    return 1;
  }
  return 4;
}

- (void)_updateDisplay:(id)a3 withConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__AXMDisplayManager__updateDisplay_withConfiguration___block_invoke;
  block[3] = &unk_1E61179A0;
  id v12 = v6;
  id v13 = v7;
  double v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

void __54__AXMDisplayManager__updateDisplay_withConfiguration___block_invoke(id *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1[5] name];
  [a1[4] setName:v2];

  [a1[5] pointScale];
  objc_msgSend(a1[4], "setScale:");
  [a1[5] pixelSize];
  objc_msgSend(a1[4], "setSize:");
  [a1[6] mobileGestaltOrientation];
  objc_msgSend(a1[4], "setOrientation:");
  [a1[5] bounds];
  objc_msgSend(a1[4], "setReferenceBounds:");
  id v3 = a1[6];
  [v3 mobileGestaltOrientation];
  objc_msgSend(a1[4], "setPhysicalOrientation:", objc_msgSend(v3, "_discreteOrientationForOrientation:"));
  [a1[4] setSupportsDeepColor:MGGetBoolAnswer()];
  double v4 = AXLogDisplay();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = a1[4];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1B57D5000, v4, OS_LOG_TYPE_DEFAULT, "Display settings after update from FB configuration: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_updateDisplayPropertiesWithConfiguration:(id)a3
{
  [(AXMDisplayManager *)self _updateDisplay:self->_queue_FrontBoardMainDisplay withConfiguration:a3];
  queue_CoreAnimationMainDisplay = self->_queue_CoreAnimationMainDisplay;
  id v5 = [MEMORY[0x1E4F39B60] mainDisplay];
  [(AXMDisplayManager *)self _updateDisplay:queue_CoreAnimationMainDisplay withCADisplay:v5];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"AXMDisplayManagerMainDisplayWasUpdatedNotification" object:self];
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v6 = a5;
  id v7 = AXLogDisplay();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEFAULT, "connected new display. Updating AXMDisplay properties", v8, 2u);
  }

  if ([v6 isMainDisplay]) {
    [(AXMDisplayManager *)self _updateDisplayPropertiesWithConfiguration:v6];
  }
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v6 = a5;
  id v7 = AXLogDisplay();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1B57D5000, v7, OS_LOG_TYPE_DEFAULT, "display config changed. Updating AXMDisplay properties", v8, 2u);
  }

  if ([v6 isMainDisplay]) {
    [(AXMDisplayManager *)self _updateDisplayPropertiesWithConfiguration:v6];
  }
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  double v4 = AXLogDisplay();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1B57D5000, v4, OS_LOG_TYPE_DEFAULT, "disconnected new display", v5, 2u);
  }
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (void)setMobileGestaltOrientation:(double)a3
{
  self->_mobileGestaltOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_queue_FrontBoardMainDisplay, 0);
  objc_storeStrong((id *)&self->_queue_CoreAnimationMainDisplay, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initAndWaitForMainDisplayConfiguration
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_DEBUG, "AXMDisplayManager initialized: %@", (uint8_t *)&v2, 0xCu);
}

- (void)mobileGestaltOrientation
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Unable to look up screenInfo", v2, v3, v4, v5, v6);
}

- (void)_displayPropertiesFromMobileGestalt
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Unable to look up screen orientation", v2, v3, v4, v5, v6);
}

- (void)_discreteOrientationForOrientation:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1B57D5000, v0, v1, "Unexpected physical screen orientation", v2, v3, v4, v5, v6);
}

@end