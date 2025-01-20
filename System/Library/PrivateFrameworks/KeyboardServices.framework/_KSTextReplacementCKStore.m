@interface _KSTextReplacementCKStore
+ (BOOL)isMigrationCompleted;
- (BOOL)ckMigrationStatusOnCloud;
- (BOOL)isAccountAvailable;
- (_KSCloudKitManager)cloudKitManager;
- (_KSTextReplacementCKStore)initWithDirectoryPath:(id)a3;
- (_KSTextReplacementCoreDataStore)coreDataStore;
- (id)cloudEntriesFromLocalEntries:(id)a3;
- (id)cloudRecordIDsForLocalEntries:(id)a3;
- (id)localEntriesFromCloudEntries:(id)a3;
- (id)queryDeletedEntries;
- (id)queryUpdatedLocalEntries;
- (id)textReplacementEntries;
- (unint64_t)countLocalEntriesToBeSynced;
- (unint64_t)decayedSyncCountForTime:(id)a3;
- (unint64_t)getSyncCount;
- (unint64_t)getSyncCountThresholdHalfLifeHours;
- (unint64_t)getSyncCountThrottleThreshold;
- (unint64_t)numPullRequests;
- (void)_requestSync:(unint64_t)a3 completionBlock:(id)a4;
- (void)_updateSyncCount:(unint64_t)a3 success:(BOOL)a4;
- (void)accountDidChange:(id)a3;
- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5;
- (void)dealloc;
- (void)importSampleShortcutsIfNecessary;
- (void)pullRemoteDataWithPriority:(unint64_t)a3 completionHandler:(id)a4;
- (void)pushAllLocalData;
- (void)pushLocalChangesWithPriority:(unint64_t)a3 completionHandler:(id)a4;
- (void)pushMigrationStatusToCloud:(BOOL)a3;
- (void)queryCloudIfFirstPullOrAccountChanged:(BOOL)a3;
- (void)queryMigrationStatusOnCloudWithCallback:(id)a3;
- (void)queryTextReplacementsWithCallback:(id)a3;
- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4;
- (void)recordSyncStatus;
- (void)removeAllEntries;
- (void)removeAllEntriesWithCompletionHandler:(id)a3;
- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4;
- (void)requestSyncWithCompletionBlock:(id)a3;
- (void)setCkMigrationStatusOnCloud:(BOOL)a3;
- (void)setCloudKitManager:(id)a3;
- (void)setCoreDataStore:(id)a3;
- (void)setNumPullRequests:(unint64_t)a3;
- (void)userDidDeleteRecordZone:(id)a3;
@end

@implementation _KSTextReplacementCKStore

- (void)queryCloudIfFirstPullOrAccountChanged:(BOOL)a3
{
  objc_initWeak(&location, self);
  dataQueue = self->_dataQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67___KSTextReplacementCKStore_queryCloudIfFirstPullOrAccountChanged___block_invoke;
  v6[3] = &unk_264891070;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  v6[4] = self;
  dispatch_async(dataQueue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)queryTextReplacementsWithCallback:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__0;
  v10[4] = __Block_byref_object_dispose__0;
  id v11 = 0;
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63___KSTextReplacementCKStore_queryTextReplacementsWithCallback___block_invoke;
  block[3] = &unk_264891130;
  id v8 = v4;
  v9 = v10;
  block[4] = self;
  id v6 = v4;
  dispatch_async(dataQueue, block);

  _Block_object_dispose(v10, 8);
}

- (_KSTextReplacementCoreDataStore)coreDataStore
{
  return self->_coreDataStore;
}

- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void))a4;
  id v7 = [(_KSTextReplacementCKStore *)self cloudKitManager];
  char v8 = [v7 isAccountAvailable];

  if (v8)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v25 = 0x2020000000;
    unint64_t v26 = 0;
    v9 = [MEMORY[0x263EFF910] date];
    unint64_t v10 = [(_KSTextReplacementCKStore *)self decayedSyncCountForTime:v9];

    unint64_t v26 = v10;
    if (a3)
    {
      unint64_t v11 = *(void *)(*((void *)&buf + 1) + 24);
      if (v11 >= [(_KSTextReplacementCKStore *)self getSyncCountThrottleThreshold])
      {
        v15 = KSCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v22 = 136315138;
          v23 = "-[_KSTextReplacementCKStore requestSync:withCompletionBlock:]";
          _os_log_impl(&dword_22B2BC000, v15, OS_LOG_TYPE_INFO, "%s  Skipping syncing, reached threshold", v22, 0xCu);
        }

        if (v6) {
          v6[2](v6, 0);
        }
        goto LABEL_17;
      }
      if (a3 == 2)
      {
        dataQueue = self->_dataQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_2;
        block[3] = &unk_2648911C8;
        v19[2] = 2;
        block[4] = self;
        v19[1] = &buf;
        v13 = (id *)v19;
        v19[0] = v6;
        dispatch_async(dataQueue, block);
      }
      else
      {
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke_93;
        v16[3] = &unk_2648911A0;
        v16[4] = self;
        v17[1] = &buf;
        v17[0] = v6;
        [(_KSTextReplacementCKStore *)self _requestSync:a3 completionBlock:v16];
        v13 = (id *)v17;
      }
    }
    else
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __61___KSTextReplacementCKStore_requestSync_withCompletionBlock___block_invoke;
      v20[3] = &unk_2648911A0;
      v20[4] = self;
      v21[1] = &buf;
      v21[0] = v6;
      [(_KSTextReplacementCKStore *)self _requestSync:0 completionBlock:v20];
      v13 = (id *)v21;
    }

LABEL_17:
    _Block_object_dispose(&buf, 8);
    goto LABEL_18;
  }
  v14 = KSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[_KSTextReplacementCKStore requestSync:withCompletionBlock:]";
    _os_log_impl(&dword_22B2BC000, v14, OS_LOG_TYPE_INFO, "%s  User is not logged in, not syncing", (uint8_t *)&buf, 0xCu);
  }

  if (v6) {
    v6[2](v6, 0);
  }
LABEL_18:
}

- (void)accountDidChange:(id)a3
{
  id v4 = a3;
  v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"KSCloudKitAccountDidChangeStatusKey"];
  uint64_t v7 = [v6 integerValue];

  char v8 = [v4 userInfo];

  v9 = [v8 objectForKeyedSubscript:@"KSCloudKitAccountDidChangeUserChangedKey"];
  LOBYTE(v6) = [v9 BOOLValue];

  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46___KSTextReplacementCKStore_accountDidChange___block_invoke;
  block[3] = &unk_264891098;
  char v12 = (char)v6;
  block[4] = self;
  void block[5] = v7;
  dispatch_async(dataQueue, block);
}

- (_KSTextReplacementCKStore)initWithDirectoryPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_KSTextReplacementCKStore;
  v5 = [(_KSTextReplacementCKStore *)&v19 init];
  if (v5)
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.keyboardServices.ckStore.syncWork", v7);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v8;

    unint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.keyboardServices.ckStore.dataQueue", v10);
    dataQueue = v5->_dataQueue;
    v5->_dataQueue = (OS_dispatch_queue *)v11;

    v13 = [[_KSTextReplacementCoreDataStore alloc] initWithDirectoryPath:v4];
    coreDataStore = v5->_coreDataStore;
    v5->_coreDataStore = v13;

    [(_KSTextReplacementCKStore *)v5 importSampleShortcutsIfNecessary];
    v15 = [[_KSCloudKitManager alloc] initWithRecordZoneName:@"TextReplacements"];
    cloudKitManager = v5->_cloudKitManager;
    v5->_cloudKitManager = v15;

    [(_KSCloudKitManager *)v5->_cloudKitManager setDelegate:v5];
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v5 selector:sel_accountDidChange_ name:@"KSCloudKitAccountDidChange" object:v5->_cloudKitManager];

    [(_KSTextReplacementCKStore *)v5 queryCloudIfFirstPullOrAccountChanged:0];
  }

  return v5;
}

- (void)importSampleShortcutsIfNecessary
{
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61___KSTextReplacementCKStore_importSampleShortcutsIfNecessary__block_invoke;
  block[3] = &unk_2648906A8;
  block[4] = self;
  dispatch_async(dataQueue, block);
}

- (_KSCloudKitManager)cloudKitManager
{
  return self->_cloudKitManager;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_KSTextReplacementCKStore;
  [(_KSTextReplacementCKStore *)&v4 dealloc];
}

- (void)pushAllLocalData
{
  id v3 = [(_KSTextReplacementCKStore *)self textReplacementEntries];
  [(_KSTextReplacementCKStore *)self addEntries:v3 removeEntries:MEMORY[0x263EFFA68] withCompletionHandler:&__block_literal_global_69];
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  context = (void *)MEMORY[0x230F44DF0]();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v11 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v15 setNeedsSaveToCloud:1];
        v16 = [v15 timestamp];

        if (!v16)
        {
          v17 = [MEMORY[0x263EFF910] date];
          [v15 setTimestamp:v17];
        }
      }
      uint64_t v12 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76___KSTextReplacementCKStore_addEntries_removeEntries_withCompletionHandler___block_invoke;
  block[3] = &unk_2648910E0;
  block[4] = self;
  id v19 = v9;
  id v24 = v19;
  id v20 = v8;
  id v25 = v20;
  id v21 = v10;
  id v26 = v21;
  dispatch_async(dataQueue, block);
}

- (void)removeAllEntries
{
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45___KSTextReplacementCKStore_removeAllEntries__block_invoke;
  block[3] = &unk_2648906A8;
  block[4] = self;
  dispatch_async(dataQueue, block);
}

- (void)removeAllEntriesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dataQueue = self->_dataQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67___KSTextReplacementCKStore_removeAllEntriesWithCompletionHandler___block_invoke;
  v7[3] = &unk_264890A70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dataQueue, v7);
}

- (id)textReplacementEntries
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_dataQueue);
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"wasDeleted == %@ || wasDeleted == nil", MEMORY[0x263EFFA80]];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = (id)MEMORY[0x263EFFA68];
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51___KSTextReplacementCKStore_textReplacementEntries__block_invoke;
  block[3] = &unk_264891108;
  id v9 = v3;
  id v10 = &v11;
  block[4] = self;
  id v5 = v3;
  dispatch_sync(dataQueue, block);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  void v19[3] = __Block_byref_object_copy__0;
  v19[4] = __Block_byref_object_dispose__0;
  id v20 = 0;
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"wasDeleted == %@ || wasDeleted == nil", MEMORY[0x263EFFA80]];
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73___KSTextReplacementCKStore_queryTextReplacementsWithPredicate_callback___block_invoke;
  block[3] = &unk_264891158;
  id v14 = v6;
  id v15 = v8;
  id v17 = v7;
  v18 = v19;
  id v16 = self;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(dataQueue, block);

  _Block_object_dispose(v19, 8);
}

+ (BOOL)isMigrationCompleted
{
  return 0;
}

- (void)pushMigrationStatusToCloud:(BOOL)a3
{
  BOOL v3 = a3;
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = [(_KSTextReplacementCKStore *)self cloudKitManager];
  id v12 = @"didMigrate";
  id v6 = [NSNumber numberWithBool:v3];
  v13[0] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v8 = [v5 recordWithName:@"migrationStatus" type:@"TextReplacementMigration" attributes:v7];

  if (v8)
  {
    id v9 = [(_KSTextReplacementCKStore *)self cloudKitManager];
    id v11 = v8;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:1];
    [v9 updateRecords:v10 deleteRecordIDs:0 withPriority:1 completionHandler:&__block_literal_global_89];
  }
}

- (void)queryMigrationStatusOnCloudWithCallback:(id)a3
{
  id v8 = (void (**)(id, BOOL))a3;
  id v4 = objc_alloc(MEMORY[0x263EFFA40]);
  id v5 = +[_KSUtilities userDefaultsSuiteName];
  id v6 = (void *)[v4 initWithSuiteName:v5];

  BOOL v7 = ([v6 BOOLForKey:@"KSDidMigrateToCloudKitOnCloud"] & 1) != 0
    || [(_KSTextReplacementCKStore *)self ckMigrationStatusOnCloud];
  v8[2](v8, v7);
}

- (BOOL)isAccountAvailable
{
  v2 = [(_KSTextReplacementCKStore *)self cloudKitManager];
  char v3 = [v2 isAccountAvailable];

  return v3;
}

- (unint64_t)getSyncCount
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  char v3 = +[_KSUtilities userDefaultsSuiteName];
  id v4 = (void *)[v2 initWithSuiteName:v3];

  uint64_t v5 = [v4 integerForKey:@"kTRCKSyncCount"];
  unint64_t v6 = v5 & ~(v5 >> 63);

  return v6;
}

- (unint64_t)getSyncCountThresholdHalfLifeHours
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  char v3 = +[_KSUtilities userDefaultsSuiteName];
  id v4 = (void *)[v2 initWithSuiteName:v3];

  [v4 floatForKey:@"TRCKSyncCountHalflifeInHours"];
  BOOL v6 = v5 != 0.0 && v5 <= 46.0;
  if (!v6 || v5 < 0.1) {
    float v5 = 10.0;
  }
  unint64_t v7 = (unint64_t)v5;

  return v7;
}

- (unint64_t)getSyncCountThrottleThreshold
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  char v3 = +[_KSUtilities userDefaultsSuiteName];
  id v4 = (void *)[v2 initWithSuiteName:v3];

  uint64_t v5 = [v4 integerForKey:@"TRCKSyncMaxCountThreshold"];
  if ((unint64_t)(v5 - 1001) >= 0xFFFFFFFFFFFFFC1BLL) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 100;
  }

  return v6;
}

- (unint64_t)decayedSyncCountForTime:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  unint64_t v6 = +[_KSUtilities userDefaultsSuiteName];
  unint64_t v7 = (void *)[v5 initWithSuiteName:v6];

  id v8 = [v7 objectForKey:@"kTRCKLastSyncTime"];
  unint64_t v9 = [(_KSTextReplacementCKStore *)self getSyncCount];
  unint64_t v10 = [(_KSTextReplacementCKStore *)self getSyncCountThresholdHalfLifeHours];
  if (v8)
  {
    [v8 timeIntervalSinceDate:v4];
    double v12 = fabs(v11);
  }
  else
  {
    double v12 = 0.0;
  }
  unint64_t v13 = (unint64_t)(exp2(v12 / (float)((float)v10 * -3600.0)) * (double)v9);

  return v13;
}

- (void)_updateSyncCount:(unint64_t)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = objc_alloc(MEMORY[0x263EFFA40]);
  unint64_t v7 = +[_KSUtilities userDefaultsSuiteName];
  id v12 = (id)[v6 initWithSuiteName:v7];

  uint64_t v8 = 1;
  if (!v4) {
    uint64_t v8 = 2;
  }
  unint64_t v9 = v8 + a3;
  unint64_t v10 = [MEMORY[0x263EFF910] date];
  [v12 setObject:v10 forKey:@"kTRCKLastSyncTime"];

  double v11 = [NSNumber numberWithUnsignedInteger:v9];
  [v12 setObject:v11 forKey:@"kTRCKSyncCount"];
}

- (void)_requestSync:(unint64_t)a3 completionBlock:(id)a4
{
  id v6 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58___KSTextReplacementCKStore__requestSync_completionBlock___block_invoke;
  block[3] = &unk_264890AE8;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(syncQueue, block);
}

- (void)requestSyncWithCompletionBlock:(id)a3
{
}

- (void)pushLocalChangesWithPriority:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76___KSTextReplacementCKStore_pushLocalChangesWithPriority_completionHandler___block_invoke;
  block[3] = &unk_264890AE8;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(syncQueue, block);
}

- (void)pullRemoteDataWithPriority:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74___KSTextReplacementCKStore_pullRemoteDataWithPriority_completionHandler___block_invoke;
  block[3] = &unk_264890AE8;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(dataQueue, block);
}

- (void)recordSyncStatus
{
  dataQueue = self->_dataQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45___KSTextReplacementCKStore_recordSyncStatus__block_invoke;
  block[3] = &unk_2648906A8;
  void block[4] = self;
  dispatch_async(dataQueue, block);
}

- (unint64_t)countLocalEntriesToBeSynced
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dataQueue);
  char v3 = [(_KSTextReplacementCKStore *)self coreDataStore];
  BOOL v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"needsSaveToCloud == TRUE OR wasDeleted == TRUE"];
  unint64_t v5 = [v3 countEntriesWithPredicate:v4];

  return v5;
}

- (id)queryUpdatedLocalEntries
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  unint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  dataQueue = self->_dataQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53___KSTextReplacementCKStore_queryUpdatedLocalEntries__block_invoke;
  v6[3] = &unk_264891308;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(dataQueue, v6);
  BOOL v4 = [(_KSTextReplacementCKStore *)self cloudEntriesFromLocalEntries:v8[5]];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)queryDeletedEntries
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  unint64_t v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  dataQueue = self->_dataQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48___KSTextReplacementCKStore_queryDeletedEntries__block_invoke;
  v6[3] = &unk_264891308;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(dataQueue, v6);
  BOOL v4 = [(_KSTextReplacementCKStore *)self cloudRecordIDsForLocalEntries:v8[5]];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)cloudEntriesFromLocalEntries:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v21 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v24;
    *(void *)&long long v5 = 136315394;
    long long v19 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "cloudData", v19);

        unint64_t v11 = [(_KSTextReplacementCKStore *)self cloudKitManager];
        id v12 = [v9 cloudID];
        if (v10)
        {
          unint64_t v13 = [v9 cloudData];
          id v14 = [v9 unEncryptedFields];
          id v15 = [v9 encryptedFields];
          id v16 = [v11 recordWithName:v12 type:@"TextReplacementEntry" cloudData:v13 attributes:v14 encryptedFields:v15];
        }
        else
        {
          unint64_t v13 = [v9 unEncryptedFields];
          id v14 = [v9 encryptedFields];
          id v16 = [v11 recordWithName:v12 type:@"TextReplacementEntry" attributes:v13 encryptedFields:v14];
        }

        if (v16)
        {
          [v21 addObject:v16];
        }
        else
        {
          id v17 = KSCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = v19;
            long long v28 = "-[_KSTextReplacementCKStore cloudEntriesFromLocalEntries:]";
            __int16 v29 = 2112;
            long long v30 = v9;
            _os_log_error_impl(&dword_22B2BC000, v17, OS_LOG_TYPE_ERROR, "%s  >>> no CKRecord for TextreplacementEntry: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v6);
  }

  return v21;
}

- (id)cloudRecordIDsForLocalEntries:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v8 = 136315650;
    long long v19 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
        unint64_t v13 = [(_KSTextReplacementCKStore *)self cloudKitManager];
        id v14 = [v12 cloudID];
        id v15 = [v13 recordIDForName:v14];

        if (v15)
        {
          [v5 addObject:v15];
        }
        else
        {
          id v16 = KSCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v17 = [v12 cloudID];
            *(_DWORD *)long long buf = v19;
            long long v25 = "-[_KSTextReplacementCKStore cloudRecordIDsForLocalEntries:]";
            __int16 v26 = 2112;
            long long v27 = v12;
            __int16 v28 = 2112;
            __int16 v29 = v17;
            _os_log_error_impl(&dword_22B2BC000, v16, OS_LOG_TYPE_ERROR, "%s  >>> ERROR couldn't create recordID for entry: %@, cloudID: %@", buf, 0x20u);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)localEntriesFromCloudEntries:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v27;
    *(void *)&long long v7 = 136315394;
    long long v24 = v7;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "recordType", v24);
        int v12 = [v11 isEqualToString:@"TextReplacementEntry"];

        if (v12)
        {
          unint64_t v13 = +[_KSTextReplacementEntry localEntryFromCloudEntry:v10];
          [v4 addObject:v13];
        }
        else
        {
          id v14 = [v10 recordType];
          int v15 = [v14 isEqualToString:@"TextReplacementMigration"];

          if (!v15) {
            continue;
          }
          unint64_t v13 = [v10 objectForKey:@"didMigrate"];
          uint64_t v16 = [v13 BOOLValue];
          id v17 = self;
          objc_sync_enter(v17);
          [(_KSTextReplacementCKStore *)v17 setCkMigrationStatusOnCloud:v16];
          objc_sync_exit(v17);

          id v18 = objc_alloc(MEMORY[0x263EFFA40]);
          long long v19 = +[_KSUtilities userDefaultsSuiteName];
          long long v20 = (void *)[v18 initWithSuiteName:v19];

          [v20 setBool:v16 forKey:@"KSDidMigrateToCloudKitOnCloud"];
          long long v21 = KSCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            long long v22 = [NSNumber numberWithBool:v16];
            *(_DWORD *)long long buf = v24;
            uint64_t v31 = "-[_KSTextReplacementCKStore localEntriesFromCloudEntries:]";
            __int16 v32 = 2112;
            v33 = v22;
            _os_log_impl(&dword_22B2BC000, v21, OS_LOG_TYPE_INFO, "%s  cloud migration status: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)userDidDeleteRecordZone:(id)a3
{
  if ([a3 isEqualToString:@"TextReplacements"])
  {
    [(_KSTextReplacementCKStore *)self removeAllEntries];
  }
}

- (void)setCloudKitManager:(id)a3
{
}

- (void)setCoreDataStore:(id)a3
{
}

- (BOOL)ckMigrationStatusOnCloud
{
  return self->_ckMigrationStatusOnCloud;
}

- (void)setCkMigrationStatusOnCloud:(BOOL)a3
{
  self->_ckMigrationStatusOnCloud = a3;
}

- (unint64_t)numPullRequests
{
  return self->_numPullRequests;
}

- (void)setNumPullRequests:(unint64_t)a3
{
  self->_numPullRequests = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDataStore, 0);
  objc_storeStrong((id *)&self->_cloudKitManager, 0);
  objc_storeStrong((id *)&self->_dataQueue, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
}

@end