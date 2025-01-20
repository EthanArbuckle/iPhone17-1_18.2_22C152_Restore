@interface DMCBackgroundActivityManager
+ (id)sharedInstance;
+ (void)cancelActivity:(id)a3;
+ (void)scheduleOneShotActivity:(id)a3 interval:(double)a4 gracePeriod:(double)a5 callback:(id)a6;
- (NSMutableDictionary)activities;
- (id)initPrivate;
- (void)setActivities:(id)a3;
@end

@implementation DMCBackgroundActivityManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __46__DMCBackgroundActivityManager_sharedInstance__block_invoke()
{
  sharedInstance_instance = [[DMCBackgroundActivityManager alloc] initPrivate];
  return MEMORY[0x1F41817F8]();
}

- (id)initPrivate
{
  v6.receiver = self;
  v6.super_class = (Class)DMCBackgroundActivityManager;
  v2 = [(DMCBackgroundActivityManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    activities = v2->_activities;
    v2->_activities = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (void)scheduleOneShotActivity:(id)a3 interval:(double)a4 gracePeriod:(double)a5 callback:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  v11 = DMCLogObjects()[1];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v26 = v9;
    __int16 v27 = 2048;
    double v28 = a4;
    __int16 v29 = 2048;
    double v30 = a5;
    _os_log_impl(&dword_1A7863000, v11, OS_LOG_TYPE_DEBUG, "Background activity registered. name %@ interval %f tolerance %f", buf, 0x20u);
  }
  id v12 = v9;
  v13 = (const char *)[v12 cStringUsingEncoding:4];
  v14 = (void *)MEMORY[0x1AD0D2220](v10);
  v15 = +[DMCBackgroundActivityManager sharedInstance];
  v16 = [v15 activities];
  [v16 setObject:v14 forKeyedSubscript:v12];

  if (a5 <= 9.22337204e18) {
    int64_t v17 = (uint64_t)a5;
  }
  else {
    int64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a4 <= 9.22337204e18) {
    int64_t v18 = (uint64_t)a4;
  }
  else {
    int64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v19, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
  xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x1E4F14170], v18);
  xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x1E4F141A8], v17);
  xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1E4F14138], 1);
  xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1E4F14338], 1);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__DMCBackgroundActivityManager_scheduleOneShotActivity_interval_gracePeriod_callback___block_invoke;
  v22[3] = &unk_1E5CFD808;
  id v23 = v12;
  id v24 = v10;
  id v20 = v10;
  id v21 = v12;
  xpc_activity_register(v13, v19, v22);
}

void __86__DMCBackgroundActivityManager_scheduleOneShotActivity_interval_gracePeriod_callback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    BOOL v4 = xpc_activity_set_state(v3, 3);
    v5 = DMCLogObjects()[1];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v6;
      __int16 v14 = 1024;
      BOOL v15 = v4;
      v7 = "Background activity fired but deferred. name %@ result %i";
LABEL_9:
      _os_log_impl(&dword_1A7863000, v5, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v12, 0x12u);
    }
  }
  else if (xpc_activity_get_state(v3) == 2)
  {
    v8 = DMCLogObjects()[1];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_INFO, "Background activity ready to run. name %@", (uint8_t *)&v12, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    BOOL v10 = xpc_activity_set_state(v3, 5);
    v5 = DMCLogObjects()[1];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 1024;
      BOOL v15 = v10;
      v7 = "Background activity done. name %@ result %i";
      goto LABEL_9;
    }
  }
}

+ (void)cancelActivity:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[DMCBackgroundActivityManager sharedInstance];
  v5 = [v4 activities];
  [v5 setObject:0 forKeyedSubscript:v3];

  id v6 = v3;
  v7 = (const char *)[v6 cStringUsingEncoding:4];
  v8 = DMCLogObjects()[1];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1A7863000, v8, OS_LOG_TYPE_DEBUG, "Background activity canceled. name %@", (uint8_t *)&v9, 0xCu);
  }
  xpc_activity_unregister(v7);
}

- (NSMutableDictionary)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end