@interface BRCAccountHandler
+ (id)currentiCloudAccount;
+ (id)currentiCloudAccountID;
+ (void)_migrateAccountIfNecessaryForAccountDSID:(id)a3;
+ (void)currentiCloudAccount;
- (BOOL)_cleanupAPFSSnapshotWhenNoSessionExists;
- (BOOL)_createCurrentAccountSessionWithID:(id)a3 error:(id *)a4;
- (BOOL)_loadOnDiskAccountSessionSecondTry:(id)a3 prevError:(id)a4;
- (BOOL)_loadOnDiskAccountSessionWithError:(id *)a3;
- (BOOL)_shouldResetLocalData:(id)a3;
- (BOOL)_shouldRetryOpenSession:(unsigned __int8)a3;
- (BOOL)_waitForSessionLoadingWhenNowStarting:(BOOL)a3;
- (BOOL)checkEnoughDiskSpaceToBeFunctional;
- (BOOL)createAccountSessionWithDSID:(id)a3 error:(id *)a4;
- (BOOL)destroyCurrentAccountSynchronously;
- (BOOL)destroySessionSynchronously;
- (BOOL)doesNotHaveEnoughDiskSpaceToBeFunctional;
- (BOOL)finishedLoading;
- (BOOL)setDBAccountDSID:(id)a3;
- (BOOL)waitForSessionLoading;
- (BRCAccountHandler)initWithACAccountID:(id)a3;
- (BRCAccountSession)session;
- (NSError)loggedOutError;
- (NSString)acAccountID;
- (NSString)accountPath;
- (OS_dispatch_workloop)pushWorkloop;
- (id)addFileProviderDomainForAccount:(id)a3 error:(id *)a4;
- (id)ubiquityTokenSalt;
- (id)waitForSessionDBLoadingBarrier;
- (int64_t)syncPolicyforSyncedFolderType:(unint64_t)a3;
- (unsigned)_handleOpenError:(id)a3;
- (unsigned)_tryToOpenSession:(id)a3 error:(id *)a4;
- (void)__destroySessionWithIntents:(id)a3;
- (void)_cleanupPushAndActivitiesStatesWhenNoSessionExists;
- (void)_destroyCurrentSessionSynchronously;
- (void)_handleAccountDidChange;
- (void)_handleAccountWillChange;
- (void)_updateAccountToDSID:(id)a3;
- (void)addDelegate:(id)a3;
- (void)checkEnoughDiskSpaceToBeFunctional;
- (void)dealloc;
- (void)jetsamCloudDocsApps;
- (void)markMigrationCompletedForDSID:(id)a3;
- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4;
- (void)reloadSyncedFolderPolicies;
- (void)reloadSyncedFolderPoliciesDisableiCloudDesktop:(BOOL)a3;
- (void)removeDelegate:(id)a3;
- (void)setDoesNotHaveEnoughDiskSpaceToBeFunctional:(BOOL)a3;
- (void)setLoggedOutError:(id)a3;
- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 completion:(id)a6;
- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 shouldPostAccountChangedNotification:(BOOL)a6 completion:(id)a7;
- (void)setSyncPolicy:(int64_t)a3 forSyncedFolderType:(unint64_t)a4;
- (void)startAndLoadAccountSynchronously:(id)a3;
- (void)ubiquityTokenSalt;
@end

@implementation BRCAccountHandler

- (BRCAccountHandler)initWithACAccountID:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BRCAccountHandler;
  v6 = [(BRCAccountHandler *)&v38 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_acAccountID, a3);
    uint64_t v8 = objc_msgSend(NSString, "br_currentSupportDir");
    accountPath = v7->_accountPath;
    v7->_accountPath = (NSString *)v8;

    if (!v7->_accountPath)
    {
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Got a nil account path"];
      objc_claimAutoreleasedReturnValue();
      v35 = brc_bread_crumbs();
      v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      v37 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountHandler initWithACAccountID:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 299, v37);
    }
    v10 = [MEMORY[0x1E4FB36F8] sharedManager];
    v11 = objc_msgSend(v10, "br_currentPersonaID");

    BRPersonaSpecificName();
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create(v13, v15);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v16;

    BRPersonaSpecificName();
    id v18 = objc_claimAutoreleasedReturnValue();
    dispatch_workloop_t v19 = dispatch_workloop_create((const char *)[v18 UTF8String]);
    pushWorkloop = v7->_pushWorkloop;
    v7->_pushWorkloop = (OS_dispatch_workloop *)v19;

    BRPersonaSpecificName();
    id v21 = objc_claimAutoreleasedReturnValue();
    v22 = (const char *)[v21 UTF8String];
    v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v24 = dispatch_queue_attr_make_with_autorelease_frequency(v23, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create(v22, v24);

    migrationStatusSetterQueue = v7->_migrationStatusSetterQueue;
    v7->_migrationStatusSetterQueue = (OS_dispatch_queue *)v25;

    v27 = objc_alloc_init(BRCBarrier);
    accountLoadingBarrier = v7->_accountLoadingBarrier;
    v7->_accountLoadingBarrier = v27;

    uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
    syncPolicyByFolderType = v7->_syncPolicyByFolderType;
    v7->_syncPolicyByFolderType = (NSMutableDictionary *)v29;

    v31 = [MEMORY[0x1E4F74230] sharedConnection];
    [v31 addObserver:v7];

    uint64_t v32 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    delegates = v7->_delegates;
    v7->_delegates = (NSHashTable *)v32;
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BRCAccountHandler;
  [(BRCAccountHandler *)&v4 dealloc];
}

- (void)addDelegate:(id)a3
{
  id v5 = a3;
  objc_super v4 = self->_delegates;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_delegates addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeDelegate:(id)a3
{
  id v5 = a3;
  objc_super v4 = self->_delegates;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_delegates removeObject:v5];
  objc_sync_exit(v4);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = brc_bread_crumbs();
  v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountHandler profileConnectionDidReceiveRestrictionChangedNotification:userInfo:]();
  }
  dispatch_workloop_t v19 = v4;

  v7 = +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor];
  uint64_t v8 = [v7 allApplicationIdentifiers];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v14 isEqualToString:@"com.apple.Preferences"] & 1) == 0)
        {
          v15 = [MEMORY[0x1E4F74230] sharedConnection];
          char v16 = [v15 isCloudSyncAllowed:v14];

          if ((v16 & 1) == 0)
          {
            v17 = brc_bread_crumbs();
            id v18 = brc_default_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              dispatch_queue_t v25 = v14;
              __int16 v26 = 2112;
              v27 = v17;
              _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] jetsaming %@%@", buf, 0x16u);
            }

            BKSTerminateApplicationForReasonAndReportWithDescription();
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v11);
  }
}

- (BOOL)setDBAccountDSID:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = NSString;
  v7 = [(BRCAccountHandler *)self accountPath];
  uint64_t v8 = objc_msgSend(v6, "brc_accountIDPathForAccountPath:", v7);

  if (v4)
  {
    id v9 = [(BRCAccountHandler *)self accountPath];
    id v24 = 0;
    char v10 = [v5 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v24];
    id v11 = v24;

    if ((v10 & 1) == 0)
    {
      uint64_t v12 = brc_bread_crumbs();
      v13 = brc_default_log();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
        -[BRCAccountHandler setDBAccountDSID:]();
      }
    }
    id v23 = v11;
    BOOL v14 = 1;
    char v15 = [v4 writeToFile:v8 atomically:1 encoding:4 error:&v23];
    id v16 = v23;

    if ((v15 & 1) == 0)
    {
      v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        -[BRCAccountHandler setDBAccountDSID:]();
      }

      BOOL v14 = 0;
    }
  }
  else if ((BRCRecursiveRemove(v8) & 0x80000000) != 0)
  {
    int v19 = *__error();
    long long v20 = brc_bread_crumbs();
    long long v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
      -[BRCAccountHandler setDBAccountDSID:]();
    }

    id v16 = 0;
    BOOL v14 = 0;
    *__error() = v19;
  }
  else
  {
    id v16 = 0;
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)_cleanupAPFSSnapshotWhenNoSessionExists
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(&v7.f_mntonname[392], 0, 32);
  objc_msgSend(MEMORY[0x1E4F594C0], "cloudDocsAppSupportURL", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0);
  id v3 = objc_claimAutoreleasedReturnValue();
  int v4 = statfs((const char *)[v3 fileSystemRepresentation], &v7);

  if ((v4 & 0x80000000) == 0)
  {
    id v5 = [NSString stringWithUTF8String:v7.f_mntonname];
    +[BRCAnalyticsReporter cancelSyncConsistencyReportWithMountPath:v5 queue:self->_pushWorkloop];
  }
  return v4 >= 0;
}

- (void)_cleanupPushAndActivitiesStatesWhenNoSessionExists
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx disabling pushes, be sure to listen to activities and the like%@", (void)v3, DWORD2(v3));
}

void __71__BRCAccountHandler__cleanupPushAndActivitiesStatesWhenNoSessionExists__block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  uint64_t v1 = dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.bird.disabled-events", v1);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = *MEMORY[0x1E4F4E1C8];
  v16[0] = *MEMORY[0x1E4F4E1D0];
  v16[1] = v3;
  int v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 2, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    statfs v7 = 0;
    uint64_t v8 = *(void *)v13;
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v10 = 0;
      id v11 = v7;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        statfs v7 = (void *)[objc_alloc(MEMORY[0x1E4F4E1E8]) initWithEnvironmentName:*(void *)(*((void *)&v12 + 1) + 8 * v10) namedDelegatePort:@"com.apple.bird.push" queue:v2];

        [v7 setEnabledTopics:v9 ignoredTopics:v9 opportunisticTopics:v9];
        [v7 shutdown];
        ++v10;
        id v11 = v7;
      }
      while (v6 != v10);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)startAndLoadAccountSynchronously:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke;
  id v11 = &unk_1E6993628;
  long long v12 = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, &v8);
  dispatch_async(queue, v7);

  -[BRCAccountHandler _waitForSessionLoadingWhenNowStarting:](self, "_waitForSessionLoadingWhenNowStarting:", 1, v8, v9, v10, v11, v12);
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke(uint64_t a1)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = (id *)(a1 + 32);
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  if (!+[BRCSystemSupportAnalyzer isCloudDocsSupportedWithError:0])
  {
    *((unsigned char *)*v2 + 9) = 1;
    return;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F594B8];
  id v4 = [*(id *)(a1 + 32) accountPath];
  uint64_t v5 = objc_msgSend(v3, "brc_dbAccountDSIDForPath:", v4);

  id v6 = objc_msgSend(NSString, "br_currentMobileDocumentsDir");
  uint64_t v7 = BRCGetXattrValueForKeyOnPath(v6, @"com.apple.ubd.prsid");

  uint64_t v8 = &off_1D3887000;
  if ([*(id *)(a1 + 40) isEnabledForDataclass:*MEMORY[0x1E4F17B38]])
  {
    objc_msgSend(*(id *)(a1 + 40), "br_dsid");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "br_isEnabledForCloudDocs"))
      {
        uint64_t v10 = *((void *)*v2 + 8);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_2;
        block[3] = &unk_1E6993698;
        id v9 = v9;
        id v61 = v9;
        dispatch_async(v10, block);
      }
      else
      {
        if ((int)BRGetMigrationStatusForDSID() < 2)
        {
          v41 = brc_bread_crumbs();
          v42 = brc_default_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v9;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v41;
            _os_log_impl(&dword_1D353B000, v42, OS_LOG_TYPE_DEFAULT, "[WARNING] migration is not accepted, not loading the account for %@%@", buf, 0x16u);
          }

          [*v2 _cleanupPushAndActivitiesStatesWhenNoSessionExists];
          id v28 = 0;
          goto LABEL_63;
        }
        long long v12 = brc_bread_crumbs();
        id v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v12;
          _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] setting the migration on the account because account is migrated - and waiting for ACAccountNotification plugin%@", buf, 0xCu);
        }

        [*v2 setMigrationStatus:2 forDSID:v9 shouldUpdateAccount:1 shouldPostAccountChangedNotification:0 completion:0];
      }
      char v11 = 1;
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
    id v9 = 0;
  }
  char v59 = 0;
  v52 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", &v59);
  memset(v58, 0, sizeof(v58));
  __brc_create_section(0, (uint64_t)"-[BRCAccountHandler startAndLoadAccountSynchronously:]_block_invoke", 525, v58);
  long long v14 = brc_bread_crumbs();
  long long v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v45 = v58[0];
    v51 = [*v2 accountPath];
    if (v59) {
      v46 = @"DS";
    }
    else {
      v46 = @"not DS";
    }
    v47 = objc_msgSend(*(id *)(a1 + 40), "br_personaIdentifier", v46);
    int v48 = [*(id *)(a1 + 40) isDataSeparatedAccount];
    v49 = @"DS";
    if (!v48) {
      v49 = @"not DS";
    }
    *(_DWORD *)buf = 134220290;
    *(void *)&uint8_t buf[4] = v45;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v63 = v5;
    __int16 v64 = 2112;
    uint64_t v65 = v7;
    __int16 v66 = 2112;
    v67 = v51;
    __int16 v68 = 2112;
    v69 = v52;
    __int16 v70 = 2112;
    uint64_t v71 = v50;
    __int16 v72 = 2112;
    v73 = v47;
    __int16 v74 = 2112;
    v75 = v49;
    __int16 v76 = 2112;
    v77 = v14;
    _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx loaded system account ID: %@ (db ID: %@, disk ID: %@, path: %@, current persona: %@ (%@), account's persona: %@ (%@))%@", buf, 0x66u);

    uint64_t v8 = &off_1D3887000;
  }

  if (v7 | v5) {
    char v16 = v11;
  }
  else {
    char v16 = 1;
  }
  if ((v16 & 1) == 0)
  {
    memset(buf, 0, sizeof(buf));
    __brc_create_section(0, (uint64_t)"-[BRCAccountHandler startAndLoadAccountSynchronously:]_block_invoke", 528, buf);
    int v19 = brc_bread_crumbs();
    long long v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_3();
    }

    __brc_leave_section((uint64_t *)buf);
LABEL_27:
    [*v2 reloadSyncedFolderPoliciesDisableiCloudDesktop:1];
    long long v21 = [[BRCAccountSession alloc] initWithACAccountID:*((void *)*v2 + 14) dbAccountDSID:v5 salt:0 accountHandler:0];
    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = *((void *)v8 + 130);
    v56[2] = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_180;
    v56[3] = &unk_1E6993698;
    id v23 = v22;
    v57 = v23;
    [(BRCAccountSession *)v21 destroyLocalDataWaitingForFilesToBeUnlinked:0 completionBlock:v56];
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    id v24 = v9;

    goto LABEL_28;
  }
  if (v5) {
    char v17 = 0;
  }
  else {
    char v17 = v11;
  }
  if ((v17 & 1) == 0)
  {
    if (!v5)
    {
      id v28 = 0;
      goto LABEL_57;
    }
    if ([(id)v5 isEqualToString:v9])
    {
      int v25 = 0;
LABEL_38:
      memset(v55, 0, sizeof(v55));
      __brc_create_section(0, (uint64_t)"-[BRCAccountHandler startAndLoadAccountSynchronously:]_block_invoke", 573, v55);
      uint64_t v29 = brc_bread_crumbs();
      v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = v55[0];
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v5;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v63 = (uint64_t)v29;
        _os_log_debug_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Loading current on-disk account: %@%@", buf, 0x20u);
      }

      v31 = brc_bread_crumbs();
      uint64_t v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        _os_log_impl(&dword_1D353B000, v32, OS_LOG_TYPE_DEFAULT, "[NOTICE] using account %@%@", buf, 0x16u);
      }

      id v33 = *v2;
      if (*((void *)*v2 + 6))
      {
        if ([*((id *)*v2 + 6) isEqualToString:v5]) {
          goto LABEL_47;
        }
        id v33 = *v2;
      }
      if ([v33 _loadOnDiskAccountSessionWithError:0])
      {
        objc_storeStrong((id *)*v2 + 6, (id)v5);
LABEL_48:
        BRPostAccountTokenChangedNotification();
LABEL_49:
        if ([*(id *)(a1 + 40) isDataSeparatedAccount])
        {
          v34 = *(void **)(a1 + 32);
          uint64_t v35 = *(void *)(a1 + 40);
          id v54 = 0;
          v36 = [v34 addFileProviderDomainForAccount:v35 error:&v54];
          id v28 = v54;
          if (!v28) {
            [*((id *)*v2 + 4) setFpDomain:v36];
          }
        }
        else
        {
          id v28 = 0;
        }
        __brc_leave_section(v55);
        if (!v28) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
LABEL_47:
      if (!v25) {
        goto LABEL_49;
      }
      goto LABEL_48;
    }
    v43 = brc_bread_crumbs();
    v44 = brc_default_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v63 = (uint64_t)v43;
      _os_log_fault_impl(&dword_1D353B000, v44, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: disk account ID (%@) doesn't match system account ID (%@)%@", buf, 0x20u);
    }

    goto LABEL_27;
  }
  id v18 = v9;
LABEL_28:
  if ([*v2 setDBAccountDSID:v9])
  {
    if (v9)
    {
      int v25 = 1;
      uint64_t v5 = (uint64_t)v9;
      goto LABEL_38;
    }
  }
  else
  {
    __int16 v26 = brc_bread_crumbs();
    v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_2();
    }
  }
  id v28 = 0;
  uint64_t v5 = 0;
LABEL_57:
  [*v2 _cleanupPushAndActivitiesStatesWhenNoSessionExists];
LABEL_58:
  [*((id *)*v2 + 4) resumeIfNecessary];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  if ((objc_msgSend(*(id *)(a1 + 40), "br_needsToVerifyTerms") & 1) == 0)
  {
    v37 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F25C08] code:-1000 userInfo:0];
    objc_super v38 = brc_bread_crumbs();
    v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
      __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_1();
    }

    v40 = objc_msgSend(MEMORY[0x1E4F25DE0], "br_sharedProviderManager");
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = *((void *)v8 + 130);
    v53[2] = __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_182;
    v53[3] = &unk_1E69939E8;
    v53[4] = *v2;
    [v40 signalErrorResolved:v37 completionHandler:v53];
  }
  __brc_leave_section(v58);

LABEL_63:
}

uint64_t __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t result = BRGetMigrationStatusForDSID();
  if ((int)result <= 1)
  {
    uint64_t v1 = brc_bread_crumbs();
    dispatch_queue_t v2 = brc_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = v1;
      _os_log_impl(&dword_1D353B000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] setting the migration prefs because account is migrated%@", (uint8_t *)&v3, 0xCu);
    }

    return BRSetMigrationStatusForDSIDInPref();
  }
  return result;
}

intptr_t __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_180(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_182(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 112);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    long long v12 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] signalErrorResolved for %@ finished - %@%@", (uint8_t *)&v7, 0x20u);
  }
}

- (id)addFileProviderDomainForAccount:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([v6 isDataSeparatedAccount] & 1) == 0)
  {
    id v23 = brc_bread_crumbs();
    id v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler addFileProviderDomainForAccount:error:]();
    }
  }
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__4;
  id v33 = __Block_byref_object_dispose__4;
  id v34 = 0;
  int v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F594D8], "br_getProviderIDForDataSeparated:", 1);
  __int16 v9 = objc_msgSend(MEMORY[0x1E4F594D8], "br_getDomainIdentifierForACAccountID:", self->_acAccountID);
  id v10 = objc_alloc(MEMORY[0x1E4F25DC0]);
  __int16 v11 = [v6 accountDescription];
  long long v12 = (void *)[v10 initWithIdentifier:v9 displayName:v11 pathRelativeToDocumentStorage:@"Library/Mobile Documents" hidden:0];

  uint64_t v13 = (void *)MEMORY[0x1E4F25DE0];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__BRCAccountHandler_addFileProviderDomainForAccount_error___block_invoke;
  v25[3] = &unk_1E6994360;
  id v14 = v12;
  id v26 = v14;
  id v28 = &v29;
  long long v15 = v7;
  v27 = v15;
  [v13 addDomain:v14 forProviderIdentifier:v8 completionHandler:v25];
  char v16 = brc_bread_crumbs();
  char v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v36 = v14;
    __int16 v37 = 2112;
    objc_super v38 = v16;
    _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] Waiting for fileprovider to add domain %@%@", buf, 0x16u);
  }

  int64_t v18 = brc_interval_to_nsec();
  dispatch_time_t v19 = dispatch_time(0, v18);
  if (dispatch_group_wait(v15, v19)) {
    __assert_rtn("-[BRCAccountHandler addFileProviderDomainForAccount:error:]", "BRCAccountHandler.m", 654, "timeout == 0");
  }
  if (a4) {
    *a4 = (id) v30[5];
  }
  long long v20 = v27;
  id v21 = v14;

  _Block_object_dispose(&v29, 8);
  return v21;
}

void __59__BRCAccountHandler_addFileProviderDomainForAccount_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138412802;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    long long v15 = v4;
    _os_log_error_impl(&dword_1D353B000, v5, (os_log_type_t)0x90u, "[ERROR] Added domain %@ with error: %@%@", (uint8_t *)&v10, 0x20u);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
  id v8 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)jetsamCloudDocsApps
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx jetsaming clients%@", (void)v3, DWORD2(v3));
}

- (void)__destroySessionWithIntents:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self->_session;
  if (!v5)
  {
    id v54 = brc_bread_crumbs();
    v55 = brc_default_log();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler __destroySessionWithIntents:].cold.5();
    }
  }
  uint64_t v6 = [(BRCAccountSession(LegacyAdditions) *)v5 fsReader];
  [v6 resume];

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  int v7 = [(BRCAccountSession *)v5 fsEventsMonitors];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v74 objects:v81 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v75;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v75 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v74 + 1) + 8 * i) resume];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v74 objects:v81 count:16];
    }
    while (v9);
  }

  __int16 v12 = [(BRCAccountSession *)v5 applyScheduler];
  [v12 resume];

  [(BRCAccountSession *)v5 preventDatabaseFromBeingReused];
  id v13 = NSString;
  __int16 v14 = [(BRCAccountHandler *)self accountPath];
  long long v15 = objc_msgSend(v13, "brc_accountIDPathForAccountPath:", v14);

  if (!v15) {
    goto LABEL_13;
  }
  uint64_t v16 = brc_bread_crumbs();
  char v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountHandler __destroySessionWithIntents:].cold.4();
  }

  if ((BRCRecursiveRemove(v15) & 0x80000000) != 0)
  {
    int v48 = *__error();
    v49 = brc_bread_crumbs();
    uint64_t v50 = brc_default_log();
    if (os_log_type_enabled(v50, (os_log_type_t)0x90u)) {
      -[BRCAccountHandler __destroySessionWithIntents:]();
    }

    *__error() = v48;
  }
  else
  {
LABEL_13:
    __int16 v64 = v4;
    id v61 = v15;
    v62 = self;
    [(BRCAccountSession *)v5 stopDBWatcher];
    int64_t v18 = [MEMORY[0x1E4F1CA48] array];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __49__BRCAccountHandler___destroySessionWithIntents___block_invoke;
    v72[3] = &unk_1E6994388;
    id v19 = v18;
    id v73 = v19;
    [(BRCAccountSession *)v5 enumerateAppLibraries:v72];
    long long v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    id v21 = dispatch_queue_attr_make_with_autorelease_frequency(v20, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("session-watchdog", v21);

    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __49__BRCAccountHandler___destroySessionWithIntents___block_invoke_2;
    v69[3] = &unk_1E6993628;
    id v24 = v5;
    __int16 v70 = v24;
    int v25 = v23;
    uint64_t v71 = v25;
    id v26 = v22;
    v27 = v69;
    id v28 = (void *)MEMORY[0x1D9438760]();
    long long v78 = 0uLL;
    uint64_t v79 = 0;
    __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v78);
    uint64_t v29 = brc_bread_crumbs();
    v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      id v51 = v19;
      uint64_t v52 = v78;
      label = dispatch_queue_get_label(v26);
      *(_DWORD *)block = 134218498;
      *(void *)&void block[4] = v52;
      id v19 = v51;
      *(_WORD *)&block[12] = 2080;
      *(void *)&block[14] = label;
      *(_WORD *)&block[22] = 2112;
      v83 = v29;
      _os_log_debug_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
    }

    long long v86 = v78;
    uint64_t v87 = v79;
    *(void *)block = MEMORY[0x1E4F143A8];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = __dispatch_async_with_logs_block_invoke_3;
    v83 = &unk_1E6993710;
    uint64_t v31 = v26;
    v84 = v31;
    uint64_t v32 = v27;
    id v85 = v32;
    dispatch_async(v31, block);

    id v33 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v34 = [v33 logoutTimeout];

    dispatch_time_t v35 = dispatch_time(0, 1000000000 * v34);
    intptr_t v36 = dispatch_semaphore_wait(v25, v35);
    if (v36)
    {
      __int16 v37 = brc_bread_crumbs();
      objc_super v38 = brc_default_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountHandler __destroySessionWithIntents:]();
      }
    }
    uint64_t v59 = v34;
    v60 = v25;
    uint64_t v63 = v5;
    [(BRCAccountSession *)v24 destroyLocalDataWithPristineContainerIDs:v19];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v39 = v64;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v65 objects:v80 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v66 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = (void *)MEMORY[0x1E4F28CA0];
          uint64_t v45 = [*(id *)(*((void *)&v65 + 1) + 8 * j) URL];
          objc_msgSend(v44, "__itemAtURL:didDisconnectWithPurposeID:", v45, @"com.apple.bird");
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v65 objects:v80 count:16];
      }
      while (v41);
    }

    if (v36)
    {
      abc_report_panic_with_signature();
      objc_msgSend(NSString, "stringWithFormat:", @"timed out waiting for %u seconds for account session to close!", v59);
      objc_claimAutoreleasedReturnValue();
      v56 = brc_bread_crumbs();
      v57 = brc_default_log();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      v58 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountHandler __destroySessionWithIntents:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 747, v58);
    }
    session = v62->_session;
    v62->_session = 0;

    dbAccountDSID = v62->_dbAccountDSID;
    v62->_dbAccountDSID = 0;

    uint64_t v5 = v63;
    id v4 = v64;
    long long v15 = v61;
  }
}

uint64_t __49__BRCAccountHandler___destroySessionWithIntents___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = [a2 containerMetadata];
  if ([v3 isInInitialState])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 identifier];
    [v4 addObject:v5];
  }
  return 1;
}

intptr_t __49__BRCAccountHandler___destroySessionWithIntents___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) close];
  os_log_t v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

- (void)_destroyCurrentSessionSynchronously
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx destroying current session%@", (void)v3, DWORD2(v3));
}

uint64_t __56__BRCAccountHandler__destroyCurrentSessionSynchronously__block_invoke(uint64_t a1, uint64_t a2)
{
  long long v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = [*(id *)(a1 + 32) dirPathForSyncedFolderType:a2];
  uint64_t v5 = [v3 fileURLWithPath:v4];

  uint64_t v6 = [MEMORY[0x1E4F28C98] writingIntentWithURL:v5 options:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) addObject:v6];

  return 1;
}

void __56__BRCAccountHandler__destroyCurrentSessionSynchronously__block_invoke_2(uint64_t a1)
{
  obuint64_t j = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "__destroySessionWithIntents:", *(void *)(a1 + 40));
  }
  objc_sync_exit(obj);
}

void __56__BRCAccountHandler__destroyCurrentSessionSynchronously__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v18 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  long long v3 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = a1;
  obuint64_t j = *(id *)(a1 + 40);
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v9 = brc_bread_crumbs();
        uint64_t v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          __int16 v14 = [v8 URL];
          *(_DWORD *)buf = 138412546;
          int v25 = v14;
          __int16 v26 = 2112;
          id v27 = v9;
          _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] got coordinated write access for %@%@", buf, 0x16u);
        }
        if ([v3 length]) {
          uint64_t v11 = @", ";
        }
        else {
          uint64_t v11 = &stru_1F2AC7720;
        }
        __int16 v12 = [v8 URL];
        id v13 = [v12 path];
        [v3 appendFormat:@"%@'%@'", v11, v13];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v5);
  }

  if (v18)
  {
    long long v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      int v25 = v3;
      __int16 v26 = 2112;
      id v27 = v18;
      __int16 v28 = 2112;
      uint64_t v29 = v15;
      _os_log_fault_impl(&dword_1D353B000, v16, OS_LOG_TYPE_FAULT, "[CRIT] Can't acquire coordinated disconnect at {%@}: %@, proceeding anyway%@", buf, 0x20u);
    }
  }
  else
  {
    long long v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __56__BRCAccountHandler__destroyCurrentSessionSynchronously__block_invoke_3_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(v17 + 56) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v17 + 48));
}

- (id)ubiquityTokenSalt
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  ubiquityTokenSalt = v2->_ubiquityTokenSalt;
  if (ubiquityTokenSalt)
  {
    uint64_t v4 = ubiquityTokenSalt;
LABEL_5:
    int v14 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v6 = [(BRCAccountHandler *)v2 accountPath];
  int v7 = [v5 fileURLWithPath:v6 isDirectory:1];

  uint64_t v8 = [NSString ubiquityTokenSaltFilename];
  uint64_t v9 = [v7 URLByAppendingPathComponent:v8];

  id v42 = 0;
  uint64_t v10 = [NSString stringWithContentsOfURL:v9 encoding:4 error:&v42];
  id v11 = v42;
  __int16 v12 = v2->_ubiquityTokenSalt;
  v2->_ubiquityTokenSalt = (NSString *)v10;

  id v13 = v2->_ubiquityTokenSalt;
  if (v13)
  {
    uint64_t v4 = v13;

    goto LABEL_5;
  }
  uint64_t v16 = [v11 domain];
  if (![v16 isEqualToString:*MEMORY[0x1E4F281F8]])
  {

    goto LABEL_15;
  }
  BOOL v17 = [v11 code] == 260;

  if (!v17)
  {
LABEL_15:
    id v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
      -[BRCAccountHandler ubiquityTokenSalt]();
    }

    long long v20 = brc_bread_crumbs();
    long long v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler ubiquityTokenSalt]();
    }
  }
  long long v22 = brc_bread_crumbs();
  long long v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v22;
    _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEFAULT, "[NOTICE] generating new ubiquity token%@", buf, 0xCu);
  }

  id v24 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v25 = [v24 UUIDString];
  __int16 v26 = v2->_ubiquityTokenSalt;
  v2->_ubiquityTokenSalt = (NSString *)v25;

  id v27 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v41 = v11;
  char v28 = [v27 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v41];
  uint64_t v4 = v41;

  if (v28)
  {
    uint64_t v29 = v2->_ubiquityTokenSalt;
    uint64_t v40 = v4;
    BOOL v30 = [(NSString *)v29 writeToURL:v9 atomically:1 encoding:4 error:&v40];
    uint64_t v31 = v40;

    if (v30)
    {
      uint64_t v4 = dispatch_get_global_queue(0, 0);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __38__BRCAccountHandler_ubiquityTokenSalt__block_invoke;
      v38[3] = &unk_1E6993698;
      id v39 = v9;
      id v32 = v9;
      dispatch_async(v4, v38);
    }
    else
    {
      uint64_t v4 = brc_bread_crumbs();
      dispatch_time_t v35 = brc_default_log();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        __int16 v37 = [v9 path];
        *(_DWORD *)buf = 138412802;
        v44 = v37;
        __int16 v45 = 2112;
        v46 = v31;
        __int16 v47 = 2112;
        int v48 = v4;
        _os_log_error_impl(&dword_1D353B000, v35, (os_log_type_t)0x90u, "[ERROR] failed writing salt data to '%@': %@%@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v33 = brc_bread_crumbs();
    uint64_t v34 = brc_default_log();
    if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
    {
      intptr_t v36 = [v7 path];
      *(_DWORD *)buf = 138412802;
      v44 = v36;
      __int16 v45 = 2112;
      v46 = v4;
      __int16 v47 = 2112;
      int v48 = v33;
      _os_log_error_impl(&dword_1D353B000, v34, (os_log_type_t)0x90u, "[ERROR] failed creating salt directory '%@': %@%@", buf, 0x20u);
    }
  }
  int v14 = 1;
LABEL_6:
  objc_sync_exit(v2);

  if (v14) {
    uint64_t v4 = v2->_ubiquityTokenSalt;
  }
  return v4;
}

void __38__BRCAccountHandler_ubiquityTokenSalt__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9438760]();
  long long v3 = *(void **)(a1 + 32);
  uint64_t v4 = *MEMORY[0x1E4F1C630];
  id v10 = 0;
  char v5 = [v3 setResourceValue:MEMORY[0x1E4F1CC38] forKey:v4 error:&v10];
  id v6 = v10;
  if ((v5 & 1) == 0)
  {
    int v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v9 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412802;
      __int16 v12 = v9;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_error_impl(&dword_1D353B000, v8, (os_log_type_t)0x90u, "[ERROR] failed excluding salt data at '%@' from backups: %@%@", buf, 0x20u);
    }
  }
}

- (BOOL)checkEnoughDiskSpaceToBeFunctional
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v3 = objc_msgSend(NSString, "br_currentSupportDir");
  uint64_t v4 = [v2 attributesOfFileSystemForPath:v3 error:0];

  char v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F283A0]];
  id v6 = brc_bread_crumbs();
  int v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountHandler checkEnoughDiskSpaceToBeFunctional]();
  }

  BOOL v10 = 1;
  if (v5)
  {
    uint64_t v8 = +[BRCUserDefaults defaultsForMangledID:0];
    unint64_t v9 = [v8 minimumDiskSpaceRequiredToBeFunctional];

    if ([v5 unsignedLongLongValue] < v9) {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unsigned)_handleOpenError:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_msgSend(v4, "brc_isOutOfSpaceError") & 1) != 0
    || (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 85) & 1) != 0
    || ![(BRCAccountHandler *)self checkEnoughDiskSpaceToBeFunctional])
  {
    uint64_t v8 = brc_bread_crumbs();
    unsigned __int8 v7 = 1;
    unint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _handleOpenError:]();
    }

    self->_doesNotHaveEnoughDiskSpaceToBeFunctional = 1;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 121))
  {
    char v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _handleOpenError:]();
    }

    unsigned __int8 v7 = 1;
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 99))
  {
    id v11 = brc_bread_crumbs();
    __int16 v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _handleOpenError:]();
    }

    unsigned __int8 v7 = 5;
    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "br_isCloudDocsErrorCode:", 81) & 1) == 0
    && !objc_msgSend(v4, "br_isCloudDocsErrorCode:", 92))
  {
    goto LABEL_29;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  __int16 v13 = [v4 underlyingErrors];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v59 count:16];
  if (!v14) {
    goto LABEL_28;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v50;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v50 != v16) {
        objc_enumerationMutation(v13);
      }
      id v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      if (objc_msgSend(v18, "br_isPOSIXErrorCode:", 13))
      {
        __int16 v26 = brc_bread_crumbs();
        id v27 = brc_default_log();
        unsigned __int8 v7 = 2;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _handleOpenError:].cold.6();
        }
LABEL_50:

LABEL_51:
        goto LABEL_11;
      }
      if (objc_msgSend(v18, "br_isNSXPCConnectionError"))
      {
        __int16 v26 = brc_bread_crumbs();
        id v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _handleOpenError:].cold.7();
        }
        goto LABEL_49;
      }
      if (objc_msgSend(v18, "fp_isFileProviderError:", -2001))
      {
        __int16 v26 = brc_bread_crumbs();
        id v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _handleOpenError:].cold.8();
        }
LABEL_49:
        unsigned __int8 v7 = 5;
        goto LABEL_50;
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v59 count:16];
  }
  while (v15);
LABEL_28:

LABEL_29:
  if (objc_msgSend(v4, "br_isCloudDocsErrorCode:", 116))
  {
    id v19 = brc_bread_crumbs();
    long long v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v56 = v4;
      __int16 v57 = 2112;
      v58 = v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEFAULT, "[NOTICE] Got %@ while opening account. Exiting without an error%@", buf, 0x16u);
    }

    unsigned __int8 v7 = 2;
    goto LABEL_11;
  }
  if (!objc_msgSend(v4, "br_isCloudDocsErrorCode:", 100)) {
    goto LABEL_64;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  __int16 v13 = [v4 underlyingErrors];
  uint64_t v21 = [v13 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (!v21) {
    goto LABEL_63;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v46;
LABEL_36:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v46 != v23) {
      objc_enumerationMutation(v13);
    }
    uint64_t v25 = *(void **)(*((void *)&v45 + 1) + 8 * v24);
    if (objc_msgSend(v25, "br_isCocoaErrorCode:", 4101)) {
      break;
    }
    if (v22 == ++v24)
    {
      uint64_t v22 = [v13 countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (!v22) {
        goto LABEL_63;
      }
      goto LABEL_36;
    }
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  obuint64_t j = [v25 underlyingErrors];
  uint64_t v28 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (!v28) {
    goto LABEL_62;
  }
  uint64_t v29 = v28;
  uint64_t v30 = *(void *)v42;
  uint64_t v31 = *MEMORY[0x1E4FBA910];
  while (2)
  {
    uint64_t v32 = 0;
    while (2)
    {
      if (*(void *)v42 != v30) {
        objc_enumerationMutation(obj);
      }
      id v33 = *(void **)(*((void *)&v41 + 1) + 8 * v32);
      if ((objc_msgSend(v33, "fp_isFileProviderInternalError:", 12) & 1) != 0
        || ([v33 domain],
            uint64_t v34 = objc_claimAutoreleasedReturnValue(),
            int v35 = [v34 isEqualToString:v31],
            v34,
            v35))
      {
        intptr_t v36 = brc_bread_crumbs();
        __int16 v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _handleOpenError:].cold.4();
        }

        unsigned __int8 v7 = 5;
        goto LABEL_71;
      }
      if (objc_msgSend(v33, "br_isPOSIXErrorCode:", 28))
      {
        objc_super v38 = brc_bread_crumbs();
        unsigned __int8 v7 = 1;
        id v39 = brc_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _handleOpenError:].cold.5();
        }

        self->_doesNotHaveEnoughDiskSpaceToBeFunctional = 1;
LABEL_71:

        goto LABEL_51;
      }
      if (v29 != ++v32) {
        continue;
      }
      break;
    }
    uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v29) {
      continue;
    }
    break;
  }
LABEL_62:

LABEL_63:
LABEL_64:
  unsigned __int8 v7 = 6;
LABEL_11:

  return v7;
}

- (id)waitForSessionDBLoadingBarrier
{
  id location = 0;
  [(BRCBarrier *)self->_accountLoadingBarrier waitForBarrier];
  long long v3 = self->_accountLoadingBarrier;
  objc_sync_enter(v3);
  WeakRetained = (BRCAccountSession *)objc_loadWeakRetained((id *)&self->_loadingSession);
  session = WeakRetained;
  if (!WeakRetained) {
    session = self->_session;
  }
  objc_storeWeak(&location, session);

  objc_sync_exit(v3);
  id v6 = objc_loadWeakRetained(&location);
  unsigned __int8 v7 = [v6 dbLoadingBarrier];
  [v7 waitForBarrier];

  id v8 = objc_loadWeakRetained(&location);
  objc_destroyWeak(&location);
  return v8;
}

- (unsigned)_tryToOpenSession:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned __int8 v7 = self->_accountLoadingBarrier;
  objc_sync_enter(v7);
  objc_storeWeak((id *)&self->_loadingSession, v6);
  objc_sync_exit(v7);

  [(BRCBarrier *)self->_accountLoadingBarrier signalBarrier];
  v17[0] = 0;
  char v8 = [v6 openWithError:v17 pushWorkloop:self->_pushWorkloop];
  id v9 = v17[0];
  if (v8)
  {
    unsigned __int8 v10 = 0;
  }
  else
  {
    id v11 = brc_bread_crumbs();
    __int16 v12 = brc_default_log();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      -[BRCAccountHandler _tryToOpenSession:error:].cold.5();
    }

    unsigned __int8 v10 = [(BRCAccountHandler *)self _handleOpenError:v9];
    id v9 = v9;
    if (v9)
    {
      __int16 v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        uint64_t v16 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v19 = "-[BRCAccountHandler _tryToOpenSession:error:]";
        __int16 v20 = 2080;
        if (!a4) {
          uint64_t v16 = "(ignored by caller)";
        }
        uint64_t v21 = v16;
        __int16 v22 = 2112;
        id v23 = v9;
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        _os_log_error_impl(&dword_1D353B000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v9;
    }
  }
  return v10;
}

- (BOOL)_shouldRetryOpenSession:(unsigned __int8)a3
{
  return a3 == 6 || (a3 & 0xFE) == 4;
}

- (BOOL)_shouldResetLocalData:(id)a3
{
  return objc_msgSend(a3, "br_isCloudDocsErrorCode:", 100);
}

- (BOOL)_loadOnDiskAccountSessionWithError:(id *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [(BRCAccountHandler *)self reloadSyncedFolderPolicies];
  id v4 = [BRCAccountSession alloc];
  acAccountID = self->_acAccountID;
  id v6 = (void *)MEMORY[0x1E4F594B8];
  unsigned __int8 v7 = [(BRCAccountHandler *)self accountPath];
  char v8 = objc_msgSend(v6, "brc_dbAccountDSIDForPath:", v7);
  id v9 = [(BRCAccountHandler *)self ubiquityTokenSalt];
  unsigned __int8 v10 = [(BRCAccountSession *)v4 initWithACAccountID:acAccountID dbAccountDSID:v8 salt:v9 accountHandler:self];

  id v32 = 0;
  uint64_t v11 = [(BRCAccountHandler *)self _tryToOpenSession:v10 error:&v32];
  id v12 = v32;
  if (!v11) {
    goto LABEL_4;
  }
  if (![(BRCAccountHandler *)self _shouldRetryOpenSession:v11])
  {
    if ([(BRCAccountHandler *)self _shouldResetLocalData:v12])
    {
      [(BRCAccountSession *)v10 closeAndResetLocalStateWithDescription:@"Reset Local State" error:v12];
    }
    else
    {
      [(BRCAccountSession *)v10 close];
      id v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v34 = v12;
        __int16 v35 = 2112;
        intptr_t v36 = v18;
        _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Capturing account session open error of the first try: %@%@", buf, 0x16u);
      }

      [(BRCAccountSession *)v10 captureSessionOpenFailedInfoWithError:v12];
    }
    if (v11 == 2)
    {
      id v27 = brc_bread_crumbs();
      uint64_t v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountHandler _loadOnDiskAccountSessionWithError:]();
      }

      exit(0);
    }
    if (v11 == 3)
    {
      __int16 v20 = [v12 userInfo];
      uint64_t v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      __int16 v22 = [v12 userInfo];
      uint64_t v23 = [v22 objectForKeyedSubscript:@"SqliteSQL"];

      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Unable to open account: %@ (underlying: %@, sql: %@)\n", v12, v21, v23];
      objc_claimAutoreleasedReturnValue();
      __int16 v24 = brc_bread_crumbs();
      uint64_t v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      uint64_t v26 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountHandler _loadOnDiskAccountSessionWithError:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 1133, v26);
    }
    if (v11 != 1)
    {
      uint64_t v30 = brc_bread_crumbs();
      uint64_t v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountHandler _loadOnDiskAccountSessionWithError:]();
      }
    }
    goto LABEL_21;
  }
  if (![(BRCAccountHandler *)self _loadOnDiskAccountSessionSecondTry:v10 prevError:v12])
  {
LABEL_21:
    uint64_t v15 = self->_accountLoadingBarrier;
    objc_sync_enter(v15);
    objc_storeWeak((id *)&self->_loadingSession, 0);
    objc_sync_exit(v15);
    BOOL v17 = 0;
    goto LABEL_22;
  }
LABEL_4:
  __int16 v13 = self->_accountLoadingBarrier;
  objc_sync_enter(v13);
  objc_storeStrong((id *)&self->_session, v10);
  objc_storeWeak((id *)&self->_loadingSession, 0);
  objc_sync_exit(v13);

  id v14 = [(BRCAccountHandler *)self ubiquityTokenSalt];
  brc_bread_crumbs();
  uint64_t v15 = (BRCBarrier *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountHandler _loadOnDiskAccountSessionWithError:]();
  }

  BOOL v17 = 1;
LABEL_22:

  return v17;
}

- (BOOL)_loadOnDiskAccountSessionSecondTry:(id)a3 prevError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    objc_super v38 = brc_bread_crumbs();
    id v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:]0();
    }
  }
  if (objc_msgSend(v7, "br_isCloudDocsErrorCode:", 81))
  {
    char v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.7();
    }
    char v10 = 0;
    uint64_t v11 = @"CreateFPFSDomain";
  }
  else if (objc_msgSend(v7, "br_isCloudDocsErrorCode:", 92))
  {
    char v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.8();
    }
    char v10 = 0;
    uint64_t v11 = @"ImportFPFSDomain";
  }
  else
  {
    [v6 closeAndResetLocalStateWithDescription:@"Cannot open account session" error:v7];
    char v8 = brc_bread_crumbs();
    char v10 = 1;
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.9();
    }
    uint64_t v11 = 0;
  }

  id v50 = 0;
  unsigned int v12 = [(BRCAccountHandler *)self _tryToOpenSession:v6 error:&v50];
  id v13 = v50;
  if (v12)
  {
    char v46 = v10;
    long long v47 = v11;
    long long v48 = v6;
    id v45 = v7;
    id v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.6();
    }

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = self;
    BOOL v17 = [(BRCAccountHandler *)self accountPath];
    id v18 = [v17 stringByAppendingPathComponent:*MEMORY[0x1E4F593A0]];

    for (uint64_t i = 0; i != 5; ++i)
    {
      id v20 = v18;
      uint64_t v21 = open((const char *)[v20 fileSystemRepresentation], 4);
      __int16 v22 = NSString;
      if ((v21 & 0x80000000) != 0)
      {
        uint64_t v23 = __error();
        objc_msgSend(v22, "stringWithFormat:", @"#%lu FAIL %s", i, strerror(*v23));
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"#%lu fd = %d", i, v21);
      __int16 v24 = };
      [v16 addObject:v24];
    }
    uint64_t v25 = v47;
    id v6 = v48;
    if (v46)
    {
      if (objc_msgSend(v13, "br_isCloudDocsErrorCode:", 81))
      {
        uint64_t v25 = @"CreateFPFSDomain";
      }
      else
      {
        if (!objc_msgSend(v13, "br_isCloudDocsErrorCode:", 92)) {
          goto LABEL_27;
        }
        uint64_t v25 = @"ImportFPFSDomain";
      }
    }
    uint64_t v26 = +[BRCAutoBugCaptureReporter sharedABCReporter];
    [v26 captureLogsForOperationType:@"OpenAccountSession" ofSubtype:v25 forError:v13 underlyingError:0 waitForCompletion:1];

LABEL_27:
    id v27 = [v13 userInfo];
    uint64_t v28 = [v27 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    uint64_t v29 = [v13 userInfo];
    uint64_t v30 = [v29 objectForKeyedSubscript:@"SqliteSQL"];

    if ([(BRCAccountHandler *)v49 _shouldResetLocalData:v13])
    {
      [v48 closeAndResetLocalStateWithDescription:@"Reset Local State" error:v13];
    }
    else
    {
      [v48 close];
      uint64_t v31 = brc_bread_crumbs();
      id v32 = brc_default_log();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u)) {
        -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:].cold.5();
      }

      [v48 captureSessionOpenFailedInfoWithError:v13];
    }
    if (v12 <= 6)
    {
      if (((1 << v12) & 0x12) != 0)
      {
LABEL_39:
        if (v49->_doesNotHaveEnoughDiskSpaceToBeFunctional)
        {
          __int16 v35 = brc_bread_crumbs();
          intptr_t v36 = brc_default_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:]();
          }
        }
        id v7 = v45;
        goto LABEL_44;
      }
      if (((1 << v12) & 0x24) != 0)
      {
        uint64_t v40 = brc_bread_crumbs();
        long long v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          -[BRCAccountHandler _loadOnDiskAccountSessionWithError:]();
        }

        exit(0);
      }
      if (((1 << v12) & 0x48) != 0)
      {
        abc_report_panic_with_signature();
        [NSString stringWithFormat:@"Still unable to open account after attempted reset: %@ (underlying: %@, sql: %@)\nopen result: %@", v13, v28, v30, v16];
        objc_claimAutoreleasedReturnValue();
        long long v42 = brc_bread_crumbs();
        long long v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSession(BRCDatabaseManager) _startWatcher]();
        }

        brc_append_system_info_to_message();
        long long v44 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
        __assert_rtn("-[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/notifs/BRCAccountHandler.m", 1231, v44);
      }
    }
    id v33 = brc_bread_crumbs();
    id v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler _loadOnDiskAccountSessionSecondTry:prevError:]();
    }

    goto LABEL_39;
  }
LABEL_44:

  return v12 == 0;
}

- (BOOL)_createCurrentAccountSessionWithID:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  memset(v23, 0, sizeof(v23));
  __brc_create_section(0, (uint64_t)"-[BRCAccountHandler _createCurrentAccountSessionWithID:error:]", 1248, v23);
  id v7 = brc_bread_crumbs();
  char v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v25 = v23[0];
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    uint64_t v29 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating account session for %@%@", buf, 0x20u);
  }

  if (self->_session)
  {
    id v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler _createCurrentAccountSessionWithID:error:]();
    }

    if (self->_session)
    {
      id v20 = brc_bread_crumbs();
      uint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        session = self->_session;
        *(_DWORD *)buf = 138412546;
        uint64_t v25 = (uint64_t)session;
        __int16 v26 = 2112;
        id v27 = v20;
        _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] we are already logged in %@%@", buf, 0x16u);
      }

      [(BRCAccountHandler *)self _destroyCurrentSessionSynchronously];
    }
  }
  id v9 = (void *)MEMORY[0x1E4F594B8];
  char v10 = [(BRCAccountHandler *)self accountPath];
  uint64_t v11 = objc_msgSend(v9, "brc_dbAccountDSIDForPath:", v10);
  if (v11)
  {
    unsigned int v12 = (void *)MEMORY[0x1E4F594B8];
    id v13 = [(BRCAccountHandler *)self accountPath];
    id v14 = objc_msgSend(v12, "brc_dbAccountDSIDForPath:", v13);
    LOBYTE(v12) = [v14 isEqualToString:v6];

    if (v12) {
      goto LABEL_10;
    }
    char v10 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler _createCurrentAccountSessionWithID:error:]();
    }
  }
LABEL_10:
  if ([(BRCAccountHandler *)self setDBAccountDSID:v6]) {
    BOOL v16 = [(BRCAccountHandler *)self _loadOnDiskAccountSessionWithError:a4];
  }
  else {
    BOOL v16 = 0;
  }
  __brc_leave_section(v23);

  return v16;
}

- (void)_handleAccountWillChange
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [_dbAccountDSID isEqualToString:_session.accountDSID]%@", v2, v3, v4, v5, v6);
}

- (void)_handleAccountDidChange
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] can't create account session: %@%@");
}

+ (void)_migrateAccountIfNecessaryForAccountDSID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((int)BRGetMigrationStatusForDSID() <= 1)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Asking account status for %@%@", (uint8_t *)&v10, 0x16u);
    }

    uint8_t v6 = [(BRCAccountOnlinePerformer *)[BRCAccountMigrationChecker alloc] initWithDSID:v3];
    [(BRCAccountOnlinePerformer *)v6 resumeAndAutoClose];
  }
  if (BRGetMigrationStatusForDSID() == 2)
  {
    id v7 = brc_bread_crumbs();
    char v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Triggering migration for %@%@", (uint8_t *)&v10, 0x16u);
    }

    id v9 = [(BRCAccountOnlinePerformer *)[BRCAccountMigrator alloc] initWithDSID:v3];
    [(BRCAccountOnlinePerformer *)v9 resumeAndAutoClose];
  }
}

+ (id)currentiCloudAccount
{
  id v3 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v4 = objc_msgSend(v3, "br_accountForCurrentPersona");
  uint64_t v5 = brc_bread_crumbs();
  uint8_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[BRCAccountHandler currentiCloudAccount]();
  }

  if (v4)
  {
    if (([v4 isEnabledForDataclass:*MEMORY[0x1E4F17B38]] & 1) == 0)
    {
      id v7 = brc_bread_crumbs();
      char v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        +[BRCAccountHandler currentiCloudAccount]();
      }
    }
    if ((objc_msgSend(v4, "br_isEnabledForCloudDocs") & 1) == 0)
    {
      id v9 = brc_bread_crumbs();
      int v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        +[BRCAccountHandler currentiCloudAccount]();
      }
    }
    id v11 = objc_msgSend(v4, "br_dsid");
    [a1 _migrateAccountIfNecessaryForAccountDSID:v11];
  }
  return v4;
}

+ (id)currentiCloudAccountID
{
  uint64_t v2 = [a1 currentiCloudAccount];
  id v3 = objc_msgSend(v2, "br_dsid");

  return v3;
}

- (BOOL)waitForSessionLoading
{
  return [(BRCAccountHandler *)self _waitForSessionLoadingWhenNowStarting:0];
}

- (BOOL)_waitForSessionLoadingWhenNowStarting:(BOOL)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (self->_finishedLoading) {
    return 1;
  }
  if (!a3 && !self->_startedLoading) {
    return 0;
  }
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_265);
  if (self->_finishedLoading) {
    return 1;
  }
  uint8_t v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountHandler _waitForSessionLoadingWhenNowStarting:]();
  }

  return self->_finishedLoading;
}

- (BOOL)destroyCurrentAccountSynchronously
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F594B8], "brc_dbAccountDSIDForPath:", self->_accountPath);
  if (v3)
  {
    uint64_t v4 = [[BRCAccountSession alloc] initWithACAccountID:self->_acAccountID dbAccountDSID:v3 salt:0 accountHandler:0];
    [(BRCAccountSession *)v4 preventDatabaseFromBeingReused];
    uint64_t v5 = NSString;
    uint8_t v6 = [(BRCAccountHandler *)self accountPath];
    id v7 = objc_msgSend(v5, "brc_accountIDPathForAccountPath:", v6);

    if ([v7 length] && (BRCRecursiveRemove(v7) & 0x80000000) != 0)
    {
      int v9 = *__error();
      int v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        int v13 = 138413058;
        uint64_t v14 = v3;
        __int16 v15 = 2112;
        BOOL v16 = v7;
        __int16 v17 = 1024;
        int v18 = v9;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] can't remove account belonging to account %@ at %@ %{errno}d%@", (uint8_t *)&v13, 0x26u);
      }

      BOOL v8 = 0;
      *__error() = v9;
    }
    else
    {
      [(BRCAccountSession *)v4 destroyLocalData];
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_updateAccountToDSID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (BRDSIDString *)a3;
  dbAccountDSID = self->_dbAccountDSID;
  if (dbAccountDSID == v5 || [(BRDSIDString *)dbAccountDSID isEqualToString:v5])
  {
    id v7 = brc_bread_crumbs();
    BOOL v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountHandler _updateAccountToDSID:]();
    }
  }
  else
  {
    [(BRCAccountHandler *)self _handleAccountWillChange];
    int v9 = (void *)MEMORY[0x1E4F594B8];
    int v10 = [(BRCAccountHandler *)self accountPath];
    id v7 = objc_msgSend(v9, "brc_dbAccountDSIDForPath:", v10);

    if (!v7 || ([v7 isEqualToString:v5] & 1) != 0) {
      goto LABEL_14;
    }
    if (v5)
    {
      id v11 = brc_bread_crumbs();
      __int16 v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 138412802;
        uint64_t v14 = v7;
        __int16 v15 = 2112;
        BOOL v16 = v5;
        __int16 v17 = 2112;
        int v18 = v11;
        _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Cleaning up previous session belonging to account %@, to make room for new account %@%@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      id v11 = brc_bread_crumbs();
      __int16 v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountHandler _updateAccountToDSID:]();
      }
    }

    [(BRCAccountHandler *)self reloadSyncedFolderPoliciesDisableiCloudDesktop:1];
    if ([(BRCAccountHandler *)self destroyCurrentAccountSynchronously])
    {
LABEL_14:
      objc_storeStrong((id *)&self->_dbAccountDSID, a3);
      self->_hasSetMigrationComplete = 0;
      [(BRCAccountHandler *)self _handleAccountDidChange];
    }
  }
}

- (BOOL)destroySessionSynchronously
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__BRCAccountHandler_destroySessionSynchronously__block_invoke;
  block[3] = &unk_1E6993698;
  void block[4] = self;
  dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(queue, v4);

  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_267);
  return 1;
}

uint64_t __48__BRCAccountHandler_destroySessionSynchronously__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccountToDSID:0];
}

- (BOOL)createAccountSessionWithDSID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__BRCAccountHandler_createAccountSessionWithDSID_error___block_invoke;
  v10[3] = &unk_1E6993628;
  v10[4] = self;
  id v11 = v5;
  id v7 = v5;
  dispatch_block_t v8 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v10);
  dispatch_async(queue, v8);

  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_269);
  return 1;
}

uint64_t __56__BRCAccountHandler_createAccountSessionWithDSID_error___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return [*(id *)(a1 + 32) _updateAccountToDSID:*(void *)(a1 + 40)];
}

- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 completion:(id)a6
{
}

- (void)setMigrationStatus:(char)a3 forDSID:(id)a4 shouldUpdateAccount:(BOOL)a5 shouldPostAccountChangedNotification:(BOOL)a6 completion:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a7;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  dispatch_group_t v13 = dispatch_group_create();
  uint64_t v14 = [MEMORY[0x1E4F179C8] defaultStore];
  [v14 invalidateAccountForPersonaCache];
  migrationStatusSetterQueue = self->_migrationStatusSetterQueue;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke;
  v35[3] = &unk_1E6994428;
  id v39 = v42;
  id v29 = v11;
  id v36 = v29;
  char v40 = a3;
  BOOL v41 = a5;
  id v16 = v14;
  id v37 = v16;
  objc_super v38 = v13;
  __int16 v17 = v38;
  int v18 = migrationStatusSetterQueue;
  uint64_t v19 = v35;
  id v20 = (void *)MEMORY[0x1D9438760]();
  long long v44 = 0uLL;
  uint64_t v45 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_group_async_with_logs", 293, &v44);
  uint64_t v21 = brc_bread_crumbs();
  __int16 v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = v44;
    label = dispatch_queue_get_label(v18);
    *(_DWORD *)block = 134218498;
    *(void *)&void block[4] = v28;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    long long v47 = v21;
    _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v50 = v44;
  uint64_t v51 = v45;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __dispatch_group_async_with_logs_block_invoke;
  long long v47 = &unk_1E6993710;
  uint64_t v23 = v18;
  long long v48 = v23;
  __int16 v24 = v19;
  id v49 = v24;
  dispatch_group_async(v17, v23, block);

  uint64_t v25 = dispatch_get_global_queue(0, 0);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_272;
  v31[3] = &unk_1E6994450;
  id v32 = v12;
  id v33 = v42;
  BOOL v34 = a6;
  v31[4] = self;
  id v26 = v12;
  dispatch_group_notify(v17, v25, v31);

  _Block_object_dispose(v42, 8);
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = BRSetMigrationStatusForDSIDInPref() != 0;
  if (*(unsigned char *)(a1 + 65) && *(char *)(a1 + 64) >= 2)
  {
    uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "br_accountForCurrentPersona");
    id v3 = objc_msgSend(v2, "br_dsid");
    if ([v3 isEqualToString:*(void *)(a1 + 32)])
    {
      if (objc_msgSend(v2, "br_isCloudDocsMigrated"))
      {
        dispatch_block_t v4 = brc_bread_crumbs();
        id v5 = brc_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
          __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_cold_1();
        }
      }
      else
      {
        objc_msgSend(v2, "br_setCloudDocsMigrated:", 1);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        int v9 = *(void **)(a1 + 40);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_270;
        v11[3] = &unk_1E6994400;
        id v12 = v2;
        id v13 = *(id *)(a1 + 48);
        [v9 saveVerifiedAccount:v12 withCompletionHandler:v11];

        dispatch_block_t v4 = v12;
      }
    }
    else
    {
      if (v2)
      {
        dispatch_block_t v4 = brc_bread_crumbs();
        uint8_t v6 = brc_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          uint64_t v7 = [v3 UTF8String];
          uint64_t v8 = [*(id *)(a1 + 32) UTF8String];
          *(_DWORD *)buf = 136315650;
          uint64_t v15 = v7;
          __int16 v16 = 2080;
          uint64_t v17 = v8;
          __int16 v18 = 2112;
          uint64_t v19 = v4;
          _os_log_fault_impl(&dword_1D353B000, v6, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: the main account (%s) doesn't match the one we have (%s)%@", buf, 0x20u);
        }
      }
      else
      {
        dispatch_block_t v4 = brc_bread_crumbs();
        uint8_t v6 = brc_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [*(id *)(a1 + 32) UTF8String];
          *(_DWORD *)buf = 136315394;
          uint64_t v15 = v10;
          __int16 v16 = 2112;
          uint64_t v17 = (uint64_t)v4;
          _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] we seem to have logged out while migrating account (%s)%@", buf, 0x16u);
        }
      }
    }
  }
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_270(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    uint8_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_270_cold_1();
    }
  }
  else
  {
    uint8_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_error_impl(&dword_1D353B000, v7, (os_log_type_t)0x90u, "[ERROR] can't set the migrated bit on %@: %@%@", (uint8_t *)&v9, 0x20u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_272(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    && *(unsigned char *)(a1 + 56)
    && *(void *)(*(void *)(a1 + 32) + 32))
  {
    BRPostAccountTokenChangedNotification();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)markMigrationCompletedForDSID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = dispatch_get_global_queue(0, 0);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke;
  v16[3] = &unk_1E6993628;
  v16[4] = self;
  id v6 = v4;
  id v17 = v6;
  uint64_t v7 = v5;
  uint64_t v8 = v16;
  int v9 = (void *)MEMORY[0x1D9438760]();
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  __brc_create_section(0, (uint64_t)"brc_dispatch_async_autorelease_with_logs", 276, &v18);
  uint64_t v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = v18;
    label = dispatch_queue_get_label(v7);
    *(_DWORD *)block = 134218498;
    *(void *)&void block[4] = v14;
    *(_WORD *)&block[12] = 2080;
    *(void *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    uint64_t v21 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  long long v24 = v18;
  uint64_t v25 = v19;
  *(void *)block = MEMORY[0x1E4F143A8];
  *(void *)&block[8] = 3221225472;
  *(void *)&block[16] = __brc_dispatch_async_autorelease_with_logs_block_invoke;
  uint64_t v21 = &unk_1E6993710;
  id v12 = v7;
  __int16 v22 = v12;
  __int16 v13 = v8;
  id v23 = v13;
  dispatch_async(v12, block);
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F179C8] defaultStore];
  id v3 = v2;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 72))
  {
    objc_msgSend(v2, "br_accountForCurrentPersona");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = objc_msgSend(v4, "br_dsid");
    if ([v5 isEqualToString:*(void *)(a1 + 40)])
    {
      if (objc_msgSend(v4, "br_isCloudDocsMigrationComplete")
        && objc_msgSend(v4, "br_isCloudDocsMigrated"))
      {
        id v6 = brc_bread_crumbs();
        uint64_t v7 = brc_default_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_cold_1();
        }

        *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
        BRPostAccountTokenChangedNotification();
      }
      else
      {
        uint64_t v10 = brc_bread_crumbs();
        __int16 v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = (uint64_t)v5;
          __int16 v23 = 2112;
          uint64_t v24 = (uint64_t)v10;
          _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEFAULT, "[NOTICE] setting migration complete on %@%@", buf, 0x16u);
        }

        objc_msgSend(v4, "br_setCloudDocsMigrationComplete:", 1);
        objc_msgSend(v4, "br_setCloudDocsMigrated:", 1);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_273;
        v18[3] = &unk_1E6994400;
        uint64_t v12 = *(void *)(a1 + 32);
        id v19 = v4;
        uint64_t v20 = v12;
        id v4 = v4;
        [v3 saveVerifiedAccount:v4 withCompletionHandler:v18];
      }
    }
    else
    {
      if (!v4)
      {
        __int16 v13 = brc_bread_crumbs();
        uint64_t v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = [*(id *)(a1 + 40) UTF8String];
          *(_DWORD *)buf = 136315394;
          uint64_t v22 = v15;
          __int16 v23 = 2112;
          uint64_t v24 = (uint64_t)v13;
          _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] we seem to have logged out while migrating account (%s)%@", buf, 0x16u);
        }

        goto LABEL_16;
      }
      uint64_t v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        uint64_t v16 = [v5 UTF8String];
        uint64_t v17 = [*(id *)(a1 + 40) UTF8String];
        *(_DWORD *)buf = 136315650;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        uint64_t v24 = v17;
        __int16 v25 = 2112;
        uint64_t v26 = v8;
        _os_log_fault_impl(&dword_1D353B000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: the main account (%s) doesn't match the one we have (%s)%@", buf, 0x20u);
      }
    }
    __int16 v13 = v5;
    id v5 = v4;
LABEL_16:
  }
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_273(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 72) = 1;
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_273_cold_1();
    }

    BRPostAccountTokenChangedNotification();
  }
  else
  {
    uint64_t v8 = brc_bread_crumbs();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412802;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_error_impl(&dword_1D353B000, v9, (os_log_type_t)0x90u, "[ERROR] can't set the migrated bit on %@: %@%@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)reloadSyncedFolderPolicies
{
}

- (void)reloadSyncedFolderPoliciesDisableiCloudDesktop:(BOOL)a3
{
  [(BRCAccountHandler *)self setSyncPolicy:-1 forSyncedFolderType:1];
  BRPostAccountTokenChangedNotification();
}

- (int64_t)syncPolicyforSyncedFolderType:(unint64_t)a3
{
  if (a3 != 1)
  {
    uint64_t v10 = brc_bread_crumbs();
    int v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  syncPolicyByFolderType = self->_syncPolicyByFolderType;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)syncPolicyByFolderType objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v12 = brc_bread_crumbs();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  int64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (void)setSyncPolicy:(int64_t)a3 forSyncedFolderType:(unint64_t)a4
{
  if (a3 != -1 && a3 != 1)
  {
    uint64_t v7 = brc_bread_crumbs();
    int64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler setSyncPolicy:forSyncedFolderType:]();
    }
  }
  if (a4 != 1)
  {
    uint64_t v12 = brc_bread_crumbs();
    __int16 v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  int v9 = [NSNumber numberWithInteger:a3];
  syncPolicyByFolderType = self->_syncPolicyByFolderType;
  int v11 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)syncPolicyByFolderType setObject:v9 forKeyedSubscript:v11];
}

- (BOOL)finishedLoading
{
  return self->_finishedLoading;
}

- (BOOL)doesNotHaveEnoughDiskSpaceToBeFunctional
{
  return self->_doesNotHaveEnoughDiskSpaceToBeFunctional;
}

- (void)setDoesNotHaveEnoughDiskSpaceToBeFunctional:(BOOL)a3
{
  self->_doesNotHaveEnoughDiskSpaceToBeFunctional = a3;
}

- (NSString)acAccountID
{
  return self->_acAccountID;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (NSString)accountPath
{
  return self->_accountPath;
}

- (OS_dispatch_workloop)pushWorkloop
{
  return self->_pushWorkloop;
}

- (NSError)loggedOutError
{
  return self->_loggedOutError;
}

- (void)setLoggedOutError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggedOutError, 0);
  objc_storeStrong((id *)&self->_pushWorkloop, 0);
  objc_storeStrong((id *)&self->_acAccountID, 0);
  objc_storeStrong((id *)&self->_accountLoadingBarrier, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_syncPolicyByFolderType, 0);
  objc_storeStrong((id *)&self->_migrationStatusSetterQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dbAccountDSID, 0);
  objc_destroyWeak((id *)&self->_loadingSession);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_ubiquityTokenSalt, 0);
  objc_storeStrong((id *)&self->_accountPath, 0);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:userInfo:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] received a managed restriction changed notification - %@%@");
}

- (void)setDBAccountDSID:.cold.1()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, v0, v1, "[ERROR] can't delete account file %{errno}d%@");
}

- (void)setDBAccountDSID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] can't write account ID: %@%@");
}

- (void)setDBAccountDSID:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] failed to create account path: %@%@");
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(v0 + 112);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Signaling FP to resolve authentication errors for account %@%@", (void)v3, DWORD2(v3));
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: not loading account %@ because we cannot create set account id on disk%@", v1, 0x16u);
}

void __54__BRCAccountHandler_startAndLoadAccountSynchronously___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx deleting account on disk%@", (void)v3, DWORD2(v3));
}

- (void)addFileProviderDomainForAccount:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [account isDataSeparatedAccount]%@", v2, v3, v4, v5, v6);
}

- (void)__destroySessionWithIntents:.cold.2()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_15_0(&dword_1D353B000, v0, v1, "[CRIT] timed out waiting for %u seconds for account session to close!%@");
}

- (void)__destroySessionWithIntents:.cold.3()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, v0, v1, "[ERROR] can't remove account %{errno}d%@");
}

- (void)__destroySessionWithIntents:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] removing '%@'%@");
}

- (void)__destroySessionWithIntents:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: session%@", v2, v3, v4, v5, v6);
}

void __56__BRCAccountHandler__destroyCurrentSessionSynchronously__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] acquired coordinated disconnect at {%@}%@");
}

- (void)ubiquityTokenSalt
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] failed loading salt: %@%@");
}

- (void)checkEnoughDiskSpaceToBeFunctional
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Disk space available %@%@");
}

- (void)_handleOpenError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] No space on disk%@", v2, v3, v4, v5, v6);
}

- (void)_handleOpenError:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Volume not supported by FPFS%@", v2, v3, v4, v5, v6);
}

- (void)_handleOpenError:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Got %@ --> exit without failure.%@");
}

- (void)_handleOpenError:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Got %@ while trying to reimport items under the root container%@");
}

- (void)_handleOpenError:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] No space on disk to reimport items under the root container: %@%@");
}

- (void)_handleOpenError:.cold.6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Got %@ while import / add FP domain -> exit without failure%@");
}

- (void)_handleOpenError:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Got %@ while import / add FP domain -> FP probably crashing -> exit without failure%@");
}

- (void)_handleOpenError:.cold.8()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Got %@ while import / add FP domain -> something wrong on FP -> exit without failure%@");
}

- (void)_tryToOpenSession:error:.cold.1()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_12(&dword_1D353B000, "[ERROR] Your database is from the future, disabling iCloud Drive (%@)%@", v4, v5);
}

- (void)_tryToOpenSession:error:.cold.2()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_12(&dword_1D353B000, "[ERROR] Your database is from FPFS but we are in Legacy, disabling iCloud Drive (%@)%@", v4, v5);
}

- (void)_tryToOpenSession:error:.cold.3()
{
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_7(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_12(&dword_1D353B000, "[ERROR] %@%@", v4, v5);
}

- (void)_tryToOpenSession:error:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Failed to open account session: Exception [%@]%@");
}

- (void)_tryToOpenSession:error:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Failed to open account session: %@%@");
}

- (void)_loadOnDiskAccountSessionWithError:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*v1 sessionDirPath];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Starting up at %@%@", v3, 0x16u);
}

- (void)_loadOnDiskAccountSessionWithError:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: errorHandlingOnFailure == BRCFail%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionWithError:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Exit bird without panic%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Looks like we hit disk space issue on second try --> don't panic or exit%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: errorHandlingOnFailure == BRCRetryOrFail || errorHandlingOnFailure == BRCFail%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Capturing account session second open error: %@%@");
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.6()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to open account session second time%@", v1, 0xCu);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Failed adding FPFS domain. Skipping database reset and trying to open again%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.8()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Failed import FPFS domain. Skipping database reset and trying to open again%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Local session state has been resetted, try opening the session for the second time%@", v2, v3, v4, v5, v6);
}

- (void)_loadOnDiskAccountSessionSecondTry:prevError:.cold.10()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: prevError%@", v2, v3, v4, v5, v6);
}

- (void)_createCurrentAccountSessionWithID:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [BRDSIDString brc_dbAccountDSIDForPath:self.accountPath] == nil || [[BRDSIDString brc_dbAccountDSIDForPath:self.accountPath] isEqualToString:accountID]%@", v2, v3, v4, v5, v6);
}

- (void)_createCurrentAccountSessionWithID:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _session == nil%@", v2, v3, v4, v5, v6);
}

+ (void)currentiCloudAccount
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] current account is: %@%@");
}

- (void)_waitForSessionLoadingWhenNowStarting:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _finishedLoading%@", v2, v3, v4, v5, v6);
}

- (void)_updateAccountToDSID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Account hasn't really changed, do nothing%@", v2, v3, v4, v5, v6);
}

- (void)_updateAccountToDSID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Cleaning up session on disk belonging to account %@%@");
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] account property is already set%@", v2, v3, v4, v5, v6);
}

void __116__BRCAccountHandler_setMigrationStatus_forDSID_shouldUpdateAccount_shouldPostAccountChangedNotification_completion___block_invoke_270_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] saved the migration bit%@", v2, v3, v4, v5, v6);
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] migration already completed%@", v2, v3, v4, v5, v6);
}

void __51__BRCAccountHandler_markMigrationCompletedForDSID___block_invoke_273_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] saved the bit%@", v2, v3, v4, v5, v6);
}

- (void)syncPolicyforSyncedFolderType:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: syncPolicy%@", v2, v3, v4, v5, v6);
}

- (void)syncPolicyforSyncedFolderType:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: folderType >= BRCSyncedFolderTypeMin && folderType <= BRCSyncedFolderTypeMax%@", v2, v3, v4, v5, v6);
}

- (void)setSyncPolicy:forSyncedFolderType:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: syncPolicy == BRCSyncedFolderPolicyEnabled || syncPolicy == BRCSyncedFolderPolicyDisabled%@", v2, v3, v4, v5, v6);
}

@end