@interface PHSearchIndex
+ (BOOL)_ensureSearchIndexIsReadyToBeQueriedForPhotoLibrary:(id)a3;
- (BOOL)isCheckingIfTheSearchIndexIsReady;
- (NSTimer)searchIndexStatusTimer;
- (PHPhotoLibrary)photoLibrary;
- (PHSearchIndex)init;
- (PHSearchIndex)initWithPhotoLibrary:(id)a3;
- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider;
- (PSIDatabase)_psiSearchIndex;
- (PSIDatabase)psiSearchIndex;
- (PSIDatabase)unverifiedPsiSearchIndex;
- (void)_openQueryConnectionToSearchIndexForPhotoLibrary:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)preWarmSearchIndexSynchronously:(BOOL)a3 completion:(id)a4;
- (void)setIsCheckingIfTheSearchIndexIsReady:(BOOL)a3;
- (void)setSceneTaxonomyProvider:(id)a3;
- (void)setSearchIndexStatusTimer:(id)a3;
- (void)setUnverifiedPsiSearchIndex:(id)a3;
- (void)set_psiSearchIndex:(id)a3;
- (void)startIndexingAndMonitoringSearchIndexStatus;
- (void)stopIndexingAndMonitoringSearchIndexStatus;
@end

@implementation PHSearchIndex

- (PSIDatabase)unverifiedPsiSearchIndex
{
  v3 = [(PHSearchIndex *)self _psiSearchIndex];
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    unverifiedPsiSearchIndex = v6->_unverifiedPsiSearchIndex;
    if (!unverifiedPsiSearchIndex)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F8ACB0]);
      v9 = [(PHSearchIndex *)v6 photoLibrary];
      v10 = [v9 pathManager];
      uint64_t v11 = [v8 initWithPathManager:v10 options:1];
      v12 = v6->_unverifiedPsiSearchIndex;
      v6->_unverifiedPsiSearchIndex = (PSIDatabase *)v11;

      unverifiedPsiSearchIndex = v6->_unverifiedPsiSearchIndex;
    }
    v5 = unverifiedPsiSearchIndex;
    objc_sync_exit(v6);
  }

  return v5;
}

- (PSIDatabase)_psiSearchIndex
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->__psiSearchIndex;
  objc_sync_exit(v2);

  return v3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHSearchIndex)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PHSearchIndex.m", 53, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PHSearchIndex;
  v7 = [(PHSearchIndex *)&v11 init];
  id v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchIndexStatusTimer, 0);
  objc_storeStrong((id *)&self->_unverifiedPsiSearchIndex, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->__psiSearchIndex, 0);
}

- (void)setSearchIndexStatusTimer:(id)a3
{
}

- (NSTimer)searchIndexStatusTimer
{
  return self->_searchIndexStatusTimer;
}

- (void)setUnverifiedPsiSearchIndex:(id)a3
{
}

- (void)setSceneTaxonomyProvider:(id)a3
{
}

- (void)dealloc
{
  [(PHSearchIndex *)self set_psiSearchIndex:0];
  [(PHSearchIndex *)self setUnverifiedPsiSearchIndex:0];
  v3.receiver = self;
  v3.super_class = (Class)PHSearchIndex;
  [(PHSearchIndex *)&v3 dealloc];
}

- (void)stopIndexingAndMonitoringSearchIndexStatus
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    objc_super v3 = [(PHSearchIndex *)self photoLibrary];
    v4 = [v3 photoLibrary];
    v5 = [v4 assetsdClient];
    id v6 = [v5 libraryInternalClient];

    [v6 pauseSearchIndexingWithCompletionHandler:&__block_literal_global_56];
  }
  v7 = [(PHSearchIndex *)self searchIndexStatusTimer];
  id v8 = PLSearchUIQueryGetLog();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_INFO, "Photos Search Index Manager: Will stop monitoring the search indexing status", (uint8_t *)&v11, 2u);
    }

    [v7 invalidate];
    [(PHSearchIndex *)self setSearchIndexStatusTimer:0];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = [(PHSearchIndex *)self _psiSearchIndex];
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Photos Search Index Manager: Requested to stop monitoring indexing status for a search index that is not being monitored %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)startIndexingAndMonitoringSearchIndexStatus
{
  objc_super v3 = [(PHSearchIndex *)self photoLibrary];
  v4 = [v3 photoLibrary];
  v5 = [v4 assetsdClient];
  id v6 = [v5 libraryInternalClient];

  if (_os_feature_enabled_impl())
  {
    v7 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke;
    block[3] = &unk_1E5848578;
    id v22 = v6;
    dispatch_async(v7, block);
  }
  id v8 = [(PHSearchIndex *)self searchIndexStatusTimer];

  if (!v8)
  {
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E4F1CB00];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_3;
    v16[3] = &unk_1E5844470;
    id v17 = v6;
    objc_copyWeak(&v19, &location);
    v18 = self;
    v10 = [v9 scheduledTimerWithTimeInterval:1 repeats:v16 block:10.0];
    [(PHSearchIndex *)self setSearchIndexStatusTimer:v10];
    [v10 fire];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  int v11 = [(PHSearchIndex *)self _psiSearchIndex];
  v12 = dispatch_get_global_queue(17, 0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_6;
  v14[3] = &unk_1E5848578;
  id v15 = v11;
  id v13 = v11;
  dispatch_async(v12, v14);
}

uint64_t __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeSearchIndexingWithCompletionHandler:&__block_literal_global_15896];
}

void __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_4;
  v5[3] = &unk_1E5844448;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v5[4] = *(void *)(a1 + 40);
  [v4 getSearchIndexProgress:v5];
  objc_destroyWeak(&v6);
}

uint64_t __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSearchMetadata];
}

void __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_4(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_5;
  v8[3] = &unk_1E5844420;
  char v9 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v8[4] = WeakRetained;
  v8[5] = v7;
  v8[6] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __60__PHSearchIndex_startIndexingAndMonitoringSearchIndexStatus__block_invoke_5(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v6[0] = @"PHSearchIndexIndexingPausedKey";
    v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    v6[1] = @"PHSearchIndexItemsRemainingKey";
    v7[0] = v2;
    id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    v7[1] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"PHSearchIndexIndexingStatusDidChangeNotification" object:*(void *)(a1 + 40) userInfo:v4];
  }
}

- (void)preWarmSearchIndexSynchronously:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(PHSearchIndex *)self _psiSearchIndex];
  if (v7)
  {
    if (v6) {
      v6[2](v6, v7);
    }
  }
  else if (v4)
  {
    id v8 = objc_opt_class();
    char v9 = [(PHSearchIndex *)self photoLibrary];
    LODWORD(v8) = [v8 _ensureSearchIndexIsReadyToBeQueriedForPhotoLibrary:v9];

    if (v8)
    {
      v10 = [(PHSearchIndex *)self unverifiedPsiSearchIndex];
      int v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v15 = objc_alloc(MEMORY[0x1E4F8ACB0]);
        v16 = [(PHSearchIndex *)self photoLibrary];
        id v17 = [v16 pathManager];
        id v12 = (id)[v15 initWithPathManager:v17 options:1];
      }
      [(PHSearchIndex *)self set_psiSearchIndex:v12];
      if (v6) {
        v6[2](v6, v12);
      }
    }
    else
    {
      v14 = PLSearchUIQueryGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v18[0] = 0;
        _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_INFO, "Unable to establish query connection to PSIDatabase", (uint8_t *)v18, 2u);
      }

      if (v6) {
        v6[2](v6, 0);
      }
    }
  }
  else
  {
    id v13 = [(PHSearchIndex *)self photoLibrary];
    [(PHSearchIndex *)self _openQueryConnectionToSearchIndexForPhotoLibrary:v13 completion:v6];
  }
}

- (void)_openQueryConnectionToSearchIndexForPhotoLibrary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = [(PHSearchIndex *)self _psiSearchIndex];

  if (v8)
  {
    if (v7)
    {
      char v9 = [(PHSearchIndex *)self _psiSearchIndex];
      v7[2](v7, v9);
    }
  }
  else if ([(PHSearchIndex *)self isCheckingIfTheSearchIndexIsReady])
  {
    v10 = PLSearchUIQueryGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_INFO, "Already trying to open search index, subsequent request ignored", (uint8_t *)buf, 2u);
    }

    if (v7) {
      v7[2](v7, 0);
    }
  }
  else
  {
    [(PHSearchIndex *)self setIsCheckingIfTheSearchIndexIsReady:1];
    objc_initWeak(buf, self);
    int v11 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__PHSearchIndex__openQueryConnectionToSearchIndexForPhotoLibrary_completion___block_invoke;
    block[3] = &unk_1E58443F8;
    objc_copyWeak(&v15, buf);
    id v13 = v6;
    v14 = v7;
    dispatch_async(v11, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

void __77__PHSearchIndex__openQueryConnectionToSearchIndexForPhotoLibrary_completion___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = [(id)objc_opt_class() _ensureSearchIndexIsReadyToBeQueriedForPhotoLibrary:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 unverifiedPsiSearchIndex];
    uint64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4F8ACB0]);
      id v12 = [*(id *)(a1 + 32) pathManager];
      id v8 = (id)[v11 initWithPathManager:v12 options:1];
    }
    id v13 = objc_loadWeakRetained(v2);
    objc_msgSend(v13, "set_psiSearchIndex:", v8);

    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(uint64_t, id))(v14 + 16))(v14, v8);
    }
  }
  else
  {
    char v9 = PLSearchUIQueryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_INFO, "Unable to establish query connection to PSIDatabase", v16, 2u);
    }

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
    }
  }
  id v15 = objc_loadWeakRetained(v2);
  [v15 setIsCheckingIfTheSearchIndexIsReady:0];
}

- (PSIDatabase)psiSearchIndex
{
  id v3 = [(PHSearchIndex *)self _psiSearchIndex];

  if (!v3)
  {
    int v4 = [(PHSearchIndex *)self photoLibrary];
    [(PHSearchIndex *)self _openQueryConnectionToSearchIndexForPhotoLibrary:v4 completion:0];
  }

  return [(PHSearchIndex *)self _psiSearchIndex];
}

- (void)set_psiSearchIndex:(id)a3
{
  int v4 = (PSIDatabase *)a3;
  obj = self;
  objc_sync_enter(obj);
  psiSearchIndex = obj->__psiSearchIndex;
  obj->__psiSearchIndex = v4;

  objc_sync_exit(obj);
}

- (BOOL)isCheckingIfTheSearchIndexIsReady
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isCheckingIfTheSearchIndexIsReady = v2->_isCheckingIfTheSearchIndexIsReady;
  objc_sync_exit(v2);

  return isCheckingIfTheSearchIndexIsReady;
}

- (void)setIsCheckingIfTheSearchIndexIsReady:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL isCheckingIfTheSearchIndexIsReady = a3;
  objc_sync_exit(obj);
}

- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider
{
  sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
  if (!sceneTaxonomyProvider)
  {
    int v4 = (PLSearchIndexSceneTaxonomyProvider *)objc_alloc_init(MEMORY[0x1E4F8ABA8]);
    id v5 = self->_sceneTaxonomyProvider;
    self->_sceneTaxonomyProvider = v4;

    sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
  }

  return sceneTaxonomyProvider;
}

- (PHSearchIndex)init
{
  id v3 = PLSearchUIQueryGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_ERROR, "Init unavailable for PHSearchIndex", v5, 2u);
  }

  return 0;
}

+ (BOOL)_ensureSearchIndexIsReadyToBeQueriedForPhotoLibrary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 photoLibrary];
  int v4 = [v3 assetsdClient];
  id v5 = [v4 libraryInternalClient];

  id v15 = 0;
  int v6 = [v5 waitForSearchIndexExistenceWithError:&v15];
  id v7 = v15;
  id v8 = PLSearchUIQueryGetLog();
  char v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Search index exists on disk";
      id v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      uint32_t v13 = 2;
LABEL_6:
      _os_log_impl(&dword_19B043000, v11, v12, v10, buf, v13);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v7;
    uint64_t v10 = "Failed to find search index on disk with error: %@.";
    id v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 12;
    goto LABEL_6;
  }

  return v6;
}

@end