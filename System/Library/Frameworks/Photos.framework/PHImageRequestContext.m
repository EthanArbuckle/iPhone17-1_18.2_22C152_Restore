@interface PHImageRequestContext
- (BOOL)_isVideoFrameRequest;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (BOOL)representsShareableHighQualityResource;
- (BOOL)shouldLimitRepairRequestsPerProcess;
- (BOOL)shouldReportProgress;
- (PHImageRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 options:(id)a7 resultHandler:(id)a8;
- (PHImageRequestOptions)imageOptions;
- (id)_lazyProgress;
- (id)_produceFinalImageRequestForRequest:(id)a3;
- (id)_produceIntermediateImageRequestForRequest:(id)a3;
- (id)_videoBehavior;
- (id)initialRequests;
- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6;
- (id)progressHandler;
- (id)progresses;
- (int64_t)type;
- (void)processMediaResult:(id)a3 forRequest:(id)a4;
@end

@implementation PHImageRequestContext

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self->super._resultHandler)
  {
    BOOL v9 = [(PHImageRequestContext *)self _isVideoFrameRequest];
    id v10 = v7;
    v11 = v10;
    if (v9)
    {
      v12 = [v10 videoURL];

      if (v12)
      {
        v13 = PLImageManagerGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = [v8 identifierString];
          imageOptions = self->_imageOptions;
          if (imageOptions) {
            [(PHImageRequestOptions *)imageOptions videoFrameTime];
          }
          else {
            memset(&time, 0, sizeof(time));
          }
          v32 = (__CFString *)CMTimeCopyDescription(0, &time);
          v33 = [v11 videoURL];
          v34 = [v33 path];
          *(_DWORD *)buf = 138543874;
          v54 = v14;
          __int16 v55 = 2114;
          v56 = v32;
          __int16 v57 = 2112;
          v58 = v34;
          _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ generating video frame at time: %{public}@, file path: '%@'", buf, 0x20u);
        }
        v35 = (void *)MEMORY[0x1E4F8AAD8];
        v36 = [v11 videoURL];
        v37 = self->_imageOptions;
        if (v37) {
          [(PHImageRequestOptions *)v37 videoFrameTime];
        }
        else {
          memset(v51, 0, sizeof(v51));
        }
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __55__PHImageRequestContext_processMediaResult_forRequest___block_invoke;
        v49[3] = &unk_1E5846970;
        v49[4] = self;
        id v50 = v8;
        [v35 generateKeyFrameFromVideoURL:v36 time:v51 completion:v49];
      }
      else
      {
        (*((void (**)(void))self->super._resultHandler + 2))();
      }
    }
    else
    {
      id v16 = v8;
      v17 = [v16 behaviorSpec];
      uint64_t v18 = [v17 choosingPolicy];

      if ([(PHImageRequestOptions *)self->_imageOptions deliveryMode]) {
        BOOL v19 = 1;
      }
      else {
        BOOL v19 = v18 == 3;
      }
      char v20 = v19;
      if (v19)
      {
        BOOL v48 = 0;
        int64_t v21 = 3;
      }
      else
      {
        BOOL v48 = v18 != 1;
        if (v18 == 1) {
          int64_t v21 = 1;
        }
        else {
          int64_t v21 = 2;
        }
        if ([v11 imageRef]
          && [v11 isPlaceholder]
          && [v11 isPlaceholder])
        {
          [v11 setDegraded:1];
        }
      }
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      int64_t lock_highestResultPhaseDelivered = self->_lock_highestResultPhaseDelivered;
      if (v21 <= lock_highestResultPhaseDelivered)
      {
        v30 = PLImageManagerGetLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          v31 = [v16 identifierString];
          *(_DWORD *)buf = 138412290;
          v54 = v31;
          _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request context avoiding delivering out of order result.", buf, 0xCu);
        }
        if (PHImageManagerRecordEnabled())
        {
          uint64_t v40 = [v16 requestID];
          v41 = [v16 identifierString];
          +[PHImageManagerRequestTracer traceMessageForRequestID:v40, @"[RM]: %@ image request context avoiding delivering out of order result.", v41 message];
        }
      }
      else
      {
        if (lock_highestResultPhaseDelivered > 1) {
          goto LABEL_64;
        }
        char v24 = v20 ^ 1;
        if (!self->_intermediateRequest) {
          char v24 = 1;
        }
        if (v24 & 1) != 0 || ([v11 containsValidData])
        {
LABEL_64:
          if ((v20 & 1) != 0 || [v11 imageRef])
          {
            v25 = PLImageManagerGetLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              v26 = [v16 identifierString];
              v27 = off_1E5846990[v21 - 1];
              *(_DWORD *)buf = 138412546;
              v54 = v26;
              __int16 v55 = 2112;
              v56 = v27;
              _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request context delivering %@ result.", buf, 0x16u);
            }
            if (PHImageManagerRecordEnabled())
            {
              uint64_t v42 = [v16 requestID];
              v43 = [v16 identifierString];
              +[PHImageManagerRequestTracer traceMessageForRequestID:v42, @"[RM]: %@ image request context delivering %@ result.", v43, off_1E5846990[v21 - 1] message];
            }
            (*((void (**)(void))self->super._resultHandler + 2))();
            self->_int64_t lock_highestResultPhaseDelivered = v21;
          }
          if (v48 && self->_delayedFinalInvalidDataResult)
          {
            v28 = PLImageManagerGetLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              v29 = [v16 identifierString];
              *(_DWORD *)buf = 138412290;
              v54 = v29;
              _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request context delivering delayed final result.", buf, 0xCu);
            }
            if (PHImageManagerRecordEnabled())
            {
              uint64_t v44 = [v16 requestID];
              v45 = [v16 identifierString];
              +[PHImageManagerRequestTracer traceMessageForRequestID:v44, @"[RM]: %@ image request context delivering delayed final result.", v45 message];
            }
            (*((void (**)(void))self->super._resultHandler + 2))();
            self->_int64_t lock_highestResultPhaseDelivered = 3;
          }
        }
        else
        {
          v38 = PLImageManagerGetLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v39 = [v16 identifierString];
            *(_DWORD *)buf = 138412290;
            v54 = v39;
            _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_DEBUG, "[RM]: %@ image request delaying empty final result while waiting on secondary intermeidate...", buf, 0xCu);
          }
          if (PHImageManagerRecordEnabled())
          {
            uint64_t v46 = [v16 requestID];
            v47 = [v16 identifierString];
            +[PHImageManagerRequestTracer traceMessageForRequestID:v46, @"[RM]: %@ image request delaying empty final result while waiting on secondary intermeidate...", v47 message];
          }
          (*((void (**)(void))self->super._resultHandler + 2))();
          objc_storeStrong((id *)&self->_delayedFinalInvalidDataResult, a3);
        }
      }
      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ([(PHImageRequestContext *)self _isVideoFrameRequest])
  {
    id v10 = 0;
    goto LABEL_20;
  }
  v11 = (PHImageRequest *)v9;
  if (v7 && !v6) {
    goto LABEL_18;
  }
  if ([(PHImageRequestOptions *)self->_imageOptions deliveryMode]) {
    goto LABEL_18;
  }
  v12 = [(PHImageRequest *)v11 behaviorSpec];
  uint64_t v13 = [v12 choosingPolicy];

  if (v13 == 3) {
    goto LABEL_18;
  }
  if (self->_initialRequest == v11)
  {
    v22 = [(PHImageRequest *)v11 behaviorSpec];
    [v22 setChoosingPolicy:1];

    if (([(PHImageRequestOptions *)self->_imageOptions opportunisticDegradedImagesToReturn] & 2) != 0)
    {
      p_intermediateRequest = (id *)&self->_intermediateRequest;
      if (self->_intermediateRequest) {
        goto LABEL_18;
      }
      uint64_t v23 = [(PHImageRequestContext *)self _produceIntermediateImageRequestForRequest:v11];
    }
    else
    {
      p_intermediateRequest = (id *)&self->_finalRequest;
      if (self->_finalRequest) {
        goto LABEL_18;
      }
      uint64_t v23 = [(PHImageRequestContext *)self _produceFinalImageRequestForRequest:v11];
    }
    id v27 = *p_intermediateRequest;
    id *p_intermediateRequest = (id)v23;

LABEL_25:
    id v25 = *p_intermediateRequest;
    char v24 = v25;
    if (v25)
    {
      id v28 = v25;
      id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    }
    goto LABEL_19;
  }
  if (self->_intermediateRequest == v11)
  {
    p_intermediateRequest = (id *)&self->_finalRequest;
    if (!self->_finalRequest)
    {
      uint64_t v15 = [(PHImageRequestContext *)self _produceFinalImageRequestForRequest:v11];
      id v16 = *p_intermediateRequest;
      id *p_intermediateRequest = (id)v15;

      v17 = PLImageManagerGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v18 = [*p_intermediateRequest identifierString];
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "[RM]: %@ starting final image request", buf, 0xCu);
      }
      if (PHImageManagerRecordEnabled())
      {
        uint64_t v19 = [(PHMediaRequest *)v11 requestID];
        [*p_intermediateRequest identifierString];
        v21 = char v20 = p_intermediateRequest;
        +[PHImageManagerRequestTracer traceMessageForRequestID:v19, @"[RM]: %@ starting final image request", v21 message];

        p_intermediateRequest = v20;
      }
      goto LABEL_25;
    }
  }
LABEL_18:
  char v24 = 0;
  id v25 = 0;
LABEL_19:
  id v10 = v25;

LABEL_20:

  return v10;
}

- (BOOL)shouldReportProgress
{
  v5.receiver = self;
  v5.super_class = (Class)PHImageRequestContext;
  BOOL v3 = [(PHMediaRequestContext *)&v5 shouldReportProgress];
  if (v3) {
    LOBYTE(v3) = [(PHImageRequestOptions *)self->_imageOptions isNetworkAccessAllowed];
  }
  return v3;
}

- (id)progressHandler
{
  return [(PHImageRequestOptions *)self->_imageOptions progressHandler];
}

- (PHImageRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 options:(id)a7 resultHandler:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)PHImageRequestContext;
  id v16 = [(PHMediaRequestContext *)&v24 initWithRequestID:v12 managerID:a4 asset:a5 displaySpec:v14 resultHandler:a8];
  v17 = v16;
  if (v16)
  {
    p_imageOptions = (id *)&v16->_imageOptions;
    objc_storeStrong((id *)&v16->_imageOptions, a7);
    v17->_int64_t lock_highestResultPhaseDelivered = 0;
    v17->_lock._os_unfair_lock_opaque = 0;
    if ([*p_imageOptions isSynchronous])
    {
      if (initWithRequestID_managerID_asset_displaySpec_options_resultHandler__onceToken != -1) {
        dispatch_once(&initWithRequestID_managerID_asset_displaySpec_options_resultHandler__onceToken, &__block_literal_global_32252);
      }
      if (!initWithRequestID_managerID_asset_displaySpec_options_resultHandler__allowFastSync
        && [*p_imageOptions deliveryMode] == 2)
      {
        uint64_t v19 = PLImageManagerGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Synchronous image requests are incompatible with fast delivery mode, changing delivery mode to high", v23, 2u);
        }

        [*p_imageOptions setDeliveryMode:1];
      }
      if (![*p_imageOptions deliveryMode])
      {
        char v20 = PLImageManagerGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEBUG, "Synchronous image requests in opportunistic delivery mode will only deliver 1 image", v23, 2u);
        }

        [*p_imageOptions setDeliveryMode:1];
      }
    }
    if ([v14 hasExplicitCrop] && objc_msgSend(v15, "resizeMode") != 2)
    {
      int64_t v21 = PLImageManagerGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Image request with normalized crop rect must use resize mode exact", v23, 2u);
      }
    }
  }

  return v17;
}

- (id)_produceIntermediateImageRequestForRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  v4 = [v24 behaviorSpec];
  objc_super v5 = [(PHImageRequestContext *)self imageOptions];
  BOOL v6 = [(PHMediaRequestContext *)self asset];
  BOOL v7 = +[PHImageRequestBehaviorSpec imageRequestIntermediateBehaviorSpecWithPreviousBehaviorSpec:v4 options:v5 asset:v6];

  id v8 = [PHImageRequest alloc];
  uint64_t v9 = [(PHMediaRequestContext *)self requestID];
  unint64_t v10 = [(PHMediaRequestContext *)self nextRequestIndex];
  int64_t v11 = [(PHImageRequestContext *)self type];
  unint64_t v12 = [(PHMediaRequestContext *)self managerID];
  uint64_t v13 = [(PHMediaRequestContext *)self asset];
  id v14 = [(PHMediaRequestContext *)self displaySpec];
  id v15 = [(PHMediaRequestContext *)self imageResourceChooser];
  id v16 = [(PHImageRequest *)v8 initWithRequestID:v9 requestIndex:v10 contextType:v11 managerID:v12 asset:v13 displaySpec:v14 behaviorSpec:v7 chooser:v15 delegate:self];

  v17 = PLImageManagerGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = [v24 identifierString];
    uint64_t v19 = [(PHMediaRequest *)v16 identifierString];
    *(_DWORD *)buf = 138412546;
    v26 = v18;
    __int16 v27 = 2112;
    id v28 = v19;
    _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "[RM]: %@ Spawned intermediate (SPI) child request: %@", buf, 0x16u);
  }
  if (PHImageManagerRecordEnabled())
  {
    uint64_t v21 = [v24 requestID];
    v22 = [v24 identifierString];
    uint64_t v23 = [(PHMediaRequest *)v16 identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v21, @"[RM]: %@ Spawned intermediate (SPI) child request: %@", v22, v23 message];
  }

  return v16;
}

- (id)_produceFinalImageRequestForRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  v4 = [v26 behaviorSpec];
  objc_super v5 = [(PHImageRequestContext *)self imageOptions];
  BOOL v6 = [(PHMediaRequestContext *)self asset];
  BOOL v7 = +[PHImageRequestBehaviorSpec imageRequestBestBehaviorSpecWithPreviousBehaviorSpec:v4 options:v5 asset:v6];

  id v8 = [PHImageRequest alloc];
  uint64_t v9 = [(PHMediaRequestContext *)self requestID];
  unint64_t v10 = [(PHMediaRequestContext *)self nextRequestIndex];
  int64_t v11 = [(PHImageRequestContext *)self type];
  unint64_t v12 = [(PHMediaRequestContext *)self managerID];
  uint64_t v13 = [(PHMediaRequestContext *)self asset];
  id v14 = [(PHMediaRequestContext *)self displaySpec];
  id v15 = [(PHMediaRequestContext *)self imageResourceChooser];
  id v16 = [(PHImageRequest *)v8 initWithRequestID:v9 requestIndex:v10 contextType:v11 managerID:v12 asset:v13 displaySpec:v14 behaviorSpec:v7 chooser:v15 delegate:self];

  v17 = [(PHImageRequestContext *)self _lazyProgress];
  uint64_t v18 = [(PHMediaRequest *)v16 identifierString];
  [(PHMediaRequestContext *)self setProgress:v17 forRequestIdentifier:v18];

  uint64_t v19 = PLImageManagerGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    char v20 = [v26 identifierString];
    uint64_t v21 = [(PHMediaRequest *)v16 identifierString];
    *(_DWORD *)buf = 138412546;
    id v28 = v20;
    __int16 v29 = 2112;
    v30 = v21;
    _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEBUG, "[RM]: %@ Spawned final (best) child request: %@", buf, 0x16u);
  }
  if (PHImageManagerRecordEnabled())
  {
    uint64_t v23 = [v26 requestID];
    id v24 = [v26 identifierString];
    id v25 = [(PHMediaRequest *)v16 identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v23, @"[RM]: %@ Spawned final (best) child request: %@", v24, v25 message];
  }

  return v16;
}

- (id)initialRequests
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ([(PHImageRequestContext *)self _isVideoFrameRequest])
  {
    BOOL v3 = [PHVideoRequest alloc];
    uint64_t v4 = [(PHMediaRequestContext *)self requestID];
    unint64_t v5 = [(PHMediaRequestContext *)self nextRequestIndex];
    int64_t v6 = [(PHImageRequestContext *)self type];
    unint64_t v7 = [(PHMediaRequestContext *)self managerID];
    id v8 = [(PHMediaRequestContext *)self asset];
    uint64_t v9 = [(PHMediaRequestContext *)self displaySpec];
    unint64_t v10 = [(PHImageRequestContext *)self _videoBehavior];
    int64_t v11 = [(PHVideoRequest *)v3 initWithRequestID:v4 requestIndex:v5 contextType:v6 managerID:v7 asset:v8 displaySpec:v9 behaviorSpec:v10 delegate:self];

    unint64_t v12 = PLImageManagerGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v11 identifierString];
      imageOptions = self->_imageOptions;
      if (imageOptions) {
        [(PHImageRequestOptions *)imageOptions videoFrameTime];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      id v16 = (__CFString *)CMTimeCopyDescription(0, &time);
      *(_DWORD *)buf = 138543618;
      unint64_t v51 = (unint64_t)v13;
      __int16 v52 = 2114;
      v53 = v16;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ starting video request to load video frame at time: %{public}@", buf, 0x16u);
    }
    v49 = v11;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  }
  else if ((+[PHImageRequestBehaviorSpec loadingOptionsFromLoadingMode:[(PHImageRequestOptions *)self->_imageOptions loadingMode]] & 7) != 0)
  {
    BOOL v46 = [(PHImageRequestOptions *)self->_imageOptions deliveryMode] == PHImageRequestOptionsDeliveryModeFastFormat
       || [(PHImageRequestOptions *)self->_imageOptions deliveryMode] == PHImageRequestOptionsDeliveryModeHighQualityFormat;
    v17 = [(PHImageRequestContext *)self imageOptions];
    uint64_t v18 = [(PHMediaRequestContext *)self asset];
    int64_t v11 = +[PHImageRequestBehaviorSpec imageRequestInitialBehaviorSpecWithImageRequestOptions:v17 asset:v18];

    uint64_t v19 = [PHImageRequest alloc];
    uint64_t v20 = [(PHMediaRequestContext *)self requestID];
    unint64_t v21 = [(PHMediaRequestContext *)self nextRequestIndex];
    int64_t v22 = [(PHImageRequestContext *)self type];
    unint64_t v23 = [(PHMediaRequestContext *)self managerID];
    id v24 = [(PHMediaRequestContext *)self asset];
    id v25 = [(PHMediaRequestContext *)self displaySpec];
    id v26 = [(PHMediaRequestContext *)self imageResourceChooser];
    __int16 v27 = [(PHImageRequest *)v19 initWithRequestID:v20 requestIndex:v21 contextType:v22 managerID:v23 asset:v24 displaySpec:v25 behaviorSpec:v11 chooser:v26 delegate:self];

    id v28 = [(PHImageRequestContext *)self _lazyProgress];
    __int16 v29 = [(PHMediaRequest *)v27 identifierString];
    [(PHMediaRequestContext *)self setProgress:v28 forRequestIdentifier:v29];

    if ([(PHImageRequestOptions *)self->_imageOptions chooseAlchemist])
    {
      v41 = (void *)MEMORY[0x1E4F8A950];
      v45 = [(PHMediaRequestContext *)self asset];
      v30 = [v45 uuid];
      uint64_t v44 = [(PHMediaRequestContext *)self asset];
      unsigned int v40 = [v44 bundleScope];
      v43 = [(PHMediaRequestContext *)self asset];
      uint64_t v31 = [v43 directory];
      v32 = [(PHMediaRequestContext *)self asset];
      v33 = [v32 filename];
      v34 = [(PHMediaRequestContext *)self asset];
      v35 = [v34 photoLibrary];
      v36 = [v35 pathManager];
      uint64_t v42 = [v41 pathForAlchemistImageWithUUID:v30 bundleScope:v40 directory:v31 filename:v33 pathManager:v36];

      v37 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v42 isDirectory:0];
      v38 = [(id)*MEMORY[0x1E4F443E0] identifier];
      [(PHImageRequest *)v27 configureWithURL:v37 uniformTypeIdentifier:v38 exifOrientation:1];
    }
    objc_storeStrong((id *)&self->_initialRequest, v27);
    if (v46) {
      objc_storeStrong((id *)&self->_finalRequest, v27);
    }
    BOOL v48 = v27;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  }
  else
  {
    int64_t v11 = PLImageManagerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v51 = [(PHMediaRequestContext *)self managerID];
      __int16 v52 = 2048;
      v53 = (__CFString *)[(PHMediaRequestContext *)self requestID];
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "Loading options don't specify any result, request %ld-%ld will be a no-op", buf, 0x16u);
    }
    id v15 = 0;
  }

  return v15;
}

- (BOOL)_isVideoFrameRequest
{
  BOOL v3 = [(PHMediaRequestContext *)self asset];
  if ([v3 isVideo])
  {
    imageOptions = self->_imageOptions;
    if (imageOptions)
    {
      [(PHImageRequestOptions *)imageOptions videoFrameTime];
      BOOL v5 = v7 & 1;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)type
{
  return 0;
}

- (PHImageRequestOptions)imageOptions
{
  return self->_imageOptions;
}

- (id)progresses
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(PHImageRequestContext *)self shouldReportProgress])
  {
    BOOL v3 = [(PHImageRequestContext *)self _lazyProgress];
    v6[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_lazyProgress
{
  if (!self->_progress && [(PHImageRequestContext *)self shouldReportProgress])
  {
    BOOL v3 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    progress = self->_progress;
    self->_progress = v3;
  }
  BOOL v5 = self->_progress;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageOptions, 0);
  objc_storeStrong((id *)&self->_delayedFinalInvalidDataResult, 0);
  objc_storeStrong((id *)&self->_finalRequest, 0);
  objc_storeStrong((id *)&self->_intermediateRequest, 0);
  objc_storeStrong((id *)&self->_initialRequest, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

void __55__PHImageRequestContext_processMediaResult_forRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int64_t v6 = -[PHCompositeMediaResult initWithRequestID:]([PHImageResult alloc], "initWithRequestID:", [*(id *)(a1 + 32) requestID]);
  [(PHImageResult *)v6 setImageRef:a2];
  [(PHCompositeMediaResult *)v6 setError:v5];

  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
}

- (BOOL)shouldLimitRepairRequestsPerProcess
{
  return ![(PHImageRequestOptions *)self->_imageOptions ignoreProcessWideRepairLimits];
}

- (BOOL)representsShareableHighQualityResource
{
  int64_t v6 = [(PHMediaRequestContext *)self asset];
  uint64_t v7 = [v6 playbackStyle];
  if (v7 == 1)
  {
    int v8 = 0;
    int v9 = 0;
  }
  else
  {
    v2 = [(PHMediaRequestContext *)self asset];
    if ([v2 playbackStyle] == 3)
    {
      int v8 = 0;
      int v9 = 0;
    }
    else
    {
      BOOL v3 = [(PHMediaRequestContext *)self asset];
      if ([v3 playbackStyle] == 2)
      {
        int v9 = 0;
        int v8 = 1;
      }
      else
      {
        id v15 = [(PHMediaRequestContext *)self asset];
        if ([v15 playbackStyle] != 5)
        {

          BOOL v13 = 0;
          goto LABEL_21;
        }
        id v16 = v15;
        int v8 = 1;
        int v9 = 1;
      }
    }
  }
  unint64_t v10 = [(PHMediaRequestContext *)self displaySpec];
  if (v10)
  {
    uint64_t v4 = [(PHMediaRequestContext *)self displaySpec];
    [v4 targetSize];
    if (v12 == -1.0 && v11 == -1.0)
    {
      BOOL v13 = 1;
      goto LABEL_13;
    }
  }
  if (([(PHImageRequestOptions *)self->_imageOptions loadingMode] & 2) != 0)
  {
    BOOL v13 = [(PHImageRequestOptions *)self->_imageOptions deliveryMode] == PHImageRequestOptionsDeliveryModeHighQualityFormat;
    if (v10)
    {
LABEL_13:

      if (v9) {
        goto LABEL_14;
      }
LABEL_18:
      if (!v8) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else
  {
    BOOL v13 = 0;
    if (v10) {
      goto LABEL_13;
    }
  }
  if (!v9) {
    goto LABEL_18;
  }
LABEL_14:

  if (v8) {
LABEL_19:
  }

LABEL_20:
  if (v7 != 1) {
LABEL_21:
  }

  return v13;
}

- (BOOL)isSynchronous
{
  return [(PHImageRequestOptions *)self->_imageOptions isSynchronous];
}

- (BOOL)isNetworkAccessAllowed
{
  return [(PHImageRequestOptions *)self->_imageOptions isNetworkAccessAllowed];
}

- (id)_videoBehavior
{
  BOOL v3 = objc_alloc_init(PHVideoRequestBehaviorSpec);
  if ([(PHImageRequestOptions *)self->_imageOptions deliveryMode] == PHImageRequestOptionsDeliveryModeFastFormat)
  {
    uint64_t v4 = 3;
  }
  else
  {
    id v5 = [(PHMediaRequestContext *)self displaySpec];
    int64_t v6 = [(PHMediaRequestContext *)self asset];
    uint64_t v7 = [v6 pixelWidth];
    int v8 = [(PHMediaRequestContext *)self asset];
    objc_msgSend(v5, "requestSizeFromFullSizedWidth:height:", v7, objc_msgSend(v8, "pixelHeight"));
    double v10 = v9;
    double v12 = v11;

    if (v12 <= 720.0 && v10 <= 720.0) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  [(PHVideoRequestBehaviorSpec *)v3 setDeliveryMode:v4];
  [(PHVideoRequestBehaviorSpec *)v3 setNetworkAccessAllowed:[(PHImageRequestOptions *)self->_imageOptions isNetworkAccessAllowed]];
  [(PHVideoRequestBehaviorSpec *)v3 setStreamingAllowed:[(PHImageRequestOptions *)self->_imageOptions isNetworkAccessAllowed]];
  [(PHVideoRequestBehaviorSpec *)v3 setDownloadIntent:[(PHImageRequestOptions *)self->_imageOptions downloadIntent]];
  [(PHVideoRequestBehaviorSpec *)v3 setDownloadPriority:[(PHImageRequestOptions *)self->_imageOptions downloadPriority]];
  PHImageRequestOptionsVersion v14 = [(PHImageRequestOptions *)self->_imageOptions version];
  uint64_t v15 = 8;
  if (v14 != 8) {
    uint64_t v15 = 0;
  }
  if ((unint64_t)(v14 - 1) >= 2) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 1;
  }
  [(PHVideoRequestBehaviorSpec *)v3 setVersion:v16];

  return v3;
}

uint64_t __93__PHImageRequestContext_initWithRequestID_managerID_asset_displaySpec_options_resultHandler___block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  initWithRequestID_managerID_asset_displaySpec_options_resultHandler__allowFastSync = result;
  return result;
}

@end