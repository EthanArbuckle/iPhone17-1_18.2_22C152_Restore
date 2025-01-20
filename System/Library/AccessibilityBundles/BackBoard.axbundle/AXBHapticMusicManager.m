@interface AXBHapticMusicManager
+ (void)initializeMonitor;
- (id)_serviceName;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
- (void)setHapticMusicEnabled:(BOOL)a3;
- (void)updateSettings;
@end

@implementation AXBHapticMusicManager

+ (void)initializeMonitor
{
  if (initializeMonitor_onceToken != -1) {
    dispatch_once(&initializeMonitor_onceToken, &__block_literal_global_2);
  }

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __42__AXBHapticMusicManager_initializeMonitor__block_invoke()
{
  v0 = objc_alloc_init(AXBHapticMusicManager);
  v1 = (void *)_SharedManager;
  _SharedManager = (uint64_t)v0;

  v2 = AXLogHapticMusic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_241F5C000, v2, OS_LOG_TYPE_DEFAULT, "Initializing Haptic Music Monitor", v7, 2u);
  }

  v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F8B1E0];
  v5 = [MEMORY[0x263F08A48] mainQueue];
  id v6 = (id)[v3 addObserverForName:v4 object:0 queue:v5 usingBlock:&__block_literal_global_271];
}

uint64_t __42__AXBHapticMusicManager_initializeMonitor__block_invoke_268()
{
  return [(id)_SharedManager updateSettings];
}

uint64_t __42__AXBHapticMusicManager_initializeMonitor__block_invoke_2()
{
  return [(id)_SharedManager updateSettings];
}

- (id)_serviceName
{
  return @"AXHapticMusicServer";
}

- (void)setHapticMusicEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    if (v3)
    {
      v5 = AXLogHapticMusic();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [NSNumber numberWithBool:1];
        int v13 = 138412290;
        v14 = v6;
        _os_log_impl(&dword_241F5C000, v5, OS_LOG_TYPE_DEFAULT, "Asked to enable Haptic Music from BB: (%@)", (uint8_t *)&v13, 0xCu);
      }
      if (!self->_client)
      {
        id v7 = objc_alloc(MEMORY[0x263F22198]);
        v8 = [(AXBHapticMusicManager *)self _serviceName];
        v9 = (AXUIClient *)[v7 initWithIdentifier:@"HapticMusicClient-Backboard" serviceBundleName:v8];
        client = self->_client;
        self->_client = v9;

        [(AXUIClient *)self->_client setDelegate:self];
      }
    }
    v11 = self->_client;
    v12 = [MEMORY[0x263F21380] mainAccessQueue];
    [(AXUIClient *)v11 sendAsynchronousMessage:MEMORY[0x263EFFA78] withIdentifier:1 targetAccessQueue:v12 completion:&__block_literal_global_287];
  }
  else
  {
    v12 = AXLogHapticMusic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AXBHapticMusicManager setHapticMusicEnabled:](v12);
    }
  }
}

void __47__AXBHapticMusicManager_setHapticMusicEnabled___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = AXLogHapticMusic();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __47__AXBHapticMusicManager_setHapticMusicEnabled___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v3 = a3;
  uint64_t v4 = AXLogHapticMusic();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[AXBHapticMusicManager connectionWithServiceWasInterruptedForUserInterfaceClient:]((uint64_t)v3, v4);
  }

  id v5 = v3;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void *__83__AXBHapticMusicManager_connectionWithServiceWasInterruptedForUserInterfaceClient___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  uint64_t v3 = result[1];
  if (!v3 || *(void *)(a1 + 40) == v3) {
    return (void *)[result updateSettings];
  }
  return result;
}

- (void)updateSettings
{
  v2 = (void *)_SharedManager;
  BOOL v3 = _AXSHapticMusicEnabled() != 0;

  [v2 setHapticMusicEnabled:v3];
}

- (void).cxx_destruct
{
}

- (void)setHapticMusicEnabled:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_241F5C000, log, OS_LOG_TYPE_ERROR, "Asked to enable/disable haptic music but feature flag is off, so no", v1, 2u);
}

void __47__AXBHapticMusicManager_setHapticMusicEnabled___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_241F5C000, a2, OS_LOG_TYPE_ERROR, "Error starting haptic music: %@", (uint8_t *)&v2, 0xCu);
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_241F5C000, a2, OS_LOG_TYPE_ERROR, "Connection for haptic music interrupted: %@", (uint8_t *)&v2, 0xCu);
}

@end