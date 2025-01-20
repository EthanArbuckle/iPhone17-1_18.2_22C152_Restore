@interface PHMediaFormatLivePhotoConversionRequest
+ (id)requestForImageConversionRequest:(id)a3 videoConversionRequest:(id)a4 error:(id *)a5;
+ (id)requestForSource:(id)a3 destinationCapabilities:(id)a4 error:(id *)a5;
- (PHMediaFormatConversionRequest)imageConversionRequest;
- (PHMediaFormatConversionRequest)videoConversionRequest;
- (void)didPreflightSubrequest:(id)a3;
- (void)enqueueSubrequestsOnConversionManager:(id)a3;
- (void)enumerateSubrequests:(id)a3;
- (void)setImageConversionRequest:(id)a3;
- (void)setVideoConversionRequest:(id)a3;
@end

@implementation PHMediaFormatLivePhotoConversionRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoConversionRequest, 0);
  objc_storeStrong((id *)&self->_imageConversionRequest, 0);
}

- (void)setVideoConversionRequest:(id)a3
{
}

- (PHMediaFormatConversionRequest)videoConversionRequest
{
  return (PHMediaFormatConversionRequest *)objc_getProperty(self, a2, 248, 1);
}

- (void)setImageConversionRequest:(id)a3
{
}

- (PHMediaFormatConversionRequest)imageConversionRequest
{
  return (PHMediaFormatConversionRequest *)objc_getProperty(self, a2, 240, 1);
}

- (void)didPreflightSubrequest:(id)a3
{
  if ([(PHMediaFormatConversionCompositeRequest *)self areAllSubrequestsPreflighted])
  {
    id v8 = [(PHMediaFormatLivePhotoConversionRequest *)self imageConversionRequest];
    v5 = [(PHMediaFormatLivePhotoConversionRequest *)self videoConversionRequest];
    if ([(PHMediaFormatConversionCompositeRequest *)self requiresFormatConversion])
    {
      [v8 setForceFormatConversion:1];
      [v5 setForceFormatConversion:1];
      if ([(PHMediaFormatConversionRequest *)self livePhotoPairingIdentifierBehavior] == 4)
      {
        v6 = [(PHMediaFormatConversionRequest *)self livePhotoPairingIdentifier];
        if (!v6)
        {
          v7 = [MEMORY[0x1E4F28B00] currentHandler];
          [v7 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:1689 description:@"Unexpected nil pairing identifier for configured live photo pairing identifier behavior"];
        }
        [v8 setLivePhotoPairingIdentifier:v6];
        [v5 setLivePhotoPairingIdentifier:v6];
      }
    }
  }
}

- (void)enumerateSubrequests:(id)a3
{
  id v5 = a3;
  v6 = [(PHMediaFormatLivePhotoConversionRequest *)self imageConversionRequest];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

  id v7 = [(PHMediaFormatLivePhotoConversionRequest *)self videoConversionRequest];
  (*((void (**)(id, id))a3 + 2))(v5, v7);
}

- (void)enqueueSubrequestsOnConversionManager:(id)a3
{
  id v4 = a3;
  [(PHMediaFormatConversionCompositeRequest *)self propagateRequestOptionsToSubrequests];
  id v5 = [(PHMediaFormatLivePhotoConversionRequest *)self imageConversionRequest];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__PHMediaFormatLivePhotoConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke;
  v8[3] = &unk_1E6CFEE00;
  v8[4] = self;
  [v4 enqueueConversionRequest:v5 completionHandler:v8];

  v6 = [(PHMediaFormatLivePhotoConversionRequest *)self videoConversionRequest];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__PHMediaFormatLivePhotoConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke_743;
  v7[3] = &unk_1E6CFEE00;
  v7[4] = self;
  [v4 enqueueConversionRequest:v6 completionHandler:v7];
}

void __81__PHMediaFormatLivePhotoConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v2 = [*(id *)(a1 + 32) imageConversionRequest];
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Live photo request image subrequest finished: %@", (uint8_t *)&v3, 0xCu);
  }
}

void __81__PHMediaFormatLivePhotoConversionRequest_enqueueSubrequestsOnConversionManager___block_invoke_743(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v2 = [*(id *)(a1 + 32) videoConversionRequest];
    int v3 = 138412290;
    id v4 = v2;
    _os_log_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Live photo request video subrequest finished: %@", (uint8_t *)&v3, 0xCu);
  }
}

+ (id)requestForImageConversionRequest:(id)a3 videoConversionRequest:(id)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHMediaFormatConversion.m", 1640, @"Invalid parameter not satisfying: %@", @"imageConversionRequest" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"PHMediaFormatConversion.m", 1641, @"Invalid parameter not satisfying: %@", @"videoConversionRequest" object file lineNumber description];

LABEL_3:
  v12 = objc_opt_new();
  [v12 setImageConversionRequest:v9];
  [v9 setParentRequest:v12];
  [v12 setVideoConversionRequest:v11];
  [v11 setParentRequest:v12];
  [v12 setLivePhotoPairingIdentifierBehavior:4];
  v13 = [MEMORY[0x1E4F29128] UUID];
  v14 = [v13 UUIDString];
  [v12 setLivePhotoPairingIdentifier:v14];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v17 = [v12 livePhotoPairingIdentifier];
    *(_DWORD *)buf = 138412290;
    v21 = v17;
    _os_log_debug_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Initial live photo pairing identifier for live photo request: %@", buf, 0xCu);
  }
  v15 = [v12 compositeRequestCommonInitWithError:a5];

  return v15;
}

+ (id)requestForSource:(id)a3 destinationCapabilities:(id)a4 error:(id *)a5
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSStringFromSelector(a2);
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  [v5 raise:v6, @"The constructor %@ is unavailable for %@", v7, v9 format];

  return 0;
}

@end