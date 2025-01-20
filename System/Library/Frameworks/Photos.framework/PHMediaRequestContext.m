@interface PHMediaRequestContext
+ (OS_dispatch_queue)chooserQueue;
+ (id)contentEditingInputRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 useRAWAsUnadjustedBase:(BOOL)a7 resultHandler:(id)a8;
+ (id)imageRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 imageRequestOptions:(id)a6 displaySpec:(id)a7 resultHandler:(id)a8;
+ (id)livePhotoRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 livePhotoRequestOptions:(id)a6 displaySpec:(id)a7 resultHandler:(id)a8;
+ (id)videoRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 videoRequestOptions:(id)a6 intent:(int64_t)a7 resultHandler:(id)a8;
+ (void)initialize;
- (BOOL)isCancelled;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (BOOL)mediaRequestCanRequestRepair:(id)a3;
- (BOOL)representsShareableHighQualityResource;
- (BOOL)retryMediaRequest:(id)a3 afterFailureWithError:(id)a4;
- (BOOL)shouldLimitRepairRequestsPerProcess;
- (BOOL)shouldReportProgress;
- (NSError)prestartError;
- (PHAsset)asset;
- (PHImageDisplaySpec)displaySpec;
- (PHImageResourceChooser)imageResourceChooser;
- (PHMediaRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 resultHandler:(id)a7;
- (PHMediaRequestContext)supplementaryRequestContext;
- (PHMediaRequestContextDelegate)delegate;
- (double)totalProgressFraction;
- (id)_produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5;
- (id)_produceChildRequestsForRequest:(id)a3 withResult:(id)a4;
- (id)_requestWithIdentifier:(id)a3;
- (id)initialRequests;
- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6;
- (id)progressHandler;
- (id)progresses;
- (int)maxRepairRequests;
- (int)requestID;
- (int64_t)type;
- (unint64_t)managerID;
- (unint64_t)nextRequestIndex;
- (unint64_t)signpostID;
- (unint64_t)signpostLayoutID;
- (void)_registerAndStartRequests:(id)a3;
- (void)_setupProgressIfNeeded;
- (void)adjustmentDataRequest:(id)a3 didReportProgress:(double)a4 completed:(BOOL)a5 error:(id)a6;
- (void)beginCustomAsyncWorkWithIdentifier:(id)a3;
- (void)cancel;
- (void)finishCustomAsyncWorkWithIdentifier:(id)a3;
- (void)imageRequest:(id)a3 isQueryingCacheAndDidWait:(BOOL *)a4 didFindImage:(BOOL *)a5 resultHandler:(id)a6;
- (void)imageRequest:(id)a3 isRequestingScheduledWorkBlock:(id)a4;
- (void)mediaRequest:(id)a3 didFindLocallyAvailableResult:(BOOL)a4 isDegraded:(BOOL)a5;
- (void)mediaRequest:(id)a3 didFinishWithResult:(id)a4;
- (void)mediaRequest:(id)a3 didReportProgress:(id)a4;
- (void)mediaRequest:(id)a3 didRequestRetryWithHintsAllowed:(BOOL)a4;
- (void)processMediaResult:(id)a3 forRequest:(id)a4;
- (void)requestWithIdentifier:(id)a3 didReportProgress:(double)a4 completed:(BOOL)a5 error:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setDisplaySpec:(id)a3;
- (void)setImageResourceChooser:(id)a3;
- (void)setPrestartError:(id)a3;
- (void)setProgress:(id)a3 forRequestIdentifier:(id)a4;
- (void)setSignpostID:(unint64_t)a3;
- (void)setSignpostLayoutID:(unint64_t)a3;
- (void)setSupplementaryRequestContext:(id)a3;
- (void)start;
@end

@implementation PHMediaRequestContext

uint64_t __51__PHMediaRequestContext__registerAndStartRequests___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startRequest];
}

- (void)imageRequest:(id)a3 isQueryingCacheAndDidWait:(BOOL *)a4 didFindImage:(BOOL *)a5 resultHandler:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [(PHMediaRequestContext *)self delegate];
  [v12 mediaRequestContext:self isQueryingCacheForRequest:v11 didWait:a4 didFindImage:a5 resultHandler:v10];
}

- (PHMediaRequestContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHMediaRequestContextDelegate *)WeakRetained;
}

- (void)mediaRequest:(id)a3 didFinishWithResult:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PHMediaRequestContext *)self _produceChildRequestsForRequest:v6 withResult:v7];
  [(PHMediaRequestContext *)self _registerAndStartRequests:v8];
  if (([v7 containsValidData] & 1) == 0)
  {
    if ([v7 isInCloud])
    {
      if (![(PHMediaRequestContext *)self isNetworkAccessAllowed])
      {
        v9 = [v7 error];

        if (!v9)
        {
          id v10 = PLImageManagerGetLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            unint64_t managerID = self->_managerID;
            uint64_t requestID = self->_requestID;
            v13 = (objc_class *)objc_opt_class();
            v14 = NSStringFromClass(v13);
            unint64_t v15 = [(PHMediaRequestContext *)self type];
            if (v15 > 6) {
              v16 = 0;
            }
            else {
              v16 = off_1E5842720[v15];
            }
            *(_DWORD *)buf = 134218754;
            unint64_t v29 = managerID;
            __int16 v30 = 2048;
            uint64_t v31 = requestID;
            __int16 v32 = 2112;
            v33 = v14;
            __int16 v34 = 2112;
            v35 = v16;
            _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_ERROR, "[RM] %ld-%ld %@ subrequest for %@ request should be reporting network access allowed error", buf, 0x2Au);
          }
          if (PHImageManagerRecordEnabled())
          {
            uint64_t v22 = self->_requestID;
            unint64_t v23 = self->_managerID;
            v24 = (objc_class *)objc_opt_class();
            v25 = NSStringFromClass(v24);
            unint64_t v26 = [(PHMediaRequestContext *)self type];
            if (v26 > 6) {
              v27 = 0;
            }
            else {
              v27 = off_1E5842720[v26];
            }
            +[PHImageManagerRequestTracer traceMessageForRequestID:v22, @"[RM] %ld-%ld %@ subrequest for %@ request should be reporting network access allowed error", v23, v22, v25, v27 message];
          }
          v17 = PHNetworkAccessAllowedRequiredError();
          [v7 setErrorIfNone:v17];
        }
      }
    }
  }
  [(PHMediaRequestContext *)self processMediaResult:v7 forRequest:v6];
  os_unfair_lock_lock(&self->_lock);
  inflightRequestIdentifiers = self->_inflightRequestIdentifiers;
  v19 = [v6 identifierString];
  [(NSMutableSet *)inflightRequestIdentifiers removeObject:v19];

  uint64_t v20 = [(NSMutableSet *)self->_inflightRequestIdentifiers count];
  os_unfair_lock_unlock(&self->_lock);
  if (!v20)
  {
    v21 = [(PHMediaRequestContext *)self delegate];
    [v21 mediaRequestContextDidFinish:self];
  }
}

- (void)_registerAndStartRequests:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v31 = v4;
  if (self->_isCancelled)
  {
    os_unfair_lock_unlock(&self->_lock);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v33 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v11 = PLImageManagerGetLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            id v12 = [v10 identifierString];
            *(_DWORD *)buf = 138412290;
            v46 = v12;
            _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEBUG, "[RM]: %@ Ignoring request start due to cancellation", buf, 0xCu);
          }
          if (PHImageManagerRecordEnabled())
          {
            uint64_t v13 = [v10 requestID];
            v14 = [v10 identifierString];
            +[PHImageManagerRequestTracer traceMessageForRequestID:v13, @"[RM]: %@ Ignoring request start due to cancellation", v14 message];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v47 count:16];
      }
      while (v7);
    }
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v15 = v4;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          [(NSMutableArray *)self->_requests addObject:v20];
          inflightRequestIdentifiers = self->_inflightRequestIdentifiers;
          uint64_t v22 = [v20 identifierString];
          [(NSMutableSet *)inflightRequestIdentifiers addObject:v22];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v17);
    }

    os_unfair_lock_unlock(&self->_lock);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v23 = v15;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v38;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v38 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v37 + 1) + 8 * v27);
          [v28 setSignpostID:self->_signpostID];
          unint64_t v29 = [(PHMediaRequestContext *)self progressHandler];
          [v28 setWantsProgress:v29 != 0];

          if ([v28 isSynchronous]
            || dispatch_get_specific(&s_chooserQueueDispatchSpecificKey))
          {
            [v28 startRequest];
          }
          else
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __51__PHMediaRequestContext__registerAndStartRequests___block_invoke;
            block[3] = &unk_1E5848578;
            block[4] = v28;
            dispatch_async((dispatch_queue_t)s_backgroundChooserQueue, block);
          }
          ++v27;
        }
        while (v25 != v27);
        uint64_t v30 = [v23 countByEnumeratingWithState:&v37 objects:v48 count:16];
        uint64_t v25 = v30;
      }
      while (v30);
    }
  }
}

- (BOOL)shouldReportProgress
{
  v2 = [(PHMediaRequestContext *)self progressHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_produceChildRequestsForRequest:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = -[PHMediaRequestContext produceChildRequestsForRequest:reportingIsLocallyAvailable:isDegraded:result:](self, "produceChildRequestsForRequest:reportingIsLocallyAvailable:isDegraded:result:", v7, [v6 containsValidData], objc_msgSend(v6, "isDegraded"), v6);

  return v8;
}

- (void)mediaRequest:(id)a3 didFindLocallyAvailableResult:(BOOL)a4 isDegraded:(BOOL)a5
{
  id v6 = [(PHMediaRequestContext *)self _produceChildRequestsForRequest:a3 reportingIsLocallyAvailable:a4 isDegraded:a5];
  [(PHMediaRequestContext *)self _registerAndStartRequests:v6];
}

- (id)_produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5
{
  return [(PHMediaRequestContext *)self produceChildRequestsForRequest:a3 reportingIsLocallyAvailable:a4 isDegraded:a5 result:0];
}

+ (id)imageRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 imageRequestOptions:(id)a6 displaySpec:(id)a7 resultHandler:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  if ([v14 version] == 16)
  {
    uint64_t v17 = [[PHAdjustmentDataRequestContext alloc] initWithRequestID:v12 managerID:a4 asset:v13 options:v14 resultHandler:v16];
  }
  else if ([v14 version] == 17)
  {
    uint64_t v17 = +[PHSingleMediaRequestContext originalAdjustmentDataRequestContextWithRequestID:v12 managerID:a4 asset:v13 options:v14 resultHandler:v16];
  }
  else
  {
    uint64_t v17 = [[PHImageRequestContext alloc] initWithRequestID:v12 managerID:a4 asset:v13 displaySpec:v15 options:v14 resultHandler:v16];
  }
  uint64_t v18 = v17;

  return v18;
}

- (PHMediaRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 resultHandler:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)PHMediaRequestContext;
  id v16 = [(PHMediaRequestContext *)&v27 init];
  uint64_t v17 = v16;
  if (v16)
  {
    v16->_uint64_t requestID = a3;
    v16->_unint64_t managerID = a4;
    objc_storeStrong((id *)&v16->_asset, a5);
    if (!v17->_asset)
    {
      uint64_t v18 = PLImageManagerGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v26 = 0;
        _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "Media context with a nil asset is invalid, will result in a no-op media request", v26, 2u);
      }

      if (PHImageManagerRecordEnabled()) {
        +[PHImageManagerRequestTracer traceMessageForRequestID:v17->_requestID message:@"Media context with a nil asset is invalid, will result in a no-op media request"];
      }
    }
    objc_storeStrong((id *)&v17->_displaySpec, a6);
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requests = v17->_requests;
    v17->_requests = v19;

    if (v15)
    {
      uint64_t v21 = [v15 copy];
      id resultHandler = v17->_resultHandler;
      v17->_id resultHandler = (id)v21;
    }
    id v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    inflightRequestIdentifiers = v17->_inflightRequestIdentifiers;
    v17->_inflightRequestIdentifiers = v23;

    v17->_lock._os_unfair_lock_opaque = 0;
    v17->_signpostID = 0;
    atomic_store(0, (unsigned int *)&v17->_repairAttemptCount);
  }

  return v17;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (int)requestID
{
  return self->_requestID;
}

- (unint64_t)nextRequestIndex
{
  return atomic_fetch_add((atomic_ullong *volatile)&self->_nextID, 1uLL);
}

- (unint64_t)managerID
{
  return self->_managerID;
}

- (PHImageResourceChooser)imageResourceChooser
{
  imageResourceChooser = self->_imageResourceChooser;
  if (!imageResourceChooser)
  {
    if (self->_asset)
    {
      id v4 = objc_alloc_init(PHResourceChooserList);
      id v5 = [[PHImageResourceChooser alloc] initWithChooserList:v4 asset:self->_asset resourceHandler:0];
      id v6 = self->_imageResourceChooser;
      self->_imageResourceChooser = v5;

      [(PHImageResourceChooser *)self->_imageResourceChooser setIsCloudSharedMode:[(PHAsset *)self->_asset isCloudSharedAsset]];
      imageResourceChooser = self->_imageResourceChooser;
    }
    else
    {
      imageResourceChooser = 0;
    }
  }

  return imageResourceChooser;
}

- (PHImageDisplaySpec)displaySpec
{
  return self->_displaySpec;
}

- (void)start
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL v3 = PLImageManagerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    unint64_t managerID = self->_managerID;
    uint64_t requestID = self->_requestID;
    unint64_t v6 = [(PHMediaRequestContext *)self type];
    if (v6 > 6) {
      id v7 = 0;
    }
    else {
      id v7 = off_1E5842720[v6];
    }
    uint64_t v8 = [(PHMediaRequestContext *)self asset];
    v9 = [v8 uuid];
    BOOL v10 = [(PHMediaRequestContext *)self isNetworkAccessAllowed];
    *(_DWORD *)buf = 134219010;
    id v11 = @"N";
    unint64_t v33 = managerID;
    __int16 v34 = 2048;
    if (v10) {
      id v11 = @"Y";
    }
    uint64_t v35 = requestID;
    __int16 v36 = 2112;
    long long v37 = v7;
    __int16 v38 = 2112;
    long long v39 = v9;
    __int16 v40 = 2112;
    long long v41 = v11;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "[RM]: %ld-%ld Starting request with type %@, asset: %@, net: %@", buf, 0x34u);
  }
  if (PHImageManagerRecordEnabled())
  {
    uint64_t v21 = self->_requestID;
    unint64_t v22 = self->_managerID;
    unint64_t v23 = [(PHMediaRequestContext *)self type];
    if (v23 > 6) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = off_1E5842720[v23];
    }
    uint64_t v25 = [(PHMediaRequestContext *)self asset];
    uint64_t v26 = [v25 uuid];
    BOOL v27 = [(PHMediaRequestContext *)self isNetworkAccessAllowed];
    v28 = @"N";
    if (v27) {
      v28 = @"Y";
    }
    +[PHImageManagerRequestTracer traceMessageForRequestID:v21, @"[RM]: %ld-%ld Starting request with type %@, asset: %@, net: %@", v22, v21, v24, v26, v28 message];
  }
  if ([(PHMediaRequestContext *)self shouldReportProgress]) {
    [(PHMediaRequestContext *)self _setupProgressIfNeeded];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__PHMediaRequestContext_start__block_invoke;
  aBlock[3] = &unk_1E5842688;
  aBlock[4] = self;
  uint64_t v12 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v13 = [(PHMediaRequestContext *)self prestartError];

  if (v13)
  {
    id v14 = [(PHMediaRequestContext *)self prestartError];
    v12[2](v12, v14);
  }
  else
  {
    id v14 = [(PHMediaRequestContext *)self initialRequests];
    if ([v14 count])
    {
      [(PHMediaRequestContext *)self _registerAndStartRequests:v14];
    }
    else
    {
      id v15 = PLImageManagerGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        unint64_t v16 = self->_managerID;
        uint64_t v17 = self->_requestID;
        *(_DWORD *)buf = 134218240;
        unint64_t v33 = v16;
        __int16 v34 = 2048;
        uint64_t v35 = v17;
        _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "%ld-%ld Media request started without requesting image or video, this is a no op", buf, 0x16u);
      }

      if (PHImageManagerRecordEnabled()) {
        +[PHImageManagerRequestTracer traceMessageForRequestID:self->_managerID message:self->_requestID];
      }
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v30 = *MEMORY[0x1E4F28228];
      uint64_t v31 = @"Image manager unable to find initial requests, potential request for nonexistent resource";
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v20 = (void *)[v18 initWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v19];

      v12[2](v12, v20);
    }
  }
}

- (void)setProgress:(id)a3 forRequestIdentifier:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    [(PHMediaRequestContext *)self _setupProgressIfNeeded];
    os_unfair_lock_lock(&self->_lock);
    [(NSMutableDictionary *)self->_progressByTaskIdentifier setObject:v7 forKey:v6];

    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_setupProgressIfNeeded
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!self->_totalProgress)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    id v4 = [(PHMediaRequestContext *)self progresses];
    if ([v4 count])
    {
      if ([v4 count] == 1)
      {
        id v5 = [v4 firstObject];
        totalProgress = self->_totalProgress;
        self->_totalProgress = v5;
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v7 = v4;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = 0;
          uint64_t v11 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v7);
              }
              v10 += [*(id *)(*((void *)&v26 + 1) + 8 * i) totalUnitCount];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
          }
          while (v9);
        }
        else
        {
          uint64_t v10 = 0;
        }

        id v13 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v10];
        id v14 = self->_totalProgress;
        self->_totalProgress = v13;

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v15 = v7;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v23;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v23 != v18) {
                objc_enumerationMutation(v15);
              }
              -[NSProgress addChild:withPendingUnitCount:](self->_totalProgress, "addChild:withPendingUnitCount:", *(void *)(*((void *)&v22 + 1) + 8 * j), objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "totalUnitCount", (void)v22));
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v17);
        }
      }
    }
    objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", (void)v22);
    uint64_t v20 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    progressByTaskIdentifier = self->_progressByTaskIdentifier;
    self->_progressByTaskIdentifier = v20;

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setDelegate:(id)a3
{
}

- (NSError)prestartError
{
  return self->_prestartError;
}

- (void)mediaRequest:(id)a3 didReportProgress:(id)a4
{
  id v6 = a4;
  id v9 = [a3 identifierString];
  [v6 fractionCompleted];
  double v8 = v7;

  [(PHMediaRequestContext *)self requestWithIdentifier:v9 didReportProgress:0 completed:0 error:v8];
}

- (void)requestWithIdentifier:(id)a3 didReportProgress:(double)a4 completed:(BOOL)a5 error:(id)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = [(PHMediaRequestContext *)self progressHandler];
  if ([(PHMediaRequestContext *)self shouldReportProgress]
    && ![(PHMediaRequestContext *)self isCancelled])
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v12 = [(NSMutableDictionary *)self->_progressByTaskIdentifier objectForKey:v9];
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v12, "setCompletedUnitCount:", vcvtmd_s64_f64((double)objc_msgSend(v12, "totalUnitCount") * a4));
    [(NSProgress *)self->_totalProgress fractionCompleted];
    double v14 = v13;
    char v18 = 0;
    long long v25 = @"PHImageResultRequestIDKey";
    id v15 = [NSNumber numberWithInt:self->_requestID];
    v26[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];

    ((void (**)(void, id, char *, void *, double))v11)[2](v11, v10, &v18, v16, v14);
    uint64_t v17 = PLImageManagerGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v9;
      __int16 v21 = 2048;
      double v22 = a4;
      __int16 v23 = 2048;
      double v24 = v14;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "[RM]: %@ request progress is %f, total progress is %f", buf, 0x20u);
    }

    if (PHImageManagerRecordEnabled()) {
      +[PHImageManagerRequestTracer traceMessageForRequestID:self->_requestID, @"[RM]: %@ request progress is %f, total progress is %f", v9, *(void *)&a4, *(void *)&v14 message];
    }
    if (v18) {
      [(PHMediaRequestContext *)self cancel];
    }
  }
}

- (BOOL)isCancelled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isCancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prestartError, 0);
  objc_storeStrong((id *)&self->_supplementaryRequestContext, 0);
  objc_storeStrong((id *)&self->_imageResourceChooser, 0);
  objc_storeStrong((id *)&self->_displaySpec, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_totalProgress, 0);
  objc_storeStrong((id *)&self->_progressByTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_inflightRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_requests, 0);

  objc_storeStrong(&self->_resultHandler, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    attr = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v3 = dispatch_queue_create("com.apple.photos.imgmgr.ctxt.bgchooser", attr);
    id v4 = (void *)s_backgroundChooserQueue;
    s_backgroundChooserQueue = (uint64_t)v3;

    dispatch_queue_set_specific((dispatch_queue_t)s_backgroundChooserQueue, &s_chooserQueueDispatchSpecificKey, s_chooserQueueDispatchSpecificKey, 0);
  }
}

- (void)setPrestartError:(id)a3
{
}

- (void)setSupplementaryRequestContext:(id)a3
{
}

- (PHMediaRequestContext)supplementaryRequestContext
{
  return self->_supplementaryRequestContext;
}

- (void)setImageResourceChooser:(id)a3
{
}

- (void)setDisplaySpec:(id)a3
{
}

- (void)setSignpostLayoutID:(unint64_t)a3
{
  self->_signpostLayoutID = a3;
}

- (unint64_t)signpostLayoutID
{
  return self->_signpostLayoutID;
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void)adjustmentDataRequest:(id)a3 didReportProgress:(double)a4 completed:(BOOL)a5 error:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = [a3 identifierString];
  [(PHMediaRequestContext *)self requestWithIdentifier:v11 didReportProgress:v6 completed:v10 error:a4];
}

- (void)imageRequest:(id)a3 isRequestingScheduledWorkBlock:(id)a4
{
  id v5 = a3;
  BOOL v6 = (void (**)(id, id))a4;
  if (v6)
  {
    if ([v5 isSynchronous])
    {
      v6[2](v6, v5);
    }
    else
    {
      objc_initWeak(&location, v5);
      double v7 = s_backgroundChooserQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__PHMediaRequestContext_imageRequest_isRequestingScheduledWorkBlock___block_invoke;
      block[3] = &unk_1E5847980;
      objc_copyWeak(&v10, &location);
      id v9 = v6;
      dispatch_async(v7, block);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __69__PHMediaRequestContext_imageRequest_isRequestingScheduledWorkBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)mediaRequestCanRequestRepair:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (([(PHMediaRequestContext *)self maxRepairRequests] & 0x80000000) == 0)
  {
    int add = atomic_fetch_add(&self->_repairAttemptCount, 1u);
    if (add >= [(PHMediaRequestContext *)self maxRepairRequests])
    {
      unsigned int v12 = atomic_load((unsigned int *)&self->_repairAttemptCount);
      double v8 = PLImageManagerGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t managerID = self->_managerID;
        uint64_t requestID = self->_requestID;
        int v15 = 134218752;
        unint64_t v16 = managerID;
        __int16 v17 = 2048;
        uint64_t v18 = requestID;
        __int16 v19 = 2048;
        uint64_t v20 = [(PHMediaRequestContext *)self maxRepairRequests];
        __int16 v21 = 1024;
        unsigned int v22 = v12;
        id v11 = "[RM]: %ld-%ld Exceeded context wide limit (%ld) for resource repair requests (%d).";
        goto LABEL_9;
      }
LABEL_10:

      return 0;
    }
  }
  BOOL v5 = [(PHMediaRequestContext *)self shouldLimitRepairRequestsPerProcess];
  BOOL result = 1;
  if (v5 && atomic_fetch_add(sProcessRepairAttemptCount, 1u) == 0x7FFFFFFF)
  {
    unsigned int v7 = atomic_load((unsigned int *)sProcessRepairAttemptCount);
    double v8 = PLImageManagerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = self->_managerID;
      uint64_t v10 = self->_requestID;
      int v15 = 134218752;
      unint64_t v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      __int16 v19 = 2048;
      uint64_t v20 = 0x7FFFFFFFLL;
      __int16 v21 = 1024;
      unsigned int v22 = v7;
      id v11 = "[RM]: %ld-%ld Exceeded process wide limit (%ld) for resource repair requests (%d).";
LABEL_9:
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, 0x26u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  return result;
}

- (void)mediaRequest:(id)a3 didRequestRetryWithHintsAllowed:(BOOL)a4
{
  id v6 = a3;
  unsigned int v7 = s_backgroundChooserQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PHMediaRequestContext_mediaRequest_didRequestRetryWithHintsAllowed___block_invoke;
  block[3] = &unk_1E5842700;
  BOOL v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

uint64_t __70__PHMediaRequestContext_mediaRequest_didRequestRetryWithHintsAllowed___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) imageResourceChooser];
  [v2 setAllowHints:*(unsigned __int8 *)(a1 + 48)];

  dispatch_queue_t v3 = [*(id *)(a1 + 32) imageResourceChooser];
  [v3 moveFirst];

  id v4 = *(void **)(a1 + 40);

  return [v4 startRequest];
}

- (BOOL)retryMediaRequest:(id)a3 afterFailureWithError:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PHRequestRetryTypeForRequest(v6, v7);
  switch(v8)
  {
    case 3:
      unsigned int v12 = PLImageManagerGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        double v13 = [v6 identifierString];
        *(_DWORD *)buf = 138543362;
        __int16 v36 = v13;
        _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ media request requires additional resources to generate adjustment on demand", buf, 0xCu);
      }
      double v14 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
      int v15 = [v6 lazyProgressContainer];
      [v15 setRequestProgress:v14];

      objc_initWeak((id *)buf, self);
      unint64_t v16 = [(PHMediaRequestContext *)self asset];
      unsigned int v26 = [(PHMediaRequestContext *)self requestID];
      unint64_t v17 = [(PHMediaRequestContext *)self managerID];
      BOOL v18 = [(PHMediaRequestContext *)self isNetworkAccessAllowed];
      uint64_t v19 = [v6 downloadIntent];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_77;
      v31[3] = &unk_1E58426B0;
      unint64_t v9 = v14;
      uint64_t v32 = v9;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_2;
      v28[3] = &unk_1E58426D8;
      objc_copyWeak(&v30, (id *)buf);
      id v29 = v6;
      uint64_t v20 = +[PHContentEditingInputRequestContext contentEditingInputRequestContextForAsset:v16 requestID:v26 managerID:v17 networkAccessAllowed:v18 downloadIntent:v19 progressHandler:v31 resultHandler:v28];
      supplementaryRequestContext = self->_supplementaryRequestContext;
      self->_supplementaryRequestContext = v20;

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_3;
      block[3] = &unk_1E5848578;
      void block[4] = self;
      dispatch_async((dispatch_queue_t)s_backgroundChooserQueue, block);

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
      BOOL v11 = 1;
      break;
    case 2:
      unsigned int v22 = PLImageManagerGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = [v6 identifierString];
        *(_DWORD *)buf = 138543618;
        __int16 v36 = v23;
        __int16 v37 = 2112;
        id v38 = v7;
        _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "[RM] %{public}@ media request retrying due to error: %@", buf, 0x16u);
      }
      double v24 = s_backgroundChooserQueue;
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke;
      v33[3] = &unk_1E5848578;
      __int16 v34 = v6;
      dispatch_async(v24, v33);
      BOOL v11 = 1;
      unint64_t v9 = v34;
      break;
    case 1:
      unint64_t v9 = PLImageManagerGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v6 identifierString];
        *(_DWORD *)buf = 138543618;
        __int16 v36 = v10;
        __int16 v37 = 2112;
        id v38 = v7;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "[RM] %{public}@ media request exceeded retry limit, failing with error: %@", buf, 0x16u);
      }
      BOOL v11 = 0;
      break;
    default:
      BOOL v11 = 0;
      goto LABEL_15;
  }

LABEL_15:
  return v11;
}

uint64_t __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareForRetry];
  v2 = *(void **)(a1 + 32);

  return [v2 startRequest];
}

uint64_t __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_77(uint64_t a1, double a2)
{
  uint64_t v3 = (uint64_t)((double)[*(id *)(a1 + 32) totalUnitCount] * a2);
  id v4 = *(void **)(a1 + 32);

  return [v4 setCompletedUnitCount:v3];
}

void __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setSupplementaryRequestContext:0];
  if ([v3 containsValidData])
  {
    [*(id *)(a1 + 32) prepareForRetry];
    [*(id *)(a1 + 32) startRequest];
  }
  else
  {
    BOOL v5 = [v3 error];
    if (!v5)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = *MEMORY[0x1E4F28228];
      v9[0] = @"Supplementary content editing request failed";
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      BOOL v5 = [v6 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v7];
    }
    [*(id *)(a1 + 32) configureWithError:v5];
    [*(id *)(a1 + 32) startRequest];
  }
}

uint64_t __65__PHMediaRequestContext_retryMediaRequest_afterFailureWithError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 136) start];
}

- (BOOL)representsShareableHighQualityResource
{
  return 0;
}

- (void)cancel
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isCancelled = 1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_requests;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "cancel", (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
}

void __30__PHMediaRequestContext_start__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[1];
  id v5 = a2;
  uint64_t v6 = +[PHCompositeMediaResult resultWithRequestID:error:](PHCompositeMediaResult, "resultWithRequestID:error:", [v3 requestID], v5);

  (*(void (**)(uint64_t, void *, void, void))(v4 + 16))(v4, v6, 0, *(void *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained mediaRequestContextDidFinish:*(void *)(a1 + 32)];
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"PHMediaRequestContext.m" lineNumber:372 description:@"Subclasses to implement"];
}

- (id)progresses
{
  return 0;
}

- (id)progressHandler
{
  return 0;
}

- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6
{
  return 0;
}

- (id)initialRequests
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PHMediaRequestContext.m" lineNumber:301 description:@"Subclasses to implement"];

  return 0;
}

- (BOOL)shouldLimitRepairRequestsPerProcess
{
  return 1;
}

- (int)maxRepairRequests
{
  return 1;
}

- (void)finishCustomAsyncWorkWithIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_inflightRequestIdentifiers removeObject:v5];

  uint64_t v6 = [(NSMutableSet *)self->_inflightRequestIdentifiers count];
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    id v7 = [(PHMediaRequestContext *)self delegate];
    [v7 mediaRequestContextDidFinish:self];
  }
}

- (void)beginCustomAsyncWorkWithIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_inflightRequestIdentifiers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (double)totalProgressFraction
{
  [(NSProgress *)self->_totalProgress fractionCompleted];
  return result;
}

- (BOOL)isNetworkAccessAllowed
{
  return 0;
}

- (BOOL)isSynchronous
{
  return 0;
}

- (int64_t)type
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PHMediaRequestContext.m" lineNumber:249 description:@"Subclasses to implement"];

  return 0;
}

- (id)_requestWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = self->_requests;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = objc_msgSend(v10, "identifierString", (void)v14);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);

  return v7;
}

+ (OS_dispatch_queue)chooserQueue
{
  return (OS_dispatch_queue *)(id)s_backgroundChooserQueue;
}

+ (id)contentEditingInputRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 useRAWAsUnadjustedBase:(BOOL)a7 resultHandler:(id)a8
{
  BOOL v8 = a7;
  uint64_t v12 = *(void *)&a3;
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  long long v16 = [[PHContentEditingInputRequestContext alloc] initWithRequestID:v12 managerID:a4 asset:v15 options:v14 useRAWAsUnadjustedBase:v8 resultHandler:v13];

  return v16;
}

+ (id)livePhotoRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 livePhotoRequestOptions:(id)a6 displaySpec:(id)a7 resultHandler:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  long long v17 = [[PHLivePhotoRequestContext alloc] initWithRequestID:v12 managerID:a4 asset:v16 displaySpec:v14 options:v15 resultHandler:v13];

  return v17;
}

+ (id)videoRequestContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 videoRequestOptions:(id)a6 intent:(int64_t)a7 resultHandler:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v13 = a8;
  id v14 = a6;
  id v15 = a5;
  id v16 = [PHImageDisplaySpec alloc];
  [v14 targetSize];
  uint64_t v19 = -[PHImageDisplaySpec initWithTargetSize:contentMode:](v16, "initWithTargetSize:contentMode:", [v14 contentMode], v17, v18);
  uint64_t v20 = [[PHVideoRequestContext alloc] initWithRequestID:v12 managerID:a4 asset:v15 displaySpec:v19 options:v14 intent:a7 resultHandler:v13];

  return v20;
}

@end