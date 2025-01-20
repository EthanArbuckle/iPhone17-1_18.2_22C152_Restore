@interface CAMSmartStyleSettingsResourceLoader
- (CAMSmartStyleSettingsResourceLoadResult)resourceLoadResult;
- (CAMSmartStyleSettingsResourceLoader)initWithDelegate:(id)a3 loadingQueue:(id)a4 assetIdentifier:(id)a5 logIdentifier:(id)a6;
- (CAMSmartStyleSettingsResourceLoaderDelegate)delegate;
- (NSString)assetIdentifier;
- (NSString)logIdentifier;
- (OS_dispatch_queue)_resourceLoadingQueue;
- (PEResourceLoader)_resourceLoader;
- (double)_startTime;
- (int64_t)status;
- (void)_loadWithAsset:(id)a3;
- (void)_loadingQueue_fetchAsset;
- (void)_setStatus:(int64_t)a3;
- (void)photoEditResourceLoadRequestResourcesAvailabilityChanged:(id)a3 previousAvailability:(int64_t)a4 currentAvailability:(int64_t)a5;
- (void)resourceLoader:(id)a3 request:(id)a4 didCompleteWithResult:(id)a5;
- (void)resourceLoader:(id)a3 request:(id)a4 downloadProgress:(double)a5;
- (void)resourceLoader:(id)a3 request:(id)a4 mediaLoadDidFailWithError:(id)a5;
- (void)setDelegate:(id)a3;
- (void)startLoading;
@end

@implementation CAMSmartStyleSettingsResourceLoader

- (CAMSmartStyleSettingsResourceLoader)initWithDelegate:(id)a3 loadingQueue:(id)a4 assetIdentifier:(id)a5 logIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CAMSmartStyleSettingsResourceLoader;
  v14 = [(CAMSmartStyleSettingsResourceLoader *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v10);
    objc_storeStrong((id *)&v15->__resourceLoadingQueue, a4);
    objc_storeStrong((id *)&v15->_assetIdentifier, a5);
    objc_storeStrong((id *)&v15->_logIdentifier, a6);
    v15->_status = 0;
  }

  return v15;
}

- (void)_setStatus:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_status != a3)
  {
    self->_status = a3;
    v5 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CAMSmartStyleSettingsResourceLoader *)self logIdentifier];
      v7 = (void *)v6;
      if ((unint64_t)a3 > 4) {
        v8 = 0;
      }
      else {
        v8 = off_263FA4CE0[a3];
      }
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      id v13 = v8;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): status changed to %{public}@", (uint8_t *)&v10, 0x16u);
    }
    if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x1A) != 0)
    {
      v9 = [(CAMSmartStyleSettingsResourceLoader *)self delegate];
      [v9 smartStyleSettingsResourceLoaderDidFinishLoading:self];
    }
  }
}

- (void)startLoading
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(CAMSmartStyleSettingsResourceLoader *)self status])
  {
    v3 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(CAMSmartStyleSettingsResourceLoader *)self logIdentifier];
      unint64_t v5 = [(CAMSmartStyleSettingsResourceLoader *)self status];
      if (v5 > 4) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = off_263FA4CE0[v5];
      }
      *(_DWORD *)buf = 138543618;
      int v10 = v4;
      __int16 v11 = 2114;
      __int16 v12 = v6;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): ignoring call to startLoading since status is %{public}@", buf, 0x16u);
    }
  }
  else
  {
    self->__startTime = CFAbsoluteTimeGetCurrent();
    resourceLoadingQueue = self->__resourceLoadingQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__CAMSmartStyleSettingsResourceLoader_startLoading__block_invoke;
    block[3] = &unk_263FA0208;
    block[4] = self;
    dispatch_async(resourceLoadingQueue, block);
  }
}

uint64_t __51__CAMSmartStyleSettingsResourceLoader_startLoading__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadingQueue_fetchAsset");
}

- (void)_loadingQueue_fetchAsset
{
  v19[1] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->__resourceLoadingQueue);
  v3 = (void *)MEMORY[0x263F14D18];
  v4 = [(CAMSmartStyleSettingsResourceLoader *)self assetIdentifier];
  v19[0] = v4;
  unint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  uint64_t v6 = [v3 fetchAssetsWithLocalIdentifiers:v5 options:0];

  double Current = CFAbsoluteTimeGetCurrent();
  double startTime = self->__startTime;
  v9 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(CAMSmartStyleSettingsResourceLoader *)self logIdentifier];
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    __int16 v17 = 2048;
    double v18 = Current - startTime;
    _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): asset fetch took %.3f", buf, 0x16u);
  }
  __int16 v11 = [v6 firstObject];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__CAMSmartStyleSettingsResourceLoader__loadingQueue_fetchAsset__block_invoke;
  v13[3] = &unk_263FA0408;
  v13[4] = self;
  id v14 = v11;
  id v12 = v11;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

uint64_t __63__CAMSmartStyleSettingsResourceLoader__loadingQueue_fetchAsset__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadWithAsset:*(void *)(a1 + 40)];
}

- (void)_loadWithAsset:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F5E240]);
    [v5 setRequireLocalResources:1];
    [v5 setVersion:1];
    [v5 setSkipLivePhotoImageAndAVAsset:1];
    [v5 setDelegate:self];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F5E248]) initWithAsset:v4 loadingQueue:self->__resourceLoadingQueue];
    [v6 setSkipDisplaySizeImage:1];
    [(CAMSmartStyleSettingsResourceLoader *)self _setStatus:2];
    [v6 enqueueRequest:v5];
    resourceLoader = self->__resourceLoader;
    self->__resourceLoader = (PEResourceLoader *)v6;
  }
  else
  {
    v8 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(CAMSmartStyleSettingsResourceLoader *)self logIdentifier];
      int v10 = 138543362;
      __int16 v11 = v9;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): failed to load asset", (uint8_t *)&v10, 0xCu);
    }
    [(CAMSmartStyleSettingsResourceLoader *)self _setStatus:1];
  }
}

- (void)resourceLoader:(id)a3 request:(id)a4 didCompleteWithResult:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a5;
  double Current = CFAbsoluteTimeGetCurrent();
  double startTime = self->__startTime;
  v9 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [(CAMSmartStyleSettingsResourceLoader *)self logIdentifier];
    int v15 = 138543618;
    v16 = v10;
    __int16 v17 = 2048;
    double v18 = Current - startTime;
    _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): loading took %.3f seconds", (uint8_t *)&v15, 0x16u);
  }
  __int16 v11 = [CAMSmartStyleSettingsResourceLoadResult alloc];
  uint64_t v12 = [(CAMSmartStyleSettingsResourceLoader *)self logIdentifier];
  uint64_t v13 = [(CAMSmartStyleSettingsResourceLoadResult *)v11 initWithResourceLoadResult:v6 logIdentifier:v12];

  resourceLoadResult = self->_resourceLoadResult;
  self->_resourceLoadResult = v13;

  [(CAMSmartStyleSettingsResourceLoader *)self _setStatus:3];
}

- (void)resourceLoader:(id)a3 request:(id)a4 mediaLoadDidFailWithError:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a5;
  v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(CAMSmartStyleSettingsResourceLoader *)self logIdentifier];
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): failed to load resource: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(CAMSmartStyleSettingsResourceLoader *)self _setStatus:4];
}

- (void)resourceLoader:(id)a3 request:(id)a4 downloadProgress:(double)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v7 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(CAMSmartStyleSettingsResourceLoader *)self logIdentifier];
    int v9 = 138543618;
    int v10 = v8;
    __int16 v11 = 2048;
    double v12 = a5;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): download progress: %.3f", (uint8_t *)&v9, 0x16u);
  }
}

- (void)photoEditResourceLoadRequestResourcesAvailabilityChanged:(id)a3 previousAvailability:(int64_t)a4 currentAvailability:(int64_t)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __137__CAMSmartStyleSettingsResourceLoader_photoEditResourceLoadRequestResourcesAvailabilityChanged_previousAvailability_currentAvailability___block_invoke;
  v5[3] = &unk_263FA2BC8;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a5;
  cam_perform_on_main_asap(v5);
}

void __137__CAMSmartStyleSettingsResourceLoader_photoEditResourceLoadRequestResourcesAvailabilityChanged_previousAvailability_currentAvailability___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = os_log_create("com.apple.camera", "SmartStyleSettings");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) logIdentifier];
    id v4 = (void *)v3;
    unint64_t v5 = *(void *)(a1 + 40);
    if (v5 > 4) {
      id v6 = 0;
    }
    else {
      id v6 = off_263FA4D08[v5];
    }
    unint64_t v7 = *(void *)(a1 + 48);
    if (v7 > 4) {
      v8 = 0;
    }
    else {
      v8 = off_263FA4D08[v7];
    }
    int v9 = 138543874;
    uint64_t v10 = v3;
    __int16 v11 = 2114;
    double v12 = v6;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "ResourceLoader (%{public}@): availability changed from %{public}@ to %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (CAMSmartStyleSettingsResourceLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMSmartStyleSettingsResourceLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (int64_t)status
{
  return self->_status;
}

- (CAMSmartStyleSettingsResourceLoadResult)resourceLoadResult
{
  return self->_resourceLoadResult;
}

- (OS_dispatch_queue)_resourceLoadingQueue
{
  return self->__resourceLoadingQueue;
}

- (PEResourceLoader)_resourceLoader
{
  return self->__resourceLoader;
}

- (double)_startTime
{
  return self->__startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__resourceLoader, 0);
  objc_storeStrong((id *)&self->__resourceLoadingQueue, 0);
  objc_storeStrong((id *)&self->_resourceLoadResult, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end