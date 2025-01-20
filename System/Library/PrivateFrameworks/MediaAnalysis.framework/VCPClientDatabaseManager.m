@interface VCPClientDatabaseManager
+ (id)sharedDatabaseForPhotoLibrary:(id)a3;
+ (id)sharedDatabaseForPhotoLibraryURL:(id)a3;
+ (id)sharedDatabaseManager;
- (VCPClientDatabaseManager)init;
- (id)sharedDatabaseForPhotoLibrary:(id)a3;
- (id)sharedDatabaseForPhotoLibraryURL:(id)a3;
@end

@implementation VCPClientDatabaseManager

- (VCPClientDatabaseManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPClientDatabaseManager;
  v2 = [(VCPClientDatabaseManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaanalysis.VCPClientDatabaseManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    databases = v2->_databases;
    v2->_databases = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)sharedDatabaseManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__VCPClientDatabaseManager_sharedDatabaseManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDatabaseManager_once != -1) {
    dispatch_once(&sharedDatabaseManager_once, block);
  }
  v2 = (void *)sharedDatabaseManager_instance;
  return v2;
}

void __49__VCPClientDatabaseManager_sharedDatabaseManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedDatabaseManager_instance;
  sharedDatabaseManager_instance = (uint64_t)v0;
}

- (id)sharedDatabaseForPhotoLibrary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  id v21 = 0;
  if (v4) {
    [v4 photoLibraryURL];
  }
  else {
  v6 = objc_msgSend(MEMORY[0x1E4F39220], "vcp_defaultURL");
  }
  v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__VCPClientDatabaseManager_sharedDatabaseForPhotoLibrary___block_invoke;
    v12[3] = &unk_1E6297768;
    v15 = &v16;
    v12[4] = self;
    id v13 = v6;
    id v14 = v5;
    dispatch_sync(queue, v12);
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEFAULT, "Specified Photo Library has no URL (<%@>); cannot find analysis database",
        buf,
        0xCu);
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __58__VCPClientDatabaseManager_sharedDatabaseForPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v5 = (void *)MEMORY[0x1C186D320]();
    uint64_t v6 = +[VCPDatabaseReader databaseForPhotoLibrary:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    objc_super v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v9)
    {
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [*(id *)(a1 + 40) path];
        int v12 = 138412290;
        id v13 = v11;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "Failed to open analysis database for Photo Library (%@)", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

- (id)sharedDatabaseForPhotoLibraryURL:(id)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__9;
  uint64_t v18 = __Block_byref_object_dispose__9;
  id v19 = 0;
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__VCPClientDatabaseManager_sharedDatabaseForPhotoLibraryURL___block_invoke;
    block[3] = &unk_1E62983B8;
    id v13 = &v14;
    block[4] = self;
    id v12 = v4;
    dispatch_sync(queue, block);
  }
  else if ((int)MediaAnalysisLogLevel() >= 4)
  {
    uint64_t v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEFAULT, "No PhotoLibrary URL received", v10, 2u);
    }
  }
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __61__VCPClientDatabaseManager_sharedDatabaseForPhotoLibraryURL___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = (void *)MEMORY[0x1C186D320]();
    uint64_t v6 = +[VCPDatabaseReader databaseForPhotoLibraryURL:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v9)
    {
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      id v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = [*(id *)(a1 + 40) path];
        int v12 = 138412290;
        id v13 = v11;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_DEFAULT, "Failed to open analysis database for Photo Library (%@)", (uint8_t *)&v12, 0xCu);
      }
    }
  }
}

+ (id)sharedDatabaseForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sharedDatabaseManager];
  uint64_t v5 = [v4 sharedDatabaseForPhotoLibrary:v3];

  return v5;
}

+ (id)sharedDatabaseForPhotoLibraryURL:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sharedDatabaseManager];
  uint64_t v5 = [v4 sharedDatabaseForPhotoLibraryURL:v3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databases, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end