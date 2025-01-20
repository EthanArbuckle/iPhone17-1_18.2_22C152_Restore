@interface LDCMMobileAssetManager
- (BOOL)supportsCompatabilityVersion:(int)a3;
- (LDCMMobileAssetManager)init;
- (LDCMMobileAssetManagerDelegate)delegate;
- (OS_dispatch_queue)assetManagerQueue;
- (OS_dispatch_source)timer;
- (int)lastProcessedAssetVersion;
- (unsigned)queryFrequencySec;
- (unsigned)queryFrequencyToleranceSec;
- (unsigned)retryQueryFrequencySec;
- (unsigned)retryQueryFrequencyToleranceSec;
- (void)downloadAsset:(id)a3;
- (void)downloadCatalog;
- (void)processAsset:(id)a3;
- (void)queryMetadata;
- (void)scheduleNextQueryAsRetry:(BOOL)a3;
- (void)setAssetManagerQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastProcessedAssetVersion:(int)a3;
- (void)setQueryFrequencySec:(unsigned int)a3;
- (void)setQueryFrequencyToleranceSec:(unsigned int)a3;
- (void)setRetryQueryFrequencySec:(unsigned int)a3;
- (void)setRetryQueryFrequencyToleranceSec:(unsigned int)a3;
- (void)setTimer:(id)a3;
- (void)updateMetadata;
@end

@implementation LDCMMobileAssetManager

- (LDCMMobileAssetManager)init
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)LDCMMobileAssetManager;
  v2 = [(LDCMMobileAssetManager *)&v23 init];
  if (!v2) {
    return 0;
  }
  v3 = v2;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[LDCMMobileAssetManager init]";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Initializing LDCM Asset Manager", buf, 0xCu);
  }
  v4 = dispatch_get_global_queue(9, 0);
  dispatch_queue_t v5 = dispatch_queue_create_with_target_V2("LDCMAssetManagerQueue", 0, v4);
  assetManagerQueue = v3->_assetManagerQueue;
  v3->_assetManagerQueue = (OS_dispatch_queue *)v5;

  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v3->_assetManagerQueue);
  timer = v3->_timer;
  v3->_timer = (OS_dispatch_source *)v7;

  if (v3->_timer)
  {
    v3->_lastProcessedAssetVersion = 0;
    v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v10 = [(LDCMMobileAssetManager *)v9 integerForKey:@"LDCMAssetQueryFrequency"];
    int v11 = [(LDCMMobileAssetManager *)v9 integerForKey:@"LDCMAssetQueryFrequencyTolerance"];
    int v12 = [(LDCMMobileAssetManager *)v9 integerForKey:@"LDCMAssetRetryQueryFrequency"];
    int v13 = [(LDCMMobileAssetManager *)v9 integerForKey:@"LDCMAssetRetryQueryFrequencyTolerance"];
    if (v10) {
      int v14 = v10;
    }
    else {
      int v14 = 259200;
    }
    if (v11) {
      int v15 = v11;
    }
    else {
      int v15 = 172800;
    }
    v3->_queryFrequencySec = v14;
    v3->_queryFrequencyToleranceSec = v15;
    if (v12) {
      int v16 = v12;
    }
    else {
      int v16 = 86400;
    }
    if (v13) {
      int v17 = v13;
    }
    else {
      int v17 = 86400;
    }
    v3->_retryQueryFrequencySec = v16;
    v3->_retryQueryFrequencyToleranceSec = v17;
    v18 = v3->_timer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __30__LDCMMobileAssetManager_init__block_invoke;
    handler[3] = &unk_1E6B6D688;
    v19 = v3;
    v22 = v19;
    dispatch_source_set_event_handler(v18, handler);
    dispatch_source_set_timer((dispatch_source_t)v3->_timer, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v3->_timer);

    v3 = v9;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __30__LDCMMobileAssetManager_init__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = v1[5];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__LDCMMobileAssetManager_init__block_invoke_2;
  block[3] = &unk_1E6B6D688;
  v4 = v1;
  dispatch_async(v2, block);
}

uint64_t __30__LDCMMobileAssetManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[LDCMMobileAssetManager init]_block_invoke_2";
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s LDCM Asset timer fired, querying metadata", (uint8_t *)&v3, 0xCu);
  }
  return [*(id *)(a1 + 32) queryMetadata];
}

- (void)queryMetadata
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9622000, MEMORY[0x1E4F14500], v0, "%s Failed to query metadata (%ld)", v1, v2, v3, v4, 2u);
}

- (void)downloadCatalog
{
  uint64_t v3 = objc_opt_new();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__LDCMMobileAssetManager_downloadCatalog__block_invoke;
  v4[3] = &unk_1E6B6D970;
  v4[4] = self;
  [MEMORY[0x1E4F77FB0] startCatalogDownload:@"com.apple.MobileAsset.IOAccessoryManager" options:v3 then:v4];
}

void __41__LDCMMobileAssetManager_downloadCatalog__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__LDCMMobileAssetManager_downloadCatalog__block_invoke_2;
  v4[3] = &unk_1E6B6D948;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

uint64_t __41__LDCMMobileAssetManager_downloadCatalog__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  if (*(void *)(a1 + 40))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __41__LDCMMobileAssetManager_downloadCatalog__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    return [*(id *)(a1 + 32) scheduleNextQueryAsRetry:1];
  }
  else
  {
    int v11 = *(void **)(a1 + 32);
    return [v11 updateMetadata];
  }
}

- (void)updateMetadata
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:@"com.apple.MobileAsset.IOAccessoryManager"];
  [v2 setDoNotBlockBeforeFirstUnlock:1];
  [v2 queryMetaDataSync];
  uint64_t v3 = [v2 results];
  if (!v3
    || (uint64_t v4 = (void *)v3,
        [v2 results],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        !v6))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[LDCMMobileAssetManager updateMetadata]";
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s Query had no results", buf, 0xCu);
    }
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v29 = v2;
  id obj = [v2 results];
  uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (!v7)
  {
    v31 = 0;
    uint64_t v32 = 0;
    id v30 = 0;
    goto LABEL_30;
  }
  uint64_t v8 = v7;
  v31 = 0;
  uint64_t v32 = 0;
  id v30 = 0;
  uint64_t v34 = *(void *)v39;
  uint64_t v9 = *MEMORY[0x1E4F77F18];
  uint64_t v10 = *MEMORY[0x1E4F77F20];
  int v11 = MEMORY[0x1E4F14500];
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v39 != v34) {
        objc_enumerationMutation(obj);
      }
      int v13 = *(void **)(*((void *)&v38 + 1) + 8 * v12);
      int v14 = [v13 attributes];
      int v15 = [v14 objectForKeyedSubscript:v9];
      uint64_t v16 = [v15 intValue];

      int v17 = [v13 attributes];
      v18 = [v17 objectForKeyedSubscript:v10];
      int v19 = [v18 intValue];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [v13 state];
        *(_DWORD *)buf = 136315650;
        v43 = "-[LDCMMobileAssetManager updateMetadata]";
        __int16 v44 = 2048;
        *(void *)v45 = v20;
        *(_WORD *)&v45[8] = 1024;
        v46[0] = v19;
        _os_log_impl(&dword_1D9622000, v11, OS_LOG_TYPE_INFO, "%s found asset state:%ld version:%d", buf, 0x1Cu);
      }
      if ([(LDCMMobileAssetManager *)self supportsCompatabilityVersion:v16])
      {
        if ([v13 state] != 2)
        {
          if (SHIDWORD(v32) >= v19) {
            goto LABEL_24;
          }
          v25 = v30;
          id v30 = v13;
          HIDWORD(v32) = v19;
          goto LABEL_23;
        }
        if ((int)v32 >= v19) {
          goto LABEL_24;
        }
        id v21 = v13;
        if (v31)
        {
          v22 = [v31 attributes];
          objc_super v23 = [v22 objectForKeyedSubscript:v10];
          int v24 = [v23 intValue];

          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v43 = "-[LDCMMobileAssetManager updateMetadata]";
            __int16 v44 = 1024;
            *(_DWORD *)v45 = v24;
            _os_log_impl(&dword_1D9622000, v11, OS_LOG_TYPE_INFO, "%s requesting purge of asset version %d", buf, 0x12u);
          }
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __40__LDCMMobileAssetManager_updateMetadata__block_invoke;
          v36[3] = &__block_descriptor_36_e8_v16__0q8l;
          int v37 = v24;
          v25 = v31;
          [v31 purge:v36];
          LODWORD(v32) = v19;
          v31 = v21;
LABEL_23:

          goto LABEL_24;
        }
        v31 = v21;
        LODWORD(v32) = v19;
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v43 = "-[LDCMMobileAssetManager updateMetadata]";
        __int16 v44 = 1024;
        *(_DWORD *)v45 = v19;
        _os_log_impl(&dword_1D9622000, v11, OS_LOG_TYPE_INFO, "%s asset version %d not compatible, skipping", buf, 0x12u);
      }
LABEL_24:
      ++v12;
    }
    while (v8 != v12);
    uint64_t v26 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    uint64_t v8 = v26;
  }
  while (v26);
LABEL_30:

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int lastProcessedAssetVersion = self->_lastProcessedAssetVersion;
    *(_DWORD *)buf = 136315906;
    v43 = "-[LDCMMobileAssetManager updateMetadata]";
    __int16 v44 = 1024;
    *(_DWORD *)v45 = v32;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = HIDWORD(v32);
    LOWORD(v46[0]) = 1024;
    *(_DWORD *)((char *)v46 + 2) = lastProcessedAssetVersion;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s bestInstalledAssetVersion:%d bestNotInstalledAssetVersion:%d _lastProcessedAssetVersion:%d", buf, 0x1Eu);
  }
  int v28 = self->_lastProcessedAssetVersion;
  if ((int)v32 > v28 || SHIDWORD(v32) > v28)
  {
    if (SHIDWORD(v32) >= (int)v32)
    {
      [(LDCMMobileAssetManager *)self downloadAsset:v30];
    }
    else
    {
      [(LDCMMobileAssetManager *)self processAsset:v31];
      self->_int lastProcessedAssetVersion = v32;
    }
  }
}

void __40__LDCMMobileAssetManager_updateMetadata__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __40__LDCMMobileAssetManager_updateMetadata__block_invoke_cold_1(a1, a2);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v4 = *(_DWORD *)(a1 + 32);
    int v5 = 136315394;
    uint64_t v6 = "-[LDCMMobileAssetManager updateMetadata]_block_invoke";
    __int16 v7 = 1024;
    int v8 = v4;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%s purge of asset version %d succeeded", (uint8_t *)&v5, 0x12u);
  }
}

- (void)processAsset:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 getLocalFileUrl];
  int v5 = [v4 URLByAppendingPathComponent:@"LDCMBehavior.plist"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[LDCMMobileAssetManager processAsset:]";
    __int16 v13 = 2112;
    int v14 = v5;
    _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s Attempting to process plist found in %@", buf, 0x16u);
  }
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    id v10 = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5 error:&v10];
    id v8 = v10;

    if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[LDCMMobileAssetManager processAsset:](v8);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained receiveBehaviorDictionary:v7];
  }
}

- (void)downloadAsset:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__LDCMMobileAssetManager_downloadAsset___block_invoke;
  v7[3] = &unk_1E6B6D9B8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  [v6 startDownload:v5 then:v7];
}

uint64_t __40__LDCMMobileAssetManager_downloadAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __40__LDCMMobileAssetManager_downloadAsset___block_invoke_cold_1();
    }
    return [*(id *)(a1 + 40) scheduleNextQueryAsRetry:1];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) attributes];
    int v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F77F20]];
    int v6 = [v5 intValue];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[LDCMMobileAssetManager downloadAsset:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = v6;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s downloaded asset version %d successfully", (uint8_t *)&v7, 0x12u);
    }
    uint64_t result = [*(id *)(a1 + 40) processAsset:*(void *)(a1 + 32)];
    *(_DWORD *)(*(void *)(a1 + 40) + 8) = v6;
  }
  return result;
}

- (void)scheduleNextQueryAsRetry:(BOOL)a3
{
  uint64_t v4 = 12;
  if (a3) {
    uint64_t v4 = 20;
  }
  uint64_t v5 = 16;
  if (a3) {
    uint64_t v5 = 24;
  }
  int v6 = *(_DWORD *)((char *)&self->super.isa + v4);
  uint32_t v7 = arc4random_uniform(*(_DWORD *)((char *)&self->super.isa + v5) + 1);
  timer = self->_timer;
  dispatch_time_t v9 = dispatch_walltime(0, 1000000000 * (v7 + v6));
  dispatch_source_set_timer(timer, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (BOOL)supportsCompatabilityVersion:(int)a3
{
  return a3 == 1;
}

- (LDCMMobileAssetManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LDCMMobileAssetManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)assetManagerQueue
{
  return self->_assetManagerQueue;
}

- (void)setAssetManagerQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (int)lastProcessedAssetVersion
{
  return self->_lastProcessedAssetVersion;
}

- (void)setLastProcessedAssetVersion:(int)a3
{
  self->_int lastProcessedAssetVersion = a3;
}

- (unsigned)queryFrequencySec
{
  return self->_queryFrequencySec;
}

- (void)setQueryFrequencySec:(unsigned int)a3
{
  self->_queryFrequencySec = a3;
}

- (unsigned)queryFrequencyToleranceSec
{
  return self->_queryFrequencyToleranceSec;
}

- (void)setQueryFrequencyToleranceSec:(unsigned int)a3
{
  self->_queryFrequencyToleranceSec = a3;
}

- (unsigned)retryQueryFrequencySec
{
  return self->_retryQueryFrequencySec;
}

- (void)setRetryQueryFrequencySec:(unsigned int)a3
{
  self->_retryQueryFrequencySec = a3;
}

- (unsigned)retryQueryFrequencyToleranceSec
{
  return self->_retryQueryFrequencyToleranceSec;
}

- (void)setRetryQueryFrequencyToleranceSec:(unsigned int)a3
{
  self->_retryQueryFrequencyToleranceSec = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_assetManagerQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __41__LDCMMobileAssetManager_downloadCatalog__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __40__LDCMMobileAssetManager_updateMetadata__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(a1 + 32);
  int v3 = 136315650;
  uint64_t v4 = "-[LDCMMobileAssetManager updateMetadata]_block_invoke";
  __int16 v5 = 1024;
  int v6 = v2;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s purge of asset version %d failed (%ld)", (uint8_t *)&v3, 0x1Cu);
}

- (void)processAsset:(void *)a1 .cold.1(void *a1)
{
  int v6 = [a1 localizedDescription];
  OUTLINED_FUNCTION_1_0(&dword_1D9622000, MEMORY[0x1E4F14500], v1, "%s failed to create behavior dictionary from plist (%@)", v2, v3, v4, v5, 2u);
}

void __40__LDCMMobileAssetManager_downloadAsset___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9622000, MEMORY[0x1E4F14500], v0, "%s Failed to download asset (%ld)", v1, v2, v3, v4, 2u);
}

@end