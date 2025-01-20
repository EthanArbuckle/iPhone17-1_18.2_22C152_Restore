@interface BRCContainerScheduler
- (BRCAccountSession)session;
- (BRCContainerMetadataSyncPersistedState)containerMetadataPersistedState;
- (BRCContainerScheduler)initWithAccountSession:(id)a3 pushWorkloop:(id)a4;
- (BRCDeadlineScheduler)syncScheduler;
- (BRCSideCarSyncPersistedState)sideCarSyncPersistedState;
- (BRCSyncBudgetThrottle)syncUpBudget;
- (BRCZoneHealthSyncPersistedState)zoneHealthSyncPersistedState;
- (id)_newSyncDeadlineSourceWithName:(id)a3;
- (id)internalZoneSyncDownAnalyticsErrors;
- (id)internalZoneSyncUpAnalyticsErrors;
- (void)_connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)_printSyncErrorIfNecessaryWithThrottle:(id)a3 context:(id)a4 error:(id)a5 now:(int64_t)a6;
- (void)_scheduleAfterFlush:(id)a3;
- (void)_scheduleCrossZoneMovePCSPrep;
- (void)_scheduleUpdatePushTopicsRegistration;
- (void)_syncScheduleForContainersMetadata;
- (void)_syncScheduleForSharedDatabase;
- (void)_syncScheduleForSideCar;
- (void)_syncScheduleForZoneHealth;
- (void)_unscheduleClientZone:(id)a3;
- (void)_updatePushTopicsRegistration;
- (void)close;
- (void)closeContainers;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)didChangeSyncStatusForContainerMetadataForContainer:(id)a3;
- (void)didChangeSyncStatusForZoneHealthForContainer:(id)a3;
- (void)didInitialSyncDownForClientZone:(id)a3;
- (void)dumpToContext:(id)a3 includeAllItems:(BOOL)a4 db:(id)a5;
- (void)enablePushNotifications;
- (void)finishedZoneHealthSyncDownWithRequestID:(unint64_t)a3 error:(id)a4;
- (void)notifyAfterNextZoneHealthSyncDown:(id)a3;
- (void)receivedUpdatedSideCarServerChangeToken:(id)a3 requestID:(unint64_t)a4;
- (void)receivedUpdatedZoneHealthServerChangeToken:(id)a3 requestID:(unint64_t)a4;
- (void)redoZonePCSPreperation;
- (void)resume;
- (void)schedulePeriodicSyncInGroup:(id)a3 completion:(id)a4;
- (void)scheduleSyncDownForContainerMetadataWithGroup:(id)a3;
- (void)scheduleSyncDownForSharedDatabaseImmediately:(BOOL)a3;
- (void)scheduleSyncDownForSideCarWithGroup:(id)a3;
- (void)scheduleSyncDownForZoneHealthWithGroup:(id)a3;
- (void)scheduleSyncUpForSideCar;
- (void)setup;
- (void)syncContextDidBecomeBackground:(id)a3;
- (void)syncContextDidBecomeForeground:(id)a3;
@end

@implementation BRCContainerScheduler

- (BRCContainerScheduler)initWithAccountSession:(id)a3 pushWorkloop:(id)a4
{
  id v86 = a3;
  id v85 = a4;
  v103.receiver = self;
  v103.super_class = (Class)BRCContainerScheduler;
  v7 = [(BRCContainerScheduler *)&v103 init];
  if (v7)
  {
    v8 = +[BRCUserDefaults defaultsForMangledID:0];
    objc_initWeak(&location, v7);
    p_session = (id *)&v7->_session;
    objc_storeStrong((id *)&v7->_session, a3);
    v10 = [(BRCAccountSession *)v7->_session clientState];
    v11 = [v10 objectForKeyedSubscript:@"syncUpBudget"];
    syncUpBudget = v7->_syncUpBudget;
    v7->_syncUpBudget = v11;

    v13 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = v13;
    }
    else
    {
      v14 = objc_alloc_init(BRCSyncBudgetThrottle);

      objc_storeStrong((id *)&v7->_syncUpBudget, v14);
      v15 = v7->_syncUpBudget;
      v16 = [*p_session clientState];
      [v16 setObject:v15 forKeyedSubscript:@"syncUpBudget"];
    }
    v17 = [BRCDeadlineScheduler alloc];
    v18 = [*p_session fairClientDBScheduler];
    uint64_t v19 = [(BRCDeadlineScheduler *)v17 initWithName:@"com.apple.brc.sync" fairScheduler:v18];
    syncScheduler = v7->_syncScheduler;
    v7->_syncScheduler = (BRCDeadlineScheduler *)v19;

    v21 = [v8 syncUpThrottle];
    [v21 minWait];
    [(BRCDeadlineScheduler *)v7->_syncScheduler setCoalescingLeeway:brc_interval_to_nsec() / 10];

    v99[0] = MEMORY[0x1E4F143A8];
    v99[1] = 3221225472;
    v99[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke;
    v99[3] = &unk_1E6996708;
    v22 = v14;
    v100 = v22;
    id v23 = v8;
    id v101 = v23;
    [(BRCDeadlineScheduler *)v7->_syncScheduler setComputeNextAdmissibleDateForScheduling:v99];
    uint64_t v24 = [(BRCContainerScheduler *)v7 _newSyncDeadlineSourceWithName:@"metadata-sync"];
    v83 = v22;
    v84 = v23;
    containerMetadataSyncSource = v7->_containerMetadataSyncSource;
    v7->_containerMetadataSyncSource = (BRCDeadlineSource *)v24;

    v26 = v7->_containerMetadataSyncSource;
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_10;
    v97[3] = &unk_1E6993C50;
    objc_copyWeak(&v98, &location);
    [(BRCDeadlineSource *)v26 setEventHandler:v97];
    v27 = [BRCSyncOperationThrottle alloc];
    v28 = [MEMORY[0x1E4F594E8] containerMetadataMangledID];
    uint64_t v29 = [(BRCSyncOperationThrottle *)v27 initWithMangledID:v28 isSyncDown:1];
    containerMetadataSyncDownThrottle = v7->_containerMetadataSyncDownThrottle;
    v7->_containerMetadataSyncDownThrottle = (BRCSyncOperationThrottle *)v29;

    v31 = [BRCSyncOperationThrottle alloc];
    v32 = [MEMORY[0x1E4F594E8] containerMetadataMangledID];
    uint64_t v33 = [(BRCSyncOperationThrottle *)v31 initWithMangledID:v32 isSyncDown:0];
    containerMetadataSyncUpThrottle = v7->_containerMetadataSyncUpThrottle;
    v7->_containerMetadataSyncUpThrottle = (BRCSyncOperationThrottle *)v33;

    uint64_t v35 = [(BRCContainerScheduler *)v7 _newSyncDeadlineSourceWithName:@"shared-db-sync"];
    sharedDatabaseSyncSource = v7->_sharedDatabaseSyncSource;
    v7->_sharedDatabaseSyncSource = (BRCDeadlineSource *)v35;

    v37 = v7->_sharedDatabaseSyncSource;
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_2;
    v95[3] = &unk_1E6993C50;
    objc_copyWeak(&v96, &location);
    [(BRCDeadlineSource *)v37 setEventHandler:v95];
    v38 = [BRCSyncOperationThrottle alloc];
    v39 = [MEMORY[0x1E4F594E8] sharedDatabaseMangledID];
    uint64_t v40 = [(BRCSyncOperationThrottle *)v38 initWithMangledID:v39 isSyncDown:1];
    sharedDatabaseSyncDownThrottle = v7->_sharedDatabaseSyncDownThrottle;
    v7->_sharedDatabaseSyncDownThrottle = (BRCSyncOperationThrottle *)v40;

    uint64_t v42 = [(BRCContainerScheduler *)v7 _newSyncDeadlineSourceWithName:@"zone-health-sync"];
    zoneHealthSyncSource = v7->_zoneHealthSyncSource;
    v7->_zoneHealthSyncSource = (BRCDeadlineSource *)v42;

    v44 = v7->_zoneHealthSyncSource;
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_3;
    v93[3] = &unk_1E6993C50;
    objc_copyWeak(&v94, &location);
    [(BRCDeadlineSource *)v44 setEventHandler:v93];
    v45 = [BRCSyncOperationThrottle alloc];
    v46 = [MEMORY[0x1E4F594E8] zoneHealthMangledID];
    uint64_t v47 = [(BRCSyncOperationThrottle *)v45 initWithMangledID:v46 isSyncDown:0];
    zoneHealthSyncUpThrottle = v7->_zoneHealthSyncUpThrottle;
    v7->_zoneHealthSyncUpThrottle = (BRCSyncOperationThrottle *)v47;

    v49 = [BRCSyncOperationThrottle alloc];
    v50 = [MEMORY[0x1E4F594E8] zoneHealthMangledID];
    uint64_t v51 = [(BRCSyncOperationThrottle *)v49 initWithMangledID:v50 isSyncDown:1];
    zoneHealthSyncDownThrottle = v7->_zoneHealthSyncDownThrottle;
    v7->_zoneHealthSyncDownThrottle = (BRCSyncOperationThrottle *)v51;

    uint64_t v53 = [(BRCContainerScheduler *)v7 _newSyncDeadlineSourceWithName:@"migrate-pcs-sync"];
    migrateZonePCSSource = v7->_migrateZonePCSSource;
    v7->_migrateZonePCSSource = (BRCDeadlineSource *)v53;

    v55 = v7->_migrateZonePCSSource;
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_4;
    v91[3] = &unk_1E6993C50;
    objc_copyWeak(&v92, &location);
    [(BRCDeadlineSource *)v55 setEventHandler:v91];
    uint64_t v56 = [(BRCContainerScheduler *)v7 _newSyncDeadlineSourceWithName:@"side-car-sync"];
    sideCarSyncSource = v7->_sideCarSyncSource;
    v7->_sideCarSyncSource = (BRCDeadlineSource *)v56;

    v58 = v7->_sideCarSyncSource;
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_5;
    v89[3] = &unk_1E6993C50;
    objc_copyWeak(&v90, &location);
    [(BRCDeadlineSource *)v58 setEventHandler:v89];
    v59 = [BRCSyncOperationThrottle alloc];
    v60 = [MEMORY[0x1E4F594E8] sideCarMangledID];
    uint64_t v61 = [(BRCSyncOperationThrottle *)v59 initWithMangledID:v60 isSyncDown:0];
    sideCarSyncUpThrottle = v7->_sideCarSyncUpThrottle;
    v7->_sideCarSyncUpThrottle = (BRCSyncOperationThrottle *)v61;

    v63 = [BRCSyncOperationThrottle alloc];
    v64 = [MEMORY[0x1E4F594E8] sideCarMangledID];
    uint64_t v65 = [(BRCSyncOperationThrottle *)v63 initWithMangledID:v64 isSyncDown:1];
    sideCarSyncDownThrottle = v7->_sideCarSyncDownThrottle;
    v7->_sideCarSyncDownThrottle = (BRCSyncOperationThrottle *)v65;

    v67 = +[BRCAccountsManager sharedManager];
    v7->_isInSyncBubble = [v67 isInSyncBubble];

    LODWORD(v67) = v7->_isInSyncBubble;
    objc_storeStrong((id *)&v7->_pushWorkloop, a4);
    if (!v67)
    {
      v68 = [BRCFairSource alloc];
      v69 = [*p_session fairClientDBScheduler];
      uint64_t v70 = [(BRCFairSource *)v68 initWithName:@"push" scheduler:v69];
      pushSource = v7->_pushSource;
      v7->_pushSource = (BRCFairSource *)v70;

      [(BRCFairSource *)v7->_pushSource setWorkloop:v7->_pushWorkloop];
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_6;
      v87[3] = &unk_1E6993C50;
      objc_copyWeak(&v88, &location);
      [(BRCFairSource *)v7->_pushSource setEventHandler:v87];
      v72 = brc_bread_crumbs();
      v73 = brc_default_log();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
        -[BRCContainerScheduler initWithAccountSession:pushWorkloop:]();
      }

      objc_destroyWeak(&v88);
    }
    uint64_t v74 = +[BRCPersistedState loadFromClientStateInSession:*p_session];
    containerMetadataPersistedState = v7->_containerMetadataPersistedState;
    v7->_containerMetadataPersistedState = (BRCContainerMetadataSyncPersistedState *)v74;

    uint64_t v76 = +[BRCPersistedState loadFromClientStateInSession:v7->_session];
    zoneHealthPersistedState = v7->_zoneHealthPersistedState;
    v7->_zoneHealthPersistedState = (BRCZoneHealthSyncPersistedState *)v76;

    uint64_t v78 = +[BRCPersistedState loadFromClientStateInSession:v7->_session];
    sideCarSyncPersistedState = v7->_sideCarSyncPersistedState;
    v7->_sideCarSyncPersistedState = (BRCSideCarSyncPersistedState *)v78;

    v80 = [[BRCPeriodicSyncScheduler alloc] initWithContainerScheduler:v7 session:v7->_session];
    periodicSyncScheduler = v7->_periodicSyncScheduler;
    v7->_periodicSyncScheduler = v80;

    objc_destroyWeak(&v90);
    objc_destroyWeak(&v92);
    objc_destroyWeak(&v94);
    objc_destroyWeak(&v96);
    objc_destroyWeak(&v98);

    objc_destroyWeak(&location);
  }

  return v7;
}

uint64_t __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  v3 = *(void **)(a1 + 32);
  brc_interval_from_nsec();
  objc_msgSend(v3, "updateForTime:");
  [*v2 availableBudgetWithDefaults:v2[1]];
  float v5 = v4;
  [v2[1] syncUpMinimalBudget];
  if (v5 >= v6) {
    return 0;
  }
  v7 = brc_bread_crumbs();
  v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) nextDateWithBudgetWithDefaults:*(void *)(a1 + 40)];
  return brc_interval_to_nsec();
}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncScheduleForContainersMetadata];
}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncScheduleForSharedDatabase];
}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncScheduleForZoneHealth];
}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleCrossZoneMovePCSPrep];
}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncScheduleForSideCar];
}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePushTopicsRegistration];
}

- (void)enablePushNotifications
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Enabling push topics registration%@", v2, v3, v4, v5, v6);
}

- (id)_newSyncDeadlineSourceWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [BRCDeadlineSource alloc];
  uint8_t v6 = [(BRCAccountSession *)self->_session defaultScheduler];
  v7 = [(BRCDeadlineSource *)v5 initWithScheduler:v6 name:v4];

  v8 = [(BRCDeadlineScheduler *)self->_syncScheduler workloop];
  [(BRCDeadlineSource *)v7 setWorkloop:v8];

  return v7;
}

- (void)_unscheduleClientZone:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setDelegate:0];
  uint64_t v5 = [v4 syncDeadlineSource];
  [v5 cancel];

  if ([v4 isPrivateZone])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v16 = v4;
    uint8_t v6 = [v4 asPrivateClientZone];
    v7 = [v6 appLibraries];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          v13 = brc_bread_crumbs();
          v14 = brc_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v22 = v12;
            __int16 v23 = 2112;
            uint64_t v24 = v13;
            _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] unscheduling app library %@%@", buf, 0x16u);
          }

          v15 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
          [v15 unscheduleAppLibraryForLostScan:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v9);
    }

    id v4 = v16;
  }
}

- (void)closeContainers
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx shutting down periodic metadata sync%@");
}

void __40__BRCContainerScheduler_closeContainers__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) cancel];
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  if (v2)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 320, &v17);
    uint64_t v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __40__BRCContainerScheduler_closeContainers__block_invoke_cold_5();
    }

    [v2 cancel];
    [*(id *)(a1 + 40) addObject:v2];
    __brc_leave_section(&v17);
  }
  [*(id *)(*(void *)(a1 + 32) + 24) cancel];
  id v5 = *(id *)(*(void *)(a1 + 32) + 152);

  if (v5)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 327, &v17);
    uint8_t v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __40__BRCContainerScheduler_closeContainers__block_invoke_cold_4();
    }

    [v5 cancel];
    [*(id *)(a1 + 40) addObject:v5];
    __brc_leave_section(&v17);
  }
  [*(id *)(*(void *)(a1 + 32) + 32) cancel];
  id v8 = *(id *)(*(void *)(a1 + 32) + 192);

  if (v8)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 334, &v17);
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __40__BRCContainerScheduler_closeContainers__block_invoke_cold_3();
    }

    [v8 cancel];
    [*(id *)(a1 + 40) addObject:v8];
    __brc_leave_section(&v17);
  }
  [*(id *)(*(void *)(a1 + 32) + 312) cancel];
  id v11 = *(id *)(*(void *)(a1 + 32) + 304);

  if (v11)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 341, &v17);
    uint64_t v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __40__BRCContainerScheduler_closeContainers__block_invoke_cold_2();
    }

    [v11 cancel];
    [*(id *)(a1 + 40) addObject:v11];
    __brc_leave_section(&v17);
  }
  [*(id *)(*(void *)(a1 + 32) + 40) cancel];
  id v14 = *(id *)(*(void *)(a1 + 32) + 248);

  if (v14)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 348, &v17);
    v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __40__BRCContainerScheduler_closeContainers__block_invoke_cold_1();
    }

    [v14 cancel];
    [*(id *)(a1 + 40) addObject:v14];
    __brc_leave_section(&v17);
  }
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_37(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 296);
  if (v2)
  {
    memset(v7, 0, sizeof(v7));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler closeContainers]_block_invoke", 358, v7);
    uint64_t v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __40__BRCContainerScheduler_closeContainers__block_invoke_37_cold_1();
    }

    [v2 cancel];
    [*(id *)(a1 + 40) addObject:v2];
    __brc_leave_section(v7);
  }
  id v5 = [*(id *)(a1 + 32) session];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__BRCContainerScheduler_closeContainers__block_invoke_38;
  v6[3] = &unk_1E6994828;
  v6[4] = *(void *)(a1 + 32);
  [v5 enumerateClientZones:v6];
}

uint64_t __40__BRCContainerScheduler_closeContainers__block_invoke_38(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __40__BRCContainerScheduler_closeContainers__block_invoke_38_cold_1((uint64_t)v3);
  }

  [*(id *)(a1 + 32) _unscheduleClientZone:v3];
  return 1;
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_40(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) cancel];
  [*(id *)(*(void *)(a1 + 32) + 72) setEnabledTopics:MEMORY[0x1E4F1CBF0] ignoredTopics:MEMORY[0x1E4F1CBF0] opportunisticTopics:MEMORY[0x1E4F1CBF0]];
  [*(id *)(*(void *)(a1 + 32) + 72) shutdown];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 72);
  *(void *)(v2 + 72) = 0;
}

- (void)close
{
  id v3 = [(BRCDeadlineScheduler *)self->_syncScheduler workloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__BRCContainerScheduler_close__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

  syncScheduler = self->_syncScheduler;
  self->_syncScheduler = 0;
}

void __30__BRCContainerScheduler_close__block_invoke(uint64_t a1)
{
  id v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(v2 + 8) personaIdentifier];
  id v4 = BRPersonaSpecificName();
  [v22 removeObserver:v2 name:v4 object:0];

  uint64_t v5 = *(void *)(a1 + 32);
  uint8_t v6 = [*(id *)(v5 + 8) personaIdentifier];
  v7 = BRPersonaSpecificName();
  [v22 removeObserver:v5 name:v7 object:0];

  [*(id *)(*(void *)(a1 + 32) + 288) close];
  [*(id *)(*(void *)(a1 + 32) + 344) _close];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = 0;

  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = 0;

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  v15 = *(void **)(v14 + 312);
  *(void *)(v14 + 312) = 0;

  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0;

  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 288);
  *(void *)(v18 + 288) = 0;

  uint64_t v20 = *(void *)(a1 + 32);
  v21 = *(void **)(v20 + 8);
  *(void *)(v20 + 8) = 0;
}

- (void)setup
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx loading containers%@");
}

- (void)schedulePeriodicSyncInGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  uint64_t v8 = [(BRCAccountSession *)self->_session clientDB];
  [v8 assertOnQueue];

  if (self->_periodicSyncOperation)
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationAlreadyRunning:", @"Periodic Sync");
    v7[2](v7, v9);
  }
  else
  {
    memset(v21, 0, sizeof(v21));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler schedulePeriodicSyncInGroup:completion:]", 458, v21);
    uint64_t v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCContainerScheduler schedulePeriodicSyncInGroup:completion:]();
    }

    uint64_t v12 = [BRCPeriodicSyncOperation alloc];
    v13 = [(BRCContainerMetadataSyncPersistedState *)self->_containerMetadataPersistedState serverChangeToken];
    uint64_t v14 = [(BRCZoneHealthSyncPersistedState *)self->_zoneHealthPersistedState serverChangeToken];
    v15 = [(BRCSideCarSyncPersistedState *)self->_sideCarSyncPersistedState serverChangeToken];
    uint64_t v16 = [(BRCPeriodicSyncOperation *)v12 initWithContainerScheduler:self metadataChangeToken:v13 zoneHealthChangeToken:v14 sideCarChangeToken:v15 sessionContext:self->_session];

    uint64_t v17 = [(_BRCOperation *)v16 callbackQueue];
    uint64_t v18 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
    dispatch_set_target_queue(v17, v18);

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __64__BRCContainerScheduler_schedulePeriodicSyncInGroup_completion___block_invoke;
    v19[3] = &unk_1E6996730;
    v19[4] = self;
    uint64_t v20 = v7;
    [(_BRCOperation *)v16 setFinishBlock:v19];
    [(_BRCOperation *)v16 setGroup:v6];
    objc_storeStrong((id *)&self->_periodicSyncOperation, v16);
    [(_BRCOperation *)v16 schedule];
    [(BRCContainerScheduler *)self scheduleSyncDownForSharedDatabaseImmediately:0];

    __brc_leave_section(v21);
  }
}

void __64__BRCContainerScheduler_schedulePeriodicSyncInGroup_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __64__BRCContainerScheduler_schedulePeriodicSyncInGroup_completion___block_invoke_cold_1((uint64_t)v4);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 296);
  *(void *)(v7 + 296) = 0;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resume
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Sync: resuming sync%@", v2, v3, v4, v5, v6);
}

uint64_t __31__BRCContainerScheduler_resume__block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 containerMetadataNeedsSyncUp];
  if (v3) {
    *(_DWORD *)(*(void *)(a1 + 32) + 96) |= 1u;
  }
  return v3 ^ 1u;
}

uint64_t __31__BRCContainerScheduler_resume__block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = [a2 zoneHealthNeedsSyncUp];
  if (v3) {
    *(_DWORD *)(*(void *)(a1 + 32) + 184) |= 1u;
  }
  return v3 ^ 1u;
}

- (void)didInitialSyncDownForClientZone:(id)a3
{
  id v4 = a3;
  if ([v4 isCloudDocsZone])
  {
    memset(v8, 0, sizeof(v8));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler didInitialSyncDownForClientZone:]", 540, v8);
    uint64_t v5 = brc_bread_crumbs();
    uint8_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCContainerScheduler didInitialSyncDownForClientZone:]();
    }

    uint64_t v7 = [(BRCContainerScheduler *)self session];
    [v7 markAccountMigrationComplete];

    __brc_leave_section(v8);
  }
}

- (void)scheduleSyncDownForContainerMetadataWithGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCDeadlineScheduler *)self->_syncScheduler workloop];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__BRCContainerScheduler_scheduleSyncDownForContainerMetadataWithGroup___block_invoke;
  uint64_t v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_with_logs_6(v5, v7);
}

uint64_t __71__BRCContainerScheduler_scheduleSyncDownForContainerMetadataWithGroup___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  int v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __71__BRCContainerScheduler_scheduleSyncDownForContainerMetadataWithGroup___block_invoke_cold_1();
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 96) |= 2u;
  [*(id *)(*(void *)(a1 + 32) + 88) setNeedsContainerMetadataSyncDown:1];
  [*(id *)(*(void *)(a1 + 32) + 88) setCkGroup:*(void *)(a1 + 40)];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  [v4 forceBatchStart];

  return [*(id *)(*(void *)(a1 + 32) + 16) signal];
}

- (void)scheduleSyncDownForSharedDatabaseImmediately:(BOOL)a3
{
  uint64_t v5 = [(BRCDeadlineScheduler *)self->_syncScheduler workloop];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__BRCContainerScheduler_scheduleSyncDownForSharedDatabaseImmediately___block_invoke;
  v6[3] = &unk_1E6996758;
  BOOL v7 = a3;
  v6[4] = self;
  dispatch_async_with_logs_6(v5, v6);
}

uint64_t __70__BRCContainerScheduler_scheduleSyncDownForSharedDatabaseImmediately___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = 0;
  }
  else
  {
    int v3 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v2 = [v3 sharedDbSyncDownCoalesceNanoseconds];
  }
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __70__BRCContainerScheduler_scheduleSyncDownForSharedDatabaseImmediately___block_invoke_cold_1();
  }

  uint64_t v6 = brc_current_date_nsec() + v2;
  *(_DWORD *)(*(void *)(a1 + 32) + 144) |= 2u;
  [*(id *)(*(void *)(a1 + 32) + 88) setNeedsSharedDBSyncDown:1];
  BOOL v7 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  [v7 forceBatchStart];

  return [*(id *)(*(void *)(a1 + 32) + 24) signalWithDeadline:v6];
}

- (void)scheduleSyncDownForZoneHealthWithGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCDeadlineScheduler *)self->_syncScheduler workloop];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__BRCContainerScheduler_scheduleSyncDownForZoneHealthWithGroup___block_invoke;
  uint64_t v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_with_logs_6(v5, v7);
}

uint64_t __64__BRCContainerScheduler_scheduleSyncDownForZoneHealthWithGroup___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  int v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __64__BRCContainerScheduler_scheduleSyncDownForZoneHealthWithGroup___block_invoke_cold_1();
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 184) |= 2u;
  [*(id *)(*(void *)(a1 + 32) + 176) setNeedsSyncDown:1];
  [*(id *)(*(void *)(a1 + 32) + 176) setCkGroup:*(void *)(a1 + 40)];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  [v4 forceBatchStart];

  return [*(id *)(*(void *)(a1 + 32) + 32) signal];
}

- (void)scheduleSyncDownForSideCarWithGroup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCDeadlineScheduler *)self->_syncScheduler workloop];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__BRCContainerScheduler_scheduleSyncDownForSideCarWithGroup___block_invoke;
  uint64_t v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_with_logs_6(v5, v7);
}

uint64_t __61__BRCContainerScheduler_scheduleSyncDownForSideCarWithGroup___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  int v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __61__BRCContainerScheduler_scheduleSyncDownForSideCarWithGroup___block_invoke_cold_1();
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 240) |= 2u;
  [*(id *)(*(void *)(a1 + 32) + 232) setNeedsSync:1];
  [*(id *)(*(void *)(a1 + 32) + 232) setCkGroup:*(void *)(a1 + 40)];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  [v4 forceBatchStart];

  return [*(id *)(*(void *)(a1 + 32) + 40) signal];
}

- (void)redoZonePCSPreperation
{
  int v3 = [(BRCDeadlineScheduler *)self->_syncScheduler workloop];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__BRCContainerScheduler_redoZonePCSPreperation__block_invoke;
  v4[3] = &unk_1E6993698;
  v4[4] = self;
  dispatch_async_with_logs_6(v3, v4);
}

uint64_t __47__BRCContainerScheduler_redoZonePCSPreperation__block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  int v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __47__BRCContainerScheduler_redoZonePCSPreperation__block_invoke_cold_1();
  }

  [*(id *)(*(void *)(a1 + 32) + 8) setNeedsPCSMigration:1];
  return [*(id *)(*(void *)(a1 + 32) + 312) signal];
}

- (void)scheduleSyncUpForSideCar
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] marking side-car needs-sync-up%@", v2, v3, v4, v5, v6);
}

- (void)didChangeSyncStatusForZoneHealthForContainer:(id)a3
{
  uint64_t v4 = [(BRCDeadlineScheduler *)self->_syncScheduler workloop];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__BRCContainerScheduler_didChangeSyncStatusForZoneHealthForContainer___block_invoke;
  v5[3] = &unk_1E6993698;
  v5[4] = self;
  dispatch_async_with_logs_6(v4, v5);
}

uint64_t __70__BRCContainerScheduler_didChangeSyncStatusForZoneHealthForContainer___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __70__BRCContainerScheduler_didChangeSyncStatusForZoneHealthForContainer___block_invoke_cold_1();
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 184) |= 1u;
  return [*(id *)(*(void *)(a1 + 32) + 32) signal];
}

- (void)didChangeSyncStatusForContainerMetadataForContainer:(id)a3
{
  uint64_t v4 = [(BRCDeadlineScheduler *)self->_syncScheduler workloop];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__BRCContainerScheduler_didChangeSyncStatusForContainerMetadataForContainer___block_invoke;
  v5[3] = &unk_1E6993698;
  v5[4] = self;
  dispatch_async_with_logs_6(v4, v5);
}

uint64_t __77__BRCContainerScheduler_didChangeSyncStatusForContainerMetadataForContainer___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __77__BRCContainerScheduler_didChangeSyncStatusForContainerMetadataForContainer___block_invoke_cold_1();
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 96) |= 1u;
  return [*(id *)(*(void *)(a1 + 32) + 16) signal];
}

- (void)_scheduleAfterFlush:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__BRCContainerScheduler__scheduleAfterFlush___block_invoke;
  uint64_t v7[3] = &unk_1E6993CF0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 scheduleFlushWithCheckpoint:0 whenFlushed:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __45__BRCContainerScheduler__scheduleAfterFlush___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[43] workloop];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__BRCContainerScheduler__scheduleAfterFlush___block_invoke_2;
    v6[3] = &unk_1E69952C0;
    id v5 = *(id *)(a1 + 32);
    v6[4] = v3;
    id v7 = v5;
    dispatch_async(v4, v6);
  }
}

uint64_t __45__BRCContainerScheduler__scheduleAfterFlush___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_syncScheduleForContainersMetadata
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx scheduling container-metadata sync%@");
}

void __59__BRCContainerScheduler__syncScheduleForContainersMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v35 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = 0;

  id v37 = 0;
  unint64_t v8 = objc_msgSend(v5, "brc_containerResetErrorForSharedZone:resetReason:", 0, &v37);
  unsigned int v9 = *(_DWORD *)(*(void *)(a1 + 32) + 96);
  if (v8)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F594E8]);
    id v11 = (void *)[v10 initWithZoneName:*MEMORY[0x1E4F59408] ownerName:*MEMORY[0x1E4F19C08]];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) clientZoneByMangledID:v11];
    uint64_t v13 = [v12 enhancedDrivePrivacyEnabled];
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 88) lastSyncDownDate];
    id v15 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:v11 enhancedDrivePrivacyEnabled:v13 lastSyncDate:v14 error:v5 errorDescription:v37];

    uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 8) analyticsReporter];
    [v16 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v15];

    memset(v36, 0, sizeof(v36));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler _syncScheduleForContainersMetadata]_block_invoke", 723, v36);
    uint64_t v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = v36[0];
      uint64_t v32 = BRCPrettyPrintEnum();
      *(_DWORD *)buf = 134218498;
      v39 = (__CFString *)v31;
      __int16 v40 = 2080;
      uint64_t v41 = v32;
      __int16 v42 = 2112;
      v43 = v17;
      _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx resetting container-metadata: %s%@", buf, 0x20u);
    }

    if (v8 >= 2)
    {
      [*(id *)(*(void *)(a1 + 32) + 8) enumerateAppLibraries:&__block_literal_global_20];
      v9 |= 1u;
    }
    [*(id *)(*(void *)(a1 + 32) + 88) containerMetadataWasReset];
    __brc_leave_section(v36);

    v9 |= 2u;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v25 = *(void *)(a1 + 32);
    if (isKindOfClass)
    {
      [*(id *)(v25 + 120) updateForError:v5];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), a3);
      id v26 = objc_loadWeakRetained((id *)(a1 + 40));
      id v11 = v26;
      v9 |= 0x12u;
      if (!v5 && ![v26 shouldPerformAnotherBatch]) {
        v9 &= ~1u;
      }
    }
    else
    {
      [*(id *)(v25 + 112) updateForError:v5];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), a3);
      id v27 = objc_loadWeakRetained((id *)(a1 + 40));
      id v11 = v27;
      if (!v5)
      {
        int v28 = [v27 shouldFetchAnotherBatch];
        unsigned int v29 = v9 & 0xFFFFFFCD;
        if (v28) {
          unsigned int v29 = v9;
        }
        unsigned int v9 = v29 & 0xFFFFFFCF | 0x20;
      }
    }
  }

  if ((v9 & 2) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 88) setNeedsContainerMetadataSyncDown:0];
    [*(id *)(*(void *)(a1 + 32) + 88) setHasCaughtUpAtLeastOnce:1];
    uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
    [v19 forceBatchStart];
  }
  uint64_t v20 = brc_bread_crumbs();
  v21 = brc_default_log();
  unsigned int v22 = v9 & 0xFFFFFFF3;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    if (*(_DWORD *)(*(void *)(a1 + 32) + 96))
    {
      BRCPrettyPrintBitmap();
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = @"idle";
    }
    uint64_t v33 = v30;
    if (v22)
    {
      BRCPrettyPrintBitmap();
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = @"idle";
    }
    *(_DWORD *)buf = 138412802;
    v39 = v33;
    __int16 v40 = 2112;
    uint64_t v41 = (uint64_t)v34;
    __int16 v42 = 2112;
    v43 = v20;
    _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] Container metadata sync state (%@) -> (%@)%@", buf, 0x20u);
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 96) = v22;
  [*(id *)(*(void *)(a1 + 32) + 16) signal];
}

uint64_t __59__BRCContainerScheduler__syncScheduleForContainersMetadata__block_invoke_62(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 containerMetadataEtag];

  if (v3)
  {
    [v2 setContainerMetadataEtag:0];
    [v2 setContainerMetadataNeedsSyncUp:1];
  }

  return 1;
}

uint64_t __59__BRCContainerScheduler__syncScheduleForContainersMetadata__block_invoke_64(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 104), *(id *)(a1 + 32));
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 schedule];
}

- (void)_syncScheduleForSharedDatabase
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx scheduling shared-db sync%@");
}

void __55__BRCContainerScheduler__syncScheduleForSharedDatabase__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void **)(v7 + 152);
  *(void *)(v7 + 152) = 0;

  unsigned int v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v15 = "NO";
    *(_DWORD *)uint64_t v16 = 136315650;
    if (a2) {
      id v15 = "YES";
    }
    *(void *)&v16[4] = v15;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished sharedb sync down with more coming: %s, error %@%@", v16, 0x20u);
  }

  [*(id *)(*(void *)(a1 + 32) + 160) updateForError:v6];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), a3);
  if (v6) {
    int v11 = 2;
  }
  else {
    int v11 = 32;
  }
  if (!v6 && a2)
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 144) |= 2u;
    int v11 = 32;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 144) |= v11;
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(_DWORD *)(v12 + 144);
  if ((v13 & 2) == 0)
  {
    [*(id *)(v12 + 88) setNeedsSharedDBSyncDown:0];
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
    [v14 forceBatchStart];

    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(_DWORD *)(v12 + 144);
  }
  *(_DWORD *)(v12 + 144) = v13 & 0xFFFFFFF3;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "signal", *(void *)v16);
}

- (void)_syncScheduleForZoneHealth
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx scheduling zone-health sync%@");
}

void __51__BRCContainerScheduler__syncScheduleForZoneHealth__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 344) workloop];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void **)(v7 + 192);
  *(void *)(v7 + 192) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = *(id *)(*(void *)(a1 + 32) + 328);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v34;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v33 + 1) + 8 * v14++) + 16))();
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v12);
    }

    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(v15 + 328);
    *(void *)(v15 + 328) = 0;
  }
  id v32 = 0;
  if (objc_msgSend(v5, "brc_containerResetErrorForSharedZone:resetReason:", 0, &v32))
  {
    __int16 v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Resetting zone health%@", buf, 0xCu);
    }

    id v19 = objc_alloc(MEMORY[0x1E4F594E8]);
    uint64_t v20 = (void *)[v19 initWithZoneName:*MEMORY[0x1E4F59480] ownerName:*MEMORY[0x1E4F19C08]];
    uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 8) clientZoneByMangledID:v20];
    uint64_t v22 = [v21 enhancedDrivePrivacyEnabled];
    __int16 v23 = [*(id *)(*(void *)(a1 + 32) + 176) lastSyncDownDate];
    id v24 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:v20 enhancedDrivePrivacyEnabled:v22 lastSyncDate:v23 error:v5 errorDescription:v32];

    uint64_t v25 = [*(id *)(*(void *)(a1 + 32) + 8) analyticsReporter];
    [v25 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v24];

    [*(id *)(*(void *)(a1 + 32) + 8) enumeratePrivateClientZones:&__block_literal_global_80];
    [*(id *)(*(void *)(a1 + 32) + 176) zoneHealthWasReset];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(*(void *)(a1 + 32) + 200) updateForError:v5];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 216), a3);
      uint64_t v26 = *(void *)(a1 + 32);
      int v27 = *(_DWORD *)(v26 + 184);
      if (v5)
      {
        unsigned int v28 = v27 | 2;
      }
      else
      {
        *(_DWORD *)(v26 + 184) = v27 | 0x20;
        uint64_t v26 = *(void *)(a1 + 32);
        unsigned int v28 = *(_DWORD *)(v26 + 184) & 0xFFFFFFEF;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_24;
      }
      [*(id *)(*(void *)(a1 + 32) + 208) updateForError:v5];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 224), a3);
      uint64_t v26 = *(void *)(a1 + 32);
      int v29 = *(_DWORD *)(v26 + 184);
      if (v5)
      {
        unsigned int v28 = v29 | 0x13;
      }
      else
      {
        *(_DWORD *)(v26 + 184) = v29 | 0x10;
        if (![WeakRetained shouldPerformAnotherBatch]) {
          goto LABEL_24;
        }
        uint64_t v26 = *(void *)(a1 + 32);
        unsigned int v28 = *(_DWORD *)(v26 + 184) | 1;
      }
    }
    *(_DWORD *)(v26 + 184) = v28;
  }
LABEL_24:
  *(_DWORD *)(*(void *)(a1 + 32) + 184) &= 0xFFFFFFF3;
  uint64_t v30 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v30 + 184) & 2) == 0)
  {
    [*(id *)(v30 + 176) setNeedsSyncDown:0];
    uint64_t v31 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
    [v31 forceBatchStart];

    uint64_t v30 = *(void *)(a1 + 32);
  }
  [*(id *)(v30 + 32) signal];
}

uint64_t __51__BRCContainerScheduler__syncScheduleForZoneHealth__block_invoke_78(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __51__BRCContainerScheduler__syncScheduleForZoneHealth__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 192), *(id *)(a1 + 32));
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 schedule];
}

- (void)_syncScheduleForSideCar
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx scheduling side-car sync%@");
}

void __48__BRCContainerScheduler__syncScheduleForSideCar__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 344) workloop];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(void **)(v7 + 248);
  *(void *)(v7 + 248) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v25 = 0;
  if (objc_msgSend(v5, "brc_containerResetErrorForSharedZone:resetReason:", 0, &v25))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F594E8]);
    uint64_t v11 = (void *)[v10 initWithZoneName:*MEMORY[0x1E4F596D8] ownerName:*MEMORY[0x1E4F19C08]];
    uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) clientZoneByMangledID:v11];
    uint64_t v13 = [v12 enhancedDrivePrivacyEnabled];
    uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 232) lastSyncDownDate];
    id v15 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:v11 enhancedDrivePrivacyEnabled:v13 lastSyncDate:v14 error:v5 errorDescription:v25];

    uint64_t v16 = [*(id *)(*(void *)(a1 + 32) + 8) analyticsReporter];
    [v16 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v15];

    __int16 v17 = [*(id *)(*(void *)(a1 + 32) + 8) serverTruthWorkloop];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __48__BRCContainerScheduler__syncScheduleForSideCar__block_invoke_2;
    v24[3] = &unk_1E6993698;
    v24[4] = *(void *)(a1 + 32);
    dispatch_async_with_logs_6(v17, v24);

    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(*(void *)(a1 + 32) + 256) updateForError:v5];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 272), a3);
    uint64_t v18 = *(void *)(a1 + 32);
    int v19 = *(_DWORD *)(v18 + 240);
    if (v5)
    {
      unsigned int v20 = v19 | 2;
    }
    else
    {
      *(_DWORD *)(v18 + 240) = v19 | 0x20;
      uint64_t v18 = *(void *)(a1 + 32);
      unsigned int v20 = *(_DWORD *)(v18 + 240) & 0xFFFFFFEF;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    [*(id *)(*(void *)(a1 + 32) + 264) updateForError:v5];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 280), a3);
    uint64_t v18 = *(void *)(a1 + 32);
    int v21 = *(_DWORD *)(v18 + 240);
    if (v5)
    {
      unsigned int v20 = v21 | 0x13;
    }
    else
    {
      *(_DWORD *)(v18 + 240) = v21 | 0x10;
      if (![WeakRetained shouldPerformAnotherBatch]) {
        goto LABEL_13;
      }
      uint64_t v18 = *(void *)(a1 + 32);
      unsigned int v20 = *(_DWORD *)(v18 + 240) | 1;
    }
  }
  *(_DWORD *)(v18 + 240) = v20;
LABEL_13:
  *(_DWORD *)(*(void *)(a1 + 32) + 240) &= 0xFFFFFFF3;
  uint64_t v22 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v22 + 240) & 3) == 0)
  {
    [*(id *)(v22 + 232) setNeedsSync:0];
    __int16 v23 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
    [v23 forceBatchStart];

    uint64_t v22 = *(void *)(a1 + 32);
  }
  [*(id *)(v22 + 40) signal];
}

uint64_t __48__BRCContainerScheduler__syncScheduleForSideCar__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = v2;
    _os_log_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Resetting side car zone%@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) enumerateSharedClientZones:&__block_literal_global_89];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) serverDB];
  [v4 execute:@"DELETE FROM side_car_lookahead"];

  return [*(id *)(*(void *)(a1 + 32) + 232) sideCarZoneWasReset];
}

uint64_t __48__BRCContainerScheduler__syncScheduleForSideCar__block_invoke_86(uint64_t a1, void *a2)
{
  id v2 = [a2 serverZone];
  uint64_t v3 = [v2 asSharedZone];
  [v3 sideCarZoneWasReset];

  return 1;
}

uint64_t __48__BRCContainerScheduler__syncScheduleForSideCar__block_invoke_2_93(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 248), *(id *)(a1 + 32));
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 schedule];
}

- (void)_printSyncErrorIfNecessaryWithThrottle:(id)a3 context:(id)a4 error:(id)a5 now:(int64_t)a6
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  [v20 nextTry];
  double v11 = v10;
  brc_interval_from_nsec();
  if (v11 > v12)
  {
    [v8 pushIndentation];
    id v13 = [NSString alloc];
    if ([v20 isSyncDown]) {
      uint64_t v14 = @"down";
    }
    else {
      uint64_t v14 = @"up";
    }
    [v20 nextTry];
    double v16 = v15;
    brc_interval_from_nsec();
    uint64_t v18 = (void *)[v13 initWithFormat:@" [sync-%@ throttled (next-try:in %.01fs)] error: %@", v14, v16 - v17, v9];
    int v19 = +[BRCDumpContext highlightedString:v18 type:3 context:v8];

    [v8 writeLineWithFormat:@"%@", v19];
    [v8 popIndentation];
  }
}

- (void)dumpToContext:(id)a3 includeAllItems:(BOOL)a4 db:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v85 = +[BRCUserDefaults defaultsForMangledID:0];
  id v9 = +[BRCSystemResourcesManager manager];
  if ([v9 isNetworkReachable])
  {
    v84 = @"online";
  }
  else
  {
    v84 = +[BRCDumpContext stringFromErrorString:@"offline" context:v7];
  }
  if ([v9 isPowerOK])
  {
    v83 = @"healthy";
  }
  else
  {
    v83 = +[BRCDumpContext stringFromErrorString:@"low" context:v7];
  }
  double v10 = [(BRCAccountSession *)self->_session volume];
  char v11 = objc_msgSend(v9, "hasEnoughSpaceForDevice:", objc_msgSend(v10, "deviceID"));

  if (v11)
  {
    double v12 = @"healthy";
  }
  else
  {
    double v12 = +[BRCDumpContext stringFromErrorString:@"low disk" context:v7];
  }
  id v13 = +[BRCContainerCellularSettings containerCellularSettings];
  char v14 = [v13 isCellularEnabled];

  if (v14)
  {
    v82 = @"enabled";
  }
  else
  {
    v82 = +[BRCDumpContext stringFromErrorString:@"disabled" context:v7];
  }
  id v86 = (void *)[v8 fetchObjectOfClass:objc_opt_class() sql:@"SELECT COUNT(*) from server_items"];
  v81 = (void *)[v8 fetchObjectOfClass:objc_opt_class() sql:@"SELECT COUNT(*) from client_items"];
  BOOL v15 = (unint64_t)[v81 unsignedLongLongValue] > 0x3E8
     || (unint64_t)[v86 unsignedLongLongValue] >= 0x3E9;
  double v16 = [(BRCAccountSession *)self->_session volume];
  double v17 = [v16 freeSize];

  uint64_t v78 = v17;
  BOOL v79 = v15;
  if (v17)
  {
    uint64_t v18 = +[BRCDumpContext stringFromByteCount:showActualByteCount:suffix:context:](BRCDumpContext, "stringFromByteCount:showActualByteCount:suffix:context:", [v17 longLongValue], 0, @" available", v7);
    uint64_t v19 = [(__CFString *)v12 stringByAppendingFormat:@" %@", v18];

    double v12 = (__CFString *)v19;
  }
  id v20 = [(BRCAccountSession *)self->_session volume];
  int v21 = [v20 fsTypeName];
  uint64_t v22 = [v21 uppercaseString];
  uint64_t v23 = [v7 highlightedString:v22 type:7];

  v77 = (void *)v23;
  id v24 = [NSString stringWithFormat:@"%@ (%@)", v12, v23];

  id v25 = self;
  objc_sync_enter(v25);
  environmentName = v25->_environmentName;
  if (environmentName)
  {
    v80 = environmentName;
  }
  else
  {
    v80 = +[BRCDumpContext stringFromErrorString:@"no environment" context:v7];
  }
  int v27 = [(NSData *)v25->_pushToken description];
  unsigned int v28 = v27;
  v75 = v8;
  uint64_t v76 = v9;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    id v29 = +[BRCDumpContext stringFromErrorString:@"no token" context:v7];
  }
  uint64_t v30 = v29;

  objc_sync_exit(v25);
  uint64_t v31 = [(BRCAccountSession *)self->_session fsUploader];
  id v32 = [v31 quotaAvailableForOwner:*MEMORY[0x1E4F19C08]];

  long long v33 = [(objc_class *)getUIDeviceClass() currentDevice];
  long long v34 = [v33 name];

  [v7 writeLineWithFormat:@"system"];
  [v7 writeLineWithFormat:@"-----------------------------------------------------"];
  [v7 pushIndentation];
  [v7 writeLineWithFormat:@"+ network: %@", v84];
  [v7 writeLineWithFormat:@"+ disk:    %@", v24];
  [v7 writeLineWithFormat:@"+ power:   %@", v83];
  BOOL v35 = [(BRCAccountSession *)self->_session hasOptimizeStorageEnabled];
  long long v36 = "disabled";
  if (v35) {
    long long v36 = "enabled";
  }
  objc_msgSend(v7, "writeLineWithFormat:", @"+ optimize storage: %s", v36);
  id v37 = objc_msgSend(v34, "fp_obfuscatedFilename");
  [v7 writeLineWithFormat:@"+ device name:   %@", v37];

  [v7 writeLineWithFormat:@"+ cellular: %@", v82];
  [v7 popIndentation];
  [v7 writeLineWithFormat:&stru_1F2AC7720];
  [v7 writeLineWithFormat:@"scheduler"];
  [v7 writeLineWithFormat:@"-----------------------------------------------------"];
  [v7 pushIndentation];
  v38 = +[BRCDumpContext stringFromCount:context:](BRCDumpContext, "stringFromCount:context:", [v81 unsignedLongLongValue], v7);
  v39 = +[BRCDumpContext stringFromCount:context:](BRCDumpContext, "stringFromCount:context:", [v86 unsignedLongLongValue], v7);
  [v7 writeLineWithFormat:@"+ items:                 client:%@, server: %@", v38, v39];

  if (v79)
  {
    uint64_t v40 = +[BRCDumpContext highlightedString:@"output may be truncated" type:3 context:v7];
    [v7 writeLineWithFormat:@"                         warning: %@", v40];
  }
  [v7 writeLineWithFormat:@"+ push environment:      %@", v80];
  [v7 writeLineWithFormat:@"+ push token:            %@", v30];
  uint64_t v41 = [(BRCSyncBudgetThrottle *)v25->_syncUpBudget debugDescriptionWithDefaults:v85];
  [v7 writeLineWithFormat:@"+ global sync up budget: %@", v41];

  uint64_t v42 = [(BRCOperationSubclass *)v25->_periodicSyncOperation descriptionWithContext:v7];
  v43 = (void *)v42;
  uint64_t v44 = @"idle";
  if (v42) {
    uint64_t v44 = (__CFString *)v42;
  }
  [v7 writeLineWithFormat:@"+ periodic sync:         %@", v44];

  if (v32)
  {
    v45 = +[BRCDumpContext stringFromByteCount:context:](BRCDumpContext, "stringFromByteCount:context:", [v32 longLongValue], v7);
    v46 = [(BRCAccountSession *)self->_session fsUploader];
    int v47 = [v46 isDefaultOwnerOutOfQuota];
    v48 = @" [pending-quota]";
    if (!v47) {
      v48 = &stru_1F2AC7720;
    }
    [v7 writeLineWithFormat:@"+ available quota:       %@%@", v45, v48];
  }
  uint64_t v49 = brc_current_date_nsec();
  if (v25->_containerMetadataSyncState)
  {
    BRCPrettyPrintBitmap();
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v50 = @"idle";
  }
  uint64_t v51 = [(BRCOperationSubclass *)v25->_containerMetadataSyncOperation descriptionWithContext:v7];
  v52 = (void *)v51;
  if (v51) {
    uint64_t v53 = (__CFString *)v51;
  }
  else {
    uint64_t v53 = &stru_1F2AC7720;
  }
  [v7 writeLineWithFormat:@"+ container-metadata:    %@ %@", v50, v53];

  [(BRCContainerScheduler *)v25 _printSyncErrorIfNecessaryWithThrottle:v25->_containerMetadataSyncDownThrottle context:v7 error:v25->_lastContainerMetadataSyncDownError now:v49];
  [(BRCContainerScheduler *)v25 _printSyncErrorIfNecessaryWithThrottle:v25->_containerMetadataSyncUpThrottle context:v7 error:v25->_lastContainerMetadataSyncUpError now:v49];
  if (v25->_sharedDBSyncState)
  {
    BRCPrettyPrintBitmap();
    v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = @"idle";
  }
  uint64_t v55 = [(BRCOperationSubclass *)v25->_sharedDatabaseSyncOperation descriptionWithContext:v7];
  uint64_t v56 = (void *)v55;
  if (v55) {
    v57 = (__CFString *)v55;
  }
  else {
    v57 = &stru_1F2AC7720;
  }
  [v7 writeLineWithFormat:@"+ sharedb:               %@ %@", v54, v57];

  [(BRCContainerScheduler *)v25 _printSyncErrorIfNecessaryWithThrottle:v25->_sharedDatabaseSyncDownThrottle context:v7 error:v25->_lastSharedDatabaseSyncDownError now:v49];
  if (v25->_zoneHealthSyncState)
  {
    BRCPrettyPrintBitmap();
    v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = @"idle";
  }
  uint64_t v59 = [(BRCOperationSubclass *)v25->_zoneHealthSyncOperation descriptionWithContext:v7];
  v60 = (void *)v59;
  if (v59) {
    uint64_t v61 = (__CFString *)v59;
  }
  else {
    uint64_t v61 = &stru_1F2AC7720;
  }
  [v7 writeLineWithFormat:@"+ zone-health:           %@ %@", v58, v61];

  [(BRCContainerScheduler *)v25 _printSyncErrorIfNecessaryWithThrottle:v25->_zoneHealthSyncDownThrottle context:v7 error:v25->_lastZoneHealthSyncDownError now:v49];
  [(BRCContainerScheduler *)v25 _printSyncErrorIfNecessaryWithThrottle:v25->_zoneHealthSyncUpThrottle context:v7 error:v25->_lastZoneHealthSyncUpError now:v49];
  if (v25->_sideCarSyncState)
  {
    BRCPrettyPrintBitmap();
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = @"idle";
  }
  uint64_t v63 = [(BRCOperationSubclass *)v25->_sideCarSyncOperation descriptionWithContext:v7];
  v64 = (void *)v63;
  if (v63) {
    uint64_t v65 = (__CFString *)v63;
  }
  else {
    uint64_t v65 = &stru_1F2AC7720;
  }
  [v7 writeLineWithFormat:@"+ side-car:              %@ %@", v62, v65];

  [(BRCContainerScheduler *)v25 _printSyncErrorIfNecessaryWithThrottle:v25->_sideCarSyncDownThrottle context:v7 error:v25->_lastSideCarSyncDownError now:v49];
  [(BRCContainerScheduler *)v25 _printSyncErrorIfNecessaryWithThrottle:v25->_sideCarSyncUpThrottle context:v7 error:v25->_lastSideCarSyncUpError now:v49];
  migrateZonePCSOperation = v25->_migrateZonePCSOperation;
  if (migrateZonePCSOperation)
  {
    v67 = [(_BRCOperation *)migrateZonePCSOperation descriptionWithContext:v7];
    [v7 writeLineWithFormat:@"+ pcs-migration:         %@", v67];
  }
  else
  {
    BOOL v68 = [(BRCAccountSession *)self->_session PCSMigrationComplete];
    v69 = @"unfinished";
    if (v68) {
      v69 = @"complete";
    }
    [v7 writeLineWithFormat:@"+ pcs-migration:         %@", v69];
  }
  char v87 = 0;
  uint64_t v70 = [(BRCAccountSession *)self->_session fetchAccountWaitOperationWithAccountReady:&v87];
  v71 = v70;
  if (v70)
  {
    v72 = v77;
    if (([v70 isFinished] & 1) == 0)
    {
      uint64_t v73 = [v71 descriptionWithContext:v7];
LABEL_69:
      uint64_t v74 = (void *)v73;
      [v7 writeLineWithFormat:@"+ account: %@", v73];
    }
  }
  else
  {
    v72 = v77;
    if (!v87)
    {
      uint64_t v73 = [v7 highlightedString:@"not ready" type:3];
      goto LABEL_69;
    }
  }
  [v7 popIndentation];
  [v7 writeLineWithFormat:&stru_1F2AC7720];
}

- (void)receivedUpdatedZoneHealthServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [v6 descriptionWithContext:0];
    int v10 = 138412802;
    char v11 = v9;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    __int16 v14 = 2112;
    BOOL v15 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated zone health sync token:%@ requestID:%lld%@", (uint8_t *)&v10, 0x20u);
  }
  [(BRCZoneHealthSyncPersistedState *)self->_zoneHealthPersistedState updateWithServerChangeToken:v6 requestID:a4];
}

- (void)finishedZoneHealthSyncDownWithRequestID:(unint64_t)a3 error:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    unint64_t v12 = a3;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Completed zone health sync requestID:%lld error:%@%@", buf, 0x20u);
  }

  if (!v6)
  {
    session = self->_session;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__BRCContainerScheduler_finishedZoneHealthSyncDownWithRequestID_error___block_invoke;
    v10[3] = &__block_descriptor_40_e30_B16__0__BRCPrivateClientZone_8l;
    v10[4] = a3;
    [(BRCAccountSession *)session enumeratePrivateClientZones:v10];
    self->_zoneHealthSyncState &= ~2u;
  }
}

uint64_t __71__BRCContainerScheduler_finishedZoneHealthSyncDownWithRequestID_error___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (id)internalZoneSyncDownAnalyticsErrors
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(BRCSyncOperationThrottle *)self->_sideCarSyncDownThrottle delay];
  double v5 = v4;
  id v6 = +[BRCUserDefaults defaultsForSideCar];
  [v6 syncDownDelayForFailure];
  double v8 = v7;

  if (v5 <= v8)
  {
    int v10 = 0;
  }
  else
  {
    id v9 = [(NSError *)self->_lastSideCarSyncDownError brc_telemetryReportableErrorWithRecordName:0];
    int v10 = [MEMORY[0x1E4F594E8] sideCarMangledID];
    char v11 = [(BRCContainerScheduler *)self session];
    unint64_t v12 = [v11 clientZoneByMangledID:v10];
    uint64_t v13 = [v12 enhancedDrivePrivacyEnabled];

    id v14 = [[BRCErrorGrouping alloc] initWithError:v9 pcsChained:0 enhancedDrivePrivacyEnabled:v13];
    [v3 setObject:v14 forKeyedSubscript:v10];
  }
  [(BRCSyncOperationThrottle *)self->_zoneHealthSyncDownThrottle delay];
  double v16 = v15;
  uint64_t v17 = [MEMORY[0x1E4F594E8] zoneHealthMangledID];
  uint64_t v18 = +[BRCUserDefaults defaultsForMangledID:v17];
  [v18 syncDownDelayForFailure];
  double v20 = v19;

  if (v16 > v20)
  {
    int v21 = [(NSError *)self->_lastZoneHealthSyncDownError brc_telemetryReportableErrorWithRecordName:0];
    uint64_t v22 = [MEMORY[0x1E4F594E8] zoneHealthMangledID];

    uint64_t v23 = [(BRCContainerScheduler *)self session];
    id v24 = [v23 clientZoneByMangledID:v22];
    uint64_t v25 = [v24 enhancedDrivePrivacyEnabled];

    uint64_t v26 = [[BRCErrorGrouping alloc] initWithError:v21 pcsChained:0 enhancedDrivePrivacyEnabled:v25];
    int v27 = [MEMORY[0x1E4F594E8] zoneHealthMangledID];
    [v3 setObject:v26 forKeyedSubscript:v27];

    int v10 = (void *)v22;
  }
  [(BRCSyncOperationThrottle *)self->_containerMetadataSyncDownThrottle delay];
  double v29 = v28;
  uint64_t v30 = +[BRCUserDefaults defaultsForMetadataContainer];
  [v30 syncDownDelayForFailure];
  double v32 = v31;

  if (v29 > v32)
  {
    long long v33 = [(NSError *)self->_lastContainerMetadataSyncDownError brc_telemetryReportableErrorWithRecordName:0];
    uint64_t v34 = [MEMORY[0x1E4F594E8] containerMetadataMangledID];

    BOOL v35 = [(BRCContainerScheduler *)self session];
    long long v36 = [v35 clientZoneByMangledID:v34];
    uint64_t v37 = [v36 enhancedDrivePrivacyEnabled];

    v38 = [[BRCErrorGrouping alloc] initWithError:v33 pcsChained:0 enhancedDrivePrivacyEnabled:v37];
    [v3 setObject:v38 forKeyedSubscript:v34];

    int v10 = (void *)v34;
  }
  [(BRCSyncOperationThrottle *)self->_sharedDatabaseSyncDownThrottle delay];
  double v40 = v39;
  uint64_t v41 = +[BRCUserDefaults defaultsForSharedZone];
  [v41 syncDownDelayForFailure];
  double v43 = v42;

  if (v40 > v43)
  {
    uint64_t v44 = [(NSError *)self->_lastSharedDatabaseSyncDownError brc_telemetryReportableErrorWithRecordName:0];
    uint64_t v45 = [MEMORY[0x1E4F594E8] sharedDatabaseMangledID];

    v46 = [(BRCContainerScheduler *)self session];
    int v47 = [v46 clientZoneByMangledID:v45];
    uint64_t v48 = [v47 enhancedDrivePrivacyEnabled];

    uint64_t v49 = [[BRCErrorGrouping alloc] initWithError:v44 pcsChained:0 enhancedDrivePrivacyEnabled:v48];
    [v3 setObject:v49 forKeyedSubscript:v45];

    int v10 = (void *)v45;
  }

  return v3;
}

- (id)internalZoneSyncUpAnalyticsErrors
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(BRCSyncOperationThrottle *)self->_sideCarSyncUpThrottle delay];
  double v5 = v4;
  id v6 = +[BRCUserDefaults defaultsForSideCar];
  [v6 syncUpDelayForFailure];
  double v8 = v7;

  if (v5 <= v8)
  {
    int v10 = 0;
  }
  else
  {
    id v9 = [(NSError *)self->_lastSideCarSyncUpError brc_telemetryReportableErrorWithRecordName:0];
    int v10 = [MEMORY[0x1E4F594E8] sideCarMangledID];
    char v11 = [(BRCContainerScheduler *)self session];
    unint64_t v12 = [v11 clientZoneByMangledID:v10];
    uint64_t v13 = [v12 enhancedDrivePrivacyEnabled];

    id v14 = [[BRCErrorGrouping alloc] initWithError:v9 pcsChained:0 enhancedDrivePrivacyEnabled:v13];
    [v3 setObject:v14 forKeyedSubscript:v10];
  }
  [(BRCSyncOperationThrottle *)self->_zoneHealthSyncUpThrottle delay];
  double v16 = v15;
  uint64_t v17 = [MEMORY[0x1E4F594E8] zoneHealthMangledID];
  uint64_t v18 = +[BRCUserDefaults defaultsForMangledID:v17];
  [v18 syncUpDelayForFailure];
  double v20 = v19;

  if (v16 > v20)
  {
    int v21 = [(NSError *)self->_lastZoneHealthSyncUpError brc_telemetryReportableErrorWithRecordName:0];
    uint64_t v22 = [MEMORY[0x1E4F594E8] zoneHealthMangledID];

    uint64_t v23 = [(BRCContainerScheduler *)self session];
    id v24 = [v23 clientZoneByMangledID:v22];
    uint64_t v25 = [v24 enhancedDrivePrivacyEnabled];

    uint64_t v26 = [[BRCErrorGrouping alloc] initWithError:v21 pcsChained:0 enhancedDrivePrivacyEnabled:v25];
    [v3 setObject:v26 forKeyedSubscript:v22];

    int v10 = (void *)v22;
  }
  [(BRCSyncOperationThrottle *)self->_containerMetadataSyncUpThrottle delay];
  double v28 = v27;
  double v29 = +[BRCUserDefaults defaultsForMetadataContainer];
  [v29 syncUpDelayForFailure];
  double v31 = v30;

  if (v28 > v31)
  {
    double v32 = [(NSError *)self->_lastContainerMetadataSyncUpError brc_telemetryReportableErrorWithRecordName:0];
    uint64_t v33 = [MEMORY[0x1E4F594E8] containerMetadataMangledID];

    uint64_t v34 = [(BRCContainerScheduler *)self session];
    BOOL v35 = [v34 clientZoneByMangledID:v33];
    uint64_t v36 = [v35 enhancedDrivePrivacyEnabled];

    uint64_t v37 = [[BRCErrorGrouping alloc] initWithError:v32 pcsChained:0 enhancedDrivePrivacyEnabled:v36];
    [v3 setObject:v37 forKeyedSubscript:v33];

    int v10 = (void *)v33;
  }

  return v3;
}

- (void)receivedUpdatedSideCarServerChangeToken:(id)a3 requestID:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = brc_bread_crumbs();
  double v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [v6 descriptionWithContext:0];
    int v10 = 138412802;
    char v11 = v9;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    __int16 v14 = 2112;
    double v15 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Updated side car sync token:%@ requestID:%lld%@", (uint8_t *)&v10, 0x20u);
  }
  [(BRCSideCarSyncPersistedState *)self->_sideCarSyncPersistedState updateWithServerChangeToken:v6 requestID:a4];
}

- (void)_scheduleCrossZoneMovePCSPrep
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx starting cross zone move migration PCS prep%@");
}

void __54__BRCContainerScheduler__scheduleCrossZoneMovePCSPrep__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 344) workloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__BRCContainerScheduler__scheduleCrossZoneMovePCSPrep__block_invoke_2;
  block[3] = &unk_1E6993698;
  block[4] = *(void *)(a1 + 32);
  dispatch_async_and_wait(v2, block);
}

void __54__BRCContainerScheduler__scheduleCrossZoneMovePCSPrep__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 312) resume];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 304);
  *(void *)(v2 + 304) = 0;
}

- (void)syncContextDidBecomeForeground:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  double v4 = [(BRCAccountSession *)self->_session personaIdentifier];
  if ([v4 isEqualToString:@"__defaultPersonaID__"])
  {
  }
  else
  {
    id v5 = [(BRCAccountSession *)self->_session personaIdentifier];

    if (v5)
    {
      int v6 = 0;
      goto LABEL_8;
    }
  }
  if (syncContextDidBecomeForeground____personaOnceToken != -1) {
    dispatch_once(&syncContextDidBecomeForeground____personaOnceToken, &__block_literal_global_249);
  }
  id v5 = (id)syncContextDidBecomeForeground____personalPersona;
  int v6 = 1;
LABEL_8:
  double v7 = [MEMORY[0x1E4FB36F8] sharedManager];
  double v8 = [v7 currentPersona];

  id v32 = 0;
  id v9 = [v8 userPersonaUniqueString];
  int v10 = v9;
  if (v9 == v5 || ([v9 isEqualToString:v5] & 1) != 0)
  {
    char v11 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v31 = 0;
    double v20 = (void *)[v8 copyCurrentPersonaContextWithError:&v31];
    id v21 = v31;
    id v22 = v32;
    id v32 = v20;

    if (v21)
    {
      uint64_t v23 = brc_bread_crumbs();
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
        -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v21);
      }
    }
    char v11 = [v8 generateAndRestorePersonaContextWithPersonaUniqueString:v5];

    if (v11)
    {
      uint64_t v25 = brc_bread_crumbs();
      uint64_t v26 = brc_default_log();
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
      {
        double v27 = [(BRCAccountSession *)self->_session personaIdentifier];
        *(_DWORD *)buf = 138412802;
        uint64_t v34 = v27;
        __int16 v35 = 2112;
        uint64_t v36 = v11;
        __int16 v37 = 2112;
        v38 = v25;
        _os_log_error_impl(&dword_1D353B000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_34:
    }
  }
  else
  {
    if (v6 && ([v8 isDataSeparatedPersona] & 1) == 0)
    {
      uint64_t v25 = brc_bread_crumbs();
      uint64_t v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
      char v11 = 0;
      goto LABEL_34;
    }
    double v28 = brc_bread_crumbs();
    double v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_3();
    }

    char v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_11:
  __int16 v12 = [v30 object];
  if (([v12 isShared] & 1) == 0)
  {
    unint64_t v13 = [v12 contextIdentifier];
    __int16 v14 = [(BRCAccountSession *)self->_session appLibraryByID:v13];
    double v15 = [v14 defaultClientZone];
    int v16 = [v15 isSyncBlockedBecauseAppNotInstalled];

    if (v16)
    {
      uint64_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v17;
        _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Container became foreground that we didn't think was installed, forcing an apps list refresh%@", buf, 0xCu);
      }

      double v19 = +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor];
      [v19 forceRefetchAppList];
    }
  }
  [(BRCContainerScheduler *)self _scheduleUpdatePushTopicsRegistration];

  _BRRestorePersona();
}

void __56__BRCContainerScheduler_syncContextDidBecomeForeground___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  os_log_t v1 = (void *)syncContextDidBecomeForeground____personalPersona;
  syncContextDidBecomeForeground____personalPersona = v0;
}

- (void)syncContextDidBecomeBackground:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self->_session personaIdentifier];
  if ([v5 isEqualToString:@"__defaultPersonaID__"])
  {
  }
  else
  {
    id v6 = [(BRCAccountSession *)self->_session personaIdentifier];

    if (v6)
    {
      int v7 = 0;
      goto LABEL_8;
    }
  }
  if (syncContextDidBecomeBackground____personaOnceToken != -1) {
    dispatch_once(&syncContextDidBecomeBackground____personaOnceToken, &__block_literal_global_254);
  }
  id v6 = (id)syncContextDidBecomeBackground____personalPersona;
  int v7 = 1;
LABEL_8:
  double v8 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v9 = [v8 currentPersona];

  id v24 = 0;
  id v10 = [v9 userPersonaUniqueString];
  char v11 = v10;
  if (v10 == v6 || ([v10 isEqualToString:v6] & 1) != 0)
  {
    __int16 v12 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v23 = 0;
    unint64_t v13 = (void *)[v9 copyCurrentPersonaContextWithError:&v23];
    id v14 = v23;
    id v15 = v24;
    id v24 = v13;

    if (v14)
    {
      int v16 = brc_bread_crumbs();
      uint64_t v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
        -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v14);
      }
    }
    __int16 v12 = [v9 generateAndRestorePersonaContextWithPersonaUniqueString:v6];

    if (v12)
    {
      uint64_t v18 = brc_bread_crumbs();
      double v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
      {
        double v20 = [(BRCAccountSession *)self->_session personaIdentifier];
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        double v28 = v12;
        __int16 v29 = 2112;
        id v30 = v18;
        _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_28:
    }
  }
  else
  {
    if (v7 && ([v9 isDataSeparatedPersona] & 1) == 0)
    {
      uint64_t v18 = brc_bread_crumbs();
      double v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
      __int16 v12 = 0;
      goto LABEL_28;
    }
    id v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_3();
    }

    __int16 v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_11:
  [(BRCContainerScheduler *)self _scheduleUpdatePushTopicsRegistration];

  _BRRestorePersona();
}

void __56__BRCContainerScheduler_syncContextDidBecomeBackground___block_invoke()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  os_log_t v1 = (void *)syncContextDidBecomeBackground____personalPersona;
  syncContextDidBecomeBackground____personalPersona = v0;
}

- (void)_scheduleUpdatePushTopicsRegistration
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] scheduling push topics registration%@", v2, v3, v4, v5, v6);
}

- (void)_updatePushTopicsRegistration
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_isInSyncBubble%@", v2, v3, v4, v5, v6);
}

uint64_t __54__BRCContainerScheduler__updatePushTopicsRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 defaultClientZone];
  if (([v4 isSyncBlockedBecauseAppNotInstalled] & 1) == 0)
  {
    uint64_t v5 = *MEMORY[0x1E4F593B0];
    uint8_t v6 = [v3 appLibraryID];
    int v7 = [@"com.apple.icloud-container." stringByAppendingFormat:@"%@%@", v5, v6];

    double v8 = [v4 zoneName];
    id v9 = [@"com.apple.icloud-container." stringByAppendingFormat:@"%@%@", v5, v8];

    if ([v3 isForeground]) {
      uint64_t v10 = 32;
    }
    else {
      uint64_t v10 = 40;
    }
    [*(id *)(a1 + v10) addObject:v7];
    if ([v4 isForeground]) {
      uint64_t v11 = 32;
    }
    else {
      uint64_t v11 = 40;
    }
    [*(id *)(a1 + v11) addObject:v9];
  }
  return 1;
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  __int16 v12 = brc_bread_crumbs();
  unint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    environmentName = self->_environmentName;
    int v15 = 138413314;
    int v16 = environmentName;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] received %@ push token %@ for %@:%@%@", (uint8_t *)&v15, 0x34u);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  uint64_t v5 = (NSData *)a4;
  uint8_t v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCContainerScheduler connection:didReceivePublicToken:]((uint64_t)v5);
  }

  double v8 = self;
  objc_sync_enter(v8);
  pushToken = v8->_pushToken;
  v8->_pushToken = v5;

  objc_sync_exit(v8);
}

- (void)_connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v6 = a4;
  uint64_t v78 = self;
  if (self->_isInSyncBubble)
  {
    v71 = brc_bread_crumbs();
    v72 = brc_default_log();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
      -[BRCContainerScheduler _updatePushTopicsRegistration].cold.5();
    }
  }
  uint64_t v76 = (void *)os_transaction_create();
  session = v78->_session;
  id v79 = v6;
  v77 = session;
  double v8 = [@"com.apple.icloud-container." stringByAppendingString:*MEMORY[0x1E4F593B0]];
  id v9 = [v79 topic];
  LOBYTE(session) = [v9 hasPrefix:v8];

  if (session)
  {
    id v10 = [v79 userInfo];
    id v11 = [v10 objectForKeyedSubscript:@"ck"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v12 = brc_bread_crumbs();
      double v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[BRCContainerScheduler _connection:didReceiveIncomingMessage:].cold.5();
      }
      id v16 = 0;
      __int16 v17 = 0;
      id v18 = 0;
      goto LABEL_34;
    }
    __int16 v12 = v11;
    unint64_t v13 = [v12 objectForKeyedSubscript:@"met"];
    id v14 = v13;
    if (v13)
    {
      int v15 = v13;
    }
    else
    {
      int v15 = [v12 objectForKeyedSubscript:@"fet"];
    }
    id v11 = v15;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v28 = brc_bread_crumbs();
      __int16 v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        uint64_t v73 = [v12 objectForKeyedSubscript:@"met"];
        uint64_t v74 = @"fet";
        *(_DWORD *)buf = 138412802;
        if (v73) {
          uint64_t v74 = @"met";
        }
        *(void *)&uint8_t buf[4] = v74;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        id v94 = (uint64_t (*)(uint64_t, uint64_t))v28;
        _os_log_fault_impl(&dword_1D353B000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid push payload[%@] %@%@", buf, 0x20u);
      }
      id v16 = 0;
      __int16 v17 = 0;
      id v18 = 0;
      goto LABEL_33;
    }
    uint64_t v19 = [v11 objectForKeyedSubscript:@"zid"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int16 v23 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        -[BRCContainerScheduler _connection:didReceiveIncomingMessage:].cold.4();
      }
      id v16 = 0;
      __int16 v17 = 0;
      id v18 = 0;
      goto LABEL_32;
    }
    id v20 = [v11 objectForKeyedSubscript:@"dbs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v21 = [v20 intValue];
      switch(v21)
      {
        case 1:
          id v22 = 0;
          __int16 v17 = @"private";
          break;
        case 3:
          uint64_t v25 = [v11 objectForKeyedSubscript:@"zoid"];

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v22 = brc_bread_crumbs();
            uint64_t v61 = brc_default_log();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
              -[BRCContainerScheduler _connection:didReceiveIncomingMessage:]();
            }

            id v16 = 0;
            id v18 = 0;
            __int16 v23 = v19;
            uint64_t v19 = (uint64_t)v25;
            __int16 v17 = @"shared";
            goto LABEL_32;
          }
          id v22 = v25;
          __int16 v17 = @"shared";
          id v20 = v22;
          break;
        case 2:
          id v22 = 0;
          __int16 v17 = @"public";
          break;
        default:
          __int16 v17 = [v20 description];
          id v22 = 0;
          break;
      }
      uint64_t v26 = [(BRCAccountSession *)v77 cachedCurrentUserRecordName];
      if (v26 && [v22 isEqualToString:v26])
      {
        __int16 v27 = (id)*MEMORY[0x1E4F19C08];

        id v22 = v27;
      }
      id v16 = (id)[objc_alloc(MEMORY[0x1E4F594E8]) initWithZoneName:v19 ownerName:v22];
      id v18 = v11;
    }
    else
    {
      id v22 = brc_bread_crumbs();
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[BRCContainerScheduler _connection:didReceiveIncomingMessage:]();
      }

      id v16 = 0;
      __int16 v17 = 0;
      id v18 = 0;
    }
    __int16 v23 = v19;
    uint64_t v19 = (uint64_t)v20;
LABEL_32:

    double v28 = v11;
    id v11 = v19;
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
  id v11 = brc_bread_crumbs();
  __int16 v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    id v56 = [v79 topic];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = [v56 UTF8String];
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = [v8 UTF8String];
    *(_WORD *)&buf[22] = 2112;
    id v94 = (uint64_t (*)(uint64_t, uint64_t))v11;
    _os_log_fault_impl(&dword_1D353B000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid push topic '%s' (expected prefix '%s')%@", buf, 0x20u);
  }
  id v16 = 0;
  __int16 v17 = 0;
  id v18 = 0;
LABEL_35:

  id v29 = v16;
  id v30 = v17;
  if (v18)
  {
    memset(v86, 0, sizeof(v86));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler _connection:didReceiveIncomingMessage:]", 1737, v86);
    uint64_t v31 = brc_bread_crumbs();
    id v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v52 = v86[0];
      uint64_t v53 = [v79 topic];
      v54 = [v75 publicToken];
      uint64_t v55 = [v79 priority];
      *(_DWORD *)buf = 134219522;
      *(void *)&uint8_t buf[4] = v52;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2112;
      id v94 = v53;
      *(_WORD *)v95 = 2112;
      *(void *)&v95[2] = v18;
      *(_WORD *)&v95[10] = 2112;
      *(void *)&v95[12] = v54;
      __int16 v96 = 2048;
      uint64_t v97 = v55;
      __int16 v98 = 2112;
      v99 = v31;
      _os_log_debug_impl(&dword_1D353B000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received a push in the %@ database for topic:'%@' payload:%@ token:%@ priority:%ld%@", buf, 0x48u);
    }
    kdebug_trace();
    uint64_t v33 = objc_msgSend(MEMORY[0x1E4F1A218], "br_syncDownPushTriggered");
    uint64_t v34 = [v29 appLibraryOrZoneName];
    int v35 = [v34 isEqualToString:*MEMORY[0x1E4F59408]];

    if (v35)
    {
      uint64_t v36 = brc_bread_crumbs();
      __int16 v37 = brc_default_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v36;
        _os_log_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEFAULT, "[NOTICE] received a push for the container-metadata zone%@", buf, 0xCu);
      }

      [(BRCContainerScheduler *)v78 scheduleSyncDownForContainerMetadataWithGroup:v33];
      goto LABEL_72;
    }
    double v40 = [v29 appLibraryOrZoneName];
    int v41 = [v40 isEqualToString:*MEMORY[0x1E4F59480]];

    if (v41)
    {
      double v42 = brc_bread_crumbs();
      double v43 = brc_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v42;
        _os_log_impl(&dword_1D353B000, v43, OS_LOG_TYPE_DEFAULT, "[NOTICE] received a push for the zone-health zone%@", buf, 0xCu);
      }

      [(BRCContainerScheduler *)v78 scheduleSyncDownForZoneHealthWithGroup:v33];
      goto LABEL_72;
    }
    uint64_t v44 = [v29 appLibraryOrZoneName];
    int v45 = [v44 isEqualToString:*MEMORY[0x1E4F596D8]];

    if (v45)
    {
      v46 = brc_bread_crumbs();
      int v47 = brc_default_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v46;
        _os_log_impl(&dword_1D353B000, v47, OS_LOG_TYPE_DEFAULT, "[NOTICE] received a push for the side-car zone%@", buf, 0xCu);
      }

      [(BRCContainerScheduler *)v78 scheduleSyncDownForSideCarWithGroup:v33];
      goto LABEL_72;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v94 = __Block_byref_object_copy__17;
    *(void *)v95 = __Block_byref_object_dispose__17;
    *(void *)&v95[8] = [(BRCAccountSession *)v78->_session clientZoneByMangledID:v29];
    uint64_t v48 = [(BRCAccountSession *)v78->_session appLibraryByMangledID:v29];
    uint64_t v49 = v48;
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      v50 = brc_bread_crumbs();
      uint64_t v51 = brc_default_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v87 = 138412546;
        id v88 = v29;
        __int16 v89 = 2112;
        id v90 = v50;
        _os_log_impl(&dword_1D353B000, v51, OS_LOG_TYPE_DEFAULT, "[NOTICE] received a push for client zone %@%@", v87, 0x16u);
      }
    }
    else if (v48)
    {
      uint64_t v57 = [v48 defaultClientZone];
      v58 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v57;

      v50 = brc_bread_crumbs();
      uint64_t v51 = brc_default_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v59 = [v49 defaultClientZone];
        v60 = [v59 mangledID];
        *(_DWORD *)char v87 = 138412802;
        id v88 = v29;
        __int16 v89 = 2112;
        id v90 = v60;
        __int16 v91 = 2112;
        id v92 = v50;
        _os_log_impl(&dword_1D353B000, v51, OS_LOG_TYPE_DEFAULT, "[NOTICE] received a push for app library %@ -> zone %@%@", v87, 0x20u);
      }
    }
    else
    {
      if ([v29 isShared])
      {
        v62 = brc_bread_crumbs();
        uint64_t v63 = brc_default_log();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)char v87 = 138412546;
          id v88 = v29;
          __int16 v89 = 2112;
          id v90 = v62;
          _os_log_impl(&dword_1D353B000, v63, OS_LOG_TYPE_DEFAULT, "[NOTICE] receiving a push for an unknown ID shared zone %@, creating the zone%@", v87, 0x16u);
        }

        uint64_t v64 = [(BRCAccountSession *)v78->_session getOrCreateSharedZones:v29];
        v50 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v64;
        goto LABEL_71;
      }
      uint64_t v65 = v78->_session;
      id v66 = objc_alloc(MEMORY[0x1E4F594E8]);
      v67 = (void *)[v66 initWithZoneName:*MEMORY[0x1E4F59418] ownerName:0];
      uint64_t v68 = [(BRCAccountSession *)v65 clientZoneByMangledID:v67];
      v69 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v68;

      v50 = brc_bread_crumbs();
      uint64_t v51 = brc_default_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)char v87 = 138412546;
        id v88 = v29;
        __int16 v89 = 2112;
        id v90 = v50;
        _os_log_impl(&dword_1D353B000, v51, OS_LOG_TYPE_DEFAULT, "[NOTICE] receiving a push for an unknown ID %@ -> com.apple.CloudDocs%@", v87, 0x16u);
      }
    }

LABEL_71:
    uint64_t v70 = [(BRCDeadlineScheduler *)v78->_syncScheduler workloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__BRCContainerScheduler__connection_didReceiveIncomingMessage___block_invoke;
    block[3] = &unk_1E6996880;
    id v85 = buf;
    id v81 = v33;
    id v82 = v29;
    v83 = v78;
    id v84 = v76;
    dispatch_async(v70, block);

    _Block_object_dispose(buf, 8);
LABEL_72:

    __brc_leave_section(v86);
    goto LABEL_73;
  }
  v38 = brc_bread_crumbs();
  uint64_t v39 = brc_default_log();
  if (os_log_type_enabled(v39, (os_log_type_t)0x90u)) {
    -[BRCContainerScheduler _connection:didReceiveIncomingMessage:](v79, (uint64_t)v38, v39);
  }

LABEL_73:
}

void __63__BRCContainerScheduler__connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 64;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    memset(v15, 0, sizeof(v15));
    __brc_create_section(0, (uint64_t)"-[BRCContainerScheduler _connection:didReceiveIncomingMessage:]_block_invoke", 1777, v15);
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(*(void *)(*(void *)v2 + 8) + 40);
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = v15[0];
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      int v21 = v3;
      _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling sync down for client zone %@ because of a push%@", buf, 0x20u);
    }

    [*(id *)(*(void *)(*(void *)v2 + 8) + 40) clearStateBits:0x200000];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) scheduleSyncDownWithGroup:*(void *)(a1 + 32)];
    __brc_leave_section(v15);
  }
  else
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = (uint64_t)v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] no zone found, dropping the push%@", buf, 0xCu);
    }
  }
  if ([*(id *)(a1 + 40) isShared]) {
    [*(id *)(a1 + 48) scheduleSyncDownForSharedDatabaseImmediately:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) == 0];
  }
  if ([*(id *)(*(void *)(*(void *)v2 + 8) + 40) isSharedZone])
  {
    int v7 = *(void **)(*(void *)(a1 + 48) + 8);
    double v8 = [*(id *)(a1 + 40) appLibraryOrZoneName];
    uint64_t v9 = [v7 privateClientZoneByID:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      __int16 v12 = brc_bread_crumbs();
      unint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __63__BRCContainerScheduler__connection_didReceiveIncomingMessage___block_invoke_cold_1();
      }

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) scheduleSyncDownWithGroup:*(void *)(a1 + 32)];
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(BRCAccountSession *)self->_session personaIdentifier];
  id v11 = v7;
  id v9 = v7;
  id v10 = v6;
  BRPerformWithPersonaAndError();
}

void __62__BRCContainerScheduler_connection_didReceiveIncomingMessage___block_invoke(void *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __62__BRCContainerScheduler_connection_didReceiveIncomingMessage___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    id v6 = (void *)a1[4];
    [v6 _connection:v4 didReceiveIncomingMessage:v5];
  }
}

- (void)notifyAfterNextZoneHealthSyncDown:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCDeadlineScheduler *)self->_syncScheduler workloop];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__BRCContainerScheduler_notifyAfterNextZoneHealthSyncDown___block_invoke;
  uint64_t v7[3] = &unk_1E6994600;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(v5, v7);
}

void __59__BRCContainerScheduler_notifyAfterNextZoneHealthSyncDown___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 328);
  if (!v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 328);
    *(void *)(v4 + 328) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 328);
  }
  id v6 = (id)MEMORY[0x1D94389C0](*(void *)(a1 + 40));
  [v2 addObject:v6];
}

- (BRCSyncBudgetThrottle)syncUpBudget
{
  return self->_syncUpBudget;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (BRCDeadlineScheduler)syncScheduler
{
  return self->_syncScheduler;
}

- (BRCContainerMetadataSyncPersistedState)containerMetadataPersistedState
{
  return self->_containerMetadataPersistedState;
}

- (BRCZoneHealthSyncPersistedState)zoneHealthSyncPersistedState
{
  return self->_zoneHealthPersistedState;
}

- (BRCSideCarSyncPersistedState)sideCarSyncPersistedState
{
  return self->_sideCarSyncPersistedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncScheduler, 0);
  objc_storeStrong((id *)&self->_syncUpBudget, 0);
  objc_storeStrong((id *)&self->_nextZoneHealthSyncDownBarriers, 0);
  objc_storeStrong((id *)&self->_migrateZonePCSSource, 0);
  objc_storeStrong((id *)&self->_migrateZonePCSOperation, 0);
  objc_storeStrong((id *)&self->_periodicSyncOperation, 0);
  objc_storeStrong((id *)&self->_periodicSyncScheduler, 0);
  objc_storeStrong((id *)&self->_lastSideCarSyncUpError, 0);
  objc_storeStrong((id *)&self->_lastSideCarSyncDownError, 0);
  objc_storeStrong((id *)&self->_sideCarSyncUpThrottle, 0);
  objc_storeStrong((id *)&self->_sideCarSyncDownThrottle, 0);
  objc_storeStrong((id *)&self->_sideCarSyncOperation, 0);
  objc_storeStrong((id *)&self->_sideCarSyncPersistedState, 0);
  objc_storeStrong((id *)&self->_lastZoneHealthSyncUpError, 0);
  objc_storeStrong((id *)&self->_lastZoneHealthSyncDownError, 0);
  objc_storeStrong((id *)&self->_zoneHealthSyncUpThrottle, 0);
  objc_storeStrong((id *)&self->_zoneHealthSyncDownThrottle, 0);
  objc_storeStrong((id *)&self->_zoneHealthSyncOperation, 0);
  objc_storeStrong((id *)&self->_zoneHealthPersistedState, 0);
  objc_storeStrong((id *)&self->_lastSharedDatabaseSyncDownError, 0);
  objc_storeStrong((id *)&self->_sharedDatabaseSyncDownThrottle, 0);
  objc_storeStrong((id *)&self->_sharedDatabaseSyncOperation, 0);
  objc_storeStrong((id *)&self->_lastContainerMetadataSyncUpError, 0);
  objc_storeStrong((id *)&self->_lastContainerMetadataSyncDownError, 0);
  objc_storeStrong((id *)&self->_containerMetadataSyncUpThrottle, 0);
  objc_storeStrong((id *)&self->_containerMetadataSyncDownThrottle, 0);
  objc_storeStrong((id *)&self->_containerMetadataSyncOperation, 0);
  objc_storeStrong((id *)&self->_containerMetadataPersistedState, 0);
  objc_storeStrong((id *)&self->_pushWorkloop, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_environmentName, 0);
  objc_storeStrong((id *)&self->_pushSource, 0);
  objc_storeStrong((id *)&self->_sideCarSyncSource, 0);
  objc_storeStrong((id *)&self->_zoneHealthSyncSource, 0);
  objc_storeStrong((id *)&self->_sharedDatabaseSyncSource, 0);
  objc_storeStrong((id *)&self->_containerMetadataSyncSource, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)initWithAccountSession:pushWorkloop:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Push notification source created in a disabled state%@", v2, v3, v4, v5, v6);
}

void __61__BRCContainerScheduler_initWithAccountSession_pushWorkloop___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Sync: no global budget anymore: %@%@");
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx cancelling sideCarSyncSource%@");
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx cancelling migrateZonePCSSource%@");
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx cancelling zoneHealthSyncSource%@");
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx cancelling sharedDatabaseSyncSource%@");
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx cancelling containerMetadataSyncSource...%@");
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx cancelling periodicSyncOperation%@");
}

void __40__BRCContainerScheduler_closeContainers__block_invoke_38_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] unscheduling client zone %@%@", (void)v3, DWORD2(v3));
}

- (void)schedulePeriodicSyncInGroup:completion:.cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Considering containers needing forced sync down%@");
}

void __64__BRCContainerScheduler_schedulePeriodicSyncInGroup_completion___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] periodic sync failed %@%@", (void)v3, DWORD2(v3));
}

- (void)didInitialSyncDownForClientZone:.cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx just synced down the default container%@");
}

void __71__BRCContainerScheduler_scheduleSyncDownForContainerMetadataWithGroup___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] marking container-metadata needs-sync-down%@", v2, v3, v4, v5, v6);
}

void __70__BRCContainerScheduler_scheduleSyncDownForSharedDatabaseImmediately___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] scheduling sync for sharedb in %llus%@");
}

void __64__BRCContainerScheduler_scheduleSyncDownForZoneHealthWithGroup___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] scheduling sync for zone-health%@", v2, v3, v4, v5, v6);
}

void __61__BRCContainerScheduler_scheduleSyncDownForSideCarWithGroup___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] scheduling sync for side-car%@", v2, v3, v4, v5, v6);
}

void __47__BRCContainerScheduler_redoZonePCSPreperation__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] scheduling sync for zone-pcs%@", v2, v3, v4, v5, v6);
}

void __70__BRCContainerScheduler_didChangeSyncStatusForZoneHealthForContainer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] marking zone-health needs-sync-up%@", v2, v3, v4, v5, v6);
}

void __77__BRCContainerScheduler_didChangeSyncStatusForContainerMetadataForContainer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] marking container-metadata needs-sync-up%@", v2, v3, v4, v5, v6);
}

- (void)syncContextDidBecomeForeground:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] won't restore persona: %@%@", (void)v3, DWORD2(v3));
}

- (void)connection:(uint64_t)a1 didReceivePublicToken:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] received public push token %@%@", (void)v3, DWORD2(v3));
}

- (void)_connection:(NSObject *)a3 didReceiveIncomingMessage:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = [a1 topic];
  id v7 = [a1 userInfo];
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_1D353B000, a3, (os_log_type_t)0x90u, "[ERROR] unable to parse push for topic:'%@' payload:%@%@", (uint8_t *)&v8, 0x20u);
}

- (void)_connection:didReceiveIncomingMessage:.cold.2()
{
  int v2 = 138412802;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_8_3(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: invalid push ZoneOwnerID at payload[%@] %@%@", v2);
}

- (void)_connection:didReceiveIncomingMessage:.cold.3()
{
  int v2 = 138412802;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_8_3(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: invalid push DatabaseScope at payload[%@] %@%@", v2);
}

- (void)_connection:didReceiveIncomingMessage:.cold.4()
{
  int v2 = 138412802;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_8_3(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: invalid push ZoneIdentifier at payload[%@] %@%@", v2);
}

- (void)_connection:didReceiveIncomingMessage:.cold.5()
{
  int v2 = 138412802;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_8_3(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: invalid push payload[%@] %@%@", v2);
}

void __63__BRCContainerScheduler__connection_didReceiveIncomingMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Also scheduling a sync down on the private zone %@%@");
}

void __62__BRCContainerScheduler_connection_didReceiveIncomingMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: dropping push notification because we can't adopt persona%@", v2, v3, v4, v5, v6);
}

@end