@interface PHLivePhotoRequestContext
- (BOOL)_shouldRequestVideo;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)representsShareableHighQualityResource;
- (BOOL)shouldReportProgress;
- (PHLivePhotoRequestContext)init;
- (PHLivePhotoRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 options:(id)a7 resultHandler:(id)a8;
- (PHLivePhotoRequestOptions)livePhotoOptions;
- (id)_lazyImageProgress;
- (id)_lazyVideoProgress;
- (id)initialRequests;
- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6;
- (id)progressHandler;
- (id)progresses;
- (int64_t)type;
- (void)processMediaResult:(id)a3 forRequest:(id)a4;
@end

@implementation PHLivePhotoRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhotoOptions, 0);
  objc_storeStrong((id *)&self->_videoRequest, 0);
  objc_storeStrong((id *)&self->_highQualityImageRequest, 0);
  objc_storeStrong((id *)&self->_fastImageRequest, 0);
  objc_storeStrong((id *)&self->_livePhotoResult, 0);
  objc_storeStrong((id *)&self->_videoProgress, 0);

  objc_storeStrong((id *)&self->_imageProgress, 0);
}

- (PHLivePhotoRequestOptions)livePhotoOptions
{
  return self->_livePhotoOptions;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (PHVideoRequest *)a4;
  v8 = v7;
  if (!self->super._resultHandler) {
    goto LABEL_20;
  }
  if (self->_videoRequest == v7)
  {
    [(PHLivePhotoResult *)self->_livePhotoResult addVideoResult:v6];
    os_unfair_lock_lock(&self->_lock);
    self->_BOOL videoPartCompleted = 1;
    if (self->_imagePartCompleted)
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      BOOL includeImage = self->_includeImage;
      os_unfair_lock_unlock(&self->_lock);
      if (includeImage) {
        goto LABEL_20;
      }
    }
LABEL_19:
    (*((void (**)(void))self->super._resultHandler + 2))();
    goto LABEL_20;
  }
  if ((PHVideoRequest *)self->_highQualityImageRequest == v7)
  {
    [(PHLivePhotoResult *)self->_livePhotoResult addImageResult:v6];
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    self->_imagePartCompleted = 1;
    goto LABEL_18;
  }
  PHImageRequestOptionsDeliveryMode v9 = [(PHLivePhotoRequestOptions *)self->_livePhotoOptions deliveryMode];
  if (v9 == PHImageRequestOptionsDeliveryModeFastFormat)
  {
    [(PHLivePhotoResult *)self->_livePhotoResult addImageResult:v6];
    [(PHLivePhotoResult *)self->_livePhotoResult setDegraded:1];
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    self->_imagePartCompleted = 1;
LABEL_18:
    BOOL videoPartCompleted = self->_videoPartCompleted;
    os_unfair_lock_unlock(p_lock);
    if (!videoPartCompleted) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v9 == PHImageRequestOptionsDeliveryModeOpportunistic && !self->_imagePartCompleted)
  {
    if (v6 && [v6 imageRef])
    {
      os_unfair_lock_lock(&self->_lock);
      if (!self->_imagePartCompleted)
      {
        os_unfair_lock_unlock(&self->_lock);
LABEL_26:
        v18 = [(PHCompositeMediaResult *)[PHLivePhotoResult alloc] initWithRequestID:[(PHMediaRequest *)v8 requestID]];
        [(PHLivePhotoResult *)v18 addImageResult:v6];
        [(PHLivePhotoResult *)v18 setDegraded:1];
        (*((void (**)(void))self->super._resultHandler + 2))();

        goto LABEL_20;
      }
      BOOL v10 = self->_videoPartCompleted;
      os_unfair_lock_unlock(&self->_lock);
      if (!v10) {
        goto LABEL_26;
      }
    }
    else
    {
      v14 = PLImageManagerGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = [(PHMediaRequest *)v8 identifierString];
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %@ opportunistic early-stage request returned no image", buf, 0xCu);
      }
      if (PHImageManagerRecordEnabled())
      {
        uint64_t v16 = [(PHMediaRequest *)v8 requestID];
        v17 = [(PHMediaRequest *)v8 identifierString];
        +[PHImageManagerRequestTracer traceMessageForRequestID:v16, @"[RM]: %@ opportunistic early-stage request returned no image", v17 message];
      }
    }
  }
LABEL_20:
}

- (id)progresses
{
  v10[2] = *MEMORY[0x1E4F143B8];
  if ([(PHLivePhotoRequestContext *)self shouldReportProgress])
  {
    PHImageRequestOptionsDeliveryMode v3 = [(PHLivePhotoRequestOptions *)self->_livePhotoOptions deliveryMode];
    uint64_t v4 = [(PHLivePhotoRequestContext *)self _lazyImageProgress];
    v5 = (void *)v4;
    if (v3 == PHImageRequestOptionsDeliveryModeFastFormat)
    {
      uint64_t v9 = v4;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
    }
    else
    {
      v10[0] = v4;
      v7 = [(PHLivePhotoRequestContext *)self _lazyVideoProgress];
      v10[1] = v7;
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)progressHandler
{
  return [(PHLivePhotoRequestOptions *)self->_livePhotoOptions progressHandler];
}

- (BOOL)shouldReportProgress
{
  v5.receiver = self;
  v5.super_class = (Class)PHLivePhotoRequestContext;
  BOOL v3 = [(PHMediaRequestContext *)&v5 shouldReportProgress];
  if (v3) {
    LOBYTE(v3) = [(PHLivePhotoRequestOptions *)self->_livePhotoOptions isNetworkAccessAllowed];
  }
  return v3;
}

- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  BOOL v10 = (PHImageRequest *)a3;
  if ([(PHLivePhotoRequestOptions *)self->_livePhotoOptions deliveryMode]) {
    goto LABEL_7;
  }
  if (self->_fastImageRequest != v10) {
    goto LABEL_7;
  }
  p_highQualityImageRequest = (id *)&self->_highQualityImageRequest;
  if (self->_highQualityImageRequest) {
    goto LABEL_7;
  }
  if (v7 && !v6)
  {
    objc_storeStrong((id *)&self->_highQualityImageRequest, a3);
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v14 = PLImageManagerGetLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v15)
    {
      uint64_t v16 = [(PHMediaRequest *)v10 identifierString];
      *(_DWORD *)buf = 138412290;
      v39 = v16;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %@ found degraded result for opp. request, kick off request for best image", buf, 0xCu);
    }
    if (!PHImageManagerRecordEnabled()) {
      goto LABEL_19;
    }
    uint64_t v17 = [(PHMediaRequest *)v10 requestID];
    v18 = [(PHMediaRequest *)v10 identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v17, @"[RM]: %@ found degraded result for opp. request, kick off request for best image", v18 message];
  }
  else
  {
    if (v15)
    {
      v19 = [(PHMediaRequest *)v10 identifierString];
      *(_DWORD *)buf = 138412290;
      v39 = v19;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %@ no local image for opp. request, kick off request for best image", buf, 0xCu);
    }
    if (!PHImageManagerRecordEnabled()) {
      goto LABEL_19;
    }
    uint64_t v34 = [(PHMediaRequest *)v10 requestID];
    v18 = [(PHMediaRequest *)v10 identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v34, @"[RM]: %@ no local image for opp. request, kick off request for best image", v18 message];
  }

LABEL_19:
  v20 = [(PHImageRequest *)self->_fastImageRequest behaviorSpec];
  livePhotoOptions = self->_livePhotoOptions;
  v22 = [(PHMediaRequestContext *)self asset];
  v23 = +[PHImageRequestBehaviorSpec livePhotoRequestBestBehaviorSpecWithPreviousBehaviorSpec:v20 options:livePhotoOptions asset:v22];

  v36 = [PHImageRequest alloc];
  unsigned int v35 = [(PHMediaRequestContext *)self requestID];
  unint64_t v24 = [(PHMediaRequestContext *)self nextRequestIndex];
  int64_t v25 = [(PHLivePhotoRequestContext *)self type];
  unint64_t v26 = [(PHMediaRequestContext *)self managerID];
  v27 = [(PHMediaRequestContext *)self asset];
  v28 = [(PHMediaRequestContext *)self displaySpec];
  v29 = [(PHMediaRequestContext *)self imageResourceChooser];
  uint64_t v30 = [(PHImageRequest *)v36 initWithRequestID:v35 requestIndex:v24 contextType:v25 managerID:v26 asset:v27 displaySpec:v28 behaviorSpec:v23 chooser:v29 delegate:self];
  id v31 = *p_highQualityImageRequest;
  id *p_highQualityImageRequest = (id)v30;

  v32 = [(PHLivePhotoRequestContext *)self _lazyImageProgress];
  v33 = [*p_highQualityImageRequest identifierString];
  [(PHMediaRequestContext *)self setProgress:v32 forRequestIdentifier:v33];

  id v37 = *p_highQualityImageRequest;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];

LABEL_8:

  return v12;
}

- (id)initialRequests
{
  PHImageRequestOptionsDeliveryMode v3 = [(PHLivePhotoRequestOptions *)self->_livePhotoOptions deliveryMode];
  uint64_t v4 = [(PHLivePhotoRequestContext *)self livePhotoOptions];
  objc_super v5 = [(PHMediaRequestContext *)self asset];
  uint64_t v6 = +[PHImageRequestBehaviorSpec livePhotoRequestInitialBehaviorSpecWithLivePhotoRequestOptions:v4 asset:v5];

  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  PHImageRequestOptionsDeliveryMode v41 = v3;
  if (self->_includeImage)
  {
    v39 = [PHImageRequest alloc];
    unsigned int v37 = [(PHMediaRequestContext *)self requestID];
    v8 = v7;
    unint64_t v9 = [(PHMediaRequestContext *)self nextRequestIndex];
    int64_t v10 = [(PHLivePhotoRequestContext *)self type];
    unint64_t v11 = [(PHMediaRequestContext *)self managerID];
    v12 = [(PHMediaRequestContext *)self asset];
    [(PHMediaRequestContext *)self displaySpec];
    v14 = v13 = (void *)v6;
    BOOL v15 = [(PHMediaRequestContext *)self imageResourceChooser];
    unint64_t v16 = v9;
    BOOL v7 = v8;
    uint64_t v17 = [(PHImageRequest *)v39 initWithRequestID:v37 requestIndex:v16 contextType:v10 managerID:v11 asset:v12 displaySpec:v14 behaviorSpec:v13 chooser:v15 delegate:self];

    [v8 addObject:v17];
  }
  else
  {
    uint64_t v17 = 0;
    v13 = (void *)v6;
  }
  if ([(PHLivePhotoRequestContext *)self _shouldRequestVideo])
  {
    v18 = objc_alloc_init(PHVideoRequestBehaviorSpec);
    [(PHVideoRequestBehaviorSpec *)v18 setNetworkAccessAllowed:[(PHLivePhotoRequestOptions *)self->_livePhotoOptions isNetworkAccessAllowed]];
    [(PHVideoRequestBehaviorSpec *)v18 setDeliveryMode:0];
    [(PHVideoRequestBehaviorSpec *)v18 setDownloadIntent:[(PHLivePhotoRequestOptions *)self->_livePhotoOptions downloadIntent]];
    [(PHVideoRequestBehaviorSpec *)v18 setDownloadPriority:[(PHLivePhotoRequestOptions *)self->_livePhotoOptions downloadPriority]];
    v38 = [PHVideoRequest alloc];
    uint64_t v19 = [(PHMediaRequestContext *)self requestID];
    v20 = v17;
    uint64_t v21 = v7;
    unint64_t v22 = [(PHMediaRequestContext *)self nextRequestIndex];
    int64_t v23 = [(PHLivePhotoRequestContext *)self type];
    unint64_t v24 = [(PHMediaRequestContext *)self managerID];
    int64_t v25 = [(PHMediaRequestContext *)self asset];
    [(PHMediaRequestContext *)self displaySpec];
    unint64_t v26 = v40 = v13;
    unint64_t v27 = v22;
    BOOL v7 = v21;
    uint64_t v17 = v20;
    v28 = [(PHVideoRequest *)v38 initWithRequestID:v19 requestIndex:v27 contextType:v23 managerID:v24 asset:v25 displaySpec:v26 behaviorSpec:v18 delegate:self];
    videoRequest = self->_videoRequest;
    self->_videoRequest = v28;

    [v7 addObject:self->_videoRequest];
    uint64_t v30 = [(PHLivePhotoRequestContext *)self _lazyVideoProgress];
    id v31 = [(PHMediaRequest *)self->_videoRequest identifierString];
    [(PHMediaRequestContext *)self setProgress:v30 forRequestIdentifier:v31];

    v13 = v40;
  }
  else
  {
    self->_BOOL videoPartCompleted = 1;
  }
  if (v17)
  {
    if (v41 != PHImageRequestOptionsDeliveryModeFastFormat)
    {
      if (v41 == PHImageRequestOptionsDeliveryModeHighQualityFormat)
      {
        objc_storeStrong((id *)&self->_highQualityImageRequest, v17);
        fastImageRequest = [(PHLivePhotoRequestContext *)self _lazyImageProgress];
        uint64_t v34 = [(PHMediaRequest *)v17 identifierString];
        [(PHMediaRequestContext *)self setProgress:fastImageRequest forRequestIdentifier:v34];

        goto LABEL_13;
      }
      if (v41) {
        goto LABEL_14;
      }
    }
    v32 = v17;
    fastImageRequest = self->_fastImageRequest;
    self->_fastImageRequest = v32;
LABEL_13:
  }
LABEL_14:
  unsigned int v35 = (void *)[v7 copy];

  return v35;
}

- (BOOL)representsShareableHighQualityResource
{
  return 1;
}

- (BOOL)isNetworkAccessAllowed
{
  return [(PHLivePhotoRequestOptions *)self->_livePhotoOptions isNetworkAccessAllowed];
}

- (int64_t)type
{
  return 2;
}

- (id)_lazyVideoProgress
{
  if (!self->_videoProgress && [(PHLivePhotoRequestContext *)self shouldReportProgress])
  {
    PHImageRequestOptionsDeliveryMode v3 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:150];
    videoProgress = self->_videoProgress;
    self->_videoProgress = v3;
  }
  objc_super v5 = self->_videoProgress;

  return v5;
}

- (id)_lazyImageProgress
{
  if (!self->_imageProgress && [(PHLivePhotoRequestContext *)self shouldReportProgress])
  {
    PHImageRequestOptionsDeliveryMode v3 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    imageProgress = self->_imageProgress;
    self->_imageProgress = v3;
  }
  objc_super v5 = self->_imageProgress;

  return v5;
}

- (BOOL)_shouldRequestVideo
{
  return [(PHLivePhotoRequestOptions *)self->_livePhotoOptions deliveryMode] != PHImageRequestOptionsDeliveryModeFastFormat;
}

- (PHLivePhotoRequestContext)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PHLivePhotoRequestContext.m" lineNumber:51 description:@"Unavailable initializer"];

  return 0;
}

- (PHLivePhotoRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 options:(id)a7 resultHandler:(id)a8
{
  uint64_t v13 = *(void *)&a3;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PHLivePhotoRequestContext;
  unint64_t v16 = [(PHMediaRequestContext *)&v22 initWithRequestID:v13 managerID:a4 asset:a5 displaySpec:a6 resultHandler:a8];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_livePhotoOptions, a7);
    v18 = [(PHCompositeMediaResult *)[PHLivePhotoResult alloc] initWithRequestID:v13];
    livePhotoResult = v17->_livePhotoResult;
    v17->_livePhotoResult = v18;

    if (v15) {
      char v20 = [v15 includeImage];
    }
    else {
      char v20 = 1;
    }
    v17->_BOOL includeImage = v20;
    -[PHLivePhotoResult setRequiresImageResult:](v17->_livePhotoResult, "setRequiresImageResult:");
    v17->_lock._os_unfair_lock_opaque = 0;
  }

  return v17;
}

@end