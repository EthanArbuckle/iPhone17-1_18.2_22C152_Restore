@interface CallHistoryDBHandle
+ (NSString)objectId;
+ (id)createForClient;
+ (id)createForServer;
+ (id)createWithDBManager:(id)a3;
+ (void)createForClient;
- (BOOL)handleSaveForCallRecordContext:(id)a3 error:(id *)a4;
- (BOOL)moveCallRecordsFromDatabaseAtURL:(id)a3;
- (BOOL)performSaveWithBackgroundTaskAssertion:(id)a3 error:(id *)a4;
- (BOOL)resetAllTimers;
- (BOOL)save:(id *)a3;
- (BOOL)saveTimers:(id)a3;
- (CHFeatureFlags)featureFlags;
- (CallDBManager)callDBManager;
- (CallHistoryDBHandle)initWithDBManager:(id)a3;
- (id)callDBProperties;
- (id)callRecordContext;
- (id)createCallRecord;
- (id)fetchAll;
- (id)fetchAllNoLimit;
- (id)fetchAllObjectsWithUniqueId:(id)a3;
- (id)fetchManagedCallIdentifiersWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7;
- (id)fetchManagedCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7;
- (id)fetchObjectWithUniqueId:(id)a3;
- (id)fetchObjectsWithPredicate:(id)a3;
- (id)fetchObjectsWithUniqueIds:(id)a3;
- (id)fetchWithCallTypes:(unsigned int)a3;
- (id)fetchWithPredicate:(id)a3 forEntity:(id)a4;
- (id)fetchWithPredicate:(id)a3 forEntity:(id)a4 withLimit:(BOOL)a5;
- (id)getArrayForCallTypeMask:(unsigned int)a3;
- (id)timerIncoming;
- (id)timerLastReset;
- (id)timerLifetime;
- (id)timerOutgoing;
- (id)updateManagedCallsWithPredicate:(id)a3 propertiesToUpdate:(id)a4;
- (int64_t)callHistoryDBFetchLimit;
- (int64_t)callsDidChangeDarwinNotificationCount;
- (int64_t)deleteManagedCalls:(id)a3;
- (int64_t)deleteManagedCallsWithPredicate:(id)a3;
- (unint64_t)fetchManagedCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4;
- (void)callDBProperties;
- (void)createCallRecord;
- (void)dealloc;
- (void)deleteAll;
- (void)deleteObjectWithUniqueId:(id)a3;
- (void)deleteObjectsWithUniqueIds:(id)a3;
- (void)handleCallDBPropContextDidSaveNotification:(id)a3;
- (void)handleCallRecordContextDidSaveNotification:(id)a3;
- (void)handlePersistentStoreChangedNotification:(id)a3;
- (void)mergeCallDBPropChangesFromRemoteAppSave;
- (void)mergeCallRecordChangesFromRemoteAppSave;
- (void)postTimersChangedNotification;
- (void)registerForNotifications:(id)a3;
- (void)resetTimers;
- (void)setCallsDidChangeDarwinNotificationCount:(int64_t)a3;
- (void)unRegisterForNotifications;
- (void)updateCallDBProperties;
@end

@implementation CallHistoryDBHandle

- (id)updateManagedCallsWithPredicate:(id)a3 propertiesToUpdate:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(CallHistoryDBHandle *)self fetchManagedCallsWithPredicate:a3 sortDescriptors:0 limit:0 offset:0 batchSize:0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v11 = [v6 allKeys];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * j);
              v17 = [v6 objectForKeyedSubscript:v16];
              [v10 setValue:v17 forKey:v16];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v13);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  return obj;
}

- (unint64_t)fetchManagedCallCountWithPredicate:(id)a3 sortDescriptors:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[CallRecord fetchRequest];
  [v8 setPredicate:v7];

  [v8 setSortDescriptors:v6];
  objc_msgSend(v8, "setFetchLimit:", -[CallHistoryDBHandle callHistoryDBFetchLimit](self, "callHistoryDBFetchLimit"));
  ct_green_tea_logger_create_static();
  v9 = getCTGreenTeaOsLogHandle();
  v10 = v9;
  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = [v8 entityName];
    *(_DWORD *)buf = 138412290;
    long long v21 = v11;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_INFO, "Count: %@", buf, 0xCu);
  }
  fCallRecordContext = self->fCallRecordContext;
  id v19 = 0;
  unint64_t v13 = [(NSManagedObjectContext *)fCallRecordContext countForFetchRequest:v8 error:&v19];
  id v14 = v19;
  v15 = v14;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL && v14 != 0)
  {
    v17 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CallHistoryDBHandle fetchManagedCallCountWithPredicate:sortDescriptors:]();
    }

    unint64_t v13 = 0;
  }

  return v13;
}

- (id)fetchManagedCallsWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a3;
  id v14 = +[CallRecord fetchRequest];
  [v14 setFetchBatchSize:a7];
  [v14 setFetchLimit:a5];
  [v14 setFetchOffset:a6];
  [v14 setPredicate:v13];

  [v14 setReturnsObjectsAsFaults:0];
  [v14 setSortDescriptors:v12];

  v28[0] = @"remoteParticipantHandles";
  v28[1] = @"emergencyMediaItems";
  v28[2] = @"initiatorHandle";
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  [v14 setRelationshipKeyPathsForPrefetching:v15];

  ct_green_tea_logger_create_static();
  uint64_t v16 = getCTGreenTeaOsLogHandle();
  v17 = v16;
  if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = [v14 entityName];
    *(_DWORD *)buf = 138412290;
    long long v27 = v18;
    _os_log_impl(&dword_1B8E4A000, v17, OS_LOG_TYPE_INFO, "Read: %@", buf, 0xCu);
  }
  fCallRecordContext = self->fCallRecordContext;
  id v25 = 0;
  uint64_t v20 = [(NSManagedObjectContext *)fCallRecordContext executeFetchRequest:v14 error:&v25];
  id v21 = v25;
  uint64_t v22 = v21;
  if (!v20 && v21)
  {
    long long v23 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CallHistoryDBHandle fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:]();
    }
  }
  return v20;
}

- (int64_t)callHistoryDBFetchLimit
{
  v3 = [(CallHistoryDBHandle *)self featureFlags];
  int v4 = [v3 increaseCallHistoryEnabled];

  if (!v4) {
    return 200;
  }
  v5 = [(CallHistoryDBHandle *)self featureFlags];
  int v6 = [v5 keepCallsEnabled];
  id v7 = (int64_t *)&kCallHistoryNoFetchLimit;
  if (!v6) {
    id v7 = (int64_t *)&kCallHistoryIncreasedFetchLimit;
  }
  int64_t v8 = *v7;

  return v8;
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) userInfo];
    [WeakRetained handlePersistentStoreChangedNotification:v2];
  }
}

- (void)handlePersistentStoreChangedNotification:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 objectForKey:*MEMORY[0x1E4F1BD88]];
  if ([v4 count])
  {
    v5 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = [v4 count];
      _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "Handling persistent store added notification, store count: %lu", buf, 0xCu);
    }

    if ([(NSManagedObjectContext *)self->fCallRecordContext hasChanges]) {
      [(CallHistoryDBHandle *)self save:0];
    }
    int v6 = [(CallHistoryDBHandle *)self callDBManager];
    int v7 = [v6 notifyDataStoreChanged];

    if (v7)
    {
      int64_t v8 = [(CHLogger *)self logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [(CallHistoryDBHandle *)self callDBManager];
        v10 = getCHNotifyDataStoreChangeReasonAsString([v9 notifyDataStoreChangeReason]);
        *(_DWORD *)buf = 138543362;
        uint64_t v17 = (uint64_t)v10;
        _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Sending out database change notification when data store is added, reason: %{public}@", buf, 0xCu);
      }
      id v14 = @"kCallHistoryDatabaseInitializedKey";
      uint64_t v15 = MEMORY[0x1E4F1CC38];
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      id v12 = [[NotificationSender alloc] initWithName:@"kCallHistoryDatabaseChangedNotification"];
      [(NotificationSender *)v12 setUserInfo:v11];
      id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:@"kCallHistoryDatabaseChangedInternalNotification" object:v12 userInfo:v11];
    }
  }
}

- (void)registerForNotifications:(id)a3
{
  id v4 = a3;
  objc_initWeak(location, self);
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F1BE20];
  fCallRecordContext = self->fCallRecordContext;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke;
  v38[3] = &unk_1E61C7458;
  id v8 = v4;
  id v39 = v8;
  objc_copyWeak(&v40, location);
  v9 = [v5 addObserverForName:v6 object:fCallRecordContext queue:0 usingBlock:v38];
  id observerCallRecordRef = self->_observerCallRecordRef;
  self->_id observerCallRecordRef = v9;

  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  fCallDBPropertiesContext = self->fCallDBPropertiesContext;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_3;
  v35[3] = &unk_1E61C7458;
  id v13 = v8;
  id v36 = v13;
  objc_copyWeak(&v37, location);
  id v14 = [v11 addObserverForName:v6 object:fCallDBPropertiesContext queue:0 usingBlock:v35];
  id observerCallDBPropRef = self->_observerCallDBPropRef;
  self->_id observerCallDBPropRef = v14;

  uint64_t v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  callDBManager = self->callDBManager;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_5;
  v32[3] = &unk_1E61C7458;
  id v18 = v13;
  id v33 = v18;
  objc_copyWeak(&v34, location);
  id v19 = [v16 addObserverForName:@"kMoveCallRecordsFromTemporaryStoreNotitification" object:callDBManager queue:0 usingBlock:v32];
  id moveCallRecordsFromTempStoreRef = self->_moveCallRecordsFromTempStoreRef;
  self->_id moveCallRecordsFromTempStoreRef = v19;

  id v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v22 = [(CallHistoryDBHandle *)self callDBManager];
  long long v23 = [v22 dbManager];
  long long v24 = [v23 fPersistentStoreCoordinator];
  uint64_t v25 = *MEMORY[0x1E4F1BEA0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_7;
  v29[3] = &unk_1E61C7458;
  id v26 = v18;
  id v30 = v26;
  objc_copyWeak(&v31, location);
  long long v27 = [v21 addObserverForName:v25 object:v24 queue:0 usingBlock:v29];
  id dataStoreAddedRef = self->_dataStoreAddedRef;
  self->_id dataStoreAddedRef = v27;

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v40);

  objc_destroyWeak(location);
}

- (CallDBManager)callDBManager
{
  return self->callDBManager;
}

+ (id)createForClient
{
  v2 = objc_alloc_init(CallDBManagerClient);
  if (v2)
  {
    v3 = +[CallHistoryDBHandle createWithDBManager:v2];
    if (v3) {
      goto LABEL_8;
    }
    id v4 = +[CHLogServer sharedInstance];
    v5 = [v4 logHandleForDomain:"ch.dbhandle"];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CallHistoryDBHandle createForClient]();
    }
  }
  else
  {
    uint64_t v6 = +[CHLogServer sharedInstance];
    v5 = [v6 logHandleForDomain:"ch.dbhandle"];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CallHistoryDBHandle createForClient]();
    }
  }

  v3 = 0;
LABEL_8:

  return v3;
}

- (CallHistoryDBHandle)initWithDBManager:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CallHistoryDBHandle;
  uint64_t v6 = [(CHLogger *)&v14 initWithDomain:"ch.dbhandle"];
  if (v6)
  {
    int v7 = objc_alloc_init(CHFeatureFlags);
    featureFlags = v6->_featureFlags;
    v6->_featureFlags = v7;

    uint64_t v9 = [v5 createManagedObjectContext];
    fCallRecordContext = v6->fCallRecordContext;
    v6->fCallRecordContext = (NSManagedObjectContext *)v9;

    uint64_t v11 = [v5 createManagedObjectContext];
    fCallDBPropertiesContext = v6->fCallDBPropertiesContext;
    v6->fCallDBPropertiesContext = (NSManagedObjectContext *)v11;

    [(NSManagedObjectContext *)v6->fCallRecordContext setMergePolicy:*MEMORY[0x1E4F1BE40]];
    [(NSManagedObjectContext *)v6->fCallDBPropertiesContext setUndoManager:0];
    [(NSManagedObjectContext *)v6->fCallRecordContext setUndoManager:0];
    objc_storeStrong((id *)&v6->callDBManager, a3);
  }

  return v6;
}

+ (id)createWithDBManager:(id)a3
{
  id v3 = a3;
  id v4 = [[CallHistoryDBHandle alloc] initWithDBManager:v3];

  return v4;
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_8;
  v6[3] = &unk_1E61C7430;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

- (BOOL)save:(id *)a3
{
  id v5 = [(NSManagedObjectContext *)self->fCallRecordContext persistentStoreCoordinator];
  uint64_t v6 = [v5 persistentStores];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    if ([(NSManagedObjectContext *)self->fCallRecordContext hasChanges])
    {
      [(CallHistoryDBHandle *)self updateCallDBProperties];
      fCallRecordContext = self->fCallRecordContext;
      return [(CallHistoryDBHandle *)self handleSaveForCallRecordContext:fCallRecordContext error:a3];
    }
    else
    {
      uint64_t v11 = [(CHLogger *)self logHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_1B8E4A000, v11, OS_LOG_TYPE_DEFAULT, "No changes in the data context to save", v12, 2u);
      }

      return 1;
    }
  }
  else
  {
    v10 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CallHistoryDBHandle save:]();
    }

    return 0;
  }
}

+ (NSString)objectId
{
  if (objectId_onceToken != -1) {
    dispatch_once(&objectId_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)objectId_sObjectId;
  return (NSString *)v2;
}

void __31__CallHistoryDBHandle_objectId__block_invoke()
{
  id v8 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v8 bundleIdentifier];
  v1 = (void *)[v0 copy];
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
    id v4 = (void *)objectId_sObjectId;
    objectId_sObjectId = (uint64_t)v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v4 UUIDString];
    uint64_t v6 = [v5 copy];
    uint64_t v7 = (void *)objectId_sObjectId;
    objectId_sObjectId = v6;
  }
}

- (id)callDBProperties
{
  id v3 = [(CallHistoryDBHandle *)self fetchWithPredicate:0 forEntity:@"CallDBProperties"];
  id v4 = v3;
  if (!v3 || ![v3 count])
  {
    id v5 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CallHistoryDBHandle callDBProperties]();
    }
    goto LABEL_8;
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    id v5 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CallHistoryDBHandle callDBProperties]();
    }
LABEL_8:

    uint64_t v6 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = [v4 firstObject];
LABEL_9:

  return v6;
}

- (id)callRecordContext
{
  return self->fCallRecordContext;
}

+ (id)createForServer
{
  v2 = objc_alloc_init(CallDBManagerServer);
  if (v2)
  {
    id v3 = +[CallHistoryDBHandle createWithDBManager:v2];
    if (v3) {
      goto LABEL_8;
    }
    id v4 = +[CHLogServer sharedInstance];
    id v5 = [v4 logHandleForDomain:"ch.dbhandle"];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CallHistoryDBHandle createForClient]();
    }
  }
  else
  {
    uint64_t v6 = +[CHLogServer sharedInstance];
    id v5 = [v6 logHandleForDomain:"ch.dbhandle"];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CallHistoryDBHandle createForClient]();
    }
  }

  id v3 = 0;
LABEL_8:

  return v3;
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_2;
  v6[3] = &unk_1E61C7430;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) userInfo];
    [WeakRetained handleCallRecordContextDidSaveNotification:v2];
  }
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_4;
  v6[3] = &unk_1E61C7430;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) userInfo];
    [WeakRetained handleCallDBPropContextDidSaveNotification:v2];
  }
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__CallHistoryDBHandle_registerForNotifications___block_invoke_6;
  v6[3] = &unk_1E61C7480;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(v4, v6);
  objc_destroyWeak(&v8);
}

void __48__CallHistoryDBHandle_registerForNotifications___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained callDBManager];
    id v3 = [v2 tempDBLocation:0];

    [v4 moveCallRecordsFromDatabaseAtURL:v3];
    id WeakRetained = v4;
  }
}

- (void)unRegisterForNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4F1BE20];
  [v3 removeObserver:self->_observerCallRecordRef name:*MEMORY[0x1E4F1BE20] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self->_observerCallDBPropRef name:v4 object:0];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self->_moveCallRecordsFromTempStoreRef name:@"kMoveCallRecordsFromTemporaryStoreNotitification" object:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self->_dataStoreAddedRef name:*MEMORY[0x1E4F1BEA0] object:0];
}

- (BOOL)moveCallRecordsFromDatabaseAtURL:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "Moving records from temp to permanent database", buf, 2u);
  }

  if (v4)
  {
    uint64_t v6 = +[DBManager versionForDBAtLocation:v4];
    id v7 = [(CHLogger *)self logHandle];
    id v8 = v7;
    if (v6 > 0)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v78 = (uint64_t)v4;
        __int16 v79 = 2048;
        uint64_t v80 = v6;
        _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Database at location %{public}@ has version %ld", buf, 0x16u);
      }

      id v8 = +[CallDBManagerServer getDestinationModelForVersion:v6];
      if (+[DBManager isDataStoreAtURLInitialized:v4 withModelAtURL:v8])
      {
        uint64_t v9 = [(CHLogger *)self logHandle];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B8E4A000, v9, OS_LOG_TYPE_DEFAULT, "Input database not in use", buf, 2u);
        }
      }
      else
      {
        uint64_t v9 = +[DBManager instanceWithModelURL:v8];
        if ([v9 addDataStoreAtLocation:v4 isEncrypted:0])
        {
          uint64_t v11 = [v9 createManagedObjectContext];
          id v12 = +[DBManager entityDescriptionHavingName:@"CallRecord" forContext:v11];
          if (v12)
          {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
            [v13 setEntity:v12];
            id v75 = 0;
            v70 = [v11 executeFetchRequest:v13 error:&v75];
            id v14 = v75;
            uint64_t v15 = [(CHLogger *)self logHandle];
            uint64_t v16 = v15;
            v69 = v14;
            if (v14)
            {
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                -[CallHistoryDBHandle moveCallRecordsFromDatabaseAtURL:].cold.4();
              }

              BOOL v10 = 0;
              uint64_t v17 = v70;
            }
            else
            {
              v64 = v13;
              v65 = v12;
              v66 = v9;
              v67 = v8;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v19 = [v70 count];
                *(_DWORD *)buf = 134218242;
                uint64_t v78 = v19;
                __int16 v79 = 2114;
                uint64_t v80 = (uint64_t)v4;
                _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "Moving %lu records from input database %{public}@ into permanent database", buf, 0x16u);
              }
              id v68 = v4;

              long long v73 = 0u;
              long long v74 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              id v20 = v70;
              uint64_t v21 = [v20 countByEnumeratingWithState:&v71 objects:v76 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v72;
                do
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v72 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    uint64_t v25 = *(void **)(*((void *)&v71 + 1) + 8 * i);
                    id v26 = [(CallHistoryDBHandle *)self createCallRecord];
                    long long v27 = [v25 address];
                    [v26 setAddress:v27];

                    long long v28 = [v25 answered];
                    [v26 setAnswered:v28];

                    v29 = [v25 date];
                    [v26 setDate:v29];

                    id v30 = [v25 duration];
                    [v26 setDuration:v30];

                    id v31 = objc_msgSend(v25, "face_time_data");
                    objc_msgSend(v26, "setFace_time_data:", v31);

                    v32 = [v25 name];
                    [v26 setName:v32];

                    id v33 = [v25 read];
                    [v26 setRead:v33];

                    id v34 = objc_msgSend(v25, "unique_id");
                    objc_msgSend(v26, "setUnique_id:", v34);

                    v35 = [v25 calltype];
                    [v26 setCalltype:v35];

                    id v36 = [v25 originated];
                    [v26 setOriginated:v36];

                    id v37 = objc_msgSend(v25, "disconnected_cause");
                    objc_msgSend(v26, "setDisconnected_cause:", v37);

                    v38 = objc_msgSend(v25, "number_availability");
                    objc_msgSend(v26, "setNumber_availability:", v38);

                    id v39 = objc_msgSend(v25, "iso_country_code");
                    objc_msgSend(v26, "setIso_country_code:", v39);

                    id v40 = [v26 managedObjectContext];
                    if (v40)
                    {
                      v41 = [v25 compositeCallCategoryForContext:v40];
                      objc_msgSend(v26, "setCall_category:", v41);

                      v42 = [v25 compositeHandleTypeForContext:v40];
                      objc_msgSend(v26, "setHandle_type:", v42);

                      if ([v25 supportsImageURL])
                      {
                        v43 = [v25 imageURL];
                        [v26 setImageURL:v43];
                      }
                      else
                      {
                        [v26 setImageURL:0];
                      }
                      v44 = [v25 compositeJunkConfidenceForContext:v40];
                      [v26 setJunkConfidence:v44];

                      v45 = [v25 compositeLocalParticipantUUIDForContext:v40];
                      [v26 setLocalParticipantUUID:v45];

                      v46 = [v25 compositeOutgoingLocalParticipantUUIDForContext:v40];
                      [v26 setOutgoingLocalParticipantUUID:v46];

                      v47 = [v25 compositeParticipantGroupUUIDForContext:v40];
                      [v26 setParticipantGroupUUID:v47];

                      v48 = [v25 compositeRemoteParticipantHandlesForContext:v40];
                      [v26 setRemoteParticipantHandles:v48];

                      v49 = [v25 compositeServiceProviderForContext:v40];
                      objc_msgSend(v26, "setService_provider:", v49);

                      if ([v25 supportsHasMessage])
                      {
                        v50 = [v25 hasMessage];
                        [v26 setHasMessage:v50];
                      }
                      else
                      {
                        [v26 setHasMessage:0];
                      }
                      if ([v25 supportsJunkIdentificationCategory])
                      {
                        v51 = [v25 junkIdentificationCategory];
                        [v26 setJunkIdentificationCategory:v51];
                      }
                      else
                      {
                        [v26 setJunkIdentificationCategory:0];
                      }
                      if ([v25 supportsAutoAnsweredReason])
                      {
                        v52 = [v25 autoAnsweredReason];
                        [v26 setAutoAnsweredReason:v52];
                      }
                      else
                      {
                        [v26 setAutoAnsweredReason:0];
                      }
                      v53 = [v25 compositeEmergencyMediaItemsForContext:v40];
                      [v26 setEmergencyMediaItems:v53];

                      if ([v25 supportsEmergencyMedia]) {
                        uint64_t v54 = [v25 usedEmergencyVideoStreaming];
                      }
                      else {
                        uint64_t v54 = 0;
                      }
                      [v26 setUsedEmergencyVideoStreaming:v54];
                      if ([v25 supportsEmergencyMedia]) {
                        uint64_t v55 = [v25 wasEmergencyCall];
                      }
                      else {
                        uint64_t v55 = 0;
                      }
                      [v26 setWasEmergencyCall:v55];
                      if ([v25 supportsBlockedBy])
                      {
                        v56 = [v25 blockedByExtension];
                        [v26 setBlockedByExtension:v56];
                      }
                      else
                      {
                        [v26 setBlockedByExtension:0];
                      }
                      if ([v25 supportsBlockedByName])
                      {
                        v57 = [v25 blockedByExtensionName];
                        [v26 setBlockedByExtensionName:v57];
                      }
                      else
                      {
                        [v26 setBlockedByExtensionName:0];
                      }
                      if ([v25 supportsIdentityExtension])
                      {
                        v58 = [v25 identityExtension];
                        [v26 setIdentityExtension:v58];
                      }
                      else
                      {
                        [v26 setIdentityExtension:0];
                      }
                      v59 = [v25 compositeCallDirectoryIdentityType:v40];
                      [v26 setCallDirectoryIdentityType:v59];

                      if ([v25 supportsScreenSharingType]) {
                        [v25 screenSharingType];
                      }
                      else {
                      v60 = [NSNumber numberWithUnsignedInteger:0];
                      }
                      [v26 setScreenSharingType:v60];

                      v61 = [v25 compositeInitiatorHandleForContext:v40];
                      [v26 setInitiator:v61];
                    }
                    [v11 deleteObject:v25];
                  }
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v71 objects:v76 count:16];
                }
                while (v22);
              }

              if ([(CallHistoryDBHandle *)self save:0])
              {
                id v8 = v67;
                id v4 = v68;
                id v12 = v65;
                uint64_t v9 = v66;
                id v13 = v64;
                uint64_t v17 = v70;
                if (![(CallHistoryDBHandle *)self handleSaveForCallRecordContext:v11 error:0])
                {
                  v62 = [(CHLogger *)self logHandle];
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1B8E4A000, v62, OS_LOG_TYPE_DEFAULT, "Failed to delete calls from the input database", buf, 2u);
                  }
                }
                [v66 removeDataStoreAtLocation:v68];
                BOOL v10 = 1;
              }
              else
              {
                v63 = [(CHLogger *)self logHandle];
                id v8 = v67;
                id v4 = v68;
                id v12 = v65;
                uint64_t v9 = v66;
                id v13 = v64;
                uint64_t v17 = v70;
                if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B8E4A000, v63, OS_LOG_TYPE_DEFAULT, "Failed to save calls from input database to perm database", buf, 2u);
                }

                BOOL v10 = 0;
              }
            }
          }
          else
          {
            id v13 = [(CHLogger *)self logHandle];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[CallHistoryDBHandle moveCallRecordsFromDatabaseAtURL:]();
            }
            BOOL v10 = 0;
          }

          goto LABEL_22;
        }
      }
      BOOL v10 = 0;
LABEL_22:

      goto LABEL_23;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CallHistoryDBHandle moveCallRecordsFromDatabaseAtURL:]();
    }
  }
  else
  {
    id v8 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CallHistoryDBHandle moveCallRecordsFromDatabaseAtURL:]();
    }
  }
  BOOL v10 = 0;
LABEL_23:

  return v10;
}

- (void)handleCallRecordContextDidSaveNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "handleCallRecordContextDidSaveNotification", v14, 2u);
  }

  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1BDF8]];
  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1BFA8]];
  id v8 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1BDC0]];

  uint64_t v9 = objc_opt_new();
  [v9 setObject:@"External" forKeyedSubscript:@"kNotificationReason"];
  BOOL v10 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v7, "count") + objc_msgSend(v6, "count") + objc_msgSend(v8, "count"));
  [v9 setObject:v10 forKeyedSubscript:@"kNotificationChangeCount"];

  [(CallHistoryDBHandle *)self setCallsDidChangeDarwinNotificationCount:[(CallHistoryDBHandle *)self callsDidChangeDarwinNotificationCount] + 1];
  notify_post("com.apple.callhistory.notification.calls-changed");
  notify_post("com.apple.CallHistoryPluginHelper.launchnotification");
  if ([v6 count])
  {
    uint64_t v11 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v11 postNotificationName:@"kCallHistoryCallRecordInsertedNotification" object:0 userInfo:0 deliverImmediately:1];
  }
  [v9 setObject:@"Internal" forKeyedSubscript:@"kNotificationReason"];
  id v12 = [[NotificationSender alloc] initWithName:@"kCallHistoryDatabaseChangedNotification"];
  [(NotificationSender *)v12 setUserInfo:v9];
  id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"kCallHistoryDatabaseChangedInternalNotification" object:v12 userInfo:v9];
}

- (void)handleCallDBPropContextDidSaveNotification:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter", a3);
  id v5 = [(id)objc_opt_class() objectId];
  [v4 postNotificationName:@"kCallHistoryTimersDistributedSaveNotification" object:v5 userInfo:0];

  [(CallHistoryDBHandle *)self postTimersChangedNotification];
}

- (void)postTimersChangedNotification
{
  id v7 = [(CallHistoryDBHandle *)self callDBProperties];
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  id v3 = objc_msgSend(v7, "timer_incoming");
  id v4 = objc_msgSend(v7, "timer_outgoing");
  id v5 = objc_msgSend(v7, "timer_lifetime");
  uint64_t v6 = objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, @"kCHTimerIncomingKey", v4, @"kCHTimerOutgoingKey", v5, @"kCHTimerLifetimeKey", 0);

  notifyClientsOfEvent(@"kCallHistoryTimersChangedNotification", v6);
}

- (void)mergeCallRecordChangesFromRemoteAppSave
{
  if ([(CallHistoryDBHandle *)self callsDidChangeDarwinNotificationCount])
  {
    int64_t v3 = [(CallHistoryDBHandle *)self callsDidChangeDarwinNotificationCount] - 1;
    [(CallHistoryDBHandle *)self setCallsDidChangeDarwinNotificationCount:v3];
  }
  else
  {
    [(NSManagedObjectContext *)self->fCallRecordContext reset];
    id v4 = [[NotificationSender alloc] initWithName:@"kCallHistoryDatabaseChangedNotification"];
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"kCallHistoryDatabaseChangedInternalNotification" object:v4 userInfo:0];

    uint64_t v6 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "Got call record save notification from other app", v7, 2u);
    }
  }
}

- (void)mergeCallDBPropChangesFromRemoteAppSave
{
}

- (id)fetchWithPredicate:(id)a3 forEntity:(id)a4
{
  return [(CallHistoryDBHandle *)self fetchWithPredicate:a3 forEntity:a4 withLimit:1];
}

- (id)fetchWithPredicate:(id)a3 forEntity:(id)a4 withLimit:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  ct_green_tea_logger_create_static();
  BOOL v10 = getCTGreenTeaOsLogHandle();
  uint64_t v11 = v10;
  if (v10 && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v9;
    _os_log_impl(&dword_1B8E4A000, v11, OS_LOG_TYPE_INFO, "Read: %{public}@", buf, 0xCu);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  [v12 setReturnsObjectsAsFaults:0];
  if (v8) {
    [v12 setPredicate:v8];
  }
  id v13 = +[DBManager entityDescriptionHavingName:v9 forContext:self->fCallRecordContext];
  if (!v13)
  {
    uint64_t v19 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CallHistoryDBHandle fetchWithPredicate:forEntity:withLimit:]();
    }
    goto LABEL_23;
  }
  [v12 setEntity:v13];
  if ([v9 isEqualToString:@"CallRecord"])
  {
    v27[0] = @"remoteParticipantHandles";
    v27[1] = @"emergencyMediaItems";
    v27[2] = @"initiatorHandle";
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    [v12 setRelationshipKeyPathsForPrefetching:v14];

    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
    id v26 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v12 setSortDescriptors:v16];

    if (v5) {
      objc_msgSend(v12, "setFetchLimit:", -[CallHistoryDBHandle callHistoryDBFetchLimit](self, "callHistoryDBFetchLimit"));
    }
    fCallRecordContext = self->fCallRecordContext;
    id v25 = 0;
    id v18 = [(NSManagedObjectContext *)fCallRecordContext executeFetchRequest:v12 error:&v25];
    uint64_t v19 = v25;

LABEL_15:
    if (v18) {
      goto LABEL_24;
    }
    goto LABEL_20;
  }
  if ([v9 isEqualToString:@"CallDBProperties"])
  {
    fCallDBPropertiesContext = self->fCallDBPropertiesContext;
    id v24 = 0;
    id v18 = [(NSManagedObjectContext *)fCallDBPropertiesContext executeFetchRequest:v12 error:&v24];
    uint64_t v19 = v24;
    goto LABEL_15;
  }
  uint64_t v21 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v9;
    _os_log_impl(&dword_1B8E4A000, v21, OS_LOG_TYPE_DEFAULT, "Context for given entity %{public}@ not created", buf, 0xCu);
  }

  uint64_t v19 = 0;
LABEL_20:
  uint64_t v22 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[CallHistoryDBHandle fetchWithPredicate:forEntity:withLimit:]();
  }

LABEL_23:
  id v18 = 0;
LABEL_24:

  return v18;
}

- (int64_t)deleteManagedCallsWithPredicate:(id)a3
{
  id v4 = [(CallHistoryDBHandle *)self fetchManagedCallsWithPredicate:a3 sortDescriptors:0 limit:0 offset:0 batchSize:0];
  if (v4) {
    int64_t v5 = [(CallHistoryDBHandle *)self deleteManagedCalls:v4];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)deleteManagedCalls:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
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
        [(NSManagedObjectContext *)self->fCallRecordContext deleteObject:*(void *)(*((void *)&v11 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  int64_t v9 = [v4 count];

  return v9;
}

- (id)fetchManagedCallIdentifiersWithPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 offset:(unint64_t)a6 batchSize:(unint64_t)a7
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  long long v14 = +[CallRecord fetchRequest];
  [v14 setFetchBatchSize:a7];
  [v14 setFetchLimit:a5];
  [v14 setFetchOffset:a6];
  [v14 setPredicate:v12];
  v45[0] = @"unique_id";
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  [v14 setPropertiesToFetch:v15];

  [v14 setResultType:2];
  [v14 setSortDescriptors:v13];
  ct_green_tea_logger_create_static();
  uint64_t v16 = getCTGreenTeaOsLogHandle();
  uint64_t v17 = v16;
  if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v18 = [v14 entityName];
    *(_DWORD *)buf = 138412290;
    v44 = v18;
    _os_log_impl(&dword_1B8E4A000, v17, OS_LOG_TYPE_INFO, "Read: %@", buf, 0xCu);
  }
  fCallRecordContext = self->fCallRecordContext;
  id v41 = 0;
  id v20 = [(NSManagedObjectContext *)fCallRecordContext executeFetchRequest:v14 error:&v41];
  id v21 = v41;
  uint64_t v22 = v21;
  if (v20)
  {
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v20, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v24 = v20;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      id v33 = v20;
      id v34 = v22;
      id v35 = v13;
      id v36 = v12;
      uint64_t v27 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "objectForKeyedSubscript:", @"unique_id", v33, v34, v35, v36, (void)v37);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v30 = v29;
            if ([v30 length]) {
              [v23 addObject:v30];
            }
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v26);
      id v13 = v35;
      id v12 = v36;
      id v20 = v33;
      uint64_t v22 = v34;
    }
LABEL_21:

    goto LABEL_22;
  }
  if (v21)
  {
    id v24 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[CallHistoryDBHandle fetchManagedCallIdentifiersWithPredicate:sortDescriptors:limit:offset:batchSize:]();
    }
    uint64_t v23 = 0;
    goto LABEL_21;
  }
  uint64_t v23 = 0;
LABEL_22:
  id v31 = (void *)[v23 copy];

  return v31;
}

- (id)fetchAll
{
  return [(CallHistoryDBHandle *)self fetchWithPredicate:0 forEntity:@"CallRecord"];
}

- (id)fetchAllNoLimit
{
  return [(CallHistoryDBHandle *)self fetchWithPredicate:0 forEntity:@"CallRecord" withLimit:0];
}

- (id)createCallRecord
{
  int64_t v3 = +[DBManager entityDescriptionHavingName:@"CallRecord" forContext:self->fCallRecordContext];
  if (v3)
  {
    id v4 = [[CallRecord alloc] initWithEntity:v3 insertIntoManagedObjectContext:self->fCallRecordContext];
  }
  else
  {
    uint64_t v5 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CallHistoryDBHandle createCallRecord]();
    }

    id v4 = 0;
  }

  return v4;
}

- (id)getArrayForCallTypeMask:(unsigned int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8[0] = 1;
  v8[1] = 2;
  v8[2] = 16;
  v8[3] = 8;
  v8[4] = 4;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 0; i != 5; ++i)
  {
    if ((v8[i] & a3) != 0)
    {
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v4 addObject:v6];
    }
  }
  return v4;
}

- (id)fetchWithCallTypes:(unsigned int)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v5 = [(CallHistoryDBHandle *)self getArrayForCallTypeMask:*(void *)&a3];
  uint64_t v6 = [v4 predicateWithFormat:@"calltype IN %@", v5];

  uint64_t v7 = [(CallHistoryDBHandle *)self fetchWithPredicate:v6 forEntity:@"CallRecord"];

  return v7;
}

- (id)fetchAllObjectsWithUniqueId:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"unique_id == %@", v4];
  uint64_t v6 = [(CallHistoryDBHandle *)self fetchWithPredicate:v5 forEntity:@"CallRecord"];
  if (![v6 count])
  {
    uint64_t v7 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1B8E4A000, v7, OS_LOG_TYPE_DEFAULT, "Database has no calls with %{public}@ UUID", buf, 0xCu);
    }
  }
  return v6;
}

- (id)fetchObjectWithUniqueId:(id)a3
{
  id v4 = [(CallHistoryDBHandle *)self fetchAllObjectsWithUniqueId:a3];
  if ((unint64_t)[v4 count] >= 2)
  {
    uint64_t v5 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "Multiple object with same uniqueId found but only one requested. Returning last matched object.", v8, 2u);
    }
  }
  uint64_t v6 = [v4 lastObject];

  return v6;
}

- (id)fetchObjectsWithUniqueIds:(id)a3
{
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"unique_id IN %@", a3];
  uint64_t v5 = [(CallHistoryDBHandle *)self fetchWithPredicate:v4 forEntity:@"CallRecord"];

  return v5;
}

- (id)fetchObjectsWithPredicate:(id)a3
{
  return [(CallHistoryDBHandle *)self fetchWithPredicate:a3 forEntity:@"CallRecord"];
}

- (void)deleteObjectWithUniqueId:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CallHistoryDBHandle *)self fetchObjectWithUniqueId:v4];
  if (v5)
  {
    [(NSManagedObjectContext *)self->fCallRecordContext deleteObject:v5];
  }
  else
  {
    uint64_t v6 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = v4;
      _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "Record with %{public}@ uniqueId does not exist", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)deleteObjectsWithUniqueIds:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CallHistoryDBHandle *)self fetchObjectsWithUniqueIds:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [(NSManagedObjectContext *)self->fCallRecordContext deleteObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v11 = [(CHLogger *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v4;
      _os_log_impl(&dword_1B8E4A000, v11, OS_LOG_TYPE_DEFAULT, "Record with %{public}@ uniqueIds does not exist", buf, 0xCu);
    }
  }
}

- (void)deleteAll
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(CallHistoryDBHandle *)self fetchAllNoLimit];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSManagedObjectContext *)self->fCallRecordContext deleteObject:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)performSaveWithBackgroundTaskAssertion:(id)a3 error:(id *)a4
{
  id v5 = a3;
  BackgroundTaskAssertion = (const void *)createBackgroundTaskAssertion();
  char v7 = [v5 save:a4];

  if (BackgroundTaskAssertion) {
    CFRelease(BackgroundTaskAssertion);
  }
  return v7;
}

- (void)updateCallDBProperties
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(NSManagedObjectContext *)self->fCallRecordContext insertedObjects];
  id v31 = self;
  uint64_t v4 = [(CallHistoryDBHandle *)self callDBProperties];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v35;
    id v32 = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v35 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v11 = v4;
          id v12 = v10;
          uint64_t v13 = [v12 calltype];
          int v14 = [v13 integerValue];

          if (v14 == 1)
          {
            long long v15 = [v12 duration];
            [v15 doubleValue];
            double v17 = v16;

            if (v17 > 0.0)
            {
              id v18 = [v12 originated];
              int v19 = [v18 BOOLValue];

              if (v19)
              {
                id v20 = objc_msgSend(v11, "timer_outgoing");
                [v20 doubleValue];
                double v22 = v17 + v21;

                uint64_t v23 = [NSNumber numberWithDouble:(double)(uint64_t)v22];
                objc_msgSend(v11, "setTimer_outgoing:", v23);
              }
              else
              {
                id v24 = objc_msgSend(v11, "timer_incoming");
                [v24 doubleValue];
                double v26 = v17 + v25;

                uint64_t v23 = [NSNumber numberWithDouble:(double)(uint64_t)v26];
                objc_msgSend(v11, "setTimer_incoming:", v23);
              }

              uint64_t v27 = objc_msgSend(v11, "timer_lifetime");
              [v27 doubleValue];
              double v29 = v17 + v28;

              id v30 = [NSNumber numberWithDouble:(double)(uint64_t)v29];
              objc_msgSend(v11, "setTimer_lifetime:", v30);

              id v5 = v32;
            }
          }

          uint64_t v4 = v11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v7);
  }

  if ([(NSManagedObjectContext *)v31->fCallDBPropertiesContext hasChanges])
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __45__CallHistoryDBHandle_updateCallDBProperties__block_invoke;
    v33[3] = &unk_1E61C74A8;
    v33[4] = v31;
    [(CallHistoryDBHandle *)v31 saveTimers:v33];
  }
}

uint64_t __45__CallHistoryDBHandle_updateCallDBProperties__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCallDBProperties];
}

- (BOOL)handleSaveForCallRecordContext:(id)a3 error:(id *)a4
{
  id v13 = 0;
  BOOL v6 = [(CallHistoryDBHandle *)self performSaveWithBackgroundTaskAssertion:a3 error:&v13];
  id v7 = v13;
  uint64_t v8 = v7;
  if (a4) {
    *a4 = v7;
  }
  long long v9 = [(CHLogger *)self logHandle];
  long long v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "Save performed successfully", v12, 2u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[CallHistoryDBHandle handleSaveForCallRecordContext:error:]();
  }

  return v6;
}

- (id)timerIncoming
{
  v2 = [(CallHistoryDBHandle *)self callDBProperties];
  int64_t v3 = objc_msgSend(v2, "timer_incoming");

  return v3;
}

- (id)timerOutgoing
{
  v2 = [(CallHistoryDBHandle *)self callDBProperties];
  int64_t v3 = objc_msgSend(v2, "timer_outgoing");

  return v3;
}

- (id)timerLifetime
{
  v2 = [(CallHistoryDBHandle *)self callDBProperties];
  int64_t v3 = objc_msgSend(v2, "timer_lifetime");

  return v3;
}

- (id)timerLastReset
{
  return +[DBManager getPropertyValueForKey:@"timer_last_reset" forContext:self->fCallDBPropertiesContext];
}

- (BOOL)saveTimers:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = [(NSManagedObjectContext *)self->fCallDBPropertiesContext persistentStoreCoordinator];
  BOOL v6 = [v5 persistentStores];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(CallHistoryDBHandle *)self callDBProperties];
    fCallDBPropertiesContext = self->fCallDBPropertiesContext;
    id v16 = 0;
    BOOL v10 = [(CallHistoryDBHandle *)self performSaveWithBackgroundTaskAssertion:fCallDBPropertiesContext error:&v16];
    id v11 = v16;
    id v12 = v11;
    if (!v10)
    {
      if ([v11 code] != 133020)
      {
        int v14 = [(CHLogger *)self logHandle];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CallHistoryDBHandle saveTimers:]();
        }

        BOOL v13 = 0;
        goto LABEL_12;
      }
      [(NSManagedObjectContext *)self->fCallDBPropertiesContext refreshObject:v8 mergeChanges:0];
      v4[2](v4);
    }
    BOOL v13 = 1;
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v8 = [(CHLogger *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[CallHistoryDBHandle save:]();
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (void)resetTimers
{
  int64_t v3 = [(CallHistoryDBHandle *)self callDBProperties];
  uint64_t v4 = [NSNumber numberWithDouble:0.0];
  objc_msgSend(v3, "setTimer_incoming:", v4);

  id v5 = [NSNumber numberWithDouble:0.0];
  objc_msgSend(v3, "setTimer_outgoing:", v5);

  BOOL v6 = NSNumber;
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceReferenceDate];
  uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");

  +[DBManager setPropertyValue:v8 forKey:@"timer_last_reset" forContext:self->fCallDBPropertiesContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__CallHistoryDBHandle_resetTimers__block_invoke;
  v9[3] = &unk_1E61C74A8;
  v9[4] = self;
  [(CallHistoryDBHandle *)self saveTimers:v9];
}

uint64_t __34__CallHistoryDBHandle_resetTimers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetTimers];
}

- (BOOL)resetAllTimers
{
  v2 = self;
  int64_t v3 = [(CallHistoryDBHandle *)self callDBProperties];
  uint64_t v4 = [NSNumber numberWithDouble:0.0];
  objc_msgSend(v3, "setTimer_all:", v4);
  objc_msgSend(v3, "setTimer_incoming:", v4);
  objc_msgSend(v3, "setTimer_outgoing:", v4);
  objc_msgSend(v3, "setTimer_lifetime:", v4);
  id v5 = NSNumber;
  BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSinceReferenceDate];
  uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");

  +[DBManager setPropertyValue:v7 forKey:@"timer_last_reset" forContext:v2->fCallDBPropertiesContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __37__CallHistoryDBHandle_resetAllTimers__block_invoke;
  v9[3] = &unk_1E61C74A8;
  v9[4] = v2;
  LOBYTE(v2) = [(CallHistoryDBHandle *)v2 saveTimers:v9];

  return (char)v2;
}

uint64_t __37__CallHistoryDBHandle_resetAllTimers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetAllTimers];
}

- (void)dealloc
{
  [(CallHistoryDBHandle *)self unRegisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)CallHistoryDBHandle;
  [(CallHistoryDBHandle *)&v3 dealloc];
}

- (int64_t)callsDidChangeDarwinNotificationCount
{
  return self->_callsDidChangeDarwinNotificationCount;
}

- (void)setCallsDidChangeDarwinNotificationCount:(int64_t)a3
{
  self->_callsDidChangeDarwinNotificationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong(&self->_dataStoreAddedRef, 0);
  objc_storeStrong(&self->_moveCallRecordsFromTempStoreRef, 0);
  objc_storeStrong(&self->_observerCallDBPropRef, 0);
  objc_storeStrong(&self->_observerCallRecordRef, 0);
  objc_storeStrong((id *)&self->callDBManager, 0);
  objc_storeStrong((id *)&self->fCallDBPropertiesContext, 0);
  objc_storeStrong((id *)&self->fCallRecordContext, 0);
}

- (void)callDBProperties
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Multiple call db properties object found", v2, v3, v4, v5, v6);
}

+ (void)createForClient
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to created the handle", v2, v3, v4, v5, v6);
}

- (void)moveCallRecordsFromDatabaseAtURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Input database URL is nil", v2, v3, v4, v5, v6);
}

- (void)moveCallRecordsFromDatabaseAtURL:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Unable to query version of the database at location: %{public}@", v2, v3, v4, v5, v6);
}

- (void)moveCallRecordsFromDatabaseAtURL:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to look up entity: %{public}@", v2, v3, v4, v5, v6);
}

- (void)moveCallRecordsFromDatabaseAtURL:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Failed to execute fetch on input database", v2, v3, v4, v5, v6);
}

- (void)fetchWithPredicate:forEntity:withLimit:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Entity %{public}@ not found", v2, v3, v4, v5, v6);
}

- (void)fetchWithPredicate:forEntity:withLimit:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Fetch request failed with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)fetchManagedCallCountWithPredicate:sortDescriptors:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Count calls request failed with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)fetchManagedCallsWithPredicate:sortDescriptors:limit:offset:batchSize:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Fetch calls request failed with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)fetchManagedCallIdentifiersWithPredicate:sortDescriptors:limit:offset:batchSize:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Fetch call identifiers request failed with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)createCallRecord
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "While creating call record entity %{public}@ not found", v2, v3, v4, v5, v6);
}

- (void)handleSaveForCallRecordContext:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to save changes to persistent store error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)save:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "No persistent stores. Not performing save.", v2, v3, v4, v5, v6);
}

- (void)saveTimers:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Failed to save call db properties to persistent store: %{public}@", v2, v3, v4, v5, v6);
}

@end