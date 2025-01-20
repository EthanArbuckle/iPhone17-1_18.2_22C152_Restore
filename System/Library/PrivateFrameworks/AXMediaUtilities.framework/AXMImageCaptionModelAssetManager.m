@interface AXMImageCaptionModelAssetManager
+ (id)sharedInstance;
- (AXMImageCaptionModelAssetManager)init;
- (NSURL)baseURL;
- (id)_modelURLForType:(unint64_t)a3 baseURL:(id)a4;
- (id)infoForModelAtURL:(id)a3;
- (id)modelURLForType:(unint64_t)a3 timeout:(double)a4;
- (void)_performWithLock:(id)a3;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)setBaseURL:(id)a3;
@end

@implementation AXMImageCaptionModelAssetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance__Shared;

  return v2;
}

void __50__AXMImageCaptionModelAssetManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(AXMImageCaptionModelAssetManager);
  v1 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;
}

- (AXMImageCaptionModelAssetManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXMImageCaptionModelAssetManager;
  v2 = [(AXMImageCaptionModelAssetManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x1E4F47E10];
    v5 = [MEMORY[0x1E4F47E48] policy];
    uint64_t v6 = [v4 assetControllerWithPolicy:v5];
    assetController = v3->_assetController;
    v3->_assetController = (AXAssetController *)v6;

    [(AXAssetController *)v3->_assetController addObserver:v3];
    [(AXAssetController *)v3->_assetController refreshAssetsByForceUpdatingCatalog:0 updatingCatalogIfNeeded:0 catalogRefreshOverrideTimeout:0 completion:0];
  }
  return v3;
}

- (id)modelURLForType:(unint64_t)a3 timeout:(double)a4
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__6;
  v26 = __Block_byref_object_dispose__6;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __60__AXMImageCaptionModelAssetManager_modelURLForType_timeout___block_invoke;
  v21[3] = &unk_1E6116EC0;
  v21[4] = self;
  v21[5] = &v22;
  [(AXMImageCaptionModelAssetManager *)self _performWithLock:v21];
  if (v23[5])
  {
    uint64_t v7 = -[AXMImageCaptionModelAssetManager _modelURLForType:baseURL:](self, "_modelURLForType:baseURL:", a3);
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  if (a4 == 0.0 || self->_didTryWaitingForAssetLookup)
  {
    v8 = 0;
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v11 = v10;
    uint64_t v12 = v23[5];
    BOOL v13 = v12 == 0;
    double v14 = v10 - v10;
    if (!v12 && v14 < a4)
    {
      CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F1D418];
      do
      {
        CFRunLoopRunInMode(v15, 0.2, 0);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __60__AXMImageCaptionModelAssetManager_modelURLForType_timeout___block_invoke_2;
        v20[3] = &unk_1E6116EC0;
        v20[4] = self;
        v20[5] = &v22;
        [(AXMImageCaptionModelAssetManager *)self _performWithLock:v20];
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        uint64_t v16 = v23[5];
        BOOL v13 = v16 == 0;
        double v14 = v17 - v11;
        if (v16) {
          BOOL v18 = 0;
        }
        else {
          BOOL v18 = v14 < a4;
        }
      }
      while (v18);
    }
    if (!v13)
    {
      uint64_t v7 = -[AXMImageCaptionModelAssetManager _modelURLForType:baseURL:](self, "_modelURLForType:baseURL:", a3);
      goto LABEL_3;
    }
    v19 = AXLogAssetLoader();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[AXMImageCaptionModelAssetManager modelURLForType:timeout:](v19, v14, a4);
    }

    v8 = 0;
    self->_didTryWaitingForAssetLookup = 1;
  }
LABEL_7:
  _Block_object_dispose(&v22, 8);

  return v8;
}

void __60__AXMImageCaptionModelAssetManager_modelURLForType_timeout___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __60__AXMImageCaptionModelAssetManager_modelURLForType_timeout___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)infoForModelAtURL:(id)a3
{
  uint64_t v3 = [a3 URLByAppendingPathComponent:@"model_info.json"];
  id v12 = 0;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:0 error:&v12];
  id v5 = v12;
  if (v4)
  {
    id v11 = v5;
    uint64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v11];
    id v7 = v11;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F47E40]) initWithModelProperties:v6];
    }
    else
    {
      objc_super v9 = AXLogAssetLoader();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[AXMImageCaptionModelAssetManager infoForModelAtURL:]();
      }

      v8 = 0;
    }
  }
  else
  {
    uint64_t v6 = AXLogAssetLoader();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AXMImageCaptionModelAssetManager infoForModelAtURL:]();
    }
    v8 = 0;
    id v7 = v5;
  }

  return v8;
}

- (id)_modelURLForType:(unint64_t)a3 baseURL:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v13 = 0;
  if (a3 == 1)
  {
    objc_super v9 = [v5 URLByAppendingPathComponent:@"VideoCaptionModel"];
    double v10 = [v9 path];
    [v6 fileExistsAtPath:v10 isDirectory:&v13];

    if (!v13)
    {
      id v11 = 0;
      goto LABEL_11;
    }
    id v7 = v9;
  }
  else
  {
    if (a3)
    {
      id v11 = 0;
      goto LABEL_12;
    }
    id v7 = [v5 URLByAppendingPathComponent:@"ImageCaptionModel"];
    v8 = [v7 path];
    [v6 fileExistsAtPath:v8 isDirectory:&v13];

    if (v13) {
      objc_super v9 = v7;
    }
    else {
      objc_super v9 = v5;
    }
  }
  id v11 = v9;
  objc_super v9 = v7;
LABEL_11:

LABEL_12:

  return v11;
}

- (void)_performWithLock:(id)a3
{
  p_lock = &self->_lock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  double v10 = AXLogAssetLoader();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl(&dword_1B57D5000, v10, OS_LOG_TYPE_INFO, "ImageCaptionAssetManager. didFinishRefreshingAssets: (%@). error: %@", buf, 0x16u);
  }

  id v11 = [MEMORY[0x1E4F47E00] newsestCompatibleImageCaptionModelAssetFromAssets:v8 withStage:@"Stable" language:@"en" isInstalled:1 isDownloadable:0];
  if (v11)
  {
    id v12 = [MEMORY[0x1E4F47E18] store];
    [v12 recordLastAssetAccess:v11];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __98__AXMImageCaptionModelAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
    v14[3] = &unk_1E6116F08;
    CFStringRef v15 = v11;
    uint64_t v16 = self;
    [(AXMImageCaptionModelAssetManager *)self _performWithLock:v14];
    char v13 = v15;
  }
  else
  {
    char v13 = AXLogAssetLoader();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B57D5000, v13, OS_LOG_TYPE_INFO, "ImageCaptionAssetManager. No compatible installed asset found", buf, 2u);
    }
  }
}

void __98__AXMImageCaptionModelAssetManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AXLogAssetLoader();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 32) localURL];
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1B57D5000, v2, OS_LOG_TYPE_INFO, "ImageCaptionAssetManager. asset controller setting model baseURL after asset refresh: %@", (uint8_t *)&v6, 0xCu);
  }
  v4 = [*(id *)(a1 + 32) localURL];
  id v5 = (void *)[v4 copy];
  [*(id *)(a1 + 40) setBaseURL:v5];
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_assetController, 0);
}

- (void)modelURLForType:(double)a3 timeout:.cold.1(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Did time out waiting for image caption asset refresh. timeWaited:%.2f timeout:%.2f", (uint8_t *)&v3, 0x16u);
}

- (void)infoForModelAtURL:.cold.1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_2(&dword_1B57D5000, v0, v1, "Could not load AXImageCaptionModel at %@. error: %@");
}

@end