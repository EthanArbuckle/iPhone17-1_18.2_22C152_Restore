@interface PHImageResourceChooser
+ (id)_bagFromInfo:(id)a3 asset:(id)a4 behaviorSpec:(id)a5 requiredScale:(double)a6 bagVendor:(id)a7 assetIDContainerVendor:(id)a8;
+ (id)_resourceVersionsFromImageRequestVersion:(int64_t)a3 assetHasAdjustments:(BOOL)a4;
+ (unint64_t)_chooserSourceOptionsFromBehaviorSpec:(id)a3 allowHints:(BOOL)a4;
+ (void)initialize;
- (BOOL)_resourceInfoPassesTestForImageDerivativeOfVideo:(id)a3;
- (BOOL)allowChoosingNonLocalVideoKeyFrameResource;
- (BOOL)allowHints;
- (BOOL)isCloudSharedMode;
- (CGRect)normalizedCropRect;
- (CGSize)desiredSize;
- (Class)_policyHandlerClassForCurrentPolicy;
- (NSString)loggingPrefix;
- (PHImageRequestBehaviorSpec)behaviorSpec;
- (PHImageResourceChooser)initWithAsset:(id)a3 resourceHandler:(id)a4;
- (PHImageResourceChooser)initWithChooserList:(id)a3 asset:(id)a4 resourceHandler:(id)a5;
- (double)fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable;
- (id)_requestInfo;
- (id)context;
- (id)resourceHandler;
- (void)_reset;
- (void)_updateCachedGeometry;
- (void)moveFirst;
- (void)presentNextQualifyingResource;
- (void)setAllowChoosingNonLocalVideoKeyFrameResource:(BOOL)a3;
- (void)setAllowHints:(BOOL)a3;
- (void)setBehaviorSpec:(id)a3;
- (void)setContext:(id)a3;
- (void)setDesiredSize:(CGSize)a3;
- (void)setFallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:(double)a3;
- (void)setIsCloudSharedMode:(BOOL)a3;
- (void)setLoggingPrefix:(id)a3;
- (void)setNormalizedCropRect:(CGRect)a3;
- (void)setResourceHandler:(id)a3;
@end

@implementation PHImageResourceChooser

BOOL __55__PHImageResourceChooser_presentNextQualifyingResource__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4, void *a5)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  v11 = a5;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  char v55 = 0;
  v13 = (void *)[WeakRetained _policyHandlerClassForCurrentPolicy];
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 32);
  id v54 = 0;
  uint64_t v16 = [v13 qualifyResourceInfo:v10 againstPolicy:v14 requestInfo:v15 reversed:a3 tooLargeForPolicy:&v55 disqualificationReason:&v54];
  v17 = (__CFString *)v54;
  if (!v16) {
    goto LABEL_9;
  }
  if (([WeakRetained _resourceInfoPassesTestForImageDerivativeOfVideo:v10] & 1) == 0)
  {

    v17 = @"failed video derivative test";
LABEL_9:
    v21 = (void *)*((void *)WeakRetained + 9);
    if (v21)
    {
      id v19 = v21;
      v11[2](v11);
      char v22 = 0;
      BOOL v53 = 1;
      v52 = @"NOT OK (Yielding FB)";
      goto LABEL_20;
    }
    if (v55)
    {
      v11[2](v11);
      *a4 = 1;
      v23 = @"NOT OK (Forcing EOL)";
    }
    else
    {
      v23 = @"NOT OK";
    }
LABEL_18:
    v52 = v23;
    goto LABEL_19;
  }
  if (v16 == 1)
  {
    if ([*((id *)WeakRetained + 2) reversed])
    {
      id v19 = v10;
      v20 = @"OK as FB (Yielding FB due to running in reverse)";
      goto LABEL_40;
    }
    objc_storeStrong((id *)WeakRetained + 9, a2);
    v23 = @"OK as FB";
    goto LABEL_18;
  }
  if (v16 != 2)
  {
    v52 = 0;
LABEL_19:
    id v19 = 0;
    BOOL v53 = *a4 != 0;
    char v22 = 1;
    goto LABEL_20;
  }
  if (*((void *)WeakRetained + 9)
    && ([v10 dataStoreKey], v18 = objc_claimAutoreleasedReturnValue(), v18, !v18))
  {
    id v19 = *((id *)WeakRetained + 9);
    v11[2](v11);
    v20 = @"OK, but not local (Yielding local FB)";
  }
  else
  {
    id v19 = v10;
    v20 = @"OK";
  }
LABEL_40:
  v52 = v20;
  if (!v19) {
    goto LABEL_19;
  }
  char v22 = 0;
  BOOL v53 = 1;
LABEL_20:
  v24 = [*(id *)(a1 + 32) asset];
  [v10 approximateSizeFromAsset:v24];

  v25 = PLImageManagerGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v26 = *(void *)(a1 + 48);
    v51 = v11;
    id v50 = v19;
    if (v26 > 4) {
      v27 = @"best";
    }
    else {
      v27 = off_1E5848458[v26];
    }
    char v49 = v22;
    uint64_t v48 = *((void *)WeakRetained + 14);
    v45 = v27;
    DCIM_NSStringFromCGSize();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v47 = *((void *)WeakRetained + 4);
    BOOL v29 = CGRectEqualToRect(*(CGRect *)(WeakRetained + 40), *MEMORY[0x1E4F1DB28]);
    v30 = @" (crop adjusted)";
    v31 = &stru_1EEAC1950;
    if (v29) {
      v30 = &stru_1EEAC1950;
    }
    v46 = v30;
    DCIM_NSStringFromCGSize();
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    [v10 resourceScale];
    float v34 = v33;
    int v35 = [v10 recipeID];
    if (v35)
    {
      v36 = NSString;
      [v10 recipeID];
      v44 = PLResourceRecipeIDDescription();
      v31 = [v36 stringWithFormat:@", recipe: %@", v44];
    }
    double v37 = v34;
    if (v17)
    {
      v38 = [NSString stringWithFormat:@" (%@)", v17];
    }
    else
    {
      v38 = &stru_1EEAC1950;
    }
    *(_DWORD *)buf = 138414594;
    uint64_t v57 = v48;
    __int16 v58 = 2112;
    v59 = v45;
    __int16 v60 = 2112;
    id v61 = v28;
    __int16 v62 = 2048;
    uint64_t v63 = v47;
    __int16 v64 = 2112;
    v65 = v46;
    __int16 v66 = 2112;
    id v67 = v32;
    __int16 v68 = 2048;
    double v69 = v37;
    __int16 v70 = 2112;
    v71 = v31;
    __int16 v72 = 2112;
    v73 = v52;
    __int16 v74 = 2112;
    v75 = v38;
    _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEBUG, "[RM]: %@ (choosing) policy: %@, req size: %@ (scale: %f%@), qualifying resource w appx size: %@ (scale: %f%@), %@%@", buf, 0x66u);
    if (v17) {

    }
    if (v35)
    {
    }
    v11 = v51;
    id v19 = v50;
    char v22 = v49;
  }

  if ((v22 & 1) == 0)
  {
    v39 = (void *)*((void *)WeakRetained + 9);
    *((void *)WeakRetained + 9) = 0;

    v40 = +[PHImageResourceChooser _bagFromInfo:v19 asset:*((void *)WeakRetained + 1) behaviorSpec:*((void *)WeakRetained + 10) requiredScale:s_bagVendor bagVendor:s_assetIDContainerVendor assetIDContainerVendor:*((double *)WeakRetained + 4)];
    uint64_t v41 = *((void *)WeakRetained + 3);
    id v42 = objc_loadWeakRetained((id *)WeakRetained + 13);
    (*(void (**)(uint64_t, id, void *, id))(v41 + 16))(v41, v42, v40, v19);

    [(id)s_bagVendor recycleObject:v40];
  }

  return v53;
}

- (Class)_policyHandlerClassForCurrentPolicy
{
  if ((unint64_t)[(PHImageRequestBehaviorSpec *)self->_behaviorSpec choosingPolicy] <= 4)
  {
    v2 = objc_opt_class();
  }

  return (Class)v2;
}

- (void)setResourceHandler:(id)a3
{
}

- (void)setLoggingPrefix:(id)a3
{
}

- (void)setDesiredSize:(CGSize)a3
{
  double width = self->_desiredSize.width;
  double height = self->_desiredSize.height;
  if (a3.width != width || a3.height != height)
  {
    if (width != *MEMORY[0x1E4F1DB30] || height != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      self->_needsReset = 1;
    }
    self->_desiredSize = a3;
    [(PHImageResourceChooser *)self _updateCachedGeometry];
  }
}

- (void)setContext:(id)a3
{
}

- (void)presentNextQualifyingResource
{
  if (!self->_behaviorSpec)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"PHImageResourceChooser.m" lineNumber:408 description:@"no behavior spec set."];
  }
  if (self->_needsReset) {
    [(PHImageResourceChooser *)self _reset];
  }
  v3 = [(PHImageRequestBehaviorSpec *)self->_behaviorSpec version];
  int64_t v4 = [(PHImageRequestBehaviorSpec *)self->_behaviorSpec choosingPolicy];
  v5 = (void *)v4;
  BOOL v7 = (unint64_t)v3 < 2 && v4 == 3;
  v8 = [(PHImageResourceChooser *)self _requestInfo];
  objc_initWeak(&location, self);
  objc_storeStrong((id *)&self->_list->_asset, self->_asset);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PHImageResourceChooser_presentNextQualifyingResource__block_invoke;
  aBlock[3] = &unk_1E5845EF0;
  objc_copyWeak(v25, &location);
  v25[1] = v5;
  id v9 = v8;
  id v24 = v9;
  id v10 = _Block_copy(aBlock);
  list = self->_list;
  id itemHandler = list->_itemHandler;
  list->_id itemHandler = v10;

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__PHImageResourceChooser_presentNextQualifyingResource__block_invoke_103;
  v19[3] = &unk_1E5845F18;
  objc_copyWeak(v21, &location);
  id v13 = v9;
  id v20 = v13;
  v21[1] = v5;
  v21[2] = v3;
  BOOL v22 = v7;
  uint64_t v14 = _Block_copy(v19);
  uint64_t v15 = self->_list;
  id endOfListHandler = v15->_endOfListHandler;
  v15->_id endOfListHandler = v14;

  -[PHResourceChooserList continueEnumeratingWithSourceOptions:](self->_list, "continueEnumeratingWithSourceOptions:", [(id)objc_opt_class() _chooserSourceOptionsFromBehaviorSpec:self->_behaviorSpec allowHints:self->_allowHints]);
  objc_destroyWeak(v21);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

- (id)_requestInfo
{
  v3 = [PHImageResourceChooserRequestInfo alloc];
  asset = self->_asset;
  float requiredScale = self->_requiredScale;
  v6 = +[PHImageResourceChooser _resourceVersionsFromImageRequestVersion:[(PHImageRequestBehaviorSpec *)self->_behaviorSpec version] assetHasAdjustments:[(PHResourceChooserAsset *)asset hasAdjustments]];
  *(float *)&double v7 = requiredScale;
  v8 = -[PHImageResourceChooserRequestInfo initWithAsset:desiredSize:requestedScale:allowedResourceVersions:behaviorSpec:cloudSharedMode:fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:loggingPrefix:](v3, "initWithAsset:desiredSize:requestedScale:allowedResourceVersions:behaviorSpec:cloudSharedMode:fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:loggingPrefix:", asset, v6, self->_behaviorSpec, self->_isCloudSharedMode, self->_loggingPrefix, self->_desiredSize.width, self->_desiredSize.height, v7, self->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable);

  return v8;
}

+ (id)_resourceVersionsFromImageRequestVersion:(int64_t)a3 assetHasAdjustments:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  double v7 = v6;
  v8 = &unk_1EEB25B78;
  switch(a3)
  {
    case 0:
      [v6 addObject:&unk_1EEB25B48];
      if (v4) {
        v8 = &unk_1EEB25B60;
      }
      goto LABEL_8;
    case 1:
      [v6 addObject:&unk_1EEB25B78];
      if (v4) {
        goto LABEL_9;
      }
      v8 = &unk_1EEB25B48;
LABEL_8:
      [v7 addObject:v8];
LABEL_9:
      return v7;
    case 2:
      goto LABEL_8;
    case 8:
      v8 = &unk_1EEB25B90;
      goto LABEL_8;
    default:
      goto LABEL_9;
  }
}

+ (unint64_t)_chooserSourceOptionsFromBehaviorSpec:(id)a3 allowHints:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  unint64_t v6 = v4;
  if (([v5 onlyUseFetchedAssetPropertiesDuringChoosing] & 1) == 0
    && ([v5 choosingPolicy] > 2
     || !v4
     || ![v5 choosingPolicy] && objc_msgSend(v5, "isNetworkAccessAllowed")))
  {
    unint64_t v6 = v4 | 2;
  }

  return v6;
}

- (void)setBehaviorSpec:(id)a3
{
  BOOL v4 = (PHImageRequestBehaviorSpec *)a3;
  id v5 = v4;
  if (!self->_needsReset && v4 && self->_behaviorSpec)
  {
    uint64_t v6 = [(PHImageRequestBehaviorSpec *)v4 loadingOptions];
    if (v6 == [(PHImageRequestBehaviorSpec *)self->_behaviorSpec loadingOptions]
      && (uint64_t v7 = [(PHImageRequestBehaviorSpec *)v5 choosingPolicy],
          v7 >= [(PHImageRequestBehaviorSpec *)self->_behaviorSpec choosingPolicy])
      && (uint64_t v8 = [(PHImageRequestBehaviorSpec *)v5 version],
          v8 == [(PHImageRequestBehaviorSpec *)self->_behaviorSpec version])
      && ([(PHImageRequestBehaviorSpec *)v5 minimumTableThumbnailLongSide],
          double v10 = v9,
          [(PHImageRequestBehaviorSpec *)self->_behaviorSpec minimumTableThumbnailLongSide], v10 == v11))
    {
      BOOL v14 = [(PHImageRequestBehaviorSpec *)v5 onlyUseFetchedAssetPropertiesDuringChoosing];
      char v12 = v14 ^ [(PHImageRequestBehaviorSpec *)self->_behaviorSpec onlyUseFetchedAssetPropertiesDuringChoosing];
    }
    else
    {
      char v12 = 1;
    }
    self->_needsReset = v12;
  }
  behaviorSpec = self->_behaviorSpec;
  self->_behaviorSpec = v5;
}

- (void)setAllowChoosingNonLocalVideoKeyFrameResource:(BOOL)a3
{
  if (self->_allowChoosingNonLocalVideoKeyFrameResource != a3)
  {
    self->_needsReset = 1;
    self->_allowChoosingNonLocalVideoKeyFrameResource = a3;
  }
}

- (void)_updateCachedGeometry
{
  double width = self->_desiredSize.width;
  double height = self->_desiredSize.height;
  id v5 = self->_asset;
  BOOL v6 = height == *(double *)(MEMORY[0x1E4F1DB30] + 8) && width == *MEMORY[0x1E4F1DB30];
  v17 = v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[PHImageResourceChooser _updateCachedGeometry]"];
    [v15 handleFailureInFunction:v16 file:@"PHImageResourceChooser.m" lineNumber:166 description:@"asset must be set before setting desired size."];
  }
  BOOL v7 = CGRectEqualToRect(self->_normalizedCropRect, *MEMORY[0x1E4F1DB28]);
  [(PHResourceChooserAsset *)v17 unorientedSize];
  double v9 = v8;
  if (v7)
  {
    [(PHResourceChooserAsset *)v17 unorientedSize];
    double v11 = v9 * v10;
  }
  else
  {
    double v12 = v8 * self->_normalizedCropRect.size.width;
    [(PHResourceChooserAsset *)v17 unorientedSize];
    double v11 = v12 * (v13 * self->_normalizedCropRect.size.height);
  }
  double v14 = 1.0;
  if (!v6) {
    double v14 = (float)((float)(unint64_t)(width * height) / (float)(unint64_t)v11);
  }
  self->_float requiredScale = fmin(v14, 1.0);
}

void __55__PHImageResourceChooser_presentNextQualifyingResource__block_invoke_103(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v7 = (void *)*((void *)WeakRetained + 9);
  if (v7)
  {
    id v8 = v7;
    double v9 = (void *)*((void *)WeakRetained + 9);
    *((void *)WeakRetained + 9) = 0;

    double v10 = [*(id *)(a1 + 32) asset];
    [v8 approximateSizeFromAsset:v10];

    double v11 = PLImageManagerGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *((void *)WeakRetained + 14);
      unint64_t v13 = *(void *)(a1 + 48);
      if (v13 > 4) {
        double v14 = @"best";
      }
      else {
        double v14 = off_1E5848458[v13];
      }
      id v20 = v14;
      v21 = DCIM_NSStringFromCGSize();
      uint64_t v22 = *((void *)WeakRetained + 4);
      v23 = DCIM_NSStringFromCGSize();
      int v27 = 138413314;
      uint64_t v28 = v12;
      __int16 v29 = 2112;
      v30 = v20;
      __int16 v31 = 2112;
      id v32 = v21;
      __int16 v33 = 2048;
      uint64_t v34 = v22;
      __int16 v35 = 2112;
      v36 = v23;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEBUG, "[RM]: %@ (choosing) policy: %@, against size: %@ (scale: %f), yielding FB resource w appx size: %@ due to hitting EOL", (uint8_t *)&v27, 0x34u);
    }
    id v24 = +[PHImageResourceChooser _bagFromInfo:v8 asset:*((void *)WeakRetained + 1) behaviorSpec:*((void *)WeakRetained + 10) requiredScale:s_bagVendor bagVendor:s_assetIDContainerVendor assetIDContainerVendor:*((double *)WeakRetained + 4)];
    uint64_t v25 = *((void *)WeakRetained + 3);
    id v26 = objc_loadWeakRetained((id *)WeakRetained + 13);
    (*(void (**)(uint64_t, id, void *, id))(v25 + 16))(v25, v26, v24, v8);

    [(id)s_bagVendor recycleObject:v24];
    goto LABEL_16;
  }
  if (*(unsigned char *)(a1 + 64) && (char v15 = [v5 reversed], a3) && (v15 & 1) == 0)
  {
    uint64_t v16 = PLImageManagerGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = *((void *)WeakRetained + 14);
      int v27 = 138412290;
      uint64_t v28 = v17;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "[RM]: %@ (choosing) couldn't find a resource meeting size criteria, turning around and removing size criteria...", (uint8_t *)&v27, 0xCu);
    }

    *a3 = 1;
    if (*(void *)(a1 + 56) == 1)
    {
      id v8 = (id)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"uniformTypeIdentifier.conformsToRawImage" ascending:0];
      PHChooserListSetSortDescriptor(v5, v8);
LABEL_16:
    }
  }
  else
  {
    uint64_t v18 = *((void *)WeakRetained + 3);
    id v19 = objc_loadWeakRetained((id *)WeakRetained + 13);
    (*(void (**)(uint64_t, id, void, void))(v18 + 16))(v18, v19, 0, 0);
  }
}

- (BOOL)_resourceInfoPassesTestForImageDerivativeOfVideo:(id)a3
{
  id v4 = a3;
  if ([(PHResourceChooserAsset *)self->_asset mediaType] != 2) {
    goto LABEL_16;
  }
  if (!self->_didCheckForLocalVideoKeyFrame && self->_list && ([v4 isHintBased] & 1) == 0)
  {
    self->_didCheckForLocalVideoKeyFrame = 1;
    self->_hasLocalVideoKeyFrameInNonHintResources = PHChooserListLookAheadForNonHintResourcePassingTest((uint64_t)self->_list, &__block_literal_global_26978);
  }
  if (!self->_hasLocalVideoKeyFrameInNonHintResources) {
    goto LABEL_16;
  }
  int v5 = [(PHResourceChooserAsset *)self->_asset isLocalVideoKeyFrameValid];
  int v6 = [v4 recipeID];
  if (!v5)
  {
    char v7 = v6 != 65749;
    goto LABEL_17;
  }
  if ((PLResourceRecipeIDIsCPLImageDerivative() & 1) == 0)
  {
    if ([v4 recipeID] == 65749)
    {
      char v8 = [(PHResourceChooserAsset *)self->_asset isWalrusEnabled];
      if (v8)
      {
        char v7 = v8 ^ 1;
        goto LABEL_17;
      }
    }
    if ([v4 recipeID] == 65749
      && ![(PHImageResourceChooser *)self allowChoosingNonLocalVideoKeyFrameResource])
    {
      double v10 = PLImageManagerGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)double v11 = 0;
        _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "[RM]: rejecting local video keyframe b/c chooser is configured to disallow it", v11, 2u);
      }

      goto LABEL_6;
    }
LABEL_16:
    char v7 = 1;
    goto LABEL_17;
  }
LABEL_6:
  char v7 = 0;
LABEL_17:

  return v7;
}

+ (id)_bagFromInfo:(id)a3 asset:(id)a4 behaviorSpec:(id)a5 requiredScale:(double)a6 bagVendor:(id)a7 assetIDContainerVendor:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = [v13 dataStoreKey];

  if (v18)
  {
    uint64_t v18 = [v16 dequeueRecyclableObject];
    id v19 = [v17 dequeueRecyclableObject];
    [v19 loadFromAsset:v14];
    [v18 setAssetID:v19];
    id v20 = [v13 store];
    [v18 setDataStore:v20];

    v21 = [v13 dataStoreKey];
    [v18 setDataStoreKey:v21];

    unint64_t v22 = [v15 choosingPolicy];
    if (v22 <= 4)
    {
      if (((1 << v22) & 0x19) != 0)
      {
        uint64_t IsFullSizeDeferredProcessingPreview = 0;
      }
      else
      {
        [v13 resourceScale];
        if (v24 >= a6)
        {
          [v13 recipeID];
          uint64_t IsFullSizeDeferredProcessingPreview = PLResourceRecipeIsFullSizeDeferredProcessingPreview();
        }
        else
        {
          uint64_t IsFullSizeDeferredProcessingPreview = 1;
        }
      }
      [v18 setIsDegraded:IsFullSizeDeferredProcessingPreview];
    }
    objc_msgSend(v18, "setIsPrimaryFormat:", objc_msgSend(v13, "isPrimaryFormat"));
    objc_msgSend(v18, "setKeyIsHintBased:", objc_msgSend(v13, "isHintBased"));
    [v13 recipeID];
    [v14 deferredProcessingNeeded];
    [v18 setIsDerivedFromDeferredPreview:PLResourceIsDerivedFromDeferredProcessingPreviewImage()];
  }
  else
  {
    id v19 = 0;
  }

  return v18;
}

- (void)setIsCloudSharedMode:(BOOL)a3
{
  if (self->_isCloudSharedMode != a3)
  {
    self->_needsReset = 1;
    self->_isCloudSharedMode = a3;
  }
}

- (PHImageResourceChooser)initWithChooserList:(id)a3 asset:(id)a4 resourceHandler:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PHImageResourceChooser;
  id v13 = [(PHImageResourceChooser *)&v20 init];
  if (v13)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)v13 + 2, a3);
        objc_storeStrong((id *)v13 + 1, a4);
        id v14 = _Block_copy(v12);
        id v15 = (void *)*((void *)v13 + 3);
        *((void *)v13 + 3) = v14;

        *((_WORD *)v13 + 45) = 257;
        v13[92] = 1;
        *((void *)v13 + 4) = 0;
        long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
        *(_OWORD *)(v13 + 40) = *MEMORY[0x1E4F1DB28];
        *(_OWORD *)(v13 + 56) = v16;
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, v13, @"PHImageResourceChooser.m", 305, @"Invalid parameter not satisfying: %@", @"list" object file lineNumber description];

      if (v11) {
        goto LABEL_4;
      }
    }
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, v13, @"PHImageResourceChooser.m", 306, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return (PHImageResourceChooser *)v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_destroyWeak(&self->_context);
  objc_storeStrong((id *)&self->_behaviorSpec, 0);
  objc_storeStrong((id *)&self->_fallbackInfo, 0);
  objc_storeStrong(&self->_resourceHandler, 0);
  objc_storeStrong((id *)&self->_list, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)_reset
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PLImageManagerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    loggingPrefix = self->_loggingPrefix;
    int v9 = 138412290;
    id v10 = loggingPrefix;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "[RM]: %@ resetting chooser...", (uint8_t *)&v9, 0xCu);
  }

  fallbackInfo = self->_fallbackInfo;
  self->_fallbackInfo = 0;

  *(_WORD *)&self->_didCheckForLocalVideoKeyFrame = 0;
  PHChooserListMoveFirst((uint64_t)self->_list);
  [(PHImageResourceChooser *)self _updateCachedGeometry];
  int64_t v6 = [(PHImageRequestBehaviorSpec *)self->_behaviorSpec version];
  if (v6 == 2)
  {
    uint64_t v8 = 0;
    goto LABEL_7;
  }
  char v7 = 0;
  if (v6 == 1)
  {
    uint64_t v8 = 1;
LABEL_7:
    char v7 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"uniformTypeIdentifier.conformsToRawImage" ascending:v8];
  }
  PHChooserListSetSortDescriptor(self->_list, v7);
  self->_needsReset = 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = [[PHRecyclableObjectVendor alloc] initWithTargetClass:objc_opt_class() requiresThreadSafety:1 initialPoolSize:4];
    v3 = (void *)s_bagVendor;
    s_bagVendor = (uint64_t)v2;

    id v4 = [[PHRecyclableObjectVendor alloc] initWithTargetClass:objc_opt_class() requiresThreadSafety:1 initialPoolSize:4];
    int v5 = (void *)s_assetIDContainerVendor;
    s_assetIDContainerVendor = (uint64_t)v4;
  }
}

- (NSString)loggingPrefix
{
  return self->_loggingPrefix;
}

- (id)context
{
  id WeakRetained = objc_loadWeakRetained(&self->_context);

  return WeakRetained;
}

- (id)resourceHandler
{
  return self->_resourceHandler;
}

- (PHImageRequestBehaviorSpec)behaviorSpec
{
  return self->_behaviorSpec;
}

- (BOOL)isCloudSharedMode
{
  return self->_isCloudSharedMode;
}

- (BOOL)allowChoosingNonLocalVideoKeyFrameResource
{
  return self->_allowChoosingNonLocalVideoKeyFrameResource;
}

- (BOOL)allowHints
{
  return self->_allowHints;
}

- (double)fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable
{
  return self->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable;
}

- (CGSize)desiredSize
{
  double width = self->_desiredSize.width;
  double height = self->_desiredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)moveFirst
{
}

- (void)setFallbackRequestedScaleIfPreferredResourceNotLocallyAvailable:(double)a3
{
  if (vabdd_f64(self->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable, a3) > 0.00000011920929)
  {
    self->_needsReset = 1;
    self->_fallbackRequestedScaleIfPreferredResourceNotLocallyAvailable = a3;
  }
}

- (CGRect)normalizedCropRect
{
  double x = self->_normalizedCropRect.origin.x;
  double y = self->_normalizedCropRect.origin.y;
  double width = self->_normalizedCropRect.size.width;
  double height = self->_normalizedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_normalizedCropRect))
  {
    if (!CGRectEqualToRect(self->_normalizedCropRect, *MEMORY[0x1E4F1DB28])) {
      self->_needsReset = 1;
    }
    self->_normalizedCropRect.origin.CGFloat x = x;
    self->_normalizedCropRect.origin.CGFloat y = y;
    self->_normalizedCropRect.size.CGFloat width = width;
    self->_normalizedCropRect.size.CGFloat height = height;
    [(PHImageResourceChooser *)self _updateCachedGeometry];
  }
}

- (void)setAllowHints:(BOOL)a3
{
  if (self->_allowHints != a3)
  {
    self->_needsReset = 1;
    self->_allowHints = a3;
  }
}

- (PHImageResourceChooser)initWithAsset:(id)a3 resourceHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(PHResourceChooserList);
  int v9 = [(PHImageResourceChooser *)self initWithChooserList:v8 asset:v7 resourceHandler:v6];

  return v9;
}

BOOL __75__PHImageResourceChooser__resourceInfoPassesTestForImageDerivativeOfVideo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recipeID] == 65749;
}

@end