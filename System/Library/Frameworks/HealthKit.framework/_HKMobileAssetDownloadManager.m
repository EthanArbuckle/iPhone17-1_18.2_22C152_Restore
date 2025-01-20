@interface _HKMobileAssetDownloadManager
- (BOOL)shouldAutoDownloadRemoteAssets;
- (BOOL)shouldQueryLocalAssetsFirst;
- (MADownloadOptions)mobileAssetDownloadOptions;
- (NSString)mobileAssetTypeName;
- (_HKMobileAssetDownloadManager)initWithMobileAssetTypeName:(id)a3 queue:(id)a4;
- (id)_errorWithDomain:(id)a3 code:(int64_t)a4;
- (id)_generateAssetQueryFromQueryParams:(id)a3 returnTypes:(int64_t)a4;
- (id)description;
- (id)errorHandler;
- (id)mobileAssetDownloadCompletionHandler;
- (id)unitTesting_queue;
- (int64_t)maxNumberOfRetriesAllowed;
- (int64_t)mobileAssetQueryReturnTypes;
- (void)_callDownloadCompletionHandlerWithAssets:(id)a3 queryParams:(id)a4;
- (void)_callErrorHandlerWithError:(id)a3;
- (void)_queue_downloadAssets:(id)a3 completion:(id)a4;
- (void)_queue_fetchAssetsWithLocalInformation:(BOOL)a3 shouldRequery:(BOOL)a4 queryParams:(id)a5 returnTypes:(int64_t)a6;
- (void)_queue_fetchAssetsWithQuery:(id)a3 onlyLocal:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)downloadAssetsWithQueryParams:(id)a3;
- (void)downloadMobileAssets:(id)a3 completion:(id)a4;
- (void)fetchAssetsWithQueryParams:(id)a3 onlyLocal:(BOOL)a4 completion:(id)a5;
- (void)fetchAssetsWithQueryParams:(id)a3 onlyLocal:(BOOL)a4 returnTypes:(int64_t)a5 completion:(id)a6;
- (void)removeMobileAssets:(id)a3 completion:(id)a4;
- (void)setErrorHandler:(id)a3;
- (void)setMaxNumberOfRetriesAllowed:(int64_t)a3;
- (void)setMobileAssetDownloadCompletionHandler:(id)a3;
- (void)setMobileAssetDownloadOptions:(id)a3;
- (void)setMobileAssetQueryReturnTypes:(int64_t)a3;
- (void)setShouldAutoDownloadRemoteAssets:(BOOL)a3;
- (void)setShouldQueryLocalAssetsFirst:(BOOL)a3;
@end

@implementation _HKMobileAssetDownloadManager

- (_HKMobileAssetDownloadManager)initWithMobileAssetTypeName:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_HKMobileAssetDownloadManager;
  v8 = [(_HKMobileAssetDownloadManager *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    mobileAssetTypeName = v8->_mobileAssetTypeName;
    v8->_mobileAssetTypeName = (NSString *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingOperations = v8->_pendingOperations;
    v8->_pendingOperations = v11;

    *(_WORD *)&v8->_shouldQueryLocalAssetsFirst = 256;
    v8->_maxNumberOfRetriesAllowed = 1;
    objc_storeStrong((id *)&v8->_queue, a4);
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    downloadingQueryParams = v8->_downloadingQueryParams;
    v8->_downloadingQueryParams = v13;

    uint64_t v15 = objc_opt_new();
    mobileAssetDownloadOptions = v8->_mobileAssetDownloadOptions;
    v8->_mobileAssetDownloadOptions = (MADownloadOptions *)v15;

    v8->_mobileAssetQueryReturnTypes = 0;
  }

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_HKMobileAssetDownloadManager;
  [(_HKMobileAssetDownloadManager *)&v4 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p mobileAssetTypeName:\"%@\">", objc_opt_class(), self, self->_mobileAssetTypeName];
}

- (void)downloadAssetsWithQueryParams:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63___HKMobileAssetDownloadManager_downloadAssetsWithQueryParams___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)fetchAssetsWithQueryParams:(id)a3 onlyLocal:(BOOL)a4 completion:(id)a5
{
  [(_HKMobileAssetDownloadManager *)self fetchAssetsWithQueryParams:a3 onlyLocal:a4 returnTypes:self->_mobileAssetQueryReturnTypes completion:a5];
}

- (void)fetchAssetsWithQueryParams:(id)a3 onlyLocal:(BOOL)a4 returnTypes:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93___HKMobileAssetDownloadManager_fetchAssetsWithQueryParams_onlyLocal_returnTypes_completion___block_invoke;
  block[3] = &unk_1E58C8C78;
  block[4] = self;
  id v16 = v10;
  BOOL v19 = a4;
  id v17 = v11;
  int64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

- (void)downloadMobileAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65___HKMobileAssetDownloadManager_downloadMobileAssets_completion___block_invoke;
  block[3] = &unk_1E58BBA78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)removeMobileAssets:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 1;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v26 = [v6 count];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke;
  aBlock[3] = &unk_1E58C8CA0;
  aBlock[4] = self;
  v23 = v25;
  id v8 = v7;
  id v22 = v8;
  v24 = v27;
  id v9 = _Block_copy(aBlock);
  _HKInitializeLogging();
  id v10 = (void *)HKLogMobileAsset;
  if (os_log_type_enabled((os_log_t)HKLogMobileAsset, OS_LOG_TYPE_DEBUG))
  {
    id v11 = v10;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[_HKMobileAssetDownloadManager removeMobileAssets:completion:](buf, [v6 count], v11);
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___HKMobileAssetDownloadManager_removeMobileAssets_completion___block_invoke_291;
  block[3] = &unk_1E58C8CF0;
  id v18 = v9;
  BOOL v19 = v25;
  id v16 = v6;
  id v17 = self;
  v20 = v27;
  id v13 = v9;
  id v14 = v6;
  dispatch_async(queue, block);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

- (void)_queue_fetchAssetsWithQuery:(id)a3 onlyLocal:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__56;
  v24[4] = __Block_byref_object_dispose__56;
  id v25 = 0;
  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  if (v6)
  {
    dispatch_group_leave(v10);
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4F77FB0];
    mobileAssetTypeName = self->_mobileAssetTypeName;
    mobileAssetDownloadOptions = self->_mobileAssetDownloadOptions;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke;
    v21[3] = &unk_1E58C8D18;
    v23 = v24;
    v21[4] = self;
    id v22 = v10;
    [v11 startCatalogDownload:mobileAssetTypeName options:mobileAssetDownloadOptions then:v21];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82___HKMobileAssetDownloadManager__queue_fetchAssetsWithQuery_onlyLocal_completion___block_invoke_2;
  block[3] = &unk_1E58C8D90;
  void block[4] = self;
  id v18 = v8;
  id v19 = v9;
  v20 = v24;
  id v15 = v9;
  id v16 = v8;
  dispatch_group_notify(v10, queue, block);

  _Block_object_dispose(v24, 8);
}

- (void)_queue_fetchAssetsWithLocalInformation:(BOOL)a3 shouldRequery:(BOOL)a4 queryParams:(id)a5 returnTypes:(int64_t)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__56;
  v28[4] = __Block_byref_object_dispose__56;
  id v29 = 0;
  id v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  if (v8)
  {
    dispatch_group_leave(v11);
  }
  else
  {
    BOOL v18 = a4;
    int64_t v12 = a6;
    id v13 = (void *)MEMORY[0x1E4F77FB0];
    mobileAssetTypeName = self->_mobileAssetTypeName;
    mobileAssetDownloadOptions = self->_mobileAssetDownloadOptions;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke;
    void v25[3] = &unk_1E58C8D18;
    v27 = v28;
    v25[4] = self;
    uint64_t v26 = v11;
    [v13 startCatalogDownload:mobileAssetTypeName options:mobileAssetDownloadOptions then:v25];

    a6 = v12;
    a4 = v18;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110___HKMobileAssetDownloadManager__queue_fetchAssetsWithLocalInformation_shouldRequery_queryParams_returnTypes___block_invoke_2;
  block[3] = &unk_1E58C8E30;
  void block[4] = self;
  id v20 = v10;
  v21 = v28;
  int64_t v22 = a6;
  BOOL v23 = a4;
  BOOL v24 = v8;
  id v17 = v10;
  dispatch_group_notify(v11, queue, block);

  _Block_object_dispose(v28, 8);
}

- (void)_queue_downloadAssets:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__56;
  v38[4] = __Block_byref_object_dispose__56;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__56;
  v36[4] = __Block_byref_object_dispose__56;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v35 = [v6 count];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66___HKMobileAssetDownloadManager__queue_downloadAssets_completion___block_invoke;
  aBlock[3] = &unk_1E58C8E58;
  v31 = v34;
  id v17 = v7;
  id v30 = v17;
  v32 = v38;
  v33 = v36;
  id v19 = (void (**)(void))_Block_copy(aBlock);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v40 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * v10);
        int64_t v12 = [_HKMobileAssetDownloadOperation alloc];
        queue = self->_queue;
        mobileAssetDownloadOptions = self->_mobileAssetDownloadOptions;
        int64_t v15 = [(_HKMobileAssetDownloadManager *)self maxNumberOfRetriesAllowed];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __66___HKMobileAssetDownloadManager__queue_downloadAssets_completion___block_invoke_2;
        v20[3] = &unk_1E58C8E80;
        v20[4] = self;
        v20[5] = v11;
        int64_t v22 = v38;
        BOOL v23 = v34;
        BOOL v24 = v36;
        v21 = v19;
        id v16 = [(_HKMobileAssetDownloadOperation *)v12 initWithAsset:v11 queue:queue downloadOptions:mobileAssetDownloadOptions maxNumberOfRetriesAllowed:v15 completion:v20];
        [(NSMutableArray *)self->_pendingOperations addObject:v16];
        [(_HKMobileAssetDownloadOperation *)v16 run];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v40 count:16];
    }
    while (v8);
  }

  v19[2](v19);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(v38, 8);
}

- (id)_generateAssetQueryFromQueryParams:(id)a3 returnTypes:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:self->_mobileAssetTypeName];
  [v7 setDoNotBlockBeforeFirstUnlock:1];
  [v7 returnTypes:a4];
  if (a4 == 1) {
    [v7 setDoNotBlockOnNetworkStatus:1];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v14 = [v8 objectForKeyedSubscript:v13];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        id v16 = [v8 objectForKeyedSubscript:v13];
        objc_opt_class();
        char v17 = objc_opt_isKindOfClass();

        if (isKindOfClass & 1) != 0 || (v17)
        {
          if (isKindOfClass) {
            goto LABEL_11;
          }
        }
        else
        {
          id v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:a2, self, @"_HKMobileAssetDownloadManager.m", 321, @"Invalid parameter not satisfying: %@", @"isString || isArray" object file lineNumber description];

          if (isKindOfClass)
          {
LABEL_11:
            BOOL v18 = [v8 objectForKeyedSubscript:v13];
            [v7 addKeyValuePair:v13 with:v18];
            goto LABEL_14;
          }
        }
        id v20 = (void *)MEMORY[0x1E4F1CA48];
        BOOL v18 = [v8 objectForKeyedSubscript:v13];
        v21 = [v20 arrayWithArray:v18];
        [v7 addKeyValueArray:v13 with:v21];

LABEL_14:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)_callDownloadCompletionHandlerWithAssets:(id)a3 queryParams:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86___HKMobileAssetDownloadManager__callDownloadCompletionHandlerWithAssets_queryParams___block_invoke;
  block[3] = &unk_1E58BB9C8;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)_callErrorHandlerWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60___HKMobileAssetDownloadManager__callErrorHandlerWithError___block_invoke;
  v7[3] = &unk_1E58BBBD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_errorWithDomain:(id)a3 code:(int64_t)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28C58];
  v12[0] = @"Asset Type";
  v12[1] = @"Download Options";
  mobileAssetDownloadOptions = self->_mobileAssetDownloadOptions;
  v13[0] = self->_mobileAssetTypeName;
  v13[1] = mobileAssetDownloadOptions;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a3;
  id v9 = [v7 dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = [v5 errorWithDomain:v8 code:a4 userInfo:v9];

  return v10;
}

- (id)unitTesting_queue
{
  return self->_queue;
}

- (BOOL)shouldQueryLocalAssetsFirst
{
  return self->_shouldQueryLocalAssetsFirst;
}

- (void)setShouldQueryLocalAssetsFirst:(BOOL)a3
{
  self->_shouldQueryLocalAssetsFirst = a3;
}

- (BOOL)shouldAutoDownloadRemoteAssets
{
  return self->_shouldAutoDownloadRemoteAssets;
}

- (void)setShouldAutoDownloadRemoteAssets:(BOOL)a3
{
  self->_shouldAutoDownloadRemoteAssets = a3;
}

- (int64_t)maxNumberOfRetriesAllowed
{
  return self->_maxNumberOfRetriesAllowed;
}

- (void)setMaxNumberOfRetriesAllowed:(int64_t)a3
{
  self->_maxNumberOfRetriesAllowed = a3;
}

- (NSString)mobileAssetTypeName
{
  return self->_mobileAssetTypeName;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (int64_t)mobileAssetQueryReturnTypes
{
  return self->_mobileAssetQueryReturnTypes;
}

- (void)setMobileAssetQueryReturnTypes:(int64_t)a3
{
  self->_mobileAssetQueryReturnTypes = a3;
}

- (MADownloadOptions)mobileAssetDownloadOptions
{
  return self->_mobileAssetDownloadOptions;
}

- (void)setMobileAssetDownloadOptions:(id)a3
{
}

- (id)mobileAssetDownloadCompletionHandler
{
  return self->_mobileAssetDownloadCompletionHandler;
}

- (void)setMobileAssetDownloadCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mobileAssetDownloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_mobileAssetDownloadOptions, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_mobileAssetTypeName, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_downloadingQueryParams, 0);

  objc_storeStrong((id *)&self->_pendingOperations, 0);
}

- (void)removeMobileAssets:(os_log_t)log completion:.cold.1(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl(&dword_19C023000, log, OS_LOG_TYPE_DEBUG, "Beginning purge of %ld assets", buf, 0xCu);
}

@end