@interface PHContentEditingInputRequestContext
+ (BOOL)shouldUseRAWResourceAsUnadjustedBaseForAsset:(id)a3 options:(id)a4;
+ (id)contentEditingInputRequestContextForAsset:(id)a3 requestID:(int)a4 managerID:(unint64_t)a5 networkAccessAllowed:(BOOL)a6 downloadIntent:(int64_t)a7 progressHandler:(id)a8 resultHandler:(id)a9;
- (BOOL)_canSkipMediaMetadataCheckWithBaseVersion:(int64_t)a3;
- (BOOL)_shouldRequestImage;
- (BOOL)_shouldRequestVideo;
- (BOOL)isNetworkAccessAllowed;
- (PHContentEditingInputRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 useRAWAsUnadjustedBase:(BOOL)a7 resultHandler:(id)a8;
- (PHContentEditingInputRequestOptions)options;
- (id)_assetResourceForType:(int64_t)a3;
- (id)_assetResources;
- (id)_baseMediaRequestsForBaseVersion:(int64_t)a3 error:(id *)a4;
- (id)_largestUnadjustedDerivativeImageResource;
- (id)_lazyAdjustmentProgress;
- (id)_lazyImageProgress;
- (id)_lazyVideoProgress;
- (id)_resourceRequestForAssetResource:(id)a3 wantsURLOnly:(BOOL)a4 progress:(id)a5;
- (id)_videoBehaviorSpecForBaseVersion:(int64_t)a3;
- (id)initialRequests;
- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6;
- (id)progressHandler;
- (id)progresses;
- (int64_t)_adjustmentBaseVersionFromResult:(id)a3 request:(id)a4 canHandleAdjustmentData:(BOOL *)a5;
- (int64_t)_assetResourceTypeForResourceType:(unsigned int)a3 withBaseVersion:(int64_t)a4;
- (int64_t)downloadIntent;
- (int64_t)type;
- (void)_prepareAndAddMediaRequestsToChildRequests:(id)a3;
- (void)_renderTemporaryVideoForObjectBuilder:(id)a3 resultHandler:(id)a4;
- (void)_renderVideoFromVideoURL:(id)a3 asset:(id)a4 adjustmentData:(id)a5 canHandleAdjustmentData:(BOOL)a6 resultHandler:(id)a7;
- (void)cancel;
- (void)processAndReturnResultsWithRequest:(id)a3;
- (void)processMediaResult:(id)a3 forRequest:(id)a4;
- (void)start;
@end

@implementation PHContentEditingInputRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_imageConversionClient, 0);
  objc_storeStrong((id *)&self->_requestIndexesOfAssetResourceRequests, 0);
  objc_storeStrong((id *)&self->_assetResources, 0);
  objc_storeStrong((id *)&self->_backupChooser, 0);
  objc_storeStrong((id *)&self->_repairRequest, 0);
  objc_storeStrong((id *)&self->_imageProgress, 0);
  objc_storeStrong((id *)&self->_videoProgress, 0);
  objc_storeStrong((id *)&self->_adjustmentProgress, 0);
  objc_storeStrong((id *)&self->_displayImageRequest, 0);
  objc_storeStrong((id *)&self->_videoRequest, 0);
  objc_storeStrong((id *)&self->_adjustmentRequest, 0);

  objc_storeStrong((id *)&self->_contentEditingInputResult, 0);
}

- (PHContentEditingInputRequestOptions)options
{
  return self->_options;
}

- (void)processMediaResult:(id)a3 forRequest:(id)a4
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (PHAdjustmentDataRequest *)a4;
  if ([v7 isInCloud])
  {
    if (([v7 containsValidData] & 1) == 0)
    {
      v9 = [v7 error];

      if (!v9)
      {
        v10 = [(PHContentEditingInputRequestContext *)self options];
        char v11 = [v10 isNetworkAccessAllowed];

        if (v11)
        {
          v12 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v88 = *MEMORY[0x1E4F28568];
          v89[0] = @"Download failed";
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
          v14 = objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v13);
          [v7 setError:v14];
        }
        else
        {
          v15 = PHNetworkAccessAllowedRequiredError();
          [v7 setError:v15];
        }
      }
    }
  }
  if (self->_adjustmentRequest == v8)
  {
    v19 = PLImageManagerGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = [(PHMediaRequest *)v8 identifierString];
      v21 = [v7 info];
      *(_DWORD *)buf = 138412802;
      v83 = v20;
      __int16 v84 = 2112;
      uint64_t v85 = (uint64_t)v7;
      __int16 v86 = 2112;
      v87 = v21;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEBUG, "[RM] %@ Content editing adjustment data request finished with result: %@, info: %@", buf, 0x20u);
    }
    v16 = [(PHContentEditingInputRequestContext *)self _lazyAdjustmentProgress];
    [(PHAdjustmentDataRequest *)v16 setCompletedUnitCount:[(PHAdjustmentDataRequest *)v16 totalUnitCount]];
    os_unfair_lock_lock(&self->_lock);
    [(PHContentEditingInputResult *)self->_contentEditingInputResult addAdjustmentDataResult:v7];
    unint64_t v22 = self->_inflightMediaRequestCount - 1;
    self->_inflightMediaRequestCount = v22;
    os_unfair_lock_unlock(&self->_lock);
    if (v22) {
      goto LABEL_51;
    }
    v23 = self;
    v24 = v8;
    goto LABEL_50;
  }
  if ((PHAdjustmentDataRequest *)self->_displayImageRequest == v8)
  {
    v25 = PLImageManagerGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = [(PHMediaRequest *)v8 identifierString];
      v27 = [v7 info];
      *(_DWORD *)buf = 138412802;
      v83 = v26;
      __int16 v84 = 2112;
      uint64_t v85 = (uint64_t)v7;
      __int16 v86 = 2112;
      v87 = v27;
      _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEBUG, "[RM] %@ Content editing image request finished with result: %@, info: %@", buf, 0x20u);
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    [(PHContentEditingInputResult *)self->_contentEditingInputResult addImageResult:v7];
LABEL_69:
    unint64_t v66 = self->_inflightMediaRequestCount - 1;
    self->_inflightMediaRequestCount = v66;
    os_unfair_lock_unlock(p_lock);
    if (v66) {
      goto LABEL_71;
    }
LABEL_70:
    [(PHContentEditingInputRequestContext *)self processAndReturnResultsWithRequest:v8];
    goto LABEL_71;
  }
  if ((PHAdjustmentDataRequest *)self->_videoRequest != v8)
  {
    if ([(NSMutableIndexSet *)self->_requestIndexesOfAssetResourceRequests containsIndex:[(PHMediaRequest *)v8 requestIndex]])
    {
      v16 = v8;
      if (([v7 containsValidData] & 1) == 0)
      {
        v51 = PLImageManagerGetLog();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = [v7 error];
          *(_DWORD *)buf = 138412290;
          v83 = v52;
          _os_log_impl(&dword_19B043000, v51, OS_LOG_TYPE_ERROR, "Media resource request failed to return valid data or url with error: %@", buf, 0xCu);
        }
        v53 = [v7 error];

        if (!v53)
        {
          v54 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v80 = *MEMORY[0x1E4F28228];
          v55 = NSString;
          v56 = [(PHMediaRequest *)v16 identifierString];
          v57 = [v55 stringWithFormat:@"request %@ failed but did not provide error,", v56];
          v81 = v57;
          v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
          v59 = objc_msgSend(v54, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3303, v58);
          [v7 setError:v59];
        }
        [(PHContentEditingInputResult *)self->_contentEditingInputResult mergeInfoDictionaryFromResult:v7];
        goto LABEL_48;
      }
      uint64_t v17 = [(PHAdjustmentDataRequest *)v16 resourceType];
      if (v17 > 102)
      {
        if ((unint64_t)(v17 - 104) < 2)
        {
          v18 = PLImageManagerGetLog();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_90;
          }
          v71 = [(PHMediaRequest *)v16 identifierString];
          *(_DWORD *)buf = 138412290;
          v83 = v71;
          v72 = "[RM] %@ Content editing found renderable media metadata";
          v73 = v18;
          os_log_type_t v74 = OS_LOG_TYPE_DEBUG;
          uint32_t v75 = 12;
LABEL_89:
          _os_log_impl(&dword_19B043000, v73, v74, v72, buf, v75);

          goto LABEL_90;
        }
        if (v17 == 103) {
          goto LABEL_59;
        }
        if (v17 == 110)
        {
          os_unfair_lock_lock(&self->_lock);
          [(PHContentEditingInputResult *)self->_contentEditingInputResult addAdjustmentSecondaryDataResult:v7];
          os_unfair_lock_unlock(&self->_lock);
          goto LABEL_48;
        }
      }
      else if ((unint64_t)v17 <= 0x10)
      {
        if (((1 << v17) & 0xFE44) == 0)
        {
          if (((1 << v17) & 0x132) == 0)
          {
            if (v17 == 16)
            {
              v18 = [v7 adjustmentData];
              [(PHContentEditingInputResult *)self->_contentEditingInputResult setOriginalAdjustmentData:v18];
LABEL_90:

              goto LABEL_48;
            }
            goto LABEL_87;
          }
LABEL_59:
          if ([(PHMediaRequest *)v16 requestIndex] == self->_imageBaseRequestIndex)
          {
            v63 = PLImageManagerGetLog();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              v64 = [(PHMediaRequest *)v16 identifierString];
              v65 = [v7 info];
              *(_DWORD *)buf = 138412802;
              v83 = v64;
              __int16 v84 = 2112;
              uint64_t v85 = (uint64_t)v7;
              __int16 v86 = 2112;
              v87 = v65;
              _os_log_impl(&dword_19B043000, v63, OS_LOG_TYPE_DEBUG, "[RM] %@ Content editing resource request for base image finished with result: %@, info: %@", buf, 0x20u);
            }
            [(PHContentEditingInputResult *)self->_contentEditingInputResult addImageResult:v7];
          }
        }
LABEL_48:
        os_unfair_lock_lock(&self->_lock);
        unint64_t v60 = self->_inflightMediaRequestCount - 1;
        self->_inflightMediaRequestCount = v60;
        os_unfair_lock_unlock(&self->_lock);
        if (v60)
        {
LABEL_51:

          goto LABEL_71;
        }
        v23 = self;
        v24 = v16;
LABEL_50:
        [(PHContentEditingInputRequestContext *)v23 processAndReturnResultsWithRequest:v24];
        goto LABEL_51;
      }
LABEL_87:
      v18 = PLImageManagerGetLog();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_90;
      }
      v71 = [(PHMediaRequest *)v16 identifierString];
      *(_DWORD *)buf = 138412546;
      v83 = v71;
      __int16 v84 = 2048;
      uint64_t v85 = [(PHAdjustmentDataRequest *)v16 resourceType];
      v72 = "[RM] %@ Content editing made request for invalid resource type for edit: %lu";
      v73 = v18;
      os_log_type_t v74 = OS_LOG_TYPE_ERROR;
      uint32_t v75 = 22;
      goto LABEL_89;
    }
    if ((PHAdjustmentDataRequest *)self->_repairRequest == v8)
    {
      v36 = PLImageManagerGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = [(PHMediaRequest *)v8 identifierString];
        v38 = [v7 error];
        if (v38)
        {
          v39 = NSString;
          v4 = [v7 error];
          v40 = [v39 stringWithFormat:@" with error: %@", v4];
        }
        else
        {
          v40 = &stru_1EEAC1950;
        }
        *(_DWORD *)buf = 138412546;
        v83 = v37;
        __int16 v84 = 2112;
        uint64_t v85 = (uint64_t)v40;
        _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_DEFAULT, "[RM] %@ repair request finished%@", buf, 0x16u);
        if (v38)
        {
        }
      }
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    goto LABEL_69;
  }
  v29 = PLImageManagerGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v30 = [(PHMediaRequest *)v8 identifierString];
    v31 = [v7 info];
    *(_DWORD *)buf = 138412802;
    v83 = v30;
    __int16 v84 = 2112;
    uint64_t v85 = (uint64_t)v7;
    __int16 v86 = 2112;
    v87 = v31;
    _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_DEBUG, "[RM] %@ Content editing video request finished with result: %@, info: %@", buf, 0x20u);
  }
  if (![v7 containsValidData])
  {
    os_unfair_lock_lock(&self->_lock);
    unint64_t v41 = self->_inflightMediaRequestCount - 1;
    self->_inflightMediaRequestCount = v41;
    v42 = [(PHMediaRequestContext *)self asset];
    if ([v42 isPhotoIris])
    {
      v43 = [(PHMediaRequestContext *)self asset];
      if (![v43 canPlayPhotoIris])
      {
        v61 = [(PHVideoRequest *)self->_videoRequest behaviorSpec];
        uint64_t v62 = [v61 version];

        if (v62 != 1)
        {
          v48 = PLImageManagerGetLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = [(PHMediaRequest *)v8 identifierString];
            *(_DWORD *)buf = 138412290;
            v83 = v49;
            v50 = "[RM] %@ Live photo edit request continuing with missing video, reason: unplayable";
            goto LABEL_79;
          }
LABEL_80:

          goto LABEL_83;
        }
LABEL_37:
        v44 = [(PHMediaRequestContext *)self asset];
        if ([v44 isPhotoIris])
        {
          v45 = [(PHVideoRequest *)self->_videoRequest behaviorSpec];
          if ([v45 version] == 8)
          {
            v46 = [v7 error];
            if ([v46 code] == 3303)
            {
              char v47 = [v7 isInCloud];

              if ((v47 & 1) == 0)
              {
                v48 = PLImageManagerGetLog();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                {
                  v49 = [(PHMediaRequest *)v8 identifierString];
                  *(_DWORD *)buf = 138412290;
                  v83 = v49;
                  v50 = "[RM] %@ Live photo edit request continuing with missing video, reason: missing penultimate";
LABEL_79:
                  _os_log_impl(&dword_19B043000, v48, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);

                  goto LABEL_80;
                }
                goto LABEL_80;
              }
LABEL_75:
              v67 = [(PHMediaRequestContext *)self asset];
              if ([v67 isPhotoIris])
              {
                v68 = [v7 error];
                v69 = [v68 userInfo];
                v70 = [v69 objectForKeyedSubscript:*MEMORY[0x1E4F8B7B0]];

                if (v70)
                {
                  v48 = PLImageManagerGetLog();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
                  {
                    v49 = [(PHMediaRequest *)v8 identifierString];
                    *(_DWORD *)buf = 138412290;
                    v83 = v49;
                    v50 = "[RM] %@ Live photo edit request continuing with missing video, reason: zero videos found";
                    goto LABEL_79;
                  }
                  goto LABEL_80;
                }
              }
              else
              {
              }
              [(PHContentEditingInputResult *)self->_contentEditingInputResult addVideoResult:v7];
LABEL_83:
              os_unfair_lock_unlock(&self->_lock);
              if (v41) {
                goto LABEL_71;
              }
              goto LABEL_70;
            }
          }
        }

        goto LABEL_75;
      }
    }
    goto LABEL_37;
  }
  v32 = [v7 videoURL];
  v33 = [(PHMediaRequestContext *)self asset];
  v34 = [v7 videoAdjustmentData];
  BOOL v35 = [(PHContentEditingInputResult *)self->_contentEditingInputResult canHandleAdjustmentData];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __69__PHContentEditingInputRequestContext_processMediaResult_forRequest___block_invoke;
  v76[3] = &unk_1E58472F0;
  id v77 = v7;
  v78 = self;
  v79 = v8;
  [(PHContentEditingInputRequestContext *)self _renderVideoFromVideoURL:v32 asset:v33 adjustmentData:v34 canHandleAdjustmentData:v35 resultHandler:v76];

LABEL_71:
}

void __69__PHContentEditingInputRequestContext_processMediaResult_forRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = *(id *)(a1 + 32);
  id v6 = a3;
  [v9 setVideoURL:a2];
  [v9 setErrorIfNone:v6];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 200));
  --*(void *)(*(void *)(a1 + 40) + 208);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(v7 + 208);
  [*(id *)(v7 + 152) addVideoResult:v9];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 200));
  if (!v8) {
    [*(id *)(a1 + 40) processAndReturnResultsWithRequest:*(void *)(a1 + 48)];
  }
}

- (void)processAndReturnResultsWithRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLImageManagerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v12 = 134218240;
    *(void *)&v12[4] = [(PHMediaRequestContext *)self managerID];
    __int16 v13 = 2048;
    uint64_t v14 = [(PHMediaRequestContext *)self requestID];
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld All content editing requests complete, building content editing input", v12, 0x16u);
  }

  uint64_t v6 = [(PHContentEditingInputRequestOptions *)self->_options progressHandler];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    [(PHMediaRequestContext *)self totalProgressFraction];
    double v9 = v8;

    if (v9 < 1.0)
    {
      v12[0] = 0;
      v10 = [(PHContentEditingInputRequestOptions *)self->_options progressHandler];
      ((void (**)(void, unsigned char *, double))v10)[2](v10, v12, 1.0);
    }
  }
  resultHandler = (void (**)(id, PHContentEditingInputResult *, id, PHContentEditingInputRequestContext *))self->super._resultHandler;
  if (resultHandler) {
    resultHandler[2](resultHandler, self->_contentEditingInputResult, v4, self);
  }
}

- (id)progresses
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(PHContentEditingInputRequestContext *)self _lazyAdjustmentProgress];
  v5 = [v3 arrayWithObject:v4];

  if ([(PHContentEditingInputRequestContext *)self _shouldRequestImage])
  {
    uint64_t v6 = [(PHContentEditingInputRequestContext *)self _lazyImageProgress];
    [v5 addObject:v6];
  }
  if ([(PHContentEditingInputRequestContext *)self _shouldRequestVideo])
  {
    uint64_t v7 = [(PHContentEditingInputRequestContext *)self _lazyVideoProgress];
    [v5 addObject:v7];
  }

  return v5;
}

- (id)progressHandler
{
  v2 = [(PHContentEditingInputRequestOptions *)self->_options progressHandler];
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__PHContentEditingInputRequestContext_progressHandler__block_invoke;
    aBlock[3] = &unk_1E58472C8;
    id v7 = v2;
    id v4 = _Block_copy(aBlock);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __54__PHContentEditingInputRequestContext_progressHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)produceChildRequestsForRequest:(id)a3 reportingIsLocallyAvailable:(BOOL)a4 isDegraded:(BOOL)a5 result:(id)a6
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  double v8 = (PHRepairRequest *)a3;
  id v9 = a6;
  BOOL v10 = [(PHMediaRequestContext *)self isCancelled];
  char v11 = 0;
  if (v9 && !v10)
  {
    char v11 = [MEMORY[0x1E4F1CA48] array];
    if ((PHRepairRequest *)self->_adjustmentRequest == v8)
    {
      unsigned __int8 v74 = 0;
      int64_t v25 = [(PHContentEditingInputRequestContext *)self _adjustmentBaseVersionFromResult:v9 request:v8 canHandleAdjustmentData:&v74];
      contentEditingInputResult = self->_contentEditingInputResult;
      v27 = [NSNumber numberWithInteger:v25];
      [(PHContentEditingInputResult *)contentEditingInputResult setBaseVersionNeeded:v27];

      [(PHContentEditingInputResult *)self->_contentEditingInputResult setCanHandleAdjustmentData:v74];
      if (!v25)
      {
        v28 = [(PHContentEditingInputRequestContext *)self _assetResourceForType:16];
        if (v28)
        {
          v29 = [(PHContentEditingInputRequestContext *)self _lazyAdjustmentProgress];
          v30 = [(PHContentEditingInputRequestContext *)self _resourceRequestForAssetResource:v28 wantsURLOnly:0 progress:v29];

          [v11 addObject:v30];
          v31 = PLImageManagerGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v32 = [v30 identifierString];
            *(_DWORD *)buf = 138412290;
            v76 = v32;
            _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_DEBUG, "[RM] %@ Base version is unadjusted, starting request for original adjustment envelope", buf, 0xCu);
          }
        }
      }
      if (![(PHContentEditingInputRequestContext *)self _canSkipMediaMetadataCheckWithBaseVersion:v25])
      {
        uint64_t v33 = v25 ? 105 : 104;
        uint64_t v34 = [(PHContentEditingInputRequestContext *)self _assetResourceForType:v33];
        if (v34)
        {
          BOOL v35 = (void *)v34;
          v36 = [(PHContentEditingInputRequestContext *)self _resourceRequestForAssetResource:v34 wantsURLOnly:0 progress:0];
          [v11 addObject:v36];

LABEL_31:
          os_unfair_lock_lock(&self->_lock);
          self->_inflightMediaRequestCount += [v11 count];
          os_unfair_lock_unlock(&self->_lock);
          goto LABEL_32;
        }
      }
    }
    else if (self->_repairRequest == v8)
    {
      v37 = [(PHMediaRequestContext *)self asset];
      v38 = +[PHAssetResource assetResourcesForAsset:v37 includeDerivatives:1 includeMetadata:1];
      assetResources = self->_assetResources;
      self->_assetResources = v38;
    }
    else if (![(NSMutableIndexSet *)self->_requestIndexesOfAssetResourceRequests containsIndex:[(PHMediaRequest *)v8 requestIndex]]|| [(PHRepairRequest *)v8 resourceType] != 104&& [(PHRepairRequest *)v8 resourceType] != 105)
    {
      if ([(PHMediaRequest *)v8 requestIndex] == self->_imageBaseRequestIndex)
      {
        v12 = [v9 imageURL];

        if (v12)
        {
          __int16 v13 = v8;
          uint64_t v14 = (void *)MEMORY[0x1E4F442D8];
          uint64_t v15 = [v9 uniformTypeIdentifier];
          v16 = [v14 typeWithIdentifier:v15];
          int v17 = [v16 conformsToType:*MEMORY[0x1E4F44498]];

          options = self->_options;
          if (v17)
          {
            v19 = [(PHContentEditingInputRequestOptions *)options canHandleRAW];

            if (v19)
            {
              v20 = [v9 imagePropertiesLoadIfNeeded:1];
              v21 = [(PHContentEditingInputRequestOptions *)self->_options canHandleRAW];
              char v22 = ((uint64_t (**)(void, void *))v21)[2](v21, v20);

              if ((v22 & 1) == 0)
              {
                v23 = PLImageManagerGetLog();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                {
                  v24 = [(PHMediaRequest *)v13 identifierString];
                  *(_DWORD *)buf = 138412290;
                  v76 = v24;
                  _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEBUG, "[RM] %@ Image request for RAW completed, but client decided that this RAW is invalid, re-requesting JPEG", buf, 0xCu);
                }
                if ([(PHRepairRequest *)v13 resourceType] == 4) {
                  [(PHContentEditingInputRequestContext *)self _assetResourceForType:1];
                }
                else {
                unint64_t v66 = [(PHContentEditingInputRequestContext *)self _largestUnadjustedDerivativeImageResource];
                }
                if (v66)
                {
                  v67 = [(PHContentEditingInputRequestContext *)self _resourceRequestForAssetResource:v66 wantsURLOnly:1 progress:0];
                  [v11 addObject:v67];
                  self->_imageBaseRequestIndex = [v67 requestIndex];
                }
                else
                {
                  v67 = PLImageManagerGetLog();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
                  {
                    v68 = [(PHMediaRequest *)v13 identifierString];
                    *(_DWORD *)buf = 138412290;
                    v76 = v68;
                    _os_log_impl(&dword_19B043000, v67, OS_LOG_TYPE_ERROR, "%@ Client decided that this RAW is invalid, but no unadjusted JPEG resources available, returning the RAW anyway", buf, 0xCu);
                  }
                }
              }
            }
          }
          else if (![(PHContentEditingInputRequestOptions *)options skipDisplaySizeImage])
          {
            unint64_t v41 = [PHImageDisplaySpec alloc];
            [(PHContentEditingInputRequestOptions *)self->_options targetSize];
            uint64_t v71 = -[PHImageDisplaySpec initWithTargetSize:contentMode:](v41, "initWithTargetSize:contentMode:", [(PHContentEditingInputRequestOptions *)self->_options contentMode], v42, v43);
            v44 = [(PHContentEditingInputResult *)self->_contentEditingInputResult baseVersionNeeded];
            uint64_t v45 = [v44 integerValue];

            BOOL v46 = [(PHContentEditingInputRequestContext *)self isNetworkAccessAllowed];
            v73 = v13;
            int64_t v47 = [(PHContentEditingInputRequestContext *)self downloadIntent];
            BOOL useRAWAsUnadjustedBase = self->_useRAWAsUnadjustedBase;
            v49 = [(PHMediaRequestContext *)self asset];
            v50 = +[PHImageRequestBehaviorSpec contentEditingInputImageBehaviorSpecForBaseVersion:v45 isNetworkAccessAllowed:v46 downloadIntent:v47 shouldUseRAWAsUnadjustedBase:useRAWAsUnadjustedBase asset:v49];

            [v50 setLoadingOptions:1];
            [v50 setResizeMode:2];
            v69 = [PHImageRequest alloc];
            uint64_t v51 = [(PHMediaRequestContext *)self requestID];
            unint64_t v52 = [(PHMediaRequestContext *)self nextRequestIndex];
            unint64_t v53 = [(PHMediaRequestContext *)self managerID];
            v54 = [(PHMediaRequestContext *)self asset];
            v55 = [(PHMediaRequestContext *)self imageResourceChooser];
            v72 = v50;
            unint64_t v56 = v52;
            v57 = (void *)v71;
            v58 = [(PHImageRequest *)v69 initWithRequestID:v51 requestIndex:v56 contextType:4 managerID:v53 asset:v54 displaySpec:v71 behaviorSpec:v50 chooser:v55 delegate:self];
            displayImageRequest = self->_displayImageRequest;
            self->_displayImageRequest = v58;

            __int16 v13 = v73;
            unint64_t v60 = (void *)MEMORY[0x1E4F8A950];
            v61 = [(PHRepairRequest *)v73 resource];
            uint64_t v62 = [v61 uniformTypeIdentifier];
            LODWORD(v60) = [v60 isPrimaryImageFormatForUTI:v62];

            if (v60)
            {
              v70 = self->_displayImageRequest;
              v63 = [v9 imageURL];
              v64 = [v9 uniformTypeIdentifier];
              v65 = [v9 exifOrientation];
              -[PHImageRequest configureWithURL:uniformTypeIdentifier:exifOrientation:](v70, "configureWithURL:uniformTypeIdentifier:exifOrientation:", v63, v64, [v65 intValue]);

              v57 = (void *)v71;
            }
            [v11 addObject:self->_displayImageRequest];
          }
        }
      }
      goto LABEL_31;
    }
    [(PHContentEditingInputRequestContext *)self _prepareAndAddMediaRequestsToChildRequests:v11];
    goto LABEL_31;
  }
LABEL_32:

  return v11;
}

- (id)initialRequests
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(PHAdjustmentDataRequestBehaviorSpec);
  [(PHAdjustmentDataRequestBehaviorSpec *)v3 setNetworkAccessAllowed:[(PHContentEditingInputRequestOptions *)self->_options isNetworkAccessAllowed]];
  id v4 = [PHAdjustmentDataRequest alloc];
  uint64_t v5 = [(PHMediaRequestContext *)self requestID];
  unint64_t v6 = [(PHMediaRequestContext *)self nextRequestIndex];
  int64_t v7 = [(PHContentEditingInputRequestContext *)self type];
  unint64_t v8 = [(PHMediaRequestContext *)self managerID];
  id v9 = [(PHMediaRequestContext *)self asset];
  BOOL v10 = [(PHAdjustmentDataRequest *)v4 initWithRequestID:v5 requestIndex:v6 contextType:v7 managerID:v8 asset:v9 behaviorSpec:v3 delegate:self];
  adjustmentRequest = self->_adjustmentRequest;
  self->_adjustmentRequest = v10;

  os_unfair_lock_lock(&self->_lock);
  ++self->_inflightMediaRequestCount;
  os_unfair_lock_unlock(&self->_lock);
  v12 = [(PHContentEditingInputRequestContext *)self _lazyAdjustmentProgress];
  __int16 v13 = [(PHMediaRequest *)self->_adjustmentRequest identifierString];
  [(PHMediaRequestContext *)self setProgress:v12 forRequestIdentifier:v13];

  v16[0] = self->_adjustmentRequest;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  return v14;
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)PHContentEditingInputRequestContext;
  [(PHMediaRequestContext *)&v3 cancel];
  os_unfair_lock_lock(&self->_lock);
  [(PHCompositeMediaResult *)self->_contentEditingInputResult setCancelled:1];
  os_unfair_lock_unlock(&self->_lock);
}

- (int64_t)downloadIntent
{
  int64_t result = [(PHContentEditingInputRequestOptions *)self->_options downloadIntent];
  if (!result) {
    return 4;
  }
  return result;
}

- (BOOL)isNetworkAccessAllowed
{
  return [(PHContentEditingInputRequestOptions *)self->_options isNetworkAccessAllowed];
}

- (int64_t)type
{
  return 4;
}

- (void)start
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = PLImageManagerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v19 = [(PHMediaRequestContext *)self managerID];
    uint64_t v18 = [(PHMediaRequestContext *)self requestID];
    v20 = [(PHMediaRequestContext *)self asset];
    uint64_t v5 = [v20 uuid];
    unint64_t v6 = [(PHContentEditingInputRequestContext *)self options];
    int64_t v7 = @"N";
    unint64_t v8 = @"Y";
    if ([v6 isNetworkAccessAllowed]) {
      id v9 = @"Y";
    }
    else {
      id v9 = @"N";
    }
    int v17 = v9;
    BOOL v10 = [(PHContentEditingInputRequestContext *)self options];
    if (![v10 forceRunAsUnadjustedAsset]) {
      unint64_t v8 = @"N";
    }
    char v11 = [(PHContentEditingInputRequestContext *)self options];
    int v12 = [v11 shouldForceOriginalChoice];
    if (v12)
    {
      __int16 v13 = NSString;
      v16 = [(PHContentEditingInputRequestContext *)self options];
      unint64_t v14 = [v16 originalChoice];
      if (v14 > 3) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = off_1E5845480[v14];
      }
      v2 = v15;
      int64_t v7 = [v13 stringWithFormat:@"Y (%@)", v2];
    }
    *(_DWORD *)buf = 134350338;
    unint64_t v23 = v19;
    __int16 v24 = 2050;
    uint64_t v25 = v18;
    __int16 v26 = 2114;
    v27 = v5;
    __int16 v28 = 2114;
    v29 = v17;
    __int16 v30 = 2114;
    v31 = v8;
    __int16 v32 = 2114;
    uint64_t v33 = v7;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEFAULT, "[RM] %{public}ld-%{public}ld starting edit request for asset %{public}@, net: %{public}@, force unadjusted: %{public}@, set original choice: %{public}@", buf, 0x3Eu);
    if (v12)
    {
    }
  }

  v21.receiver = self;
  v21.super_class = (Class)PHContentEditingInputRequestContext;
  [(PHMediaRequestContext *)&v21 start];
}

- (id)_resourceRequestForAssetResource:(id)a3 wantsURLOnly:(BOOL)a4 progress:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    unint64_t v10 = [(PHMediaRequestContext *)self nextRequestIndex];
    id v26 = v9;
    id v27 = v8;
    char v11 = [PHMediaResourceRequest alloc];
    uint64_t v12 = [(PHMediaRequestContext *)self requestID];
    int64_t v13 = [(PHContentEditingInputRequestContext *)self type];
    unint64_t v14 = [(PHMediaRequestContext *)self managerID];
    uint64_t v15 = [(PHMediaRequestContext *)self asset];
    v16 = [(PHContentEditingInputRequestContext *)self options];
    char v17 = [v16 isNetworkAccessAllowed];
    LOWORD(v25) = a4;
    int64_t v24 = [(PHContentEditingInputRequestContext *)self downloadIntent];
    LOBYTE(v23) = v17;
    uint64_t v18 = v11;
    id v9 = v26;
    id v8 = v27;
    unint64_t v19 = -[PHMediaResourceRequest initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:](v18, "initWithRequestID:requestIndex:contextType:managerID:asset:assetResource:networkAccessAllowed:downloadIntent:downloadPriority:wantsURLOnly:synchronous:delegate:", v12, v10, v13, v14, v15, v27, v23, v24, 0, v25, self);

    [(NSMutableIndexSet *)self->_requestIndexesOfAssetResourceRequests addIndex:v10];
    if (v26)
    {
      v20 = [(PHMediaRequest *)v19 identifierString];
      [(PHMediaRequestContext *)self setProgress:v26 forRequestIdentifier:v20];
      objc_initWeak(&location, self);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __94__PHContentEditingInputRequestContext__resourceRequestForAssetResource_wantsURLOnly_progress___block_invoke;
      v28[3] = &unk_1E58472A0;
      objc_copyWeak(&v30, &location);
      id v21 = v20;
      id v29 = v21;
      [(PHMediaResourceRequest *)v19 setProgressHandler:v28];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }

  return v19;
}

void __94__PHContentEditingInputRequestContext__resourceRequestForAssetResource_wantsURLOnly_progress___block_invoke(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  int64_t v7 = (id *)(a1 + 40);
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained requestWithIdentifier:*(void *)(a1 + 32) didReportProgress:a2 completed:v8 error:a4];
}

- (id)_largestUnadjustedDerivativeImageResource
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(PHContentEditingInputRequestContext *)self _assetResources];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v3)
  {
    uint64_t v5 = 0;
    goto LABEL_19;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v2);
      }
      id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      id v9 = [v8 backingResourceIdentity];
      int v10 = [v9 version];

      if (!v10)
      {
        if ([v8 cplResourceType] == 2) {
          goto LABEL_14;
        }
        if ([v8 cplResourceType] == 3)
        {
          if ([v5 cplResourceType] != 2) {
            goto LABEL_14;
          }
        }
        else if ([v8 cplResourceType] == 4 {
               && [v5 cplResourceType] != 2
        }
               && [v5 cplResourceType] != 3)
        {
LABEL_14:
          id v11 = v8;

          uint64_t v5 = v11;
          continue;
        }
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v4);
LABEL_19:

  return v5;
}

- (id)_assetResourceForType:(int64_t)a3
{
  uint64_t v4 = [(PHContentEditingInputRequestContext *)self _assetResources];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PHContentEditingInputRequestContext__assetResourceForType___block_invoke;
  v8[3] = &__block_descriptor_40_e32_B32__0__PHAssetResource_8Q16_B24l;
  v8[4] = a3;
  uint64_t v5 = [v4 indexOfObjectPassingTest:v8];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [v4 objectAtIndexedSubscript:v5];
  }

  return v6;
}

BOOL __61__PHContentEditingInputRequestContext__assetResourceForType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)_assetResources
{
  assetResources = self->_assetResources;
  if (!assetResources)
  {
    uint64_t v4 = [(PHMediaRequestContext *)self asset];
    uint64_t v5 = +[PHAssetResource assetResourcesForAsset:v4 includeDerivatives:1 includeMetadata:1];
    uint64_t v6 = self->_assetResources;
    self->_assetResources = v5;

    assetResources = self->_assetResources;
  }

  return assetResources;
}

- (int64_t)_assetResourceTypeForResourceType:(unsigned int)a3 withBaseVersion:(int64_t)a4
{
  if (a3 == 3)
  {
    int64_t v8 = 9;
    if (a4 == 2) {
      int64_t v8 = 10;
    }
    BOOL v9 = a4 == 1;
    int64_t v10 = 11;
  }
  else
  {
    if (a3 != 1)
    {
      if (a3)
      {
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(void *)&a3, a4);
        [v12 handleFailureInMethod:a2, self, @"PHContentEditingInputRequestContext.m", 576, @"Invalid resource type, valid options are image, video, or video complement" object file lineNumber description];
      }
      else
      {
        if (a4 == 2) {
          return 5;
        }
        if (a4 == 1) {
          return 8;
        }
        if (!a4 && self->_useRAWAsUnadjustedBase)
        {
          uint64_t v5 = [(PHMediaRequestContext *)self asset];
          int v6 = [v5 isRAWPlusJPEG];

          if (v6) {
            return 4;
          }
          else {
            return 1;
          }
        }
      }
      return 1;
    }
    int64_t v8 = 2;
    if (a4 == 2) {
      int64_t v8 = 6;
    }
    BOOL v9 = a4 == 1;
    int64_t v10 = 12;
  }
  if (v9) {
    return v10;
  }
  else {
    return v8;
  }
}

- (void)_prepareAndAddMediaRequestsToChildRequests:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PHContentEditingInputResult *)self->_contentEditingInputResult baseVersionNeeded];
  uint64_t v6 = [v5 integerValue];

  id v48 = 0;
  int64_t v7 = [(PHContentEditingInputRequestContext *)self _baseMediaRequestsForBaseVersion:v6 error:&v48];
  int64_t v8 = (__CFString *)v48;
  if (v7) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6 == 1;
  }
  if (v9)
  {
    BOOL v10 = [(PHContentEditingInputRequestOptions *)self->_options disallowFallbackAdjustmentBase];
    id v11 = PLImageManagerGetLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (v12)
      {
        unint64_t v13 = [(PHMediaRequestContext *)self managerID];
        uint64_t v14 = [(PHMediaRequestContext *)self requestID];
        long long v15 = @"penultimate";
        *(_DWORD *)buf = 134218754;
        unint64_t v50 = v13;
        __int16 v51 = 2048;
        uint64_t v52 = v14;
        __int16 v53 = 2114;
        v54 = @"penultimate";
        __int16 v55 = 2112;
        unint64_t v56 = v8;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "[RM] %ld-%ld Could not find media with base version %{public}@, error: %@", buf, 0x2Au);
      }
      goto LABEL_28;
    }
    if (v12)
    {
      unint64_t v16 = [(PHMediaRequestContext *)self managerID];
      uint64_t v17 = [(PHMediaRequestContext *)self requestID];
      uint64_t v18 = @"penultimate";
      unint64_t v19 = @"current";
      *(_DWORD *)buf = 134218754;
      unint64_t v50 = v16;
      __int16 v51 = 2048;
      uint64_t v52 = v17;
      __int16 v53 = 2114;
      v54 = @"penultimate";
      __int16 v55 = 2114;
      unint64_t v56 = @"current";
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "[RM] %ld-%ld Could not find media with base version %{public}@, retrying with base version %{public}@", buf, 0x2Au);
    }
    int64_t v47 = v8;
    int64_t v7 = [(PHContentEditingInputRequestContext *)self _baseMediaRequestsForBaseVersion:2 error:&v47];
    v20 = v47;

    if (!v7)
    {
      int64_t v8 = v20;
LABEL_28:
      v31 = PLImageManagerGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        unint64_t v32 = [(PHMediaRequestContext *)self managerID];
        int v33 = [(PHMediaRequestContext *)self requestID];
        *(_DWORD *)buf = 134218240;
        unint64_t v50 = v32;
        __int16 v51 = 2048;
        uint64_t v52 = v33;
        _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_ERROR, "[RM] %ld-%ld No media requests", buf, 0x16u);
      }

      [(PHCompositeMediaResult *)self->_contentEditingInputResult setErrorIfNone:v8];
      goto LABEL_51;
    }
    [(PHContentEditingInputResult *)self->_contentEditingInputResult clearAdjustmentData];
    uint64_t v6 = 2;
    int64_t v8 = v20;
  }
  else if (!v7)
  {
    goto LABEL_28;
  }
  contentEditingInputResult = self->_contentEditingInputResult;
  char v22 = [NSNumber numberWithInteger:v6];
  [(PHContentEditingInputResult *)contentEditingInputResult setBaseVersionNeeded:v22];

  [v4 addObjectsFromArray:v7];
  if ([(PHContentEditingInputRequestContext *)self _shouldRequestVideo])
  {
    uint64_t v23 = [(PHMediaRequestContext *)self asset];
    if ([v23 isPhotoIris]) {
      uint64_t v24 = 15;
    }
    else {
      uint64_t v24 = 14;
    }

    uint64_t v25 = [(PHContentEditingInputRequestContext *)self _assetResourceForType:v24];
    if (v25)
    {
      id v26 = [(PHContentEditingInputRequestContext *)self _resourceRequestForAssetResource:v25 wantsURLOnly:1 progress:0];
      [v4 addObject:v26];
    }
    if ([(PHContentEditingInputRequestOptions *)self->_options requireOriginalsDownloaded])
    {
      id v27 = [(PHMediaRequestContext *)self asset];
      if ([v27 isPhotoIris]) {
        uint64_t v28 = 9;
      }
      else {
        uint64_t v28 = 2;
      }

      uint64_t v29 = [(PHContentEditingInputRequestContext *)self _assetResourceForType:v28];

      if (v29)
      {
        id v30 = [(PHContentEditingInputRequestContext *)self _resourceRequestForAssetResource:v29 wantsURLOnly:1 progress:0];
        [v4 addObject:v30];

        uint64_t v25 = (void *)v29;
      }
      else
      {
        uint64_t v25 = 0;
      }
    }
  }
  if ([(PHContentEditingInputRequestContext *)self _shouldRequestImage])
  {
    uint64_t v34 = [(PHContentEditingInputRequestContext *)self _assetResourceForType:13];
    if (v34)
    {
      BOOL v35 = [(PHContentEditingInputRequestContext *)self _resourceRequestForAssetResource:v34 wantsURLOnly:1 progress:0];
      [v4 addObject:v35];
    }
    if ([(PHContentEditingInputRequestOptions *)self->_options requireOriginalsDownloaded])
    {
      v36 = [(PHContentEditingInputRequestContext *)self _assetResourceForType:1];

      if (v36)
      {
        v37 = [(PHContentEditingInputRequestContext *)self _resourceRequestForAssetResource:v36 wantsURLOnly:1 progress:0];
        [v4 addObject:v37];
      }
      v38 = [(PHMediaRequestContext *)self asset];
      int v39 = [v38 isRAWPlusJPEG];

      if (v39)
      {
        uint64_t v34 = [(PHContentEditingInputRequestContext *)self _assetResourceForType:4];

        if (v34)
        {
          v40 = [(PHContentEditingInputRequestContext *)self _resourceRequestForAssetResource:v34 wantsURLOnly:1 progress:0];
          [v4 addObject:v40];
        }
      }
      else
      {
        uint64_t v34 = v36;
      }
    }
  }
  if (v6 != 2)
  {
    unint64_t v41 = [(PHContentEditingInputRequestContext *)self _assetResourceForType:110];
    if (v41)
    {
      double v42 = [(PHContentEditingInputRequestContext *)self _resourceRequestForAssetResource:v41 wantsURLOnly:1 progress:0];
      [v4 addObject:v42];
    }
  }
  double v43 = PLImageManagerGetLog();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v44 = [(PHMediaRequestContext *)self managerID];
    uint64_t v45 = [(PHMediaRequestContext *)self requestID];
    uint64_t v46 = [v4 count];
    *(_DWORD *)buf = 134218496;
    unint64_t v50 = v44;
    __int16 v51 = 2048;
    uint64_t v52 = v45;
    __int16 v53 = 2048;
    v54 = (__CFString *)v46;
    _os_log_impl(&dword_19B043000, v43, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld Starting %ld child media requests", buf, 0x20u);
  }

LABEL_51:
}

- (id)_baseMediaRequestsForBaseVersion:(int64_t)a3 error:(id *)a4
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v7 = PLImageManagerGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v8 = [(PHMediaRequestContext *)self managerID];
    uint64_t v9 = [(PHMediaRequestContext *)self requestID];
    if ([(PHContentEditingInputRequestContext *)self _shouldRequestImage]) {
      BOOL v10 = @"Y";
    }
    else {
      BOOL v10 = @"N";
    }
    *(_DWORD *)buf = 134218754;
    if ([(PHContentEditingInputRequestContext *)self _shouldRequestVideo]) {
      id v11 = @"Y";
    }
    else {
      id v11 = @"N";
    }
    unint64_t v120 = v8;
    __int16 v121 = 2048;
    uint64_t v122 = v9;
    __int16 v123 = 2112;
    v124 = v10;
    __int16 v125 = 2112;
    v126 = v11;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld Preparing media requests, for images: %@, video: %@", buf, 0x2Au);
  }

  BOOL v12 = [(PHContentEditingInputRequestContext *)self options];
  int v13 = [v12 forcePrepareCurrentBaseVersionInAddition];

  if (a3 != 2 && v13)
  {
    uint64_t v14 = PLImageManagerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v15 = [(PHMediaRequestContext *)self managerID];
      int v16 = [(PHMediaRequestContext *)self requestID];
      *(_DWORD *)buf = 134218240;
      unint64_t v120 = v15;
      __int16 v121 = 2048;
      uint64_t v122 = v16;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld Can handle adjustment data, but also need adjusted FullSizeRenders for extensions (like Markup), kicking off additional requests", buf, 0x16u);
    }

    if ([(PHContentEditingInputRequestContext *)self _shouldRequestVideo])
    {
      uint64_t v17 = [(PHContentEditingInputRequestContext *)self _videoBehaviorSpecForBaseVersion:2];
      uint64_t v18 = [PHVideoRequest alloc];
      uint64_t v19 = [(PHMediaRequestContext *)self requestID];
      unint64_t v20 = [(PHMediaRequestContext *)self nextRequestIndex];
      int64_t v21 = [(PHContentEditingInputRequestContext *)self type];
      int64_t v22 = a3;
      unint64_t v23 = [(PHMediaRequestContext *)self managerID];
      uint64_t v24 = [(PHMediaRequestContext *)self asset];
      unint64_t v25 = v23;
      a3 = v22;
      id v26 = [(PHVideoRequest *)v18 initWithRequestID:v19 requestIndex:v20 contextType:v21 managerID:v25 asset:v24 displaySpec:0 behaviorSpec:v17 delegate:self];

      [v6 addObject:v26];
    }
    if ([(PHContentEditingInputRequestContext *)self _shouldRequestImage])
    {
      BOOL v27 = [(PHContentEditingInputRequestContext *)self isNetworkAccessAllowed];
      int64_t v28 = [(PHContentEditingInputRequestContext *)self downloadIntent];
      BOOL useRAWAsUnadjustedBase = self->_useRAWAsUnadjustedBase;
      id v30 = [(PHMediaRequestContext *)self asset];
      v116 = +[PHImageRequestBehaviorSpec contentEditingInputImageBehaviorSpecForBaseVersion:2 isNetworkAccessAllowed:v27 downloadIntent:v28 shouldUseRAWAsUnadjustedBase:useRAWAsUnadjustedBase asset:v30];

      v31 = [PHImageResourceChooser alloc];
      unint64_t v32 = [(PHMediaRequestContext *)self asset];
      int v33 = [(PHImageResourceChooser *)v31 initWithAsset:v32 resourceHandler:0];
      backupChooser = self->_backupChooser;
      self->_backupChooser = v33;

      BOOL v35 = [PHImageRequest alloc];
      uint64_t v36 = [(PHMediaRequestContext *)self requestID];
      unint64_t v37 = [(PHMediaRequestContext *)self nextRequestIndex];
      int64_t v38 = [(PHContentEditingInputRequestContext *)self type];
      unint64_t v39 = [(PHMediaRequestContext *)self managerID];
      [(PHMediaRequestContext *)self asset];
      unint64_t v41 = v40 = a3;
      double v42 = [(PHImageRequest *)v35 initWithRequestID:v36 requestIndex:v37 contextType:v38 managerID:v39 asset:v41 displaySpec:0 behaviorSpec:v116 chooser:self->_backupChooser delegate:self];

      a3 = v40;
      [v6 addObject:v42];
    }
  }
  if (![(PHContentEditingInputRequestContext *)self _shouldRequestVideo])
  {
    if ([(PHContentEditingInputRequestContext *)self _shouldRequestImage]) {
      goto LABEL_48;
    }
LABEL_52:
    v87 = 0;
    goto LABEL_70;
  }
  double v43 = [(PHMediaRequestContext *)self asset];
  if ([v43 isPhotoIris]) {
    uint64_t v44 = 3;
  }
  else {
    uint64_t v44 = 1;
  }
  uint64_t v45 = [(PHContentEditingInputRequestContext *)self _assetResourceTypeForResourceType:v44 withBaseVersion:a3];

  uint64_t v46 = PLImageManagerGetLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v47 = [(PHMediaRequestContext *)self managerID];
    uint64_t v48 = [(PHMediaRequestContext *)self requestID];
    _PHAssetResourceTypeDescription(v45);
    v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a3 > 2) {
      unint64_t v50 = @"unknown";
    }
    else {
      unint64_t v50 = off_1E5845588[a3];
    }
    __int16 v51 = v50;
    *(_DWORD *)buf = 134218754;
    unint64_t v120 = v47;
    __int16 v121 = 2048;
    uint64_t v122 = v48;
    __int16 v123 = 2112;
    v124 = v49;
    __int16 v125 = 2112;
    v126 = v51;
    _os_log_impl(&dword_19B043000, v46, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld determined video asset resource type: %@ for base version: %@", buf, 0x2Au);
  }
  uint64_t v52 = [(PHContentEditingInputRequestContext *)self _assetResourceForType:v45];
  if (!v52)
  {
    v68 = [(PHMediaRequestContext *)self asset];
    int v69 = [v68 isPhotoIris];

    if (v69)
    {
      v70 = [(PHMediaRequestContext *)self asset];
      char v71 = [v70 canPlayPhotoIris];

      if (a3 && (v71 & 1) == 0)
      {
        uint64_t v62 = PLImageManagerGetLog();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        unint64_t v72 = [(PHMediaRequestContext *)self managerID];
        uint64_t v73 = [(PHMediaRequestContext *)self requestID];
        if ((unint64_t)a3 > 2) {
          unsigned __int8 v74 = @"unknown";
        }
        else {
          unsigned __int8 v74 = off_1E5845588[a3];
        }
        v114 = v74;
        *(_DWORD *)buf = 134218498;
        unint64_t v120 = v72;
        __int16 v121 = 2048;
        uint64_t v122 = v73;
        __int16 v123 = 2112;
        v124 = v114;
        v115 = "[RM] %ld-%ld Live photo edit request allowing missing video, reason: unplayable, base version: %@";
LABEL_79:
        _os_log_impl(&dword_19B043000, v62, OS_LOG_TYPE_DEFAULT, v115, buf, 0x20u);

        goto LABEL_30;
      }
      repairRequest = self->_repairRequest;
      if (a3 == 1)
      {
        if (repairRequest)
        {
          uint64_t v62 = PLImageManagerGetLog();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v76 = [(PHMediaRequestContext *)self managerID];
            int v77 = [(PHMediaRequestContext *)self requestID];
            *(_DWORD *)buf = 134218240;
            unint64_t v120 = v76;
            __int16 v121 = 2048;
            uint64_t v122 = v77;
            _os_log_impl(&dword_19B043000, v62, OS_LOG_TYPE_DEFAULT, "[RM] %ld-%ld Live photo edit request allowing missing video, reason: missing penultimate", buf, 0x16u);
          }
          goto LABEL_30;
        }
      }
      else if (repairRequest)
      {
        uint64_t v62 = PLImageManagerGetLog();
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_30;
        }
        unint64_t v78 = [(PHMediaRequestContext *)self managerID];
        uint64_t v79 = [(PHMediaRequestContext *)self requestID];
        if ((unint64_t)a3 > 2) {
          uint64_t v80 = @"unknown";
        }
        else {
          uint64_t v80 = off_1E5845588[a3];
        }
        v114 = v80;
        *(_DWORD *)buf = 134218498;
        unint64_t v120 = v78;
        __int16 v121 = 2048;
        uint64_t v122 = v79;
        __int16 v123 = 2112;
        v124 = v114;
        v115 = "[RM] %ld-%ld Live photo edit request allowing missing video, reason: zero videos found, base version: %@";
        goto LABEL_79;
      }
    }
    int v67 = 1;
    goto LABEL_46;
  }
  uint64_t v53 = [(PHContentEditingInputRequestContext *)self _videoBehaviorSpecForBaseVersion:a3];
  v117 = [PHVideoRequest alloc];
  uint64_t v54 = [(PHMediaRequestContext *)self requestID];
  unint64_t v55 = [(PHMediaRequestContext *)self nextRequestIndex];
  int64_t v56 = [(PHContentEditingInputRequestContext *)self type];
  uint64_t v57 = v52;
  int64_t v58 = a3;
  unint64_t v59 = [(PHMediaRequestContext *)self managerID];
  unint64_t v60 = [(PHMediaRequestContext *)self asset];
  unint64_t v61 = v59;
  a3 = v58;
  uint64_t v52 = v57;
  uint64_t v62 = v53;
  v63 = [(PHVideoRequest *)v117 initWithRequestID:v54 requestIndex:v55 contextType:v56 managerID:v61 asset:v60 displaySpec:0 behaviorSpec:v53 delegate:self];
  videoRequest = self->_videoRequest;
  self->_videoRequest = v63;

  v65 = [(PHContentEditingInputRequestContext *)self _lazyVideoProgress];
  unint64_t v66 = [(PHMediaRequest *)self->_videoRequest identifierString];
  [(PHMediaRequestContext *)self setProgress:v65 forRequestIdentifier:v66];

  [v6 addObject:self->_videoRequest];
LABEL_30:

  int v67 = 0;
  uint64_t v45 = 1;
LABEL_46:

  BOOL v81 = [(PHContentEditingInputRequestContext *)self _shouldRequestImage];
  if ((v67 & 1) != 0 || !v81)
  {
    if (v67) {
      goto LABEL_57;
    }
    goto LABEL_52;
  }
LABEL_48:
  uint64_t v45 = [(PHContentEditingInputRequestContext *)self _assetResourceTypeForResourceType:0 withBaseVersion:a3];
  v82 = PLImageManagerGetLog();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v83 = [(PHMediaRequestContext *)self managerID];
    uint64_t v84 = [(PHMediaRequestContext *)self requestID];
    _PHAssetResourceTypeDescription(v45);
    uint64_t v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a3 > 2) {
      __int16 v86 = @"unknown";
    }
    else {
      __int16 v86 = off_1E5845588[a3];
    }
    uint64_t v88 = v86;
    *(_DWORD *)buf = 134218754;
    unint64_t v120 = v83;
    __int16 v121 = 2048;
    uint64_t v122 = v84;
    __int16 v123 = 2112;
    v124 = v85;
    __int16 v125 = 2112;
    v126 = v88;
    _os_log_impl(&dword_19B043000, v82, OS_LOG_TYPE_DEBUG, "[RM] %ld-%ld determined image asset resource type: %@ for base version: %@", buf, 0x2Au);
  }
  uint64_t v89 = [(PHContentEditingInputRequestContext *)self _assetResourceForType:v45];
  if (v89)
  {
    v90 = (__CFString *)v89;
    v91 = [(PHContentEditingInputRequestContext *)self _lazyImageProgress];
    v92 = [(PHContentEditingInputRequestContext *)self _resourceRequestForAssetResource:v90 wantsURLOnly:1 progress:v91];

    self->_imageBaseRequestIndex = [v92 requestIndex];
    [v6 addObject:v92];

    goto LABEL_66;
  }
LABEL_57:
  v93 = PLImageManagerGetLog();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
  {
    unint64_t v94 = [(PHMediaRequestContext *)self managerID];
    uint64_t v95 = [(PHMediaRequestContext *)self requestID];
    if ((unint64_t)a3 > 2) {
      v96 = @"unknown";
    }
    else {
      v96 = off_1E5845588[a3];
    }
    v97 = v96;
    _PHAssetResourceTypeDescription(v45);
    v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    unint64_t v120 = v94;
    __int16 v121 = 2048;
    uint64_t v122 = v95;
    __int16 v123 = 2112;
    v124 = v97;
    __int16 v125 = 2112;
    v126 = v98;
    _os_log_impl(&dword_19B043000, v93, OS_LOG_TYPE_ERROR, "[RM] %ld-%ld Base version needed is %@, but did not find asset resource of type %@", buf, 0x2Au);
  }
  if (self->_repairRequest)
  {

    v99 = (void *)MEMORY[0x1E4F28C58];
    if ((unint64_t)a3 > 2) {
      v100 = @"unknown";
    }
    else {
      v100 = off_1E5845588[a3];
    }
    v90 = v100;
    v112 = _PHAssetResourceTypeDescription(v45);
    v87 = objc_msgSend(v99, "ph_errorWithCode:localizedDescription:", 3306, @"Base version needed is %@, but did not find asset resource of type %@", v90, v112);

    id v6 = 0;
    goto LABEL_69;
  }
  v101 = [PHRepairRequest alloc];
  uint64_t v102 = [(PHMediaRequestContext *)self requestID];
  v103 = v6;
  unint64_t v104 = [(PHMediaRequestContext *)self nextRequestIndex];
  int64_t v105 = [(PHContentEditingInputRequestContext *)self type];
  unint64_t v106 = [(PHMediaRequestContext *)self managerID];
  v107 = [(PHMediaRequestContext *)self asset];
  v108 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EEB25FE0];
  unint64_t v109 = v104;
  id v6 = v103;
  v110 = [(PHRepairRequest *)v101 initWithRequestID:v102 requestIndex:v109 contextType:v105 managerID:v106 asset:v107 assetResource:0 errorCodes:v108 delegate:self];

  [v103 removeAllObjects];
  v111 = self->_repairRequest;
  self->_repairRequest = v110;
  v90 = v110;

  [v103 addObject:self->_repairRequest];
LABEL_66:
  v87 = 0;
LABEL_69:

LABEL_70:
  if (a4) {
    *a4 = v87;
  }

  return v6;
}

- (void)_renderTemporaryVideoForObjectBuilder:(id)a3 resultHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F15758];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PHContentEditingInputRequestContext__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke;
  v8[3] = &unk_1E5847258;
  id v9 = v5;
  id v7 = v5;
  [a3 requestExportSessionWithExportPreset:v6 resultHandler:v8];
}

void __91__PHContentEditingInputRequestContext__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29128] UUID];
    id v5 = [v4 UUIDString];

    uint64_t v6 = [NSString stringWithFormat:@"RenderedContent-%@.MOV", v5];
    id v7 = NSTemporaryDirectory();
    unint64_t v8 = [v7 stringByAppendingPathComponent:v6];

    id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    [v3 setOutputFileType:*MEMORY[0x1E4F15AB0]];
    [v3 setOutputURL:v9];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__PHContentEditingInputRequestContext__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2;
    v12[3] = &unk_1E58487E0;
    id v13 = v3;
    id v10 = *(id *)(a1 + 32);
    id v14 = v9;
    id v15 = v10;
    id v11 = v9;
    [v13 exportAsynchronouslyWithCompletionHandler:v12];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __91__PHContentEditingInputRequestContext__renderTemporaryVideoForObjectBuilder_resultHandler___block_invoke_2(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) status] == 4)
  {
    v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Rendering video failed";
    id v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = (__CFString **)v11;
    id v5 = &v10;
  }
  else
  {
    if ([*(id *)(a1 + 32) status] != 5) {
      goto LABEL_7;
    }
    v2 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28568];
    id v9 = @"Rendering video cancelled";
    id v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = &v9;
    id v5 = &v8;
  }
  uint64_t v6 = [v3 dictionaryWithObjects:v4 forKeys:v5 count:1];
  id v7 = objc_msgSend(v2, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v6);

  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    return;
  }
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_renderVideoFromVideoURL:(id)a3 asset:(id)a4 adjustmentData:(id)a5 canHandleAdjustmentData:(BOOL)a6 resultHandler:(id)a7
{
  id v12 = a3;
  id v13 = (void (**)(id, id, void))a7;
  id v14 = (objc_class *)MEMORY[0x1E4F8CE18];
  id v15 = a5;
  id v16 = a4;
  id v17 = [v14 alloc];
  uint64_t v18 = [v15 formatIdentifier];
  uint64_t v19 = [v15 formatVersion];
  unint64_t v20 = [v15 data];

  int64_t v21 = (void *)[v17 initWithFormatIdentifier:v18 formatVersion:v19 data:v20 baseVersion:0 editorBundleID:0 renderTypes:0];
  LOBYTE(v17) = [v16 isPhotoIris];

  if ((v17 & 1) != 0 || a6 || ([v21 isRecognizedFormat] & 1) == 0)
  {
    v13[2](v13, v12, 0);
  }
  else
  {
    int64_t v22 = [MEMORY[0x1E4F166C8] assetWithURL:v12];
    unint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v22 videoAdjustments:v21];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __123__PHContentEditingInputRequestContext__renderVideoFromVideoURL_asset_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke;
    v24[3] = &unk_1E5847230;
    unint64_t v25 = v13;
    [(PHContentEditingInputRequestContext *)self _renderTemporaryVideoForObjectBuilder:v23 resultHandler:v24];
  }
}

uint64_t __123__PHContentEditingInputRequestContext__renderVideoFromVideoURL_asset_adjustmentData_canHandleAdjustmentData_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_canSkipMediaMetadataCheckWithBaseVersion:(int64_t)a3
{
  return 1;
}

- (int64_t)_adjustmentBaseVersionFromResult:(id)a3 request:(id)a4 canHandleAdjustmentData:(BOOL *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v24 = 0;
  uint64_t v10 = [(PHContentEditingInputRequestContext *)self options];
  int v11 = [v10 forceRunAsUnadjustedAsset];

  if (v11)
  {
    id v12 = PLImageManagerGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v9 identifierString];
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "[RM] %@ Force run as unadjusted base", buf, 0xCu);
    }
    unint64_t v14 = 0;
    goto LABEL_20;
  }
  id v12 = [v8 adjustmentData];
  id v15 = [v8 error];
  id v16 = [v15 domain];
  if ([v16 isEqualToString:*MEMORY[0x1E4F8AD00]])
  {
    if ([v15 code] == 3)
    {

LABEL_10:
      id v15 = 0;
      id v12 = 0;
LABEL_13:
      unint64_t v14 = 0;
      goto LABEL_14;
    }
    uint64_t v17 = [v15 code];

    if (v17 == 4) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (!v12) {
    goto LABEL_13;
  }
  uint64_t v18 = [(PHContentEditingInputRequestOptions *)self->_options canHandleAdjustmentData];
  unint64_t v14 = [v12 _contentEditing_requiredBaseVersionReadableByClient:&v24 verificationBlock:v18];

LABEL_14:
  uint64_t v19 = PLImageManagerGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v20 = [v9 identifierString];
    if (v14 > 2) {
      int64_t v21 = @"unknown";
    }
    else {
      int64_t v21 = off_1E5845588[v14];
    }
    int64_t v22 = v21;
    *(_DWORD *)buf = 138543874;
    id v26 = v20;
    __int16 v27 = 2114;
    int64_t v28 = v22;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ Calculated adjustment base: %{public}@ from adjustment data: %@", buf, 0x20u);
  }
LABEL_20:

  if (a5) {
    *a5 = v24;
  }

  return v14;
}

- (id)_videoBehaviorSpecForBaseVersion:(int64_t)a3
{
  id v5 = objc_alloc_init(PHVideoRequestBehaviorSpec);
  [(PHVideoRequestBehaviorSpec *)v5 setDeliveryMode:1];
  [(PHVideoRequestBehaviorSpec *)v5 setNetworkAccessAllowed:[(PHContentEditingInputRequestContext *)self isNetworkAccessAllowed]];
  uint64_t v6 = [(PHMediaRequestContext *)self asset];
  -[PHVideoRequestBehaviorSpec setVideoComplementAllowed:](v5, "setVideoComplementAllowed:", [v6 isPhotoIris]);

  [(PHVideoRequestBehaviorSpec *)v5 setDownloadIntent:[(PHContentEditingInputRequestContext *)self downloadIntent]];
  [(PHVideoRequestBehaviorSpec *)v5 setVersion:+[PHAdjustmentData videoRequestVersionFromAdjustmentBaseVersion:a3]];

  return v5;
}

- (id)_lazyVideoProgress
{
  if (!self->_videoProgress && [(PHMediaRequestContext *)self shouldReportProgress])
  {
    if ([(PHContentEditingInputRequestContext *)self _shouldRequestImage]) {
      uint64_t v3 = 45;
    }
    else {
      uint64_t v3 = 90;
    }
    id v4 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v3];
    videoProgress = self->_videoProgress;
    self->_videoProgress = v4;
  }
  uint64_t v6 = self->_videoProgress;

  return v6;
}

- (id)_lazyImageProgress
{
  if (!self->_imageProgress && [(PHMediaRequestContext *)self shouldReportProgress])
  {
    if ([(PHContentEditingInputRequestContext *)self _shouldRequestVideo]) {
      uint64_t v3 = 45;
    }
    else {
      uint64_t v3 = 90;
    }
    id v4 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v3];
    imageProgress = self->_imageProgress;
    self->_imageProgress = v4;
  }
  uint64_t v6 = self->_imageProgress;

  return v6;
}

- (id)_lazyAdjustmentProgress
{
  if (!self->_adjustmentProgress && [(PHMediaRequestContext *)self shouldReportProgress])
  {
    uint64_t v3 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:10];
    adjustmentProgress = self->_adjustmentProgress;
    self->_adjustmentProgress = v3;
  }
  id v5 = self->_adjustmentProgress;

  return v5;
}

- (BOOL)_shouldRequestVideo
{
  uint64_t v3 = [(PHMediaRequestContext *)self asset];
  if ([v3 isPhotoIris])
  {
    if ([(PHContentEditingInputRequestOptions *)self->_options forceReturnFullLivePhoto])
    {
      char v4 = 1;
    }
    else
    {
      id v5 = [(PHMediaRequestContext *)self asset];
      if ([v5 canPlayPhotoIris])
      {
        char v4 = 1;
      }
      else
      {
        uint64_t v6 = [(PHMediaRequestContext *)self asset];
        if ([v6 canPlayMirror])
        {
          char v4 = 1;
        }
        else
        {
          id v7 = [(PHMediaRequestContext *)self asset];
          char v4 = [v7 canPlayAutoloop];
        }
      }
    }
  }
  else
  {
    char v4 = 0;
  }

  id v8 = [(PHMediaRequestContext *)self asset];
  char v9 = [v8 isVideo] | v4;

  return v9;
}

- (BOOL)_shouldRequestImage
{
  v2 = [(PHMediaRequestContext *)self asset];
  char v3 = [v2 isPhoto];

  return v3;
}

- (PHContentEditingInputRequestContext)initWithRequestID:(int)a3 managerID:(unint64_t)a4 asset:(id)a5 options:(id)a6 useRAWAsUnadjustedBase:(BOOL)a7 resultHandler:(id)a8
{
  uint64_t v13 = *(void *)&a3;
  id v15 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PHContentEditingInputRequestContext;
  id v16 = [(PHMediaRequestContext *)&v23 initWithRequestID:v13 managerID:a4 asset:a5 displaySpec:0 resultHandler:a8];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_options, a6);
    v17->_BOOL useRAWAsUnadjustedBase = a7;
    v17->_lock._os_unfair_lock_opaque = 0;
    uint64_t v18 = [(PHCompositeMediaResult *)[PHContentEditingInputResult alloc] initWithRequestID:v13];
    contentEditingInputResult = v17->_contentEditingInputResult;
    v17->_contentEditingInputResult = v18;

    unint64_t v20 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    requestIndexesOfAssetResourceRequests = v17->_requestIndexesOfAssetResourceRequests;
    v17->_requestIndexesOfAssetResourceRequests = v20;
  }
  return v17;
}

+ (id)contentEditingInputRequestContextForAsset:(id)a3 requestID:(int)a4 managerID:(unint64_t)a5 networkAccessAllowed:(BOOL)a6 downloadIntent:(int64_t)a7 progressHandler:(id)a8 resultHandler:(id)a9
{
  BOOL v11 = a6;
  uint64_t v13 = *(void *)&a4;
  id v16 = a9;
  id v17 = a8;
  id v18 = a3;
  uint64_t v19 = objc_alloc_init(PHContentEditingInputRequestOptions);
  [(PHContentEditingInputRequestOptions *)v19 setNetworkAccessAllowed:v11];
  [(PHContentEditingInputRequestOptions *)v19 setDownloadIntent:a7];
  [(PHContentEditingInputRequestOptions *)v19 setCanHandleAdjustmentData:&__block_literal_global_36438];
  [(PHContentEditingInputRequestOptions *)v19 setProgressHandler:v17];

  [(PHContentEditingInputRequestOptions *)v19 setForceReturnFullLivePhoto:1];
  [(PHContentEditingInputRequestOptions *)v19 setSkipDisplaySizeImage:1];
  [(PHContentEditingInputRequestOptions *)v19 setSkipLivePhotoImageAndAVAsset:1];
  [(PHContentEditingInputRequestOptions *)v19 setDisallowFallbackAdjustmentBase:1];
  unint64_t v20 = +[PHMediaRequestContext contentEditingInputRequestContextWithRequestID:managerID:asset:options:useRAWAsUnadjustedBase:resultHandler:](PHMediaRequestContext, "contentEditingInputRequestContextWithRequestID:managerID:asset:options:useRAWAsUnadjustedBase:resultHandler:", v13, a5, v18, v19, [a1 shouldUseRAWResourceAsUnadjustedBaseForAsset:v18 options:v19], v16);

  return v20;
}

void *__167__PHContentEditingInputRequestContext_contentEditingInputRequestContextForAsset_requestID_managerID_networkAccessAllowed_downloadIntent_progressHandler_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [v2 data];
  if (v3)
  {
    uint64_t v4 = [v2 formatVersion];
    if (v4)
    {
      id v5 = (void *)v4;
      uint64_t v6 = [v2 formatIdentifier];

      if (v6)
      {
        id v7 = (void *)MEMORY[0x1E4F8CE18];
        id v8 = [v2 formatIdentifier];
        char v9 = [v2 formatVersion];
        LOBYTE(v7) = [v7 isRecognizedSlowMotionFormatWithIdentifier:v8 version:v9];

        if ((v7 & 1) == 0)
        {
          uint64_t v10 = (void *)MEMORY[0x1E4F8AA58];
          BOOL v11 = [v2 data];
          id v12 = [v2 formatIdentifier];
          uint64_t v13 = [v2 formatVersion];
          uint64_t v15 = 0;
          char v3 = (void *)[v10 validateAdjustmentData:v11 formatIdentifier:v12 formatVersion:v13 error:&v15];

          goto LABEL_8;
        }
      }
    }
    else
    {
    }
    char v3 = 0;
  }
LABEL_8:

  return v3;
}

+ (BOOL)shouldUseRAWResourceAsUnadjustedBaseForAsset:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (PHDeviceSupportsRAW_onceToken != -1) {
    dispatch_once(&PHDeviceSupportsRAW_onceToken, &__block_literal_global_18412);
  }
  if (PHDeviceSupportsRAW_deviceSupportsRAW && ([v6 dontAllowRAW] & 1) == 0)
  {
    if ([v6 shouldForceOriginalChoice]) {
      uint64_t v8 = [v6 originalChoice];
    }
    else {
      uint64_t v8 = [v5 originalResourceChoice];
    }
    char v7 = [v5 shouldUseRAWResourceWithOriginalResourceChoice:v8];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

@end