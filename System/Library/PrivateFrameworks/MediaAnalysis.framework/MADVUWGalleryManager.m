@interface MADVUWGalleryManager
+ (id)sharedGalleryForPhotoLibrary:(id)a3;
+ (id)sharedGalleryManager;
+ (void)releaseSharedGalleryForPhotoLibrary:(id)a3;
- (MADVUWGalleryManager)init;
- (id)sharedGalleryForPhotoLibrary:(id)a3;
- (void)releaseSharedGalleryForPhotoLibrary:(id)a3;
@end

@implementation MADVUWGalleryManager

- (MADVUWGalleryManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)MADVUWGalleryManager;
  v2 = [(MADVUWGalleryManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysisd.MADVUWGalleryManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    galleries = v2->_galleries;
    v2->_galleries = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)sharedGalleryManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MADVUWGalleryManager_sharedGalleryManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGalleryManager_once != -1) {
    dispatch_once(&sharedGalleryManager_once, block);
  }
  v2 = (void *)sharedGalleryManager_instance;
  return v2;
}

void __44__MADVUWGalleryManager_sharedGalleryManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedGalleryManager_instance;
  sharedGalleryManager_instance = (uint64_t)v0;
}

- (id)sharedGalleryForPhotoLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  uint64_t v5 = [v4 photoLibraryURL];
  v6 = v5;
  if (v5)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__MADVUWGalleryManager_sharedGalleryForPhotoLibrary___block_invoke;
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
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "[MADVUWGalleryManager] Failed to create VUWGallery: no Photo Library URL", buf, 2u);
      }
    }
    id v8 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __53__MADVUWGalleryManager_sharedGalleryForPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 48), "vcp_visionCacheStorageDirectoryURL");
    v6 = [v5 URLByAppendingPathComponent:@"VUIndex.sqlite"];
    if (v6)
    {
      v7 = VCPSignPostLog();
      os_signpost_id_t v8 = os_signpost_id_generate(v7);

      v9 = VCPSignPostLog();
      v10 = v9;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VUWGallery_initWithPath", "", buf, 2u);
      }

      id v21 = 0;
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB4238]) initWithPath:v6 error:&v21];
      id v12 = v21;
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v11;

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
        BOOL v15 = v12 == 0;
      }
      else {
        BOOL v15 = 0;
      }
      if (v15)
      {
        v19 = VCPSignPostLog();
        v20 = v19;
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v20, OS_SIGNPOST_INTERVAL_END, v8, "VUWGallery_initWithPath", "", buf, 2u);
        }

        [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 40)];
      }
      else if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v23 = v17;
          __int16 v24 = 2112;
          v25 = v12;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "[MADVUWGalleryManager] Failed to create VUWGallery with library %@: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
LABEL_22:

        return;
      }
      id v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v18;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "[MADVUWGalleryManager] Failed to create VUWGallery: no VUIndex URL for library %@", buf, 0xCu);
      }
    }

    goto LABEL_22;
  }
}

+ (id)sharedGalleryForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sharedGalleryManager];
  uint64_t v5 = [v4 sharedGalleryForPhotoLibrary:v3];

  return v5;
}

- (void)releaseSharedGalleryForPhotoLibrary:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__MADVUWGalleryManager_releaseSharedGalleryForPhotoLibrary___block_invoke;
  v7[3] = &unk_1E6297790;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __60__MADVUWGalleryManager_releaseSharedGalleryForPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) photoLibraryURL];
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = *(void **)(*(void *)(a1 + 40) + 16);
    uint64_t v5 = [*(id *)(a1 + 32) photoLibraryURL];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      v7 = *(void **)(*(void *)(a1 + 40) + 16);
      id v8 = [*(id *)(a1 + 32) photoLibraryURL];
      [v7 setObject:0 forKeyedSubscript:v8];

      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v9 = VCPLogInstance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v10 = [*(id *)(a1 + 32) photoLibraryURL];
          int v11 = 138412290;
          id v12 = v10;
          _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_INFO, "[MADVUWGalleryManager] Releasing shared gallery for %@", (uint8_t *)&v11, 0xCu);
        }
      }
    }
  }
}

+ (void)releaseSharedGalleryForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sharedGalleryManager];
  [v4 releaseSharedGalleryForPhotoLibrary:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleries, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end