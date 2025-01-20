@interface DNDModeAssertionService
+ (id)serviceForClientIdentifier:(id)a3;
- (BOOL)addAssertionUpdateListener:(id)a3 error:(id *)a4;
- (BOOL)invalidateAllActiveModeAssertionsWithError:(id *)a3;
- (BOOL)removeAssertionUpdateListener:(id)a3 error:(id *)a4;
- (NSString)clientIdentifier;
- (id)_initWithClientIdentifier:(id)a3;
- (id)activeModeAssertionWithError:(id *)a3;
- (id)allModeAssertionsWithError:(id *)a3;
- (id)invalidateActiveModeAssertionWithError:(id *)a3;
- (id)invalidateActiveModeAssertionWithInvalidationDetails:(id)a3 reasonOverride:(unint64_t)a4 error:(id *)a5;
- (id)latestModeAssertionInvalidationWithError:(id *)a3;
- (id)takeModeAssertionWithDetails:(id)a3 error:(id *)a4;
- (void)_handleChangeActiveModeAssertion:(id)a3 invalidation:(id)a4;
- (void)_registerForAssertionUpdatesIfRequiredWithCompletionHandler:(id)a3;
- (void)addAssertionUpdateListener:(id)a3 withCompletionHandler:(id)a4;
- (void)remoteService:(id)a3 didChangeActiveModeAssertion:(id)a4 invalidation:(id)a5;
- (void)removeAssertionUpdateListener:(id)a3;
@end

@implementation DNDModeAssertionService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_7 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_7, &__block_literal_global_12);
  }
  id v5 = (id)serviceForClientIdentifier__serviceByClientIdentifier_7;
  objc_sync_enter(v5);
  v6 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_7 objectForKey:v4];
  if (!v6)
  {
    v6 = (void *)[objc_alloc((Class)a1) _initWithClientIdentifier:v4];
    [(id)serviceForClientIdentifier__serviceByClientIdentifier_7 setObject:v6 forKey:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

uint64_t __54__DNDModeAssertionService_serviceForClientIdentifier___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  uint64_t v1 = serviceForClientIdentifier__serviceByClientIdentifier_7;
  serviceForClientIdentifier__serviceByClientIdentifier_7 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DNDModeAssertionService;
  id v5 = [(DNDModeAssertionService *)&v15 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.donotdisturb.ModeAssertionService.call-out", v6);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    assertionUpdateListeners = v5->_assertionUpdateListeners;
    v5->_assertionUpdateListeners = (NSHashTable *)v11;

    v5->_activeAssertionLock._os_unfair_lock_opaque = 0;
    v13 = +[DNDRemoteServiceConnection sharedInstance];
    [v13 addEventListener:v5];
  }
  return v5;
}

- (id)takeModeAssertionWithDetails:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  dispatch_queue_t v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeAssertionService.takeModeAssertion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Taking mode assertion; details=%{public}@",
      buf,
      0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v28 = __Block_byref_object_copy__7;
  v29 = __Block_byref_object_dispose__7;
  id v30 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  v10 = +[DNDRemoteServiceConnection sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__DNDModeAssertionService_takeModeAssertionWithDetails_error___block_invoke;
  v15[3] = &unk_1E5911880;
  v15[4] = buf;
  v15[5] = &v16;
  [v10 takeModeAssertionWithDetails:v6 requestDetails:v8 completionHandler:v15];

  if (v17[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR)) {
      -[DNDModeAssertionService takeModeAssertionWithDetails:error:]();
    }
    if (a4) {
      *a4 = (id) v17[5];
    }
  }
  uint64_t v11 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v23 = 138543618;
    v24 = v8;
    __int16 v25 = 2114;
    uint64_t v26 = v12;
    _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Took mode assertion, assertion=%{public}@", v23, 0x16u);
  }
  os_activity_scope_leave(&state);
  id v13 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(buf, 8);
  return v13;
}

void __62__DNDModeAssertionService_takeModeAssertionWithDetails_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)invalidateActiveModeAssertionWithError:(id *)a3
{
  return [(DNDModeAssertionService *)self invalidateActiveModeAssertionWithInvalidationDetails:0 reasonOverride:0 error:a3];
}

- (id)invalidateActiveModeAssertionWithInvalidationDetails:(id)a3 reasonOverride:(unint64_t)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v9 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeAssertionService.invalidateActiveModeAssertion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, &state);
  v10 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  id v11 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating active mode assertion", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__7;
  v33 = __Block_byref_object_dispose__7;
  id v34 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  id v24 = 0;
  uint64_t v12 = +[DNDRemoteServiceConnection sharedInstance];
  id v13 = [NSNumber numberWithUnsignedInteger:a4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__DNDModeAssertionService_invalidateActiveModeAssertionWithInvalidationDetails_reasonOverride_error___block_invoke;
  v18[3] = &unk_1E59118A8;
  v18[4] = &buf;
  v18[5] = &v19;
  [v12 invalidateActiveModeAssertionWithDetails:v8 reasonOverride:v13 requestDetails:v10 completionHandler:v18];

  if (v20[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR)) {
      -[DNDModeAssertionService invalidateActiveModeAssertionWithInvalidationDetails:reasonOverride:error:]();
    }
    if (a5) {
      *a5 = (id) v20[5];
    }
  }
  v14 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)uint64_t v26 = 138543618;
    v27 = v10;
    __int16 v28 = 2114;
    uint64_t v29 = v15;
    _os_log_impl(&dword_19CC2C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated mode assertion, invalidation=%{public}@", v26, 0x16u);
  }
  os_activity_scope_leave(&state);
  id v16 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&buf, 8);
  return v16;
}

void __101__DNDModeAssertionService_invalidateActiveModeAssertionWithInvalidationDetails_reasonOverride_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)activeModeAssertionWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeAssertionService.activeModeAssertion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v7 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting active mode assertion", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  __int16 v28 = __Block_byref_object_dispose__7;
  id v29 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  uint64_t v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  id v8 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__DNDModeAssertionService_activeModeAssertionWithError___block_invoke;
  v13[3] = &unk_1E5911880;
  v13[4] = &buf;
  v13[5] = &v14;
  [v8 getActiveModeAssertionWithRequestDetails:v6 completionHandler:v13];

  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR)) {
      -[DNDModeAssertionService activeModeAssertionWithError:]();
    }
    if (a3) {
      *a3 = (id) v15[5];
    }
  }
  uint64_t v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)uint64_t v21 = 138543618;
    v22 = v6;
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

void __56__DNDModeAssertionService_activeModeAssertionWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)latestModeAssertionInvalidationWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeAssertionService.latestModeAssertionInvalidation", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v7 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting latest mode assertion invalidation", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  __int16 v28 = __Block_byref_object_dispose__7;
  id v29 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  uint64_t v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  id v8 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__DNDModeAssertionService_latestModeAssertionInvalidationWithError___block_invoke;
  v13[3] = &unk_1E59118A8;
  v13[4] = &buf;
  v13[5] = &v14;
  [v8 getLatestModeAssertionInvalidationWithRequestDetails:v6 completionHandler:v13];

  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR)) {
      -[DNDModeAssertionService latestModeAssertionInvalidationWithError:]();
    }
    if (a3) {
      *a3 = (id) v15[5];
    }
  }
  uint64_t v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)uint64_t v21 = 138543618;
    v22 = v6;
    __int16 v23 = 2114;
    uint64_t v24 = v10;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got invalidation, invalidation=%{public}@", v21, 0x16u);
  }
  os_activity_scope_leave(&state);
  id v11 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&buf, 8);
  return v11;
}

void __68__DNDModeAssertionService_latestModeAssertionInvalidationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (BOOL)invalidateAllActiveModeAssertionsWithError:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeAssertionService.invalidateAllActiveModeAssertions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v7 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating all active mode assertions", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  __int16 v25 = __Block_byref_object_copy__7;
  uint64_t v26 = __Block_byref_object_dispose__7;
  id v27 = 0;
  id v8 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__DNDModeAssertionService_invalidateAllActiveModeAssertionsWithError___block_invoke;
  v13[3] = &unk_1E5910F40;
  v13[4] = &v14;
  v13[5] = &buf;
  [v8 invalidateAllActiveModeAssertionsWithRequestDetails:v6 completionHandler:v13];

  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR)) {
      -[DNDModeAssertionService invalidateAllActiveModeAssertionsWithError:]();
    }
    if (a3) {
      *a3 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }
  uint64_t v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *((unsigned __int8 *)v15 + 24);
    *(_DWORD *)id v19 = 138543618;
    v20 = v6;
    __int16 v21 = 1024;
    int v22 = v10;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated all active mode assertions, success=%{BOOL}u", v19, 0x12u);
  }
  os_activity_scope_leave(&state);
  BOOL v11 = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __70__DNDModeAssertionService_invalidateAllActiveModeAssertionsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)allModeAssertionsWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeAssertionService.allModeAssertionsWithError", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v7 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting all active mode assertions", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__7;
  uint64_t v28 = __Block_byref_object_dispose__7;
  id v29 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__7;
  uint64_t v18 = __Block_byref_object_dispose__7;
  id v19 = 0;
  id v8 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__DNDModeAssertionService_allModeAssertionsWithError___block_invoke;
  v13[3] = &unk_1E59118D0;
  v13[4] = &buf;
  v13[5] = &v14;
  [v8 getAllModeAssertionsWithRequestDetails:v6 completionHandler:v13];

  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR)) {
      -[DNDModeAssertionService allModeAssertionsWithError:]();
    }
    if (a3) {
      *a3 = (id) v15[5];
    }
  }
  uint64_t v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = v15[5] == 0;
    *(_DWORD *)__int16 v21 = 138543618;
    int v22 = v6;
    __int16 v23 = 1024;
    BOOL v24 = v10;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requested all active mode assertions, success=%{BOOL}u", v21, 0x12u);
  }
  os_activity_scope_leave(&state);
  id v11 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&buf, 8);
  return v11;
}

void __54__DNDModeAssertionService_allModeAssertionsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)addAssertionUpdateListener:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v8 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeAssertionService.addAssertionUpdateListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)long long buf = 138543618;
    id v19 = clientIdentifier;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding assertion update listener: listener=%{public}@", buf, 0x16u);
  }
  id v11 = self->_assertionUpdateListeners;
  objc_sync_enter(v11);
  [(NSHashTable *)self->_assertionUpdateListeners addObject:v6];
  objc_sync_exit(v11);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E5911920;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [(DNDModeAssertionService *)self _registerForAssertionUpdatesIfRequiredWithCompletionHandler:v14];
  os_activity_scope_leave(&state);
}

void __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = DNDLogModeAssertion;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[5];
      uint64_t v8 = *(void *)(a1[4] + 16);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registered for assertion updates: listener=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_ERROR)) {
      __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v6);
    }
    id v9 = *(id *)(a1[4] + 24);
    objc_sync_enter(v9);
    [*(id *)(a1[4] + 24) removeObject:a1[5]];
    objc_sync_exit(v9);
  }
  BOOL v10 = (void *)a1[6];
  if (v10)
  {
    id v11 = *(NSObject **)(a1[4] + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke_10;
    block[3] = &unk_1E59118F8;
    id v14 = v10;
    char v15 = a2;
    id v13 = v5;
    dispatch_async(v11, block);
  }
}

uint64_t __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeAssertionUpdateListener:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeAssertionService.removeAssertionUpdateListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v9);
  id v6 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)long long buf = 138543618;
    id v11 = clientIdentifier;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing assertion update listener: listener=%{public}@", buf, 0x16u);
  }
  uint64_t v8 = self->_assertionUpdateListeners;
  objc_sync_enter(v8);
  -[NSHashTable removeObject:](self->_assertionUpdateListeners, "removeObject:", v4, v9.opaque[0], v9.opaque[1]);
  objc_sync_exit(v8);

  os_activity_scope_leave(&v9);
}

- (void)remoteService:(id)a3 didChangeActiveModeAssertion:(id)a4 invalidation:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = DNDLogModeAssertion;
  if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    int v13 = 138544130;
    uint64_t v14 = clientIdentifier;
    __int16 v15 = 2114;
    id v16 = v8;
    __int16 v17 = 2114;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remote service got assertion change: service=%{public}@, assertion=%{public}@, invalidation=%{public}@", (uint8_t *)&v13, 0x2Au);
  }
  [(DNDModeAssertionService *)self _handleChangeActiveModeAssertion:v9 invalidation:v10];
}

- (void)_handleChangeActiveModeAssertion:(id)a3 invalidation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_activeAssertionLock);
  objc_storeStrong((id *)&self->_activeAssertion, a3);
  os_unfair_lock_unlock(&self->_activeAssertionLock);
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__DNDModeAssertionService__handleChangeActiveModeAssertion_invalidation___block_invoke;
  block[3] = &unk_1E59110A8;
  void block[4] = self;
  id v13 = v8;
  id v14 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(calloutQueue, block);
}

void __73__DNDModeAssertionService__handleChangeActiveModeAssertion_invalidation___block_invoke(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1[4] + 24);
  objc_sync_enter(v2);
  v3 = [*(id *)(a1[4] + 24) allObjects];
  objc_sync_exit(v2);

  if (a1[5])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v4 = v3;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v30;
      *(void *)&long long v7 = 138543874;
      long long v23 = v7;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector())
          {
            id v11 = DNDLogModeAssertion;
            if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v12 = a1[5];
              uint64_t v13 = *(void *)(a1[4] + 16);
              *(_DWORD *)long long buf = v23;
              uint64_t v35 = v13;
              __int16 v36 = 2114;
              uint64_t v37 = v12;
              __int16 v38 = 2114;
              v39 = v10;
              _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will deliver assertion invalidation to listener: invalidation=%{public}@, listener=%{public}@", buf, 0x20u);
            }
            objc_msgSend(v10, "modeAssertionService:didReceiveModeAssertionInvalidation:", a1[4], a1[5], v23);
          }
          ++v9;
        }
        while (v6 != v9);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v40 count:16];
      }
      while (v6);
    }

    v3 = v4;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v3;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v15)
  {
    uint64_t v17 = *(void *)v26;
    *(void *)&long long v16 = 138543874;
    long long v24 = v16;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        __int16 v19 = *(void **)(*((void *)&v25 + 1) + 8 * v18);
        if (objc_opt_respondsToSelector())
        {
          id v20 = DNDLogModeAssertion;
          if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = *(void *)(a1[4] + 16);
            uint64_t v22 = a1[6];
            *(_DWORD *)long long buf = v24;
            uint64_t v35 = v21;
            __int16 v36 = 2114;
            uint64_t v37 = v22;
            __int16 v38 = 2114;
            v39 = v19;
            _os_log_impl(&dword_19CC2C000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will deliver assertion change to listener: assertion=%{public}@, listener=%{public}@", buf, 0x20u);
          }
          objc_msgSend(v19, "modeAssertionService:didUpdateActiveModeAssertion:", a1[4], a1[6], v24, (void)v25);
        }
        ++v18;
      }
      while (v15 != v18);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v15);
  }
}

- (void)_registerForAssertionUpdatesIfRequiredWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = self->_assertionUpdateListeners;
  objc_sync_enter(v5);
  NSUInteger v6 = [(NSHashTable *)self->_assertionUpdateListeners count];
  objc_sync_exit(v5);

  if (!v6 || (atomic_exchange(&self->_registeredForUpdates._Value, 1u) & 1) != 0)
  {
    v4[2](v4, 1, 0);
  }
  else
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    long long v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeAssertionService.registerForAssertionUpdates", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &state);
    uint64_t v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
    uint64_t v9 = DNDLogModeAssertion;
    if (os_log_type_enabled((os_log_t)DNDLogModeAssertion, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v15 = v8;
      _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering assertion update listener", buf, 0xCu);
    }
    id v10 = +[DNDRemoteServiceConnection sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__DNDModeAssertionService__registerForAssertionUpdatesIfRequiredWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E5911948;
    v11[4] = self;
    uint64_t v12 = v4;
    [v10 registerForAssertionUpdatesWithRequestDetails:v8 completionHandler:v11];

    os_activity_scope_leave(&state);
  }
}

void __87__DNDModeAssertionService__registerForAssertionUpdatesIfRequiredWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  int v6 = [v12 BOOLValue];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 48));
    uint64_t v8 = *(void *)(a1 + 32);
    if (!*(void *)(v8 + 40) && !*(unsigned char *)(v8 + 52))
    {
      uint64_t v9 = [(id)v8 activeModeAssertionWithError:0];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      *(unsigned char *)(*(void *)(a1 + 32) + 52) = 1;
      uint64_t v8 = *(void *)(a1 + 32);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 48));
  }
  else
  {
    atomic_store(0, (unsigned __int8 *)(v7 + 32));
  }
  (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [v12 BOOLValue], v5);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAssertion, 0);
  objc_storeStrong((id *)&self->_assertionUpdateListeners, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (BOOL)addAssertionUpdateListener:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)removeAssertionUpdateListener:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)takeModeAssertionWithDetails:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when taking mode assertion, error='%{public}@'");
}

- (void)invalidateActiveModeAssertionWithInvalidationDetails:reasonOverride:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when invalidating mode assertion, error='%{public}@'");
}

- (void)activeModeAssertionWithError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when requesting active mode assertion, error='%{public}@'");
}

- (void)latestModeAssertionInvalidationWithError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when requesting latest mode assertion invalidation, error='%{public}@'");
}

- (void)invalidateAllActiveModeAssertionsWithError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when invalidating all active mode assertions, error='%{public}@'");
}

- (void)allModeAssertionsWithError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when requesting all active mode assertions, error='%{public}@'");
}

void __76__DNDModeAssertionService_addAssertionUpdateListener_withCompletionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
  int v5 = 138543874;
  uint64_t v6 = v4;
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_19CC2C000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Did not register for assertion updates, will remove listener: listener=%{public}@, error=%{public}@", (uint8_t *)&v5, 0x20u);
}

@end