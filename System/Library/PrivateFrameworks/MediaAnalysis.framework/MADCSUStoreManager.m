@interface MADCSUStoreManager
+ (id)sharedCSUStoreManager;
- (MADCSUStoreManager)init;
- (id)sharedCSUStoreForPhotoLibrary:(id)a3;
@end

@implementation MADCSUStoreManager

- (MADCSUStoreManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)MADCSUStoreManager;
  v2 = [(MADCSUStoreManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysisd.MADCSUStoreManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    stores = v2->_stores;
    v2->_stores = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)sharedCSUStoreManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MADCSUStoreManager_sharedCSUStoreManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCSUStoreManager_once != -1) {
    dispatch_once(&sharedCSUStoreManager_once, block);
  }
  v2 = (void *)sharedCSUStoreManager_instance;
  return v2;
}

void __43__MADCSUStoreManager_sharedCSUStoreManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedCSUStoreManager_instance;
  sharedCSUStoreManager_instance = (uint64_t)v0;
}

- (id)sharedCSUStoreForPhotoLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__35;
  v20 = __Block_byref_object_dispose__35;
  id v21 = 0;
  uint64_t v5 = [v4 photoLibraryURL];
  v6 = v5;
  if (v5)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__MADCSUStoreManager_sharedCSUStoreForPhotoLibrary___block_invoke;
    v11[3] = &unk_1E6297768;
    v14 = &v16;
    v11[4] = self;
    id v12 = v5;
    id v13 = v4;
    dispatch_sync(queue, v11);
    id v8 = (id)v17[5];
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[MADCSUStoreManager] Failed to create CSUSearchableKnowledgeObjectStore: no Photo Library URL", buf, 2u);
      }
    }
    id v8 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __52__MADCSUStoreManager_sharedCSUStoreForPhotoLibrary___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v5 = (void *)a1[6];
    id v17 = 0;
    v6 = [v5 urlForApplicationDataFolderIdentifier:13 error:&v17];
    v7 = v17;
    if (v6)
    {
      id v8 = objc_alloc(MEMORY[0x1E4F5D0A8]);
      v9 = [v6 path];
      id v16 = 0;
      uint64_t v10 = [v8 initDB:v9 error:&v16];
      v11 = v16;
      uint64_t v12 = *(void *)(a1[7] + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v10;

      uint64_t v14 = *(void *)(*(void *)(a1[7] + 8) + 40);
      if (v14)
      {
        [*(id *)(a1[4] + 16) setObject:v14 forKeyedSubscript:a1[5]];
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v11;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "[MADCSUStoreManager] Failed to initialize entity store (%@)", buf, 0xCu);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_13:

        return;
      }
      v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v7;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "[MADCSUStoreManager] Failed to retrieve CSU store url from Photos (%@)", buf, 0xCu);
      }
    }

    goto LABEL_13;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stores, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end