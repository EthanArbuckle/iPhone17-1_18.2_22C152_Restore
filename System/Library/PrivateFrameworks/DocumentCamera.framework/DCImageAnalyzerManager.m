@interface DCImageAnalyzerManager
+ (BOOL)isImageAnalysisEnabled;
+ (id)sharedInstance;
- (DCImageAnalyzerManager)init;
- (void)analysisForImage:(id)a3 completionHandler:(id)a4;
- (void)cleanup;
@end

@implementation DCImageAnalyzerManager

- (DCImageAnalyzerManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)DCImageAnalyzerManager;
  v2 = [(DCImageAnalyzerManager *)&v13 init];
  if (v2)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v3 = (void *)getVKCImageAnalyzerClass_softClass;
    uint64_t v18 = getVKCImageAnalyzerClass_softClass;
    if (!getVKCImageAnalyzerClass_softClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __getVKCImageAnalyzerClass_block_invoke;
      v14[3] = &unk_2642A9738;
      v14[4] = &v15;
      __getVKCImageAnalyzerClass_block_invoke((uint64_t)v14);
      v3 = (void *)v16[3];
    }
    v4 = v3;
    _Block_object_dispose(&v15, 8);
    v5 = (VKCImageAnalyzer *)objc_alloc_init(v4);
    imageAnalyzer = v2->_imageAnalyzer;
    v2->_imageAnalyzer = v5;

    v7 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cachedAnalyses = v2->_cachedAnalyses;
    v2->_cachedAnalyses = v7;

    [(NSCache *)v2->_cachedAnalyses setCountLimit:3];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.DocumentCamera.imageanalysisqueue", v9);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (OS_dispatch_queue *)v10;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

void __40__DCImageAnalyzerManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(DCImageAnalyzerManager);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;
}

+ (BOOL)isImageAnalysisEnabled
{
  return MEMORY[0x270ED8070]("Scarlett", "EnableScarlettUI");
}

- (void)cleanup
{
  operationQueue = self->_operationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__DCImageAnalyzerManager_cleanup__block_invoke;
  block[3] = &unk_2642A9250;
  block[4] = self;
  dispatch_async(operationQueue, block);
}

void __33__DCImageAnalyzerManager_cleanup__block_invoke(uint64_t a1)
{
  v2 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217885000, v2, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager cleanup started.", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) cancelAllRequests];
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  v3 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_217885000, v3, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager cleanup finished.", v4, 2u);
  }
}

- (void)analysisForImage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  operationQueue = self->_operationQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke;
  block[3] = &unk_2642A9710;
  id v12 = v6;
  objc_super v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(operationQueue, block);
}

void __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.documentcamera", "");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v3;
    _os_log_impl(&dword_217885000, v2, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager started classification for image: %@", buf, 0xCu);
  }

  if ([(id)objc_opt_class() isImageAnalysisEnabled])
  {
    v4 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKey:*(void *)(a1 + 32)];
    v5 = os_log_create("com.apple.documentcamera", "");
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v4;
        _os_log_impl(&dword_217885000, v5, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager cache hit for image: %@, analysis: %@", buf, 0x16u);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_41;
      block[3] = &unk_2642A9698;
      id v22 = *(id *)(a1 + 48);
      v21 = v4;
      dispatch_async(MEMORY[0x263EF83A0], block);

      v8 = v22;
    }
    else
    {
      if (v6)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v9;
        _os_log_impl(&dword_217885000, v5, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager cache miss for image: %@", buf, 0xCu);
      }

      uint64_t v23 = 0;
      v24 = &v23;
      uint64_t v25 = 0x2050000000;
      id v10 = (void *)getVKCImageAnalyzerRequestClass_softClass;
      uint64_t v26 = getVKCImageAnalyzerRequestClass_softClass;
      if (!getVKCImageAnalyzerRequestClass_softClass)
      {
        *(void *)buf = MEMORY[0x263EF8330];
        *(void *)&buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __getVKCImageAnalyzerRequestClass_block_invoke;
        v28 = &unk_2642A9738;
        v29 = &v23;
        __getVKCImageAnalyzerRequestClass_block_invoke((uint64_t)buf);
        id v10 = (void *)v24[3];
      }
      v11 = v10;
      _Block_object_dispose(&v23, 8);
      v8 = objc_msgSend([v11 alloc], "initWithImage:orientation:requestType:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "imageOrientation"), -1);
      id v12 = *(void **)(*(void *)(a1 + 40) + 8);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_42;
      v16[3] = &unk_2642A96E8;
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = *(void **)(a1 + 48);
      id v17 = v13;
      uint64_t v18 = v14;
      id v19 = v15;
      [v12 processRequest:v8 progressHandler:0 completionHandler:v16];
    }
  }
  else
  {
    v4 = os_log_create("com.apple.documentcamera", "");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217885000, v4, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager refusing to perform analysis since feature flag isn't enabled.", buf, 2u);
    }
  }
}

uint64_t __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.documentcamera", "");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_42_cold_1((uint64_t)v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_217885000, v8, OS_LOG_TYPE_DEFAULT, "DCImageAnalyzerManager caching image: %@, analysis: %@", buf, 0x16u);
    }

    [*(id *)(*(void *)(a1 + 40) + 16) setObject:v5 forKey:*(void *)(a1 + 32)];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_43;
  block[3] = &unk_2642A96C0;
  id v10 = *(id *)(a1 + 48);
  id v15 = v6;
  id v16 = v10;
  id v14 = v5;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_43(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_cachedAnalyses, 0);

  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
}

void __61__DCImageAnalyzerManager_analysisForImage_completionHandler___block_invoke_42_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217885000, a2, OS_LOG_TYPE_ERROR, "DCImageAnalyzerManager encountered error while analyzing image: %@", (uint8_t *)&v2, 0xCu);
}

@end