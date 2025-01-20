@interface _ATXAppIconState
+ (_ATXAppIconState)sharedInstance;
- (BOOL)appInFolderWithBundleId:(id)a3;
- (BOOL)appOnDockWithBundleId:(id)a3;
- (_ATXAppIconState)initWithHomeScreenConfigCache:(id)a3 sbsHomeScreenService:(id)a4;
- (id)allAppsKnownToSpringBoard;
- (id)allDockedApps;
- (id)allFolderApps;
- (id)allInstalledAppsKnownToSpringBoard;
- (id)nonFolderAppSetOnPages;
- (id)springboardPageNumbersWithAppPredictionPanels;
- (id)springboardPageNumbersWithSuggestionsWidgets;
- (int64_t)folderPageNumberForBundleId:(id)a3;
- (int64_t)springboardPageLocationForBundleId:(id)a3;
- (int64_t)springboardPageNumberForBundleId:(id)a3;
- (unint64_t)getFirstVisiblePageIndex;
- (unint64_t)numberOfApps;
- (unint64_t)numberOfFolders;
- (unint64_t)numberOfPages;
- (void)_reload;
@end

@implementation _ATXAppIconState

- (id)allAppsKnownToSpringBoard
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__53;
  v11 = __Block_byref_object_dispose__53;
  id v12 = 0;
  syncQueue = self->_syncQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45___ATXAppIconState_allAppsKnownToSpringBoard__block_invoke;
  v6[3] = &unk_1E68ACBD0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(syncQueue, v6);
  v3 = (void *)v8[5];
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (_ATXAppIconState)sharedInstance
{
  if (sharedInstance__pasOnceToken6_18 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_18, &__block_literal_global_113);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_23;
  return (_ATXAppIconState *)v2;
}

- (_ATXAppIconState)initWithHomeScreenConfigCache:(id)a3 sbsHomeScreenService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)_ATXAppIconState;
  uint64_t v9 = [(_ATXAppIconState *)&v40 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeScreenConfigCache, a3);
    objc_storeStrong((id *)&v10->_sbsHomeScreenService, a4);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    v13 = (const char *)[v12 UTF8String];
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
    syncQueue = v10->_syncQueue;
    v10->_syncQueue = (OS_dispatch_queue *)v15;

    [(_ATXAppIconState *)v10 _reload];
    objc_initWeak(&location, v10);
    id v17 = objc_alloc(MEMORY[0x1E4F93B98]);
    v18 = v10->_syncQueue;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke;
    v37[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v38, &location);
    uint64_t v19 = [v17 initWithQueue:v18 operation:v37];
    coalescedReloadOperation = v10->_coalescedReloadOperation;
    v10->_coalescedReloadOperation = (_PASSimpleCoalescingTimer *)v19;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_39;
    aBlock[3] = &unk_1E68ACB80;
    objc_copyWeak(&v36, &location);
    v21 = _Block_copy(aBlock);
    notify_register_dispatch((const char *)[(id)*MEMORY[0x1E4F4ADA0] UTF8String], &v10->_homeScreenConfigCacheChangeDarwinNotificationObserver, (dispatch_queue_t)v10->_syncQueue, v21);
    notify_register_dispatch((const char *)[(id)*MEMORY[0x1E4F4AE10] UTF8String], &v10->_homeScreenTodayPageConfigCacheChangeDarwinNotificationObserver, (dispatch_queue_t)v10->_syncQueue, v21);
    notify_register_dispatch((const char *)[(id)*MEMORY[0x1E4F4AD88] UTF8String], &v10->_dockAppListChangeDarwinNotificationObserver, (dispatch_queue_t)v10->_syncQueue, v21);
    uint64_t v22 = objc_opt_new();
    installNotification = v10->_installNotification;
    v10->_installNotification = (_ATXInternalInstallNotification *)v22;

    v24 = v10->_installNotification;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_42;
    v33[3] = &unk_1E68AF800;
    id v25 = v21;
    id v34 = v25;
    [(_ATXInternalInstallNotification *)v24 registerForNotificationsWithInstallBlock:v33];
    uint64_t v26 = objc_opt_new();
    uninstallNotification = v10->_uninstallNotification;
    v10->_uninstallNotification = (_ATXInternalUninstallNotification *)v26;

    v28 = v10->_uninstallNotification;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __71___ATXAppIconState_initWithHomeScreenConfigCache_sbsHomeScreenService___block_invoke_2;
    v31[3] = &unk_1E68B1BC8;
    id v29 = v25;
    id v32 = v29;
    [(_ATXInternalUninstallNotification *)v28 registerForNotificationsWithUninstallBlock:v31];

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)_reload
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "_ATXAppIconState: Could not query all home screen placeholders from SpringBoard", v2, v3, v4, v5, v6);
}

- (id)allInstalledAppsKnownToSpringBoard
{
  uint64_t v3 = objc_opt_new();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54___ATXAppIconState_allInstalledAppsKnownToSpringBoard__block_invoke;
  v9[3] = &unk_1E68AB870;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(syncQueue, v9);
  uint8_t v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)allDockedApps
{
  uint64_t v3 = objc_opt_new();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33___ATXAppIconState_allDockedApps__block_invoke;
  v9[3] = &unk_1E68AB870;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(syncQueue, v9);
  uint8_t v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)allFolderApps
{
  uint64_t v3 = objc_opt_new();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33___ATXAppIconState_allFolderApps__block_invoke;
  v9[3] = &unk_1E68AB870;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(syncQueue, v9);
  uint8_t v6 = v10;
  id v7 = v5;

  return v7;
}

- (BOOL)appOnDockWithBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___ATXAppIconState_appOnDockWithBundleId___block_invoke;
  block[3] = &unk_1E68AF258;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

- (BOOL)appInFolderWithBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___ATXAppIconState_appInFolderWithBundleId___block_invoke;
  block[3] = &unk_1E68AF258;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

- (int64_t)springboardPageNumberForBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  dispatch_queue_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__53;
  v18 = __Block_byref_object_dispose__53;
  id v19 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___ATXAppIconState_springboardPageNumberForBundleId___block_invoke;
  block[3] = &unk_1E68AF258;
  uint64_t v13 = &v14;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(syncQueue, block);
  id v7 = [(id)v15[5] indexPath];

  if (v7)
  {
    id v8 = [(id)v15[5] indexPath];
    int64_t v9 = [v8 indexAtPosition:0];
  }
  else
  {
    int64_t v9 = -1;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (int64_t)springboardPageLocationForBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  dispatch_queue_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__53;
  v18 = __Block_byref_object_dispose__53;
  id v19 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___ATXAppIconState_springboardPageLocationForBundleId___block_invoke;
  block[3] = &unk_1E68AF258;
  uint64_t v13 = &v14;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(syncQueue, block);
  id v7 = [(id)v15[5] indexPath];

  if (v7)
  {
    id v8 = [(id)v15[5] indexPath];
    int64_t v9 = [v8 indexAtPosition:1];
  }
  else
  {
    int64_t v9 = -1;
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (int64_t)folderPageNumberForBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__53;
  v20 = __Block_byref_object_dispose__53;
  id v21 = 0;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48___ATXAppIconState_folderPageNumberForBundleId___block_invoke;
  block[3] = &unk_1E68AF258;
  dispatch_queue_t v15 = &v16;
  block[4] = self;
  id v6 = v4;
  id v14 = v6;
  dispatch_sync(syncQueue, block);
  id v7 = (void *)v17[5];
  if (v7)
  {
    id v8 = [v7 indexPath];
    uint64_t v9 = [v8 length];

    if (v9 == 3)
    {
      id v10 = [(id)v17[5] indexPath];
      int64_t v11 = [v10 indexAtPosition:2];
    }
    else
    {
      int64_t v11 = 0;
    }
  }
  else
  {
    int64_t v11 = -1;
  }

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (unint64_t)numberOfApps
{
  uint64_t v2 = [(_ATXAppIconState *)self allInstalledAppsKnownToSpringBoard];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)numberOfFolders
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35___ATXAppIconState_numberOfFolders__block_invoke;
  v5[3] = &unk_1E68ACBD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)numberOfPages
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33___ATXAppIconState_numberOfPages__block_invoke;
  v5[3] = &unk_1E68ACBD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)nonFolderAppSetOnPages
{
  unint64_t v3 = objc_opt_new();
  syncQueue = self->_syncQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42___ATXAppIconState_nonFolderAppSetOnPages__block_invoke;
  v9[3] = &unk_1E68AB870;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(syncQueue, v9);
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

- (unint64_t)getFirstVisiblePageIndex
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44___ATXAppIconState_getFirstVisiblePageIndex__block_invoke;
  v5[3] = &unk_1E68AB898;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)springboardPageNumbersWithAppPredictionPanels
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__53;
  id v10 = __Block_byref_object_dispose__53;
  id v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65___ATXAppIconState_springboardPageNumbersWithAppPredictionPanels__block_invoke;
  v5[3] = &unk_1E68ACBD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)springboardPageNumbersWithSuggestionsWidgets
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__53;
  id v10 = __Block_byref_object_dispose__53;
  id v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64___ATXAppIconState_springboardPageNumbersWithSuggestionsWidgets__block_invoke;
  v5[3] = &unk_1E68ACBD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedReloadOperation, 0);
  objc_storeStrong((id *)&self->_pageIndicesWithSuggestionWidgets, 0);
  objc_storeStrong((id *)&self->_pageIndicesWithAppPredictionPanels, 0);
  objc_storeStrong((id *)&self->_orderedVisiblePageIndices, 0);
  objc_storeStrong((id *)&self->_iconLocationByBundleId, 0);
  objc_storeStrong((id *)&self->_sbsHomeScreenService, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigCache, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_uninstallNotification, 0);
  objc_storeStrong((id *)&self->_installNotification, 0);
}

@end