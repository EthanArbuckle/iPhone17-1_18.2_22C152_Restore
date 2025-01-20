@interface DNDMeDeviceService
+ (id)serviceForClientIdentifier:(id)a3;
- (BOOL)_queue_registerForStateUpdatesIfRequired;
- (NSString)clientIdentifier;
- (id)_initWithClientIdentifier:(id)a3;
- (void)_queue_registerForStateUpdatesIfRequired;
- (void)addListener:(id)a3 withCompletionHandler:(id)a4;
- (void)queryCurrentStateWithCompletionHandler:(id)a3;
- (void)remoteService:(id)a3 didReceiveUpdatedMeDeviceState:(id)a4;
- (void)removeListener:(id)a3;
@end

@implementation DNDMeDeviceService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_0 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_0, &__block_literal_global_0);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__DNDMeDeviceService_serviceForClientIdentifier___block_invoke_2;
  block[3] = &unk_1E5910F18;
  id v10 = v4;
  v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __49__DNDMeDeviceService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDMeDeviceService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_0;
  serviceForClientIdentifier__lockQueue_0 = (uint64_t)v1;

  serviceForClientIdentifier__serviceByClientIdentifier_0 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  return MEMORY[0x1F41817F8]();
}

void __49__DNDMeDeviceService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_0 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_0;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (void)queryCurrentStateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDMeDeviceService.queryCurrentState.async", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5911030;
  uint64_t v10 = v5;
  v11 = self;
  id v12 = v4;
  id v7 = v4;
  v8 = v5;
  dispatch_async(queue, block);

  os_activity_scope_leave(&state);
}

void __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  uint64_t v2 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:*(void *)(*(void *)(a1 + 40) + 40)];
  uint64_t v3 = DNDLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v2;
    _os_log_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Processing async 'Me Device' state request", buf, 0xCu);
  }
  id v4 = +[DNDRemoteServiceConnection sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_5;
  v8[3] = &unk_1E5911008;
  id v5 = v2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  [v4 queryMeDeviceStateWithRequestDetails:v5 completionHandler:v8];

  os_activity_scope_leave(&state);
}

void __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = DNDLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_ERROR)) {
      __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_5_cold_1(a1, (uint64_t)v6, v7);
    }
  }
  v8 = *(NSObject **)(*(void *)(a1 + 40) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_6;
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

void __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)DNDLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 40);
    id v5 = v2;
    id v6 = DNDMeDeviceStatusToString([v3 meDeviceStatus]);
    id v7 = [*(id *)(a1 + 40) meDeviceName];
    int v9 = 138543874;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got current 'Me Device' state, meDeviceStatus=%{public}@, meDeviceName=%{public}@", (uint8_t *)&v9, 0x20u);
  }
  v8 = (DNDMeDeviceState *)*(id *)(a1 + 40);
  if (!v8) {
    v8 = [[DNDMeDeviceState alloc] initWithStatus:0 name:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)addListener:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDMeDeviceService.addListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5911030;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(queue, block);
}

void __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DNDLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v3;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "Adding 'Me Device' state update listener: listener=%{public}@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) addObject:*(void *)(a1 + 32)];
  int v4 = objc_msgSend(*(id *)(a1 + 40), "_queue_registerForStateUpdatesIfRequired");
  char v5 = v4;
  id v6 = DNDLogMeDeviceService;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v7;
      _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "Registered for 'Me Device' state updates: listener=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_ERROR)) {
      __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 32), v6);
    }
    [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(a1 + 32)];
  }
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    int v9 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke_9;
    v10[3] = &unk_1E5911058;
    id v11 = v8;
    char v12 = v5;
    dispatch_async(v9, v10);
  }
}

uint64_t __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  char v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDMeDeviceService.removeListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__DNDMeDeviceService_removeListener___block_invoke;
  v8[3] = &unk_1E5911080;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

uint64_t __37__DNDMeDeviceService_removeListener___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = DNDLogMeDeviceService;
  if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19CC2C000, v2, OS_LOG_TYPE_DEFAULT, "Removing 'Me Device' state update listener: listener=%{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(a1 + 32)];
}

- (void)remoteService:(id)a3 didReceiveUpdatedMeDeviceState:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__DNDMeDeviceService_remoteService_didReceiveUpdatedMeDeviceState___block_invoke;
  v8[3] = &unk_1E5911080;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __67__DNDMeDeviceService_remoteService_didReceiveUpdatedMeDeviceState___block_invoke(uint64_t a1)
{
  uint64_t v2 = (DNDMeDeviceState *)*(id *)(a1 + 32);
  if (!v2) {
    uint64_t v2 = [[DNDMeDeviceState alloc] initWithStatus:0 name:0];
  }
  uint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 40) + 24) copy];
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__DNDMeDeviceService_remoteService_didReceiveUpdatedMeDeviceState___block_invoke_2;
  block[3] = &unk_1E59110A8;
  id v9 = v3;
  uint64_t v10 = v4;
  id v11 = v2;
  uint64_t v6 = v2;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __67__DNDMeDeviceService_remoteService_didReceiveUpdatedMeDeviceState___block_invoke_2(uint64_t a1)
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
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "meDeviceService:didReceiveMeDeviceState:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DNDMeDeviceService;
  uint64_t v5 = [(DNDMeDeviceService *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    long long v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.donotdisturb.DNDMeDeviceService", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.donotdisturb.DNDMeDeviceService.call-out", v11);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v14;

    id v16 = +[DNDRemoteServiceConnection sharedInstance];
    [v16 addEventListener:v5];
  }
  return v5;
}

- (BOOL)_queue_registerForStateUpdatesIfRequired
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSHashTable *)self->_listeners count] && !self->_registeredForUpdates)
  {
    uint64_t v3 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDMeDeviceService.registerForUpdates", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    id v4 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
    uint64_t v5 = DNDLogMeDeviceService;
    if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering 'Me Device' state update listener", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    objc_super v18 = __Block_byref_object_dispose__0;
    id v19 = 0;
    uint64_t v6 = +[DNDRemoteServiceConnection sharedInstance];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__DNDMeDeviceService__queue_registerForStateUpdatesIfRequired__block_invoke;
    v9[3] = &unk_1E59110D0;
    v9[4] = &v10;
    v9[5] = &buf;
    [v6 registerForMeDeviceStateUpdatesWithRequestDetails:v4 completionHandler:v9];

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      long long v7 = DNDLogMeDeviceService;
      if (os_log_type_enabled((os_log_t)DNDLogMeDeviceService, OS_LOG_TYPE_ERROR)) {
        [(DNDMeDeviceService *)(uint64_t)v4 _queue_registerForStateUpdatesIfRequired];
      }
    }
    self->_registeredForUpdates = *((unsigned char *)v11 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v10, 8);
    os_activity_scope_leave(&state);
  }
  return ![(NSHashTable *)self->_listeners count] || self->_registeredForUpdates;
}

void __62__DNDMeDeviceService__queue_registerForStateUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __61__DNDMeDeviceService_queryCurrentStateWithCompletionHandler___block_invoke_5_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_19CC2C000, a2, a3, "[%{public}@] Error when getting 'Me Device' state, error='%{public}@'", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __56__DNDMeDeviceService_addListener_withCompletionHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_19CC2C000, a2, OS_LOG_TYPE_ERROR, "Did not register for 'Me Device' state updates, will remove listener: listener=%{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)_queue_registerForStateUpdatesIfRequired
{
  *(_DWORD *)int v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *(void *)(*(void *)a2 + 40);
  OUTLINED_FUNCTION_0(&dword_19CC2C000, a2, a3, "[%{public}@] Error when registering 'Me Device' state update listener, error='%{public}@'", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end