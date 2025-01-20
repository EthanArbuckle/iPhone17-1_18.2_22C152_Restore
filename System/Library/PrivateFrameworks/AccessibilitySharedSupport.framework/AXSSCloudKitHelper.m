@interface AXSSCloudKitHelper
- (APSConnection)apsConnection;
- (AXSSCloudKitHelper)initWithContainerIdentifier:(id)a3 zoneName:(id)a4;
- (BOOL)_checkAccountStatus:(id *)a3;
- (BOOL)_createSchemaIfNecessary:(id *)a3;
- (BOOL)_createZoneIfNecessary:(id *)a3;
- (BOOL)_setupPushConnection:(id *)a3;
- (BOOL)_setupZoneSubscriptionIfNecessary:(id *)a3;
- (BOOL)isProtectedDataAvailable;
- (BOOL)observeLocalDatabaseChanges;
- (BOOL)shouldExportManagedObject:(id)a3;
- (CKContainer)container;
- (CKDatabase)database;
- (CKRecordZone)recordZone;
- (CKRecordZoneSubscription)zoneSubscription;
- (Class)managedObjectClass;
- (NSError)lastInitializationError;
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentStore)observedStore;
- (NSPersistentStoreCoordinator)observedCoordinator;
- (NSString)containerIdentifier;
- (NSURL)largeBlobDirectoryURL;
- (OS_dispatch_queue)cloudkitQueue;
- (OS_dispatch_semaphore)cloudKitQueueSemaphore;
- (id)apsEnvironment;
- (id)cloudKitPushTopic;
- (id)createCKRecordFromObject:(id)a3;
- (id)recordType;
- (id)serverChangeTokenMetadataKey;
- (id)testRecordForSchemaCreation:(id)a3;
- (id)zoneCreatedKey;
- (id)zoneSubscriptionKey;
- (void)_initializeCloudkitForObservedStore;
- (void)_processAccumulatedQueueData;
- (void)_setApsConnection:(id)a3;
- (void)_setContainer:(id)a3;
- (void)_setDatabase:(id)a3;
- (void)_setObservedStore:(id)a3 observedCoordinator:(id)a4;
- (void)beginWatchingForChanges;
- (void)clearRecordsForPurging:(id)a3;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)dealloc;
- (void)fetchChangesAndUpdateObservedStore;
- (void)logMessage:(id)a3;
- (void)managedObjectContextDidSave:(id)a3;
- (void)observeChangesForManagedContext:(id)a3;
- (void)openTransactionWithLabel:(id)a3 andExecuteWorkBlock:(id)a4;
- (void)processAccumulatedChangesForServerChangeToken:(id)a3 withAccumulatedUpdates:(id)a4 andDeletes:(id)a5 inTransaction:(id)a6;
- (void)processLocalChangesAndPush;
- (void)processRecordDeletionsFromServer:(id)a3;
- (void)processServerUpdateChanges:(id)a3 moc:(id)a4 recordNameToManagedObject:(id)a5;
- (void)retrieveLocalChangesForCloud:(id)a3;
- (void)setIsProtectedDataAvailable:(BOOL)a3;
- (void)setObserveLocalDatabaseChanges:(BOOL)a3;
@end

@implementation AXSSCloudKitHelper

- (AXSSCloudKitHelper)initWithContainerIdentifier:(id)a3 zoneName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)AXSSCloudKitHelper;
  v9 = [(AXSSCloudKitHelper *)&v23 init];
  if (v9)
  {
    if (initWithContainerIdentifier_zoneName__onceToken != -1) {
      dispatch_once(&initWithContainerIdentifier_zoneName__onceToken, &__block_literal_global_6);
    }
    objc_storeStrong((id *)&v9->_containerIdentifier, a3);
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    cloudKitQueueSemaphore = v9->_cloudKitQueueSemaphore;
    v9->_cloudKitQueueSemaphore = (OS_dispatch_semaphore *)v10;

    objc_storeStrong((id *)&v9->_cloudkitQueue, (id)__sharedQueue);
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1A310]) initWithZoneName:v8];
    recordZone = v9->_recordZone;
    v9->_recordZone = (CKRecordZone *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4F1A340]);
    v15 = [(CKRecordZone *)v9->_recordZone zoneID];
    uint64_t v16 = [v14 initWithZoneID:v15 subscriptionID:@"com.apple.accessibility.zone.subscription"];
    zoneSubscription = v9->_zoneSubscription;
    v9->_zoneSubscription = (CKRecordZoneSubscription *)v16;

    v18 = [(AXSSCloudKitHelper *)v9 recordType];
    [(CKRecordZoneSubscription *)v9->_zoneSubscription setRecordType:v18];

    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    accumulatedQueuedData = v9->_accumulatedQueuedData;
    v9->_accumulatedQueuedData = (NSMutableArray *)v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F1A1E0]);
    [v21 setShouldSendContentAvailable:1];
    [(CKRecordZoneSubscription *)v9->_zoneSubscription setNotificationInfo:v21];
  }
  return v9;
}

uint64_t __59__AXSSCloudKitHelper_initWithContainerIdentifier_zoneName___block_invoke()
{
  __sharedQueue = (uint64_t)dispatch_queue_create("com.apple.coredata.cloudkit.queue", 0);

  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = self;
    _os_log_impl(&dword_1B3B9D000, v3, OS_LOG_TYPE_INFO, "Helper removed: %@", buf, 0xCu);
  }

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)AXSSCloudKitHelper;
  [(AXSSCloudKitHelper *)&v5 dealloc];
}

- (Class)managedObjectClass
{
  return 0;
}

- (void)observeChangesForManagedContext:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
  v6 = [v5 persistentStoreCoordinator];
  id v7 = [v6 persistentStores];
  uint64_t v8 = [v7 firstObject];

  v9 = [v5 persistentStoreCoordinator];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedStore);

  if (!WeakRetained)
  {
    objc_storeWeak((id *)&self->_observedStore, v8);
    objc_storeStrong((id *)&self->_observedCoordinator, v9);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__AXSSCloudKitHelper_observeChangesForManagedContext___block_invoke;
    v11[3] = &unk_1E606D0F8;
    v11[4] = self;
    [(AXSSCloudKitHelper *)self openTransactionWithLabel:@"com.apple.axcloudkithelper.initialize" andExecuteWorkBlock:v11];
  }
}

uint64_t __54__AXSSCloudKitHelper_observeChangesForManagedContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeCloudkitForObservedStore];
}

- (void)_initializeCloudkitForObservedStore
{
  id v16 = 0;
  BOOL v3 = [(AXSSCloudKitHelper *)self _checkAccountStatus:&v16];
  id v4 = v16;
  id v5 = v4;
  if (!v3) {
    goto LABEL_8;
  }
  id v15 = v4;
  BOOL v6 = [(AXSSCloudKitHelper *)self _createZoneIfNecessary:&v15];
  id v7 = v15;

  if (!v6) {
    goto LABEL_7;
  }
  id v14 = v7;
  BOOL v8 = [(AXSSCloudKitHelper *)self _setupZoneSubscriptionIfNecessary:&v14];
  id v5 = v14;

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_lastInitializationError, v5);
    v11 = [NSString stringWithFormat:@"CloudKit integration setup failed with error:\n%@", v5];
    [(AXSSCloudKitHelper *)self logMessage:v11];

    goto LABEL_9;
  }
  id v13 = v5;
  BOOL v9 = [(AXSSCloudKitHelper *)self _createSchemaIfNecessary:&v13];
  id v7 = v13;

  if (!v9)
  {
LABEL_7:
    id v5 = v7;
    goto LABEL_8;
  }
  id v12 = v7;
  BOOL v10 = [(AXSSCloudKitHelper *)self _setupPushConnection:&v12];
  id v5 = v12;

  if (!v10) {
    goto LABEL_8;
  }
  [(AXSSCloudKitHelper *)self beginWatchingForChanges];
  [(AXSSCloudKitHelper *)self fetchChangesAndUpdateObservedStore];
  [(AXSSCloudKitHelper *)self logMessage:@"Successfully set up CloudKit integration."];
LABEL_9:
}

- (BOOL)_checkAccountStatus:(id *)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__4;
  v39 = __Block_byref_object_dispose__4;
  id v40 = 0;
  if ([MEMORY[0x1E4F19EC8] currentProcessCanUseCloudKit])
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    id v5 = [MEMORY[0x1E4F19EC8] containerWithIdentifier:self->_containerIdentifier];
    container = self->_container;
    self->_container = v5;

    id v7 = self->_container;
    if (v7)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __42__AXSSCloudKitHelper__checkAccountStatus___block_invoke;
      v30[3] = &unk_1E606D120;
      v30[5] = &v31;
      v30[6] = &v35;
      v30[4] = self;
      [(CKContainer *)v7 accountStatusWithCompletionHandler:v30];
      dispatch_semaphore_wait((dispatch_semaphore_t)self->_cloudKitQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28588];
      id v13 = [NSString stringWithFormat:@"Failed to get a container back for the identifier: %@", self->_containerIdentifier];
      v46 = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      uint64_t v15 = [v12 errorWithDomain:@"AXCloudKitErrorDomain" code:0 userInfo:v14];
      id v16 = (void *)v36[5];
      v36[5] = v15;
    }
    v17 = v32;
    if (*((unsigned char *)v32 + 24))
    {
      v18 = [(CKContainer *)self->_container privateCloudDatabase];
      database = self->_database;
      self->_database = v18;

      v17 = v32;
      if (!self->_database)
      {
        *((unsigned char *)v32 + 24) = 0;
        v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v43 = *MEMORY[0x1E4F28588];
        id v21 = [NSString stringWithFormat:@"Failed to get a database back from -privateCloudDatabase for container: %@", self->_container];
        v44 = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        uint64_t v23 = [v20 errorWithDomain:@"AXCloudKitErrorDomain" code:0 userInfo:v22];
        v24 = (void *)v36[5];
        v36[5] = v23;

        v17 = v32;
      }
    }
    if (*((unsigned char *)v17 + 24))
    {
      v25 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = self->_container;
        *(_DWORD *)buf = 138412290;
        v42 = v26;
        _os_log_impl(&dword_1B3B9D000, v25, OS_LOG_TYPE_INFO, "Account status valid: %@", buf, 0xCu);
      }
    }
    else
    {
      v28 = self->_container;
      self->_container = 0;

      if (a3)
      {
        v29 = (void *)v36[5];
        if (v29) {
          *a3 = v29;
        }
      }
    }
    BOOL v11 = *((unsigned char *)v32 + 24) != 0;
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28588];
    v48[0] = @"Current process can't use cloud kit";
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    *a3 = [v8 errorWithDomain:@"AXCloudKitErrorDomain" code:0 userInfo:v9];

    BOOL v10 = (void *)v36[5];
    BOOL v11 = 0;
    if (v10) {
      *a3 = v10;
    }
  }
  _Block_object_dispose(&v35, 8);

  return v11;
}

void __42__AXSSCloudKitHelper__checkAccountStatus___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  uint64_t v5 = *(void *)(a1[5] + 8);
  if (a2 == 1)
  {
    *(unsigned char *)(v5 + 24) = 1;
  }
  else
  {
    *(unsigned char *)(v5 + 24) = 0;
    if (a2)
    {
      if (a2 == 3)
      {
        BOOL v6 = @"Unable to initialize without an iCloud account (CKAccountStatusNoAccount).";
      }
      else if (a2 == 2)
      {
        BOOL v6 = @"Unable to initialize without a valid iCloud account (CKAccountStatusRestricted).";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Unknown account status: %d", a2);
        BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      BOOL v6 = @"Unable to determine the status of the iCloud account (CKAccountStatusCouldNotDetermine).";
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 setObject:v6 forKey:*MEMORY[0x1E4F28588]];
    if (v13) {
      [v7 setObject:v13 forKey:*MEMORY[0x1E4F28A50]];
    }
    BOOL v8 = (void *)MEMORY[0x1E4F28C58];
    BOOL v9 = (void *)[v7 copy];
    uint64_t v10 = [v8 errorWithDomain:@"AXCloudKitErrorDomain" code:0 userInfo:v9];
    uint64_t v11 = *(void *)(a1[6] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[4] + 96));
}

- (id)zoneCreatedKey
{
  v2 = NSString;
  BOOL v3 = [(CKRecordZone *)self->_recordZone zoneID];
  id v4 = [v3 zoneName];
  uint64_t v5 = [v2 stringWithFormat:@"AXCloudKitZoneCreated-%@", v4];

  return v5;
}

- (id)zoneSubscriptionKey
{
  v2 = NSString;
  BOOL v3 = [(CKRecordZone *)self->_recordZone zoneID];
  id v4 = [v3 zoneName];
  uint64_t v5 = [v2 stringWithFormat:@"AXCloudKitSubscriptionCreated-%@", v4];

  return v5;
}

- (BOOL)_createZoneIfNecessary:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  id v31 = 0;
  uint64_t v5 = self->_recordZone;
  BOOL v6 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    recordZone = self->_recordZone;
    *(_DWORD *)buf = 138412290;
    v38 = recordZone;
    _os_log_impl(&dword_1B3B9D000, v6, OS_LOG_TYPE_INFO, "Creating zone: %@", buf, 0xCu);
  }

  BOOL v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v9 = [(AXSSCloudKitHelper *)self zoneCreatedKey];
  int v10 = [v8 BOOLForKey:v9];

  if (v10)
  {
    uint64_t v11 = AXLogPunctuationStorage();
    BOOL v12 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3B9D000, v11, OS_LOG_TYPE_INFO, "Already created zone", buf, 2u);
    }
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1A180]);
    v36 = v5;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    uint64_t v11 = [v13 initWithRecordZonesToSave:v14 recordZoneIDsToDelete:0];

    [v11 setQueuePriority:4];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __45__AXSSCloudKitHelper__createZoneIfNecessary___block_invoke;
    v21[3] = &unk_1E606D148;
    v24 = &v32;
    v25 = &v26;
    v22 = v5;
    uint64_t v23 = self;
    [v11 setModifyRecordZonesCompletionBlock:v21];
    [(CKDatabase *)self->_database addOperation:v11];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_cloudKitQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v33 + 24))
    {
      uint64_t v15 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = self->_recordZone;
        *(_DWORD *)buf = 138412290;
        v38 = v16;
        _os_log_impl(&dword_1B3B9D000, v15, OS_LOG_TYPE_INFO, "Zone created: %@", buf, 0xCu);
      }

      v17 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v18 = [(AXSSCloudKitHelper *)self zoneCreatedKey];
      [v17 setBool:1 forKey:v18];
    }
    else if (a3)
    {
      v20 = (void *)v27[5];
      if (v20) {
        *a3 = v20;
      }
    }
    BOOL v12 = *((unsigned char *)v33 + 24) != 0;
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v12;
}

void __45__AXSSCloudKitHelper__createZoneIfNecessary___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if ([a2 containsObject:a1[4]]) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[5] + 96));
}

- (BOOL)_createSchemaIfNecessary:(id *)a3
{
  v51[1] = *MEMORY[0x1E4F143B8];
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__4;
  v42 = __Block_byref_object_dispose__4;
  id v43 = 0;
  p_observedStore = &self->_observedStore;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedStore);
  id v7 = [WeakRetained metadata];
  BOOL v8 = [v7 objectForKey:@"AXCloudKitFinishedSchemaCheckKey"];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    *((unsigned char *)v45 + 24) = 1;
    goto LABEL_7;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  uint64_t v11 = NSString;
  BOOL v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v11 stringWithFormat:@"CD_FAKE_RECORD_%@", v12];
  id v14 = (void *)[v10 initWithRecordName:v13];

  uint64_t v15 = [(AXSSCloudKitHelper *)self testRecordForSchemaCreation:v14];
  id v16 = objc_alloc(MEMORY[0x1E4F1A198]);
  v51[0] = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  v18 = (void *)[v16 initWithRecordsToSave:v17 recordIDsToDelete:0];

  [v18 setQueuePriority:4];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __47__AXSSCloudKitHelper__createSchemaIfNecessary___block_invoke;
  v33[3] = &unk_1E606D148;
  id v19 = v15;
  v36 = &v44;
  uint64_t v37 = &v38;
  id v34 = v19;
  char v35 = self;
  [v18 setModifyRecordsCompletionBlock:v33];
  [(CKDatabase *)self->_database addOperation:v18];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_cloudKitQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v45 + 24))
  {
    id v20 = objc_alloc(MEMORY[0x1E4F1A198]);
    v50 = v14;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    v22 = (void *)[v20 initWithRecordsToSave:0 recordIDsToDelete:v21];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __47__AXSSCloudKitHelper__createSchemaIfNecessary___block_invoke_2;
    v28[3] = &unk_1E606D170;
    id v29 = v14;
    v30 = self;
    id v31 = &v44;
    uint64_t v32 = &v38;
    [v22 setModifyRecordsCompletionBlock:v28];
    [(CKDatabase *)self->_database addOperation:v22];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_cloudKitQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v22 = v18;
  }

  if (*((unsigned char *)v45 + 24))
  {
LABEL_7:
    uint64_t v23 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = objc_loadWeakRetained((id *)p_observedStore);
      *(_DWORD *)buf = 138412290;
      id v49 = v24;
      _os_log_impl(&dword_1B3B9D000, v23, OS_LOG_TYPE_INFO, "Schema created: %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if (a3)
  {
    v27 = (void *)v39[5];
    if (v27) {
      *a3 = v27;
    }
  }
LABEL_10:
  BOOL v25 = *((unsigned char *)v45 + 24) != 0;
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v25;
}

void __47__AXSSCloudKitHelper__createSchemaIfNecessary___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if ([a2 containsObject:a1[4]]) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[5] + 96));
}

void __47__AXSSCloudKitHelper__createSchemaIfNecessary___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v14 = a4;
  int v6 = [a3 containsObject:a1[4]];
  uint64_t v7 = *(void *)(a1[6] + 8);
  if (v6)
  {
    *(unsigned char *)(v7 + 24) = 1;
    id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 24));
    int v9 = [WeakRetained metadata];
    id v10 = (void *)[v9 mutableCopy];

    [v10 setObject:MEMORY[0x1E4F1CC38] forKey:@"AXCloudKitFinishedSchemaCheckKey"];
    id v11 = objc_loadWeakRetained((id *)(a1[5] + 24));
    [v11 setMetadata:v10];
  }
  else
  {
    *(unsigned char *)(v7 + 24) = 0;
    uint64_t v12 = *(void *)(a1[7] + 8);
    id v13 = v14;
    id v10 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[5] + 96));
}

- (BOOL)_setupZoneSubscriptionIfNecessary:(id *)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  char v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__4;
  uint64_t v32 = __Block_byref_object_dispose__4;
  id v33 = 0;
  uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v6 = [(AXSSCloudKitHelper *)self zoneSubscriptionKey];
  int v7 = [v5 BOOLForKey:v6];

  if (v7)
  {
    BOOL v8 = AXLogPunctuationStorage();
    BOOL v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3B9D000, v8, OS_LOG_TYPE_INFO, "Already setup zone subcription", buf, 2u);
    }
  }
  else
  {
    id v10 = self->_zoneSubscription;
    id v11 = objc_alloc(MEMORY[0x1E4F1A1B8]);
    v40[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    id v13 = (void *)[v11 initWithSubscriptionsToSave:v12 subscriptionIDsToDelete:0];

    [v13 setQueuePriority:4];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __56__AXSSCloudKitHelper__setupZoneSubscriptionIfNecessary___block_invoke;
    uint64_t v23 = &unk_1E606D148;
    BOOL v8 = v10;
    uint64_t v26 = &v34;
    v27 = &v28;
    id v24 = v8;
    BOOL v25 = self;
    [v13 setModifySubscriptionsCompletionBlock:&v20];
    -[CKDatabase addOperation:](self->_database, "addOperation:", v13, v20, v21, v22, v23);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_cloudKitQueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v35 + 24))
    {
      id v14 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        zoneSubscription = self->_zoneSubscription;
        *(_DWORD *)buf = 138412290;
        uint64_t v39 = zoneSubscription;
        _os_log_impl(&dword_1B3B9D000, v14, OS_LOG_TYPE_INFO, "Zone subscription created: %@", buf, 0xCu);
      }

      id v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v17 = [(AXSSCloudKitHelper *)self zoneSubscriptionKey];
      [v16 setBool:1 forKey:v17];
    }
    else if (a3)
    {
      id v19 = (void *)v29[5];
      if (v19) {
        *a3 = v19;
      }
    }
    BOOL v9 = *((unsigned char *)v35 + 24) != 0;
  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v9;
}

void __56__AXSSCloudKitHelper__setupZoneSubscriptionIfNecessary___block_invoke(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if ([a2 containsObject:a1[4]]) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1[5] + 96));
}

- (void)beginWatchingForChanges
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(AXSSCloudKitHelper *)self managedObjectContext];
    int v8 = 138412290;
    BOOL v9 = v4;
    _os_log_impl(&dword_1B3B9D000, v3, OS_LOG_TYPE_INFO, "Watching for changes now on: %@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F1BE30];
  id v7 = [(AXSSCloudKitHelper *)self managedObjectContext];
  [v5 addObserver:self selector:sel_managedObjectContextDidSave_ name:v6 object:v7];
}

- (void)openTransactionWithLabel:(id)a3 andExecuteWorkBlock:(id)a4
{
  id v6 = a4;
  [a3 cStringUsingEncoding:1];
  id v7 = (void *)os_transaction_create();
  cloudkitQueue = self->_cloudkitQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__AXSSCloudKitHelper_openTransactionWithLabel_andExecuteWorkBlock___block_invoke;
  v11[3] = &unk_1E606D198;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(cloudkitQueue, v11);
}

uint64_t __67__AXSSCloudKitHelper_openTransactionWithLabel_andExecuteWorkBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)shouldExportManagedObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectID];
  id v6 = [v5 persistentStore];
  id v7 = [(AXSSCloudKitHelper *)self observedStore];
  if (![v6 isEqual:v7])
  {

    goto LABEL_5;
  }
  [(AXSSCloudKitHelper *)self managedObjectClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    LOBYTE(v9) = 0;
    goto LABEL_6;
  }
  int v9 = [v4 inCloud] ^ 1;
LABEL_6:

  return v9;
}

- (id)serverChangeTokenMetadataKey
{
  v2 = NSString;
  BOOL v3 = [(AXSSCloudKitHelper *)self recordType];
  id v4 = [v2 stringWithFormat:@"CloudKitServerChangeToken-%@", v3];

  return v4;
}

- (id)cloudKitPushTopic
{
  return @"com.apple.icloud-container.com.apple.accessibility.AccessibilityUIServer";
}

- (void)fetchChangesAndUpdateObservedStore
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke;
  v2[3] = &unk_1E606D0F8;
  v2[4] = self;
  [(AXSSCloudKitHelper *)self openTransactionWithLabel:@"com.apple.axcloudkithelper.import" andExecuteWorkBlock:v2];
}

void __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke(uint64_t a1, void *a2)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v5 = [WeakRetained metadata];
  id v6 = [*(id *)(a1 + 32) serverChangeTokenMetadataKey];
  id v7 = [v5 objectForKey:v6];

  int v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:0];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1A060]);
  [v9 setPreviousServerChangeToken:v8];
  id v10 = objc_alloc(MEMORY[0x1E4F1A070]);
  id v11 = [*(id *)(*(void *)(a1 + 32) + 64) zoneID];
  v33[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v13 = [*(id *)(*(void *)(a1 + 32) + 64) zoneID];
  id v31 = v13;
  id v32 = v9;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  uint64_t v15 = (void *)[v10 initWithRecordZoneIDs:v12 configurationsByRecordZoneID:v14];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2;
  v29[3] = &unk_1E606D1C0;
  v29[4] = *(void *)(a1 + 32);
  id v18 = v16;
  id v30 = v18;
  [v15 setRecordWasChangedBlock:v29];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_111;
  v27[3] = &unk_1E606D1E8;
  v27[4] = *(void *)(a1 + 32);
  id v19 = v17;
  id v28 = v19;
  [v15 setRecordWithIDWasDeletedBlock:v27];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2_113;
  v23[3] = &unk_1E606D238;
  v23[4] = *(void *)(a1 + 32);
  id v24 = v18;
  id v25 = v19;
  id v26 = v3;
  id v20 = v3;
  id v21 = v19;
  id v22 = v18;
  [v15 setRecordZoneFetchCompletionBlock:v23];
  [*(id *)(*(void *)(a1 + 32) + 80) addOperation:v15];
}

void __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 recordType];
  id v6 = [*(id *)(a1 + 32) recordType];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [*(id *)(a1 + 40) addObject:v4];
    int v8 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2_cold_1(v4, v8);
    }
  }
}

void __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  int v7 = [v5 recordType];
  int v8 = [v6 isEqualToString:v7];

  if (v8) {
    [*(id *)(a1 + 40) addObject:v9];
  }
}

void __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2_113(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, char a5)
{
  id v7 = a3;
  int v8 = v7;
  if ((a5 & 1) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(NSObject **)(v9 + 88);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_3;
    block[3] = &unk_1E606D210;
    block[4] = v9;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    dispatch_async(v10, block);
  }
}

uint64_t __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) processAccumulatedChangesForServerChangeToken:*(void *)(a1 + 40) withAccumulatedUpdates:*(void *)(a1 + 48) andDeletes:*(void *)(a1 + 56) inTransaction:*(void *)(a1 + 64)];
}

- (void)setIsProtectedDataAvailable:(BOOL)a3
{
  BOOL isProtectedDataAvailable = self->_isProtectedDataAvailable;
  self->_BOOL isProtectedDataAvailable = a3;
  if (!isProtectedDataAvailable && a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__AXSSCloudKitHelper_setIsProtectedDataAvailable___block_invoke;
    block[3] = &unk_1E606C8C0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

unsigned char *__50__AXSSCloudKitHelper_setIsProtectedDataAvailable___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[17]) {
    return (unsigned char *)[result _processAccumulatedQueueData];
  }
  return result;
}

- (void)_processAccumulatedQueueData
{
}

- (void)processAccumulatedChangesForServerChangeToken:(id)a3 withAccumulatedUpdates:(id)a4 andDeletes:(id)a5 inTransaction:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(AXSSCloudKitHelper *)self isProtectedDataAvailable])
  {
    id v14 = [(AXSSCloudKitHelper *)self observedCoordinator];

    if (v14)
    {
      id v15 = [(AXSSCloudKitHelper *)self observedCoordinator];
      id v16 = [v15 persistentStores];
      uint64_t v17 = [v16 count];

      if (v17)
      {
        uint64_t v38 = 0;
        uint64_t v39 = &v38;
        uint64_t v40 = 0x2020000000;
        char v41 = 0;
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v43 = 0x3032000000;
        uint64_t v44 = __Block_byref_object_copy__4;
        uint64_t v45 = __Block_byref_object_dispose__4;
        id v46 = 0;
        id v18 = v13;
        id v19 = [[AXSSCloudKitHelperManagedObjectContext alloc] initWithConcurrencyType:1];
        id v20 = [(AXSSCloudKitHelper *)self observedCoordinator];
        [(AXSSCloudKitHelperManagedObjectContext *)v19 setPersistentStoreCoordinator:v20];

        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __116__AXSSCloudKitHelper_processAccumulatedChangesForServerChangeToken_withAccumulatedUpdates_andDeletes_inTransaction___block_invoke;
        void v33[3] = &unk_1E606D260;
        void v33[4] = self;
        id v34 = v11;
        id v21 = v19;
        char v35 = v21;
        uint64_t v36 = &v38;
        p_long long buf = &buf;
        [(AXSSCloudKitHelperManagedObjectContext *)v21 performBlockAndWait:v33];
        [(AXSSCloudKitHelper *)self processRecordDeletionsFromServer:v12];
        if (*((unsigned char *)v39 + 24))
        {
          id v22 = [(AXSSCloudKitHelper *)self observedStore];
          uint64_t v23 = [v22 metadata];
          id v24 = (void *)[v23 mutableCopy];

          if (!v24)
          {
            id v24 = [MEMORY[0x1E4F1CA60] dictionary];
          }
          id v25 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
          id v26 = [(AXSSCloudKitHelper *)self serverChangeTokenMetadataKey];
          [v24 setObject:v25 forKey:v26];

          v27 = [(AXSSCloudKitHelper *)self observedStore];
          [v27 setMetadata:v24];

          id v28 = [NSString stringWithFormat:@"Finished importing changes for token: %@, metadata %@", v10, v24];
          [(AXSSCloudKitHelper *)self logMessage:v28];

          id v29 = [MEMORY[0x1E4F28C40] defaultCenter];
          [v29 postNotificationName:@"AXSSVoiceOverPunctuationCloudKitUpdateNotification" object:0];
        }
        else
        {
          id v24 = [NSString stringWithFormat:@"Failed to process changes for token (%@):\n%@", v10, *(void *)(*((void *)&buf + 1) + 40)];
          [(AXSSCloudKitHelper *)self logMessage:v24];
        }

        [(AXSSCloudKitHelper *)self processLocalChangesAndPush];
        _Block_object_dispose(&buf, 8);

        _Block_object_dispose(&v38, 8);
        goto LABEL_19;
      }
      id v32 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[AXSSCloudKitHelper processAccumulatedChangesForServerChangeToken:withAccumulatedUpdates:andDeletes:inTransaction:]();
      }
    }
    else
    {
      id v32 = AXLogPunctuationStorage();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[AXSSCloudKitHelper processAccumulatedChangesForServerChangeToken:withAccumulatedUpdates:andDeletes:inTransaction:]();
      }
    }

    goto LABEL_19;
  }
  id v30 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1B3B9D000, v30, OS_LOG_TYPE_INFO, "Device is locked, queueing change: %@", (uint8_t *)&buf, 0xCu);
  }

  id v31 = objc_opt_new();
  [v31 setServerChangeToken:v10];
  [v31 setRecordsToUpdate:v11];
  [v31 setRecordIDsToDelete:v12];
  [v31 setOpenTransaction:v13];
  [(NSMutableArray *)self->_accumulatedQueuedData addObject:v31];

LABEL_19:
}

void __116__AXSSCloudKitHelper_processAccumulatedChangesForServerChangeToken_withAccumulatedUpdates_andDeletes_inTransaction___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [*(id *)(a1 + 32) processServerUpdateChanges:*(void *)(a1 + 40) moc:*(void *)(a1 + 48) recordNameToManagedObject:v2];
  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v3 save:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
}

- (void)processLocalChangesAndPush
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke;
  v2[3] = &unk_1E606D340;
  v2[4] = self;
  [(AXSSCloudKitHelper *)self retrieveLocalChangesForCloud:v2];
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v7 count] || objc_msgSend(v8, "count"))
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = NSString;
    id v12 = [v10 recordType];
    id v13 = [v11 stringWithFormat:@"com.apple.axcloudkithelper.export.%@", v12];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_129;
    v20[3] = &unk_1E606D318;
    id v14 = v7;
    id v21 = v14;
    id v15 = v8;
    uint64_t v16 = *(void *)(a1 + 32);
    id v22 = v15;
    uint64_t v23 = v16;
    id v24 = v9;
    [v10 openTransactionWithLabel:v13 andExecuteWorkBlock:v20];

    uint64_t v17 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_1B3B9D000, v17, OS_LOG_TYPE_INFO, "CloudKit: save %@, %@", buf, 0x16u);
    }

    id v18 = v21;
  }
  else
  {
    id v18 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = *(NSObject **)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      id v26 = v19;
      _os_log_impl(&dword_1B3B9D000, v18, OS_LOG_TYPE_INFO, "No changes needed for cloud kit: %@", buf, 0xCu);
    }
  }
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_129(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:*(void *)(a1 + 32) recordIDsToDelete:*(void *)(a1 + 40)];
  [v2 setSavePolicy:1];
  [v2 setAtomic:0];
  [v2 setPerRecordDeleteBlock:&__block_literal_global_132];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_133;
  v11[3] = &unk_1E606D2A8;
  id v3 = *(void **)(a1 + 56);
  void v11[4] = *(void *)(a1 + 48);
  id v12 = v3;
  [v2 setPerRecordSaveBlock:v11];
  [v2 setPerRecordProgressBlock:&__block_literal_global_140];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_141;
  v9[3] = &unk_1E606D2F0;
  int8x16_t v8 = *(int8x16_t *)(a1 + 40);
  id v4 = (id)v8.i64[0];
  int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
  [v2 setModifyRecordsCompletionBlock:v9];
  char v5 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 138412546;
    id v14 = v2;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1B3B9D000, v5, OS_LOG_TYPE_INFO, "CloudKit: add operator for %@, %@", buf, 0x16u);
  }

  id v7 = [*(id *)(a1 + 48) database];
  [v7 addOperation:v2];
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1B3B9D000, v6, OS_LOG_TYPE_INFO, "Delete record: %@, err: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_133(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1B3B9D000, v8, OS_LOG_TYPE_INFO, "Completion record: %@, err: %@", buf, 0x16u);
  }

  if (v7)
  {
    __int16 v9 = *(void **)(a1 + 32);
    id v10 = [NSString stringWithFormat:@"Failed to write record: %@\n%@", v6, v7];
    [v9 logMessage:v10];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_137(double a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_137_cold_1((uint64_t)v4, v5, a1);
  }
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_141(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = AXLogPunctuationStorage();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_141_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v7;
      _os_log_impl(&dword_1B3B9D000, v11, OS_LOG_TYPE_INFO, "CloudKit local changes complete: save: %@", buf, 0xCu);
    }

    uint64_t v11 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_1B3B9D000, v11, OS_LOG_TYPE_INFO, "CloudKit local changes complete: delete: %@", buf, 0xCu);
    }
  }

  dispatch_time_t v12 = dispatch_time(0, 0);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_142;
  id v18 = &unk_1E606C9A0;
  __int16 v13 = *(void **)(a1 + 40);
  uint64_t v19 = *(void *)(a1 + 32);
  id v20 = v13;
  dispatch_after(v12, MEMORY[0x1E4F14428], &v15);
  id v14 = objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter", v15, v16, v17, v18, v19);
  [v14 postNotificationName:@"AXSSVoiceOverPunctuationCloudKitUpdateNotification" object:0];
}

uint64_t __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_142(uint64_t a1)
{
  id v2 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_142_cold_1(a1, v2);
  }

  return [*(id *)(a1 + 32) clearRecordsForPurging:*(void *)(a1 + 40)];
}

- (void)logMessage:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = AXLogPunctuationStorage();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1B3B9D000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)_setupPushConnection:(id *)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F4E1E8]);
  id v6 = [(AXSSCloudKitHelper *)self apsEnvironment];
  uint64_t v7 = (APSConnection *)[v5 initWithEnvironmentName:v6 namedDelegatePort:*MEMORY[0x1E4F4E1B8] queue:self->_cloudkitQueue];
  apsConnection = self->_apsConnection;
  self->_apsConnection = v7;

  if (self->_apsConnection
    && ([(AXSSCloudKitHelper *)self cloudKitPushTopic],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    id v10 = [(AXSSCloudKitHelper *)self cloudKitPushTopic];
    v23[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [(APSConnection *)self->_apsConnection _setEnabledTopics:v11];

    [(APSConnection *)self->_apsConnection setDelegate:self];
    dispatch_time_t v12 = AXLogPunctuationStorage();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = self->_apsConnection;
      int v19 = 138412290;
      id v20 = v13;
      _os_log_impl(&dword_1B3B9D000, v12, OS_LOG_TYPE_INFO, "Setup push connection: %@", (uint8_t *)&v19, 0xCu);
    }

    id v14 = 0;
    BOOL v15 = 1;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28588];
    id v22 = @"Failed to create APSConnection (got nil from init).";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v14 = [v16 errorWithDomain:@"AXCloudKitErrorDomain" code:1 userInfo:v17];

    BOOL v15 = 0;
    if (a3 && v14)
    {
      id v14 = v14;
      BOOL v15 = 0;
      *a3 = v14;
    }
  }

  return v15;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (self->_apsConnection == a3)
  {
    id v5 = [NSString stringWithFormat:@"Connection:\n%@\nSent public token: %@", a3, a4];
    [(AXSSCloudKitHelper *)self logMessage:v5];
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  uint64_t v7 = [NSString stringWithFormat:@"Connection:\n%@\nSent token: %@\nFor topic: %@\nWith identifier: %@", a3, a4, a5, a6];
  [(AXSSCloudKitHelper *)self logMessage:v7];
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = NSString;
  uint64_t v11 = (APSConnection *)a3;
  dispatch_time_t v12 = [v10 stringWithFormat:@"Connection:\n%@\nMessage for topic: %@\nuserInfo: %@", v11, v8, v9];
  [(AXSSCloudKitHelper *)self logMessage:v12];

  apsConnection = self->_apsConnection;
  if (apsConnection == v11)
  {
    id v14 = [(AXSSCloudKitHelper *)self cloudKitPushTopic];
    int v15 = [v8 isEqualToString:v14];

    if (v15)
    {
      uint64_t v16 = [MEMORY[0x1E4F1A1D0] notificationFromRemoteNotificationDictionary:v9];
      if ([v16 notificationType] == 2)
      {
        cloudkitQueue = self->_cloudkitQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __68__AXSSCloudKitHelper_connection_didReceiveMessageForTopic_userInfo___block_invoke;
        block[3] = &unk_1E606C8C0;
        block[4] = self;
        dispatch_async(cloudkitQueue, block);
      }
    }
  }
}

uint64_t __68__AXSSCloudKitHelper_connection_didReceiveMessageForTopic_userInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchChangesAndUpdateObservedStore];
}

- (void)managedObjectContextDidSave:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v39 = v4;
  if (self->_observeLocalDatabaseChanges)
  {
    id v5 = [NSString stringWithFormat:@"[%@] Managed object context saved: %@", self, v4];
    [(AXSSCloudKitHelper *)self logMessage:v5];

    uint64_t v38 = [v39 object];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [NSString stringWithFormat:@"Responding to context save: %@", v39];
      [(AXSSCloudKitHelper *)self logMessage:v6];

      id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v63[0] = 0;
      v63[1] = v63;
      v63[2] = 0x2020000000;
      char v64 = 0;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v7 = [v39 userInfo];
      id v8 = [v7 objectForKey:*MEMORY[0x1E4F1BDF8]];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v69 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v60 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v59 + 1) + 8 * i);
            if ([(AXSSCloudKitHelper *)self shouldExportManagedObject:v12])
            {
              __int16 v13 = [(AXSSCloudKitHelper *)self createCKRecordFromObject:v12];
              [v42 addObject:v13];
            }
            id v14 = AXLogPunctuationStorage();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              id v68 = v42;
              _os_log_debug_impl(&dword_1B3B9D000, v14, OS_LOG_TYPE_DEBUG, "Inserting: %@", buf, 0xCu);
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v69 count:16];
        }
        while (v9);
      }

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      int v15 = [v39 userInfo];
      uint64_t v16 = [v15 objectForKey:*MEMORY[0x1E4F1BFA8]];

      uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v66 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v56 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void *)(*((void *)&v55 + 1) + 8 * j);
            if ([(AXSSCloudKitHelper *)self shouldExportManagedObject:v20])
            {
              uint64_t v21 = [(AXSSCloudKitHelper *)self createCKRecordFromObject:v20];
              [v42 addObject:v21];
            }
            id v22 = AXLogPunctuationStorage();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              id v68 = v42;
              _os_log_debug_impl(&dword_1B3B9D000, v22, OS_LOG_TYPE_DEBUG, "Updating: %@", buf, 0xCu);
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v66 count:16];
        }
        while (v17);
      }

      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v53 = 0u;
      long long v54 = 0u;
      long long v52 = 0u;
      long long v51 = 0u;
      uint64_t v23 = [v39 userInfo];
      id obj = [v23 objectForKey:*MEMORY[0x1E4F1BDC0]];

      uint64_t v24 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v52;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v52 != v25) {
              objc_enumerationMutation(obj);
            }
            __int16 v27 = [*(id *)(*((void *)&v51 + 1) + 8 * k) valueForKey:@"uuid"];
            if (v27)
            {
              id v28 = objc_alloc(MEMORY[0x1E4F1A2F8]);
              uint64_t v29 = [v27 UUIDString];
              id v30 = [(AXSSCloudKitHelper *)self recordZone];
              id v31 = [v30 zoneID];
              id v32 = (void *)[v28 initWithRecordName:v29 zoneID:v31];

              [v41 addObject:v32];
            }
            id v33 = AXLogPunctuationStorage();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              id v68 = v41;
              _os_log_debug_impl(&dword_1B3B9D000, v33, OS_LOG_TYPE_DEBUG, "Deleting: %@", buf, 0xCu);
            }
          }
          uint64_t v24 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
        }
        while (v24);
      }

      if (![v42 count])
      {
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        void v48[2] = __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke;
        v48[3] = &unk_1E606C898;
        v48[4] = self;
        id v49 = v38;
        id v50 = v42;
        [v49 performBlockAndWait:v48];
      }
      id v34 = [NSString stringWithFormat:@"Finished processing notification with records to save: %@", v42];
      [(AXSSCloudKitHelper *)self logMessage:v34];

      char v35 = [NSString stringWithFormat:@"Records to delete: %@", v41];
      [(AXSSCloudKitHelper *)self logMessage:v35];

      if ([v42 count] || objc_msgSend(v41, "count"))
      {
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_2;
        v43[3] = &unk_1E606D3B8;
        id v44 = v42;
        id v46 = self;
        uint64_t v47 = v63;
        id v45 = v41;
        [(AXSSCloudKitHelper *)self openTransactionWithLabel:@"com.apple.axcloudkithelper.export" andExecuteWorkBlock:v43];
      }
      _Block_object_dispose(v63, 8);
    }
    uint64_t v36 = v38;
  }
  else
  {
    char v37 = AXLogPunctuationStorage();
    uint64_t v36 = v37;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      -[AXSSCloudKitHelper managedObjectContextDidSave:](v37);
      uint64_t v36 = v37;
    }
  }
}

void __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "managedObjectClass"), "fetchRequest");
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"inCloud == NO"];
  [v2 setPredicate:v3];

  id v4 = *(void **)(a1 + 40);
  id v18 = 0;
  id v5 = [v4 executeFetchRequest:v2 error:&v18];
  id v6 = v18;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "shouldExportManagedObject:", v12, (void)v14))
        {
          __int16 v13 = [*(id *)(a1 + 32) createCKRecordFromObject:v12];
          [*(id *)(a1 + 48) addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

void __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:*(void *)(a1 + 32) recordIDsToDelete:*(void *)(a1 + 40)];
  [v4 setSavePolicy:1];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_3;
    v15[3] = &unk_1E606D368;
    v15[4] = *(void *)(a1 + 48);
    [v4 setPerRecordSaveBlock:v15];
  }
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_4;
  uint64_t v11 = &unk_1E606D390;
  uint64_t v5 = *(void *)(a1 + 48);
  id v12 = v3;
  uint64_t v13 = v5;
  id v14 = *(id *)(a1 + 32);
  id v6 = v3;
  [v4 setModifyRecordsCompletionBlock:&v8];
  id v7 = objc_msgSend(*(id *)(a1 + 48), "database", v8, v9, v10, v11);
  [v7 addOperation:v4];
}

void __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [NSString stringWithFormat:@"Failed to write record: %@\n%@", a3, a4];
    [v4 logMessage:v5];
  }
}

void __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_4(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = a1[5];
  uint64_t v9 = NSString;
  id v10 = a1[4];
  uint64_t v11 = [v9 stringWithFormat:@"Modify records finished: %@\n%@\n%@", a2, a3, a4];
  [v8 logMessage:v11];

  id v12 = [[AXSSCloudKitHelperManagedObjectContext alloc] initWithConcurrencyType:1];
  uint64_t v13 = [a1[5] observedCoordinator];
  [(AXSSCloudKitHelperManagedObjectContext *)v12 setPersistentStoreCoordinator:v13];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_5;
  v17[3] = &unk_1E606C898;
  id v14 = a1[6];
  id v15 = a1[5];
  id v18 = v14;
  id v19 = v15;
  uint64_t v20 = v12;
  long long v16 = v12;
  [(AXSSCloudKitHelperManagedObjectContext *)v16 performBlockAndWait:v17];
}

void __50__AXSSCloudKitHelper_managedObjectContextDidSave___block_invoke_5(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v32 + 1) + 8 * i) recordID];
        uint64_t v9 = [v8 recordName];
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v5);
  }

  id v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "managedObjectClass"), "fetchRequest");
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN (%@)", v2];
  [v10 setPredicate:v11];

  id v12 = *(void **)(a1 + 48);
  id v31 = 0;
  uint64_t v13 = [v12 executeFetchRequest:v10 error:&v31];
  id v14 = v31;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v27 + 1) + 8 * j) setInCloud:1];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v17);
  }

  uint64_t v20 = *(void **)(a1 + 48);
  id v26 = v14;
  int v21 = [v20 save:&v26];
  id v22 = v26;

  uint64_t v23 = *(void **)(a1 + 40);
  if (v21) {
    [NSString stringWithFormat:@"Marked histories uploaded: %@", v15, v25];
  }
  else {
  uint64_t v24 = [NSString stringWithFormat:@"Failed to mark histories uploaded:\n%@\n%@", v15, v22];
  }
  [v23 logMessage:v24];
}

- (void)_setObservedStore:(id)a3 observedCoordinator:(id)a4
{
  uint64_t v6 = (NSPersistentStoreCoordinator *)a4;
  objc_storeWeak((id *)&self->_observedStore, a3);
  observedCoordinator = self->_observedCoordinator;
  self->_observedCoordinator = v6;
}

- (void)_setDatabase:(id)a3
{
}

- (void)_setContainer:(id)a3
{
}

- (void)_setApsConnection:(id)a3
{
}

- (NSPersistentStore)observedStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observedStore);

  return (NSPersistentStore *)WeakRetained;
}

- (NSPersistentStoreCoordinator)observedCoordinator
{
  return self->_observedCoordinator;
}

- (NSManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKRecordZone)recordZone
{
  return self->_recordZone;
}

- (CKRecordZoneSubscription)zoneSubscription
{
  return self->_zoneSubscription;
}

- (CKDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)cloudkitQueue
{
  return self->_cloudkitQueue;
}

- (OS_dispatch_semaphore)cloudKitQueueSemaphore
{
  return self->_cloudKitQueueSemaphore;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (NSError)lastInitializationError
{
  return self->_lastInitializationError;
}

- (NSURL)largeBlobDirectoryURL
{
  return self->_largeBlobDirectoryURL;
}

- (BOOL)observeLocalDatabaseChanges
{
  return self->_observeLocalDatabaseChanges;
}

- (void)setObserveLocalDatabaseChanges:(BOOL)a3
{
  self->_observeLocalDatabaseChanges = a3;
}

- (BOOL)isProtectedDataAvailable
{
  return self->_isProtectedDataAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeBlobDirectoryURL, 0);
  objc_storeStrong((id *)&self->_lastInitializationError, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_cloudKitQueueSemaphore, 0);
  objc_storeStrong((id *)&self->_cloudkitQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_zoneSubscription, 0);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_observedCoordinator, 0);
  objc_destroyWeak((id *)&self->_observedStore);

  objc_storeStrong((id *)&self->_accumulatedQueuedData, 0);
}

- (id)recordType
{
  uint64_t v2 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(v2);
  return 0;
}

- (id)testRecordForSchemaCreation:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(v3);
  return 0;
}

- (id)createCKRecordFromObject:(id)a3
{
  uint64_t v3 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(v3);
  return 0;
}

- (void)processServerUpdateChanges:(id)a3 moc:(id)a4 recordNameToManagedObject:(id)a5
{
  OUTLINED_FUNCTION_0_2();
  uint64_t v5 = OUTLINED_FUNCTION_1_1();

  MEMORY[0x1F40E7228](v5, v6, v7);
}

- (void)processRecordDeletionsFromServer:(id)a3
{
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = OUTLINED_FUNCTION_1_1();

  MEMORY[0x1F40E7228](v3, v4, v5);
}

- (void)retrieveLocalChangesForCloud:(id)a3
{
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = OUTLINED_FUNCTION_1_1();

  MEMORY[0x1F40E7228](v3, v4, v5);
}

- (void)clearRecordsForPurging:(id)a3
{
  OUTLINED_FUNCTION_0_2();
  uint64_t v3 = OUTLINED_FUNCTION_1_1();

  MEMORY[0x1F40E7228](v3, v4, v5);
}

- (id)apsEnvironment
{
  uint64_t v2 = OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2(v2);
  return 0;
}

void __56__AXSSCloudKitHelper_fetchChangesAndUpdateObservedStore__block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 recordType];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "recording remote change: %@", v4, 0xCu);
}

- (void)processAccumulatedChangesForServerChangeToken:withAccumulatedUpdates:andDeletes:inTransaction:.cold.1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "No coordinator at this time: %@", v2, v3, v4, v5, v6);
}

- (void)processAccumulatedChangesForServerChangeToken:withAccumulatedUpdates:andDeletes:inTransaction:.cold.2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "The observed coordinator has no persistent stores: %@", v2, v3, v4, v5, v6);
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_137_cold_1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  double v4 = a3;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "Progress: %f, %@", (uint8_t *)&v3, 0x16u);
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_141_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_1B3B9D000, v0, v1, "CloudKit local change push error: %@", v2, v3, v4, v5, v6);
}

void __48__AXSSCloudKitHelper_processLocalChangesAndPush__block_invoke_142_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1B3B9D000, a2, OS_LOG_TYPE_DEBUG, "%@ Purged these records %@", (uint8_t *)&v4, 0x16u);
}

- (void)managedObjectContextDidSave:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1B3B9D000, log, OS_LOG_TYPE_DEBUG, "Ignore local changes", v1, 2u);
}

@end