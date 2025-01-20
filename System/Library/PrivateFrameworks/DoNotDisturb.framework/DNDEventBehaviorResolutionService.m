@interface DNDEventBehaviorResolutionService
+ (id)serviceForClientIdentifier:(id)a3;
- (id)_initWithClientIdentifier:(id)a3;
- (id)resolveBehaviorForEventDetails:(id)a3 error:(id *)a4;
@end

@implementation DNDEventBehaviorResolutionService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_4 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_4, &__block_literal_global_7);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__DNDEventBehaviorResolutionService_serviceForClientIdentifier___block_invoke_2;
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

uint64_t __64__DNDEventBehaviorResolutionService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDEventBehaviorResolutionService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_4;
  serviceForClientIdentifier__lockQueue_4 = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  uint64_t v4 = serviceForClientIdentifier__serviceByClientIdentifier_4;
  serviceForClientIdentifier__serviceByClientIdentifier_4 = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

void __64__DNDEventBehaviorResolutionService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_4 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_4;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDEventBehaviorResolutionService;
  uint64_t v5 = [(DNDEventBehaviorResolutionService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;
  }
  return v5;
}

- (id)resolveBehaviorForEventDetails:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDEventBehaviorResolutionService.resolveEvent", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  objc_super v9 = DNDLogBehaviorResolution;
  if (os_log_type_enabled((os_log_t)DNDLogBehaviorResolution, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resolving behavior for event, details=%@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v28 = __Block_byref_object_copy__4;
  v29 = __Block_byref_object_dispose__4;
  id v30 = 0;
  uint64_t v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x3032000000;
  v18[2] = __Block_byref_object_copy__4;
  v18[3] = __Block_byref_object_dispose__4;
  id v19 = 0;
  uint64_t v10 = +[DNDRemoteServiceConnection sharedInstance];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__DNDEventBehaviorResolutionService_resolveBehaviorForEventDetails_error___block_invoke;
  v16[3] = &unk_1E5911680;
  v16[4] = buf;
  v16[5] = &v17;
  [v10 resolveBehaviorForEventDetails:v6 requestDetails:v8 completionHandler:v16];

  if (*(void *)(v18[0] + 40))
  {
    v11 = DNDLogBehaviorResolution;
    if (os_log_type_enabled((os_log_t)DNDLogBehaviorResolution, OS_LOG_TYPE_ERROR)) {
      -[DNDEventBehaviorResolutionService resolveBehaviorForEventDetails:error:]((uint64_t)v8, (uint64_t)v18, v11);
    }
    if (a4) {
      *a4 = *(id *)(v18[0] + 40);
    }
  }
  id v12 = DNDLogBehaviorResolution;
  if (os_log_type_enabled((os_log_t)DNDLogBehaviorResolution, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v21 = 138543874;
    v22 = v8;
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    _os_log_impl(&dword_19CC2C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resolved event, details=%@ behavior=%@", v21, 0x20u);
  }
  os_activity_scope_leave(&state);
  id v14 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(buf, 8);
  return v14;
}

void __74__DNDEventBehaviorResolutionService_resolveBehaviorForEventDetails_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void).cxx_destruct
{
}

- (void)resolveBehaviorForEventDetails:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_19CC2C000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Error when resolving behavior, error='%{public}@'", (uint8_t *)&v4, 0x16u);
}

@end