@interface _DPCoreDataStorage
+ (BOOL)createDatabaseDirectory:(id)a3 error:(id *)a4;
+ (id)persistentStoreOptionsFor:(id)a3 readOnly:(BOOL)a4;
+ (id)storageWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6;
+ (unint64_t)countObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5;
+ (unint64_t)deleteObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 fetchOffset:(unint64_t)a7 fetchLimit:(unint64_t)a8;
- (BOOL)deleteDatabaseForPSC:(id)a3 protectionClass:(id)a4 obliterate:(BOOL)a5;
- (BOOL)deleteStorageFor:(id)a3 obliterate:(BOOL)a4;
- (BOOL)readOnly;
- (NSDictionary)paths;
- (NSManagedObjectModel)managedObjectModel;
- (NSMutableDictionary)managedObjectContexts;
- (NSMutableDictionary)persistentStoreCoordinators;
- (NSString)databaseDirectory;
- (NSString)databaseName;
- (NSURL)modelURL;
- (OS_dispatch_queue)queueMOC;
- (OS_dispatch_queue)queuePSC;
- (_DPCoreDataStorage)init;
- (_DPCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6;
- (_DPDataProtectionStateMonitor)dataProtectionMonitor;
- (id)mocForProtectionClass:(id)a3;
- (id)persistentStoreCoordinatorFor:(id)a3;
- (unint64_t)countObjectsForEntities:(id)a3 predicate:(id)a4;
- (unint64_t)deleteObjectsOlderThanDate:(id)a3 entities:(id)a4 limit:(unint64_t)a5;
- (unint64_t)deleteOldObjectsToLimitTotalNumber:(unint64_t)a3 entities:(id)a4 limit:(unint64_t)a5;
- (unint64_t)deleteSubmittedRecords:(unint64_t)a3 entities:(id)a4 limit:(unint64_t)a5;
- (unint64_t)deleteVersionMismatchRecords:(unint64_t)a3 entities:(id)a4 limit:(unint64_t)a5;
- (void)handleDataProtectionChangeFor:(id)a3 willBeAvailable:(BOOL)a4;
- (void)handleDatabaseErrors:(id)a3 forPSC:(id)a4 protectionClass:(id)a5;
- (void)invalidateManagedObjectContextFor:(id)a3;
- (void)invalidatePersistentStoreCoordinatorFor:(id)a3;
- (void)managedObjectModel;
- (void)setManagedObjectModel:(id)a3;
@end

@implementation _DPCoreDataStorage

- (_DPCoreDataStorage)init
{
  return 0;
}

+ (id)storageWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithDirectory:v12 databaseName:v11 modelURL:v10 readOnly:v6];

  return v13;
}

- (_DPCoreDataStorage)initWithDirectory:(id)a3 databaseName:(id)a4 modelURL:(id)a5 readOnly:(BOOL)a6
{
  v45[3] = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  id v38 = a4;
  id v39 = a5;
  v43.receiver = self;
  v43.super_class = (Class)_DPCoreDataStorage;
  id v11 = [(_DPCoreDataStorage *)&v43 init];
  id v12 = v11;
  if (v11)
  {
    p_databaseDirectory = &v11->_databaseDirectory;
    objc_storeStrong((id *)&v11->_databaseDirectory, a3);
    objc_storeStrong((id *)&v12->_databaseName, a4);
    objc_storeStrong((id *)&v12->_modelURL, a5);
    v12->_readOnly = a6;
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("_DPCoreDataStore.queueMOC", v14);
    queueMOC = v12->_queueMOC;
    v12->_queueMOC = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("_DPCoreDataStore.queuePSC", v17);
    queuePSC = v12->_queuePSC;
    v12->_queuePSC = (OS_dispatch_queue *)v18;

    v20 = [NSString stringWithFormat:@"%@/%@", *p_databaseDirectory, v12->_databaseName];
    v21 = [NSString stringWithFormat:@"%@%@.db", v20, @"ClassA"];
    v22 = [NSString stringWithFormat:@"%@%@.db", v20, @"ClassC"];
    v23 = [NSString stringWithFormat:@"%@%@.db", v20, @"ClassD"];
    v24 = +[_DPDataProtectionStateMonitor dataProtectionClassA];
    v44[0] = v24;
    v45[0] = v21;
    v25 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
    v44[1] = v25;
    v45[1] = v22;
    v26 = +[_DPDataProtectionStateMonitor dataProtectionClassD];
    v44[2] = v26;
    v45[2] = v23;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:3];
    paths = v12->_paths;
    v12->_paths = (NSDictionary *)v27;

    managedObjectModel = v12->_managedObjectModel;
    v12->_managedObjectModel = 0;

    uint64_t v30 = [MEMORY[0x1E4F1CA60] dictionary];
    managedObjectContexts = v12->_managedObjectContexts;
    v12->_managedObjectContexts = (NSMutableDictionary *)v30;

    uint64_t v32 = [MEMORY[0x1E4F1CA60] dictionary];
    persistentStoreCoordinators = v12->_persistentStoreCoordinators;
    v12->_persistentStoreCoordinators = (NSMutableDictionary *)v32;

    uint64_t v34 = objc_opt_new();
    dataProtectionMonitor = v12->_dataProtectionMonitor;
    v12->_dataProtectionMonitor = (_DPDataProtectionStateMonitor *)v34;

    objc_initWeak(&location, v12);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __71___DPCoreDataStorage_initWithDirectory_databaseName_modelURL_readOnly___block_invoke;
    v40[3] = &unk_1E6C44078;
    objc_copyWeak(&v41, &location);
    [(_DPDataProtectionStateMonitor *)v12->_dataProtectionMonitor setChangeHandler:v40];
    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  return v12;
}

- (void)handleDataProtectionChangeFor:(id)a3 willBeAvailable:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    [(_DPCoreDataStorage *)self invalidateManagedObjectContextFor:v6];
    [(_DPCoreDataStorage *)self invalidatePersistentStoreCoordinatorFor:v6];
  }
}

- (void)invalidateManagedObjectContextFor:(id)a3
{
  id v4 = a3;
  queueMOC = self->_queueMOC;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56___DPCoreDataStorage_invalidateManagedObjectContextFor___block_invoke;
  v7[3] = &unk_1E6C440C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queueMOC, v7);
}

- (void)invalidatePersistentStoreCoordinatorFor:(id)a3
{
  id v4 = a3;
  queuePSC = self->_queuePSC;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62___DPCoreDataStorage_invalidatePersistentStoreCoordinatorFor___block_invoke;
  v7[3] = &unk_1E6C440C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queuePSC, v7);
}

- (NSManagedObjectModel)managedObjectModel
{
  managedObjectModel = self->_managedObjectModel;
  if (managedObjectModel) {
    goto LABEL_4;
  }
  if (self->_modelURL)
  {
    id v4 = (NSManagedObjectModel *)[objc_alloc(MEMORY[0x1E4F1C120]) initWithContentsOfURL:self->_modelURL];
    v5 = self->_managedObjectModel;
    self->_managedObjectModel = v4;

    managedObjectModel = self->_managedObjectModel;
LABEL_4:
    id v6 = managedObjectModel;
    goto LABEL_5;
  }
  id v8 = +[_DPLog framework];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_DPCoreDataStorage managedObjectModel](v8);
  }

  id v6 = 0;
LABEL_5:
  return v6;
}

+ (id)persistentStoreOptionsFor:(id)a3 readOnly:(BOOL)a4
{
  BOOL v4 = a4;
  v14[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F1BDE8];
  v13[0] = *MEMORY[0x1E4F1BE50];
  v13[1] = v5;
  v14[0] = MEMORY[0x1E4F1CC38];
  v14[1] = MEMORY[0x1E4F1CC38];
  v13[2] = *MEMORY[0x1E4F1BF20];
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  uint64_t v9 = *MEMORY[0x1E4F1BF68];
  v14[2] = v8;
  v14[3] = &unk_1F37A05A8;
  uint64_t v10 = *MEMORY[0x1E4F1BEC0];
  v13[3] = v9;
  v13[4] = v10;
  v14[4] = v7;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

- (id)persistentStoreCoordinatorFor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_DPDataProtectionStateMonitor *)self->_dataProtectionMonitor isDataAvailableFor:v4];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  queuePSC = self->_queuePSC;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52___DPCoreDataStorage_persistentStoreCoordinatorFor___block_invoke;
  block[3] = &unk_1E6C440F0;
  id v12 = &v19;
  block[4] = self;
  id v7 = v4;
  BOOL v14 = v5;
  id v11 = v7;
  v13 = &v15;
  dispatch_sync(queuePSC, block);
  if (*((unsigned char *)v16 + 24))
  {
    [(_DPCoreDataStorage *)self invalidatePersistentStoreCoordinatorFor:v7];
    id v8 = 0;
  }
  else
  {
    id v8 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (void)handleDatabaseErrors:(id)a3 forPSC:(id)a4 protectionClass:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && +[_DPErrorUtilities isCoreDataFatalError:v8])
  {
    id v11 = +[_DPCoreAnalyticsCollector sharedInstance];
    BOOL v14 = @"databaseCorrupt";
    v15[0] = MEMORY[0x1E4F1CC38];
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v11 reportMetricsForEvent:@"com.apple.DifferentialPrivacy.CoreData" withMetrics:v12];

    v13 = +[_DPLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_DPCoreDataStorage handleDatabaseErrors:forPSC:protectionClass:](v13);
    }

    [(_DPCoreDataStorage *)self deleteDatabaseForPSC:v9 protectionClass:v10 obliterate:0];
  }
}

- (id)mocForProtectionClass:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_DPDataProtectionStateMonitor *)self->_dataProtectionMonitor isDataAvailableFor:v4];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2;
  v23 = __Block_byref_object_dispose__2;
  id v24 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  queueMOC = self->_queueMOC;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___DPCoreDataStorage_mocForProtectionClass___block_invoke;
  block[3] = &unk_1E6C440F0;
  id v12 = &v19;
  block[4] = self;
  id v7 = v4;
  BOOL v14 = v5;
  id v11 = v7;
  v13 = &v15;
  dispatch_sync(queueMOC, block);
  if (*((unsigned char *)v16 + 24))
  {
    [(_DPCoreDataStorage *)self invalidateManagedObjectContextFor:v7];
    id v8 = 0;
  }
  else
  {
    id v8 = (id)v20[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (unint64_t)deleteVersionMismatchRecords:(unint64_t)a3 entities:(id)a4 limit:(unint64_t)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  char v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v25[0] = v18;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v9 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
  id v10 = [(_DPCoreDataStorage *)self mocForProtectionClass:v9];

  id v11 = +[_DPRecordQueryPredicates predicateForRecordsWithVersionMismatch];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(obj);
        }
        v14 += [(id)objc_opt_class() deleteObjectsInContext:v10 entityName:*(void *)(*((void *)&v20 + 1) + 8 * i) predicate:v11 sortDescriptors:v8 fetchOffset:0 fetchLimit:a5];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

- (unint64_t)deleteSubmittedRecords:(unint64_t)a3 entities:(id)a4 limit:(unint64_t)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  char v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v25[0] = v18;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v9 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
  id v10 = [(_DPCoreDataStorage *)self mocForProtectionClass:v9];

  id v11 = +[_DPRecordQueryPredicates predicateForRecordsSubmitted];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(obj);
        }
        v14 += [(id)objc_opt_class() deleteObjectsInContext:v10 entityName:*(void *)(*((void *)&v20 + 1) + 8 * i) predicate:v11 sortDescriptors:v8 fetchOffset:0 fetchLimit:a5];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

- (unint64_t)deleteOldObjectsToLimitTotalNumber:(unint64_t)a3 entities:(id)a4 limit:(unint64_t)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  char v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v26[0] = v18;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  id v9 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
  id v10 = [(_DPCoreDataStorage *)self mocForProtectionClass:v9];

  id v11 = +[_DPRecordQueryPredicates predicateForAllRecords];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v7;
  uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    unint64_t v14 = 0;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        v14 += [(id)objc_opt_class() deleteObjectsInContext:v10 entityName:*(void *)(*((void *)&v21 + 1) + 8 * i) predicate:v11 sortDescriptors:v8 fetchOffset:a3 fetchLimit:a5];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
  else
  {
    unint64_t v14 = 0;
  }

  return v14;
}

- (unint64_t)deleteObjectsOlderThanDate:(id)a3 entities:(id)a4 limit:(unint64_t)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v27[0] = v20;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  id v11 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
  uint64_t v12 = [(_DPCoreDataStorage *)self mocForProtectionClass:v11];

  uint64_t v13 = +[_DPRecordQueryPredicates predicateForRecordsOlderThan:v8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v9;
  uint64_t v14 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    unint64_t v16 = 0;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        v16 += [(id)objc_opt_class() deleteObjectsInContext:v12 entityName:*(void *)(*((void *)&v22 + 1) + 8 * i) predicate:v13 sortDescriptors:v10 fetchOffset:0 fetchLimit:a5];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }
  else
  {
    unint64_t v16 = 0;
  }

  return v16;
}

+ (unint64_t)deleteObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5 sortDescriptors:(id)a6 fetchOffset:(unint64_t)a7 fetchLimit:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v13)
  {
    uint64_t v17 = (void *)os_transaction_create();
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __105___DPCoreDataStorage_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchOffset_fetchLimit___block_invoke;
    v20[3] = &unk_1E6C44118;
    id v21 = v14;
    id v22 = v13;
    unint64_t v26 = a8;
    unint64_t v27 = a7;
    id v23 = v15;
    id v24 = v16;
    long long v25 = &v28;
    [v22 performWithOptions:4 andBlock:v20];
    unint64_t v18 = v29[3];

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    unint64_t v18 = 0;
  }

  return v18;
}

- (unint64_t)countObjectsForEntities:(id)a3 predicate:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_DPDataProtectionStateMonitor dataProtectionClassC];
  id v9 = [(_DPCoreDataStorage *)self mocForProtectionClass:v8];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v10);
        }
        v13 += objc_msgSend((id)objc_opt_class(), "countObjectsInContext:entityName:predicate:", v9, *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

+ (unint64_t)countObjectsInContext:(id)a3 entityName:(id)a4 predicate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    id v10 = (void *)os_transaction_create();
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65___DPCoreDataStorage_countObjectsInContext_entityName_predicate___block_invoke;
    v13[3] = &unk_1E6C44140;
    id v14 = v8;
    id v15 = v7;
    id v16 = v9;
    long long v17 = &v18;
    [v15 performWithOptions:4 andBlock:v13];
    unint64_t v11 = v19[3];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)deleteDatabaseForPSC:(id)a3 protectionClass:(id)a4 obliterate:(BOOL)a5
{
  v25[2] = *MEMORY[0x1E4F143B8];
  BOOL readOnly = self->_readOnly;
  if (!self->_readOnly)
  {
    BOOL v6 = a5;
    id v9 = (void *)MEMORY[0x1E4F1CB10];
    id v10 = a4;
    id v11 = a3;
    uint64_t v12 = [(_DPCoreDataStorage *)self paths];
    unint64_t v13 = [v12 objectForKeyedSubscript:v10];

    id v14 = [v9 fileURLWithPath:v13];

    if (v6)
    {
      uint64_t v15 = *MEMORY[0x1E4F1BEC8];
      v24[0] = *MEMORY[0x1E4F1BF18];
      v24[1] = v15;
      v25[0] = MEMORY[0x1E4F1CC38];
      v25[1] = MEMORY[0x1E4F1CC38];
      id v16 = (void *)MEMORY[0x1E4F1C9E8];
      long long v17 = v25;
      uint64_t v18 = v24;
      uint64_t v19 = 2;
    }
    else
    {
      uint64_t v22 = *MEMORY[0x1E4F1BF18];
      uint64_t v23 = MEMORY[0x1E4F1CC38];
      id v16 = (void *)MEMORY[0x1E4F1C9E8];
      long long v17 = &v23;
      uint64_t v18 = &v22;
      uint64_t v19 = 1;
    }
    uint64_t v20 = [v16 dictionaryWithObjects:v17 forKeys:v18 count:v19];
    [v11 _destroyPersistentStoreAtURL:v14 withType:*MEMORY[0x1E4F1BF70] options:v20 error:0];
  }
  return !readOnly;
}

- (BOOL)deleteStorageFor:(id)a3 obliterate:(BOOL)a4
{
  id v6 = a3;
  if (self->_readOnly)
  {
    BOOL v7 = 0;
  }
  else
  {
    id v8 = [(_DPCoreDataStorage *)self mocForProtectionClass:v6];
    if (v8)
    {
      id v9 = [(_DPCoreDataStorage *)self persistentStoreCoordinatorFor:v6];
      if (v9)
      {
        id v10 = (void *)os_transaction_create();
        uint64_t v17 = 0;
        uint64_t v18 = &v17;
        uint64_t v19 = 0x2020000000;
        char v20 = 0;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __50___DPCoreDataStorage_deleteStorageFor_obliterate___block_invoke;
        v12[3] = &unk_1E6C44168;
        v12[4] = self;
        id v13 = v6;
        uint64_t v15 = &v17;
        id v14 = v9;
        BOOL v16 = a4;
        [v8 performWithOptions:4 andBlock:v12];
        BOOL v7 = *((unsigned char *)v18 + 24) != 0;

        _Block_object_dispose(&v17, 8);
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  return v7;
}

+ (BOOL)createDatabaseDirectory:(id)a3 error:(id *)a4
{
  BOOL v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a3;
  BOOL v7 = [v5 defaultManager];
  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];

  LOBYTE(a4) = [v7 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:a4];
  return (char)a4;
}

- (NSString)databaseDirectory
{
  return self->_databaseDirectory;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSURL)modelURL
{
  return self->_modelURL;
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (void)setManagedObjectModel:(id)a3
{
}

- (NSMutableDictionary)managedObjectContexts
{
  return self->_managedObjectContexts;
}

- (NSMutableDictionary)persistentStoreCoordinators
{
  return self->_persistentStoreCoordinators;
}

- (OS_dispatch_queue)queueMOC
{
  return self->_queueMOC;
}

- (OS_dispatch_queue)queuePSC
{
  return self->_queuePSC;
}

- (_DPDataProtectionStateMonitor)dataProtectionMonitor
{
  return self->_dataProtectionMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_queuePSC, 0);
  objc_storeStrong((id *)&self->_queueMOC, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinators, 0);
  objc_storeStrong((id *)&self->_managedObjectContexts, 0);
  objc_storeStrong((id *)&self->_managedObjectModel, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
}

- (void)managedObjectModel
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Missing model URL!", v1, 2u);
}

- (void)handleDatabaseErrors:(os_log_t)log forPSC:protectionClass:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Attempting to delete corrupted database", v1, 2u);
}

@end