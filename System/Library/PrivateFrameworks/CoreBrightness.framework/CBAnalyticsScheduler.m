@interface CBAnalyticsScheduler
+ (id)sharedInstance;
- (CBAnalyticsScheduler)init;
- (int64_t)registerHandler:(id)a3;
- (void)dealloc;
- (void)removeHandler:(int64_t)a3;
- (void)run;
@end

@implementation CBAnalyticsScheduler

+ (id)sharedInstance
{
  id v11 = a1;
  SEL v10 = a2;
  objc_sync_enter(a1);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __38__CBAnalyticsScheduler_sharedInstance__block_invoke;
  v8 = &unk_1E6218FE0;
  id v9 = v11;
  v13 = &sharedInstance_onceToken;
  v12 = &v4;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(v13, v12);
  }
  objc_sync_exit(a1);
  return (id)sharedInstance__sharedObject;
}

uint64_t __38__CBAnalyticsScheduler_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v4 = a1;
  uint64_t v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)&OBJC_METACLASS___CBAnalyticsScheduler;
  uint64_t result = objc_msgSend(objc_msgSendSuper2(&v2, sel_alloc), "init");
  sharedInstance__sharedObject = result;
  return result;
}

- (CBAnalyticsScheduler)init
{
  v24 = self;
  SEL v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)CBAnalyticsScheduler;
  v24 = [(CBAnalyticsScheduler *)&v22 init];
  if (v24)
  {
    v24->_logHandle = (OS_os_log *)os_log_create("com.apple.CoreBrightness.CBAnalyticsScheduler", "default");
    if (!v24->_logHandle)
    {
      v21 = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        inited = init_default_corebrightness_log();
      }
      v21 = inited;
      char v20 = 16;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        log = v21;
        os_log_type_t type = v20;
        __os_log_helper_16_0_0(v19);
        _os_log_error_impl(&dword_1BA438000, log, type, "Failed to create log handle", v19, 2u);
      }
    }
    v24->_requests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v24->_requestId = 1;
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v18, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F14238]);
    xpc_dictionary_set_string(v18, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142D0]);
    v12[0] = 0;
    v12[1] = v12;
    int v13 = 1375731712;
    int v14 = 48;
    v15 = __Block_byref_object_copy__0;
    v16 = __Block_byref_object_dispose__0;
    v17 = v24;
    uint64_t handler = MEMORY[0x1E4F143A8];
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = __28__CBAnalyticsScheduler_init__block_invoke;
    SEL v10 = &unk_1E6219240;
    id v11 = v12;
    xpc_activity_register("com.apple.CoreBrightness.Analytics", v18, &handler);
    xpc_release(v18);
    _Block_object_dispose(v12, 8);
  }
  return v24;
}

uint64_t __28__CBAnalyticsScheduler_init__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) run];
}

- (void)run
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  int v5 = (void *)[(NSMutableDictionary *)self->_requests copy];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v7, [(NSMutableDictionary *)self->_requests count]);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Running analytics scheduler - got %lu handlers", v7, 0xCu);
  }
  objc_sync_exit(self);
  [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_1];
}

uint64_t __27__CBAnalyticsScheduler_run__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(a3 + 16))();
  }
  return result;
}

- (int64_t)registerHandler:(id)a3
{
  uint64_t v3 = objc_sync_enter(self);
  context = (void *)MEMORY[0x1BA9ECAE0](v3);
  id v8 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKey:](self->_requests, "setObject:forKey:", v8, [NSNumber numberWithUnsignedInteger:self->_requestId]);
  unint64_t requestId = self->_requestId;
  self->_unint64_t requestId = requestId + 1;
  objc_sync_exit(self);
  return requestId;
}

- (void)removeHandler:(int64_t)a3
{
  uint64_t v3 = objc_sync_enter(self);
  context = (void *)MEMORY[0x1BA9ECAE0](v3);
  -[NSMutableDictionary removeObjectForKey:](self->_requests, "removeObjectForKey:", [NSNumber numberWithInteger:a3]);
  objc_sync_exit(self);
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  xpc_activity_unregister("com.apple.CoreBrightness.Analytics");
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }

  v4->_requests = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBAnalyticsScheduler;
  [(CBAnalyticsScheduler *)&v2 dealloc];
}

@end