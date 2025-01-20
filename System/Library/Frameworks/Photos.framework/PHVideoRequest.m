@interface PHVideoRequest
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (PHImageDisplaySpec)displaySpec;
- (PHVideoRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 displaySpec:(id)a8 behaviorSpec:(id)a9 delegate:(id)a10;
- (PHVideoRequestBehaviorSpec)behaviorSpec;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (void)_finish;
- (void)_handleResultVideoURL:(id)a3 mediaItemMakerData:(id)a4 fingerPrint:(id)a5 info:(id)a6 error:(id)a7;
- (void)configureWithError:(id)a3;
- (void)startRequest;
@end

@implementation PHVideoRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
  objc_storeStrong((id *)&self->_displaySpec, 0);

  objc_storeStrong((id *)&self->_videoResult, 0);
}

- (PHVideoRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (PHImageDisplaySpec)displaySpec
{
  return self->_displaySpec;
}

- (void)startRequest
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(PHMediaRequest *)self isCancelled] || self->super._configurationError)
  {
    [(PHVideoRequest *)self _finish];
    return;
  }
  v3 = PLImageManagerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PHMediaRequest *)self identifierString];
    v5 = [(PHMediaRequest *)self asset];
    v6 = [v5 uuid];
    *(_DWORD *)buf = 138412546;
    v42 = v4;
    __int16 v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "[RM]: %@ Video request running for asset %@", buf, 0x16u);
  }
  v7 = [(PHMediaRequest *)self asset];
  if (![v7 isPhotoIris]) {
    goto LABEL_11;
  }
  v8 = [(PHMediaRequest *)self asset];
  if ([v8 canPlayPhotoIris]) {
    goto LABEL_10;
  }
  v36 = [(PHVideoRequest *)self behaviorSpec];
  uint64_t v37 = [v36 version];

  if (v37) {
    goto LABEL_12;
  }
  v7 = PLImageManagerGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = [(PHMediaRequest *)self identifierString];
    v38 = [(PHMediaRequest *)self asset];
    v39 = [v38 uuid];
    *(_DWORD *)buf = 138543618;
    v42 = v8;
    __int16 v43 = 2114;
    v44 = v39;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "[RM] %{public}@ video request for unplayable live photo (uuid: %{public}@) will likely fail", buf, 0x16u);

LABEL_10:
  }
LABEL_11:

LABEL_12:
  if ([(PHVideoRequestBehaviorSpec *)self->_behaviorSpec deliveryMode])
  {
    double v9 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    displaySpec = self->_displaySpec;
    v12 = [(PHMediaRequest *)self asset];
    uint64_t v13 = [v12 pixelWidth];
    v14 = [(PHMediaRequest *)self asset];
    -[PHImageDisplaySpec requestSizeFromFullSizedWidth:height:](displaySpec, "requestSizeFromFullSizedWidth:height:", v13, [v14 pixelHeight]);
    double v9 = v15;
    double v10 = v16;

    v17 = PLImageManagerGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = [(PHMediaRequest *)self identifierString];
      v19 = DCIM_NSStringFromCGSize();
      *(_DWORD *)buf = 138412546;
      v42 = v18;
      __int16 v43 = 2112;
      v44 = v19;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "[RM]: %@ request sized to %@", buf, 0x16u);
    }
  }
  v20 = [PHVideoXPCRequest alloc];
  v21 = [(PHMediaRequest *)self identifierString];
  v22 = [(PHMediaRequest *)self asset];
  v23 = [v22 objectID];
  v24 = -[PHVideoXPCRequest initWithTaskIdentifier:assetObjectID:size:behavior:](v20, "initWithTaskIdentifier:assetObjectID:size:behavior:", v21, v23, self->_behaviorSpec, v9, v10);

  [(PLResourceXPCRequest *)v24 setWantsProgress:[(PHMediaRequest *)self wantsProgress]];
  v25 = PLImageManagerGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = [(PHMediaRequest *)self identifierString];
    v27 = [(PHMediaRequest *)self asset];
    v28 = [v27 uuid];
    *(_DWORD *)buf = 138412546;
    v42 = v26;
    __int16 v43 = 2112;
    v44 = v28;
    _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEBUG, "[RM] %@ sending video request for asset: %@", buf, 0x16u);
  }
  v29 = [(PHMediaRequest *)self asset];
  v30 = [v29 photoLibrary];
  v31 = [v30 assetsdClient];
  v32 = [v31 resourceAvailabilityClient];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __30__PHVideoRequest_startRequest__block_invoke;
  v40[3] = &unk_1E5842848;
  v40[4] = self;
  v33 = [v32 sendVideoRequest:v24 reply:v40];

  if (v33)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if ([(PHMediaRequest *)self isCancelled])
    {
      os_unfair_lock_unlock(&self->_lock);
      [v33 cancel];
    }
    else
    {
      v35 = [(PHMediaRequest *)self lazyProgressContainer];
      [v35 setRequestProgress:v33];

      os_unfair_lock_unlock(p_lock);
    }
  }
}

void __30__PHVideoRequest_startRequest__block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v45 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [v15 objectForKeyedSubscript:@"PHImageFileUTIKey"];
  [*(id *)(*(void *)(a1 + 32) + 128) setUniformTypeIdentifier:v17];

  uint64_t v18 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8BA68]];
  v19 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8BA70]];
  v20 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8BA58]];
  uint64_t v21 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F8BA78]];
  if (v19) {
    BOOL v22 = v18 == 0;
  }
  else {
    BOOL v22 = 1;
  }
  BOOL v23 = v22 || v20 == 0;
  v46 = (void *)v21;
  v47 = (void *)v18;
  if (!v23)
  {
    v24 = [[PHAdjustmentData alloc] initWithFormatIdentifier:v18 formatVersion:v19 adjustmentRenderType:v21 data:v20];
    if (v14) {
      id v25 = (id)[v14 mutableCopy];
    }
    else {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v26 = v25;
    [v25 setObject:v24 forKeyedSubscript:@"PHAdjustmentDataKey"];

    id v14 = v26;
  }
  v27 = [v15 objectForKeyedSubscript:@"PHImageRequestResultEligibleForCacheMetricsLogging"];
  int v28 = [v27 BOOLValue];

  if (v28)
  {
    v29 = [v15 objectForKeyedSubscript:@"PHImageRequestResultIsLocallyAvailableForCacheMetricsLogging"];
    char v30 = [v29 BOOLValue];

    v31 = *(void **)(a1 + 32);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __30__PHVideoRequest_startRequest__block_invoke_2;
    v49[3] = &__block_descriptor_33_e39_v16__0__PLCacheMetricsCollectorClient_8l;
    char v50 = v30;
    [v31 recordMetricsWithMetricsHandler:v49];
  }
  if (v13 && a2)
  {
    v32 = (void *)MEMORY[0x1E4F8AB30];
    v33 = [*(id *)(a1 + 32) asset];
    id v48 = 0;
    char v34 = [v32 refreshSandboxExtensionForURL:v13 assetID:v33 error:&v48];
    id v35 = v48;

    if ((v34 & 1) == 0)
    {
      v36 = PLImageManagerGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v44 = [*(id *)(a1 + 32) identifierString];
        uint64_t v37 = [v13 path];
        *(_DWORD *)buf = 138543874;
        v52 = v44;
        __int16 v53 = 2112;
        uint64_t v54 = v37;
        v38 = (void *)v37;
        __int16 v55 = 2112;
        id v56 = v35;
        _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_ERROR, "[RM] %{public}@ video request failed to refresh sandbox extension for path: %@, error; %@",
          buf,
          0x20u);
      }
      id v39 = v35;

      id v13 = 0;
      id v16 = v39;
    }
    v40 = v45;

    goto LABEL_22;
  }
  v41 = [*(id *)(a1 + 32) delegate];
  char v42 = [v41 retryMediaRequest:*(void *)(a1 + 32) afterFailureWithError:v16];

  v40 = v45;
  if ((v42 & 1) == 0)
  {
LABEL_22:
    __int16 v43 = [v15 objectForKeyedSubscript:@"PHImageResultFingerPrintKey"];
    [*(id *)(a1 + 32) _handleResultVideoURL:v13 mediaItemMakerData:v40 fingerPrint:v43 info:v14 error:v16];
  }
}

uint64_t __30__PHVideoRequest_startRequest__block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return [a2 incrementVideoComplementCacheHitCount];
  }
  else {
    return [a2 incrementVideoComplementCacheMissCount];
  }
}

- (void)configureWithError:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHVideoRequest;
  id v4 = a3;
  [(PHMediaRequest *)&v5 configureWithError:v4];
  -[PHCompositeMediaResult setError:](self->_videoResult, "setError:", v4, v5.receiver, v5.super_class);
}

- (int64_t)downloadPriority
{
  return [(PHVideoRequestBehaviorSpec *)self->_behaviorSpec downloadPriority];
}

- (int64_t)downloadIntent
{
  return [(PHVideoRequestBehaviorSpec *)self->_behaviorSpec downloadIntent];
}

- (BOOL)isNetworkAccessAllowed
{
  return [(PHVideoRequestBehaviorSpec *)self->_behaviorSpec isNetworkAccessAllowed];
}

- (BOOL)isSynchronous
{
  return 0;
}

- (void)_handleResultVideoURL:(id)a3 mediaItemMakerData:(id)a4 fingerPrint:(id)a5 info:(id)a6 error:(id)a7
{
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (![(PHMediaRequest *)self isCancelled])
  {
    [(PHVideoResult *)self->_videoResult setVideoURL:v16];
    [(PHVideoResult *)self->_videoResult setVideoMediaItemMakerData:v12];
    [(PHVideoResult *)self->_videoResult setFingerPrint:v13];
    [(PHCompositeMediaResult *)self->_videoResult setError:v15];
    [(PHCompositeMediaResult *)self->_videoResult addInfoFromDictionary:v14];
  }
  [(PHVideoRequest *)self _finish];
}

- (void)_finish
{
  if ([(PHMediaRequest *)self isCancelled]) {
    [(PHCompositeMediaResult *)self->_videoResult setCancelled:1];
  }
  id v3 = [(PHMediaRequest *)self delegate];
  [v3 mediaRequest:self didFinishWithResult:self->_videoResult];
}

- (PHVideoRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 displaySpec:(id)a8 behaviorSpec:(id)a9 delegate:(id)a10
{
  uint64_t v15 = *(void *)&a3;
  id v23 = a8;
  id v17 = a9;
  v24.receiver = self;
  v24.super_class = (Class)PHVideoRequest;
  uint64_t v18 = [(PHMediaRequest *)&v24 initWithRequestID:v15 requestIndex:a4 contextType:a5 managerID:a6 asset:a7 delegate:a10];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_displaySpec, a8);
    objc_storeStrong((id *)&v19->_behaviorSpec, a9);
    v20 = [(PHCompositeMediaResult *)[PHVideoResult alloc] initWithRequestID:v15];
    videoResult = v19->_videoResult;
    v19->_videoResult = v20;

    v19->_lock._os_unfair_lock_opaque = 0;
  }

  return v19;
}

@end