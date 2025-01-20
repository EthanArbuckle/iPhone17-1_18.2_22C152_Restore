@interface PHImageManager
+ (BOOL)_allowVideoAccessForAsset:(id)a3 options:(id)a4;
+ (PHImageManager)defaultManager;
+ (id)_videoAVObjectBuilderFromVideoURL:(id)a3 info:(id)a4 options:(id)a5 playbackOnly:(BOOL)a6;
+ (id)fileTypeForOutputURL:(id)a3;
+ (id)mediaItemURLForAssetUuid:(id)a3 fingerPrint:(id)a4 outOfBandPresentationHints:(id)a5;
+ (id)playerItemFromVideoMediaItemMakerData:(id)a3 forAssetUuid:(id)a4 fingerPrint:(id)a5 outOfBandPresentationHints:(id)a6;
+ (id)playerItemFromVideoMediaItemMakerDataInMediaResult:(id)a3 forAsset:(id)a4;
+ (void)buildAVAssetFromVideoURL:(id)a3 infoDictionary:(id)a4 options:(id)a5 completion:(id)a6;
+ (void)buildAVPlayerItemFromRemoteStreamVideoURL:(id)a3 infoDictionary:(id)a4 completion:(id)a5;
+ (void)buildAVPlayerItemFromVideoURL:(id)a3 infoDictionary:(id)a4 options:(id)a5 completion:(id)a6;
+ (void)buildExportSessionFromVideoURL:(id)a3 infoDictionary:(id)a4 options:(id)a5 exportPreset:(id)a6 completion:(id)a7;
+ (void)configureAssetCacheInAssetCreationOptionsDictionary:(id)a3;
+ (void)exportVideoFileForTimeRange:(id *)a3 fromVideoMediaItemMakerData:(id)a4 forAssetUuid:(id)a5 toOutputFileURL:(id)a6 fingerPrint:(id)a7 signpostId:(unint64_t)a8 options:(id)a9 completion:(id)a10;
+ (void)startExportSession:(id)a3 assetUuid:(id)a4 signpostId:(unint64_t)a5 completion:(id)a6;
- (BOOL)_canStreamVideoForAsset:(id)a3;
- (PHImageManager)init;
- (PHImageRequestID)requestAVAssetForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options resultHandler:(void *)resultHandler;
- (PHImageRequestID)requestExportSessionForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options exportPreset:(NSString *)exportPreset resultHandler:(void *)resultHandler;
- (PHImageRequestID)requestImageDataAndOrientationForAsset:(PHAsset *)asset options:(PHImageRequestOptions *)options resultHandler:(void *)resultHandler;
- (PHImageRequestID)requestImageDataForAsset:(PHAsset *)asset options:(PHImageRequestOptions *)options resultHandler:(void *)resultHandler;
- (PHImageRequestID)requestImageForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options resultHandler:(void *)resultHandler;
- (PHImageRequestID)requestLivePhotoForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHLivePhotoRequestOptions *)options resultHandler:(void *)resultHandler;
- (PHImageRequestID)requestPlayerItemForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options resultHandler:(void *)resultHandler;
- (PHPhotoLibrary)photoLibrary;
- (id)synchronousImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6;
- (int)_requestImagePropertiesFromFileForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)_requestLiveRenderAVAssetForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)nextID;
- (int)requestAVAssetForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestAVProxyForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestContentEditingInputForAsset:(id)a3 withOptions:(id)a4 completionHandler:(id)a5;
- (int)requestImagePropertiesForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestNewCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int)runRequestWithContext:(id)a3;
- (unint64_t)managerID;
- (void)_handleResultForContentEditingInput:(id)a3 request:(id)a4 options:(id)a5 asset:(id)a6 completionHandler:(id)a7;
- (void)_prepareLivePhotoResultWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 shouldIncludeVideo:(BOOL)a5 videoURL:(id)a6 info:(id)a7 photoTime:(id *)a8 asset:(id)a9 completion:(id)a10;
- (void)_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:(id)a3 options:(id)a4 block:(id)a5;
- (void)cancelImageRequest:(PHImageRequestID)requestID;
- (void)mediaRequestContext:(id)a3 isQueryingCacheForRequest:(id)a4 didWait:(BOOL *)a5 didFindImage:(BOOL *)a6 resultHandler:(id)a7;
- (void)mediaRequestContextDidFinish:(id)a3;
@end

@implementation PHImageManager

- (void)mediaRequestContext:(id)a3 isQueryingCacheForRequest:(id)a4 didWait:(BOOL *)a5 didFindImage:(BOOL *)a6 resultHandler:(id)a7
{
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
}

- (int)requestNewCGImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  if (v14) {
    v16 = (PHImageRequestOptions *)[v14 copy];
  }
  else {
    v16 = objc_alloc_init(PHImageRequestOptions);
  }
  v17 = v16;
  if ([(PHImageRequestOptions *)v16 version] == 16 || [(PHImageRequestOptions *)v17 version] == 17)
  {
    v18 = [(PHImageRequestOptions *)v17 resultHandlerQueue];

    if (!v18)
    {
      v19 = dispatch_get_global_queue(33, 0);
      [(PHImageRequestOptions *)v17 setResultHandlerQueue:v19];
    }
  }
  v20 = [PHImageDisplaySpec alloc];
  [(PHImageRequestOptions *)v17 normalizedCropRect];
  v25 = -[PHImageDisplaySpec initWithTargetSize:contentMode:normalizedCropRect:](v20, "initWithTargetSize:contentMode:normalizedCropRect:", a5, ceil(width), ceil(height), v21, v22, v23, v24);
  [(PHImageRequestOptions *)v17 fallbackTargetSizeIfRequestedSizeNotLocallyAvailable];
  -[PHImageDisplaySpec setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:](v25, "setFallbackTargetSizeIfRequestedSizeNotLocallyAvailable:");
  uint64_t v26 = [(PHImageManager *)self nextID];
  unint64_t managerID = self->_managerID;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __89__PHImageManager_requestNewCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v48[3] = &unk_1E5848A10;
  v28 = v17;
  v49 = v28;
  v50 = self;
  id v29 = v15;
  id v51 = v29;
  v30 = +[PHMediaRequestContext imageRequestContextWithRequestID:v26 managerID:managerID asset:v13 imageRequestOptions:v28 displaySpec:v25 resultHandler:v48];
  if (PHSignpostEventsEnabled_onceToken != -1) {
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
  }
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    v31 = PLImageManagerGetLog();
    os_signpost_id_t v32 = os_signpost_id_generate(v31);
    if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v33 = v32;
      uint64_t v34 = [v30 managerID];
      int v42 = [v30 requestID];
      uint64_t v44 = [v30 type];
      uint64_t v45 = v34;
      id v46 = v13;
      if (_getNextLayoutID_onceToken != -1) {
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
      }
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      uint64_t v35 = [(id)s_availableLayoutIDs firstIndex];
      if (v35 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v36 = 101;
      }
      else
      {
        uint64_t v36 = v35;
        [(id)s_availableLayoutIDs removeIndex:v35];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      v37 = [v30 asset];
      v47 = [v37 uuid];

      [v30 setSignpostID:v33];
      [v30 setSignpostLayoutID:v36];
      v38 = v31;
      if (os_signpost_enabled(v38))
      {
        uint64_t v41 = v42;
        v43 = DCIM_NSStringFromCGSize();
        *(_DWORD *)buf = 134219266;
        uint64_t v53 = v45;
        __int16 v54 = 2048;
        uint64_t v55 = v41;
        __int16 v56 = 2112;
        v57 = v43;
        __int16 v58 = 2048;
        uint64_t v59 = v44;
        __int16 v60 = 2112;
        v61 = v47;
        __int16 v62 = 2048;
        uint64_t v63 = v36;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v33, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
      }
      id v13 = v46;
    }
  }
  int v39 = [(PHImageManager *)self runRequestWithContext:v30];

  return v39;
}

- (int)nextID
{
  return atomic_fetch_add(&self->_nextRequestID, 1u);
}

- (void)mediaRequestContextDidFinish:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLImageManagerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unint64_t managerID = self->_managerID;
    *(_DWORD *)buf = 134218498;
    unint64_t v15 = managerID;
    __int16 v16 = 2048;
    uint64_t v17 = (int)[v4 requestID];
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "[RM]: %ld-%ld image request %@ finished, removing from map table", buf, 0x20u);
  }

  if (PHImageManagerRecordEnabled()) {
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", [v4 requestID], @"[RM]: %ld-%ld image request %@ finished, removing from map table", self->_managerID, (int)objc_msgSend(v4, "requestID"), v4);
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  requestContextsByID = self->_requestContextsByID;
  v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "requestID"));
  [(NSMapTable *)requestContextsByID removeObjectForKey:v9];

  if (PHSignpostEventsEnabled_onceToken != -1) {
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
  }
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    v10 = PLImageManagerGetLog();
    uint64_t v11 = [v4 signpostID];
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      uint64_t v13 = [v4 signpostLayoutID];
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_END, v12, "ContextEvent", "Context end", buf, 2u);
      }
      if (v13 != 101)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
        [(id)s_availableLayoutIDs addIndex:v13];
        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (int)runRequestWithContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 requestID];
  [v4 setDelegate:self];
  v6 = PLImageManagerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    unint64_t managerID = self->_managerID;
    *(_DWORD *)buf = 134218498;
    unint64_t v20 = managerID;
    __int16 v21 = 2048;
    uint64_t v22 = (int)[v4 requestID];
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "[RM]: %ld-%ld run image request for %@; store in map table",
      buf,
      0x20u);
  }

  if (PHImageManagerRecordEnabled()) {
    +[PHImageManagerRequestTracer traceMessageForRequestID:message:](PHImageManagerRequestTracer, "traceMessageForRequestID:message:", [v4 requestID], @"[RM]: %ld-%ld run image request for %@; store in map table",
  }
      self->_managerID,
      (int)[v4 requestID],
      v4);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  requestContextsByID = self->_requestContextsByID;
  v10 = [NSNumber numberWithInt:v5];
  [(NSMapTable *)requestContextsByID setObject:v4 forKey:v10];

  os_unfair_lock_unlock(p_lock);
  [v4 start];
  if (PHImageManagerRecordEnabled())
  {
    os_signpost_id_t v12 = [v4 asset];
    uint64_t v13 = [v12 uuid];
    +[PHImageManagerRequestTracer registerRequestID:v5 withAssetUUID:v13];

    id v14 = [v4 asset];
    unint64_t v15 = [v14 uuid];

    if (!v15)
    {
      __int16 v16 = PLImageManagerGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = [v4 asset];
        *(_DWORD *)buf = 138412290;
        unint64_t v20 = (unint64_t)v17;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "[RM]: request for image for asset with no UUID (asset: %@)", buf, 0xCu);
      }
      if (PHImageManagerRecordEnabled())
      {
        __int16 v18 = [v4 asset];
        +[PHImageManagerRequestTracer traceMessageForRequestID:v5, @"[RM]: request for image for asset with no UUID (asset: %@)", v18 message];
      }
    }
  }

  return v5;
}

- (PHImageRequestID)requestImageForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options resultHandler:(void *)resultHandler
{
  double height = targetSize.height;
  double width = targetSize.width;
  id v13 = resultHandler;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__PHImageManager_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
  v16[3] = &unk_1E5848740;
  id v17 = v13;
  id v14 = v13;
  LODWORD(options) = -[PHImageManager requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:](self, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", asset, contentMode, options, v16, width, height);

  return (int)options;
}

void __89__PHImageManager_requestNewCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  CGImageRef v10 = CGImageRetain((CGImageRef)[v7 imageRef]);
  char v11 = [a1[4] isNetworkAccessAllowed];
  id v12 = v7;
  if ([v12 containsValidData])
  {

    if (v10)
    {
      id v13 = PLImageManagerGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [v8 identifierString];
        unint64_t v15 = [v12 info];
        *(_DWORD *)buf = 138412802;
        v50 = v14;
        __int16 v51 = 2112;
        CGImageRef v52 = v10;
        __int16 v53 = 2112;
        __int16 v54 = v15;
        _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image result received with UIImage: %@, info: %@", buf, 0x20u);
      }
      if (PHImageManagerRecordEnabled())
      {
        uint64_t v16 = [v8 requestID];
        id v17 = [v8 identifierString];
        __int16 v18 = [v12 info];
        +[PHImageManagerRequestTracer traceMessageForRequestID:v16, @"[RM]: %@ Image result received with UIImage: %@, info: %@", v17, v10, v18 message];
LABEL_32:

        goto LABEL_33;
      }
      goto LABEL_30;
    }
    v28 = [v12 adjustmentData];

    id v29 = PLImageManagerGetLog();
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
    if (!v28)
    {
      if (v30)
      {
        uint64_t v35 = [v8 identifierString];
        uint64_t v36 = [v12 info];
        *(_DWORD *)buf = 138412546;
        v50 = v35;
        __int16 v51 = 2112;
        CGImageRef v52 = v36;
        _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image result received with info: %@", buf, 0x16u);
      }
      if (PHImageManagerRecordEnabled())
      {
        uint64_t v42 = [v8 requestID];
        id v17 = [v8 identifierString];
        __int16 v18 = [v12 info];
        +[PHImageManagerRequestTracer traceMessageForRequestID:v42, @"[RM]: %@ Image result received with info: %@", v17, v18, v43 message];
        goto LABEL_32;
      }
      goto LABEL_30;
    }
    if (v30)
    {
      v31 = [v8 identifierString];
      *(_DWORD *)buf = 138412290;
      v50 = v31;
      _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_DEBUG, "[RM]: %@ Adjustment data received", buf, 0xCu);
    }
    if (!PHImageManagerRecordEnabled()) {
      goto LABEL_30;
    }
    uint64_t v32 = [v8 requestID];
    id v17 = [v8 identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v32, @"[RM]: %@ Adjustment data received", v17 message];
LABEL_33:

    goto LABEL_30;
  }
  if ([v12 isCancelled])
  {

    id v19 = PLImageManagerGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v20 = [v8 identifierString];
      *(_DWORD *)buf = 138412290;
      v50 = v20;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image request was cancelled", buf, 0xCu);
    }
    if (!PHImageManagerRecordEnabled()) {
      goto LABEL_30;
    }
    uint64_t v21 = [v8 requestID];
    id v17 = [v8 identifierString];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v21, @"[RM]: %@ Image request was cancelled", v17 message];
    goto LABEL_33;
  }
  char v22 = v11 | [v12 isInCloud] ^ 1;

  __int16 v23 = PLImageManagerGetLog();
  id v24 = v23;
  if (v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [v8 identifierString];
      uint64_t v26 = [v12 error];
      *(_DWORD *)buf = 138412546;
      v50 = v25;
      __int16 v51 = 2112;
      CGImageRef v52 = v26;
      _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_ERROR, "[RM]: %@ Image request failed with error: %@", buf, 0x16u);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v27 = [v8 requestID];
      id v17 = [v8 identifierString];
      __int16 v18 = [v12 error];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v27, @"[RM]: %@ Image request failed with error: %@", v17, v18, v43 message];
      goto LABEL_32;
    }
  }
  else
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      os_signpost_id_t v33 = [v8 identifierString];
      *(_DWORD *)buf = 138412290;
      v50 = v33;
      _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEBUG, "[RM]: %@ Image request found result in cloud, but network access not allowed", buf, 0xCu);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v34 = [v8 requestID];
      id v17 = [v8 identifierString];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v34, @"[RM]: %@ Image request found result in cloud, but network access not allowed", v17 message];
      goto LABEL_33;
    }
  }
LABEL_30:
  id v38 = a1[4];
  id v37 = a1[5];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __89__PHImageManager_requestNewCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_695;
  v44[3] = &unk_1E5848A60;
  id v39 = a1[6];
  id v45 = v12;
  id v46 = v8;
  id v47 = v39;
  CGImageRef v48 = v10;
  id v40 = v8;
  id v41 = v12;
  [v37 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v40 options:v38 block:v44];
  [a1[5] additionalWorkForImageRequestCompletedWithResult:v41 request:v40 context:v9];
}

- (void)_runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:(id)a3 options:(id)a4 block:(id)a5
{
  id v10 = a4;
  id v7 = (void (**)(void))a5;
  if ([a3 isSynchronous])
  {
    v7[2](v7);
  }
  else
  {
    id v8 = [v10 resultHandlerQueue];
    if (!v8)
    {
      id v8 = MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
    }
    dispatch_async(v8, v7);
  }
}

void __89__PHImageManager_requestNewCGImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke_695(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    v2 = [*(id *)(a1 + 32) sanitizedInfoDictionary];
    v3 = [v2 objectForKeyedSubscript:@"PHImageResultClientShouldRetryKey"];
    int v4 = [v3 BOOLValue];

    if (v4)
    {
      uint64_t v5 = PLImageManagerGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = [*(id *)(a1 + 40) identifierString];
        int v8 = 138412290;
        id v9 = v6;
        _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "[RM]: %@ client should retry", (uint8_t *)&v8, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = *(CGImage **)(a1 + 56);
    CGImageRelease(v7);
  }
}

void __84__PHImageManager_requestImageForAsset_targetSize_contentMode_options_resultHandler___block_invoke(uint64_t a1, CGImage *a2, void *a3)
{
  id v5 = a3;
  id v11 = v5;
  if (a2)
  {
    v6 = [v5 objectForKeyedSubscript:@"PHImageResultIsPlaceholderKey"];
    int v7 = [v6 BOOLValue];

    if (v7) {
      uint64_t v8 = DCIM_newResizablePLImageWithCGImage();
    }
    else {
      uint64_t v8 = DCIM_newPLImageWithCGImage();
    }
    id v9 = (void *)v8;
    CGImageRelease(a2);
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v9, v11);
  }
}

void __32__PHImageManager_defaultManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultManager_manager;
  defaultManager_manager = (uint64_t)v1;

  *(void *)(defaultManager_manager + 32) = 1;
}

- (PHImageManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHImageManager;
  v2 = [(PHImageManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    atomic_store(1u, (unsigned int *)&v2->_nextRequestID);
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    requestContextsByID = v3->_requestContextsByID;
    v3->_requestContextsByID = (NSMapTable *)v4;

    v3->_lock._os_unfair_lock_opaque = 0;
    if (PHNextImageAndAssetResourceManagerID_onceToken != -1) {
      dispatch_once(&PHNextImageAndAssetResourceManagerID_onceToken, &__block_literal_global_22759);
    }
    v3->_unint64_t managerID = atomic_fetch_add((atomic_ullong *volatile)&PHNextImageAndAssetResourceManagerID_managerID, 1uLL);
  }
  return v3;
}

- (void)cancelImageRequest:(PHImageRequestID)requestID
{
  uint64_t v3 = *(void *)&requestID;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  requestContextsByID = self->_requestContextsByID;
  objc_super v7 = [NSNumber numberWithInt:v3];
  uint64_t v8 = [(NSMapTable *)requestContextsByID objectForKey:v7];

  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    if (PHSignpostEventsEnabled_onceToken != -1) {
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
    }
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      uint64_t v9 = [v8 signpostID];
      if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v10 = v9;
        id v11 = PLImageManagerGetLog();
        uint64_t v12 = [v8 managerID];
        int v13 = [v8 requestID];
        if (os_signpost_enabled(v11))
        {
          *(_DWORD *)buf = 134218752;
          unint64_t v19 = v12;
          __int16 v20 = 2048;
          uint64_t v21 = v13;
          __int16 v22 = 2048;
          uint64_t v23 = 0;
          __int16 v24 = 2048;
          uint64_t v25 = 2;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v11, OS_SIGNPOST_EVENT, v10, "RequestEvent", "Change: [%lu-%lu-%lu], state: %lu", buf, 0x2Au);
        }
      }
    }
    id v14 = PLImageManagerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unint64_t managerID = self->_managerID;
      *(_DWORD *)buf = 134218240;
      unint64_t v19 = managerID;
      __int16 v20 = 2048;
      uint64_t v21 = (int)v3;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %ld-%ld Cancelling image request", buf, 0x16u);
    }

    if (PHImageManagerRecordEnabled()) {
      +[PHImageManagerRequestTracer traceMessageForRequestID:v3, @"[RM]: %ld-%ld Cancelling image request", self->_managerID, (int)v3 message];
    }
    [v8 cancel];
  }
  else if (v3)
  {
    uint64_t v16 = PLImageManagerGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v17 = self->_managerID;
      *(_DWORD *)buf = 134218240;
      unint64_t v19 = v17;
      __int16 v20 = 2048;
      uint64_t v21 = (int)v3;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "[RM]: Did not find image request with ID %ld-%ld to cancel", buf, 0x16u);
    }

    if (PHImageManagerRecordEnabled()) {
      +[PHImageManagerRequestTracer traceMessageForRequestID:v3, @"[RM]: Did not find image request with ID %ld-%ld to cancel", self->_managerID, (int)v3 message];
    }
  }
}

+ (PHImageManager)defaultManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PHImageManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken_48351 != -1) {
    dispatch_once(&defaultManager_onceToken_48351, block);
  }
  v2 = (void *)defaultManager_manager;

  return (PHImageManager *)v2;
}

- (int)requestImagePropertiesForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isPhoto])
  {
    if (v9) {
      id v11 = (PHImageRequestOptions *)[v9 copy];
    }
    else {
      id v11 = objc_alloc_init(PHImageRequestOptions);
    }
    id v14 = v11;
    if ([(PHImageRequestOptions *)v11 loadingMode] != 0x10000) {
      [(PHImageRequestOptions *)v14 setLoadingMode:0x10000];
    }
    int v13 = [(PHImageManager *)self _requestImagePropertiesFromFileForAsset:v8 options:v14 resultHandler:v10];
  }
  else
  {
    uint64_t v12 = PLImageManagerGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Requesting image properties from a non-photo asset is invalid", v16, 2u);
    }

    int v13 = 0;
  }

  return v13;
}

- (int)_requestImagePropertiesFromFileForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__PHImageManager_Properties___requestImagePropertiesFromFileForAsset_options_resultHandler___block_invoke;
  v11[3] = &unk_1E58460D8;
  id v12 = v8;
  id v9 = v8;
  LODWORD(a4) = -[PHImageManager requestImageForAsset:targetSize:contentMode:options:resultHandler:](self, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", a3, 0, a4, v11, -1.0, -1.0);

  return (int)a4;
}

void __92__PHImageManager_Properties___requestImagePropertiesFromFileForAsset_options_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  uint64_t v4 = [v10 objectForKey:@"PHImageFileURLKey"];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    v6 = [v4 path];
    int v7 = [v5 fileExistsAtPath:v6 isDirectory:0];

    id v8 = 0;
    if (v7)
    {
      CGImageSourceRef v9 = CGImageSourceCreateWithURL((CFURLRef)v4, 0);
      id v8 = (void *)[MEMORY[0x1E4F8A950] newImagePropertiesFromImageSource:v9];
      CFRelease(v9);
    }
  }
  else
  {
    id v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)fileTypeForOutputURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 pathExtension];
  uint64_t v4 = [MEMORY[0x1E4F8CDF8] typeForFilenameExtensionOrLastPathComponent:v3];
  uint64_t v5 = [v4 identifier];
  v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = PLImageManagerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543618;
      id v12 = v3;
      __int16 v13 = 2114;
      uint64_t v14 = 0;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Unable to map path extension %{public}@ to AVFileType: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    id v9 = (id)*MEMORY[0x1E4F15AB0];
    v6 = v9;
  }

  return v6;
}

+ (void)startExportSession:(id)a3 assetUuid:(id)a4 signpostId:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  __int16 v13 = [v10 outputURL];
  uint64_t v14 = [a1 fileTypeForOutputURL:v13];
  [v10 setOutputFileType:v14];

  uint64_t v15 = PLImageManagerGetLog();
  uint64_t v16 = v15;
  if (a5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v16, OS_SIGNPOST_INTERVAL_BEGIN, a5, "com.apple.photos.backend.adpExportVideoFileTimeRange.exportSession", (const char *)&unk_19B30018E, buf, 2u);
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__PHImageManager_VideoUtilities__startExportSession_assetUuid_signpostId_completion___block_invoke;
  v20[3] = &unk_1E5848A60;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  unint64_t v24 = a5;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v19 exportAsynchronouslyWithCompletionHandler:v20];
}

void __85__PHImageManager_VideoUtilities__startExportSession_assetUuid_signpostId_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = PLImageManagerGetLog();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v3, OS_SIGNPOST_INTERVAL_END, v4, "com.apple.photos.backend.adpExportVideoFileTimeRange.exportSession", (const char *)&unk_19B30018E, (uint8_t *)&v10, 2u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) status];
  if (v5 == 3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v6 = v5;
    BOOL v7 = [*(id *)(a1 + 32) error];
    id v8 = PLImageManagerGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138412802;
      uint64_t v11 = v9;
      __int16 v12 = 2048;
      uint64_t v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "ADP time range export session completed unsuccessfully for asset %@: status=%td, error: %@", (uint8_t *)&v10, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (void)exportVideoFileForTimeRange:(id *)a3 fromVideoMediaItemMakerData:(id)a4 forAssetUuid:(id)a5 toOutputFileURL:(id)a6 fingerPrint:(id)a7 signpostId:(unint64_t)a8 options:(id)a9 completion:(id)a10
{
  v67[2] = *MEMORY[0x1E4F143B8];
  id v52 = a4;
  id v54 = a5;
  id v16 = a6;
  id v51 = a7;
  id v50 = a9;
  id v17 = a10;
  if ((a3->var0.var2 & 1) == 0 || (a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHImageManager+VideoUtilities.m", 190, @"Invalid parameter not satisfying: %@", @"CMTIMERANGE_IS_VALID(timeRange)" object file lineNumber description];
  }
  id v19 = v52;
  if (!v52)
  {
    uint64_t v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, a1, @"PHImageManager+VideoUtilities.m", 191, @"Invalid parameter not satisfying: %@", @"videoMediaItemMakerData" object file lineNumber description];
  }
  if (!v54)
  {
    id v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, a1, @"PHImageManager+VideoUtilities.m", 192, @"Invalid parameter not satisfying: %@", @"assetUuid" object file lineNumber description];
  }
  if (([v16 isFileURL] & 1) == 0)
  {
    id v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, a1, @"PHImageManager+VideoUtilities.m", 193, @"Invalid parameter not satisfying: %@", @"[outputURL isFileURL]" object file lineNumber description];

    if (v17) {
      goto LABEL_11;
    }
LABEL_35:
    id v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, a1, @"PHImageManager+VideoUtilities.m", 194, @"Invalid parameter not satisfying: %@", @"originalCompletion" object file lineNumber description];

    goto LABEL_11;
  }
  if (!v17) {
    goto LABEL_35;
  }
LABEL_11:
  v49 = v16;
  __int16 v20 = PLImageManagerGetLog();
  id v21 = v20;
  unint64_t v22 = a8 - 1;
  if (a8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v21, OS_SIGNPOST_INTERVAL_BEGIN, a8, "com.apple.photos.backend.adpExportVideoTimeRange", (const char *)&unk_19B30018E, buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __161__PHImageManager_VideoUtilities__exportVideoFileForTimeRange_fromVideoMediaItemMakerData_forAssetUuid_toOutputFileURL_fingerPrint_signpostId_options_completion___block_invoke;
  aBlock[3] = &unk_1E5846380;
  unint64_t v59 = a8;
  id v48 = v17;
  id v58 = v48;
  id v23 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  id v56 = 0;
  unint64_t v24 = (void *)[objc_alloc((Class)getCKMediaItemMakerClass()) initWithData:v52 error:&v56];
  id v25 = v56;
  uint64_t v26 = v25;
  if (v24)
  {
    uint64_t v27 = [a1 mediaItemURLForAssetUuid:v54 fingerPrint:v51 outOfBandPresentationHints:0];
    v28 = [MEMORY[0x1E4F1CA60] dictionary];
    id v29 = [v50 objectForKey:@"PHVideoExportOmitFromAssetCacheKey"];
    char v30 = [v29 BOOLValue];

    if ((v30 & 1) == 0) {
      [a1 configureAssetCacheInAssetCreationOptionsDictionary:v28];
    }
    v31 = PLImageManagerGetLog();
    uint64_t v32 = v31;
    if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v32, OS_SIGNPOST_INTERVAL_BEGIN, a8, "com.apple.photos.backend.adpExportVideoTimeRange.makeExportSession", (const char *)&unk_19B30018E, buf, 2u);
    }

    os_signpost_id_t v33 = [v24 makeAVAssetExportSession:v27 options:v28 presetName:*MEMORY[0x1E4F15758]];
    uint64_t v34 = PLImageManagerGetLog();
    uint64_t v35 = v34;
    if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v35, OS_SIGNPOST_INTERVAL_END, a8, "com.apple.photos.backend.adpExportVideoTimeRange.makeExportSession", (const char *)&unk_19B30018E, buf, 2u);
    }

    if (v33)
    {
      long long v36 = *(_OWORD *)&a3->var0.var3;
      v55[0] = *(_OWORD *)&a3->var0.var0;
      v55[1] = v36;
      v55[2] = *(_OWORD *)&a3->var1.var1;
      [v33 setTimeRange:v55];
      [v33 setOutputURL:v49];
      [a1 startExportSession:v33 assetUuid:v54 signpostId:a8 completion:v23];
    }
    else
    {
      id v40 = PLImageManagerGetLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v63 = v24;
        __int16 v64 = 2112;
        id v65 = v54;
        _os_log_impl(&dword_19B043000, v40, OS_LOG_TYPE_ERROR, "Media item maker %@ failed to create export session for asset %@", buf, 0x16u);
      }

      id v41 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v60 = *MEMORY[0x1E4F28228];
      v61 = @"Unable to perform ADP video partial time range export, media item maker failed to create export session";
      uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      uint64_t v43 = [v41 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v42];

      v23[2](v23, 0, v43);
    }

    id v19 = v52;
  }
  else
  {
    id v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28A50];
    v66[0] = *MEMORY[0x1E4F28228];
    v66[1] = v38;
    v67[0] = @"Unable to perform ADP video partial time range export, failed to deserialize media item maker";
    v67[1] = v25;
    id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:2];
    os_signpost_id_t v33 = [v37 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v39];

    v23[2](v23, 0, v33);
    uint64_t v27 = PLImageManagerGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v63 = v54;
      __int16 v64 = 2112;
      id v65 = v26;
      _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "Unable to deserialize media item maker for asset %@ to create export session: %@", buf, 0x16u);
    }
  }
}

void __161__PHImageManager_VideoUtilities__exportVideoFileForTimeRange_fromVideoMediaItemMakerData_forAssetUuid_toOutputFileURL_fingerPrint_signpostId_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = PLImageManagerGetLog();
  uint64_t v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 40);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v6, OS_SIGNPOST_INTERVAL_END, v7, "com.apple.photos.backend.adpExportVideoTimeRange", (const char *)&unk_19B30018E, v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)mediaItemURLForAssetUuid:(id)a3 fingerPrint:(id)a4 outOfBandPresentationHints:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  int v10 = objc_opt_new();
  [v10 setScheme:@"photos-avasset"];
  uint64_t v11 = [MEMORY[0x1E4F28E78] stringWithString:v9];

  if (v7)
  {
    __int16 v12 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    uint64_t v13 = (void *)[v12 mutableCopy];

    [v13 removeCharactersInString:@"/"];
    __int16 v14 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v13];
    [v11 appendFormat:@"/%@", v14];
  }
  [v10 setPath:v11];
  if ([v8 length]) {
    [v10 setFragment:v8];
  }
  uint64_t v15 = [v10 URL];

  return v15;
}

+ (id)playerItemFromVideoMediaItemMakerData:(id)a3 forAssetUuid:(id)a4 fingerPrint:(id)a5 outOfBandPresentationHints:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v21 = 0;
  __int16 v14 = (void *)[objc_alloc((Class)getCKMediaItemMakerClass()) initWithData:v13 error:&v21];

  id v15 = v21;
  if (v14)
  {
    id v16 = [a1 mediaItemURLForAssetUuid:v10 fingerPrint:v11 outOfBandPresentationHints:v12];
    id v17 = [MEMORY[0x1E4F1CA60] dictionary];
    [a1 configureAssetCacheInAssetCreationOptionsDictionary:v17];
    id v18 = [v14 makeAVPlayerItemWithURL:v16 options:v17];
    if (!v18)
    {
      id v19 = PLImageManagerGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v14;
        __int16 v24 = 2112;
        id v25 = v10;
        _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_ERROR, "Media item maker %@ failed to create player item for asset %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v16 = PLImageManagerGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Unable to deserialize media item maker for asset %@: %@", buf, 0x16u);
    }
    id v18 = 0;
  }

  return v18;
}

+ (id)playerItemFromVideoMediaItemMakerDataInMediaResult:(id)a3 forAsset:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 videoMediaItemMakerData];
  id v9 = [v7 fingerPrint];
  id v10 = [v7 info];

  id v11 = [v10 objectForKey:@"PHImageResultAVAssetOutOfBandPresentationHintsKey"];

  id v12 = [v6 uuid];

  id v13 = [a1 playerItemFromVideoMediaItemMakerData:v8 forAssetUuid:v12 fingerPrint:v9 outOfBandPresentationHints:v11];

  return v13;
}

+ (void)buildExportSessionFromVideoURL:(id)a3 infoDictionary:(id)a4 options:(id)a5 exportPreset:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v15 objectForKeyedSubscript:@"PHImageFileSandboxExtensionTokenKey"];
  id v18 = +[PHSandboxExtensionWrapper wrapperWithToken:v17];
  id v19 = [a1 _videoAVObjectBuilderFromVideoURL:v16 info:v15 options:v14 playbackOnly:0];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __112__PHImageManager_VideoUtilities__buildExportSessionFromVideoURL_infoDictionary_options_exportPreset_completion___block_invoke;
  v22[3] = &unk_1E5846358;
  id v23 = v18;
  id v24 = v12;
  id v20 = v12;
  id v21 = v18;
  [v19 requestExportSessionWithExportPreset:v13 resultHandler:v22];
}

void __112__PHImageManager_VideoUtilities__buildExportSessionFromVideoURL_infoDictionary_options_exportPreset_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id object = a2;
  id v5 = a3;
  if (object) {
    objc_setAssociatedObject(object, "PHSandboxExtensionWrapperKey", *(id *)(a1 + 32), (void *)0x301);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)buildAVPlayerItemFromRemoteStreamVideoURL:(id)a3 infoDictionary:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _videoAVObjectBuilderFromVideoURL:a3 info:a4 options:0 playbackOnly:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__PHImageManager_VideoUtilities__buildAVPlayerItemFromRemoteStreamVideoURL_infoDictionary_completion___block_invoke;
  v11[3] = &unk_1E5846330;
  id v12 = v8;
  id v10 = v8;
  [v9 requestAsynchronousPlayerItemWithResultHandler:v11];
}

uint64_t __102__PHImageManager_VideoUtilities__buildAVPlayerItemFromRemoteStreamVideoURL_infoDictionary_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)buildAVAssetFromVideoURL:(id)a3 infoDictionary:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v12 objectForKeyedSubscript:@"PHImageFileSandboxExtensionTokenKey"];
  id v15 = +[PHSandboxExtensionWrapper wrapperWithToken:v14];
  id v16 = [a1 _videoAVObjectBuilderFromVideoURL:v13 info:v12 options:v11 playbackOnly:0];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__PHImageManager_VideoUtilities__buildAVAssetFromVideoURL_infoDictionary_options_completion___block_invoke;
  v19[3] = &unk_1E5846308;
  id v20 = v15;
  id v21 = v10;
  id v17 = v10;
  id v18 = v15;
  [v16 requestAVAssetWithResultHandler:v19];
}

void __93__PHImageManager_VideoUtilities__buildAVAssetFromVideoURL_infoDictionary_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id object = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (object) {
    objc_setAssociatedObject(object, "PHSandboxExtensionWrapperKey", *(id *)(a1 + 32), (void *)0x301);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)buildAVPlayerItemFromVideoURL:(id)a3 infoDictionary:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v12 objectForKeyedSubscript:@"PHImageFileSandboxExtensionTokenKey"];
  id v15 = +[PHSandboxExtensionWrapper wrapperWithToken:v14];
  id v16 = [a1 _videoAVObjectBuilderFromVideoURL:v13 info:v12 options:v11 playbackOnly:1];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__PHImageManager_VideoUtilities__buildAVPlayerItemFromVideoURL_infoDictionary_options_completion___block_invoke;
  v20[3] = &unk_1E58462E0;
  id v22 = v16;
  id v23 = v10;
  id v21 = v15;
  id v17 = v16;
  id v18 = v10;
  id v19 = v15;
  [v17 requestAsynchronousPlayerItemWithResultHandler:v20];
}

void __98__PHImageManager_VideoUtilities__buildAVPlayerItemFromVideoURL_infoDictionary_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id object = a2;
  id v5 = a3;
  if (object) {
    objc_setAssociatedObject(object, "PHSandboxExtensionWrapperKey", *(id *)(a1 + 32), (void *)0x301);
  }
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 40) playbackTimeRangeMapper];
  (*(void (**)(uint64_t, id, void *, id))(v6 + 16))(v6, object, v7, v5);
}

+ (void)configureAssetCacheInAssetCreationOptionsDictionary:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F8AAB0] debugAlwaysStreamSharedVideos] & 1) == 0
    && [MEMORY[0x1E4F8B9D8] isEntitledForPhotoKit])
  {
    uint64_t v3 = [MEMORY[0x1E4F8AAB0] streamdVideoCache];
    [v4 setObject:v3 forKey:*MEMORY[0x1E4F16108]];
  }
}

+ (id)_videoAVObjectBuilderFromVideoURL:(id)a3 info:(id)a4 options:(id)a5 playbackOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v6 && ([v10 isFileURL] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v14 = MEMORY[0x1E4F1CC38];
    [v13 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F16168]];
    [v13 setObject:v14 forKey:*MEMORY[0x1E4F16128]];
    [v13 setObject:v14 forKey:*MEMORY[0x1E4F16130]];
    [v13 setObject:v14 forKey:*MEMORY[0x1E4F16150]];
    [a1 configureAssetCacheInAssetCreationOptionsDictionary:v13];
  }
  else
  {
    id v13 = 0;
  }
  id v15 = [MEMORY[0x1E4F166C8] URLAssetWithURL:v10 options:v13];
  id v16 = [v11 objectForKeyedSubscript:@"PHAdjustmentDataKey"];
  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F8CE18]);
    id v18 = [v16 formatIdentifier];
    id v19 = [v16 formatVersion];
    id v20 = [v16 data];
    id v21 = (void *)[v17 initWithFormatIdentifier:v18 formatVersion:v19 data:v20 baseVersion:0 editorBundleID:0 renderTypes:0];
  }
  else
  {
    id v21 = 0;
  }
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F8CE00]) initWithVideoAsset:v15 videoAdjustments:v21];
  id v23 = [v11 objectForKeyedSubscript:@"PHApplyTimeRangeKey"];
  int v24 = [v23 BOOLValue];

  if (v24)
  {
    if (v12)
    {
      [v12 timeRange];
    }
    else
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v27 = 0u;
    }
    v26[0] = v27;
    v26[1] = v28;
    v26[2] = v29;
    [v22 setTimeRange:v26];
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);

  objc_storeStrong((id *)&self->_requestContextsByID, 0);
}

- (unint64_t)managerID
{
  return self->_managerID;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (int)requestAVProxyForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isVideo])
  {
    uint64_t v11 = [(PHImageManager *)self nextID];
    unint64_t v12 = [(PHImageManager *)self managerID];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __63__PHImageManager_requestAVProxyForAsset_options_resultHandler___block_invoke;
    id v20 = &unk_1E5848B00;
    id v21 = v8;
    id v22 = self;
    id v23 = v9;
    id v24 = v10;
    id v13 = +[PHSingleMediaRequestContext avProxyRequestContextWithRequestID:v11 managerID:v12 asset:v21 options:v23 resultHandler:&v17];
    int v14 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v13, v17, v18, v19, v20);

    id v15 = v21;
  }
  else
  {
    id v15 = PLImageManagerGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Requesting avproxy from a non-video asset is invalid", buf, 2u);
    }
    int v14 = 0;
  }

  return v14;
}

void __63__PHImageManager_requestAVProxyForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 info];
  id v8 = [v7 objectForKeyedSubscript:@"PHMediaMetadataTypeKey"];

  if (v8)
  {
    if ([v8 isEqualToString:@"AVAssetProxy"]
      && ([v5 mediaMetadata], id v9 = objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      id v10 = (void *)MEMORY[0x1E4F28F98];
      uint64_t v11 = [v5 mediaMetadata];
      id v35 = 0;
      unint64_t v12 = [v10 propertyListWithData:v11 options:0 format:0 error:&v35];
      id v13 = v35;

      if (v12)
      {
        int v14 = [MEMORY[0x1E4F16330] assetProxyWithPropertyList:v12];
      }
      else
      {
        int v14 = 0;
      }

      if (v14) {
        goto LABEL_19;
      }
    }
    else
    {
      id v15 = PLImageManagerGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = [*(id *)(a1 + 32) uuid];
        uint64_t v17 = [v5 mediaMetadata];
        *(_DWORD *)buf = 138543874;
        id v39 = v16;
        __int16 v40 = 2114;
        id v41 = v8;
        __int16 v42 = 2048;
        uint64_t v43 = [v17 length];
        _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "Failed to create avproxy for asset %{public}@ with metadata type %{public}@, data length: %ld", buf, 0x20u);
      }
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v36 = *MEMORY[0x1E4F28228];
      id v37 = @"Unable to create avproxy, wrong type or nonexistent data";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v13 = [v18 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v19];
    }
  }
  else
  {
    id v13 = [v5 videoURL];

    if (v13)
    {
      id v20 = (void *)MEMORY[0x1E4F16330];
      id v21 = [v5 videoURL];
      int v14 = [v20 assetWithURL:v21];

      id v13 = 0;
      if (v14) {
        goto LABEL_19;
      }
    }
  }
  id v22 = [v5 error];

  int v14 = 0;
  if (v22 && !v13)
  {
    id v23 = PLImageManagerGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      id v24 = [*(id *)(a1 + 32) uuid];
      id v25 = [v5 error];
      *(_DWORD *)buf = 138543618;
      id v39 = v24;
      __int16 v40 = 2112;
      id v41 = v25;
      _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_ERROR, "Failed to create avproxy for asset %{public}@, error: %@", buf, 0x16u);
    }
    id v13 = [v5 error];
    int v14 = 0;
  }
LABEL_19:
  [v5 setErrorIfNone:v13];
  uint64_t v26 = *(void **)(a1 + 40);
  uint64_t v27 = *(void *)(a1 + 48);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __63__PHImageManager_requestAVProxyForAsset_options_resultHandler___block_invoke_721;
  v31[3] = &unk_1E58487E0;
  id v28 = *(id *)(a1 + 56);
  id v33 = v5;
  id v34 = v28;
  id v32 = v14;
  id v29 = v5;
  id v30 = v14;
  [v26 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v6 options:v27 block:v31];
}

void __63__PHImageManager_requestAVProxyForAsset_options_resultHandler___block_invoke_721(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) sanitizedInfoDictionary];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);
}

- (int)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9) {
    uint64_t v11 = (PHImageRequestOptions *)[v9 copy];
  }
  else {
    uint64_t v11 = objc_alloc_init(PHImageRequestOptions);
  }
  unint64_t v12 = v11;
  [(PHImageRequestOptions *)v11 setLoadingMode:0x10000];
  [(PHImageRequestOptions *)v12 setDeliveryMode:1];
  uint64_t v13 = [(PHImageManager *)self nextID];
  int v14 = PLImageManagerGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v12;
    _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "(animated image) options: %@", buf, 0xCu);
  }

  if (PHImageManagerRecordEnabled()) {
    +[PHImageManagerRequestTracer traceMessageForRequestID:v13, @"(animated image) options: %@", v12 message];
  }
  unint64_t managerID = self->_managerID;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __69__PHImageManager_requestAnimatedImageForAsset_options_resultHandler___block_invoke;
  v32[3] = &unk_1E5848B50;
  id v16 = v12;
  id v33 = v16;
  id v34 = self;
  id v17 = v10;
  id v35 = v17;
  int v36 = v13;
  uint64_t v18 = +[PHMediaRequestContext imageRequestContextWithRequestID:v13 managerID:managerID asset:v8 imageRequestOptions:v16 displaySpec:0 resultHandler:v32];
  if (PHSignpostEventsEnabled_onceToken != -1) {
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
  }
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    id v19 = PLImageManagerGetLog();
    os_signpost_id_t v20 = os_signpost_id_generate(v19);
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v21 = v20;
      uint64_t v30 = [v18 managerID];
      id v31 = v8;
      int v28 = [v18 requestID];
      uint64_t v29 = [v18 type];
      if (_getNextLayoutID_onceToken != -1) {
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
      }
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      uint64_t v22 = [(id)s_availableLayoutIDs firstIndex];
      if (v22 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v23 = 101;
      }
      else
      {
        uint64_t v23 = v22;
        [(id)s_availableLayoutIDs removeIndex:v22];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      id v24 = [v18 asset];
      id v25 = [v24 uuid];

      [v18 setSignpostID:v21];
      [v18 setSignpostLayoutID:v23];
      if (os_signpost_enabled(v19))
      {
        *(_DWORD *)buf = 134219266;
        uint64_t v38 = (PHImageRequestOptions *)v30;
        __int16 v39 = 2048;
        uint64_t v40 = v28;
        __int16 v41 = 2112;
        __int16 v42 = &stru_1EEAC1950;
        __int16 v43 = 2048;
        uint64_t v44 = v29;
        __int16 v45 = 2112;
        id v46 = v25;
        __int16 v47 = 2048;
        uint64_t v48 = v23;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v21, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
      }

      id v8 = v31;
    }
  }
  int v26 = [(PHImageManager *)self runRequestWithContext:v18];

  return v26;
}

void __69__PHImageManager_requestAnimatedImageForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 imageURL];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = *(id *)(a1 + 32);
      id v9 = [PHAnimatedImage alloc];
      if ([v8 allowPreCaching]) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 0;
      }
      uint64_t v11 = [v8 useSharedImageDecoding];

      unint64_t v12 = [(PHAnimatedImage *)v9 initWithURL:v7 cachingStrategy:v10 useSharedDecoding:v11];
    }
    else
    {
      unint64_t v12 = [[PHAnimatedImage alloc] initWithURL:v7];
    }
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v15 = *(void *)(a1 + 32);
  int v14 = *(void **)(a1 + 40);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__PHImageManager_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2;
  v19[3] = &unk_1E5848B28;
  id v16 = *(id *)(a1 + 48);
  os_signpost_id_t v21 = v13;
  id v22 = v16;
  int v23 = *(_DWORD *)(a1 + 56);
  id v20 = v5;
  id v17 = v13;
  id v18 = v5;
  [v14 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v6 options:v15 block:v19];
}

void __69__PHImageManager_requestAnimatedImageForAsset_options_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 32) sanitizedInfoDictionary];
    id v3 = PLImageManagerGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "(animated image) called resultHandler with info: %@", buf, 0xCu);
    }

    if (PHImageManagerRecordEnabled()) {
      +[PHImageManagerRequestTracer traceMessageForRequestID:*(unsigned int *)(a1 + 56), @"(animated image) called resultHandler with info: %@", v2 message];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (int)requestContentEditingInputForAsset:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void *)[a4 copy];
  BOOL v11 = +[PHContentEditingInputRequestContext shouldUseRAWResourceAsUnadjustedBaseForAsset:v8 options:v10];
  uint64_t v12 = [(PHImageManager *)self nextID];
  unint64_t managerID = self->_managerID;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __83__PHImageManager_requestContentEditingInputForAsset_withOptions_completionHandler___block_invoke;
  v32[3] = &unk_1E5848B00;
  void v32[4] = self;
  id v14 = v10;
  id v33 = v14;
  id v15 = v8;
  id v34 = v15;
  id v16 = v9;
  id v35 = v16;
  id v17 = +[PHMediaRequestContext contentEditingInputRequestContextWithRequestID:v12 managerID:managerID asset:v15 options:v14 useRAWAsUnadjustedBase:v11 resultHandler:v32];
  if (PHSignpostEventsEnabled_onceToken != -1) {
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
  }
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    id v18 = PLImageManagerGetLog();
    os_signpost_id_t v19 = os_signpost_id_generate(v18);
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      uint64_t v21 = [v17 managerID];
      int v22 = [v17 requestID];
      uint64_t v30 = [v17 type];
      uint64_t v31 = v21;
      int v29 = v22;
      if (_getNextLayoutID_onceToken != -1) {
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
      }
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      uint64_t v23 = [(id)s_availableLayoutIDs firstIndex];
      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v24 = 101;
      }
      else
      {
        uint64_t v24 = v23;
        [(id)s_availableLayoutIDs removeIndex:v23];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      id v25 = [v17 asset];
      int v26 = [v25 uuid];

      [v17 setSignpostID:v20];
      [v17 setSignpostLayoutID:v24];
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 134219266;
        uint64_t v37 = v31;
        __int16 v38 = 2048;
        uint64_t v39 = v29;
        __int16 v40 = 2112;
        __int16 v41 = &stru_1EEAC1950;
        __int16 v42 = 2048;
        uint64_t v43 = v30;
        __int16 v44 = 2112;
        __int16 v45 = v26;
        __int16 v46 = 2048;
        uint64_t v47 = v24;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v20, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
      }
    }
  }
  int v27 = [(PHImageManager *)self runRequestWithContext:v17];

  return v27;
}

uint64_t __83__PHImageManager_requestContentEditingInputForAsset_withOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _handleResultForContentEditingInput:a2 request:a3 options:*(void *)(a1 + 40) asset:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)_handleResultForContentEditingInput:(id)a3 request:(id)a4 options:(id)a5 asset:(id)a6 completionHandler:(id)a7
{
  v88[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v11 videoURL];
  id v17 = [v11 imageURL];
  if ([v14 isPhoto] && v17
    || (id v18 = 0, [v14 isVideo]) && v16)
  {
    os_signpost_id_t v19 = [v11 error];

    if (v19)
    {
      id v18 = 0;
      goto LABEL_31;
    }
    v67 = v16;
    os_signpost_id_t v20 = (void *)MEMORY[0x1E4F8CDF8];
    uint64_t v21 = [v11 uniformTypeIdentifier];
    int v22 = [v20 typeWithIdentifier:v21];
    char v23 = [v22 conformsToType:*MEMORY[0x1E4F44498]];

    if (!objc_msgSend(v14, "shouldUseRAWResourceWithOriginalResourceChoice:", objc_msgSend(v14, "originalResourceChoice")))goto LABEL_11; {
    if (v23)
    }
      goto LABEL_11;
    uint64_t v24 = [v11 baseVersionNeeded];
    if (!v24) {
      goto LABEL_11;
    }
    id v25 = (void *)v24;
    int v26 = [v11 baseVersionNeeded];
    uint64_t v27 = [v26 integerValue];

    if (!v27)
    {
      int v28 = NSNumber;
      uint64_t v29 = [v14 originalChoiceToFallbackForUnsupportRAW];
    }
    else
    {
LABEL_11:
      if (![v13 shouldForceOriginalChoice])
      {
        v68 = 0;
        goto LABEL_16;
      }
      int v28 = NSNumber;
      uint64_t v29 = [v13 originalChoice];
    }
    v68 = [v28 numberWithUnsignedInteger:v29];
LABEL_16:
    v70 = [v11 uniformTypeIdentifier];
    if ([v11 imageRef]) {
      v69 = (void *)DCIM_newPLImageWithCGImage();
    }
    else {
      v69 = 0;
    }
    uint64_t v30 = [v11 exifOrientation];
    unsigned int v65 = [v30 intValue];

    char v31 = [v11 canHandleAdjustmentData];
    id v32 = [v11 baseVersionNeeded];
    uint64_t v63 = [v32 integerValue];

    id v33 = [PHContentEditingInput alloc];
    id v34 = [v14 photoLibrary];
    id v35 = [v34 photoLibraryURL];
    id v18 = [(PHContentEditingInput *)v33 initWithAppropriateURL:v35];

    -[PHContentEditingInput setMediaType:](v18, "setMediaType:", [v14 mediaType]);
    -[PHContentEditingInput setMediaSubtypes:](v18, "setMediaSubtypes:", [v14 mediaSubtypes]);
    -[PHContentEditingInput setPlaybackStyle:](v18, "setPlaybackStyle:", [v14 playbackStyle]);
    int v36 = [v14 creationDate];
    [(PHContentEditingInput *)v18 setCreationDate:v36];

    uint64_t v37 = [v14 location];
    [(PHContentEditingInput *)v18 setLocation:v37];

    if (v31)
    {
      __int16 v38 = [v11 adjustmentData];
      [(PHContentEditingInput *)v18 setAdjustmentData:v38];

      uint64_t v39 = [v11 adjustmentSecondaryDataURL];
      [(PHContentEditingInput *)v18 setAdjustmentSecondaryDataURL:v39];
    }
    else
    {
      [(PHContentEditingInput *)v18 setAdjustmentData:0];
      [(PHContentEditingInput *)v18 setAdjustmentSecondaryDataURL:0];
    }
    [(PHContentEditingInput *)v18 setBaseVersion:v63];
    [(PHContentEditingInput *)v18 setDisplaySizeImage:v69];
    [(PHContentEditingInput *)v18 setFullSizeImageURL:v17];
    [(PHContentEditingInput *)v18 setUniformTypeIdentifier:v70];
    [(PHContentEditingInput *)v18 setFullSizeImageOrientation:v65];
    __int16 v40 = [v11 imageSandboxExtensionToken];
    [(PHContentEditingInput *)v18 consumeSandboxExtensionToken:v40];

    [(PHContentEditingInput *)v18 setOriginalResourceChoice:v68];
    id v16 = v67;
    if (v67 && v17)
    {
      __int16 v41 = [v11 videoSandboxExtensionToken];
      [(PHContentEditingInput *)v18 consumeSandboxExtensionToken:v41];

      if (([v13 forceReturnFullLivePhoto] & 1) != 0 || (objc_msgSend(v14, "mediaSubtypes") & 8) != 0)
      {
        if ([v14 playbackStyle] == 5)
        {
          v88[0] = v67;
          v88[1] = v17;
          __int16 v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
          uint64_t v78 = 0;
          uint64_t v43 = (id *)&v78;
          uint64_t v44 = +[PHLivePhoto loopingLivePhotoWithResourceFileURLs:skipInstantiatingImageAndAVAsset:error:](PHLivePhoto, "loopingLivePhotoWithResourceFileURLs:skipInstantiatingImageAndAVAsset:error:", v42, [v13 skipLivePhotoImageAndAVAsset], &v78);
        }
        else
        {
          v87[0] = v67;
          v87[1] = v17;
          __int16 v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
          uint64_t v57 = [v13 skipLivePhotoImageAndAVAsset];
          uint64_t v77 = 0;
          uint64_t v43 = (id *)&v77;
          uint64_t v44 = +[PHLivePhoto livePhotoWithResourceFileURLs:targetSize:contentMode:skipInstantiatingImageAndAVAsset:error:](PHLivePhoto, "livePhotoWithResourceFileURLs:targetSize:contentMode:skipInstantiatingImageAndAVAsset:error:", v42, 1, v57, &v77, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
        }
        id v58 = (void *)v44;
        id v59 = *v43;

        if (!v58)
        {
          uint64_t v60 = PLImageManagerGetLog();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            __int16 v64 = [v14 localIdentifier];
            uint64_t v62 = [v59 code];
            [v59 domain];
            v61 = id v66 = v59;
            *(_DWORD *)buf = 138544130;
            v80 = v64;
            __int16 v81 = 2112;
            id v82 = v66;
            __int16 v83 = 2048;
            uint64_t v84 = v62;
            __int16 v85 = 2114;
            v86 = v61;
            _os_log_impl(&dword_19B043000, v60, OS_LOG_TYPE_ERROR, "Unable to create PHLivePhoto object for asset with localIdentifier: %{public}@, error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);

            id v59 = v66;
          }
        }
        [(PHContentEditingInput *)v18 setLivePhoto:v58];

        id v16 = v67;
      }
      if ([v14 playbackStyle] != 5) {
        goto LABEL_30;
      }
    }
    else if (!v67)
    {
LABEL_30:
      id v45 = v11;
      __int16 v46 = [v45 overCapturePhotoURL];
      [(PHContentEditingInput *)v18 setOverCapturePhotoURL:v46];

      uint64_t v47 = [v45 overCaptureVideoURL];
      [(PHContentEditingInput *)v18 setOverCaptureVideoURL:v47];

      uint64_t v48 = [v45 frontSwappingImageRenderURL];
      [(PHContentEditingInput *)v18 setFrontSwappingImageRenderURL:v48];

      uint64_t v49 = [v45 backSwappingImageRenderURL];
      [(PHContentEditingInput *)v18 setBackSwappingImageRenderURL:v49];

      id v50 = [v45 frontSwappingVideoRenderURL];
      [(PHContentEditingInput *)v18 setFrontSwappingVideoRenderURL:v50];

      id v51 = [v45 backSwappingVideoRenderURL];
      [(PHContentEditingInput *)v18 setBackSwappingVideoRenderURL:v51];

      id v52 = [v45 originalAdjustmentData];

      [(PHContentEditingInput *)v18 setOriginalAdjustmentData:v52];
      goto LABEL_31;
    }
    [(PHContentEditingInput *)v18 setVideoURL:v16];
    goto LABEL_30;
  }
LABEL_31:
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __94__PHImageManager__handleResultForContentEditingInput_request_options_asset_completionHandler___block_invoke;
  v72[3] = &unk_1E5848948;
  id v73 = v11;
  id v74 = v12;
  v75 = v18;
  id v76 = v15;
  __int16 v53 = v18;
  id v54 = v12;
  id v55 = v11;
  id v56 = v15;
  [(PHImageManager *)self _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v54 options:v13 block:v72];
}

void __94__PHImageManager__handleResultForContentEditingInput_request_options_asset_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 56))
  {
    uint64_t v2 = [*(id *)(a1 + 32) sanitizedInfoDictionary];
    id v3 = PLImageManagerGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [*(id *)(a1 + 40) identifierString];
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543874;
      id v7 = v4;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v2;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ content editing input request finished with %@, info: %@", (uint8_t *)&v6, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (int)requestAVAssetForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(id)objc_opt_class() _allowVideoAccessForAsset:v8 options:v9])
  {
    if (v9) {
      id v11 = (PHVideoRequestOptions *)[v9 copy];
    }
    else {
      id v11 = objc_alloc_init(PHVideoRequestOptions);
    }
    id v15 = v11;
    id v16 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v13 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.photos.requestAVAsset", v13);
    [(PHVideoRequestOptions *)v15 setResultHandlerQueue:v17];

    uint64_t v12 = v15;
    if ([v8 deferredProcessingNeeded] == 2
      && [(PHVideoRequestOptions *)v12 liveRenderVideoIfNeeded])
    {
      BOOL v18 = [(PHVideoRequestOptions *)v12 isCurrentVersion];

      if (v18)
      {
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke;
        v41[3] = &unk_1E5848880;
        os_signpost_id_t v19 = &v42;
        id v42 = v10;
        int v14 = [(PHImageManager *)self _requestLiveRenderAVAssetForAsset:v8 options:v12 resultHandler:v41];
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
    }
    uint64_t v20 = [(PHImageManager *)self nextID];
    unint64_t managerID = self->_managerID;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_2;
    v38[3] = &unk_1E5848A10;
    id v40 = v10;
    v38[4] = self;
    uint64_t v39 = v12;
    int v22 = +[PHMediaRequestContext videoRequestContextWithRequestID:v20 managerID:managerID asset:v8 videoRequestOptions:v39 intent:1 resultHandler:v38];
    if (PHSignpostEventsEnabled_onceToken != -1) {
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
    }
    os_signpost_id_t v19 = &v40;
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      char v23 = PLImageManagerGetLog();
      os_signpost_id_t v24 = os_signpost_id_generate(v23);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v25 = v24;
        uint64_t v35 = [v22 managerID];
        int v32 = [v22 requestID];
        uint64_t v34 = [v22 type];
        os_signpost_id_t v37 = v25;
        if (_getNextLayoutID_onceToken != -1) {
          dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
        }
        os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
        uint64_t v26 = [(id)s_availableLayoutIDs firstIndex];
        if (v26 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v27 = 101;
        }
        else
        {
          uint64_t v27 = v26;
          [(id)s_availableLayoutIDs removeIndex:v26];
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
        int v28 = [v22 asset];
        int v36 = [v28 uuid];

        [v22 setSignpostID:v37];
        [v22 setSignpostLayoutID:v27];
        uint64_t v29 = v23;
        if (os_signpost_enabled(v29))
        {
          uint64_t v31 = v32;
          [v9 targetSize];
          id v33 = DCIM_NSStringFromCGSize();
          *(_DWORD *)buf = 134219266;
          uint64_t v44 = v35;
          __int16 v45 = 2048;
          uint64_t v46 = v31;
          __int16 v47 = 2112;
          uint64_t v48 = v33;
          __int16 v49 = 2048;
          uint64_t v50 = v34;
          __int16 v51 = 2112;
          id v52 = v36;
          __int16 v53 = 2048;
          uint64_t v54 = v27;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v37, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
        }
        os_signpost_id_t v19 = &v40;
      }
    }
    int v14 = [(PHImageManager *)self runRequestWithContext:v22];

    goto LABEL_27;
  }
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3306, 0);
    uint64_t v12 = (PHVideoRequestOptions *)objc_claimAutoreleasedReturnValue();
    id v55 = @"PHImageErrorKey";
    v56[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
    (*((void (**)(id, void, void, void, NSObject *))v10 + 2))(v10, 0, 0, 0, v13);
    int v14 = 0;
LABEL_28:

    goto LABEL_29;
  }
  int v14 = 0;
LABEL_29:

  return v14;
}

uint64_t __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 videoURL];
  id v8 = (void *)v7;
  id v9 = a1[6];
  if (v9) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_5;
    block[3] = &unk_1E5848790;
    id v15 = &v23;
    id v16 = &v22;
    id v22 = v5;
    id v23 = v9;
    id v11 = v5;
    dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    [a1[4] _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v6 options:a1[5] block:v12];
  }
  else
  {
    id v13 = objc_opt_class();
    int v14 = [v5 info];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_3;
    v24[3] = &unk_1E5848AD8;
    id v15 = (id *)v25;
    v25[0] = v5;
    id v16 = &v28;
    id v17 = a1[5];
    id v18 = a1[6];
    id v19 = a1[4];
    id v28 = v18;
    v25[1] = v19;
    id v26 = v6;
    id v27 = a1[5];
    id v20 = v5;
    [v13 buildAVAssetFromVideoURL:v8 infoDictionary:v14 options:v17 completion:v24];
  }
}

void __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  [*(id *)(a1 + 32) setErrorIfNone:a5];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_4;
  block[3] = &unk_1E5848AB0;
  id v12 = *(id *)(a1 + 64);
  id v18 = v9;
  id v19 = v10;
  id v22 = v12;
  id v20 = v11;
  id v21 = *(id *)(a1 + 32);
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  [*(id *)(a1 + 40) _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:*(void *)(a1 + 48) options:*(void *)(a1 + 56) block:v16];
}

void __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) sanitizedInfoDictionary];
    (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
  }
}

void __63__PHImageManager_requestAVAssetForAsset_options_resultHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  id v5 = [*(id *)(a1 + 56) sanitizedInfoDictionary];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v4 + 16))(v4, v1, v2, v3, v5);
}

- (int)_requestLiveRenderAVAssetForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(PHImageManager *)self nextID];
  unint64_t managerID = self->_managerID;
  [v8 targetSize];
  double v14 = v13;
  double v16 = v15;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __74__PHImageManager__requestLiveRenderAVAssetForAsset_options_resultHandler___block_invoke;
  v36[3] = &unk_1E5848808;
  id v17 = v9;
  id v38 = v17;
  v36[4] = self;
  id v18 = v8;
  id v37 = v18;
  id v19 = +[PHLiveRenderEditingInputRequestContext videoLiveRenderContextWithRequestID:managerID:asset:options:targetSize:renderedVideoHandler:](PHLiveRenderEditingInputRequestContext, "videoLiveRenderContextWithRequestID:managerID:asset:options:targetSize:renderedVideoHandler:", v11, managerID, v10, v18, v36, v14, v16);

  id v20 = PLImageManagerGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v21 = self->_managerID;
    int v22 = [v19 requestID];
    *(_DWORD *)buf = 134218240;
    unint64_t v40 = v21;
    __int16 v41 = 2048;
    uint64_t v42 = v22;
    _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEFAULT, "%ld-%ld - Making edit request in preparation for live rendering video", buf, 0x16u);
  }

  if (PHSignpostEventsEnabled_onceToken != -1) {
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
  }
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    id v23 = PLImageManagerGetLog();
    os_signpost_id_t v24 = os_signpost_id_generate(v23);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v25 = v24;
      uint64_t v26 = [v19 managerID];
      int v27 = [v19 requestID];
      uint64_t v34 = v26;
      uint64_t v35 = [v19 type];
      if (_getNextLayoutID_onceToken != -1) {
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
      }
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      uint64_t v28 = [(id)s_availableLayoutIDs firstIndex];
      if (v28 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v29 = 101;
      }
      else
      {
        uint64_t v29 = v28;
        [(id)s_availableLayoutIDs removeIndex:v28];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      uint64_t v30 = [v19 asset];
      uint64_t v31 = [v30 uuid];

      [v19 setSignpostID:v25];
      [v19 setSignpostLayoutID:v29];
      if (os_signpost_enabled(v23))
      {
        *(_DWORD *)buf = 134219266;
        unint64_t v40 = v34;
        __int16 v41 = 2048;
        uint64_t v42 = v27;
        __int16 v43 = 2112;
        uint64_t v44 = &stru_1EEAC1950;
        __int16 v45 = 2048;
        uint64_t v46 = v35;
        __int16 v47 = 2112;
        uint64_t v48 = v31;
        __int16 v49 = 2048;
        uint64_t v50 = v29;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v25, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
      }
    }
  }
  int v32 = [(PHImageManager *)self runRequestWithContext:v19];

  return v32;
}

void __74__PHImageManager__requestLiveRenderAVAssetForAsset_options_resultHandler___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7)
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  double v15 = (void *)a1[6];
  if (v15)
  {
    id v17 = (void *)a1[4];
    uint64_t v16 = a1[5];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__PHImageManager__requestLiveRenderAVAssetForAsset_options_resultHandler___block_invoke_2;
    v18[3] = &unk_1E5848AB0;
    id v23 = v15;
    id v19 = v11;
    id v20 = v13;
    id v21 = v12;
    id v22 = v14;
    [v17 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:0 options:v16 block:v18];
  }
}

uint64_t __74__PHImageManager__requestLiveRenderAVAssetForAsset_options_resultHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[8] + 16))(a1[8], a1[4], a1[5], a1[6], a1[7]);
}

- (int)requestURLForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(PHImageManager *)self nextID];
  unint64_t managerID = self->_managerID;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __59__PHImageManager_requestURLForVideo_options_resultHandler___block_invoke;
  v32[3] = &unk_1E5848A88;
  id v13 = v9;
  id v34 = v13;
  id v14 = v8;
  id v33 = v14;
  double v15 = +[PHMediaRequestContext videoRequestContextWithRequestID:v11 managerID:managerID asset:v10 videoRequestOptions:v14 intent:3 resultHandler:v32];

  if (PHSignpostEventsEnabled_onceToken != -1) {
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
  }
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    uint64_t v16 = PLImageManagerGetLog();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v18 = v17;
      uint64_t v19 = [v15 managerID];
      int v20 = [v15 requestID];
      uint64_t v30 = [v15 type];
      uint64_t v31 = v19;
      if (_getNextLayoutID_onceToken != -1) {
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
      }
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      uint64_t v21 = [(id)s_availableLayoutIDs firstIndex];
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v22 = 101;
      }
      else
      {
        uint64_t v22 = v21;
        [(id)s_availableLayoutIDs removeIndex:v21];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      id v23 = [v15 asset];
      os_signpost_id_t v24 = [v23 uuid];

      [v15 setSignpostID:v18];
      [v15 setSignpostLayoutID:v22];
      os_signpost_id_t v25 = v16;
      if (os_signpost_enabled(v25))
      {
        uint64_t v29 = v20;
        [v14 targetSize];
        uint64_t v26 = DCIM_NSStringFromCGSize();
        *(_DWORD *)buf = 134219266;
        uint64_t v36 = v31;
        __int16 v37 = 2048;
        uint64_t v38 = v29;
        __int16 v39 = 2112;
        unint64_t v40 = v26;
        __int16 v41 = 2048;
        uint64_t v42 = v30;
        __int16 v43 = 2112;
        uint64_t v44 = v24;
        __int16 v45 = 2048;
        uint64_t v46 = v22;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v18, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
      }
    }
  }
  int v27 = [(PHImageManager *)self runRequestWithContext:v15];

  return v27;
}

void __59__PHImageManager_requestURLForVideo_options_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(void *)(a1 + 40))
  {
    id v5 = [v3 videoURL];
    id v6 = [*(id *)(a1 + 32) resultHandlerQueue];

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) resultHandlerQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__PHImageManager_requestURLForVideo_options_resultHandler___block_invoke_2;
      block[3] = &unk_1E58487E0;
      id v13 = *(id *)(a1 + 40);
      id v11 = v5;
      id v12 = v4;
      dispatch_async(v7, block);
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 40);
      id v9 = [v4 sanitizedInfoDictionary];
      (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v5, v9);
    }
  }
}

void __59__PHImageManager_requestURLForVideo_options_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) sanitizedInfoDictionary];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);
}

- (id)synchronousImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v11 = a6;
  id v12 = v11;
  if (v11) {
    id v13 = (PHImageRequestOptions *)[v11 copy];
  }
  else {
    id v13 = objc_alloc_init(PHImageRequestOptions);
  }
  id v14 = v13;
  [(PHImageRequestOptions *)v13 setSynchronous:1];
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__48264;
  id v23 = __Block_byref_object_dispose__48265;
  id v24 = 0;
  double v15 = +[PHImageManager defaultManager];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__PHImageManager_synchronousImageForAsset_targetSize_contentMode_options___block_invoke;
  v18[3] = &unk_1E5848A38;
  void v18[4] = &v19;
  objc_msgSend(v15, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v10, a5, v14, v18, width, height);

  id v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

void __74__PHImageManager_synchronousImageForAsset_targetSize_contentMode_options___block_invoke(uint64_t a1, void *a2)
{
}

- (int)requestStreamForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PLAvailabilityRequestGetLog();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v8);
  id v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v52 = (uint64_t)v8;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "com.apple.photos.backend.requestPlayerItemForVideo", "requestPlayerItemForVideo %@", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E5848998;
  double v15 = v14;
  uint64_t v48 = v15;
  os_signpost_id_t v50 = v12;
  id v16 = v10;
  id v49 = v16;
  os_signpost_id_t v17 = _Block_copy(aBlock);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_673;
  v45[3] = &unk_1E58489C0;
  id v18 = v17;
  id v46 = v18;
  uint64_t v19 = (void (**)(void *, id))_Block_copy(v45);
  if (v9) {
    int v20 = (PHVideoRequestOptions *)[v9 copy];
  }
  else {
    int v20 = objc_alloc_init(PHVideoRequestOptions);
  }
  uint64_t v21 = v20;
  id v44 = 0;
  BOOL v22 = [(PHVideoRequestOptions *)v20 isValidConfigurationWithError:&v44];
  id v23 = v44;
  if (!v22)
  {
    v19[2](v19, v23);
LABEL_22:
    int v28 = 0;
    goto LABEL_23;
  }
  if (![(PHVideoRequestOptions *)v21 restrictToStreamable]
    || ![(id)objc_opt_class() _allowVideoAccessForAsset:v8 options:v9]
    || ![(PHImageManager *)self _canStreamVideoForAsset:v8])
  {
    uint64_t v29 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3306, 0);
    v19[2](v19, v29);

    goto LABEL_22;
  }
  unsigned int spida = [(PHImageManager *)self nextID];
  unint64_t managerID = self->_managerID;
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_2;
  v41[3] = &unk_1E5848A10;
  id v43 = v18;
  void v41[4] = self;
  uint64_t v42 = v21;
  os_signpost_id_t v25 = +[PHMediaRequestContext videoRequestContextWithRequestID:spida managerID:managerID asset:v8 videoRequestOptions:v42 intent:0 resultHandler:v41];
  if (PHSignpostEventsEnabled_onceToken != -1) {
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
  }
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    unint64_t v40 = PLImageManagerGetLog();
    os_signpost_id_t spid = os_signpost_id_generate(v40);
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v33 = [v25 managerID];
      int v31 = [v25 requestID];
      uint64_t v32 = [v25 type];
      uint64_t NextLayoutID = _getNextLayoutID();
      [v25 asset];
      uint64_t v26 = v37 = v25;
      uint64_t v36 = [v26 uuid];

      os_signpost_id_t v25 = v37;
      [v37 setSignpostID:spid];
      [v37 setSignpostLayoutID:NextLayoutID];
      id v34 = v40;
      if (os_signpost_enabled(v34))
      {
        [v9 targetSize];
        int v27 = DCIM_NSStringFromCGSize();
        *(_DWORD *)buf = 134219266;
        uint64_t v52 = v33;
        __int16 v53 = 2048;
        uint64_t v54 = v31;
        __int16 v55 = 2112;
        id v56 = v27;
        __int16 v57 = 2048;
        uint64_t v58 = v32;
        __int16 v59 = 2112;
        uint64_t v60 = v36;
        __int16 v61 = 2048;
        uint64_t v62 = NextLayoutID;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v34, OS_SIGNPOST_INTERVAL_BEGIN, spid, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);

        os_signpost_id_t v25 = v37;
      }
    }
  }
  int v28 = [(PHImageManager *)self runRequestWithContext:v25];

LABEL_23:
  return v28;
}

void __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  os_signpost_id_t v12 = *(id *)(a1 + 32);
  id v13 = v12;
  os_signpost_id_t v14 = *(void *)(a1 + 48);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    int v15 = 134349056;
    uint64_t v16 = a5;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v13, OS_SIGNPOST_INTERVAL_END, v14, "com.apple.photos.backend.requestPlayerItemForVideo", " enableTelemetry=YES resultItemFormat=%{signpost.telemetry:number1,public}td", (uint8_t *)&v15, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_673(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v6 = @"PHImageErrorKey";
    v7[0] = a2;
    id v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = a2;
    id v5 = [v3 dictionaryWithObjects:v7 forKeys:&v6 count:1];
    (*(void (**)(uint64_t, void, void, void *, uint64_t))(v2 + 16))(v2, 0, 0, v5, 1);
  }
}

void __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 48))
  {
    uint64_t v7 = [v5 sanitizedInfoDictionary];
    id v8 = (void *)[v7 mutableCopy];

    id v9 = [v5 videoMediaItemMakerData];
    id v10 = [v5 videoURL];
    id v11 = [v5 uniformTypeIdentifier];
    if (v11) {
      [v8 setObject:v11 forKey:@"PHImageFileUTIKey"];
    }
    if (v9)
    {
      os_signpost_id_t v12 = [v5 info];
      id v13 = [v12 objectForKey:@"PHImageResultAVAssetOutOfBandPresentationHintsKey"];

      if (v13) {
        [v8 setObject:v13 forKey:@"PHImageResultAVAssetOutOfBandPresentationHintsKey"];
      }
      os_signpost_id_t v14 = [v5 fingerPrint];
      if (v14) {
        [v8 setObject:v14 forKey:@"PHImageResultFingerPrintKey"];
      }

      uint64_t v15 = 4;
    }
    else if (v10)
    {
      uint64_t v15 = 3;
    }
    else
    {
      uint64_t v15 = 1;
    }
    uint64_t v16 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_3;
    v22[3] = &unk_1E58489E8;
    id v18 = *(id *)(a1 + 48);
    id v23 = v10;
    id v24 = v9;
    id v25 = v8;
    id v26 = v18;
    uint64_t v27 = v15;
    id v19 = v8;
    id v20 = v9;
    id v21 = v10;
    [v16 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v6 options:v17 block:v22];
  }
}

uint64_t __62__PHImageManager_requestStreamForVideo_options_resultHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a1[8]);
}

- (PHImageRequestID)requestPlayerItemForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options resultHandler:(void *)resultHandler
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v8 = asset;
  id v9 = options;
  id v10 = resultHandler;
  id v11 = PLAvailabilityRequestGetLog();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, v8);
  id v13 = v11;
  os_signpost_id_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v57 = v8;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "com.apple.photos.backend.requestPlayerItemForVideo", "requestPlayerItemForVideo %@", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke;
  aBlock[3] = &unk_1E58488D0;
  uint64_t v15 = v14;
  __int16 v53 = v15;
  os_signpost_id_t v55 = v12;
  id v16 = v10;
  id v54 = v16;
  uint64_t v17 = _Block_copy(aBlock);
  if ([(id)objc_opt_class() _allowVideoAccessForAsset:v8 options:v9])
  {
    if (v9) {
      id v18 = (PHVideoRequestOptions *)[(PHVideoRequestOptions *)v9 copy];
    }
    else {
      id v18 = objc_alloc_init(PHVideoRequestOptions);
    }
    BOOL v22 = v18;
    if ([(PHVideoRequestOptions *)v18 isNetworkAccessAllowed]
      && [(PHImageManager *)self _canStreamVideoForAsset:v8]
      && ![(PHVideoRequestOptions *)v22 hasValidTimeRange]
      && ![(PHVideoRequestOptions *)v22 downloadIntent])
    {
      [(PHVideoRequestOptions *)v22 setStreamingAllowed:1];
    }
    id v44 = v16;
    __int16 v45 = v15;
    id v19 = v22;
    if ([(PHAsset *)v8 deferredProcessingNeeded] == 2
      && [(PHVideoRequestOptions *)v19 liveRenderVideoIfNeeded])
    {
      BOOL v23 = [(PHVideoRequestOptions *)v19 isCurrentVersion];

      if (v23)
      {
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_662;
        v50[3] = &unk_1E5848880;
        id v24 = &v51;
        id v51 = v17;
        PHImageRequestID v21 = [(PHImageManager *)self _requestLiveRenderAVAssetForAsset:v8 options:v19 resultHandler:v50];
LABEL_35:
        id v20 = *v24;
        goto LABEL_36;
      }
    }
    else
    {
    }
    uint64_t v25 = [(PHImageManager *)self nextID];
    unint64_t managerID = self->_managerID;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2;
    v46[3] = &unk_1E5848B00;
    id v49 = v17;
    v46[4] = self;
    uint64_t v47 = v8;
    uint64_t v48 = v19;
    uint64_t v27 = +[PHMediaRequestContext videoRequestContextWithRequestID:v25 managerID:managerID asset:v47 videoRequestOptions:v48 intent:0 resultHandler:v46];
    if (PHSignpostEventsEnabled_onceToken != -1) {
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
    }
    id v24 = &v49;
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      int v28 = PLImageManagerGetLog();
      os_signpost_id_t v29 = os_signpost_id_generate(v28);
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v41 = v29;
        uint64_t v30 = [v27 managerID];
        int v37 = [v27 requestID];
        uint64_t v39 = [v27 type];
        uint64_t v40 = v30;
        id v43 = v28;
        if (_getNextLayoutID_onceToken != -1) {
          dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
        }
        os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
        uint64_t v31 = [(id)s_availableLayoutIDs firstIndex];
        if (v31 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v32 = 101;
        }
        else
        {
          uint64_t v32 = v31;
          [(id)s_availableLayoutIDs removeIndex:v31];
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
        uint64_t v33 = [v27 asset];
        uint64_t v42 = [v33 uuid];

        [v27 setSignpostID:v41];
        [v27 setSignpostLayoutID:v32];
        id v34 = v43;
        if (os_signpost_enabled(v34))
        {
          uint64_t v35 = v37;
          [(PHVideoRequestOptions *)v9 targetSize];
          uint64_t v38 = DCIM_NSStringFromCGSize();
          *(_DWORD *)buf = 134219266;
          __int16 v57 = (PHAsset *)v40;
          __int16 v58 = 2048;
          uint64_t v59 = v35;
          id v16 = v44;
          __int16 v60 = 2112;
          __int16 v61 = v38;
          __int16 v62 = 2048;
          uint64_t v63 = v39;
          __int16 v64 = 2112;
          unsigned int v65 = v42;
          __int16 v66 = 2048;
          uint64_t v67 = v32;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v41, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
        }
        uint64_t v15 = v45;
        id v24 = &v49;
        int v28 = v43;
      }
    }
    PHImageRequestID v21 = [(PHImageManager *)self runRequestWithContext:v27];

    goto LABEL_35;
  }
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3306, 0);
    id v19 = (PHVideoRequestOptions *)objc_claimAutoreleasedReturnValue();
    v68 = @"PHImageErrorKey";
    v69[0] = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
    (*((void (**)(void *, void, void *, uint64_t))v17 + 2))(v17, 0, v20, 1);
    PHImageRequestID v21 = 0;
LABEL_36:

    goto LABEL_37;
  }
  PHImageRequestID v21 = 0;
LABEL_37:

  return v21;
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 32);
  id v10 = v9;
  os_signpost_id_t v11 = *(void *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    int v12 = 134349056;
    uint64_t v13 = a4;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v10, OS_SIGNPOST_INTERVAL_END, v11, "com.apple.photos.backend.requestPlayerItemForVideo", " enableTelemetry=YES resultItemFormat=%{signpost.telemetry:number1,public}td", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_662(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    if (v14)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F16620], "playerItemWithAsset:");
      [v13 setVideoComposition:v10];
      [v13 setAudioMix:v9];
      [v13 setSeekingWaitsForVideoCompositionRendering:1];
      uint64_t v12 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v13 = 0;
    }
    (*(void (**)(uint64_t, void *, id, uint64_t))(v12 + 16))(v12, v13, v11, 5);
  }
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 56))
  {
    id v7 = [v5 videoURL];
    id v8 = [v5 videoMediaItemMakerData];
    if (v8)
    {
      id v9 = [(id)objc_opt_class() playerItemFromVideoMediaItemMakerDataInMediaResult:v5 forAsset:*(void *)(a1 + 40)];
      if (v9 && MEMORY[0x19F388B10]())
      {
        id v10 = (void *)MEMORY[0x1E4F8CC48];
        id v11 = [v9 asset];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_3;
        v36[3] = &unk_1E58488F8;
        id v37 = v9;
        [v10 metadataForAsset:v11 completionHandler:v36];
      }
      uint64_t v12 = *(void **)(a1 + 32);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_666;
      v32[3] = &unk_1E58487E0;
      uint64_t v13 = *(void *)(a1 + 48);
      id v35 = *(id *)(a1 + 56);
      id v33 = v9;
      id v34 = v5;
      id v14 = v9;
      [v12 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v6 options:v13 block:v32];
    }
    else
    {
      uint64_t v15 = *(void **)(a1 + 32);
      if (v7)
      {
        id v16 = objc_opt_class();
        uint64_t v17 = [v5 info];
        uint64_t v18 = *(void *)(a1 + 48);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        void v25[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2_667;
        v25[3] = &unk_1E5848970;
        id v26 = v7;
        id v27 = *(id *)(a1 + 48);
        id v19 = v5;
        uint64_t v20 = *(void *)(a1 + 32);
        id v28 = v19;
        uint64_t v29 = v20;
        id v30 = v6;
        id v31 = *(id *)(a1 + 56);
        [v16 buildAVPlayerItemFromVideoURL:v26 infoDictionary:v17 options:v18 completion:v25];

        id v14 = v26;
      }
      else
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2_671;
        v22[3] = &unk_1E5848790;
        uint64_t v21 = *(void *)(a1 + 48);
        id v24 = *(id *)(a1 + 56);
        id v23 = v5;
        [v15 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v6 options:v21 block:v22];

        id v14 = v24;
      }
    }
  }
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLImageManagerGetLog();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = [*(id *)(a1 + 32) asset];
      id v10 = [v5 firstVideoTrackFormatDebugDescription];
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v10;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_INFO, "Media item maker player item asset %@: %{public}@", (uint8_t *)&v11, 0x16u);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v9 = [*(id *)(a1 + 32) asset];
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Error loading metadata for media item maker player item asset %@: %@", (uint8_t *)&v11, 0x16u);
    goto LABEL_6;
  }
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_666(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) sanitizedInfoDictionary];
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v2 + 16))(v2, v1, v3, 4);
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2_667(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && MEMORY[0x19F388B10]())
  {
    id v10 = (void *)MEMORY[0x1E4F8CC48];
    int v11 = [v7 asset];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_3_668;
    v21[3] = &unk_1E5848920;
    id v22 = *(id *)(a1 + 32);
    id v23 = v7;
    [v10 metadataForAsset:v11 completionHandler:v21];
  }
  if ([*(id *)(a1 + 40) includeTimeRangeMapper]) {
    [*(id *)(a1 + 48) setInfo:v8 forKey:@"PHImageResultTimeRangeMapperKey"];
  }
  [*(id *)(a1 + 48) setErrorIfNone:v9];
  uint64_t v12 = *(void **)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_669;
  v16[3] = &unk_1E5848948;
  id v20 = *(id *)(a1 + 72);
  id v17 = v7;
  id v18 = *(id *)(a1 + 48);
  id v19 = *(id *)(a1 + 32);
  id v15 = v7;
  [v12 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v13 options:v14 block:v16];
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_2_671(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) sanitizedInfoDictionary];
  (*(void (**)(uint64_t, void, id, uint64_t))(v1 + 16))(v1, 0, v2, 1);
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_3_668(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLImageManagerGetLog();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = [v5 firstVideoTrackFormatDebugDescription];
      int v14 = 138412546;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = v10;
      int v11 = "Player item asset for URL %@: %{public}@";
      uint64_t v12 = v8;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_19B043000, v12, v13, v11, (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v10 = [*(id *)(a1 + 40) asset];
    int v14 = 138412546;
    id v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    int v11 = "Error loading metadata for player item asset %@: %@";
    uint64_t v12 = v8;
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }
}

void __66__PHImageManager_requestPlayerItemForVideo_options_resultHandler___block_invoke_669(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) sanitizedInfoDictionary];
  if ([*(id *)(a1 + 48) isFileURL]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 3;
  }
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v2 + 16))(v2, v3, v5, v4);
}

- (PHImageRequestID)requestExportSessionForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options exportPreset:(NSString *)exportPreset resultHandler:(void *)resultHandler
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v10 = asset;
  int v11 = options;
  uint64_t v12 = exportPreset;
  os_log_type_t v13 = resultHandler;
  if ([(id)objc_opt_class() _allowVideoAccessForAsset:v10 options:v11])
  {
    if (v11) {
      int v14 = (PHVideoRequestOptions *)[(PHVideoRequestOptions *)v11 copy];
    }
    else {
      int v14 = objc_alloc_init(PHVideoRequestOptions);
    }
    uint64_t v18 = v14;
    if ([(PHVideoRequestOptions *)v14 deliveryMode] != PHVideoRequestOptionsDeliveryModeHighQualityFormat)
    {
      id v19 = PLImageManagerGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v42 = [(PHVideoRequestOptions *)v18 deliveryMode];
        _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEBUG, "Request for video export session with delivery mode of %ld is not allowed, request will require 'high quality' delivery mode", buf, 0xCu);
      }

      [(PHVideoRequestOptions *)v18 setDeliveryMode:1];
    }
    if (![(PHVideoRequestOptions *)v18 restrictToPlayableOnCurrentDevice])
    {
      id v20 = PLImageManagerGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_DEBUG, "Request for video export session without restricting to playable not allowed, request will restrict to playable", buf, 2u);
      }

      [(PHVideoRequestOptions *)v18 setRestrictToPlayableOnCurrentDevice:1];
    }
    uint64_t v21 = [(PHImageManager *)self nextID];
    unint64_t managerID = self->_managerID;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke;
    v37[3] = &unk_1E5848B00;
    id v40 = v13;
    v37[4] = self;
    id v15 = v18;
    uint64_t v38 = v15;
    id v23 = v12;
    uint64_t v39 = v23;
    id v24 = +[PHMediaRequestContext videoRequestContextWithRequestID:v21 managerID:managerID asset:v10 videoRequestOptions:v15 intent:2 resultHandler:v37];
    if (PHSignpostEventsEnabled_onceToken != -1) {
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
    }
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      uint64_t v25 = PLImageManagerGetLog();
      os_signpost_id_t v36 = os_signpost_id_generate(v25);
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        uint64_t v26 = [v24 managerID];
        int v31 = [v24 requestID];
        uint64_t v32 = [v24 type];
        uint64_t v33 = v26;
        id v34 = v12;
        if (_getNextLayoutID_onceToken != -1) {
          dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
        }
        os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
        uint64_t v27 = [(id)s_availableLayoutIDs firstIndex];
        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v28 = 101;
        }
        else
        {
          uint64_t v28 = v27;
          [(id)s_availableLayoutIDs removeIndex:v27];
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
        uint64_t v29 = [v24 asset];
        id v35 = [v29 uuid];

        [v24 setSignpostID:v36];
        [v24 setSignpostLayoutID:v28];
        if (os_signpost_enabled(v25))
        {
          *(_DWORD *)buf = 134219266;
          uint64_t v42 = v33;
          __int16 v43 = 2048;
          uint64_t v44 = v31;
          __int16 v45 = 2112;
          id v46 = v23;
          __int16 v47 = 2048;
          uint64_t v48 = v32;
          __int16 v49 = 2112;
          os_signpost_id_t v50 = v35;
          __int16 v51 = 2048;
          uint64_t v52 = v28;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v36, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
        }

        uint64_t v12 = v34;
      }
    }
    PHImageRequestID v17 = [(PHImageManager *)self runRequestWithContext:v24];

    __int16 v16 = v40;
    goto LABEL_30;
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3306, 0);
    id v15 = (PHVideoRequestOptions *)objc_claimAutoreleasedReturnValue();
    __int16 v53 = @"PHImageErrorKey";
    v54[0] = v15;
    __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
    (*((void (**)(void *, void, void *))v13 + 2))(v13, 0, v16);
    PHImageRequestID v17 = 0;
LABEL_30:

    goto LABEL_31;
  }
  PHImageRequestID v17 = 0;
LABEL_31:

  return v17;
}

void __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 videoURL];
  id v8 = (void *)v7;
  id v9 = *(void **)(a1 + 56);
  id v10 = *(void **)(a1 + 32);
  if (v9) {
    BOOL v11 = v7 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_4;
    v22[3] = &unk_1E5848790;
    uint64_t v18 = &v24;
    id v23 = v5;
    id v24 = v9;
    id v13 = v5;
    [v10 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v6 options:v12 block:v22];
    uint64_t v21 = v23;
  }
  else
  {
    int v14 = objc_opt_class();
    id v15 = [v5 info];
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_2;
    v25[3] = &unk_1E58488A8;
    uint64_t v18 = (id *)v26;
    uint64_t v19 = *(void *)(a1 + 32);
    v26[0] = v5;
    v26[1] = v19;
    id v27 = v6;
    id v28 = *(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 56);
    id v20 = v5;
    [v14 buildExportSessionFromVideoURL:v8 infoDictionary:v15 options:v16 exportPreset:v17 completion:v25];

    uint64_t v21 = v27;
  }
}

void __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setErrorIfNone:a3];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_3;
  v10[3] = &unk_1E58487E0;
  uint64_t v8 = *(void *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v9 = v5;
  [v6 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:v7 options:v8 block:v10];
}

void __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v2 = [*(id *)(a1 + 32) sanitizedInfoDictionary];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __82__PHImageManager_requestExportSessionForVideo_options_exportPreset_resultHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) sanitizedInfoDictionary];
  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v1, v3);
}

- (PHImageRequestID)requestAVAssetForVideo:(PHAsset *)asset options:(PHVideoRequestOptions *)options resultHandler:(void *)resultHandler
{
  id v8 = resultHandler;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PHImageManager_requestAVAssetForVideo_options_resultHandler___block_invoke;
  v11[3] = &unk_1E5848880;
  id v12 = v8;
  id v9 = v8;
  LODWORD(options) = [(PHImageManager *)self requestAVAssetForAsset:asset options:options resultHandler:v11];

  return (int)options;
}

uint64_t __63__PHImageManager_requestAVAssetForVideo_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PHImageRequestID)requestLivePhotoForAsset:(PHAsset *)asset targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHLivePhotoRequestOptions *)options resultHandler:(void *)resultHandler
{
  double height = targetSize.height;
  double width = targetSize.width;
  v87[1] = *MEMORY[0x1E4F143B8];
  id v13 = asset;
  int v14 = options;
  id v15 = resultHandler;
  if ([(PHAsset *)v13 canPlayPhotoIris])
  {
    uint64_t v16 = v14;
    if ([(PHAsset *)v13 deferredProcessingNeeded] == 2
      && [(PHLivePhotoRequestOptions *)v16 liveRenderVideoIfNeeded])
    {
      BOOL v17 = [(PHLivePhotoRequestOptions *)v16 isCurrentVersion];

      if (v17)
      {
        uint64_t v18 = [(PHImageManager *)self nextID];
        unint64_t managerID = self->_managerID;
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke;
        v70[3] = &unk_1E5848808;
        id v73 = v15;
        v71 = v16;
        v72 = v13;
        id v20 = +[PHLiveRenderEditingInputRequestContext videoLiveRenderContextWithRequestID:managerID:asset:options:targetSize:contentMode:renderedVideoHandler:](PHLiveRenderEditingInputRequestContext, "videoLiveRenderContextWithRequestID:managerID:asset:options:targetSize:contentMode:renderedVideoHandler:", v18, managerID, v72, v71, contentMode, v70, width, height);
        uint64_t v21 = PLImageManagerGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v22 = self->_managerID;
          int v23 = [v20 requestID];
          *(_DWORD *)buf = 134218240;
          unint64_t v75 = v22;
          __int16 v76 = 2048;
          uint64_t v77 = v23;
          _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEFAULT, "%ld-%ld - Making edit request in preparation for live rendering live photo's video complement", buf, 0x16u);
        }

        if (PHSignpostEventsEnabled_onceToken != -1) {
          dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
        }
        if (PHSignpostEventsEnabled_eventsEnabled)
        {
          id v24 = PLImageManagerGetLog();
          os_signpost_id_t v25 = os_signpost_id_generate(v24);
          if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v26 = v25;
            __int16 v61 = v14;
            uint64_t v27 = [v20 managerID];
            int v28 = [v20 requestID];
            uint64_t v63 = v27;
            uint64_t v59 = [v20 type];
            if (_getNextLayoutID_onceToken != -1) {
              dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
            }
            os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
            uint64_t v29 = [(id)s_availableLayoutIDs firstIndex];
            if (v29 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v30 = 101;
            }
            else
            {
              uint64_t v30 = v29;
              [(id)s_availableLayoutIDs removeIndex:v29];
            }
            os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
            __int16 v49 = [v20 asset];
            os_signpost_id_t v50 = [v49 uuid];

            [v20 setSignpostID:v26];
            [v20 setSignpostLayoutID:v30];
            __int16 v51 = v24;
            if (os_signpost_enabled(v51))
            {
              __int16 v58 = v50;
              uint64_t v52 = v28;
              __int16 v53 = DCIM_NSStringFromCGSize();
              *(_DWORD *)buf = 134219266;
              unint64_t v75 = v63;
              __int16 v76 = 2048;
              uint64_t v77 = v52;
              os_signpost_id_t v50 = v58;
              __int16 v78 = 2112;
              v79 = v53;
              __int16 v80 = 2048;
              uint64_t v81 = v59;
              __int16 v82 = 2112;
              __int16 v83 = v58;
              __int16 v84 = 2048;
              uint64_t v85 = v30;
              _os_signpost_emit_with_name_impl(&dword_19B043000, v51, OS_SIGNPOST_INTERVAL_BEGIN, v26, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
            }
            int v14 = v61;
          }
        }
        PHImageRequestID v33 = [(PHImageManager *)self runRequestWithContext:v20];

        int v31 = v73;
        goto LABEL_36;
      }
    }
    else
    {
    }
    int v31 = -[PHImageDisplaySpec initWithTargetSize:contentMode:]([PHImageDisplaySpec alloc], "initWithTargetSize:contentMode:", contentMode, width, height);
    if (v16) {
      id v34 = v16;
    }
    else {
      id v34 = objc_alloc_init(PHLivePhotoRequestOptions);
    }
    id v35 = v34;
    uint64_t v36 = [(PHImageManager *)self nextID];
    unint64_t v37 = self->_managerID;
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_642;
    v65[3] = &unk_1E5848B00;
    uint64_t v38 = v35;
    __int16 v66 = v38;
    id v69 = v15;
    uint64_t v67 = v13;
    v68 = self;
    uint64_t v39 = +[PHMediaRequestContext livePhotoRequestContextWithRequestID:v36 managerID:v37 asset:v67 livePhotoRequestOptions:v38 displaySpec:v31 resultHandler:v65];
    if (PHSignpostEventsEnabled_onceToken != -1) {
      dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
    }
    if (PHSignpostEventsEnabled_eventsEnabled)
    {
      id v40 = PLImageManagerGetLog();
      os_signpost_id_t v41 = os_signpost_id_generate(v40);
      if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v42 = v41;
        uint64_t v43 = [v39 managerID];
        int v55 = [v39 requestID];
        uint64_t v57 = [v39 type];
        uint64_t v60 = v43;
        __int16 v62 = v14;
        if (_getNextLayoutID_onceToken != -1) {
          dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
        }
        os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
        uint64_t v44 = [(id)s_availableLayoutIDs firstIndex];
        if (v44 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v45 = 101;
        }
        else
        {
          uint64_t v45 = v44;
          [(id)s_availableLayoutIDs removeIndex:v44];
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
        id v46 = [v39 asset];
        __int16 v64 = [v46 uuid];

        [v39 setSignpostID:v42];
        [v39 setSignpostLayoutID:v45];
        __int16 v47 = v40;
        if (os_signpost_enabled(v47))
        {
          uint64_t v54 = v55;
          id v56 = DCIM_NSStringFromCGSize();
          *(_DWORD *)buf = 134219266;
          unint64_t v75 = v60;
          __int16 v76 = 2048;
          uint64_t v77 = v54;
          __int16 v78 = 2112;
          v79 = v56;
          __int16 v80 = 2048;
          uint64_t v81 = v57;
          __int16 v82 = 2112;
          __int16 v83 = v64;
          __int16 v84 = 2048;
          uint64_t v85 = v45;
          _os_signpost_emit_with_name_impl(&dword_19B043000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v42, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
        }
        int v14 = v62;
      }
    }
    PHImageRequestID v33 = [(PHImageManager *)self runRequestWithContext:v39];

    goto LABEL_36;
  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3306, @"Not a playable live photo asset");
    int v31 = (PHImageDisplaySpec *)objc_claimAutoreleasedReturnValue();
    v86 = @"PHImageErrorKey";
    v87[0] = v31;
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:&v86 count:1];
    (*((void (**)(void *, void, void *))v15 + 2))(v15, 0, v32);

    PHImageRequestID v33 = 0;
LABEL_36:

    goto LABEL_37;
  }
  PHImageRequestID v33 = 0;
LABEL_37:

  return v33;
}

void __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke(id *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (a1[6])
  {
    [a1[4] isNetworkAccessAllowed];
    id v15 = v11;
    if ([v15 containsValidData])
    {

      uint64_t v16 = PLImageManagerGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        BOOL v17 = [v12 identifierString];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "[RM]: %@ building live photo with live-rendered avasset", buf, 0xCu);
      }
      if (PHImageManagerRecordEnabled())
      {
        uint64_t v26 = [v12 requestID];
        uint64_t v27 = [v12 identifierString];
        +[PHImageManagerRequestTracer traceMessageForRequestID:v26, @"[RM]: %@ building live photo with live-rendered avasset", v27 message];
      }
      [a1[5] fetchPropertySetsIfNeeded];
      memset(buf, 0, sizeof(buf));
      uint64_t v35 = 0;
      uint64_t v18 = [a1[5] photoIrisProperties];
      uint64_t v19 = v18;
      if (v18)
      {
        [v18 photoIrisStillDisplayTime];
      }
      else
      {
        memset(buf, 0, sizeof(buf));
        uint64_t v35 = 0;
      }

      uint64_t v21 = [PHLivePhoto alloc];
      uint64_t v22 = [v15 imageRef];
      uint64_t v23 = [v15 uiOrientation];
      id v24 = a1[5];
      long long v32 = *(_OWORD *)buf;
      uint64_t v33 = v35;
      id v20 = [(PHLivePhoto *)v21 initWithImage:v22 uiOrientation:v23 videoAsset:v13 photoTime:&v32 asset:v24];
    }
    else
    {
      if (([v15 isCancelled] & 1) == 0) {
        [v15 isInCloud];
      }

      id v20 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_638;
    block[3] = &unk_1E58487E0;
    id v31 = a1[6];
    uint64_t v29 = v20;
    id v30 = v14;
    os_signpost_id_t v25 = v20;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_642(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) isNetworkAccessAllowed];
  id v8 = v5;
  if ([v8 containsValidData])
  {
    uint64_t v9 = 0;
  }
  else if ([v8 isCancelled])
  {
    uint64_t v9 = 1;
  }
  else if (v7 | [v8 isInCloud] ^ 1)
  {
    uint64_t v9 = 3;
  }
  else
  {
    uint64_t v9 = 2;
  }

  int v10 = [v8 isDegraded];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2;
  aBlock[3] = &unk_1E5848830;
  id v35 = *(id *)(a1 + 56);
  id v11 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  if (v10)
  {
    if (![v8 imageRef] && v9)
    {
      if ([*(id *)(a1 + 32) deliveryMode] != 2) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
  }
  else if (v9)
  {
LABEL_14:
    id v12 = [v8 sanitizedInfoDictionary];
    v11[2](v11, 0, v12);

    goto LABEL_24;
  }
  [*(id *)(a1 + 40) fetchPropertySetsIfNeeded];
  long long v32 = 0uLL;
  uint64_t v33 = 0;
  id v13 = [*(id *)(a1 + 40) photoIrisProperties];
  id v14 = v13;
  if (v13)
  {
    [v13 photoIrisStillDisplayTime];
  }
  else
  {
    long long v32 = 0uLL;
    uint64_t v33 = 0;
  }

  if ((v10 & 1) == 0)
  {
    id v15 = PLImageManagerGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = [v6 identifierString];
      BOOL v17 = [v8 videoURL];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "[RM]: %@ building live photo with video URL: %@", buf, 0x16u);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v22 = [v6 requestID];
      uint64_t v23 = [v6 identifierString];
      id v24 = [v8 videoURL];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v22, @"[RM]: %@ building live photo with video URL: %@", v23, v24 message];
    }
  }
  uint64_t v26 = *(void **)(a1 + 48);
  uint64_t v25 = [v8 imageRef];
  uint64_t v18 = [v8 uiOrientation];
  uint64_t v19 = [v8 videoURL];
  id v20 = [v8 info];
  uint64_t v21 = *(void *)(a1 + 40);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_647;
  v27[3] = &unk_1E5848858;
  id v28 = v6;
  char v31 = v10;
  id v29 = v8;
  id v30 = v11;
  *(_OWORD *)buf = v32;
  *(void *)&uint8_t buf[16] = v33;
  [v26 _prepareLivePhotoResultWithImage:v25 uiOrientation:v18 shouldIncludeVideo:v10 ^ 1u videoURL:v19 info:v20 photoTime:buf asset:v21 completion:v27];

LABEL_24:
}

void __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3;
  block[3] = &unk_1E58487E0;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_647(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLImageManagerGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [*(id *)(a1 + 32) identifierString];
    int v9 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v8;
    if (v9) {
      int v10 = @"Y";
    }
    else {
      int v10 = @"N";
    }
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v10;
    _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "[RM]: %@ live photo request finished with live photo: %@, error: %@, isDegraded: %@", buf, 0x2Au);
  }
  if (PHImageManagerRecordEnabled())
  {
    uint64_t v13 = [*(id *)(a1 + 32) requestID];
    uint64_t v14 = [*(id *)(a1 + 32) identifierString];
    id v15 = (void *)v14;
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v16 = @"Y";
    }
    else {
      uint64_t v16 = @"N";
    }
    +[PHImageManagerRequestTracer traceMessageForRequestID:v13, @"[RM]: %@ live photo request finished with live photo: %@, error: %@, isDegraded: %@", v14, v5, v6, v16, *(_OWORD *)buf message];
  }
  [*(id *)(a1 + 40) setErrorIfNone:v6];
  uint64_t v11 = *(void *)(a1 + 48);
  id v12 = [*(id *)(a1 + 40) sanitizedInfoDictionary];
  (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v5, v12);
}

uint64_t __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_3(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

uint64_t __88__PHImageManager_requestLivePhotoForAsset_targetSize_contentMode_options_resultHandler___block_invoke_638(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_prepareLivePhotoResultWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 shouldIncludeVideo:(BOOL)a5 videoURL:(id)a6 info:(id)a7 photoTime:(id *)a8 asset:(id)a9 completion:(id)a10
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  id v18 = a10;
  if (a5)
  {
    id v19 = objc_opt_class();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __125__PHImageManager__prepareLivePhotoResultWithImage_uiOrientation_shouldIncludeVideo_videoURL_info_photoTime_asset_completion___block_invoke;
    v22[3] = &unk_1E58487B8;
    uint64_t v25 = a3;
    int64_t v26 = a4;
    long long v27 = *(_OWORD *)&a8->var0;
    int64_t var3 = a8->var3;
    uint64_t v23 = (PHLivePhoto *)v17;
    id v24 = v18;
    [v19 buildAVAssetFromVideoURL:v15 infoDictionary:v16 options:0 completion:v22];

    __int16 v20 = v23;
  }
  else
  {
    uint64_t v21 = [PHLivePhoto alloc];
    long long v29 = *(_OWORD *)&a8->var0;
    int64_t v30 = a8->var3;
    __int16 v20 = [(PHLivePhoto *)v21 initWithImage:a3 uiOrientation:a4 videoAsset:0 photoTime:&v29 asset:v17];
    (*((void (**)(id, PHLivePhoto *, void))v18 + 2))(v18, v20, 0);
  }
}

void __125__PHImageManager__prepareLivePhotoResultWithImage_uiOrientation_shouldIncludeVideo_videoURL_info_photoTime_asset_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  if (v7)
  {
    id v8 = a5;
    int v9 = [PHLivePhoto alloc];
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 32);
    long long v16 = *(_OWORD *)(a1 + 64);
    uint64_t v17 = *(void *)(a1 + 80);
    uint64_t v13 = [(PHLivePhoto *)v9 initWithImage:v10 uiOrientation:v11 videoAsset:v7 photoTime:&v16 asset:v12];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(void (**)(uint64_t, void, PHLivePhoto *))(v14 + 16);
    uint64_t v13 = a5;
    v15(v14, 0, v13);
  }
}

- (PHImageRequestID)requestImageDataAndOrientationForAsset:(PHAsset *)asset options:(PHImageRequestOptions *)options resultHandler:(void *)resultHandler
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = asset;
  int v9 = resultHandler;
  uint64_t v10 = (PHImageRequestOptions *)[(PHImageRequestOptions *)options copy];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = [(PHImageRequestOptions *)v10 loadingMode] | 1;
    uint64_t v13 = v11;
  }
  else
  {
    uint64_t v13 = objc_alloc_init(PHImageRequestOptions);
    uint64_t v11 = v13;
    uint64_t v12 = 1;
  }
  [(PHImageRequestOptions *)v13 setLoadingMode:v12];
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    [(PHImageRequestOptions *)v11 setLoadingMode:[(PHImageRequestOptions *)v11 loadingMode] | 0x10000];
  }
  if ([(PHAsset *)v8 isAnimatedGIF]) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 1;
  }
  [(PHImageRequestOptions *)v11 setDeliveryMode:v14];
  [(PHImageRequestOptions *)v11 setCannotReturnSmallerImage:1];
  [(PHImageRequestOptions *)v11 setIgnoreProcessWideRepairLimits:1];
  uint64_t v15 = [(PHImageManager *)self nextID];
  unint64_t managerID = self->_managerID;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __79__PHImageManager_requestImageDataAndOrientationForAsset_options_resultHandler___block_invoke;
  v34[3] = &unk_1E5848A10;
  v34[4] = self;
  uint64_t v17 = v11;
  id v35 = v17;
  id v18 = v9;
  id v36 = v18;
  id v19 = +[PHMediaRequestContext imageRequestContextWithRequestID:v15 managerID:managerID asset:v8 imageRequestOptions:v17 displaySpec:0 resultHandler:v34];
  if (PHSignpostEventsEnabled_onceToken != -1) {
    dispatch_once(&PHSignpostEventsEnabled_onceToken, &__block_literal_global_45631);
  }
  if (PHSignpostEventsEnabled_eventsEnabled)
  {
    __int16 v20 = PLImageManagerGetLog();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v22 = v21;
      uint64_t v23 = [v19 managerID];
      uint64_t v24 = [v19 requestID];
      uint64_t v32 = [v19 type];
      uint64_t v33 = v23;
      uint64_t v31 = v24;
      if (_getNextLayoutID_onceToken != -1) {
        dispatch_once(&_getNextLayoutID_onceToken, &__block_literal_global_791);
      }
      os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
      uint64_t v25 = [(id)s_availableLayoutIDs firstIndex];
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v26 = 101;
      }
      else
      {
        uint64_t v26 = v25;
        [(id)s_availableLayoutIDs removeIndex:v25];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
      long long v27 = [v19 asset];
      id v28 = [v27 uuid];

      [v19 setSignpostID:v22];
      [v19 setSignpostLayoutID:v26];
      if (os_signpost_enabled(v20))
      {
        *(_DWORD *)buf = 134219266;
        uint64_t v38 = v33;
        __int16 v39 = 2048;
        uint64_t v40 = (int)v31;
        __int16 v41 = 2112;
        os_signpost_id_t v42 = @"Data";
        __int16 v43 = 2048;
        uint64_t v44 = v32;
        __int16 v45 = 2112;
        id v46 = v28;
        __int16 v47 = 2048;
        uint64_t v48 = v26;
        _os_signpost_emit_with_name_impl(&dword_19B043000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v22, "ContextEvent", "Context begin: [%lu-%lu], target: %@, api: %lu, uuid: %@, layout: %lu", buf, 0x3Eu);
      }
    }
  }
  PHImageRequestID v29 = -[PHImageManager runRequestWithContext:](self, "runRequestWithContext:", v19, v31);

  return v29;
}

void __79__PHImageManager_requestImageDataAndOrientationForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__PHImageManager_requestImageDataAndOrientationForAsset_options_resultHandler___block_invoke_2;
  v10[3] = &unk_1E5848790;
  id v8 = *(id *)(a1 + 48);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v6 _runBlockOnAppropriateResultQueueOrSynchronouslyWithRequest:a3 options:v7 block:v10];
}

void __79__PHImageManager_requestImageDataAndOrientationForAsset_options_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v6 = [*(id *)(a1 + 32) imageData];
    id v3 = [*(id *)(a1 + 32) uniformTypeIdentifier];
    uint64_t v4 = [*(id *)(a1 + 32) cgOrientation];
    id v5 = [*(id *)(a1 + 32) sanitizedInfoDictionary];
    (*(void (**)(uint64_t, id, void *, uint64_t, void *))(v1 + 16))(v1, v6, v3, v4, v5);
  }
}

- (PHImageRequestID)requestImageDataForAsset:(PHAsset *)asset options:(PHImageRequestOptions *)options resultHandler:(void *)resultHandler
{
  id v8 = resultHandler;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PHImageManager_requestImageDataForAsset_options_resultHandler___block_invoke;
  v11[3] = &unk_1E5848768;
  id v12 = v8;
  char v13 = 1;
  id v9 = v8;
  LODWORD(options) = [(PHImageManager *)self requestImageDataAndOrientationForAsset:asset options:options resultHandler:v11];

  return (int)options;
}

void __65__PHImageManager_requestImageDataForAsset_options_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v12 = PLImageOrientationFromExifOrientation();
      (*(void (**)(uint64_t, id, id, uint64_t, id))(v11 + 16))(v11, v14, v9, v12, v10);
    }
    else
    {
      char v13 = (void (**)(void *, id, id, void, id))_Block_copy(*(const void **)(a1 + 32));
      v13[2](v13, v14, v9, a4, v10);
    }
  }
}

- (BOOL)_canStreamVideoForAsset:(id)a3
{
  id v3 = a3;
  if ([v3 isStreamedVideo])
  {
    LOBYTE(v4) = 1;
  }
  else if ([v3 isVideo])
  {
    int v4 = [v3 isLoopingVideo] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (BOOL)_allowVideoAccessForAsset:(id)a3 options:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = ([v5 isVideo] & 1) != 0
    || [v5 playbackStyle] == 4
    || [v5 playbackStyle] == 5
    || [v5 isPhotoIris] && (objc_msgSend(v6, "isVideoComplementAllowed") & 1) != 0;

  return v7;
}

@end