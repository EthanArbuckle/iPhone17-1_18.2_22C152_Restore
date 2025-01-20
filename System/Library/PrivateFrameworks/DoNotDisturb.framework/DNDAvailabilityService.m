@interface DNDAvailabilityService
+ (id)serviceForClientIdentifier:(id)a3;
- (BOOL)isLocalUserAvailableReturningError:(id *)a3;
- (id)_initWithClientIdentifier:(id)a3;
@end

@implementation DNDAvailabilityService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_2 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_2, &__block_literal_global_5);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__DNDAvailabilityService_serviceForClientIdentifier___block_invoke_2;
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

uint64_t __53__DNDAvailabilityService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDAvailabilityService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_2;
  serviceForClientIdentifier__lockQueue_2 = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  uint64_t v4 = serviceForClientIdentifier__serviceByClientIdentifier_2;
  serviceForClientIdentifier__serviceByClientIdentifier_2 = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

void __53__DNDAvailabilityService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_2;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (BOOL)isLocalUserAvailableReturningError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDAvailabilityService.getIsLocalUserAvailable", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy__2;
  v16[3] = __Block_byref_object_dispose__2;
  id v17 = 0;
  id v7 = +[DNDRemoteAvailabilityServiceConnection sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__DNDAvailabilityService_isLocalUserAvailableReturningError___block_invoke;
  v14[3] = &unk_1E5910F40;
  v14[4] = &v18;
  v14[5] = &v15;
  [v7 getIsLocalUserAvailableWithRequestDetails:v6 completionHandler:v14];

  v8 = DNDLogModeConfiguration;
  if (*(void *)(v16[0] + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDLogModeConfiguration, OS_LOG_TYPE_ERROR)) {
      [(DNDAvailabilityService *)(uint64_t)v6 isLocalUserAvailableReturningError:v8];
    }
  }
  else
  {
    uint64_t v9 = (id)DNDLogModeConfiguration;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [NSNumber numberWithBool:*((unsigned __int8 *)v19 + 24)];
      *(_DWORD *)buf = 138543618;
      v24 = v6;
      __int16 v25 = 2114;
      v26 = v10;
      _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Get user availability, availability=%{public}@", buf, 0x16u);
    }
  }
  if (a3)
  {
    v11 = *(void **)(v16[0] + 40);
    if (v11) {
      *a3 = v11;
    }
  }
  BOOL v12 = *((unsigned char *)v19 + 24) != 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v18, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __61__DNDAvailabilityService_isLocalUserAvailableReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDAvailabilityService;
  id v5 = [(DNDAvailabilityService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

- (void)isLocalUserAvailableReturningError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_19CC2C000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Error when getting user availability in current mode for contact, error='%{public}@'", (uint8_t *)&v4, 0x16u);
}

@end