@interface DNDStateService
+ (id)serviceForClientIdentifier:(id)a3;
- (BOOL)_queue_registerForStateUpdatesIfRequired;
- (BOOL)addStateUpdateListener:(id)a3 error:(id *)a4;
- (BOOL)removeStateUpdateListener:(id)a3 error:(id *)a4;
- (NSString)clientIdentifier;
- (id)_initWithClientIdentifier:(id)a3;
- (id)queryCurrentStateWithError:(id *)a3;
- (void)_queue_registerForStateUpdatesIfRequired;
- (void)addStateUpdateListener:(id)a3 withCompletionHandler:(id)a4;
- (void)queryCurrentStateWithCompletionHandler:(id)a3;
- (void)remoteService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
- (void)removeStateUpdateListener:(id)a3;
@end

@implementation DNDStateService

uint64_t __46__DNDStateService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDStateService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_5;
  serviceForClientIdentifier__lockQueue_5 = (uint64_t)v1;

  serviceForClientIdentifier__serviceByClientIdentifier_5 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  return MEMORY[0x1F41817F8]();
}

void __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  v2 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:*(void *)(*(void *)(a1 + 40) + 24)];
  v3 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v2;
    _os_log_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing async state request", buf, 0xCu);
  }
  v4 = +[DNDRemoteServiceConnection sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_8;
  v8[3] = &unk_1E5911750;
  id v5 = v2;
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  [v4 queryStateWithRequestDetails:v5 completionHandler:v8];

  os_activity_scope_leave(&state);
}

void __46__DNDStateService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_5 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_5;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DNDStateService;
  uint64_t v5 = [(DNDStateService *)&v18 init];
  if (v5)
  {
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.donotdisturb.StateService", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.donotdisturb.StateService.call-out", v9);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    stateUpdateListeners = v5->_stateUpdateListeners;
    v5->_stateUpdateListeners = (NSHashTable *)v14;

    v16 = +[DNDRemoteServiceConnection sharedInstance];
    [v16 addEventListener:v5];
  }
  return v5;
}

void __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v3;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "Adding state update listener: listener=%{public}@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 32) addObject:*(void *)(a1 + 32)];
  int v4 = objc_msgSend(*(id *)(a1 + 40), "_queue_registerForStateUpdatesIfRequired");
  uint64_t v5 = DNDLogState;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v6;
      _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "Registered for state updates: listener=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_ERROR)) {
      __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), v5);
    }
    id v7 = *(id *)(*(void *)(a1 + 40) + 32);
    objc_sync_enter(v7);
    [*(id *)(*(void *)(a1 + 40) + 32) removeObject:*(void *)(a1 + 32)];
    objc_sync_exit(v7);
  }
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    uint64_t v9 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke_11;
    v10[3] = &unk_1E5911058;
    id v11 = v8;
    char v12 = v4;
    dispatch_async(v9, v10);
  }
}

- (BOOL)_queue_registerForStateUpdatesIfRequired
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSHashTable *)self->_stateUpdateListeners count] && !self->_registeredForUpdates)
  {
    uint64_t v3 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDStateService.registerForStateUpdates", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    int v4 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
    uint64_t v5 = DNDLogState;
    if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering state update listener", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v9 = 0;
    dispatch_queue_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__5;
    v17 = __Block_byref_object_dispose__5;
    id v18 = 0;
    uint64_t v6 = +[DNDRemoteServiceConnection sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__DNDStateService__queue_registerForStateUpdatesIfRequired__block_invoke;
    v8[3] = &unk_1E5910F40;
    void v8[4] = &v9;
    v8[5] = &buf;
    [v6 registerForStateUpdatesWithRequestDetails:v4 completionHandler:v8];

    if (*(void *)(*((void *)&buf + 1) + 40) && os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_ERROR)) {
      -[DNDStateService _queue_registerForStateUpdatesIfRequired]();
    }
    self->_registeredForUpdates = *((unsigned char *)v10 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);
  }
  return ![(NSHashTable *)self->_stateUpdateListeners count] || self->_registeredForUpdates;
}

void __59__DNDStateService__queue_registerForStateUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

uint64_t __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

uint64_t __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_9(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got current state, state=%{public}@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)queryCurrentStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDStateService.queryCurrentState.async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5911030;
  uint64_t v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  __int16 v8 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

- (void)addStateUpdateListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDStateService.addStateUpdateListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5911030;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

void __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = DNDLogState;
    if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_ERROR)) {
      __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_8_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  __int16 v8 = *(NSObject **)(*(void *)(a1 + 40) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_9;
  v12[3] = &unk_1E5910FE0;
  id v13 = *(id *)(a1 + 32);
  id v14 = v5;
  id v9 = *(id *)(a1 + 48);
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, v12);
}

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_5 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_5, &__block_literal_global_8);
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  id v18 = 0;
  id v5 = serviceForClientIdentifier__lockQueue_5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__DNDStateService_serviceForClientIdentifier___block_invoke_2;
  block[3] = &unk_1E5910F18;
  id v10 = v4;
  id v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)queryCurrentStateWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDStateService.queryCurrentState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  id v7 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing state request", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5;
  id v18 = __Block_byref_object_dispose__5;
  id v19 = 0;
  __int16 v8 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__DNDStateService_queryCurrentStateWithError___block_invoke;
  v13[3] = &unk_1E5911778;
  v13[4] = &buf;
  v13[5] = &v14;
  [v8 queryStateWithRequestDetails:v6 completionHandler:v13];

  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_ERROR)) {
      -[DNDStateService queryCurrentStateWithError:]();
    }
    if (a3) {
      *a3 = (id) v15[5];
    }
  }
  id v9 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v21 = 138543618;
    v22 = v6;
    __int16 v23 = 2114;
    uint64_t v24 = v10;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got current state, state=%{public}@", v21, 0x16u);
  }
  id v11 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&buf, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __46__DNDStateService_queryCurrentStateWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)removeStateUpdateListener:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDStateService.removeStateUpdateListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__DNDStateService_removeStateUpdateListener___block_invoke;
  v8[3] = &unk_1E5911080;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_sync(queue, v8);

  os_activity_scope_leave(&state);
}

uint64_t __45__DNDStateService_removeStateUpdateListener___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DNDLogState;
  if (os_log_type_enabled((os_log_t)DNDLogState, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "Removing state update listener: listener=%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 40) + 32) removeObject:*(void *)(a1 + 32)];
}

- (void)remoteService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__DNDStateService_remoteService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v8[3] = &unk_1E5911080;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __67__DNDStateService_remoteService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__DNDStateService_remoteService_didReceiveDoNotDisturbStateUpdate___block_invoke_2;
  block[3] = &unk_1E59110A8;
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v5 = v2;
  dispatch_async(v4, block);
}

void __67__DNDStateService_remoteService_didReceiveDoNotDisturbStateUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "stateService:didReceiveDoNotDisturbStateUpdate:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUpdateListeners, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (BOOL)addStateUpdateListener:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)removeStateUpdateListener:(id)a3 error:(id *)a4
{
  return 1;
}

void __58__DNDStateService_queryCurrentStateWithCompletionHandler___block_invoke_8_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19CC2C000, a2, a3, "[%{public}@] Error when getting state, error='%{public}@'", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)queryCurrentStateWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting state, error='%{public}@'");
}

void __64__DNDStateService_addStateUpdateListener_withCompletionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19CC2C000, a2, OS_LOG_TYPE_ERROR, "Did not register for state updates, will remove listener: listener=%{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_queue_registerForStateUpdatesIfRequired
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when registering state update listener, error='%{public}@'");
}

@end