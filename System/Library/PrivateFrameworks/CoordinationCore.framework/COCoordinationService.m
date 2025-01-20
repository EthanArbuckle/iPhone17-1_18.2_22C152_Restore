@interface COCoordinationService
+ (COCoordinationService)singleton;
+ (void)setSingleton:(id)a3;
+ (void)startWithConstituentType:(unint64_t)a3;
- (COClusterAliasManager)aliasManager;
- (COHomeKitAdapter)hkAdapter;
- (COIDSServerBag)idsServerBag;
- (NSArray)alwaysAssert;
- (NSMapTable)assertions;
- (NSOrderedSet)services;
- (OS_dispatch_queue)dispatchQueue;
- (double)pingMaximum;
- (double)pingMinimum;
- (id)_initWithConstituentType:(unint64_t)a3;
- (id)_servicesForClusters:(id)a3;
- (id)aliasManagerRequestsNewMesh:(id)a3;
- (id)takeAssertionForCluster:(id)a3;
- (unint64_t)type;
- (void)_completeMigration;
- (void)_continueInitialization;
- (void)_continueMigration;
- (void)_initializeServices;
- (void)_initiateMigrationFrom:(int64_t)a3;
- (void)_linkServicesToMeshController:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5;
- (void)_setupIDSServerBag;
- (void)_significantHomeChange:(id)a3;
- (void)_unlinkServicesFromMeshController:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5;
- (void)_withLock:(id)a3;
- (void)_withServicesLock:(id)a3;
- (void)aliasManager:(id)a3 activatingMesh:(id)a4 withClusterIdentifier:(id)a5 forClusters:(id)a6 completion:(id)a7;
- (void)aliasManager:(id)a3 deactivatingMesh:(id)a4 withClusterIdentifier:(id)a5 forClusters:(id)a6 completion:(id)a7;
- (void)didInvalidateAssertionForCluster:(id)a3;
- (void)idsServerBagDidUpdate:(id)a3;
- (void)setIdsServerBag:(id)a3;
- (void)waitForClusterBootstrap:(id)a3 completion:(id)a4;
@end

@implementation COCoordinationService

- (id)_initWithConstituentType:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)COCoordinationService;
  v4 = [(COCoordinationService *)&v26 init];
  v5 = v4;
  if (v4)
  {
    *(void *)&v4->_lock._os_unfair_lock_opaque = 0;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.coordination.COCoordinationService", v7);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    assertions = v5->_assertions;
    v5->_assertions = (NSMapTable *)v10;

    uint64_t v12 = +[COClusterAliasManager aliasManagerWithProvider:v5 delegate:v5 delegateDispatchQueue:v5->_dispatchQueue];
    aliasManager = v5->_aliasManager;
    v5->_aliasManager = (COClusterAliasManager *)v12;

    v14 = (void *)MEMORY[0x263F33F78];
    v15 = [MEMORY[0x263F33F78] coordinationBundleID];
    v16 = [v14 userDefaultsForIdentifer:v15];

    v17 = [v16 objectForKey:@"SingleShotType"];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        a3 = [v17 unsignedIntegerValue];
        v18 = COCoreLogForCategory(1);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v28 = a3;
          _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "Service type overridden with %016llX", buf, 0xCu);
        }
      }
      [v16 removeObjectForKey:@"SingleShotType"];
    }
    v5->_type = a3;
    [v16 doubleForKey:@"MinimumPing"];
    double v20 = v19;
    [v16 doubleForKey:@"MaximumPing"];
    if (v20 > 0.0 && v20 < v21)
    {
      v5->_pingMinimum = v20;
      v5->_pingMaximum = v21;
    }
    uint64_t v22 = +[COHomeKitAdapter sharedInstance];
    hkAdapter = v5->_hkAdapter;
    v5->_hkAdapter = (COHomeKitAdapter *)v22;

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v5 selector:sel__significantHomeChange_ name:@"COHomeKitAdapterSignificantHomeChangeNotification" object:0];

    v5->_isMigrating = 1;
    -[COCoordinationService _initiateMigrationFrom:](v5, "_initiateMigrationFrom:", [v16 integerForKey:@"LastMigration"]);
    [(COCoordinationService *)v5 _setupIDSServerBag];
  }
  return v5;
}

+ (COCoordinationService)singleton
{
  return (COCoordinationService *)(id)_CoordinationService;
}

+ (void)setSingleton:(id)a3
{
}

+ (void)startWithConstituentType:(unint64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __50__COCoordinationService_startWithConstituentType___block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a1;
  v3[5] = a3;
  if (startWithConstituentType__onceToken != -1) {
    dispatch_once(&startWithConstituentType__onceToken, v3);
  }
}

void __50__COCoordinationService_startWithConstituentType___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [[COCoordinationService alloc] _initWithConstituentType:*(void *)(a1 + 40)];
  [v1 setSingleton:v2];
}

- (void)_initiateMigrationFrom:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v5 = COCoreLogForCategory(1);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3 < 1)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134218240;
      int64_t v9 = a3;
      __int16 v10 = 2048;
      uint64_t v11 = 1;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "Migration starting from %ld to %ld...", buf, 0x16u);
    }

    [(COCoordinationService *)self _continueMigration];
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 134218240;
      int64_t v9 = a3;
      __int16 v10 = 2048;
      uint64_t v11 = 1;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "No migration required (%ld >= %ld)", buf, 0x16u);
    }

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__COCoordinationService__initiateMigrationFrom___block_invoke;
    v7[3] = &unk_2645CB288;
    v7[4] = self;
    [(COCoordinationService *)self _withLock:v7];
    [(COCoordinationService *)self _continueInitialization];
  }
}

uint64_t __48__COCoordinationService__initiateMigrationFrom___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = 0;
  return result;
}

- (void)_continueMigration
{
  v21[2] = *MEMORY[0x263EF8340];
  v3 = [(COCoordinationService *)self hkAdapter];
  v4 = [v3 currentAccessory];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F55D50]);
    id v6 = objc_alloc_init(MEMORY[0x263F55DA0]);
    v7 = (void *)MEMORY[0x263F58190];
    dispatch_queue_t v8 = [v5 alarms];
    v21[0] = v8;
    int64_t v9 = [v6 timers];
    v21[1] = v9;
    __int16 v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    uint64_t v11 = [MEMORY[0x263F581B8] immediateScheduler];
    uint64_t v12 = [v7 combineAllFutures:v10 ignoringErrors:1 scheduler:v11];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __43__COCoordinationService__continueMigration__block_invoke;
    v16[3] = &unk_2645CC630;
    id v17 = v4;
    id v18 = v5;
    id v19 = v6;
    double v20 = self;
    id v13 = v6;
    id v14 = v5;
    id v15 = (id)[v12 addSuccessBlock:v16];
  }
  else
  {
    [(COCoordinationService *)self _completeMigration];
  }
}

void __43__COCoordinationService__continueMigration__block_invoke(id *a1, void *a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 objectAtIndex:0];
  id v5 = [v3 objectAtIndex:1];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_opt_class();
  v44 = a1;
  if (objc_opt_isKindOfClass())
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v45 = v6;
      v38 = v5;
      v40 = v4;
      id v42 = v3;
      uint64_t v10 = *(void *)v53;
      uint64_t v11 = *MEMORY[0x263F33D90];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v53 != v10) {
            objc_enumerationMutation(v7);
          }
          id v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          id v14 = objc_msgSend(v13, "siriContext", v38, v40, v42);
          id v15 = [v14 objectForKey:v11];
          if (!v15)
          {
            id v15 = COAlarmSiriContextTargetReferenceForAccessory();
            v16 = (void *)[v13 mutableCopy];
            if (v14) {
              id v17 = (id)[v14 mutableCopy];
            }
            else {
              id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            }
            id v18 = v17;
            [v17 setObject:v15 forKey:v11];
            [v16 setSiriContext:v18];
            id v19 = [a1[5] updateAlarm:v16];
            [v45 addObject:v19];

            a1 = v44;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v9);
      v4 = v40;
      id v3 = v42;
      id v5 = v38;
      id v6 = v45;
    }
  }
  else
  {
    v7 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43__COCoordinationService__continueMigration__block_invoke_cold_2();
    }
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    double v20 = v5;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      v46 = v6;
      v39 = v5;
      v41 = v4;
      id v43 = v3;
      uint64_t v23 = *(void *)v49;
      uint64_t v24 = *MEMORY[0x263F33F28];
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v20);
          }
          objc_super v26 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          if ((objc_msgSend(v26, "isCurrentTimer", v39, v41, v43) & 1) == 0)
          {
            v27 = [v26 siriContext];
            unint64_t v28 = [v27 objectForKey:v24];
            if (!v28)
            {
              unint64_t v28 = COTimerSiriContextTargetReferenceForAccessory();
              uint64_t v29 = (void *)[v26 mutableCopy];
              if (v27) {
                id v30 = (id)[v27 mutableCopy];
              }
              else {
                id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              }
              v31 = v30;
              [v30 setObject:v28 forKey:v24];
              [v29 setSiriContext:v31];
              v32 = [a1[6] updateTimer:v29];
              [v46 addObject:v32];

              a1 = v44;
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v22);
      v4 = v41;
      id v3 = v43;
      id v5 = v39;
      id v6 = v46;
    }
  }
  else
  {
    double v20 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      __43__COCoordinationService__continueMigration__block_invoke_cold_1();
    }
  }

  if ([v6 count])
  {
    v33 = a1;
    v34 = (void *)MEMORY[0x263F58190];
    v35 = [MEMORY[0x263F581B8] immediateScheduler];
    v36 = [v34 combineAllFutures:v6 ignoringErrors:1 scheduler:v35];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __43__COCoordinationService__continueMigration__block_invoke_36;
    v47[3] = &unk_2645CEA28;
    v47[4] = v33[7];
    id v37 = (id)[v36 addCompletionBlock:v47];
  }
  else
  {
    [a1[7] _completeMigration];
  }
}

uint64_t __43__COCoordinationService__continueMigration__block_invoke_36(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeMigration];
}

- (void)_completeMigration
{
  id v3 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "Migration complete.", buf, 2u);
  }

  v4 = (void *)MEMORY[0x263F33F78];
  id v5 = [MEMORY[0x263F33F78] coordinationBundleID];
  id v6 = [v4 userDefaultsForIdentifer:v5];

  [v6 setInteger:1 forKey:@"LastMigration"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__COCoordinationService__completeMigration__block_invoke;
  v7[3] = &unk_2645CB288;
  v7[4] = self;
  [(COCoordinationService *)self _withLock:v7];
  [(COCoordinationService *)self _continueInitialization];
}

uint64_t __43__COCoordinationService__completeMigration__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = 0;
  return result;
}

- (void)_initializeServices
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(&self->_servicesLock);
  id v3 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  v4 = +[COCapabilityService serviceWithDelegate:self];
  [v3 addObject:v4];

  id v5 = +[CORoleService serviceWithDelegate:self];
  [v3 addObject:v5];

  id v6 = +[COStateService serviceWithDelegate:self];
  [v3 addObject:v6];

  v7 = +[COMessagingService serviceWithDelegate:self];
  [v3 addObject:v7];

  if ([MEMORY[0x263F33F80] isDistributedTimersForHH1Enabled])
  {
    uint64_t v8 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      id v13 = self;
      _os_log_impl(&dword_2217C1000, v8, OS_LOG_TYPE_DEFAULT, "%p Alarms & Timers are handled by DistributedTimers (HH1 ok)", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = +[COAlarmService serviceWithDelegate:self];
    [v3 addObject:v9];

    uint64_t v8 = +[COTimerService serviceWithDelegate:self];
    [v3 addObject:v8];
  }

  uint64_t v10 = (NSOrderedSet *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithOrderedSet:v3];
  services = self->_services;
  self->_services = v10;
}

- (void)_continueInitialization
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__COCoordinationService__continueInitialization__block_invoke;
  v4[3] = &unk_2645CB288;
  v4[4] = self;
  [(COCoordinationService *)self _withServicesLock:v4];
  alwaysAssert = self->_alwaysAssert;
  self->_alwaysAssert = 0;
}

uint64_t __48__COCoordinationService__continueInitialization__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeServices];
}

- (void)_significantHomeChange:(id)a3
{
  id v4 = a3;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__COCoordinationService__significantHomeChange___block_invoke;
  v5[3] = &unk_2645CAE08;
  v5[4] = self;
  v5[5] = &v6;
  [(COCoordinationService *)self _withLock:v5];
  if (*((unsigned char *)v7 + 24)) {
    [(COCoordinationService *)self _continueMigration];
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __48__COCoordinationService__significantHomeChange___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 16);
  return result;
}

- (void)_linkServicesToMeshController:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v37 = a3;
  id v38 = a4;
  id v8 = a5;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__29;
  v66 = __Block_byref_object_dispose__29;
  id v67 = 0;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke;
  v59[3] = &unk_2645CB1E8;
  v61 = &v62;
  v59[4] = self;
  id v36 = v8;
  id v60 = v36;
  [(COCoordinationService *)self _withServicesLock:v59];
  int v9 = [MEMORY[0x263F33F80] isDistributedTimersEnabled];
  uint64_t v10 = [(COCoordinationService *)self hkAdapter];
  int v11 = [v10 hasOptedToHH2];

  int v12 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v34 = "no";
    if (v9) {
      v35 = "yes";
    }
    else {
      v35 = "no";
    }
    *(_DWORD *)buf = 134218498;
    v69 = self;
    uint64_t v71 = (uint64_t)v35;
    __int16 v70 = 2080;
    if (v11) {
      v34 = "yes";
    }
    __int16 v72 = 2080;
    v73 = v34;
    _os_log_debug_impl(&dword_2217C1000, v12, OS_LOG_TYPE_DEBUG, "%p DistributedTimers: %s, HomeHub2: %s", buf, 0x20u);
  }

  if ((([MEMORY[0x263F33F80] isDistributedTimersForHH1Enabled] | v9 ^ 1) & 1) == 0
    && ((v11 ^ 1) & 1) == 0)
  {
    id v13 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v69 = self;
      _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "%p Alarms & Timers are handled by DistributedTimers, removing services.", buf, 0xCu);
    }

    uint64_t v14 = (void *)[(id)v63[5] mutableCopy];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v15 = (id)v63[5];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v55 objects:v78 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v56 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v55 + 1) + 8 * i);
          double v20 = objc_opt_class();
          if (([v20 isEqual:objc_opt_class()] & 1) == 0)
          {
            uint64_t v21 = objc_opt_class();
            if (![v21 isEqual:objc_opt_class()]) {
              continue;
            }
          }
          uint64_t v22 = COCoreLogForCategory(1);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v69 = self;
            __int16 v70 = 2112;
            uint64_t v71 = v19;
            _os_log_impl(&dword_2217C1000, v22, OS_LOG_TYPE_DEFAULT, "%p removing %@", buf, 0x16u);
          }

          [v14 removeObject:v19];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v55 objects:v78 count:16];
      }
      while (v16);
    }

    uint64_t v23 = (void *)v63[5];
    v63[5] = (uint64_t)v14;
  }
  uint64_t v24 = [(id)v63[5] count];
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = 0;
  uint64_t v48 = 0;
  long long v49 = (id *)&v48;
  uint64_t v50 = 0x3042000000;
  long long v51 = __Block_byref_object_copy__50;
  long long v52 = __Block_byref_object_dispose__51;
  id v53 = 0;
  dispatch_group_t v25 = dispatch_group_create();
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke_52;
  v39[3] = &unk_2645CEA78;
  uint64_t v47 = v24;
  v44 = v54;
  v45 = &v62;
  id v26 = v36;
  id v40 = v26;
  id v27 = v37;
  id v41 = v27;
  id v28 = v38;
  id v42 = v28;
  v46 = &v48;
  uint64_t v29 = v25;
  id v43 = v29;
  id v30 = (void (**)(void))MEMORY[0x223C8B4A0](v39);
  objc_storeWeak(v49 + 5, v30);
  v31 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = [(id)v63[5] count];
    *(_DWORD *)buf = 134219010;
    v69 = self;
    __int16 v70 = 2048;
    uint64_t v71 = v32;
    __int16 v72 = 2048;
    v73 = (const char *)v27;
    __int16 v74 = 2112;
    id v75 = v28;
    __int16 v76 = 2112;
    id v77 = v26;
    _os_log_impl(&dword_2217C1000, v31, OS_LOG_TYPE_DEFAULT, "%p linking %lu services to %p with %@ for Clusters %@", buf, 0x34u);
  }

  v33 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    -[COCoordinationService _linkServicesToMeshController:withClusterIdentifier:forClusters:]();
  }

  dispatch_group_enter(v29);
  v30[2](v30);
  dispatch_group_wait(v29, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v48, 8);
  objc_destroyWeak(&v53);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v62, 8);
}

uint64_t __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _servicesForClusters:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

void __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke_52(void *a1)
{
  if (*(void *)(*(void *)(a1[8] + 8) + 24) >= a1[11])
  {
    uint64_t v6 = a1[7];
    dispatch_group_leave(v6);
  }
  else
  {
    uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1[9] + 8) + 40), "objectAtIndex:");
    ++*(void *)(*(void *)(a1[8] + 8) + 24);
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke_2;
    v7[3] = &unk_2645CEA50;
    v7[4] = a1[10];
    [v2 joinClusters:v3 usingMeshController:v4 withClusterIdentifier:v5 completion:v7];
  }
}

void __89__COCoordinationService__linkServicesToMeshController_withClusterIdentifier_forClusters___block_invoke_2(uint64_t a1)
{
  WeakRetained = (void (**)(void))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  WeakRetained[2]();
}

- (void)_unlinkServicesFromMeshController:(id)a3 withClusterIdentifier:(id)a4 forClusters:(id)a5
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__29;
  v45 = __Block_byref_object_dispose__29;
  id v46 = 0;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke;
  v38[3] = &unk_2645CB1E8;
  id v40 = &v41;
  v38[4] = self;
  id v11 = v10;
  id v39 = v11;
  [(COCoordinationService *)self _withServicesLock:v38];
  uint64_t v12 = [(id)v42[5] count];
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  uint64_t v31 = 0;
  uint64_t v32 = (id *)&v31;
  uint64_t v33 = 0x3042000000;
  v34 = __Block_byref_object_copy__50;
  v35 = __Block_byref_object_dispose__51;
  id v36 = 0;
  dispatch_group_t v13 = dispatch_group_create();
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke_2;
  uint64_t v23 = &unk_2645CEAA0;
  uint64_t v30 = v12;
  id v27 = v37;
  id v28 = &v41;
  id v14 = v11;
  id v24 = v14;
  id v15 = v9;
  id v25 = v15;
  uint64_t v29 = &v31;
  uint64_t v16 = v13;
  id v26 = v16;
  uint64_t v17 = (void (**)(void))MEMORY[0x223C8B4A0](&v20);
  objc_storeWeak(v32 + 5, v17);
  id v18 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = objc_msgSend((id)v42[5], "count", v20, v21, v22, v23, v24, v25);
    *(_DWORD *)buf = 134219010;
    uint64_t v48 = self;
    __int16 v49 = 2048;
    uint64_t v50 = v19;
    __int16 v51 = 2048;
    id v52 = v8;
    __int16 v53 = 2112;
    id v54 = v15;
    __int16 v55 = 2112;
    id v56 = v14;
    _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "%p unlinking %lu services from %p with %@ for Clusters %@", buf, 0x34u);
  }

  dispatch_group_enter(v16);
  v17[2](v17);
  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v31, 8);
  objc_destroyWeak(&v36);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v41, 8);
}

uint64_t __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _servicesForClusters:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

void __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke_2(void *a1)
{
  if (*(void *)(*(void *)(a1[7] + 8) + 24) >= a1[10])
  {
    uint64_t v5 = a1[6];
    dispatch_group_leave(v5);
  }
  else
  {
    uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "objectAtIndex:");
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke_3;
    v6[3] = &unk_2645CEA50;
    v6[4] = a1[9];
    [v2 leaveClusters:v3 withClusterIdentifier:v4 completion:v6];
  }
}

void __93__COCoordinationService__unlinkServicesFromMeshController_withClusterIdentifier_forClusters___block_invoke_3(uint64_t a1)
{
  WeakRetained = (void (**)(void))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  WeakRetained[2]();
}

- (id)takeAssertionForCluster:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__29;
  id v25 = __Block_byref_object_dispose__29;
  id v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  id v11 = __49__COCoordinationService_takeAssertionForCluster___block_invoke;
  uint64_t v12 = &unk_2645CEAC8;
  dispatch_group_t v13 = self;
  id v5 = v4;
  id v14 = v5;
  id v15 = &v21;
  uint64_t v16 = &v17;
  [(COCoordinationService *)self _withLock:&v9];
  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v6 = [(COCoordinationService *)self aliasManager];
    [v6 startTrackingCluster:v5];
  }
  id v7 = (id)v22[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v7;
}

void __49__COCoordinationService_takeAssertionForCluster___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) assertions];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  objc_initWeak(&location, v3);

  id v4 = objc_loadWeakRetained(&location);
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v5 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = [v8 assertions];
      uint64_t v10 = [v9 count];
      *(_DWORD *)buf = 134218754;
      uint64_t v22 = v8;
      __int16 v23 = 2048;
      uint64_t v24 = v7;
      __int16 v25 = 2112;
      uint64_t v26 = v6;
      __int16 v27 = 2048;
      uint64_t v28 = v10;
      _os_log_debug_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEBUG, "%p reusing assertion %p for Cluster %@ (total %lu)", buf, 0x2Au);
    }
  }
  else
  {
    uint64_t v11 = +[COClusterAssertion assertionForCluster:*(void *)(a1 + 40) delegate:*(void *)(a1 + 32)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    dispatch_group_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id v14 = [*(id *)(a1 + 32) assertions];
    [v14 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:*(void *)(a1 + 40)];

    id v5 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      uint64_t v17 = *(void **)(a1 + 32);
      id v18 = [v17 assertions];
      uint64_t v19 = [v18 count];
      *(_DWORD *)buf = 134218754;
      uint64_t v22 = v17;
      __int16 v23 = 2048;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      __int16 v27 = 2048;
      uint64_t v28 = v19;
      _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p established assertion %p for Cluster %@ (total %lu)", buf, 0x2Au);
    }
  }

  objc_destroyWeak(&location);
}

- (void)waitForClusterBootstrap:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__COCoordinationService_waitForClusterBootstrap_completion___block_invoke;
  v11[3] = &unk_2645CAED0;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  dispatch_group_t v13 = &v14;
  [(COCoordinationService *)self _withLock:v11];
  if (*((unsigned char *)v15 + 24))
  {
    uint64_t v9 = COCoreLogForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[COCoordinationService waitForClusterBootstrap:completion:]();
    }

    v7[2](v7);
  }
  else
  {
    uint64_t v10 = [(COCoordinationService *)self aliasManager];
    [v10 waitForBootstrapOfCluster:v8 withBlock:v7];
  }
  _Block_object_dispose(&v14, 8);
}

void __60__COCoordinationService_waitForClusterBootstrap_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) assertions];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  objc_initWeak(&location, v3);

  id v4 = objc_loadWeakRetained(&location);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4 == 0;

  objc_destroyWeak(&location);
}

- (void)didInvalidateAssertionForCluster:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __58__COCoordinationService_didInvalidateAssertionForCluster___block_invoke;
  uint64_t v10 = &unk_2645CAE80;
  uint64_t v11 = self;
  id v12 = v4;
  id v5 = v4;
  [(COCoordinationService *)self _withLock:&v7];
  id v6 = [(COCoordinationService *)self aliasManager];
  [v6 stopTrackingCluster:v5];
}

void __58__COCoordinationService_didInvalidateAssertionForCluster___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) assertions];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = COCoreLogForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [v4 assertions];
    int v7 = 134218498;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = [v6 count];
    _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p assertion invalidated for Cluster %@ (total %lu)", (uint8_t *)&v7, 0x20u);
  }
}

- (id)aliasManagerRequestsNewMesh:(id)a3
{
  id v4 = [[COMeshController alloc] initWithConstituentType:[(COCoordinationService *)self type]];
  uint64_t v5 = [(COCoordinationService *)self dispatchQueue];
  [(COMeshController *)v4 setDispatchQueue:v5];

  [(COCoordinationService *)self pingMinimum];
  double v7 = v6;
  [(COCoordinationService *)self pingMaximum];
  if (v7 > 0.0)
  {
    double v9 = v8;
    if (v7 < v8)
    {
      [(COMeshController *)v4 setPingMinimum:v7];
      [(COMeshController *)v4 setPingMaximum:v9];
    }
  }
  return v4;
}

- (void)aliasManager:(id)a3 activatingMesh:(id)a4 withClusterIdentifier:(id)a5 forClusters:(id)a6 completion:(id)a7
{
  __int16 v11 = (void (**)(void))a7;
  [(COCoordinationService *)self _linkServicesToMeshController:a4 withClusterIdentifier:a5 forClusters:a6];
  v11[2]();
}

- (void)aliasManager:(id)a3 deactivatingMesh:(id)a4 withClusterIdentifier:(id)a5 forClusters:(id)a6 completion:(id)a7
{
  __int16 v11 = (void (**)(void))a7;
  [(COCoordinationService *)self _unlinkServicesFromMeshController:a4 withClusterIdentifier:a5 forClusters:a6];
  v11[2]();
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)_withServicesLock:(id)a3
{
  p_servicesLock = &self->_servicesLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_servicesLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_servicesLock);
}

- (id)_servicesForClusters:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_servicesLock);
  id v17 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = [(COCoordinationService *)self services];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v4;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if ([v10 _applicableToCluster:*(void *)(*((void *)&v18 + 1) + 8 * j)])
              {
                [v17 addObject:v10];
                goto LABEL_16;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  return v17;
}

- (void)_setupIDSServerBag
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = self;
    _os_log_impl(&dword_2217C1000, v3, OS_LOG_TYPE_DEFAULT, "%p setting up IDSServer Bag", (uint8_t *)&v8, 0xCu);
  }

  id v4 = objc_alloc_init(COIDSServerBag);
  idsServerBag = self->_idsServerBag;
  self->_idsServerBag = v4;

  uint64_t v6 = [(COCoordinationService *)self idsServerBag];
  [v6 setDelegate:self];

  uint64_t v7 = [(COCoordinationService *)self idsServerBag];
  [v7 configure];
}

- (void)idsServerBagDidUpdate:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = COCoreLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134217984;
    long long v20 = self;
    _os_log_impl(&dword_2217C1000, v5, OS_LOG_TYPE_DEFAULT, "%p IDS server bag updated", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v6 = (void *)MEMORY[0x263F33F78];
  uint64_t v7 = [MEMORY[0x263F33F78] coordinationBundleID];
  int v8 = [v6 userDefaultsForIdentifer:v7];

  double v9 = [v4 isFastFoldEnabled];
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x263F33DC8];
    id v11 = [v8 objectForKey:*MEMORY[0x263F33DC8]];
    uint64_t v12 = v11;
    if (!v11 || ([v11 isEqual:v9] & 1) == 0)
    {
      uint64_t v13 = COCoreLogForCategory(1);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        long long v20 = v9;
        _os_log_impl(&dword_2217C1000, v13, OS_LOG_TYPE_DEFAULT, "Received an updated bag value for fast fold %@. Writing to prefs", (uint8_t *)&v19, 0xCu);
      }

      [v8 setObject:v9 forKey:v10];
    }
  }
  uint64_t v14 = [v4 isIPDiffingEnabled];
  if (v14)
  {
    uint64_t v15 = *MEMORY[0x263F33DD0];
    uint64_t v16 = [v8 objectForKey:*MEMORY[0x263F33DD0]];
    id v17 = v16;
    if (!v16 || ([v16 isEqual:v14] & 1) == 0)
    {
      long long v18 = COCoreLogForCategory(1);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        long long v20 = v14;
        _os_log_impl(&dword_2217C1000, v18, OS_LOG_TYPE_DEFAULT, "Received an updated bag value for ip diffing %@. Writing to prefs", (uint8_t *)&v19, 0xCu);
      }

      [v8 setObject:v14 forKey:v15];
    }
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (double)pingMinimum
{
  return self->_pingMinimum;
}

- (double)pingMaximum
{
  return self->_pingMaximum;
}

- (COHomeKitAdapter)hkAdapter
{
  return self->_hkAdapter;
}

- (NSOrderedSet)services
{
  return self->_services;
}

- (NSArray)alwaysAssert
{
  return self->_alwaysAssert;
}

- (NSMapTable)assertions
{
  return self->_assertions;
}

- (COClusterAliasManager)aliasManager
{
  return self->_aliasManager;
}

- (COIDSServerBag)idsServerBag
{
  return self->_idsServerBag;
}

- (void)setIdsServerBag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsServerBag, 0);
  objc_storeStrong((id *)&self->_aliasManager, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_alwaysAssert, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_hkAdapter, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __43__COCoordinationService__continueMigration__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "Migrating timers failed (%@)", v1, 0xCu);
}

void __43__COCoordinationService__continueMigration__block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_2217C1000, v0, OS_LOG_TYPE_ERROR, "Migrating alarms failed (%@)", v1, 0xCu);
}

- (void)_linkServicesToMeshController:withClusterIdentifier:forClusters:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_2217C1000, v1, OS_LOG_TYPE_DEBUG, "%p services: %@", v2, 0x16u);
}

- (void)waitForClusterBootstrap:completion:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_2217C1000, v1, OS_LOG_TYPE_ERROR, "%p no assertion for Cluster %@, invoking bootstrap block inline", v2, 0x16u);
}

@end