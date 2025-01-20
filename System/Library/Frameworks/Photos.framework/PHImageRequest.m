@interface PHImageRequest
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSynchronous;
- (CGSize)desiredImageSize;
- (PHImageDisplaySpec)displaySpec;
- (PHImageRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 displaySpec:(id)a8 behaviorSpec:(id)a9 chooser:(id)a10 delegate:(id)a11;
- (PHImageRequestBehaviorSpec)behaviorSpec;
- (PHImageRequestDelegate)imageDelegate;
- (id)description;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (void)_decodeImageConfiguredWithURL:(id)a3 isPrimaryFormat:(BOOL)a4;
- (void)cancel;
- (void)configureWithError:(id)a3;
- (void)configureWithURL:(id)a3 uniformTypeIdentifier:(id)a4 exifOrientation:(int)a5;
- (void)handleAvailabilityChangeForResource:(id)a3 url:(id)a4 info:(id)a5 error:(id)a6;
- (void)prepareForRetry;
- (void)setBehaviorSpec:(id)a3;
- (void)setDisplaySpec:(id)a3;
- (void)startRequest;
@end

@implementation PHImageRequest

- (PHImageRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (void)startRequest
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  if ([(PHMediaRequest *)self isCancelled] || self->super._configurationError)
  {
    _finishRequest(self);
    return;
  }
  BOOL v3 = [(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadURL];
  BOOL v4 = [(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadData];
  BOOL v5 = [(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadImage];
  BOOL v6 = (unint64_t)[(PHImageRequestBehaviorSpec *)self->_behaviorSpec choosingPolicy] < 3
    && (v4 || v3);
  if (v6 || !v5 && !v4 && !v3)
  {
    v21 = PLImageManagerGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [(PHMediaRequest *)self identifierString];
      *(_DWORD *)buf = 138412290;
      uint64_t v97 = (uint64_t)v22;
      _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Invalid loading mode for image request %@ is a no-op", buf, 0xCu);
    }
    if (!PHImageManagerRecordEnabled()) {
      goto LABEL_45;
    }
    uint64_t v23 = [(PHMediaRequest *)self requestID];
    v24 = [(PHMediaRequest *)self identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v23, @"Invalid loading mode for image request %@ is a no-op", v24 message];
LABEL_33:

    goto LABEL_45;
  }
  if (!self->_chooser)
  {
    v25 = PLImageManagerGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = [(PHMediaRequest *)self identifierString];
      *(_DWORD *)buf = 138412290;
      uint64_t v97 = (uint64_t)v26;
      _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, "Image request %@ running without chooser is a no-op", buf, 0xCu);
    }
    if (!PHImageManagerRecordEnabled()) {
      goto LABEL_45;
    }
    uint64_t v27 = [(PHMediaRequest *)self requestID];
    v24 = [(PHMediaRequest *)self identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v27, @"Image request %@ running without chooser is a no-op", v24 message];
    goto LABEL_33;
  }
  int v7 = !v5;
  if (self->_forceIgnoreCache) {
    int v7 = 1;
  }
  if ((v7 | (v4 || v3))) {
    goto LABEL_19;
  }
  int64_t v8 = [(PHImageRequestBehaviorSpec *)self->_behaviorSpec choosingPolicy];
  __int16 v95 = 0;
  v9 = [(PHImageRequest *)self imageDelegate];
  v10 = v9;
  v11 = v8 == 3 ? (char *)&v95 + 1 : 0;
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __30__PHImageRequest_startRequest__block_invoke;
  v94[3] = &unk_1E5842360;
  v94[4] = self;
  [v9 imageRequest:self isQueryingCacheAndDidWait:v11 didFindImage:&v95 resultHandler:v94];

  if (HIBYTE(v95) | v95)
  {
    v64 = PLImageManagerGetLog();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v65 = [(PHMediaRequest *)self identifierString];
      v66 = (void *)v65;
      v67 = @"found image";
      if (!(_BYTE)v95) {
        v67 = @"waiting for in-flight request";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v97 = v65;
      __int16 v98 = 2112;
      v99 = (PHImageRequest *)v67;
      _os_log_impl(&dword_19B043000, v64, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ early return from image cache, reason: %@", buf, 0x16u);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v68 = [(PHMediaRequest *)self requestID];
      uint64_t v69 = [(PHMediaRequest *)self identifierString];
      v70 = (void *)v69;
      if ((_BYTE)v95) {
        v71 = @"found image";
      }
      else {
        v71 = @"waiting for in-flight request";
      }
      +[PHImageManagerRequestTracer traceMessageForRequestID:v68, @"[RM][cache]: %@ early return from image cache, reason: %@", v69, v71 message];
    }
  }
  else
  {
LABEL_19:
    v12 = PLImageManagerGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = [(PHMediaRequest *)self identifierString];
      *(_DWORD *)buf = 138412546;
      uint64_t v97 = (uint64_t)v13;
      __int16 v98 = 2112;
      v99 = self;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image request: %@", buf, 0x16u);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v72 = [(PHMediaRequest *)self requestID];
      v73 = [(PHMediaRequest *)self identifierString];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v72, @"[RM]: %@ Image request: %@", v73, self message];
    }
    p_desiredImageSize = &self->_desiredImageSize;
    displaySpec = self->_displaySpec;
    if (displaySpec)
    {
      v16 = [(PHMediaRequest *)self asset];
      uint64_t v17 = [v16 pixelWidth];
      v18 = [(PHMediaRequest *)self asset];
      -[PHImageDisplaySpec requestSizeFromFullSizedWidth:height:resizeMode:](displaySpec, "requestSizeFromFullSizedWidth:height:resizeMode:", v17, [v18 pixelHeight], -[PHImageRequestBehaviorSpec resizeMode](self->_behaviorSpec, "resizeMode"));
      p_desiredImageSize->width = v19;
      self->_desiredImageSize.height = v20;
    }
    else
    {
      CGSize *p_desiredImageSize = *(CGSize *)MEMORY[0x1E4F1DB30];
    }
    v28 = PLImageManagerGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = [(PHMediaRequest *)self identifierString];
      DCIM_NSStringFromCGSize();
      v30 = (PHImageRequest *)objc_claimAutoreleasedReturnValue();
      v31 = [(PHImageDisplaySpec *)self->_displaySpec shortDescription];
      *(_DWORD *)buf = 138412802;
      uint64_t v97 = (uint64_t)v29;
      __int16 v98 = 2112;
      v99 = v30;
      __int16 v100 = 2112;
      v101 = v31;
      _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_DEBUG, "[RM]: %@ request sized to %@, for display spec: %@", buf, 0x20u);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v74 = [(PHMediaRequest *)self requestID];
      v75 = [(PHMediaRequest *)self identifierString];
      v76 = DCIM_NSStringFromCGSize();
      v77 = [(PHImageDisplaySpec *)self->_displaySpec shortDescription];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v74, @"[RM]: %@ request sized to %@, for display spec: %@", v75, v76, v77 message];
    }
    if (self->_configuredImageURL)
    {
      if ((![(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadDataOrURL]
         || _loadURLIntoResult([(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadURL], [(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadData], self->_configuredImageURL, self->_configuredImageUTI, self->_configuredExifOrientation, self))&& [(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadImage])
      {
        if (self->_configuredImageUTI) {
          uint64_t v32 = objc_msgSend(MEMORY[0x1E4F8A950], "isPrimaryImageFormatForUTI:");
        }
        else {
          uint64_t v32 = 0;
        }
        [(PHImageRequest *)self _decodeImageConfiguredWithURL:self->_configuredImageURL isPrimaryFormat:v32];
        return;
      }
LABEL_45:
      _finishRequest(self);
      return;
    }
    v33 = PLImageManagerGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v91 = [(PHMediaRequest *)self identifierString];
      v34 = (void *)MEMORY[0x1E4F8A950];
      v93 = [(PHMediaRequest *)self asset];
      v35 = [v93 imageRequestHints];
      v36 = [(PHMediaRequest *)self asset];
      uint64_t v37 = [v36 pixelWidth];
      v38 = [(PHMediaRequest *)self asset];
      uint64_t v39 = [v38 pixelHeight];
      v40 = [(PHMediaRequest *)self asset];
      v41 = [v34 debugDescriptionForHintData:v35 assetWidth:v37 assetHeight:v39 assetID:v40];
      *(_DWORD *)buf = 138412546;
      uint64_t v97 = (uint64_t)v91;
      __int16 v98 = 2112;
      v99 = v41;
      _os_log_impl(&dword_19B043000, v33, OS_LOG_TYPE_DEBUG, "[RM]: %@ choosing image resource, hints are: %@", buf, 0x16u);
    }
    if (PHImageManagerRecordEnabled())
    {
      unsigned int v92 = [(PHMediaRequest *)self requestID];
      v90 = [(PHMediaRequest *)self identifierString];
      v78 = (void *)MEMORY[0x1E4F8A950];
      v79 = [(PHMediaRequest *)self asset];
      v80 = [v79 imageRequestHints];
      v81 = [(PHMediaRequest *)self asset];
      uint64_t v82 = [v81 pixelWidth];
      v83 = [(PHMediaRequest *)self asset];
      uint64_t v84 = [v83 pixelHeight];
      v85 = [(PHMediaRequest *)self asset];
      v86 = [v78 debugDescriptionForHintData:v80 assetWidth:v82 assetHeight:v84 assetID:v85];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v92, @"[RM]: %@ choosing image resource, hints are: %@", v90, v86 message];
    }
    v42 = self->_chooser;
    v43 = [(PHImageRequest *)self behaviorSpec];
    [(PHImageResourceChooser *)v42 setBehaviorSpec:v43];

    [(PHImageRequest *)self desiredImageSize];
    -[PHImageResourceChooser setDesiredSize:](v42, "setDesiredSize:");
    [(PHImageResourceChooser *)v42 setContext:self];
    v44 = [(PHMediaRequest *)self identifierString];
    [(PHImageResourceChooser *)v42 setLoggingPrefix:v44];

    [(PHImageResourceChooser *)v42 setResourceHandler:&__block_literal_global_3007];
    if ([(PHImageRequest *)self downloadIntent] == 2) {
      [(PHImageResourceChooser *)v42 setAllowChoosingNonLocalVideoKeyFrameResource:0];
    }
    [(PHImageDisplaySpec *)self->_displaySpec fallbackTargetSizeIfRequestedSizeNotLocallyAvailable];
    double v47 = *MEMORY[0x1E4F1DB30];
    double v46 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v48 != *MEMORY[0x1E4F1DB30] || v45 != v46)
    {
      [(PHImageDisplaySpec *)self->_displaySpec fallbackTargetSizeIfRequestedSizeNotLocallyAvailable];
      double v51 = v49 * v50;
      [(PHImageDisplaySpec *)self->_displaySpec targetSize];
      double v53 = v52;
      [(PHImageDisplaySpec *)self->_displaySpec targetSize];
      if (v51 < v53 * v54
        || ([(PHImageDisplaySpec *)self->_displaySpec targetSize], v56 == v47) && v55 == v46)
      {
        v57 = [(PHMediaRequest *)self asset];
        uint64_t v58 = [v57 pixelWidth];
        v59 = [(PHMediaRequest *)self asset];
        double v60 = v51 / (double)(unint64_t)([v59 pixelHeight] * v58);

        if (v60 < 0.000000238418579) {
          double v60 = 0.000000238418579;
        }
        [(PHImageResourceChooser *)v42 setFallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:v60];
        v61 = PLImageManagerGetLog();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v62 = [(PHMediaRequest *)self identifierString];
          v63 = DCIM_NSStringFromCGSize();
          *(_DWORD *)buf = 138412802;
          uint64_t v97 = (uint64_t)v62;
          __int16 v98 = 2048;
          v99 = *(PHImageRequest **)&v60;
          __int16 v100 = 2112;
          v101 = v63;
          _os_log_impl(&dword_19B043000, v61, OS_LOG_TYPE_DEBUG, "[RM]: %@ enabling fallback-best scale: %f based on fallback size: %@", buf, 0x20u);
        }
        if (PHImageManagerRecordEnabled())
        {
          uint64_t v87 = [(PHMediaRequest *)self requestID];
          v88 = [(PHMediaRequest *)self identifierString];
          v89 = DCIM_NSStringFromCGSize();
          +[PHImageManagerRequestTracer traceMessageForRequestID:v87, @"[RM]: %@ enabling fallback-best scale: %f based on fallback size: %@", v88, *(void *)&v60, v89 message];
        }
      }
    }
    [(PHImageResourceChooser *)self->_chooser presentNextQualifyingResource];
  }
}

- (CGSize)desiredImageSize
{
  double width = self->_desiredImageSize.width;
  double height = self->_desiredImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PHImageRequestDelegate)imageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageDelegate);

  return (PHImageRequestDelegate *)WeakRetained;
}

- (int64_t)downloadIntent
{
  return [(PHImageRequestBehaviorSpec *)self->_behaviorSpec downloadIntent];
}

- (BOOL)isSynchronous
{
  return [(PHImageRequestBehaviorSpec *)self->_behaviorSpec isSynchronous];
}

- (PHImageRequest)initWithRequestID:(int)a3 requestIndex:(unint64_t)a4 contextType:(int64_t)a5 managerID:(unint64_t)a6 asset:(id)a7 displaySpec:(id)a8 behaviorSpec:(id)a9 chooser:(id)a10 delegate:(id)a11
{
  uint64_t v15 = *(void *)&a3;
  id v29 = a8;
  id v17 = a9;
  id v28 = a10;
  id v18 = a11;
  v30.receiver = self;
  v30.super_class = (Class)PHImageRequest;
  uint64_t v19 = v15;
  CGFloat v20 = [(PHMediaRequest *)&v30 initWithRequestID:v15 requestIndex:a4 contextType:a5 managerID:a6 asset:a7 delegate:v18];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_displaySpec, a8);
    objc_storeStrong((id *)&v21->_behaviorSpec, a9);
    v21->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v21->_imageDelegate, v18);
    v22 = [(PHCompositeMediaResult *)[PHImageResult alloc] initWithRequestID:v19];
    imageResult = v21->_imageResult;
    v21->_imageResult = v22;

    objc_storeStrong((id *)&v21->_chooser, a10);
    if ([v17 isSynchronous])
    {
      dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
      syncDownloadWaitSemaphore = v21->_syncDownloadWaitSemaphore;
      v21->_syncDownloadWaitSemaphore = (OS_dispatch_semaphore *)v24;
    }
  }

  return v21;
}

void __30__PHImageRequest_startRequest__block_invoke_63(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  v9 = (id *)v6;
  id v10 = v7;
  id v11 = v8;
  id WeakRetained = objc_loadWeakRetained(v9 + 27);
  objc_msgSend(WeakRetained, "mediaRequest:didFindLocallyAvailableResult:isDegraded:", v9, v10 != 0, objc_msgSend(v10, "isDegraded"));

  v107 = v11;
  v106 = v10;
  if ([v11 recipeID] == 65749 && (objc_msgSend(v11, "isHintBased") & 1) == 0)
  {
  }
  else if (v10)
  {
    id v13 = v10;
    v14 = v9;
    uint64_t v15 = [v13 dataStore];
    v16 = [v13 dataStoreKey];
    char v101 = [v13 isDegraded];
    int v102 = [v13 isPrimaryFormat];
    char v100 = [v13 isDerivedFromDeferredPreview];
    char v17 = [v13 keyIsHintBased];
    *(void *)v108 = MEMORY[0x1E4F143A8];
    *(void *)&v108[8] = 3221225472;
    *(void *)&v108[16] = ___chooserDidPresentLocallyAvailableBag_block_invoke;
    v109 = &unk_1E58423D0;
    id v18 = v14;
    *(void *)&long long v110 = v18;
    id v19 = v15;
    *((void *)&v110 + 1) = v19;
    id v20 = v16;
    id v111 = v20;
    id v103 = v13;
    id v112 = v103;
    id v105 = v19;
    id v21 = v20;
    v22 = v18;
    v104 = v108;
    uint64_t v23 = [v22 behaviorSpec];
    if ((v17 & 1) == 0)
    {
      if (PHSignpostEventsEnabled_onceToken != -1) {
        dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
      }
      if (PHSignpostEventsEnabled_eventsEnabled)
      {
        os_signpost_id_t v24 = [v22 signpostID];
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v25 = PLImageManagerGetLog();
          uint64_t v26 = [v22 managerID];
          int v27 = [v22 requestID];
          uint64_t v28 = [v22 requestIndex];
          if (os_signpost_enabled(v25))
          {
            *(_DWORD *)buf = 134218752;
            *(void *)&uint8_t buf[4] = v26;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v27;
            *(_WORD *)&buf[22] = 2048;
            v114 = (void *)v28;
            LOWORD(v115) = 2048;
            *(void *)((char *)&v115 + 2) = 35;
            _os_signpost_emit_with_name_impl(&dword_19B043000, v25, OS_SIGNPOST_EVENT, v24, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
          }
        }
      }
    }
    int v29 = [v23 shouldLoadURL];
    int v30 = [v23 shouldLoadData];
    if ((v29 | v30) != 1) {
      goto LABEL_76;
    }
    v31 = [v22 asset];
    uint64_t v32 = [v21 fileURLForAssetID:v31];
    v33 = [v21 uniformTypeIdentifier];
    int URLIntoResult = _loadURLIntoResult(v29, v30, v32, v33, -1, v22);

    if (!URLIntoResult)
    {
      v76 = PLImageManagerGetLog();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        v77 = [v22 identifierString];
        v78 = [v22 asset];
        v79 = [v21 fileURLForAssetID:v78];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v77;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v79;
        _os_log_impl(&dword_19B043000, v76, OS_LOG_TYPE_ERROR, "[RM]: %@ Failed to load image from URL: %@", buf, 0x16u);
      }
      if (PHImageManagerRecordEnabled())
      {
        uint64_t v91 = [v22 requestID];
        unsigned int v92 = [v22 identifierString];
        v93 = [v22 asset];
        v94 = [v21 fileURLForAssetID:v93];
        +[PHImageManagerRequestTracer traceMessageForRequestID:v91, @"[RM]: %@ Failed to load image from URL: %@", v92, v94 message];
      }
      uint64_t v60 = 0;
    }
    else
    {
LABEL_76:
      if ([v23 shouldLoadImage])
      {
        [v22 desiredImageSize];
        double v36 = v35;
        double v38 = v37;
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = ___loadImageFromStoreAndKey_block_invoke;
        v114 = &unk_1E5842418;
        uint64_t v39 = v22;
        *(void *)&long long v115 = v39;
        char v117 = v100;
        char v118 = v101;
        char v119 = v102;
        char v120 = v17;
        id v40 = v21;
        *((void *)&v115 + 1) = v40;
        v116 = v104;
        PHDecodeImageFromStoreForRequest(v105, v40, v102, v39, buf, v36, v38);

LABEL_50:
        goto LABEL_71;
      }
      uint64_t v60 = 1;
    }
    (*(void (**)(unsigned char *, uint64_t))&v108[16])(v104, v60);
    goto LABEL_50;
  }
  if (v11)
  {
    if ([v11 isHintBased])
    {
      v41 = PLImageManagerGetLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v42 = [v9 identifierString];
        v43 = [v9 asset];
        v44 = [v43 uuid];
        *(_DWORD *)v108 = 138543874;
        *(void *)&v108[4] = v42;
        *(_WORD *)&v108[12] = 2114;
        *(void *)&v108[14] = v107;
        *(_WORD *)&v108[22] = 2114;
        v109 = v44;
        _os_log_impl(&dword_19B043000, v41, OS_LOG_TYPE_ERROR, "[RM]: %{public}@ unexpected hint based resource info found w/o bag: %{public}@, for asset %{public}@", v108, 0x20u);
      }
      id v45 = v9[18];
      double v46 = (void *)MEMORY[0x1E4F28C58];
      *(void *)buf = *MEMORY[0x1E4F28228];
      *(void *)v108 = @"Unexpected hint based resource missing locally available bag";
      double v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:buf count:1];
      double v48 = [v46 errorWithDomain:@"PHPhotosErrorDomain" code:3303 userInfo:v47];
      [v45 setErrorIfNone:v48];

      _finishRequest(v9);
      goto LABEL_71;
    }
    int v61 = [v11 canDownload];
    int v62 = [v11 locallyGeneratableOnDemand];
    id v63 = v11;
    v64 = v9;
    if (PHSignpostEventsEnabled_onceToken != -1) {
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
    }
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      uint64_t v65 = [v64 signpostID];
      if ((unint64_t)(v65 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v66 = v65;
        v67 = PLImageManagerGetLog();
        uint64_t v68 = [v64 managerID];
        int v69 = [v64 requestID];
        uint64_t v70 = [v64 requestIndex];
        if (os_signpost_enabled(v67))
        {
          *(_DWORD *)v108 = 134218752;
          *(void *)&v108[4] = v68;
          *(_WORD *)&v108[12] = 2048;
          *(void *)&v108[14] = v69;
          *(_WORD *)&v108[22] = 2048;
          v109 = (void *)v70;
          LOWORD(v110) = 2048;
          *(void *)((char *)&v110 + 2) = 34;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v67, OS_SIGNPOST_EVENT, v66, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", v108, 0x2Au);
        }
      }
    }
    v71 = [v64 behaviorSpec];
    uint64_t v72 = v71;
    if (v61)
    {
      int v73 = [v71 isNetworkAccessAllowed];
      if ((v62 | v73))
      {
        if (v73)
        {
          uint64_t v74 = PLImageManagerGetLog();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
          {
            v75 = [v64 identifierString];
            *(_DWORD *)v108 = 138412290;
            *(void *)&v108[4] = v75;
            _os_log_impl(&dword_19B043000, v74, OS_LOG_TYPE_DEBUG, "[RM]: %@ remotely available, requesting availability change", v108, 0xCu);
          }
          if (PHImageManagerRecordEnabled())
          {
            uint64_t v97 = [v64 requestID];
            __int16 v98 = [v64 identifierString];
            +[PHImageManagerRequestTracer traceMessageForRequestID:v97, @"[RM]: %@ remotely available, requesting availability change", v98 message];
          }
          if (![v63 recipeID]) {
            [v64 recordMetricsWithMetricsHandler:&__block_literal_global_217];
          }
LABEL_56:
          objc_initWeak((id *)buf, v64);
          *(void *)v108 = MEMORY[0x1E4F143A8];
          *(void *)&v108[8] = 3221225472;
          *(void *)&v108[16] = ___chooserDidPresentResourceIdentity_block_invoke_2;
          v109 = &unk_1E5842468;
          objc_copyWeak((id *)&v110 + 1, (id *)buf);
          *(void *)&long long v110 = v63;
          id v82 = (id)[v64 sendMakeAvailableRequestForResource:(void)v110 reply:v108];
          if ([v64[29] isSynchronous])
          {
            dispatch_semaphore_wait((dispatch_semaphore_t)v64[23], 0xFFFFFFFFFFFFFFFFLL);
            _finishRequest(v64);
          }

          objc_destroyWeak((id *)&v110 + 1);
          objc_destroyWeak((id *)buf);
          goto LABEL_70;
        }
LABEL_52:
        v80 = PLImageManagerGetLog();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          v81 = [v64 identifierString];
          *(_DWORD *)v108 = 138412290;
          *(void *)&v108[4] = v81;
          _os_log_impl(&dword_19B043000, v80, OS_LOG_TYPE_DEBUG, "[RM]: %@ locally generatable, requesting availability change", v108, 0xCu);
        }
        if (PHImageManagerRecordEnabled())
        {
          uint64_t v95 = [v64 requestID];
          v96 = [v64 identifierString];
          +[PHImageManagerRequestTracer traceMessageForRequestID:v95, @"[RM]: %@ locally generatable, requesting availability change", v96 message];
        }
        goto LABEL_56;
      }
      if (([v72 isNetworkAccessAllowed] & 1) == 0)
      {
        [v64[18] setIsInCloud:1];
        id v87 = v64[18];
        v88 = PHNetworkAccessAllowedRequiredError();
        [v87 setErrorIfNone:v88];

        v89 = PLImageManagerGetLog();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
        {
          v90 = [v64 identifierString];
          *(_DWORD *)v108 = 138412290;
          *(void *)&v108[4] = v90;
          _os_log_impl(&dword_19B043000, v89, OS_LOG_TYPE_DEBUG, "[RM]: %@ remotely available but network access not allowed", v108, 0xCu);
        }
        if (!PHImageManagerRecordEnabled()) {
          goto LABEL_69;
        }
        uint64_t v99 = [v64 requestID];
        v86 = [v64 identifierString];
        +[PHImageManagerRequestTracer traceMessageForRequestID:v99, @"[RM]: %@ remotely available but network access not allowed", v86 message];
        goto LABEL_73;
      }
    }
    else if (v62)
    {
      goto LABEL_52;
    }
    v83 = PLImageManagerGetLog();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v84 = [v64 identifierString];
      *(_DWORD *)v108 = 138412290;
      *(void *)&v108[4] = v84;
      _os_log_impl(&dword_19B043000, v83, OS_LOG_TYPE_DEBUG, "[RM]: %@ nothing remotely available nor locally generatable", v108, 0xCu);
    }
    if (!PHImageManagerRecordEnabled()) {
      goto LABEL_69;
    }
    uint64_t v85 = [v64 requestID];
    v86 = [v64 identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v85, @"[RM]: %@ nothing remotely available nor locally generatable", v86 message];
LABEL_73:

LABEL_69:
    _finishRequest(v64);
LABEL_70:

    goto LABEL_71;
  }
  double v49 = [v9 behaviorSpec];
  unint64_t v50 = [v49 choosingPolicy];
  if (v50 <= 4 && ((1 << v50) & 0x19) != 0)
  {

    double v51 = PLImageManagerGetLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      double v52 = [v9 identifierString];
      double v53 = [v9 behaviorSpec];
      double v54 = [v9 asset];
      double v55 = [v54 uuid];
      *(_DWORD *)v108 = 138543874;
      *(void *)&v108[4] = v52;
      *(_WORD *)&v108[12] = 2114;
      *(void *)&v108[14] = v53;
      *(_WORD *)&v108[22] = 2114;
      v109 = v55;
      _os_log_impl(&dword_19B043000, v51, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ no resource found matching image request spec %{public}@, for asset %{public}@", v108, 0x20u);
    }
    id v56 = v9[18];
    v57 = (void *)MEMORY[0x1E4F28C58];
    *(void *)buf = *MEMORY[0x1E4F28228];
    *(void *)v108 = @"No resource found matching image request spec";
    uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:buf count:1];
    v59 = [v57 errorWithDomain:@"PHPhotosErrorDomain" code:3303 userInfo:v58];
    [v56 setErrorIfNone:v59];
  }
  else
  {
  }
  _finishRequest(v9);
LABEL_71:
}

- (PHImageDisplaySpec)displaySpec
{
  return self->_displaySpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
  objc_storeStrong((id *)&self->_displaySpec, 0);
  objc_destroyWeak((id *)&self->_imageDelegate);
  objc_storeStrong((id *)&self->_configuredImageUTI, 0);
  objc_storeStrong((id *)&self->_configuredImageURL, 0);
  objc_storeStrong((id *)&self->_syncDownloadWaitSemaphore, 0);
  objc_storeStrong((id *)&self->_chooser, 0);
  objc_storeStrong((id *)&self->_imageResult, 0);

  objc_storeStrong((id *)&self->_asyncDecodeRequestHandle, 0);
}

- (void)setBehaviorSpec:(id)a3
{
}

- (void)setDisplaySpec:(id)a3
{
}

- (id)description
{
  uint64_t v15 = NSString;
  BOOL v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  BOOL v5 = [(PHMediaRequest *)self identifierString];
  id v6 = [(PHMediaRequest *)self asset];
  id v7 = [v6 uuid];
  if ([(PHImageRequest *)self isSynchronous]) {
    id v8 = @"Y";
  }
  else {
    id v8 = @"N";
  }
  v9 = [(PHImageRequest *)self displaySpec];
  id v10 = [v9 shortDescription];
  id v11 = [(PHImageRequest *)self behaviorSpec];
  v12 = [v11 shortDescription];
  id v13 = [v15 stringWithFormat:@"<%@ %p> %@ - asset: %@, sync: %@, display: (%@), behavior: (%@)", v4, self, v5, v7, v8, v10, v12];

  return v13;
}

- (void)configureWithURL:(id)a3 uniformTypeIdentifier:(id)a4 exifOrientation:(int)a5
{
  id v8 = (NSURL *)a3;
  v9 = (NSString *)a4;
  configuredImageURL = self->_configuredImageURL;
  self->_configuredImageURL = v8;
  id v11 = v8;

  configuredImageUTI = self->_configuredImageUTI;
  self->_configuredImageUTI = v9;

  self->_configuredExifOrientation = a5;
}

- (void)handleAvailabilityChangeForResource:(id)a3 url:(id)a4 info:(id)a5 error:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  behaviorSpec = self->_behaviorSpec;
  id v14 = a6;
  if ([(PHImageRequestBehaviorSpec *)behaviorSpec isSynchronous])
  {
    uint64_t v15 = v38;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v16 = __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke;
  }
  else
  {
    uint64_t v15 = aBlock;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    v16 = __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke_2;
  }
  v15[2] = v16;
  v15[3] = &unk_1E5848578;
  v15[4] = self;
  char v17 = (void (**)(void))_Block_copy(v15);
  [(PHCompositeMediaResult *)self->_imageResult setError:v14];

  [(PHCompositeMediaResult *)self->_imageResult addInfoFromDictionary:v12];
  id v18 = PLImageManagerGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    id v19 = [(PHMediaRequest *)self identifierString];
    *(_DWORD *)buf = 138412546;
    id v40 = v19;
    __int16 v41 = 2112;
    id v42 = v11;
    _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image request handling resource availabilty at url: %@", buf, 0x16u);
  }
  if (PHImageManagerRecordEnabled())
  {
    uint64_t v32 = [(PHMediaRequest *)self requestID];
    v33 = [(PHMediaRequest *)self identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v32, @"[RM]: %@ Image request handling resource availabilty at url: %@", v33, v11 message];

    if (!v11) {
      goto LABEL_16;
    }
  }
  else if (!v11)
  {
    goto LABEL_16;
  }
  if (![(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadDataOrURL]) {
    goto LABEL_13;
  }
  int v20 = [(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadURL];
  int v21 = [(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadData];
  v22 = [v12 objectForKeyedSubscript:@"PHImageFileUTIKey"];
  uint64_t v23 = [v12 objectForKeyedSubscript:@"PHImageFileOrientationKey"];
  if (!v23)
  {
    char URLIntoResult = _loadURLIntoResult(v20, v21, v11, v22, -1, self);

    if (URLIntoResult) {
      goto LABEL_13;
    }
LABEL_16:
    v17[2](v17);
    goto LABEL_17;
  }
  os_signpost_id_t v24 = (void *)v23;
  [v12 objectForKeyedSubscript:@"PHImageFileOrientationKey"];
  v25 = id v34 = v10;
  [v25 integerValue];
  int v26 = PLExifOrientationFromImageOrientation();
  int v27 = _loadURLIntoResult(v20, v21, v11, v22, v26, self);

  id v10 = v34;
  if (!v27) {
    goto LABEL_16;
  }
LABEL_13:
  if (![(PHImageRequestBehaviorSpec *)self->_behaviorSpec shouldLoadImage]) {
    goto LABEL_16;
  }
  int v29 = (void *)MEMORY[0x1E4F8A950];
  int v30 = [v10 uniformTypeIdentifier];
  v31 = [v30 identifier];
  LODWORD(v29) = [v29 isPrimaryImageFormatForUTI:v31];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke_72;
  v35[3] = &unk_1E58423A8;
  v35[4] = self;
  double v36 = v17;
  PHDecodeImageFromURLForRequest(v11, (int)v29, self, v35, self->_desiredImageSize.width, self->_desiredImageSize.height);

LABEL_17:
}

intptr_t __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 184));
}

void __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke_2(uint64_t a1)
{
}

void __69__PHImageRequest_handleAvailabilityChangeForResource_url_info_error___block_invoke_72(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 144) setImageRef:a2];
    if (a3) {
      [*(id *)(*(void *)(a1 + 32) + 144) setHighDynamicRangeGainMap:a3 orientation:a4 averagePixelLuminance:v9];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __30__PHImageRequest_startRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (PHSignpostEventsEnabled_onceToken != -1) {
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
    }
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      uint64_t v4 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v4 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v5 = v4;
        id v6 = PLImageManagerGetLog();
        uint64_t v7 = [*(id *)(a1 + 32) managerID];
        int v8 = [*(id *)(a1 + 32) requestID];
        uint64_t v9 = [*(id *)(a1 + 32) requestIndex];
        if (os_signpost_enabled(v6))
        {
          *(_DWORD *)buf = 134218752;
          uint64_t v20 = v7;
          __int16 v21 = 2048;
          uint64_t v22 = v8;
          __int16 v23 = 2048;
          uint64_t v24 = v9;
          __int16 v25 = 2048;
          uint64_t v26 = 33;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_EVENT, v5, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
        }
      }
    }
    id v10 = PLImageManagerGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [*(id *)(a1 + 32) identifierString];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v11;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ request vended image from cache", buf, 0xCu);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v15 = [*(id *)(a1 + 32) requestID];
      v16 = [*(id *)(a1 + 32) identifierString];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v15, @"[RM][cache]: %@ request vended image from cache", v16 message];
    }
    [*(id *)(*(void *)(a1 + 32) + 144) setImageRef:a2];
    id v12 = [*(id *)(a1 + 32) delegate];
    [v12 mediaRequest:*(void *)(a1 + 32) didFinishWithResult:*(void *)(*(void *)(a1 + 32) + 144)];
  }
  else
  {
    id v13 = PLImageManagerGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = [*(id *)(a1 + 32) identifierString];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v14;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ cache request was cancelled or errored, restarting request", buf, 0xCu);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v17 = [*(id *)(a1 + 32) requestID];
      id v18 = [*(id *)(a1 + 32) identifierString];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v17, @"[RM][cache]: %@ cache request was cancelled or errored, restarting request", v18 message];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 176) = 1;
    [*(id *)(a1 + 32) startRequest];
  }
}

- (void)configureWithError:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHImageRequest;
  id v4 = a3;
  [(PHMediaRequest *)&v5 configureWithError:v4];
  -[PHCompositeMediaResult setError:](self->_imageResult, "setError:", v4, v5.receiver, v5.super_class);
}

- (void)prepareForRetry
{
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4.receiver = self;
  v4.super_class = (Class)PHImageRequest;
  [(PHMediaRequest *)&v4 cancel];
  [(PHImageDecoderAsyncDecodeRequestHandle *)self->_asyncDecodeRequestHandle cancel];
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)downloadPriority
{
  return [(PHImageRequestBehaviorSpec *)self->_behaviorSpec downloadPriority];
}

- (BOOL)isNetworkAccessAllowed
{
  return [(PHImageRequestBehaviorSpec *)self->_behaviorSpec isNetworkAccessAllowed];
}

- (void)_decodeImageConfiguredWithURL:(id)a3 isPrimaryFormat:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__PHImageRequest__decodeImageConfiguredWithURL_isPrimaryFormat___block_invoke;
  v4[3] = &unk_1E5842338;
  v4[4] = self;
  PHDecodeImageFromURLForRequest(a3, a4, self, v4, self->_desiredImageSize.width, self->_desiredImageSize.height);
}

void __64__PHImageRequest__decodeImageConfiguredWithURL_isPrimaryFormat___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 144) setImageRef:a2];
    if (a3) {
      [*(id *)(*(void *)(a1 + 32) + 144) setHighDynamicRangeGainMap:a3 orientation:a4 averagePixelLuminance:v9];
    }
  }
  _finishRequest(*(void **)(a1 + 32));
}

@end