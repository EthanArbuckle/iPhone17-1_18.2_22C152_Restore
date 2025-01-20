@interface DNDGlobalConfigurationService
+ (id)serviceForClientIdentifier:(id)a3;
- (BOOL)_queue_registerForUpdatesIfRequired;
- (BOOL)getPreventAutoReplyReturningError:(id *)a3;
- (BOOL)isAutoReplyPrevented;
- (BOOL)isCloudSyncActive;
- (BOOL)modesCanImpactAvailability;
- (BOOL)setCloudSyncPreferenceEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setModesCanImpactAvailability:(BOOL)a3 error:(id *)a4;
- (BOOL)setPairSyncPreferenceEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setPhoneCallBypassSettings:(id)a3 error:(id *)a4;
- (BOOL)setPreventAutoReply:(BOOL)a3 error:(id *)a4;
- (NSString)clientIdentifier;
- (id)_initWithClientIdentifier:(id)a3;
- (id)getAccountFeatureSupportWithError:(id *)a3;
- (id)getPhoneCallBypassSettingsReturningError:(id *)a3;
- (id)getStateDumpReturningError:(id *)a3;
- (unint64_t)getCloudSyncStateReturningError:(id *)a3;
- (unint64_t)getPairSyncStateReturningError:(id *)a3;
- (void)_queue_registerForUpdatesIfRequired;
- (void)_updateListenersOfCloudSyncPreferenceChange:(BOOL)a3;
- (void)addListener:(id)a3 withCompletionHandler:(id)a4;
- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a3;
- (void)isCloudSyncActiveWithCompletionHandler:(id)a3;
- (void)modesCanImpactAvailability;
- (void)remoteService:(id)a3 didReceiveUpdatedPairSyncState:(unint64_t)a4;
- (void)remoteService:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4;
- (void)remoteService:(id)a3 didReceiveUpdatedPreventAutoReplySetting:(BOOL)a4;
- (void)removeListener:(id)a3;
@end

@implementation DNDGlobalConfigurationService

+ (id)serviceForClientIdentifier:(id)a3
{
  id v4 = a3;
  if (serviceForClientIdentifier__onceToken_9 != -1) {
    dispatch_once(&serviceForClientIdentifier__onceToken_9, &__block_literal_global_14);
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  v5 = serviceForClientIdentifier__lockQueue_8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__DNDGlobalConfigurationService_serviceForClientIdentifier___block_invoke_2;
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

uint64_t __60__DNDGlobalConfigurationService_serviceForClientIdentifier___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.donotdisturb.DNDGlobalConfigurationService.service.lock", v0);
  v2 = (void *)serviceForClientIdentifier__lockQueue_8;
  serviceForClientIdentifier__lockQueue_8 = (uint64_t)v1;

  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:517];
  uint64_t v4 = serviceForClientIdentifier__serviceByClientIdentifier_9;
  serviceForClientIdentifier__serviceByClientIdentifier_9 = v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

void __60__DNDGlobalConfigurationService_serviceForClientIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)serviceForClientIdentifier__serviceByClientIdentifier_9 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = [objc_alloc(*(Class *)(a1 + 48)) _initWithClientIdentifier:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    v8 = (void *)serviceForClientIdentifier__serviceByClientIdentifier_9;
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    [v8 setObject:v10 forKey:v9];
  }
}

- (BOOL)isAutoReplyPrevented
{
  return [(DNDGlobalConfigurationService *)self getPreventAutoReplyReturningError:0];
}

- (BOOL)getPreventAutoReplyReturningError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDGlobalConfigurationService.getPreventAutoReply", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__9;
  id v18 = __Block_byref_object_dispose__9;
  id v19 = 0;
  id v7 = +[DNDRemoteServiceConnection sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__DNDGlobalConfigurationService_getPreventAutoReplyReturningError___block_invoke;
  v13[3] = &unk_1E5910F40;
  v13[4] = &v20;
  v13[5] = &v14;
  [v7 getPreventAutoReplyWithRequestDetails:v6 completionHandler:v13];

  v8 = DNDLogGlobalConfiguration;
  if (v15[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDGlobalConfigurationService getPreventAutoReplyReturningError:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v21 + 24)) {
      uint64_t v9 = @"prevented";
    }
    else {
      uint64_t v9 = @"not prevented";
    }
    *(_DWORD *)buf = 138543618;
    v26 = v6;
    __int16 v27 = 2114;
    v28 = v9;
    _os_log_impl(&dword_19CC2C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Auto reply is %{public}@", buf, 0x16u);
  }
  if (a3)
  {
    uint64_t v10 = (void *)v15[5];
    if (v10) {
      *a3 = v10;
    }
  }
  BOOL v11 = *((unsigned char *)v21 + 24) != 0;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);

  return v11;
}

void __67__DNDGlobalConfigurationService_getPreventAutoReplyReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)setPreventAutoReply:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDGlobalConfigurationService.setPreventAutoReply", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  uint64_t v10 = [NSNumber numberWithBool:v5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__DNDGlobalConfigurationService_setPreventAutoReply_error___block_invoke;
  v16[3] = &unk_1E5910F40;
  v16[4] = &v23;
  v16[5] = &v17;
  [v9 setPreventAutoReply:v10 withRequestDetails:v8 completionHandler:v16];

  BOOL v11 = DNDLogGlobalConfiguration;
  if (*((unsigned char *)v24 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = @"not prevented";
      if (v5) {
        id v12 = @"prevented";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v8;
      __int16 v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set auto reply to %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService setPreventAutoReply:error:]();
  }
  if (a4)
  {
    uint64_t v13 = (void *)v18[5];
    if (v13) {
      *a4 = v13;
    }
  }
  BOOL v14 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v14;
}

void __59__DNDGlobalConfigurationService_setPreventAutoReply_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)modesCanImpactAvailability
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDGlobalConfigurationService.modesCanImpactAvailability", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v4 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  BOOL v14 = __Block_byref_object_copy__9;
  uint64_t v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  id v5 = +[DNDRemoteServiceConnection sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__DNDGlobalConfigurationService_modesCanImpactAvailability__block_invoke;
  v10[3] = &unk_1E5910F40;
  v10[4] = &v17;
  v10[5] = &v11;
  [v5 getModesCanImpactAvailabilityWithRequestDetails:v4 completionHandler:v10];

  uint64_t v6 = DNDLogGlobalConfiguration;
  if (v12[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDGlobalConfigurationService modesCanImpactAvailability]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v18 + 24)) {
      id v7 = &stru_1EEDCFB98;
    }
    else {
      id v7 = @"not";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v4;
    __int16 v24 = 2114;
    uint64_t v25 = v7;
    _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Modes can%{public}@ impact availability.", buf, 0x16u);
  }
  BOOL v8 = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);

  return v8;
}

void __59__DNDGlobalConfigurationService_modesCanImpactAvailability__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)setModesCanImpactAvailability:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDGlobalConfigurationService.setModesCanImpactAvailability", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  BOOL v8 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v23 = 0;
  __int16 v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  char v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  uint64_t v9 = +[DNDRemoteServiceConnection sharedInstance];
  uint64_t v10 = [NSNumber numberWithBool:v5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__DNDGlobalConfigurationService_setModesCanImpactAvailability_error___block_invoke;
  v16[3] = &unk_1E5910F40;
  v16[4] = &v23;
  v16[5] = &v17;
  [v9 setModesCanImpactAvailability:v10 withRequestDetails:v8 completionHandler:v16];

  uint64_t v11 = DNDLogGlobalConfiguration;
  if (*((unsigned char *)v24 + 24))
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = @"NO";
      if (v5) {
        id v12 = @"YES";
      }
      *(_DWORD *)buf = 138543618;
      uint64_t v29 = v8;
      __int16 v30 = 2114;
      v31 = v12;
      _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set modesCanImpactAvailability to %{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService setModesCanImpactAvailability:error:]();
  }
  if (a4)
  {
    uint64_t v13 = (void *)v18[5];
    if (v13) {
      *a4 = v13;
    }
  }
  BOOL v14 = *((unsigned char *)v24 + 24) != 0;
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  os_activity_scope_leave(&state);

  return v14;
}

void __69__DNDGlobalConfigurationService_setModesCanImpactAvailability_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)getPhoneCallBypassSettingsReturningError:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = DNDLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService getPhoneCallBypassSettingsReturningError:](v4);
    if (!a3) {
      return 0;
    }
    goto LABEL_3;
  }
  if (a3)
  {
LABEL_3:
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Bypass settings are now per mode configuration";
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    *a3 = [v5 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v6];
  }
  return 0;
}

- (BOOL)setPhoneCallBypassSettings:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = DNDLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService getPhoneCallBypassSettingsReturningError:](v6);
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a4)
  {
LABEL_3:
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Bypass settings are now per mode configuration";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a4 = [v7 errorWithDomain:@"DNDErrorDomain" code:1004 userInfo:v8];
  }
LABEL_4:

  return 0;
}

- (BOOL)isCloudSyncActive
{
  return (~[(DNDGlobalConfigurationService *)self getCloudSyncStateReturningError:0] & 0xF) == 0;
}

- (void)isCloudSyncActiveWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__DNDGlobalConfigurationService_isCloudSyncActiveWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5911A50;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__DNDGlobalConfigurationService_isCloudSyncActiveWithCompletionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained && *(void *)(a1 + 32))
  {
    char v4 = [WeakRetained isCloudSyncActive];
    id v5 = v3[2];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __72__DNDGlobalConfigurationService_isCloudSyncActiveWithCompletionHandler___block_invoke_2;
    v6[3] = &unk_1E5911058;
    id v7 = *(id *)(a1 + 32);
    char v8 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __72__DNDGlobalConfigurationService_isCloudSyncActiveWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (unint64_t)getCloudSyncStateReturningError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v4 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getCloudSyncState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  id v5 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__9;
  id v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  id v6 = +[DNDRemoteServiceConnection sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __65__DNDGlobalConfigurationService_getCloudSyncStateReturningError___block_invoke;
  v11[3] = &unk_1E5910F40;
  v11[4] = &v18;
  v11[5] = &v12;
  [v6 getCloudSyncStateWithRequestDetails:v5 completionHandler:v11];

  if (v13[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDGlobalConfigurationService getCloudSyncStateReturningError:]();
    }
  }
  else
  {
    id v7 = (id)DNDLogGlobalConfiguration;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = [NSNumber numberWithUnsignedInteger:v19[3]];
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v5;
      __int16 v25 = 2114;
      char v26 = v8;
      _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got cloud sync state=%{public}@", buf, 0x16u);
    }
  }
  unint64_t v9 = v19[3];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  os_activity_scope_leave(&state);

  return v9;
}

void __65__DNDGlobalConfigurationService_getCloudSyncStateReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 unsignedIntegerValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)setCloudSyncPreferenceEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.setSyncPreferenceEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  id v7 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__9;
  v15[4] = __Block_byref_object_dispose__9;
  id v16 = 0;
  char v8 = +[DNDRemoteServiceConnection sharedInstance];
  unint64_t v9 = [NSNumber numberWithBool:v4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__DNDGlobalConfigurationService_setCloudSyncPreferenceEnabled_error___block_invoke;
  v14[3] = &unk_1E5910F40;
  v14[4] = &v17;
  v14[5] = v15;
  [v8 setCloudSyncPreferenceEnabled:v9 withRequestDetails:v7 completionHandler:v14];

  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v10 = (id)DNDLogGlobalConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [NSNumber numberWithBool:v4];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      __int16 v25 = v11;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set cloud sync preference enabled=%{public}@", buf, 0x16u);
    }
    [(DNDGlobalConfigurationService *)self _updateListenersOfCloudSyncPreferenceChange:v4];
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService setCloudSyncPreferenceEnabled:error:]();
  }
  BOOL v12 = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __69__DNDGlobalConfigurationService_setCloudSyncPreferenceEnabled_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)_updateListenersOfCloudSyncPreferenceChange:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__DNDGlobalConfigurationService__updateListenersOfCloudSyncPreferenceChange___block_invoke;
  v4[3] = &unk_1E5911AA0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

void __77__DNDGlobalConfigurationService__updateListenersOfCloudSyncPreferenceChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__DNDGlobalConfigurationService__updateListenersOfCloudSyncPreferenceChange___block_invoke_2;
  v5[3] = &unk_1E5911A78;
  objc_copyWeak(&v7, &location);
  id v6 = v2;
  char v8 = *(unsigned char *)(a1 + 40);
  id v4 = v2;
  dispatch_async(v3, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __77__DNDGlobalConfigurationService__updateListenersOfCloudSyncPreferenceChange___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          char v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v8, "globalConfigurationService:didEditCloudSyncPreference:", WeakRetained, *(unsigned __int8 *)(a1 + 48), (void)v9);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (unint64_t)getPairSyncStateReturningError:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getPairSyncState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  uint64_t v5 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__9;
  id v16 = __Block_byref_object_dispose__9;
  id v17 = 0;
  uint64_t v6 = +[DNDRemoteServiceConnection sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __64__DNDGlobalConfigurationService_getPairSyncStateReturningError___block_invoke;
  v11[3] = &unk_1E5910F40;
  v11[4] = &v18;
  v11[5] = &v12;
  [v6 getPairSyncStateWithRequestDetails:v5 completionHandler:v11];

  if (v13[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDGlobalConfigurationService getPairSyncStateReturningError:]();
    }
  }
  else
  {
    uint64_t v7 = (id)DNDLogGlobalConfiguration;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = [NSNumber numberWithUnsignedInteger:v19[3]];
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v5;
      __int16 v25 = 2114;
      uint64_t v26 = v8;
      _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got pair sync state=%{public}@", buf, 0x16u);
    }
  }
  unint64_t v9 = v19[3];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  os_activity_scope_leave(&state);

  return v9;
}

void __64__DNDGlobalConfigurationService_getPairSyncStateReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 unsignedIntegerValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)setPairSyncPreferenceEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.setPairSyncPreferenceEnabled", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  uint64_t v7 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__9;
  v15[4] = __Block_byref_object_dispose__9;
  id v16 = 0;
  char v8 = +[DNDRemoteServiceConnection sharedInstance];
  unint64_t v9 = [NSNumber numberWithBool:v4];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__DNDGlobalConfigurationService_setPairSyncPreferenceEnabled_error___block_invoke;
  v14[3] = &unk_1E5910F40;
  v14[4] = &v17;
  v14[5] = v15;
  [v8 setPairSyncPreferenceEnabled:v9 withRequestDetails:v7 completionHandler:v14];

  if (*((unsigned char *)v18 + 24))
  {
    long long v10 = (id)DNDLogGlobalConfiguration;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      long long v11 = [NSNumber numberWithBool:v4];
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v7;
      __int16 v24 = 2114;
      __int16 v25 = v11;
      _os_log_impl(&dword_19CC2C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Set pair sync preference enabled=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    -[DNDGlobalConfigurationService setPairSyncPreferenceEnabled:error:]();
  }
  BOOL v12 = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(v15, 8);

  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);

  return v12;
}

void __68__DNDGlobalConfigurationService_setPairSyncPreferenceEnabled_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.didChangeFocusStatusSharingSettingForApplicationIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  uint64_t v6 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v7 = +[DNDRemoteServiceConnection sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__DNDGlobalConfigurationService_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke;
  v10[3] = &unk_1E59113B8;
  id v8 = v6;
  id v11 = v8;
  id v9 = v4;
  id v12 = v9;
  [v7 didChangeFocusStatusSharingSettingForApplicationIdentifier:v9 withRequestDetails:v8 completionHandler:v10];

  os_activity_scope_leave(&state);
}

void __92__DNDGlobalConfigurationService_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 BOOLValue];
  id v8 = (void *)DNDLogGlobalConfiguration;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = v8;
      int v12 = [v5 BOOLValue];
      uint64_t v13 = @"N";
      int v14 = 138543874;
      uint64_t v15 = v9;
      __int16 v16 = 2114;
      if (v12) {
        uint64_t v13 = @"Y";
      }
      uint64_t v17 = v10;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_19CC2C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Signaled change to focus status sharing setting, applicationIdentifier=%{public}@ success=%{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    __92__DNDGlobalConfigurationService_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke_cold_1();
  }
}

- (id)getAccountFeatureSupportWithError:(id *)a3
{
  id v4 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getAccountFeatureSupport", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  id v5 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  __int16 v16 = __Block_byref_object_copy__9;
  uint64_t v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  id v6 = +[DNDRemoteServiceConnection sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__DNDGlobalConfigurationService_getAccountFeatureSupportWithError___block_invoke;
  v10[3] = &unk_1E5911AC8;
  int v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v6 getAccountFeatureSupportWithRequestDetails:v7 completionHandler:v10];

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  os_activity_scope_leave(&state);
  return v8;
}

void __67__DNDGlobalConfigurationService_getAccountFeatureSupportWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = DNDLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543618;
      uint64_t v11 = v9;
      __int16 v12 = 2114;
      id v13 = v6;
      _os_log_impl(&dword_19CC2C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got account feature support=%{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
  {
    __67__DNDGlobalConfigurationService_getAccountFeatureSupportWithError___block_invoke_cold_1();
  }
}

- (void)addListener:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDGlobalConfigurationService.addListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = DNDLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_19CC2C000, v9, OS_LOG_TYPE_DEFAULT, "Adding update listener: listener=%{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__DNDGlobalConfigurationService_addListener_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E5911598;
  uint64_t v15 = v8;
  __int16 v16 = self;
  id v17 = v6;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  id v13 = v8;
  dispatch_sync(queue, v14);

  os_activity_scope_leave(&state);
}

void __67__DNDGlobalConfigurationService_addListener_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  [*(id *)(*(void *)(a1 + 40) + 24) addObject:*(void *)(a1 + 48)];
  int v2 = objc_msgSend(*(id *)(a1 + 40), "_queue_registerForUpdatesIfRequired");
  id v3 = DNDLogGlobalConfiguration;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v4;
      _os_log_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_DEFAULT, "Registered for updates: listener=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      __65__DNDModeConfigurationService_addListener_withCompletionHandler___block_invoke_cold_1((uint64_t *)(a1 + 48), v3);
    }
    [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(a1 + 48)];
  }
  id v5 = *(void **)(a1 + 56);
  if (v5)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__DNDGlobalConfigurationService_addListener_withCompletionHandler___block_invoke_35;
    v7[3] = &unk_1E5911058;
    id v8 = v5;
    char v9 = v2;
    dispatch_async(v6, v7);
  }
  os_activity_scope_leave(&state);
}

uint64_t __67__DNDGlobalConfigurationService_addListener_withCompletionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)removeListener:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDGlobalConfigurationService.removeListener", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = DNDLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v4;
    _os_log_impl(&dword_19CC2C000, v6, OS_LOG_TYPE_DEFAULT, "Removing update listener: listener=%{public}@", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__DNDGlobalConfigurationService_removeListener___block_invoke;
  block[3] = &unk_1E59110A8;
  id v11 = v5;
  uint64_t v12 = self;
  id v13 = v4;
  id v8 = v4;
  char v9 = v5;
  dispatch_sync(queue, block);

  os_activity_scope_leave(&state);
}

void __48__DNDGlobalConfigurationService_removeListener___block_invoke(uint64_t a1)
{
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v2);
  [*(id *)(*(void *)(a1 + 40) + 24) removeObject:*(void *)(a1 + 48)];
  os_activity_scope_leave(&v2);
}

- (void)remoteService:(id)a3 didReceiveUpdatedPairSyncState:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPairSyncState___block_invoke;
  v5[3] = &unk_1E5911B18;
  void v5[4] = self;
  v5[5] = a4;
  dispatch_sync(queue, v5);
}

void __78__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPairSyncState___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPairSyncState___block_invoke_2;
  v6[3] = &unk_1E5911AF0;
  objc_copyWeak(v8, &location);
  id v4 = *(void **)(a1 + 40);
  id v7 = v2;
  v8[1] = v4;
  id v5 = v2;
  dispatch_async(v3, v6);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __78__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPairSyncState___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v8, "globalConfigurationService:didReceiveUpdatedPairSyncState:", WeakRetained, *(void *)(a1 + 48), (void)v9);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)remoteService:(id)a3 didReceiveUpdatedPreventAutoReplySetting:(BOOL)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPreventAutoReplySetting___block_invoke;
  v5[3] = &unk_1E5911AA0;
  void v5[4] = self;
  BOOL v6 = a4;
  dispatch_sync(queue, v5);
}

void __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPreventAutoReplySetting___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPreventAutoReplySetting___block_invoke_2;
  v5[3] = &unk_1E5911A78;
  objc_copyWeak(&v7, &location);
  id v6 = v2;
  char v8 = *(unsigned char *)(a1 + 40);
  id v4 = v2;
  dispatch_async(v3, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPreventAutoReplySetting___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          char v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v8, "globalConfigurationService:didReceiveUpdatedPreventAutoReplySetting:", WeakRetained, *(unsigned __int8 *)(a1 + 48), (void)v9);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (void)remoteService:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke;
  v8[3] = &unk_1E5911080;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke(uint64_t a1)
{
  os_activity_scope_state_s v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke_2;
  v5[3] = &unk_1E5911B40;
  objc_copyWeak(&v8, &location);
  id v6 = v2;
  id v7 = *(id *)(a1 + 40);
  id v4 = v2;
  dispatch_async(v3, v5);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __88__DNDGlobalConfigurationService_remoteService_didReceiveUpdatedPhoneCallBypassSettings___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v8, "globalConfigurationService:didReceiveUpdatedPhoneCallBypassSettings:", WeakRetained, *(void *)(a1 + 40), (void)v9);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

- (id)getStateDumpReturningError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDModeConfigurationService.getStateDump", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  uint64_t v5 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__9;
  id v21 = __Block_byref_object_dispose__9;
  id v22 = 0;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__9;
  uint64_t v15 = __Block_byref_object_dispose__9;
  id v16 = 0;
  uint64_t v6 = +[DNDRemoteServiceConnection sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__DNDGlobalConfigurationService_getStateDumpReturningError___block_invoke;
  v10[3] = &unk_1E5911B68;
  void v10[4] = &v17;
  v10[5] = &v11;
  [v6 getStateDumpWithRequestDetails:v5 completionHandler:v10];

  uint64_t v7 = DNDLogGlobalConfiguration;
  if (v12[5])
  {
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDGlobalConfigurationService getStateDumpReturningError:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v25 = v5;
    _os_log_impl(&dword_19CC2C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got state dump", buf, 0xCu);
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);

  return v8;
}

void __60__DNDGlobalConfigurationService_getStateDumpReturningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DNDGlobalConfigurationService;
  id v5 = [(DNDGlobalConfigurationService *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    listeners = v5->_listeners;
    v5->_listeners = (NSHashTable *)v8;

    long long v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.donotdisturb.DNDGlobalConfigurationService", v10);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.donotdisturb.DNDGlobalConfigurationService.callout", v13);
    calloutQueue = v5->_calloutQueue;
    v5->_calloutQueue = (OS_dispatch_queue *)v14;

    id v16 = +[DNDRemoteServiceConnection sharedInstance];
    [v16 addEventListener:v5];
  }
  return v5;
}

- (BOOL)_queue_registerForUpdatesIfRequired
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSHashTable *)self->_listeners count] && !self->_registeredForUpdates)
  {
    id v3 = _os_activity_create(&dword_19CC2C000, "com.apple.donotdisturb.DNDGlobalConfigurationService.registerForUpdates", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    id v4 = +[DNDRequestDetails detailsRepresentingNowWithClientIdentifier:self->_clientIdentifier];
    id v5 = DNDLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19CC2C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering update listener", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v9 = 0;
    long long v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__9;
    uint64_t v17 = __Block_byref_object_dispose__9;
    id v18 = 0;
    uint64_t v6 = +[DNDRemoteServiceConnection sharedInstance];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __68__DNDGlobalConfigurationService__queue_registerForUpdatesIfRequired__block_invoke;
    v8[3] = &unk_1E5910F40;
    v8[4] = &v9;
    void v8[5] = &buf;
    [v6 registerForGlobalConfigurationUpdatesWithRequestDetails:v4 completionHandler:v8];

    if (*(void *)(*((void *)&buf + 1) + 40)
      && os_log_type_enabled((os_log_t)DNDLogGlobalConfiguration, OS_LOG_TYPE_ERROR))
    {
      -[DNDGlobalConfigurationService _queue_registerForUpdatesIfRequired]();
    }
    self->_registeredForUpdates = *((unsigned char *)v10 + 24);
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v9, 8);
    os_activity_scope_leave(&state);
  }
  return ![(NSHashTable *)self->_listeners count] || self->_registeredForUpdates;
}

void __68__DNDGlobalConfigurationService__queue_registerForUpdatesIfRequired__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 BOOLValue];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
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

- (void)getPreventAutoReplyReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting prevent-auto-reply state, error='%{public}@'");
}

- (void)setPreventAutoReply:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when setting prevent-auto-reply state, error='%{public}@'");
}

- (void)modesCanImpactAvailability
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting overall availability state, error='%{public}@'");
}

- (void)setModesCanImpactAvailability:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when setting modesCanImpactAvailability state, error='%{public}@'");
}

- (void)getPhoneCallBypassSettingsReturningError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_19CC2C000, log, OS_LOG_TYPE_ERROR, "Bypass settings are now per mode configuration", v1, 2u);
}

- (void)getCloudSyncStateReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting cloud sync state, error='%{public}@'");
}

- (void)setCloudSyncPreferenceEnabled:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when setting cloud sync enabled, error='%{public}@'");
}

- (void)getPairSyncStateReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting pair sync state, error='%{public}@'");
}

- (void)setPairSyncPreferenceEnabled:error:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when setting pair sync enabled, error='%{public}@'");
}

void __92__DNDGlobalConfigurationService_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_19CC2C000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Error when signaling change to focus status sharing setting, applicationIdentifier=%{public}@ error='%{public}@'", v4, 0x20u);
}

void __67__DNDGlobalConfigurationService_getAccountFeatureSupportWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting account feature support; error='%{public}@'");
}

- (void)getStateDumpReturningError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when getting state dump, error='%{public}@'");
}

- (void)_queue_registerForUpdatesIfRequired
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0(&dword_19CC2C000, v0, v1, "[%{public}@] Error when registering update listener, error='%{public}@'");
}

@end