@interface _KSTextReplacementLegacyStore
+ (id)basePersistentStoreURL;
+ (id)cachedStorePath;
+ (id)legacyImportFilePaths;
+ (id)legacyImportWordKeyPairsFromFiles:(id)a3;
+ (id)legacyStorePath;
+ (id)textReplacementEntriesFromManagedObjects:(id)a3;
- (BOOL)_mergeShortcut:(id)a3 phrase:(id)a4 fromContext:(id)a5;
- (BOOL)_shouldMergeShortcut:(id)a3 phrase:(id)a4 intoContext:(id)a5;
- (BOOL)detectAndCleanDuplicatesWithContext:(id)a3;
- (BOOL)didScheduleCacheUpdate;
- (BOOL)forceMaintenance;
- (BOOL)mergeEntriesForUbiquityIdentityChangeFromURL:(id)a3 firstDelete:(BOOL)a4;
- (BOOL)mergeEntriesForUbiquityIdentityChangeIfNecessary;
- (BOOL)mergeEntriesFromAllStoresIncludeLocalVariations:(BOOL)a3;
- (BOOL)migrateEntriesFromStoreAtURL:(id)a3 error:(id *)a4;
- (BOOL)minimumUptimeDidExpire;
- (BOOL)needsMaintenance;
- (BOOL)pendingSampleShortcutImport;
- (BOOL)save;
- (BOOL)shouldDisableCaching;
- (BOOL)shouldUpdateTheCache;
- (BOOL)suspendedForAccountChange;
- (BOOL)ubiquityStoreLoaded;
- (BOOL)writeEntriesToCache:(id)a3;
- (NSDate)lastMaintenanceDate;
- (NSDate)persistentStoreDidLoadTime;
- (NSDate)ubiquityStoreLoadStartTime;
- (NSManagedObjectContext)managedObjectContext;
- (NSPersistentStore)persistentStore;
- (NSPersistentStoreCoordinator)persistentStoreCoordinator;
- (NSString)cacheFilePath;
- (NSURL)baseURL;
- (OS_dispatch_queue)workQueue;
- (_KSTextReplacementLegacyStore)init;
- (_KSTextReplacementLegacyStore)initWithBaseURL:(id)a3;
- (double)minimumUptimeRemaining;
- (id)_deleteTransaction:(id)a3;
- (id)currentStoreIndentity;
- (id)entityDescription;
- (id)entriesFromCache:(id *)a3;
- (id)entriesMatchingPredicate:(id)a3;
- (id)entriesMatchingPredicate:(id)a3 sortDescriptors:(id)a4;
- (id)entriesUsingSortDescriptors:(id)a3;
- (id)managedObjectModelURL;
- (id)mergeShortcutsFromContext:(id)a3;
- (id)removeEntriesWithPredicate:(id)a3;
- (id)storeURLForMergeAfterUbiquityIdentityChangeFromToken:(id)a3 toToken:(id)a4 withLastKnownToken:(id)a5 shouldDeleteFirst:(BOOL *)a6;
- (id)textReplacementEntries;
- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6;
- (int64_t)importedSinceMaintenance;
- (void)_deleteDuplicatesOfShortcut:(id)a3 phrase:(id)a4 count:(int64_t)a5 withContext:(id)a6;
- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5;
- (void)cleanup;
- (void)dealloc;
- (void)didMaintenance;
- (void)didMergeEntriesForNewUbiquityIdentity:(id)a3;
- (void)didMergeEntriesForOtherLocalPeers:(id)a3;
- (void)endMinimumUptime;
- (void)iCloudAccountDidChange:(id)a3;
- (void)importLegacyEntries;
- (void)importSampleShortcutsIfNecessary;
- (void)insertEntryWithValue:(id)a3;
- (void)loadMaintenancePreferencesIfNecessary;
- (void)loadPersistentStoreIfNecessary;
- (void)migrateSundanceData;
- (void)migrateTellurideData;
- (void)performMaintenanceIfNecessary;
- (void)persistentStoreCoordinatorStoresDidChange:(id)a3;
- (void)persistentStoreCoordinatorStoresWillChange:(id)a3;
- (void)persistentStoreDidImportUbiquitousContentChanges:(id)a3;
- (void)prepareForMigration;
- (void)queryTextReplacementsWithCallback:(id)a3;
- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4;
- (void)removeAllEntries;
- (void)requestMinimumUptime;
- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4;
- (void)requestSyncWithCompletionBlock:(id)a3;
- (void)retirePersistentStoreAtURL:(id)a3;
- (void)runLegacyMigration;
- (void)runMaintenanceIncludeLocalVariations:(BOOL)a3;
- (void)scheduleCacheUpdate:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setCacheFilePath:(id)a3;
- (void)setDidScheduleCacheUpdate:(BOOL)a3;
- (void)setForceMaintenance:(BOOL)a3;
- (void)setImportedSinceMaintenance:(int64_t)a3;
- (void)setLastMaintenanceDate:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setMinimumUptimeDidExpire:(BOOL)a3;
- (void)setPendingSampleShortcutImport:(BOOL)a3;
- (void)setPersistentStore:(id)a3;
- (void)setPersistentStoreCoordinator:(id)a3;
- (void)setPersistentStoreDidLoadTime:(id)a3;
- (void)setShouldDisableCaching:(BOOL)a3;
- (void)setShouldUpdateTheCache:(BOOL)a3;
- (void)setSuspendedForAccountChange:(BOOL)a3;
- (void)setUbiquityStoreLoadStartTime:(id)a3;
- (void)setUbiquityStoreLoaded:(BOOL)a3;
- (void)unloadPersistentStore;
@end

@implementation _KSTextReplacementLegacyStore

- (id)managedObjectModelURL
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"UserDictionary" withExtension:@"mom"];

  return v3;
}

- (void)dealloc
{
  id v3 = objc_alloc(MEMORY[0x263EFFA40]);
  v4 = +[_KSUtilities userDefaultsSuiteName];
  v5 = (void *)[v3 initWithSuiteName:v4];

  objc_msgSend(v5, "setBool:forKey:", -[_KSTextReplacementLegacyStore shouldUpdateTheCache](self, "shouldUpdateTheCache"), @"KSLSShouldUpdateCache");
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self];

  if (self->_suspendedForAccountChange)
  {
    v7 = [(_KSTextReplacementLegacyStore *)self workQueue];
    dispatch_resume(v7);

    self->_suspendedForAccountChange = 0;
  }
  softLinkBRDaemonConnectionInvalidate();

  v8.receiver = self;
  v8.super_class = (Class)_KSTextReplacementLegacyStore;
  [(_KSTextReplacementLegacyStore *)&v8 dealloc];
}

- (_KSTextReplacementLegacyStore)initWithBaseURL:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_KSTextReplacementLegacyStore;
  v6 = [(_KSTextReplacementLegacyStore *)&v20 init];
  v7 = v6;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49___KSTextReplacementLegacyStore_initWithBaseURL___block_invoke;
    block[3] = &unk_2648906A8;
    objc_super v8 = v6;
    v19 = v8;
    if (initWithBaseURL__onceToken != -1) {
      dispatch_once(&initWithBaseURL__onceToken, block);
    }
    objc_storeStrong((id *)&v8->_workQueue, (id)initWithBaseURL__cdWorkQueueShared);
    objc_storeStrong((id *)&v8->_persistentStoreCoordinator, (id)initWithBaseURL__pscShared);
    objc_storeStrong((id *)&v8->_baseURL, a3);
    uint64_t v9 = [(id)objc_opt_class() cachedStorePath];
    cacheFilePath = v8->_cacheFilePath;
    v8->_cacheFilePath = (NSString *)v9;

    [(_KSTextReplacementLegacyStore *)v8 setMinimumUptimeDidExpire:1];
    v11 = [MEMORY[0x263EFF910] date];
    [(_KSTextReplacementLegacyStore *)v8 setPersistentStoreDidLoadTime:v11];

    id v12 = objc_alloc(MEMORY[0x263EFFA40]);
    v13 = +[_KSUtilities userDefaultsSuiteName];
    v14 = (void *)[v12 initWithSuiteName:v13];

    v8->_shouldUpdateTheCache = [v14 BOOLForKey:@"KSLSShouldUpdateCache"];
    v8->_shouldDisableCaching = [v14 BOOLForKey:@"KSShouldDisableCaching"];
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v8 selector:sel_cleanup name:@"_KSTRShouldCleanupResources" object:0];

    if (!v8->_shouldDisableCaching)
    {
      v16 = [MEMORY[0x263F08A00] defaultCenter];
      [v16 addObserver:v8 selector:sel_iCloudAccountDidChange_ name:*MEMORY[0x263F085F0] object:0];
    }
  }

  return v7;
}

- (_KSTextReplacementLegacyStore)init
{
  id v3 = [(id)objc_opt_class() basePersistentStoreURL];
  v4 = [(_KSTextReplacementLegacyStore *)self initWithBaseURL:v3];

  return v4;
}

- (double)minimumUptimeRemaining
{
  id v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v4 = [(_KSTextReplacementLegacyStore *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55___KSTextReplacementLegacyStore_minimumUptimeRemaining__block_invoke;
  v7[3] = &unk_264891308;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)cleanup
{
  id v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40___KSTextReplacementLegacyStore_cleanup__block_invoke;
  block[3] = &unk_2648906A8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (NSManagedObjectContext)managedObjectContext
{
  id v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  managedObjectContext = self->_managedObjectContext;
  if (!managedObjectContext)
  {
    double v5 = (NSManagedObjectContext *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
    v6 = self->_managedObjectContext;
    self->_managedObjectContext = v5;

    [(NSManagedObjectContext *)self->_managedObjectContext _setDelegate:self];
    v7 = self->_managedObjectContext;
    uint64_t v8 = [(_KSTextReplacementLegacyStore *)self persistentStoreCoordinator];
    [(NSManagedObjectContext *)v7 setPersistentStoreCoordinator:v8];

    [(NSManagedObjectContext *)self->_managedObjectContext setMergePolicy:*MEMORY[0x263EFF060]];
    managedObjectContext = self->_managedObjectContext;
  }
  uint64_t v9 = managedObjectContext;
  return v9;
}

- (void)loadPersistentStoreIfNecessary
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  v4 = "-[_KSTextReplacementLegacyStore loadPersistentStoreIfNecessary]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_22B2BC000, log, OS_LOG_TYPE_ERROR, "%s  couldn't load persistent store at url: %@, error: %@", (uint8_t *)&v3, 0x20u);
}

- (void)unloadPersistentStore
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = [(_KSTextReplacementLegacyStore *)self persistentStoreCoordinator];
  v4 = [(_KSTextReplacementLegacyStore *)self persistentStore];
  uint64_t v7 = 0;
  [v3 removePersistentStore:v4 error:&v7];
  uint64_t v5 = v7;

  [(_KSTextReplacementLegacyStore *)self setUbiquityStoreLoaded:0];
  if (v5)
  {
    uint64_t v6 = KSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = "-[_KSTextReplacementLegacyStore unloadPersistentStore]";
      _os_log_impl(&dword_22B2BC000, v6, OS_LOG_TYPE_INFO, "%s  ERROR: failed to unload PSC store", buf, 0xCu);
    }
  }
}

- (void)requestMinimumUptime
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = KSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[_KSTextReplacementLegacyStore requestMinimumUptime]";
    _os_log_impl(&dword_22B2BC000, v3, OS_LOG_TYPE_INFO, "%s  persistentstore loaded, requesting minimum uptime", buf, 0xCu);
  }

  v4 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v4);

  if ([(_KSTextReplacementLegacyStore *)self minimumUptimeDidExpire])
  {
    uint64_t v5 = (OS_os_transaction *)os_transaction_create();
    uptimeTransaction = self->_uptimeTransaction;
    self->_uptimeTransaction = v5;

    [(_KSTextReplacementLegacyStore *)self setMinimumUptimeDidExpire:0];
    uint64_t v7 = [MEMORY[0x263EFF910] date];
    [(_KSTextReplacementLegacyStore *)self setPersistentStoreDidLoadTime:v7];

    dispatch_time_t v8 = dispatch_time(0, 180000000000);
    uint64_t v9 = [(_KSTextReplacementLegacyStore *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53___KSTextReplacementLegacyStore_requestMinimumUptime__block_invoke;
    block[3] = &unk_2648906A8;
    void block[4] = self;
    dispatch_after(v8, v9, block);
  }
}

- (void)endMinimumUptime
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if (![(_KSTextReplacementLegacyStore *)self minimumUptimeDidExpire])
  {
    uptimeTransaction = self->_uptimeTransaction;
    self->_uptimeTransaction = 0;

    [(_KSTextReplacementLegacyStore *)self setMinimumUptimeDidExpire:1];
    uint64_t v5 = KSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[_KSTextReplacementLegacyStore endMinimumUptime]";
      _os_log_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_INFO, "%s  Ending minimum uptime", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (NSPersistentStore)persistentStore
{
  v2 = [(_KSTextReplacementLegacyStore *)self persistentStoreCoordinator];
  int v3 = [v2 persistentStores];
  v4 = [v3 firstObject];

  return (NSPersistentStore *)v4;
}

- (void)importSampleShortcutsIfNecessary
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  v4 = KSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[_KSTextReplacementLegacyStore importSampleShortcutsIfNecessary]";
    _os_log_impl(&dword_22B2BC000, v4, OS_LOG_TYPE_INFO, "%s  importing sample shortcut", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  if (![(_KSTextReplacementLegacyStore *)self pendingSampleShortcutImport])
  {
    id v5 = objc_alloc(MEMORY[0x263EFFA40]);
    int v6 = +[_KSUtilities userDefaultsSuiteName];
    uint64_t v7 = (void *)[v5 initWithSuiteName:v6];

    uint64_t v8 = [v7 stringForKey:@"kDidInsertSampleShortcutForPeer"];
    uint64_t v9 = [(_KSTextReplacementLegacyStore *)self currentStoreIndentity];
    if ([v8 isEqualToString:v9])
    {
      uint64_t v10 = KSCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[_KSTextReplacementLegacyStore importSampleShortcutsIfNecessary]";
        _os_log_impl(&dword_22B2BC000, v10, OS_LOG_TYPE_INFO, "%s  already imported sample shortcut", buf, 0xCu);
      }
    }
    else
    {
      [(_KSTextReplacementLegacyStore *)self setPendingSampleShortcutImport:1];
      uint64_t v10 = +[_KSTextReplacementHelper sampleShortcut];
      v17 = v10;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __65___KSTextReplacementLegacyStore_importSampleShortcutsIfNecessary__block_invoke;
      v12[3] = &unk_264891738;
      objc_copyWeak(&v15, &location);
      id v13 = v7;
      id v14 = v9;
      [(_KSTextReplacementLegacyStore *)self addEntries:v11 removeEntries:0 withCompletionHandler:v12];

      objc_destroyWeak(&v15);
    }
  }
  objc_destroyWeak(&location);
}

- (void)prepareForMigration
{
  int v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_not_V2(v3);

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = [(_KSTextReplacementLegacyStore *)self workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52___KSTextReplacementLegacyStore_prepareForMigration__block_invoke;
  v8[3] = &unk_264891550;
  v8[4] = self;
  dispatch_semaphore_t v9 = v4;
  int v6 = v4;
  dispatch_async(v5, v8);

  dispatch_time_t v7 = dispatch_time(0, 180000000000);
  dispatch_semaphore_wait(v6, v7);
}

- (void)runMaintenanceIncludeLocalVariations:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = KSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    dispatch_semaphore_t v9 = "-[_KSTextReplacementLegacyStore runMaintenanceIncludeLocalVariations:]";
    _os_log_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_INFO, "%s  LS: running maintenance", (uint8_t *)&v8, 0xCu);
  }

  int v6 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v6);

  dispatch_time_t v7 = (void *)MEMORY[0x230F44DF0]();
  [(_KSTextReplacementLegacyStore *)self performMaintenanceIfNecessary];
  [(_KSTextReplacementLegacyStore *)self mergeEntriesFromAllStoresIncludeLocalVariations:v3];
  [(_KSTextReplacementLegacyStore *)self mergeEntriesForUbiquityIdentityChangeIfNecessary];
}

- (void)addEntries:(id)a3 removeEntries:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = [(_KSTextReplacementLegacyStore *)self workQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __80___KSTextReplacementLegacyStore_addEntries_removeEntries_withCompletionHandler___block_invoke;
  v15[3] = &unk_264891760;
  objc_copyWeak(&v20, &location);
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)requestSyncWithCompletionBlock:(id)a3
{
}

- (void)requestSync:(unint64_t)a3 withCompletionBlock:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = [(_KSTextReplacementLegacyStore *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65___KSTextReplacementLegacyStore_requestSync_withCompletionBlock___block_invoke;
  block[3] = &unk_264890AE8;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)removeAllEntries
{
  BOOL v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49___KSTextReplacementLegacyStore_removeAllEntries__block_invoke;
  block[3] = &unk_2648906A8;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)removeEntriesWithPredicate:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  id v23 = 0;
  id v5 = (void *)MEMORY[0x230F44DF0]();
  id v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:1 selector:sel_compare_];
  v24[0] = v6;
  dispatch_time_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];

  id v8 = [(_KSTextReplacementLegacyStore *)self entriesMatchingPredicate:v4 sortDescriptors:v7];
  id v9 = [(_KSTextReplacementLegacyStore *)self managedObjectContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60___KSTextReplacementLegacyStore_removeEntriesWithPredicate___block_invoke;
  v14[3] = &unk_2648906D0;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v17 = &v18;
  [v11 performBlockAndWait:v14];

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

- (id)_deleteTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueToDelete];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263F08A98];
    dispatch_time_t v7 = [v4 valueToDelete];
    id v8 = [v7 phrase];
    id v9 = [v4 valueToDelete];
    id v10 = [v9 shortcut];
    id v11 = [v6 predicateWithFormat:@"phrase == %@ AND shortcut == %@", v8, v10];

    id v12 = [(_KSTextReplacementLegacyStore *)self removeEntriesWithPredicate:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)textReplacementEntries
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__4;
  id v11 = __Block_byref_object_dispose__4;
  id v12 = 0;
  BOOL v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55___KSTextReplacementLegacyStore_textReplacementEntries__block_invoke;
  v6[3] = &unk_264891308;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)objc_opt_class() textReplacementEntriesFromManagedObjects:v8[5]];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)textReplacementEntriesFromManagedObjects:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "phrase", (void)v20);
        id v11 = (_KSTextReplacementEntry *)objc_claimAutoreleasedReturnValue();
        if ([(_KSTextReplacementEntry *)v11 length])
        {
          id v12 = [v10 shortcut];
          uint64_t v13 = [v12 length];

          if (!v13) {
            continue;
          }
          id v11 = objc_alloc_init(_KSTextReplacementEntry);
          id v14 = [v10 phrase];
          [(_KSTextReplacementEntry *)v11 setPhrase:v14];

          id v15 = [v10 shortcut];
          [(_KSTextReplacementEntry *)v11 setShortcut:v15];

          id v16 = (void *)MEMORY[0x263EFF910];
          id v17 = [v10 timestamp];
          uint64_t v18 = objc_msgSend(v16, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v17, "integerValue"));
          [(_KSTextReplacementEntry *)v11 setTimestamp:v18];

          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)queryTextReplacementsWithCallback:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"TRUEPREDICATE"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67___KSTextReplacementLegacyStore_queryTextReplacementsWithCallback___block_invoke;
  v7[3] = &unk_2648913F0;
  id v8 = v4;
  id v6 = v4;
  [(_KSTextReplacementLegacyStore *)self queryTextReplacementsWithPredicate:v5 callback:v7];
}

- (void)queryTextReplacementsWithPredicate:(id)a3 callback:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:1 selector:sel_compare_];
  v18[0] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];

  id v10 = [(_KSTextReplacementLegacyStore *)self workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __77___KSTextReplacementLegacyStore_queryTextReplacementsWithPredicate_callback___block_invoke;
  v14[3] = &unk_2648910E0;
  void v14[4] = self;
  id v15 = v6;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  id v13 = v6;
  dispatch_async(v10, v14);
}

- (id)entriesFromCache:(id *)a3
{
  id v4 = (void *)MEMORY[0x263EFF8F8];
  id v5 = [(_KSTextReplacementLegacyStore *)self cacheFilePath];
  id v6 = [v4 dataWithContentsOfFile:v5];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F08928];
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    id v11 = [v7 unarchivedObjectOfClasses:v10 fromData:v6 error:a3];
  }
  else
  {
    +[_KSTextReplacementHelper errorWithCode:13 description:@"Couldn't decode cache"];
    id v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)scheduleCacheUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (![(_KSTextReplacementLegacyStore *)self didScheduleCacheUpdate])
  {
    id v6 = KSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[_KSTextReplacementLegacyStore scheduleCacheUpdate:]";
      _os_log_impl(&dword_22B2BC000, v6, OS_LOG_TYPE_INFO, "%s  Scheduling cache update", buf, 0xCu);
    }

    dispatch_time_t v7 = dispatch_time(0, 500000000);
    id v8 = [(_KSTextReplacementLegacyStore *)self workQueue];
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __53___KSTextReplacementLegacyStore_scheduleCacheUpdate___block_invoke;
    id v12 = &unk_264891550;
    id v13 = self;
    id v14 = v4;
    dispatch_after(v7, v8, &v9);

    -[_KSTextReplacementLegacyStore setDidScheduleCacheUpdate:](self, "setDidScheduleCacheUpdate:", 1, v9, v10, v11, v12, v13);
  }
}

- (BOOL)writeEntriesToCache:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v14 = 0;
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v14];
  id v5 = v14;
  if (v5)
  {
    id v6 = v5;
    dispatch_time_t v7 = KSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v6 description];
      *(_DWORD *)buf = 136315394;
      id v16 = "-[_KSTextReplacementLegacyStore writeEntriesToCache:]";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      uint64_t v9 = "%s  ERROR: Couldn't create data from TR entries: %@";
LABEL_7:
      _os_log_impl(&dword_22B2BC000, v7, OS_LOG_TYPE_INFO, v9, buf, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v10 = [(_KSTextReplacementLegacyStore *)self cacheFilePath];
  id v13 = 0;
  BOOL v11 = 1;
  [v4 writeToFile:v10 options:1 error:&v13];
  id v6 = v13;

  if (v6)
  {
    dispatch_time_t v7 = KSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v6 description];
      *(_DWORD *)buf = 136315394;
      id v16 = "-[_KSTextReplacementLegacyStore writeEntriesToCache:]";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      uint64_t v9 = "%s  could not save TR cache: %@";
      goto LABEL_7;
    }
LABEL_8:

    BOOL v11 = 0;
  }

  return v11;
}

- (void)iCloudAccountDidChange:(id)a3
{
  id v4 = [(_KSTextReplacementLegacyStore *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56___KSTextReplacementLegacyStore_iCloudAccountDidChange___block_invoke;
  block[3] = &unk_2648906A8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (id)entityDescription
{
  v2 = [(_KSTextReplacementLegacyStore *)self persistentStoreCoordinator];
  id v3 = [v2 managedObjectModel];
  id v4 = [v3 entities];
  id v5 = [v4 lastObject];

  return v5;
}

- (void)insertEntryWithValue:(id)a3
{
  id v4 = a3;
  id v5 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(_KSTextReplacementLegacyStore *)self managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54___KSTextReplacementLegacyStore_insertEntryWithValue___block_invoke;
  v9[3] = &unk_264891550;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [v8 performBlockAndWait:v9];
}

- (BOOL)save
{
  id v3 = [(_KSTextReplacementLegacyStore *)self persistentStore];

  if (v3)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 1;
    id v4 = [(_KSTextReplacementLegacyStore *)self managedObjectContext];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37___KSTextReplacementLegacyStore_save__block_invoke;
    v7[3] = &unk_264891488;
    id v5 = v4;
    id v8 = v5;
    uint64_t v9 = &v10;
    [v5 performBlockAndWait:v7];
    LOBYTE(v3) = *((unsigned char *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
  }
  return (char)v3;
}

- (id)entriesMatchingPredicate:(id)a3 sortDescriptors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v8);

  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  id v25 = 0;
  uint64_t v9 = [(_KSTextReplacementLegacyStore *)self managedObjectContext];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74___KSTextReplacementLegacyStore_entriesMatchingPredicate_sortDescriptors___block_invoke;
  v15[3] = &unk_264891788;
  void v15[4] = self;
  id v10 = v6;
  id v16 = v10;
  id v11 = v7;
  id v17 = v11;
  uint64_t v19 = &v20;
  id v12 = v9;
  id v18 = v12;
  [v12 performWithOptions:4 andBlock:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)entriesMatchingPredicate:(id)a3
{
  return [(_KSTextReplacementLegacyStore *)self entriesMatchingPredicate:a3 sortDescriptors:0];
}

- (id)entriesUsingSortDescriptors:(id)a3
{
  return [(_KSTextReplacementLegacyStore *)self entriesMatchingPredicate:0 sortDescriptors:a3];
}

- (void)persistentStoreDidImportUbiquitousContentChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(_KSTextReplacementLegacyStore *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82___KSTextReplacementLegacyStore_persistentStoreDidImportUbiquitousContentChanges___block_invoke;
  v7[3] = &unk_264891550;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)mergeShortcutsFromContext:(id)a3
{
  v62[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230F44DF0]();
  objc_initWeak(&location, self);
  NSLog(&cfstr_MergingShortcu.isa);
  id v7 = [v4 persistentStoreCoordinator];
  id v8 = [v7 managedObjectModel];
  uint64_t v9 = [v8 entities];
  id v10 = [v9 lastObject];

  id v11 = (void *)MEMORY[0x263EFF260];
  id v12 = [v10 name];
  id v13 = [v11 fetchRequestWithEntityName:v12];

  id v14 = [v10 propertiesByName];
  id v15 = [v14 objectForKey:@"shortcut"];

  id v16 = [v10 propertiesByName];
  id v17 = [v16 objectForKey:@"phrase"];

  v62[0] = v15;
  v62[1] = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];
  [v13 setPropertiesToFetch:v18];

  v61[0] = v15;
  v61[1] = v17;
  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
  [v13 setPropertiesToGroupBy:v19];

  [v13 setResultType:2];
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__4;
  v58 = __Block_byref_object_dispose__4;
  id v59 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__4;
  v52[4] = __Block_byref_object_dispose__4;
  id v53 = 0;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke;
  v47[3] = &unk_2648917B0;
  v50 = v52;
  id v20 = v4;
  id v48 = v20;
  id v21 = v13;
  id v49 = v21;
  v51 = &v54;
  [v20 performBlockAndWait:v47];
  if (v55[5])
  {
    NSLog(&cfstr_ErrorFetchingS.isa);
    id v22 = (id)v55[5];
  }
  else
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    long long v23 = [(_KSTextReplacementLegacyStore *)self managedObjectContext];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_2;
    v37[3] = &unk_264891800;
    v40 = v52;
    id v24 = v23;
    id v38 = v24;
    objc_copyWeak(&v42, &location);
    id v39 = v20;
    v41 = &v43;
    [v39 performBlockAndWait:v37];
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    char v36 = 0;
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __59___KSTextReplacementLegacyStore_mergeShortcutsFromContext___block_invoke_4;
    v30 = &unk_264891828;
    v32 = v35;
    v33 = &v43;
    id v25 = v24;
    id v31 = v25;
    v34 = &v54;
    [v25 performBlockAndWait:&v27];
    NSLog(&cfstr_CompletedMerge.isa, v44[3], v27, v28, v29, v30);
    id v22 = (id)v55[5];

    _Block_object_dispose(v35, 8);
    objc_destroyWeak(&v42);

    _Block_object_dispose(&v43, 8);
  }

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(&v54, 8);

  objc_destroyWeak(&location);

  return v22;
}

- (BOOL)_shouldMergeShortcut:(id)a3 phrase:(id)a4 intoContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x263EFF260];
  id v11 = a5;
  id v12 = [(_KSTextReplacementLegacyStore *)self entityDescription];
  id v13 = [v12 name];
  id v14 = [v10 fetchRequestWithEntityName:v13];

  id v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"shortcut == %@ && phrase == %@", v8, v9];
  [v14 setPredicate:v15];
  [v14 setFetchLimit:1];
  [v14 setResultType:1];
  id v22 = 0;
  id v16 = [v11 executeFetchRequest:v14 error:&v22];

  id v17 = v22;
  id v18 = v17;
  if (v17) {
    NSLog(&cfstr_ErrorWhileFetc.isa, v17);
  }
  BOOL v19 = [v16 count] == 0;
  id v20 = [NSNumber numberWithBool:v19];
  NSLog(&cfstr_ShouldMergeSho.isa, v8, v9, v20);

  LOBYTE(v20) = [v16 count] == 0;
  return (char)v20;
}

- (BOOL)_mergeShortcut:(id)a3 phrase:(id)a4 fromContext:(id)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  NSLog(&cfstr_MergeShortcut.isa, v8, v9);
  context = (void *)MEMORY[0x230F44DF0]();
  id v11 = [v10 persistentStoreCoordinator];
  id v12 = [v11 managedObjectModel];
  id v13 = [v12 entities];
  id v14 = [v13 lastObject];

  id v15 = (void *)MEMORY[0x263EFF260];
  v35 = v14;
  id v16 = [v14 name];
  id v17 = [v15 fetchRequestWithEntityName:v16];

  v37 = v9;
  id v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"shortcut == %@ && phrase == %@", v8, v9];
  BOOL v19 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:0 selector:sel_compare_];
  v39[0] = v19;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];

  [v17 setPredicate:v18];
  [v17 setSortDescriptors:v20];
  [v17 setFetchLimit:1];
  id v38 = 0;
  id v21 = [v10 executeFetchRequest:v17 error:&v38];
  id v22 = v38;
  long long v23 = v22;
  if (v22)
  {
    NSLog(&cfstr_ErrorFetchingS_0.isa, v22);
    BOOL v24 = 0;
  }
  else
  {
    id v25 = self;
    v26 = [v21 firstObject];
    BOOL v24 = v26 != 0;
    if (v26)
    {
      id v32 = objc_alloc(MEMORY[0x263EFF280]);
      [(_KSTextReplacementLegacyStore *)v25 entityDescription];
      uint64_t v27 = v34 = v8;
      uint64_t v28 = [(_KSTextReplacementLegacyStore *)v25 managedObjectContext];
      uint64_t v29 = [v32 initWithEntity:v27 insertIntoManagedObjectContext:v28];
      id v33 = v10;
      v30 = (void *)v29;

      id v8 = v34;
      [v30 _copyAttributeValuesFromObject:v26];

      id v10 = v33;
    }
  }
  if (!v24) {
    NSLog(&cfstr_UnableToMigrat.isa);
  }

  return v24;
}

- (BOOL)migrateEntriesFromStoreAtURL:(id)a3 error:(id *)a4
{
  v28[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(_KSTextReplacementLegacyStore *)self persistentStore];
  id v9 = [v8 URL];
  char v10 = [v6 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    NSLog(&cfstr_AttemptingShor.isa, v6);
    id v12 = objc_alloc(MEMORY[0x263EFF298]);
    id v13 = [(_KSTextReplacementLegacyStore *)self managedObjectModelURL];
    id v14 = (void *)[v12 initWithContentsOfURL:v13];

    id v15 = (void *)[objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:v14];
    uint64_t v16 = *MEMORY[0x263EFF168];
    uint64_t v17 = *MEMORY[0x263EFF138];
    uint64_t v27 = *MEMORY[0x263EFF138];
    v28[0] = MEMORY[0x263EFFA88];
    id v18 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    BOOL v19 = [v15 addPersistentStoreWithType:v16 configuration:0 URL:v6 options:v18 error:a4];

    id v20 = *a4;
    if (v19)
    {
      if ([v20 code] != 257) {
        goto LABEL_8;
      }
    }
    else
    {
      id v21 = [v20 localizedDescription];
      NSLog(&cfstr_CouldNotOpenSt.isa, v6, v21);

      if ([*a4 code] != 257)
      {
        LOBYTE(v11) = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    NSLog(&cfstr_LooksLikeWeTri.isa, v6);
    NSLog(&cfstr_TryingAgainWit.isa);
    uint64_t v25 = v17;
    uint64_t v26 = MEMORY[0x263EFFA80];
    id v22 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v11 = [v15 addPersistentStoreWithType:v16 configuration:0 URL:v6 options:v22 error:a4];

    if (!v11)
    {
      long long v23 = [*a4 localizedDescription];
      NSLog(&cfstr_StillCouldNotO.isa, v6, v23);
      goto LABEL_11;
    }
LABEL_8:
    LOBYTE(v11) = 1;
    long long v23 = (void *)[objc_alloc(MEMORY[0x263EFF288]) initWithConcurrencyType:1];
    [v23 setPersistentStoreCoordinator:v15];
    *a4 = [(_KSTextReplacementLegacyStore *)self mergeShortcutsFromContext:v23];
    NSLog(&cfstr_ShortcutMerge.isa, @"success", v6);
LABEL_11:

    goto LABEL_12;
  }
  LOBYTE(v11) = 0;
LABEL_13:

  return (char)v11;
}

- (void)retirePersistentStoreAtURL:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_KSTextReplacementLegacyStore *)self persistentStore];
  id v6 = [v5 URL];
  char v7 = [v4 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = KSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[_KSTextReplacementLegacyStore retirePersistentStoreAtURL:]";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_22B2BC000, v8, OS_LOG_TYPE_INFO, "%s  Retiring store at %@", buf, 0x16u);
    }

    id v9 = objc_alloc(MEMORY[0x263EFF298]);
    char v10 = [(_KSTextReplacementLegacyStore *)self managedObjectModelURL];
    id v11 = (void *)[v9 initWithContentsOfURL:v10];

    id v12 = (void *)[objc_alloc(MEMORY[0x263EFF320]) initWithManagedObjectModel:v11];
    uint64_t v25 = *MEMORY[0x263F080A8];
    v26[0] = *MEMORY[0x263F08098];
    id v13 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v14 = *MEMORY[0x263EFF168];
    id v18 = 0;
    char v15 = [v12 destroyPersistentStoreAtURL:v4 withType:v14 options:v13 error:&v18];
    id v16 = v18;
    if ((v15 & 1) == 0)
    {
      uint64_t v17 = KSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        id v20 = "-[_KSTextReplacementLegacyStore retirePersistentStoreAtURL:]";
        __int16 v21 = 2112;
        id v22 = v4;
        __int16 v23 = 2112;
        id v24 = v16;
        _os_log_impl(&dword_22B2BC000, v17, OS_LOG_TYPE_INFO, "%s  Could not retire store at %@: %@", buf, 0x20u);
      }
    }
  }
}

- (id)storeURLForMergeAfterUbiquityIdentityChangeFromToken:(id)a3 toToken:(id)a4 withLastKnownToken:(id)a5 shouldDeleteFirst:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v10 || !v11)
  {
    uint64_t v14 = 0;
    if (v10 && !v11)
    {
      if (a6) {
        *a6 = 1;
      }
      NSLog(&cfstr_UbiquityContai_1.isa);
      goto LABEL_11;
    }
  }
  else
  {
    if (!v12 || ([v11 isEqual:v12] & 1) != 0)
    {
      NSLog(&cfstr_UbiquityContai.isa);
LABEL_11:
      char v15 = (void *)MEMORY[0x263EFF320];
      id v16 = [(_KSTextReplacementLegacyStore *)self baseURL];
      uint64_t v14 = [v15 ubiquityStoreURLForStoreURL:v16 ubiquityIdentityToken:v10 ubiquityName:@"UserDictionary"];

      goto LABEL_12;
    }
    NSLog(&cfstr_UbiquityContai_0.isa);
    uint64_t v14 = 0;
  }
LABEL_12:

  return v14;
}

- (BOOL)mergeEntriesForUbiquityIdentityChangeFromURL:(id)a3 firstDelete:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v4) {
    [(_KSTextReplacementLegacyStore *)self removeAllEntries];
  }
  char v7 = [MEMORY[0x263F08850] defaultManager];
  id v8 = [v6 path];
  char v9 = [v7 fileExistsAtPath:v8];

  if ((v9 & 1) == 0)
  {
    id v13 = KSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[_KSTextReplacementLegacyStore mergeEntriesForUbiquityIdentityChangeFromURL:firstDelete:]";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl(&dword_22B2BC000, v13, OS_LOG_TYPE_INFO, "%s  file to merge does not exist: %@", buf, 0x16u);
    }

    id v11 = 0;
    goto LABEL_9;
  }
  id v19 = 0;
  BOOL v10 = [(_KSTextReplacementLegacyStore *)self migrateEntriesFromStoreAtURL:v6 error:&v19];
  id v11 = v19;
  if (!v10)
  {
LABEL_9:
    NSLog(&cfstr_FailedMergeAft.isa);
    uint64_t v14 = [(_KSTextReplacementLegacyStore *)self managedObjectContext];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __90___KSTextReplacementLegacyStore_mergeEntriesForUbiquityIdentityChangeFromURL_firstDelete___block_invoke;
    v17[3] = &unk_2648906A8;
    id v18 = v14;
    id v15 = v14;
    [v15 performBlockAndWait:v17];

    BOOL v12 = 0;
    goto LABEL_10;
  }
  NSLog(&cfstr_MergeSuccessfu.isa);
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

- (id)currentStoreIndentity
{
  v2 = [(_KSTextReplacementLegacyStore *)self persistentStore];
  id v3 = [v2 URL];

  BOOL v4 = [v3 pathComponents];
  uint64_t v5 = [v4 indexOfObject:@"CoreDataUbiquitySupport"];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || [v4 count] <= (unint64_t)(v5 + 1))
  {
    char v9 = 0;
  }
  else
  {
    id v6 = objc_msgSend(v4, "objectAtIndex:");
    uint64_t v7 = [v4 indexOfObject:@"UserDictionary"];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || [v4 count] <= (unint64_t)(v7 + 1))
    {
      id v8 = &stru_26DE8B7B0;
    }
    else
    {
      objc_msgSend(v4, "objectAtIndex:");
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    char v9 = [NSString stringWithFormat:@"%@-%@", v6, v8];
  }
  return v9;
}

- (BOOL)mergeEntriesFromAllStoresIncludeLocalVariations:(BOOL)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(_KSTextReplacementLegacyStore *)self persistentStore];
  uint64_t v7 = [v6 URL];

  id v8 = [v7 pathComponents];
  uint64_t v9 = [v8 indexOfObject:@"CoreDataUbiquitySupport"];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v10 = v9, v11 = v9 + 1, [v8 count] <= (unint64_t)(v9 + 1)))
  {
    BOOL v17 = 1;
    goto LABEL_37;
  }
  BOOL v12 = objc_msgSend(v8, "subarrayWithRange:", 0, v10);
  id v13 = [v8 objectAtIndex:v11];
  uint64_t v14 = (void *)CFPreferencesCopyAppValue(@"UserDictionaryLocalPeerIdentityCurrent", @"com.apple.Preferences");
  int v15 = [v13 isEqualToString:v14];
  if (!a3 && v15)
  {
    char v16 = 1;
    goto LABEL_36;
  }
  char v41 = v15;
  char v36 = v14;
  v37 = v13;
  id v38 = v12;
  id v39 = v8;
  id v18 = [NSString pathWithComponents:v12];
  id v19 = +[_KSUtilities findAllDbsInDirectory:v18];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (!v21)
  {
    char v16 = 1;
    goto LABEL_30;
  }
  uint64_t v22 = v21;
  uint64_t v23 = *(void *)v44;
  v40 = (void *)*MEMORY[0x263EFF150];
  char v16 = 1;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v44 != v23) {
        objc_enumerationMutation(v20);
      }
      uint64_t v25 = *(void *)(*((void *)&v43 + 1) + 8 * i);
      uint64_t v26 = [v7 path];
      char v27 = [v26 isEqualToString:v25];

      if ((v27 & 1) == 0)
      {
        uint64_t v28 = [NSURL fileURLWithPath:v25];
        id v42 = 0;
        BOOL v29 = [(_KSTextReplacementLegacyStore *)self migrateEntriesFromStoreAtURL:v28 error:&v42];
        id v30 = v42;

        id v31 = KSCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          id v48 = "-[_KSTextReplacementLegacyStore mergeEntriesFromAllStoresIncludeLocalVariations:]";
          __int16 v49 = 2112;
          uint64_t v50 = v25;
          __int16 v51 = 2112;
          id v52 = v30;
          _os_log_impl(&dword_22B2BC000, v31, OS_LOG_TYPE_INFO, "%s  merged entries from db: %@, error: %@", buf, 0x20u);
        }

        if (v29 || [v30 code] == 134080)
        {
LABEL_19:
          if ((v41 & 1) == 0)
          {
            id v32 = [NSURL fileURLWithPath:v25];
            [(_KSTextReplacementLegacyStore *)self retirePersistentStoreAtURL:v32];
            goto LABEL_21;
          }
        }
        else
        {
          id v32 = [v30 domain];
          if (v32 == v40)
          {

            goto LABEL_19;
          }
LABEL_21:
        }
        if (v30) {
          char v16 = 0;
        }
        else {
          char v16 = v29;
        }

        continue;
      }
    }
    uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v53 count:16];
  }
  while (v22);
LABEL_30:

  id v13 = v37;
  if ((v41 & 1) == 0)
  {
    if (v16) {
      id v33 = v37;
    }
    else {
      id v33 = 0;
    }
    [(_KSTextReplacementLegacyStore *)self didMergeEntriesForOtherLocalPeers:v33];
  }
  id v34 = [MEMORY[0x263F08A00] defaultCenter];
  [v34 postNotificationName:@"_KSTRLegacyStoreDidImportChangesNotification" object:0];

  BOOL v12 = v38;
  id v8 = v39;
  uint64_t v14 = v36;
LABEL_36:

  BOOL v17 = v16 & 1;
LABEL_37:

  return v17;
}

- (void)didMergeEntriesForOtherLocalPeers:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_SavingObserved.isa, @"com.apple.Preferences");
  CFPreferencesSetAppValue(@"UserDictionaryLocalPeerIdentityCurrent", v3, @"com.apple.Preferences");

  CFPreferencesAppSynchronize(@"com.apple.Preferences");
}

- (BOOL)mergeEntriesForUbiquityIdentityChangeIfNecessary
{
  id v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)CFPreferencesCopyAppValue(@"UserDictionaryUbiquityIdentityTokenLastKnown", @"com.apple.Preferences");
  uint64_t v5 = (void *)CFPreferencesCopyAppValue(@"UserDictionaryUbiquityIdentityTokenCurrent", @"com.apple.Preferences");
  id v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = [v6 ubiquityIdentityToken];

  unsigned __int8 v11 = 0;
  id v8 = [(_KSTextReplacementLegacyStore *)self storeURLForMergeAfterUbiquityIdentityChangeFromToken:v5 toToken:v7 withLastKnownToken:v4 shouldDeleteFirst:&v11];
  if (v8)
  {
    BOOL v9 = [(_KSTextReplacementLegacyStore *)self mergeEntriesForUbiquityIdentityChangeFromURL:v8 firstDelete:v11];
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  if (v7 != v5 && ([v7 isEqual:v5] & 1) == 0) {
    [(_KSTextReplacementLegacyStore *)self didMergeEntriesForNewUbiquityIdentity:v7];
  }
LABEL_8:

  return v9;
}

- (void)didMergeEntriesForNewUbiquityIdentity:(id)a3
{
  id value = a3;
  NSLog(&cfstr_SavingObserved_0.isa, @"com.apple.Preferences");
  CFPreferencesSetAppValue(@"UserDictionaryUbiquityIdentityTokenCurrent", value, @"com.apple.Preferences");
  if (value) {
    CFPreferencesSetAppValue(@"UserDictionaryUbiquityIdentityTokenLastKnown", value, @"com.apple.Preferences");
  }
  CFPreferencesAppSynchronize(@"com.apple.Preferences");
}

- (void)performMaintenanceIfNecessary
{
  id v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(_KSTextReplacementLegacyStore *)self save];
  if ([(_KSTextReplacementLegacyStore *)self needsMaintenance])
  {
    BOOL v4 = [(_KSTextReplacementLegacyStore *)self managedObjectContext];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __62___KSTextReplacementLegacyStore_performMaintenanceIfNecessary__block_invoke;
    v10[3] = &unk_2648906A8;
    id v5 = v4;
    id v11 = v5;
    [v5 performBlockAndWait:v10];
    id v6 = [(_KSTextReplacementLegacyStore *)self managedObjectContext];
    [(_KSTextReplacementLegacyStore *)self detectAndCleanDuplicatesWithContext:v6];

    [(_KSTextReplacementLegacyStore *)self didMaintenance];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62___KSTextReplacementLegacyStore_performMaintenanceIfNecessary__block_invoke_2;
    v8[3] = &unk_2648906A8;
    id v9 = v5;
    id v7 = v5;
    [v7 performBlockAndWait:v8];
  }
}

- (BOOL)needsMaintenance
{
  id v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(_KSTextReplacementLegacyStore *)self loadMaintenancePreferencesIfNecessary];
  if ([(_KSTextReplacementLegacyStore *)self forceMaintenance]) {
    return 1;
  }
  uint64_t v4 = [(_KSTextReplacementLegacyStore *)self lastMaintenanceDate];
  if (!v4) {
    return 1;
  }
  id v5 = (void *)v4;
  id v6 = [(_KSTextReplacementLegacyStore *)self lastMaintenanceDate];
  [v6 timeIntervalSinceNow];
  double v8 = v7;

  if (v8 < 0.0) {
    double v8 = -v8;
  }

  return v8 > 1209600.0
      || [(_KSTextReplacementLegacyStore *)self importedSinceMaintenance] > 20;
}

- (void)loadMaintenancePreferencesIfNecessary
{
  id v3 = [(_KSTextReplacementLegacyStore *)self lastMaintenanceDate];

  if (!v3)
  {
    id v6 = (id)CFPreferencesCopyAppValue(@"UserDictionaryLastMaintenanceDate", @"com.apple.Preferences");
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(_KSTextReplacementLegacyStore *)self setLastMaintenanceDate:v6];
      }
    }
    uint64_t v4 = [(_KSTextReplacementLegacyStore *)self lastMaintenanceDate];

    if (!v4)
    {
      id v5 = [MEMORY[0x263EFF910] distantPast];
      [(_KSTextReplacementLegacyStore *)self setLastMaintenanceDate:v5];
    }
    [(_KSTextReplacementLegacyStore *)self setImportedSinceMaintenance:CFPreferencesGetAppIntegerValue(@"UserDictionaryImportedSinceMaintenance", @"com.apple.Preferences", 0)];
  }
}

- (void)didMaintenance
{
  id v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  [(_KSTextReplacementLegacyStore *)self setForceMaintenance:0];
  id value = objc_alloc_init(MEMORY[0x263EFF910]);
  [(_KSTextReplacementLegacyStore *)self setLastMaintenanceDate:value];
  CFPreferencesSetAppValue(@"UserDictionaryLastMaintenanceDate", value, @"com.apple.Preferences");
  [(_KSTextReplacementLegacyStore *)self setImportedSinceMaintenance:0];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[_KSTextReplacementLegacyStore importedSinceMaintenance](self, "importedSinceMaintenance"));
  CFPreferencesSetAppValue(@"UserDictionaryImportedSinceMaintenance", v4, @"com.apple.Preferences");

  CFPreferencesAppSynchronize(@"com.apple.Preferences");
}

- (BOOL)detectAndCleanDuplicatesWithContext:(id)a3
{
  v42[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v5);

  NSLog(&cfstr_DetectAndClean.isa);
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__4;
  v34[4] = __Block_byref_object_dispose__4;
  id v35 = 0;
  objc_initWeak(&location, self);
  id v6 = (void *)MEMORY[0x263EFF260];
  double v7 = [(_KSTextReplacementLegacyStore *)self entityDescription];
  double v8 = [v7 name];
  id v9 = [v6 fetchRequestWithEntityName:v8];

  [v9 setIncludesPendingChanges:0];
  uint64_t v10 = [MEMORY[0x263F087F0] expressionWithFormat:@"count:(shortcut)"];
  id v11 = objc_alloc_init(MEMORY[0x263EFF248]);
  [v11 setName:@"count"];
  [v11 setExpression:v10];
  [v11 setExpressionResultType:300];
  BOOL v12 = [(_KSTextReplacementLegacyStore *)self entityDescription];
  id v13 = [v12 propertiesByName];
  uint64_t v14 = [v13 objectForKey:@"shortcut"];

  int v15 = [(_KSTextReplacementLegacyStore *)self entityDescription];
  char v16 = [v15 propertiesByName];
  BOOL v17 = [v16 objectForKey:@"phrase"];

  v42[0] = v14;
  v42[1] = v17;
  v42[2] = v11;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:3];
  [v9 setPropertiesToFetch:v18];

  v41[0] = v14;
  v41[1] = v17;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:2];
  [v9 setPropertiesToGroupBy:v19];

  [v9 setResultType:2];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__4;
  v31[4] = __Block_byref_object_dispose__4;
  id v32 = 0;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __69___KSTextReplacementLegacyStore_detectAndCleanDuplicatesWithContext___block_invoke;
  v23[3] = &unk_264891850;
  uint64_t v26 = v31;
  id v20 = v4;
  id v24 = v20;
  id v21 = v9;
  id v25 = v21;
  char v27 = v34;
  uint64_t v28 = &v36;
  objc_copyWeak(&v30, &location);
  BOOL v29 = v40;
  [v20 performBlockAndWait:v23];
  LOBYTE(v9) = *((unsigned char *)v37 + 24) != 0;
  objc_destroyWeak(&v30);

  _Block_object_dispose(v31, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v40, 8);

  return (char)v9;
}

- (void)_deleteDuplicatesOfShortcut:(id)a3 phrase:(id)a4 count:(int64_t)a5 withContext:(id)a6
{
  v41[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = v10;
  id v13 = v11;
  id v14 = a6;
  uint64_t v38 = v13;
  NSLog(&cfstr_FoundDuplicate.isa, v12, v13, a5);
  uint64_t v15 = 0;
  unint64_t v16 = a5;
  BOOL v17 = self;
  uint64_t v36 = self;
  v37 = v12;
  do
  {
    id v18 = (void *)MEMORY[0x230F44DF0]();
    [v14 setMergePolicy:*MEMORY[0x263EFF060]];
    id v19 = (void *)MEMORY[0x263EFF260];
    id v20 = [(_KSTextReplacementLegacyStore *)v17 entityDescription];
    id v21 = [v20 name];
    uint64_t v22 = [v19 fetchRequestWithEntityName:v21];

    uint64_t v23 = [MEMORY[0x263F08A98] predicateWithFormat:@"shortcut == %@ && phrase == %@", v12, v38];
    id v24 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timestamp" ascending:0 selector:sel_compare_];
    v41[0] = v24;
    id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];

    [v22 setPredicate:v23];
    [v22 setSortDescriptors:v25];
    [v22 setFetchBatchSize:1000];
    [v22 setFetchLimit:10000];
    [v22 setResultType:1];
    id v40 = 0;
    uint64_t v26 = [v14 executeFetchRequest:v22 error:&v40];
    id v27 = v40;
    if (v27)
    {
      uint64_t v28 = v27;
      NSLog(&cfstr_ErrorWhileFetc_0.isa, v27);
    }
    else
    {
      if ((unint64_t)[v26 count] >= 2)
      {
        unint64_t v29 = 1;
        do
        {
          id v30 = [v26 objectAtIndex:v29];
          id v31 = [v14 objectWithID:v30];
          [v14 deleteObject:v31];

          ++v29;
        }
        while (v29 < [v26 count]);
      }
      id v39 = 0;
      char v32 = [v14 save:&v39];
      id v33 = v39;
      uint64_t v28 = v33;
      if ((v32 & 1) != 0 || !v33)
      {
        [v14 reset];
      }
      else
      {
        NSLog(&cfstr_ErrorWhileDele.isa, v33);
        id v34 = [v28 userInfo];
        NSLog(&cfstr_ErrorUserinfo.isa, v34);
      }
      BOOL v17 = v36;
      BOOL v12 = v37;
    }
  }
  while (v15++ != v16 / 0x2710);
}

+ (id)legacyImportFilePaths
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = +[_KSUtilities keyboardDirectory];
  if (v2)
  {
    id v3 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"ja", @"zh-Pinyin", @"zh-Zhuyin", @"latin", 0);
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [@"SerializedUserWords-" stringByAppendingString:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          id v10 = [v2 stringByAppendingPathComponent:v9];

          id v11 = [MEMORY[0x263F08850] defaultManager];
          int v12 = [v11 fileExistsAtPath:v10];

          if (v12) {
            [v14 addObject:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)legacyImportWordKeyPairsFromFiles:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithContentsOfFile:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObjectsFromArray:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)importLegacyEntries
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(id)objc_opt_class() legacyImportFilePaths];
  if ([v4 count])
  {
    id v5 = [(id)objc_opt_class() legacyImportWordKeyPairsFromFiles:v4];
    unint64_t v6 = [v5 count];
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [(_KSTextReplacementLegacyStore *)self persistentStore];

      if (v7)
      {
        if (v6)
        {
          for (unint64_t i = 0; i < v6; i += 2)
          {
            id v9 = objc_alloc_init(_KSTIUserDictionaryEntryValue);
            id v10 = [v5 objectAtIndex:i];
            [(_KSTIUserDictionaryEntryValue *)v9 setPhrase:v10];

            id v11 = [v5 objectAtIndex:i + 1];
            [(_KSTIUserDictionaryEntryValue *)v9 setShortcut:v11];

            [(_KSTextReplacementLegacyStore *)self insertEntryWithValue:v9];
          }
        }
        if ([(_KSTextReplacementLegacyStore *)self save])
        {
          long long v12 = [MEMORY[0x263F08850] defaultManager];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v23 = v4;
          id v13 = v4;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v26 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * j);
                if ([v12 fileExistsAtPath:v18])
                {
                  id v24 = 0;
                  char v19 = [v12 removeItemAtPath:v18 error:&v24];
                  id v20 = v24;
                  id v21 = v20;
                  if ((v19 & 1) == 0) {
                    NSLog(&cfstr_S.isa, "-[_KSTextReplacementLegacyStore importLegacyEntries]", v20);
                  }
                }
                else
                {
                  id v21 = 0;
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
            }
            while (v15);
          }

          uint64_t v22 = [MEMORY[0x263F08A00] defaultCenter];
          [v22 postNotificationName:@"_KSTRLegacyStoreDidImportChangesNotification" object:0];

          id v4 = v23;
        }
      }
    }
  }
}

+ (id)legacyStorePath
{
  v2 = +[_KSUtilities keyboardDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"UserDictionary.sqlite"];

  return v3;
}

- (void)migrateTellurideData
{
  id v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = +[_KSUtilities userDictionaryWordKeyPairsFilePathLegacy];
  id v5 = [MEMORY[0x263F08850] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithContentsOfFile:v4];
    if (!v7)
    {
      NSLog(&cfstr_CouldnTReadLeg.isa, v4);
LABEL_21:

      goto LABEL_22;
    }
    NSLog(&cfstr_PerformingMigr.isa, v4);
    uint64_t v8 = [(id)objc_opt_class() legacyStorePath];
    id v9 = [MEMORY[0x263F08850] defaultManager];
    if ([v9 fileExistsAtPath:v8])
    {
      id v10 = [MEMORY[0x263F08850] defaultManager];
      id v27 = 0;
      char v11 = [v10 removeItemAtPath:v8 error:&v27];
      id v12 = v27;

      if ((v11 & 1) == 0)
      {
        NSLog(&cfstr_CouldnTRemoveL.isa, v8, v12);
LABEL_20:

        goto LABEL_21;
      }
      id v13 = v12;
    }
    else
    {

      id v13 = 0;
    }
    uint64_t v14 = [v7 count];
    if (!v14 || (unint64_t v15 = v14, (v14 & 1) != 0))
    {
LABEL_14:
      uint64_t v23 = [MEMORY[0x263F08850] defaultManager];
      id v26 = v13;
      char v24 = [v23 removeItemAtPath:v4 error:&v26];
      id v12 = v26;

      if ((v24 & 1) == 0) {
        NSLog(&cfstr_CouldnTRemoveL_0.isa, v4, v12);
      }
      long long v25 = [MEMORY[0x263F08A00] defaultCenter];
      [v25 postNotificationName:@"_KSTRLegacyStoreDidImportChangesNotification" object:0];
    }
    else
    {
      for (unint64_t i = 0; i < v15; i += 2)
      {
        uint64_t v17 = [(_KSTextReplacementLegacyStore *)self persistentStore];

        if (!v17)
        {
          id v12 = v13;
          goto LABEL_20;
        }
        uint64_t v18 = objc_alloc_init(_KSTIUserDictionaryEntryValue);
        char v19 = [v7 objectAtIndex:i];
        [(_KSTIUserDictionaryEntryValue *)v18 setPhrase:v19];

        id v20 = [v7 objectAtIndex:i + 1];
        [(_KSTIUserDictionaryEntryValue *)v18 setShortcut:v20];

        [(_KSTextReplacementLegacyStore *)self insertEntryWithValue:v18];
        id v21 = [(_KSTIUserDictionaryEntryValue *)v18 shortcut];
        uint64_t v22 = [(_KSTIUserDictionaryEntryValue *)v18 phrase];
        NSLog(&cfstr_AddedShortcutF.isa, v21, v22);
      }
      if ([(_KSTextReplacementLegacyStore *)self save]) {
        goto LABEL_14;
      }
      NSLog(&cfstr_CouldnTSaveWor.isa, v13);
      id v12 = v13;
    }
    goto LABEL_20;
  }
LABEL_22:
}

- (void)migrateSundanceData
{
  id v3 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = +[_KSTextReplacementLegacyStore legacyStorePath];
  int v6 = [v4 fileExistsAtPath:v5];

  if (v6)
  {
    uint64_t v7 = +[_KSTextReplacementLegacyStore legacyStorePath];
    uint64_t v8 = [(_KSTextReplacementLegacyStore *)self persistentStore];

    if (v8)
    {
      NSLog(&cfstr_PerformingMigr_0.isa, v7);
      id v9 = [NSURL fileURLWithPath:v7];
      id v16 = 0;
      BOOL v10 = [(_KSTextReplacementLegacyStore *)self migrateEntriesFromStoreAtURL:v9 error:&v16];
      id v11 = v16;

      if (v10)
      {
        NSLog(&cfstr_RemovingLegacy.isa, v7);

        id v12 = [MEMORY[0x263F08850] defaultManager];
        id v15 = 0;
        char v13 = [v12 removeItemAtPath:v7 error:&v15];
        id v11 = v15;

        if ((v13 & 1) == 0) {
          NSLog(&cfstr_CouldnTRemoveL.isa, v7, v11);
        }
        uint64_t v14 = [MEMORY[0x263F08A00] defaultCenter];
        [v14 postNotificationName:@"_KSTRLegacyStoreDidImportChangesNotification" object:0];
      }
    }
  }
}

- (void)runLegacyMigration
{
  [(_KSTextReplacementLegacyStore *)self importLegacyEntries];
  [(_KSTextReplacementLegacyStore *)self migrateTellurideData];
  [(_KSTextReplacementLegacyStore *)self migrateSundanceData];
}

+ (id)basePersistentStoreURL
{
  if (basePersistentStoreURL_onceToken != -1) {
    dispatch_once(&basePersistentStoreURL_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)basePersistentStoreURL_baseURL;
  return v2;
}

+ (id)cachedStorePath
{
  v2 = +[_KSUtilities keyboardDirectory];
  id v3 = [v2 stringByAppendingPathComponent:@"textReplacements.cache"];

  return v3;
}

- (void)persistentStoreCoordinatorStoresWillChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = KSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresWillChange:]";
    _os_log_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_INFO, "%s  >>> persistentStoreCoordinatorStoresWillChange", buf, 0xCu);
  }

  int v6 = [(_KSTextReplacementLegacyStore *)self workQueue];
  dispatch_assert_queue_not_V2(v6);

  uint64_t v7 = self;
  objc_sync_enter(v7);
  if ([(_KSTextReplacementLegacyStore *)v7 suspendedForAccountChange])
  {
    objc_sync_exit(v7);
  }
  else
  {
    [(_KSTextReplacementLegacyStore *)v7 setSuspendedForAccountChange:1];
    objc_sync_exit(v7);

    uint64_t v8 = [(_KSTextReplacementLegacyStore *)v7 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresWillChange___block_invoke;
    block[3] = &unk_2648906A8;
    void block[4] = v7;
    dispatch_sync(v8, block);
  }
}

- (void)persistentStoreCoordinatorStoresDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = KSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v13 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresDidChange:]";
    _os_log_impl(&dword_22B2BC000, v5, OS_LOG_TYPE_INFO, "%s  >>> persistentStoreCoordinatorStoresDidChange", buf, 0xCu);
  }

  int v6 = self;
  objc_sync_enter(v6);
  if ([(_KSTextReplacementLegacyStore *)v6 suspendedForAccountChange])
  {
    [(_KSTextReplacementLegacyStore *)v6 setSuspendedForAccountChange:0];
    objc_sync_exit(v6);

    uint64_t v7 = [(_KSTextReplacementLegacyStore *)v6 workQueue];
    dispatch_assert_queue_not_V2(v7);

    uint64_t v8 = [(_KSTextReplacementLegacyStore *)v6 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75___KSTextReplacementLegacyStore_persistentStoreCoordinatorStoresDidChange___block_invoke;
    block[3] = &unk_2648906A8;
    void block[4] = v6;
    dispatch_async(v8, block);

    id v9 = KSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      char v13 = "-[_KSTextReplacementLegacyStore persistentStoreCoordinatorStoresDidChange:]";
      _os_log_impl(&dword_22B2BC000, v9, OS_LOG_TYPE_INFO, "%s  Resuming user dictionary after account change.", buf, 0xCu);
    }

    BOOL v10 = [(_KSTextReplacementLegacyStore *)v6 workQueue];
    dispatch_resume(v10);
  }
  else
  {
    objc_sync_exit(v6);
  }
}

- (int64_t)context:(id)a3 shouldHandleInaccessibleFault:(id)a4 forObjectID:(id)a5 andTrigger:(id)a6
{
  return 2;
}

- (NSString)cacheFilePath
{
  return self->_cacheFilePath;
}

- (void)setCacheFilePath:(id)a3
{
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
}

- (void)setManagedObjectContext:(id)a3
{
}

- (void)setPersistentStore:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)suspendedForAccountChange
{
  return self->_suspendedForAccountChange;
}

- (void)setSuspendedForAccountChange:(BOOL)a3
{
  self->_suspendedForAccountChange = a3;
}

- (BOOL)forceMaintenance
{
  return self->_forceMaintenance;
}

- (void)setForceMaintenance:(BOOL)a3
{
  self->_forceMaintenance = a3;
}

- (NSDate)lastMaintenanceDate
{
  return self->_lastMaintenanceDate;
}

- (void)setLastMaintenanceDate:(id)a3
{
}

- (int64_t)importedSinceMaintenance
{
  return self->_importedSinceMaintenance;
}

- (void)setImportedSinceMaintenance:(int64_t)a3
{
  self->_importedSinceMaintenance = a3;
}

- (BOOL)pendingSampleShortcutImport
{
  return self->_pendingSampleShortcutImport;
}

- (void)setPendingSampleShortcutImport:(BOOL)a3
{
  self->_pendingSampleShortcutImport = a3;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (BOOL)minimumUptimeDidExpire
{
  return self->_minimumUptimeDidExpire;
}

- (void)setMinimumUptimeDidExpire:(BOOL)a3
{
  self->_minimumUptimeDidExpire = a3;
}

- (NSDate)persistentStoreDidLoadTime
{
  return self->_persistentStoreDidLoadTime;
}

- (void)setPersistentStoreDidLoadTime:(id)a3
{
}

- (BOOL)didScheduleCacheUpdate
{
  return self->_didScheduleCacheUpdate;
}

- (void)setDidScheduleCacheUpdate:(BOOL)a3
{
  self->_didScheduleCacheUpdate = a3;
}

- (BOOL)shouldUpdateTheCache
{
  return self->_shouldUpdateTheCache;
}

- (void)setShouldUpdateTheCache:(BOOL)a3
{
  self->_shouldUpdateTheCache = a3;
}

- (BOOL)ubiquityStoreLoaded
{
  return self->_ubiquityStoreLoaded;
}

- (void)setUbiquityStoreLoaded:(BOOL)a3
{
  self->_ubiquityStoreLoaded = a3;
}

- (NSDate)ubiquityStoreLoadStartTime
{
  return self->_ubiquityStoreLoadStartTime;
}

- (void)setUbiquityStoreLoadStartTime:(id)a3
{
}

- (BOOL)shouldDisableCaching
{
  return self->_shouldDisableCaching;
}

- (void)setShouldDisableCaching:(BOOL)a3
{
  self->_shouldDisableCaching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquityStoreLoadStartTime, 0);
  objc_storeStrong((id *)&self->_persistentStoreDidLoadTime, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_lastMaintenanceDate, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_cacheFilePath, 0);
  objc_storeStrong((id *)&self->_uptimeTransaction, 0);
}

@end