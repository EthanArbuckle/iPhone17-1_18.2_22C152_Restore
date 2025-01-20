@interface AXBMotionCuesManager
+ (void)initializeMonitor;
- (void)setMotionCuesEnabled:(BOOL)a3;
- (void)updateSettings;
@end

@implementation AXBMotionCuesManager

+ (void)initializeMonitor
{
  if (AXDeviceSupportsMotionCues() && initializeMonitor_onceToken_4 != -1)
  {
    dispatch_once(&initializeMonitor_onceToken_4, &__block_literal_global_10);
  }
}

uint64_t __41__AXBMotionCuesManager_initializeMonitor__block_invoke()
{
  v0 = objc_alloc_init(AXBMotionCuesManager);
  v1 = (void *)_SharedManager_1;
  _SharedManager_1 = (uint64_t)v0;

  v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263F8B318];
  v4 = [MEMORY[0x263F08A48] mainQueue];
  id v5 = (id)[v2 addObserverForName:v3 object:0 queue:v4 usingBlock:&__block_literal_global_270_2];

  return AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __41__AXBMotionCuesManager_initializeMonitor__block_invoke_2()
{
  return [(id)_SharedManager_1 updateSettings];
}

uint64_t __41__AXBMotionCuesManager_initializeMonitor__block_invoke_3()
{
  return [(id)_SharedManager_1 updateSettings];
}

- (void)setMotionCuesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v5 = AXDeviceSupportsMotionCues();
  v6 = AXLogMotionCues();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [NSNumber numberWithBool:v3];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_241F5C000, v7, OS_LOG_TYPE_DEFAULT, "Motion Cues monitor requested enable/disable with value: %@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    v9 = (void (*)(uint64_t))getAXMotionCuesManagerSymbolLoc_ptr;
    v15 = getAXMotionCuesManagerSymbolLoc_ptr;
    if (!getAXMotionCuesManagerSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v17 = __getAXMotionCuesManagerSymbolLoc_block_invoke;
      v18 = &unk_26510B818;
      v19 = &v12;
      __getAXMotionCuesManagerSymbolLoc_block_invoke((uint64_t)&buf);
      v9 = (void (*)(uint64_t))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (!v9) {
      -[AXBMotionCuesManager setMotionCuesEnabled:]();
    }
    v11 = v9(v10);
    v7 = v11;
    if (v3)
    {
      -[NSObject enableWithCompletionBlock:](v11, "enableWithCompletionBlock:", &__block_literal_global_276, v12);
      self->_featureEnabled = 1;
    }
    else if (self->_featureEnabled)
    {
      -[NSObject disable:](v11, "disable:", &__block_literal_global_279, v12);
      self->_featureEnabled = 0;
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_241F5C000, v7, OS_LOG_TYPE_INFO, "Asked for Motion Cues to enable/disable but feature flag is off, so no", (uint8_t *)&buf, 2u);
  }
}

void __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  char v5 = AXLogMotionCues();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke_cold_1(a2);
  }
}

void __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke_277(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  char v5 = AXLogMotionCues();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke_277_cold_1(a2);
  }
}

- (void)updateSettings
{
  _AXSMotionCuesMode();
  v2 = (void *)_SharedManager_1;
  BOOL v3 = _AXSMotionCuesEnabled() != 0;

  [v2 setMotionCuesEnabled:v3];
}

- (void)setMotionCuesEnabled:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"id<AXMotionCuesServiceProtocol> AXMotionCuesManager_Soft(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXBMotionCuesManager.m", 17, @"%s", dlerror());

  __break(1u);
}

void __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke_cold_1(char a1)
{
  v1 = [NSNumber numberWithBool:a1 & 1];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_241F5C000, v2, v3, "Enable request result for motion cues: %@ %@", v4, v5, v6, v7, v8);
}

void __45__AXBMotionCuesManager_setMotionCuesEnabled___block_invoke_277_cold_1(char a1)
{
  v1 = [NSNumber numberWithBool:a1 & 1];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_241F5C000, v2, v3, "Disable request result for motion cues: %@ %@", v4, v5, v6, v7, v8);
}

@end