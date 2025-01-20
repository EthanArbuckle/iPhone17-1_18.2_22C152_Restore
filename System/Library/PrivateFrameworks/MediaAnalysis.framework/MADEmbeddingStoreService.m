@interface MADEmbeddingStoreService
+ (BOOL)isEntitledForInProcessAccess;
+ (id)allowedClasses;
+ (id)serviceName;
+ (id)sharedService;
+ (void)configureServerInterface:(id)a3;
- (MADEmbeddingStoreService)init;
- (id)connection;
- (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6;
- (id)initInternal;
- (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6;
- (void)checkSandboxExtensionForPhotoLibraryURL:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5;
@end

@implementation MADEmbeddingStoreService

- (MADEmbeddingStoreService)init
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService init] unavialable; please call [MADEmbeddingStoreService service]",
        v5,
        2u);
    }
  }
  return 0;
}

- (id)initInternal
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)MADEmbeddingStoreService;
  v2 = [(MADEmbeddingStoreService *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("MADEmbeddingStoreService.connectionQueue", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("MADEmbeddingStoreService.sandboxQueue", 0);
    sandboxQueue = v2->_sandboxQueue;
    v2->_sandboxQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    sandboxHandles = v2->_sandboxHandles;
    v2->_sandboxHandles = (NSMutableDictionary *)v7;

    v9 = [MEMORY[0x1E4F28F80] processInfo];
    v10 = [v9 processName];

    if (([v10 isEqualToString:@"mediaanalysisd"] & 1) != 0
      || [v10 isEqualToString:@"mediaanalysisd-service"])
    {
      if ((int)MediaAnalysisLogLevel() < 6)
      {
LABEL_13:

        return v2;
      }
      v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v10;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_INFO, "[MADEmbeddingStoreService] calling service from MAD daemon (%@)", buf, 0xCu);
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v12 = VCPLogInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v10;
          _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_INFO, "[MADEmbeddingStoreService] calling service from client process (%@), using read-only vector database", buf, 0xCu);
        }
      }
      v11 = +[MADVectorDatabaseManager sharedManager];
      [v11 setReadOnly:1];
    }

    goto LABEL_13;
  }
  return v2;
}

+ (id)sharedService
{
  if (+[MADEmbeddingStoreService sharedService]::once != -1) {
    dispatch_once(&+[MADEmbeddingStoreService sharedService]::once, &__block_literal_global_23);
  }
  v2 = (void *)+[MADEmbeddingStoreService sharedService]::instance;
  return v2;
}

void __41__MADEmbeddingStoreService_sharedService__block_invoke()
{
  id v0 = [[MADEmbeddingStoreService alloc] initInternal];
  v1 = (void *)+[MADEmbeddingStoreService sharedService]::instance;
  +[MADEmbeddingStoreService sharedService]::instance = (uint64_t)v0;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  dispatch_queue_t v3 = [(NSMutableDictionary *)self->_sandboxHandles allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6) longLongValue];
        sandbox_extension_release();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [(NSXPCConnection *)self->_connection invalidate];
  v7.receiver = self;
  v7.super_class = (Class)MADEmbeddingStoreService;
  [(MADEmbeddingStoreService *)&v7 dealloc];
}

+ (id)serviceName
{
  return @"com.apple.mediaanalysisd.embeddingstore";
}

+ (id)allowedClasses
{
  return 0;
}

+ (void)configureServerInterface:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  uint64_t v6 = [v4 setWithArray:v5];
  [v3 setClasses:v6 forSelector:sel_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_reply_ argumentIndex:0 ofReply:0];

  objc_super v7 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  long long v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  long long v9 = [v7 setWithArray:v8];
  [v3 setClasses:v9 forSelector:sel_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_reply_ argumentIndex:0 ofReply:1];

  long long v10 = (void *)MEMORY[0x1E4F1CAD0];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v12 = [v10 setWithArray:v11];
  [v3 setClasses:v12 forSelector:sel_searchWithEmbeddings_photoLibraryURL_options_reply_ argumentIndex:0 ofReply:0];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_super v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v15 = objc_msgSend(v13, "setWithArray:", v14, v16[0]);
  [v3 setClasses:v15 forSelector:sel_searchWithEmbeddings_photoLibraryURL_options_reply_ argumentIndex:0 ofReply:1];
}

- (id)connection
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__15;
  long long v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MADEmbeddingStoreService_connection__block_invoke;
  v5[3] = &unk_1E6298560;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __38__MADEmbeddingStoreService_connection__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v4 = [(id)objc_opt_class() serviceName];
    uint64_t v5 = [v3 initWithMachServiceName:v4 options:0];
    uint64_t v6 = *(void *)(a1 + 32);
    objc_super v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = v5;

    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 16);
    long long v9 = [[MADEmbeddingStoreServiceProxy alloc] initWithService:*(void *)(a1 + 32)];
    [v8 setExportedObject:v9];

    long long v10 = *(void **)(*(void *)(a1 + 32) + 16);
    id v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F15FD648];
    [v10 setExportedInterface:v11];

    v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1640838];
    [(id)objc_opt_class() configureServerInterface:v12];
    [*(id *)(*(void *)(a1 + 32) + 16) setRemoteObjectInterface:v12];
    [*(id *)(*(void *)(a1 + 32) + 16) setInterruptionHandler:&__block_literal_global_241];
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __38__MADEmbeddingStoreService_connection__block_invoke_242;
    uint64_t v17 = &unk_1E62981D8;
    objc_copyWeak(&v18, &location);
    [v13 setInvalidationHandler:&v14];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "resume", v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

    v2 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __38__MADEmbeddingStoreService_connection__block_invoke_2()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __38__MADEmbeddingStoreService_connection__block_invoke_2_cold_1();
  }
}

void __38__MADEmbeddingStoreService_connection__block_invoke_242(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __38__MADEmbeddingStoreService_connection__block_invoke_242_cold_1();
  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__MADEmbeddingStoreService_connection__block_invoke_243;
    block[3] = &unk_1E6296FF8;
    block[4] = v3;
    dispatch_async(v4, block);
  }
}

void __38__MADEmbeddingStoreService_connection__block_invoke_243(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

+ (BOOL)isEntitledForInProcessAccess
{
  if (+[MADEmbeddingStoreService isEntitledForInProcessAccess]::onceToken != -1) {
    dispatch_once(&+[MADEmbeddingStoreService isEntitledForInProcessAccess]::onceToken, &__block_literal_global_245);
  }
  return +[MADEmbeddingStoreService isEntitledForInProcessAccess]::entitled;
}

const void **__56__MADEmbeddingStoreService_isEntitledForInProcessAccess__block_invoke()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  SecTaskRef v0 = SecTaskCreateFromSelf(0);
  SecTaskRef v7 = v0;
  if (v0)
  {
    CFTypeRef v1 = SecTaskCopyValueForEntitlement(v0, @"com.apple.private.mediaanalysisd.datamanagement.embedding", 0);
    *(void *)cf1 = v1;
    BOOL v3 = v1
      && (CFTypeID v2 = CFGetTypeID(v1), v2 == CFBooleanGetTypeID())
      && CFEqual(*(CFTypeRef *)cf1, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
    +[MADEmbeddingStoreService isEntitledForInProcessAccess]::entitled = v3;
    CF<opaqueCMSampleBuffer *>::~CF((const void **)cf1);
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (+[MADEmbeddingStoreService isEntitledForInProcessAccess]::entitled) {
        uint64_t v5 = "entitled";
      }
      else {
        uint64_t v5 = "NOT entitled";
      }
      *(_DWORD *)cf1 = 136315138;
      *(void *)&cf1[4] = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "Process is %s to access embedding store in-process", cf1, 0xCu);
    }
  }
  return CF<opaqueCMSampleBuffer *>::~CF((const void **)&v7);
}

- (void)checkSandboxExtensionForPhotoLibraryURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  sandboxQueue = self->_sandboxQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke;
  block[3] = &unk_1E6298650;
  block[4] = self;
  id v10 = v6;
  id v11 = a4;
  id v8 = v6;
  dispatch_sync(sandboxQueue, block);
}

void __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke(uint64_t a1)
{
  CFTypeID v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v2)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    id v18 = __Block_byref_object_copy__15;
    v19 = __Block_byref_object_dispose__15;
    id v20 = 0;
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = -1;
    BOOL v3 = [*(id *)(a1 + 32) connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke_2;
    v10[3] = &unk_1E6297F38;
    v10[4] = &v15;
    uint64_t v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v10];
    uint64_t v5 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke_252;
    v9[3] = &unk_1E6298628;
    v9[4] = &v15;
    v9[5] = &v11;
    [v4 requestEmbeddingStoreSandboxExtensionWithPhotoLibraryURL:v5 reply:v9];

    id v6 = (void *)v16[5];
    if (v6)
    {
      **(void **)(a1 + 48) = v6;
    }
    else
    {
      SecTaskRef v7 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];

      if (!v7)
      {
        id v8 = [NSNumber numberWithLongLong:v12[3]];
        [*(id *)(*(void *)(a1 + 32) + 32) setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];
      }
    }
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
  }
}

void __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Error connecting to embedding store service - %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  SecTaskRef v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __74__MADEmbeddingStoreService_checkSandboxExtensionForPhotoLibraryURL_error___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  SecTaskRef v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v15 = [v6 copy];
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    [v5 UTF8String];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sandbox_extension_consume();
    if ((*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) & 0x8000000000000000) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        int v8 = VCPLogInstance();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v18 = 0;
          _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Failed to consume EmbeddingStore directory sandbox extension", v18, 2u);
        }
      }
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v19 = *MEMORY[0x1E4F28568];
      uint64_t v10 = [NSString stringWithFormat:@"[MADEmbeddingStoreService] Failed to consume EmbeddingStore directory sandbox extension"];
      v20[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v12 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v11];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }
}

- (id)fetchEmbeddingsWithAssetUUIDs:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__15;
  v57 = __Block_byref_object_dispose__15;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__15;
  v51 = __Block_byref_object_dispose__15;
  id v52 = 0;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F39220] systemPhotoLibraryURL];
  }
  uint64_t v14 = v13;
  if (![(id)objc_opt_class() isEntitledForInProcessAccess])
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = [v10 count];
        *(_DWORD *)buf = 67109120;
        int v60 = v21;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, "[MADEmbeddingStoreService] Performing XPC embedding fetching for %u assets", buf, 8u);
      }
    }
    v22 = VCPSignPostLog();
    os_signpost_id_t v23 = os_signpost_id_generate(v22);

    v24 = VCPSignPostLog();
    v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "MADEmbeddingStore_XPCFetch", "", buf, 2u);
    }

    v26 = [(MADEmbeddingStoreService *)self connection];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __88__MADEmbeddingStoreService_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_error___block_invoke;
    v44[3] = &unk_1E6297F38;
    v44[4] = &v53;
    v27 = [v26 synchronousRemoteObjectProxyWithErrorHandler:v44];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __88__MADEmbeddingStoreService_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_error___block_invoke_262;
    v43[3] = &unk_1E6297AB0;
    v43[4] = &v47;
    v43[5] = &v53;
    [v27 fetchEmbeddingsWithAssetUUIDs:v10 photoLibraryURL:v14 options:v12 reply:v43];

    v28 = VCPSignPostLog();
    v29 = v28;
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v30 = "MADEmbeddingStore_XPCFetch";
    v31 = v29;
    os_signpost_id_t v32 = v23;
    goto LABEL_28;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = [v10 count];
      *(_DWORD *)buf = 67109120;
      int v60 = v16;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "[MADEmbeddingStoreService] Performing in-process embedding fetching for %u assets", buf, 8u);
    }
  }
  uint64_t v17 = (id *)(v54 + 5);
  id obj = (id)v54[5];
  [(MADEmbeddingStoreService *)self checkSandboxExtensionForPhotoLibraryURL:v14 error:&obj];
  objc_storeStrong(v17, obj);
  id v18 = (void *)v54[5];
  if (v18)
  {
    id v19 = 0;
    if (a6) {
      *a6 = v18;
    }
    goto LABEL_33;
  }
  v33 = VCPSignPostLog();
  os_signpost_id_t v34 = os_signpost_id_generate(v33);

  v35 = VCPSignPostLog();
  v36 = v35;
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "MADEmbeddingStore_InProcessFetch", "", buf, 2u);
  }

  v37 = (id *)(v54 + 5);
  id v45 = (id)v54[5];
  uint64_t v38 = +[MADEmbeddingStore fetchEmbeddingsWithAssetUUIDs:v10 photoLibraryURL:v14 options:v12 error:&v45];
  objc_storeStrong(v37, v45);
  v39 = (void *)v48[5];
  v48[5] = v38;

  v40 = VCPSignPostLog();
  v29 = v40;
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    v30 = "MADEmbeddingStore_InProcessFetch";
    v31 = v29;
    os_signpost_id_t v32 = v34;
LABEL_28:
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v31, OS_SIGNPOST_INTERVAL_END, v32, v30, "", buf, 2u);
  }
LABEL_29:

  if (a6)
  {
    v41 = (void *)v54[5];
    if (v41) {
      *a6 = v41;
    }
  }
  id v19 = (id)v48[5];
LABEL_33:

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v19;
}

void __88__MADEmbeddingStoreService_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Error connecting to embedding store service - %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  SecTaskRef v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __88__MADEmbeddingStoreService_fetchEmbeddingsWithAssetUUIDs_photoLibraryURL_options_error___block_invoke_262(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v7 = [v6 copy];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)searchWithEmbeddings:(id)a3 photoLibraryURL:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__15;
  v57 = __Block_byref_object_dispose__15;
  id v58 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__15;
  v51 = __Block_byref_object_dispose__15;
  id v52 = 0;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F39220] systemPhotoLibraryURL];
  }
  uint64_t v14 = v13;
  if (![(id)objc_opt_class() isEntitledForInProcessAccess])
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v10 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v60 = v21;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, "[MADEmbeddingStoreService] XPC search with %llu embeddings", buf, 0xCu);
      }
    }
    v22 = VCPSignPostLog();
    os_signpost_id_t v23 = os_signpost_id_generate(v22);

    v24 = VCPSignPostLog();
    v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "MADEmbeddingStore_XPCSearch", "", buf, 2u);
    }

    v26 = [(MADEmbeddingStoreService *)self connection];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __79__MADEmbeddingStoreService_searchWithEmbeddings_photoLibraryURL_options_error___block_invoke;
    v44[3] = &unk_1E6297F38;
    v44[4] = &v53;
    v27 = [v26 synchronousRemoteObjectProxyWithErrorHandler:v44];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __79__MADEmbeddingStoreService_searchWithEmbeddings_photoLibraryURL_options_error___block_invoke_266;
    v43[3] = &unk_1E6298678;
    v43[4] = &v47;
    v43[5] = &v53;
    [v27 searchWithEmbeddings:v10 photoLibraryURL:v14 options:v12 reply:v43];

    v28 = VCPSignPostLog();
    v29 = v28;
    if (v23 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v30 = "MADEmbeddingStore_XPCSearch";
    v31 = v29;
    os_signpost_id_t v32 = v23;
    goto LABEL_28;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    uint64_t v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v10 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v60 = v16;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "[MADEmbeddingStoreService] In-process search with %llu embeddings", buf, 0xCu);
    }
  }
  uint64_t v17 = (id *)(v54 + 5);
  id obj = (id)v54[5];
  [(MADEmbeddingStoreService *)self checkSandboxExtensionForPhotoLibraryURL:v14 error:&obj];
  objc_storeStrong(v17, obj);
  id v18 = (void *)v54[5];
  if (v18)
  {
    id v19 = 0;
    if (a6) {
      *a6 = v18;
    }
    goto LABEL_33;
  }
  v33 = VCPSignPostLog();
  os_signpost_id_t v34 = os_signpost_id_generate(v33);

  v35 = VCPSignPostLog();
  v36 = v35;
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v36, OS_SIGNPOST_INTERVAL_BEGIN, v34, "MADEmbeddingStore_InProcessSearch", "", buf, 2u);
  }

  v37 = (id *)(v54 + 5);
  id v45 = (id)v54[5];
  uint64_t v38 = +[MADEmbeddingStore searchWithEmbeddings:v10 photoLibraryURL:v14 options:v12 error:&v45];
  objc_storeStrong(v37, v45);
  v39 = (void *)v48[5];
  v48[5] = v38;

  v40 = VCPSignPostLog();
  v29 = v40;
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    v30 = "MADEmbeddingStore_InProcessSearch";
    v31 = v29;
    os_signpost_id_t v32 = v34;
LABEL_28:
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v31, OS_SIGNPOST_INTERVAL_END, v32, v30, "", buf, 2u);
  }
LABEL_29:

  if (a6)
  {
    v41 = (void *)v54[5];
    if (v41) {
      *a6 = v41;
    }
  }
  id v19 = (id)v48[5];
LABEL_33:

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);

  return v19;
}

void __79__MADEmbeddingStoreService_searchWithEmbeddings_photoLibraryURL_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Error connecting to embedding store service - %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __79__MADEmbeddingStoreService_searchWithEmbeddings_photoLibraryURL_options_error___block_invoke_266(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v7 = [v6 copy];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)prewarmSearchWithConcurrencyLimit:(unint64_t)a3 photoLibraryURL:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = v8;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__15;
  v40 = __Block_byref_object_dispose__15;
  id v41 = 0;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F39220] systemPhotoLibraryURL];
  }
  id v11 = v10;
  if ([(id)objc_opt_class() isEntitledForInProcessAccess])
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v43 = a3;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEFAULT, "[MADEmbeddingStoreService] In-process prewarm with concurrencyLimit %u", buf, 8u);
      }
    }
    id v13 = (id *)(v37 + 5);
    id obj = (id)v37[5];
    [(MADEmbeddingStoreService *)self checkSandboxExtensionForPhotoLibraryURL:v11 error:&obj];
    objc_storeStrong(v13, obj);
    uint64_t v14 = (void *)v37[5];
    if (v14)
    {
      if (!a5) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
    v26 = VCPSignPostLog();
    os_signpost_id_t v27 = os_signpost_id_generate(v26);

    v28 = VCPSignPostLog();
    v29 = v28;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "MADEmbeddingStore_InProcessPrewarm", "", buf, 2u);
    }

    v30 = (id *)(v37 + 5);
    id v34 = (id)v37[5];
    +[MADEmbeddingStore prewarmSearchWithConcurrencyLimit:a3 photoLibraryURL:v9 error:&v34];
    objc_storeStrong(v30, v34);
    v31 = VCPSignPostLog();
    v22 = v31;
    if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      os_signpost_id_t v23 = "MADEmbeddingStore_InProcessPrewarm";
      v24 = v22;
      os_signpost_id_t v25 = v27;
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v15 = VCPSignPostLog();
    os_signpost_id_t v16 = os_signpost_id_generate(v15);

    uint64_t v17 = VCPSignPostLog();
    id v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "MADEmbeddingStore_XPCPrewarm", "", buf, 2u);
    }

    id v19 = [(MADEmbeddingStoreService *)self connection];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __84__MADEmbeddingStoreService_prewarmSearchWithConcurrencyLimit_photoLibraryURL_error___block_invoke;
    v33[3] = &unk_1E6297F38;
    v33[4] = &v36;
    id v20 = [v19 synchronousRemoteObjectProxyWithErrorHandler:v33];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __84__MADEmbeddingStoreService_prewarmSearchWithConcurrencyLimit_photoLibraryURL_error___block_invoke_270;
    v32[3] = &unk_1E6297F38;
    v32[4] = &v36;
    [v20 prewarmSearchWithConcurrencyLimit:a3 photoLibraryURL:v11 reply:v32];

    uint64_t v21 = VCPSignPostLog();
    v22 = v21;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      os_signpost_id_t v23 = "MADEmbeddingStore_XPCPrewarm";
      v24 = v22;
      os_signpost_id_t v25 = v16;
LABEL_24:
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v24, OS_SIGNPOST_INTERVAL_END, v25, v23, "", buf, 2u);
    }
  }

  if (a5)
  {
    uint64_t v14 = (void *)v37[5];
    if (v14) {
LABEL_27:
    }
      *a5 = v14;
  }
LABEL_28:

  _Block_object_dispose(&v36, 8);
}

void __84__MADEmbeddingStoreService_prewarmSearchWithConcurrencyLimit_photoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Error connecting to embedding store service - %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __84__MADEmbeddingStoreService_prewarmSearchWithConcurrencyLimit_photoLibraryURL_error___block_invoke_270(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxHandles, 0);
  objc_storeStrong((id *)&self->_sandboxQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

void __38__MADEmbeddingStoreService_connection__block_invoke_2_cold_1()
{
  *(_WORD *)SecTaskRef v0 = 0;
  _os_log_debug_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[MADEmbeddingStoreService] Client XPC connection interrupted", v0, 2u);
}

void __38__MADEmbeddingStoreService_connection__block_invoke_242_cold_1()
{
  *(_WORD *)SecTaskRef v0 = 0;
  _os_log_error_impl(&dword_1BBEDA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[MADEmbeddingStoreService] Client XPC connection invalidated", v0, 2u);
}

@end