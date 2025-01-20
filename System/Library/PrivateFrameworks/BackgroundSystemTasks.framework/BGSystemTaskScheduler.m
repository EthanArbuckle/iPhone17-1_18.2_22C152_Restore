@interface BGSystemTaskScheduler
+ (BGSystemTaskScheduler)sharedScheduler;
- (BGSystemTaskScheduler)init;
- (BOOL)canTaskRegistration:(id)a3 produceResultOfIdentifier:(id)a4;
- (BOOL)cancelTaskRequestWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deregisterTaskWithIdentifier:(id)a3;
- (BOOL)registerForTaskWithIdentifier:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5;
- (BOOL)resumeScheduling:(id)a3 error:(id *)a4;
- (BOOL)submitTaskRequest:(id)a3 error:(id *)a4;
- (BOOL)systemTask:(id)a3 canConsumeResultOfIdentifier:(id)a4;
- (BOOL)systemTask:(id)a3 consumedResults:(id)a4 error:(id *)a5;
- (BOOL)systemTask:(id)a3 producedResults:(id)a4 error:(id *)a5;
- (BOOL)systemTask:(id)a3 resetResultsForIdentifier:(id)a4 error:(id *)a5;
- (BOOL)taskStartedWithParameters:(id)a3 error:(id *)a4;
- (BOOL)taskStoppedWithParameters:(id)a3 error:(id *)a4;
- (BOOL)updateTaskRequest:(id)a3 error:(id *)a4;
- (NSMutableDictionary)pendingTaskRegistrationsMap;
- (NSMutableDictionary)preRunningTasksMap;
- (NSMutableDictionary)registrations;
- (NSMutableDictionary)runningTasksMap;
- (OS_dispatch_queue)internalQueue;
- (_DASScheduler)scheduler;
- (id)taskRequestForIdentifier:(id)a3;
- (os_unfair_lock_s)lock;
- (void)expireTaskWithRegistration:(id)a3 withReason:(unint64_t)a4;
- (void)handleDeniedTaskLaunch:(id)a3;
- (void)installEventStreamHandler;
- (void)installResubmissionHandler;
- (void)processEvent:(id)a3 forRegistration:(id)a4;
- (void)runTaskWithRegistration:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setPendingTaskRegistrationsMap:(id)a3;
- (void)setPreRunningTasksMap:(id)a3;
- (void)setRegistrations:(id)a3;
- (void)setRunningTasksMap:(id)a3;
- (void)setScheduler:(id)a3;
@end

@implementation BGSystemTaskScheduler

- (BGSystemTaskScheduler)init
{
  v20.receiver = self;
  v20.super_class = (Class)BGSystemTaskScheduler;
  v2 = [(BGSystemTaskScheduler *)&v20 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    registrations = v3->_registrations;
    v3->_registrations = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    preRunningTasksMap = v3->_preRunningTasksMap;
    v3->_preRunningTasksMap = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    runningTasksMap = v3->_runningTasksMap;
    v3->_runningTasksMap = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingTaskRegistrationsMap = v3->_pendingTaskRegistrationsMap;
    v3->_pendingTaskRegistrationsMap = v10;

    uint64_t v12 = [MEMORY[0x1E4F5FA50] schedulerWithClientName:@"BGSTFramework"];
    scheduler = v3->_scheduler;
    v3->_scheduler = (_DASScheduler *)v12;

    os_log_t v14 = os_log_create("com.apple.BackgroundSystemTasks", "BGSTFramework");
    v15 = (void *)_log;
    _log = (uint64_t)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.bg.system.task.internal.queue", v16);
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v17;

    [(BGSystemTaskScheduler *)v3 installResubmissionHandler];
    [(BGSystemTaskScheduler *)v3 installEventStreamHandler];
  }
  return v3;
}

void __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEBUG)) {
    __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_4();
  }
  v2 = [*(id *)(a1 + 40) registrations];
  v3 = (id *)(a1 + 32);
  v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_3();
    }
LABEL_9:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    return;
  }
  unint64_t v5 = [*v3 length];
  if (v5 > [&unk_1F3380810 unsignedLongValue])
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_1();
    }
    goto LABEL_9;
  }
  v6 = [[BGSystemTaskSchedulerRegistration alloc] initWithIdentifier:*(void *)(a1 + 32) launchQueue:*(void *)(a1 + 48) launchHandler:*(void *)(a1 + 56)];
  v7 = [*(id *)(a1 + 40) registrations];
  [v7 setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) UTF8String];
  v8 = (void *)xpc_copy_event();
  if (v8)
  {
    v9 = +[BGSystemTaskRequest taskRequestWithDescriptor:v8 withIdentifier:*(void *)(a1 + 32)];
    v10 = [*(id *)(a1 + 40) registrations];
    v11 = [v10 objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v11 setTaskRequest:v9];

    if (v9)
    {
      uint64_t v12 = +[BGSystemTaskRequest descriptorWithTaskRequest:v9];
      v13 = [*(id *)(a1 + 40) registrations];
      os_log_t v14 = [v13 objectForKeyedSubscript:*(void *)(a1 + 32)];
      [v14 setDescriptor:v12];

      v15 = [*(id *)(a1 + 40) pendingTaskRegistrationsMap];
      v16 = [v15 objectForKeyedSubscript:*(void *)(a1 + 32)];

      if (v16)
      {
        dispatch_queue_t v17 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
        {
          id v18 = *v3;
          int v25 = 138412290;
          id v26 = v18;
          _os_log_impl(&dword_1D9606000, v17, OS_LOG_TYPE_INFO, "Processing pending event for %@", (uint8_t *)&v25, 0xCu);
        }
        v19 = *(void **)(a1 + 40);
        objc_super v20 = [v19 pendingTaskRegistrationsMap];
        v21 = [v20 objectForKeyedSubscript:*(void *)(a1 + 32)];
        v22 = [*(id *)(a1 + 40) registrations];
        v23 = [v22 objectForKeyedSubscript:*(void *)(a1 + 32)];
        [v19 processEvent:v21 forRegistration:v23];

        v24 = [*(id *)(a1 + 40) pendingTaskRegistrationsMap];
        [v24 removeObjectForKey:*(void *)(a1 + 32)];
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_2();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
}

- (NSMutableDictionary)registrations
{
  return self->_registrations;
}

- (BOOL)registerForTaskWithIdentifier:(id)a3 usingQueue:(id)a4 launchHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(BGSystemTaskScheduler *)self internalQueue];
  dispatch_assert_queue_not_V2(v11);

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v12 = [(BGSystemTaskScheduler *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke;
  block[3] = &unk_1E6B6C330;
  id v18 = v8;
  v19 = self;
  id v21 = v10;
  v22 = &v23;
  id v20 = v9;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_sync(v12, block);

  LOBYTE(v10) = *((unsigned char *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  return (char)v10;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

uint64_t __40__BGSystemTaskScheduler_sharedScheduler__block_invoke()
{
  sharedScheduler_sharedScheduler = objc_alloc_init(BGSystemTaskScheduler);
  return MEMORY[0x1F41817F8]();
}

- (NSMutableDictionary)pendingTaskRegistrationsMap
{
  return self->_pendingTaskRegistrationsMap;
}

- (void)installResubmissionHandler
{
  int out_token = 0;
  v3 = (const char *)[@"com.apple.bg.system.task.resubmission" UTF8String];
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__BGSystemTaskScheduler_installResubmissionHandler__block_invoke;
  v5[3] = &unk_1E6B6C358;
  v5[4] = self;
  notify_register_dispatch(v3, &out_token, internalQueue, v5);
}

- (void)installEventStreamHandler
{
  v3 = [(BGSystemTaskScheduler *)self internalQueue];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke;
  handler[3] = &unk_1E6B6C3D0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.bg.system.task", v3, handler);
}

+ (BGSystemTaskScheduler)sharedScheduler
{
  if (sharedScheduler_onceToken != -1) {
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedScheduler_sharedScheduler;
  return (BGSystemTaskScheduler *)v2;
}

void __51__BGSystemTaskScheduler_installResubmissionHandler__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) runningTasksMap];
  v3 = [v2 allKeys];

  if ([v3 count])
  {
    v4 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1D9606000, v4, OS_LOG_TYPE_DEFAULT, "Resubmitting running BGSTs %{public}@", (uint8_t *)&v6, 0xCu);
    }
    unint64_t v5 = [*(id *)(a1 + 32) scheduler];
    [v5 resubmitRunningTasks:v3];
  }
}

void __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14560]));
  unint64_t v5 = [*(id *)(a1 + 32) registrations];
  int v6 = [v5 objectForKeyedSubscript:v4];

  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 processEvent:v3 forRegistration:v6];
  }
  else
  {
    uint64_t v8 = [v7 pendingTaskRegistrationsMap];
    [v8 setObject:v3 forKeyedSubscript:v4];

    dispatch_time_t v9 = dispatch_time(0, 3000000000);
    id v10 = [*(id *)(a1 + 32) internalQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_2;
    v11[3] = &unk_1E6B6C3A8;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v4;
    dispatch_after(v9, v10, v11);
  }
}

void __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) registrations];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_2_cold_1();
    }
    v4 = [*(id *)(a1 + 32) scheduler];
    unint64_t v5 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_78;
    v7[3] = &unk_1E6B6C380;
    id v8 = v5;
    [v4 unregisterSystemTaskWithIdentifier:v8 completionHandler:v7];

    int v6 = [*(id *)(a1 + 32) pendingTaskRegistrationsMap];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

uint64_t __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_78(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(result + 32), "UTF8String", v2);
    return xpc_set_event();
  }
  return result;
}

- (void)processEvent:(id)a3 forRegistration:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 taskRequest];

  if (v8)
  {
    dispatch_time_t v9 = xpc_dictionary_get_value(v6, "run");
    if (v9 == (void *)MEMORY[0x1E4F14518])
    {
      id v15 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
      {
        v16 = v15;
        dispatch_queue_t v17 = [v7 identifier];
        int v18 = 138412290;
        v19 = v17;
        _os_log_impl(&dword_1D9606000, v16, OS_LOG_TYPE_INFO, "Received run request for %@", (uint8_t *)&v18, 0xCu);
      }
      [(BGSystemTaskScheduler *)self runTaskWithRegistration:v7];
    }
    else
    {
      int64_t int64 = xpc_dictionary_get_int64(v6, "expirationReason");
      v11 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
      {
        id v12 = v11;
        id v13 = [v7 identifier];
        int v18 = 138412546;
        v19 = v13;
        __int16 v20 = 2048;
        int64_t v21 = int64;
        _os_log_impl(&dword_1D9606000, v12, OS_LOG_TYPE_INFO, "Received request to expire %@ with reason: %lu", (uint8_t *)&v18, 0x16u);
      }
      [(BGSystemTaskScheduler *)self expireTaskWithRegistration:v7 withReason:int64];
    }
  }
  else
  {
    id v14 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      -[BGSystemTaskScheduler processEvent:forRegistration:](v14);
    }
  }
}

- (BOOL)submitTaskRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(BGSystemTaskScheduler *)self internalQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v8 = [(BGSystemTaskScheduler *)self internalQueue];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke;
  v16 = &unk_1E6B6C420;
  id v9 = v6;
  v19 = &v25;
  __int16 v20 = &v21;
  id v17 = v9;
  int v18 = self;
  dispatch_sync(v8, &v13);

  int v10 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((unsigned char *)v26 + 24))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"BGSystemTaskSchedulerErrorDomain", v22[3], 0, v13, v14, v15, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    int v10 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v11 = v10 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  unint64_t v4 = [v3 length];
  unint64_t v5 = [&unk_1F3380810 unsignedLongValue];

  if (v4 <= v5)
  {
    id v7 = [*(id *)(a1 + 40) registrations];
    id v8 = [*(id *)(a1 + 32) identifier];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (!v9)
    {
      uint64_t v14 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_2((uint64_t)v2, v14);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v16 = 6;
      goto LABEL_16;
    }
    int v10 = [*(id *)(a1 + 40) preRunningTasksMap];
    BOOL v11 = [*(id *)(a1 + 32) identifier];
    id v12 = [v10 objectForKey:v11];

    if (v12)
    {
      uint64_t v13 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_6((uint64_t)v2, v13);
      }
    }
    else
    {
      id v17 = [*(id *)(a1 + 40) runningTasksMap];
      int v18 = [*(id *)(a1 + 32) identifier];
      v19 = [v17 objectForKey:v18];

      if (!v19)
      {
        char v21 = [*v2 isMemberOfClass:objc_opt_class()];
        uint64_t v22 = [v9 taskRequest];

        if (v22)
        {
          uint64_t v23 = (void *)_log;
          if ((v21 & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
              __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_4((uint64_t)v2, v23);
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
            uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
            uint64_t v16 = 5;
            goto LABEL_16;
          }
          if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = *v2;
            uint64_t v25 = v23;
            char v26 = [v24 identifier];
            *(_DWORD *)buf = 138543362;
            v37 = v26;
            _os_log_impl(&dword_1D9606000, v25, OS_LOG_TYPE_DEFAULT, "submitTaskRequest: Redundant FastPass submission request for %{public}@", buf, 0xCu);
          }
        }
        uint64_t v27 = +[BGSystemTaskRequest descriptorWithTaskRequest:*v2];
        if (v27)
        {
          char v28 = [*(id *)(a1 + 40) scheduler];
          v29 = [*(id *)(a1 + 32) identifier];
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_82;
          v31[3] = &unk_1E6B6C3F8;
          id v32 = v9;
          id v33 = *(id *)(a1 + 32);
          id v34 = v27;
          long long v35 = *(_OWORD *)(a1 + 48);
          [v28 submitTaskRequestWithIdentifier:v29 descriptor:v34 completionHandler:v31];
        }
        else
        {
          v30 = (void *)_log;
          if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
            __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_3((uint64_t)v2, v30);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 4;
        }

        goto LABEL_17;
      }
      __int16 v20 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_5((uint64_t)v2, v20);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = 8;
LABEL_16:
    *(void *)(v15 + 24) = v16;
LABEL_17:

    return;
  }
  id v6 = (void *)_log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
    __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_1((uint64_t)v2, v6);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 9;
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_82(uint64_t a1, int a2)
{
  uint64_t v3 = a1 + 40;
  if (a2)
  {
    [*(id *)(a1 + 32) setTaskRequest:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setDescriptor:*(void *)(a1 + 48)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    id v4 = [*(id *)(a1 + 40) identifier];
    [v4 UTF8String];
    xpc_set_event();

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 3;
    unint64_t v5 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_82_cold_1(v3, v5);
    }
  }
}

- (BOOL)updateTaskRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(BGSystemTaskScheduler *)self internalQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v8 = [(BGSystemTaskScheduler *)self internalQueue];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke;
  uint64_t v16 = &unk_1E6B6C420;
  id v9 = v6;
  v19 = &v25;
  __int16 v20 = &v21;
  id v17 = v9;
  int v18 = self;
  dispatch_sync(v8, &v13);

  int v10 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((unsigned char *)v26 + 24))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"BGSystemTaskSchedulerErrorDomain", v22[3], 0, v13, v14, v15, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    int v10 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v11 = v10 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) identifier];
  unint64_t v4 = [v3 length];
  unint64_t v5 = [&unk_1F3380810 unsignedLongValue];

  if (v4 <= v5)
  {
    id v7 = [*(id *)(a1 + 40) registrations];
    id v8 = [*(id *)(a1 + 32) identifier];
    id v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      int v10 = [v9 taskRequest];

      if (v10)
      {
        uint64_t v11 = objc_opt_class();
        id v12 = [v9 taskRequest];
        uint64_t v13 = objc_opt_class();

        if (v11 == v13)
        {
          v19 = [*(id *)(a1 + 40) preRunningTasksMap];
          __int16 v20 = [*(id *)(a1 + 32) identifier];
          uint64_t v21 = [v19 objectForKey:v20];

          if (!v21)
          {
            uint64_t v23 = [*(id *)(a1 + 40) runningTasksMap];
            uint64_t v24 = [*(id *)(a1 + 32) identifier];
            uint64_t v25 = [v23 objectForKey:v24];

            if (v25 && ([v25 expiring] & 1) == 0)
            {
              long long v35 = (void *)_log;
              if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
                __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_5((uint64_t)v2, v35);
              }
              *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
              *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 8;
            }
            else
            {
              char v26 = +[BGSystemTaskRequest descriptorWithTaskRequest:*v2];
              if (v26)
              {
                uint64_t v27 = [v9 descriptor];
                if (v27
                  && (char v28 = (void *)v27,
                      [v9 descriptor],
                      v29 = objc_claimAutoreleasedReturnValue(),
                      BOOL v30 = xpc_equal(v26, v29),
                      v29,
                      v28,
                      v30))
                {
                  v31 = (void *)_log;
                  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_INFO))
                  {
                    id v32 = (void *)*v2;
                    id v33 = v31;
                    id v34 = [v32 identifier];
                    *(_DWORD *)buf = 138543362;
                    v52 = v34;
                    _os_log_impl(&dword_1D9606000, v33, OS_LOG_TYPE_INFO, "updateTaskRequest: No change in task request for %{public}@", buf, 0xCu);
                  }
                  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
                }
                else
                {
                  v36 = [*(id *)(a1 + 40) scheduler];
                  v37 = [*(id *)(a1 + 32) identifier];
                  v43[0] = MEMORY[0x1E4F143A8];
                  v43[1] = 3221225472;
                  v43[2] = __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_84;
                  v43[3] = &unk_1E6B6C448;
                  id v44 = v9;
                  id v45 = *(id *)(a1 + 32);
                  id v38 = v26;
                  uint64_t v39 = *(void *)(a1 + 48);
                  id v46 = v38;
                  uint64_t v49 = v39;
                  id v40 = v25;
                  uint64_t v41 = *(void *)(a1 + 40);
                  id v47 = v40;
                  uint64_t v48 = v41;
                  uint64_t v50 = *(void *)(a1 + 56);
                  [v36 updateTaskRequestWithIdentifier:v37 descriptor:v38 completionHandler:v43];
                }
              }
              else
              {
                v42 = (void *)_log;
                if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
                  __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_4((uint64_t)v2, v42);
                }
                *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
                *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 4;
              }
            }
            goto LABEL_17;
          }
          uint64_t v22 = (void *)_log;
          if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
            __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_6((uint64_t)v2, v22);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v16 = 8;
        }
        else
        {
          uint64_t v14 = (void *)_log;
          if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
            __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_7((uint64_t)v2, v14);
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v16 = 4;
        }
LABEL_16:
        *(void *)(v15 + 24) = v16;
LABEL_17:

        return;
      }
      int v18 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_3((uint64_t)v2, v18);
      }
    }
    else
    {
      id v17 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_2((uint64_t)v2, v17);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v16 = 6;
    goto LABEL_16;
  }
  id v6 = (void *)_log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
    __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_1((uint64_t)v2, v6);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 9;
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_84(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setTaskRequest:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setDescriptor:*(void *)(a1 + 48)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    uint64_t v3 = *(void **)(a1 + 56);
    if (v3 && [v3 expiring])
    {
      unint64_t v4 = [*(id *)(a1 + 64) runningTasksMap];
      unint64_t v5 = [*(id *)(a1 + 56) identifier];
      [v4 removeObjectForKey:v5];

      id v6 = *(void **)(a1 + 56);
      [v6 clearLocked];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 3;
    id v7 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_84_cold_1(a1, v7);
    }
  }
}

- (BOOL)cancelTaskRequestWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(BGSystemTaskScheduler *)self internalQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v8 = [(BGSystemTaskScheduler *)self internalQueue];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke;
  uint64_t v16 = &unk_1E6B6C420;
  id v9 = v6;
  v19 = &v25;
  __int16 v20 = &v21;
  id v17 = v9;
  int v18 = self;
  dispatch_sync(v8, &v13);

  int v10 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((unsigned char *)v26 + 24))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"BGSystemTaskSchedulerErrorDomain", v22[3], 0, v13, v14, v15, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    int v10 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v11 = v10 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 32) length];
  if (v3 <= [&unk_1F3380810 unsignedLongValue])
  {
    unint64_t v4 = [*(id *)(a1 + 40) registrations];
    unint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (v5)
    {
      id v6 = [v5 taskRequest];

      if (v6)
      {
        id v7 = [*(id *)(a1 + 40) runningTasksMap];
        id v8 = [v7 objectForKey:*(void *)(a1 + 32)];

        if (v8 && ([v8 expiring] & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
            __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_4();
          }
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 8;
          goto LABEL_29;
        }
        id v9 = [*(id *)(a1 + 40) scheduler];
        int v10 = *(void **)(a1 + 32);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_85;
        v18[3] = &unk_1E6B6C380;
        id v19 = v10;
        [v9 unregisterSystemTaskWithIdentifier:v19 completionHandler:v18];

        [v5 setTaskRequest:0];
        [v5 setDescriptor:0];
        if (v8 && [v8 expiring])
        {
          BOOL v11 = _log;
          if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = *v2;
            *(_DWORD *)buf = 138543362;
            uint64_t v21 = v12;
            _os_log_impl(&dword_1D9606000, v11, OS_LOG_TYPE_DEFAULT, "Canceled expiring task %{public}@", buf, 0xCu);
          }
          uint64_t v13 = [*(id *)(a1 + 40) runningTasksMap];
        }
        else
        {
          uint64_t v14 = [*(id *)(a1 + 40) preRunningTasksMap];
          uint64_t v15 = [v14 objectForKey:*(void *)(a1 + 32)];

          if (!v15)
          {
            id v8 = 0;
            goto LABEL_28;
          }
          uint64_t v16 = _log;
          if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v17 = *v2;
            *(_DWORD *)buf = 138543362;
            uint64_t v21 = v17;
            _os_log_impl(&dword_1D9606000, v16, OS_LOG_TYPE_DEFAULT, "Canceled pre-running task %{public}@", buf, 0xCu);
          }
          uint64_t v13 = [*(id *)(a1 + 40) preRunningTasksMap];
          id v8 = (void *)v15;
        }
        [v13 removeObjectForKey:*v2];

        [v8 clearLocked];
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_3();
      }
    }
    else if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
    {
      __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_2();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 6;
LABEL_30:

    return;
  }
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
    __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_1();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 9;
}

uint64_t __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_85(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(result + 32), "UTF8String", v2);
    return xpc_set_event();
  }
  return result;
}

- (id)taskRequestForIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BGSystemTaskScheduler *)self internalQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__0;
  int v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  id v6 = [(BGSystemTaskScheduler *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__BGSystemTaskScheduler_taskRequestForIdentifier___block_invoke;
  block[3] = &unk_1E6B6C470;
  id v11 = v4;
  uint64_t v12 = self;
  uint64_t v13 = &v14;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __50__BGSystemTaskScheduler_taskRequestForIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (uint64_t *)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 32) length];
  if (v3 <= [&unk_1F3380810 unsignedLongValue])
  {
    id v4 = [*(id *)(a1 + 40) registrations];
    unint64_t v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (v5)
    {
      id v6 = [v5 taskRequest];
      uint64_t v7 = [v6 copy];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;
    }
    else
    {
      int v10 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *v2;
        int v12 = 138543362;
        uint64_t v13 = v11;
        _os_log_impl(&dword_1D9606000, v10, OS_LOG_TYPE_DEFAULT, "taskRequestForIdentifier called before registering task %{public}@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
  {
    __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_1();
  }
}

- (BOOL)resumeScheduling:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(BGSystemTaskScheduler *)self internalQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v8 = [(BGSystemTaskScheduler *)self internalQueue];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke;
  uint64_t v16 = &unk_1E6B6C420;
  id v9 = v6;
  id v19 = &v25;
  __int16 v20 = &v21;
  id v17 = v9;
  int v18 = self;
  dispatch_sync(v8, &v13);

  int v10 = *((unsigned __int8 *)v26 + 24);
  if (a4 && !*((unsigned char *)v26 + 24))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"BGSystemTaskSchedulerErrorDomain", v22[3], 0, v13, v14, v15, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    int v10 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v11 = v10 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) length];
  if (v2 <= [&unk_1F3380810 unsignedLongValue])
  {
    unint64_t v3 = [*(id *)(a1 + 40) registrations];
    id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (v4)
    {
      unint64_t v5 = [v4 taskRequest];

      if (v5)
      {
        id v6 = [*(id *)(a1 + 40) preRunningTasksMap];
        uint64_t v7 = [v6 objectForKey:*(void *)(a1 + 32)];

        if (!v7)
        {
          int v10 = [*(id *)(a1 + 40) runningTasksMap];
          BOOL v11 = [v10 objectForKey:*(void *)(a1 + 32)];

          if (v11)
          {
            if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
              __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_4();
            }
            *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
            *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 8;
          }
          else
          {
            int v12 = [*(id *)(a1 + 40) scheduler];
            uint64_t v13 = *(void **)(a1 + 32);
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_86;
            v14[3] = &unk_1E6B6C498;
            id v15 = v13;
            long long v16 = *(_OWORD *)(a1 + 48);
            [v12 resumeTaskSchedulingWithIdentifier:v15 completionHandler:v14];
          }
          goto LABEL_17;
        }
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
          __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_5();
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v9 = 8;
LABEL_16:
        *(void *)(v8 + 24) = v9;
LABEL_17:

        return;
      }
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_3();
      }
    }
    else if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
    {
      __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_2();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = 6;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
    __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_1();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 9;
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_86(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_86_cold_1();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 3;
  }
}

- (void)runTaskWithRegistration:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 identifier];
  id v6 = [(NSMutableDictionary *)self->_runningTasksMap objectForKey:v5];

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      -[BGSystemTaskScheduler runTaskWithRegistration:]();
    }
    id v7 = [(BGSystemTaskScheduler *)self scheduler];
    [v7 acknowledgeSystemTaskLaunchWithIdentifier:v5 error:0];
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v8 = [v4 taskRequest];
  int v9 = [v8 isMemberOfClass:objc_opt_class()];

  if (v9)
  {
    int v10 = BGRepeatingSystemTask;
LABEL_11:
    id v15 = [v10 alloc];
    long long v16 = [(BGSystemTaskScheduler *)self internalQueue];
    id v17 = (void *)[v15 initWithIdentifier:v5 queue:v16];

    [v17 setDelegate:self];
    [v17 prepareForRunning];
    objc_initWeak(location, v17);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke;
    v50[3] = &unk_1E6B6C4C0;
    objc_copyWeak(&v53, location);
    v50[4] = self;
    id v18 = v5;
    id v51 = v18;
    id v19 = v4;
    id v52 = v19;
    [v17 setCompletionHandler:v50];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_92;
    v45[3] = &unk_1E6B6C4E8;
    objc_copyWeak(&v49, location);
    id v20 = v18;
    id v46 = v20;
    id v21 = v19;
    id v47 = v21;
    uint64_t v48 = self;
    [v17 setExpirationAckHandler:v45];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_94;
    v41[3] = &unk_1E6B6C510;
    objc_copyWeak(&v44, location);
    id v22 = v20;
    id v42 = v22;
    v43 = self;
    [v17 setClientLedExpirationHandler:v41];
    uint64_t v23 = [(BGSystemTaskScheduler *)self preRunningTasksMap];
    [v23 setObject:v17 forKey:v22];

    uint64_t v24 = [v21 launchQueue];

    if (v24)
    {
      uint64_t v25 = [v21 taskRequest];
      if ([v25 priority] >= 3)
      {
      }
      else
      {
        char v26 = [v21 launchQueue];
        dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v26, 0);

        if (qos_class >= 0xA && os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_FAULT)) {
          -[BGSystemTaskScheduler runTaskWithRegistration:]();
        }
      }
    }
    else
    {
      char v28 = [v21 taskRequest];
      uint64_t v29 = [v28 priority];

      if (v29 == 3) {
        dispatch_qos_class_t v30 = QOS_CLASS_DEFAULT;
      }
      else {
        dispatch_qos_class_t v30 = QOS_CLASS_BACKGROUND;
      }
      id v31 = [NSString stringWithFormat:@"com.apple.BGSystemTaskScheduler.launchQ.(%@)", v22];
      id v32 = (const char *)[v31 cStringUsingEncoding:4];
      id v33 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v34 = dispatch_queue_attr_make_with_qos_class(v33, v30, 0);
      dispatch_queue_t v35 = dispatch_queue_create(v32, v34);
      [v21 setLaunchQueue:v35];
    }
    v36 = [v21 launchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_100;
    block[3] = &unk_1E6B6C560;
    void block[4] = self;
    id v38 = v22;
    id v39 = v17;
    id v40 = v21;
    id v7 = v17;
    dispatch_async(v36, block);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v49);

    objc_destroyWeak(&v53);
    objc_destroyWeak(location);
    goto LABEL_22;
  }
  BOOL v11 = [v4 taskRequest];
  int v12 = [v11 isMemberOfClass:objc_opt_class()];

  if (v12)
  {
    int v10 = BGNonRepeatingSystemTask;
    goto LABEL_11;
  }
  uint64_t v13 = [v4 taskRequest];
  int v14 = [v13 isMemberOfClass:objc_opt_class()];

  if (v14)
  {
    int v10 = BGFastPassSystemTask;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_FAULT)) {
    -[BGSystemTaskScheduler runTaskWithRegistration:]();
  }
LABEL_23:
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    unint64_t v3 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = WeakRetained;
      _os_log_impl(&dword_1D9606000, v3, OS_LOG_TYPE_DEFAULT, "Marking task %{public}@ complete", (uint8_t *)&v9, 0xCu);
    }
    id v4 = [*(id *)(a1 + 32) scheduler];
    [v4 completeSystemTaskWithIdentifier:*(void *)(a1 + 40)];

    unint64_t v5 = [*(id *)(a1 + 48) taskRequest];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [*(id *)(a1 + 48) setTaskRequest:0];
      [*(id *)(a1 + 48) setDescriptor:0];
    }
    id v7 = [*(id *)(a1 + 32) runningTasksMap];
    uint64_t v8 = [WeakRetained identifier];
    [v7 removeObjectForKey:v8];
  }
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_92(uint64_t a1, double a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ([WeakRetained isMemberOfClass:objc_opt_class()]
      && [WeakRetained expirationReason] == 1)
    {
      [*(id *)(a1 + 40) setTaskRequest:0];
      [*(id *)(a1 + 40) setDescriptor:0];
      unint64_t v5 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = WeakRetained;
        _os_log_impl(&dword_1D9606000, v5, OS_LOG_TYPE_DEFAULT, "Completing FastPass task %{public}@ because it was expired due to runtime limitations", (uint8_t *)&v10, 0xCu);
      }
      id v6 = [*(id *)(a1 + 48) scheduler];
      [v6 completeSystemTaskWithIdentifier:*(void *)(a1 + 32)];
    }
    else
    {
      id v7 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = WeakRetained;
        _os_log_impl(&dword_1D9606000, v7, OS_LOG_TYPE_DEFAULT, "Acking task %{public}@ expired", (uint8_t *)&v10, 0xCu);
      }
      id v6 = [*(id *)(a1 + 48) scheduler];
      [v6 acknowledgeSystemTaskSuspensionWithIdentifier:*(void *)(a1 + 32) retryAfter:a2];
    }

    uint64_t v8 = [*(id *)(a1 + 48) runningTasksMap];
    int v9 = [WeakRetained identifier];
    [v8 removeObjectForKey:v9];
  }
  else if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
  {
    __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_92_cold_1();
  }
}

BOOL __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_94(uint64_t a1, double a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v5 = _log;
  if (WeakRetained)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = WeakRetained;
      _os_log_impl(&dword_1D9606000, v5, OS_LOG_TYPE_DEFAULT, "Client requested expiration of task %{public}@", buf, 0xCu);
    }
    id v6 = [*(id *)(a1 + 40) scheduler];
    id v7 = *(void **)(a1 + 32);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_95;
    int v14 = &unk_1E6B6C2A8;
    long long v16 = &v17;
    id v15 = v7;
    [v6 handleClientLedSystemTaskExpirationWithIdentifier:v15 retryAfter:&v11 completionHandler:a2];

    uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "runningTasksMap", v11, v12, v13, v14);
    [v8 removeObjectForKey:*(void *)(a1 + 32)];

    int v9 = *((unsigned __int8 *)v18 + 24);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_94_cold_1();
    }
    int v9 = *((unsigned __int8 *)v18 + 24);
  }

  _Block_object_dispose(&v17, 8);
  return v9 != 0;
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_95(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if ((a2 & 1) == 0 && os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
    __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_95_cold_1();
  }
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_100(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  dispatch_queue_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__0;
  char v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  unint64_t v2 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_2;
  block[3] = &unk_1E6B6C538;
  unint64_t v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v19 = v3;
  id v21 = &v30;
  id v22 = &v24;
  uint64_t v23 = &v34;
  id v20 = *(id *)(a1 + 48);
  dispatch_sync(v2, block);

  if (*((unsigned char *)v31 + 24))
  {
    id v4 = _log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v5;
      id v6 = "Tried to run a task that is already running; ignoring request for %{public}@";
LABEL_4:
      _os_log_impl(&dword_1D9606000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  else
  {
    if (!*((unsigned char *)v35 + 24))
    {
      uint64_t v11 = dispatch_get_global_queue(9, 0);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_101;
      v15[3] = &unk_1E6B6C3A8;
      id v12 = *(id *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 32);
      id v16 = v12;
      uint64_t v17 = v13;
      dispatch_async(v11, v15);

      goto LABEL_13;
    }
    uint64_t v7 = v25[5];
    id v4 = _log;
    BOOL v8 = os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT);
    if (!v7)
    {
      if (!v8) {
        goto LABEL_13;
      }
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v14;
      id v6 = "Not calling launch handler for %{public}@ since it doesn't exist anymore OR was canceled/resubmitted";
      goto LABEL_4;
    }
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v39 = v9;
      _os_log_impl(&dword_1D9606000, v4, OS_LOG_TYPE_DEFAULT, "Calling launch handler for %{public}@", buf, 0xCu);
    }
    int v10 = [*(id *)(a1 + 56) launchHandler];
    v10[2](v10, v25[5]);
  }
LABEL_13:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) runningTasksMap];
  unint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) preRunningTasksMap];
    uint64_t v5 = [v4 objectForKey:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      BOOL v8 = [*(id *)(a1 + 32) scheduler];
      uint64_t v9 = *(void *)(a1 + 40);
      id v14 = 0;
      char v10 = [v8 acknowledgeSystemTaskLaunchWithIdentifier:v9 error:&v14];
      id v11 = v14;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v10;

      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        id v12 = [*(id *)(a1 + 32) runningTasksMap];
        [v12 setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:*(void *)(a1 + 40)];

        uint64_t v13 = [*(id *)(a1 + 32) preRunningTasksMap];
        [v13 removeObjectForKey:*(void *)(a1 + 40)];
      }
      else if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
      {
        __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_2_cold_1();
      }
    }
  }
}

uint64_t __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_101(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)_log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = *(void **)(a1 + 32);
    id v4 = v2;
    uint64_t v5 = [v3 identifier];
    int v7 = 138543362;
    BOOL v8 = v5;
    _os_log_impl(&dword_1D9606000, v4, OS_LOG_TYPE_DEFAULT, "Cancelling and resubmitting %{public}@ due to a failed launch acknowledgment", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 40) handleDeniedTaskLaunch:*(void *)(a1 + 32)];
}

- (void)handleDeniedTaskLaunch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 taskRequest];
  uint64_t v6 = (void *)[v5 copy];

  int v7 = [v4 identifier];
  id v15 = 0;
  BOOL v8 = [(BGSystemTaskScheduler *)self cancelTaskRequestWithIdentifier:v7 error:&v15];
  id v9 = v15;

  if (v8)
  {
    id v14 = v9;
    BOOL v10 = [(BGSystemTaskScheduler *)self submitTaskRequest:v6 error:&v14];
    id v11 = v14;

    if (!v10)
    {
      id v12 = (void *)_log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        -[BGSystemTaskScheduler handleDeniedTaskLaunch:](v12);
      }
    }
    id v9 = v11;
  }
  else
  {
    uint64_t v13 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      -[BGSystemTaskScheduler handleDeniedTaskLaunch:](v13);
    }
  }
}

- (void)expireTaskWithRegistration:(id)a3 withReason:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 identifier];
  int v7 = [(BGSystemTaskScheduler *)self runningTasksMap];
  BOOL v8 = [v7 objectForKey:v6];

  id v9 = [v8 uuid];
  BOOL v10 = (void *)[v9 copy];

  if (v8)
  {
    id v11 = [v8 completionHandler];

    if (v11)
    {
      if (([v8 hasValidExpirationHandler] & 1) == 0)
      {
        id v12 = _log;
        if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v20 = v6;
          _os_log_impl(&dword_1D9606000, v12, OS_LOG_TYPE_DEFAULT, "Expiration handler not found for %{public}@, caching expiration request in task.", buf, 0xCu);
        }
      }
      [v8 handleExpirationWithReason:a4];
      dispatch_time_t v13 = dispatch_time(0, 60000000000);
      internalQueue = self->_internalQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__BGSystemTaskScheduler_expireTaskWithRegistration_withReason___block_invoke;
      block[3] = &unk_1E6B6C588;
      void block[4] = self;
      id v17 = v6;
      id v18 = v10;
      dispatch_after(v13, internalQueue, block);
    }
    else
    {
      id v15 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v6;
        _os_log_impl(&dword_1D9606000, v15, OS_LOG_TYPE_DEFAULT, "Not expiring, task %{public}@ already finished", buf, 0xCu);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR))
  {
    -[BGSystemTaskScheduler expireTaskWithRegistration:withReason:]();
  }
}

void __63__BGSystemTaskScheduler_expireTaskWithRegistration_withReason___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) runningTasksMap];
  unint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [v3 uuid];
    if ([v4 compare:*(void *)(a1 + 48)])
    {
    }
    else
    {
      int v5 = [v3 expiring];

      if (v5 && os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_FAULT)) {
        __63__BGSystemTaskScheduler_expireTaskWithRegistration_withReason___block_invoke_cold_1();
      }
    }
  }
}

- (BOOL)deregisterTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(BGSystemTaskScheduler *)self internalQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  uint64_t v6 = [(BGSystemTaskScheduler *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke;
  block[3] = &unk_1E6B6C5B0;
  id v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return (char)v4;
}

void __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (uint64_t *)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 32) length];
  if (v3 <= [&unk_1F3380810 unsignedLongValue])
  {
    id v4 = [*(id *)(a1 + 40) registrations];
    int v5 = [v4 objectForKeyedSubscript:*(void *)(a1 + 32)];

    if (!v5)
    {
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_cold_2();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_29;
    }
    uint64_t v6 = [*(id *)(a1 + 40) runningTasksMap];
    id v7 = [v6 objectForKey:*(void *)(a1 + 32)];

    if (v7 && ([v7 expiring] & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
        __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_cold_3();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_28;
    }
    BOOL v8 = [*(id *)(a1 + 40) scheduler];
    id v9 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_102;
    v22[3] = &unk_1E6B6C380;
    id v23 = v9;
    [v8 unregisterSystemTaskWithIdentifier:v23 completionHandler:v22];

    id v10 = [*(id *)(a1 + 40) pendingTaskRegistrationsMap];
    id v11 = [v10 objectForKey:*(void *)(a1 + 32)];

    if (v11)
    {
      id v12 = [*(id *)(a1 + 40) pendingTaskRegistrationsMap];
      [v12 removeObjectForKey:*(void *)(a1 + 32)];
    }
    [v5 setTaskRequest:0];
    [v5 setDescriptor:0];
    uint64_t v13 = [*(id *)(a1 + 40) registrations];
    [v13 removeObjectForKey:*(void *)(a1 + 32)];

    if (v7 && [v7 expiring])
    {
      id v14 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *v2;
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v15;
        _os_log_impl(&dword_1D9606000, v14, OS_LOG_TYPE_DEFAULT, "Deregistered expiring task %{public}@", buf, 0xCu);
      }
      char v16 = [*(id *)(a1 + 40) runningTasksMap];
      id v17 = [v7 identifier];
      [v16 removeObjectForKey:v17];
    }
    else
    {
      id v18 = [*(id *)(a1 + 40) preRunningTasksMap];
      uint64_t v19 = [v18 objectForKey:*(void *)(a1 + 32)];

      if (!v19)
      {
        id v7 = 0;
        goto LABEL_27;
      }
      id v20 = _log;
      if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *v2;
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v21;
        _os_log_impl(&dword_1D9606000, v20, OS_LOG_TYPE_DEFAULT, "Deregistered pre-running task %{public}@", buf, 0xCu);
      }
      char v16 = [*(id *)(a1 + 40) preRunningTasksMap];
      [v16 removeObjectForKey:*(void *)(a1 + 32)];
      id v7 = (void *)v19;
    }

    [v7 clearLocked];
LABEL_27:

LABEL_28:
LABEL_29:

    return;
  }
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
    __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_1();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
}

uint64_t __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_102(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(result + 32), "UTF8String", v2);
    return xpc_set_event();
  }
  return result;
}

- (BOOL)taskStartedWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1D9606000, v7, OS_LOG_TYPE_DEFAULT, "Task started %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  BOOL v8 = [(BGSystemTaskScheduler *)self internalQueue];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __57__BGSystemTaskScheduler_taskStartedWithParameters_error___block_invoke;
  char v16 = &unk_1E6B6C420;
  id v9 = v6;
  p_long long buf = &buf;
  id v20 = &v21;
  id v17 = v9;
  id v18 = self;
  dispatch_sync(v8, &v13);

  if (*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v11 = v22[3];
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"BGSystemTaskSchedulerErrorDomain", v11, 0, v13, v14, v15, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v10 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&buf, 8);

  return v10;
}

void __57__BGSystemTaskScheduler_taskStartedWithParameters_error___block_invoke(uint64_t a1)
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"FeatureCode", @"TaskName", @"InvolvedProcesses", @"Paused", 0);
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"FeatureCode", @"TaskName", 0);
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  int v5 = [*(id *)(a1 + 32) allKeys];
  id v6 = [v4 setWithArray:v5];

  if (![v6 count]) {
    goto LABEL_7;
  }
  if (([v6 isSubsetOfSet:v2] & 1) == 0) {
    goto LABEL_7;
  }
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v8 = [*(id *)(a1 + 32) allKeys];
  id v9 = [v7 setWithArray:v8];
  char v10 = [v3 isSubsetOfSet:v9];

  if ((v10 & 1) == 0)
  {
LABEL_7:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 4;
    goto LABEL_8;
  }
  uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"FeatureCode"];
  int v12 = [v11 isEqual:&unk_1F33807C8];

  if (!v12)
  {
    char v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"FeatureCode"];
    int v17 = [v16 isEqual:&unk_1F33807E0];

    if (v17)
    {
      id v18 = [*(id *)(a1 + 40) scheduler];
      uint64_t v27 = *MEMORY[0x1E4F5FB80];
      uint64_t v28 = &unk_1F3380828;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = &v28;
      uint64_t v21 = &v27;
    }
    else
    {
      id v22 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"FeatureCode"];
      int v23 = [v22 isEqual:&unk_1F33807F8];

      if (!v23) {
        goto LABEL_6;
      }
      id v18 = [*(id *)(a1 + 40) scheduler];
      uint64_t v25 = *MEMORY[0x1E4F5FB78];
      uint64_t v26 = &unk_1F3380828;
      uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
      id v20 = &v26;
      uint64_t v21 = &v25;
    }
    uint64_t v24 = [v19 dictionaryWithObjects:v20 forKeys:v21 count:1];
    [v18 updateSystemConstraintsWithParameters:v24];

    goto LABEL_8;
  }
  uint64_t v13 = [*(id *)(a1 + 40) scheduler];
  uint64_t v29 = *MEMORY[0x1E4F5FB88];
  v30[0] = &unk_1F3380828;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  [v13 updateSystemConstraintsWithParameters:v14];

LABEL_6:
  uint64_t v15 = [*(id *)(a1 + 40) scheduler];
  [v15 activityStartedWithParameters:*(void *)(a1 + 32)];

LABEL_8:
}

- (BOOL)taskStoppedWithParameters:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _log;
  if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_1D9606000, v6, OS_LOG_TYPE_DEFAULT, "Task stopped %@", buf, 0xCu);
  }
  id v7 = [(BGSystemTaskScheduler *)self internalQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__BGSystemTaskScheduler_taskStoppedWithParameters_error___block_invoke;
  v10[3] = &unk_1E6B6C3A8;
  id v11 = v5;
  int v12 = self;
  id v8 = v5;
  dispatch_sync(v7, v10);

  return 1;
}

void __57__BGSystemTaskScheduler_taskStoppedWithParameters_error___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"FeatureCode"];
  int v3 = [v2 isEqual:&unk_1F33807C8];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) scheduler];
    uint64_t v19 = *MEMORY[0x1E4F5FB88];
    v20[0] = &unk_1F3380840;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v4 updateSystemConstraintsWithParameters:v5];

LABEL_8:
    id v8 = [*(id *)(a1 + 40) scheduler];
    [v8 activityStoppedWithParameters:*(void *)(a1 + 32)];
    goto LABEL_9;
  }
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"FeatureCode"];
  int v7 = [v6 isEqual:&unk_1F33807E0];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) scheduler];
    uint64_t v17 = *MEMORY[0x1E4F5FB80];
    id v18 = &unk_1F3380840;
    id v9 = (void *)MEMORY[0x1E4F1C9E8];
    char v10 = &v18;
    id v11 = &v17;
  }
  else
  {
    int v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"FeatureCode"];
    int v13 = [v12 isEqual:&unk_1F33807F8];

    if (!v13) {
      goto LABEL_8;
    }
    id v8 = [*(id *)(a1 + 40) scheduler];
    uint64_t v15 = *MEMORY[0x1E4F5FB78];
    char v16 = &unk_1F3380840;
    id v9 = (void *)MEMORY[0x1E4F1C9E8];
    char v10 = &v16;
    id v11 = &v15;
  }
  id v14 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
  [v8 updateSystemConstraintsWithParameters:v14];

LABEL_9:
}

- (BOOL)systemTask:(id)a3 producedResults:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  char v10 = (id)_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [v8 identifier];
    -[BGSystemTaskScheduler systemTask:producedResults:error:](v11, (uint64_t)v9, (uint64_t)v33);
  }

  int v12 = [(BGSystemTaskScheduler *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__BGSystemTaskScheduler_systemTask_producedResults_error___block_invoke;
  block[3] = &unk_1E6B6C600;
  void block[4] = self;
  id v13 = v8;
  id v19 = v13;
  uint64_t v21 = &v23;
  id v22 = &v29;
  id v14 = v9;
  id v20 = v14;
  dispatch_sync(v12, block);

  int v15 = *((unsigned __int8 *)v30 + 24);
  if (a5 && !*((unsigned char *)v30 + 24))
  {
    *a5 = (id) v24[5];
    int v15 = *((unsigned __int8 *)v30 + 24);
  }
  BOOL v16 = v15 != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

void __58__BGSystemTaskScheduler_systemTask_producedResults_error___block_invoke(uint64_t a1)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) registrations];
  int v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [MEMORY[0x1E4F1CA80] set];
  if (v4)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          int v12 = *(void **)(a1 + 32);
          id v13 = [v11 identifier];
          LOBYTE(v12) = [v12 canTaskRegistration:v4 produceResultOfIdentifier:v13];

          if ((v12 & 1) == 0)
          {
            BOOL v16 = (void *)_log;
            if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
              __58__BGSystemTaskScheduler_systemTask_producedResults_error___block_invoke_cold_2((void **)(a1 + 40), v16);
            }
            uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
            v37[0] = @"taskIdentifier";
            id v18 = [*(id *)(a1 + 40) identifier];
            v37[1] = @"resultIdentifier";
            v38[0] = v18;
            id v19 = [v11 identifier];
            v38[1] = v19;
            id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
            uint64_t v21 = [v17 errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:7 userInfo:v20];
            uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
            uint64_t v23 = *(void **)(v22 + 40);
            *(void *)(v22 + 40) = v21;

            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
            goto LABEL_14;
          }
          id v14 = [v11 asDASActivityResult];
          [v5 addObject:v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v6 = [*(id *)(a1 + 32) scheduler];
    int v15 = [*(id *)(a1 + 40) identifier];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__BGSystemTaskScheduler_systemTask_producedResults_error___block_invoke_116;
    v31[3] = &unk_1E6B6C5D8;
    long long v32 = *(_OWORD *)(a1 + 56);
    [v6 reportSystemTaskWithIdentifier:v15 producedResults:v5 completionHandler:v31];

LABEL_14:
  }
  else
  {
    uint64_t v24 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __58__BGSystemTaskScheduler_systemTask_producedResults_error___block_invoke_cold_1(a1 + 40, v24);
    }
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = @"taskIdentifier";
    uint64_t v26 = [*(id *)(a1 + 40) identifier];
    v41[0] = v26;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    uint64_t v28 = [v25 errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:6 userInfo:v27];
    uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __58__BGSystemTaskScheduler_systemTask_producedResults_error___block_invoke_116(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)systemTask:(id)a3 consumedResults:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__0;
  uint64_t v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  char v10 = (id)_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [v8 identifier];
    -[BGSystemTaskScheduler systemTask:consumedResults:error:](v11, (uint64_t)v9, (uint64_t)v33);
  }

  int v12 = [(BGSystemTaskScheduler *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__BGSystemTaskScheduler_systemTask_consumedResults_error___block_invoke;
  block[3] = &unk_1E6B6C600;
  void block[4] = self;
  id v13 = v8;
  id v19 = v13;
  uint64_t v21 = &v23;
  uint64_t v22 = &v29;
  id v14 = v9;
  id v20 = v14;
  dispatch_sync(v12, block);

  int v15 = *((unsigned __int8 *)v30 + 24);
  if (a5 && !*((unsigned char *)v30 + 24))
  {
    *a5 = (id) v24[5];
    int v15 = *((unsigned __int8 *)v30 + 24);
  }
  BOOL v16 = v15 != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v16;
}

void __58__BGSystemTaskScheduler_systemTask_consumedResults_error___block_invoke(uint64_t a1)
{
  v56[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) registrations];
  int v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [MEMORY[0x1E4F1CA80] set];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  if (v4)
  {
    uint64_t v40 = v4;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v7 = [v4 taskRequest];
    id v8 = [v7 dependencies];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v48 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v47 + 1) + 8 * i) identifier];
          [v5 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v10);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      while (2)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          id v20 = [v19 identifier];
          char v21 = [v5 containsObject:v20];

          if ((v21 & 1) == 0)
          {
            uint64_t v25 = (void *)_log;
            if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
              __58__BGSystemTaskScheduler_systemTask_consumedResults_error___block_invoke_cold_2(v25, (uint64_t)v19, (id *)(a1 + 40));
            }
            uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
            v51[0] = @"taskIdentifier";
            uint64_t v27 = [*(id *)(a1 + 40) identifier];
            v51[1] = @"resultIdentifier";
            v52[0] = v27;
            id v28 = [v19 identifier];
            v52[1] = v28;
            uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
            uint64_t v30 = [v26 errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:7 userInfo:v29];
            uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
            char v32 = *(void **)(v31 + 40);
            *(void *)(v31 + 40) = v30;

            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
            goto LABEL_21;
          }
          uint64_t v22 = [v19 asDASActivityResult];
          [v6 addObject:v22];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    uint64_t v23 = [*(id *)(a1 + 32) scheduler];
    uint64_t v24 = [*(id *)(a1 + 40) identifier];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __58__BGSystemTaskScheduler_systemTask_consumedResults_error___block_invoke_118;
    void v41[3] = &unk_1E6B6C5D8;
    long long v42 = *(_OWORD *)(a1 + 56);
    [v23 reportSystemTaskWithIdentifier:v24 consumedResults:v6 completionHandler:v41];

LABEL_21:
    id v4 = v40;
  }
  else
  {
    long long v33 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __58__BGSystemTaskScheduler_systemTask_consumedResults_error___block_invoke_cold_1(a1 + 40, v33);
    }
    uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
    v55 = @"taskIdentifier";
    long long v35 = [*(id *)(a1 + 40) identifier];
    v56[0] = v35;
    long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    uint64_t v37 = [v34 errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:6 userInfo:v36];
    uint64_t v38 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v39 = *(void **)(v38 + 40);
    *(void *)(v38 + 40) = v37;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __58__BGSystemTaskScheduler_systemTask_consumedResults_error___block_invoke_118(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)systemTask:(id)a3 canConsumeResultOfIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v8 = [(BGSystemTaskScheduler *)self internalQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__BGSystemTaskScheduler_systemTask_canConsumeResultOfIdentifier___block_invoke;
  v12[3] = &unk_1E6B6C628;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  uint64_t v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

void __65__BGSystemTaskScheduler_systemTask_canConsumeResultOfIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) registrations];
  int v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = objc_msgSend(v4, "taskRequest", 0);
    id v6 = [v5 dependencies];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(a1 + 48);
          int v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) identifier];
          LODWORD(v11) = [v11 isEqualToString:v12];

          if (v11)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v13 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __65__BGSystemTaskScheduler_systemTask_canConsumeResultOfIdentifier___block_invoke_cold_1(a1 + 40, v13);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (BOOL)systemTask:(id)a3 resetResultsForIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  id v10 = [(BGSystemTaskScheduler *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__BGSystemTaskScheduler_systemTask_resetResultsForIdentifier_error___block_invoke;
  block[3] = &unk_1E6B6C650;
  void block[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  uint64_t v19 = &v21;
  id v20 = &v27;
  dispatch_sync(v10, block);

  int v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((unsigned char *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v13 = *((unsigned __int8 *)v28 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __68__BGSystemTaskScheduler_systemTask_resetResultsForIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registrations];
  int v3 = [*(id *)(a1 + 40) identifier];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __68__BGSystemTaskScheduler_systemTask_resetResultsForIdentifier_error___block_invoke_cold_1();
    }
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = 6;
    goto LABEL_10;
  }
  if (([*(id *)(a1 + 32) canTaskRegistration:v4 produceResultOfIdentifier:*(void *)(a1 + 48)] & 1) == 0)
  {
    id v10 = (void *)_log;
    if (os_log_type_enabled((os_log_t)_log, OS_LOG_TYPE_ERROR)) {
      __68__BGSystemTaskScheduler_systemTask_resetResultsForIdentifier_error___block_invoke_cold_2(a1 + 40, v10);
    }
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = 7;
LABEL_10:
    uint64_t v11 = [v8 errorWithDomain:@"BGSystemTaskSchedulerErrorDomain" code:v9 userInfo:0];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    int v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_11;
  }
  id v5 = [*(id *)(a1 + 32) scheduler];
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = [*(id *)(a1 + 40) identifier];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__BGSystemTaskScheduler_systemTask_resetResultsForIdentifier_error___block_invoke_119;
  v14[3] = &unk_1E6B6C5D8;
  int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
  [v5 resetResultsForIdentifier:v6 byTaskWithIdentifier:v7 completionHandler:v14];

LABEL_11:
}

void __68__BGSystemTaskScheduler_systemTask_resetResultsForIdentifier_error___block_invoke_119(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)canTaskRegistration:(id)a3 produceResultOfIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 taskRequest];
  id v8 = [v7 producedResultIdentifiers];
  if (v8)
  {
    uint64_t v9 = [v5 taskRequest];
    id v10 = [v9 producedResultIdentifiers];
    char v11 = [v10 containsObject:v6];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void)setInternalQueue:(id)a3
{
}

- (void)setRegistrations:(id)a3
{
}

- (NSMutableDictionary)preRunningTasksMap
{
  return self->_preRunningTasksMap;
}

- (void)setPreRunningTasksMap:(id)a3
{
}

- (NSMutableDictionary)runningTasksMap
{
  return self->_runningTasksMap;
}

- (void)setRunningTasksMap:(id)a3
{
}

- (void)setPendingTaskRegistrationsMap:(id)a3
{
}

- (_DASScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_pendingTaskRegistrationsMap, 0);
  objc_storeStrong((id *)&self->_runningTasksMap, 0);
  objc_storeStrong((id *)&self->_preRunningTasksMap, 0);
  objc_storeStrong((id *)&self->_registrations, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7();
  int v3 = &unk_1F3380810;
  OUTLINED_FUNCTION_8(&dword_1D9606000, v0, v1, "Identifier %@ exceeds %@ chars", v2);
}

void __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "Converting from XPC event descriptor to task request failed for: %{public}@", v2, v3, v4, v5, v6);
}

void __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "Launch handler for task with identifier %@ has already been registered", v2, v3, v4, v5, v6);
}

void __80__BGSystemTaskScheduler_registerForTaskWithIdentifier_usingQueue_launchHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1D9606000, v0, OS_LOG_TYPE_DEBUG, "registerForTaskWithIdentifier: %{public}@", v1, 0xCu);
}

void __50__BGSystemTaskScheduler_installEventStreamHandler__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "No registration from client for: %{public}@. Unregistering!", v2, v3, v4, v5, v6);
}

- (void)processEvent:(void *)a1 forRegistration:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "Task request for %{public}@ was likely canceled before the signal from dasd arrived. Ignoring", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_13();
  uint64_t v6 = &unk_1F3380810;
  OUTLINED_FUNCTION_8(&dword_1D9606000, v2, v4, "Identifier %@ exceeds %@ chars", v5);
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "submitTaskRequest for %{public}@ called before registering task", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_3(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "submitTaskRequest Creating descriptor failed for %{public}@ likely due to invalid params", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_4(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "submitTaskRequest for %{public}@ called for a task request already submitted (likely thru plist or before idle-exit)", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_5(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "submitTaskRequest called for an already running task %{public}@", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_cold_6(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "submitTaskRequest called for a pre-running task %{public}@", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_submitTaskRequest_error___block_invoke_82_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "submitTaskRequest failed for %{public}@", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "updateTaskRequest for %{public}@ called before registering task", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_3(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "updateTaskRequest No task request found for %{public}@", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_4(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "updateTaskRequest Creating descriptor failed for %{public}@ likely due to invalid params", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_5(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "updateTaskRequest called for an already running/updated task %{public}@", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_6(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "updateTaskRequest called for a pre-running task %{public}@", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_cold_7(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "updateTaskRequest called with a different task request type for %{public}@", v6, v7, v8, v9, v10);
}

void __49__BGSystemTaskScheduler_updateTaskRequest_error___block_invoke_84_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v5, v6, "updateTaskRequest failed for %{public}@", v7, v8, v9, v10, v11);
}

void __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "cancelTaskRequestWithIdentifier called before registering task %{public}@", v2, v3, v4, v5, v6);
}

void __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "cancelTaskRequestWithIdentifier No task request found for %{public}@", v2, v3, v4, v5, v6);
}

void __63__BGSystemTaskScheduler_cancelTaskRequestWithIdentifier_error___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "cancelTaskRequestWithIdentifier called for an already running task %{public}@", v2, v3, v4, v5, v6);
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "resumeScheduling called before registering task %{public}@", v2, v3, v4, v5, v6);
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "resumeScheduling: No task request found for %{public}@", v2, v3, v4, v5, v6);
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "resumeScheduling called for an already running task %{public}@", v2, v3, v4, v5, v6);
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "resumeScheduling called for a pre-running task %{public}@", v2, v3, v4, v5, v6);
}

void __48__BGSystemTaskScheduler_resumeScheduling_error___block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "resumeScheduling failed for %{public}@", v2, v3, v4, v5, v6);
}

- (void)runTaskWithRegistration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1D9606000, v0, OS_LOG_TYPE_FAULT, "%{public}@: launchQueue is of higher QoS than it should be", v1, 0xCu);
}

- (void)runTaskWithRegistration:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1D9606000, v0, OS_LOG_TYPE_FAULT, "Found registration of invalid type for %{public}@", v1, 0xCu);
}

- (void)runTaskWithRegistration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "%{public}@ already running, did dasd crash?", v2, v3, v4, v5, v6);
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "Unable to ack task %{public}@ expiration; missing strong reference to BGSystemTask",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_94_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "Unable to ack task %{public}@ proactive deferral; missing strong reference to BGSystemTask",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_95_cold_1()
{
  OUTLINED_FUNCTION_11(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "handleClientLedSystemTaskExpirationWithIdentifier failed for %{public}@", v2, v3, v4, v5, v6);
}

void __49__BGSystemTaskScheduler_runTaskWithRegistration___block_invoke_2_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_8(&dword_1D9606000, v1, (uint64_t)v1, "System task launch acknowledgment failed for %{public}@ (error: %@)", v2);
}

- (void)handleDeniedTaskLaunch:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() identifier];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_1D9606000, v1, v4, "Failed to submit task request %{public}@ (%@)", v5);
}

- (void)handleDeniedTaskLaunch:(void *)a1 .cold.2(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_12() identifier];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_1D9606000, v1, v4, "Failed to cancel currently existing task request for %{public}@ (%@)", v5);
}

- (void)expireTaskWithRegistration:withReason:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "Unable to expire %{public}@ since it wasn't found running", v2, v3, v4, v5, v6);
}

void __63__BGSystemTaskScheduler_expireTaskWithRegistration_withReason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  __int16 v2 = 2048;
  uint64_t v3 = 0x404E000000000000;
  _os_log_fault_impl(&dword_1D9606000, v0, OS_LOG_TYPE_FAULT, "%{public}@ was expired %fs ago, but hasn't responded yet", v1, 0x16u);
}

void __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "deregisterTaskWithIdentifier: No registration found for task with identifier %{public}@", v2, v3, v4, v5, v6);
}

void __54__BGSystemTaskScheduler_deregisterTaskWithIdentifier___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "deregisterTaskWithIdentifier isn't supported for an already running task %{public}@", v2, v3, v4, v5, v6);
}

- (void)systemTask:(void *)a1 producedResults:(uint64_t)a2 error:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_9((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_debug_impl(&dword_1D9606000, v5, OS_LOG_TYPE_DEBUG, "Reporting result production for %{public}@: %@", v4, 0x16u);
}

void __58__BGSystemTaskScheduler_systemTask_producedResults_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "validateTaskIdentifier:resultProduction: No registration found for task with identifier %{public}@", v6, v7, v8, v9, v10);
}

void __58__BGSystemTaskScheduler_systemTask_producedResults_error___block_invoke_cold_2(void **a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  id v4 = a2;
  [(id)OUTLINED_FUNCTION_12() identifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [(id)OUTLINED_FUNCTION_3() identifier];
  int v7 = 138543618;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint8_t v10 = v5;
  OUTLINED_FUNCTION_8(&dword_1D9606000, v2, v6, "Task %{public}@ is not registered to produce results for %@", (uint8_t *)&v7);
}

- (void)systemTask:(void *)a1 consumedResults:(uint64_t)a2 error:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_9((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_debug_impl(&dword_1D9606000, v5, OS_LOG_TYPE_DEBUG, "Reporting result consumption for %{public}@: %@", v4, 0x16u);
}

void __58__BGSystemTaskScheduler_systemTask_consumedResults_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "validateTaskIdentifier:resultConsumption: No registration found for task with identifier %{public}@", v6, v7, v8, v9, v10);
}

void __58__BGSystemTaskScheduler_systemTask_consumedResults_error___block_invoke_cold_2(void *a1, uint64_t a2, id *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v6 = [(id)OUTLINED_FUNCTION_12() identifier];
  uint64_t v7 = [*a3 identifier];
  int v9 = 138412546;
  uint8_t v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  OUTLINED_FUNCTION_8(&dword_1D9606000, v3, v8, "validateTaskIdentifier:resultConsumption: No dependency found for %@ on %{public}@", (uint8_t *)&v9);
}

void __65__BGSystemTaskScheduler_systemTask_canConsumeResultOfIdentifier___block_invoke_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_6(a1, a2);
  uint64_t v3 = [(id)OUTLINED_FUNCTION_3() identifier];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D9606000, v4, v5, "canTaskWithIdentifier:consumeResultOfIdentifier: No registration found for task with identifier %{public}@", v6, v7, v8, v9, v10);
}

void __68__BGSystemTaskScheduler_systemTask_resetResultsForIdentifier_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D9606000, v0, v1, "resetResultsForIdentifier: No registration found for task with identifier %{public}@", v2, v3, v4, v5, v6);
}

void __68__BGSystemTaskScheduler_systemTask_resetResultsForIdentifier_error___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_12() identifier];
  OUTLINED_FUNCTION_2();
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  OUTLINED_FUNCTION_8(&dword_1D9606000, v2, v6, "resetResultsForIdentifier: Task with identifier %{public}@ is not registered to produce results for %@", v7);
}

@end