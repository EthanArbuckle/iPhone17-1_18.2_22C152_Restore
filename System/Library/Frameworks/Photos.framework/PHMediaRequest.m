@interface PHMediaRequest
- (BOOL)isCancelled;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (BOOL)wantsProgress;
- (PHAsset)asset;
- (PHMediaRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 delegate:(id)a8;
- (PHMediaRequestDelegate)delegate;
- (id)identifierString;
- (id)lazyProgressContainer;
- (id)sendMakeAvailableRequestForResource:(id)a3 reply:(id)a4;
- (id)sendResourceRepairRequestForResource:(id)a3 errorCodes:(id)a4 reply:(id)a5;
- (id)sendResourceRepairRequestWithErrorCodes:(id)a3 reply:(id)a4;
- (int)requestID;
- (int64_t)contextType;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (unint64_t)fetchIncrementRetryAttemptCount;
- (unint64_t)managerID;
- (unint64_t)requestIndex;
- (unint64_t)signpostID;
- (void)cancel;
- (void)configureWithError:(id)a3;
- (void)dealloc;
- (void)handleAvailabilityChangeForResource:(id)a3 url:(id)a4 info:(id)a5 error:(id)a6;
- (void)recordMetricsWithMetricsHandler:(id)a3;
- (void)setSignpostID:(unint64_t)a3;
- (void)setWantsProgress:(BOOL)a3;
- (void)startRequest;
@end

@implementation PHMediaRequest

- (PHAsset)asset
{
  return self->_asset;
}

- (BOOL)isCancelled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&v2->_cancelled);
  LOBYTE(v2) = v4 & 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)identifierString
{
  identifierString = self->_identifierString;
  if (!identifierString)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld-%ld-%ld", self->_managerID, self->_requestID, self->_requestIndex);
    unsigned __int8 v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_identifierString;
    self->_identifierString = v4;

    identifierString = self->_identifierString;
  }

  return identifierString;
}

- (void)setWantsProgress:(BOOL)a3
{
  self->_wantsProgress = a3;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (PHMediaRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 delegate:(id)a8
{
  id v15 = a7;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)PHMediaRequest;
  v17 = [(PHMediaRequest *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_requestID = a3;
    v17->_requestIndex = a4;
    v17->_contextType = a5;
    v17->_managerID = a6;
    objc_storeStrong((id *)&v17->_asset, a7);
    v18->_signpostID = 0;
    v18->_wantsProgress = 1;
    v18->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v18->_delegate, v16);
    atomic_store(0, &v18->_retryAttemptCount);
  }

  return v18;
}

- (int)requestID
{
  return self->_requestID;
}

- (void)dealloc
{
  [(PLProgressFollower *)self->_progressFollower invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PHMediaRequest;
  [(PHMediaRequest *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressFollower, 0);
  objc_storeStrong((id *)&self->_progressContainer, 0);
  objc_storeStrong((id *)&self->_progresses, 0);
  objc_storeStrong((id *)&self->_identifierString, 0);

  objc_storeStrong((id *)&self->_configurationError, 0);
}

- (BOOL)wantsProgress
{
  return self->_wantsProgress;
}

- (PHMediaRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHMediaRequestDelegate *)WeakRetained;
}

- (void)recordMetricsWithMetricsHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PHMediaRequest.m", 236, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  if (recordMetricsWithMetricsHandler__onceToken != -1) {
    dispatch_once(&recordMetricsWithMetricsHandler__onceToken, &__block_literal_global_32471);
  }
  v6 = [(PHMediaRequest *)self asset];
  v7 = [v6 photoLibrary];

  v8 = recordMetricsWithMetricsHandler__metricsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PHMediaRequest_recordMetricsWithMetricsHandler___block_invoke_2;
  block[3] = &unk_1E5848790;
  id v13 = v7;
  id v14 = v5;
  id v9 = v5;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __50__PHMediaRequest_recordMetricsWithMetricsHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cacheMetricsCollector];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __50__PHMediaRequest_recordMetricsWithMetricsHandler___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.photos.imagemanager.metrics", 0);
  v1 = (void *)recordMetricsWithMetricsHandler__metricsQueue;
  recordMetricsWithMetricsHandler__metricsQueue = (uint64_t)v0;

  id v2 = recordMetricsWithMetricsHandler__metricsQueue;
  objc_super v3 = dispatch_get_global_queue(9, 0);
  dispatch_set_target_queue(v2, v3);
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (unint64_t)managerID
{
  return self->_managerID;
}

- (unint64_t)requestIndex
{
  return self->_requestIndex;
}

- (unint64_t)fetchIncrementRetryAttemptCount
{
  return atomic_fetch_add((atomic_uint *volatile)&self->_retryAttemptCount, 1u);
}

- (id)sendResourceRepairRequestWithErrorCodes:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if ([(PHMediaRequest *)self isCancelled])
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3072, 0);
    v7[2](v7, 0, v8);

    id v9 = 0;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F8AB60]);
    v11 = [(PHMediaRequest *)self identifierString];
    v12 = [(PHObject *)self->_asset objectID];
    v8 = (void *)[v10 initWithTaskIdentifier:v11 assetObjectID:v12];

    id v13 = [(PHObject *)self->_asset photoLibrary];
    id v14 = [v13 assetsdClient];
    id v15 = [v14 resourceAvailabilityClient];
    id v9 = [v15 sendResourceRepairRequestForAsset:v8 errorCodes:v6 reply:v7];

    if (v9)
    {
      os_unfair_lock_lock(&self->_lock);
      unsigned __int8 v16 = atomic_load((unsigned __int8 *)&self->_cancelled);
      if (v16)
      {
        os_unfair_lock_unlock(&self->_lock);
        [v9 cancel];
      }
      else
      {
        progresses = self->_progresses;
        if (!progresses)
        {
          v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v19 = self->_progresses;
          self->_progresses = v18;

          progresses = self->_progresses;
        }
        [(NSMutableArray *)progresses addObject:v9];
        os_unfair_lock_unlock(&self->_lock);
      }
    }
  }

  return v9;
}

- (id)sendResourceRepairRequestForResource:(id)a3 errorCodes:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if ([(PHMediaRequest *)self isCancelled]
    || ([v8 conformsToProtocol:&unk_1EEB63AA8] & 1) == 0)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3072, 0);
    v10[2](v10, 0, v14);
    v18 = 0;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F8AB58]);
    v12 = [(PHMediaRequest *)self identifierString];
    id v13 = [(PHObject *)self->_asset objectID];
    id v14 = (void *)[v11 initWithTaskIdentifier:v12 assetObjectID:v13 resource:v8];

    id v15 = [(PHObject *)self->_asset photoLibrary];
    unsigned __int8 v16 = [v15 assetsdClient];
    v17 = [v16 resourceAvailabilityClient];
    v18 = [v17 sendResourceRepairRequest:v14 errorCodes:v9 reply:v10];

    if (v18)
    {
      os_unfair_lock_lock(&self->_lock);
      unsigned __int8 v19 = atomic_load((unsigned __int8 *)&self->_cancelled);
      if (v19)
      {
        os_unfair_lock_unlock(&self->_lock);
        [v18 cancel];
      }
      else
      {
        progresses = self->_progresses;
        if (!progresses)
        {
          v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v22 = self->_progresses;
          self->_progresses = v21;

          progresses = self->_progresses;
        }
        [(NSMutableArray *)progresses addObject:v18];
        os_unfair_lock_unlock(&self->_lock);
      }
    }
  }

  return v18;
}

- (id)sendMakeAvailableRequestForResource:(id)a3 reply:(id)a4
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PHMediaRequest *)self isCancelled]
    || ([v6 conformsToProtocol:&unk_1EEB63AA8] & 1) == 0)
  {
    v42 = @"PHImageCancelledKey";
    v43[0] = MEMORY[0x1E4F1CC38];
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    v27 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3072, 0);
    (*((void (**)(id, void, void, void, void *, void *))v7 + 2))(v7, 0, 0, 0, v11, v27);

    v28 = 0;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F8AB58]);
    id v9 = [(PHMediaRequest *)self identifierString];
    id v10 = [(PHObject *)self->_asset objectID];
    id v11 = (void *)[v8 initWithTaskIdentifier:v9 assetObjectID:v10 resource:v6];

    [v11 setWantsProgress:self->_wantsProgress];
    objc_msgSend(v11, "setNetworkAccessAllowed:", -[PHMediaRequest isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
    objc_msgSend(v11, "setDownloadIntent:", -[PHMediaRequest downloadIntent](self, "downloadIntent"));
    objc_msgSend(v11, "setDownloadPriority:", -[PHMediaRequest downloadPriority](self, "downloadPriority"));
    [v6 recipeID];
    if (PLShouldBoostLogLevelForResourceRecipeID()) {
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    }
    else {
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    }
    id v13 = PLImageManagerGetLog();
    if (os_log_type_enabled(v13, v12))
    {
      id v14 = [(PHMediaRequest *)self identifierString];
      v30 = [(PHObject *)self->_asset objectID];
      id v15 = objc_msgSend(v30, "pl_shortURI");
      unsigned __int8 v16 = [(PHObject *)self->_asset uuid];
      v17 = PLResourceIdentityShortDescription();
      *(_DWORD *)buf = 138544130;
      v35 = v14;
      __int16 v36 = 2114;
      v37 = v15;
      __int16 v38 = 2114;
      v39 = v16;
      __int16 v40 = 2114;
      v41 = v17;
      _os_log_impl(&dword_19B043000, v13, v12, "[RM] %{public}@ media request sending make available request for asset: %{public}@ %{public}@, resource: %{public}@", buf, 0x2Au);
    }
    v18 = [(PHObject *)self->_asset photoLibrary];
    unsigned __int8 v19 = [v18 assetsdClient];
    objc_super v20 = [v19 resourceAvailabilityClient];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __60__PHMediaRequest_sendMakeAvailableRequestForResource_reply___block_invoke;
    v31[3] = &unk_1E58469B0;
    v31[4] = self;
    id v32 = v6;
    id v33 = v7;
    v21 = [v20 sendMakeResourceAvailableRequest:v11 reply:v31];

    if (v21)
    {
      os_unfair_lock_lock(&self->_lock);
      unsigned __int8 v22 = atomic_load((unsigned __int8 *)&self->_cancelled);
      if (v22)
      {
        os_unfair_lock_unlock(&self->_lock);
        [v21 cancel];
      }
      else
      {
        progresses = self->_progresses;
        if (!progresses)
        {
          v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v25 = self->_progresses;
          self->_progresses = v24;

          progresses = self->_progresses;
        }
        [(NSMutableArray *)progresses addObject:v21];
        v26 = [(PHMediaRequest *)self lazyProgressContainer];
        [v26 setRequestProgress:v21];

        os_unfair_lock_unlock(&self->_lock);
      }
    }
    v28 = [(PHProgressContainerForRetryableRequest *)self->_progressContainer totalProgress];
  }

  return v28;
}

void __60__PHMediaRequest_sendMakeAvailableRequestForResource_reply___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (PHSignpostEventsEnabled_onceToken != -1) {
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
  }
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    uint64_t v15 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      v17 = PLImageManagerGetLog();
      uint64_t v32 = [*(id *)(a1 + 32) managerID];
      int v18 = [*(id *)(a1 + 32) requestID];
      uint64_t v19 = [*(id *)(a1 + 32) requestIndex];
      objc_super v20 = v17;
      if (os_signpost_enabled(v20))
      {
        v31 = (void *)v18;
        int v21 = [*(id *)(a1 + 40) recipeID];
        [*(id *)(a1 + 40) resourceType];
        *(_DWORD *)buf = 134218752;
        uint64_t v35 = v32;
        __int16 v36 = 2048;
        v37 = v31;
        __int16 v38 = 2048;
        uint64_t v39 = v19;
        __int16 v40 = 2048;
        uint64_t v41 = PHImageManagerSignpostRequestStateFromRecipeID(v21);
        _os_signpost_emit_with_name_impl(&dword_19B043000, v20, OS_SIGNPOST_EVENT, v16, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
      }
    }
  }
  if (v11 && a2)
  {
    unsigned __int8 v22 = (void *)MEMORY[0x1E4F8AB30];
    v23 = [*(id *)(a1 + 32) asset];
    id v33 = 0;
    LOBYTE(v22) = [v22 refreshSandboxExtensionForURL:v11 assetID:v23 error:&v33];
    id v24 = v33;

    if ((v22 & 1) == 0)
    {
      v25 = PLImageManagerGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = [*(id *)(a1 + 32) identifierString];
        v27 = [v11 path];
        *(_DWORD *)buf = 138412802;
        uint64_t v35 = (uint64_t)v26;
        __int16 v36 = 2112;
        v37 = v27;
        __int16 v38 = 2112;
        uint64_t v39 = (uint64_t)v24;
        _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, "[RM] %@ media request failed to refresh sandbox extension for path: %@, error; %@",
          buf,
          0x20u);
      }
      id v28 = v24;

      id v14 = v28;
    }

    goto LABEL_16;
  }
  v29 = [*(id *)(a1 + 32) delegate];
  char v30 = [v29 retryMediaRequest:*(void *)(a1 + 32) afterFailureWithError:v14];

  if ((v30 & 1) == 0) {
LABEL_16:
  }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)lazyProgressContainer
{
  progressContainer = self->_progressContainer;
  if (!progressContainer)
  {
    unsigned __int8 v4 = objc_alloc_init(PHProgressContainerForRetryableRequest);
    id v5 = self->_progressContainer;
    self->_progressContainer = v4;

    objc_initWeak(&location, self);
    id v6 = objc_alloc(MEMORY[0x1E4F8AAE8]);
    id v7 = [(PHProgressContainerForRetryableRequest *)self->_progressContainer totalProgress];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__PHMediaRequest_lazyProgressContainer__block_invoke;
    v11[3] = &unk_1E5847C08;
    objc_copyWeak(&v12, &location);
    id v8 = (PLProgressFollower *)[v6 initWithSourceProgress:v7 progressHandler:v11];
    progressFollower = self->_progressFollower;
    self->_progressFollower = v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    progressContainer = self->_progressContainer;
  }

  return progressContainer;
}

void __39__PHMediaRequest_lazyProgressContainer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  unsigned __int8 v4 = [WeakRetained delegate];
  [v4 mediaRequest:WeakRetained didReportProgress:v3];
}

- (int64_t)downloadPriority
{
  return 0;
}

- (int64_t)downloadIntent
{
  return 0;
}

- (void)configureWithError:(id)a3
{
}

- (BOOL)isNetworkAccessAllowed
{
  return 0;
}

- (void)cancel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
  unsigned __int8 v4 = (void *)[(NSMutableArray *)self->_progresses copy];
  [(NSMutableArray *)self->_progresses removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "cancel", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)handleAvailabilityChangeForResource:(id)a3 url:(id)a4 info:(id)a5 error:(id)a6
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  [v10 handleFailureInMethod:a2, self, @"PHMediaRequest.m", 75, @"%@ Subclass must implement", v9 object file lineNumber description];
}

- (void)startRequest
{
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  unsigned __int8 v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v6 handleFailureInMethod:a2, self, @"PHMediaRequest.m", 71, @"%@ Subclass must implement", v5 object file lineNumber description];
}

- (BOOL)isSynchronous
{
  unsigned __int8 v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PHMediaRequest.m", 59, @"%@ Subclass must implement", v6 object file lineNumber description];

  return 0;
}

@end