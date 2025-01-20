@interface AXAssetController
+ (AXAssetController)assetControllerWithPolicy:(id)a3;
+ (AXAssetController)assetControllerWithPolicy:(id)a3 qosClass:(unsigned int)a4;
+ (AXAssetController)assetControllerWithPolicy:(id)a3 qosClass:(unsigned int)a4 shouldRefreshForAssetInstallNotifications:(BOOL)a5;
- (AXAssetPolicy)assetPolicy;
- (BOOL)hasInProgressDownloads;
- (BOOL)isAssetCatalogInstalled;
- (BOOL)shouldRefreshForAssetInstallNotifications;
- (BOOL)userInitiated;
- (OS_dispatch_queue)mobileAssetQueue;
- (id)_initWithAssetPolicy:(id)a3 qosClass:(unsigned int)a4 shouldRefreshForAssetInstallNotifications:(BOOL)a5;
- (id)description;
- (id)refreshAssetsWithAttributesSynchronously:(id)a3 installedOnly:(BOOL)a4;
- (id)refreshInstalledAssetsSynchronously;
- (id)refreshWithoutCatalogUpdateSynchronously;
- (void)_deregisterForNotifications;
- (void)_handleAssetDownloadCompletion:(id)a3 downloadResult:(int64_t)a4;
- (void)_handleAssetProgressUpdate:(id)a3 progressNotification:(id)a4;
- (void)_queue_downloadAssets:(id)a3 successStartBlock:(id)a4 completionBlock:(id)a5;
- (void)_queue_purgeAssets:(id)a3 completion:(id)a4;
- (void)_queue_refreshAssets:(BOOL)a3 completion:(id)a4;
- (void)_queue_updateDownloadPriorityIfNecessary;
- (void)_refreshQueue_refreshAssets:(BOOL)a3 completion:(id)a4;
- (void)_registerForNotifications;
- (void)_replaceCachedAssetsWithAssets:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_updateCatalogWithOverrideTimeout:(id)a3 completion:(id)a4;
- (void)addInProgressAsset:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)downloadAssets:(id)a3 successStartBlock:(id)a4;
- (void)downloadAssets:(id)a3 successStartBlock:(id)a4 completionBlock:(id)a5;
- (void)getCachedAvailableAssets:(id)a3;
- (void)getCachedDownloadedAssets:(id)a3;
- (void)performBlockOnAssetObservers:(id)a3;
- (void)performWithinLock:(id)a3;
- (void)purgeAssets:(id)a3;
- (void)purgeAssets:(id)a3 completion:(id)a4;
- (void)purgeAssetsSynchronously:(id)a3;
- (void)purgeInMemoryCachedAssets;
- (void)refreshAssetsByForceUpdatingCatalog:(BOOL)a3 updatingCatalogIfNeeded:(BOOL)a4;
- (void)refreshAssetsByForceUpdatingCatalog:(BOOL)a3 updatingCatalogIfNeeded:(BOOL)a4 catalogRefreshOverrideTimeout:(id)a5;
- (void)refreshAssetsByForceUpdatingCatalog:(BOOL)a3 updatingCatalogIfNeeded:(BOOL)a4 catalogRefreshOverrideTimeout:(id)a5 completion:(id)a6;
- (void)removeInProgressAsset:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setProductionServerURL;
- (void)setShouldRefreshForAssetInstallNotifications:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
- (void)stopDownloadAsset:(id)a3 completion:(id)a4;
@end

@implementation AXAssetController

uint64_t __60__AXAssetController__refreshQueue_refreshAssets_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshAssets:completion:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_286(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshQueue_refreshAssets:completion:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)_refreshQueue_refreshAssets:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_refreshQueue);
  refreshDispatchTimer = self->_refreshDispatchTimer;
  if (!refreshDispatchTimer)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F48318]);
    v9 = [(AXAssetController *)self mobileAssetQueue];
    v10 = (AXDispatchTimer *)[v8 initWithTargetSerialQueue:v9];
    v11 = self->_refreshDispatchTimer;
    self->_refreshDispatchTimer = v10;

    refreshDispatchTimer = self->_refreshDispatchTimer;
  }
  [(AXDispatchTimer *)refreshDispatchTimer cancel];
  v12 = self->_refreshDispatchTimer;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__AXAssetController__refreshQueue_refreshAssets_completion___block_invoke;
  v14[3] = &unk_1E6C42470;
  BOOL v16 = a3;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  [(AXDispatchTimer *)v12 afterDelay:v14 processBlock:0.0];
}

- (void)_updateCatalogWithOverrideTimeout:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(AXAssetController *)self assetPolicy];
  v9 = objc_msgSend(v8, "downloadOptionsForOperation:userInitiated:", 0, -[AXAssetController userInitiated](self, "userInitiated"));

  if (v6) {
    objc_msgSend(v9, "setTimeoutIntervalForResource:", objc_msgSend(v6, "longValue"));
  }
  v10 = [(AXAssetController *)self assetPolicy];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke;
  v23[3] = &unk_1E6C42698;
  v23[4] = self;
  id v11 = v10;
  id v24 = v11;
  [(AXAssetController *)self performBlockOnAssetObservers:v23];
  v12 = AXLogAssetLoader();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl(&dword_1DC53F000, v12, OS_LOG_TYPE_INFO, "%@: Will update catalog with options: %@", buf, 0x16u);
  }

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  id v13 = (void *)getMAAssetClass_softClass;
  uint64_t v29 = getMAAssetClass_softClass;
  if (!getMAAssetClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getMAAssetClass_block_invoke;
    v31 = &unk_1E6C41EC8;
    v32 = &v26;
    __getMAAssetClass_block_invoke((uint64_t)buf);
    id v13 = (void *)v27[3];
  }
  id v14 = v13;
  _Block_object_dispose(&v26, 8);
  id v15 = [(AXAssetController *)self assetPolicy];
  BOOL v16 = [v15 assetType];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke_324;
  v19[3] = &unk_1E6C426C0;
  objc_copyWeak(&v22, &location);
  v19[4] = self;
  id v17 = v11;
  id v20 = v17;
  id v18 = v7;
  id v21 = v18;
  [v14 startCatalogDownload:v16 options:v9 then:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_queue_refreshAssets:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(AXAssetController *)self mobileAssetQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = AXLogAssetLoader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v49 = self;
    __int16 v50 = 2048;
    uint64_t v51 = v4;
    _os_log_impl(&dword_1DC53F000, v8, OS_LOG_TYPE_INFO, "%@: Will refresh assets. canRefreshCatalog=%ld", buf, 0x16u);
  }

  v9 = [(AXAssetController *)self assetPolicy];
  v10 = (void *)[v9 newAssetQuery];

  id v11 = AXLogAssetLoader();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v49 = self;
    _os_log_impl(&dword_1DC53F000, v11, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Will query for metadata.", buf, 0xCu);
  }

  uint64_t v12 = [v10 queryMetaDataSync];
  uint64_t v20 = v12;
  if (v12 == 5)
  {
    v32 = AXLogAssetLoader();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[AXAssetController _queue_refreshAssets:completion:]((uint64_t)self, v32);
    }

    goto LABEL_16;
  }
  if (v12 != 2)
  {
    if (!v12)
    {
      id v21 = AXLogAssetLoader();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = self;
        _os_log_impl(&dword_1DC53F000, v21, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Metadata query successful", buf, 0xCu);
      }
      id v22 = 0;
LABEL_18:

LABEL_19:
      uint64_t v33 = [v10 results];
      v34 = +[AXAsset assetsFromMAAssets:v33];

      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = (uint64_t)__53__AXAssetController__queue_refreshAssets_completion___block_invoke_319;
      v44[3] = (uint64_t)&unk_1E6C41FC0;
      v44[4] = (uint64_t)self;
      v35 = objc_msgSend(v34, "ax_filteredArrayUsingBlock:", v44);
      v36 = [v35 sortedArrayUsingComparator:&__block_literal_global_321_0];
      v37 = AXLogAssetLoader();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = [v10 results];
        uint64_t v39 = [v38 count];
        uint64_t v40 = [v36 count];
        *(_DWORD *)buf = 138412802;
        v49 = self;
        __int16 v50 = 2048;
        uint64_t v51 = v39;
        __int16 v52 = 2048;
        uint64_t v53 = v40;
        _os_log_impl(&dword_1DC53F000, v37, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Retrieved %ld totals assets. %ld supported assets", buf, 0x20u);
      }
      [(AXAssetController *)self _replaceCachedAssetsWithAssets:v36 error:v22 completion:v6];

      goto LABEL_22;
    }
LABEL_16:
    id v22 = AXAssetMakeErrorForQueryResult(v20, v13, v14, v15, v16, v17, v18, v19, v44[0]);
    id v21 = AXLogAssetLoader();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v43 = [NSNumber numberWithInteger:v20];
      *(_DWORD *)buf = 138412802;
      v49 = self;
      __int16 v50 = 2112;
      uint64_t v51 = (uint64_t)v43;
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v22;
      _os_log_error_impl(&dword_1DC53F000, v21, OS_LOG_TYPE_ERROR, "%@: Refreshing assets. Metadata query failed: queryResult=%@. %@", buf, 0x20u);
    }
    goto LABEL_18;
  }
  v23 = [v10 results];
  BOOL v24 = [v23 count] == 0;

  if (v24)
  {
    id v22 = AXAssetMakeErrorForQueryResult(2, v25, v26, v27, v28, v29, v30, v31, v44[0]);
  }
  else
  {
    id v22 = 0;
  }
  v41 = AXLogAssetLoader();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    -[AXAssetController _queue_refreshAssets:completion:]();
  }

  if (!v4) {
    goto LABEL_19;
  }
  v42 = AXLogAssetLoader();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v49 = self;
    _os_log_impl(&dword_1DC53F000, v42, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Will refresh catalog since XmlNotPresent", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __53__AXAssetController__queue_refreshAssets_completion___block_invoke;
  v45[3] = &unk_1E6C42670;
  objc_copyWeak(&v47, (id *)buf);
  v45[4] = self;
  id v46 = v6;
  [(AXAssetController *)self _updateCatalogWithOverrideTimeout:0 completion:v45];

  objc_destroyWeak(&v47);
  objc_destroyWeak((id *)buf);
LABEL_22:
}

- (OS_dispatch_queue)mobileAssetQueue
{
  return self->_mobileAssetQueue;
}

- (void)_replaceCachedAssetsWithAssets:(id)a3 error:(id)a4 completion:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v24 = a4;
  uint64_t v25 = (void (**)(id, void *, id))a5;
  objc_initWeak(&location, self);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
        uint64_t v13 = [(AXAssetController *)self assetPolicy];
        int v14 = [v13 shouldCopyLocally];

        if (v14) {
          [v12 copyLocally];
        }
        if ([v12 isDownloading])
        {
          objc_initWeak((id *)from, v12);
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke;
          v32[3] = &unk_1E6C425F8;
          objc_copyWeak(&v33, (id *)from);
          objc_copyWeak(&v34, &location);
          [v12 attachProgressHandlerIfNeeded:v32];
          objc_destroyWeak(&v34);
          objc_destroyWeak(&v33);
          objc_destroyWeak((id *)from);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v9);
  }

  uint64_t v15 = AXLogAssetLoader();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [obj count];
    *(_DWORD *)from = 138412546;
    *(void *)&from[4] = self;
    __int16 v41 = 2048;
    uint64_t v42 = v16;
    _os_log_impl(&dword_1DC53F000, v15, OS_LOG_TYPE_INFO, "%@: Replacing cached assets with %ld items", from, 0x16u);
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke_309;
  v30[3] = &unk_1E6C420B8;
  v30[4] = self;
  id v17 = obj;
  id v31 = v17;
  [(AXAssetController *)self performWithinLock:v30];
  uint64_t v18 = +[AXAssetMetadataStore store];
  uint64_t v19 = [(AXAssetController *)self assetPolicy];
  uint64_t v20 = [v19 assetType];
  [v18 recordInstalledAssets:v17 forAssetType:v20];

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke_2;
  v27[3] = &unk_1E6C42620;
  v27[4] = self;
  id v21 = v17;
  id v28 = v21;
  id v22 = v24;
  id v29 = v22;
  [(AXAssetController *)self performBlockOnAssetObservers:v27];
  if (v25)
  {
    v23 = (void *)[v21 copy];
    v25[2](v25, v23, v22);
  }
  objc_destroyWeak(&location);
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = [(AXAssetController *)self assetPolicy];
  v5 = [v4 assetTypeSuffix];
  id v6 = [v3 stringWithFormat:@"%@<%p>", v5, self];

  return v6;
}

- (AXAssetPolicy)assetPolicy
{
  return self->_assetPolicy;
}

- (void)performBlockOnAssetObservers:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void))a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__AXAssetController_performBlockOnAssetObservers___block_invoke;
  v13[3] = &unk_1E6C425D0;
  v13[4] = self;
  v13[5] = &v14;
  [(AXAssetController *)self performWithinLock:v13];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = (id)v15[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v14, 8);
}

- (void)performWithinLock:(id)a3
{
  if (a3)
  {
    p_assetsLock = &self->_assetsLock;
    BOOL v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_assetsLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_assetsLock);
  }
}

uint64_t __50__AXAssetController_performBlockOnAssetObservers___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) allObjects];
  return MEMORY[0x1F41817F8]();
}

uint64_t __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke_309(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x1F41817F8]();
}

void __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = AXLogAssetLoader();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_2_cold_1(a1, a2, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1DC53F000, v5, OS_LOG_TYPE_INFO, "%@: Did force-update catalog", (uint8_t *)&v8, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained refreshAssetsByForceUpdatingCatalog:0 updatingCatalogIfNeeded:0 catalogRefreshOverrideTimeout:0 completion:*(void *)(a1 + 40)];
}

void __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = MAStringForMADownloadResultSoft(a2);
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 2112;
  long long v12 = v6;
  _os_log_error_impl(&dword_1DC53F000, a3, OS_LOG_TYPE_ERROR, "%@: Force-update catalog failed. Error Code:%ld - %@", (uint8_t *)&v7, 0x20u);
}

void __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke_324(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = AXLogAssetLoader();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = [NSNumber numberWithInteger:a2];
      __int16 v9 = MAStringForMADownloadResultSoft(a2);
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_1DC53F000, v5, OS_LOG_TYPE_INFO, "%@: Catalog download failed: %@ - %@", buf, 0x20u);
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = MAStringForMADownloadResultSoft(a2);
    __int16 v11 = objc_msgSend(v10, "ax_errorWithDomain:description:", @"AXAssetLoader", @"%@", v5);
  }
  else
  {
    if (v6)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1DC53F000, v5, OS_LOG_TYPE_INFO, "%@: Catalog download succeeeded", buf, 0xCu);
    }
    __int16 v11 = 0;
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke_328;
  v15[3] = &unk_1E6C42648;
  v15[4] = WeakRetained;
  id v13 = *(id *)(a1 + 40);
  BOOL v18 = a2 == 0;
  id v16 = v13;
  id v17 = v11;
  id v14 = v11;
  [WeakRetained performBlockOnAssetObservers:v15];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)refreshAssetsByForceUpdatingCatalog:(BOOL)a3 updatingCatalogIfNeeded:(BOOL)a4 catalogRefreshOverrideTimeout:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = AXLogAssetLoader();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = self;
    __int16 v26 = 2048;
    BOOL v27 = v8;
    _os_log_impl(&dword_1DC53F000, v12, OS_LOG_TYPE_INFO, "%@: Asset refresh requested. ForceUpdateCatalog=%ld", buf, 0x16u);
  }

  if (v8)
  {
    id v13 = [(AXAssetController *)self mobileAssetQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke;
    block[3] = &unk_1E6C42448;
    block[4] = self;
    id v14 = &v22;
    id v22 = v10;
    id v23 = v11;
    id v15 = v11;
    dispatch_async(v13, block);
  }
  else
  {
    refreshQueue = self->_refreshQueue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_286;
    v18[3] = &unk_1E6C42470;
    BOOL v20 = a4;
    id v14 = &v19;
    v18[4] = self;
    id v19 = v11;
    id v17 = v11;
    dispatch_async(refreshQueue, v18);
  }
}

- (void)_queue_refreshAssets:completion:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1DC53F000, v1, OS_LOG_TYPE_ERROR, "%@: Refreshing assets. Metadata query failed: XmlNotPresent. %@", v2, 0x16u);
}

void __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __122__AXAssetController_refreshAssetsByForceUpdatingCatalog_updatingCatalogIfNeeded_catalogRefreshOverrideTimeout_completion___block_invoke_2;
  v4[3] = &unk_1E6C42420;
  v4[4] = v2;
  objc_copyWeak(&v6, &location);
  id v5 = *(id *)(a1 + 48);
  [v2 _updateCatalogWithOverrideTimeout:v3 completion:v4];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

+ (AXAssetController)assetControllerWithPolicy:(id)a3
{
  id v3 = a3;
  id v4 = [[AXAssetController alloc] _initWithAssetPolicy:v3 qosClass:33 shouldRefreshForAssetInstallNotifications:1];

  return (AXAssetController *)v4;
}

+ (AXAssetController)assetControllerWithPolicy:(id)a3 qosClass:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [[AXAssetController alloc] _initWithAssetPolicy:v5 qosClass:v4 shouldRefreshForAssetInstallNotifications:1];

  return (AXAssetController *)v6;
}

+ (AXAssetController)assetControllerWithPolicy:(id)a3 qosClass:(unsigned int)a4 shouldRefreshForAssetInstallNotifications:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  id v8 = [[AXAssetController alloc] _initWithAssetPolicy:v7 qosClass:v6 shouldRefreshForAssetInstallNotifications:v5];

  return (AXAssetController *)v8;
}

- (id)_initWithAssetPolicy:(id)a3 qosClass:(unsigned int)a4 shouldRefreshForAssetInstallNotifications:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v36.receiver = self;
  v36.super_class = (Class)AXAssetController;
  id v10 = [(AXAssetController *)&v36 init];
  if (v10)
  {
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10->_notifyToken = -1;
        v10->_assetsLock._os_unfair_lock_opaque = 0;
        objc_storeStrong((id *)&v10->_assetPolicy, a3);
        uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
        observers = v10->_observers;
        v10->_observers = (NSHashTable *)v11;

        uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
        cachedInProgressAssets = v10->_cachedInProgressAssets;
        v10->_cachedInProgressAssets = (NSMutableSet *)v13;

        v10->_shouldRefreshForAssetInstallNotifications = v5;
        id v15 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, 0);
        id v16 = dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

        id v17 = NSString;
        BOOL v18 = [v9 assetTypeSuffix];
        id v19 = [v17 stringWithFormat:@"com.apple.Accessibility.AXAssetController.MobileAssetQueue.%@", v18];

        id v20 = v19;
        dispatch_queue_t v21 = dispatch_queue_create((const char *)[v20 cStringUsingEncoding:4], v16);
        mobileAssetQueue = v10->_mobileAssetQueue;
        v10->_mobileAssetQueue = (OS_dispatch_queue *)v21;

        id v23 = NSString;
        id v24 = [v9 assetTypeSuffix];
        uint64_t v25 = [v23 stringWithFormat:@"com.apple.Accessibility.AXAssetController.RefreshQueue.%@", v24];

        id v26 = v25;
        dispatch_queue_t v27 = dispatch_queue_create((const char *)[v26 cStringUsingEncoding:4], v16);
        refreshQueue = v10->_refreshQueue;
        v10->_refreshQueue = (OS_dispatch_queue *)v27;

        id v29 = v10->_mobileAssetQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __93__AXAssetController__initWithAssetPolicy_qosClass_shouldRefreshForAssetInstallNotifications___block_invoke;
        block[3] = &unk_1E6C42068;
        uint64_t v30 = v10;
        long long v35 = v30;
        dispatch_async(v29, block);
        if (v5) {
          [(AXAssetController *)v30 _registerForNotifications];
        }

        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_14:
        id v31 = 0;
        goto LABEL_15;
      }
      v32 = AXLogAssetLoader();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[AXAssetController _initWithAssetPolicy:qosClass:shouldRefreshForAssetInstallNotifications:]((uint64_t)v9, v32);
      }
    }
    else
    {
      v32 = AXLogAssetLoader();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
        -[AXAssetController _initWithAssetPolicy:qosClass:shouldRefreshForAssetInstallNotifications:](v32);
      }
    }

    goto LABEL_14;
  }
LABEL_7:
  id v31 = v10;
LABEL_15:

  return v31;
}

uint64_t __93__AXAssetController__initWithAssetPolicy_qosClass_shouldRefreshForAssetInstallNotifications___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProductionServerURL];
}

- (void)_registerForNotifications
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken == -1)
  {
    uint64_t v4 = NSString;
    BOOL v5 = [(AXAssetController *)self assetPolicy];
    uint64_t v6 = [v5 assetType];
    id v7 = [v4 stringWithFormat:@"%@.ma.new-asset-installed", v6];

    id v8 = AXLogAssetLoader();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = self;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1DC53F000, v8, OS_LOG_TYPE_INFO, "%@: Registering for asset notifications: %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    id v9 = v7;
    id v10 = (const char *)[v9 UTF8String];
    refreshQueue = self->_refreshQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __46__AXAssetController__registerForNotifications__block_invoke;
    handler[3] = &unk_1E6C423F8;
    objc_copyWeak(&v15, (id *)buf);
    id v12 = v9;
    id v14 = v12;
    notify_register_dispatch(v10, p_notifyToken, refreshQueue, handler);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __46__AXAssetController__registerForNotifications__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = AXLogAssetLoader();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412802;
    id v6 = WeakRetained;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = [WeakRetained shouldRefreshForAssetInstallNotifications];
    _os_log_impl(&dword_1DC53F000, v3, OS_LOG_TYPE_INFO, "%@: Did receive note: '%@'. Will kick off asset refresh: %ld", (uint8_t *)&v5, 0x20u);
  }

  if ([WeakRetained shouldRefreshForAssetInstallNotifications]) {
    objc_msgSend(WeakRetained, "_refreshQueue_refreshAssets:completion:", 0, 0);
  }
}

- (void)_deregisterForNotifications
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_notifyToken != -1)
  {
    id v3 = NSString;
    uint64_t v4 = [(AXAssetController *)self assetPolicy];
    int v5 = [v4 assetType];
    id v6 = [v3 stringWithFormat:@"%@.ma.new-asset-installed", v5];

    __int16 v7 = AXLogAssetLoader();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v9 = self;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1DC53F000, v7, OS_LOG_TYPE_INFO, "%@: Unregistering for asset notifications: %@", buf, 0x16u);
    }

    notify_cancel(self->_notifyToken);
    self->_notifyToken = -1;
  }
}

- (void)dealloc
{
  [(AXAssetController *)self _deregisterForNotifications];
  v3.receiver = self;
  v3.super_class = (Class)AXAssetController;
  [(AXAssetController *)&v3 dealloc];
}

- (void)refreshAssetsByForceUpdatingCatalog:(BOOL)a3 updatingCatalogIfNeeded:(BOOL)a4
{
}

- (void)refreshAssetsByForceUpdatingCatalog:(BOOL)a3 updatingCatalogIfNeeded:(BOOL)a4 catalogRefreshOverrideTimeout:(id)a5
{
}

- (BOOL)isAssetCatalogInstalled
{
  v2 = [(AXAssetController *)self assetPolicy];
  objc_super v3 = (void *)[v2 newAssetQuery];

  LOBYTE(v2) = [v3 queryMetaDataSync] == 0;
  return (char)v2;
}

- (id)refreshAssetsWithAttributesSynchronously:(id)a3 installedOnly:(BOOL)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  __int16 v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  __int16 v7 = [(AXAssetController *)self mobileAssetQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__AXAssetController_refreshAssetsWithAttributesSynchronously_installedOnly___block_invoke;
  v11[3] = &unk_1E6C424B8;
  BOOL v14 = a4;
  v11[4] = self;
  id v12 = v6;
  uint64_t v13 = &v15;
  id v8 = v6;
  dispatch_sync(v7, v11);

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __76__AXAssetController_refreshAssetsWithAttributesSynchronously_installedOnly___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) assetPolicy];
  objc_super v3 = (void *)[v2 newAssetQuery];

  if (*(unsigned char *)(a1 + 56)) {
    [v3 returnTypes:1];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        __int16 v10 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9, (void)v16);
        [v3 addKeyValuePair:v9 with:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  [v3 queryMetaDataSync];
  uint64_t v11 = [v3 results];
  id v12 = +[AXAsset assetsFromMAAssets:v11];

  id v13 = (id)[v12 sortedArrayUsingComparator:&__block_literal_global_6];
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v12;
}

BOOL __76__AXAssetController_refreshAssetsWithAttributesSynchronously_installedOnly___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 contentVersion];
  unint64_t v6 = [v4 contentVersion];

  return v5 > v6;
}

- (id)refreshInstalledAssetsSynchronously
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  __int16 v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  objc_super v3 = [(AXAssetController *)self mobileAssetQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__AXAssetController_refreshInstalledAssetsSynchronously__block_invoke;
  v6[3] = &unk_1E6C424E0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__AXAssetController_refreshInstalledAssetsSynchronously__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assetPolicy];
  id v7 = (id)[v2 newAssetQuery];

  [v7 returnTypes:1];
  [v7 queryMetaDataSync];
  objc_super v3 = [v7 results];
  uint64_t v4 = +[AXAsset assetsFromMAAssets:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)refreshWithoutCatalogUpdateSynchronously
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__2;
  uint64_t v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__AXAssetController_refreshWithoutCatalogUpdateSynchronously__block_invoke;
  v10[3] = &unk_1E6C42508;
  v10[4] = &v11;
  objc_super v3 = (void *)MEMORY[0x1E019EE50](v10, a2);
  uint64_t v4 = [(AXAssetController *)self mobileAssetQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__AXAssetController_refreshWithoutCatalogUpdateSynchronously__block_invoke_2;
  block[3] = &unk_1E6C42530;
  void block[4] = self;
  id v9 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __61__AXAssetController_refreshWithoutCatalogUpdateSynchronously__block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __61__AXAssetController_refreshWithoutCatalogUpdateSynchronously__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshAssets:completion:", 0, *(void *)(a1 + 40));
}

- (void)stopDownloadAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXAssetController *)self mobileAssetQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__AXAssetController_stopDownloadAsset_completion___block_invoke;
  v11[3] = &unk_1E6C42530;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __50__AXAssetController_stopDownloadAsset_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) maAsset];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__AXAssetController_stopDownloadAsset_completion___block_invoke_2;
  v3[3] = &unk_1E6C42558;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 cancelDownload:v3];
}

uint64_t __50__AXAssetController_stopDownloadAsset_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = AXLogAssetLoader();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [NSNumber numberWithInteger:a2];
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1DC53F000, v4, OS_LOG_TYPE_DEFAULT, "Download cancelled: %@ %@", (uint8_t *)&v8, 0x16u);
  }
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2 == 0);
}

- (void)downloadAssets:(id)a3 successStartBlock:(id)a4
{
}

- (void)downloadAssets:(id)a3 successStartBlock:(id)a4 completionBlock:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v22 = a4;
  id v23 = a5;
  uint64_t v21 = v8;
  if ([v8 count])
  {
    id v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (!v10) {
      goto LABEL_16;
    }
    uint64_t v11 = *(void *)v35;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v13 refreshMAAsset];
        uint64_t v14 = [v13 maAsset];
        BOOL v15 = [v14 state] == 4;

        if (!v15) {
          goto LABEL_13;
        }
        uint64_t v30 = 0;
        id v31 = &v30;
        uint64_t v32 = 0x2020000000;
        char v33 = 0;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __70__AXAssetController_downloadAssets_successStartBlock_completionBlock___block_invoke;
        v29[3] = &unk_1E6C42580;
        v29[5] = v13;
        v29[6] = &v30;
        v29[4] = self;
        [(AXAssetController *)self performWithinLock:v29];
        if (!*((unsigned char *)v31 + 24))
        {
          _Block_object_dispose(&v30, 8);
LABEL_13:
          [v24 addObject:v13];
          continue;
        }
        id v16 = AXLogAssetLoader();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v39 = self;
          __int16 v40 = 2112;
          __int16 v41 = v13;
          _os_log_impl(&dword_1DC53F000, v16, OS_LOG_TYPE_INFO, "%@: Asked to download already-downloading asset. %@", buf, 0x16u);
        }

        _Block_object_dispose(&v30, 8);
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (!v10)
      {
LABEL_16:

        if ([v24 count])
        {
          long long v17 = [(AXAssetController *)self mobileAssetQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __70__AXAssetController_downloadAssets_successStartBlock_completionBlock___block_invoke_303;
          block[3] = &unk_1E6C425A8;
          void block[4] = self;
          id v26 = v24;
          id v27 = v22;
          id v28 = v23;
          dispatch_async(v17, block);
        }
        else
        {
          if (v22) {
            (*((void (**)(id, uint64_t))v22 + 2))(v22, 1);
          }
          if (v23)
          {
            id v20 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXAssetLoader", @"No assets require a new download.");
            (*((void (**)(id, void, void *))v23 + 2))(v23, 0, v20);
          }
        }

        long long v19 = v23;
        goto LABEL_26;
      }
    }
  }
  long long v18 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXAssetLoader", @"No assets passed in to download.");
  long long v19 = v23;
  if (v23) {
    (*((void (**)(id, void, void *))v23 + 2))(v23, 0, v18);
  }

LABEL_26:
}

uint64_t __70__AXAssetController_downloadAssets_successStartBlock_completionBlock___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 32) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __70__AXAssetController_downloadAssets_successStartBlock_completionBlock___block_invoke_303(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_downloadAssets:successStartBlock:completionBlock:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)purgeAssets:(id)a3
{
}

- (void)purgeAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AXAssetController *)self mobileAssetQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__AXAssetController_purgeAssets_completion___block_invoke;
  block[3] = &unk_1E6C42448;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __44__AXAssetController_purgeAssets_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_purgeAssets:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)purgeAssetsSynchronously:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXAssetController *)self mobileAssetQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__AXAssetController_purgeAssetsSynchronously___block_invoke;
  v7[3] = &unk_1E6C420B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __46__AXAssetController_purgeAssetsSynchronously___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_purgeAssets:completion:", *(void *)(a1 + 40), 0);
}

- (void)getCachedAvailableAssets:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x3032000000;
    id v9 = __Block_byref_object_copy__2;
    id v10 = __Block_byref_object_dispose__2;
    id v11 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__AXAssetController_getCachedAvailableAssets___block_invoke;
    v5[3] = &unk_1E6C425D0;
    v5[4] = self;
    v5[5] = &v6;
    [(AXAssetController *)self performWithinLock:v5];
    v4[2](v4, v7[5]);
    _Block_object_dispose(&v6, 8);
  }
}

void __46__AXAssetController_getCachedAvailableAssets___block_invoke(uint64_t a1)
{
}

- (void)getCachedDownloadedAssets:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x3032000000;
    id v9 = __Block_byref_object_copy__2;
    id v10 = __Block_byref_object_dispose__2;
    id v11 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__AXAssetController_getCachedDownloadedAssets___block_invoke;
    v5[3] = &unk_1E6C425D0;
    v5[4] = self;
    v5[5] = &v6;
    [(AXAssetController *)self performWithinLock:v5];
    v4[2](v4, v7[5]);
    _Block_object_dispose(&v6, 8);
  }
}

uint64_t __47__AXAssetController_getCachedDownloadedAssets___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "ax_filteredArrayUsingBlock:", &__block_literal_global_306);
  return MEMORY[0x1F41817F8]();
}

uint64_t __47__AXAssetController_getCachedDownloadedAssets___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28CB8];
  id v3 = a2;
  id v4 = [v2 defaultManager];
  uint64_t v5 = [v3 localURL];

  uint64_t v6 = [v5 path];
  uint64_t v7 = [v4 fileExistsAtPath:v6];

  return v7;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__AXAssetController_addObserver___block_invoke;
  v6[3] = &unk_1E6C420B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AXAssetController *)self performWithinLock:v6];
}

uint64_t __33__AXAssetController_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__AXAssetController_removeObserver___block_invoke;
  v6[3] = &unk_1E6C420B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AXAssetController *)self performWithinLock:v6];
}

uint64_t __36__AXAssetController_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)hasInProgressDownloads
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__AXAssetController_hasInProgressDownloads__block_invoke;
  v4[3] = &unk_1E6C425D0;
  v4[4] = self;
  void v4[5] = &v5;
  [(AXAssetController *)self performWithinLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__AXAssetController_hasInProgressDownloads__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)setUserInitiated:(BOOL)a3
{
  if (self->_userInitiated != a3)
  {
    self->_userInitiated = a3;
    id v4 = [(AXAssetController *)self mobileAssetQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__AXAssetController_setUserInitiated___block_invoke;
    block[3] = &unk_1E6C42068;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __38__AXAssetController_setUserInitiated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateDownloadPriorityIfNecessary");
}

void __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    [v4 _handleAssetProgressUpdate:WeakRetained progressNotification:v5];
  }
}

void __69__AXAssetController__replaceCachedAssetsWithAssets_error_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = (void *)[*(id *)(a1 + 40) copy];
    objc_msgSend(v5, "assetController:didFinishRefreshingAssets:wasSuccessful:error:", v3, v4, *(void *)(a1 + 48) == 0);
  }
}

- (void)addInProgressAsset:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AXLogAssetLoader();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1DC53F000, v5, OS_LOG_TYPE_INFO, "%@: Adding in-progress asset: %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AXAssetController_addInProgressAsset___block_invoke;
  v7[3] = &unk_1E6C420B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AXAssetController *)self performWithinLock:v7];
}

uint64_t __40__AXAssetController_addInProgressAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (void)removeInProgressAsset:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AXLogAssetLoader();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1DC53F000, v5, OS_LOG_TYPE_INFO, "%@: Removing in-progress asset: %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__AXAssetController_removeInProgressAsset___block_invoke;
  v7[3] = &unk_1E6C420B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AXAssetController *)self performWithinLock:v7];
}

uint64_t __43__AXAssetController_removeInProgressAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

- (void)_handleAssetProgressUpdate:(id)a3 progressNotification:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AXLogAssetLoader();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [v7 totalWritten];
    uint64_t v12 = [v7 totalExpected];
    uint64_t v13 = [v7 isStalled];
    [v7 expectedTimeRemaining];
    *(_DWORD *)buf = 138413570;
    long long v19 = self;
    __int16 v20 = 2048;
    uint64_t v21 = v11;
    __int16 v22 = 2048;
    uint64_t v23 = v12;
    __int16 v24 = 2048;
    uint64_t v25 = v13;
    __int16 v26 = 2048;
    uint64_t v27 = v14;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_debug_impl(&dword_1DC53F000, v8, OS_LOG_TYPE_DEBUG, "%@: Asset DL: %lld of %lld bytes. isStalled=%ld. expectedTimeRemaining=%f. %@", buf, 0x3Eu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__AXAssetController__handleAssetProgressUpdate_progressNotification___block_invoke;
  v15[3] = &unk_1E6C42620;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  [(AXAssetController *)self performBlockOnAssetObservers:v15];
}

void __69__AXAssetController__handleAssetProgressUpdate_progressNotification___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 48) totalWritten];
    uint64_t v6 = [*(id *)(a1 + 48) totalExpected];
    uint64_t v7 = [*(id *)(a1 + 48) isStalled];
    [*(id *)(a1 + 48) expectedTimeRemaining];
    objc_msgSend(v8, "assetController:asset:downloadProgressTotalWritten:totalExpected:isStalled:expectedTimeRemaining:", v3, v4, v5, v6, v7);
  }
}

- (void)_handleAssetDownloadCompletion:(id)a3 downloadResult:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 refreshMAAsset];
  [(AXAssetController *)self removeInProgressAsset:v6];
  uint64_t v14 = [(NSMutableSet *)self->_cachedInProgressAssets count];
  if (a4 != 10 && a4)
  {
    long long v18 = AXAssetMakeErrorForDownloadResult(a4, v7, v8, v9, v10, v11, v12, v13, v22[0]);
    long long v19 = AXLogAssetLoader();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v27 = self;
      __int16 v28 = 2048;
      BOOL v29 = v14 != 0;
      __int16 v30 = 2112;
      id v31 = v18;
      __int16 v32 = 2112;
      id v33 = v6;
      _os_log_error_impl(&dword_1DC53F000, v19, OS_LOG_TYPE_ERROR, "%@: DL failed. hasRemainingDownloads=%ld. error=%@. %@", buf, 0x2Au);
    }
  }
  else
  {
    BOOL v15 = AXLogAssetLoader();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = self;
      __int16 v28 = 2048;
      BOOL v29 = v14 != 0;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1DC53F000, v15, OS_LOG_TYPE_INFO, "%@: DL finished. hasRemainingDownloads=%ld. %@", buf, 0x20u);
    }

    id v16 = [(AXAssetController *)self assetPolicy];
    int v17 = [v16 shouldCopyLocally];

    if (v17) {
      [v6 copyLocally];
    }
    long long v18 = 0;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = (uint64_t)__67__AXAssetController__handleAssetDownloadCompletion_downloadResult___block_invoke;
  v22[3] = (uint64_t)&unk_1E6C42648;
  v22[4] = (uint64_t)self;
  id v23 = v6;
  id v24 = v18;
  BOOL v25 = v14 != 0;
  id v20 = v18;
  id v21 = v6;
  [(AXAssetController *)self performBlockOnAssetObservers:v22];
}

void __67__AXAssetController__handleAssetDownloadCompletion_downloadResult___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:", a1[4], a1[5], a1[6] == 0);
  }
}

void __53__AXAssetController__queue_refreshAssets_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = AXLogAssetLoader();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (a2)
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = MAStringForMADownloadResultSoft(a2);
        *(_DWORD *)buf = 138412802;
        uint64_t v22 = v7;
        __int16 v23 = 2048;
        uint64_t v24 = a2;
        __int16 v25 = 2112;
        __int16 v26 = v8;
        _os_log_impl(&dword_1DC53F000, v5, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Catalog refresh failed. result=%ld %@", buf, 0x20u);
      }
      id v16 = AXAssetMakeErrorForDownloadResult(a2, v9, v10, v11, v12, v13, v14, v15, v19[0]);
      [WeakRetained _replaceCachedAssetsWithAssets:0 error:v16 completion:*(void *)(a1 + 40)];
    }
    else
    {
      if (v6)
      {
        uint64_t v17 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v17;
        _os_log_impl(&dword_1DC53F000, v5, OS_LOG_TYPE_INFO, "%@: Refreshing assets. Catalog refresh successful. Will attempt asset refesh again.", buf, 0xCu);
      }

      long long v18 = [WeakRetained mobileAssetQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = (uint64_t)__53__AXAssetController__queue_refreshAssets_completion___block_invoke_318;
      v19[3] = (uint64_t)&unk_1E6C42530;
      v19[4] = (uint64_t)WeakRetained;
      id v20 = *(id *)(a1 + 40);
      dispatch_async(v18, v19);
    }
  }
}

uint64_t __53__AXAssetController__queue_refreshAssets_completion___block_invoke_318(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_refreshAssets:completion:", 0, *(void *)(a1 + 40));
}

uint64_t __53__AXAssetController__queue_refreshAssets_completion___block_invoke_319(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 assetPolicy];
  uint64_t v5 = [v4 isAssetSupported:v3];

  return v5;
}

uint64_t __53__AXAssetController__queue_refreshAssets_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  BOOL v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "contentVersion"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 contentVersion];

  uint64_t v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

void __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assetController:*(void *)(a1 + 32) willUpdateCatalogForPolicy:*(void *)(a1 + 40)];
  }
}

void __66__AXAssetController__updateCatalogWithOverrideTimeout_completion___block_invoke_328(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assetController:*(void *)(a1 + 32) didUpdateCatalogForPolicy:*(void *)(a1 + 40) wasSuccessful:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
  }
}

- (void)_queue_downloadAssets:(id)a3 successStartBlock:(id)a4 completionBlock:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v33 = (void (**)(id, void))a4;
  val = self;
  long long v38 = (void (**)(id, void, void *))a5;
  uint64_t v9 = [(AXAssetController *)self mobileAssetQueue];
  dispatch_assert_queue_V2(v9);

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v52;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [*(id *)(*((void *)&v51 + 1) + 8 * i) maAsset];
        id location = 0;
        if (([v13 spaceCheck:&location] & 1) == 0)
        {
          uint64_t v27 = AXLogAssetLoader();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            __int16 v32 = [NSNumber numberWithLongLong:location];
            *(_DWORD *)buf = 138412802;
            v57 = self;
            __int16 v58 = 2112;
            v59 = v13;
            __int16 v60 = 2112;
            uint64_t v61 = (uint64_t)v32;
            _os_log_error_impl(&dword_1DC53F000, v27, OS_LOG_TYPE_ERROR, "%@: DL failed. not enough disk space for asset. %@. diskSpaceRequired=%@", buf, 0x20u);
          }
          __int16 v28 = NSString;
          BOOL v29 = [NSNumber numberWithLongLong:location];
          __int16 v30 = [v28 stringWithFormat:@"not enough disk space for asset: %@, required disk space: %@ bytes", v13, v29];

          if (v33) {
            v33[2](v33, 0);
          }
          if (v38)
          {
            id v31 = objc_msgSend(MEMORY[0x1E4F28C58], "ax_errorWithDomain:description:", @"AXAssetLoader", @"%@", v30);
            v38[2](v38, 0, v31);
          }
          __int16 v26 = obj;
          goto LABEL_28;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v51 objects:v62 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = +[AXAssetMetadataStore store];
  uint64_t v15 = [(AXAssetController *)self assetPolicy];
  id v16 = [v15 assetType];
  [v14 recordAssetsToBeDownloaded:obj forAssetType:v16];

  uint64_t v17 = [(AXAssetController *)self assetPolicy];
  uint64_t v36 = objc_msgSend(v17, "downloadOptionsForOperation:userInitiated:", 1, -[AXAssetController userInitiated](self, "userInitiated"));

  long long v18 = AXLogAssetLoader();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    long long v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
    *(_DWORD *)buf = 138412802;
    v57 = self;
    __int16 v58 = 2112;
    v59 = v19;
    __int16 v60 = 2112;
    uint64_t v61 = v36;
    _os_log_impl(&dword_1DC53F000, v18, OS_LOG_TYPE_INFO, "%@: Will download %@ assets with options: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = obj;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v21)
  {
    uint64_t v35 = *(void *)v47;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v47 != v35) {
          objc_enumerationMutation(v20);
        }
        __int16 v23 = *(void **)(*((void *)&v46 + 1) + 8 * j);
        [(AXAssetController *)val _handleAssetDownloadStarted:v23];
        uint64_t v24 = [v23 maAsset];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __77__AXAssetController__queue_downloadAssets_successStartBlock_completionBlock___block_invoke;
        v42[3] = &unk_1E6C426E8;
        objc_copyWeak(&v45, (id *)buf);
        v42[4] = v23;
        uint64_t v44 = v38;
        id v25 = v20;
        id v43 = v25;
        [v24 startDownload:v36 then:v42];
        objc_initWeak(&location, v23);
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __77__AXAssetController__queue_downloadAssets_successStartBlock_completionBlock___block_invoke_2;
        v39[3] = &unk_1E6C425F8;
        objc_copyWeak(&v40, &location);
        objc_copyWeak(&v41, (id *)buf);
        [v23 attachProgressHandlerIfNeeded:v39];
        objc_destroyWeak(&v41);
        objc_destroyWeak(&v40);
        objc_destroyWeak(&location);

        objc_destroyWeak(&v45);
      }
      uint64_t v21 = [v25 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v21);
  }

  if (v33) {
    ((void (*)(void))v33[2])();
  }
  objc_destroyWeak((id *)buf);
  __int16 v26 = (void *)v36;
LABEL_28:
}

void __77__AXAssetController__queue_downloadAssets_successStartBlock_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleAssetDownloadCompletion:*(void *)(a1 + 32) downloadResult:a2];

  if (*(void *)(a1 + 48))
  {
    id v6 = objc_loadWeakRetained(v4);
    char v7 = [v6 hasInProgressDownloads];

    if ((v7 & 1) == 0)
    {
      id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      v8();
    }
  }
}

void __77__AXAssetController__queue_downloadAssets_successStartBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 40));
    [v4 _handleAssetProgressUpdate:WeakRetained progressNotification:v5];
  }
}

- (void)_queue_purgeAssets:(id)a3 completion:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v38 = (void (**)(id, id, id))a4;
  char v7 = [(AXAssetController *)self mobileAssetQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = +[AXAssetMetadataStore store];
  uint64_t v9 = [(AXAssetController *)self assetPolicy];
  uint64_t v10 = [v9 assetType];
  [v8 recordAssetsToBePurged:v6 forAssetType:v10];

  uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v16 = [v15 maAsset];
        uint64_t v17 = [v16 purgeSync];
        if (v17 == 3 || v17 == 0)
        {
          __int16 v26 = AXLogAssetLoader();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v15;
            _os_log_impl(&dword_1DC53F000, v26, OS_LOG_TYPE_INFO, "%@: Successfully purged asset: %@", buf, 0x16u);
          }

          uint64_t v27 = 0;
        }
        else
        {
          AXAssetMakeErrorForPurgeResult(v17, v18, v19, v20, v21, v22, v23, v24, v37);
          uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          __int16 v28 = AXLogAssetLoader();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = self;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2112;
            long long v49 = v27;
            _os_log_impl(&dword_1DC53F000, v28, OS_LOG_TYPE_INFO, "%@: Asset purge failed. %@. Error: %@", buf, 0x20u);
          }

          if (v27) {
            [v39 addObject:v27];
          }
        }
        [v15 refreshMAAsset];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v12);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v49 = __Block_byref_object_copy__2;
  __int16 v50 = __Block_byref_object_dispose__2;
  id v51 = 0;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __51__AXAssetController__queue_purgeAssets_completion___block_invoke;
  v43[3] = &unk_1E6C425D0;
  v43[4] = self;
  v43[5] = buf;
  [(AXAssetController *)self performWithinLock:v43];
  __int16 v30 = +[AXAssetMetadataStore store];
  uint64_t v31 = *(void *)(*(void *)&buf[8] + 40);
  __int16 v32 = [(AXAssetController *)self assetPolicy];
  id v33 = [v32 assetType];
  [v30 recordInstalledAssets:v31 forAssetType:v33];

  uint64_t v34 = [v39 firstObject];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __51__AXAssetController__queue_purgeAssets_completion___block_invoke_2;
  v40[3] = &unk_1E6C42620;
  v40[4] = self;
  id v35 = v11;
  id v41 = v35;
  id v36 = v34;
  id v42 = v36;
  [(AXAssetController *)self performBlockOnAssetObservers:v40];
  if (v38) {
    v38[2](v38, v35, v36);
  }

  _Block_object_dispose(buf, 8);
}

uint64_t __51__AXAssetController__queue_purgeAssets_completion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  return MEMORY[0x1F41817F8]();
}

void __51__AXAssetController__queue_purgeAssets_completion___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "assetController:didFinishPurgingAssets:wasSuccessful:error:", a1[4], a1[5], a1[6] == 0);
  }
}

- (void)_queue_updateDownloadPriorityIfNecessary
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  char v2 = [(AXAssetController *)self mobileAssetQueue];
  dispatch_assert_queue_V2(v2);

  uint64_t v27 = 0;
  __int16 v28 = &v27;
  uint64_t v29 = 0x2050000000;
  id v3 = (void *)getMADownloadConfigClass_softClass;
  uint64_t v30 = getMADownloadConfigClass_softClass;
  if (!getMADownloadConfigClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = (uint64_t)__getMADownloadConfigClass_block_invoke;
    uint64_t v24 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6C41EC8;
    id v25 = (void (*)(uint64_t))&v27;
    __getMADownloadConfigClass_block_invoke((uint64_t)&v21);
    id v3 = (void *)v28[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v27, 8);
  id v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setDiscretionary:", -[AXAssetController userInitiated](self, "userInitiated") ^ 1);
  uint64_t v21 = 0;
  uint64_t v22 = (uint64_t)&v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__2;
  id v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__AXAssetController__queue_updateDownloadPriorityIfNecessary__block_invoke;
  v20[3] = &unk_1E6C425D0;
  v20[4] = self;
  v20[5] = &v21;
  [(AXAssetController *)self performWithinLock:v20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = *(id *)(v22 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v10 maAsset];
        BOOL v12 = [v11 state] == 4;

        if (v12)
        {
          uint64_t v13 = [v10 maAsset];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __61__AXAssetController__queue_updateDownloadPriorityIfNecessary__block_invoke_2;
          v15[3] = &unk_1E6C42710;
          v15[4] = self;
          void v15[5] = v10;
          [v13 configDownload:v5 completion:v15];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v31 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v21, 8);
}

uint64_t __61__AXAssetController__queue_updateDownloadPriorityIfNecessary__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) allObjects];
  return MEMORY[0x1F41817F8]();
}

void __61__AXAssetController__queue_updateDownloadPriorityIfNecessary__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = AXLogAssetLoader();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = a2 == 0;
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = [NSNumber numberWithBool:v5];
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1DC53F000, v4, OS_LOG_TYPE_INFO, "%@: Updated download priority for asset: %@, success=%@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)purgeInMemoryCachedAssets
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__AXAssetController_purgeInMemoryCachedAssets__block_invoke;
  v2[3] = &unk_1E6C42068;
  v2[4] = self;
  [(AXAssetController *)self performWithinLock:v2];
}

uint64_t __46__AXAssetController_purgeInMemoryCachedAssets__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  id v4 = *(void **)(*(void *)(a1 + 32) + 32);
  return [v4 removeAllObjects];
}

- (void)setProductionServerURL
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v29 = [(AXAssetController *)self assetPolicy];
  if ([v29 shouldUseProductionServerForInternalBuilds])
  {
    has_internal_uuint64_t i = os_variant_has_internal_ui();

    if (!has_internal_ui) {
      return;
    }
    id v4 = [(AXAssetController *)self assetPolicy];
    [v4 assetType];
    id v30 = 0;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v6 = (void (*)(id, id *))getASServerURLForAssetTypeSymbolLoc_ptr_0;
    uint64_t v34 = getASServerURLForAssetTypeSymbolLoc_ptr_0;
    if (!getASServerURLForAssetTypeSymbolLoc_ptr_0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getASServerURLForAssetTypeSymbolLoc_block_invoke_0;
      id v36 = &unk_1E6C41EC8;
      uint64_t v37 = &v31;
      uint64_t v7 = (void *)MobileAssetLibrary_2();
      uint64_t v8 = dlsym(v7, "ASServerURLForAssetType");
      *(void *)(v37[1] + 24) = v8;
      getASServerURLForAssetTypeSymbolLoc_ptr_0 = *(_UNKNOWN **)(v37[1] + 24);
      uint64_t v6 = (void (*)(id, id *))v32[3];
    }
    _Block_object_dispose(&v31, 8);
    if (v6)
    {
      int v9 = v6(v5, &v30);

      id v10 = v30;
      if (v10)
      {
        __int16 v11 = AXLogAssetLoader();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = [(AXAssetController *)self assetPolicy];
          __int16 v13 = [v12 assetType];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v13;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v10;
          _os_log_impl(&dword_1DC53F000, v11, OS_LOG_TYPE_DEFAULT, "Unable to retrieve asset URL for policy %@. %@", buf, 0x16u);
        }
      }
      uint64_t v14 = [v9 absoluteString];
      char v15 = [v14 isEqualToString:@"https://mesu.apple.com/assets/"];

      if (v15)
      {
        long long v16 = AXLogAssetLoader();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          long long v17 = [(AXAssetController *)self assetPolicy];
          long long v18 = [v17 assetType];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v18;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl(&dword_1DC53F000, v16, OS_LOG_TYPE_DEFAULT, "%@ is already set to mesu URL %@", buf, 0x16u);
        }
LABEL_22:

        return;
      }
      long long v19 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://mesu.apple.com/assets/"];
      uint64_t v20 = [(AXAssetController *)self assetPolicy];
      uint64_t v21 = [v20 assetType];
      long long v16 = v19;
      id v22 = v21;
      uint64_t v31 = 0;
      uint64_t v32 = &v31;
      uint64_t v33 = 0x2020000000;
      uint64_t v23 = (void (*)(NSObject *, id))getASSetAssetServerURLForAssetTypeSymbolLoc_ptr;
      uint64_t v34 = getASSetAssetServerURLForAssetTypeSymbolLoc_ptr;
      if (!getASSetAssetServerURLForAssetTypeSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getASSetAssetServerURLForAssetTypeSymbolLoc_block_invoke;
        id v36 = &unk_1E6C41EC8;
        uint64_t v37 = &v31;
        uint64_t v24 = (void *)MobileAssetLibrary_2();
        id v25 = dlsym(v24, "ASSetAssetServerURLForAssetType");
        *(void *)(v37[1] + 24) = v25;
        getASSetAssetServerURLForAssetTypeSymbolLoc_ptr = *(_UNKNOWN **)(v37[1] + 24);
        uint64_t v23 = (void (*)(NSObject *, id))v32[3];
      }
      _Block_object_dispose(&v31, 8);
      if (v23)
      {
        v23(v16, v22);

        id v26 = AXLogAssetLoader();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v27 = [(AXAssetController *)self assetPolicy];
          __int16 v28 = [v27 assetType];
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v28;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2112;
          id v36 = v9;
          _os_log_impl(&dword_1DC53F000, v26, OS_LOG_TYPE_DEFAULT, "Setting %@ server URL to mesu: %@ from :%@", buf, 0x20u);
        }
        goto LABEL_22;
      }
      -[AXAudiogramIngestionAssetPolicy init]();
    }
    else
    {
      -[AXAudiogramIngestionAssetPolicy init]();
    }
    __break(1u);
  }
}

- (BOOL)shouldRefreshForAssetInstallNotifications
{
  return self->_shouldRefreshForAssetInstallNotifications;
}

- (void)setShouldRefreshForAssetInstallNotifications:(BOOL)a3
{
  self->_shouldRefreshForAssetInstallNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetQueue, 0);
  objc_storeStrong((id *)&self->_assetPolicy, 0);
  objc_storeStrong((id *)&self->_refreshDispatchTimer, 0);
  objc_storeStrong((id *)&self->_refreshQueue, 0);
  objc_storeStrong((id *)&self->_cachedInProgressAssets, 0);
  objc_storeStrong((id *)&self->_cachedAvailableAssets, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_initWithAssetPolicy:(os_log_t)log qosClass:shouldRefreshForAssetInstallNotifications:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl(&dword_1DC53F000, log, OS_LOG_TYPE_FAULT, "Attempted to create an asset controller with nil policy", v1, 2u);
}

- (void)_initWithAssetPolicy:(uint64_t)a1 qosClass:(NSObject *)a2 shouldRefreshForAssetInstallNotifications:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_0_0();
  uint64_t v7 = a1;
  _os_log_fault_impl(&dword_1DC53F000, a2, OS_LOG_TYPE_FAULT, "Received unexpected asset policy of type (%@): %@", v6, 0x16u);
}

- (void)_queue_refreshAssets:(uint64_t)a1 completion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC53F000, a2, OS_LOG_TYPE_ERROR, "%@: Refreshing assets. Metadata query failed: Process not entitled for MobileAsset", (uint8_t *)&v2, 0xCu);
}

@end