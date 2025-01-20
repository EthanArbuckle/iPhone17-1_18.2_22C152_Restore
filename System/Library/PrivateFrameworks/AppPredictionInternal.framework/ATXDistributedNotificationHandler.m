@interface ATXDistributedNotificationHandler
+ (id)sharedInstance;
- (ATXDistributedNotificationHandler)init;
- (void)_notificationFired:(id)a3;
- (void)_pruneOldRecents;
- (void)_repostNotificationFromSource:(id)a3 name:(id)a4 userInfo:(id)a5;
- (void)dealloc;
- (void)registerXPCHandler;
@end

@implementation ATXDistributedNotificationHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_14 != -1) {
    dispatch_once(&sharedInstance_onceToken_14, &__block_literal_global_251);
  }
  v2 = (void *)sharedInstance_handler;
  return v2;
}

uint64_t __51__ATXDistributedNotificationHandler_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_handler;
  sharedInstance_handler = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ATXDistributedNotificationHandler)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXDistributedNotificationHandler;
  v2 = [(ATXDistributedNotificationHandler *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    recentNotifications = v2->_recentNotifications;
    v2->_recentNotifications = (NSMutableSet *)v3;

    v5 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v5 addObserver:v2 selector:sel__notificationFired_ name:@"com.apple.LaunchServices.applicationRegistered" object:0 suspensionBehavior:0];
    [v5 addObserver:v2 selector:sel__notificationFired_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0 suspensionBehavior:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ATXDistributedNotificationHandler;
  [(ATXDistributedNotificationHandler *)&v4 dealloc];
}

- (void)_notificationFired:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__ATXDistributedNotificationHandler__notificationFired___block_invoke;
  v6[3] = &unk_1E68AB870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __56__ATXDistributedNotificationHandler__notificationFired___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) name];
  uint64_t v3 = [*(id *)(a1 + 40) userInfo];
  [v2 _repostNotificationFromSource:@"distributed notification" name:v4 userInfo:v3];
}

- (void)_pruneOldRecents
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_DEBUG, "ATXDistributedNotificationHandler: removing %ld old notifications", (uint8_t *)&v3, 0xCu);
}

BOOL __53__ATXDistributedNotificationHandler__pruneOldRecents__block_invoke(uint64_t a1, void *a2)
{
  [a2 timestamp];
  double v3 = v2;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  return vabdd_f64(v3, v4) > 10.0;
}

- (void)_repostNotificationFromSource:(id)a3 name:(id)a4 userInfo:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(ATXDistributedNotificationHandler *)self _pruneOldRecents];
  v11 = [[_ATXDistributedNotification alloc] initWithName:v9 userInfo:v10];
  if ([(NSMutableSet *)self->_recentNotifications containsObject:v11])
  {
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543874;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      v13 = "ATXDistributedNotificationHandler: dropping duplicate event (%{public}@) %{public}@; userInfo=%@";
LABEL_6:
      _os_log_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 postNotificationName:v9 object:0 userInfo:v10];

    [(NSMutableSet *)self->_recentNotifications addObject:v11];
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543874;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      v13 = "ATXDistributedNotificationHandler: handled event (%{public}@) %{public}@; userInfo=%@";
      goto LABEL_6;
    }
  }
}

- (void)registerXPCHandler
{
  objc_initWeak(&location, self);
  double v2 = MEMORY[0x1E4F14428];
  id v3 = MEMORY[0x1E4F14428];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__ATXDistributedNotificationHandler_registerXPCHandler__block_invoke;
  v4[3] = &unk_1E68B65A8;
  objc_copyWeak(&v5, &location);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v2, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __55__ATXDistributedNotificationHandler_registerXPCHandler__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  id v3 = (void *)os_transaction_create();
  double v4 = (void *)MEMORY[0x1D25F6CC0]();
  id v5 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E4F14560]));
  v6 = xpc_dictionary_get_value(xdict, "UserInfo");
  id v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _repostNotificationFromSource:@"XPC stream" name:v5 userInfo:v7];

  id v9 = self;
}

- (void).cxx_destruct
{
}

@end