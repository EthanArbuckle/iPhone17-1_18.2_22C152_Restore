@interface MPAbstractNetworkArtworkDataSource
+ (void)_applyImageURLCachePolicy:(unint64_t)a3 cacheDiskPath:(id)a4 toConfiguration:(id)a5;
+ (void)_applyVideoCacheURL:(id)a3 toConfiguration:(id)a4;
- (BOOL)_isRepresentationSize:(CGSize)a3 validForCatalog:(id)a4;
- (BOOL)_subclassImplementsSelector:(SEL)a3;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)areRepresentationsOfKind:(int64_t)a3 availableForCatalog:(id)a4;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable;
- (BOOL)usesFallbackCache;
- (BOOL)wantsBackgroundImageDecompression;
- (CGSize)_bestAvailableSizeForCatalog:(id)a3 kind:(int64_t)a4;
- (CGSize)bestAvailableSizeForCatalog:(id)a3;
- (MPAbstractNetworkArtworkDataSource)init;
- (NSCache)fallbackImageArtworkRepresentationCache;
- (NSMapTable)resourceLoaderStoragePolicyMap;
- (NSMutableDictionary)loadingContexts;
- (NSMutableDictionary)videoTaskToCacheStoragePolicy;
- (NSMutableDictionary)videoTaskToData;
- (NSMutableDictionary)videoTaskToResourceLoadingRequest;
- (NSURL)videoArtworkCacheURL;
- (NSURLCache)videoURLCache;
- (NSURLSession)imageURLSession;
- (NSURLSession)videoURLSession;
- (NSURLSessionConfiguration)URLSessionConfiguration;
- (NSURLSessionDataDelegate)URLSessionDataDelegateProxy;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)imageAccessQueue;
- (OS_dispatch_queue)videoAccessQueue;
- (OS_dispatch_source)memoryPressureNotificationSource;
- (id)_artworkRepresentationWithImageFromData:(id)a3 forURLResponse:(id)a4 catalog:(id)a5 size:(CGSize)a6 immediateImageDecompressionAllowed:(BOOL)a7;
- (id)_bestVideoArtworkRepresentationForCatalog:(id)a3;
- (id)_cacheKeyForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5;
- (id)_existingRepresentationFromURLCacheForArtworkCatalog:(id)a3 immediateImageDecompressionAllowed:(BOOL)a4;
- (id)_existingRepresentativeObjectForArtworkCatalog:(id)a3 kind:(int64_t)a4 handler:(id)a5;
- (id)_requestForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5;
- (id)cacheKeyForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5;
- (id)cacheKeyForCatalog:(id)a3 size:(CGSize)a4;
- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)existingRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4;
- (id)requestForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5;
- (id)requestForCatalog:(id)a3 size:(CGSize)a4;
- (id)sortedSupportedSizesForCatalog:(id)a3;
- (id)supportedSizesForCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)_disableVideoCache;
- (void)_onImageAccessQueue_cancelLoadingContextForCatalogUUID:(id)a3 withLoadingURL:(id)a4;
- (void)_performAsyncBarrierBlockOnQueue:(id)a3 block:(id)a4;
- (void)_performSyncBlockOnQueue:(id)a3 block:(id)a4;
- (void)_reEnableVideoCache;
- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3;
- (void)dealloc;
- (void)loadArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5 systemEffectHandler:(id)a6 completionHandler:(id)a7;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
- (void)loadRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4 completionHandler:(id)a5;
- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)setFallbackImageArtworkRepresentationCache:(id)a3;
- (void)setImageAccessQueue:(id)a3;
- (void)setImageURLSession:(id)a3;
- (void)setLoadingContexts:(id)a3;
- (void)setMemoryPressureNotificationSource:(id)a3;
- (void)setResourceLoaderStoragePolicyMap:(id)a3;
- (void)setURLSessionDataDelegateProxy:(id)a3;
- (void)setUsesFallbackCache:(BOOL)a3;
- (void)setVideoAccessQueue:(id)a3;
- (void)setVideoArtworkCacheURL:(id)a3;
- (void)setVideoTaskToCacheStoragePolicy:(id)a3;
- (void)setVideoTaskToData:(id)a3;
- (void)setVideoTaskToResourceLoadingRequest:(id)a3;
- (void)setVideoURLCache:(id)a3;
- (void)setVideoURLSession:(id)a3;
- (void)startListeningForMemoryPressureNotifications;
- (void)stopListeningForMemoryPressureNotifications;
- (void)updateURLSessionWithCachePolicy:(unint64_t)a3 cachePath:(id)a4;
@end

@implementation MPAbstractNetworkArtworkDataSource

void __141__MPAbstractNetworkArtworkDataSource__artworkRepresentationWithImageFromData_forURLResponse_catalog_size_immediateImageDecompressionAllowed___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = *(double *)(a1 + 56);
    double v6 = *(double *)(a1 + 64);
    id v7 = a2;
    objc_msgSend(v3, "_cacheKeyForCatalog:kind:size:", v4, 0, v5, v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = [*(id *)(a1 + 48) representationWithPreparedImage:v7];

    v9 = [*(id *)(a1 + 40) cache];
    [v9 setObject:v8 forKey:v10];
  }
}

- (id)existingRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 1)
  {
    v11 = [v6 videoCache];
    if (!v11)
    {
LABEL_10:
      v12 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    if (a3)
    {
      v11 = 0;
      v12 = 0;
      goto LABEL_18;
    }
    v8 = [v6 cache];
    v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(MPAbstractNetworkArtworkDataSource *)self fallbackImageArtworkRepresentationCache];
    }
    v11 = v10;

    if (!v11) {
      goto LABEL_10;
    }
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__MPAbstractNetworkArtworkDataSource_existingRepresentationOfKind_forArtworkCatalog___block_invoke;
  v17[3] = &unk_1E57F1130;
  v17[4] = self;
  id v18 = v7;
  int64_t v20 = a3;
  id v19 = v11;
  v12 = [(MPAbstractNetworkArtworkDataSource *)self _existingRepresentativeObjectForArtworkCatalog:v18 kind:a3 handler:v17];

LABEL_11:
  if (a3 == 1 && !v12)
  {
    v13 = [(MPAbstractNetworkArtworkDataSource *)self _bestVideoArtworkRepresentationForCatalog:v7];
    v12 = v13;
    if (v11)
    {
      if (v13)
      {
        uint64_t v14 = [v13 kind];
        [v12 representationSize];
        v15 = -[MPAbstractNetworkArtworkDataSource _cacheKeyForCatalog:kind:size:](self, "_cacheKeyForCatalog:kind:size:", v7, v14);
        if (v15) {
          [v11 setObject:v12 forKey:v15];
        }
      }
    }
  }
LABEL_18:

  return v12;
}

- (void)loadRepresentationOfKind:(int64_t)a3 forArtworkCatalog:(id)a4 completionHandler:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = (void (**)(id, void *, void))a5;
  id v10 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v61 = self;
    __int16 v62 = 2048;
    int64_t v63 = a3;
    __int16 v64 = 2114;
    int64_t v65 = (int64_t)v8;
    _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Calling loadRepresentationOfKind: %ld, for artwork catalog: %{public}@", buf, 0x20u);
  }

  if (a3 == 1)
  {
    v11 = [(MPAbstractNetworkArtworkDataSource *)self _bestVideoArtworkRepresentationForCatalog:v8];
    v12 = [v8 videoCache];
    if (v12)
    {
      [v11 representationSize];
      v13 = -[MPAbstractNetworkArtworkDataSource _cacheKeyForCatalog:kind:size:](self, "_cacheKeyForCatalog:kind:size:", v8, 1);
      if (v13)
      {
        if (v11)
        {
          [v12 setObject:v11 forKey:v13];
        }
        else
        {
          v37 = [MEMORY[0x1E4F1CA98] null];
          [v12 setObject:v37 forKey:v13];
        }
      }
    }
    v9[2](v9, v11, 0);
    goto LABEL_41;
  }
  uint64_t v14 = [v8 cache];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [(MPAbstractNetworkArtworkDataSource *)self fallbackImageArtworkRepresentationCache];
  }
  v11 = v16;

  uint64_t v17 = [(MPAbstractNetworkArtworkDataSource *)self _existingRepresentationFromURLCacheForArtworkCatalog:v8 immediateImageDecompressionAllowed:1];
  if (!v17)
  {
    [(MPAbstractNetworkArtworkDataSource *)self _bestAvailableSizeForCatalog:v8 kind:a3];
    int64_t v26 = *(void *)&v24;
    int64_t v27 = *(void *)&v25;
    if (v24 == *MEMORY[0x1E4F1DB30] && v25 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      v31 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        v61 = self;
        __int16 v62 = 2114;
        int64_t v63 = (int64_t)v8;
        __int16 v64 = 2048;
        int64_t v65 = a3;
        _os_log_impl(&dword_1952E8000, v31, OS_LOG_TYPE_FAULT, "%{public}@ Artwork request cannot have a size of zero, catalog: %{public}@, representation kind: %ld", buf, 0x20u);
      }
      id v32 = 0;
    }
    else
    {
      v29 = -[MPAbstractNetworkArtworkDataSource _requestForCatalog:kind:size:](self, "_requestForCatalog:kind:size:", v8, a3, v24, v25);
      v30 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v61 = self;
        __int16 v62 = 2048;
        int64_t v63 = v26;
        __int16 v64 = 2048;
        int64_t v65 = v27;
        _os_log_impl(&dword_1952E8000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Created request for size: %f, %f", buf, 0x20u);
      }

      v31 = [v29 mutableCopy];
      [v31 setAttribution:1];
      id v32 = [v31 copy];
    }
    v33 = [v32 URL];
    v34 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v61 = self;
      __int16 v62 = 2114;
      int64_t v63 = (int64_t)v33;
      _os_log_impl(&dword_1952E8000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting artwork request for url: %{public}@", buf, 0x16u);
    }

    if (v33)
    {
      imageAccessQueue = self->_imageAccessQueue;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke;
      v46[3] = &unk_1E57F11A8;
      id v47 = v8;
      id v48 = v33;
      v49 = self;
      v52 = v9;
      int64_t v53 = v26;
      int64_t v54 = v27;
      id v50 = v32;
      BOOL v55 = v11 != 0;
      id v51 = v11;
      [(MPAbstractNetworkArtworkDataSource *)self _performAsyncBarrierBlockOnQueue:imageAccessQueue block:v46];

      v36 = v47;
    }
    else if (v32)
    {
      v36 = [NSString stringWithFormat:@"Artwork request must have a non-nil URL. catalog=%@", v8];
      v39 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        v61 = self;
        __int16 v62 = 2114;
        int64_t v63 = (int64_t)v36;
        _os_log_impl(&dword_1952E8000, v39, OS_LOG_TYPE_FAULT, "%{public}@ -loadRepresentationOfKind:forArtworkCatalog:completionHandler: %{public}@", buf, 0x16u);
      }

      if (v9)
      {
        v40 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v58 = *MEMORY[0x1E4F28228];
        v59 = v36;
        v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        v42 = [v40 errorWithDomain:@"MPAbstractNetworkArtworkDataSourceErrorDomain" code:1 userInfo:v41];

        ((void (**)(id, void *, void *))v9)[2](v9, 0, v42);
      }
    }
    else
    {
      if (!v9) {
        goto LABEL_32;
      }
      v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28228];
      v44 = [NSString stringWithFormat:@"Failed to create URL request for catalog: %@", v8];
      v57 = v44;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      v36 = [v43 errorWithDomain:@"MPAbstractNetworkArtworkDataSource" code:0 userInfo:v45];

      ((void (**)(id, void *, void *))v9)[2](v9, 0, v36);
    }

LABEL_32:
    v12 = 0;
    goto LABEL_41;
  }
  v12 = (void *)v17;
  id v18 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v61 = self;
    __int16 v62 = 2114;
    int64_t v63 = (int64_t)v12;
    __int16 v64 = 2114;
    int64_t v65 = (int64_t)v8;
    _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Found existing representation: %{public}@ from url cache for catalog: %{public}@", buf, 0x20u);
  }

  if (v11)
  {
    uint64_t v19 = [v12 kind];
    [v12 representationSize];
    int64_t v20 = -[MPAbstractNetworkArtworkDataSource _cacheKeyForCatalog:kind:size:](self, "_cacheKeyForCatalog:kind:size:", v8, v19);
    v21 = [v8 cache];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      id v23 = [(MPAbstractNetworkArtworkDataSource *)self fallbackImageArtworkRepresentationCache];
    }
    v38 = v23;

    if (v20) {
      [v38 setObject:v12 forKey:v20];
    }
  }
  v9[2](v9, v12, 0);
LABEL_41:
}

- (id)_existingRepresentationFromURLCacheForArtworkCatalog:(id)a3 immediateImageDecompressionAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __126__MPAbstractNetworkArtworkDataSource__existingRepresentationFromURLCacheForArtworkCatalog_immediateImageDecompressionAllowed___block_invoke;
  uint64_t v19 = &unk_1E57F1220;
  int64_t v20 = self;
  id v21 = v6;
  id v7 = v6;
  id v8 = [(MPAbstractNetworkArtworkDataSource *)self _existingRepresentativeObjectForArtworkCatalog:v7 kind:0 handler:&v16];
  v9 = objc_msgSend(v8, "data", v16, v17, v18, v19, v20);
  id v10 = [v8 response];
  v11 = [v8 userInfo];
  v12 = [v11 objectForKeyedSubscript:@"representationSize"];
  CGSize v13 = CGSizeFromString(v12);
  uint64_t v14 = -[MPAbstractNetworkArtworkDataSource _artworkRepresentationWithImageFromData:forURLResponse:catalog:size:immediateImageDecompressionAllowed:](self, "_artworkRepresentationWithImageFromData:forURLResponse:catalog:size:immediateImageDecompressionAllowed:", v9, v10, v7, v4, v13.width, v13.height);

  return v14;
}

- (id)_existingRepresentativeObjectForArtworkCatalog:(id)a3 kind:(int64_t)a4 handler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, uint64_t *))a5;
  [(MPAbstractNetworkArtworkDataSource *)self _bestAvailableSizeForCatalog:v8 kind:a4];
  double v11 = v10;
  double v13 = v12;
  uint64_t v28 = 0;
  uint64_t v14 = v9[2](v9, &v28);
  v15 = (void *)v14;
  if (a4 || v14) {
    goto LABEL_16;
  }
  if (v28
    && ![(MPAbstractNetworkArtworkDataSource *)self shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable])
  {
    v15 = 0;
    goto LABEL_16;
  }
  uint64_t v16 = [(MPAbstractNetworkArtworkDataSource *)self sortedSupportedSizesForCatalog:v8];
  if (!v16)
  {
    uint64_t v17 = [(MPAbstractNetworkArtworkDataSource *)self supportedSizesForCatalog:v8];
    uint64_t v16 = [v17 sortedArrayUsingComparator:&__block_literal_global_389];
  }
  id v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v11, v13);
  uint64_t v19 = [v16 indexOfObject:v18];

  uint64_t v20 = v19 + 1;
  if (v19 + 1 >= (unint64_t)[v16 count])
  {
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  while (1)
  {
    id v21 = [v16 objectAtIndexedSubscript:v20];
    [v21 CGSizeValue];
    double v23 = v22;
    double v25 = v24;

    if (!-[MPAbstractNetworkArtworkDataSource _isRepresentationSize:validForCatalog:](self, "_isRepresentationSize:validForCatalog:", v8, v23, v25))goto LABEL_12; {
    uint64_t v28 = 1;
    }
    uint64_t v26 = ((void (*)(void (**)(id, uint64_t *), uint64_t *, double, double))v9[2])(v9, &v28, v23, v25);
    if (v26) {
      break;
    }
    if (v28
      && ![(MPAbstractNetworkArtworkDataSource *)self shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable])
    {
      goto LABEL_13;
    }
LABEL_12:
    if (++v20 >= (unint64_t)[v16 count]) {
      goto LABEL_13;
    }
  }
  v15 = (void *)v26;
LABEL_14:

LABEL_16:

  return v15;
}

id __126__MPAbstractNetworkArtworkDataSource__existingRepresentationFromURLCacheForArtworkCatalog_immediateImageDecompressionAllowed___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_requestForCatalog:kind:size:", *(void *)(a1 + 40), 0);
  if (v2)
  {
    v3 = [*(id *)(a1 + 32) imageURLSession];
    BOOL v4 = [v3 configuration];
    double v5 = [v4 URLCache];
    id v6 = [v5 cachedResponseForRequest:v2];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSURLSession)imageURLSession
{
  return self->_imageURLSession;
}

- (id)_requestForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = -[MPAbstractNetworkArtworkDataSource requestForCatalog:kind:size:](self, "requestForCatalog:kind:size:", v9, a4, width, height);
  }
  else
  {
    if (a4)
    {
      double v11 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = -[MPAbstractNetworkArtworkDataSource requestForCatalog:size:](self, "requestForCatalog:size:", v9, width, height);
  }
  double v11 = (void *)v10;
LABEL_7:
  if (_requestForCatalog_kind_size__onceToken != -1) {
    dispatch_once(&_requestForCatalog_kind_size__onceToken, &__block_literal_global_216_20175);
  }
  double v12 = (void *)[v11 mutableCopy];
  [v12 setValue:_requestForCatalog_kind_size__userAgent forHTTPHeaderField:*MEMORY[0x1E4FB8420]];
  id v13 = v12;

  return v13;
}

- (CGSize)_bestAvailableSizeForCatalog:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(MPAbstractNetworkArtworkDataSource *)self bestAvailableSizeForCatalog:v6];
    double v8 = v7;
    double v10 = v9;
  }
  else if (a4)
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v11 = [(MPAbstractNetworkArtworkDataSource *)self sortedSupportedSizesForCatalog:v6];
    if (!v11)
    {
      double v12 = [(MPAbstractNetworkArtworkDataSource *)self supportedSizesForCatalog:v6];
      double v11 = [v12 sortedArrayUsingComparator:&__block_literal_global_389];
    }
    [v6 scaledFittingSize];
    double v8 = MPArtworkRepresentationBestSizeMatchingSize(v11, v13, v14);
    double v10 = v15;
  }
  double v16 = v8;
  double v17 = v10;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (id)_cacheKeyForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = -[MPAbstractNetworkArtworkDataSource cacheKeyForCatalog:kind:size:](self, "cacheKeyForCatalog:kind:size:", v9, a4, width, height);
  }
  else
  {
    if (a4)
    {
      double v11 = 0;
      goto LABEL_7;
    }
    uint64_t v10 = -[MPAbstractNetworkArtworkDataSource cacheKeyForCatalog:size:](self, "cacheKeyForCatalog:size:", v9, width, height);
  }
  double v11 = (void *)v10;
LABEL_7:

  return v11;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_isEqual(a3, sel_areRepresentationsOfKind_availableForCatalog_)
    || sel_isEqual(a3, sel_requestForCatalog_kind_size_)
    || sel_isEqual(a3, sel_cacheKeyForCatalog_kind_size_)
    || sel_isEqual(a3, sel_bestAvailableSizeForCatalog_))
  {
    return [(MPAbstractNetworkArtworkDataSource *)self _subclassImplementsSelector:a3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MPAbstractNetworkArtworkDataSource;
    return [(MPAbstractNetworkArtworkDataSource *)&v6 respondsToSelector:a3];
  }
}

- (BOOL)_subclassImplementsSelector:(SEL)a3
{
  uint64_t v4 = [(id)objc_opt_class() instanceMethodForSelector:a3];
  if (v4) {
    LOBYTE(v4) = [(id)objc_opt_class() instanceMethodForSelector:a3] != v4;
  }
  return v4;
}

id __85__MPAbstractNetworkArtworkDataSource_existingRepresentationOfKind_forArtworkCatalog___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_cacheKeyForCatalog:kind:size:", *(void *)(a1 + 40), *(void *)(a1 + 56));
  if (v4)
  {
    double v5 = [*(id *)(a1 + 48) objectForKey:v4];
  }
  else
  {
    double v5 = 0;
  }
  objc_super v6 = [MEMORY[0x1E4F1CA98] null];

  if (v5 == v6)
  {

    double v5 = 0;
    *a2 = 1;
  }

  return v5;
}

- (id)_artworkRepresentationWithImageFromData:(id)a3 forURLResponse:(id)a4 catalog:(id)a5 size:(CGSize)a6 immediateImageDecompressionAllowed:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.height;
  double width = a6.width;
  id v12 = a5;
  if (a3)
  {
    double v13 = [MEMORY[0x1E4FB1818] imageWithData:a3];
    double v14 = [v12 visualIdenticalityIdentifier];
    double v15 = +[MPArtworkRepresentation representationForVisualIdentity:withSize:image:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:image:", v14, v13, width, height);

    if (v7
      && [(MPAbstractNetworkArtworkDataSource *)self wantsBackgroundImageDecompression])
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __141__MPAbstractNetworkArtworkDataSource__artworkRepresentationWithImageFromData_forURLResponse_catalog_size_immediateImageDecompressionAllowed___block_invoke;
      v17[3] = &unk_1E57F11F8;
      v17[4] = self;
      id v18 = v12;
      double v20 = width;
      double v21 = height;
      id v19 = v15;
      [v13 prepareForDisplayWithCompletionHandler:v17];
    }
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (MPAbstractNetworkArtworkDataSource)init
{
  v32.receiver = self;
  v32.super_class = (Class)MPAbstractNetworkArtworkDataSource;
  id v2 = [(MPAbstractNetworkArtworkDataSource *)&v32 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.mediaplayer.MPAbstractNetworkArtworkDataSource.imageAccessQueue", MEMORY[0x1E4F14430]);
    uint64_t v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 4), (const void *)_MPAbstractNetworkArtworkDataSourceQueueSpecificIsAccessQueue, (void *)_MPAbstractNetworkArtworkDataSourceQueueSpecificIsAccessQueue, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.mediaplayer.MPAbstractNetworkArtworkDataSource.videoAccessQueue", 0);
    objc_super v6 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaplayer.MPAbstractNetworkArtworkDataSource.callbackQueue", 0);
    double v8 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v10 = (void *)*((void *)v2 + 9);
    *((void *)v2 + 9) = v9;

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v12 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    double v14 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    double v16 = (void *)*((void *)v2 + 11);
    *((void *)v2 + 11) = v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    id v18 = (void *)*((void *)v2 + 12);
    *((void *)v2 + 12) = v17;

    if (([v2 _subclassImplementsSelector:sel_cacheKeyForCatalog_kind_size_] & 1) != 0
      || [v2 _subclassImplementsSelector:sel_cacheKeyForCatalog_size_])
    {
      *((unsigned char *)v2 + 8) = 1;
      id v19 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      double v20 = (void *)*((void *)v2 + 7);
      *((void *)v2 + 7) = v19;
    }
    double v21 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    [v21 setHTTPShouldUsePipelining:1];
    [(id)objc_opt_class() _applyImageURLCachePolicy:0 cacheDiskPath:0 toConfiguration:v21];
    uint64_t v22 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v21];
    double v23 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v22;

    double v24 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    [v24 setHTTPShouldUsePipelining:1];
    [(id)objc_opt_class() _applyVideoCacheURL:0 toConfiguration:v24];
    double v25 = [v24 URLCache];
    objc_storeWeak((id *)v2 + 15, v25);

    uint64_t v26 = [MEMORY[0x1E4F77A40] proxyWithObject:v2 protocol:&unk_1EE72ECF8];
    objc_storeWeak((id *)v2 + 16, v26);
    uint64_t v27 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v24 delegate:v26 delegateQueue:0];
    uint64_t v28 = (void *)*((void *)v2 + 14);
    *((void *)v2 + 14) = v27;

    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v2 selector:sel__didReceiveMemoryWarningNotification_ name:*MEMORY[0x1E4FB2650] object:0];

    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v2 selector:sel__didReceiveWillEnterForegroundNotification_ name:*MEMORY[0x1E4FB2730] object:0];
  }
  return (MPAbstractNetworkArtworkDataSource *)v2;
}

+ (void)_applyVideoCacheURL:(id)a3 toConfiguration:(id)a4
{
  id v10 = a3;
  dispatch_queue_t v5 = (objc_class *)MEMORY[0x1E4F29078];
  id v6 = a4;
  id v7 = [v5 alloc];
  if (v10) {
    double v8 = (void *)[v7 initWithMemoryCapacity:83886080 diskCapacity:104857600 directoryURL:v10];
  }
  else {
    double v8 = (void *)[v7 initWithMemoryCapacity:83886080 diskCapacity:104857600 diskPath:0];
  }
  uint64_t v9 = v8;
  objc_msgSend(v8, "set_maxCacheableEntrySizeRatio:", 1.0);
  [v6 setURLCache:v9];
}

+ (void)_applyImageURLCachePolicy:(unint64_t)a3 cacheDiskPath:(id)a4 toConfiguration:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  [v7 setRequestCachePolicy:a3];
  if (v10) {
    double v8 = [[_MPArtworkDataSourceURLCache alloc] initWithMemoryCapacity:0 diskCapacity:0 diskPath:v10];
  }
  else {
    double v8 = objc_alloc_init(_MPArtworkDataSourceURLCache);
  }
  uint64_t v9 = v8;
  [(NSURLCache *)v8 setMemoryCapacity:0];
  [(NSURLCache *)v9 setDiskCapacity:419430400];
  [v7 setURLCache:v9];
}

void __67__MPAbstractNetworkArtworkDataSource__requestForCatalog_kind_size___block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4FB8700]) initWithBlock:&__block_literal_global_220_20177];
  uint64_t v0 = [v2 userAgent];
  v1 = (void *)_requestForCatalog_kind_size__userAgent;
  _requestForCatalog_kind_size__userAgent = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryPressureNotificationSource, 0);
  objc_destroyWeak((id *)&self->_URLSessionDataDelegateProxy);
  objc_destroyWeak((id *)&self->_videoURLCache);
  objc_storeStrong((id *)&self->_videoURLSession, 0);
  objc_storeStrong((id *)&self->_imageURLSession, 0);
  objc_storeStrong((id *)&self->_videoTaskToData, 0);
  objc_storeStrong((id *)&self->_videoTaskToResourceLoadingRequest, 0);
  objc_storeStrong((id *)&self->_videoTaskToCacheStoragePolicy, 0);
  objc_storeStrong((id *)&self->_resourceLoaderStoragePolicyMap, 0);
  objc_storeStrong((id *)&self->_loadingContexts, 0);
  objc_storeStrong((id *)&self->_fallbackImageArtworkRepresentationCache, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_videoAccessQueue, 0);
  objc_storeStrong((id *)&self->_imageAccessQueue, 0);
  objc_storeStrong((id *)&self->_videoArtworkCacheURL, 0);

  objc_storeStrong((id *)&self->_URLSessionConfiguration, 0);
}

- (void)setMemoryPressureNotificationSource:(id)a3
{
}

- (OS_dispatch_source)memoryPressureNotificationSource
{
  return self->_memoryPressureNotificationSource;
}

- (void)setURLSessionDataDelegateProxy:(id)a3
{
}

- (NSURLSessionDataDelegate)URLSessionDataDelegateProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_URLSessionDataDelegateProxy);

  return (NSURLSessionDataDelegate *)WeakRetained;
}

- (void)setVideoURLCache:(id)a3
{
}

- (NSURLCache)videoURLCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_videoURLCache);

  return (NSURLCache *)WeakRetained;
}

- (void)setVideoURLSession:(id)a3
{
}

- (NSURLSession)videoURLSession
{
  return self->_videoURLSession;
}

- (void)setImageURLSession:(id)a3
{
}

- (void)setVideoTaskToData:(id)a3
{
}

- (NSMutableDictionary)videoTaskToData
{
  return self->_videoTaskToData;
}

- (void)setVideoTaskToResourceLoadingRequest:(id)a3
{
}

- (NSMutableDictionary)videoTaskToResourceLoadingRequest
{
  return self->_videoTaskToResourceLoadingRequest;
}

- (void)setVideoTaskToCacheStoragePolicy:(id)a3
{
}

- (NSMutableDictionary)videoTaskToCacheStoragePolicy
{
  return self->_videoTaskToCacheStoragePolicy;
}

- (void)setResourceLoaderStoragePolicyMap:(id)a3
{
}

- (NSMapTable)resourceLoaderStoragePolicyMap
{
  return self->_resourceLoaderStoragePolicyMap;
}

- (void)setLoadingContexts:(id)a3
{
}

- (NSMutableDictionary)loadingContexts
{
  return self->_loadingContexts;
}

- (void)setFallbackImageArtworkRepresentationCache:(id)a3
{
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setVideoAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)videoAccessQueue
{
  return self->_videoAccessQueue;
}

- (void)setImageAccessQueue:(id)a3
{
}

- (OS_dispatch_queue)imageAccessQueue
{
  return self->_imageAccessQueue;
}

- (NSURL)videoArtworkCacheURL
{
  return self->_videoArtworkCacheURL;
}

- (void)setUsesFallbackCache:(BOOL)a3
{
  self->_usesFallbackCache = a3;
}

- (BOOL)usesFallbackCache
{
  return self->_usesFallbackCache;
}

- (NSURLSessionConfiguration)URLSessionConfiguration
{
  return self->_URLSessionConfiguration;
}

- (void)stopListeningForMemoryPressureNotifications
{
  dispatch_queue_t v3 = [(MPAbstractNetworkArtworkDataSource *)self memoryPressureNotificationSource];

  if (v3)
  {
    uint64_t v4 = [(MPAbstractNetworkArtworkDataSource *)self memoryPressureNotificationSource];
    dispatch_source_cancel(v4);

    [(MPAbstractNetworkArtworkDataSource *)self setMemoryPressureNotificationSource:0];
  }
}

- (void)startListeningForMemoryPressureNotifications
{
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, MEMORY[0x1E4F14428]);
  [(MPAbstractNetworkArtworkDataSource *)self setMemoryPressureNotificationSource:v3];

  uint64_t v4 = [(MPAbstractNetworkArtworkDataSource *)self memoryPressureNotificationSource];

  if (v4)
  {
    objc_initWeak(&location, self);
    dispatch_queue_t v5 = [(MPAbstractNetworkArtworkDataSource *)self memoryPressureNotificationSource];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    uint64_t v9 = __82__MPAbstractNetworkArtworkDataSource_startListeningForMemoryPressureNotifications__block_invoke;
    id v10 = &unk_1E57F6EF0;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v5, &v7);

    id v6 = [(MPAbstractNetworkArtworkDataSource *)self memoryPressureNotificationSource];
    dispatch_resume(v6);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __82__MPAbstractNetworkArtworkDataSource_startListeningForMemoryPressureNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v2 = [WeakRetained memoryPressureNotificationSource];
    uintptr_t data = dispatch_source_get_data(v2);

    id WeakRetained = v5;
    if (data != currentMemoryPressureLevel)
    {
      uint64_t v4 = (void *)MEMORY[0x19971DE60](v5);
      if (data == 4 || data == 2)
      {
        [v5 _disableVideoCache];
      }
      else if (data == 1 && (currentMemoryPressureLevel == 4 || currentMemoryPressureLevel == 2))
      {
        [v5 _reEnableVideoCache];
      }
      currentMemoryPressureLevel = data;
      id WeakRetained = v5;
    }
  }
}

- (void)_reEnableVideoCache
{
  id v2 = [(MPAbstractNetworkArtworkDataSource *)self videoURLCache];
  if (![v2 memoryCapacity])
  {
    [v2 setMemoryCapacity:83886080];
    dispatch_source_t v3 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "MPAbstractNetworkArtworkDataSource: _reEnableVideoCache: Increasing video URLCache memory capacity from 0 to default capacity.", v4, 2u);
    }
  }
}

- (void)_disableVideoCache
{
  id v2 = [(MPAbstractNetworkArtworkDataSource *)self videoURLCache];
  [v2 _CFURLCache];
  _CFURLCachePurgeMemoryCache();
  [v2 setMemoryCapacity:0];
  dispatch_source_t v3 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "MPAbstractNetworkArtworkDataSource: _disableVideoCache: Reducing video URLCache memory capacity to 0.", v4, 2u);
  }
}

- (id)_bestVideoArtworkRepresentationForCatalog:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__MPAbstractNetworkArtworkDataSource__bestVideoArtworkRepresentationForCatalog___block_invoke;
  v8[3] = &unk_1E57F1268;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(MPAbstractNetworkArtworkDataSource *)self _existingRepresentativeObjectForArtworkCatalog:v5 kind:1 handler:v8];

  return v6;
}

id __80__MPAbstractNetworkArtworkDataSource__bestVideoArtworkRepresentationForCatalog___block_invoke(uint64_t a1, double a2, double a3)
{
  id v6 = objc_msgSend(*(id *)(a1 + 32), "_requestForCatalog:kind:size:", *(void *)(a1 + 40), 1);
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 URL];
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "allowsVideoConstrainedNetworkAccess"));
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F160F8]];

    uint64_t v11 = MEMORY[0x1E4F1CC38];
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F16178]];
    [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F16140]];
    [v9 setObject:&unk_1EE6ED028 forKeyedSubscript:*MEMORY[0x1E4F16170]];
    id v12 = [MEMORY[0x1E4F166C8] URLAssetWithURL:v8 options:v9];
    uint64_t v13 = [v12 resourceLoader];
    double v14 = *(void **)(a1 + 32);
    uint64_t v15 = [v14 videoAccessQueue];
    [v13 setDelegate:v14 queue:v15];

    double v16 = *(void **)(a1 + 32);
    uint64_t v17 = [v16 videoAccessQueue];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __80__MPAbstractNetworkArtworkDataSource__bestVideoArtworkRepresentationForCatalog___block_invoke_224;
    v24[3] = &unk_1E57FA038;
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 32);
    id v25 = v18;
    uint64_t v26 = v19;
    id v27 = v13;
    id v20 = v13;
    [v16 _performSyncBlockOnQueue:v17 block:v24];
  }
  else
  {
    id v12 = 0;
  }
  double v21 = [*(id *)(a1 + 40) visualIdenticalityIdentifier];
  uint64_t v22 = +[MPArtworkRepresentation representationForVisualIdentity:withSize:video:](MPArtworkRepresentation, "representationForVisualIdentity:withSize:video:", v21, v12, a2, a3);

  return v22;
}

void __80__MPAbstractNetworkArtworkDataSource__bestVideoArtworkRepresentationForCatalog___block_invoke_224(uint64_t a1)
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "videoCacheStoragePolicy"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 40) resourceLoaderStoragePolicyMap];
  [v2 setObject:v3 forKey:*(void *)(a1 + 48)];
}

- (void)_performSyncBlockOnQueue:(id)a3 block:(id)a4
{
  queue = (OS_dispatch_queue *)a3;
  id v6 = (void (**)(id, OS_dispatch_queue *))a4;
  uint64_t v7 = queue;
  uint64_t v8 = v6;
  if (self->_imageAccessQueue == queue
    && (specific = dispatch_get_specific((const void *)_MPAbstractNetworkArtworkDataSourceQueueSpecificIsAccessQueue),
        uint64_t v7 = queue,
        specific))
  {
    if (v8) {
      v8[2](v8, queue);
    }
  }
  else
  {
    dispatch_sync(v7, v8);
  }
}

- (void)_performAsyncBarrierBlockOnQueue:(id)a3 block:(id)a4
{
}

- (BOOL)_isRepresentationSize:(CGSize)a3 validForCatalog:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  [a4 scaledFittingSize];
  return height <= v7 + v7 && width <= v6 + v6;
}

- (void)_onImageAccessQueue_cancelLoadingContextForCatalogUUID:(id)a3 withLoadingURL:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_barrier((dispatch_queue_t)self->_imageAccessQueue);
  uint64_t v8 = [(NSMutableDictionary *)self->_loadingContexts objectForKey:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 catalogIdentifierToCompletionHandlerMap];
    uint64_t v11 = [v10 objectForKey:v6];

    if (v11)
    {
      id v12 = [v9 catalogIdentifierToCompletionHandlerMap];
      [v12 removeObjectForKey:v6];

      uint64_t v13 = [(MPAbstractNetworkArtworkDataSource *)self callbackQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __108__MPAbstractNetworkArtworkDataSource__onImageAccessQueue_cancelLoadingContextForCatalogUUID_withLoadingURL___block_invoke;
      block[3] = &unk_1E57FA198;
      id v20 = v11;
      dispatch_async(v13, block);
    }
    double v14 = [v9 catalogIdentifierToCompletionHandlerMap];
    uint64_t v15 = [v14 count];

    if (!v15)
    {
      double v16 = [v9 dataTask];
      [v16 cancel];

      [(NSMutableDictionary *)self->_loadingContexts removeObjectForKey:v7];
    }
  }
  else
  {
    uint64_t v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v18;
      __int16 v23 = 2048;
      double v24 = self;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, "<%@: %p> _cancelLoadingContextForCatalogUUID:withLoadingURL: No loading context for url=%@", buf, 0x20u);
    }
  }
}

void __108__MPAbstractNetworkArtworkDataSource__onImageAccessQueue_cancelLoadingContextForCatalogUUID_withLoadingURL___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MPAbstractNetworkArtworkDataSourceErrorDomain" code:2 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MPAbstractNetworkArtworkDataSource *)self videoAccessQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000;
    double v24 = __Block_byref_object_copy__20188;
    __int16 v25 = __Block_byref_object_dispose__20189;
    id v26 = 0;
    id v9 = [(MPAbstractNetworkArtworkDataSource *)self videoTaskToResourceLoadingRequest];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __77__MPAbstractNetworkArtworkDataSource_resourceLoader_didCancelLoadingRequest___block_invoke;
    id v18 = &unk_1E57F11D0;
    id v10 = v7;
    id v19 = v10;
    id v20 = &v21;
    [v9 enumerateKeysAndObjectsUsingBlock:&v15];

    uint64_t v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = v22[5];
      uint64_t v13 = objc_msgSend(v10, "request", v15, v16, v17, v18);
      double v14 = [v13 URL];
      *(_DWORD *)buf = 138543874;
      uint64_t v28 = v12;
      __int16 v29 = 2048;
      id v30 = v10;
      __int16 v31 = 2114;
      objc_super v32 = v14;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_DEFAULT, "MPAbstractNetworkArtworkDataSource: -resourceLoader:didCancelLoadingRequest: canceled data task: %{public}@. loadingRequest=%p URL=%{public}@", buf, 0x20u);
    }
    [(id)v22[5] cancel];

    _Block_object_dispose(&v21, 8);
  }
}

void __77__MPAbstractNetworkArtworkDataSource_resourceLoader_didCancelLoadingRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (*(void *)(a1 + 32) == a3)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v8 = v9;
    *a4 = 1;
  }
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPAbstractNetworkArtworkDataSource *)self videoAccessQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    id v9 = [v7 request];
    id v10 = (void *)[v9 mutableCopy];

    [v10 setValue:0 forHTTPHeaderField:@"Range"];
    [v10 setCachePolicy:2];
    uint64_t v11 = [(MPAbstractNetworkArtworkDataSource *)self videoURLSession];
    uint64_t v12 = (void *)[v10 copy];
    uint64_t v13 = [v11 dataTaskWithRequest:v12];

    double v14 = [(MPAbstractNetworkArtworkDataSource *)self videoTaskToResourceLoadingRequest];
    [v14 setObject:v7 forKey:v13];

    uint64_t v15 = [(MPAbstractNetworkArtworkDataSource *)self resourceLoaderStoragePolicyMap];
    uint64_t v16 = [v15 objectForKey:v6];

    uint64_t v17 = [(MPAbstractNetworkArtworkDataSource *)self videoTaskToCacheStoragePolicy];
    [v17 setObject:v16 forKey:v13];

    id v18 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = [v7 request];
      id v20 = [v19 URL];
      int v22 = 138543874;
      uint64_t v23 = v13;
      __int16 v24 = 2048;
      id v25 = v7;
      __int16 v26 = 2114;
      uint64_t v27 = v20;
      _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -resourceLoader:shouldWaitForLoadingOfRequestedResource: starting data task: %{public}@. loadingRequest=%p URL=%{public}@", (uint8_t *)&v22, 0x20u);
    }
    [v13 resume];
  }
  return 1;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v10 = [(MPAbstractNetworkArtworkDataSource *)self videoAccessQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__MPAbstractNetworkArtworkDataSource_URLSession_task_didCompleteWithError___block_invoke;
    v11[3] = &unk_1E57F62E8;
    id v12 = v8;
    id v13 = v9;
    double v14 = self;
    id v15 = v13;
    [(MPAbstractNetworkArtworkDataSource *)self _performSyncBlockOnQueue:v10 block:v11];
  }
}

void __75__MPAbstractNetworkArtworkDataSource_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = *(void **)(a1 + 32);
      id v4 = *(void **)(a1 + 40);
      int v17 = 138543618;
      id v18 = v3;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_1952E8000, v2, OS_LOG_TYPE_ERROR, "MPAbstractNetworkArtworkDataSource: -URLSession:task:didCompleteWithError: task finished with error: %{public}@ dataTask=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    id v5 = [*(id *)(a1 + 48) videoTaskToResourceLoadingRequest];
    id v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 56)];

    [v6 finishLoadingWithError:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = [*(id *)(a1 + 48) videoTaskToResourceLoadingRequest];
    id v6 = [v7 objectForKey:*(void *)(a1 + 56)];

    id v8 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    id v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        id v10 = [v6 request];
        uint64_t v11 = [v10 URL];
        uint64_t v12 = *(void *)(a1 + 56);
        int v17 = 134218498;
        id v18 = v6;
        __int16 v19 = 2114;
        id v20 = v11;
        __int16 v21 = 2114;
        uint64_t v22 = v12;
        _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -URLSession:task:didCompleteWithError: finished loading request: %p. URL=%{public}@ dataTask=%{public}@", (uint8_t *)&v17, 0x20u);
      }
      [v6 finishLoading];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        id v13 = *(void **)(a1 + 56);
        int v17 = 138543362;
        id v18 = v13;
        _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_FAULT, "MPAbstractNetworkArtworkDataSource: -URLSession:task:didCompleteWithError: ignoring data [no loading request associated with data task] task=%{public}@", (uint8_t *)&v17, 0xCu);
      }

      id v6 = 0;
    }
  }

  double v14 = [*(id *)(a1 + 48) videoTaskToResourceLoadingRequest];
  [v14 removeObjectForKey:*(void *)(a1 + 56)];

  id v15 = [*(id *)(a1 + 48) videoTaskToData];
  [v15 removeObjectForKey:*(void *)(a1 + 56)];

  uint64_t v16 = [*(id *)(a1 + 48) videoTaskToCacheStoragePolicy];
  [v16 removeObjectForKey:*(void *)(a1 + 56)];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(MPAbstractNetworkArtworkDataSource *)self videoAccessQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke;
  v16[3] = &unk_1E57F4E70;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [(MPAbstractNetworkArtworkDataSource *)self _performSyncBlockOnQueue:v12 block:v16];
}

void __94__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_willCacheResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) videoTaskToCacheStoragePolicy];
  id v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 unsignedIntegerValue];

  if (v4 == [*(id *)(a1 + 48) storagePolicy])
  {
    id v5 = *(id *)(a1 + 48);
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28B70]);
    id v7 = [*(id *)(a1 + 48) response];
    id v8 = [*(id *)(a1 + 48) data];
    id v9 = [*(id *)(a1 + 48) userInfo];
    id v5 = (id)[v6 initWithResponse:v7 data:v8 userInfo:v9 storagePolicy:v4];

    id v10 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [*(id *)(a1 + 48) storagePolicy];
      uint64_t v12 = [v5 storagePolicy];
      id v13 = *(void **)(a1 + 40);
      id v14 = [*(id *)(a1 + 48) response];
      id v15 = [v14 URL];
      int v21 = 134218754;
      uint64_t v22 = v11;
      __int16 v23 = 2048;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      __int16 v26 = v13;
      __int16 v27 = 2114;
      uint64_t v28 = v15;
      _os_log_impl(&dword_1952E8000, v10, OS_LOG_TYPE_INFO, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:willCacheResponse:completionHandler: Updating storage policy from %lu to %lu for dataTask: %{public}@. URL=%{public}@.", (uint8_t *)&v21, 0x2Au);
    }
  }
  uint64_t v16 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = [v5 storagePolicy];
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = [v5 response];
    id v20 = [v19 URL];
    int v21 = 134218498;
    uint64_t v22 = v17;
    __int16 v23 = 2114;
    uint64_t v24 = v18;
    __int16 v25 = 2114;
    __int16 v26 = v20;
    _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:willCacheResponse:completionHandler: Decided on storage policy %lu for dataTask=%{public}@. responseURL=%{public}@", (uint8_t *)&v21, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(MPAbstractNetworkArtworkDataSource *)self videoAccessQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_didReceiveData___block_invoke;
  v12[3] = &unk_1E57FA038;
  id v13 = v8;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v8;
  [(MPAbstractNetworkArtworkDataSource *)self _performSyncBlockOnQueue:v9 block:v12];
}

void __73__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) videoTaskToData];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];

  if (v4)
  {
    id v5 = [v2 _createDispatchData];
    id v6 = [v4 _createDispatchData];
    dispatch_data_t concat = dispatch_data_create_concat(v6, v5);
  }
  else
  {
    dispatch_data_t concat = (dispatch_data_t)*(id *)(a1 + 32);
  }
  id v8 = [*(id *)(a1 + 40) videoTaskToData];
  [v8 setObject:concat forKeyedSubscript:*(void *)(a1 + 48)];

  id v9 = [*(id *)(a1 + 40) videoTaskToResourceLoadingRequest];
  id v10 = [v9 objectForKey:*(void *)(a1 + 48)];

  if (v10)
  {
    id v11 = [v10 dataRequest];
    if (([v11 requestsAllDataToEndOfResource] & 1) != 0
      || (unint64_t v12 = [concat length],
          uint64_t v13 = [v11 requestedOffset],
          v12 < [v11 requestedLength] + v13))
    {
      id v14 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v15 = *(void *)(a1 + 48);
        int v28 = 134219266;
        uint64_t v29 = v11;
        __int16 v30 = 2114;
        uint64_t v31 = v15;
        __int16 v32 = 2048;
        uint64_t v33 = [v11 currentOffset];
        __int16 v34 = 2048;
        uint64_t v35 = [v11 requestedLength];
        __int16 v36 = 2048;
        uint64_t v37 = [v11 requestedOffset];
        __int16 v38 = 2048;
        uint64_t v39 = [concat length];
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveData: creating data task using accumulatedData.length. %p dataTask=%{public}@ currentOffset=%lld, requestedLength=%ld requestedOffset=%lld accumulatedData.length=%lu", (uint8_t *)&v28, 0x3Eu);
      }

      uint64_t v16 = [concat length];
    }
    else
    {
      uint64_t v18 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = *(void *)(a1 + 48);
        int v28 = 134219266;
        uint64_t v29 = v11;
        __int16 v30 = 2114;
        uint64_t v31 = v19;
        __int16 v32 = 2048;
        uint64_t v33 = [v11 currentOffset];
        __int16 v34 = 2048;
        uint64_t v35 = [v11 requestedLength];
        __int16 v36 = 2048;
        uint64_t v37 = [v11 requestedOffset];
        __int16 v38 = 2048;
        uint64_t v39 = [v11 requestedLength];
        _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveData: creating data task using dataRequest.requestedLength. %p dataTask=%{public}@ currentOffset=%lld, requestedLength=%ld requestedOffset=%lld dataRequest.requestedLength=%lu", (uint8_t *)&v28, 0x3Eu);
      }

      uint64_t v16 = [v11 requestedLength];
    }
    uint64_t v20 = v16;
    if (v16 >= [v11 currentOffset])
    {
      uint64_t v26 = [concat bytes];
      uint64_t v27 = v26 + [v11 currentOffset];
      int v21 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v27, v20 - -[NSObject currentOffset](v11, "currentOffset"));
      [v11 respondWithData:v21];
    }
    else
    {
      int v21 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = *(NSObject **)(a1 + 48);
        uint64_t v23 = [v11 currentOffset];
        uint64_t v24 = [v11 requestedLength];
        uint64_t v25 = [v11 requestedOffset];
        int v28 = 138544130;
        uint64_t v29 = v22;
        __int16 v30 = 2048;
        uint64_t v31 = v23;
        __int16 v32 = 2048;
        uint64_t v33 = v24;
        __int16 v34 = 2048;
        uint64_t v35 = v25;
        _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_INFO, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveData: not responding with data [currentOffset was greater than length] task=%{public}@ currentOffset=%lld, requestedLength=%ld requestedOffset=%lld", (uint8_t *)&v28, 0x2Au);
      }
    }
  }
  else
  {
    id v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = *(NSObject **)(a1 + 48);
      int v28 = 138543362;
      uint64_t v29 = v17;
      _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_FAULT, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveData: ignoring data [no loading request associated with data task] task=%{public}@", (uint8_t *)&v28, 0xCu);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  unint64_t v12 = [(MPAbstractNetworkArtworkDataSource *)self videoAccessQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __95__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v16[3] = &unk_1E57F4E70;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v20 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  [(MPAbstractNetworkArtworkDataSource *)self _performSyncBlockOnQueue:v12 block:v16];
}

void __95__MPAbstractNetworkArtworkDataSource_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) countOfBytesExpectedToReceive];
  id v3 = [*(id *)(a1 + 40) videoURLCache];
  uint64_t v4 = [v3 diskCapacity];
  uint64_t v5 = v4 - [v3 currentDiskUsage];
  uint64_t v6 = [v3 memoryCapacity];
  uint64_t v7 = v6 - [v3 currentMemoryUsage];
  id v8 = [*(id *)(a1 + 40) videoTaskToCacheStoragePolicy];
  id v9 = [v8 objectForKey:*(void *)(a1 + 32)];
  uint64_t v10 = [v9 unsignedIntegerValue];

  if (!*(void *)(a1 + 32)) {
    goto LABEL_13;
  }
  if (v10 != 2)
  {
    if (v10 == 1)
    {
      if ([v3 memoryCapacity] < v2)
      {
        id v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          id v13 = [*(id *)(a1 + 48) URL];
          int v25 = 138544130;
          uint64_t v26 = v15;
          __int16 v27 = 2114;
          int v28 = v13;
          __int16 v29 = 2048;
          unint64_t v30 = v2;
          __int16 v31 = 2048;
          uint64_t v32 = [v3 memoryCapacity];
          id v14 = "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveResponse:completionHandler: canceled "
                "data task [expectedEntrySize > memoryCapacity] dataTask=%{public}@ URL=%{public}@ expectedEntrySize=%lld"
                " memoryCapacity=%lu";
          goto LABEL_11;
        }
LABEL_12:

        goto LABEL_13;
      }
      if (v7 < (uint64_t)v2)
      {
        id v17 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          id v19 = [*(id *)(a1 + 48) URL];
          int v25 = 138544130;
          uint64_t v26 = v18;
          __int16 v27 = 2114;
          int v28 = v19;
          __int16 v29 = 2048;
          unint64_t v30 = v2;
          __int16 v31 = 2048;
          uint64_t v32 = v7;
          id v20 = "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveResponse:completionHandler: expecting"
                " eviction in memory cache [expectedEntrySize > memoryCacheAvailableSize] dataTask=%{public}@ URL=%{publi"
                "c}@ expectedEntrySize=%lld memoryCacheAvailableSize=%lld";
LABEL_20:
          _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v25, 0x2Au);
        }
LABEL_21:
      }
    }
    else
    {
      if (v10)
      {
LABEL_13:
        uint64_t v16 = 0;
        goto LABEL_23;
      }
      if ([v3 diskCapacity] < v2)
      {
        id v11 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          id v13 = [*(id *)(a1 + 48) URL];
          int v25 = 138544130;
          uint64_t v26 = v12;
          __int16 v27 = 2114;
          int v28 = v13;
          __int16 v29 = 2048;
          unint64_t v30 = v2;
          __int16 v31 = 2048;
          uint64_t v32 = [v3 diskCapacity];
          id v14 = "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveResponse:completionHandler: canceled "
                "data task [expectedEntrySize > diskCapacity] dataTask=%{public}@ URL=%{public}@ expectedEntrySize=%lld diskCapacity=%lu";
LABEL_11:
          _os_log_impl(&dword_1952E8000, v11, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v25, 0x2Au);

          goto LABEL_12;
        }
        goto LABEL_12;
      }
      if (v5 < (uint64_t)v2)
      {
        id v17 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(a1 + 32);
          id v19 = [*(id *)(a1 + 48) URL];
          int v25 = 138544130;
          uint64_t v26 = v21;
          __int16 v27 = 2114;
          int v28 = v19;
          __int16 v29 = 2048;
          unint64_t v30 = v2;
          __int16 v31 = 2048;
          uint64_t v32 = v5;
          id v20 = "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveResponse:completionHandler: expecting"
                " eviction in disk cache - cache will be purged [expectedEntrySize > diskCacheAvailableSize] dataTask=%{p"
                "ublic}@ URL=%{public}@ expectedEntrySize=%lld diskCacheAvailableSize=%lld";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
  }
  uint64_t v16 = 1;
LABEL_23:
  uint64_t v22 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = *(void **)(a1 + 32);
    uint64_t v24 = [*(id *)(a1 + 48) URL];
    int v25 = 134219522;
    uint64_t v26 = v16;
    __int16 v27 = 2114;
    int v28 = v23;
    __int16 v29 = 2114;
    unint64_t v30 = (unint64_t)v24;
    __int16 v31 = 2048;
    uint64_t v32 = v10;
    __int16 v33 = 2048;
    unint64_t v34 = v2;
    __int16 v35 = 2048;
    uint64_t v36 = v5;
    __int16 v37 = 2048;
    uint64_t v38 = v7;
    _os_log_impl(&dword_1952E8000, v22, OS_LOG_TYPE_DEBUG, "MPAbstractNetworkArtworkDataSource: -URLSession:dataTask:didReceiveResponse:completionHandler: Decided on disposition %ld for dataTask: %{public}@. URL=%{public}@.storagePolicy=%lu expectedEntrySize=%lld diskCacheAvailableSize=%lld memoryCacheAvailableSize=%lld", (uint8_t *)&v25, 0x48u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setLoadingKey:*(void *)(a1 + 40)];
  unint64_t v2 = [*(id *)(*(void *)(a1 + 48) + 64) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      uint64_t v5 = [*(id *)(a1 + 32) UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v4;
      __int16 v39 = 2114;
      uint64_t v40 = v5;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Found cached loading context for key: %{public}@", buf, 0x16u);
    }
    uint64_t v6 = [(_MPAbstractNetworkArtworkLoadingContext *)v2 catalogIdentifierToCompletionHandlerMap];
    uint64_t v7 = (void *)MEMORY[0x19971E0F0](*(void *)(a1 + 72));
    id v8 = [*(id *)(a1 + 32) UUID];
    [v6 setObject:v7 forKey:v8];
  }
  else
  {
    id v9 = objc_alloc_init(_MPAbstractNetworkArtworkLoadingContext);
    uint64_t v10 = [(_MPAbstractNetworkArtworkLoadingContext *)v9 catalogIdentifierToCompletionHandlerMap];
    id v11 = (void *)MEMORY[0x19971E0F0](*(void *)(a1 + 72));
    uint64_t v12 = [*(id *)(a1 + 32) UUID];
    [v10 setObject:v11 forKey:v12];

    id v13 = [*(id *)(a1 + 48) imageURLSession];
    id v14 = [v13 configuration];
    uint64_t v6 = [v14 URLCache];

    objc_msgSend(v6, "setRepresentationSize:forRequest:", *(void *)(a1 + 56), *(double *)(a1 + 80), *(double *)(a1 + 88));
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v15 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      id v17 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v16;
      __int16 v39 = 2114;
      uint64_t v40 = v17;
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Creating data task for request: %{public}@", buf, 0x16u);
    }

    uint64_t v18 = [*(id *)(a1 + 48) imageURLSession];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    uint64_t v26 = __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_162;
    __int16 v27 = &unk_1E57F1180;
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v28 = *(void *)(a1 + 48);
    id v29 = *(id *)(a1 + 32);
    long long v34 = *(_OWORD *)(a1 + 80);
    char v35 = *(unsigned char *)(a1 + 96);
    objc_copyWeak(&v33, &location);
    id v30 = *(id *)(a1 + 64);
    unint64_t v2 = v9;
    __int16 v31 = v2;
    id v32 = *(id *)(a1 + 40);
    id v20 = objc_msgSend(v18, "msv_dataTaskWithRequest:completionHandler:", v19, &v24);

    -[_MPAbstractNetworkArtworkLoadingContext setDataTask:](v2, "setDataTask:", v20, v24, v25, v26, v27, v28);
    [*(id *)(*(void *)(a1 + 48) + 64) setObject:v2 forKey:*(void *)(a1 + 40)];
    uint64_t v21 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 48);
      uint64_t v23 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      uint64_t v38 = v22;
      __int16 v39 = 2114;
      uint64_t v40 = v23;
      _os_log_impl(&dword_1952E8000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Created data task for request: %{public}@", buf, 0x16u);
    }

    [v20 resume];
    objc_destroyWeak(&v33);

    objc_destroyWeak(&location);
  }
}

void __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_162(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_msgSend(*(id *)(a1 + 32), "_artworkRepresentationWithImageFromData:forURLResponse:catalog:size:immediateImageDecompressionAllowed:", v10, v11, *(void *)(a1 + 40), 1, *(double *)(a1 + 80), *(double *)(a1 + 88));
  id v14 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v63 = v15;
    __int16 v64 = 2114;
    id v65 = v13;
    __int16 v66 = 2114;
    id v67 = v9;
    _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Loaded image representation: %{public}@ with URLSessionDataTask: %{public}@", buf, 0x20u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v11)
    {
      id v48 = v10;
      id v49 = v9;
      id v17 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v63 = v18;
        __int16 v64 = 2114;
        id v65 = v11;
        _os_log_impl(&dword_1952E8000, v17, OS_LOG_TYPE_ERROR, "%{public}@ encountered unexpected NSURLResponse: %{public}@", buf, 0x16u);
      }

      uint64_t v19 = (void *)MEMORY[0x1E4F77950];
      uint64_t v20 = *MEMORY[0x1E4F778C8];
      v59[0] = @"response";
      uint64_t v21 = [v11 description];
      uint64_t v22 = (void *)v21;
      if (v21) {
        uint64_t v23 = (__CFString *)v21;
      }
      else {
        uint64_t v23 = @"nil";
      }
      v59[1] = @"responseClass";
      v60[0] = v23;
      uint64_t v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      uint64_t v26 = (void *)v25;
      if (v25) {
        __int16 v27 = (__CFString *)v25;
      }
      else {
        __int16 v27 = @"nil";
      }
      v60[1] = v27;
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
      v61 = v28;
      id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
      [v19 snapshotWithDomain:v20 type:@"Bug" subType:@"MPAbstractNetworkArtworkDataSource" context:@"UnexpectedURLResponse" triggerThresholdValues:&stru_1EE680640 events:v29 completion:0];

      uint64_t v16 = 0;
      id v10 = v48;
      id v9 = v49;
    }
    else
    {
      uint64_t v16 = 0;
    }
LABEL_17:
    if ([v10 length]) {
      goto LABEL_27;
    }
    goto LABEL_18;
  }
  uint64_t v16 = [v11 statusCode];
  if (v16 <= 399) {
    goto LABEL_17;
  }
LABEL_18:
  if (!v12)
  {
    id v30 = v10;
    __int16 v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F289A0];
    v57 = @"response";
    id v33 = v11;
    if (!v11)
    {
      id v33 = [MEMORY[0x1E4F1CA98] null];
    }
    uint64_t v58 = v33;
    long long v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    id v12 = [v31 errorWithDomain:v32 code:v16 userInfo:v34];

    if (!v11) {
    id v10 = v30;
    }
  }
  char v35 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    uint64_t v36 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v63 = v36;
    __int16 v64 = 2114;
    id v65 = v9;
    __int16 v66 = 2114;
    id v67 = v12;
    _os_log_impl(&dword_1952E8000, v35, OS_LOG_TYPE_ERROR, "%{public}@ Encountered error while requesting artwork for NSURLSessionDataTask: %{public}@. %{public}@", buf, 0x20u);
  }

LABEL_27:
  if (*(unsigned char *)(a1 + 96))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    uint64_t v38 = objc_msgSend(*(id *)(a1 + 32), "_cacheKeyForCatalog:kind:size:", WeakRetained, objc_msgSend(v13, "kind"), *(double *)(a1 + 80), *(double *)(a1 + 88));
    if (v38)
    {
      id v39 = v10;
      uint64_t v40 = *(void **)(a1 + 48);
      if (v13)
      {
        [*(id *)(a1 + 48) setObject:v13 forKey:v38];
      }
      else
      {
        uint64_t v41 = [MEMORY[0x1E4F1CA98] null];
        [v40 setObject:v41 forKey:v38];
      }
      id v10 = v39;
    }
  }
  v42 = *(void **)(a1 + 32);
  uint64_t v43 = v42[4];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_188;
  v50[3] = &unk_1E57F1158;
  id v44 = *(id *)(a1 + 56);
  uint64_t v45 = *(void *)(a1 + 32);
  id v51 = v44;
  uint64_t v52 = v45;
  id v53 = *(id *)(a1 + 64);
  id v54 = *(id *)(a1 + 40);
  id v55 = v13;
  id v56 = v12;
  id v46 = v12;
  id v47 = v13;
  [v42 _performAsyncBarrierBlockOnQueue:v43 block:v50];
}

void __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_188(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 64) objectForKey:*(void *)(a1 + 48)];

  if (v2 == v3) {
    [*(id *)(*(void *)(a1 + 40) + 64) removeObjectForKey:*(void *)(a1 + 48)];
  }
  uint64_t v4 = [*(id *)(a1 + 32) catalogIdentifierToCompletionHandlerMap];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [*(id *)(a1 + 56) UUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v7;
      __int16 v22 = 2114;
      uint64_t v23 = v8;
      _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Completion handler for catalog id %{public}@ found in map", buf, 0x16u);
    }
    id v9 = [*(id *)(a1 + 32) catalogIdentifierToCompletionHandlerMap];
    id v10 = [v9 allValues];

    id v11 = [*(id *)(a1 + 32) catalogIdentifierToCompletionHandlerMap];
    [v11 removeAllObjects];

    id v12 = [*(id *)(a1 + 40) callbackQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_189;
    v15[3] = &unk_1E57F62E8;
    uint64_t v13 = *(void *)(a1 + 40);
    id v16 = v10;
    uint64_t v17 = v13;
    id v18 = *(id *)(a1 + 64);
    id v19 = *(id *)(a1 + 72);
    id v14 = v10;
    dispatch_async(v12, v15);
  }
}

void __99__MPAbstractNetworkArtworkDataSource_loadRepresentationOfKind_forArtworkCatalog_completionHandler___block_invoke_189(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v8 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = *(void *)(a1 + 40);
          uint64_t v10 = *(void *)(a1 + 48);
          uint64_t v11 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          uint64_t v17 = v9;
          __int16 v18 = 2114;
          uint64_t v19 = v10;
          __int16 v20 = 2114;
          uint64_t v21 = v11;
          _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Calling completion with loaded representation: %{public}@ and error: %{public}@", buf, 0x20u);
        }

        (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, *(void *)(a1 + 48), *(void *)(a1 + 56));
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v22 count:16];
    }
    while (v4);
  }
}

- (void)loadArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5 systemEffectHandler:(id)a6 completionHandler:(id)a7
{
  id v11 = a7;
  long long v12 = MPArtworkCatalogOriginalSize;
  long long v13 = a6;
  long long v14 = [(MPAbstractNetworkArtworkDataSource *)self _requestForCatalog:a4 kind:0 size:v12];
  long long v15 = [v14 URL];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __129__MPAbstractNetworkArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke;
  v19[3] = &unk_1E57F1108;
  id v21 = v11;
  int64_t v22 = a3;
  id v20 = v15;
  id v16 = (void (*)(void *, void *))v13[2];
  id v17 = v11;
  id v18 = v15;
  v16(v13, v19);
}

void __129__MPAbstractNetworkArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v107[0] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 48) == 3)
  {
    uint64_t v7 = (UIImage *)v5;
    id v8 = v7;
    if (!v7)
    {
LABEL_61:

      goto LABEL_62;
    }
    v81 = v7;
    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    v79 = [v9 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:0];
    uint64_t v82 = [v79 URLByAppendingPathComponent:@"Radiosity" isDirectory:1];
    uint64_t v10 = [*(id *)(a1 + 32) absoluteString];
    unint64_t v11 = *MEMORY[0x1E4F778E8];
    long long v100 = 0u;
    long long v99 = 0u;
    long long v98 = 0u;
    long long v97 = 0u;
    long long v96 = 0u;
    long long v95 = 0u;
    long long v94 = 0u;
    long long v93 = 0u;
    v87[0] = xmmword_195689830;
    v87[1] = vaddq_s64(vdupq_n_s64(v11), (int64x2_t)xmmword_195689840);
    unint64_t v88 = v11;
    unint64_t v89 = v11 + 0x61C8864E7A143579;
    long long v90 = 0u;
    long long v91 = 0u;
    uint64_t v92 = 0;
    id v12 = v10;
    _MSV_XXH_XXH64_update_12031((char *)v87 + 8, (char *)[v12 UTF8String], objc_msgSend(v12, "length"));
    memset(&v103[8], 0, 64);
    *(void *)v103 = 3001;
    *(void *)&v103[8] = _MSV_XXH_XXH64_digest((void *)v87 + 1);
    v104[0] = *(_OWORD *)v103;
    v104[1] = *(_OWORD *)&v103[16];
    v104[2] = *(_OWORD *)&v103[32];
    v104[3] = *(_OWORD *)&v103[48];
    uint64_t v105 = *(void *)&v103[64];
    uint64_t v80 = a1;
    if (*(uint64_t *)v103 > 3999)
    {
      id v8 = v81;
      long long v13 = (void *)v82;
      if (*(uint64_t *)v103 > 4255)
      {
        if (*(void *)v103 == 4256)
        {
          id v55 = (unsigned __int8 *)v104 + 8;
          id v56 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
          v57 = v56;
          for (uint64_t i = 0; i != 64; i += 2)
          {
            unsigned int v59 = *v55++;
            v60 = &v56[i];
            char *v60 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v59 >> 4];
            v60[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v59 & 0xF];
          }
          id v26 = [NSString alloc];
          __int16 v27 = v57;
          uint64_t v28 = 64;
        }
        else
        {
          if (*(void *)v103 != 4512) {
            goto LABEL_65;
          }
          id v33 = (unsigned __int8 *)v104 + 8;
          long long v34 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
          char v35 = v34;
          for (uint64_t j = 0; j != 128; j += 2)
          {
            unsigned int v37 = *v33++;
            uint64_t v38 = &v34[j];
            char *v38 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v37 >> 4];
            v38[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v37 & 0xF];
          }
          id v26 = [NSString alloc];
          __int16 v27 = v35;
          uint64_t v28 = 128;
        }
      }
      else if (*(void *)v103 == 4000)
      {
        uint64_t v45 = (unsigned __int8 *)v104 + 8;
        id v46 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
        id v47 = v46;
        for (uint64_t k = 0; k != 32; k += 2)
        {
          unsigned int v49 = *v45++;
          id v50 = &v46[k];
          *id v50 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v49 >> 4];
          v50[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v49 & 0xF];
        }
        id v26 = [NSString alloc];
        __int16 v27 = v47;
        uint64_t v28 = 32;
      }
      else
      {
        if (*(void *)v103 != 4001) {
          goto LABEL_65;
        }
        id v20 = (unsigned __int8 *)v104 + 8;
        id v21 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
        int64_t v22 = v21;
        for (uint64_t m = 0; m != 40; m += 2)
        {
          unsigned int v24 = *v20++;
          uint64_t v25 = &v21[m];
          *uint64_t v25 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v24 >> 4];
          v25[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v24 & 0xF];
        }
        id v26 = [NSString alloc];
        __int16 v27 = v22;
        uint64_t v28 = 40;
      }
    }
    else
    {
      id v8 = v81;
      long long v13 = (void *)v82;
      if (*(uint64_t *)v103 <= 2999)
      {
        if (*(void *)v103 == 1000)
        {
          uint64_t v39 = *((void *)&v104[0] + 1);
          uint64_t v40 = (char *)v107 + 1;
          uint64_t quot = *((void *)&v104[0] + 1);
          do
          {
            lldiv_t v42 = lldiv(quot, 10);
            uint64_t quot = v42.quot;
            if (v42.rem >= 0) {
              LOBYTE(v43) = v42.rem;
            }
            else {
              uint64_t v43 = -v42.rem;
            }
            *(v40 - 2) = v43 + 48;
            uint64_t v19 = (const UInt8 *)(v40 - 2);
            --v40;
          }
          while (v42.quot);
          if (v39 < 0)
          {
            *(v40 - 2) = 45;
            uint64_t v19 = (const UInt8 *)(v40 - 2);
          }
          id v18 = (char *)((char *)v107 - (char *)v19);
          goto LABEL_37;
        }
        if (*(void *)v103 == 2000)
        {
          uint64_t v14 = DWORD2(v104[0]);
          long long v15 = v107;
          do
          {
            ldiv_t v16 = ldiv(v14, 10);
            uint64_t v14 = v16.quot;
            if (v16.rem >= 0) {
              LOBYTE(v17) = v16.rem;
            }
            else {
              uint64_t v17 = -v16.rem;
            }
            *((unsigned char *)v15 - 1) = v17 + 48;
            long long v15 = (void *)((char *)v15 - 1);
          }
          while (v16.quot);
          id v18 = (char *)((char *)v107 - (char *)v15);
          uint64_t v19 = (const UInt8 *)v15;
LABEL_37:
          CFStringRef v44 = CFStringCreateWithBytes(0, v19, (CFIndex)v18, 0x8000100u, 0);
LABEL_48:
          v61 = (__CFString *)v44;
LABEL_49:

          __int16 v62 = [v13 URLByAppendingPathComponent:v61 isDirectory:0];
          uint64_t v63 = [v62 path];
          char v64 = [v9 fileExistsAtPath:v63];

          if ((v64 & 1) == 0)
          {
            id v78 = v6;
            [v9 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:0];
            id v65 = UIImagePNGRepresentation(v8);
            [v65 writeToURL:v62 atomically:1];
            uint64_t v102 = *MEMORY[0x1E4F1C540];
            __int16 v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
            id v67 = [v9 contentsOfDirectoryAtURL:v13 includingPropertiesForKeys:v66 options:1 error:0];

            if ((unint64_t)[v67 count] >= 0x33)
            {
              id v77 = v5;
              uint64_t v68 = [v67 sortedArrayUsingComparator:&__block_literal_global_20275];
              v69 = objc_msgSend(v68, "subarrayWithRange:", 0, objc_msgSend(v68, "count") - 50);
              long long v83 = 0u;
              long long v84 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              uint64_t v70 = [v69 countByEnumeratingWithState:&v83 objects:v101 count:16];
              if (v70)
              {
                uint64_t v71 = v70;
                uint64_t v72 = *(void *)v84;
                do
                {
                  for (uint64_t n = 0; n != v71; ++n)
                  {
                    if (*(void *)v84 != v72) {
                      objc_enumerationMutation(v69);
                    }
                    [v9 removeItemAtURL:*(void *)(*((void *)&v83 + 1) + 8 * n) error:0];
                  }
                  uint64_t v71 = [v69 countByEnumeratingWithState:&v83 objects:v101 count:16];
                }
                while (v71);
              }

              id v5 = v77;
              id v8 = v81;
            }

            id v6 = v78;
            long long v13 = (void *)v82;
          }

          a1 = v80;
          goto LABEL_61;
        }
LABEL_65:
        v75 = [MEMORY[0x1E4F28B00] currentHandler];
        v76 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
        [v75 handleFailureInFunction:v76 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

        v61 = &stru_1EE680640;
        goto LABEL_49;
      }
      if (*(void *)v103 == 3000)
      {
        LODWORD(v106[0]) = bswap32(DWORD2(v104[0]));
        id v51 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v52 = 0;
        id v53 = v51 + 1;
        do
        {
          unint64_t v54 = *((unsigned __int8 *)v106 + v52);
          *(v53 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v54 >> 4];
          *id v53 = MSVFastHexStringFromBytes_hexCharacters_53728[v54 & 0xF];
          v53 += 2;
          ++v52;
        }
        while (v52 != 4);
        id v26 = [NSString alloc];
        __int16 v27 = v51;
        uint64_t v28 = 8;
      }
      else
      {
        if (*(void *)v103 != 3001) {
          goto LABEL_65;
        }
        v106[0] = bswap64(*((unint64_t *)&v104[0] + 1));
        id v29 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v30 = 0;
        __int16 v31 = v29 + 1;
        do
        {
          unint64_t v32 = *((unsigned __int8 *)v106 + v30);
          *(v31 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v32 >> 4];
          unsigned char *v31 = MSVFastHexStringFromBytes_hexCharacters_53728[v32 & 0xF];
          v31 += 2;
          ++v30;
        }
        while (v30 != 8);
        id v26 = [NSString alloc];
        __int16 v27 = v29;
        uint64_t v28 = 16;
      }
    }
    CFStringRef v44 = (CFStringRef)[v26 initWithBytesNoCopy:v27 length:v28 encoding:4 freeWhenDone:1];
    goto LABEL_48;
  }
LABEL_62:
  uint64_t v74 = *(void *)(a1 + 40);
  if (v74) {
    (*(void (**)(uint64_t, id, id))(v74 + 16))(v74, v5, v6);
  }
}

uint64_t __129__MPAbstractNetworkArtworkDataSource_loadArtworkEffectResultForEffectType_catalog_options_systemEffectHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = 0;
  uint64_t v4 = *MEMORY[0x1E4F1C540];
  id v5 = a3;
  [a2 getResourceValue:&v10 forKey:v4 error:0];
  uint64_t v9 = 0;
  id v6 = v10;
  [v5 getResourceValue:&v9 forKey:v4 error:0];

  uint64_t v7 = [v6 compare:v9];
  return v7;
}

- (id)existingArtworkEffectResultForEffectType:(int64_t)a3 catalog:(id)a4 options:(id)a5
{
  v91[0] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(MPAbstractNetworkArtworkDataSource *)self _requestForCatalog:v8 kind:0 size:MPArtworkCatalogOriginalSize];
  unint64_t v11 = [v10 URL];

  id v12 = 0;
  if (a3 == 3)
  {
    long long v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v14 = [v13 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:0];

    long long v15 = [v14 URLByAppendingPathComponent:@"Radiosity" isDirectory:1];
    ldiv_t v16 = [v11 absoluteString];
    unint64_t v17 = *MEMORY[0x1E4F778E8];
    id v18 = v16;
    long long v86 = 0u;
    long long v85 = 0u;
    long long v84 = 0u;
    long long v83 = 0u;
    long long v82 = 0u;
    long long v81 = 0u;
    long long v80 = 0u;
    long long v79 = 0u;
    *((void *)&v73[0] + 1) = 0;
    v73[1] = vaddq_s64(vdupq_n_s64(v17), (int64x2_t)xmmword_195689840);
    unint64_t v74 = v17;
    unint64_t v75 = v17 + 0x61C8864E7A143579;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v78 = 0;
    id v19 = v18;
    _MSV_XXH_XXH64_update_12031((char *)v73 + 8, (char *)[v19 UTF8String], objc_msgSend(v19, "length"));
    memset(&v87[8], 0, 64);
    *(void *)v87 = 3001;
    *(void *)&v87[8] = _MSV_XXH_XXH64_digest((void *)v73 + 1);
    v88[0] = *(_OWORD *)v87;
    v88[1] = *(_OWORD *)&v87[16];
    v88[2] = *(_OWORD *)&v87[32];
    v88[3] = *(_OWORD *)&v87[48];
    uint64_t v89 = *(void *)&v87[64];
    if (*(uint64_t *)v87 > 3999)
    {
      if (*(uint64_t *)v87 > 4255)
      {
        if (*(void *)v87 == 4256)
        {
          v61 = (unsigned __int8 *)v88 + 8;
          __int16 v62 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
          uint64_t v63 = v62;
          for (uint64_t i = 0; i != 64; i += 2)
          {
            unsigned int v65 = *v61++;
            __int16 v66 = &v62[i];
            *__int16 v66 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v65 >> 4];
            v66[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v65 & 0xF];
          }
          id v32 = [NSString alloc];
          id v33 = v63;
          uint64_t v34 = 64;
        }
        else
        {
          if (*(void *)v87 != 4512) {
            goto LABEL_55;
          }
          uint64_t v39 = (unsigned __int8 *)v88 + 8;
          uint64_t v40 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
          uint64_t v41 = v40;
          for (uint64_t j = 0; j != 128; j += 2)
          {
            unsigned int v43 = *v39++;
            CFStringRef v44 = &v40[j];
            char *v44 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v43 >> 4];
            v44[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v43 & 0xF];
          }
          id v32 = [NSString alloc];
          id v33 = v41;
          uint64_t v34 = 128;
        }
      }
      else if (*(void *)v87 == 4000)
      {
        id v51 = (unsigned __int8 *)v88 + 8;
        uint64_t v52 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
        id v53 = v52;
        for (uint64_t k = 0; k != 32; k += 2)
        {
          unsigned int v55 = *v51++;
          id v56 = &v52[k];
          *id v56 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v55 >> 4];
          v56[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v55 & 0xF];
        }
        id v32 = [NSString alloc];
        id v33 = v53;
        uint64_t v34 = 32;
      }
      else
      {
        if (*(void *)v87 != 4001) {
          goto LABEL_55;
        }
        id v26 = (unsigned __int8 *)v88 + 8;
        __int16 v27 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v28 = v27;
        for (uint64_t m = 0; m != 40; m += 2)
        {
          unsigned int v30 = *v26++;
          __int16 v31 = &v27[m];
          char *v31 = MSVFastHexStringFromBytes_hexCharacters_53728[(unint64_t)v30 >> 4];
          v31[1] = MSVFastHexStringFromBytes_hexCharacters_53728[v30 & 0xF];
        }
        id v32 = [NSString alloc];
        id v33 = v28;
        uint64_t v34 = 40;
      }
    }
    else
    {
      if (*(uint64_t *)v87 <= 2999)
      {
        if (*(void *)v87 == 1000)
        {
          uint64_t v45 = *((void *)&v88[0] + 1);
          id v46 = (char *)v91 + 1;
          uint64_t quot = *((void *)&v88[0] + 1);
          do
          {
            lldiv_t v48 = lldiv(quot, 10);
            uint64_t quot = v48.quot;
            if (v48.rem >= 0) {
              LOBYTE(v49) = v48.rem;
            }
            else {
              uint64_t v49 = -v48.rem;
            }
            *(v46 - 2) = v49 + 48;
            uint64_t v25 = (const UInt8 *)(v46 - 2);
            --v46;
          }
          while (v48.quot);
          if (v45 < 0)
          {
            *(v46 - 2) = 45;
            uint64_t v25 = (const UInt8 *)(v46 - 2);
          }
          unsigned int v24 = (char *)((char *)v91 - (char *)v25);
          goto LABEL_36;
        }
        if (*(void *)v87 == 2000)
        {
          uint64_t v20 = DWORD2(v88[0]);
          id v21 = v91;
          do
          {
            ldiv_t v22 = ldiv(v20, 10);
            uint64_t v20 = v22.quot;
            if (v22.rem >= 0) {
              LOBYTE(v23) = v22.rem;
            }
            else {
              uint64_t v23 = -v22.rem;
            }
            *((unsigned char *)v21 - 1) = v23 + 48;
            id v21 = (void *)((char *)v21 - 1);
          }
          while (v22.quot);
          unsigned int v24 = (char *)((char *)v91 - (char *)v21);
          uint64_t v25 = (const UInt8 *)v21;
LABEL_36:
          CFStringRef v50 = CFStringCreateWithBytes(0, v25, (CFIndex)v24, 0x8000100u, 0);
LABEL_47:
          id v67 = (__CFString *)v50;
LABEL_48:

          uint64_t v68 = [v15 URLByAppendingPathComponent:v67 isDirectory:0];
          v69 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v68];
          if ([v69 length])
          {
            id v12 = [MEMORY[0x1E4FB1818] imageWithData:v69];
          }
          else
          {
            id v12 = 0;
          }

          goto LABEL_52;
        }
LABEL_55:
        uint64_t v71 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v72 = [NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
        [v71 handleFailureInFunction:v72 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

        id v67 = &stru_1EE680640;
        goto LABEL_48;
      }
      if (*(void *)v87 == 3000)
      {
        LODWORD(v90[0]) = bswap32(DWORD2(v88[0]));
        v57 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v58 = 0;
        unsigned int v59 = v57 + 1;
        do
        {
          unint64_t v60 = *((unsigned __int8 *)v90 + v58);
          *(v59 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v60 >> 4];
          unsigned char *v59 = MSVFastHexStringFromBytes_hexCharacters_53728[v60 & 0xF];
          v59 += 2;
          ++v58;
        }
        while (v58 != 4);
        id v32 = [NSString alloc];
        id v33 = v57;
        uint64_t v34 = 8;
      }
      else
      {
        if (*(void *)v87 != 3001) {
          goto LABEL_55;
        }
        v90[0] = bswap64(*((unint64_t *)&v88[0] + 1));
        char v35 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
        uint64_t v36 = 0;
        unsigned int v37 = v35 + 1;
        do
        {
          unint64_t v38 = *((unsigned __int8 *)v90 + v36);
          *(v37 - 1) = MSVFastHexStringFromBytes_hexCharacters_53728[v38 >> 4];
          unsigned char *v37 = MSVFastHexStringFromBytes_hexCharacters_53728[v38 & 0xF];
          v37 += 2;
          ++v36;
        }
        while (v36 != 8);
        id v32 = [NSString alloc];
        id v33 = v35;
        uint64_t v34 = 16;
      }
    }
    CFStringRef v50 = (CFStringRef)[v32 initWithBytesNoCopy:v33 length:v34 encoding:4 freeWhenDone:1];
    goto LABEL_47;
  }
LABEL_52:

  return v12;
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  id v4 = a3;
  id v5 = [v4 token];
  int v6 = [v5 conformsToProtocol:&unk_1EE710A00];

  if (v6)
  {
    uint64_t v7 = [v4 token];
  }
  else
  {
    uint64_t v7 = objc_alloc_init(_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier);
    double v8 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    id v10 = -[MPAbstractNetworkArtworkDataSource _requestForCatalog:kind:size:](self, "_requestForCatalog:kind:size:", v4, 0, *MEMORY[0x1E4F1DB30], v9);
    unint64_t v11 = [v10 URL];
    id v12 = [v11 absoluteString];
    [(_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier *)v7 setImageArtworkIdentifier:v12];

    long long v13 = -[MPAbstractNetworkArtworkDataSource _requestForCatalog:kind:size:](self, "_requestForCatalog:kind:size:", v4, 1, v8, v9);
    uint64_t v14 = [v13 URL];
    long long v15 = [v14 absoluteString];
    [(_MPAbstractNetworkArtworkDataSourceVisualIdenticalityIdentifier *)v7 setVideoArtworkIdentifier:v15];
  }

  return v7;
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  id v5 = [v4 UUID];
  int v6 = [v4 loadingKey];
  [v4 setLoadingKey:0];

  if (v6)
  {
    imageAccessQueue = self->_imageAccessQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__MPAbstractNetworkArtworkDataSource_cancelLoadingRepresentationForArtworkCatalog___block_invoke;
    v8[3] = &unk_1E57FA038;
    v8[4] = self;
    id v9 = v5;
    id v10 = v6;
    [(MPAbstractNetworkArtworkDataSource *)self _performAsyncBarrierBlockOnQueue:imageAccessQueue block:v8];
  }
}

uint64_t __83__MPAbstractNetworkArtworkDataSource_cancelLoadingRepresentationForArtworkCatalog___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onImageAccessQueue_cancelLoadingContextForCatalogUUID:withLoadingURL:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return [(MPAbstractNetworkArtworkDataSource *)self existingRepresentationOfKind:0 forArtworkCatalog:a3];
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[MPAbstractNetworkArtworkDataSource _bestAvailableSizeForCatalog:kind:](self, "_bestAvailableSizeForCatalog:kind:", v7, [v6 kind]);
  double v9 = v8;
  double v11 = v10;

  if (!v6 && (v9 == *MEMORY[0x1E4F1DB30] ? (BOOL v12 = v11 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) : (BOOL v12 = 0), v12))
  {
    BOOL v15 = 1;
  }
  else
  {
    [v6 representationSize];
    BOOL v15 = v14 == v11 && v13 == v9;
  }

  return v15;
}

- (id)cacheKeyForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  return 0;
}

- (CGSize)bestAvailableSizeForCatalog:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (id)requestForCatalog:(id)a3 kind:(int64_t)a4 size:(CGSize)a5
{
  return 0;
}

- (BOOL)areRepresentationsOfKind:(int64_t)a3 availableForCatalog:(id)a4
{
  return 0;
}

- (BOOL)wantsBackgroundImageDecompression
{
  return 0;
}

- (BOOL)shouldLookForLargerImageRepresentationsWhenBestRepresentationIsUnavailable
{
  return 1;
}

- (id)sortedSupportedSizesForCatalog:(id)a3
{
  return 0;
}

- (id)cacheKeyForCatalog:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  if (objc_opt_respondsToSelector())
  {
    double v8 = -[MPAbstractNetworkArtworkDataSource cacheKeyForCatalog:kind:size:](self, "cacheKeyForCatalog:kind:size:", v7, 0, width, height);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (id)requestForCatalog:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  if (objc_opt_respondsToSelector())
  {
    double v9 = -[MPAbstractNetworkArtworkDataSource requestForCatalog:kind:size:](self, "requestForCatalog:kind:size:", v8, 0, width, height);
  }
  else
  {
    uint64_t v10 = [(id)objc_opt_class() instanceMethodForSelector:a2];
    if (v10 == [(id)objc_opt_class() instanceMethodForSelector:a2])
    {
      BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
      double v13 = (objc_class *)objc_opt_class();
      double v14 = NSStringFromClass(v13);
      BOOL v15 = NSStringFromSelector(a2);
      [v12 handleFailureInMethod:a2, self, @"MPAbstractNetworkArtworkDataSource.m", 267, @"Subclass %@ must implement -%@ defined in %@.", v14, v15, @"[MPAbstractNetworkArtworkDataSource class]" object file lineNumber description];
    }
    double v9 = 0;
  }

  return v9;
}

- (id)supportedSizesForCatalog:(id)a3
{
  uint64_t v5 = [(id)objc_opt_class() instanceMethodForSelector:a2];
  if (v5 == [(id)objc_opt_class() instanceMethodForSelector:a2])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    double v9 = NSStringFromClass(v8);
    uint64_t v10 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"MPAbstractNetworkArtworkDataSource.m", 258, @"Subclass %@ must implement -%@ defined in %@.", v9, v10, @"[MPAbstractNetworkArtworkDataSource class]" object file lineNumber description];
  }
  return 0;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(MPAbstractNetworkArtworkDataSource *)self areRepresentationsOfKind:0 availableForCatalog:v5];
  }
  else
  {
    uint64_t v7 = [(id)objc_opt_class() instanceMethodForSelector:a2];
    if (v7 == [(id)objc_opt_class() instanceMethodForSelector:a2])
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = (objc_class *)objc_opt_class();
      double v11 = NSStringFromClass(v10);
      BOOL v12 = NSStringFromSelector(a2);
      [v9 handleFailureInMethod:a2, self, @"MPAbstractNetworkArtworkDataSource.m", 252, @"Subclass %@ must implement -%@ defined in %@.", v11, v12, @"[MPAbstractNetworkArtworkDataSource class]" object file lineNumber description];
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setVideoArtworkCacheURL:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = (NSURL *)a3;
  if (self->_videoArtworkCacheURL != v5)
  {
    objc_storeStrong((id *)&self->_videoArtworkCacheURL, a3);
    if (v5)
    {
      BOOL v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v23 = 0;
      uint64_t v7 = [(NSURL *)v5 path];
      char v8 = [v6 fileExistsAtPath:v7 isDirectory:&v23];

      if (v8)
      {
        if (!v23)
        {
          double v9 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v10 = [(NSURL *)self->_videoArtworkCacheURL absoluteString];
            *(_DWORD *)buf = 134218242;
            uint64_t v25 = self;
            __int16 v26 = 2114;
            __int16 v27 = v10;
            _os_log_impl(&dword_1952E8000, v9, OS_LOG_TYPE_ERROR, "MPAbstractNetworkArtworkDataSource: %p setVideoArtworkCacheURL: Can't use videoArtworkCacheURL as cache directory [Non-directory file already exists at path] videoArtworkCacheURL=%{public}@", buf, 0x16u);
          }
          goto LABEL_15;
        }
      }
      else
      {
        id v22 = 0;
        [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v22];
        id v11 = v22;
        if (v11)
        {
          BOOL v12 = os_log_create("com.apple.amp.mediaplayer", "Artwork");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            double v13 = [(MPAbstractNetworkArtworkDataSource *)self videoArtworkCacheURL];
            double v14 = [v13 absoluteString];
            *(_DWORD *)buf = 134218242;
            uint64_t v25 = self;
            __int16 v26 = 2114;
            __int16 v27 = v14;
            _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_ERROR, "MPAbstractNetworkArtworkDataSource: %p setVideoArtworkCacheURL: error creating directory at URL %{public}@", buf, 0x16u);
          }
        }
      }
    }
    BOOL v15 = [(MPAbstractNetworkArtworkDataSource *)self videoURLSession];
    ldiv_t v16 = [v15 configuration];
    BOOL v6 = (void *)[v16 copy];

    [(id)objc_opt_class() _applyVideoCacheURL:v5 toConfiguration:v6];
    unint64_t v17 = [v6 URLCache];
    [(MPAbstractNetworkArtworkDataSource *)self setVideoURLCache:v17];

    id v18 = [(MPAbstractNetworkArtworkDataSource *)self videoURLSession];
    [v18 finishTasksAndInvalidate];

    id v19 = (void *)MEMORY[0x1E4F290E0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_URLSessionDataDelegateProxy);
    id v21 = [v19 sessionWithConfiguration:v6 delegate:WeakRetained delegateQueue:0];
    [(MPAbstractNetworkArtworkDataSource *)self setVideoURLSession:v21];

LABEL_15:
  }
}

- (NSCache)fallbackImageArtworkRepresentationCache
{
  if ([(MPAbstractNetworkArtworkDataSource *)self usesFallbackCache]) {
    double v3 = self->_fallbackImageArtworkRepresentationCache;
  }
  else {
    double v3 = 0;
  }

  return v3;
}

- (void)updateURLSessionWithCachePolicy:(unint64_t)a3 cachePath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MPAbstractNetworkArtworkDataSource *)self imageURLSession];
  char v8 = [v7 configuration];
  id v11 = (id)[v8 copy];

  [(id)objc_opt_class() _applyImageURLCachePolicy:a3 cacheDiskPath:v6 toConfiguration:v11];
  [(NSURLSession *)self->_imageURLSession finishTasksAndInvalidate];
  double v9 = [MEMORY[0x1E4F290E0] sessionWithConfiguration:v11];
  imageURLSessiouint64_t n = self->_imageURLSession;
  self->_imageURLSessiouint64_t n = v9;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2650] object:0];

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];

  v5.receiver = self;
  v5.super_class = (Class)MPAbstractNetworkArtworkDataSource;
  [(MPAbstractNetworkArtworkDataSource *)&v5 dealloc];
}

@end