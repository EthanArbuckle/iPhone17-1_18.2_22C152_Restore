@interface DNDAppConfigurationService
+ (id)serviceForClientIdentifier:(id)a3;
- (id)_initWithClientIdentifier:(id)a3;
- (void)getCurrentAppConfigurationForActionIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)invalidateAppContextForActionIdentifier:(id)a3;
@end

@implementation DNDAppConfigurationService

uint64_t __57__DNDAppConfigurationService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDAppConfigurationService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_1;
  serviceForClientIdentifier__lockQueue_1 = (uint64_t)v1;

  serviceForClientIdentifier__serviceByClientIdentifier_1 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  return MEMORY[0x1F41817F8]();
}

- (void)getCurrentAppConfigurationForActionIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDAppConfigurationService.getCurrentAppConfigurationForActionIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  v9 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  v10 = DNDLogAppConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting current app configuration for action identifier %@", buf, 0x16u);
  }
  v11 = +[DNDRemoteAppConfigurationServiceConnection sharedInstance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__DNDAppConfigurationService_getCurrentAppConfigurationForActionIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5911390;
  id v16 = v9;
  id v17 = v6;
  id v18 = v7;
  id v12 = v7;
  id v13 = v6;
  id v14 = v9;
  [v11 getCurrentAppConfigurationForActionIdentifier:v13 withRequestDetails:v14 completionHandler:v15];

  os_activity_scope_leave(&state);
}

void __57__DNDAppConfigurationService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_1 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_1;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDAppConfigurationService;
  uint64_t v5 = [(DNDAppConfigurationService *)&v9 init];
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

void __98__DNDAppConfigurationService_getCurrentAppConfigurationForActionIdentifier_withCompletionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    uint64_t v10 = DNDLogAppConfiguration;
    if (!os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v12 = a1[4];
    uint64_t v13 = a1[5];
    int v20 = 138543618;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    id v14 = "[%{public}@] Got current app configuration for action identifier %@";
    v15 = v10;
    uint32_t v16 = 22;
LABEL_9:
    _os_log_impl(&dword_19CC2C000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, v16);
    goto LABEL_12;
  }
  v8 = [v6 domain];
  objc_super v9 = v8;
  if (v8 != @"DNDErrorDomain")
  {

    goto LABEL_10;
  }
  uint64_t v17 = [v7 code];

  if (v17 == 1007)
  {
    uint64_t v18 = DNDLogAppConfiguration;
    if (!os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    uint64_t v19 = a1[4];
    int v20 = 138543362;
    uint64_t v21 = v19;
    id v14 = "[%{public}@] No current app configuration action.";
    v15 = v18;
    uint32_t v16 = 12;
    goto LABEL_9;
  }
LABEL_10:
  if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR)) {
    __98__DNDAppConfigurationService_getCurrentAppConfigurationForActionIdentifier_withCompletionHandler___block_invoke_cold_1();
  }
LABEL_12:
  (*(void (**)(void, id, void *, uint64_t))(a1[6] + 16))(a1[6], v5, v7, v11);
}

void __98__DNDAppConfigurationService_getCurrentAppConfigurationForActionIdentifier_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting current app configuration for action identifier %@, error='%{public}@'");
}

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_1 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_1, &__block_literal_global_3);
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint32_t v16 = __Block_byref_object_copy__1;
  uint64_t v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  id v5 = serviceForClientIdentifier__lockQueue_1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__DNDAppConfigurationService_serviceForClientIdentifier___block_invoke_2;
  block[3] = &unk_1E5910F18;
  id v10 = v4;
  uint64_t v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)invalidateAppContextForActionIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDAppConfigurationService.invalidateAppContextForActionIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  id v7 = DNDLogAppConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint32_t v16 = v6;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating app context for action identifier %@", buf, 0x16u);
  }
  v8 = +[DNDRemoteAppConfigurationServiceConnection sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__DNDAppConfigurationService_invalidateAppContextForActionIdentifier___block_invoke;
  v11[3] = &unk_1E59113B8;
  id v12 = v6;
  id v13 = v4;
  id v9 = v4;
  id v10 = v6;
  [v8 invalidateAppContextForActionIdentifier:v9 withRequestDetails:v10 completionHandler:v11];

  os_activity_scope_leave(&state);
}

void __70__DNDAppConfigurationService_invalidateAppContextForActionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [a2 BOOLValue];
  id v7 = DNDLogAppConfiguration;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidated app context for actionIdentifier %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogAppConfiguration, OS_LOG_TYPE_ERROR))
  {
    __70__DNDAppConfigurationService_invalidateAppContextForActionIdentifier___block_invoke_cold_1();
  }
}

void __70__DNDAppConfigurationService_invalidateAppContextForActionIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting invalidating app context for actionIdentifier %@, error='%{public}@'");
}

@end