@interface ADBackgroundTaskScheduler
+ (id)sharedInstance;
+ (void)registerTaskDelegate:(id)a3 forRequestID:(id)a4;
+ (void)unregisterTaskDelegate:(id)a3;
- (ADBackgroundTaskScheduler)init;
- (void)addBackgroundTask:(id)a3;
- (void)cancelBackgroundTask:(id)a3;
- (void)checkOnTask:(id)a3;
- (void)handleXPCActivity:(id)a3 withID:(id)a4;
@end

@implementation ADBackgroundTaskScheduler

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__ADBackgroundTaskScheduler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_0 != -1) {
    dispatch_once(&sharedInstance__onceToken_0, block);
  }
  v2 = (void *)sharedInstance__instance_0;
  return v2;
}

uint64_t __43__ADBackgroundTaskScheduler_sharedInstance__block_invoke()
{
  sharedInstance__instance_0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x1F41817F8]();
}

+ (void)registerTaskDelegate:(id)a3 forRequestID:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if (registerTaskDelegate_forRequestID__onceToken != -1) {
    dispatch_once(&registerTaskDelegate_forRequestID__onceToken, &__block_literal_global_7);
  }
  id v6 = (id)_lockableObject;
  objc_sync_enter(v6);
  id v7 = [(id)_delegates objectForKeyedSubscript:v5];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(id)_delegates setObject:v7 forKeyedSubscript:v5];
  }
  if (([v7 containsObject:v8] & 1) == 0) {
    [v7 addObject:v8];
  }

  objc_sync_exit(v6);
}

void __63__ADBackgroundTaskScheduler_registerTaskDelegate_forRequestID___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_delegates;
  _delegates = (uint64_t)v0;

  v2 = (void *)_lockableObject;
  _lockableObject = @"lock";
}

+ (void)unregisterTaskDelegate:(id)a3
{
  id v3 = a3;
  id v4 = (id)_lockableObject;
  objc_sync_enter(v4);
  if (_delegates)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v6 = (void *)_delegates;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__ADBackgroundTaskScheduler_unregisterTaskDelegate___block_invoke;
    v10[3] = &unk_1E68A0878;
    id v11 = v3;
    id v7 = v5;
    id v12 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v10];
    id v8 = (void *)_delegates;
    _delegates = (uint64_t)v7;
    id v9 = v7;
  }
  objc_sync_exit(v4);
}

void __52__ADBackgroundTaskScheduler_unregisterTaskDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __52__ADBackgroundTaskScheduler_unregisterTaskDelegate___block_invoke_2;
  v13 = &unk_1E68A0850;
  id v14 = *(id *)(a1 + 32);
  id v9 = v8;
  id v15 = v9;
  [v7 enumerateObjectsUsingBlock:&v10];

  if (objc_msgSend(v9, "count", v10, v11, v12, v13)) {
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v5];
  }
}

uint64_t __52__ADBackgroundTaskScheduler_unregisterTaskDelegate___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) != a2) {
    return [*(id *)(result + 40) addObject:a2];
  }
  return result;
}

- (ADBackgroundTaskScheduler)init
{
  v3.receiver = self;
  v3.super_class = (Class)ADBackgroundTaskScheduler;
  return [(ADBackgroundTaskScheduler *)&v3 init];
}

- (void)handleXPCActivity:(id)a3 withID:(id)a4
{
  id v5 = (_xpc_activity_s *)a3;
  id v6 = a4;
  xpc_activity_state_t state = xpc_activity_get_state(v5);
  if ((state | 2) == 2)
  {
    id v8 = (id)_lockableObject;
    objc_sync_enter(v8);
    id v9 = [(id)_delegates objectForKeyedSubscript:v6];
    if (v9)
    {
      if (state)
      {
        if (state == 2)
        {
          uint64_t v10 = [NSString stringWithFormat:@"[%@]: Request to run activity %@ (state: %ld)", objc_opt_class(), v6, 2];
          _ADLog(@"LATDLogging", v10, 0);

          xpc_object_t v11 = xpc_activity_copy_criteria(v5);
          id v12 = [[ADBackgroundTaskRequest alloc] initWithCriteria:v11 ID:v6 activity:v5];
          uint64_t v24 = 0;
          v25 = &v24;
          uint64_t v26 = 0x2020000000;
          char v27 = 0;
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __54__ADBackgroundTaskScheduler_handleXPCActivity_withID___block_invoke;
          v21[3] = &unk_1E68A08A0;
          v23 = &v24;
          v13 = v12;
          v22 = v13;
          [v9 enumerateObjectsUsingBlock:v21];
          if (!*((unsigned char *)v25 + 24))
          {
            id v14 = [NSString stringWithFormat:@"[%@]: No registered handler for task %@ successfully returned.", objc_opt_class(), v6];
            _ADLog(@"LATDLogging", v14, 16);
          }
          _Block_object_dispose(&v24, 8);
        }
      }
      else
      {
        v17 = [NSString stringWithFormat:@"[%@]: Checking in on activity %@ (state: %ld)", objc_opt_class(), v6, 0];
        _ADLog(@"LATDLogging", v17, 0);

        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __54__ADBackgroundTaskScheduler_handleXPCActivity_withID___block_invoke_2;
        v18[3] = &unk_1E68A0850;
        id v19 = v6;
        v20 = v5;
        [v9 enumerateObjectsUsingBlock:v18];
      }
    }
    else
    {
      v16 = [NSString stringWithFormat:@"[%@]: No receiver registered for XPC job with ID %@", objc_opt_class(), v6];
      _ADLog(@"LATDLogging", v16, 0);
    }
    objc_sync_exit(v8);
  }
  else
  {
    id v15 = [NSString stringWithFormat:@"[%@]: Unexpected XPC_ACTIVITY_STATE - %ld", objc_opt_class(), state];
    _ADLog(@"LATDLogging", v15, 0);
  }
}

uint64_t __54__ADBackgroundTaskScheduler_handleXPCActivity_withID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 runTask:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= result;
  return result;
}

void __54__ADBackgroundTaskScheduler_handleXPCActivity_withID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 checkOnTask:*(void *)(a1 + 32) activity:*(void *)(a1 + 40)];
  }
}

- (void)addBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestIdentifier];
  if (v5)
  {
    id v6 = (id)_lockableObject;
    objc_sync_enter(v6);
    id v7 = [(id)_delegates objectForKeyedSubscript:v5];
    if (!v7
      || ([(id)_delegates objectForKeyedSubscript:v5],
          id v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 count],
          v8,
          v7,
          !v9))
    {
      uint64_t v10 = [NSString stringWithFormat:@"[%@]: No delegate is registered to handle request %@.", objc_opt_class(), v5];
      _ADLog(@"LATDLogging", v10, 0);
    }
    objc_sync_exit(v6);

    xpc_object_t v11 = +[ADServer workQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__ADBackgroundTaskScheduler_addBackgroundTask___block_invoke;
    v13[3] = &unk_1E68A08F0;
    id v14 = v4;
    id v15 = self;
    id v16 = v5;
    [v11 addOperationWithBlock:v13];
  }
  else
  {
    id v12 = [NSString stringWithFormat:@"[%@]: No identifier specified for background task activity. Ignoring request.", objc_opt_class()];
    _ADLog(@"LATDLogging", v12, 0);
  }
}

void __47__ADBackgroundTaskScheduler_addBackgroundTask___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dictionaryRepresentation];
  id v3 = objc_msgSend(v2, "AD_jsonString");

  id v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(*(id *)(a1 + 32), "delay"));
  id v5 = NSString;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [*(id *)(a1 + 32) delay];
  [v4 timeIntervalSince1970];
  uint64_t v9 = v8;
  uint64_t v10 = objc_msgSend(v4, "AD_localDateTimeAsString");
  xpc_object_t v11 = [v5 stringWithFormat:@"[%@]: Scheduling XPC activity request to run in %lld seconds (%.0f - %@): %@", v6, v7, v9, v10, v3];
  _ADLog(@"LATDLogging", v11, 0);

  id v12 = (void *)[*(id *)(a1 + 32) copyBackgroundTaskAgentCriteria];
  if (v12)
  {
    v13 = (const char *)[*(id *)(a1 + 48) UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __47__ADBackgroundTaskScheduler_addBackgroundTask___block_invoke_2;
    handler[3] = &unk_1E68A08C8;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    xpc_activity_register(v13, v12, handler);
  }
  else
  {
    id v14 = [NSString stringWithFormat:@"[%@]: No criteria for background task activity: %@", objc_opt_class(), *(void *)(a1 + 48)];
    _ADLog(@"LATDLogging", v14, 0);
  }
}

void __47__ADBackgroundTaskScheduler_addBackgroundTask___block_invoke_2(uint64_t a1, void *a2)
{
  activity = a2;
  id v3 = NSString;
  id v4 = [*(id *)(a1 + 32) requestIdentifier];
  id v5 = [v3 stringWithFormat:@"com.apple.adprivacyd Background task %@ starting", v4];

  takeXPCTransaction(v5);
  if (xpc_activity_get_state(activity) == 2)
  {
    uint64_t v6 = +[ADBackgroundTaskScheduler sharedInstance];
    [v6 handleXPCActivity:activity withID:*(void *)(a1 + 40)];
  }
  releaseXPCTransaction(v5);
}

- (void)cancelBackgroundTask:(id)a3
{
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"[%@]: Canceling XPC activity: %@", objc_opt_class(), v4];
  _ADLog(@"LATDLogging", v5, 0);

  uint64_t v6 = +[ADServer workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__ADBackgroundTaskScheduler_cancelBackgroundTask___block_invoke;
  v8[3] = &unk_1E68A0918;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  [v6 addOperationWithBlock:v8];
}

void __50__ADBackgroundTaskScheduler_cancelBackgroundTask___block_invoke(uint64_t a1)
{
  xpc_activity_unregister((const char *)[*(id *)(a1 + 32) UTF8String]);
  id v2 = [NSString stringWithFormat:@"[%@]: Cancelled XPC activity: %@", objc_opt_class(), *(void *)(a1 + 32)];
  _ADLog(@"LATDLogging", v2, 0);
}

- (void)checkOnTask:(id)a3
{
  id v3 = a3;
  id v4 = (const char *)[v3 UTF8String];
  id v5 = [NSString stringWithFormat:@"com.apple.adprivacyd Checking on background task %@", v3];
  uint64_t v6 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __41__ADBackgroundTaskScheduler_checkOnTask___block_invoke;
  handler[3] = &unk_1E68A08C8;
  id v10 = v5;
  id v11 = v3;
  id v7 = v3;
  id v8 = v5;
  xpc_activity_register(v4, v6, handler);
}

void __41__ADBackgroundTaskScheduler_checkOnTask___block_invoke(uint64_t a1, void *a2)
{
  activity = a2;
  takeXPCTransaction(*(void **)(a1 + 32));
  if ((xpc_activity_get_state(activity) & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    id v3 = +[ADBackgroundTaskScheduler sharedInstance];
    [v3 handleXPCActivity:activity withID:*(void *)(a1 + 40)];
  }
  releaseXPCTransaction(*(void **)(a1 + 32));
}

@end