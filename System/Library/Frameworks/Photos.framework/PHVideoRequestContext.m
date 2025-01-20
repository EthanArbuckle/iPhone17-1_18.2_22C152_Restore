@interface PHVideoRequestContext
- (BOOL)isNetworkAccessAllowed;
- (BOOL)representsShareableHighQualityResource;
- (PHVideoRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 options:(id)a7 intent:(int64_t)a8 resultHandler:(id)a9;
- (PHVideoRequestOptions)videoOptions;
- (id)_lazyProgress;
- (id)initialRequests;
- (id)progressHandler;
- (id)progresses;
- (int64_t)intent;
- (int64_t)type;
- (void)processMediaResult:(id)a3 forRequest:(id)a4;
@end

@implementation PHVideoRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoOptions, 0);

  objc_storeStrong((id *)&self->_progress, 0);
}

- (int64_t)intent
{
  return self->_intent;
}

- (PHVideoRequestOptions)videoOptions
{
  return self->_videoOptions;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PLImageManagerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = [v7 identifierString];
    v10 = [v6 videoURL];
    v11 = [v6 info];
    *(_DWORD *)buf = 138412802;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v10;
    __int16 v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "[RM]: %@ finished with video URL: %@, info: %@", buf, 0x20u);
  }
  if (PHImageManagerRecordEnabled())
  {
    uint64_t v13 = [v7 requestID];
    v14 = [v7 identifierString];
    v15 = [v6 videoURL];
    v16 = [v6 info];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v13, @"[RM]: %@ finished with video URL: %@, info: %@", v14, v15, v16 message];
  }
  resultHandler = (void (**)(id, id, id, PHVideoRequestContext *))self->super._resultHandler;
  if (resultHandler) {
    resultHandler[2](resultHandler, v6, v7, self);
  }
}

- (id)progresses
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(PHMediaRequestContext *)self shouldReportProgress])
  {
    v3 = [(PHVideoRequestContext *)self _lazyProgress];
    v6[0] = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)progressHandler
{
  return [(PHVideoRequestOptions *)self->_videoOptions progressHandler];
}

- (id)initialRequests
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(PHVideoRequestBehaviorSpec);
  [(PHVideoRequestBehaviorSpec *)v3 setNetworkAccessAllowed:[(PHVideoRequestOptions *)self->_videoOptions isNetworkAccessAllowed]];
  [(PHVideoRequestBehaviorSpec *)v3 setDeliveryMode:[(PHVideoRequestOptions *)self->_videoOptions deliveryMode]];
  [(PHVideoRequestBehaviorSpec *)v3 setVersion:[(PHVideoRequestOptions *)self->_videoOptions version]];
  [(PHVideoRequestBehaviorSpec *)v3 setStreamingAllowed:[(PHVideoRequestOptions *)self->_videoOptions isStreamingAllowed]];
  [(PHVideoRequestBehaviorSpec *)v3 setStreamingVideoIntent:[(PHVideoRequestOptions *)self->_videoOptions streamingVideoIntent]];
  [(PHVideoRequestBehaviorSpec *)v3 setVideoComplementAllowed:[(PHVideoRequestOptions *)self->_videoOptions isVideoComplementAllowed]];
  [(PHVideoRequestBehaviorSpec *)v3 setMediumHighQualityAllowed:[(PHVideoRequestOptions *)self->_videoOptions isMediumHighQualityAllowed]];
  [(PHVideoRequestBehaviorSpec *)v3 setRestrictToPlayableOnCurrentDevice:[(PHVideoRequestOptions *)self->_videoOptions restrictToPlayableOnCurrentDevice]];
  [(PHVideoRequestBehaviorSpec *)v3 setRestrictToStreamable:[(PHVideoRequestOptions *)self->_videoOptions restrictToStreamable]];
  [(PHVideoRequestBehaviorSpec *)v3 setRestrictToEncryptedStream:[(PHVideoRequestOptions *)self->_videoOptions restrictToEncryptedStream]];
  [(PHVideoRequestBehaviorSpec *)v3 setDownloadIntent:[(PHVideoRequestOptions *)self->_videoOptions downloadIntent]];
  [(PHVideoRequestBehaviorSpec *)v3 setDownloadPriority:[(PHVideoRequestOptions *)self->_videoOptions downloadPriority]];
  videoOptions = self->_videoOptions;
  if (videoOptions) {
    [(PHVideoRequestOptions *)videoOptions timeRange];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  [(PHVideoRequestBehaviorSpec *)v3 setTimeRange:v17];
  v5 = [PHVideoRequest alloc];
  uint64_t v6 = [(PHMediaRequestContext *)self requestID];
  unint64_t v7 = [(PHMediaRequestContext *)self nextRequestIndex];
  int64_t v8 = [(PHVideoRequestContext *)self type];
  unint64_t v9 = [(PHMediaRequestContext *)self managerID];
  v10 = [(PHMediaRequestContext *)self asset];
  v11 = [(PHMediaRequestContext *)self displaySpec];
  v12 = [(PHVideoRequest *)v5 initWithRequestID:v6 requestIndex:v7 contextType:v8 managerID:v9 asset:v10 displaySpec:v11 behaviorSpec:v3 delegate:self];

  uint64_t v13 = [(PHVideoRequestContext *)self _lazyProgress];
  v14 = [(PHMediaRequest *)v12 identifierString];
  [(PHMediaRequestContext *)self setProgress:v13 forRequestIdentifier:v14];

  v18[0] = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  return v15;
}

- (BOOL)representsShareableHighQualityResource
{
  return (unint64_t)(self->_intent - 1) < 2;
}

- (BOOL)isNetworkAccessAllowed
{
  return [(PHVideoRequestOptions *)self->_videoOptions isNetworkAccessAllowed];
}

- (int64_t)type
{
  return 1;
}

- (id)_lazyProgress
{
  progress = self->_progress;
  if (!progress)
  {
    v4 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    v5 = self->_progress;
    self->_progress = v4;

    progress = self->_progress;
  }

  return progress;
}

- (PHVideoRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 displaySpec:(id)a6 options:(id)a7 intent:(int64_t)a8 resultHandler:(id)a9
{
  uint64_t v14 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PHVideoRequestContext;
  v17 = [(PHMediaRequestContext *)&v26 initWithRequestID:v14 managerID:a4 asset:a5 displaySpec:a6 resultHandler:a9];
  v18 = v17;
  if (v17)
  {
    p_videoOptions = (id *)&v17->_videoOptions;
    objc_storeStrong((id *)&v17->_videoOptions, a7);
    v18->_intent = a8;
    if ([*p_videoOptions version] && objc_msgSend(*p_videoOptions, "deliveryMode"))
    {
      v20 = PLImageManagerGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "Video request delivery mode is only applicable for current version requests", buf, 2u);
      }
    }
    id v25 = 0;
    char v21 = [v16 isValidConfigurationWithError:&v25];
    id v22 = v25;
    if ((v21 & 1) == 0)
    {
      uint64_t v23 = PLImageManagerGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v22;
        _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "Invalid options configuration for video request: %@", buf, 0xCu);
      }
    }
  }

  return v18;
}

@end