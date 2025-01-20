@interface DDSManager
+ (id)updateCatalogMetadataKeyForAssetType:(id)a3;
- (DDSAssetObserving)assetObserver;
- (DDSAssetProviding)provider;
- (DDSAssetTracking)tracker;
- (DDSMAAutoAssetManager)autoAssetManager;
- (DDSManager)initWithProvider:(id)a3 tracker:(id)a4;
- (DDSManager)initWithProvider:(id)a3 tracker:(id)a4 dataSource:(id)a5;
- (DDSManager)initWithProvider:(id)a3 tracker:(id)a4 dataSource:(id)a5 autoAssetManager:(id)a6;
- (DDSManagerDataSource)dataSource;
- (DDSManagingDelegate)delegate;
- (NSMutableDictionary)pendingAssertionsToUpdateByAssetType;
- (NSMutableDictionary)remoteSyncStateByAssetType;
- (NSString)xpcServiceName;
- (OS_dispatch_queue)workQueue;
- (id)autoAssetQueryForAssertion:(id)a3;
- (id)catalogUpdateDateForAssetType:(id)a3;
- (int64_t)assetUpdateStatusForAssertion:(id)a3;
- (int64_t)modifyAssetUpdateStatusForAssertion:(id)a3 status:(int64_t)a4;
- (void)addAssertionForQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6;
- (void)assertionIDsForClientID:(id)a3 reply:(id)a4;
- (void)beginUpdateCycleForAssetType:(id)a3 forced:(BOOL)a4 discretionaryDownload:(BOOL)a5;
- (void)createAutoAssetAssertionForExistingAssertions;
- (void)createRemoteSyncStateForAssetType:(id)a3;
- (void)deleteV1AssetsIfNecessary;
- (void)didChangeDownloadState:(unint64_t)a3 forAsset:(id)a4;
- (void)didCompleteDownloadForAssertion:(id)a3 error:(id)a4;
- (void)didCompleteDownloadForAssertions:(id)a3 error:(id)a4;
- (void)didEndUpdateCycleWithAssetType:(id)a3 error:(id)a4;
- (void)didStartUpdateCycleForAssetType:(id)a3;
- (void)didUpdateCatalogWithAssetType:(id)a3 error:(id)a4;
- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4;
- (void)fetchCatalogBasedAssetUpdateStatusForAssertion:(id)a3 callback:(id)a4;
- (void)handleAddedNewDescriptor:(id)a3 forAssertion:(id)a4;
- (void)handleNewAssertions:(id)a3;
- (void)handleRemovedAssertions:(id)a3;
- (void)remoteSyncStateRequestsResetForAssetType:(id)a3;
- (void)remoteSyncStateRequestsRetryForAssetType:(id)a3;
- (void)remoteSyncStateRequestsUpdateForAssetType:(id)a3;
- (void)removeAssertionWithID:(id)a3;
- (void)removeOldAssets;
- (void)serverDidUpdateAssetsWithType:(id)a3;
- (void)setCatalogUpdateDate:(id)a3 forAssetType:(id)a4;
- (void)setDelegate:(id)a3;
- (void)triggerDump;
- (void)triggerUpdate;
- (void)updateAssetForQuery:(id)a3 callback:(id)a4;
- (void)updateAutoAssetForAssetType:(id)a3;
- (void)updateCatalogBasedAssetForAssertion:(id)a3 callback:(id)a4;
- (void)updateCatalogForAssetType:(id)a3 withCompletion:(id)a4;
@end

@implementation DDSManager

- (DDSManager)initWithProvider:(id)a3 tracker:(id)a4 dataSource:(id)a5 autoAssetManager:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v38.receiver = self;
  v38.super_class = (Class)DDSManager;
  v15 = [(DDSManager *)&v38 init];
  v16 = v15;
  if (v15)
  {
    id v33 = v12;
    v15->_lock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingAssertionsToUpdateByAssetType = v16->_pendingAssertionsToUpdateByAssetType;
    v16->_pendingAssertionsToUpdateByAssetType = v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.DataDeliveryServices.DDSManager", 0);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v16->_tracker, a4);
    [(DDSAssetTracking *)v16->_tracker setDelegate:v16];
    objc_storeStrong((id *)&v16->_provider, a3);
    [(DDSAssetProviding *)v16->_provider setDelegate:v16];
    objc_storeStrong((id *)&v16->_dataSource, a5);
    objc_storeStrong((id *)&v16->_autoAssetManager, a6);
    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    remoteSyncStateByAssetType = v16->_remoteSyncStateByAssetType;
    v16->_remoteSyncStateByAssetType = (NSMutableDictionary *)v21;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v23 = [(DDSAssetTracking *)v16->_tracker trackedAssetTypes];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          v29 = [[DDSRemoteSyncState alloc] initWithDelegate:v16 assetType:v28];
          [(NSMutableDictionary *)v16->_remoteSyncStateByAssetType setObject:v29 forKey:v28];
          [(DDSRemoteSyncState *)v29 loadStateAndScheduleUpdate];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v25);
    }

    v30 = objc_alloc_init(DDSAssetObserver);
    assetObserver = v16->_assetObserver;
    v16->_assetObserver = (DDSAssetObserving *)v30;

    [(DDSAssetObserving *)v16->_assetObserver setDelegate:v16];
    [(DDSAssetObserving *)v16->_assetObserver observeAssetType:@"com.apple.MobileAsset.LinguisticData"];
    [(DDSManager *)v16 removeOldAssets];
    [(DDSManager *)v16 createAutoAssetAssertionForExistingAssertions];
    id v12 = v33;
  }

  return v16;
}

- (DDSManager)initWithProvider:(id)a3 tracker:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc_init(DDSManagerDataSource);
  v9 = [(DDSManager *)self initWithProvider:v7 tracker:v6 dataSource:v8];

  return v9;
}

- (DDSManager)initWithProvider:(id)a3 tracker:(id)a4 dataSource:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(DDSMAAutoAssetManager);
  id v12 = [(DDSManager *)self initWithProvider:v10 tracker:v9 dataSource:v8 autoAssetManager:v11];

  return v12;
}

- (void)beginUpdateCycleForAssetType:(id)a3 forced:(BOOL)a4 discretionaryDownload:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = UpdateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v8;
    __int16 v21 = 1024;
    BOOL v22 = v6;
    __int16 v23 = 1024;
    BOOL v24 = v5;
    _os_log_impl(&dword_1E41D6000, v9, OS_LOG_TYPE_DEFAULT, "Beginning update cycle for asset type: %@ (forced %d, discretionary %d)...", buf, 0x18u);
  }

  os_unfair_lock_lock(&self->_lock);
  id v10 = [(DDSManager *)self remoteSyncStateByAssetType];
  id v11 = [v10 objectForKey:v8];

  os_unfair_lock_unlock(&self->_lock);
  if (!v11)
  {
    id v12 = UpdateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[DDSManager beginUpdateCycleForAssetType:forced:discretionaryDownload:]();
    }
    goto LABEL_9;
  }
  if ([v11 syncStatus] == 1)
  {
    id v12 = UpdateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E41D6000, v12, OS_LOG_TYPE_DEFAULT, "Update cycle already triggered, holding with pending assertions...", buf, 2u);
    }
LABEL_9:

    goto LABEL_13;
  }
  [(DDSManager *)self didStartUpdateCycleForAssetType:v8];
  id v13 = UpdateLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v8;
    _os_log_impl(&dword_1E41D6000, v13, OS_LOG_TYPE_DEFAULT, "Updating catalog for asset type: %{public}@", buf, 0xCu);
  }

  id v14 = [(DDSManager *)self provider];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke;
  v15[3] = &unk_1E6E3A918;
  v15[4] = self;
  id v16 = v8;
  BOOL v17 = v6;
  BOOL v18 = v5;
  [v14 updateCatalogForAssetType:v16 discretionaryDownload:v5 withCompletion:v15];

LABEL_13:
}

void __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = objc_initWeak(&location, v4);

  if (v4)
  {
    if (v3)
    {
      id v6 = objc_loadWeakRetained(&location);
      id v7 = [v6 workQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_2;
      block[3] = &unk_1E6E39E08;
      objc_copyWeak(&v29, &location);
      id v28 = *(id *)(a1 + 40);
      dispatch_sync(v7, block);

      objc_destroyWeak(&v29);
    }
    else
    {
      uint64_t v21 = 0;
      BOOL v22 = &v21;
      uint64_t v23 = 0x3032000000;
      BOOL v24 = __Block_byref_object_copy__5;
      uint64_t v25 = __Block_byref_object_dispose__5;
      id v26 = 0;
      id v9 = objc_loadWeakRetained(&location);
      id v10 = [v9 workQueue];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_278;
      v16[3] = &unk_1E6E3A8F0;
      objc_copyWeak(&v19, &location);
      id v11 = *(id *)(a1 + 40);
      char v20 = *(unsigned char *)(a1 + 48);
      id v17 = v11;
      BOOL v18 = &v21;
      dispatch_sync(v10, v16);

      uint64_t v12 = [(id)v22[5] count];
      id v13 = objc_loadWeakRetained(&location);
      id v14 = v13;
      if (v12)
      {
        v15 = [v13 provider];
        [v15 beginDownloadForAssertions:v22[5] discretionaryDownload:*(unsigned __int8 *)(a1 + 49)];
      }
      else
      {
        [v13 didEndUpdateCycleWithAssetType:*(void *)(a1 + 40) error:0];
      }

      objc_destroyWeak(&v19);
      _Block_object_dispose(&v21, 8);
    }
  }
  else
  {
    id v8 = UpdateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_cold_1(v8);
    }
  }
  objc_destroyWeak(&location);
}

void __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained pendingAssertionsToUpdateByAssetType];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v2 setObject:v3 forKey:*(void *)(a1 + 32)];
}

void __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_278(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = [WeakRetained pendingAssertionsToUpdateByAssetType];
  id v5 = [v4 objectForKey:*(void *)(a1 + 32)];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  id v8 = v7;

  if (*(unsigned char *)(a1 + 56))
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v12 = objc_loadWeakRetained(v2);
    id v13 = [v12 tracker];
    id v14 = [v13 allAssertions];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v56 objects:v65 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v57 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          char v20 = [v19 query];
          uint64_t v21 = [v20 assetType];
          int v22 = [v21 isEqualToString:*(void *)(a1 + 32)];

          if (v22) {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v56 objects:v65 count:16];
      }
      while (v16);
    }

    uint64_t v23 = UpdateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v62 = v25;
      __int16 v63 = 2114;
      uint64_t v64 = v24;
      id v26 = "Cycle will force update all assertions: %{public}@ for asset type: %{public}@";
LABEL_30:
      _os_log_impl(&dword_1E41D6000, v23, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
    }
  }
  else if ([v8 count])
  {
    uint64_t v27 = [v8 mutableCopy];
    uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
    id v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    id v30 = objc_loadWeakRetained(v2);
    v31 = [v30 pendingAssertionsToUpdateByAssetType];
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v31 setObject:v32 forKey:*(void *)(a1 + 32)];

    uint64_t v23 = UpdateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v62 = v34;
      __int16 v63 = 2114;
      uint64_t v64 = v33;
      id v26 = "Cycle will update pending assertions: %{public}@ for asset type: %{public}@";
      goto LABEL_30;
    }
  }
  else
  {
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v36 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = v35;

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v38 = objc_loadWeakRetained(v2);
    v39 = objc_msgSend(v38, "tracker", 0);
    uint64_t v40 = [MEMORY[0x1E4F1C9C8] date];
    v41 = [v39 assertionDueForUpdateSinceDate:v40];

    uint64_t v42 = [v41 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v53;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v53 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v52 + 1) + 8 * j);
          v47 = [v46 query];
          v48 = [v47 assetType];
          int v49 = [v48 isEqualToString:*(void *)(a1 + 32)];

          if (v49) {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v46];
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v43);
    }

    uint64_t v23 = UpdateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = *(void *)(a1 + 32);
      uint64_t v51 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v62 = v51;
      __int16 v63 = 2114;
      uint64_t v64 = v50;
      id v26 = "Cycle will update time eligible assertions: %{public}@ for asset type: %{public}@";
      goto LABEL_30;
    }
  }
}

- (void)addAssertionForQuery:(id)a3 policy:(id)a4 assertionID:(id)a5 clientID:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = UpdateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138544130;
    id v19 = v10;
    __int16 v20 = 2114;
    id v21 = v11;
    __int16 v22 = 2114;
    id v23 = v12;
    __int16 v24 = 2114;
    id v25 = v13;
    _os_log_impl(&dword_1E41D6000, v14, OS_LOG_TYPE_DEFAULT, "Add assertion for query: %{public}@ policy: (%{public}@) assertionID: (%{public}@) clientID: (%{public}@)", (uint8_t *)&v18, 0x2Au);
  }

  uint64_t v15 = [(DDSManager *)self assetObserver];
  uint64_t v16 = [v10 assetType];
  [v15 observeAssetType:v16];

  uint64_t v17 = [(DDSManager *)self tracker];
  [v17 addAssertionForQuery:v10 policy:v11 assertionID:v12 clientID:v13];
}

- (void)removeAssertionWithID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UpdateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Remove assertion with ID: (%{public}@)", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(DDSManager *)self tracker];
  [v6 removeAssertionWithID:v4];
}

- (void)assertionIDsForClientID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void *))a4;
  id v8 = [(DDSManager *)self tracker];
  uint64_t v9 = [v8 assertionIDsForClientID:v6];

  id v10 = DefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DDSManager assertionIDsForClientID:reply:]();
  }

  v7[2](v7, v9);
}

- (void)triggerDump
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E41D6000, log, OS_LOG_TYPE_DEBUG, "Asset log dump requested!", v1, 2u);
}

- (void)triggerUpdate
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = DefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E41D6000, v3, OS_LOG_TYPE_DEFAULT, "Asset update requested via ddsutil", buf, 2u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(DDSManager *)self tracker];
  id v5 = [v4 trackedAssetTypes];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        [(DDSManager *)self beginUpdateCycleForAssetType:*(void *)(*((void *)&v24 + 1) + 8 * v9++) forced:1 discretionaryDownload:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [(DDSManager *)self tracker];
  id v11 = [v10 allAssertions];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [(DDSManager *)self autoAssetQueryForAssertion:*(void *)(*((void *)&v20 + 1) + 8 * v15)];
        if (v16)
        {
          uint64_t v17 = [(DDSManager *)self autoAssetManager];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __27__DDSManager_triggerUpdate__block_invoke;
          v18[3] = &unk_1E6E3A940;
          id v19 = v16;
          [v17 updateAssetForQuery:v19 callback:v18];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v13);
  }
}

void __27__DDSManager_triggerUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    v2 = DefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __27__DDSManager_triggerUpdate__block_invoke_cold_1();
    }
  }
}

- (id)autoAssetQueryForAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [v4 query];
  uint64_t v6 = [v5 assetType];
  BOOL v7 = +[DDSMAAutoAssetManager isAutoAssetType:v6];

  if (v7)
  {
    uint64_t v8 = [v4 query];
  }
  else
  {
    uint64_t v9 = [(DDSManager *)self autoAssetManager];
    id v10 = [v4 query];
    id v11 = [v10 assetType];
    uint64_t v12 = [v9 autoAssetTypeForAsserType:v11];

    if (v12)
    {
      uint64_t v13 = [DDSAssetQuery alloc];
      uint64_t v14 = [v4 query];
      uint64_t v15 = [v14 filter];
      uint64_t v8 = [(DDSAssetQuery *)v13 initWithAssetType:v12 filter:v15];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

- (void)handleNewAssertions:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UpdateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Handle new assertions: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__5;
  long long v25 = __Block_byref_object_dispose__5;
  id v26 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v6 = [(DDSManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__DDSManager_handleNewAssertions___block_invoke;
  block[3] = &unk_1E6E3A7C8;
  id v7 = v4;
  id v18 = v7;
  id v19 = self;
  p_long long buf = &buf;
  dispatch_sync(v6, block);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        -[DDSManager createRemoteSyncStateForAssetType:](self, "createRemoteSyncStateForAssetType:", v12, (void)v13);
        [(DDSManager *)self beginUpdateCycleForAssetType:v12 forced:0 discretionaryDownload:0];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(&buf, 8);
}

void __34__DDSManager_handleNewAssertions___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v37;
    unint64_t v6 = 0x1E6E39000uLL;
    *(void *)&long long v3 = 138543618;
    long long v33 = v3;
    do
    {
      uint64_t v7 = 0;
      uint64_t v34 = v4;
      do
      {
        if (*(void *)v37 != v5) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
        uint64_t v9 = *(void **)(v6 + 3016);
        uint64_t v10 = objc_msgSend(v8, "query", v33);
        id v11 = [v10 assetType];
        LODWORD(v9) = [v9 isAutoAssetType:v11];

        if (v9)
        {
          uint64_t v12 = AutoAssetLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138543362;
            v41 = v8;
            _os_log_impl(&dword_1E41D6000, v12, OS_LOG_TYPE_DEFAULT, "Handle new assertion for auto asset: %{public}@", buf, 0xCu);
          }

          long long v13 = [*(id *)(a1 + 40) autoAssetManager];
          long long v14 = [v8 query];
          [v13 registerInterestInContentForQuery:v14];
        }
        else
        {
          long long v15 = [*(id *)(a1 + 40) autoAssetManager];
          long long v16 = [v8 query];
          uint64_t v17 = [v16 assetType];
          long long v13 = [v15 autoAssetTypeForAsserType:v17];

          if (v13)
          {
            id v18 = AutoAssetLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = v33;
              v41 = v13;
              __int16 v42 = 2114;
              uint64_t v43 = v8;
              _os_log_impl(&dword_1E41D6000, v18, OS_LOG_TYPE_DEFAULT, "Handle new assertion for auto asset with override asset type: %{public}@, assertion: %{public}@", buf, 0x16u);
            }

            id v19 = [DDSAssetQuery alloc];
            long long v20 = [v8 query];
            long long v21 = [v20 filter];
            long long v22 = [(DDSAssetQuery *)v19 initWithAssetType:v13 filter:v21];

            uint64_t v23 = [*(id *)(a1 + 40) autoAssetManager];
            [v23 registerInterestInContentForQuery:v22];
          }
          uint64_t v24 = v5;
          unint64_t v25 = v6;
          id v26 = [v8 query];
          long long v14 = [v26 assetType];

          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v14];
          uint64_t v27 = [*(id *)(a1 + 40) pendingAssertionsToUpdateByAssetType];
          uint64_t v28 = [v27 objectForKey:v14];
          id v29 = v28;
          if (v28) {
            id v30 = v28;
          }
          else {
            id v30 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          }
          uint64_t v31 = v30;

          [v31 addObject:v8];
          id v32 = [*(id *)(a1 + 40) pendingAssertionsToUpdateByAssetType];
          [v32 setObject:v31 forKey:v14];

          unint64_t v6 = v25;
          uint64_t v5 = v24;
          uint64_t v4 = v34;
        }

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v4);
  }
}

- (void)handleAddedNewDescriptor:(id)a3 forAssertion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = DefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    id v9 = v5;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_1E41D6000, v7, OS_LOG_TYPE_DEFAULT, "New descriptor : %{public}@ added for assertion: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)handleRemovedAssertions:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UpdateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v62 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Asked to remove assertions: %{public}@, will let garbage collection collect.", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v54 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [(DDSManager *)self autoAssetQueryForAssertion:*(void *)(*((void *)&v53 + 1) + 8 * i)];
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    id v35 = v7;
    long long v13 = AutoAssetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1E41D6000, v13, OS_LOG_TYPE_DEFAULT, "Asked to remove assertions for auto asset", buf, 2u);
    }

    long long v14 = [MEMORY[0x1E4F1CA80] set];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v15 = [(DDSManager *)self tracker];
    long long v16 = [v15 allAssertions];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = -[DDSManager autoAssetQueryForAssertion:](self, "autoAssetQueryForAssertion:", *(void *)(*((void *)&v49 + 1) + 8 * j), v35);
          if (v21)
          {
            long long v22 = [(DDSManager *)self autoAssetManager];
            uint64_t v23 = [v22 autoAssetSelectorsForQuery:v21];

            [v14 addObjectsFromArray:v23];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v18);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v36 = v6;
    obuint64_t j = v6;
    uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v39)
    {
      uint64_t v38 = *(void *)v46;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v46 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v40 = v24;
          uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * v24);
          id v26 = [(DDSManager *)self autoAssetManager];
          uint64_t v27 = [v26 autoAssetSelectorsForQuery:v25];

          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v28 = v27;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v57 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v42;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v42 != v31) {
                  objc_enumerationMutation(v28);
                }
                long long v33 = *(void **)(*((void *)&v41 + 1) + 8 * k);
                if ([v14 containsObject:v33])
                {
                  uint64_t v34 = AutoAssetLog();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 138543362;
                    id v62 = v33;
                    _os_log_impl(&dword_1E41D6000, v34, OS_LOG_TYPE_DEFAULT, "Cannot eliminate interest in content for asset selector: %{public}@", buf, 0xCu);
                  }
                }
                else
                {
                  uint64_t v34 = [(DDSManager *)self autoAssetManager];
                  [v34 unregisterInterestInContentForAssetSelector:v33];
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v41 objects:v57 count:16];
            }
            while (v30);
          }

          uint64_t v24 = v40 + 1;
        }
        while (v40 + 1 != v39);
        uint64_t v39 = [obj countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v39);
    }

    id v7 = v35;
    id v6 = v36;
  }
}

- (void)didChangeDownloadState:(unint64_t)a3 forAsset:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = DefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 debuggingID];
    int v11 = 134349314;
    unint64_t v12 = a3;
    __int16 v13 = 2114;
    long long v14 = v7;
    _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Download state: %{public}lu for asset: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if ((uint64_t)a3 > 9)
  {
    if (a3 == 10)
    {
      uint64_t v9 = +[DDSAnalytics sharedInstance];
      [v9 cancelRecordingForAsset:v5];
      goto LABEL_13;
    }
    if (a3 == 11)
    {
      uint64_t v8 = +[DDSAnalytics sharedInstance];
      uint64_t v9 = v8;
      uint64_t v10 = 4;
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v8 = +[DDSAnalytics sharedInstance];
      uint64_t v9 = v8;
      uint64_t v10 = 1;
      goto LABEL_11;
    }
    if (a3 == 9)
    {
      uint64_t v8 = +[DDSAnalytics sharedInstance];
      uint64_t v9 = v8;
      uint64_t v10 = 3;
LABEL_11:
      [v8 recordAssetAction:v10 forAsset:v5];
LABEL_13:
    }
  }
}

- (void)didCompleteDownloadForAssertion:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = UpdateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "Completed download for assertion (%{public}@) with error: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (!v7)
  {
    uint64_t v9 = [(DDSManager *)self tracker];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    [v9 didUpdateAssertion:v6 atDate:v10];
  }
}

- (void)didCompleteDownloadForAssertions:(id)a3 error:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = UpdateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v34 = v6;
    __int16 v35 = 2114;
    id v36 = v7;
    _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "Completed download for assertions (%{public}@) with error: %{public}@", buf, 0x16u);
  }

  uint64_t v9 = UpdateLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E41D6000, v9, OS_LOG_TYPE_DEFAULT, "Calling didEndUpdateCycle", buf, 2u);
  }

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = [*(id *)(*((void *)&v27 + 1) + 8 * v15) query];
        uint64_t v17 = [v16 assetType];
        [v10 addObject:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v13);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v18 = v10;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        -[DDSManager didEndUpdateCycleWithAssetType:error:](self, "didEndUpdateCycleWithAssetType:error:", *(void *)(*((void *)&v23 + 1) + 8 * v22++), v7, (void)v23);
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v20);
  }
}

- (void)didUpdateCatalogWithAssetType:(id)a3 error:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = UpdateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v7;
    _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "didUpdateCatalogWithAssetType for asset type: %{public}@ with error: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  if (v7)
  {
    [(DDSManager *)self didEndUpdateCycleWithAssetType:v6 error:v7];
  }
  else
  {
    uint64_t v9 = [(DDSManager *)self dataSource];
    id v10 = [v9 date];
    [(DDSManager *)self setCatalogUpdateDate:v10 forAssetType:v6];
  }
}

- (void)createRemoteSyncStateForAssetType:(id)a3
{
  id v8 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(DDSManager *)self remoteSyncStateByAssetType];
  id v6 = [v5 objectForKey:v8];

  if (!v6)
  {
    id v6 = [[DDSRemoteSyncState alloc] initWithDelegate:self assetType:v8];
    id v7 = [(DDSManager *)self remoteSyncStateByAssetType];
    [v7 setObject:v6 forKey:v8];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)updateAutoAssetForAssetType:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UpdateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v23 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Begin update cycle for auto asset corresponding to asset type %@ ...", buf, 0xCu);
  }
  id v14 = v4;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(DDSManager *)self tracker];
  id v7 = [v6 allAssertions];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
        id v12 = -[DDSManager autoAssetQueryForAssertion:](self, "autoAssetQueryForAssertion:", *(void *)(*((void *)&v17 + 1) + 8 * v11), v14);
        if (v12)
        {
          __int16 v13 = [(DDSManager *)self autoAssetManager];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __42__DDSManager_updateAutoAssetForAssetType___block_invoke;
          v15[3] = &unk_1E6E3A940;
          id v16 = v12;
          [v13 updateAssetForQuery:v16 callback:v15];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

void __42__DDSManager_updateAutoAssetForAssetType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = AutoAssetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1E41D6000, v7, OS_LOG_TYPE_DEFAULT, "Auto asset update for query: %{public}@ completed successfully", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __42__DDSManager_updateAutoAssetForAssetType___block_invoke_cold_1();
  }
}

- (void)remoteSyncStateRequestsUpdateForAssetType:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UpdateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Begin update cycle requested for %@ ...", (uint8_t *)&v6, 0xCu);
  }

  [(DDSManager *)self updateAutoAssetForAssetType:v4];
  [(DDSManager *)self beginUpdateCycleForAssetType:v4 forced:0 discretionaryDownload:1];
}

- (void)remoteSyncStateRequestsRetryForAssetType:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UpdateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Retry update cycle requested for %@ ...", (uint8_t *)&v6, 0xCu);
  }

  [(DDSManager *)self willRetryUpdateCycle];
  [(DDSManager *)self beginUpdateCycleForAssetType:v4 forced:0 discretionaryDownload:0];
}

- (void)remoteSyncStateRequestsResetForAssetType:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = UpdateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "DDS assertion reset requested, initiating forced update for %@", (uint8_t *)&v7, 0xCu);
  }

  [(DDSManager *)self updateAutoAssetForAssetType:v4];
  int v6 = [(DDSManager *)self tracker];
  [v6 resetAssertionDueDatesForAssetType:v4];

  [(DDSManager *)self beginUpdateCycleForAssetType:v4 forced:1 discretionaryDownload:0];
}

- (void)didStartUpdateCycleForAssetType:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  int v6 = [(DDSManager *)self remoteSyncStateByAssetType];
  id v7 = [v6 objectForKey:v5];

  os_unfair_lock_unlock(p_lock);
  [v7 beganUpdateCycle];
}

- (void)didEndUpdateCycleWithAssetType:(id)a3 error:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = UpdateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "Update cycled ended with error: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(DDSManager *)self remoteSyncStateByAssetType];
  uint64_t v10 = [v9 objectForKey:v6];

  os_unfair_lock_unlock(&self->_lock);
  [v10 completedUpdateCycleWithError:v7];
  if (v7)
  {
    uint64_t v11 = [(DDSManager *)self workQueue];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    long long v18 = __51__DDSManager_didEndUpdateCycleWithAssetType_error___block_invoke_286;
    long long v19 = &unk_1E6E39F58;
    long long v20 = self;
    id v21 = v6;
    dispatch_sync(v11, &v16);

    objc_msgSend(v10, "syncStatus", v16, v17, v18, v19, v20);
  }
  else
  {
    id v12 = [(DDSManager *)self assetObserver];
    [v12 notifyObserversAssetsUpdatedForType:v6];

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    __int16 v13 = [(DDSManager *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__DDSManager_didEndUpdateCycleWithAssetType_error___block_invoke;
    block[3] = &unk_1E6E3A7C8;
    void block[4] = self;
    id v14 = v6;
    id v24 = v14;
    p_long long buf = &buf;
    dispatch_sync(v13, block);

    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      uint64_t v15 = UpdateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl(&dword_1E41D6000, v15, OS_LOG_TYPE_DEFAULT, "Begin cycle for missed/remaining pending assertions...", v22, 2u);
      }

      [(DDSManager *)self beginUpdateCycleForAssetType:v14 forced:0 discretionaryDownload:1];
    }

    _Block_object_dispose(&buf, 8);
  }
}

void __51__DDSManager_didEndUpdateCycleWithAssetType_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingAssertionsToUpdateByAssetType];
  long long v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  id v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  id v6 = v5;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 count] != 0;
}

void __51__DDSManager_didEndUpdateCycleWithAssetType_error___block_invoke_286(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) pendingAssertionsToUpdateByAssetType];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v3 setObject:v2 forKey:*(void *)(a1 + 40)];
}

- (void)serverDidUpdateAssetsWithType:(id)a3
{
  id v4 = a3;
  id v5 = [(DDSManager *)self provider];
  [v5 serverDidUpdateAssetsWithType:v4];
}

- (void)deleteV1AssetsIfNecessary
{
  id v2 = [(DDSManager *)self workQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = DefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E41D6000, v3, OS_LOG_TYPE_DEFAULT, "Requesting clean v1 LinguisticData repository", buf, 2u);
  }

  MEMORY[0x1E4E7CF00](@"com.apple.MobileAsset.LinguisticData");
  id v4 = DefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E41D6000, v4, OS_LOG_TYPE_DEFAULT, "Finished clean v1 LinguisticData repository", v5, 2u);
  }
}

- (void)removeOldAssets
{
  id v3 = [(DDSManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__DDSManager_removeOldAssets__block_invoke;
  block[3] = &unk_1E6E39DE0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __29__DDSManager_removeOldAssets__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) deleteV1AssetsIfNecessary];
  id v6 = [*(id *)(a1 + 32) provider];
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [*(id *)(a1 + 32) tracker];
  id v4 = [v3 allAssertions];
  id v5 = [v2 setWithArray:v4];
  [v6 removeOldAssetsForAssertions:v5];
}

- (void)createAutoAssetAssertionForExistingAssertions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = DefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1E41D6000, v3, OS_LOG_TYPE_DEFAULT, "Create auto asset assertions for existing assertions", buf, 2u);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(DDSManager *)self tracker];
  id v5 = [v4 allAssertions];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * v9);
        uint64_t v11 = [(DDSManager *)self autoAssetManager];
        id v12 = [v10 query];
        __int16 v13 = [v12 assetType];
        id v14 = [v11 autoAssetTypeForAsserType:v13];

        if (v14)
        {
          uint64_t v15 = [DDSAssetQuery alloc];
          uint64_t v16 = [v10 query];
          uint64_t v17 = [v16 filter];
          long long v18 = [(DDSAssetQuery *)v15 initWithAssetType:v14 filter:v17];

          long long v19 = [(DDSManager *)self autoAssetManager];
          [v19 registerInterestInContentForQuery:v18];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
}

- (int64_t)assetUpdateStatusForAssertion:(id)a3
{
  id v4 = a3;
  id v5 = [(DDSManager *)self provider];
  uint64_t v6 = [v5 updatableAssetsForAssertion:v4];

  BOOL v7 = [v6 count] != 0;
  uint64_t v8 = DefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(DDSManager *)v4 assetUpdateStatusForAssertion:v8];
  }

  return v7;
}

- (void)updateCatalogForAssetType:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(DDSManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = objc_alloc_init(MEMORY[0x1E4F77FE8]);
  [v9 setAllowsCellularAccess:1];
  [v9 setAllowsExpensiveAccess:1];
  [v9 setDiscretionary:0];
  uint64_t v10 = [(DDSManager *)self provider];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__DDSManager_updateCatalogForAssetType_withCompletion___block_invoke;
  v12[3] = &unk_1E6E3A680;
  id v13 = v6;
  id v11 = v6;
  [v10 startCatalogDownloadForAssetType:v7 withDownloadOptions:v9 withCompletion:v12];
}

uint64_t __55__DDSManager_updateCatalogForAssetType_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)updateCatalogMetadataKeyForAssetType:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@-%@", @"UpdateCatalogMetadata", a3];
}

- (void)setCatalogUpdateDate:(id)a3 forAssetType:(id)a4
{
  id v6 = a3;
  id v8 = +[DDSManager updateCatalogMetadataKeyForAssetType:a4];
  id v7 = [(DDSManager *)self dataSource];
  [v7 setDate:v6 forPreferenceKey:v8];
}

- (id)catalogUpdateDateForAssetType:(id)a3
{
  id v4 = a3;
  id v5 = [(DDSManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[DDSManager updateCatalogMetadataKeyForAssetType:v4];

  id v7 = [(DDSManager *)self dataSource];
  id v8 = [v7 dateForPreferenceKey:v6];

  return v8;
}

- (int64_t)modifyAssetUpdateStatusForAssertion:(id)a3 status:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(DDSManager *)self tracker];
  uint64_t v8 = [v7 updateStatusForAssertion:v6];

  if (v8 == 2)
  {
    a4 = 2;
  }
  else
  {
    id v9 = [(DDSManager *)self tracker];
    [v9 modifyUpdateStatusForAssertion:v6 toStatus:a4];
  }
  return a4;
}

- (void)fetchCatalogBasedAssetUpdateStatusForAssertion:(id)a3 callback:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, int64_t, void))a4;
  uint64_t v8 = [v6 query];
  id v9 = [v8 assetType];
  uint64_t v10 = [(DDSManager *)self catalogUpdateDateForAssetType:v9];

  if (v10 && ([v10 timeIntervalSinceNow], v11 > -86400.0))
  {
    id v12 = DefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v6 query];
      id v14 = [v13 assetType];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v26 = v14;
      __int16 v27 = 2112;
      char v28 = v10;
      _os_log_impl(&dword_1E41D6000, v12, OS_LOG_TYPE_DEFAULT, "Catalog is already updated for asset type: %@ at %@, hence skip updating it again", buf, 0x16u);
    }
    int64_t v15 = [(DDSManager *)self assetUpdateStatusForAssertion:v6];
    uint64_t v16 = [(DDSManager *)self tracker];
    [v16 modifyUpdateStatusForAssertion:v6 toStatus:v15];

    v7[2](v7, v15, 0);
  }
  else
  {
    uint64_t v17 = [v6 query];
    long long v18 = [v17 assetType];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__DDSManager_fetchCatalogBasedAssetUpdateStatusForAssertion_callback___block_invoke;
    v20[3] = &unk_1E6E3A968;
    id v21 = v17;
    long long v22 = self;
    id v23 = v6;
    id v24 = v7;
    id v19 = v17;
    [(DDSManager *)self updateCatalogForAssetType:v18 withCompletion:v20];
  }
}

void __70__DDSManager_fetchCatalogBasedAssetUpdateStatusForAssertion_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = DefaultLog();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __70__DDSManager_fetchCatalogBasedAssetUpdateStatusForAssertion_callback___block_invoke_cold_1(v5);
    }

    id v6 = DDSAssetDownloadUIError((void *)1);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) assetType];
      int v12 = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_1E41D6000, v5, OS_LOG_TYPE_DEFAULT, "Catalog updated successfully for asset type: (%{public}@)", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v8 = *(void **)(a1 + 40);
    id v9 = [v8 dataSource];
    uint64_t v10 = [v9 date];
    double v11 = [*(id *)(a1 + 32) assetType];
    [v8 setCatalogUpdateDate:v10 forAssetType:v11];

    [*(id *)(a1 + 40) assetUpdateStatusForAssertion:*(void *)(a1 + 48)];
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)fetchAssetUpdateStatusForQuery:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DDSManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke;
  block[3] = &unk_1E6E39F30;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke(id *a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = DefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1E41D6000, v2, OS_LOG_TYPE_DEFAULT, "Fetch asset update status for query: (%{public}@)", (uint8_t *)&buf, 0xCu);
  }

  id v4 = [a1[5] tracker];
  id v5 = [v4 assertionForQuery:a1[4]];

  if (v5)
  {
    id v6 = [a1[5] tracker];
    uint64_t v7 = [v6 updateStatusForAssertion:v5];

    if (v7 == 2)
    {
      uint64_t v8 = DefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = a1[4];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "Asset update is in progress for query: (%{public}@)", (uint8_t *)&buf, 0xCu);
      }

      (*((void (**)(void))a1[6] + 2))();
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v32 = 0x2020000000;
      uint64_t v33 = 0;
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x2020000000;
      v30[3] = 0;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_295;
      v25[3] = &unk_1E6E3A9B8;
      v25[4] = a1[5];
      id v27 = a1[6];
      p_long long buf = &buf;
      uint64_t v29 = v30;
      id v13 = v5;
      id v26 = v13;
      id v14 = (void *)MEMORY[0x1E4E7D2C0](v25);
      id v15 = a1[5];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_3;
      v22[3] = &unk_1E6E3A9E0;
      id v23 = a1[4];
      id v16 = v14;
      id v24 = v16;
      [v15 fetchCatalogBasedAssetUpdateStatusForAssertion:v13 callback:v22];
      uint64_t v17 = [a1[5] autoAssetQueryForAssertion:v13];
      if (v17)
      {
        long long v18 = [a1[5] autoAssetManager];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_297;
        v19[3] = &unk_1E6E3A9E0;
        id v20 = v17;
        id v21 = v16;
        [v18 fetchAssetUpdateStatusForQuery:v20 callback:v19];
      }
      else
      {
        (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
      }

      _Block_object_dispose(v30, 8);
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    id v10 = DefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_cold_1();
    }

    double v11 = (void (**)(id, void, void *))a1[6];
    id v12 = DDSAssetDownloadUIError(0);
    v11[2](v11, 0, v12);
  }
}

void __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_295(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = objc_initWeak(&location, v6);

  if (v6)
  {
    id v8 = objc_loadWeakRetained(&location);
    id v9 = [v8 workQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_2;
    v10[3] = &unk_1E6E3A990;
    id v11 = v5;
    id v13 = *(id *)(a1 + 48);
    v15[1] = a2;
    long long v14 = *(_OWORD *)(a1 + 56);
    objc_copyWeak(v15, &location);
    id v12 = *(id *)(a1 + 40);
    dispatch_async(v9, v10);

    objc_destroyWeak(v15);
  }
  objc_destroyWeak(&location);
}

uint64_t __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_2(uint64_t result)
{
  v1 = (void *)result;
  if (*(void *)(result + 32))
  {
    id v2 = *(uint64_t (**)(void))(*(void *)(result + 48) + 16);
LABEL_7:
    return v2();
  }
  ++*(void *)(*(void *)(*(void *)(result + 56) + 8) + 24);
  if (*(void *)(result + 80) == 1) {
    *(void *)(*(void *)(*(void *)(result + 64) + 8) + 24) = 1;
  }
  if (*(void *)(*(void *)(*(void *)(result + 56) + 8) + 24) == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(result + 72));
    [WeakRetained modifyAssetUpdateStatusForAssertion:v1[5] status:*(void *)(*(void *)(v1[8] + 8) + 24)];

    id v2 = *(uint64_t (**)(void))(v1[6] + 16);
    goto LABEL_7;
  }
  return result;
}

void __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = DefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 134218242;
    uint64_t v9 = a2;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Catalog based asset update status: (%ld) for query: (%{public}@)", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_297(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = DefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 134218242;
    uint64_t v9 = a2;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Auto asset update status: (%ld) for query: (%{public}@)", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateCatalogBasedAssetForAssertion:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(DDSManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke;
  block[3] = &unk_1E6E39F30;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke(id *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = a1 + 4;
  id v13 = [a1[4] query];
  id v3 = [a1[5] provider];
  uint64_t v11 = [v3 updatableAssetsForAssertion:*v2];

  if ([v11 count])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v27 = 0x3032000000;
    char v28 = __Block_byref_object_copy__5;
    uint64_t v29 = __Block_byref_object_dispose__5;
    id v30 = (id)[v11 mutableCopy];
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    char v24 = 0;
    id v4 = objc_alloc_init(MEMORY[0x1E4F77FE8]);
    [v4 setAllowsCellularAccess:1];
    [v4 setAllowsExpensiveAccess:1];
    [v4 setDiscretionary:0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obuint64_t j = v11;
    uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v9 = [a1[5] provider];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_298;
          v14[3] = &unk_1E6E3AA08;
          v14[4] = a1[5];
          v14[5] = v8;
          p_long long buf = &buf;
          id v15 = v13;
          long long v18 = v23;
          id v16 = a1[6];
          [v9 startDownloadForAsset:v8 withOptions:v4 progress:0 handler:v14];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v5);
    }

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v10 = DefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1E41D6000, v10, OS_LOG_TYPE_DEFAULT, "Assets are already updated for query: (%{public}@)", (uint8_t *)&buf, 0xCu);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
}

void __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_298(uint64_t a1, unint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  id v5 = objc_initWeak(&location, v4);

  if (v4)
  {
    if (a2 <= 0x24 && ((1 << a2) & 0x1000000401) != 0)
    {
      uint64_t v6 = DefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v19 = v7;
        __int16 v20 = 2048;
        unint64_t v21 = a2;
        _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Asset download completed for %{public}@, result: %ld", buf, 0x16u);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) removeObject:*(void *)(a1 + 40)];
    }
    else
    {
      id v13 = DefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_298_cold_2();
      }

      id v14 = DefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_298_cold_1();
      }

      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        uint64_t v15 = *(void *)(a1 + 56);
        id v16 = DDSAssetDownloadUIError((void *)2);
        (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, MEMORY[0x1E4F1CC28], v16);

        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      }
    }
    if (![*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count])
    {
      uint64_t v8 = DefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v19 = v9;
        _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "Asset update completed successfully for query: (%{public}@)", buf, 0xCu);
      }

      id v10 = objc_loadWeakRetained(&location);
      uint64_t v11 = [v10 assetObserver];
      id v12 = [*(id *)(a1 + 48) assetType];
      [v11 notifyObserversAssetsUpdatedForType:v12];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  objc_destroyWeak(&location);
}

- (void)updateAssetForQuery:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(DDSManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__DDSManager_updateAssetForQuery_callback___block_invoke;
  block[3] = &unk_1E6E39F30;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __43__DDSManager_updateAssetForQuery_callback___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) tracker];
  id v3 = [v2 assertionForQuery:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) tracker];
    uint64_t v5 = [v4 updateStatusForAssertion:v3];

    if (v5 == 2)
    {
      id v6 = DefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl(&dword_1E41D6000, v6, OS_LOG_TYPE_DEFAULT, "Asset update is already in progress for query: (%{public}@)", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = DDSAssetDownloadUIError((void *)3);
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, MEMORY[0x1E4F1CC28], v9);
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v32 = 0x2020000000;
      uint64_t v33 = 0;
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x2020000000;
      char v30 = 0;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __43__DDSManager_updateAssetForQuery_callback___block_invoke_299;
      v24[3] = &unk_1E6E3AA58;
      v24[4] = *(void *)(a1 + 32);
      p_long long buf = &buf;
      id v13 = v3;
      id v25 = v13;
      id v26 = *(id *)(a1 + 48);
      char v28 = v29;
      id v14 = (void *)MEMORY[0x1E4E7D2C0](v24);
      uint64_t v15 = *(void **)(a1 + 32);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __43__DDSManager_updateAssetForQuery_callback___block_invoke_3;
      v22[3] = &unk_1E6E39FD0;
      id v16 = v14;
      id v23 = v16;
      [v15 updateCatalogBasedAssetForAssertion:v13 callback:v22];
      uint64_t v17 = [*(id *)(a1 + 32) autoAssetQueryForAssertion:v13];
      if (v17)
      {
        long long v18 = [*(id *)(a1 + 32) autoAssetManager];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __43__DDSManager_updateAssetForQuery_callback___block_invoke_4;
        v20[3] = &unk_1E6E39FD0;
        id v21 = v16;
        [v18 updateAssetForQuery:v17 callback:v20];
      }
      else
      {
        (*((void (**)(id, void, void))v16 + 2))(v16, MEMORY[0x1E4F1CC38], 0);
      }
      uint64_t v19 = [*(id *)(a1 + 32) tracker];
      [v19 modifyUpdateStatusForAssertion:v13 toStatus:2];

      _Block_object_dispose(v29, 8);
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    id v10 = DefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_cold_1();
    }

    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = DDSAssetDownloadUIError(0);
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, MEMORY[0x1E4F1CC28], v12);
  }
}

void __43__DDSManager_updateAssetForQuery_callback___block_invoke_299(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = objc_initWeak(&location, v7);

  if (v7)
  {
    id v9 = objc_loadWeakRetained(&location);
    id v10 = [v9 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__DDSManager_updateAssetForQuery_callback___block_invoke_2;
    block[3] = &unk_1E6E3AA30;
    id v11 = v5;
    uint64_t v12 = *(void *)(a1 + 56);
    id v16 = v11;
    uint64_t v19 = v12;
    objc_copyWeak(&v21, &location);
    id v17 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    id v18 = v13;
    uint64_t v20 = v14;
    dispatch_async(v10, block);

    objc_destroyWeak(&v21);
  }
  objc_destroyWeak(&location);
}

void __43__DDSManager_updateAssetForQuery_callback___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqual:MEMORY[0x1E4F1CC38]])
  {
    if (++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      id v3 = [WeakRetained tracker];
      [v3 modifyUpdateStatusForAssertion:*(void *)(a1 + 40) toStatus:0];

      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      v4();
    }
  }
  else if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 72));
    id v6 = [v5 tracker];
    [v6 modifyUpdateStatusForAssertion:*(void *)(a1 + 40) toStatus:1];

    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = DDSAssetDownloadUIError((void *)2);
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, MEMORY[0x1E4F1CC28], v8);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

uint64_t __43__DDSManager_updateAssetForQuery_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __43__DDSManager_updateAssetForQuery_callback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (DDSManagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDSManagingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)xpcServiceName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (DDSAssetTracking)tracker
{
  return self->_tracker;
}

- (DDSAssetProviding)provider
{
  return self->_provider;
}

- (DDSAssetObserving)assetObserver
{
  return self->_assetObserver;
}

- (NSMutableDictionary)remoteSyncStateByAssetType
{
  return self->_remoteSyncStateByAssetType;
}

- (NSMutableDictionary)pendingAssertionsToUpdateByAssetType
{
  return self->_pendingAssertionsToUpdateByAssetType;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (DDSManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (DDSMAAutoAssetManager)autoAssetManager
{
  return self->_autoAssetManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoAssetManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_pendingAssertionsToUpdateByAssetType, 0);
  objc_storeStrong((id *)&self->_remoteSyncStateByAssetType, 0);
  objc_storeStrong((id *)&self->_assetObserver, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_xpcServiceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)beginUpdateCycleForAssetType:forced:discretionaryDownload:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1E41D6000, v0, v1, "Unexpected error occured as remote sync state object not found for asset type: %{public}@", v2, v3, v4, v5, v6);
}

void __72__DDSManager_beginUpdateCycleForAssetType_forced_discretionaryDownload___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1E41D6000, log, OS_LOG_TYPE_ERROR, "Update abandoned (due to unexpected welf=nil during update)", v1, 2u);
}

- (void)assertionIDsForClientID:reply:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1E41D6000, v1, OS_LOG_TYPE_DEBUG, "For clientID (%{public}@), found assertion IDs (%{public}@)", v2, 0x16u);
}

void __27__DDSManager_triggerUpdate__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1E41D6000, v0, v1, "Failed to update auto asset for query: %{public}@", v2, v3, v4, v5, v6);
}

void __42__DDSManager_updateAutoAssetForAssetType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_0(&dword_1E41D6000, v0, v1, "Auto asset update for query: %{public}@ completed with error: %{public}@");
}

- (void)assetUpdateStatusForAssertion:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 assertionIdentifiers];
  OUTLINED_FUNCTION_0();
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1E41D6000, a3, OS_LOG_TYPE_DEBUG, "Assertion: (%{public}@), DDSAssetUpdateStatus: (%ld)", v6, 0x16u);
}

void __70__DDSManager_fetchCatalogBasedAssetUpdateStatusForAssertion_callback___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1E41D6000, log, OS_LOG_TYPE_ERROR, "Update catalog request failed", v1, 2u);
}

void __54__DDSManager_fetchAssetUpdateStatusForQuery_callback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1E41D6000, v0, v1, "Assertion not found for query: (%{public}@)", v2, v3, v4, v5, v6);
}

void __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_298_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(&dword_1E41D6000, v0, v1, "Asset update failed for query: (%{public}@)", v2, v3, v4, v5, v6);
}

void __59__DDSManager_updateCatalogBasedAssetForAssertion_callback___block_invoke_298_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_0(&dword_1E41D6000, v0, v1, "Unexpected error downloading asset %{public}@, result: %ld");
}

@end