@interface _ATXAppLaunchSequenceManager
+ (_ATXAppLaunchSequenceManager)sharedInstance;
- (_ATXAppLaunchSequenceManager)init;
- (_ATXAppLaunchSequenceManager)initWithDataStore:(id)a3;
- (_ATXAppLaunchSequenceManager)initWithInMemoryStore;
- (id)launchSequence;
- (id)launchSequenceForAppAction:(id)a3;
- (id)launchSequenceForBundle:(id)a3;
- (id)syncQueue;
- (void)addBundleIdToLaunchSequence:(id)a3 date:(id)a4;
- (void)decayAllAppActionLaunchSequencesWithHalfLifeInDays:(double)a3;
- (void)decayAllLaunchSequencesWithHalfLifeInDays:(double)a3;
- (void)deleteAllLaunchesForAppActions:(id)a3;
- (void)deleteAllLaunchesForBundles:(id)a3;
@end

@implementation _ATXAppLaunchSequenceManager

+ (_ATXAppLaunchSequenceManager)sharedInstance
{
  if (sharedInstance__pasOnceToken6_22 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_22, &__block_literal_global_127);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_28;
  return (_ATXAppLaunchSequenceManager *)v2;
}

- (_ATXAppLaunchSequenceManager)init
{
  v3 = +[_ATXDataStore sharedInstance];
  v4 = [(_ATXAppLaunchSequenceManager *)self initWithDataStore:v3];

  return v4;
}

- (_ATXAppLaunchSequenceManager)initWithInMemoryStore
{
  v3 = [[_ATXDataStore alloc] initWithInMemoryDataStore];
  v4 = [(_ATXAppLaunchSequenceManager *)self initWithDataStore:v3];

  return v4;
}

- (_ATXAppLaunchSequenceManager)initWithDataStore:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_ATXAppLaunchSequenceManager.m", 43, @"Invalid parameter not satisfying: %@", @"datastore" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)_ATXAppLaunchSequenceManager;
  v7 = [(_ATXAppLaunchSequenceManager *)&v27 init];
  if (v7)
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create(v10, v11);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v7->_datastore, a3);
    uint64_t v14 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    appLaunchSequence = v7->_appLaunchSequence;
    v7->_appLaunchSequence = (NSMapTable *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    appActionLaunchSequence = v7->_appActionLaunchSequence;
    v7->_appActionLaunchSequence = (NSMapTable *)v16;

    objc_initWeak(&location, v7);
    uint64_t v18 = objc_opt_new();
    uninstallNotificationListener = v7->_uninstallNotificationListener;
    v7->_uninstallNotificationListener = (_ATXInternalUninstallNotification *)v18;

    v20 = v7->_uninstallNotificationListener;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __50___ATXAppLaunchSequenceManager_initWithDataStore___block_invoke;
    v24[3] = &unk_1E68AB9D8;
    objc_copyWeak(&v25, &location);
    [(_ATXInternalUninstallNotification *)v20 registerForNotificationsWithUninstallBlock:v24];
    v21 = __atxlog_handle_default();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[_ATXAppLaunchSequenceManager initWithDataStore:](v21);
    }

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (id)launchSequenceForBundle:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_ATXAppLaunchSequenceManager.m", 62, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__59;
  uint64_t v18 = __Block_byref_object_dispose__59;
  id v19 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56___ATXAppLaunchSequenceManager_launchSequenceForBundle___block_invoke;
  block[3] = &unk_1E68AF258;
  id v12 = v5;
  v13 = &v14;
  block[4] = self;
  id v7 = v5;
  dispatch_sync(syncQueue, block);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)launchSequenceForAppAction:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_ATXAppLaunchSequenceManager.m", 76, @"Invalid parameter not satisfying: %@", @"appAction" object file lineNumber description];
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__59;
  uint64_t v18 = __Block_byref_object_dispose__59;
  id v19 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59___ATXAppLaunchSequenceManager_launchSequenceForAppAction___block_invoke;
  block[3] = &unk_1E68AF258;
  id v12 = v5;
  v13 = &v14;
  block[4] = self;
  id v7 = v5;
  dispatch_sync(syncQueue, block);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)decayAllLaunchSequencesWithHalfLifeInDays:(double)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74___ATXAppLaunchSequenceManager_decayAllLaunchSequencesWithHalfLifeInDays___block_invoke;
  v4[3] = &unk_1E68ACD10;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(syncQueue, v4);
}

- (void)decayAllAppActionLaunchSequencesWithHalfLifeInDays:(double)a3
{
  syncQueue = self->_syncQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __83___ATXAppLaunchSequenceManager_decayAllAppActionLaunchSequencesWithHalfLifeInDays___block_invoke;
  v4[3] = &unk_1E68ACD10;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(syncQueue, v4);
}

- (void)deleteAllLaunchesForBundles:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    syncQueue = self->_syncQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __60___ATXAppLaunchSequenceManager_deleteAllLaunchesForBundles___block_invoke;
    v6[3] = &unk_1E68AB870;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(syncQueue, v6);
  }
}

- (void)deleteAllLaunchesForAppActions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    syncQueue = self->_syncQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63___ATXAppLaunchSequenceManager_deleteAllLaunchesForAppActions___block_invoke;
    v6[3] = &unk_1E68AB870;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(syncQueue, v6);
  }
}

- (id)launchSequence
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__59;
  v10 = __Block_byref_object_dispose__59;
  id v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46___ATXAppLaunchSequenceManager_launchSequence__block_invoke;
  v5[3] = &unk_1E68ACBD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addBundleIdToLaunchSequence:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65___ATXAppLaunchSequenceManager_addBundleIdToLaunchSequence_date___block_invoke;
  block[3] = &unk_1E68AC320;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(syncQueue, block);
}

- (id)syncQueue
{
  return self->_syncQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAppActionLaunchDate, 0);
  objc_storeStrong((id *)&self->_lastAppActionLaunch, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationListener, 0);
  objc_storeStrong((id *)&self->_appActionLaunchSequence, 0);
  objc_storeStrong((id *)&self->_appLaunchSequence, 0);
  objc_storeStrong((id *)&self->_datastore, 0);
}

- (void)initWithDataStore:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "_ATXLaunchSequenceManager initialized", v1, 2u);
}

@end