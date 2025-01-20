@interface AWServiceManager
+ (id)invokeWithService:(id)a3;
+ (id)sharedManager;
+ (void)addObserver:(id)a3;
+ (void)removeObserver:(id)a3;
- (AWServiceManager)init;
- (id)invokeWithService:(id)a3;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation AWServiceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceObservers, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[AWServiceManager removeObserver:]", "ClientHelpers.m", 134, "observer");
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__AWServiceManager_removeObserver___block_invoke;
  v7[3] = &unk_1E606AC98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __35__AWServiceManager_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (!v4) {
    __assert_rtn("-[AWServiceManager addObserver:]", "ClientHelpers.m", 121, "observer");
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__AWServiceManager_addObserver___block_invoke;
  v7[3] = &unk_1E606AC98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __32__AWServiceManager_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (id)invokeWithService:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1136;
  v25 = __Block_byref_object_dispose__1137;
  id v26 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1136;
  v19 = __Block_byref_object_dispose__1137;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AWServiceManager_invokeWithService___block_invoke;
  block[3] = &unk_1E606A500;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v21;
  dispatch_sync(queue, block);
  if (v16[5])
  {
    v4[2](v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v7 = (void *)v22[5];
      if (v7) {
        id v6 = v7;
      }
      else {
        id v6 = 0;
      }
    }
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      id v8 = _AALog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        unint64_t v12 = absTimeNS();
        if (v12 == -1) {
          double v13 = INFINITY;
        }
        else {
          double v13 = (double)v12 / 1000000000.0;
        }
        *(_DWORD *)buf = 134217984;
        double v30 = v13;
        _os_log_error_impl(&dword_1B3B4B000, v8, OS_LOG_TYPE_ERROR, "%13.5f: couldn't fetch the scheduler", buf, 0xCu);
      }
    }
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28 = @" Unable to fetch scheduler";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v6 = [v9 errorWithDomain:*MEMORY[0x1E4F28798] code:57 userInfo:v10];
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);

  return v6;
}

void __38__AWServiceManager_invokeWithService___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__AWServiceManager_invokeWithService___block_invoke_2;
  v6[3] = &unk_1E606A938;
  v6[4] = a1[6];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
  uint64_t v4 = *(void *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __38__AWServiceManager_invokeWithService___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (currentLogLevel == 5)
  {
    uint64_t v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v5 = absTimeNS();
      if (v5 == -1) {
        double v6 = INFINITY;
      }
      else {
        double v6 = (double)v5 / 1000000000.0;
      }
      int v16 = 134218242;
      double v17 = v6;
      __int16 v18 = 2112;
      *(void *)v19 = v3;
      v11 = "%13.5f: IPC error %@";
      unint64_t v12 = v4;
      uint32_t v13 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    uint64_t v4 = _AALog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/ClientHelpers.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/Client/ClientHelpers.m"; ; ++i)
      {
        if (*(i - 1) == 47)
        {
          v7 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v9 = absTimeNS();
          if (v9 == -1) {
            double v10 = INFINITY;
          }
          else {
            double v10 = (double)v9 / 1000000000.0;
          }
          int v16 = 136315906;
          double v17 = *(double *)&v7;
          __int16 v18 = 1024;
          *(_DWORD *)v19 = 98;
          *(_WORD *)&v19[4] = 2048;
          *(double *)&v19[6] = v10;
          __int16 v20 = 2112;
          id v21 = v3;
          v11 = "%30s:%-4d: %13.5f: IPC error %@";
          unint64_t v12 = v4;
          uint32_t v13 = 38;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v3;
}

- (AWServiceManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)AWServiceManager;
  v2 = [(AWServiceManager *)&v14 init];
  if (v2)
  {
    if (schedulerQueue_onceToken != -1) {
      dispatch_once(&schedulerQueue_onceToken, &__block_literal_global_77);
    }
    objc_storeStrong((id *)&v2->_queue, (id)schedulerQueue_queue);
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    serviceObservers = v2->_serviceObservers;
    v2->_serviceObservers = (NSMutableSet *)v3;

    unint64_t v5 = v2;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.AttentionAwareness" options:0];
    id v7 = v5[2];
    v5[2] = (id)v6;

    id v8 = xpcInterfaceForScheduler();
    [v5[2] setRemoteObjectInterface:v8];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __24__AWServiceManager_init__block_invoke;
    v12[3] = &unk_1E606AC70;
    uint32_t v13 = v5;
    id v9 = v5[2];
    double v10 = v5;
    [v9 setInterruptionHandler:v12];
    [v5[2] resume];
  }
  return v2;
}

void __24__AWServiceManager_init__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = v1[1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__AWServiceManager_init__block_invoke_2;
  block[3] = &unk_1E606AC70;
  uint64_t v4 = v1;
  dispatch_async(v2, block);
}

void __24__AWServiceManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v1 = *(id *)(*(void *)(a1 + 32) + 24);
  if (currentLogLevel >= 3)
  {
    v2 = _AALog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = absTimeNS();
      if (v8 == -1) {
        double v9 = INFINITY;
      }
      else {
        double v9 = (double)v8 / 1000000000.0;
      }
      *(_DWORD *)buf = 134218240;
      double v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = [v1 count];
      _os_log_error_impl(&dword_1B3B4B000, v2, OS_LOG_TYPE_ERROR, "%13.5f: XPC interruption: notifying %lu observers", buf, 0x16u);
    }
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "serviceInterrupted", (void)v10);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

+ (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedManager];
  [v5 removeObserver:v4];
}

+ (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedManager];
  [v5 addObserver:v4];
}

+ (id)invokeWithService:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedManager];
  uint64_t v6 = [v5 invokeWithService:v4];

  return v6;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_1158 != -1) {
    dispatch_once(&sharedManager_onceToken_1158, &__block_literal_global_1159);
  }
  v2 = (void *)sharedManager_manager_1160;

  return v2;
}

uint64_t __33__AWServiceManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(AWServiceManager);
  uint64_t v1 = sharedManager_manager_1160;
  sharedManager_manager_1160 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end