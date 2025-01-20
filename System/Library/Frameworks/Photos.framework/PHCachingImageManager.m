@interface PHCachingImageManager
+ (id)_chooseImageTableFormatForPreheatingFromFormats:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 returnBestTableRegardlessOfFit:(BOOL)a6;
- (BOOL)_cacheImageResult:(id)a3 forRequest:(id)a4;
- (BOOL)_canPopulateCacheForResult:(id)a3;
- (BOOL)allowsCachingHighQualityImages;
- (PHCachingImageManager)init;
- (id)_cacheFailReasonFromInfo:(id)a3;
- (id)_imageTableForPreheatingDegradedOpportunisticRequestsWithPhotoLibrary:(id)a3;
- (id)_tableFormatsForLibrary:(id)a3;
- (void)_commitCacheChanges;
- (void)_handleCachingImageRequestResult:(id)a3 request:(id)a4 context:(id)a5;
- (void)_handleMemoryWarning;
- (void)_preheatImageTable:(id)a3 forAssets:(id)a4;
- (void)_scheduleOrCommitCacheChangesIfNeeded;
- (void)additionalWorkForImageRequestCompletedWithResult:(id)a3 request:(id)a4 context:(id)a5;
- (void)imageCache:(id)a3 didEvictCacheEntry:(id)a4;
- (void)mediaRequestContext:(id)a3 isQueryingCacheForRequest:(id)a4 didWait:(BOOL *)a5 didFindImage:(BOOL *)a6 resultHandler:(id)a7;
- (void)setAllowsCachingHighQualityImages:(BOOL)allowsCachingHighQualityImages;
- (void)startCachingImagesForAssets:(NSArray *)assets targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options;
- (void)stopCachingImagesForAllAssets;
- (void)stopCachingImagesForAssets:(NSArray *)assets targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options;
@end

@implementation PHCachingImageManager

- (BOOL)_cacheImageResult:(id)a3 forRequest:(id)a4
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 asset];
  v9 = [v8 adjustmentVersion];

  if (v9)
  {
    v36[0] = @"adjustmentVersion";
    v10 = [v6 asset];
    v11 = [v10 adjustmentVersion];
    v36[1] = @"deferredProcessing";
    v37[0] = v11;
    v12 = NSNumber;
    v13 = [v6 asset];
    v14 = objc_msgSend(v12, "numberWithUnsignedShort:", objc_msgSend(v13, "deferredProcessingNeeded"));
    v37[1] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  }
  else
  {
    v34 = @"deferredProcessing";
    v16 = NSNumber;
    v10 = [v6 asset];
    v11 = objc_msgSend(v16, "numberWithUnsignedShort:", objc_msgSend(v10, "deferredProcessingNeeded"));
    v35 = v11;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  }

  uint64_t v17 = [v7 imageRef];
  imageCache = self->_imageCache;
  uint64_t v19 = [v6 requestID];
  v20 = [v6 asset];
  v21 = [v6 displaySpec];
  [v21 targetSize];
  double v23 = v22;
  double v25 = v24;
  v26 = [v6 displaySpec];
  [v26 contentMode];
  v27 = [v6 displaySpec];
  [v27 normalizedCropRect];
  v32 = _buildCacheKey(v20, v23, v25, v28, v29, v30, v31);
  LOBYTE(v17) = [(PHImageCache *)imageCache populateEntryWithImage:v17 requestID:v19 forKey:v32 additionalInfo:v15];

  return v17;
}

uint64_t __106__PHCachingImageManager_mediaRequestContext_isQueryingCacheForRequest_didWait_didFindImage_resultHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) asset];
  int v5 = [v4 deferredProcessingNeeded];
  id v6 = [v3 objectForKeyedSubscript:@"deferredProcessing"];
  int v7 = [v6 intValue];

  if (v7 == v5)
  {
    v8 = [*(id *)(a1 + 32) asset];
    v9 = [v8 adjustmentVersion];

    if (!v9)
    {
      if (!v3)
      {
        uint64_t v13 = 1;
        goto LABEL_9;
      }
      v10 = [v3 objectForKeyedSubscript:@"adjustmentVersion"];
      uint64_t v13 = v10 == 0;
      goto LABEL_8;
    }
    if (v3)
    {
      v10 = [*(id *)(a1 + 32) asset];
      v11 = [v10 adjustmentVersion];
      v12 = [v3 objectForKeyedSubscript:@"adjustmentVersion"];
      uint64_t v13 = [v11 isEqual:v12];

LABEL_8:
      goto LABEL_9;
    }
  }
  uint64_t v13 = 0;
LABEL_9:

  return v13;
}

- (void)mediaRequestContext:(id)a3 isQueryingCacheForRequest:(id)a4 didWait:(BOOL *)a5 didFindImage:(BOOL *)a6 resultHandler:(id)a7
{
  id v11 = a4;
  id v12 = a7;
  os_unfair_lock_lock(&self->_cachingLock);
  cachingRequestIDs = self->_cachingRequestIDs;
  v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "requestID"));
  LOBYTE(cachingRequestIDs) = [(NSMutableSet *)cachingRequestIDs containsObject:v14];

  os_unfair_lock_unlock(&self->_cachingLock);
  if ((cachingRequestIDs & 1) == 0)
  {
    imageCache = self->_imageCache;
    v16 = [v11 asset];
    uint64_t v17 = [v11 displaySpec];
    [v17 targetSize];
    double v19 = v18;
    double v21 = v20;
    double v22 = [v11 displaySpec];
    [v22 contentMode];
    double v23 = [v11 displaySpec];
    [v23 normalizedCropRect];
    double v28 = _buildCacheKey(v16, v19, v21, v24, v25, v26, v27);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __106__PHCachingImageManager_mediaRequestContext_isQueryingCacheForRequest_didWait_didFindImage_resultHandler___block_invoke;
    v29[3] = &unk_1E5843120;
    id v30 = v11;
    [(PHImageCache *)imageCache queryEntryForKey:v28 didWaitForInFlightRequest:a5 didFindImage:a6 entryIsValidBlock:v29 resultHandler:v12];
  }
}

void __90__PHCachingImageManager_additionalWorkForImageRequestCompletedWithResult_request_context___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _canPopulateCacheForResult:*(void *)(a1 + 40)]
    && [*(id *)(a1 + 32) _cacheImageResult:*(void *)(a1 + 40) forRequest:*(void *)(a1 + 48)])
  {
    v2 = PLImageManagerGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      id v3 = [*(id *)(a1 + 48) identifierString];
      v4 = [*(id *)(a1 + 48) asset];
      int v5 = [v4 uuid];
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ request opportunistically stored image in cache for asset: %@", buf, 0x16u);
    }
    if (PHImageManagerRecordEnabled())
    {
      uint64_t v6 = [*(id *)(a1 + 48) requestID];
      int v7 = [*(id *)(a1 + 48) identifierString];
      v8 = [*(id *)(a1 + 48) asset];
      v9 = [v8 uuid];
      +[PHImageManagerRequestTracer traceMessageForRequestID:v6, @"[RM][cache]: %@ request opportunistically stored image in cache for asset: %@", v7, v9 message];
    }
  }
}

- (void)additionalWorkForImageRequestCompletedWithResult:(id)a3 request:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PHCachingImageManager_additionalWorkForImageRequestCompletedWithResult_request_context___block_invoke;
  block[3] = &unk_1E5848EC0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(serialQueue, block);
}

- (BOOL)_canPopulateCacheForResult:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isDegraded] & 1) == 0
    && ([v3 isPlaceholder] & 1) == 0
    && ([v3 isCancelled] & 1) == 0
    && [v3 imageRef] != 0;

  return v4;
}

- (PHCachingImageManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)PHCachingImageManager;
  id v2 = [(PHImageManager *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    BOOL v4 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v3;

    *((_DWORD *)v2 + 12) = 0;
    int v5 = objc_alloc_init(PHImageCache);
    uint64_t v6 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v5;

    [*((id *)v2 + 7) setDelegate:v2];
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.photos.imageManagerCache", 0);
    id v8 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v7;

    v9 = dispatch_get_global_queue(0, 0);
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, v9);
    id v11 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v10;

    objc_initWeak(&location, v2);
    objc_copyWeak(&v13, &location);
    pl_dispatch_source_set_event_handler();
    dispatch_resume(*((dispatch_object_t *)v2 + 10));
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return (PHCachingImageManager *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryEventSource, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);

  objc_storeStrong((id *)&self->_cachingRequestIDs, 0);
}

- (void)setAllowsCachingHighQualityImages:(BOOL)allowsCachingHighQualityImages
{
  self->_allowsCachingHighQualityImages = allowsCachingHighQualityImages;
}

- (BOOL)allowsCachingHighQualityImages
{
  return self->_allowsCachingHighQualityImages;
}

- (void)imageCache:(id)a3 didEvictCacheEntry:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a4, "imageRequestIDForPopulatingCache", a3);
  if (v5)
  {
    uint64_t v6 = v5;
    dispatch_queue_t v7 = PLImageManagerGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v9 = [(PHImageManager *)self managerID];
      __int16 v10 = 2048;
      uint64_t v11 = (int)v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "[RM][cache]: %ld-%ld cache entry was evicted with inflight request ID, cancelling now", buf, 0x16u);
    }

    if (PHImageManagerRecordEnabled()) {
      +[PHImageManagerRequestTracer traceMessageForRequestID:v6, @"[RM][cache]: %ld-%ld cache entry was evicted with inflight request ID, cancelling now", [(PHImageManager *)self managerID], (int)v6 message];
    }
    [(PHImageManager *)self cancelImageRequest:v6];
  }
}

- (void)stopCachingImagesForAllAssets
{
  uint64_t v3 = PLImageManagerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "[RM][cache]: Stop caching images for all assets", v4, 2u);
  }

  [(PHImageCache *)self->_imageCache removeAllEntries];
  [(PHCachingImageManager *)self _scheduleOrCommitCacheChangesIfNeeded];
}

- (void)stopCachingImagesForAssets:(NSArray *)assets targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options
{
  double height = targetSize.height;
  double width = targetSize.width;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  __int16 v10 = assets;
  uint64_t v11 = options;
  if ([(NSArray *)v10 count])
  {
    uint64_t v12 = PLImageManagerGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [(NSArray *)v10 valueForKey:@"uuid"];
      *(_DWORD *)buf = 138412290;
      v40 = v13;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "[RM][cache]: stop caching images for assets: %@", buf, 0xCu);
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(PHImageRequestOptions *)v11 normalizedCropRect];
    double v19 = PHSanitizeNormalizedCropRect(0, v15, v16, v17, v18);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    double v26 = v10;
    uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      double v29 = ceil(width);
      double v30 = ceil(height);
      uint64_t v31 = *(void *)v35;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v35 != v31) {
            objc_enumerationMutation(v26);
          }
          v33 = _buildCacheKey(*(void **)(*((void *)&v34 + 1) + 8 * v32), v29, v30, v19, v21, v23, v25);
          objc_msgSend(v14, "addObject:", v33, (void)v34);

          ++v32;
        }
        while (v28 != v32);
        uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v28);
    }

    [(PHImageCache *)self->_imageCache removeEntriesForKeys:v14];
    [(PHCachingImageManager *)self _scheduleOrCommitCacheChangesIfNeeded];
  }
}

- (void)startCachingImagesForAssets:(NSArray *)assets targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode options:(PHImageRequestOptions *)options
{
  double height = targetSize.height;
  double width = targetSize.width;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = assets;
  uint64_t v12 = options;
  id v13 = v12;
  if (v12) {
    id v14 = (PHImageRequestOptions *)[(PHImageRequestOptions *)v12 copy];
  }
  else {
    id v14 = objc_alloc_init(PHImageRequestOptions);
  }
  CGFloat v15 = v14;
  if ([(NSArray *)v11 count])
  {
    double v16 = ceil(width);
    double v17 = ceil(height);
    CGFloat v18 = [(NSArray *)v11 firstObject];
    double v19 = [v18 photoLibrary];

    double v20 = objc_opt_class();
    double v21 = [v19 photoLibrary];
    double v22 = [(PHCachingImageManager *)self _tableFormatsForLibrary:v21];
    double v23 = objc_msgSend(v20, "_chooseImageTableFormatForPreheatingFromFormats:targetSize:contentMode:returnBestTableRegardlessOfFit:", v22, contentMode, -[PHImageRequestOptions deliveryMode](v15, "deliveryMode") == PHImageRequestOptionsDeliveryModeFastFormat, v16, v17);

    double v24 = PLImageManagerGetLog();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    if (v23)
    {
      if (v25)
      {
        double v26 = [(NSArray *)v11 valueForKey:@"uuid"];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v26;
        _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEBUG, "[RM][cache]: preheating image table for assets: %@", buf, 0xCu);
      }
      uint64_t v27 = [v19 photoLibrary];
      uint64_t v28 = [v27 thumbnailManager];
      double v29 = objc_msgSend(v28, "imageTableForFormat:", objc_msgSend(v23, "formatID"));

      [(PHCachingImageManager *)self _preheatImageTable:v29 forAssets:v11];
    }
    else
    {
      PHImageContentMode v65 = contentMode;
      if (v25)
      {
        double v30 = DCIM_NSStringFromCGSize();
        uint64_t v31 = [(NSArray *)v11 valueForKey:@"uuid"];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v31;
        _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEBUG, "[RM][cache]: start caching images for size: %@, assets: %@", buf, 0x16u);
      }
      if ([(PHImageRequestOptions *)v15 deliveryMode] == PHImageRequestOptionsDeliveryModeOpportunistic)
      {
        [(PHImageRequestOptions *)v15 setDeliveryMode:1];
        uint64_t v32 = PLImageManagerGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_DEBUG, "[RM][cache]: preheating image table for opportunistic request", buf, 2u);
        }

        v33 = [v19 photoLibrary];
        long long v34 = [(PHCachingImageManager *)self _imageTableForPreheatingDegradedOpportunisticRequestsWithPhotoLibrary:v33];

        [(PHCachingImageManager *)self _preheatImageTable:v34 forAssets:v11];
      }
      v62 = v19;
      v63 = v13;
      [(PHImageRequestOptions *)v15 setSynchronous:0];
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      v64 = v11;
      obj = v11;
      uint64_t v35 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v77 count:16];
      PHImageContentMode v36 = contentMode;
      if (v35)
      {
        uint64_t v37 = v35;
        uint64_t v67 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v74 != v67) {
              objc_enumerationMutation(obj);
            }
            v39 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            uint64_t v40 = [(PHImageManager *)self nextID];
            uint64_t v41 = [PHImageDisplaySpec alloc];
            [(PHImageRequestOptions *)v15 normalizedCropRect];
            v46 = -[PHImageDisplaySpec initWithTargetSize:contentMode:normalizedCropRect:](v41, "initWithTargetSize:contentMode:normalizedCropRect:", v36, v16, v17, v42, v43, v44, v45);
            int v72 = 0;
            imageCache = self->_imageCache;
            [(PHImageDisplaySpec *)v46 normalizedCropRect];
            v52 = _buildCacheKey(v39, v16, v17, v48, v49, v50, v51);
            LOBYTE(imageCache) = [(PHImageCache *)imageCache pinEntryForKey:v52 requestID:v40 inFlightRequestID:&v72];

            if ((imageCache & 1) != 0 || !v72)
            {
              v53 = v15;
              os_unfair_lock_lock(&self->_cachingLock);
              cachingRequestIDs = self->_cachingRequestIDs;
              v55 = [NSNumber numberWithInt:v40];
              [(NSMutableSet *)cachingRequestIDs addObject:v55];

              os_unfair_lock_unlock(&self->_cachingLock);
              v56 = PLImageManagerGetLog();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                unint64_t v57 = [(PHImageManager *)self managerID];
                *(_DWORD *)buf = 134218240;
                *(void *)&uint8_t buf[4] = v57;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = (int)v40;
                _os_log_impl(&dword_19B043000, v56, OS_LOG_TYPE_DEBUG, "[RM][cache]: %ld-%ld image request being run to populate cache", buf, 0x16u);
              }

              CGFloat v15 = v53;
              if (PHImageManagerRecordEnabled()) {
                +[PHImageManagerRequestTracer traceMessageForRequestID:v40, @"[RM][cache]: %ld-%ld image request being run to populate cache", [(PHImageManager *)self managerID], (int)v40 message];
              }
              serialQueue = self->_serialQueue;
              v68[0] = MEMORY[0x1E4F143A8];
              v68[1] = 3221225472;
              v68[2] = __84__PHCachingImageManager_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke;
              v68[3] = &unk_1E58430F8;
              int v71 = v40;
              v68[4] = self;
              v68[5] = v39;
              v69 = v53;
              v70 = v46;
              v59 = v68;
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __cpl_dispatch_async_block_invoke;
              v79 = &unk_1E5848D50;
              id v80 = v59;
              v60 = serialQueue;
              dispatch_block_t v61 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
              dispatch_async(v60, v61);

              PHImageContentMode v36 = v65;
            }
          }
          uint64_t v37 = [(NSArray *)obj countByEnumeratingWithState:&v73 objects:v77 count:16];
        }
        while (v37);
      }

      id v13 = v63;
      uint64_t v11 = v64;
      double v23 = 0;
      double v19 = v62;
      if ([(NSArray *)obj count]) {
        [(PHCachingImageManager *)self _scheduleOrCommitCacheChangesIfNeeded];
      }
    }
  }
}

void __84__PHCachingImageManager_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 64);
  uint64_t v3 = [*(id *)(a1 + 32) managerID];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__PHCachingImageManager_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2;
  v8[3] = &unk_1E58430D0;
  v8[4] = *(void *)(a1 + 32);
  dispatch_queue_t v7 = +[PHMediaRequestContext imageRequestContextWithRequestID:v2 managerID:v3 asset:v4 imageRequestOptions:v5 displaySpec:v6 resultHandler:v8];
  [*(id *)(a1 + 32) runRequestWithContext:v7];
}

uint64_t __84__PHCachingImageManager_startCachingImagesForAssets_targetSize_contentMode_options___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleCachingImageRequestResult:a2 request:a3 context:a4];
}

- (void)_scheduleOrCommitCacheChangesIfNeeded
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (!self->_imageCacheCommitScheduled)
    {
      self->_imageCacheCommitScheduled = 1;
      uint64_t v3 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      v5[0] = *MEMORY[0x1E4F1C4B0];
      uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
      [v3 performSelector:sel__commitCacheChanges target:self argument:0 order:0 modes:v4];
    }
  }
  else
  {
    [(PHCachingImageManager *)self _commitCacheChanges];
  }
}

- (void)_commitCacheChanges
{
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    self->_imageCacheCommitScheduled = 0;
  }
  uint64_t v3 = PLImageManagerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "[RM][cache]: Committing image caching changes", v4, 2u);
  }

  [(PHImageCache *)self->_imageCache commitChangesWithQueueToProcessDeletes:self->_serialQueue];
}

- (void)_handleCachingImageRequestResult:(id)a3 request:(id)a4 context:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 requestID];
  os_unfair_lock_lock(&self->_cachingLock);
  cachingRequestIDs = self->_cachingRequestIDs;
  id v13 = [NSNumber numberWithInt:v11];
  LODWORD(cachingRequestIDs) = [(NSMutableSet *)cachingRequestIDs containsObject:v13];

  os_unfair_lock_unlock(&self->_cachingLock);
  if (!cachingRequestIDs) {
    goto LABEL_23;
  }
  os_unfair_lock_lock(&self->_cachingLock);
  id v14 = self->_cachingRequestIDs;
  CGFloat v15 = [NSNumber numberWithInt:v11];
  [(NSMutableSet *)v14 removeObject:v15];

  os_unfair_lock_unlock(&self->_cachingLock);
  if (![(PHCachingImageManager *)self _canPopulateCacheForResult:v8])
  {
    if (([v8 isDegraded] & 1) == 0)
    {
      double v23 = PLImageManagerGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        double v24 = [v9 identifierString];
        BOOL v25 = [v8 info];
        double v26 = [(PHCachingImageManager *)self _cacheFailReasonFromInfo:v25];
        *(_DWORD *)buf = 138412546;
        v53 = v24;
        __int16 v54 = 2112;
        v55 = v26;
        _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ cache request failed, removing entry, reason: %@", buf, 0x16u);
      }
      if (PHImageManagerRecordEnabled())
      {
        double v49 = [v9 identifierString];
        double v50 = [v8 info];
        double v51 = [(PHCachingImageManager *)self _cacheFailReasonFromInfo:v50];
        +[PHImageManagerRequestTracer traceMessageForRequestID:v11, @"[RM][cache]: %@ cache request failed, removing entry, reason: %@", v49, v51 message];
      }
    }
    imageCache = self->_imageCache;
    uint64_t v28 = [v9 asset];
    double v29 = [v9 displaySpec];
    [v29 targetSize];
    double v31 = v30;
    double v33 = v32;
    long long v34 = [v9 displaySpec];
    [v34 contentMode];
    uint64_t v35 = [v9 displaySpec];
    [v35 normalizedCropRect];
    uint64_t v40 = _buildCacheKey(v28, v31, v33, v36, v37, v38, v39);
    [(PHImageCache *)imageCache populateEntryWithImage:0 requestID:v11 forKey:v40 additionalInfo:0];

LABEL_14:
    uint64_t v22 = 0;
LABEL_15:

    goto LABEL_20;
  }
  BOOL v16 = [(PHCachingImageManager *)self _cacheImageResult:v8 forRequest:v9];
  double v17 = PLImageManagerGetLog();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (!v16)
  {
    if (v18)
    {
      uint64_t v41 = [v9 identifierString];
      double v42 = [v9 asset];
      double v43 = [v42 uuid];
      *(_DWORD *)buf = 138412546;
      v53 = v41;
      __int16 v54 = 2112;
      v55 = v43;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ cache request finished but request is stale, for asset: %@", buf, 0x16u);
    }
    if (!PHImageManagerRecordEnabled())
    {
      uint64_t v22 = 0;
      goto LABEL_20;
    }
    uint64_t v28 = [v9 identifierString];
    double v29 = [v9 asset];
    long long v34 = [v29 uuid];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v11, @"[RM][cache]: %@ cache request finished but request is stale, for asset: %@", v28, v34 message];
    goto LABEL_14;
  }
  if (v18)
  {
    double v19 = [v9 identifierString];
    double v20 = [v9 asset];
    double v21 = [v20 uuid];
    *(_DWORD *)buf = 138412546;
    v53 = v19;
    __int16 v54 = 2112;
    v55 = v21;
    _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "[RM][cache]: %@ cache request stored image in cache for asset: %@", buf, 0x16u);
  }
  if (PHImageManagerRecordEnabled())
  {
    uint64_t v28 = [v9 identifierString];
    double v29 = [v9 asset];
    long long v34 = [v29 uuid];
    +[PHImageManagerRequestTracer traceMessageForRequestID:v11, @"[RM][cache]: %@ cache request stored image in cache for asset: %@", v28, v34 message];
    uint64_t v22 = 1;
    goto LABEL_15;
  }
  uint64_t v22 = 1;
LABEL_20:
  double v44 = [v10 imageOptions];
  double v45 = [v44 cachingCompleteHandler];

  if (v45)
  {
    v46 = [v44 cachingCompleteHandler];
    v47 = [v9 asset];
    double v48 = [v47 localIdentifier];
    ((void (**)(void, void *, uint64_t))v46)[2](v46, v48, v22);
  }
LABEL_23:
}

- (id)_cacheFailReasonFromInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"PHImageCancelledKey"];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = @"cancelled";
  }
  else
  {
    dispatch_queue_t v7 = [v3 objectForKey:@"PHImageErrorKey"];
    if (v7)
    {
      uint64_t v6 = [NSString stringWithFormat:@"error: %@", v7];
    }
    else
    {
      uint64_t v6 = @"other failure";
    }
  }

  return v6;
}

- (void)_handleMemoryWarning
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = PLImageManagerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 134217984;
    unint64_t v5 = [(PHImageManager *)self managerID];
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "[cache] %lu: didReceiveMemoryWarning: flushing all caches", (uint8_t *)&v4, 0xCu);
  }

  [(PHImageCache *)self->_imageCache removeAllEntries];
}

- (void)_preheatImageTable:(id)a3 forAssets:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v12) thumbnailIndex];
        if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
          [v7 addIndex:v13];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__PHCachingImageManager__preheatImageTable_forAssets___block_invoke;
  v15[3] = &unk_1E58430A8;
  id v16 = v5;
  id v14 = v5;
  [v7 enumerateRangesUsingBlock:v15];
}

uint64_t __54__PHCachingImageManager__preheatImageTable_forAssets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "touchEntriesInRange:", a2, a3);
}

- (id)_imageTableForPreheatingDegradedOpportunisticRequestsWithPhotoLibrary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PHCachingImageManager *)self _tableFormatsForLibrary:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v11 isSquare] & 1) == 0)
        {
          uint64_t v12 = [v4 thumbnailManager];
          uint64_t v13 = objc_msgSend(v12, "imageTableForFormat:", objc_msgSend(v11, "formatID"));

          id v8 = (void *)v13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_tableFormatsForLibrary:(id)a3
{
  id v3 = [a3 pathManager];
  id v4 = [MEMORY[0x1E4F8B9F8] tableThumbnailFormatsForConfigPhase:1 withPathManager:v3];

  return v4;
}

void __29__PHCachingImageManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleMemoryWarning];
}

+ (id)_chooseImageTableFormatForPreheatingFromFormats:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 returnBestTableRegardlessOfFit:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = v10;
  if (width == height)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v14 = 0;
      long long v15 = 0;
      uint64_t v16 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(v11);
          }
          long long v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if ([v18 isSquare])
          {
            if (!v15 || ([v15 dimension], double v20 = v19, objc_msgSend(v18, "dimension"), v20 < v21))
            {
              id v22 = v18;

              long long v15 = v22;
            }
            [v18 dimension];
            if (v23 >= width && v14 == 0) {
              id v14 = v18;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v13);
      goto LABEL_43;
    }
LABEL_42:
    id v14 = 0;
    long long v15 = 0;
    goto LABEL_43;
  }
  if (a5 && !v6) {
    goto LABEL_42;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v25 = [v10 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (!v25) {
    goto LABEL_42;
  }
  uint64_t v26 = v25;
  id v14 = 0;
  long long v15 = 0;
  uint64_t v27 = *(void *)v39;
  if (width >= height) {
    double v28 = width;
  }
  else {
    double v28 = height;
  }
  do
  {
    for (uint64_t j = 0; j != v26; ++j)
    {
      if (*(void *)v39 != v27) {
        objc_enumerationMutation(v11);
      }
      double v30 = *(void **)(*((void *)&v38 + 1) + 8 * j);
      if ([v30 formatMode] == 2)
      {
        if (!v15 || ([v15 dimension], double v32 = v31, objc_msgSend(v30, "dimension"), v32 < v33))
        {
          id v34 = v30;

          long long v15 = v34;
        }
        [v30 dimension];
        if (v35 >= v28 && v14 == 0) {
          id v14 = v30;
        }
      }
    }
    uint64_t v26 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
  }
  while (v26);
LABEL_43:
  if (width <= 0.0 || height <= 0.0)
  {

    id v14 = 0;
  }
  if (!v14 && v6) {
    id v14 = v15;
  }

  return v14;
}

@end