@interface DNDModeSelectionService
+ (id)serviceForClientIdentifier:(id)a3;
- (BOOL)_queue_registerForUpdatesIfRequired;
- (BOOL)activateModeWithDetails:(id)a3 error:(id *)a4;
- (BOOL)invalidateModeAssertionWithUUID:(id)a3 error:(id *)a4;
- (BOOL)promotePlaceholderWithModeIdentifier:(id)a3 error:(id *)a4;
- (NSString)clientIdentifier;
- (id)_initWithClientIdentifier:(id)a3;
- (id)activeModeAssertionWithError:(id *)a3;
- (id)allModesWithError:(id *)a3;
- (id)availableModesWithError:(id *)a3;
- (id)modeConfigurationForModeIdentifier:(id)a3 error:(id *)a4;
- (id)promotedPlaceholderWithModeIdentifier:(id)a3 error:(id *)a4;
- (void)_queue_registerForUpdatesIfRequired;
- (void)addListener:(id)a3 withCompletionHandler:(id)a4;
- (void)remoteService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5;
- (void)remoteService:(id)a3 didReceiveUpdatedAvailableModes:(id)a4;
- (void)remoteService:(id)a3 didReceiveUpdatedModes:(id)a4;
- (void)removeListener:(id)a3;
@end

@implementation DNDModeSelectionService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_8 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_8, &__block_literal_global_13);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  id v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__DNDModeSelectionService_serviceForClientIdentifier___block_invoke_2;
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

uint64_t __54__DNDModeSelectionService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDModeSelectionService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_7;
  serviceForClientIdentifier__lockQueue_7 = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  uint64_t v4 = serviceForClientIdentifier__serviceByClientIdentifier_8;
  serviceForClientIdentifier__serviceByClientIdentifier_8 = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

void __54__DNDModeSelectionService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_8 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_8;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)DNDModeSelectionService;
  uint64_t v5 = [(DNDModeSelectionService *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.donotdisturb.DNDModeSelectionService", v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.donotdisturb.DNDModeSelectionService.call-out", v11);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v14;

    uint64_t v16 = +[DNDModeConfigurationService serviceForClientIdentifier:v4];
    modeConfigurationService = v5->_modeConfigurationService;
    v5->_modeConfigurationService = (DNDModeConfigurationService *)v16;

    id v18 = +[DNDRemoteServiceConnection sharedInstance];
    [v18 addEventListener:v5];
  }
  return v5;
}

- (BOOL)activateModeWithDetails:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeSelectionService.activateModeWithIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  id v29 = 0;
  dispatch_queue_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__DNDModeSelectionService_activateModeWithDetails_error___block_invoke;
  v20[3] = &unk_1E5911970;
  uint64_t v10 = v7;
  v21 = v10;
  v22 = &v30;
  v23 = &v24;
  [v9 activateModeWithDetails:v6 withRequestDetails:v8 completionHandler:v20];

  int v11 = *((unsigned __int8 *)v31 + 24);
  dispatch_queue_t v12 = (id)DNDLogModeSelection;
  uint64_t v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v6 modeIdentifier];
      *(_DWORD *)buf = 138543618;
      v36 = v8;
      __int16 v37 = 2114;
      v38 = v14;
      _os_log_impl(&dword_19CC2C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Activate mode with identifier, modeIdentifier=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v18 = [v6 modeIdentifier];
    uint64_t v19 = v25[5];
    *(_DWORD *)buf = 138543874;
    v36 = v8;
    __int16 v37 = 2114;
    v38 = v18;
    __int16 v39 = 2114;
    uint64_t v40 = v19;
    _os_log_error_impl(&dword_19CC2C000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Error when setting mode with identifier, modeIdentifier=%{public}@ error='%{public}@'", buf, 0x20u);
  }
  if (a4)
  {
    uint64_t v15 = (void *)v25[5];
    if (v15) {
      *a4 = v15;
    }
  }
  BOOL v16 = *((unsigned char *)v31 + 24) != 0;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  os_activity_scope_leave(&state);
  return v16;
}

void __57__DNDModeSelectionService_activateModeWithDetails_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v9);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 BOOLValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  os_activity_scope_leave(&v9);
}

- (BOOL)invalidateModeAssertionWithUUID:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeSelectionService.invalidateModeAssertionWithUUID", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8;
  uint64_t v24 = __Block_byref_object_dispose__8;
  id v25 = 0;
  os_activity_scope_state_s v9 = +[DNDRemoteServiceConnection sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__DNDModeSelectionService_invalidateModeAssertionWithUUID_error___block_invoke;
  v16[3] = &unk_1E5911970;
  uint64_t v10 = v7;
  v17 = v10;
  id v18 = &v26;
  uint64_t v19 = &v20;
  [v9 invalidateModeAssertionWithUUID:v6 withRequestDetails:v8 completionHandler:v16];

  int v11 = DNDLogModeSelection;
  if (*((unsigned char *)v27 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v8;
      __int16 v33 = 2114;
      id v34 = v6;
      _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidate mode assertion with UUID, assertionUUID=%{public}@", buf, 0x16u);
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
LABEL_6:
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (!os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_ERROR)) {
    goto LABEL_6;
  }
  uint64_t v15 = v21[5];
  *(_DWORD *)buf = 138543874;
  uint64_t v32 = v8;
  __int16 v33 = 2114;
  id v34 = v6;
  __int16 v35 = 2114;
  uint64_t v36 = v15;
  _os_log_error_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Error when invalidating mode assertion with UUID, assertionUUID=%{public}@ error='%{public}@'", buf, 0x20u);
  if (!a4) {
    goto LABEL_9;
  }
LABEL_7:
  dispatch_queue_t v12 = (void *)v21[5];
  if (v12) {
    *a4 = v12;
  }
LABEL_9:
  BOOL v13 = *((unsigned char *)v27 + 24) != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  os_activity_scope_leave(&state);
  return v13;
}

void __65__DNDModeSelectionService_invalidateModeAssertionWithUUID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v9);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 BOOLValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  os_activity_scope_leave(&v9);
}

- (id)activeModeAssertionWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeSelectionService.activeModeAssertion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v7 = DNDLogModeSelection;
  if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting active mode assertion; not restricted by client identifier",
      (uint8_t *)&buf,
      0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  uint64_t v28 = __Block_byref_object_dispose__8;
  id v29 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  id v18 = __Block_byref_object_dispose__8;
  id v19 = 0;
  v8 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__DNDModeSelectionService_activeModeAssertionWithError___block_invoke;
  v13[3] = &unk_1E5911880;
  v13[4] = &buf;
  v13[5] = &v14;
  [v8 activeModeAssertionWithRequestDetails:v6 completionHandler:v13];

  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_ERROR)) {
      -[DNDModeSelectionService activeModeAssertionWithError:]();
    }
    if (a3) {
      *a3 = (id) v15[5];
    }
  }
  os_activity_scope_state_s v9 = DNDLogModeSelection;
  if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v21 = 138543618;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    uint64_t v24 = v10;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got mode assertion, assertion=%{public}@", v21, 0x16u);
  }
  os_activity_scope_leave(&state);
  id v11 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&buf, 8);
  return v11;
}

void __56__DNDModeSelectionService_activeModeAssertionWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)allModesWithError:(id *)a3
{
  return [(DNDModeConfigurationService *)self->_modeConfigurationService allModesReturningError:a3];
}

- (id)availableModesWithError:(id *)a3
{
  return [(DNDModeConfigurationService *)self->_modeConfigurationService availableModesReturningError:a3];
}

- (id)modeConfigurationForModeIdentifier:(id)a3 error:(id *)a4
{
  return [(DNDModeConfigurationService *)self->_modeConfigurationService modeConfigurationForModeIdentifier:a3 error:a4];
}

- (BOOL)promotePlaceholderWithModeIdentifier:(id)a3 error:(id *)a4
{
  id v4 = [(DNDModeConfigurationService *)self->_modeConfigurationService createModeConfigurationUsingTemplateForModeIdentifier:a3 error:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)promotedPlaceholderWithModeIdentifier:(id)a3 error:(id *)a4
{
  return [(DNDModeConfigurationService *)self->_modeConfigurationService createModeConfigurationUsingTemplateForModeIdentifier:a3 error:a4];
}

- (void)addListener:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeSelectionService.addListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = DNDLogModeSelection;
  if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "Adding update listener: listener=%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__DNDModeSelectionService_addListener_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E59119C0;
  uint64_t v15 = v8;
  id v11 = v8;
  objc_copyWeak(&v18, (id *)buf);
  id v16 = v6;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_async(queue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

void __61__DNDModeSelectionService_addListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)(a1 + 40);
    [WeakRetained[4] addObject:*(void *)(a1 + 40)];
    int v5 = objc_msgSend(v3, "_queue_registerForUpdatesIfRequired");
    id v6 = DNDLogModeSelection;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *v4;
        *(_DWORD *)long long buf = 138543362;
        uint64_t v15 = v7;
        _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "Registered for updates: listener=%{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_ERROR)) {
        __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 40), v6);
      }
      [v3[4] removeObject:*v4];
    }
    if (*(void *)(a1 + 48))
    {
      v8 = v3[3];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__DNDModeSelectionService_addListener_withCompletionHandler___block_invoke_11;
      block[3] = &unk_1E5911998;
      id v10 = *(id *)(a1 + 32);
      id v11 = *(id *)(a1 + 48);
      char v12 = v5;
      dispatch_async(v8, block);
    }
  }

  os_activity_scope_leave(&state);
}

void __61__DNDModeSelectionService_addListener_withCompletionHandler___block_invoke_11(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v2);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  os_activity_scope_leave(&v2);
}

- (void)removeListener:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeSelectionService.removeListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = DNDLogModeSelection;
  if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v16 = v4;
    _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "Removing update listener: listener=%{public}@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__DNDModeSelectionService_removeListener___block_invoke;
  block[3] = &unk_1E59119E8;
  id v11 = v5;
  v8 = v5;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = v4;
  id v9 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

void __42__DNDModeSelectionService_removeListener___block_invoke(uint64_t a1)
{
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v4);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[4] removeObject:*(void *)(a1 + 40)];
  }

  os_activity_scope_leave(&v4);
}

- (void)remoteService:(id)a3 didReceiveUpdatedActiveModeAssertion:(id)a4 stateUpdate:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__DNDModeSelectionService_remoteService_didReceiveUpdatedActiveModeAssertion_stateUpdate___block_invoke;
  block[3] = &unk_1E59110A8;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __90__DNDModeSelectionService_remoteService_didReceiveUpdatedActiveModeAssertion_stateUpdate___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = *(NSObject **)(v8 + 24);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __90__DNDModeSelectionService_remoteService_didReceiveUpdatedActiveModeAssertion_stateUpdate___block_invoke_2;
        v10[3] = &unk_1E5911A10;
        v10[4] = v7;
        v10[5] = v8;
        id v11 = *(id *)(a1 + 40);
        id v12 = *(id *)(a1 + 48);
        dispatch_async(v9, v10);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t __90__DNDModeSelectionService_remoteService_didReceiveUpdatedActiveModeAssertion_stateUpdate___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 modeSelectionService:v4 didReceiveUpdatedActiveModeAssertion:v5 stateUpdate:v6];
  }
  return result;
}

- (void)remoteService:(id)a3 didReceiveUpdatedModes:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__DNDModeSelectionService_remoteService_didReceiveUpdatedModes___block_invoke;
  v8[3] = &unk_1E5911080;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __64__DNDModeSelectionService_remoteService_didReceiveUpdatedModes___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = *(NSObject **)(v8 + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__DNDModeSelectionService_remoteService_didReceiveUpdatedModes___block_invoke_2;
        block[3] = &unk_1E59110A8;
        void block[4] = v7;
        void block[5] = v8;
        id v11 = *(id *)(a1 + 40);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __64__DNDModeSelectionService_remoteService_didReceiveUpdatedModes___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 modeSelectionService:v4 didReceiveModesUpdate:v5];
  }
  return result;
}

- (void)remoteService:(id)a3 didReceiveUpdatedAvailableModes:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__DNDModeSelectionService_remoteService_didReceiveUpdatedAvailableModes___block_invoke;
  v8[3] = &unk_1E5911080;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __73__DNDModeSelectionService_remoteService_didReceiveUpdatedAvailableModes___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = *(NSObject **)(v8 + 24);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __73__DNDModeSelectionService_remoteService_didReceiveUpdatedAvailableModes___block_invoke_2;
        block[3] = &unk_1E59110A8;
        void block[4] = v7;
        void block[5] = v8;
        id v11 = *(id *)(a1 + 40);
        dispatch_async(v9, block);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

uint64_t __73__DNDModeSelectionService_remoteService_didReceiveUpdatedAvailableModes___block_invoke_2(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 modeSelectionService:v4 didReceiveAvailableModesUpdate:v5];
  }
  return result;
}

- (BOOL)_queue_registerForUpdatesIfRequired
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSHashTable *)self->_listeners count] && !self->_registeredForUpdates)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    uint64_t v3 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeSelectionService.registerForUpdates", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &state);
    uint64_t v4 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
    uint64_t v5 = DNDLogModeSelection;
    if (os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering update listener", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    long long v16 = __Block_byref_object_copy__8;
    uint64_t v17 = __Block_byref_object_dispose__8;
    id v18 = 0;
    uint64_t v6 = +[DNDRemoteServiceConnection sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__DNDModeSelectionService__queue_registerForUpdatesIfRequired__block_invoke;
    v8[3] = &unk_1E59115C0;
    v8[4] = &v9;
    void v8[5] = &buf;
    [v6 registerForModeSelectionUpdatesWithRequestDetails:v4 completionHandler:v8];

    if (*(void *)(*((void *)&buf + 1) + 40)
      && os_log_type_enabled((os_log_t)DNDLogModeSelection, OS_LOG_TYPE_ERROR))
    {
      -[DNDModeSelectionService _queue_registerForUpdatesIfRequired]();
    }
    os_activity_scope_leave(&state);
    self->_registeredForUpdates = *((unsigned char *)v10 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v9, 8);
  }
  return ![(NSHashTable *)self->_listeners count] || self->_registeredForUpdates;
}

void __62__DNDModeSelectionService__queue_registerForUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConfigurationService, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)activeModeAssertionWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when requesting active mode assertion, error='%{public}@'");
}

- (void)_queue_registerForUpdatesIfRequired
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when registering mode selection update listener, error='%{public}@'");
}

@end