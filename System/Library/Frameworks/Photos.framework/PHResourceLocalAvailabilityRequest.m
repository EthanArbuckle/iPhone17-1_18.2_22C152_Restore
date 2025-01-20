@interface PHResourceLocalAvailabilityRequest
+ (BOOL)isKnownUnsupportedFormatForAsset:(id)a3;
+ (BOOL)setValuesInDictionary:(id)a3 fromDictionary:(id)a4 keysToCopy:(id)a5;
+ (id)_originalsAndFullSizeResourcesToShareForAsset:(id)a3 fromAvailableResources:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)_resourceInfoForAsset:(id)a3 resourcesToShare:(id)a4 assetVersion:(int64_t)a5 fulfillOnDemandResources:(BOOL)a6 error:(id *)a7;
+ (id)_resourcesToShareForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5;
+ (id)_resourcesToShareForAsset:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)_singularResourcesToShareForAsset:(id)a3 fromAvailableResources:(id)a4 options:(id)a5 useOriginalResources:(BOOL)a6 knownUnsupported:(BOOL)a7 error:(id *)a8;
+ (id)fetchResourcesToShareForAsset:(id)a3 requestOptions:(id)a4 error:(id *)a5;
+ (id)indexesForAssetsRequiringResourceRetrieval:(id)a3 requestType:(int64_t)a4;
+ (id)indexesForAssetsRequiringResourceRetrieval:(id)a3 requestType:(int64_t)a4 options:(id)a5;
+ (id)indexesForAssetsWithoutThumbnails:(id)a3 requestType:(int64_t)a4;
+ (id)resourceInfoForSharingAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5;
+ (id)resourceInfoKeysForResourceTypesForPhotos;
+ (id)resourceInfoKeysForResourceTypesForVideos;
+ (id)resourceLocalAvailabilityRequestLog;
+ (id)utiKeysForURLKeys;
- (BOOL)_isDownloadCancelled;
- (NSArray)_assetResources;
- (NSMutableArray)_activeAssetResourcesRequest;
- (NSProgress)progress;
- (PHAsset)asset;
- (PHResourceLocalAvailabilityRequest)init;
- (PHResourceLocalAvailabilityRequest)initWithAsset:(id)a3 requestType:(int64_t)a4;
- (double)progressFraction;
- (id)progressChangeHandler;
- (int64_t)requestType;
- (int64_t)resourceAvailabilityForOptions:(id)a3 resourceInfo:(id *)a4;
- (void)_cancelActiveAssetResourceRequests;
- (void)_didFinishDownloadWithSuccess:(BOOL)a3 resourceInfo:(id)a4 error:(id)a5;
- (void)_fetchResourcesForDuplicatingAsset:(id)a3 options:(id)a4 networkAccessAllowed:(BOOL)a5 handler:(id)a6;
- (void)_fetchResourcesForPickerAsset:(id)a3 options:(id)a4 networkAccessAllowed:(BOOL)a5 handler:(id)a6;
- (void)_fetchResourcesForSharingAsset:(id)a3 options:(id)a4 networkAccessAllowed:(BOOL)a5 handler:(id)a6;
- (void)_fetchResourcesWithOptions:(id)a3 networkAccessAllowed:(BOOL)a4 handler:(id)a5;
- (void)_handleCompletionOfAssetResourceDataRequestWithId:(int)a3 error:(id)a4;
- (void)_setAssetResources:(id)a3;
- (void)_setDownloadCancelled:(BOOL)a3;
- (void)_setProgressFraction:(double)a3;
- (void)_simulateFetchResourcesWithDuration:(double)a3 success:(BOOL)a4 networkAccessAllowed:(BOOL)a5 queue:(id)a6 handler:(id)a7;
- (void)_updateCombinedProgressWithValue:(double)a3 forRequestIdentifier:(id)a4 networkAccessAllowed:(BOOL)a5;
- (void)cancelRetrievalRequest;
- (void)fetchResourceAvailabilityWithOptions:(id)a3 completionHandler:(id)a4;
- (void)retrieveRequiredResourcesWithOptions:(id)a3 completionHandler:(id)a4;
- (void)setProgressChangeHandler:(id)a3;
@end

@implementation PHResourceLocalAvailabilityRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeAssetResourcesRequest, 0);
  objc_storeStrong((id *)&self->__assetResources, 0);
  objc_storeStrong(&self->_progressChangeHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_downloadCompletionHandler, 0);

  objc_storeStrong((id *)&self->_progressByRequestIdentifier, 0);
}

- (NSMutableArray)_activeAssetResourcesRequest
{
  return self->__activeAssetResourcesRequest;
}

- (void)_setAssetResources:(id)a3
{
}

- (NSArray)_assetResources
{
  return self->__assetResources;
}

- (void)_setDownloadCancelled:(BOOL)a3
{
  self->__downloadCancelled = a3;
}

- (BOOL)_isDownloadCancelled
{
  return self->__downloadCancelled;
}

- (void)setProgressChangeHandler:(id)a3
{
}

- (id)progressChangeHandler
{
  return self->_progressChangeHandler;
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 56, 1);
}

- (double)progressFraction
{
  return self->_progressFraction;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)resourceAvailabilityForOptions:(id)a3 resourceInfo:(id *)a4
{
  id v7 = a3;
  if ((unint64_t)(self->_requestType - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PHResourceLocalAvailabilityRequest.m", 1772, @"Invalid parameter not satisfying: %@", @"_requestType == PHResourceRequestTypeForSharing || _requestType == PHResourceRequestTypeForDuplicating" object file lineNumber description];
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__12080;
  v28 = __Block_byref_object_dispose__12081;
  id v29 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  if (v7) {
    v8 = (PHResourceLocalAvailabilityRequestOptions *)v7;
  }
  else {
    v8 = objc_alloc_init(PHResourceLocalAvailabilityRequestOptions);
  }
  v9 = v8;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__PHResourceLocalAvailabilityRequest_resourceAvailabilityForOptions_resourceInfo___block_invoke;
  v15[3] = &unk_1E5843AB8;
  v17 = &v20;
  v18 = &v24;
  v15[4] = self;
  id v10 = v7;
  id v16 = v10;
  v19 = &v30;
  [(PHResourceLocalAvailabilityRequest *)self _fetchResourcesWithOptions:v9 networkAccessAllowed:0 handler:v15];
  if (!*((unsigned char *)v21 + 24))
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PHResourceLocalAvailabilityRequest.m" lineNumber:1795 description:@"The completion handler for -[PHResourceLocalAvailabilityRequest _fetchResourcesForSharingAsset:networkAccessAllowed:handler:] was not called back synchronously!"];

    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (a4) {
LABEL_8:
  }
    *a4 = (id) v25[5];
LABEL_9:
  int64_t v11 = v31[3];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v11;
}

void __82__PHResourceLocalAvailabilityRequest_resourceAvailabilityForOptions_resourceInfo___block_invoke(void *a1, int a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  if (a2) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a4);
  }
  if (v11)
  {
    v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = a1[5];
      uint64_t v14 = *(void *)(a1[4] + 32);
      int v15 = 138412802;
      uint64_t v16 = v14;
      __int16 v17 = 2112;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Failed to determine if downloading is required for asset: %@, options: %@, error: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  *(void *)(*(void *)(a1[8] + 8) + 24) = a3;
}

- (void)_setProgressFraction:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_progressFraction != a3)
  {
    self->_progressFraction = a3;
    [(NSProgress *)self->_progress setCompletedUnitCount:vcvtmd_s64_f64((double)[(NSProgress *)self->_progress totalUnitCount] * a3)];
    if (self->_progressChangeHandler)
    {
      v5 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 134218240;
        id v7 = self;
        __int16 v8 = 2048;
        double v9 = a3;
        _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Updating progress: %f", (uint8_t *)&v6, 0x16u);
      }

      (*((void (**)(void))self->_progressChangeHandler + 2))();
    }
  }
}

- (void)_updateCombinedProgressWithValue:(double)a3 forRequestIdentifier:(id)a4 networkAccessAllowed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  double v9 = v8;
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__PHResourceLocalAvailabilityRequest__updateCombinedProgressWithValue_forRequestIdentifier_networkAccessAllowed___block_invoke;
    block[3] = &unk_1E5847910;
    block[4] = self;
    double v12 = a3;
    id v11 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __113__PHResourceLocalAvailabilityRequest__updateCombinedProgressWithValue_forRequestIdentifier_networkAccessAllowed___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = *(void *)(a1 + 32);
    BOOL v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    v2 = *(void **)(*(void *)(a1 + 32) + 8);
  }
  int v6 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v2 setObject:v6 forKey:*(void *)(a1 + 40)];

  uint64_t v12 = 0;
  uint64_t v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v7 = *(void **)(*(void *)(a1 + 32) + 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __113__PHResourceLocalAvailabilityRequest__updateCombinedProgressWithValue_forRequestIdentifier_networkAccessAllowed___block_invoke_2;
  v11[3] = &unk_1E5843A68;
  v11[4] = &v12;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];
  double v8 = v13[3];
  unint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) count];
  v13[3] = v8 / (double)v9;
  [*(id *)(a1 + 32) progressFraction];
  if (v10 < v13[3]) {
    double v10 = v13[3];
  }
  [*(id *)(a1 + 32) _setProgressFraction:v10];
  _Block_object_dispose(&v12, 8);
}

double __113__PHResourceLocalAvailabilityRequest__updateCombinedProgressWithValue_forRequestIdentifier_networkAccessAllowed___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 floatValue];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v5 + 24) + v4;
  *(double *)(v5 + 24) = result;
  return result;
}

- (void)cancelRetrievalRequest
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(PHResourceLocalAvailabilityRequest *)self _setDownloadCancelled:1];
  [(PHResourceLocalAvailabilityRequest *)self _cancelActiveAssetResourceRequests];
  uint64_t v3 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = self;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Download request cancelled", (uint8_t *)&v4, 0xCu);
  }

  [(PHResourceLocalAvailabilityRequest *)self _didFinishDownloadWithSuccess:0 resourceInfo:MEMORY[0x1E4F1CC08] error:0];
}

- (void)_cancelActiveAssetResourceRequests
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PHResourceLocalAvailabilityRequest__cancelActiveAssetResourceRequests__block_invoke;
  aBlock[3] = &unk_1E58479D0;
  objc_copyWeak(&v6, &location);
  v2 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v2[2](v2);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PHResourceLocalAvailabilityRequest__cancelActiveAssetResourceRequests__block_invoke_2;
    block[3] = &unk_1E5848D50;
    int v4 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __72__PHResourceLocalAvailabilityRequest__cancelActiveAssetResourceRequests__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(WeakRetained, "_activeAssetResourcesRequest", 0);
  uint64_t v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        unint64_t v9 = [WeakRetained _activeAssetResourcesRequest];
        [v9 removeObject:v8];

        double v10 = +[PHAssetResourceManager defaultManager];
        objc_msgSend(v10, "cancelDataRequest:", objc_msgSend(v8, "intValue"));

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

uint64_t __72__PHResourceLocalAvailabilityRequest__cancelActiveAssetResourceRequests__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_didFinishDownloadWithSuccess:(BOOL)a3 resourceInfo:(id)a4 error:(id)a5
{
  BOOL v6 = a3;
  id v11 = a4;
  id v8 = a5;
  if (v6) {
    [(NSProgress *)self->_progress setCompletedUnitCount:[(NSProgress *)self->_progress totalUnitCount]];
  }
  downloadCompletionHandler = (void (**)(id, BOOL, BOOL, id, id))self->_downloadCompletionHandler;
  if (downloadCompletionHandler)
  {
    downloadCompletionHandler[2](downloadCompletionHandler, v6, [(PHResourceLocalAvailabilityRequest *)self _isDownloadCancelled], v11, v8);
    id v10 = self->_downloadCompletionHandler;
  }
  else
  {
    id v10 = 0;
  }
  self->_downloadCompletionHandler = 0;
}

- (void)_simulateFetchResourcesWithDuration:(double)a3 success:(BOOL)a4 networkAccessAllowed:(BOOL)a5 queue:(id)a6 handler:(id)a7
{
  long long v12 = a6;
  id v13 = a7;
  if (a5)
  {
    long long v14 = dispatch_get_global_queue(-2, 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_2;
    v17[3] = &unk_1E5843A40;
    double v20 = a3;
    v17[4] = self;
    uint64_t v18 = v12;
    id v19 = v13;
    BOOL v21 = a4;
    dispatch_async(v14, v17);

    uint64_t v15 = v18;
  }
  else
  {
    dispatch_time_t v16 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke;
    block[3] = &unk_1E5848D50;
    char v23 = v13;
    dispatch_after(v16, v12, block);
    uint64_t v15 = v23;
  }
}

uint64_t __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void, void))(result + 16))(result, 0, 1, MEMORY[0x1E4F1CC08], 0);
  }
  return result;
}

void __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_2(uint64_t a1)
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v3 = v2;
  uint64_t v4 = MEMORY[0x1E4F14428];
  while (1)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v6 = (v5 - v3) / *(double *)(a1 + 56);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_3;
    block[3] = &unk_1E5847938;
    double v7 = v6 <= 1.0 ? v6 : 1.0;
    void block[4] = *(void *)(a1 + 32);
    *(double *)&void block[5] = v7;
    dispatch_async(v4, block);
    if (v7 >= 1.0) {
      break;
    }
    [MEMORY[0x1E4F29060] sleepForTimeInterval:0.5];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_4;
  v9[3] = &unk_1E5843A18;
  id v8 = *(NSObject **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  char v11 = *(unsigned char *)(a1 + 64);
  dispatch_async(v8, v9);
}

uint64_t __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setProgressFraction:*(double *)(a1 + 40)];
}

void __117__PHResourceLocalAvailabilityRequest__simulateFetchResourcesWithDuration_success_networkAccessAllowed_queue_handler___block_invoke_4(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      double v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
    else
    {
      uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v5 = *MEMORY[0x1E4F28568];
      v13[0] = *MEMORY[0x1E4F28588];
      v13[1] = v5;
      v14[0] = @"Simulated Download Failure";
      v14[1] = @"Simulated Download Failure in PHResourceLocalAvailabilityRequest";
      double v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
      double v7 = [v4 errorWithDomain:@"PHResourceLocalAvailabilityRequestErrorDomain" code:-1 userInfo:v6];

      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F28A50];
      long long v12 = v7;
      unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      id v10 = [v8 errorWithDomain:@"PHResourceLocalAvailabilityRequestErrorDomain" code:3 userInfo:v9];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)_handleCompletionOfAssetResourceDataRequestWithId:(int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    double v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218498;
      id v10 = self;
      __int16 v11 = 1024;
      int v12 = v4;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Failure in asset resource data request with identifier: %i, error: %@", (uint8_t *)&v9, 0x1Cu);
    }
  }
  else
  {
    double v7 = [(PHResourceLocalAvailabilityRequest *)self _activeAssetResourcesRequest];
    id v8 = [NSNumber numberWithInt:v4];
    [v7 removeObject:v8];
  }
}

- (void)_fetchResourcesForDuplicatingAsset:(id)a3 options:(id)a4 networkAccessAllowed:(BOOL)a5 handler:(id)a6
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v43 = a4;
  id v39 = a6;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  char v89 = 1;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x3032000000;
  v86[3] = __Block_byref_object_copy__12080;
  v86[4] = __Block_byref_object_dispose__12081;
  id v87 = 0;
  v40 = self;
  objc_initWeak(&location, self);
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  char v84 = 1;
  int v9 = _FetchableResourcesForAsset(v45, 0);
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke;
  v80[3] = &unk_1E58439C8;
  v80[4] = &v81;
  [v9 enumerateObjectsUsingBlock:v80];
  [(PHResourceLocalAvailabilityRequest *)self _setAssetResources:v9];
  v38 = v9;
  if (*((unsigned char *)v82 + 24))
  {
    uint64_t v10 = 0;
  }
  else
  {
    int v11 = [v45 deferredProcessingNeeded];
    if (v11 == 9)
    {
      int v12 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = [v45 uuid];
        [v45 deferredProcessingNeeded];
        id v14 = PLManagedAssetDeferredProcessingNeededDescription();
        *(_DWORD *)buf = 134218498;
        v91 = v40;
        __int16 v92 = 2112;
        *(void *)v93 = v13;
        *(_WORD *)&v93[8] = 2114;
        *(void *)&v93[10] = v14;
        _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Asset %@'s deferred processing state reports that it failed: %{public}@", buf, 0x20u);
      }
    }
    int v15 = [v45 needsDeferredProcessing];
    if (v11 == 9) {
      int v16 = 1;
    }
    else {
      int v16 = v15;
    }
    if (v16) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  if (a5)
  {
    uint64_t v37 = v10;
    __int16 v17 = dispatch_group_create();
    int v18 = [v43 treatLivePhotoAsStill];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id obj = v38;
    uint64_t v19 = [obj countByEnumeratingWithState:&v76 objects:v94 count:16];
    if (v19)
    {
      double v20 = (id *)v71;
      uint64_t v44 = *(void *)v77;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v77 != v44) {
            objc_enumerationMutation(obj);
          }
          BOOL v21 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if (!v18 || [*(id *)(*((void *)&v76 + 1) + 8 * i) type] != 9)
          {
            dispatch_group_enter(v17);
            uint64_t v22 = [v21 type];
            char v23 = objc_msgSend(NSString, "stringWithFormat:", @"AssetResourceRequest-Type%li", v22);
            uint64_t v24 = objc_alloc_init(PHAssetResourceRequestOptions);
            [(PHAssetResourceRequestOptions *)v24 setNetworkAccessAllowed:1];
            [(PHAssetResourceRequestOptions *)v24 setResistentToPrune:1];
            v47 = v24;
            uint64_t v72 = 0;
            v73 = &v72;
            uint64_t v74 = 0x2020000000;
            char v75 = 0;
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_264;
            aBlock[3] = &unk_1E58438B8;
            v70 = &v72;
            objc_copyWeak(v20, &location);
            id v46 = v23;
            id v69 = v46;
            v71[8] = a5;
            v25 = (void (**)(void, double))_Block_copy(aBlock);
            [(PHAssetResourceRequestOptions *)v24 setProgressHandler:v25];
            v25[2](v25, 0.0);
            uint64_t v64 = 0;
            v65 = &v64;
            uint64_t v66 = 0x2020000000;
            int v67 = 0;
            uint64_t v26 = +[PHAssetResourceManager defaultManager];
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_3;
            v54[3] = &unk_1E5843928;
            v59 = v88;
            objc_copyWeak(&v63, &location);
            v60 = &v64;
            v54[4] = v21;
            id v55 = v45;
            v61 = &v72;
            v62 = v86;
            v27 = v25;
            id v58 = v27;
            v56 = v17;
            id v57 = v43;
            LODWORD(v25) = [v26 requestDataForAssetResource:v21 options:v47 dataReceivedHandler:&__block_literal_global_266 completionHandler:v54];

            *((_DWORD *)v65 + 6) = v25;
            v28 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              id v29 = (PHResourceLocalAvailabilityRequest *)objc_loadWeakRetained(&location);
              uint64_t v30 = v20;
              v31 = v17;
              int v32 = *((_DWORD *)v65 + 6);
              uint64_t v33 = [v21 originalFilename];
              *(_DWORD *)buf = 134218754;
              v91 = v29;
              __int16 v92 = 1026;
              *(_DWORD *)v93 = v32;
              *(_WORD *)&v93[4] = 2114;
              *(void *)&v93[6] = v33;
              *(_WORD *)&v93[14] = 2114;
              *(void *)&v93[16] = v45;
              _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_INFO, "[PHResourceLocalAvailabilityRequest:%p][Request ID: %{public}d] Requesting asset resource: %{public}@ for asset %{public}@", buf, 0x26u);

              __int16 v17 = v31;
              double v20 = v30;
            }
            if (!*((unsigned char *)v73 + 24))
            {
              v34 = [(PHResourceLocalAvailabilityRequest *)v40 _activeAssetResourcesRequest];
              v35 = [NSNumber numberWithInt:*((unsigned int *)v65 + 6)];
              [v34 addObject:v35];
            }
            _Block_object_dispose(&v64, 8);

            objc_destroyWeak(&v63);
            objc_destroyWeak(v20);
            _Block_object_dispose(&v72, 8);
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v76 objects:v94 count:16];
      }
      while (v19);
    }

    if (v39)
    {
      v36 = [v43 resultHandlerQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_268;
      block[3] = &unk_1E58439F0;
      id v50 = v39;
      v51 = v88;
      v52 = v86;
      uint64_t v53 = v37;
      dispatch_group_notify(v17, v36, block);
    }
  }
  else if (v39)
  {
    (*((void (**)(id, void, uint64_t, void, void))v39 + 2))(v39, *((unsigned __int8 *)v82 + 24), v10, MEMORY[0x1E4F1CC08], 0);
  }

  _Block_object_dispose(&v81, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(v86, 8);

  _Block_object_dispose(v88, 8);
}

uint64_t __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = AssetResourceIsReallyLocallyAvailable(a2);
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_264(uint64_t a1, double a2)
{
  double v3 = 0.99;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    double v3 = 1.0;
  }
  if (v3 <= a2) {
    a2 = v3;
  }
  double v4 = fmax(a2, 0.0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateCombinedProgressWithValue:*(void *)(a1 + 32) forRequestIdentifier:*(unsigned __int8 *)(a1 + 56) networkAccessAllowed:v4];
}

void __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3 == 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_4;
  aBlock[3] = &unk_1E5843900;
  objc_copyWeak(&v21, (id *)(a1 + 104));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 80);
  void aBlock[4] = v4;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 72);
  id v14 = v6;
  uint64_t v19 = v7;
  id v8 = v3;
  id v15 = v8;
  long long v20 = *(_OWORD *)(a1 + 88);
  id v17 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 48);
  int v9 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v9[2](v9);
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 56) resultHandlerQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_267;
    block[3] = &unk_1E5848D50;
    int v12 = v9;
    dispatch_async(v10, block);
  }
  objc_destroyWeak(&v21);
}

uint64_t __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_268(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), a1[7], MEMORY[0x1E4F1CC08], *(void *)(*(void *)(a1[6] + 8) + 40));
}

void __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v5 = [*(id *)(a1 + 32) originalFilename];
    uint64_t v6 = [*(id *)(a1 + 40) uuid];
    uint64_t v7 = (void *)v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    uint64_t v9 = *(void *)(a1 + 48);
    int v12 = 134219266;
    id v13 = WeakRetained;
    __int16 v14 = 1026;
    int v15 = v4;
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    id v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_INFO, "[PHResourceLocalAvailabilityRequest:%p][Request ID: %{public}d] Finished request for asset resource: %{public}@ for asset %{public}@. Success: %{public}@. Error: %{public}@", (uint8_t *)&v12, 0x3Au);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  id v10 = objc_loadWeakRetained((id *)(a1 + 104));
  [v10 _handleCompletionOfAssetResourceDataRequestWithId:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) error:*(void *)(a1 + 48)];

  int v11 = *(void **)(a1 + 48);
  if (v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v11);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    (*(void (**)(double))(*(void *)(a1 + 64) + 16))(1.0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __110__PHResourceLocalAvailabilityRequest__fetchResourcesForDuplicatingAsset_options_networkAccessAllowed_handler___block_invoke_267(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchResourcesForSharingAsset:(id)a3 options:(id)a4 networkAccessAllowed:(BOOL)a5 handler:(id)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v64 = 0;
  id v13 = [(id)objc_opt_class() _resourcesToShareForAsset:v10 options:v11 error:&v64];
  id v14 = v64;
  if (v13)
  {
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    char v63 = 1;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke;
    v59[3] = &unk_1E5843890;
    v59[4] = &v60;
    [v13 enumerateKeysAndObjectsUsingBlock:v59];
    int v15 = [v13 allValues];
    [(PHResourceLocalAvailabilityRequest *)self _setAssetResources:v15];

    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0;
    if (!*((unsigned char *)v61 + 24))
    {
      uint64_t v58 = 1;
      int v16 = [v10 deferredProcessingNeeded];
      if (v16 == 9)
      {
        id v17 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = [v10 uuid];
          [v10 deferredProcessingNeeded];
          uint64_t v18 = PLManagedAssetDeferredProcessingNeededDescription();
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v32;
          *(_WORD *)&buf[22] = 2114;
          uint64_t v30 = (void *)v18;
          uint64_t v66 = (uint64_t (*)(uint64_t, uint64_t))v18;
          _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Asset %@'s deferred processing state reports that it failed: %{public}@", buf, 0x20u);
        }
      }
      int v19 = [v10 needsDeferredProcessing] ^ 1;
      if (v16 == 9) {
        LOBYTE(v19) = 0;
      }
      if ((v19 & 1) == 0) {
        v56[3] = 2;
      }
    }
    if (a5)
    {
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x2020000000;
      char v53 = 1;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v66 = __Block_byref_object_copy__12080;
      int v67 = __Block_byref_object_dispose__12081;
      id v68 = 0;
      objc_initWeak(&location, self);
      dispatch_group_t v20 = dispatch_group_create();
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_240;
      v42[3] = &unk_1E5843950;
      objc_copyWeak(&v49, &location);
      id v31 = v14;
      id v21 = v10;
      id v43 = v21;
      __int16 v22 = v20;
      BOOL v50 = a5;
      uint64_t v44 = v22;
      v47 = v52;
      v48 = buf;
      id v23 = v11;
      id v24 = v11;
      id v45 = v24;
      id v46 = self;
      [v13 enumerateKeysAndObjectsUsingBlock:v42];
      v25 = dispatch_get_global_queue(25, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_258;
      block[3] = &unk_1E58439A0;
      id v39 = v52;
      id v34 = v24;
      v35 = self;
      id v36 = v21;
      id v37 = v13;
      v40 = buf;
      v41 = &v55;
      id v38 = v12;
      dispatch_group_notify(v22, v25, block);

      id v11 = v23;
      id v14 = v31;

      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(v52, 8);
    }
    else if (v12)
    {
      if (*((unsigned char *)v61 + 24))
      {
        uint64_t v26 = _AssetVersionFromRequestOptions(v11);
        id v54 = 0;
        v27 = [(id)objc_opt_class() _resourceInfoForAsset:v10 resourcesToShare:v13 assetVersion:v26 fulfillOnDemandResources:1 error:&v54];
        id v28 = v54;
        BOOL v29 = *((unsigned char *)v61 + 24) != 0;
      }
      else
      {
        BOOL v29 = 0;
        id v28 = 0;
        v27 = (void *)MEMORY[0x1E4F1CC08];
      }
      (*((void (**)(id, BOOL, uint64_t, void *, id))v12 + 2))(v12, v29, v56[3], v27, v28);
    }
    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v60, 8);
  }
  else if (v12)
  {
    (*((void (**)(id, void, void, void, id))v12 + 2))(v12, 0, 0, 0, v14);
  }
}

uint64_t __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = AssetResourceIsReallyLocallyAvailable(a3);
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_240(uint64_t a1, void *a2, void *a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v29 = a2;
  id v5 = a3;
  if ([v5 isLocallyAvailable])
  {
    uint64_t v6 = [v5 privateFileURL];

    if (v6)
    {
      uint64_t v7 = [v5 privateFileURL];
      char v8 = [v7 checkResourceIsReachableAndReturnError:0];

      if (v8)
      {
        uint64_t v9 = [v5 privateFileLoader];

        if (!v9) {
          goto LABEL_14;
        }
      }
      else
      {
        id v10 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
          id v12 = [v5 originalFilename];
          id v13 = [*(id *)(a1 + 32) uuid];
          *(_DWORD *)buf = 134218498;
          id v55 = WeakRetained;
          __int16 v56 = 2114;
          *(void *)uint64_t v57 = v12;
          *(_WORD *)&v57[8] = 2114;
          *(void *)&v57[10] = v13;
          _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Asset resource %{public}@ for asset %{public}@ marked locally available, but doesn't exist in file system. Possibly purged due to CacheDelete. Requesting download.", buf, 0x20u);
        }
      }
    }
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  id v14 = [NSString stringWithFormat:@"AssetResourceRequest-Type%@", v29];
  int v15 = objc_alloc_init(PHAssetResourceRequestOptions);
  [(PHAssetResourceRequestOptions *)v15 setNetworkAccessAllowed:*(unsigned __int8 *)(a1 + 88)];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  char v53 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_245;
  aBlock[3] = &unk_1E58438B8;
  v47 = &v50;
  objc_copyWeak(&v48, (id *)(a1 + 80));
  id v16 = v14;
  id v46 = v16;
  char v49 = *(unsigned char *)(a1 + 88);
  id v17 = (void (**)(void, double))_Block_copy(aBlock);
  [(PHAssetResourceRequestOptions *)v15 setProgressHandler:v17];
  v17[2](v17, 0.0);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  uint64_t v18 = +[PHAssetResourceManager defaultManager];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_3;
  v30[3] = &unk_1E5843928;
  uint64_t v36 = *(void *)(a1 + 64);
  objc_copyWeak(&v40, (id *)(a1 + 80));
  id v37 = &v41;
  id v19 = v5;
  id v31 = v19;
  id v32 = *(id *)(a1 + 32);
  id v38 = &v50;
  uint64_t v39 = *(void *)(a1 + 72);
  dispatch_group_t v20 = v17;
  id v35 = v20;
  id v33 = *(id *)(a1 + 40);
  id v34 = *(id *)(a1 + 48);
  int v21 = [v18 requestDataForAssetResource:v19 options:v15 dataReceivedHandler:&__block_literal_global_12123 completionHandler:v30];

  *((_DWORD *)v42 + 6) = v21;
  __int16 v22 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    id v23 = objc_loadWeakRetained((id *)(a1 + 80));
    int v24 = *((_DWORD *)v42 + 6);
    v25 = [v19 originalFilename];
    uint64_t v26 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    id v55 = v23;
    __int16 v56 = 1026;
    *(_DWORD *)uint64_t v57 = v24;
    *(_WORD *)&v57[4] = 2114;
    *(void *)&v57[6] = v25;
    *(_WORD *)&v57[14] = 2114;
    *(void *)&v57[16] = v26;
    _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p][Request ID: %{public}d] Requesting asset resource: %{public}@ for asset %{public}@", buf, 0x26u);
  }
  if (!*((unsigned char *)v51 + 24))
  {
    v27 = [*(id *)(a1 + 56) _activeAssetResourcesRequest];
    id v28 = [NSNumber numberWithInt:*((unsigned int *)v42 + 6)];
    [v27 addObject:v28];
  }
  _Block_object_dispose(&v41, 8);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&v48);
  _Block_object_dispose(&v50, 8);

LABEL_14:
}

void __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_258(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v2 = _AssetVersionFromRequestOptions(*(void **)(a1 + 32));
    id v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    id v15 = *(id *)(v6 + 40);
    uint64_t v7 = [v3 _resourceInfoForAsset:v4 resourcesToShare:v5 assetVersion:v2 fulfillOnDemandResources:0 error:&v15];
    objc_storeStrong((id *)(v6 + 40), v15);
  }
  else
  {
    uint64_t v7 = 0;
  }
  char v8 = [*(id *)(a1 + 32) resultHandlerQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_2_259;
  block[3] = &unk_1E5843978;
  long long v14 = *(_OWORD *)(a1 + 80);
  id v9 = *(id *)(a1 + 64);
  id v12 = v7;
  id v13 = v9;
  id v10 = v7;
  dispatch_async(v8, block);
}

uint64_t __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_2_259(void *a1)
{
  if (!*(void *)(*(void *)(a1[6] + 8) + 40)) {
    *(void *)(*(void *)(a1[7] + 8) + 24) = 0;
  }
  return (*(uint64_t (**)(void, BOOL, void))(a1[5] + 16))(a1[5], a1[4] != 0, *(void *)(*(void *)(a1[7] + 8) + 24));
}

void __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_245(uint64_t a1, double a2)
{
  double v3 = 0.99;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    double v3 = 1.0;
  }
  if (v3 <= a2) {
    a2 = v3;
  }
  double v4 = fmax(a2, 0.0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateCombinedProgressWithValue:*(void *)(a1 + 32) forRequestIdentifier:*(unsigned __int8 *)(a1 + 56) networkAccessAllowed:v4];
}

void __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v3 == 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_4;
  aBlock[3] = &unk_1E5843900;
  objc_copyWeak(&v20, (id *)(a1 + 104));
  uint64_t v17 = *(void *)(a1 + 80);
  id v12 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 72);
  id v13 = v4;
  uint64_t v18 = v5;
  id v6 = v3;
  id v14 = v6;
  long long v19 = *(_OWORD *)(a1 + 88);
  id v16 = *(id *)(a1 + 64);
  id v15 = *(id *)(a1 + 48);
  uint64_t v7 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v7[2](v7);
  }
  else
  {
    char v8 = [*(id *)(a1 + 56) resultHandlerQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_255;
    block[3] = &unk_1E5848D50;
    id v10 = v7;
    dispatch_async(v8, block);
  }
  objc_destroyWeak(&v20);
}

void __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    uint64_t v5 = [*(id *)(a1 + 32) originalFilename];
    uint64_t v6 = [*(id *)(a1 + 40) uuid];
    uint64_t v7 = (void *)v6;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
      char v8 = @"YES";
    }
    else {
      char v8 = @"NO";
    }
    uint64_t v9 = *(void *)(a1 + 48);
    int v12 = 134219266;
    id v13 = WeakRetained;
    __int16 v14 = 1026;
    int v15 = v4;
    __int16 v16 = 2114;
    uint64_t v17 = v5;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    __int16 v20 = 2114;
    int v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p][Request ID: %{public}d] Finished request for asset resource: %{public}@ for asset %{public}@. Success: %{public}@. Error: %{public}@", (uint8_t *)&v12, 0x3Au);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  id v10 = objc_loadWeakRetained((id *)(a1 + 104));
  [v10 _handleCompletionOfAssetResourceDataRequestWithId:*(unsigned int *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) error:*(void *)(a1 + 48)];

  id v11 = *(void **)(a1 + 48);
  if (v11) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), v11);
  }
  else {
    (*(void (**)(double))(*(void *)(a1 + 64) + 16))(1.0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __106__PHResourceLocalAvailabilityRequest__fetchResourcesForSharingAsset_options_networkAccessAllowed_handler___block_invoke_255(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_fetchResourcesForPickerAsset:(id)a3 options:(id)a4 networkAccessAllowed:(BOOL)a5 handler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v34 = a4;
  id v35 = a6;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  char v73 = 1;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v71[3] = 0;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = __Block_byref_object_copy__12080;
  v69[4] = __Block_byref_object_dispose__12081;
  id v70 = 0;
  objc_initWeak(&location, self);
  id v11 = dispatch_group_create();
  uint64_t v12 = [v10 mediaType];
  if (v12 == 1)
  {
    dispatch_group_enter(v11);
    id v13 = objc_alloc_init(PHImageRequestOptions);
    [(PHImageRequestOptions *)v13 setNetworkAccessAllowed:v7];
    [(PHImageRequestOptions *)v13 setVersion:0];
    [(PHImageRequestOptions *)v13 setLoadingMode:0x10000];
    [(PHImageRequestOptions *)v13 setDeliveryMode:1];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke;
    v65[3] = &unk_1E58437F0;
    id v33 = &v66;
    objc_copyWeak(&v66, &location);
    BOOL v67 = v7;
    int v21 = _Block_copy(v65);
    [(PHImageRequestOptions *)v13 setProgressHandler:v21];
    if (v7)
    {
      __int16 v22 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = objc_loadWeakRetained(&location);
        *(_DWORD *)buf = 134218498;
        id v75 = v23;
        __int16 v76 = 2112;
        id v77 = v10;
        __int16 v78 = 2112;
        id v79 = v34;
        _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Requesting download of current image for asset: %@, options: %@", buf, 0x20u);
      }
    }
    uint64_t v24 = +[PHImageManager defaultManager];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_221;
    v60[3] = &unk_1E5843818;
    BOOL v64 = v7;
    v62[1] = v72;
    v62[2] = v69;
    v62[3] = v71;
    __int16 v18 = &v63;
    objc_copyWeak(&v63, &location);
    id v19 = v21;
    v62[0] = v19;
    group = v11;
    v61 = group;
    objc_msgSend(v24, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v10, 0, v13, v60, -1.0, -1.0);

    LODWORD(v24) = [v34 treatLivePhotoAsStill];
    id v32 = (id *)v62;
    __int16 v20 = (id *)&v61;
    if (([v10 canPlayPhotoIris] ^ 1 | v24)) {
      goto LABEL_19;
    }
    dispatch_group_enter(group);
    uint64_t v17 = objc_alloc_init(PHVideoRequestOptions);
    [(PHVideoRequestOptions *)v17 setNetworkAccessAllowed:v7];
    [(PHVideoRequestOptions *)v17 setVersion:0];
    [(PHVideoRequestOptions *)v17 setDeliveryMode:1];
    [(PHVideoRequestOptions *)v17 setVideoComplementAllowed:1];
    [(PHVideoRequestOptions *)v17 setRestrictToPlayableOnCurrentDevice:1];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_230;
    v57[3] = &unk_1E58437F0;
    objc_copyWeak(&v58, &location);
    BOOL v59 = v7;
    uint64_t v30 = _Block_copy(v57);
    [(PHVideoRequestOptions *)v17 setProgressHandler:v30];
    if (v7)
    {
      v25 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = objc_loadWeakRetained(&location);
        *(_DWORD *)buf = 134218498;
        id v75 = v26;
        __int16 v76 = 2112;
        id v77 = v10;
        __int16 v78 = 2112;
        id v79 = v34;
        _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Requesting download of current video for asset: %@, options: %@", buf, 0x20u);
      }
    }
    v27 = +[PHImageManager defaultManager];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_234;
    v49[3] = &unk_1E5843840;
    BOOL v56 = v7;
    uint64_t v52 = v72;
    char v53 = v69;
    id v54 = v71;
    objc_copyWeak(&v55, &location);
    id v28 = v30;
    id v51 = v28;
    uint64_t v50 = group;
    [v27 requestAVAssetForVideo:v10 options:v17 resultHandler:v49];

    objc_destroyWeak(&v55);
    objc_destroyWeak(&v58);
  }
  else
  {
    if (v12 != 2) {
      goto LABEL_20;
    }
    dispatch_group_enter(v11);
    id v13 = objc_alloc_init(PHVideoRequestOptions);
    [(PHImageRequestOptions *)v13 setNetworkAccessAllowed:v7];
    [(PHImageRequestOptions *)v13 setVersion:0];
    [(PHImageRequestOptions *)v13 setDeliveryMode:1];
    [(PHImageRequestOptions *)v13 setRestrictToPlayableOnCurrentDevice:1];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_236;
    aBlock[3] = &unk_1E58437F0;
    id v33 = &v47;
    objc_copyWeak(&v47, &location);
    BOOL v48 = v7;
    __int16 v14 = _Block_copy(aBlock);
    [(PHImageRequestOptions *)v13 setProgressHandler:v14];
    if (v7)
    {
      int v15 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = objc_loadWeakRetained(&location);
        *(_DWORD *)buf = 134218498;
        id v75 = v16;
        __int16 v76 = 2112;
        id v77 = v10;
        __int16 v78 = 2112;
        id v79 = v34;
        _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Requesting download of current video for asset: %@, options: %@", buf, 0x20u);
      }
    }
    uint64_t v17 = +[PHImageManager defaultManager];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_237;
    v41[3] = &unk_1E5843840;
    BOOL v45 = v7;
    v43[1] = v72;
    v43[2] = v69;
    v43[3] = v71;
    __int16 v18 = &v44;
    objc_copyWeak(&v44, &location);
    id v19 = v14;
    v43[0] = v19;
    v42 = v11;
    [(PHVideoRequestOptions *)v17 requestAVAssetForVideo:v10 options:v13 resultHandler:v41];
    id v32 = (id *)v43;
    __int16 v20 = (id *)&v42;
  }

LABEL_19:
  objc_destroyWeak(v18);

  objc_destroyWeak(v33);
LABEL_20:
  if (v35)
  {
    id v29 = [v34 resultHandlerQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_238;
    block[3] = &unk_1E5843868;
    id v37 = v35;
    id v38 = v72;
    uint64_t v39 = v71;
    id v40 = v69;
    dispatch_group_notify(v11, v29, block);
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(v69, 8);

  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v72, 8);
}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke(uint64_t a1, double a2, uint64_t a3, unsigned char *a4)
{
  BOOL v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCombinedProgressWithValue:@"ImageCurrentVersion" forRequestIdentifier:*(unsigned __int8 *)(a1 + 40) networkAccessAllowed:a2];

  id v9 = objc_loadWeakRetained(v7);
  if (!v9
    || (id v10 = v9,
        id v11 = objc_loadWeakRetained(v7),
        int v12 = [v11 _isDownloadCancelled],
        v11,
        v10,
        v12))
  {
    *a4 = 1;
  }
}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_221(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"PHImageFileURLKey"];
  if (!v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v6 = [v4 objectForKeyedSubscript:@"PHImageErrorKey"];
      if (v6) {
        uint64_t v7 = 4;
      }
      else {
        uint64_t v7 = 3;
      }
      uint64_t v8 = _PHResourceLocalAvailabilityRequestError(v7, v6, 0);
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
  id v11 = [v4 objectForKeyedSubscript:@"PHImageResultIsInCloudKey"];
  int v12 = [v11 BOOLValue];

  if (v12) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    id v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        int v15 = @"Y";
      }
      else {
        int v15 = @"N";
      }
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      _PHResourceLocalAvailabilityRequestResourceAvailabilityDescription(*(void *)(*(void *)(*(void *)(a1 + 64)
                                                                                               + 8)
      uint64_t v17 = + 24));
      *(_DWORD *)__int16 v20 = 134218754;
      *(void *)&v20[4] = WeakRetained;
      __int16 v21 = 2112;
      __int16 v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Request for current image finished with success: %@, error: %@, availability: %@", v20, 0x2Au);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v20[0] = 0;
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = objc_msgSend(v4, "objectForKeyedSubscript:", @"PHImageErrorKey", *(void *)v20);
    (*(void (**)(uint64_t, void *, unsigned char *, id, double))(v18 + 16))(v18, v19, v20, v4, 1.0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_230(uint64_t a1, double a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCombinedProgressWithValue:@"VideoCurrentVersion" forRequestIdentifier:*(unsigned __int8 *)(a1 + 40) networkAccessAllowed:a2];

  id v9 = objc_loadWeakRetained(v7);
  if (!v9
    || (id v10 = v9,
        id v11 = objc_loadWeakRetained(v7),
        int v12 = [v11 _isDownloadCancelled],
        v11,
        v10,
        v12))
  {
    *a4 = 1;
  }
}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_234(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (*(unsigned char *)(a1 + 80))
    {
      id v11 = [v9 objectForKeyedSubscript:@"PHImageErrorKey"];
      if (v11) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = 3;
      }
      uint64_t v13 = _PHResourceLocalAvailabilityRequestError(v12, v11, 0);
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      int v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  uint64_t v16 = [v10 objectForKeyedSubscript:@"PHImageResultIsInCloudKey"];
  int v17 = [v16 BOOLValue];

  if (v17) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v18 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        __int16 v20 = @"Y";
      }
      else {
        __int16 v20 = @"N";
      }
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      _PHResourceLocalAvailabilityRequestResourceAvailabilityDescription(*(void *)(*(void *)(*(void *)(a1 + 64)
                                                                                               + 8)
      __int16 v22 = + 24));
      *(_DWORD *)__int16 v25 = 134218754;
      *(void *)&v25[4] = WeakRetained;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      id v31 = v22;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Request for current video finished with success: %@, error: %@, availability: %@", v25, 0x2Au);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v25[0] = 0;
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = objc_msgSend(v10, "objectForKeyedSubscript:", @"PHImageErrorKey", *(void *)v25);
    (*(void (**)(uint64_t, void *, unsigned char *, void *, double))(v23 + 16))(v23, v24, v25, v10, 1.0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_236(uint64_t a1, double a2, uint64_t a3, unsigned char *a4)
{
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateCombinedProgressWithValue:@"VideoCurrentVersion" forRequestIdentifier:*(unsigned __int8 *)(a1 + 40) networkAccessAllowed:a2];

  id v9 = objc_loadWeakRetained(v7);
  if (!v9
    || (id v10 = v9,
        id v11 = objc_loadWeakRetained(v7),
        int v12 = [v11 _isDownloadCancelled],
        v11,
        v10,
        v12))
  {
    *a4 = 1;
  }
}

void __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_237(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (*(unsigned char *)(a1 + 80))
    {
      id v11 = [v9 objectForKeyedSubscript:@"PHImageErrorKey"];
      if (v11) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = 3;
      }
      uint64_t v13 = _PHResourceLocalAvailabilityRequestError(v12, v11, 0);
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      int v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
  uint64_t v16 = [v10 objectForKeyedSubscript:@"PHImageResultIsInCloudKey"];
  int v17 = [v16 BOOLValue];

  if (v17) {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v18 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        __int16 v20 = @"Y";
      }
      else {
        __int16 v20 = @"N";
      }
      uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      _PHResourceLocalAvailabilityRequestResourceAvailabilityDescription(*(void *)(*(void *)(*(void *)(a1 + 64)
                                                                                               + 8)
      __int16 v22 = + 24));
      *(_DWORD *)__int16 v25 = 134218754;
      *(void *)&v25[4] = WeakRetained;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      __int16 v30 = 2112;
      id v31 = v22;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Request for current video finished with success: %@, error: %@, availability: %@", v25, 0x2Au);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v25[0] = 0;
    uint64_t v23 = *(void *)(a1 + 40);
    uint64_t v24 = objc_msgSend(v10, "objectForKeyedSubscript:", @"PHImageErrorKey", *(void *)v25);
    (*(void (**)(uint64_t, void *, unsigned char *, void *, double))(v23 + 16))(v23, v24, v25, v10, 1.0);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __105__PHResourceLocalAvailabilityRequest__fetchResourcesForPickerAsset_options_networkAccessAllowed_handler___block_invoke_238(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 24), MEMORY[0x1E4F1CC08], *(void *)(*(void *)(a1[7] + 8) + 40));
}

- (void)_fetchResourcesWithOptions:(id)a3 networkAccessAllowed:(BOOL)a4 handler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!MEMORY[0x19F388B10]()) {
    goto LABEL_13;
  }
  id v10 = (void *)CFPreferencesCopyAppValue(@"PHRootSettings", @"com.apple.mobileslideshow");
  id v11 = [v10 objectForKeyedSubscript:@"archive"];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"resourceDownloadSettings"];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = [v12 objectForKeyedSubscript:@"simulateDownload"];
    char v15 = [v14 BOOLValue];

    if (v15)
    {
      uint64_t v16 = [v13 objectForKeyedSubscript:@"simulateDownloadFailure"];
      int v17 = [v16 BOOLValue];

      goto LABEL_10;
    }

LABEL_13:
    int64_t v26 = [(PHResourceLocalAvailabilityRequest *)self requestType];
    if (v26 == 2)
    {
      uint64_t v27 = [(PHResourceLocalAvailabilityRequest *)self asset];
      [(PHResourceLocalAvailabilityRequest *)self _fetchResourcesForDuplicatingAsset:v27 options:v8 networkAccessAllowed:v6 handler:v9];
    }
    else if (v26 == 1)
    {
      uint64_t v27 = [(PHResourceLocalAvailabilityRequest *)self asset];
      [(PHResourceLocalAvailabilityRequest *)self _fetchResourcesForSharingAsset:v27 options:v8 networkAccessAllowed:v6 handler:v9];
    }
    else
    {
      if (v26) {
        goto LABEL_20;
      }
      uint64_t v27 = [(PHResourceLocalAvailabilityRequest *)self asset];
      [(PHResourceLocalAvailabilityRequest *)self _fetchResourcesForPickerAsset:v27 options:v8 networkAccessAllowed:v6 handler:v9];
    }

    goto LABEL_20;
  }
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  uint64_t v18 = (void *)CFPreferencesCopyAppValue(@"SimulateDownloads", @"com.apple.mobileslideshow");
  id v19 = v18;
  if (v18)
  {
    __int16 v20 = [v18 lowercaseString];
    int v21 = [v20 isEqualToString:@"no"] ^ 1;
  }
  else
  {
    int v21 = 0;
  }
  __int16 v22 = [v19 lowercaseString];
  int v17 = [v22 isEqualToString:@"failure"];

  if (!v21) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v23 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 134217984;
    uint64_t v29 = self;
    _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Simulating download", (uint8_t *)&v28, 0xCu);
  }

  double v24 = (double)arc4random_uniform(0x64u) / 20.0 + 5.0;
  __int16 v25 = [v8 resultHandlerQueue];
  [(PHResourceLocalAvailabilityRequest *)self _simulateFetchResourcesWithDuration:v17 ^ 1u success:v6 networkAccessAllowed:v25 queue:v9 handler:v24];

LABEL_20:
}

- (void)retrieveRequiredResourcesWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[v7 copy];
  id downloadCompletionHandler = self->_downloadCompletionHandler;
  self->_id downloadCompletionHandler = v8;

  objc_initWeak(&location, self);
  if (v6) {
    id v10 = (PHResourceLocalAvailabilityRequestOptions *)v6;
  }
  else {
    id v10 = objc_alloc_init(PHResourceLocalAvailabilityRequestOptions);
  }
  id v11 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __93__PHResourceLocalAvailabilityRequest_retrieveRequiredResourcesWithOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E58437C0;
  objc_copyWeak(&v15, &location);
  uint64_t v12 = v11;
  uint64_t v14 = v12;
  [(PHResourceLocalAvailabilityRequest *)self _fetchResourcesWithOptions:v12 networkAccessAllowed:1 handler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __93__PHResourceLocalAvailabilityRequest_retrieveRequiredResourcesWithOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _didFinishDownloadWithSuccess:a2 resourceInfo:v8 error:v9];
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) resultHandlerQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93__PHResourceLocalAvailabilityRequest_retrieveRequiredResourcesWithOptions_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5843798;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    char v16 = a2;
    id v13 = v8;
    id v14 = v9;
    dispatch_async(v11, v12);

    objc_destroyWeak(&v15);
  }
}

void __93__PHResourceLocalAvailabilityRequest_retrieveRequiredResourcesWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didFinishDownloadWithSuccess:*(unsigned __int8 *)(a1 + 56) resourceInfo:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

- (void)fetchResourceAvailabilityWithOptions:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PHResourceLocalAvailabilityRequest.m", 215, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_5:
    id v9 = objc_alloc_init(PHResourceLocalAvailabilityRequestOptions);
    goto LABEL_6;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  id v9 = (PHResourceLocalAvailabilityRequestOptions *)v7;
LABEL_6:
  id v11 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __93__PHResourceLocalAvailabilityRequest_fetchResourceAvailabilityWithOptions_completionHandler___block_invoke;
  v13[3] = &unk_1E5843770;
  id v14 = v8;
  id v12 = v8;
  [(PHResourceLocalAvailabilityRequest *)self _fetchResourcesWithOptions:v11 networkAccessAllowed:0 handler:v13];
}

uint64_t __93__PHResourceLocalAvailabilityRequest_fetchResourceAvailabilityWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PHResourceLocalAvailabilityRequest)initWithAsset:(id)a3 requestType:(int64_t)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PHResourceLocalAvailabilityRequest.m", 184, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  if (a4 == 1 && (unint64_t)([v8 mediaType] - 1) >= 2)
  {
    char v16 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v8;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Invalid asset passed to initializer: %@", (uint8_t *)location, 0xCu);
    }

    id v15 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)PHResourceLocalAvailabilityRequest;
    id v9 = [(PHResourceLocalAvailabilityRequest *)&v21 init];
    id v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_asset, a3);
      v10->_requestType = a4;
      uint64_t v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
      progress = v10->_progress;
      v10->_progress = (NSProgress *)v11;

      uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
      activeAssetResourcesRequest = v10->__activeAssetResourcesRequest;
      v10->__activeAssetResourcesRequest = (NSMutableArray *)v13;

      objc_initWeak(location, v10);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __64__PHResourceLocalAvailabilityRequest_initWithAsset_requestType___block_invoke;
      v19[3] = &unk_1E58479D0;
      objc_copyWeak(&v20, location);
      [(NSProgress *)v10->_progress setCancellationHandler:v19];
      objc_destroyWeak(&v20);
      objc_destroyWeak(location);
    }
    self = v10;
    id v15 = self;
  }

  return v15;
}

void __64__PHResourceLocalAvailabilityRequest_initWithAsset_requestType___block_invoke(uint64_t a1)
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained cancelRetrievalRequest];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PHResourceLocalAvailabilityRequest_initWithAsset_requestType___block_invoke_2;
    block[3] = &unk_1E58479D0;
    objc_copyWeak(&v4, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v4);
  }
}

void __64__PHResourceLocalAvailabilityRequest_initWithAsset_requestType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancelRetrievalRequest];
}

- (PHResourceLocalAvailabilityRequest)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHResourceLocalAvailabilityRequest.m", 179, @"%s is not available as initializer", "-[PHResourceLocalAvailabilityRequest init]");

  abort();
}

+ (id)resourceInfoForSharingAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    int v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PHResourceLocalAvailabilityRequest.m", 1849, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  if ((unint64_t)([v9 mediaType] - 1) >= 2)
  {
    double v24 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v9;
      _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Returning nil for invalid asset: %@", buf, 0xCu);
    }

    if (a5)
    {
      _PHResourceLocalAvailabilityRequestError(0, 0, 0);
      id v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v25 = 0;
    }
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C9C8] now];
    id v30 = 0;
    uint64_t v11 = [a1 _resourcesToShareForAsset:v9 asUnmodifiedOriginal:v6 error:&v30];
    id v12 = v30;
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] now];
    [v13 timeIntervalSinceDate:v10];
    id v15 = v14;
    if ([v11 count])
    {
      if (v6) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 0;
      }
      int v17 = [MEMORY[0x1E4F1C9C8] now];
      id v29 = v12;
      uint64_t v18 = [a1 _resourceInfoForAsset:v9 resourcesToShare:v11 assetVersion:v16 fulfillOnDemandResources:1 error:&v29];
      id v19 = v29;

      id v20 = [MEMORY[0x1E4F1C9C8] now];
      [v20 timeIntervalSinceDate:v17];
      __int16 v22 = v21;
      uint64_t v23 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        id v32 = v15;
        __int16 v33 = 2048;
        id v34 = v22;
        _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Resources to share duration %.5f, Resource info duration: %.5f", buf, 0x16u);
      }

      id v12 = v19;
    }
    else
    {
      int v17 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v32 = v9;
        __int16 v33 = 2112;
        id v34 = v12;
        _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Found no resources to share for asset: %@ error: %@", buf, 0x16u);
      }
      uint64_t v18 = 0;
    }

    if (a5 && v12) {
      *a5 = v12;
    }
    if (v12) {
      int64_t v26 = 0;
    }
    else {
      int64_t v26 = v18;
    }
    id v25 = v26;
  }

  return v25;
}

+ (id)indexesForAssetsWithoutThumbnails:(id)a3 requestType:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"PHResourceLocalAvailabilityRequest.m", 1830, @"Invalid parameter not satisfying: %@", @"assets" object file lineNumber description];
  }
  if (a4 != 1)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PHResourceLocalAvailabilityRequest.m", 1831, @"Invalid parameter not satisfying: %@", @"requestType == PHResourceRequestTypeForSharing" object file lineNumber description];
  }
  id v8 = [MEMORY[0x1E4F28E60] indexSet];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __84__PHResourceLocalAvailabilityRequest_indexesForAssetsWithoutThumbnails_requestType___block_invoke;
  v13[3] = &unk_1E58452C0;
  id v9 = v8;
  id v14 = v9;
  [v7 enumerateObjectsUsingBlock:v13];

  return v9;
}

void __84__PHResourceLocalAvailabilityRequest_indexesForAssetsWithoutThumbnails_requestType___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ((unint64_t)([v5 mediaType] - 1) >= 2)
  {
    BOOL v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Skipping invalid asset: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if ([v5 thumbnailIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

+ (id)indexesForAssetsRequiringResourceRetrieval:(id)a3 requestType:(int64_t)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PHResourceLocalAvailabilityRequest.m", 1807, @"Invalid parameter not satisfying: %@", @"assets" object file lineNumber description];
  }
  if (a4 != 1)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHResourceLocalAvailabilityRequest.m", 1808, @"Invalid parameter not satisfying: %@", @"requestType == PHResourceRequestTypeForSharing" object file lineNumber description];
  }
  uint64_t v11 = [MEMORY[0x1E4F28E60] indexSet];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __101__PHResourceLocalAvailabilityRequest_indexesForAssetsRequiringResourceRetrieval_requestType_options___block_invoke;
  v19[3] = &unk_1E5843B08;
  id v22 = a1;
  id v20 = v10;
  id v12 = v11;
  id v21 = v12;
  id v13 = v10;
  [v9 enumerateObjectsUsingBlock:v19];
  id v14 = v21;
  id v15 = v12;

  return v15;
}

void __101__PHResourceLocalAvailabilityRequest_indexesForAssetsRequiringResourceRetrieval_requestType_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ((unint64_t)([v5 mediaType] - 1) >= 2)
  {
    BOOL v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Skipping invalid asset: %@", buf, 0xCu);
    }
  }
  else
  {
    BOOL v6 = [*(id *)(a1 + 48) _resourcesToShareForAsset:v5 options:*(void *)(a1 + 32) error:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __101__PHResourceLocalAvailabilityRequest_indexesForAssetsRequiringResourceRetrieval_requestType_options___block_invoke_370;
    v7[3] = &unk_1E5843AE0;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = a3;
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

uint64_t __101__PHResourceLocalAvailabilityRequest_indexesForAssetsRequiringResourceRetrieval_requestType_options___block_invoke_370(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = AssetResourceIsReallyLocallyAvailable(a3);
  if ((result & 1) == 0)
  {
    uint64_t result = [*(id *)(a1 + 32) addIndex:*(void *)(a1 + 40)];
    *a4 = 1;
  }
  return result;
}

+ (id)indexesForAssetsRequiringResourceRetrieval:(id)a3 requestType:(int64_t)a4
{
  return (id)[a1 indexesForAssetsRequiringResourceRetrieval:a3 requestType:a4 options:0];
}

+ (id)_resourceInfoForAsset:(id)a3 resourcesToShare:(id)a4 assetVersion:(int64_t)a5 fulfillOnDemandResources:(BOOL)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  __int16 v33 = __Block_byref_object_copy__12080;
  id v34 = __Block_byref_object_dispose__12081;
  id v35 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __121__PHResourceLocalAvailabilityRequest__resourceInfoForAsset_resourcesToShare_assetVersion_fulfillOnDemandResources_error___block_invoke;
  v22[3] = &unk_1E5843A90;
  BOOL v29 = a6;
  id v16 = v13;
  id v23 = v16;
  int64_t v26 = a5;
  id v17 = v15;
  id v24 = v17;
  id v25 = &v30;
  SEL v27 = a2;
  id v28 = a1;
  [v14 enumerateKeysAndObjectsUsingBlock:v22];
  uint64_t v18 = (void *)v31[5];
  if (a7 && v18)
  {
    *a7 = v18;
    uint64_t v18 = (void *)v31[5];
  }
  if (v18) {
    id v19 = 0;
  }
  else {
    id v19 = v17;
  }
  id v20 = v19;

  _Block_object_dispose(&v30, 8);

  return v20;
}

void __121__PHResourceLocalAvailabilityRequest__resourceInfoForAsset_resourcesToShare_assetVersion_fulfillOnDemandResources_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v53 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!*(unsigned char *)(a1 + 80)) {
    goto LABEL_14;
  }
  id v8 = v6;
  uint64_t v54 = 0;
  id v55 = &v54;
  uint64_t v56 = 0x3032000000;
  uint64_t v57 = __Block_byref_object_copy__12080;
  id v58 = __Block_byref_object_dispose__12081;
  id v59 = 0;
  uint64_t v9 = [v8 privateFileLoader];
  BOOL v10 = v9 == 0;

  if (!v10)
  {
    id v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v8;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Will fulfill on-demand resource: %@", buf, 0xCu);
    }

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    id v13 = objc_alloc_init(PHAssetResourceRequestOptions);
    [(PHAssetResourceRequestOptions *)v13 setNetworkAccessAllowed:0];
    id v14 = +[PHAssetResourceManager defaultManager];
    *(void *)&long long v60 = MEMORY[0x1E4F143A8];
    *((void *)&v60 + 1) = 3221225472;
    v61 = ___FulfillOnDemandResource_block_invoke_2;
    uint64_t v62 = &unk_1E5843B58;
    id v15 = v8;
    id v63 = v15;
    v65 = &v54;
    id v16 = v12;
    BOOL v64 = v16;
    [v14 requestDataForAssetResource:v15 options:v13 dataReceivedHandler:&__block_literal_global_613 completionHandler:&v60];

    dispatch_time_t v17 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v16, v17))
    {
      uint64_t v18 = [NSString stringWithFormat:@"Timed out resolving on-demand resource: %@", v15];
      id v19 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v67 = v18;
        _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] %@", buf, 0xCu);
      }

      uint64_t v20 = _PHResourceLocalAvailabilityRequestError(1, 0, v18);
      id v21 = (void *)v55[5];
      v55[5] = v20;
    }
  }
  id v22 = (void *)v55[5];
  if (!v22)
  {
    _Block_object_dispose(&v54, 8);

LABEL_14:
    id v26 = 0;
    goto LABEL_15;
  }
  id v23 = v22;
  BOOL v24 = v55[5] == 0;
  _Block_object_dispose(&v54, 8);

  id v25 = v23;
  id v26 = v25;
  if (!v24)
  {
    uint64_t v27 = *(void *)(*(void *)(a1 + 48) + 8);
    id v26 = v25;
    id v28 = *(__CFString **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
    goto LABEL_42;
  }
LABEL_15:
  unint64_t v29 = [v53 integerValue];
  uint64_t v30 = *(void *)(a1 + 56);
  id v31 = *(id *)(a1 + 32);
  uint64_t v32 = v31;
  if (v29 - 19 >= 4)
  {
    if (v30 != 1)
    {
      id v28 = 0;
      if (v29 <= 0x11)
      {
        if (((1 << v29) & 0x235C0) != 0)
        {
          id v28 = @"PHResourceLocalAvailabilityRequestVideoURLKey";
        }
        else if (((1 << v29) & 0x3C) != 0)
        {
          id v28 = @"PHResourceLocalAvailabilityRequestPhotoURLKey";
        }
        else if (((1 << v29) & 0x10002) != 0)
        {
          uint64_t v47 = [v31 mediaType];
          id v28 = @"PHResourceLocalAvailabilityRequestVideoURLKey";
          if (v47 != 2)
          {
            if (v47 == 1)
            {
              if (((v30 != 2) & [v32 canPlayLoopingVideo]) == 0) {
                id v28 = @"PHResourceLocalAvailabilityRequestPhotoURLKey";
              }
            }
            else
            {
              BOOL v48 = [MEMORY[0x1E4F28B00] currentHandler];
              char v49 = objc_msgSend(NSString, "stringWithUTF8String:", "PHResourceLocalAvailabilityRequestResourceInfoKey _DictionaryKeyForResourceType(_PHResourceLocalAvailabilityRequestResourceType, PHAsset *__strong, _PHResourceLocalAvailabilityRequestAssetVersion)");
              [v48 handleFailureInFunction:v49 file:@"PHResourceLocalAvailabilityRequest.m" lineNumber:1661 description:@"Code which should be unreachable has been reached"];

              id v28 = 0;
            }
          }
        }
      }
      goto LABEL_32;
    }
    uint64_t v33 = [v31 mediaType];
    if (v33 == 2)
    {
      uint64_t v34 = +[PHResourceLocalAvailabilityRequest resourceInfoKeysForResourceTypesForVideos];
    }
    else
    {
      if (v33 != 1)
      {
        id v35 = 0;
        goto LABEL_29;
      }
      uint64_t v34 = +[PHResourceLocalAvailabilityRequest resourceInfoKeysForResourceTypesForPhotos];
    }
    id v35 = (void *)v34;
LABEL_29:
    uint64_t v36 = [NSNumber numberWithInteger:v29];
    id v28 = [v35 objectForKeyedSubscript:v36];

    if (!v28)
    {
      uint64_t v50 = [MEMORY[0x1E4F28B00] currentHandler];
      id v51 = objc_msgSend(NSString, "stringWithUTF8String:", "PHResourceLocalAvailabilityRequestResourceInfoKey _DictionaryKeyForResourceType(_PHResourceLocalAvailabilityRequestResourceType, PHAsset *__strong, _PHResourceLocalAvailabilityRequestAssetVersion)");
      objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, @"PHResourceLocalAvailabilityRequest.m", 1640, @"Did not find a PHResourceLocalAvailabilityRequestResourceInfoKey for _PHResourceLocalAvailabilityRequestResourceType: %lu", v29);
    }
    goto LABEL_32;
  }
  id v28 = off_1E5843B90[v29 - 19];
LABEL_32:

  id v37 = +[PHResourceLocalAvailabilityRequest utiKeysForURLKeys];
  id v38 = [v37 objectForKeyedSubscript:v28];

  uint64_t v39 = [v7 privateFileURL];
  id v40 = [v7 uniformTypeIdentifier];
  if (v28 && v39) {
    [*(id *)(a1 + 40) setObject:v39 forKeyedSubscript:v28];
  }
  if (v38 && v40)
  {
    [*(id *)(a1 + 40) setObject:v40 forKeyedSubscript:v38];
  }
  else
  {
    uint64_t v41 = objc_msgSend(MEMORY[0x1E4F59940], "descriptionForResourceType:", objc_msgSend(v53, "integerValue"));
    v42 = [NSString stringWithFormat:@"Failed to create resource info entry for asset:%@, resource:%@ (%@), url key:%@, url:%@, uti key:%@, uti:%@", *(void *)(a1 + 32), v41, v53, v28, v39, v38, v40];
    uint64_t v43 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v60) = 138412290;
      *(void *)((char *)&v60 + 4) = v42;
      _os_log_impl(&dword_19B043000, v43, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] %@", (uint8_t *)&v60, 0xCu);
    }

    uint64_t v44 = _PHResourceLocalAvailabilityRequestError(2, 0, v42);
    uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8);
    id v46 = *(void **)(v45 + 40);
    *(void *)(v45 + 40) = v44;
  }
LABEL_42:

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *a4 = 1;
  }
}

+ (id)utiKeysForURLKeys
{
  if (utiKeysForURLKeys_onceToken != -1) {
    dispatch_once(&utiKeysForURLKeys_onceToken, &__block_literal_global_348);
  }
  uint64_t v2 = (void *)utiKeysForURLKeys_utiKeysForURLKeys;

  return v2;
}

void __55__PHResourceLocalAvailabilityRequest_utiKeysForURLKeys__block_invoke()
{
  v3[15] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PHResourceLocalAvailabilityRequestPhotoURLKey";
  v2[1] = @"PHResourceLocalAvailabilityRequestVideoURLKey";
  v3[0] = @"PHResourceLocalAvailabilityRequestPhotoUTIKey";
  v3[1] = @"PHResourceLocalAvailabilityRequestVideoUTIKey";
  v2[2] = @"PHResourceLocalAvailabilityRequestAdjustmentDataURLKey";
  v2[3] = @"PHResourceLocalAvailabilityRequestAdjustmentDataBlobURLKey";
  v3[2] = @"PHResourceLocalAvailabilityRequestAdjustmentDataUTIKey";
  v3[3] = @"PHResourceLocalAvailabilityRequestAdjustmentDataBlobUTIKey";
  v2[4] = @"PHResourceLocalAvailabilityRequestOriginalAdjustmentDataURLKey";
  v2[5] = @"PHResourceLocalAvailabilityRequestAdjustmentSecondaryDataURLKey";
  v3[4] = @"PHResourceLocalAvailabilityRequestOriginalAdjustmentDataUTIKey";
  v3[5] = @"PHResourceLocalAvailabilityRequestAdjustmentSecondaryDataUTIKey";
  v2[6] = @"PHResourceLocalAvailabilityRequestAlternatePhotoURLKey";
  v2[7] = @"PHResourceLocalAvailabilityRequestFullSizePhotoURLKey";
  v3[6] = @"PHResourceLocalAvailabilityRequestAlternatePhotoUTIKey";
  v3[7] = @"PHResourceLocalAvailabilityRequestFullSizePhotoUTIKey";
  v2[8] = @"PHResourceLocalAvailabilityRequestFullSizeVideoURLKey";
  v2[9] = @"PHResourceLocalAvailabilityRequestAdjustmentBaseFullSizePhotoURLKey";
  v3[8] = @"PHResourceLocalAvailabilityRequestFullSizeVideoUTIKey";
  v3[9] = @"PHResourceLocalAvailabilityRequestAdjustmentBaseFullSizePhotoUTIKey";
  v2[10] = @"PHResourceLocalAvailabilityRequestAdjustmentBaseVideoURLKey";
  v2[11] = @"PHResourceLocalAvailabilityRequestAdjustmentBasePairedVideoURLKey";
  v3[10] = @"PHResourceLocalAvailabilityRequestAdjustmentBaseVideoUTIKey";
  v3[11] = @"PHResourceLocalAvailabilityRequestAdjustmentBasePairedVideoUTIKey";
  v2[12] = @"PHResourceLocalAvailabilityRequestSpatialOvercapturePhotoURLKey";
  v2[13] = @"PHResourceLocalAvailabilityRequestSpatialOvercaptureVideoURLKey";
  v3[12] = @"PHResourceLocalAvailabilityRequestSpatialOvercapturePhotoUTIKey";
  v3[13] = @"PHResourceLocalAvailabilityRequestSpatialOvercaptureVideoUTIKey";
  v2[14] = @"PHResourceLocalAvailabilityRequestSpatialOvercapturePairedVideoURLKey";
  v3[14] = @"PHResourceLocalAvailabilityRequestSpatialOvercapturePairedVideoUTIKey";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:15];
  v1 = (void *)utiKeysForURLKeys_utiKeysForURLKeys;
  utiKeysForURLKeys_utiKeysForURLKeys = v0;
}

+ (id)resourceInfoKeysForResourceTypesForVideos
{
  if (resourceInfoKeysForResourceTypesForVideos_onceToken != -1) {
    dispatch_once(&resourceInfoKeysForResourceTypesForVideos_onceToken, &__block_literal_global_346);
  }
  uint64_t v2 = (void *)resourceInfoKeysForResourceTypesForVideos_videoResourceInfoKeys;

  return v2;
}

void __79__PHResourceLocalAvailabilityRequest_resourceInfoKeysForResourceTypesForVideos__block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EEB252F0;
  v2[1] = &unk_1EEB253C8;
  v3[0] = @"PHResourceLocalAvailabilityRequestVideoURLKey";
  v3[1] = @"PHResourceLocalAvailabilityRequestFullSizeVideoURLKey";
  v2[2] = &unk_1EEB253E0;
  v2[3] = &unk_1EEB25350;
  v3[2] = @"PHResourceLocalAvailabilityRequestAdjustmentBaseVideoURLKey";
  v3[3] = @"PHResourceLocalAvailabilityRequestSpatialOvercaptureVideoURLKey";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)resourceInfoKeysForResourceTypesForVideos_videoResourceInfoKeys;
  resourceInfoKeysForResourceTypesForVideos_videoResourceInfoKeys = v0;
}

+ (id)resourceInfoKeysForResourceTypesForPhotos
{
  if (resourceInfoKeysForResourceTypesForPhotos_onceToken != -1) {
    dispatch_once(&resourceInfoKeysForResourceTypesForPhotos_onceToken, &__block_literal_global_344);
  }
  uint64_t v2 = (void *)resourceInfoKeysForResourceTypesForPhotos_photoResourceInfoKeys;

  return v2;
}

void __79__PHResourceLocalAvailabilityRequest_resourceInfoKeysForResourceTypesForPhotos__block_invoke()
{
  v3[9] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EEB252F0;
  v2[1] = &unk_1EEB25308;
  v3[0] = @"PHResourceLocalAvailabilityRequestPhotoURLKey";
  v3[1] = @"PHResourceLocalAvailabilityRequestAlternatePhotoURLKey";
  v2[2] = &unk_1EEB25320;
  v2[3] = &unk_1EEB25338;
  v3[2] = @"PHResourceLocalAvailabilityRequestFullSizePhotoURLKey";
  v3[3] = @"PHResourceLocalAvailabilityRequestAdjustmentBaseFullSizePhotoURLKey";
  void v2[4] = &unk_1EEB25350;
  v2[5] = &unk_1EEB25368;
  v3[4] = @"PHResourceLocalAvailabilityRequestSpatialOvercapturePhotoURLKey";
  void v3[5] = @"PHResourceLocalAvailabilityRequestVideoURLKey";
  v2[6] = &unk_1EEB25380;
  v2[7] = &unk_1EEB25398;
  v3[6] = @"PHResourceLocalAvailabilityRequestFullSizeVideoURLKey";
  v3[7] = @"PHResourceLocalAvailabilityRequestAdjustmentBasePairedVideoURLKey";
  v2[8] = &unk_1EEB253B0;
  v3[8] = @"PHResourceLocalAvailabilityRequestSpatialOvercapturePairedVideoURLKey";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:9];
  v1 = (void *)resourceInfoKeysForResourceTypesForPhotos_photoResourceInfoKeys;
  resourceInfoKeysForResourceTypesForPhotos_photoResourceInfoKeys = v0;
}

+ (id)_singularResourcesToShareForAsset:(id)a3 fromAvailableResources:(id)a4 options:(id)a5 useOriginalResources:(BOOL)a6 knownUnsupported:(BOOL)a7 error:(id *)a8
{
  BOOL v62 = a7;
  BOOL v8 = a6;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = [MEMORY[0x1E4F1CA60] dictionary];
  int v17 = [v15 includeOriginalResourcesOnly];
  int v18 = [v15 dontAllowRAW];
  char v19 = [v15 treatLivePhotoAsStill];
  if (v17)
  {
    int v18 = 0;
    char v20 = 0;
    BOOL v62 = 0;
    BOOL v8 = 1;
  }
  else
  {
    char v20 = v19;
  }
  switch(objc_msgSend(v13, "mediaType", a8))
  {
    case 0:
    case 3:
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2 object:a1 file:@"PHResourceLocalAvailabilityRequest.m" lineNumber:1292 description:@"Code which should be unreachable has been reached"];

      goto LABEL_6;
    case 1:
      char v25 = [v13 canPlayLoopingVideo];
      uint64_t v26 = [v13 playbackStyle];
      int v27 = v8 & v17 & [v13 isMediaSubtype:8] ^ 1;
      if (v26 == 3) {
        int v28 = 1;
      }
      else {
        int v28 = v27;
      }
      if (v28 == 1 && (v25 & 1) != 0)
      {
        id v22 = 0;
        id v23 = 0;
        BOOL v24 = v16;
        unint64_t v29 = v61;
        goto LABEL_47;
      }
      if (v8)
      {
        uint64_t v33 = [v14 objectForKeyedSubscript:&unk_1EEB252F0];
        if (v33)
        {
          id v22 = (void *)v33;
          uint64_t v34 = &unk_1EEB252F0;
LABEL_42:
          [v16 setObject:v22 forKeyedSubscript:v34];
          id v23 = 0;
          goto LABEL_43;
        }
      }
      uint64_t v36 = [v14 objectForKeyedSubscript:&unk_1EEB25320];
      if (v36)
      {
        id v22 = (void *)v36;
        uint64_t v34 = &unk_1EEB25320;
        goto LABEL_42;
      }
      uint64_t v38 = [v14 objectForKeyedSubscript:&unk_1EEB253F8];
      if (v38)
      {
        id v22 = (void *)v38;
        uint64_t v34 = &unk_1EEB253F8;
        goto LABEL_42;
      }
      uint64_t v40 = [v14 objectForKeyedSubscript:&unk_1EEB25410];
      if (v40)
      {
        id v22 = (void *)v40;
        uint64_t v34 = &unk_1EEB25410;
        goto LABEL_42;
      }
      uint64_t v42 = [v14 objectForKeyedSubscript:&unk_1EEB25428];
      if (v42)
      {
        id v22 = (void *)v42;
        uint64_t v34 = &unk_1EEB25428;
        goto LABEL_42;
      }
      if (v8 || ([v13 isRAW] & v18) != 1)
      {
        id v58 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413314;
          id v64 = v13;
          __int16 v65 = 2112;
          id v66 = v14;
          __int16 v67 = 2112;
          id v68 = v15;
          __int16 v69 = 1024;
          *(_DWORD *)id v70 = v8;
          *(_WORD *)&v70[4] = 1024;
          *(_DWORD *)&v70[6] = v62;
          _os_log_impl(&dword_19B043000, v58, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Found no photo resource to share for asset: %@, resources: %@, options: %@, useOriginalResources: %d, knownUnsupported: %d", buf, 0x2Cu);
        }

        _PHResourceLocalAvailabilityRequestError(0, 0, 0);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v56 = [v14 objectForKeyedSubscript:&unk_1EEB252F0];
        [v16 setObject:v56 forKeyedSubscript:&unk_1EEB252F0];

        id v23 = 0;
      }
      id v22 = 0;
LABEL_43:
      if (v26 == 3) {
        char v43 = 0;
      }
      else {
        char v43 = v27;
      }
      char v44 = v43 | v20;
      BOOL v24 = v16;
      unint64_t v29 = v61;
      if (v44) {
        goto LABEL_61;
      }
LABEL_47:
      if (v8)
      {
        uint64_t v45 = [v14 objectForKeyedSubscript:&unk_1EEB25368];

        if (v45)
        {
          id v46 = &unk_1EEB25368;
LABEL_53:
          [v24 setObject:v45 forKeyedSubscript:v46];
          id v22 = (void *)v45;
          goto LABEL_61;
        }
        id v22 = 0;
      }
      uint64_t v45 = [v14 objectForKeyedSubscript:&unk_1EEB25380];

      if (v45)
      {
        id v46 = &unk_1EEB25380;
        goto LABEL_53;
      }
      uint64_t v47 = [v14 objectForKeyedSubscript:&unk_1EEB25440];
      if (v47)
      {
        id v22 = (void *)v47;
        BOOL v48 = &unk_1EEB25440;
LABEL_60:
        [v24 setObject:v22 forKeyedSubscript:v48];
        goto LABEL_61;
      }
      uint64_t v49 = [v14 objectForKeyedSubscript:&unk_1EEB25458];
      if (v49)
      {
        id v22 = (void *)v49;
        BOOL v48 = &unk_1EEB25458;
        goto LABEL_60;
      }
      uint64_t v50 = [v14 objectForKeyedSubscript:&unk_1EEB25470];
      if (v50)
      {
        id v22 = (void *)v50;
        BOOL v48 = &unk_1EEB25470;
        goto LABEL_60;
      }
      uint64_t v54 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        id v55 = [v13 uuid];
        *(_DWORD *)buf = 138544642;
        id v64 = v55;
        __int16 v65 = 2112;
        id v66 = v13;
        __int16 v67 = 2112;
        id v68 = v14;
        __int16 v69 = 2112;
        *(void *)id v70 = v15;
        *(_WORD *)&v70[8] = 1024;
        BOOL v71 = v8;
        __int16 v72 = 1024;
        BOOL v73 = v62;
        _os_log_impl(&dword_19B043000, v54, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Found no video complement resource to share for asset (uuid: %{public}@): %@, resources: %@, options: %@, useOriginalResources: %d, knownUnsupported: %d", buf, 0x36u);
      }
      if ([v15 allowMissingVideoComplement])
      {
        id v22 = 0;
      }
      else
      {
        uint64_t v57 = _PHResourceLocalAvailabilityRequestError(0, 0, 0);

        id v22 = 0;
        id v23 = (id)v57;
      }
      goto LABEL_61;
    case 2:
      id v22 = [v14 objectForKeyedSubscript:&unk_1EEB253C8];
      uint64_t v30 = [v14 objectForKeyedSubscript:&unk_1EEB252F0];

      if (v30) {
        char v31 = v62;
      }
      else {
        char v31 = 1;
      }
      if ((v31 & 1) == 0
        && (((v8 | [v13 hasAdjustments] ^ 1) & 1) != 0
         || [v13 isHighFrameRateVideo] && !v22))
      {
        id v35 = [v14 objectForKeyedSubscript:&unk_1EEB252F0];
        BOOL v24 = v16;
        [v16 setObject:v35 forKeyedSubscript:&unk_1EEB252F0];

LABEL_39:
        id v23 = 0;
        goto LABEL_64;
      }
      BOOL v24 = v16;
      if (v22)
      {
        uint64_t v32 = &unk_1EEB253C8;
LABEL_38:
        [v16 setObject:v22 forKeyedSubscript:v32];
        goto LABEL_39;
      }
      uint64_t v37 = [v14 objectForKeyedSubscript:&unk_1EEB25440];
      if (v37)
      {
        id v22 = (void *)v37;
        uint64_t v32 = &unk_1EEB25440;
        goto LABEL_38;
      }
      uint64_t v39 = [v14 objectForKeyedSubscript:&unk_1EEB25458];
      if (v39)
      {
        id v22 = (void *)v39;
        uint64_t v32 = &unk_1EEB25458;
        goto LABEL_38;
      }
      uint64_t v41 = [v14 objectForKeyedSubscript:&unk_1EEB25470];
      if (v41)
      {
        id v22 = (void *)v41;
        uint64_t v32 = &unk_1EEB25470;
        goto LABEL_38;
      }
      if (((v8 | [v13 hasAdjustments] ^ 1) & 1) != 0
        || [v13 isHighFrameRateVideo])
      {
        uint64_t v52 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413314;
          id v64 = v13;
          __int16 v65 = 2112;
          id v66 = v14;
          __int16 v67 = 2112;
          id v68 = v15;
          __int16 v69 = 1024;
          *(_DWORD *)id v70 = v8;
          *(_WORD *)&v70[4] = 1024;
          *(_DWORD *)&v70[6] = v62;
          _os_log_impl(&dword_19B043000, v52, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Falling back to possible unsupported original resource for asset: %@, resources: %@, options: %@, useOriginalResources: %d, knownUnsupported: %d", buf, 0x2Cu);
        }

        id v53 = [v14 objectForKeyedSubscript:&unk_1EEB252F0];
        [v16 setObject:v53 forKeyedSubscript:&unk_1EEB252F0];

        id v22 = 0;
        goto LABEL_39;
      }
      id v59 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413314;
        id v64 = v13;
        __int16 v65 = 2112;
        id v66 = v14;
        __int16 v67 = 2112;
        id v68 = v15;
        __int16 v69 = 1024;
        *(_DWORD *)id v70 = 0;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)&v70[6] = v62;
        _os_log_impl(&dword_19B043000, v59, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Found no video resource to share for asset: %@, resources: %@, options: %@, useOriginalResources: %d, knownUnsupported: %d", buf, 0x2Cu);
      }

      _PHResourceLocalAvailabilityRequestError(0, 0, 0);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      id v22 = 0;
      unint64_t v29 = v61;
LABEL_61:
      if (v29 && v23)
      {
        id v23 = v23;
        *unint64_t v29 = v23;
      }
LABEL_64:

      return v24;
    default:
LABEL_6:
      id v22 = 0;
      id v23 = 0;
      BOOL v24 = v16;
      goto LABEL_64;
  }
}

+ (id)_originalsAndFullSizeResourcesToShareForAsset:(id)a3 fromAvailableResources:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v15 = [v11 mediaType];
  if (v15 != 2)
  {
    if (v15 == 1)
    {
      if (([(id)objc_opt_class() setValuesInDictionary:v14 fromDictionary:v12 keysToCopy:&unk_1EEB26928] & 1) == 0)
      {
        id v16 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v21 = 138412802;
          id v22 = v11;
          __int16 v23 = 2112;
          id v24 = v12;
          __int16 v25 = 2112;
          id v26 = v13;
          int v17 = "[PHResourceLocalAvailabilityRequest] Found no photo or video complement resources to share for asset: %@"
                ", resources: %@, options: %@";
LABEL_9:
          _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v21, 0x20u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else
    {
      char v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:a1 file:@"PHResourceLocalAvailabilityRequest.m" lineNumber:1171 description:@"Code which should be unreachable has been reached"];
    }
LABEL_14:
    id v18 = 0;
    goto LABEL_15;
  }
  if ([(id)objc_opt_class() setValuesInDictionary:v14 fromDictionary:v12 keysToCopy:&unk_1EEB26940]) {
    goto LABEL_14;
  }
  id v16 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v21 = 138412802;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    int v17 = "[PHResourceLocalAvailabilityRequest] Found no video resource to share for asset: %@, resources: %@, options: %@";
    goto LABEL_9;
  }
LABEL_10:

  _PHResourceLocalAvailabilityRequestError(0, 0, 0);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (a6 && v18)
  {
    id v18 = v18;
    *a6 = v18;
  }
LABEL_15:

  return v14;
}

+ (BOOL)setValuesInDictionary:(id)a3 fromDictionary:(id)a4 keysToCopy:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v16 = [v8 objectForKeyedSubscript:v15];

        if (v16)
        {
          int v17 = [v8 objectForKeyedSubscript:v15];
          [v7 setObject:v17 forKeyedSubscript:v15];

          char v12 = 1;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
  else
  {
    char v12 = 0;
  }

  return v12 & 1;
}

+ (id)resourceLocalAvailabilityRequestLog
{
  if (resourceLocalAvailabilityRequestLog_onceToken != -1) {
    dispatch_once(&resourceLocalAvailabilityRequestLog_onceToken, &__block_literal_global_300);
  }
  uint64_t v2 = (void *)resourceLocalAvailabilityRequestLog_log;

  return v2;
}

void __73__PHResourceLocalAvailabilityRequest_resourceLocalAvailabilityRequestLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos", "PHResourceLocalAvailabilityRequest");
  v1 = (void *)resourceLocalAvailabilityRequestLog_log;
  resourceLocalAvailabilityRequestLog_log = (uint64_t)v0;
}

+ (BOOL)isKnownUnsupportedFormatForAsset:(id)a3
{
  v56[8] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 uniformTypeIdentifier];
  if ([v4 length])
  {
    uint64_t v41 = v3;
    uint64_t v42 = v4;
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    id v6 = [(id)*MEMORY[0x1E4F443E0] identifier];
    v56[0] = v6;
    id v7 = [(id)*MEMORY[0x1E4F44410] identifier];
    v56[1] = v7;
    id v8 = [(id)*MEMORY[0x1E4F44460] identifier];
    v56[2] = v8;
    v56[3] = @"com.adobe.raw-image";
    id v9 = [(id)*MEMORY[0x1E4F443D0] identifier];
    v56[4] = v9;
    uint64_t v10 = [(id)*MEMORY[0x1E4F444E0] identifier];
    v56[5] = v10;
    uint64_t v11 = [(id)*MEMORY[0x1E4F443E8] identifier];
    v56[6] = v11;
    char v12 = [(id)*MEMORY[0x1E4F44438] identifier];
    v56[7] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:8];
    id v14 = [v5 setWithArray:v13];

    uint64_t v15 = *MEMORY[0x1E4F44498];
    v55[0] = *MEMORY[0x1E4F44568];
    v55[1] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    int v17 = (void *)[v16 mutableCopy];

    id v18 = [MEMORY[0x1E4F8CDF8] supportedMovieTypes];
    [v17 addObjectsFromArray:v18];

    [v17 removeObject:*MEMORY[0x1E4F44490]];
    long long v19 = (void *)MEMORY[0x1E4F1CAD0];
    long long v20 = [MEMORY[0x1E4F8A740] H264fourCharCode];
    v54[0] = v20;
    long long v21 = [MEMORY[0x1E4F8A740] HEVCfourCharCode];
    v54[1] = v21;
    long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
    __int16 v23 = [v19 setWithArray:v22];

    if (isKnownUnsupportedFormatForAsset__onceToken != -1) {
      dispatch_once(&isKnownUnsupportedFormatForAsset__onceToken, &__block_literal_global_296);
    }
    id v4 = v42;
    uint64_t v24 = [v14 member:v42];

    id v3 = v41;
    if (v24)
    {
      __int16 v25 = 0;
LABEL_6:
      BOOL v26 = 0;
LABEL_29:

      goto LABEL_30;
    }
    unint64_t v29 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v42];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v30 = v17;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v44;
      while (2)
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v44 != v33) {
            objc_enumerationMutation(v30);
          }
          if ([v29 conformsToType:*(void *)(*((void *)&v43 + 1) + 8 * i)])
          {

            __int16 v25 = 0;
            BOOL v26 = 0;
            id v4 = v42;
            goto LABEL_29;
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v53 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }

    if ([v41 playbackStyle] == 4)
    {
      [v41 fetchPropertySetsIfNeeded];
      id v35 = [v41 photosInfoPanelExtendedProperties];
      __int16 v25 = [v35 codec];

      id v4 = v42;
      if (v25)
      {
        uint64_t v36 = [v23 member:v25];

        if (v36) {
          goto LABEL_6;
        }
        uint64_t v37 = [(id)isKnownUnsupportedFormatForAsset__cachedPlayableVideoCodecs member:v25];

        if (v37) {
          goto LABEL_6;
        }
        if ([MEMORY[0x1E4F8A740] isPlayableFourCharCodecName:v25])
        {
          [(id)isKnownUnsupportedFormatForAsset__cachedPlayableVideoCodecs addObject:v25];
          goto LABEL_6;
        }
      }
    }
    else
    {
      __int16 v25 = 0;
      id v4 = v42;
    }
    uint64_t v38 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = [v41 uuid];
      *(_DWORD *)buf = 138543874;
      BOOL v48 = v39;
      __int16 v49 = 2114;
      uint64_t v50 = v4;
      __int16 v51 = 2114;
      uint64_t v52 = v25;
      _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest] Slower \"known unsupported formats\" lookup for asset: %{public}@. Type identifier: %{public}@, codec (if video): %{public}@", buf, 0x20u);
    }
    BOOL v26 = +[PHAsset isOriginalKnownUnsupportedFormatForAsset:v41 failureInfo:0];
    goto LABEL_29;
  }
  uint64_t v27 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    int v28 = [v3 uuid];
    *(_DWORD *)buf = 138543618;
    BOOL v48 = v4;
    __int16 v49 = 2114;
    uint64_t v50 = v28;
    _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Unexpected empty uniformTypeIdentifier (%{public}@) on asset: %{public}@. Falling back to \"known unsupported formats\" lookup", buf, 0x16u);
  }
  BOOL v26 = +[PHAsset isOriginalKnownUnsupportedFormatForAsset:v3 failureInfo:0];
LABEL_30:

  return v26;
}

void __71__PHResourceLocalAvailabilityRequest_isKnownUnsupportedFormatForAsset___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  v1 = (void *)isKnownUnsupportedFormatForAsset__cachedPlayableVideoCodecs;
  isKnownUnsupportedFormatForAsset__cachedPlayableVideoCodecs = v0;
}

+ (id)_resourcesToShareForAsset:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(id)objc_opt_class() resourceLocalAvailabilityRequestLog];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = v9;
  char v12 = v11;
  os_signpost_id_t spid = v10;
  unint64_t v61 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    uint64_t v13 = v12;
    id v14 = [v7 localIdentifier];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v14;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v13, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ResourcesToShareLookup", "localIdentifier==%{public}@", buf, 0xCu);

    char v12 = v13;
  }
  BOOL v62 = v12;

  if ([a1 isKnownUnsupportedFormatForAsset:v7]
    && ![v8 includeOriginalResourcesOnly])
  {
    uint64_t v15 = 1;
    unsigned int v60 = 1;
  }
  else
  {
    uint64_t v15 = [v7 isCloudSharedAsset];
    unsigned int v60 = 0;
    if (![v7 hasAdjustments])
    {
      uint64_t v16 = 1;
      goto LABEL_10;
    }
  }
  uint64_t v16 = [v8 includeOriginalResourcesOnly];
LABEL_10:
  if ([v7 isRAW])
  {
    int v17 = 1;
    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
    int v17 = [v7 isProRes];
    if (!v16) {
      goto LABEL_17;
    }
  }
  if (([v8 dontAllowRAW] & v17) == 1)
  {
    uint64_t v16 = [v8 includeOriginalResourcesOnly];
    uint64_t v15 = v16 ^ 1 | v15;
  }
  else
  {
    uint64_t v16 = 1;
  }
LABEL_17:
  id v18 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [v7 uuid];
    int v20 = [v7 hasAdjustments];
    int v21 = [v8 dontAllowRAW];
    int v22 = [v8 includeOriginalResourcesOnly];
    *(_DWORD *)buf = 134219778;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v16;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v19;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v20;
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = v60;
    *(_WORD *)&buf[40] = 1024;
    *(_DWORD *)&buf[42] = v17;
    *(_WORD *)&buf[46] = 1024;
    LODWORD(v73) = v21;
    WORD2(v73) = 1024;
    *(_DWORD *)((char *)&v73 + 6) = v22;
    _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "[PHResourceLocalAvailabilityRequest:%p] Using original/primary resource(s): %{BOOL}d for asset %{public}@ because it is edited: %{BOOL}d, known unsupported: %{BOOL}d, isRAW: %{BOOL}d, dontAllowRAW: %{BOOL}d, should use unmodified original: %{BOOL}d", buf, 0x3Au);
  }
  __int16 v23 = _FetchableResourcesForAsset(v7, v15);
  id v24 = v7;
  id v25 = v23;
  uint64_t v66 = 0;
  __int16 v67 = &v66;
  uint64_t v68 = 0x3032000000;
  __int16 v69 = __Block_byref_object_copy__12080;
  id v70 = __Block_byref_object_dispose__12081;
  id v71 = 0;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = ___CollectAssetResourcesByCplResourceType_block_invoke;
  *(void *)&unsigned char buf[24] = &unk_1E5843B30;
  id v27 = v24;
  *(void *)&buf[32] = v27;
  id v28 = v26;
  *(void *)&buf[40] = v28;
  id v29 = v25;
  *(void *)&long long v73 = v29;
  *((void *)&v73 + 1) = &v66;
  [v29 enumerateObjectsUsingBlock:buf];
  if (v67[5])
  {

    id v30 = (id) v67[5];
    id v28 = 0;
  }
  else
  {
    id v30 = 0;
  }
  uint64_t v31 = (void *)v73;
  id v32 = v28;

  _Block_object_dispose(&v66, 8);
  id v33 = v30;
  if (![v32 count])
  {
    uint64_t v38 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v8;
      *(_WORD *)&buf[32] = 2112;
      *(void *)&buf[34] = v33;
      _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest:%p] No candidate resources found for sharing asset: %@, options: %@, error: %@", buf, 0x2Au);
    }
    uint64_t v36 = 0;
    goto LABEL_43;
  }
  int v34 = [v8 includeAllAssetResources];
  id v35 = objc_opt_class();
  if (v34)
  {
    id v65 = v33;
    uint64_t v36 = [v35 _originalsAndFullSizeResourcesToShareForAsset:v27 fromAvailableResources:v32 options:v8 error:&v65];
    uint64_t v37 = &v65;
  }
  else
  {
    id v64 = v33;
    uint64_t v36 = [v35 _singularResourcesToShareForAsset:v27 fromAvailableResources:v32 options:v8 useOriginalResources:v16 knownUnsupported:v60 error:&v64];
    uint64_t v37 = &v64;
  }
  id v39 = *v37;

  if ([v36 count])
  {
    id v33 = v39;
  }
  else
  {
    uint64_t v40 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v8;
      _os_log_impl(&dword_19B043000, v40, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest:%p] Found no photo or video resources to share for asset: %@, options: %@", buf, 0x20u);
    }

    _PHResourceLocalAvailabilityRequestError(0, v39, 0);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v41 = [v32 objectForKeyedSubscript:&unk_1EEB25290];
  BOOL v42 = v41 == 0;

  if (!v42)
  {
    long long v43 = [v32 objectForKeyedSubscript:&unk_1EEB25290];
    [v36 setObject:v43 forKeyedSubscript:&unk_1EEB25290];
  }
  long long v44 = [v32 objectForKeyedSubscript:&unk_1EEB252A8];
  BOOL v45 = v44 == 0;

  if (!v45)
  {
    long long v46 = [v32 objectForKeyedSubscript:&unk_1EEB252A8];
    [v36 setObject:v46 forKeyedSubscript:&unk_1EEB252A8];
  }
  if (v34)
  {
    uint64_t v47 = [v32 objectForKeyedSubscript:&unk_1EEB252C0];
    BOOL v48 = v47 == 0;

    if (!v48)
    {
      __int16 v49 = [v32 objectForKeyedSubscript:&unk_1EEB252C0];
      [v36 setObject:v49 forKeyedSubscript:&unk_1EEB252C0];
    }
    uint64_t v50 = [v32 objectForKeyedSubscript:&unk_1EEB252D8];
    BOOL v51 = v50 == 0;

    if (!v51)
    {
      uint64_t v38 = [v32 objectForKeyedSubscript:&unk_1EEB252D8];
      [v36 setObject:v38 forKeyedSubscript:&unk_1EEB252D8];
LABEL_43:
    }
  }
  uint64_t v52 = v62;
  if (a5 && v33)
  {
    id v53 = v33;
    uint64_t v52 = v62;
    *a5 = v53;
  }
  uint64_t v54 = v52;
  id v55 = v54;
  if (v61 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v55, OS_SIGNPOST_INTERVAL_END, spid, "ResourcesToShareLookup", (const char *)&unk_19B30018E, buf, 2u);
  }

  if (v33) {
    uint64_t v56 = 0;
  }
  else {
    uint64_t v56 = v36;
  }
  id v57 = v56;

  return v57;
}

+ (id)_resourcesToShareForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(PHResourceLocalAvailabilityRequestOptions);
  [(PHResourceLocalAvailabilityRequestOptions *)v9 setAllowMissingVideoComplement:1];
  if (v6) {
    [(PHResourceLocalAvailabilityRequestOptions *)v9 setIncludeOriginalResourcesOnly:1];
  }
  os_signpost_id_t v10 = [a1 _resourcesToShareForAsset:v8 options:v9 error:a5];

  return v10;
}

+ (id)fetchResourcesToShareForAsset:(id)a3 requestOptions:(id)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHResourceLocalAvailabilityRequest.m", 159, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"PHResourceLocalAvailabilityRequest.m", 160, @"Invalid parameter not satisfying: %@", @"requestOptions" object file lineNumber description];

LABEL_3:
  if ((unint64_t)([v9 mediaType] - 1) >= 2)
  {
    uint64_t v16 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v9;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "[PHResourceLocalAvailabilityRequest] Cannot fetch resources to share for invalid asset: %@", buf, 0xCu);
    }

    if (a5)
    {
      _PHResourceLocalAvailabilityRequestError(0, 0, 0);
      uint64_t v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v15 = 0;
    }
  }
  else
  {
    id v20 = 0;
    char v12 = [(id)objc_opt_class() _resourcesToShareForAsset:v9 options:v11 error:&v20];
    id v13 = v20;
    id v14 = v13;
    if (a5 && v13) {
      *a5 = v13;
    }
    uint64_t v15 = [v12 allValues];
  }

  return v15;
}

@end