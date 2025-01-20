@interface ASPeriodicUpdateManager
- (ASPeriodicUpdateManager)init;
- (ASPeriodicUpdateManager)initWithIsWatch:(BOOL)a3;
- (ASPeriodicUpdateManagerSecureCloudDelegate)secureCloudDelegate;
- (BOOL)hasRegisteredForUpdates;
- (BOOL)isReadyToProcessChanges;
- (void)_queue_handleFetchError:(id)a3 activity:(id)a4;
- (void)_queue_performUpdateForActivity:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5;
- (void)activitySharingManagerReady:(id)a3;
- (void)addProvider:(id)a3;
- (void)beginPeriodicUpdates;
- (void)cloudKitManager:(id)a3 didUpdateAccountStatus:(int64_t)a4;
- (void)endPeriodicUpdates;
- (void)removeProvider:(id)a3;
- (void)requestImmediateUpdateWithCloudKitGroup:(id)a3 completion:(id)a4;
- (void)setSecureCloudDelegate:(id)a3;
@end

@implementation ASPeriodicUpdateManager

- (ASPeriodicUpdateManager)init
{
  return 0;
}

- (ASPeriodicUpdateManager)initWithIsWatch:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ASPeriodicUpdateManager;
  v4 = [(ASPeriodicUpdateManager *)&v12 init];
  if (v4)
  {
    uint64_t v5 = HKCreateSerialDispatchQueue();
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = HKCreateSerialDispatchQueue();
    providerQueue = v4->_providerQueue;
    v4->_providerQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    providers = v4->_providers;
    v4->_providers = (NSHashTable *)v9;

    v4->_hasRegisteredForUpdates = 0;
    v4->_isWatch = a3;
  }
  return v4;
}

- (void)addProvider:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__ASPeriodicUpdateManager_addProvider___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

uint64_t __39__ASPeriodicUpdateManager_addProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

- (void)removeProvider:(id)a3
{
  id v4 = a3;
  providerQueue = self->_providerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ASPeriodicUpdateManager_removeProvider___block_invoke;
  v7[3] = &unk_2652157C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(providerQueue, v7);
}

uint64_t __42__ASPeriodicUpdateManager_removeProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

- (void)activitySharingManagerReady:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 activityDataManager];
  objc_storeWeak((id *)&self->_activityDataManager, v5);

  id v6 = [v4 cloudKitManager];
  objc_storeWeak((id *)&self->_cloudKitManager, v6);

  uint64_t v7 = [v4 friendListManager];
  objc_storeWeak((id *)&self->_friendListManager, v7);

  id v8 = [v4 relationshipManager];

  objc_storeWeak((id *)&self->_relationshipManager, v8);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudKitManager);
  [WeakRetained addObserver:self];
}

- (void)beginPeriodicUpdates
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 68))
  {
    ASLoggingInitialize();
    v2 = (void *)*MEMORY[0x263F23AD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      int updated = ASShouldReducePeriodUpdateFrequency();
      uint64_t v5 = &stru_26FB96980;
      if (updated) {
        uint64_t v5 = @" with reduced frequency";
      }
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager registering xpc activity%@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_294;
    v7[3] = &unk_2652167E0;
    objc_copyWeak(&v8, (id *)buf);
    id v6 = (void *)*MEMORY[0x263EF8188];
    v7[4] = *(void *)(a1 + 32);
    xpc_activity_register("com.apple.FitnessFriends.PeriodicUpdateActivity", v6, v7);
    *(unsigned char *)(*(void *)(a1 + 32) + 68) = 1;
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_294(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    xpc_activity_state_t state = xpc_activity_get_state(v3);
    ASLoggingInitialize();
    id v6 = (os_log_t *)MEMORY[0x263F23AD8];
    uint64_t v7 = *MEMORY[0x263F23AD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      xpc_activity_state_t v26 = state;
      _os_log_impl(&dword_2474C9000, v7, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager xpc activity fired, state=%zd", buf, 0xCu);
    }
    if (state)
    {
      if (!xpc_activity_set_state(v3, 4))
      {
        ASLoggingInitialize();
        id v8 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
          __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_294_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
        }
      }
      v16 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_295;
      v23[3] = &unk_2652157C8;
      v23[4] = WeakRetained;
      v24 = v3;
      dispatch_async(v16, v23);
    }
    else
    {
      xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
      int updated = ASShouldReducePeriodUpdateFrequency();
      v19 = (int64_t *)MEMORY[0x263EF81F0];
      if (!updated) {
        v19 = (int64_t *)MEMORY[0x263EF8200];
      }
      int64_t v20 = *v19;
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x263EF82A0], 1);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x263EF8180], 1);
      xpc_dictionary_set_BOOL(v17, (const char *)*MEMORY[0x263EF82D0], 1);
      xpc_dictionary_set_int64(v17, (const char *)*MEMORY[0x263EF81D8], v20);
      xpc_dictionary_set_string(v17, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
      xpc_dictionary_set_uint64(v17, (const char *)*MEMORY[0x263EF8298], *MEMORY[0x263EF8210]);
      xpc_object_t v21 = xpc_activity_copy_criteria(v3);
      v22 = v21;
      if (!v21 || !xpc_equal(v21, v17)) {
        xpc_activity_set_criteria(v3, v17);
      }
    }
  }
}

void __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_295(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = ASCloudKitGroupCoreDuetTriggered();
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_2;
  v5[3] = &unk_2652167B8;
  id v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_queue_performUpdateForActivity:cloudKitGroup:completion:", v3, v4, v5);
}

void __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if ([v5 code] == 131
    && ([v5 domain],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:*MEMORY[0x263EFD498]],
        v6,
        v7))
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      ASLoggingInitialize();
      id v8 = *MEMORY[0x263F23AD8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_ERROR)) {
        __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_2_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  else
  {
    ASLoggingInitialize();
    v16 = (os_log_t *)MEMORY[0x263F23AD8];
    xpc_object_t v17 = *MEMORY[0x263F23AD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)xpc_activity_state_t v26 = 0;
      _os_log_impl(&dword_2474C9000, v17, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager setting update task as done", v26, 2u);
    }
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
    {
      ASLoggingInitialize();
      v18 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
        __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_2_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
}

- (void)endPeriodicUpdates
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__ASPeriodicUpdateManager_endPeriodicUpdates__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __45__ASPeriodicUpdateManager_endPeriodicUpdates__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 68))
  {
    ASLoggingInitialize();
    v2 = *MEMORY[0x263F23AD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager unregistering xpc activity", v3, 2u);
    }
    xpc_activity_unregister("com.apple.FitnessFriends.PeriodicUpdateActivity");
    *(unsigned char *)(*(void *)(a1 + 32) + 68) = 0;
  }
}

- (void)requestImmediateUpdateWithCloudKitGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__ASPeriodicUpdateManager_requestImmediateUpdateWithCloudKitGroup_completion___block_invoke;
  block[3] = &unk_265215FD0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

uint64_t __78__ASPeriodicUpdateManager_requestImmediateUpdateWithCloudKitGroup_completion___block_invoke(uint64_t a1)
{
  ASLoggingInitialize();
  v2 = *MEMORY[0x263F23AD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Immediate periodic update requested.", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performUpdateForActivity:cloudKitGroup:completion:", 0, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_performUpdateForActivity:(id)a3 cloudKitGroup:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke;
  v85[3] = &unk_265216718;
  id v11 = v10;
  id v86 = v11;
  id v12 = (void (**)(void, void, void))MEMORY[0x24C557E50](v85);
  ASLoggingInitialize();
  id v13 = (os_log_t *)MEMORY[0x263F23AD8];
  uint64_t v14 = *MEMORY[0x263F23AD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v14, OS_LOG_TYPE_DEFAULT, "Loading activity data if needed.", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityDataManager);
  [WeakRetained loadLocalActivityDataIfNeeded];

  if (self->_isPushInProgress || self->_isSecureCloudPushInProgress)
  {
    ASLoggingInitialize();
    v16 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v16, OS_LOG_TYPE_DEFAULT, "Push in progress, queueing another push after this one completes", buf, 2u);
    }
    self->_hasQueuedPush = 1;
    v12[2](v12, 1, 0);
  }
  else
  {
    id v17 = objc_loadWeakRetained((id *)&self->_friendListManager);
    int v40 = [v17 hasLegacyFriendsToShareWith];

    if (ASSecureCloudEnabled())
    {
      id v18 = objc_loadWeakRetained((id *)&self->_friendListManager);
      int v19 = [v18 hasSecureCloudFriendsToShareWith];
    }
    else
    {
      int v19 = 0;
    }
    uint64_t v20 = dispatch_group_create();
    v83[0] = 0;
    v83[1] = v83;
    v83[2] = 0x2020000000;
    char v84 = 1;
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x2020000000;
    char v82 = 1;
    *(void *)buf = 0;
    v76 = buf;
    uint64_t v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__5;
    v79 = __Block_byref_object_dispose__5;
    id v80 = 0;
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x3032000000;
    v73[3] = __Block_byref_object_copy__5;
    v73[4] = __Block_byref_object_dispose__5;
    id v74 = 0;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x2020000000;
    char v72 = 1;
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x3032000000;
    v69[3] = __Block_byref_object_copy__5;
    v69[4] = __Block_byref_object_dispose__5;
    id v70 = 0;
    uint64_t v21 = [MEMORY[0x263F0A980] sharedBehavior];
    int v22 = [v21 isStandalonePhoneFitnessMode];

    if (self->_isWatch) {
      int v23 = 1;
    }
    else {
      int v23 = v22;
    }
    if (v23 == 1)
    {
      if (v40)
      {
        ASLoggingInitialize();
        uint64_t v24 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_2474C9000, v24, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager device is a watch or standalone phone; requesting push",
            v68,
            2u);
        }
        self->_isPushInProgress = 1;
        dispatch_group_enter(v20);
        providerQueue = self->_providerQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_299;
        block[3] = &unk_265216858;
        block[4] = self;
        id v63 = v8;
        id v64 = v9;
        v66 = v83;
        v67 = buf;
        v65 = v20;
        dispatch_async(providerQueue, block);
      }
      else
      {
        ASLoggingInitialize();
        xpc_activity_state_t v26 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_2474C9000, v26, OS_LOG_TYPE_DEFAULT, "Periodic update skipped, no friends", v68, 2u);
        }
      }
      if ((ASSecureCloudEnabled() & v19) == 1)
      {
        ASLoggingInitialize();
        uint64_t v27 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_2474C9000, v27, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager device is a watch or standalone phone; requesting secure cloud push",
            v68,
            2u);
        }
        self->_isSecureCloudPushInProgress = 1;
        dispatch_group_enter(v20);
        v28 = self->_providerQueue;
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_303;
        v56[3] = &unk_265216858;
        v56[4] = self;
        id v57 = v9;
        id v58 = v8;
        v60 = v71;
        v61 = v69;
        v59 = v20;
        dispatch_async(v28, v56);
      }
      else
      {
        ASLoggingInitialize();
        v29 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_2474C9000, v29, OS_LOG_TYPE_DEFAULT, "Periodic update for secure cloud skipped, no friends", v68, 2u);
        }
      }
    }
    self->_hasQueuedPush = 0;
    if (self->_isWatch) {
      int v30 = v22;
    }
    else {
      int v30 = 1;
    }
    if ((v30 & v40) == 1)
    {
      ASLoggingInitialize();
      v31 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v68 = 0;
        _os_log_impl(&dword_2474C9000, v31, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager device is a phone; updating supported features if necessary",
          v68,
          2u);
      }
      dispatch_group_enter(v20);
      id v32 = objc_loadWeakRetained((id *)&self->_relationshipManager);
      v53[0] = MEMORY[0x263EF8330];
      v53[1] = 3221225472;
      v53[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_306;
      v53[3] = &unk_2652168A8;
      v54 = v20;
      v55 = self;
      [v32 updateRelationshipsForCurrentFeatureSupportWithActivity:v8 cloudKitGroup:v9 completion:v53];
    }
    if ((v40 | v19) == 1)
    {
      ASLoggingInitialize();
      v33 = *v13;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v68 = 0;
        _os_log_impl(&dword_2474C9000, v33, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager initiating fetch changes from CloudKit", v68, 2u);
      }
      dispatch_group_enter(v20);
      if (ASAlwaysFetchOnPeriodicUpdate()) {
        uint64_t v34 = 0;
      }
      else {
        uint64_t v34 = 900;
      }
      id v35 = objc_loadWeakRetained((id *)&self->_cloudKitManager);
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_308;
      v49[3] = &unk_2652168D0;
      v51 = v81;
      v52 = v73;
      v50 = v20;
      [v35 fetchAllChangesIfTimeSinceLastFetchIsGreaterThan:v34 priority:2 activity:v8 group:v9 completion:v49];
    }
    serialQueue = self->_serialQueue;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_309;
    v41[3] = &unk_265216920;
    v41[4] = self;
    v45 = v73;
    id v42 = v8;
    v46 = buf;
    v47 = v83;
    v48 = v81;
    id v43 = v9;
    v44 = v12;
    dispatch_group_notify(v20, serialQueue, v41);
    if (!self->_isWatch
      || ([MEMORY[0x263F0A980] sharedBehavior],
          v37 = objc_claimAutoreleasedReturnValue(),
          int v38 = [v37 tinkerModeEnabled],
          v37,
          v38))
    {
      id v39 = objc_loadWeakRetained((id *)&self->_relationshipManager);
      [v39 processRetryMessages];
    }
    _Block_object_dispose(v69, 8);

    _Block_object_dispose(v71, 8);
    _Block_object_dispose(v73, 8);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v81, 8);
    _Block_object_dispose(v83, 8);
  }
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 32))
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_2;
    block[3] = &unk_2652162D8;
    id v8 = *(id *)(a1 + 32);
    char v9 = a2;
    id v7 = v5;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_299(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) allObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v25;
    id v6 = (void *)MEMORY[0x263EFFA68];
    id v7 = (void *)MEMORY[0x263EFFA68];
    do
    {
      uint64_t v8 = 0;
      char v9 = v6;
      id v10 = v7;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(v2);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        id v12 = [v11 recordsToSave];
        id v7 = [v10 arrayByAddingObjectsFromArray:v12];

        id v13 = [v11 recordIDsToDelete];
        id v6 = [v9 arrayByAddingObjectsFromArray:v13];

        ++v8;
        char v9 = v6;
        id v10 = v7;
      }
      while (v4 != v8);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
    id v7 = (void *)MEMORY[0x263EFFA68];
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  uint64_t v15 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_2_300;
  v18[3] = &unk_265216830;
  v18[4] = *(void *)(a1 + 32);
  id v19 = v15;
  id v20 = v7;
  long long v23 = *(_OWORD *)(a1 + 64);
  id v21 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 48);
  id v17 = v7;
  [WeakRetained forceSaveRecordsIntoPrivateDatabaseIgnoringServerChanges:v17 recordIDsToDelete:v6 priority:2 activity:v19 group:v16 completion:v18];
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_2_300(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 56);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_3;
  v13[3] = &unk_265216808;
  char v21 = a2;
  v13[4] = v9;
  id v14 = v7;
  id v15 = v8;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  long long v20 = *(_OWORD *)(a1 + 72);
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 64);
  id v11 = v8;
  id v12 = v7;
  dispatch_async(v10, v13);
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 104) && !*(void *)(a1 + 40)) {
          [v7 periodicUpdateManager:*(void *)(a1 + 32) didSaveRecords:*(void *)(a1 + 48) activity:*(void *)(a1 + 56)];
        }
        else {
          [v7 periodicUpdateManager:*(void *)(a1 + 32) didFailToSaveRecords:*(void *)(a1 + 64) activity:*(void *)(a1 + 56)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v4);
  }

  ASLoggingInitialize();
  id v8 = *MEMORY[0x263F23AD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *(unsigned __int8 *)(a1 + 104);
    uint64_t v10 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    int v20 = v9;
    __int16 v21 = 2112;
    uint64_t v22 = v10;
    _os_log_impl(&dword_2474C9000, v8, OS_LOG_TYPE_DEFAULT, "Periodic update save completed with result: %{BOOL}d, %@", buf, 0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(unsigned char *)(a1 + 104);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(id *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(NSObject **)(v11 + 48);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_301;
  v13[3] = &unk_2652157C8;
  v13[4] = v11;
  id v14 = *(id *)(a1 + 80);
  dispatch_async(v12, v13);
}

uint64_t __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_301(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 65) = 0;
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 67) && *(unsigned char *)(v1 + 66))
  {
    uint64_t v2 = result;
    ASLoggingInitialize();
    uint64_t v3 = *MEMORY[0x263F23AD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Running queued push immediately", v4, 2u);
    }
    return objc_msgSend(*(id *)(v2 + 32), "_queue_performUpdateForActivity:cloudKitGroup:completion:", 0, *(void *)(v2 + 40), 0);
  }
  return result;
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_303(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_2_304;
  v9[3] = &unk_265216880;
  long long v13 = *(_OWORD *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v8;
  [WeakRetained periodicUpdateManager:v3 requestChangedRecordsPushWithGroup:v4 activity:v5 completion:v9];
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_2_304(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  ASLoggingInitialize();
  id v6 = *MEMORY[0x263F23AD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v15 = a2;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Periodic update secure cloud save completed with result: %{BOOL}d, %@", buf, 0x12u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(NSObject **)(v10 + 48);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_305;
  v12[3] = &unk_2652157C8;
  v12[4] = v10;
  id v13 = *(id *)(a1 + 48);
  dispatch_async(v11, v12);
}

uint64_t __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_305(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 67) = 0;
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 65) && *(unsigned char *)(v1 + 66))
  {
    uint64_t v2 = result;
    ASLoggingInitialize();
    uint64_t v3 = *MEMORY[0x263F23AD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "Running queued push immediately for secure cloud", v4, 2u);
    }
    return objc_msgSend(*(id *)(v2 + 32), "_queue_performUpdateForActivity:cloudKitGroup:completion:", 0, *(void *)(v2 + 40), 0);
  }
  return result;
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_306(uint64_t a1)
{
  ASLoggingInitialize();
  uint64_t v2 = *MEMORY[0x263F23AD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager finished updating supported features", buf, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(NSObject **)(v3 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_307;
  block[3] = &unk_2652157F0;
  void block[4] = v3;
  dispatch_async(v4, block);
}

uint64_t __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_307(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 65) = 0;
  return result;
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_308(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  ASLoggingInitialize();
  id v6 = *MEMORY[0x263F23AD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager fetch changes completed", v10, 2u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_309(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_handleFetchError:activity:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(a1 + 40));
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (!v2) {
    uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  id v3 = v2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    BOOL v4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (ASSecureCloudEnabled()
    && (id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72)),
        WeakRetained,
        WeakRetained))
  {
    ASLoggingInitialize();
    id v6 = *MEMORY[0x263F23AD8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager checking if any relationships can upgrade containers", buf, 2u);
    }
    dispatch_group_t v7 = dispatch_group_create();
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(NSObject **)(v8 + 56);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_310;
    block[3] = &unk_2652168F8;
    dispatch_group_t v12 = v7;
    uint64_t v13 = v8;
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 56);
    BOOL v18 = v4;
    id v16 = v3;
    uint64_t v10 = v7;
    dispatch_async(v9, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_310(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 72));
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_2_311;
  v12[3] = &unk_2652167B8;
  id v13 = *(id *)(a1 + 32);
  [WeakRetained periodicUpdateManager:v3 runSecureCloudTasksWithGroup:v4 activity:v5 completion:v12];

  id v6 = *(NSObject **)(a1 + 32);
  dispatch_group_t v7 = *(NSObject **)(*(void *)(a1 + 40) + 48);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_312;
  v8[3] = &unk_2652162D8;
  id v10 = *(id *)(a1 + 72);
  char v11 = *(unsigned char *)(a1 + 80);
  id v9 = *(id *)(a1 + 64);
  dispatch_group_notify(v6, v7, v8);
}

void __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_2_311(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  ASLoggingInitialize();
  id v6 = *MEMORY[0x263F23AD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager completed secure cloud tasks with result: %{BOOL}d, %@", (uint8_t *)v7, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __84__ASPeriodicUpdateManager__queue_performUpdateForActivity_cloudKitGroup_completion___block_invoke_312(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)_queue_handleFetchError:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (ASSecureCloudEnabled())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);

    if (v6)
    {
      if (WeakRetained)
      {
        id v9 = dispatch_group_create();
        dispatch_group_enter(v9);
        providerQueue = self->_providerQueue;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __60__ASPeriodicUpdateManager__queue_handleFetchError_activity___block_invoke;
        v12[3] = &unk_2652160E8;
        void v12[4] = self;
        id v13 = v6;
        id v14 = v7;
        id v15 = v9;
        char v11 = v9;
        dispatch_async(providerQueue, v12);
        dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }
}

void __60__ASPeriodicUpdateManager__queue_handleFetchError_activity___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__ASPeriodicUpdateManager__queue_handleFetchError_activity___block_invoke_2;
  v6[3] = &unk_2652167B8;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [WeakRetained periodicUpdateManager:v3 fetchDidFailWithError:v4 activity:v5 completion:v6];
}

void __60__ASPeriodicUpdateManager__queue_handleFetchError_activity___block_invoke_2(uint64_t a1)
{
}

- (BOOL)isReadyToProcessChanges
{
  return 1;
}

- (void)cloudKitManager:(id)a3 didUpdateAccountStatus:(int64_t)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  id v6 = *MEMORY[0x263F23AD8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AD8], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = a4;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "PeriodicUpdateManager account status did change to %ld", (uint8_t *)&v7, 0xCu);
  }
  if ((unint64_t)(a4 - 2) >= 3 && a4)
  {
    if (a4 == 1) {
      [(ASPeriodicUpdateManager *)self beginPeriodicUpdates];
    }
  }
  else
  {
    [(ASPeriodicUpdateManager *)self endPeriodicUpdates];
  }
}

- (BOOL)hasRegisteredForUpdates
{
  return self->_hasRegisteredForUpdates;
}

- (ASPeriodicUpdateManagerSecureCloudDelegate)secureCloudDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secureCloudDelegate);
  return (ASPeriodicUpdateManagerSecureCloudDelegate *)WeakRetained;
}

- (void)setSecureCloudDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_secureCloudDelegate);
  objc_storeStrong((id *)&self->_providerQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_providers, 0);
  objc_destroyWeak((id *)&self->_relationshipManager);
  objc_destroyWeak((id *)&self->_friendListManager);
  objc_destroyWeak((id *)&self->_cloudKitManager);
  objc_destroyWeak((id *)&self->_activityDataManager);
}

void __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_294_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__ASPeriodicUpdateManager_beginPeriodicUpdates__block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end