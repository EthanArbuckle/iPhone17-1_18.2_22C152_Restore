@interface MADVectorDatabaseManager
+ (id)sharedDatabaseWithPhotoLibrary:(id)a3;
+ (id)sharedManager;
+ (void)releaseAllSharedDatabase;
+ (void)releaseSharedDatabaseWithPhotoLibrary:(id)a3;
- (BOOL)readOnly;
- (MADVectorDatabaseManager)init;
- (id)sharedDatabaseWithPhotoLibrary:(id)a3;
- (void)releaseAllSharedDatabase;
- (void)releaseSharedDatabaseWithPhotoLibrary:(id)a3;
- (void)setReadOnly:(BOOL)a3;
@end

@implementation MADVectorDatabaseManager

- (MADVectorDatabaseManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)MADVectorDatabaseManager;
  v2 = [(MADVectorDatabaseManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaanalysis.databasemanager.vector", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    databases = v2->_databases;
    v2->_databases = (NSMutableDictionary *)v6;

    v2->_readOnly = 0;
  }
  return v2;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__MADVectorDatabaseManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MADVectorDatabaseManager sharedManager]::once != -1) {
    dispatch_once(&+[MADVectorDatabaseManager sharedManager]::once, block);
  }
  v2 = (void *)+[MADVectorDatabaseManager sharedManager]::instance;
  return v2;
}

void __41__MADVectorDatabaseManager_sharedManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)+[MADVectorDatabaseManager sharedManager]::instance;
  +[MADVectorDatabaseManager sharedManager]::instance = (uint64_t)v0;
}

- (id)sharedDatabaseWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__MADVectorDatabaseManager_sharedDatabaseWithPhotoLibrary___block_invoke;
  block[3] = &unk_1E62982C0;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __59__MADVectorDatabaseManager_sharedDatabaseWithPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3 = [*(id *)(a1 + 40) photoLibraryURL];
  id v4 = [v3 path];
  uint64_t v5 = [v2 objectForKeyedSubscript:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v8 = (void *)MEMORY[0x1C186D320]();
    uint64_t v9 = +[MADVectorDatabase databaseWithPhotoLibrary:*(void *)(a1 + 40) readyOnly:*(unsigned __int8 *)(*(void *)(a1 + 32) + 24)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v12)
    {
      v13 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v14 = [*(id *)(a1 + 40) photoLibraryURL];
      v15 = [v14 path];
      [v13 setObject:v12 forKeyedSubscript:v15];
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(a1 + 40);
        int v18 = 138412290;
        uint64_t v19 = v17;
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[MADVectorDatabaseManager] Failed to open database for %@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

+ (id)sharedDatabaseWithPhotoLibrary:(id)a3
{
  id v3 = a3;
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled])
  {
    id v4 = [(id)objc_opt_class() sharedManager];
    uint64_t v5 = [v4 sharedDatabaseWithPhotoLibrary:v3];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      uint64_t v6 = VCPLogInstance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEFAULT, "[MADVectorDatabaseManager] Embedding generation disabled, skip vector database creation", v8, 2u);
      }
    }
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)releaseSharedDatabaseWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__MADVectorDatabaseManager_releaseSharedDatabaseWithPhotoLibrary___block_invoke;
  v7[3] = &unk_1E62982E8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __66__MADVectorDatabaseManager_releaseSharedDatabaseWithPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) photoLibraryURL];
  id v3 = [v2 path];
  if (v3)
  {
    id v4 = *(void **)(*(void *)(a1 + 40) + 16);
    uint64_t v5 = [v2 path];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      id v7 = *(void **)(*(void *)(a1 + 40) + 16);
      id v8 = [v2 path];
      [v7 setObject:0 forKeyedSubscript:v8];

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v10 = 138412290;
          v11 = v2;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_INFO, "[MADVectorDatabaseManager] Releasing shared database for %@", (uint8_t *)&v10, 0xCu);
        }
      }
    }
  }
}

+ (void)releaseSharedDatabaseWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  id v3 = [(id)objc_opt_class() sharedManager];
  [v3 releaseSharedDatabaseWithPhotoLibrary:v4];
}

- (void)releaseAllSharedDatabase
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__MADVectorDatabaseManager_releaseAllSharedDatabase__block_invoke;
  block[3] = &unk_1E6296FF8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __52__MADVectorDatabaseManager_releaseAllSharedDatabase__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

+ (void)releaseAllSharedDatabase
{
  id v2 = [(id)objc_opt_class() sharedManager];
  [v2 releaseAllSharedDatabase];
}

- (BOOL)readOnly
{
  return self->_readOnly;
}

- (void)setReadOnly:(BOOL)a3
{
  self->_readOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databases, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end