@interface PHWallpaperAsset
- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3;
- (BOOL)supportsSegmentationResourceCaching;
- (CGRect)acceptableCropRect;
- (CGRect)gazeAreaRect;
- (CGRect)preferredCropRect;
- (NSArray)faceRegions;
- (NSArray)petRegions;
- (NSString)localIdentifier;
- (NSURL)segmentationResourceURL;
- (PHAsset)photoAsset;
- (PHWallpaperAsset)initWithPhotoAsset:(id)a3;
- (int)loadMotionScore:(id)a3;
- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5;
- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4;
- (void)cancelMotionScoreRequest:(int)a3;
- (void)cancelParallaxResourceRequest:(int)a3;
- (void)cancelPetsRegionsRequest:(int)a3;
- (void)updateSegmentationResource:(id)a3;
@end

@implementation PHWallpaperAsset

- (void).cxx_destruct
{
}

- (PHAsset)photoAsset
{
  return self->_photoAsset;
}

- (void)cancelMotionScoreRequest:(int)a3
{
}

- (int)loadMotionScore:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void, __n128))a3;
  v5 = [(PHWallpaperAsset *)self photoAsset];
  [v5 fetchPropertySetsIfNeeded];

  v6 = [(PHWallpaperAsset *)self photoAsset];
  v7 = [v6 mediaAnalysisProperties];
  [v7 settlingEffectScore];
  float v9 = v8;

  if (v9 >= 0.0)
  {
    v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = [(PHWallpaperAsset *)self localIdentifier];
      *(_DWORD *)buf = 138543618;
      v29 = v20;
      __int16 v30 = 2048;
      double v31 = v9;
      _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_INFO, "Motion score already computed for asset: %{public}@, score: %.2f", buf, 0x16u);
    }
    v21.n128_f32[0] = v9;
    v4[2](v4, 0, v21);
    goto LABEL_12;
  }
  v10 = [(PHWallpaperAsset *)self photoAsset];
  char v11 = [v10 isPhotoIris];

  v12 = PLBackendGetLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if ((v11 & 1) == 0)
  {
    if (v13)
    {
      v22 = [(PHWallpaperAsset *)self localIdentifier];
      *(_DWORD *)buf = 138543362;
      v29 = v22;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_INFO, "No motion score for non-Live Photo asset: %{public}@", buf, 0xCu);
    }
    v23.n128_u32[0] = -1.0;
    v4[2](v4, 0, v23);
LABEL_12:
    int v18 = 0;
    goto LABEL_13;
  }
  if (v13)
  {
    v14 = [(PHWallpaperAsset *)self localIdentifier];
    *(_DWORD *)buf = 138543362;
    v29 = v14;
    _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_INFO, "Requesting on-demand analysis of motion score for asset: %{public}@", buf, 0xCu);
  }
  v15 = (void *)MEMORY[0x1E4F8A998];
  v16 = [(PHWallpaperAsset *)self photoAsset];
  v27 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __36__PHWallpaperAsset_loadMotionScore___block_invoke;
  v25[3] = &unk_1E5845C68;
  v25[4] = self;
  v26 = v4;
  int v18 = [v15 requestMovieCurationForAssets:v17 withOptions:0 progressHandler:0 completionHandler:v25];

LABEL_13:
  return v18;
}

void __36__PHWallpaperAsset_loadMotionScore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) localIdentifier];
    v5 = [v3 objectForKeyedSubscript:v4];

    if (v5)
    {
      v6 = [v5 objectForKeyedSubscript:@"SettlingEffectsGatingResults"];
      v7 = v6;
      if (v6)
      {
        float v8 = [v6 firstObject];
        float v9 = [v8 objectForKeyedSubscript:@"quality"];
        if (v9)
        {
          v10 = v9;
          [v9 floatValue];
          (*(void (**)(__n128))(*(void *)(a1 + 40) + 16))(v11);
        }
        else
        {
          __n128 v21 = PLBackendGetLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = [*(id *)(a1 + 32) localIdentifier];
            *(_DWORD *)buf = 138543618;
            v34 = v22;
            __int16 v35 = 2114;
            v36 = v7;
            _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_ERROR, "Missing motion score value for asset: %{public}@, results: %{public}@", buf, 0x16u);
          }
          uint64_t v23 = *(void *)(a1 + 40);
          v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v31 = *MEMORY[0x1E4F28228];
          uint64_t v32 = @"Missing motion score value";
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
          v26 = [v24 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v25];
          (*(void (**)(uint64_t, void *, float))(v23 + 16))(v23, v26, -1.0);

          v10 = 0;
        }
      }
      else
      {
        v16 = PLBackendGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = [*(id *)(a1 + 32) localIdentifier];
          *(_DWORD *)buf = 138543362;
          v34 = v17;
          _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Invalid motion score results for asset: %{public}@", buf, 0xCu);
        }
        uint64_t v18 = *(void *)(a1 + 40);
        v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v29 = *MEMORY[0x1E4F28228];
        __int16 v30 = @"Invalid motion score results";
        float v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        v10 = [v19 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v8];
        v20.n128_u32[0] = -1.0;
        (*(void (**)(__n128))(v18 + 16))(v20);
      }
    }
    else
    {
      v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = [*(id *)(a1 + 32) localIdentifier];
        *(_DWORD *)buf = 138543362;
        v34 = v13;
        _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Failed to get motion score results for asset: %{public}@", buf, 0xCu);
      }
      uint64_t v14 = *(void *)(a1 + 40);
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28228];
      v28 = @"Failed to get motion score results";
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      float v8 = [v15 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v7];
      (*(void (**)(uint64_t, void *, float))(v14 + 16))(v14, v8, -1.0);
    }
  }
  else
  {
    (*(void (**)(float))(*(void *)(a1 + 40) + 16))(-1.0);
  }
}

- (void)cancelParallaxResourceRequest:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = +[PHImageManager defaultManager];
  [v4 cancelImageRequest:v3];
}

- (void)updateSegmentationResource:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [v5 temporaryDirectory];
  v7 = [(PHWallpaperAsset *)self photoAsset];
  float v8 = [v7 uuid];
  float v9 = [v6 URLByAppendingPathComponent:v8];
  v10 = [v9 URLByAppendingPathExtension:@"segmentation"];

  __n128 v11 = [(PHWallpaperAsset *)self photoAsset];
  v12 = [v11 photoLibrary];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__PHWallpaperAsset_updateSegmentationResource___block_invoke;
  v17[3] = &unk_1E58487E0;
  id v20 = v4;
  id v18 = v10;
  v19 = self;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__PHWallpaperAsset_updateSegmentationResource___block_invoke_85;
  v15[3] = &unk_1E5845928;
  v15[4] = self;
  id v16 = v18;
  id v13 = v18;
  id v14 = v4;
  [v12 performChanges:v17 completionHandler:v15];
}

void __47__PHWallpaperAsset_updateSegmentationResource___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    v2 = [*(id *)(a1 + 40) photoAsset];
    uint64_t v3 = +[PHAssetChangeRequest changeRequestForAsset:v2];

    if (([v3 addAssetResourceWithType:109 fromFileAtURL:*(void *)(a1 + 32)] & 1) == 0)
    {
      id v4 = PLBackendGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = [*(id *)(a1 + 40) localIdentifier];
        int v7 = 138543362;
        float v8 = v5;
        _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "Failed to copy segmentation resource file for asset: %{public}@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v3 = PLBackendGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = [*(id *)(a1 + 40) localIdentifier];
      int v7 = 138543362;
      float v8 = v6;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_ERROR, "Failed to write segmentation resource file for asset: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

void __47__PHWallpaperAsset_updateSegmentationResource___block_invoke_85(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = [*(id *)(a1 + 32) localIdentifier];
      int v9 = 138543618;
      v10 = v7;
      __int16 v11 = 2114;
      id v12 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Failed to update segmentation resource for asset: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  float v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v8 removeItemAtURL:*(void *)(a1 + 40) error:0];
}

- (void)cancelPetsRegionsRequest:(int)a3
{
}

- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([a3 needsInProcessHandling]) {
    int v7 = &unk_1EEB27038;
  }
  else {
    int v7 = 0;
  }
  float v8 = (void *)MEMORY[0x1E4F8A998];
  int v9 = [(PHWallpaperAsset *)self photoAsset];
  v17[0] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__PHWallpaperAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_3;
  v14[3] = &unk_1E5845900;
  v14[4] = self;
  id v15 = &__block_literal_global_47;
  id v16 = v6;
  id v11 = v6;
  int v12 = [v8 requestPetsAnalysisForAssets:v10 withOptions:v7 progressHandler:0 completionHandler:v14];

  return v12;
}

void __61__PHWallpaperAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [*(id *)(a1 + 32) localIdentifier];
    float v8 = [v5 objectForKeyedSubscript:v7];

    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      v10 = [v8 objectForKeyedSubscript:@"PetsResults"];
      id v11 = (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = [v8 objectForKeyedSubscript:@"PetsFaceResults"];
      id v14 = (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);

      if (v11) {
        BOOL v15 = v14 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15)
      {
        id v16 = PLBackendGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = [*(id *)(a1 + 32) localIdentifier];
          *(_DWORD *)buf = 138543618;
          v34 = v17;
          __int16 v35 = 2114;
          id v36 = v8;
          _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Invalid pets results for asset: %{public}@, results: %{public}@", buf, 0x16u);
        }
        id v18 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v19 = *MEMORY[0x1E4F8CEC8];
        uint64_t v31 = *MEMORY[0x1E4F28228];
        uint64_t v32 = @"Invalid pets results";
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        __n128 v21 = [v18 errorWithDomain:v19 code:8 userInfo:v20];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      v24 = PLBackendGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = [*(id *)(a1 + 32) localIdentifier];
        *(_DWORD *)buf = 138543362;
        v34 = v25;
        _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_ERROR, "Missing pets results for asset: %{public}@", buf, 0xCu);
      }
      v26 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F8CEC8];
      uint64_t v29 = *MEMORY[0x1E4F28228];
      __int16 v30 = @"Missing pets results";
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v11 = [v26 errorWithDomain:v27 code:8 userInfo:v28];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = [*(id *)(a1 + 32) localIdentifier];
      *(_DWORD *)buf = 138543618;
      v34 = v23;
      __int16 v35 = 2114;
      id v36 = v6;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "Failed to analyze pets for asset: %{public}@, error: %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __61__PHWallpaperAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke()
{
  return PFMap();
}

id __61__PHWallpaperAsset_loadPetsRegionsWithOptions_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKeyedSubscript:@"attributes"];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"petsBounds"];

  NSRect v6 = NSRectFromString(v3);
  id v4 = [MEMORY[0x1E4F29238] valueWithBytes:&v6 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];

  return v4;
}

- (NSArray)petRegions
{
  return 0;
}

- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3
{
  id v4 = [(PHWallpaperAsset *)self segmentationResourceURL];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v5 removeItemAtURL:v4 error:a3];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (NSURL)segmentationResourceURL
{
  v2 = [(PHWallpaperAsset *)self photoAsset];
  uint64_t v3 = +[PHAssetResource assetResourcesForAsset:v2 includeDerivatives:1];

  uint64_t v4 = [v3 indexOfObjectPassingTest:&__block_literal_global_24751];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    char v6 = [v3 objectAtIndexedSubscript:v4];
    int v7 = [v6 privateFileURL];

    float v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v9 = [v7 path];
    int v10 = [v8 fileExistsAtPath:v9];

    if (v10) {
      id v11 = v7;
    }
    else {
      id v11 = 0;
    }
    id v5 = v11;
  }

  return (NSURL *)v5;
}

BOOL __43__PHWallpaperAsset_segmentationResourceURL__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 109;
}

- (BOOL)supportsSegmentationResourceCaching
{
  return 1;
}

- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (a3 != 6)
  {
    double v14 = 0.0;
    switch(a3)
    {
      case 0:
        [v9 imageSize];
        double v16 = v15;
        double v14 = v17;
        uint64_t v18 = 0;
        uint64_t v19 = 0x10000;
        goto LABEL_17;
      case 1:
        [v9 imageSize];
        double v16 = v29;
        double v14 = v30;
        uint64_t v19 = 0;
        uint64_t v18 = 0;
        goto LABEL_17;
      case 2:
        double v14 = -1.0;
        uint64_t v18 = 1;
        uint64_t v19 = 0x10000;
        double v16 = -1.0;
        goto LABEL_17;
      case 3:
        [v9 imageSize];
        double v16 = v31;
        double v14 = v32;
        uint64_t v19 = 0;
        uint64_t v18 = 1;
        goto LABEL_17;
      case 4:
        goto LABEL_6;
      case 5:
        v33 = [MEMORY[0x1E4F28B00] currentHandler];
        [v33 handleFailureInMethod:a2 object:self file:@"PHWallpaperAsset.m" lineNumber:120 description:@"Unsupported format"];

        goto LABEL_16;
      default:
LABEL_16:
        uint64_t v18 = 1;
        uint64_t v19 = 0x10000;
        double v16 = 0.0;
LABEL_17:
        id v20 = objc_alloc_init(PHImageRequestOptions);
        [(PHImageRequestOptions *)v20 setVersion:v18];
        [(PHImageRequestOptions *)v20 setDeliveryMode:1];
        [(PHImageRequestOptions *)v20 setResizeMode:1];
        -[PHImageRequestOptions setNetworkAccessAllowed:](v20, "setNetworkAccessAllowed:", [v9 networkAccessAllowed]);
        [(PHImageRequestOptions *)v20 setSynchronous:0];
        v34 = [v9 resultHandlerQueue];
        [(PHImageRequestOptions *)v20 setResultHandlerQueue:v34];

        [(PHImageRequestOptions *)v20 setLoadingMode:v19];
        uint64_t v35 = [v9 priority];
        if (v35 == 1)
        {
          uint64_t v36 = 9;
        }
        else
        {
          if (v35 != 2) {
            goto LABEL_22;
          }
          uint64_t v36 = 8;
        }
        [(PHImageRequestOptions *)v20 setDownloadIntent:v36];
LABEL_22:
        uint64_t v37 = [v9 downloadProgressHandler];
        id v22 = v37;
        if (v37)
        {
          v55[0] = MEMORY[0x1E4F143A8];
          v55[1] = 3221225472;
          v55[2] = __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke;
          v55[3] = &unk_1E58472C8;
          id v56 = v37;
          [(PHImageRequestOptions *)v20 setProgressHandler:v55];
        }
        uint64_t v38 = [v9 aspectFit] ^ 1;
        v39 = +[PHImageManager defaultManager];
        v40 = [(PHWallpaperAsset *)self photoAsset];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_2;
        v52[3] = &unk_1E5845800;
        int64_t v54 = a3;
        id v53 = v10;
        int v13 = objc_msgSend(v39, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", v40, v38, v20, v52, v16, v14);

        v28 = v53;
        break;
    }
    goto LABEL_25;
  }
  id v11 = [(PHWallpaperAsset *)self photoAsset];
  char v12 = [v11 mediaSubtypes];

  if ((v12 & 8) != 0)
  {
LABEL_6:
    id v20 = objc_alloc_init(PHContentEditingInputRequestOptions);
    -[PHImageRequestOptions setNetworkAccessAllowed:](v20, "setNetworkAccessAllowed:", [v9 networkAccessAllowed]);
    __n128 v21 = [v9 canHandleAdjustmentData];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_3;
    v50[3] = &unk_1E5845828;
    id v22 = v21;
    id v51 = v22;
    [(PHImageRequestOptions *)v20 setCanHandleAdjustmentData:v50];
    uint64_t v23 = [v9 resultHandlerQueue];
    [(PHImageRequestOptions *)v20 setResultHandlerQueue:v23];

    if (a3 == 6 && [v9 priority]) {
      [(PHImageRequestOptions *)v20 setDownloadIntent:10];
    }
    v24 = [v9 downloadProgressHandler];
    v25 = v24;
    if (v24)
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_4;
      v48[3] = &unk_1E5845850;
      id v49 = v24;
      [(PHImageRequestOptions *)v20 setProgressHandler:v48];
    }
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x2020000000;
    char v47 = 0;
    v26 = +[PHImageManager defaultManager];
    uint64_t v27 = [(PHWallpaperAsset *)self photoAsset];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_5;
    v42[3] = &unk_1E5845878;
    v44 = v46;
    int64_t v45 = a3;
    v42[4] = self;
    id v43 = v10;
    int v13 = [v26 requestContentEditingInputForAsset:v27 withOptions:v20 completionHandler:v42];

    _Block_object_dispose(v46, 8);
    v28 = v51;
LABEL_25:

    goto LABEL_26;
  }
  (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  int v13 = 0;
LABEL_26:

  return v13;
}

uint64_t __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_2(uint64_t a1, CGImage *a2, void *a3)
{
  id v11 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F8CC68]);
  [v5 setType:*(void *)(a1 + 40)];
  if (a2)
  {
    [v5 setProxyImage:a2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    CGImageRelease(a2);
  }
  else
  {
    char v6 = [v11 objectForKeyedSubscript:@"PHImageFileURLKey"];
    if (v6)
    {
      [v5 setImageFileURL:v6];
      int v7 = [v11 objectForKeyedSubscript:@"PHImageFileUTIKey"];
      [v5 setFileType:v7];

      float v8 = [v11 objectForKeyedSubscript:@"PHImageFileOrientationKey"];
      [v8 intValue];
      [v5 setOrientation:PLExifOrientationFromImageOrientation()];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [v11 objectForKeyedSubscript:@"PHImageErrorKey"];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
    }
  }
}

uint64_t __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0;
  }
  id v3 = a2;
  uint64_t v4 = [v3 formatIdentifier];
  id v5 = [v3 formatVersion];

  uint64_t v6 = (*(uint64_t (**)(uint64_t, void *, void *))(v2 + 16))(v2, v4, v5);
  return v6;
}

uint64_t __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__PHWallpaperAsset_loadParallaxResource_options_resultHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  if (*(unsigned char *)(v8 + 24))
  {
    uint64_t v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      id v10 = [*(id *)(a1 + 32) localIdentifier];
      int v23 = 138543362;
      v24 = v10;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_FAULT, "Image manager completion handler called more than once for asset %{public}@", (uint8_t *)&v23, 0xCu);
    }
  }
  else
  {
    *(unsigned char *)(v8 + 24) = 1;
    if (v5)
    {
      uint64_t v9 = objc_alloc_init(MEMORY[0x1E4F8CC68]);
      id v11 = [v5 fullSizeImageURL];
      [v9 setImageFileURL:v11];

      char v12 = [v5 uniformTypeIdentifier];
      [v9 setFileType:v12];

      -[NSObject setOrientation:](v9, "setOrientation:", [v5 fullSizeImageOrientation]);
      int v13 = [v5 adjustmentData];
      if (v13)
      {
        [v9 setType:4];
        double v14 = [v13 data];
        [v9 setAdjustmentData:v14];

        double v15 = [v13 formatIdentifier];
        [v9 setAdjustmentFormat:v15];

        double v16 = [v13 formatVersion];
        [v9 setAdjustmentVersion:v16];
      }
      else
      {
        [v9 setType:2];
      }
      if (*(void *)(a1 + 56) == 6)
      {
        uint64_t v18 = [v5 livePhoto];
        uint64_t v19 = v18;
        if (v18)
        {
          id v20 = [v18 imageURL];
          [v9 setImageFileURL:v20];

          __n128 v21 = [v19 videoURL];
          [v9 setVideoFileURL:v21];

          if ([v5 baseVersion]) {
            uint64_t v22 = 4;
          }
          else {
            uint64_t v22 = 6;
          }
          [v9 setType:v22];
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v9 = [v6 objectForKeyedSubscript:@"PHContentEditingInputErrorKey"];
      (*(void (**)(uint64_t, void, NSObject *))(v17 + 16))(v17, 0, v9);
    }
  }
}

- (NSString)localIdentifier
{
  uint64_t v2 = [(PHWallpaperAsset *)self photoAsset];
  id v3 = [v2 localIdentifier];

  return (NSString *)v3;
}

- (NSArray)faceRegions
{
  uint64_t v2 = [(PHWallpaperAsset *)self photoAsset];
  id v3 = [v2 faceRegions];

  return (NSArray *)v3;
}

- (CGRect)gazeAreaRect
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [(PHWallpaperAsset *)self photoAsset];
  uint64_t v4 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:0 orObject:v3];

  [v4 setMinimumVerifiedFaceCount:1];
  id v5 = [(PHWallpaperAsset *)self photoAsset];
  id v6 = +[PHFace fetchFacesInAsset:v5 options:v4];

  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_msgSend(v16, "gazeConfidence", (void)v26);
        if (v17 > 0.0)
        {
          [v16 gazeRect];
          v35.origin.CGFloat x = v18;
          v35.origin.CGFloat y = v19;
          v35.size.CGFloat width = v20;
          v35.size.CGFloat height = v21;
          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          CGRect v33 = CGRectUnion(v32, v35);
          CGFloat x = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)preferredCropRect
{
  uint64_t v2 = [(PHWallpaperAsset *)self photoAsset];
  [v2 preferredCropRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)acceptableCropRect
{
  uint64_t v2 = [(PHWallpaperAsset *)self photoAsset];
  [v2 acceptableCropRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (PHWallpaperAsset)initWithPhotoAsset:(id)a3
{
  double v4 = (PHAsset *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PHWallpaperAsset;
  double v5 = [(PHWallpaperAsset *)&v8 init];
  photoAsset = v5->_photoAsset;
  v5->_photoAsset = v4;

  return v5;
}

@end