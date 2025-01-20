@interface MKPlaceCollectionImageProvider
+ (id)sharedInstance;
- (BOOL)isJoeColorManuallyCuratedForCuratedCollection:(id)a3;
- (BOOL)isRTL;
- (BOOL)requiresGradientOperationForSource:(int64_t)a3;
- (CGSize)desiredSizeFromFrameSize:(CGSize)a3;
- (GEOMapItemPhotoOptions)optionsForCityBricks;
- (GEOMapItemPhotoOptions)optionsForCollectionCells;
- (MKPlaceCollectionImageProvider)init;
- (NSCache)downloadedImagesCache;
- (NSCache)gradientImagesCache;
- (NSMutableDictionary)downloadOperationsPair;
- (NSMutableDictionary)gradientOperationsPair;
- (double)screenScale;
- (geo_isolater)helperQueue;
- (id)joeColorForCompactCollection:(id)a3 usingCarouselContext:(int64_t)a4;
- (id)joeColorForCuratedCollection:(id)a3;
- (id)photoInfoWithPhoto:(id)a3 desiredSize:(CGSize)a4;
- (id)photoInfoWithPhoto:(id)a3 desiredSize:(CGSize)a4 usingOptions:(id)a5;
- (int64_t)photoTypeForImageSource:(int64_t)a3;
- (void)cache:(id)a3 willEvictObject:(id)a4;
- (void)cancelAllOperationsForCompactImageSource:(int64_t)a3;
- (void)cancelAllOperationsForImageSource:(int64_t)a3;
- (void)checkQueuesForCollectionSource:(int64_t)a3;
- (void)checkQueuesForCompactCollectionSource:(int64_t)a3;
- (void)loadCoverImageWithGuideLocation:(id)a3 size:(CGSize)a4 usingImageSource:(int64_t)a5 completion:(id)a6;
- (void)loadGradientCoverImageWithCuratedCollection:(id)a3 size:(CGSize)a4 contentSizeCategory:(id)a5 usingImageSource:(int64_t)a6 completion:(id)a7;
- (void)setDownloadOperationsPair:(id)a3;
- (void)setDownloadedImagesCache:(id)a3;
- (void)setGradientImagesCache:(id)a3;
- (void)setGradientOperationsPair:(id)a3;
- (void)setHelperQueue:(id)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setScreenScale:(double)a3;
@end

@implementation MKPlaceCollectionImageProvider

+ (id)sharedInstance
{
  if (qword_1EB316040 != -1) {
    dispatch_once(&qword_1EB316040, &__block_literal_global_69);
  }
  v2 = (void *)_MergedGlobals_160;

  return v2;
}

- (id)joeColorForCuratedCollection:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 photos];
  v5 = [v4 firstObject];
  v6 = [v5 backgroundJoeColor];

  if (!v6
    || (objc_msgSend(MEMORY[0x1E4F428B8], "_maps_colorFromHexString:", v6),
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [v3 collectionTitle];
      int v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_18BAEC000, v8, OS_LOG_TYPE_ERROR, "JoeColor is missing background color string for collection: %@", (uint8_t *)&v11, 0xCu);
    }
    v7 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  }

  return v7;
}

- (void)loadGradientCoverImageWithCuratedCollection:(id)a3 size:(CGSize)a4 contentSizeCategory:(id)a5 usingImageSource:(int64_t)a6 completion:(id)a7
{
  id v9 = a3;
  id v13 = a5;
  id v14 = a7;
  id v10 = v13;
  id v11 = v14;
  id v12 = v9;
  geo_isolate_sync();
}

- (MKPlaceCollectionImageProvider)init
{
  v20.receiver = self;
  v20.super_class = (Class)MKPlaceCollectionImageProvider;
  v2 = [(MKPlaceCollectionImageProvider *)&v20 init];
  if (v2)
  {
    uint64_t v3 = geo_isolater_create();
    helperQueue = v2->_helperQueue;
    v2->_helperQueue = (geo_isolater *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F646D0]) initWithAllowSmaller:1 cropStyle:4 format:0];
    optionsForCollectionCells = v2->_optionsForCollectionCells;
    v2->_optionsForCollectionCells = (GEOMapItemPhotoOptions *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F646D0]) initWithAllowSmaller:1 cropStyle:0 format:0];
    optionsForCityBricks = v2->_optionsForCityBricks;
    v2->_optionsForCityBricks = (GEOMapItemPhotoOptions *)v7;

    id v9 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    gradientImagesCache = v2->_gradientImagesCache;
    v2->_gradientImagesCache = v9;

    [(NSCache *)v2->_gradientImagesCache setDelegate:v2];
    [(NSCache *)v2->_gradientImagesCache setEvictsObjectsWhenApplicationEntersBackground:0];
    [(NSCache *)v2->_gradientImagesCache setEvictsObjectsWithDiscardedContent:0];
    id v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    downloadedImagesCache = v2->_downloadedImagesCache;
    v2->_downloadedImagesCache = v11;

    [(NSCache *)v2->_downloadedImagesCache setDelegate:v2];
    [(NSCache *)v2->_downloadedImagesCache setEvictsObjectsWhenApplicationEntersBackground:0];
    [(NSCache *)v2->_downloadedImagesCache setEvictsObjectsWithDiscardedContent:0];
    id v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    downloadOperationsPair = v2->_downloadOperationsPair;
    v2->_downloadOperationsPair = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    gradientOperationsPair = v2->_gradientOperationsPair;
    v2->_gradientOperationsPair = v15;

    v2->_isRTL = MKApplicationLayoutDirectionIsRightToLeft();
    v17 = +[MKSystemController sharedInstance];
    [v17 screenScale];
    v2->_screenScale = v18;
  }
  return v2;
}

void __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_38(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = [WeakRetained gradientImagesCache];
  v4 = [v3 objectForKey:*(void *)(a1 + 32)];
  uint64_t v5 = (void *)[v4 copy];

  if (v5)
  {
    v6 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [*(id *)(a1 + 40) absoluteString];
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSinceDate:*(void *)(a1 + 56)];
      *(_DWORD *)buf = 138413058;
      v28 = v5;
      __int16 v29 = 2112;
      v30 = v7;
      __int16 v31 = 2112;
      uint64_t v32 = v8;
      __int16 v33 = 2048;
      uint64_t v34 = v10;
      _os_log_impl(&dword_18BAEC000, v6, OS_LOG_TYPE_DEBUG, "[⌛]Completed applying gradient to \nImage: %@ \nPhotoURL: %@ \nCollection: %@ \nDuration: %f seconds", buf, 0x2Au);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_39;
    block[3] = &unk_1E54B8360;
    id v24 = *(id *)(a1 + 64);
    id v23 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);

    id v11 = v24;
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"Image gradient failed for Collection \nURL: %@. \n Collection: %@", *(void *)(a1 + 40), *(void *)(a1 + 48)];
    id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v13 = MKErrorDomain;
    v25 = @"Reason";
    v26 = v11;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v15 = (void *)[v12 initWithDomain:v13 code:1 userInfo:v14];

    v16 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_ERROR, "[!!]Error blurring image: %@", buf, 0xCu);
    }

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_43;
    v19[3] = &unk_1E54B8360;
    id v17 = *(id *)(a1 + 64);
    id v20 = v15;
    id v21 = v17;
    id v18 = v15;
    dispatch_async(MEMORY[0x1E4F14428], v19);
  }
}

void __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke(uint64_t a1)
{
  v82[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "desiredSizeFromFrameSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v3 = v2;
  double v5 = v4;
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) photos];
  uint64_t v8 = [v7 firstObject];
  v59 = objc_msgSend(v6, "photoInfoWithPhoto:desiredSize:", v8, v3, v5);

  id v9 = [v59 url];
  v58 = [*(id *)(a1 + 40) collectionTitle];
  if (v9)
  {
    int v10 = [*(id *)(a1 + 32) requiresGradientOperationForSource:*(void *)(a1 + 80)];
    id v11 = [v9 absoluteString];
    id v12 = NSString;
    id v13 = [v9 path];
    id v14 = [NSNumber numberWithInteger:*(void *)(a1 + 80)];
    id v15 = [v12 stringWithFormat:@"[Url:%@ Source:%@ preferredContentSizeCategory:%@]", v13, v14, *(void *)(a1 + 48)];

    v16 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v76 = v15;
      _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_DEBUG, "Requesting image for ID: %@", buf, 0xCu);
    }

    id v17 = [*(id *)(a1 + 32) downloadedImagesCache];
    id v18 = [v17 objectForKey:v11];

    if (v18) {
      char v19 = v10;
    }
    else {
      char v19 = 1;
    }
    if (v19)
    {
      if (v10
        && ([*(id *)(a1 + 32) gradientImagesCache],
            id v20 = objc_claimAutoreleasedReturnValue(),
            [v20 objectForKey:v15],
            id v21 = objc_claimAutoreleasedReturnValue(),
            v20,
            v21))
      {
        v22 = MKGetCuratedCollectionsLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v76 = v15;
          _os_log_impl(&dword_18BAEC000, v22, OS_LOG_TYPE_DEBUG, "[✔]Gradient Cache Hit. Image ID: %@", buf, 0xCu);
        }

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_34;
        block[3] = &unk_1E54B8360;
        id v23 = *(id *)(a1 + 56);
        id v67 = v21;
        id v68 = v23;
        id v24 = v21;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      else
      {
        [*(id *)(a1 + 32) checkQueuesForCollectionSource:*(void *)(a1 + 80)];
        v54 = [MEMORY[0x1E4F1C9C8] date];
        objc_initWeak(&location, *(id *)(a1 + 32));
        uint64_t v32 = MKGetCuratedCollectionsLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          __int16 v33 = [v9 absoluteString];
          *(_DWORD *)buf = 138412546;
          id v76 = v33;
          __int16 v77 = 2112;
          v78 = v58;
          _os_log_impl(&dword_18BAEC000, v32, OS_LOG_TYPE_INFO, "[X]Cache Miss. Downloading and applying Gradient to Image for \nUrl: %@. \nCollection: %@", buf, 0x16u);
        }
        uint64_t v34 = [MKPlaceCollectionImageDownloadOperation alloc];
        uint64_t v35 = [*(id *)(a1 + 32) downloadedImagesCache];
        v57 = [(MKPlaceCollectionImageDownloadOperation *)v34 initWithUrl:v9 downloadCache:v35 cacheId:v11];

        v36 = [*(id *)(a1 + 32) downloadOperationsPair];
        v37 = v36;
        unint64_t v38 = *(void *)(a1 + 80) - 1;
        if (v38 > 0xA) {
          v39 = @"SeeAll";
        }
        else {
          v39 = off_1E54BC330[v38];
        }
        v53 = [v36 objectForKey:v39];

        if (v10)
        {
          v55 = [MKPlaceCollectionImageGradientOperation alloc];
          uint64_t v52 = *(void *)(a1 + 48);
          v40 = [*(id *)(a1 + 40) collectionTitle];
          v41 = [*(id *)(a1 + 32) downloadedImagesCache];
          v42 = [*(id *)(a1 + 32) gradientImagesCache];
          uint64_t v43 = [*(id *)(a1 + 32) isRTL];
          [*(id *)(a1 + 32) screenScale];
          v56 = -[MKPlaceCollectionImageGradientOperation initWithUrl:size:contentSizeCategory:name:downloadCache:gradientCache:isRTL:screenScale:cacheId:](v55, "initWithUrl:size:contentSizeCategory:name:downloadCache:gradientCache:isRTL:screenScale:cacheId:", v9, v52, v40, v41, v42, v43, v3, v5, v44, v15);

          v45 = [*(id *)(a1 + 32) gradientOperationsPair];
          v46 = v45;
          unint64_t v47 = *(void *)(a1 + 80) - 1;
          if (v47 > 0xA) {
            v48 = @"SeeAll";
          }
          else {
            v48 = off_1E54BC330[v47];
          }
          v49 = [v45 objectForKey:v48];

          [(MKPlaceCollectionImageGradientOperation *)v56 addDependency:v57];
        }
        else
        {
          v56 = 0;
          v49 = 0;
        }
        [v53 addOperation:v57];
        if (v10)
        {
          [v49 addOperation:v56];
          v50 = (id *)v62;
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_38;
          v62[3] = &unk_1E54BC298;
          v51 = &v64;
          objc_copyWeak(&v64, &location);
          v62[4] = v15;
          v62[5] = v9;
          v62[6] = v58;
          v62[7] = v54;
          id v63 = *(id *)(a1 + 56);
          [(MKPlaceCollectionImageGradientOperation *)v56 setCompletionBlock:v62];
        }
        else
        {
          v50 = (id *)v60;
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_2;
          v60[3] = &unk_1E54BC2C0;
          v51 = &v61;
          objc_copyWeak(&v61, &location);
          v60[4] = v9;
          v60[5] = v58;
          v60[6] = v54;
          v60[7] = *(id *)(a1 + 56);
          [(MKPlaceCollectionImageDownloadOperation *)v57 setCompletionBlock:v60];
        }

        objc_destroyWeak(v51);
        objc_destroyWeak(&location);
        id v24 = v54;
      }
    }
    else
    {
      __int16 v31 = MKGetCuratedCollectionsLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v76 = v18;
        __int16 v77 = 2112;
        v78 = v9;
        __int16 v79 = 2112;
        v80 = v58;
        _os_log_impl(&dword_18BAEC000, v31, OS_LOG_TYPE_DEBUG, "[✔]Collection image Cache Hit. \nImage: %@ \n Photo URL: %@ \nCollection: %@", buf, 0x20u);
      }

      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_33;
      v69[3] = &unk_1E54B8360;
      id v71 = *(id *)(a1 + 56);
      id v70 = v18;
      dispatch_async(MEMORY[0x1E4F14428], v69);

      id v24 = v71;
    }
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"No image for collection: %@", v58];
    id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
    v26 = MKErrorDomain;
    v81 = @"Reason";
    v82[0] = v11;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:&v81 count:1];
    v28 = (void *)[v25 initWithDomain:v26 code:1 userInfo:v27];

    __int16 v29 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v76 = v28;
      _os_log_impl(&dword_18BAEC000, v29, OS_LOG_TYPE_ERROR, "[!!]Error applying gradient to image: %@", buf, 0xCu);
    }

    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_29;
    v72[3] = &unk_1E54B8360;
    id v30 = *(id *)(a1 + 56);
    id v73 = v28;
    id v74 = v30;
    id v15 = v28;
    dispatch_async(MEMORY[0x1E4F14428], v72);

    id v18 = v74;
  }
}

- (NSCache)gradientImagesCache
{
  return self->_gradientImagesCache;
}

- (NSCache)downloadedImagesCache
{
  return self->_downloadedImagesCache;
}

- (BOOL)requiresGradientOperationForSource:(int64_t)a3
{
  double v3 = [NSNumber numberWithInteger:a3];
  char v4 = [&unk_1ED97F470 containsObject:v3] ^ 1;

  return v4;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (id)photoInfoWithPhoto:(id)a3 desiredSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  uint64_t v8 = [(MKPlaceCollectionImageProvider *)self optionsForCollectionCells];
  id v9 = -[MKPlaceCollectionImageProvider photoInfoWithPhoto:desiredSize:usingOptions:](self, "photoInfoWithPhoto:desiredSize:usingOptions:", v7, v8, width, height);

  return v9;
}

- (id)photoInfoWithPhoto:(id)a3 desiredSize:(CGSize)a4 usingOptions:(id)a5
{
  return (id)objc_msgSend(a3, "bestPhotoForSize:options:", a5, a4.width, a4.height);
}

- (GEOMapItemPhotoOptions)optionsForCollectionCells
{
  return self->_optionsForCollectionCells;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (CGSize)desiredSizeFromFrameSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = +[MKSystemController sharedInstance];
  [v5 screenScale];
  double v7 = v6;

  double v8 = width * v7;
  double v9 = height * v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)checkQueuesForCollectionSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA) {
    double v5 = @"SeeAll";
  }
  else {
    double v5 = off_1E54BC330[a3 - 1];
  }
  double v6 = [(MKPlaceCollectionImageProvider *)self downloadOperationsPair];
  id v13 = [v6 objectForKey:v5];

  if (!v13)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    double v7 = [NSString stringWithFormat:@"MKPlaceCollectionImageProvider.downloadOperationQueue.%@", v5];
    [v13 setName:v7];

    [v13 setQualityOfService:25];
    double v8 = [(MKPlaceCollectionImageProvider *)self downloadOperationsPair];
    [v8 setObject:v13 forKey:v5];
  }
  if ([(MKPlaceCollectionImageProvider *)self requiresGradientOperationForSource:a3])
  {
    double v9 = [(MKPlaceCollectionImageProvider *)self gradientOperationsPair];
    id v10 = [v9 objectForKey:v5];

    if (!v10)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F28F08]);
      id v11 = [NSString stringWithFormat:@"MKPlaceCollectionImageProvider.gradientOperationQueue.%@", v5];
      [v10 setName:v11];

      [v10 setQualityOfService:25];
      id v12 = [(MKPlaceCollectionImageProvider *)self gradientOperationsPair];
      [v12 setObject:v10 forKey:v5];
    }
  }
}

- (NSMutableDictionary)gradientOperationsPair
{
  return self->_gradientOperationsPair;
}

- (NSMutableDictionary)downloadOperationsPair
{
  return self->_downloadOperationsPair;
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0, 1);
}

- (void)cancelAllOperationsForImageSource:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) > 0xA) {
    char v4 = @"SeeAll";
  }
  else {
    char v4 = off_1E54BC330[a3 - 1];
  }
  double v5 = [(MKPlaceCollectionImageProvider *)self downloadOperationsPair];
  double v6 = [v5 objectForKey:v4];

  double v7 = [(MKPlaceCollectionImageProvider *)self gradientOperationsPair];
  double v8 = [v7 objectForKey:v4];

  double v9 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_18BAEC000, v9, OS_LOG_TYPE_INFO, "Cancelling ALL download and gradient operations for source: %@", (uint8_t *)&v10, 0xCu);
  }

  [v6 cancelAllOperations];
  [v8 cancelAllOperations];
}

void __48__MKPlaceCollectionImageProvider_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MKPlaceCollectionImageProvider);
  v1 = (void *)_MergedGlobals_160;
  _MergedGlobals_160 = (uint64_t)v0;
}

- (void)checkQueuesForCompactCollectionSource:(int64_t)a3
{
  char v4 = @"CompactCollection_SearchHome";
  if (a3 == 1) {
    char v4 = @"CompactCollection_CitySelector";
  }
  if (a3 == 2) {
    double v5 = @"CompactCollection_GuidesHome";
  }
  else {
    double v5 = v4;
  }
  double v6 = [(MKPlaceCollectionImageProvider *)self downloadOperationsPair];
  id v10 = [v6 objectForKey:v5];

  double v7 = v10;
  if (!v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    double v8 = [NSString stringWithFormat:@"MKPlaceCompactCollectionImageProvider.downloadOperationQueue.%@", v5];
    [v11 setName:v8];

    [v11 setQualityOfService:25];
    double v9 = [(MKPlaceCollectionImageProvider *)self downloadOperationsPair];
    [v9 setObject:v11 forKey:v5];

    double v7 = v11;
  }
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0, 0);
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 1, 1);
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 1, 1);
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0, 0);
}

void __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  double v3 = [WeakRetained downloadedImagesCache];
  char v4 = [*(id *)(a1 + 32) absoluteString];
  double v5 = [v3 objectForKey:v4];
  double v6 = (void *)[v5 copy];

  if (v6)
  {
    double v7 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      double v8 = [*(id *)(a1 + 32) absoluteString];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138413058;
      __int16 v29 = v6;
      __int16 v30 = 2112;
      __int16 v31 = v8;
      __int16 v32 = 2112;
      uint64_t v33 = v9;
      __int16 v34 = 2048;
      uint64_t v35 = v11;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_DEBUG, "[⌛]Completed download for \nImage: %@ \nPhotoURL: %@ \nCollection: %@ \nDuration: %f seconds", buf, 0x2Au);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_44;
    block[3] = &unk_1E54B8360;
    id v25 = *(id *)(a1 + 56);
    id v24 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);

    uint64_t v12 = v25;
  }
  else
  {
    uint64_t v12 = [NSString stringWithFormat:@"Image download failed for Collection. \nURL: %@. \nGuide Location: %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v14 = MKErrorDomain;
    v26 = @"Reason";
    v27 = v12;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v16 = (void *)[v13 initWithDomain:v14 code:1 userInfo:v15];

    id v17 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v29 = v16;
      _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_ERROR, "[!!]Error downloading image: %@", buf, 0xCu);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_48;
    v20[3] = &unk_1E54B8360;
    id v18 = *(id *)(a1 + 56);
    id v21 = v16;
    id v22 = v18;
    id v19 = v16;
    dispatch_async(MEMORY[0x1E4F14428], v20);
  }
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0, 1);
}

uint64_t __131__MKPlaceCollectionImageProvider_loadGradientCoverImageWithCuratedCollection_size_contentSizeCategory_usingImageSource_completion___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0, 0);
}

- (void)loadCoverImageWithGuideLocation:(id)a3 size:(CGSize)a4 usingImageSource:(int64_t)a5 completion:(id)a6
{
  id v7 = a3;
  id v10 = a6;
  id v8 = v10;
  id v9 = v7;
  geo_isolate_sync();
}

void __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke(uint64_t a1)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  double v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "desiredSizeFromFrameSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v4 = v3;
  double v6 = v5;
  id v7 = objc_msgSend(*(id *)(a1 + 40), "photosForType:", objc_msgSend(*v2, "photoTypeForImageSource:", *(void *)(a1 + 72)));
  __int16 v34 = [v7 firstObject];

  id v8 = objc_msgSend(*v2, "photoInfoWithPhoto:desiredSize:usingOptions:", v34, *((void *)*v2 + 4), v4, v6);
  id v9 = [v8 url];
  id v10 = [v9 absoluteString];
  uint64_t v11 = [*(id *)(a1 + 40) title];
  if (v9)
  {
    uint64_t v12 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v10;
      _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_DEBUG, "Requesting image for ID: %@", buf, 0xCu);
    }

    id v13 = [*(id *)(a1 + 32) downloadedImagesCache];
    id v14 = [v13 objectForKey:v10];

    if (v14)
    {
      id v15 = MKGetCuratedCollectionsLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v48 = v14;
        __int16 v49 = 2112;
        v50 = v9;
        __int16 v51 = 2112;
        uint64_t v52 = v11;
        _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_DEBUG, "[✔]Guide location image Cache Hit. \nImage: %@ \n Photo URL: %@ \nGuide Location: %@", buf, 0x20u);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_53;
      block[3] = &unk_1E54B8360;
      id v43 = *(id *)(a1 + 48);
      id v16 = v14;
      id v42 = v16;
      dispatch_async(MEMORY[0x1E4F14428], block);

      id v17 = v43;
    }
    else
    {
      [*(id *)(a1 + 32) checkQueuesForCompactCollectionSource:*(void *)(a1 + 72)];
      id v24 = [MEMORY[0x1E4F1C9C8] date];
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      id v25 = [MKPlaceCollectionImageDownloadOperation alloc];
      v26 = [*(id *)(a1 + 32) downloadedImagesCache];
      v27 = [(MKPlaceCollectionImageDownloadOperation *)v25 initWithUrl:v9 downloadCache:v26 cacheId:v10];

      v28 = [*(id *)(a1 + 32) downloadOperationsPair];
      __int16 v29 = v28;
      uint64_t v30 = *(void *)(a1 + 72);
      __int16 v31 = @"CompactCollection_SearchHome";
      if (v30 == 1) {
        __int16 v31 = @"CompactCollection_CitySelector";
      }
      if (v30 == 2) {
        __int16 v32 = @"CompactCollection_GuidesHome";
      }
      else {
        __int16 v32 = v31;
      }
      uint64_t v33 = [v28 objectForKey:v32];

      [v33 addOperation:v27];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_2;
      v35[3] = &unk_1E54BC2C0;
      objc_copyWeak(&v40, (id *)buf);
      id v36 = v9;
      id v37 = v11;
      id v17 = v24;
      id v38 = v17;
      id v39 = *(id *)(a1 + 48);
      [(MKPlaceCollectionImageDownloadOperation *)v27 setCompletionBlock:v35];

      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)buf);
      id v16 = 0;
    }
  }
  else
  {
    id v16 = [NSString stringWithFormat:@"No image for guide location: %@", v11];
    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v19 = MKErrorDomain;
    v53 = @"Reason";
    v54[0] = v16;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
    id v21 = (void *)[v18 initWithDomain:v19 code:1 userInfo:v20];

    id v22 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v21;
      _os_log_impl(&dword_18BAEC000, v22, OS_LOG_TYPE_ERROR, "[!!]Error downloading image: %@", buf, 0xCu);
    }

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_52;
    v44[3] = &unk_1E54B8360;
    id v23 = *(id *)(a1 + 48);
    id v45 = v21;
    id v46 = v23;
    id v17 = v21;
    dispatch_async(MEMORY[0x1E4F14428], v44);
  }
}

uint64_t __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0, 0);
}

uint64_t __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 1, 1);
}

void __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  double v3 = [WeakRetained downloadedImagesCache];
  double v4 = [*(id *)(a1 + 32) absoluteString];
  double v5 = [v3 objectForKey:v4];
  double v6 = (void *)[v5 copy];

  if (v6)
  {
    id v7 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [*(id *)(a1 + 32) absoluteString];
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:*(void *)(a1 + 48)];
      *(_DWORD *)buf = 138413058;
      __int16 v29 = v6;
      __int16 v30 = 2112;
      __int16 v31 = v8;
      __int16 v32 = 2112;
      uint64_t v33 = v9;
      __int16 v34 = 2048;
      uint64_t v35 = v11;
      _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_DEBUG, "[⌛]Completed download for \nImage: %@ \nPhotoURL: %@ \nGuide Location: %@ \nDuration: %f seconds", buf, 0x2Au);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_54;
    block[3] = &unk_1E54B8360;
    id v25 = *(id *)(a1 + 56);
    id v24 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);

    uint64_t v12 = v25;
  }
  else
  {
    uint64_t v12 = [NSString stringWithFormat:@"Image download failed for Guide Location. \nURL: %@. \nGuide Location: %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v14 = MKErrorDomain;
    v26 = @"Reason";
    v27 = v12;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v16 = (void *)[v13 initWithDomain:v14 code:1 userInfo:v15];

    id v17 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v29 = v16;
      _os_log_impl(&dword_18BAEC000, v17, OS_LOG_TYPE_ERROR, "[!!]Error downloading image: %@", buf, 0xCu);
    }

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_58;
    v20[3] = &unk_1E54B8360;
    id v18 = *(id *)(a1 + 56);
    id v21 = v16;
    id v22 = v18;
    id v19 = v16;
    dispatch_async(MEMORY[0x1E4F14428], v20);
  }
}

uint64_t __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, 0, 1);
}

uint64_t __99__MKPlaceCollectionImageProvider_loadCoverImageWithGuideLocation_size_usingImageSource_completion___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32), 0, 0);
}

- (void)cancelAllOperationsForCompactImageSource:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v4 = @"CompactCollection_SearchHome";
  if (a3 == 1) {
    double v4 = @"CompactCollection_CitySelector";
  }
  if (a3 == 2) {
    double v5 = @"CompactCollection_GuidesHome";
  }
  else {
    double v5 = v4;
  }
  double v6 = [(MKPlaceCollectionImageProvider *)self downloadOperationsPair];
  id v7 = [v6 objectForKey:v5];

  id v8 = [(MKPlaceCollectionImageProvider *)self gradientOperationsPair];
  uint64_t v9 = [v8 objectForKey:v5];

  id v10 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    uint64_t v12 = v5;
    _os_log_impl(&dword_18BAEC000, v10, OS_LOG_TYPE_INFO, "Cancelling ALL download and gradient operations for source: %@", (uint8_t *)&v11, 0xCu);
  }

  [v7 cancelAllOperations];
  [v9 cancelAllOperations];
}

- (int64_t)photoTypeForImageSource:(int64_t)a3
{
  return a3 != 1;
}

- (BOOL)isJoeColorManuallyCuratedForCuratedCollection:(id)a3
{
  double v3 = [a3 photos];
  double v4 = [v3 firstObject];
  char v5 = [v4 isBackgroundJoeColorCurated];

  return v5;
}

- (id)joeColorForCompactCollection:(id)a3 usingCarouselContext:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = a4 == 0;
  }
  id v8 = objc_msgSend(v6, "photosForType:", -[MKPlaceCollectionImageProvider photoTypeForImageSource:](self, "photoTypeForImageSource:", v7));
  uint64_t v9 = [v8 firstObject];

  id v10 = [v9 backgroundJoeColor];
  if (!v10
    || (objc_msgSend(MEMORY[0x1E4F428B8], "_maps_colorFromHexString:", v10),
        (int v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v12 = MKGetCuratedCollectionsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v6 title];
      int v15 = 138412290;
      id v16 = v13;
      _os_log_impl(&dword_18BAEC000, v12, OS_LOG_TYPE_ERROR, "JoeColor is missing background color string for guide location: %@", (uint8_t *)&v15, 0xCu);
    }
    int v11 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  }

  return v11;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = MKGetCuratedCollectionsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_DEBUG, "[!]Cache %@ is evicting: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (geo_isolater)helperQueue
{
  return self->_helperQueue;
}

- (void)setHelperQueue:(id)a3
{
}

- (GEOMapItemPhotoOptions)optionsForCityBricks
{
  return self->_optionsForCityBricks;
}

- (void)setGradientImagesCache:(id)a3
{
}

- (void)setDownloadedImagesCache:(id)a3
{
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (void)setDownloadOperationsPair:(id)a3
{
}

- (void)setGradientOperationsPair:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientOperationsPair, 0);
  objc_storeStrong((id *)&self->_downloadOperationsPair, 0);
  objc_storeStrong((id *)&self->_downloadedImagesCache, 0);
  objc_storeStrong((id *)&self->_gradientImagesCache, 0);
  objc_storeStrong((id *)&self->_optionsForCityBricks, 0);
  objc_storeStrong((id *)&self->_optionsForCollectionCells, 0);

  objc_storeStrong((id *)&self->_helperQueue, 0);
}

@end