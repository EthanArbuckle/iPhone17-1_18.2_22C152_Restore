@interface PHLiveRenderEditingInputRequestContext
+ (id)videoLiveRenderContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 targetSize:(CGSize)a7 contentMode:(int64_t)a8 renderedVideoHandler:(id)a9;
+ (id)videoLiveRenderContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 targetSize:(CGSize)a7 renderedVideoHandler:(id)a8;
- (PHLiveRenderEditingInputRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 useRAWAsUnadjustedBase:(BOOL)a7 resultHandler:(id)a8;
- (id)initialRequests;
- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6;
- (id)progressHandler;
- (id)progresses;
- (void)_handleRenderVideoFinishedWithRequest:(id)a3 avAsset:(id)a4 videoComposition:(id)a5 audioMix:(id)a6 error:(id)a7 mutableInfo:(id)a8;
- (void)cancel;
- (void)processAndReturnResultsWithRequest:(id)a3;
- (void)processMediaResult:(id)a3 forRequest:(id)a4;
@end

@implementation PHLiveRenderEditingInputRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onDemandRenderProgress, 0);
  objc_storeStrong((id *)&self->_onDemandRenderRequest, 0);
  objc_storeStrong((id *)&self->_liveRenderOptions, 0);
  objc_storeStrong(&self->_renderedVideoHandler, 0);

  objc_storeStrong((id *)&self->_renderer, 0);
}

- (void)processAndReturnResultsWithRequest:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PHLiveRenderEditingInputRequestContext;
  [(PHContentEditingInputRequestContext *)&v45 processAndReturnResultsWithRequest:v4];
  v5 = [(PHCompositeMediaResult *)self->super._contentEditingInputResult info];
  v6 = (void *)[v5 mutableCopy];

  v7 = [v6 objectForKeyedSubscript:@"PHContentEditingInputCancelledKey"];
  [v6 setObject:v7 forKeyedSubscript:@"PHImageCancelledKey"];

  v8 = [v6 objectForKeyedSubscript:@"PHContentEditingInputResultIsInCloudKey"];
  [v6 setObject:v8 forKeyedSubscript:@"PHImageResultIsInCloudKey"];

  v9 = [v6 objectForKeyedSubscript:@"PHContentEditingInputErrorKey"];
  [v6 setObject:v9 forKeyedSubscript:@"PHImageErrorKey"];

  [v6 setObject:0 forKeyedSubscript:@"PHContentEditingInputCancelledKey"];
  [v6 setObject:0 forKeyedSubscript:@"PHContentEditingInputResultIsInCloudKey"];
  [v6 setObject:0 forKeyedSubscript:@"PHContentEditingInputErrorKey"];
  if (-[PHMediaRequestLiveRenderingOptions liveRenderAndOnDemandRenderVideoConcurrently](self->_liveRenderOptions, "liveRenderAndOnDemandRenderVideoConcurrently"))[v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHImageResultIsDegradedKey"]; {
  if ([(PHMediaRequestContext *)self isCancelled]
  }
    || ![(PHContentEditingInputResult *)self->super._contentEditingInputResult containsValidData]
    || ([(PHContentEditingInputResult *)self->super._contentEditingInputResult videoURL],
        v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = v10 == 0,
        v10,
        v11))
  {
    BOOL v28 = [(PHMediaRequestContext *)self isCancelled];
    v29 = PLImageManagerGetLog();
    v30 = v29;
    if (v28)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v31 = [v4 identifierString];
        *(_DWORD *)buf = 138412290;
        v47 = v31;
        _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_DEBUG, "%@ [LiveRender] - Request was cancelled, will not live render", buf, 0xCu);
      }
      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"PHImageCancelledKey"];
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v32 = [v4 identifierString];
        v33 = [v6 objectForKeyedSubscript:@"PHImageErrorKey"];
        *(_DWORD *)buf = 138412546;
        v47 = v32;
        __int16 v48 = 2112;
        uint64_t v49 = (uint64_t)v33;
        _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_ERROR, "%@ Video URL unavailable, will not live render, error: %@", buf, 0x16u);
      }
    }
    (*((void (**)(void))self->_renderedVideoHandler + 2))();
  }
  else
  {
    v40 = [(PHContentEditingInputResult *)self->super._contentEditingInputResult videoURL];
    v37 = [(PHContentEditingInputResult *)self->super._contentEditingInputResult overCaptureVideoURL];
    v38 = [(PHContentEditingInputResult *)self->super._contentEditingInputResult imageURL];
    v12 = [(PHContentEditingInputResult *)self->super._contentEditingInputResult adjustmentData];
    v39 = [v12 formatIdentifier];
    v13 = [v12 formatVersion];
    v14 = [v12 data];
    v15 = PLImageManagerGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = [v4 identifierString];
      *(_DWORD *)buf = 138412802;
      v47 = v16;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v40;
      __int16 v50 = 2112;
      v51 = v37;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "%@ [LiveRender] - preparing live renderer for video at URL: %@, overcapture URL: %@", buf, 0x20u);
    }
    v17 = PLImageManagerGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = [v4 identifierString];
      uint64_t v19 = [v14 length];
      *(_DWORD *)buf = 138413058;
      v47 = v18;
      __int16 v48 = 2048;
      uint64_t v49 = v19;
      __int16 v50 = 2112;
      v51 = v39;
      __int16 v52 = 2112;
      v53 = v13;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "%@ [LiveRender] - adj data length: %ld, format id: %@, version: %@", buf, 0x2Au);
    }
    os_unfair_lock_lock(&self->_renderLock);
    v20 = [MEMORY[0x1E4F8AA60] rendererForVideoURL:v40 livePhotoStillURL:v38 adjustmentData:v14 formatIdentifier:v39 formatVersion:v13];
    renderer = self->_renderer;
    self->_renderer = v20;

    os_unfair_lock_unlock(&self->_renderLock);
    if (self->_renderer)
    {
      objc_initWeak((id *)buf, self);
      [(PHMediaRequestContext *)self beginCustomAsyncWorkWithIdentifier:@"renderVideoWithTargetSize"];
      v22 = [(PHContentEditingInputRequestContext *)self options];
      [v22 targetSize];
      double v24 = v23;
      double v26 = v25;

      if (v24 == -1.0 && v26 == -1.0)
      {
        double v24 = *MEMORY[0x1E4F1DB30];
        double v26 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      v27 = self->_renderer;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __77__PHLiveRenderEditingInputRequestContext_processAndReturnResultsWithRequest___block_invoke;
      v41[3] = &unk_1E58470D8;
      objc_copyWeak(&v44, (id *)buf);
      id v42 = v4;
      id v43 = v6;
      [(PLPhotoEditRenderer *)v27 renderVideoWithTargetSize:@"PHLiveRenderEditingInputRequestContext-renderVideo", v41, v24, v26 name completion];
      os_unfair_lock_lock(&self->_renderLock);
      LODWORD(v27) = [(PHMediaRequestContext *)self isCancelled];
      os_unfair_lock_unlock(&self->_renderLock);
      if (v27) {
        [(PLPhotoEditRenderer *)self->_renderer cancelAllRenders];
      }

      objc_destroyWeak(&v44);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v34 = PLImageManagerGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = [v4 identifierString];
        *(_DWORD *)buf = 138412290;
        v47 = v35;
        _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_ERROR, "%@ PLPhotoEditRenderer unavailable, will not live render", buf, 0xCu);
      }
      v36 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"PLPhotoEditRenderer unavailable, will not live render");
      [v6 setObject:v36 forKeyedSubscript:@"PHImageErrorKey"];

      (*((void (**)(void))self->_renderedVideoHandler + 2))();
    }
  }
}

void __77__PHLiveRenderEditingInputRequestContext_processAndReturnResultsWithRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v9 = (id *)(a1 + 48);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained _handleRenderVideoFinishedWithRequest:*(void *)(a1 + 32) avAsset:v13 videoComposition:v12 audioMix:v11 error:v10 mutableInfo:*(void *)(a1 + 40)];
}

- (void)_handleRenderVideoFinishedWithRequest:(id)a3 avAsset:(id)a4 videoComposition:(id)a5 audioMix:(id)a6 error:(id)a7 mutableInfo:(id)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  [v19 setObject:v18 forKeyedSubscript:@"PHImageErrorKey"];
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[PHMediaRequestContext isCancelled](self, "isCancelled"));
  [v19 setObject:v20 forKeyedSubscript:@"PHImageCancelledKey"];

  v21 = PLImageManagerGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = [v14 identifierString];
    int v25 = 138412546;
    double v26 = v22;
    __int16 v27 = 2112;
    id v28 = v18;
    _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEBUG, "%@ [LiveRender] - Live rendering video completed with error: %@", (uint8_t *)&v25, 0x16u);
  }
  if (!v15)
  {
    double v23 = PLImageManagerGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      double v24 = [(PHContentEditingInputResult *)self->super._contentEditingInputResult videoURL];
      int v25 = 138412546;
      double v26 = v24;
      __int16 v27 = 2112;
      id v28 = v18;
      _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "Error live rendering video at URL: %@, error: %@", (uint8_t *)&v25, 0x16u);
    }
  }
  (*((void (**)(void))self->_renderedVideoHandler + 2))();
  [(PHMediaRequestContext *)self finishCustomAsyncWorkWithIdentifier:@"renderVideoWithTargetSize"];
}

- (id)progresses
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(PHMediaRequestLiveRenderingOptions *)self->_liveRenderOptions liveRenderAndOnDemandRenderVideoConcurrently])
  {
    v6[0] = self->_onDemandRenderProgress;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PHLiveRenderEditingInputRequestContext;
    v3 = [(PHContentEditingInputRequestContext *)&v5 progresses];
  }

  return v3;
}

- (id)progressHandler
{
  return (id)[(PHMediaRequestLiveRenderingOptions *)self->_liveRenderOptions progressHandler];
}

- (void)cancel
{
  p_renderLock = &self->_renderLock;
  os_unfair_lock_lock(&self->_renderLock);
  v5.receiver = self;
  v5.super_class = (Class)PHLiveRenderEditingInputRequestContext;
  [(PHContentEditingInputRequestContext *)&v5 cancel];
  renderer = self->_renderer;
  os_unfair_lock_unlock(p_renderLock);
  if (renderer) {
    [(PLPhotoEditRenderer *)self->_renderer cancelAllRenders];
  }
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  v7 = (PHVideoRequest *)a4;
  if ([(PHMediaRequestLiveRenderingOptions *)self->_liveRenderOptions liveRenderAndOnDemandRenderVideoConcurrently]&& self->_onDemandRenderRequest == v7)
  {
    v8 = [v6 videoURL];

    if (v8)
    {
      v9 = [v6 videoURL];
      id v10 = [v6 info];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __72__PHLiveRenderEditingInputRequestContext_processMediaResult_forRequest___block_invoke;
      v14[3] = &unk_1E58470B0;
      id v15 = v6;
      id v16 = self;
      id v17 = v7;
      +[PHImageManager buildAVAssetFromVideoURL:v9 infoDictionary:v10 options:0 completion:v14];
    }
    else
    {
      id renderedVideoHandler = self->_renderedVideoHandler;
      id v12 = [v6 info];
      (*((void (**)(id, void, PHVideoRequest *, void, void, void, void *))renderedVideoHandler + 2))(renderedVideoHandler, 0, v7, 0, 0, 0, v12);
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PHLiveRenderEditingInputRequestContext;
    [(PHContentEditingInputRequestContext *)&v13 processMediaResult:v6 forRequest:v7];
  }
}

void __72__PHLiveRenderEditingInputRequestContext_processMediaResult_forRequest___block_invoke(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  v9 = (void *)a1[4];
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  [v9 setErrorIfNone:a5];
  objc_super v13 = (void *)a1[4];
  uint64_t v14 = *(void *)(a1[5] + 304);
  uint64_t v15 = a1[6];
  id v16 = [v13 info];
  (*(void (**)(uint64_t, void *, uint64_t, id, id, id, id))(v14 + 16))(v14, v13, v15, v12, v10, v11, v16);
}

- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = (PHVideoRequest *)a3;
  id v11 = a6;
  if ([(PHMediaRequestLiveRenderingOptions *)self->_liveRenderOptions liveRenderAndOnDemandRenderVideoConcurrently]&& self->_onDemandRenderRequest == v10)
  {
    id v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PHLiveRenderEditingInputRequestContext;
    id v12 = [(PHContentEditingInputRequestContext *)&v14 produceChildRequestsForRequest:v10 reportingIsLocallyAvailable:v8 isDegraded:v7 result:v11];
  }

  return v12;
}

- (id)initialRequests
{
  v17.receiver = self;
  v17.super_class = (Class)PHLiveRenderEditingInputRequestContext;
  v3 = [(PHContentEditingInputRequestContext *)&v17 initialRequests];
  if ([(PHMediaRequestLiveRenderingOptions *)self->_liveRenderOptions liveRenderAndOnDemandRenderVideoConcurrently])
  {
    id v4 = objc_alloc_init(PHVideoRequestBehaviorSpec);
    [(PHVideoRequestBehaviorSpec *)v4 setDeliveryMode:1];
    [(PHVideoRequestBehaviorSpec *)v4 setVersion:0];
    objc_super v5 = [PHVideoRequest alloc];
    uint64_t v6 = [(PHMediaRequestContext *)self requestID];
    unint64_t v7 = [(PHMediaRequestContext *)self nextRequestIndex];
    int64_t v8 = [(PHContentEditingInputRequestContext *)self type];
    unint64_t v9 = [(PHMediaRequestContext *)self managerID];
    id v10 = [(PHMediaRequestContext *)self asset];
    id v11 = [(PHVideoRequest *)v5 initWithRequestID:v6 requestIndex:v7 contextType:v8 managerID:v9 asset:v10 displaySpec:0 behaviorSpec:v4 delegate:self];
    onDemandRenderRequest = self->_onDemandRenderRequest;
    self->_onDemandRenderRequest = v11;

    onDemandRenderProgress = self->_onDemandRenderProgress;
    objc_super v14 = [(PHMediaRequest *)self->_onDemandRenderRequest identifierString];
    [(PHMediaRequestContext *)self setProgress:onDemandRenderProgress forRequestIdentifier:v14];

    uint64_t v15 = [v3 arrayByAddingObject:self->_onDemandRenderRequest];

    v3 = (void *)v15;
  }

  return v3;
}

- (PHLiveRenderEditingInputRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 useRAWAsUnadjustedBase:(BOOL)a7 resultHandler:(id)a8
{
  BOOL v8 = a7;
  uint64_t v12 = *(void *)&a3;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  [v15 setForceReturnFullLivePhoto:1];
  v19.receiver = self;
  v19.super_class = (Class)PHLiveRenderEditingInputRequestContext;
  objc_super v17 = [(PHContentEditingInputRequestContext *)&v19 initWithRequestID:v12 managerID:a4 asset:v16 options:v15 useRAWAsUnadjustedBase:v8 resultHandler:v14];

  if (v17) {
    v17->_renderLock._os_unfair_lock_opaque = 0;
  }
  return v17;
}

+ (id)videoLiveRenderContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 targetSize:(CGSize)a7 renderedVideoHandler:(id)a8
{
  return (id)objc_msgSend(a1, "videoLiveRenderContextWithRequestID:managerID:asset:options:targetSize:contentMode:renderedVideoHandler:", *(void *)&a3, a4, a5, a6, 0, a8, a7.width, a7.height);
}

+ (id)videoLiveRenderContextWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 targetSize:(CGSize)a7 contentMode:(int64_t)a8 renderedVideoHandler:(id)a9
{
  double height = a7.height;
  double width = a7.width;
  uint64_t v16 = *(void *)&a3;
  id v18 = a6;
  id v19 = a9;
  id v20 = a5;
  v21 = objc_alloc_init(PHContentEditingInputRequestOptions);
  [(PHContentEditingInputRequestOptions *)v21 setCanHandleAdjustmentData:&__block_literal_global_35842];
  v22 = [v18 renderResultHandlerQueue];
  [(PHContentEditingInputRequestOptions *)v21 setResultHandlerQueue:v22];

  -[PHContentEditingInputRequestOptions setNetworkAccessAllowed:](v21, "setNetworkAccessAllowed:", [v18 isNetworkAccessAllowed]);
  -[PHContentEditingInputRequestOptions setTargetSize:](v21, "setTargetSize:", width, height);
  [(PHContentEditingInputRequestOptions *)v21 setContentMode:a8];
  uint64_t v23 = [objc_alloc((Class)a1) initWithRequestID:v16 managerID:a4 asset:v20 options:v21 useRAWAsUnadjustedBase:0 resultHandler:0];

  double v24 = _Block_copy(v19);
  int v25 = *(void **)(v23 + 304);
  *(void *)(v23 + 304) = v24;

  objc_storeStrong((id *)(v23 + 312), a6);
  if ([v18 liveRenderAndOnDemandRenderVideoConcurrently])
  {
    uint64_t v26 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:100];
    __int16 v27 = *(void **)(v23 + 328);
    *(void *)(v23 + 328) = v26;
  }

  return (id)v23;
}

@end