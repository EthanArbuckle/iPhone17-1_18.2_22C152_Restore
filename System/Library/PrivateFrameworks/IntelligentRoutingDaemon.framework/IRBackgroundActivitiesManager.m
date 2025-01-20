@interface IRBackgroundActivitiesManager
- (IRAnalyticsManager)analyticsManager;
- (IRBackgroundActivitiesManager)initWithServer:(id)a3;
- (IRCleanupManager)cleanupManager;
- (IRMobileAssetManager)mobileAssetManager;
- (IRSessionServer)server;
- (int)userDefaultsRefreshToken;
- (void)registerForRepeatingBackgroundXPCActivityWithIdentifier:(id)a3 interval:(int64_t)a4 isDiskIntensive:(BOOL)a5 isMemoryIntensive:(BOOL)a6 handler:(id)a7;
- (void)setAnalyticsManager:(id)a3;
- (void)setCleanupManager:(id)a3;
- (void)setMobileAssetManager:(id)a3;
- (void)setServer:(id)a3;
- (void)setUserDefaultsRefreshToken:(int)a3;
@end

@implementation IRBackgroundActivitiesManager

- (IRBackgroundActivitiesManager)initWithServer:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IRBackgroundActivitiesManager;
  v5 = [(IRBackgroundActivitiesManager *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(IRBackgroundActivitiesManager *)v5 setServer:v4];
    v7 = [[IRAnalyticsManager alloc] initWithBackgroundActivitiesManager:v6];
    [(IRBackgroundActivitiesManager *)v6 setAnalyticsManager:v7];

    v8 = [[IRCleanupManager alloc] initWithBackgroundActivitiesManager:v6];
    [(IRBackgroundActivitiesManager *)v6 setCleanupManager:v8];

    v9 = [[IRMobileAssetManager alloc] initWithBackgroundActivitiesManager:v6];
    [(IRBackgroundActivitiesManager *)v6 setMobileAssetManager:v9];
  }
  return v6;
}

- (void)registerForRepeatingBackgroundXPCActivityWithIdentifier:(id)a3 interval:(int64_t)a4 isDiskIntensive:(BOOL)a5 isMemoryIntensive:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a7;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x263EF82A0], 1);
  xpc_dictionary_set_int64(v13, (const char *)*MEMORY[0x263EF81D8], a4);
  if (a4 >= 0) {
    int64_t v14 = a4;
  }
  else {
    int64_t v14 = a4 + 1;
  }
  xpc_dictionary_set_int64(v13, (const char *)*MEMORY[0x263EF81C0], v14 >> 1);
  xpc_dictionary_set_string(v13, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x263EF82D8], 1);
  if (v9) {
    xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x263EF81A8], 1);
  }
  if (v8) {
    xpc_dictionary_set_BOOL(v13, (const char *)*MEMORY[0x263EF8230], 1);
  }
  id v15 = v11;
  v16 = (const char *)[v15 UTF8String];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __140__IRBackgroundActivitiesManager_registerForRepeatingBackgroundXPCActivityWithIdentifier_interval_isDiskIntensive_isMemoryIntensive_handler___block_invoke;
  v20[3] = &unk_2653A0BD0;
  id v17 = v15;
  id v21 = v17;
  id v18 = v12;
  id v22 = v18;
  xpc_activity_register(v16, v13, v20);
  v19 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = v17;
    _os_log_impl(&dword_25418E000, v19, OS_LOG_TYPE_DEFAULT, "#background-activity-manager, XPC activity registered: %@", buf, 0xCu);
  }
}

void __140__IRBackgroundActivitiesManager_registerForRepeatingBackgroundXPCActivityWithIdentifier_interval_isDiskIntensive_isMemoryIntensive_handler___block_invoke(uint64_t a1, xpc_activity_t activity)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  id v4 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2048;
    xpc_activity_state_t v9 = state;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_DEFAULT, "#background-activity-manager, XPC activity %@, called with xpc_activity_state_t state = %ld", (uint8_t *)&v6, 0x16u);
  }
  if (state == 2) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (IRSessionServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

  return (IRSessionServer *)WeakRetained;
}

- (void)setServer:(id)a3
{
}

- (int)userDefaultsRefreshToken
{
  return self->_userDefaultsRefreshToken;
}

- (void)setUserDefaultsRefreshToken:(int)a3
{
  self->_userDefaultsRefreshToken = a3;
}

- (IRAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (IRCleanupManager)cleanupManager
{
  return self->_cleanupManager;
}

- (void)setCleanupManager:(id)a3
{
}

- (IRMobileAssetManager)mobileAssetManager
{
  return self->_mobileAssetManager;
}

- (void)setMobileAssetManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetManager, 0);
  objc_storeStrong((id *)&self->_cleanupManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);

  objc_destroyWeak((id *)&self->_server);
}

@end