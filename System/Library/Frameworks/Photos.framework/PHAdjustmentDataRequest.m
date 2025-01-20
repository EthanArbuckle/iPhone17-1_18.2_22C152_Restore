@interface PHAdjustmentDataRequest
- (BOOL)isSynchronous;
- (PHAdjustmentDataRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 behaviorSpec:(id)a8 delegate:(id)a9;
- (PHAdjustmentDataRequestBehaviorSpec)behaviorSpec;
- (PHAdjustmentDataRequestDelegate)adjustmentDataDelegate;
- (void)_cplDownloadStatusNotification:(id)a3;
- (void)_finishFromAsynchronousCallback;
- (void)cancel;
- (void)startRequest;
@end

@implementation PHAdjustmentDataRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
  objc_destroyWeak((id *)&self->_adjustmentDataDelegate);
  objc_storeStrong((id *)&self->_syncDownloadWaitSemaphore, 0);
  objc_storeStrong((id *)&self->_adjustmentDataResult, 0);

  objc_storeStrong((id *)&self->_legacyDownloadContext, 0);
}

- (PHAdjustmentDataRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (PHAdjustmentDataRequestDelegate)adjustmentDataDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adjustmentDataDelegate);

  return (PHAdjustmentDataRequestDelegate *)WeakRetained;
}

- (void)_cplDownloadStatusNotification:(id)a3
{
  v4 = [a3 userInfo];
  legacyDownloadContext = self->_legacyDownloadContext;
  if (legacyDownloadContext)
  {
    v6 = [(PLCPLDownloadContext *)legacyDownloadContext taskIdentifier];
    v7 = [v4 objectForKey:*MEMORY[0x1E4F8C4B0]];
    int v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C490]];
      uint64_t v10 = [v9 BOOLValue];

      v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C4A8]];
      v12 = v11;
      if (v11)
      {
        [v11 doubleValue];
        double v14 = v13;
      }
      else
      {
        double v14 = NAN;
      }
      v15 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8C498]];
      v16 = [(PHAdjustmentDataRequest *)self adjustmentDataDelegate];
      [v16 adjustmentDataRequest:self didReportProgress:v10 completed:v15 error:v14];

      if (v10)
      {
        v17 = [(PHMediaRequest *)self asset];
        v18 = [v17 photoLibrary];
        v19 = [v18 assetsdClient];

        v20 = [v19 resourceClient];
        v21 = [(PHMediaRequest *)self asset];
        v22 = [v21 objectID];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __58__PHAdjustmentDataRequest__cplDownloadStatusNotification___block_invoke;
        v23[3] = &unk_1E5848C88;
        v23[4] = self;
        [v20 adjustmentDataForAsset:v22 networkAccessAllowed:0 trackCPLDownload:0 completionHandler:v23];
      }
    }
  }
}

void __58__PHAdjustmentDataRequest__cplDownloadStatusNotification___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, char a7, void *a8)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  uint64_t v20 = [v15 length];
  v21 = 0;
  if (v18 && v20) {
    v21 = [[PHAdjustmentData alloc] initWithFormatIdentifier:v15 formatVersion:v16 data:v18];
  }
  v22 = [v19 error];
  if (v22)
  {

    id v19 = 0;
  }
  [(PHAdjustmentData *)v21 setEditorBundleID:v17];
  [(PHAdjustmentData *)v21 setBaseVersion:a5];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), v19);
  if (v21)
  {
    [*(id *)(*(void *)(a1 + 32) + 136) setAdjustmentData:v21];
  }
  else if (a7)
  {
    [*(id *)(*(void *)(a1 + 32) + 136) setIsInCloud:1];
    if (!v22)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"Missing adjustment data";
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      v22 = objc_msgSend(v23, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v24);
    }
  }
  [*(id *)(*(void *)(a1 + 32) + 136) setError:v22];
  [*(id *)(a1 + 32) _finishFromAsynchronousCallback];
}

- (void)cancel
{
  v8.receiver = self;
  v8.super_class = (Class)PHAdjustmentDataRequest;
  [(PHMediaRequest *)&v8 cancel];
  if (self->_legacyDownloadContext)
  {
    v3 = [(PHMediaRequest *)self asset];
    v4 = [v3 photoLibrary];
    v5 = [v4 assetsdClient];

    v6 = [v5 cloudClient];
    [v6 cancelCPLDownloadWithContext:self->_legacyDownloadContext completionHandler:0];

    legacyDownloadContext = self->_legacyDownloadContext;
    self->_legacyDownloadContext = 0;
  }
}

- (void)startRequest
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = PLImageManagerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = [(PHMediaRequest *)self identifierString];
    BOOL v5 = [(PHAdjustmentDataRequest *)self isSynchronous];
    v6 = @"N";
    if (v5) {
      v6 = @"Y";
    }
    *(_DWORD *)buf = 138412546;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "[RM]: %@ starting adjustment data request, sync: %@", buf, 0x16u);
  }
  v7 = [(PHMediaRequest *)self asset];
  objc_super v8 = [v7 photoLibrary];
  v9 = [v8 assetsdClient];

  uint64_t v10 = [v9 resourceClient];
  v11 = [(PHMediaRequest *)self asset];
  v12 = [v11 objectID];
  BOOL v13 = [(PHAdjustmentDataRequestBehaviorSpec *)self->_behaviorSpec isNetworkAccessAllowed];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__PHAdjustmentDataRequest_startRequest__block_invoke;
  v15[3] = &unk_1E5848C88;
  v15[4] = self;
  [v10 adjustmentDataForAsset:v12 networkAccessAllowed:v13 trackCPLDownload:1 completionHandler:v15];

  if ([(PHAdjustmentDataRequestBehaviorSpec *)self->_behaviorSpec isSynchronous])
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_syncDownloadWaitSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    double v14 = [(PHMediaRequest *)self delegate];
    [v14 mediaRequest:self didFinishWithResult:self->_adjustmentDataResult];
  }
}

void __39__PHAdjustmentDataRequest_startRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, char a7, void *a8)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  id v19 = PLImageManagerGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = [*(id *)(a1 + 32) identifierString];
    *(_DWORD *)buf = 138413058;
    v31 = v20;
    __int16 v32 = 2112;
    id v33 = v14;
    __int16 v34 = 2112;
    id v35 = v15;
    __int16 v36 = 2112;
    id v37 = v16;
    _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEBUG, "[RM]: %@ adjustment data request finished with formatID: %@, version: %@, editor: %@", buf, 0x2Au);
  }
  uint64_t v21 = [v14 length];
  v22 = 0;
  if (v17 && v21) {
    v22 = [[PHAdjustmentData alloc] initWithFormatIdentifier:v14 formatVersion:v15 data:v17];
  }
  v23 = [v18 error];
  if (v23)
  {

    id v18 = 0;
  }
  [(PHAdjustmentData *)v22 setEditorBundleID:v16];
  [(PHAdjustmentData *)v22 setBaseVersion:a5];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), v18);
  if (v22)
  {
    [*(id *)(*(void *)(a1 + 32) + 136) setAdjustmentData:v22];
  }
  else if (a7)
  {
    [*(id *)(*(void *)(a1 + 32) + 136) setIsInCloud:1];
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v29 = @"Missing adjustment data";
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v27 = objc_msgSend(v26, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v24);

    v23 = (void *)v27;
  }
  [*(id *)(*(void *)(a1 + 32) + 136) setError:v23];
  if (v22 || !v18) {
    [*(id *)(a1 + 32) _finishFromAsynchronousCallback];
  }
}

- (BOOL)isSynchronous
{
  return [(PHAdjustmentDataRequestBehaviorSpec *)self->_behaviorSpec isSynchronous];
}

- (void)_finishFromAsynchronousCallback
{
  if ([(PHAdjustmentDataRequestBehaviorSpec *)self->_behaviorSpec isSynchronous])
  {
    syncDownloadWaitSemaphore = self->_syncDownloadWaitSemaphore;
    dispatch_semaphore_signal(syncDownloadWaitSemaphore);
  }
  else
  {
    id v4 = [(PHMediaRequest *)self delegate];
    [v4 mediaRequest:self didFinishWithResult:self->_adjustmentDataResult];
  }
}

- (PHAdjustmentDataRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 behaviorSpec:(id)a8 delegate:(id)a9
{
  uint64_t v14 = *(void *)&a3;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PHAdjustmentDataRequest;
  id v18 = [(PHMediaRequest *)&v26 initWithRequestID:v14 requestIndex:a4 contextType:a5 managerID:a6 asset:a7 delegate:v17];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_behaviorSpec, a8);
    objc_storeWeak((id *)&v19->_adjustmentDataDelegate, v17);
    uint64_t v20 = [(PHCompositeMediaResult *)[PHAdjustmentDataResult alloc] initWithRequestID:v14];
    adjustmentDataResult = v19->_adjustmentDataResult;
    v19->_adjustmentDataResult = v20;

    if ([v16 isSynchronous])
    {
      dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
      syncDownloadWaitSemaphore = v19->_syncDownloadWaitSemaphore;
      v19->_syncDownloadWaitSemaphore = (OS_dispatch_semaphore *)v22;
    }
    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v19 selector:sel__cplDownloadStatusNotification_ name:*MEMORY[0x1E4F8C4A0] object:0];
  }
  return v19;
}

@end