@interface ABCPersistentStoreController
- (ABCPersistentStoreController)init;
- (ABCPersistentStoreController)initWithDirectory:(id)a3;
- (ABCPersistentStoreController)initWithName:(id)a3 inDirectory:(id)a4;
- (ABCPersistentStoreControllerDelegate)delegate;
- (AnalyticsWorkspace)workspace;
- (BOOL)prepareWorkspaceWithDirectoryPath:(id)a3;
- (id)caseStorageAnalytics;
- (id)caseSummaryAnalytics;
- (id)caseUsageAnalytics;
- (id)prepareDataDirectoryWithName:(id)a3 containerPath:(id)a4;
- (id)uploadRecordAnalytics;
- (void)caseAttachmentsForAllDiagnosticCasesWithQueue:(id)a3 reply:(id)a4;
- (void)caseAttachmentsForDiagnosticCaseIDs:(id)a3 queue:(id)a4 reply:(id)a5;
- (void)cleanupDiagnosticCaseStorage;
- (void)cleanupDiagnosticCaseSummary;
- (void)cleanupDiagnosticCaseUsage;
- (void)cleanupUploadRecord;
- (void)removeAllCaseStorages;
- (void)removeCaseStorageWithID:(id)a3;
- (void)removeCaseStoragesWithCaseIDs:(id)a3;
- (void)removeCaseStoragesWithUUIDs:(id)a3;
- (void)save;
- (void)save:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)shutdown;
@end

@implementation ABCPersistentStoreController

- (ABCPersistentStoreController)initWithName:(id)a3 inDirectory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ABCPersistentStoreController;
  v8 = [(ABCPersistentStoreController *)&v20 init];
  if (v8)
  {
    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.autobugcapture.persistentStore", v9);
    storeQueue = v8->storeQueue;
    v8->storeQueue = (OS_dispatch_queue *)v10;

    v12 = [(ABCPersistentStoreController *)v8 prepareDataDirectoryWithName:v6 containerPath:v7];
    if ([v12 length])
    {
      v13 = v8->storeQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __57__ABCPersistentStoreController_initWithName_inDirectory___block_invoke;
      block[3] = &unk_263FC3430;
      v18 = v8;
      id v19 = v12;
      dispatch_async(v13, block);

      p_super = &v18->super;
    }
    else
    {
      p_super = persistenceLogHandle();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_209DBA000, p_super, OS_LOG_TYPE_ERROR, "Unable to prepare data directory. Will NOT initialize persistent storage", v16, 2u);
      }
    }
  }
  return v8;
}

uint64_t __57__ABCPersistentStoreController_initWithName_inDirectory___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareWorkspaceWithDirectoryPath:*(void *)(a1 + 40)];
}

- (ABCPersistentStoreController)initWithDirectory:(id)a3
{
  return [(ABCPersistentStoreController *)self initWithName:0 inDirectory:a3];
}

- (ABCPersistentStoreController)init
{
  v3 = +[ABCConfigurationManager autoBugCapturePrefix];
  v4 = +[ABCConfigurationManager defaultLibraryDirectory];
  v5 = [(ABCPersistentStoreController *)self initWithName:v3 inDirectory:v4];

  return v5;
}

- (AnalyticsWorkspace)workspace
{
  workspace = self->_workspace;
  if (workspace && self->workspaceReady) {
    v3 = workspace;
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)prepareDataDirectoryWithName:(id)a3 containerPath:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v7 = [MEMORY[0x263F08850] defaultManager];
    if (v5)
    {
      id v8 = [v6 stringByAppendingPathComponent:v5];
    }
    else
    {
      id v8 = v6;
    }
    dispatch_queue_t v10 = v8;
    id v17 = 0;
    int v11 = [v7 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v17];
    id v12 = v17;
    v13 = persistenceLogHandle();
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v10;
        _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "ABC data directory is ready at: %@", buf, 0xCu);
      }

      id v9 = v10;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = [v12 localizedFailureReason];
        *(_DWORD *)buf = 138412546;
        id v19 = v10;
        __int16 v20 = 2112;
        v21 = v15;
        _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_ERROR, "Unable to create ABC data directory: %@ (%@)", buf, 0x16u);
      }
      id v9 = 0;
    }
  }
  else
  {
    id v7 = persistenceLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Invalid container directory specified: %@", buf, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

- (BOOL)prepareWorkspaceWithDirectoryPath:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->tempWorkspace)
  {
    id v5 = persistenceLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Preparing workspace", buf, 2u);
    }

    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = +[AnalyticsWorkspace workspaceWithName:@"autobugcapture" atPath:v4 objectModelName:@"AutoBugCapture" objectModelBundle:v6 useReadOnly:0];
    tempWorkspace = self->tempWorkspace;
    self->tempWorkspace = v7;
  }
  ++prepareWorkspaceWithDirectoryPath__attempts;
  id v9 = persistenceLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "Bootstrapping persistent store", buf, 2u);
  }

  BOOL v10 = [(AnalyticsWorkspace *)self->tempWorkspace save];
  if (v10)
  {
    objc_storeStrong((id *)&self->_workspace, self->tempWorkspace);
    self->workspaceReady = 1;
    int v11 = persistenceLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEFAULT, "Workspace and persistent store is ready for use", buf, 2u);
    }

    id v12 = [(ABCPersistentStoreController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(__CFString *)v12 persistentStoreControllerReadyForUse:self];
    }
  }
  else
  {
    if (prepareWorkspaceWithDirectoryPath__attempts < 2)
    {
      id v12 = &stru_26BDE2C70;
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @" (%ld attempts)", prepareWorkspaceWithDirectoryPath__attempts);
      id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v13 = persistenceLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v23 = (unint64_t)v12;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "Workspace and persistent store failed to initialize.%@", buf, 0xCu);
    }

    if ((unint64_t)prepareWorkspaceWithDirectoryPath__attempts > 0x13)
    {
      v18 = persistenceLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_ERROR, "Exhausted retry attempts. Unable to provide a functioning workspace and persistent store", buf, 2u);
      }
    }
    else
    {
      unint64_t v14 = (unint64_t)(pow(1.5, (double)(prepareWorkspaceWithDirectoryPath__attempts - 1)) * 5.0);
      v15 = persistenceLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v23 = v14;
        _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_DEFAULT, "Retrying persistent store initialization after %lu seconds", buf, 0xCu);
      }

      dispatch_time_t v16 = dispatch_time(0, 1000000000 * v14);
      storeQueue = self->storeQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __66__ABCPersistentStoreController_prepareWorkspaceWithDirectoryPath___block_invoke;
      block[3] = &unk_263FC3430;
      void block[4] = self;
      id v21 = v4;
      dispatch_after(v16, storeQueue, block);
    }
  }

  return v10;
}

uint64_t __66__ABCPersistentStoreController_prepareWorkspaceWithDirectoryPath___block_invoke(uint64_t a1)
{
  v2 = persistenceLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Retrying persistent store initialization", v4, 2u);
  }

  return [*(id *)(a1 + 32) prepareWorkspaceWithDirectoryPath:*(void *)(a1 + 40)];
}

- (id)caseStorageAnalytics
{
  v3 = (void *)caseStorageAnalytics__caseStorageAnalytics;
  if (!caseStorageAnalytics__caseStorageAnalytics)
  {
    if (self->_workspace)
    {
      id v4 = [[DiagnosticCaseStorageAnalytics alloc] initWithWorkspace:self->_workspace withCache:0];
      id v5 = (void *)caseStorageAnalytics__caseStorageAnalytics;
      caseStorageAnalytics__caseStorageAnalytics = (uint64_t)v4;

      v3 = (void *)caseStorageAnalytics__caseStorageAnalytics;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (id)caseUsageAnalytics
{
  v3 = (void *)caseUsageAnalytics__caseUsageAnalytics;
  if (!caseUsageAnalytics__caseUsageAnalytics)
  {
    if (self->_workspace)
    {
      id v4 = [[DiagnosticCaseUsageAnalytics alloc] initWithWorkspace:self->_workspace withCache:0];
      id v5 = (void *)caseUsageAnalytics__caseUsageAnalytics;
      caseUsageAnalytics__caseUsageAnalytics = (uint64_t)v4;

      v3 = (void *)caseUsageAnalytics__caseUsageAnalytics;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (id)uploadRecordAnalytics
{
  v3 = (void *)uploadRecordAnalytics__uploadRecordAnalytics;
  if (!uploadRecordAnalytics__uploadRecordAnalytics)
  {
    if (self->_workspace)
    {
      id v4 = [[UploadRecordAnalytics alloc] initWithWorkspace:self->_workspace withCache:0];
      id v5 = (void *)uploadRecordAnalytics__uploadRecordAnalytics;
      uploadRecordAnalytics__uploadRecordAnalytics = (uint64_t)v4;

      v3 = (void *)uploadRecordAnalytics__uploadRecordAnalytics;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (id)caseSummaryAnalytics
{
  v3 = (void *)caseSummaryAnalytics__caseSummaryAnalytics;
  if (!caseSummaryAnalytics__caseSummaryAnalytics)
  {
    if (self->_workspace)
    {
      id v4 = [[DiagnosticCaseSummaryAnalytics alloc] initWithWorkspace:self->_workspace withCache:0];
      id v5 = (void *)caseSummaryAnalytics__caseSummaryAnalytics;
      caseSummaryAnalytics__caseSummaryAnalytics = (uint64_t)v4;

      v3 = (void *)caseSummaryAnalytics__caseSummaryAnalytics;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

- (void)save
{
}

- (void)save:(BOOL)a3
{
  storeQueue = self->storeQueue;
  if (a3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__ABCPersistentStoreController_save___block_invoke;
    block[3] = &unk_263FC2DC0;
    void block[4] = self;
    dispatch_sync(storeQueue, block);
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __37__ABCPersistentStoreController_save___block_invoke_2;
    v5[3] = &unk_263FC2DC0;
    v5[4] = self;
    dispatch_async(storeQueue, v5);
  }
}

void __37__ABCPersistentStoreController_save___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) workspace];
  [v1 save];
}

void __37__ABCPersistentStoreController_save___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) workspace];
  [v1 save];
}

- (void)shutdown
{
}

- (void)cleanupDiagnosticCaseUsage
{
  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__ABCPersistentStoreController_cleanupDiagnosticCaseUsage__block_invoke;
  block[3] = &unk_263FC2DC0;
  void block[4] = self;
  dispatch_async(storeQueue, block);
}

void __58__ABCPersistentStoreController_cleanupDiagnosticCaseUsage__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = persistenceLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Cleaning out old DiagnosticCaseUsage objects...", buf, 2u);
  }

  v3 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 dateByAddingTimeInterval:-1209600.0];

  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"lastSeen <= %@", v4];
  id v6 = [*(id *)(a1 + 32) caseUsageAnalytics];
  uint64_t v7 = [v6 removeEntitiesMatching:v5];
  id v8 = symptomsLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = 14;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "Removed %ld DiagnosticCaseUsage object(s) with lastSeen older than %d days.", buf, 0x12u);
  }
}

- (void)cleanupDiagnosticCaseStorage
{
  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ABCPersistentStoreController_cleanupDiagnosticCaseStorage__block_invoke;
  block[3] = &unk_263FC2DC0;
  void block[4] = self;
  dispatch_async(storeQueue, block);
}

void __60__ABCPersistentStoreController_cleanupDiagnosticCaseStorage__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = symptomsLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Cleaning out old DiagnosticCaseStorage objects...", buf, 2u);
  }

  v3 = [MEMORY[0x263EFF910] date];
  id v4 = [v3 dateByAddingTimeInterval:-864000.0];

  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K <= %@", @"timeStamp", v4];
  id v6 = [*(id *)(a1 + 32) caseStorageAnalytics];
  uint64_t v7 = [v6 removeEntitiesMatching:v5];
  id v8 = symptomsLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = 10;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "Removed %ld DiagnosticCaseStorage object(s) older than %d days.", buf, 0x12u);
  }
}

- (void)cleanupDiagnosticCaseSummary
{
  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ABCPersistentStoreController_cleanupDiagnosticCaseSummary__block_invoke;
  block[3] = &unk_263FC2DC0;
  void block[4] = self;
  dispatch_async(storeQueue, block);
}

void __60__ABCPersistentStoreController_cleanupDiagnosticCaseSummary__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = symptomsLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Cleaning out old DiagnosticCaseSummary objects...", (uint8_t *)&v14, 2u);
  }

  v3 = [*(id *)(a1 + 32) caseSummaryAnalytics];
  id v4 = +[ABCAdministrator sharedInstance];
  id v5 = [v4 configurationManager];
  uint64_t v6 = [v5 submittedCaseSummaryRetentionDays];

  uint64_t v7 = [v3 removeDiagnosticCaseSummariesWithState:1 olderThan:v6];
  id v8 = symptomsLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218240;
    uint64_t v15 = v7;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Removed %ld submitted object(s) older than %ld days.", (uint8_t *)&v14, 0x16u);
  }

  id v9 = +[ABCAdministrator sharedInstance];
  uint64_t v10 = [v9 configurationManager];
  uint64_t v11 = [v10 unsubmittedCaseSummaryRetentionDays];

  uint64_t v12 = [v3 removeDiagnosticCaseSummariesWithState:0 olderThan:v11];
  uint64_t v13 = symptomsLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218240;
    uint64_t v15 = v12;
    __int16 v16 = 2048;
    uint64_t v17 = v11;
    _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Removed %ld unsubmitted object(s) older than %ld days.", (uint8_t *)&v14, 0x16u);
  }
}

- (void)cleanupUploadRecord
{
  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__ABCPersistentStoreController_cleanupUploadRecord__block_invoke;
  block[3] = &unk_263FC2DC0;
  void block[4] = self;
  dispatch_async(storeQueue, block);
}

void __51__ABCPersistentStoreController_cleanupUploadRecord__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = symptomsLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Cleaning out orphaned UploadRecord objects...", (uint8_t *)&v7, 2u);
  }

  v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseStorage == NULL"];
  id v4 = [*(id *)(a1 + 32) uploadRecordAnalytics];
  uint64_t v5 = [v4 removeEntitiesMatching:v3];
  uint64_t v6 = symptomsLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = v5;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "Removed %ld orphaned UploadRecord object(s)", (uint8_t *)&v7, 0xCu);
  }
}

- (void)caseAttachmentsForAllDiagnosticCasesWithQueue:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__ABCPersistentStoreController_caseAttachmentsForAllDiagnosticCasesWithQueue_reply___block_invoke;
  block[3] = &unk_263FC50C0;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(storeQueue, block);
}

void __84__ABCPersistentStoreController_caseAttachmentsForAllDiagnosticCasesWithQueue_reply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) caseStorageAnalytics];
  v3 = [v2 fetchAllEntityDictionariesWithProperties:&unk_26BDF5F00];
  id v4 = (void *)[v3 copy];

  [*(id *)(*(void *)(a1 + 32) + 8) reset];
  uint64_t v5 = *(void **)(a1 + 48);
  if (v5)
  {
    id v6 = *(NSObject **)(a1 + 40);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __84__ABCPersistentStoreController_caseAttachmentsForAllDiagnosticCasesWithQueue_reply___block_invoke_2;
    v7[3] = &unk_263FC2E88;
    id v9 = v5;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

uint64_t __84__ABCPersistentStoreController_caseAttachmentsForAllDiagnosticCasesWithQueue_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)caseAttachmentsForDiagnosticCaseIDs:(id)a3 queue:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    storeQueue = self->storeQueue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __80__ABCPersistentStoreController_caseAttachmentsForDiagnosticCaseIDs_queue_reply___block_invoke;
    v12[3] = &unk_263FC50E8;
    v12[4] = self;
    id v13 = v8;
    id v15 = v10;
    id v14 = v9;
    dispatch_async(storeQueue, v12);
  }
}

void __80__ABCPersistentStoreController_caseAttachmentsForDiagnosticCaseIDs_queue_reply___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) caseStorageAnalytics];
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseID == %@", *(void *)(*((void *)&v18 + 1) + 8 * v8)];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v10 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v3];
  uint64_t v11 = [v2 fetchEntityDictionariesWithProperties:&unk_26BDF5F18 predicate:v10];
  id v12 = (void *)[v11 copy];

  [*(id *)(*(void *)(a1 + 32) + 8) reset];
  id v13 = *(void **)(a1 + 56);
  if (v13)
  {
    id v14 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __80__ABCPersistentStoreController_caseAttachmentsForDiagnosticCaseIDs_queue_reply___block_invoke_2;
    block[3] = &unk_263FC2E88;
    id v17 = v13;
    id v16 = v12;
    dispatch_async(v14, block);
  }
}

uint64_t __80__ABCPersistentStoreController_caseAttachmentsForDiagnosticCaseIDs_queue_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeCaseStoragesWithUUIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    storeQueue = self->storeQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__ABCPersistentStoreController_removeCaseStoragesWithUUIDs___block_invoke;
    v6[3] = &unk_263FC3430;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_async(storeQueue, v6);
  }
}

void __60__ABCPersistentStoreController_removeCaseStoragesWithUUIDs___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
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
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "UUIDString", (void)v9);
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 40) removeCaseStoragesWithCaseIDs:v2];
}

- (void)removeCaseStoragesWithCaseIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    storeQueue = self->storeQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__ABCPersistentStoreController_removeCaseStoragesWithCaseIDs___block_invoke;
    v6[3] = &unk_263FC3430;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(storeQueue, v6);
  }
}

void __62__ABCPersistentStoreController_removeCaseStoragesWithCaseIDs___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) caseStorageAnalytics];
  id v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseID == %@", *(void *)(*((void *)&v11 + 1) + 8 * v8)];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  long long v10 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v3];
  [v2 removeEntitiesMatching:v10];
}

- (void)removeCaseStorageWithID:(id)a3
{
  id v4 = a3;
  storeQueue = self->storeQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__ABCPersistentStoreController_removeCaseStorageWithID___block_invoke;
  v7[3] = &unk_263FC3430;
  id v8 = v4;
  long long v9 = self;
  id v6 = v4;
  dispatch_async(storeQueue, v7);
}

void __56__ABCPersistentStoreController_removeCaseStorageWithID___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F08A98];
  id v3 = [*(id *)(a1 + 32) UUIDString];
  [v2 predicateWithFormat:@"caseID == %@", v3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [*(id *)(a1 + 40) caseStorageAnalytics];
  [v4 removeEntitiesMatching:v5];
}

- (void)removeAllCaseStorages
{
  storeQueue = self->storeQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__ABCPersistentStoreController_removeAllCaseStorages__block_invoke;
  block[3] = &unk_263FC2DC0;
  void block[4] = self;
  dispatch_async(storeQueue, block);
}

void __53__ABCPersistentStoreController_removeAllCaseStorages__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v1 = [*(id *)(a1 + 32) caseStorageAnalytics];
  uint64_t v2 = [v1 removeAllDiagnosticCaseStorages];
  id v3 = casemanagementLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134217984;
    uint64_t v5 = v2;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_INFO, "Removed %ld cases from persistent store", (uint8_t *)&v4, 0xCu);
  }
}

- (ABCPersistentStoreControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ABCPersistentStoreControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->storeQueue, 0);
  objc_storeStrong((id *)&self->tempWorkspace, 0);

  objc_storeStrong((id *)&self->_workspace, 0);
}

@end