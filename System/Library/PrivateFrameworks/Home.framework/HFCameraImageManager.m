@interface HFCameraImageManager
+ (id)clipIdentifierStringFromDate:(id)a3;
+ (id)sharedManager;
+ (void)purgeVideoFiles;
+ (void)purgeVideoFilesAtURL:(id)a3 completionHandler:(id)a4;
- (CGSize)videoSize;
- (HFCameraClipVideoAssetOperationCache)fetchCache;
- (HFCameraImageCache)imageCache;
- (HFCameraImageManager)init;
- (HFCameraPosterFrameProvider)cameraPosterFrameProvider;
- (HMCameraProfile)cameraProfile;
- (NSMutableDictionary)generationObservers;
- (NSMutableDictionary)imageObservers;
- (NSMutableDictionary)inProgressOperations;
- (NSMutableDictionary)offsetsForFile;
- (NSMutableDictionary)requestedFaceCropCache;
- (NSMutableDictionary)requestedHeroFrameCache;
- (NSMutableDictionary)requestedPosterFrameCache;
- (NSOperationQueue)posterFrameQueue;
- (double)_timeScaleAdjustedOffset:(double)a3;
- (id)cachedPosterFrameImageForClip:(id)a3 offset:(double)a4 requestor:(id)a5;
- (id)faceCropForClip:(id)a3 atOffset:(double)a4;
- (id)faceCropForPersonName:(id)a3;
- (id)faceCropImagesForClip:(id)a3 atOffset:(double)a4;
- (id)firstPosterFrameImageForClip:(id)a3;
- (id)heroFrameImageForClip:(id)a3;
- (id)imageObserversForKey:(id)a3;
- (id)keyForClip:(id)a3;
- (id)keyForClip:(id)a3 timeOffset:(double)a4;
- (id)representativeImageForClip:(id)a3;
- (void)_addPosterFrameImage:(id)a3 forClip:(id)a4 withOffset:(double)a5;
- (void)_generateImagesForForTimelapseClip:(id)a3 atLocation:(id)a4;
- (void)_updateDemoObserversForImage:(id)a3 forClip:(id)a4 withOffset:(double)a5;
- (void)addDemoPosterFrameImageObserver:(id)a3 forClip:(id)a4 atOffset:(double)a5;
- (void)addFaceCropImageObserver:(id)a3 forClip:(id)a4 usingSignificantEvent:(id)a5;
- (void)addHeroFrameImageObserver:(id)a3 forClip:(id)a4;
- (void)addPosterFrameImageObserver:(id)a3 forClip:(id)a4 atOffset:(double)a5;
- (void)dealloc;
- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4;
- (void)executionEnvironmentDidEnterBackground:(id)a3;
- (void)failToFindHeroFrameForClip:(id)a3;
- (void)failedToDownloadVideoFileForClip:(id)a3;
- (void)failedToFindFaceCropForClip:(id)a3 withKey:(id)a4;
- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4;
- (void)generateDemoPosterFramesForAsset:(id)a3 forClip:(id)a4;
- (void)generateImageUsingAsset:(id)a3 clip:(id)a4 offset:(double)a5;
- (void)generatePosterFrameImageForClip:(id)a3 atOffset:(double)a4 observer:(id)a5;
- (void)getPosterFrameImage:(id)a3 forClip:(id)a4 atOffset:(double)a5;
- (void)purgePosterFrames;
- (void)removeFaceCropImageObserver:(id)a3 forPersonName:(id)a4;
- (void)removeHeroFrameImageObserver:(id)a3 forClip:(id)a4;
- (void)removePosterFrameImageObserver:(id)a3 forClip:(id)a4 atOffset:(double)a5;
- (void)resetForCameraDismissal;
- (void)setCameraPosterFrameProvider:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setFetchCache:(id)a3;
- (void)setGenerationObservers:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setImageObservers:(id)a3;
- (void)setInProgressOperations:(id)a3;
- (void)setOffsetsForFile:(id)a3;
- (void)setPosterFrameQueue:(id)a3;
- (void)setRequestedFaceCropCache:(id)a3;
- (void)setRequestedHeroFrameCache:(id)a3;
- (void)setRequestedPosterFrameCache:(id)a3;
- (void)setVideoSize:(CGSize)a3;
@end

@implementation HFCameraImageManager

+ (id)sharedManager
{
  if (qword_26AB2EBF8 != -1) {
    dispatch_once(&qword_26AB2EBF8, &__block_literal_global_5);
  }
  v2 = (void *)_MergedGlobals_210;
  return v2;
}

uint64_t __37__HFCameraImageManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(HFCameraImageManager);
  uint64_t v1 = _MergedGlobals_210;
  _MergedGlobals_210 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFCameraImageManager)init
{
  v25.receiver = self;
  v25.super_class = (Class)HFCameraImageManager;
  v2 = [(HFCameraImageManager *)&v25 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    posterFrameQueue = v2->_posterFrameQueue;
    v2->_posterFrameQueue = v3;

    v5 = objc_alloc_init(HFCameraImageCache);
    imageCache = v2->_imageCache;
    v2->_imageCache = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    imageObservers = v2->_imageObservers;
    v2->_imageObservers = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    generationObservers = v2->_generationObservers;
    v2->_generationObservers = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    inProgressOperations = v2->_inProgressOperations;
    v2->_inProgressOperations = v11;

    v13 = objc_alloc_init(HFCameraClipVideoAssetOperationCache);
    fetchCache = v2->_fetchCache;
    v2->_fetchCache = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    requestedHeroFrameCache = v2->_requestedHeroFrameCache;
    v2->_requestedHeroFrameCache = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    requestedFaceCropCache = v2->_requestedFaceCropCache;
    v2->_requestedFaceCropCache = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    requestedPosterFrameCache = v2->_requestedPosterFrameCache;
    v2->_requestedPosterFrameCache = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    offsetsForFile = v2->_offsetsForFile;
    v2->_offsetsForFile = v21;

    if (+[HFCameraUtilities shouldPurgePosterFrameCache])
    {
      [(HFCameraImageManager *)v2 purgePosterFrames];
    }
    +[HFCameraImageManager purgeVideoFiles];
    v23 = +[HFExecutionEnvironment sharedInstance];
    [v23 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[HFExecutionEnvironment sharedInstance];
  [v3 removeObserver:self];

  v4 = [(HFCameraImageManager *)self posterFrameQueue];
  [v4 cancelAllOperations];

  v5.receiver = self;
  v5.super_class = (Class)HFCameraImageManager;
  [(HFCameraImageManager *)&v5 dealloc];
}

- (id)heroFrameImageForClip:(id)a3
{
  v4 = [a3 uniqueIdentifier];
  objc_super v5 = [v4 UUIDString];
  v6 = +[HFCameraImageCache heroFrameKeyForCameraClipIdentifierString:v5];

  v7 = [(HFCameraImageManager *)self imageCache];
  v8 = [v7 imageForKey:v6];

  return v8;
}

- (id)faceCropForClip:(id)a3 atOffset:(double)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_msgSend(v6, "hf_faceCropNameAtOffset:", a4);
  if (v7)
  {
    v8 = +[HFCameraImageCache faceCropKeyForPersonName:v7];
    v9 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Requesting cached face crop using key:%@.", (uint8_t *)&v15, 0xCu);
    }

    v10 = [(HFCameraImageManager *)self imageCache];
    v11 = [v10 imageForKey:v8];
  }
  else
  {
    v8 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = [v6 uniqueIdentifier];
      v14 = [v13 UUIDString];
      int v15 = 138412546;
      v16 = v14;
      __int16 v17 = 2048;
      double v18 = a4;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Failed to find name for UUID:%@ at offset:%.2f.", (uint8_t *)&v15, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

- (id)faceCropForPersonName:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = +[HFCameraImageCache faceCropKeyForPersonName:a3];
  objc_super v5 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Requesting cached face crop using key:%@.", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(HFCameraImageManager *)self imageCache];
  v7 = [v6 imageForKey:v4];

  return v7;
}

- (id)faceCropImagesForClip:(id)a3 atOffset:(double)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [MEMORY[0x263EFF980] array];
  v8 = objc_msgSend(v6, "hf_faceCropNamesAtOffset:", a4);
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  __int16 v17 = __55__HFCameraImageManager_faceCropImagesForClip_atOffset___block_invoke;
  double v18 = &unk_26408D338;
  uint64_t v19 = self;
  id v9 = v7;
  id v20 = v9;
  [v8 enumerateObjectsUsingBlock:&v15];
  v10 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_msgSend(v6, "uniqueIdentifier", v15, v16, v17, v18, v19);
    *(_DWORD *)buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    v24 = v14;
    _os_log_debug_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEBUG, "Returning faceCropImages:%@ for clipUUID:%@", buf, 0x16u);
  }
  uint64_t v11 = v20;
  id v12 = v9;

  return v12;
}

void __55__HFCameraImageManager_faceCropImagesForClip_atOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = +[HFCameraImageCache faceCropKeyForPersonName:a2];
  v4 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Requesting cached face crop using key:%@.", (uint8_t *)&v7, 0xCu);
  }

  objc_super v5 = [*(id *)(a1 + 32) imageCache];
  id v6 = [v5 imageForKey:v3];

  if (v6) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (id)cachedPosterFrameImageForClip:(id)a3 offset:(double)a4 requestor:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a3;
  [(HFCameraImageManager *)self _timeScaleAdjustedOffset:a4];
  double v11 = v10;
  id v12 = [v9 uniqueIdentifier];

  v13 = [v12 UUIDString];
  *(float *)&double v14 = v11;
  uint64_t v15 = +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:v13 withOffset:v14];

  uint64_t v16 = [(HFCameraImageManager *)self imageCache];
  __int16 v17 = [v16 imageForKey:v15];

  double v18 = HFLogForCategory(0x15uLL);
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      int v22 = 138412546;
      __int16 v23 = v15;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Poster Frame hit for key:%@ requester:%@", (uint8_t *)&v22, 0x16u);
    }

    id v20 = v17;
  }
  else
  {
    if (v19)
    {
      int v22 = 138412546;
      __int16 v23 = v15;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Poster Frame miss for key:%@ requestor:%@", (uint8_t *)&v22, 0x16u);
    }
  }
  return v17;
}

- (id)representativeImageForClip:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [(HFCameraImageManager *)self heroFrameImageForClip:v4];
  if (v5)
  {
    id v6 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [v4 uniqueIdentifier];
      id v8 = [v7 UUIDString];
      int v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Image cache hit for representative image (Hero frame) for UUID:%@.", (uint8_t *)&v12, 0xCu);
    }
    id v9 = v5;
  }
  else
  {
    id v9 = [(HFCameraImageManager *)self firstPosterFrameImageForClip:v4];
  }
  double v10 = v9;

  return v10;
}

- (id)firstPosterFrameImageForClip:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = [a3 uniqueIdentifier];
  objc_super v5 = [v4 UUIDString];
  id v6 = +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:v5 withOffset:0.0];

  int v7 = [(HFCameraImageManager *)self imageCache];
  id v8 = [v7 imageForKey:v6];

  id v9 = HFLogForCategory(0x15uLL);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      int v13 = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Image cache hit for first poster frame image for key:%@.", (uint8_t *)&v13, 0xCu);
    }

    id v11 = v8;
  }
  else
  {
    if (v10)
    {
      int v13 = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Image cache miss for first poster frame image for key:%@.", (uint8_t *)&v13, 0xCu);
    }
  }
  return v8;
}

- (id)imageObserversForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HFCameraImageManager *)self imageObservers];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v6 = [MEMORY[0x263EFF9C0] set];
    int v7 = [(HFCameraImageManager *)self imageObservers];
    [v7 setObject:v6 forKey:v4];
  }
  return v6;
}

- (void)addFaceCropImageObserver:(id)a3 forClip:(id)a4 usingSignificantEvent:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 faceClassification];
  int v12 = [v11 person];
  int v13 = [v12 name];
  uint64_t v14 = +[HFCameraImageCache faceCropKeyForPersonName:v13];

  uint64_t v15 = [(HFCameraImageManager *)self imageCache];
  uint64_t v16 = [v15 imageForKey:v14];

  if (!v16)
  {
    double v18 = [(HFCameraImageManager *)self imageObserversForKey:v14];
    BOOL v19 = [(HFCameraImageManager *)self requestedFaceCropCache];
    id v20 = [v19 objectForKeyedSubscript:v14];

    if (v20)
    {
      if ([v20 integerValue] == 1)
      {
        v21 = HFLogForCategory(0x15uLL);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v42 = v8;
          __int16 v43 = 2112;
          id v44 = v14;
          _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Face crop request is pending. Adding observer:%@ for key:%@", buf, 0x16u);
        }

        [v18 addObject:v8];
        goto LABEL_20;
      }
      if ([v20 integerValue] == 3)
      {
        __int16 v24 = HFLogForCategory(0x15uLL);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v42 = v14;
          __int16 v43 = 2112;
          id v44 = v8;
          _os_log_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEFAULT, "Face crop request failed for key:%@. Unable to add observer:%@", buf, 0x16u);
        }

        id v25 = v8;
        if (objc_opt_respondsToSelector())
        {
          v29 = [v10 faceClassification];
          v28 = [v29 person];
          uint64_t v26 = [v28 name];
          [v25 manager:self failedToFindFaceCropForPersonName:v26];
        }
        goto LABEL_20;
      }
    }
    else
    {
      int v22 = [(HFCameraImageManager *)self requestedFaceCropCache];
      [v22 setObject:&unk_26C0F5E20 forKeyedSubscript:v14];

      __int16 v23 = HFLogForCategory(0x15uLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v42 = v8;
        __int16 v43 = 2112;
        id v44 = v14;
        _os_log_impl(&dword_20B986000, v23, OS_LOG_TYPE_DEFAULT, "Face crop request initiated. Adding observer:%@ for key:%@", buf, 0x16u);
      }

      [v18 addObject:v8];
    }
    v27 = dispatch_get_global_queue(0, 0);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_15;
    v30[3] = &unk_26408D360;
    v30[4] = self;
    id v31 = v10;
    id v32 = v9;
    id v33 = v14;
    id v34 = v18;
    dispatch_async(v27, v30);

LABEL_20:
    goto LABEL_21;
  }
  __int16 v17 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v14;
    _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Found face crop in cache for key:%@.", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke;
  block[3] = &unk_26408D360;
  id v36 = v8;
  v37 = self;
  id v38 = v16;
  id v39 = v9;
  id v40 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);

  double v18 = v36;
LABEL_21:
}

void __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = [*(id *)(a1 + 64) faceClassification];
  objc_super v5 = [v7 person];
  id v6 = [v5 name];
  [v1 manager:v2 didFindFaceCrop:v3 forClip:v4 usingPersonName:v6];
}

void __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_15(id *a1)
{
  uint64_t v2 = [a1[4] cameraProfile];
  uint64_t v3 = [v2 accessory];
  uint64_t v4 = [v3 home];

  objc_super v5 = [a1[5] faceClassification];
  id v6 = [v5 personManagerUUID];

  id v7 = [v4 personManagerWithUUID:v6];
  objc_initWeak(&location, a1[4]);
  id v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = [a1[5] faceClassification];
  id v10 = [v9 person];
  id v11 = [v10 UUID];
  int v12 = [v8 setWithObject:v11];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_2;
  v13[3] = &unk_26408D400;
  objc_copyWeak(&v18, &location);
  id v14 = a1[6];
  id v15 = a1[7];
  id v16 = a1[8];
  id v17 = a1[5];
  [v7 fetchFaceCropsForPersonsWithUUIDs:v12 completion:v13];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (v6)
  {
    id v8 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v17 = a1[4];
      *(_DWORD *)buf = 138412546;
      id v33 = v17;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Unable to add face crop for key:%@ - error:%@", buf, 0x16u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_17;
    block[3] = &unk_26408D388;
    void block[4] = WeakRetained;
    id v30 = a1[4];
    id v31 = a1[5];
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v9 = [v5 allObjects];
    id v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_21];

    id v11 = [v10 firstObject];
    int v12 = v11;
    if (v11)
    {
      int v13 = [v11 dataRepresentation];
      id v14 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v13];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_2_25;
      v19[3] = &unk_26408D3D8;
      id v20 = v14;
      id v21 = a1[5];
      id v22 = WeakRetained;
      id v23 = a1[6];
      id v24 = a1[4];
      id v25 = a1[7];
      id v15 = v14;
      dispatch_async(MEMORY[0x263EF83A0], v19);
    }
    else
    {
      id v16 = HFLogForCategory(0x15uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v18 = a1[4];
        *(_DWORD *)buf = 138412546;
        id v33 = v18;
        __int16 v34 = 2112;
        id v35 = 0;
        _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Unable to add face crop for key:%@ - error:%@", buf, 0x16u);
      }

      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_23;
      v26[3] = &unk_26408D388;
      v26[4] = WeakRetained;
      id v27 = a1[4];
      id v28 = a1[5];
      dispatch_async(MEMORY[0x263EF83A0], v26);
    }
  }
}

uint64_t __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_17(uint64_t a1)
{
  return [*(id *)(a1 + 32) failedToFindFaceCropForClip:*(void *)(a1 + 40) withKey:*(void *)(a1 + 48)];
}

uint64_t __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_2_18(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (!v7) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v7;
  if (!v8)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    id v11 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v10 handleFailureInFunction:v11, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];

LABEL_7:
    id v9 = 0;
  }

  uint64_t v12 = objc_opt_class();
  id v13 = v5;
  if (!v13)
  {
LABEL_14:
    id v15 = 0;
    goto LABEL_15;
  }
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v13;
  if (!v14)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    id v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v12, objc_opt_class() file lineNumber description];

    goto LABEL_14;
  }
LABEL_15:

  id v18 = [v9 dateCreated];
  BOOL v19 = [v15 dateCreated];
  uint64_t v20 = [v18 compare:v19];

  return v20;
}

uint64_t __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_23(uint64_t a1)
{
  return [*(id *)(a1 + 32) failedToFindFaceCropForClip:*(void *)(a1 + 40) withKey:*(void *)(a1 + 48)];
}

void __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_2_25(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = HFLogForCategory(0x15uLL);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v5;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Caching face crop for key:%@ and notifying observers.", buf, 0xCu);
    }

    uint64_t v6 = [*(id *)(a1 + 48) imageCache];
    [v6 addImage:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

    id v7 = [*(id *)(a1 + 48) requestedFaceCropCache];
    [v7 setObject:&unk_26C0F5E38 forKeyedSubscript:*(void *)(a1 + 40)];

    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_28;
    v10[3] = &unk_26408D3B0;
    id v8 = *(void **)(a1 + 56);
    v10[4] = *(void *)(a1 + 48);
    id v11 = *(id *)(a1 + 32);
    id v12 = *(id *)(a1 + 64);
    id v13 = *(id *)(a1 + 72);
    [v8 enumerateObjectsUsingBlock:v10];
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failure to generate image for face crop for key:%@.", buf, 0xCu);
    }

    [*(id *)(a1 + 48) failedToFindFaceCropForClip:*(void *)(a1 + 64) withKey:*(void *)(a1 + 40)];
  }
}

void __79__HFCameraImageManager_addFaceCropImageObserver_forClip_usingSignificantEvent___block_invoke_28(void *a1, void *a2)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = (void *)a1[7];
  id v6 = a2;
  id v9 = [v5 faceClassification];
  id v7 = [v9 person];
  id v8 = [v7 name];
  [v6 manager:v2 didFindFaceCrop:v3 forClip:v4 usingPersonName:v8];
}

- (void)failedToFindFaceCropForClip:(id)a3 withKey:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__HFCameraImageManager_failedToFindFaceCropForClip_withKey___block_invoke;
  v7[3] = &unk_26408D450;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __60__HFCameraImageManager_failedToFindFaceCropForClip_withKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) requestedFaceCropCache];
  [v2 setObject:&unk_26C0F5E50 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) imageObserversForKey:*(void *)(a1 + 40)];
  uint64_t v4 = +[HFCameraImageCache personNameForFaceCropKey:*(void *)(a1 + 40)];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __60__HFCameraImageManager_failedToFindFaceCropForClip_withKey___block_invoke_33;
  id v10 = &unk_26408D428;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:&v7];
  objc_msgSend(v3, "removeAllObjects", v7, v8, v9, v10, v11);
  id v6 = [*(id *)(a1 + 32) imageObservers];
  [v6 removeObjectForKey:*(void *)(a1 + 40)];
}

void __60__HFCameraImageManager_failedToFindFaceCropForClip_withKey___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 manager:*(void *)(a1 + 32) failedToFindFaceCropForPersonName:*(void *)(a1 + 40)];
  }
}

- (void)removeFaceCropImageObserver:(id)a3 forPersonName:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = +[HFCameraImageCache faceCropKeyForPersonName:a4];
  uint64_t v8 = [(HFCameraImageManager *)self imageObservers];
  id v9 = [v8 valueForKey:v7];

  if (v9)
  {
    id v10 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Remove face crop observer:%@ for key:%@.", (uint8_t *)&v13, 0x16u);
    }

    [v9 removeObject:v6];
  }
  if (![v9 count])
  {
    uint64_t v11 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "All face crop observers have been removed for key:%@.", (uint8_t *)&v13, 0xCu);
    }

    id v12 = [(HFCameraImageManager *)self imageObservers];
    [v12 removeObjectForKey:v7];
  }
}

- (void)addHeroFrameImageObserver:(id)a3 forClip:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!+[HFCameraUtilities shouldDisableHeroFrameDownloads])
  {
    if (!v7)
    {
      id v21 = HFLogForCategory(0x15uLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B986000, v21, OS_LOG_TYPE_ERROR, "Hero frame can't be located for missing clip.", buf, 2u);
      }

      id v10 = v6;
      uint64_t v11 = self;
      id v12 = 0;
      goto LABEL_13;
    }
    int v13 = [v7 uniqueIdentifier];
    id v14 = [v13 UUIDString];
    __int16 v15 = +[HFCameraImageCache heroFrameKeyForCameraClipIdentifierString:v14];

    uint64_t v16 = [(HFCameraImageManager *)self imageCache];
    uint64_t v17 = [v16 imageForKey:v15];

    id v18 = HFLogForCategory(0x15uLL);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v15;
        _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Found hero frame in cache for key:%@.", buf, 0xCu);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke;
      block[3] = &unk_26408D478;
      id v38 = v6;
      id v39 = self;
      id v40 = v17;
      id v41 = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);

      uint64_t v20 = v38;
      goto LABEL_30;
    }
    if (v19)
    {
      id v22 = [(HFCameraImageManager *)self cameraProfile];
      *(_DWORD *)buf = 138412802;
      id v43 = v6;
      __int16 v44 = 2112;
      id v45 = v15;
      __int16 v46 = 2112;
      v47 = v22;
      _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Adding observer:%@ for hero frame key:%@ with profile:%@", buf, 0x20u);
    }
    uint64_t v20 = [(HFCameraImageManager *)self imageObserversForKey:v15];
    id v23 = [(HFCameraImageManager *)self requestedHeroFrameCache];
    id v24 = [v23 objectForKeyedSubscript:v15];

    if (v24)
    {
      if ([v24 integerValue] == 1)
      {
        id v25 = HFLogForCategory(0x15uLL);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v43 = v6;
          __int16 v44 = 2112;
          id v45 = v15;
          _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEFAULT, "Hero frame request is pending. Adding observer:%@ for key:%@", buf, 0x16u);
        }

        [v20 addObject:v6];
        goto LABEL_29;
      }
      if ([v24 integerValue] == 3)
      {
        id v28 = HFLogForCategory(0x15uLL);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v43 = v15;
          __int16 v44 = 2112;
          id v45 = v6;
          _os_log_impl(&dword_20B986000, v28, OS_LOG_TYPE_DEFAULT, "Hero frame request failed for key:%@. Unable to add observer:%@", buf, 0x16u);
        }

        [v6 manager:self failedToFindHeroFrameforClip:v7];
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v26 = HFLogForCategory(0x15uLL);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v43 = v6;
        __int16 v44 = 2112;
        id v45 = v15;
        _os_log_impl(&dword_20B986000, v26, OS_LOG_TYPE_DEFAULT, "Hero frame request initiated. Adding observer:%@ for key:%@", buf, 0x16u);
      }

      id v27 = [(HFCameraImageManager *)self requestedHeroFrameCache];
      [v27 setObject:&unk_26C0F5E20 forKeyedSubscript:v15];

      [v20 addObject:v6];
    }
    v29 = [(HFCameraImageManager *)self cameraProfile];
    id v30 = [v29 clipManager];
    id v31 = [v7 uniqueIdentifier];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_36;
    v32[3] = &unk_26408D4C8;
    id v33 = v15;
    __int16 v34 = self;
    id v35 = v7;
    id v36 = v20;
    [v30 fetchHeroFrameDataRepresentationForClipWithUUID:v31 completion:v32];

LABEL_29:
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v8 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 uniqueIdentifier];
    *(_DWORD *)buf = 138412290;
    id v43 = v9;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Hero frame downloads disabled for clip:%@.", buf, 0xCu);
  }
  id v10 = v6;
  uint64_t v11 = self;
  id v12 = v7;
LABEL_13:
  [v10 manager:v11 failedToFindHeroFrameforClip:v12];
LABEL_31:
}

uint64_t __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) manager:*(void *)(a1 + 40) didFindHeroFrame:*(void *)(a1 + 48) forClip:*(void *)(a1 + 56)];
}

void __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v24 = v15;
      __int16 v25 = 2112;
      id v26 = v5;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Unable to add hero frame for key:%@ - data:%@ error:%@", buf, 0x20u);
    }

    [*(id *)(a1 + 40) failToFindHeroFrameForClip:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v5];
    id v9 = HFLogForCategory(0x15uLL);
    id v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v11;
        __int16 v25 = 2112;
        id v26 = v12;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Caching hero frame for key:%@ and notifying observers:%@.", buf, 0x16u);
      }

      int v13 = [*(id *)(a1 + 40) imageCache];
      [v13 addImage:v8 forKey:*(void *)(a1 + 32)];

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_37;
      block[3] = &unk_26408D360;
      int8x16_t v17 = *(int8x16_t *)(a1 + 32);
      id v14 = (id)v17.i64[0];
      int8x16_t v19 = vextq_s8(v17, v17, 8uLL);
      id v20 = *(id *)(a1 + 56);
      id v21 = v8;
      id v22 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        uint64_t v24 = v16;
        __int16 v25 = 2112;
        id v26 = v5;
        __int16 v27 = 2112;
        id v28 = 0;
        _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "Failure to generate image for hero frame for key:%@ - data:%@ error:%@", buf, 0x20u);
      }

      [*(id *)(a1 + 40) failToFindHeroFrameForClip:*(void *)(a1 + 48)];
    }
  }
}

void __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_37(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) requestedHeroFrameCache];
  [v2 setObject:&unk_26C0F5E38 forKeyedSubscript:*(void *)(a1 + 40)];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_2;
  v5[3] = &unk_26408D4A0;
  v5[4] = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  [v3 enumerateObjectsUsingBlock:v5];
  [*(id *)(a1 + 48) removeAllObjects];
  uint64_t v4 = [*(id *)(a1 + 32) imageObservers];
  [v4 removeObjectForKey:*(void *)(a1 + 40)];
}

uint64_t __58__HFCameraImageManager_addHeroFrameImageObserver_forClip___block_invoke_2(void *a1, void *a2)
{
  return [a2 manager:a1[4] didFindHeroFrame:a1[5] forClip:a1[6]];
}

- (void)failToFindHeroFrameForClip:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__HFCameraImageManager_failToFindHeroFrameForClip___block_invoke;
  v6[3] = &unk_26408D450;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __51__HFCameraImageManager_failToFindHeroFrameForClip___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v3 = [v2 UUIDString];
  id v4 = +[HFCameraImageCache heroFrameKeyForCameraClipIdentifierString:v3];

  id v5 = [*(id *)(a1 + 40) requestedHeroFrameCache];
  [v5 setObject:&unk_26C0F5E50 forKeyedSubscript:v4];

  id v6 = [*(id *)(a1 + 40) imageObserversForKey:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__HFCameraImageManager_failToFindHeroFrameForClip___block_invoke_2;
  v10[3] = &unk_26408D428;
  int8x16_t v9 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  [v6 enumerateObjectsUsingBlock:v10];
  [v6 removeAllObjects];
  uint64_t v8 = [*(id *)(a1 + 40) imageObservers];
  [v8 removeObjectForKey:v4];
}

void __51__HFCameraImageManager_failToFindHeroFrameForClip___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 manager:*(void *)(a1 + 32) failedToFindHeroFrameforClip:*(void *)(a1 + 40)];
  }
}

- (void)removeHeroFrameImageObserver:(id)a3 forClip:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [a4 uniqueIdentifier];
  uint64_t v8 = [v7 UUIDString];
  int8x16_t v9 = +[HFCameraImageCache heroFrameKeyForCameraClipIdentifierString:v8];

  id v10 = [(HFCameraImageManager *)self imageObservers];
  int8x16_t v11 = [v10 valueForKey:v9];

  id v12 = HFLogForCategory(0x15uLL);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      int8x16_t v19 = v9;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Remove hero frame observer:%@ for key:%@.", (uint8_t *)&v16, 0x16u);
    }

    [v11 removeObject:v6];
  }
  else
  {
    if (v13)
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      int8x16_t v19 = v9;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Already removed hero frame observer:%@ for key:%@.", (uint8_t *)&v16, 0x16u);
    }
  }
  if (![v11 count])
  {
    id v14 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "All hero frame observers have been removed for key:%@.", (uint8_t *)&v16, 0xCu);
    }

    uint64_t v15 = [(HFCameraImageManager *)self imageObservers];
    [v15 removeObjectForKey:v9];
  }
}

- (HFCameraPosterFrameProvider)cameraPosterFrameProvider
{
  cameraPosterFrameProvider = self->_cameraPosterFrameProvider;
  if (!cameraPosterFrameProvider)
  {
    id v4 = [HFCameraPosterFrameProvider alloc];
    id v5 = [(HFCameraImageManager *)self imageCache];
    id v6 = +[HFCameraTimelapseClipManager sharedManager];
    id v7 = [(HFCameraPosterFrameProvider *)v4 initWithImageCache:v5 andTimelapseClipInfoProvider:v6];
    uint64_t v8 = self->_cameraPosterFrameProvider;
    self->_cameraPosterFrameProvider = v7;

    cameraPosterFrameProvider = self->_cameraPosterFrameProvider;
  }
  return cameraPosterFrameProvider;
}

- (void)getPosterFrameImage:(id)a3 forClip:(id)a4 atOffset:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(HFCameraImageManager *)self cameraPosterFrameProvider];
  [v10 getPosterFrameForDelegate:v9 forHighQualityClip:v8 atOffset:a5];
}

- (void)addPosterFrameImageObserver:(id)a3 forClip:(id)a4 atOffset:(double)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 uniqueIdentifier];
  int8x16_t v11 = [v10 UUIDString];
  *(float *)&double v12 = a5;
  BOOL v13 = +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:v11 withOffset:v12];

  id v14 = [(HFCameraImageManager *)self imageCache];
  uint64_t v15 = [v14 imageForKey:v13];

  if (v15)
  {
    int v16 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218498;
      double v19 = a5;
      __int16 v20 = 2112;
      id v21 = v13;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Found image in cache at offset:%.0f from key:%@ observer:%@", (uint8_t *)&v18, 0x20u);
    }

    id v17 = v8;
    if (objc_opt_respondsToSelector()) {
      [v17 manager:self didFindImage:v15 atTimeOffset:v9 forClip:a5];
    }
  }
  else
  {
    [(HFCameraImageManager *)self generatePosterFrameImageForClip:v9 atOffset:v8 observer:a5];
  }
}

- (void)removePosterFrameImageObserver:(id)a3 forClip:(id)a4 atOffset:(double)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HFCameraImageManager *)self keyForClip:v9 timeOffset:a5];
  int8x16_t v11 = [(HFCameraImageManager *)self imageObservers];
  double v12 = [v11 valueForKey:v10];

  if (v12)
  {
    BOOL v13 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v9 uniqueIdentifier];
      uint64_t v15 = [v14 UUIDString];
      int v20 = 138412802;
      id v21 = v8;
      __int16 v22 = 2112;
      double v23 = *(double *)&v15;
      __int16 v24 = 2048;
      double v25 = a5;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Remove observer:%@ for clip:%@ at offset:%.0f", (uint8_t *)&v20, 0x20u);
    }
    [v12 removeObject:v8];
  }
  if (![v12 count])
  {
    int v16 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v9 uniqueIdentifier];
      int v18 = [v17 UUIDString];
      int v20 = 138412546;
      id v21 = v18;
      __int16 v22 = 2048;
      double v23 = a5;
      _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "All observers have been removed for clip:%@ at offset:%.0f", (uint8_t *)&v20, 0x16u);
    }
    double v19 = [(HFCameraImageManager *)self imageObservers];
    [v19 removeObjectForKey:v10];
  }
}

- (void)addDemoPosterFrameImageObserver:(id)a3 forClip:(id)a4 atOffset:(double)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HFCameraImageManager *)self cachedPosterFrameImageForClip:v9 offset:self requestor:a5];
  if (v10)
  {
    id v11 = v8;
    if (objc_opt_respondsToSelector()) {
      [v11 manager:self didFindImage:v10 atTimeOffset:v9 forClip:a5];
    }
  }
  else
  {
    double v12 = HFLogForCategory(0x21uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [v9 uniqueIdentifier];
      int v17 = 138412546;
      int v18 = v13;
      __int16 v19 = 1024;
      int v20 = 1;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Requesting addition to generation observers for clip:%@ for count:%d.", (uint8_t *)&v17, 0x12u);
    }
    [(HFCameraImageManager *)self _timeScaleAdjustedOffset:a5];
    -[HFCameraImageManager keyForClip:timeOffset:](self, "keyForClip:timeOffset:", v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = [(HFCameraImageManager *)self generationObservers];
    id v15 = [v14 objectForKey:v11];

    if (!v15)
    {
      id v15 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      int v16 = [(HFCameraImageManager *)self generationObservers];
      [v16 setObject:v15 forKey:v11];
    }
    [v15 addObject:v8];
  }
}

- (void)generateImageUsingAsset:(id)a3 clip:(id)a4 offset:(double)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x263EFA4B0] assetImageGeneratorWithAsset:v8];
  CMTimeMake(&v23, 1, 1);
  CMTime v22 = v23;
  [v10 setRequestedTimeToleranceBefore:&v22];
  CMTimeMake(&v21, 1, 1);
  CMTime v20 = v21;
  [v10 setRequestedTimeToleranceAfter:&v20];
  [(HFCameraImageManager *)self posterFrameSize];
  objc_msgSend(v10, "setMaximumSize:");
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  memset(&v19, 0, sizeof(v19));
  CMTimeMakeWithSeconds(&v19, a5, 1);
  CMTime buf = v19;
  double v12 = [MEMORY[0x263F08D40] valueWithCMTime:&buf];
  [v11 addObject:v12];
  BOOL v13 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v9 uniqueIdentifier];
    LODWORD(buf.value) = 138412802;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v14;
    LOWORD(buf.flags) = 2112;
    *(void *)((char *)&buf.flags + 2) = v11;
    HIWORD(buf.epoch) = 2112;
    id v25 = v8;
    _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Generating 1 image for key:%@ with timeValues:%@ using asset:%@.", (uint8_t *)&buf, 0x20u);
  }
  objc_initWeak((id *)&buf, self);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke;
  v16[3] = &unk_26408D540;
  objc_copyWeak(v18, (id *)&buf);
  v18[1] = *(id *)&a5;
  id v15 = v9;
  id v17 = v15;
  [v10 generateCGImagesAsynchronouslyForTimes:v11 completionHandler:v16];

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)&buf);
}

void __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke(uint64_t a1, CMTime *a2, uint64_t a3, CMTime *a4, uint64_t a5, void *a6)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a5)
  {
    BOOL v13 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMTime time = *a2;
      Float64 Seconds = CMTimeGetSeconds(&time);
      CMTime time = *a4;
      Float64 v25 = CMTimeGetSeconds(&time);
      LODWORD(time.value) = 134218754;
      *(Float64 *)((char *)&time.value + 4) = Seconds;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = v25;
      HIWORD(time.epoch) = 2048;
      uint64_t v33 = a5;
      __int16 v34 = 2112;
      id v35 = v11;
      _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Failure to generate thumbnail with requested time:%.0f, actual time:%.0f result:%ld, error:%@", (uint8_t *)&time, 0x2Au);
    }

LABEL_5:
    id v14 = 0;
    goto LABEL_10;
  }
  if (!a3)
  {
    CMTime v23 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      CMTime time = *a2;
      Float64 v26 = CMTimeGetSeconds(&time);
      CMTime time = *a4;
      Float64 v27 = CMTimeGetSeconds(&time);
      LODWORD(time.value) = 134218754;
      *(Float64 *)((char *)&time.value + 4) = v26;
      LOWORD(time.flags) = 2048;
      *(Float64 *)((char *)&time.flags + 2) = v27;
      HIWORD(time.epoch) = 2048;
      uint64_t v33 = 0;
      __int16 v34 = 2112;
      id v35 = v11;
      _os_log_error_impl(&dword_20B986000, v23, OS_LOG_TYPE_ERROR, "Failure to generate thumbnail after file download with requested time:%.0f, actual time:%.0f result:%ld, error:%@", (uint8_t *)&time, 0x2Au);
    }

    goto LABEL_5;
  }
  id v14 = [MEMORY[0x263F1C6B0] imageWithCGImage:a3];
  id v15 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    CMTimeValue v16 = *(void *)(a1 + 48);
    CMTime time = *a4;
    Float64 v17 = CMTimeGetSeconds(&time);
    int v18 = [*(id *)(a1 + 32) uniqueIdentifier];
    CMTime v19 = [v18 UUIDString];
    uint64_t v20 = *(void *)(a1 + 48);
    LODWORD(time.value) = 134219266;
    *(CMTimeValue *)((char *)&time.value + 4) = v16;
    LOWORD(time.flags) = 2048;
    *(Float64 *)((char *)&time.flags + 2) = v17;
    HIWORD(time.epoch) = 2048;
    uint64_t v33 = 0;
    __int16 v34 = 2112;
    id v35 = v11;
    __int16 v36 = 2112;
    v37 = v19;
    __int16 v38 = 2048;
    uint64_t v39 = v20;
    _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Finished image generation with requested time:%.0f, actual time:%.0f result:%ld, error:%@, key:%@-%.0f", (uint8_t *)&time, 0x3Eu);
  }
  [WeakRetained _addPosterFrameImage:v14 forClip:*(void *)(a1 + 32) withOffset:*(double *)(a1 + 48)];
LABEL_10:
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke_47;
  v28[3] = &unk_26408D518;
  v28[4] = WeakRetained;
  id v21 = *(id *)(a1 + 32);
  uint64_t v31 = *(void *)(a1 + 48);
  id v29 = v21;
  id v30 = v14;
  id v22 = v14;
  dispatch_async(MEMORY[0x263EF83A0], v28);
}

void __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke_47(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) keyForClip:*(void *)(a1 + 40) timeOffset:*(double *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 32) generationObservers];
  id v4 = [v3 valueForKey:v2];

  if ([v4 count])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke_2;
    v9[3] = &unk_26408D4F0;
    id v10 = *(id *)(a1 + 48);
    id v5 = v2;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v11 = v5;
    uint64_t v12 = v6;
    uint64_t v14 = *(void *)(a1 + 56);
    id v13 = v7;
    [v4 enumerateObjectsUsingBlock:v9];
  }
  id v8 = [*(id *)(a1 + 32) generationObservers];
  [v8 removeObjectForKey:v2];
}

void __60__HFCameraImageManager_generateImageUsingAsset_clip_offset___block_invoke_2(double *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *((void *)a1 + 5);
    BOOL v6 = *((void *)a1 + 4) != 0;
    v10[0] = 67109634;
    v10[1] = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Image generation completed:%{BOOL}d for key:%@ notifying observer %@", (uint8_t *)v10, 0x1Cu);
  }

  uint64_t v7 = *((void *)a1 + 4);
  double v8 = a1[8];
  uint64_t v9 = *((void *)a1 + 6);
  if (v7) {
    [v3 manager:v9 didGenerateImage:v7 atOffset:*((void *)a1 + 7) forClip:v8];
  }
  else {
    [v3 manager:v9 failedToGenerateImageAtOffset:*((void *)a1 + 7) forClip:v8];
  }
}

- (void)setVideoSize:(CGSize)a3
{
  if (self->_videoSize.width >= 1.0 && self->_videoSize.height >= 1.0) {
    self->_videoSize = a3;
  }
  else {
    self->_videoSize = (CGSize)xmmword_20BD13530;
  }
  [(HFCameraImageManager *)self videoSize];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(HFCameraImageManager *)self cameraPosterFrameProvider];
  objc_msgSend(v8, "setPosterFrameSize:", v5, v7);
}

- (void)generatePosterFrameImageForClip:(id)a3 atOffset:(double)a4 observer:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = a5;
  if (v8
    && ([(HFCameraImageManager *)self cameraProfile],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 clipManager],
        __int16 v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        v11))
  {
    uint64_t v12 = [(HFCameraImageManager *)self keyForClip:v8 timeOffset:a4];
    __int16 v13 = [(HFCameraImageManager *)self generationObservers];
    id v14 = [v13 objectForKey:v12];

    uint64_t v15 = HFLogForCategory(0x15uLL);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)CMTime buf = 138412546;
        id v35 = v12;
        __int16 v36 = 2112;
        v37 = v9;
        _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Image generation previously requested for key:%@. Adding observer:%@.", buf, 0x16u);
      }

      [v14 addObject:v9];
    }
    else
    {
      if (v16)
      {
        *(_DWORD *)CMTime buf = 138412546;
        id v35 = v12;
        __int16 v36 = 2112;
        v37 = v9;
        _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Image generation requested for key:%@. Adding observer:%@.", buf, 0x16u);
      }

      id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [v14 addObject:v9];
      CMTime v19 = [(HFCameraImageManager *)self generationObservers];
      [v19 setObject:v14 forKey:v12];

      uint64_t v20 = +[HFCameraTimelapseClipManager sharedManager];
      id v21 = [v8 startDate];
      id v22 = [v20 timelapseClipPositionForDate:v21 inHighQualityClip:v8];

      CMTime v23 = [v22 clip];

      if (v23)
      {
        __int16 v24 = [(HFCameraImageManager *)self offsetsForFile];
        Float64 v25 = [v24 objectForKeyedSubscript:v12];

        if (!v25)
        {
          Float64 v25 = [MEMORY[0x263EFF9C0] set];
          Float64 v26 = [(HFCameraImageManager *)self offsetsForFile];
          [v26 setObject:v25 forKeyedSubscript:v12];
        }
        Float64 v27 = [NSNumber numberWithDouble:a4];
        [v25 addObject:v27];
        id v28 = +[HFCameraTimelapseVideoProvider sharedProvider];
        id v29 = [v22 clip];
        [v28 getVideoForTimelapseClip:v29 taskType:0 delegate:self];
      }
      else
      {
        id v30 = HFLogForCategory(0x15uLL);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 138412802;
          id v35 = v22;
          __int16 v36 = 2112;
          v37 = v12;
          __int16 v38 = 2112;
          uint64_t v39 = v9;
          _os_log_impl(&dword_20B986000, v30, OS_LOG_TYPE_DEFAULT, "Missing timelapse clip. Don't generate image for clipPosition:%@ request using key:%@ for observer:%@", buf, 0x20u);
        }

        if ([v14 count])
        {
          v31[0] = MEMORY[0x263EF8330];
          v31[1] = 3221225472;
          v31[2] = __74__HFCameraImageManager_generatePosterFrameImageForClip_atOffset_observer___block_invoke;
          v31[3] = &unk_26408D568;
          v31[4] = self;
          double v33 = a4;
          id v32 = v8;
          [v14 enumerateObjectsUsingBlock:v31];
        }
        Float64 v25 = [(HFCameraImageManager *)self generationObservers];
        [v25 removeObjectForKey:v12];
      }
    }
  }
  else
  {
    uint64_t v12 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      Float64 v17 = [(HFCameraImageManager *)self cameraProfile];
      int v18 = [v17 clipManager];
      *(_DWORD *)CMTime buf = 138412546;
      id v35 = v8;
      __int16 v36 = 2112;
      v37 = v18;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "Unable to generate missing poster frame for invalid clip/clipManager parameters: (%@,%@).", buf, 0x16u);
    }
  }
}

uint64_t __74__HFCameraImageManager_generatePosterFrameImageForClip_atOffset_observer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 manager:*(void *)(a1 + 32) failedToGenerateImageAtOffset:*(void *)(a1 + 40) forClip:*(double *)(a1 + 48)];
}

- (double)_timeScaleAdjustedOffset:(double)a3
{
  double v3 = round(a3 * 0.5);
  return (double)(int)(v3 + v3);
}

- (id)keyForClip:(id)a3 timeOffset:(double)a4
{
  double v5 = NSString;
  double v6 = [a3 uniqueIdentifier];
  double v7 = [v6 UUIDString];
  id v8 = [v5 stringWithFormat:@"%@-%.0f", v7, *(void *)&a4];

  return v8;
}

- (id)keyForClip:(id)a3
{
  double v3 = [a3 uniqueIdentifier];
  double v4 = [v3 UUIDString];

  return v4;
}

+ (void)purgeVideoFiles
{
  id v3 = +[HFCameraUtilities videoCachesDirectoryURL];
  [a1 purgeVideoFilesAtURL:v3 completionHandler:0];
}

+ (void)purgeVideoFilesAtURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = dispatch_get_global_queue(-32768, 0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _DWORD v10[2] = __63__HFCameraImageManager_purgeVideoFilesAtURL_completionHandler___block_invoke;
  v10[3] = &unk_26408D5B0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __63__HFCameraImageManager_purgeVideoFilesAtURL_completionHandler___block_invoke(uint64_t a1)
{
  v36[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = *MEMORY[0x263EFF6F0];
  v36[0] = *MEMORY[0x263EFF610];
  v36[1] = v3;
  uint64_t v21 = v3;
  double v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  uint64_t v19 = a1;
  uint64_t v20 = v2;
  [v2 enumeratorAtURL:*(void *)(a1 + 32) includingPropertiesForKeys:v4 options:22 errorHandler:&__block_literal_global_58];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v24 = 0;
        id v10 = [v9 resourceValuesForKeys:v4 error:&v24];
        id v11 = v24;
        if (![v10 count])
        {
          id v12 = HFLogForCategory(0x15uLL);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)CMTime buf = 136315650;
            id v30 = "+[HFCameraImageManager purgeVideoFilesAtURL:completionHandler:]_block_invoke";
            __int16 v31 = 2112;
            id v32 = v4;
            __int16 v33 = 2112;
            id v34 = v11;
            _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "%s: missing resource values for keys: %@; error: %@",
              buf,
              0x20u);
          }
          goto LABEL_19;
        }
        if (!+[HFUtilities isInternalTest]
          && (+[HFCameraUtilities shouldPurgeVideoFileCache](HFCameraUtilities, "shouldPurgeVideoFileCache")|| +[HFCameraUtilities disableFullQualityVideoCaching](HFCameraUtilities, "disableFullQualityVideoCaching"))|| +[HFCameraUtilities compareCreationDateOfFileAtURL:v9 toDaysFromNow:-10] == -1)
        {
          id v12 = [v10 objectForKeyedSubscript:v21];
          if ([v12 BOOLValue])
          {
            BOOL v13 = +[HFCameraUtilities isMP4FileAtURL:v9];

            if (!v13) {
              goto LABEL_22;
            }
            id v23 = v11;
            char v14 = [v20 removeItemAtURL:v9 error:&v23];
            id v15 = v23;

            if ((v14 & 1) == 0)
            {
              id v12 = HFLogForCategory(0x15uLL);
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                BOOL v16 = [v9 path];
                *(_DWORD *)CMTime buf = 136315650;
                id v30 = "+[HFCameraImageManager purgeVideoFilesAtURL:completionHandler:]_block_invoke";
                __int16 v31 = 2112;
                id v32 = v15;
                __int16 v33 = 2112;
                id v34 = v16;
                _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "%s: %@; %@", buf, 0x20u);
              }
LABEL_20:
            }
            id v11 = v15;
            goto LABEL_22;
          }
LABEL_19:
          id v15 = v11;
          goto LABEL_20;
        }
LABEL_22:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v6);
  }
  Float64 v17 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CMTime buf = 0;
    _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Purged cached video files.", buf, 2u);
  }

  uint64_t v18 = *(void *)(v19 + 40);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
}

uint64_t __63__HFCameraImageManager_purgeVideoFilesAtURL_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v8 = [v4 path];
    int v9 = 136315650;
    id v10 = "+[HFCameraImageManager purgeVideoFilesAtURL:completionHandler:]_block_invoke_2";
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    char v14 = v8;
    _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "%s: %@; %@", (uint8_t *)&v9, 0x20u);
  }
  return 1;
}

- (void)purgePosterFrames
{
  uint64_t v3 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Purged poster frames from image cache.", v5, 2u);
  }

  id v4 = [(HFCameraImageManager *)self imageCache];
  [v4 purgeAllImages];
}

- (void)_addPosterFrameImage:(id)a3 forClip:(id)a4 withOffset:(double)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = a4;
  id v10 = v9;
  if (v8)
  {
    __int16 v11 = [v9 uniqueIdentifier];
    id v12 = [v11 UUIDString];
    *(float *)&double v13 = a5;
    char v14 = +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:v12 withOffset:v13];

    uint64_t v15 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      uint64_t v18 = v14;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Adding poster frame image for key:%@", (uint8_t *)&v17, 0xCu);
    }

    BOOL v16 = [(HFCameraImageManager *)self imageCache];
    [v16 addImage:v8 forKey:v14];
  }
  else
  {
    char v14 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      uint64_t v18 = v10;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Poster frames already generated for clip:%@", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)executionEnvironmentDidEnterBackground:(id)a3
{
  id v4 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Purging the image cache since we're being backgrounded", v6, 2u);
  }

  id v5 = [(HFCameraImageManager *)self imageCache];
  [v5 purgeAllImages];
}

- (void)generateDemoPosterFramesForAsset:(id)a3 forClip:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ([(HFCameraImageManager *)self cameraProfile],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 clipManager],
        int v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    id v10 = [MEMORY[0x263EFA4B0] assetImageGeneratorWithAsset:v6];
    long long v35 = *MEMORY[0x263F010E0];
    long long v25 = v35;
    uint64_t v36 = *(void *)(MEMORY[0x263F010E0] + 16);
    uint64_t v11 = v36;
    [v10 setRequestedTimeToleranceBefore:&v35];
    long long v33 = v25;
    uint64_t v34 = v11;
    [v10 setRequestedTimeToleranceAfter:&v33];
    [(HFCameraImageManager *)self posterFrameSize];
    -[NSObject setMaximumSize:](v10, "setMaximumSize:");
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v7 duration];
    if (v13 <= 0.0)
    {
      LODWORD(v14) = 0;
    }
    else
    {
      unint64_t v14 = 0;
      double v15 = 0.0;
      do
      {
        memset(&v37, 0, sizeof(v37));
        CMTimeMakeWithSeconds(&v37, v15, 1);
        CMTime location = v37;
        BOOL v16 = [MEMORY[0x263F08D40] valueWithCMTime:&location];
        [v12 addObject:v16];

        [v7 duration];
        double v18 = v17;
        double v15 = (double)++v14;
      }
      while (v18 > (double)v14);
    }
    uint64_t v21 = HFLogForCategory(0x21uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      CMTimeValue v22 = [v12 count];
      id v23 = [v7 uniqueIdentifier];
      LODWORD(v37.value) = 134218242;
      *(CMTimeValue *)((char *)&v37.value + 4) = v22;
      LOWORD(v37.flags) = 2112;
      *(void *)((char *)&v37.flags + 2) = v23;
      _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "Started generating images (%lu) for key:%@", (uint8_t *)&v37, 0x16u);
    }
    v37.value = 0;
    *(void *)&v37.timescale = &v37;
    v37.epoch = 0x2020000000;
    int v38 = 0;
    objc_initWeak((id *)&location, self);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __65__HFCameraImageManager_generateDemoPosterFramesForAsset_forClip___block_invoke;
    v26[3] = &unk_26408D5D8;
    objc_copyWeak(&v30, (id *)&location);
    id v27 = v7;
    id v29 = &v37;
    int v31 = v14;
    id v24 = v12;
    id v28 = v24;
    [v10 generateCGImagesAsynchronouslyForTimes:v24 completionHandler:v26];

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)&location);
    _Block_object_dispose(&v37, 8);
  }
  else
  {
    id v10 = HFLogForCategory(0x21uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [(HFCameraImageManager *)self cameraProfile];
      uint64_t v20 = [v19 clipManager];
      LODWORD(v37.value) = 138412546;
      *(CMTimeValue *)((char *)&v37.value + 4) = (CMTimeValue)v7;
      LOWORD(v37.flags) = 2112;
      *(void *)((char *)&v37.flags + 2) = v20;
      _os_log_error_impl(&dword_20B986000, v10, OS_LOG_TYPE_ERROR, "Invalid demo mode configuration. Unable to generate poster frames for invalid clip:%@ clipManager:%@", (uint8_t *)&v37, 0x16u);
    }
  }
}

void __65__HFCameraImageManager_generateDemoPosterFramesForAsset_forClip___block_invoke(uint64_t a1, CMTime *a2, uint64_t a3, CMTime *a4, uint64_t a5, void *a6)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a5)
  {
    double v13 = HFLogForCategory(0x21uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CMTime v31 = *a2;
      Float64 Seconds = CMTimeGetSeconds(&v31);
      CMTime v31 = *a4;
      Float64 v15 = CMTimeGetSeconds(&v31);
      LODWORD(v31.value) = 134218754;
      *(Float64 *)((char *)&v31.value + 4) = Seconds;
      LOWORD(v31.flags) = 2048;
      *(Float64 *)((char *)&v31.flags + 2) = v15;
      HIWORD(v31.epoch) = 2048;
      double v32 = *(double *)&a5;
      __int16 v33 = 2112;
      Float64 v34 = *(double *)&v11;
      _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Failure to generate thumbnail with requested time:%.0f, actual time:%.0f result:%ld, error:%@", (uint8_t *)&v31, 0x2Au);
    }
  }
  else
  {
    double v13 = [MEMORY[0x263F1C6B0] imageWithCGImage:a3];
    if (a3)
    {
      CMTime v31 = *a2;
      double v16 = CMTimeGetSeconds(&v31);
      double v17 = HFLogForCategory(0x21uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        [v13 size];
        CMTimeValue v19 = v18;
        [v13 size];
        uint64_t v21 = v20;
        CMTime v31 = *a4;
        Float64 v22 = CMTimeGetSeconds(&v31);
        id v23 = [*(id *)(a1 + 32) uniqueIdentifier];
        id v24 = [v23 UUIDString];
        LODWORD(v31.value) = 134219522;
        *(CMTimeValue *)((char *)&v31.value + 4) = v19;
        LOWORD(v31.flags) = 2048;
        *(void *)((char *)&v31.flags + 2) = v21;
        HIWORD(v31.epoch) = 2048;
        double v32 = v16;
        __int16 v33 = 2048;
        Float64 v34 = v22;
        __int16 v35 = 2048;
        uint64_t v36 = 0;
        __int16 v37 = 2112;
        id v38 = v11;
        __int16 v39 = 2112;
        uint64_t v40 = v24;
        _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "Finished image generation with image {%.0f, %.0f}, requested time:%.0f, actual time:%.0f result:%ld, error:%@, key:%@", (uint8_t *)&v31, 0x48u);
      }
      [WeakRetained _addPosterFrameImage:v13 forClip:*(void *)(a1 + 32) withOffset:v16];
      [WeakRetained _updateDemoObserversForImage:v13 forClip:*(void *)(a1 + 32) withOffset:v16];
    }
    else
    {
      long long v25 = HFLogForCategory(0x21uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        CMTime v31 = *a2;
        Float64 v29 = CMTimeGetSeconds(&v31);
        CMTime v31 = *a4;
        Float64 v30 = CMTimeGetSeconds(&v31);
        LODWORD(v31.value) = 134218754;
        *(Float64 *)((char *)&v31.value + 4) = v29;
        LOWORD(v31.flags) = 2048;
        *(Float64 *)((char *)&v31.flags + 2) = v30;
        HIWORD(v31.epoch) = 2048;
        double v32 = 0.0;
        __int16 v33 = 2112;
        Float64 v34 = *(double *)&v11;
        _os_log_error_impl(&dword_20B986000, v25, OS_LOG_TYPE_ERROR, "Failure to generate thumbnail after generation succeeded with requested time:%.0f, actual time:%.0f result:%ld, error:%@", (uint8_t *)&v31, 0x2Au);
      }
    }
  }

  if (++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(_DWORD *)(a1 + 64))
  {
    long long v26 = HFLogForCategory(0x21uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      CMTimeValue v27 = [*(id *)(a1 + 40) count];
      id v28 = [*(id *)(a1 + 32) uniqueIdentifier];
      LODWORD(v31.value) = 134218242;
      *(CMTimeValue *)((char *)&v31.value + 4) = v27;
      LOWORD(v31.flags) = 2112;
      *(void *)((char *)&v31.flags + 2) = v28;
      _os_log_impl(&dword_20B986000, v26, OS_LOG_TYPE_DEFAULT, "Finished generating images (%lu) for key:%@", (uint8_t *)&v31, 0x16u);
    }
  }
}

- (void)_updateDemoObserversForImage:(id)a3 forClip:(id)a4 withOffset:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__HFCameraImageManager__updateDemoObserversForImage_forClip_withOffset___block_invoke;
  v12[3] = &unk_26408D518;
  v12[4] = self;
  id v13 = v9;
  double v15 = a5;
  id v14 = v8;
  id v10 = v8;
  id v11 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

void __72__HFCameraImageManager__updateDemoObserversForImage_forClip_withOffset___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) keyForClip:*(void *)(a1 + 40) timeOffset:*(double *)(a1 + 56)];
  uint64_t v3 = [*(id *)(a1 + 32) generationObservers];
  id v4 = [v3 valueForKey:v2];

  if ([v4 count])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __72__HFCameraImageManager__updateDemoObserversForImage_forClip_withOffset___block_invoke_2;
    v9[3] = &unk_26408D4F0;
    id v10 = *(id *)(a1 + 48);
    id v5 = v2;
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    id v11 = v5;
    uint64_t v12 = v6;
    uint64_t v14 = *(void *)(a1 + 56);
    id v13 = v7;
    [v4 enumerateObjectsUsingBlock:v9];
  }
  id v8 = [*(id *)(a1 + 32) generationObservers];
  [v8 removeObjectForKey:v2];
}

void __72__HFCameraImageManager__updateDemoObserversForImage_forClip_withOffset___block_invoke_2(double *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x21uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *((void *)a1 + 5);
    BOOL v6 = *((void *)a1 + 4) != 0;
    v10[0] = 67109634;
    v10[1] = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Image generation completed:%{BOOL}d for key:%@ notifying observer %@", (uint8_t *)v10, 0x1Cu);
  }

  uint64_t v7 = *((void *)a1 + 4);
  double v8 = a1[8];
  uint64_t v9 = *((void *)a1 + 6);
  if (v7) {
    [v3 manager:v9 didGenerateImage:v7 atOffset:*((void *)a1 + 7) forClip:v8];
  }
  else {
    [v3 manager:v9 failedToGenerateImageAtOffset:*((void *)a1 + 7) forClip:v8];
  }
}

+ (id)clipIdentifierStringFromDate:(id)a3
{
  uint64_t v3 = qword_26AB2EC08;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_26AB2EC08, &__block_literal_global_61);
  }
  uint64_t v5 = [(id)qword_26AB2EC00 stringFromDate:v4];

  return v5;
}

uint64_t __53__HFCameraImageManager_clipIdentifierStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)qword_26AB2EC00;
  qword_26AB2EC00 = (uint64_t)v0;

  uint64_t v2 = (void *)qword_26AB2EC00;
  return [v2 setDateFormat:@"YYYY:MM:dd HH:mm"];
}

- (void)resetForCameraDismissal
{
  uint64_t v3 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Purge image cache for camera dismissal.", v12, 2u);
  }

  id v4 = [(HFCameraImageManager *)self fetchCache];
  [v4 purge];

  uint64_t v5 = [(HFCameraImageManager *)self requestedHeroFrameCache];
  [v5 removeAllObjects];

  BOOL v6 = [(HFCameraImageManager *)self requestedFaceCropCache];
  [v6 removeAllObjects];

  uint64_t v7 = [(HFCameraImageManager *)self imageObservers];
  [v7 removeAllObjects];

  double v8 = [(HFCameraImageManager *)self generationObservers];
  [v8 removeAllObjects];

  uint64_t v9 = [(HFCameraImageManager *)self inProgressOperations];
  [v9 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_68];

  id v10 = [(HFCameraImageManager *)self inProgressOperations];
  [v10 removeAllObjects];

  cameraPosterFrameProvider = self->_cameraPosterFrameProvider;
  self->_cameraPosterFrameProvider = 0;
}

uint64_t __47__HFCameraImageManager_resetForCameraDismissal__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancel];
}

- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HFCameraImageManager_didDownloadVideoFileForClip_toURL___block_invoke;
  block[3] = &unk_26408D388;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __58__HFCameraImageManager_didDownloadVideoFileForClip_toURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateImagesForForTimelapseClip:*(void *)(a1 + 40) atLocation:*(void *)(a1 + 48)];
}

- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HFCameraImageManager_foundVideoFileForClip_atURL___block_invoke;
  block[3] = &unk_26408D388;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__HFCameraImageManager_foundVideoFileForClip_atURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateImagesForForTimelapseClip:*(void *)(a1 + 40) atLocation:*(void *)(a1 + 48)];
}

- (void)failedToDownloadVideoFileForClip:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Error fetching clip: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_generateImagesForForTimelapseClip:(id)a3 atLocation:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uniqueIdentifier];
  id v9 = [v8 UUIDString];

  id v10 = [(HFCameraImageManager *)self offsetsForFile];
  id v11 = [v10 objectForKeyedSubscript:v9];
  id v12 = (void *)[v11 copy];

  if (v12)
  {
    __int16 v13 = [(HFCameraImageManager *)self offsetsForFile];
    Float64 v22 = v9;
    [v13 removeObjectForKey:v9];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v21 = v12;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      double v17 = MEMORY[0x263EF83A0];
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(obj);
          }
          objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v18), "doubleValue", v21);
          -[HFCameraImageManager _timeScaleAdjustedOffset:](self, "_timeScaleAdjustedOffset:");
          uint64_t v20 = v19;
          objc_initWeak(&location, self);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __70__HFCameraImageManager__generateImagesForForTimelapseClip_atLocation___block_invoke;
          block[3] = &unk_26408D620;
          objc_copyWeak(v27, &location);
          id v25 = v7;
          id v26 = v6;
          v27[1] = v20;
          dispatch_async(v17, block);

          objc_destroyWeak(v27);
          objc_destroyWeak(&location);
          ++v18;
        }
        while (v15 != v18);
        uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v15);
    }

    id v12 = v21;
    id v9 = v22;
  }
}

void __70__HFCameraImageManager__generateImagesForForTimelapseClip_atLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [MEMORY[0x263EFA470] assetWithURL:*(void *)(a1 + 32)];
  [WeakRetained generateImageUsingAsset:v2 clip:*(void *)(a1 + 40) offset:*(double *)(a1 + 56)];
}

- (HMCameraProfile)cameraProfile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraProfile);
  return (HMCameraProfile *)WeakRetained;
}

- (void)setCameraProfile:(id)a3
{
}

- (HFCameraClipVideoAssetOperationCache)fetchCache
{
  return self->_fetchCache;
}

- (void)setFetchCache:(id)a3
{
}

- (CGSize)videoSize
{
  double width = self->_videoSize.width;
  double height = self->_videoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSOperationQueue)posterFrameQueue
{
  return self->_posterFrameQueue;
}

- (void)setPosterFrameQueue:(id)a3
{
}

- (HFCameraImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (NSMutableDictionary)imageObservers
{
  return self->_imageObservers;
}

- (void)setImageObservers:(id)a3
{
}

- (NSMutableDictionary)generationObservers
{
  return self->_generationObservers;
}

- (void)setGenerationObservers:(id)a3
{
}

- (NSMutableDictionary)inProgressOperations
{
  return self->_inProgressOperations;
}

- (void)setInProgressOperations:(id)a3
{
}

- (NSMutableDictionary)requestedHeroFrameCache
{
  return self->_requestedHeroFrameCache;
}

- (void)setRequestedHeroFrameCache:(id)a3
{
}

- (NSMutableDictionary)requestedFaceCropCache
{
  return self->_requestedFaceCropCache;
}

- (void)setRequestedFaceCropCache:(id)a3
{
}

- (NSMutableDictionary)requestedPosterFrameCache
{
  return self->_requestedPosterFrameCache;
}

- (void)setRequestedPosterFrameCache:(id)a3
{
}

- (void)setCameraPosterFrameProvider:(id)a3
{
}

- (NSMutableDictionary)offsetsForFile
{
  return self->_offsetsForFile;
}

- (void)setOffsetsForFile:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetsForFile, 0);
  objc_storeStrong((id *)&self->_cameraPosterFrameProvider, 0);
  objc_storeStrong((id *)&self->_requestedPosterFrameCache, 0);
  objc_storeStrong((id *)&self->_requestedFaceCropCache, 0);
  objc_storeStrong((id *)&self->_requestedHeroFrameCache, 0);
  objc_storeStrong((id *)&self->_inProgressOperations, 0);
  objc_storeStrong((id *)&self->_generationObservers, 0);
  objc_storeStrong((id *)&self->_imageObservers, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_posterFrameQueue, 0);
  objc_storeStrong((id *)&self->_fetchCache, 0);
  objc_destroyWeak((id *)&self->_cameraProfile);
}

@end