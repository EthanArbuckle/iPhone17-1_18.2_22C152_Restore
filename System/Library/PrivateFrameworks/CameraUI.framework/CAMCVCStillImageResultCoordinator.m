@interface CAMCVCStillImageResultCoordinator
- (BOOL)_attemptDispatchForPairWithFilteredResultSpecifiers:(unint64_t)a3 unfilteredResultSpecifiers:(unint64_t)a4 forceRemainingDispatches:(BOOL)a5;
- (BOOL)_attemptDispatchForResultSpecifiers:(unint64_t)a3 forceRemainingDispatches:(BOOL)a4;
- (BOOL)_didReceiveForceRemainingDispatchesIfPossible;
- (BOOL)_isDelayingForcedDispatch;
- (BOOL)_isWaitingOnResultSpecifiers:(unint64_t)a3;
- (BOOL)allowMultipleCaptures;
- (BOOL)isExpectingPairedVideo;
- (BOOL)shouldReturnFilteredPhotosAsSingleAsset;
- (CAMCVCStillImageResultCoordinator)initWithDelegate:(id)a3 identifier:(id)a4 allExpectedResultSpecifiers:(id)a5 isExpectingPairedVideo:(BOOL)a6 allowMultipleCaptures:(BOOL)a7 shouldReturnFilteredPhotosAsSingleAsset:(BOOL)a8;
- (CAMCVCStillImageResultCoordinatorDelegate)delegate;
- (NSMutableDictionary)_pendingAssetAdjustments;
- (NSMutableDictionary)_pendingPhotoProperties;
- (NSMutableDictionary)_pendingVideoProperties;
- (NSMutableSet)_dispatchedResultSpecifiers;
- (NSMutableSet)_handledResultSpecifiers;
- (NSMutableSet)_photoResultSpecifiersDelayingForcedDispatch;
- (NSMutableSet)_receivedPhotos;
- (NSMutableSet)_receivedVideos;
- (NSMutableSet)_videoResultSpecifiersDelayingForcedDispatch;
- (NSSet)allExpectedResultSpecifiers;
- (NSString)identifier;
- (id)_errorForResultSpecifiers:(unint64_t)a3 allowMissingVideo:(BOOL)a4;
- (id)_errorWithDescription:(id)a3 code:(int64_t)a4;
- (void)_dispatchPendingPropertiesForced:(BOOL)a3;
- (void)_setDidReceiveForceRemainingDispatchesIfPossible:(BOOL)a3;
- (void)delayForcedDispatchForPhotoResultSpecifiers:(unint64_t)a3;
- (void)delayForcedDispatchForVideoResultSpecifiers:(unint64_t)a3;
- (void)forceRemainingDispatchesIfPossible;
- (void)updatePhotoProperties:(id)a3 assetAdjustments:(id)a4 forResultSpecifiers:(unint64_t)a5;
- (void)updateVideoProperties:(id)a3 forResultSpecifiers:(unint64_t)a4 wantsDepthRenderedForStill:(BOOL)a5;
@end

@implementation CAMCVCStillImageResultCoordinator

- (CAMCVCStillImageResultCoordinator)initWithDelegate:(id)a3 identifier:(id)a4 allExpectedResultSpecifiers:(id)a5 isExpectingPairedVideo:(BOOL)a6 allowMultipleCaptures:(BOOL)a7 shouldReturnFilteredPhotosAsSingleAsset:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v39.receiver = self;
  v39.super_class = (Class)CAMCVCStillImageResultCoordinator;
  v17 = [(CAMCVCStillImageResultCoordinator *)&v39 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v14);
    objc_storeStrong((id *)&v18->_identifier, a4);
    objc_storeStrong((id *)&v18->_allExpectedResultSpecifiers, a5);
    v18->_expectingPairedVideo = a6;
    v18->_allowMultipleCaptures = a7;
    v18->_shouldReturnFilteredPhotosAsSingleAsset = a8;
    uint64_t v19 = [MEMORY[0x263EFF9C0] set];
    receivedPhotos = v18->__receivedPhotos;
    v18->__receivedPhotos = (NSMutableSet *)v19;

    uint64_t v21 = [MEMORY[0x263EFF9C0] set];
    receivedVideos = v18->__receivedVideos;
    v18->__receivedVideos = (NSMutableSet *)v21;

    uint64_t v23 = [MEMORY[0x263EFF9C0] set];
    photoResultSpecifiersDelayingForcedDispatch = v18->__photoResultSpecifiersDelayingForcedDispatch;
    v18->__photoResultSpecifiersDelayingForcedDispatch = (NSMutableSet *)v23;

    uint64_t v25 = [MEMORY[0x263EFF9C0] set];
    videoResultSpecifiersDelayingForcedDispatch = v18->__videoResultSpecifiersDelayingForcedDispatch;
    v18->__videoResultSpecifiersDelayingForcedDispatch = (NSMutableSet *)v25;

    uint64_t v27 = [MEMORY[0x263EFF9C0] set];
    handledResultSpecifiers = v18->__handledResultSpecifiers;
    v18->__handledResultSpecifiers = (NSMutableSet *)v27;

    uint64_t v29 = [MEMORY[0x263EFF9C0] set];
    dispatchedResultSpecifiers = v18->__dispatchedResultSpecifiers;
    v18->__dispatchedResultSpecifiers = (NSMutableSet *)v29;

    uint64_t v31 = [MEMORY[0x263EFF9A0] dictionary];
    pendingPhotoProperties = v18->__pendingPhotoProperties;
    v18->__pendingPhotoProperties = (NSMutableDictionary *)v31;

    uint64_t v33 = [MEMORY[0x263EFF9A0] dictionary];
    pendingVideoProperties = v18->__pendingVideoProperties;
    v18->__pendingVideoProperties = (NSMutableDictionary *)v33;

    uint64_t v35 = [MEMORY[0x263EFF9A0] dictionary];
    pendingAssetAdjustments = v18->__pendingAssetAdjustments;
    v18->__pendingAssetAdjustments = (NSMutableDictionary *)v35;

    v37 = v18;
  }

  return v18;
}

- (void)updatePhotoProperties:(id)a3 assetAdjustments:(id)a4 forResultSpecifiers:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  v10 = os_log_create("com.apple.camera", "Camera");
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_12;
  }
  v11 = [(CAMCVCStillImageResultCoordinator *)self identifier];
  if ((a5 & 2) == 0)
  {
    v12 = &stru_26BD78BA0;
    if ((a5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
  if (a5)
  {
LABEL_6:
    uint64_t v13 = [(__CFString *)v12 stringByAppendingString:@"HDR"];

    v12 = (__CFString *)v13;
  }
LABEL_7:
  if (![(__CFString *)v12 length])
  {

    v12 = @"None";
  }
  id v14 = @"YES";
  if (!v8) {
    id v14 = @"NO";
  }
  id v15 = v14;
  int v23 = 138543874;
  v24 = v11;
  __int16 v25 = 2114;
  v26 = v12;
  __int16 v27 = 2114;
  v28 = v15;
  _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: updatePhotoProperties for %{public}@ (hasAdjustments=%{public}@)", (uint8_t *)&v23, 0x20u);

LABEL_12:
  id v16 = [NSNumber numberWithUnsignedInteger:a5];
  BOOL v17 = [(CAMCVCStillImageResultCoordinator *)self _isDelayingForcedDispatch];
  v18 = [(CAMCVCStillImageResultCoordinator *)self _receivedPhotos];
  [v18 addObject:v16];

  uint64_t v19 = [(CAMCVCStillImageResultCoordinator *)self _photoResultSpecifiersDelayingForcedDispatch];
  [v19 removeObject:v16];

  v20 = [(CAMCVCStillImageResultCoordinator *)self _pendingPhotoProperties];
  [v20 setObject:v9 forKeyedSubscript:v16];

  uint64_t v21 = [(CAMCVCStillImageResultCoordinator *)self _pendingAssetAdjustments];
  [v21 setObject:v8 forKeyedSubscript:v16];

  BOOL v22 = v17
     && ![(CAMCVCStillImageResultCoordinator *)self _isDelayingForcedDispatch]
     && [(CAMCVCStillImageResultCoordinator *)self _didReceiveForceRemainingDispatchesIfPossible];
  [(CAMCVCStillImageResultCoordinator *)self _dispatchPendingPropertiesForced:v22];
}

- (void)updateVideoProperties:(id)a3 forResultSpecifiers:(unint64_t)a4 wantsDepthRenderedForStill:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = os_log_create("com.apple.camera", "Camera");
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_10;
  }
  v10 = [(CAMCVCStillImageResultCoordinator *)self identifier];
  if ((a4 & 2) == 0)
  {
    v11 = &stru_26BD78BA0;
    if ((a4 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v11 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
  if (a4)
  {
LABEL_6:
    uint64_t v12 = [(__CFString *)v11 stringByAppendingString:@"HDR"];

    v11 = (__CFString *)v12;
  }
LABEL_7:
  if (![(__CFString *)v11 length])
  {

    v11 = @"None";
  }
  int v21 = 138543618;
  BOOL v22 = v10;
  __int16 v23 = 2114;
  v24 = v11;
  _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: updateVideoProperties for %{public}@", (uint8_t *)&v21, 0x16u);

LABEL_10:
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a4];
  BOOL v14 = [(CAMCVCStillImageResultCoordinator *)self _isDelayingForcedDispatch];
  id v15 = [(CAMCVCStillImageResultCoordinator *)self _receivedVideos];
  [v15 addObject:v13];

  id v16 = [(CAMCVCStillImageResultCoordinator *)self _videoResultSpecifiersDelayingForcedDispatch];
  [v16 removeObject:v13];

  BOOL v17 = [(CAMCVCStillImageResultCoordinator *)self _pendingVideoProperties];
  [v17 setObject:v8 forKeyedSubscript:v13];

  if (v5)
  {
    v18 = [NSNumber numberWithUnsignedInteger:a4 | 2];
    uint64_t v19 = [(CAMCVCStillImageResultCoordinator *)self _pendingVideoProperties];
    [v19 setObject:v8 forKeyedSubscript:v18];
  }
  BOOL v20 = v14
     && ![(CAMCVCStillImageResultCoordinator *)self _isDelayingForcedDispatch]
     && [(CAMCVCStillImageResultCoordinator *)self _didReceiveForceRemainingDispatchesIfPossible];
  [(CAMCVCStillImageResultCoordinator *)self _dispatchPendingPropertiesForced:v20];
}

- (void)delayForcedDispatchForPhotoResultSpecifiers:(unint64_t)a3
{
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  v4 = [(CAMCVCStillImageResultCoordinator *)self _receivedPhotos];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    v6 = [(CAMCVCStillImageResultCoordinator *)self _photoResultSpecifiersDelayingForcedDispatch];
    [v6 addObject:v7];
  }
}

- (void)delayForcedDispatchForVideoResultSpecifiers:(unint64_t)a3
{
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  v4 = [(CAMCVCStillImageResultCoordinator *)self _receivedVideos];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0)
  {
    v6 = [(CAMCVCStillImageResultCoordinator *)self _videoResultSpecifiersDelayingForcedDispatch];
    [v6 addObject:v7];
  }
}

- (BOOL)_isDelayingForcedDispatch
{
  v3 = [(CAMCVCStillImageResultCoordinator *)self _photoResultSpecifiersDelayingForcedDispatch];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(CAMCVCStillImageResultCoordinator *)self _videoResultSpecifiersDelayingForcedDispatch];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (void)forceRemainingDispatchesIfPossible
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(CAMCVCStillImageResultCoordinator *)self _setDidReceiveForceRemainingDispatchesIfPossible:1];
  if ([(CAMCVCStillImageResultCoordinator *)self _isDelayingForcedDispatch])
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = [(CAMCVCStillImageResultCoordinator *)self identifier];
      char v5 = [(CAMCVCStillImageResultCoordinator *)self _photoResultSpecifiersDelayingForcedDispatch];
      v6 = CAMDebugStringForCaptureResultSpecifiersSet(v5);
      id v7 = [(CAMCVCStillImageResultCoordinator *)self _videoResultSpecifiersDelayingForcedDispatch];
      id v8 = CAMDebugStringForCaptureResultSpecifiersSet(v7);
      int v9 = 138543874;
      v10 = v4;
      __int16 v11 = 2114;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      BOOL v14 = v8;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: received forceRemainingDispatchesIfPossible but still explicitly waiting for Photos:%{public}@ Videos:%{public}@", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    [(CAMCVCStillImageResultCoordinator *)self _dispatchPendingPropertiesForced:1];
  }
}

- (void)_dispatchPendingPropertiesForced:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  BOOL v5 = [(CAMCVCStillImageResultCoordinator *)self allowMultipleCaptures];
  v6 = [(CAMCVCStillImageResultCoordinator *)self _dispatchedResultSpecifiers];
  uint64_t v7 = [v6 count];
  if (v5 || !v7)
  {
    if (v3)
    {
      id v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = [(CAMCVCStillImageResultCoordinator *)self identifier];
        *(_DWORD *)buf = 138543362;
        v44 = v9;
        _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: forcing remaining dispatches", buf, 0xCu);
      }
    }
    v10 = [(CAMCVCStillImageResultCoordinator *)self allExpectedResultSpecifiers];
    __int16 v11 = [(CAMCVCStillImageResultCoordinator *)self _handledResultSpecifiers];
    BOOL v12 = [(CAMCVCStillImageResultCoordinator *)self shouldReturnFilteredPhotosAsSingleAsset];
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v5) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = 2;
    }
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __70__CAMCVCStillImageResultCoordinator__dispatchPendingPropertiesForced___block_invoke;
    v39[3] = &unk_263FA5500;
    id v15 = v10;
    id v40 = v15;
    BOOL v42 = v12;
    id v16 = v13;
    id v41 = v16;
    [&unk_26BDE04A8 enumerateObjectsWithOptions:v14 usingBlock:v39];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __70__CAMCVCStillImageResultCoordinator__dispatchPendingPropertiesForced___block_invoke_2;
    v32[3] = &unk_263FA5528;
    id v17 = v11;
    id v33 = v17;
    id v34 = v15;
    BOOL v36 = v12;
    BOOL v37 = v3;
    uint64_t v35 = self;
    BOOL v38 = v5;
    id v31 = v15;
    [v16 enumerateObjectsUsingBlock:v32];
    uint64_t v18 = [v17 count];
    uint64_t v19 = [v16 count];
    uint64_t v20 = [v6 count];
    uint64_t v21 = v20;
    int v22 = !v5;
    if (!v5 && v18 == v19 && !v20)
    {
      __int16 v23 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = [(CAMCVCStillImageResultCoordinator *)self identifier];
        *(_DWORD *)buf = 138543362;
        v44 = v24;
        _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Failed to dispatch or fallback so just returning nil", buf, 0xCu);
      }
      uint64_t v25 = [v16 firstObject];
      uint64_t v26 = [v25 integerValue];

      __int16 v27 = [(CAMCVCStillImageResultCoordinator *)self _errorForResultSpecifiers:v26 allowMissingVideo:v3];
      v28 = [(CAMCVCStillImageResultCoordinator *)self delegate];
      [v28 stillImagePersistenceCoordinator:self requestsDispatchForResultSpecifiers:v26 photoProperties:0 videoProperties:0 unfilteredPhotoProperties:0 unfilteredVideoProperties:0 assetAdjustments:0 error:v27];
    }
    if (v21) {
      int v29 = v22;
    }
    else {
      int v29 = 0;
    }
    if (v3 || v29)
    {
      v30 = [(CAMCVCStillImageResultCoordinator *)self delegate];
      [v30 stillImagePersistenceCoordinatorDidCompleteAllDispatches:self];
    }
  }
}

void __70__CAMCVCStillImageResultCoordinator__dispatchPendingPropertiesForced___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    uint64_t v3 = [v7 integerValue];
    BOOL v4 = *(void **)(a1 + 32);
    BOOL v5 = [NSNumber numberWithUnsignedInteger:v3 | 2];
    int v6 = [v4 containsObject:v5];

    if (v3 == (v3 | 2) || !*(unsigned char *)(a1 + 48) || !v6) {
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

uint64_t __70__CAMCVCStillImageResultCoordinator__dispatchPendingPropertiesForced___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) containsObject:v17];
  id v7 = v17;
  if (v6) {
    goto LABEL_2;
  }
  uint64_t v8 = [v17 integerValue];
  unint64_t v9 = v8 & 0xFFFFFFFFFFFFFFFDLL;
  v10 = *(void **)(a1 + 40);
  __int16 v11 = [NSNumber numberWithUnsignedInteger:v8 & 0xFFFFFFFFFFFFFFFDLL];
  int v12 = [v10 containsObject:v11];

  if (v8 == (v8 & 0xFFFFFFFFFFFFFFFDLL) || *(unsigned char *)(a1 + 56) == 0) {
    int v12 = 0;
  }
  if (!*(unsigned char *)(a1 + 57))
  {
    uint64_t v6 = [*(id *)(a1 + 48) _isWaitingOnResultSpecifiers:v8];
    if (v6 & 1) != 0 || ((v12 ^ 1))
    {
      if (!v6) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 48) _isWaitingOnResultSpecifiers:v9];
      if ((v6 & 1) == 0) {
        goto LABEL_11;
      }
    }
    id v7 = v17;
    if (*(unsigned char *)(a1 + 58)) {
      goto LABEL_2;
    }
    goto LABEL_23;
  }
LABEL_11:
  [*(id *)(a1 + 32) addObject:v17];
  uint64_t v14 = *(void **)(a1 + 48);
  int v15 = *(unsigned __int8 *)(a1 + 57);
  if (v12)
  {
    uint64_t v6 = [v14 _attemptDispatchForPairWithFilteredResultSpecifiers:v8 unfilteredResultSpecifiers:v9 forceRemainingDispatches:v15 != 0];
    id v7 = v17;
    if ((v6 & 1) == 0) {
      goto LABEL_2;
    }
  }
  else
  {
    uint64_t v6 = [v14 _attemptDispatchForResultSpecifiers:v8 forceRemainingDispatches:v15 != 0];
    id v7 = v17;
    if (!v6) {
      goto LABEL_2;
    }
  }
  if (!*(unsigned char *)(a1 + 58)) {
LABEL_23:
  }
    *a4 = 1;
LABEL_2:
  return MEMORY[0x270F9A758](v6, v7);
}

- (BOOL)_isWaitingOnResultSpecifiers:(unint64_t)a3
{
  BOOL v5 = [(CAMCVCStillImageResultCoordinator *)self _receivedPhotos];
  uint64_t v6 = [(CAMCVCStillImageResultCoordinator *)self _receivedVideos];
  BOOL v7 = [(CAMCVCStillImageResultCoordinator *)self isExpectingPairedVideo];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  int v9 = [v5 containsObject:v8];

  v10 = [NSNumber numberWithUnsignedInteger:a3];
  char v11 = [v6 containsObject:v10];

  if (v9) {
    char v12 = v7 & (v11 ^ 1);
  }
  else {
    char v12 = 1;
  }

  return v12;
}

- (BOOL)_attemptDispatchForPairWithFilteredResultSpecifiers:(unint64_t)a3 unfilteredResultSpecifiers:(unint64_t)a4 forceRemainingDispatches:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v74 = *MEMORY[0x263EF8340];
  BOOL v9 = [(CAMCVCStillImageResultCoordinator *)self allowMultipleCaptures];
  BOOL v62 = [(CAMCVCStillImageResultCoordinator *)self isExpectingPairedVideo];
  v10 = [(CAMCVCStillImageResultCoordinator *)self _pendingPhotoProperties];
  char v11 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v64 = [v10 objectForKeyedSubscript:v11];

  char v12 = [(CAMCVCStillImageResultCoordinator *)self _pendingVideoProperties];
  id v13 = [NSNumber numberWithUnsignedInteger:a3];
  *((void *)&v63 + 1) = [v12 objectForKeyedSubscript:v13];

  uint64_t v14 = [(CAMCVCStillImageResultCoordinator *)self _pendingPhotoProperties];
  int v15 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v16 = [v14 objectForKeyedSubscript:v15];

  id v17 = [(CAMCVCStillImageResultCoordinator *)self _pendingVideoProperties];
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:a4];
  *(void *)&long long v63 = [v17 objectForKeyedSubscript:v18];

  uint64_t v19 = [(CAMCVCStillImageResultCoordinator *)self _pendingAssetAdjustments];
  uint64_t v20 = [NSNumber numberWithUnsignedInteger:a3];
  v67 = [v19 objectForKeyedSubscript:v20];

  uint64_t v21 = [(CAMCVCStillImageResultCoordinator *)self _errorForResultSpecifiers:a3 allowMissingVideo:v5];
  v66 = [(CAMCVCStillImageResultCoordinator *)self _errorForResultSpecifiers:a4 allowMissingVideo:v5];
  int v22 = os_log_create("com.apple.camera", "Camera");
  __int16 v23 = v22;
  v65 = v21;
  if (__PAIR128__((unint64_t)v66, (unint64_t)v21) == 0)
  {
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    v30 = [(CAMCVCStillImageResultCoordinator *)self identifier];
    if ((a4 & 2) != 0)
    {
      id v31 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if ((a4 & 1) == 0) {
        goto LABEL_22;
      }
    }
    else
    {
      id v31 = &stru_26BD78BA0;
      if ((a4 & 1) == 0)
      {
LABEL_22:
        if (![(__CFString *)v31 length])
        {

          id v31 = @"None";
        }
        v43 = v31;
        if ((a3 & 2) != 0)
        {
          v44 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
          if ((a3 & 1) == 0)
          {
LABEL_29:
            if (![(__CFString *)v44 length])
            {

              v44 = @"None";
            }
            *(_DWORD *)buf = 138543874;
            v69 = v30;
            __int16 v70 = 2114;
            v71 = v43;
            __int16 v72 = 2114;
            v73 = v44;
            _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Dispatching %{public}@+%{public}@", buf, 0x20u);

LABEL_32:
            __int16 v27 = (void *)*((void *)&v63 + 1);
            uint64_t v26 = (void *)v64;
            v28 = (void *)v16;
            int v29 = (void *)v63;
            if (v62)
            {
              if (v63 == 0)
              {
                v46 = os_log_create("com.apple.camera", "Camera");
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  v47 = [(CAMCVCStillImageResultCoordinator *)self identifier];
                  *(_DWORD *)buf = 138543362;
                  v69 = v47;
                  v48 = "ResultCoordinator %{public}@: Missing filtered and unfiltered videos for filtered LivePhoto. Wil"
                        "l treat as regular photo";
                  goto LABEL_52;
                }
LABEL_53:

                goto LABEL_54;
              }
              if (!*((void *)&v63 + 1))
              {
                v46 = os_log_create("com.apple.camera", "Camera");
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  v47 = [(CAMCVCStillImageResultCoordinator *)self identifier];
                  *(_DWORD *)buf = 138543362;
                  v69 = v47;
                  v48 = "ResultCoordinator %{public}@: Missing filtered video for filtered LivePhoto. Will treat as regular photo";
                  goto LABEL_52;
                }
                goto LABEL_53;
              }
              if (!(void)v63)
              {
                v46 = os_log_create("com.apple.camera", "Camera");
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  v47 = [(CAMCVCStillImageResultCoordinator *)self identifier];
                  *(_DWORD *)buf = 138543362;
                  v69 = v47;
                  v48 = "ResultCoordinator %{public}@: Missing unfiltered video for filtered LivePhoto. May result in issues.";
LABEL_52:
                  _os_log_impl(&dword_2099F8000, v46, OS_LOG_TYPE_DEFAULT, v48, buf, 0xCu);

                  goto LABEL_53;
                }
                goto LABEL_53;
              }
            }
LABEL_54:
            BOOL v36 = [(CAMCVCStillImageResultCoordinator *)self delegate];
            BOOL v37 = v36;
            v61 = v67;
            BOOL v38 = self;
            unint64_t v39 = a3;
            id v40 = (void *)v64;
            uint64_t v41 = *((void *)&v63 + 1);
            v53 = v28;
            uint64_t v54 = v63;
            goto LABEL_55;
          }
        }
        else
        {
          v44 = &stru_26BD78BA0;
          if ((a3 & 1) == 0) {
            goto LABEL_29;
          }
        }
        uint64_t v45 = [(__CFString *)v44 stringByAppendingString:@"HDR"];

        v44 = (__CFString *)v45;
        goto LABEL_29;
      }
    }
    uint64_t v42 = [(__CFString *)v31 stringByAppendingString:@"HDR"];

    id v31 = (__CFString *)v42;
    goto LABEL_22;
  }
  if (!v21)
  {
    v28 = (void *)v16;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [(CAMCVCStillImageResultCoordinator *)self identifier];
      id v33 = [v66 localizedDescription];
      *(_DWORD *)buf = 138543618;
      v69 = v32;
      __int16 v70 = 2114;
      v71 = v33;
      _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Using filtered photo alone instead of filtered pair due to error: %{public}@", buf, 0x16u);
    }
    __int16 v27 = (void *)*((void *)&v63 + 1);
    uint64_t v26 = (void *)v64;
    int v29 = (void *)v63;
    if (v62 && !*((void *)&v63 + 1))
    {
      id v34 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = [(CAMCVCStillImageResultCoordinator *)self identifier];
        *(_DWORD *)buf = 138543362;
        v69 = v35;
        _os_log_impl(&dword_2099F8000, v34, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Missing video for LivePhoto. Will treat as regular photo", buf, 0xCu);
      }
    }
    BOOL v36 = [(CAMCVCStillImageResultCoordinator *)self delegate];
    BOOL v37 = v36;
    v61 = 0;
    BOOL v38 = self;
    unint64_t v39 = a3;
    id v40 = (void *)v64;
    uint64_t v41 = *((void *)&v63 + 1);
    goto LABEL_48;
  }
  if (!v66)
  {
    __int16 v27 = (void *)*((void *)&v63 + 1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v49 = [(CAMCVCStillImageResultCoordinator *)self identifier];
      v50 = [v65 localizedDescription];
      *(_DWORD *)buf = 138543618;
      v69 = v49;
      __int16 v70 = 2114;
      v71 = v50;
      _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Using unfiltered photo alone instead of filtered pair due to error: %{public}@", buf, 0x16u);
    }
    uint64_t v26 = (void *)v64;
    v28 = (void *)v16;
    int v29 = (void *)v63;
    if (v62 && !(void)v63)
    {
      v51 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = [(CAMCVCStillImageResultCoordinator *)self identifier];
        *(_DWORD *)buf = 138543362;
        v69 = v52;
        _os_log_impl(&dword_2099F8000, v51, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Missing video for LivePhoto. Will treat as regular photo", buf, 0xCu);
      }
    }
    BOOL v36 = [(CAMCVCStillImageResultCoordinator *)self delegate];
    BOOL v37 = v36;
    v61 = 0;
    BOOL v38 = self;
    unint64_t v39 = a4;
    id v40 = v28;
    uint64_t v41 = v63;
LABEL_48:
    v53 = 0;
    uint64_t v54 = 0;
LABEL_55:
    [v36 stillImagePersistenceCoordinator:v38 requestsDispatchForResultSpecifiers:v39 photoProperties:v40 videoProperties:v41 unfilteredPhotoProperties:v53 unfilteredVideoProperties:v54 assetAdjustments:v61 error:0];

    v24 = [(CAMCVCStillImageResultCoordinator *)self _dispatchedResultSpecifiers];
    v55 = [NSNumber numberWithUnsignedInteger:a3];
    [v24 addObject:v55];

    v56 = [NSNumber numberWithUnsignedInteger:a4];
    [v24 addObject:v56];

    BOOL v25 = 1;
    goto LABEL_56;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v58 = [(CAMCVCStillImageResultCoordinator *)self identifier];
    v59 = [v21 localizedDescription];
    v60 = [v66 localizedDescription];
    *(_DWORD *)buf = 138543874;
    v69 = v58;
    __int16 v70 = 2114;
    v71 = v59;
    __int16 v72 = 2114;
    v73 = v60;
    _os_log_error_impl(&dword_2099F8000, v23, OS_LOG_TYPE_ERROR, "ResultCoordinator %{public}@: Could not dispatch filtered pair due to errors: %{public}@ and %{public}@", buf, 0x20u);

    uint64_t v21 = v65;
  }

  if (v9)
  {
    v24 = [(CAMCVCStillImageResultCoordinator *)self delegate];
    [v24 stillImagePersistenceCoordinator:self requestsDispatchForResultSpecifiers:a3 photoProperties:0 videoProperties:0 unfilteredPhotoProperties:0 unfilteredVideoProperties:0 assetAdjustments:0 error:v21];
    BOOL v25 = 0;
    __int16 v27 = (void *)*((void *)&v63 + 1);
    uint64_t v26 = (void *)v64;
    v28 = (void *)v16;
    int v29 = (void *)v63;
LABEL_56:

    goto LABEL_57;
  }
  BOOL v25 = 0;
  __int16 v27 = (void *)*((void *)&v63 + 1);
  uint64_t v26 = (void *)v64;
  v28 = (void *)v16;
  int v29 = (void *)v63;
LABEL_57:

  return v25;
}

- (BOOL)_attemptDispatchForResultSpecifiers:(unint64_t)a3 forceRemainingDispatches:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  BOOL v7 = [(CAMCVCStillImageResultCoordinator *)self allowMultipleCaptures];
  uint64_t v8 = [(CAMCVCStillImageResultCoordinator *)self _errorForResultSpecifiers:a3 allowMissingVideo:v4];
  BOOL v9 = os_log_create("com.apple.camera", "Camera");
  v10 = v9;
  if (!v8)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:

      int v15 = [(CAMCVCStillImageResultCoordinator *)self _pendingPhotoProperties];
      uint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
      id v17 = [v15 objectForKeyedSubscript:v16];

      uint64_t v18 = [(CAMCVCStillImageResultCoordinator *)self _pendingVideoProperties];
      uint64_t v19 = [NSNumber numberWithUnsignedInteger:a3];
      uint64_t v20 = [v18 objectForKeyedSubscript:v19];

      uint64_t v21 = [(CAMCVCStillImageResultCoordinator *)self _pendingAssetAdjustments];
      int v22 = [NSNumber numberWithUnsignedInteger:a3];
      __int16 v23 = [v21 objectForKeyedSubscript:v22];

      if ([(CAMCVCStillImageResultCoordinator *)self isExpectingPairedVideo] && !v20)
      {
        v24 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v25 = [(CAMCVCStillImageResultCoordinator *)self identifier];
          *(_DWORD *)buf = 138543362;
          id v34 = v25;
          _os_log_impl(&dword_2099F8000, v24, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Missing video for LivePhoto. Will treat as regular photo", buf, 0xCu);
        }
      }
      uint64_t v26 = [(CAMCVCStillImageResultCoordinator *)self delegate];
      [v26 stillImagePersistenceCoordinator:self requestsDispatchForResultSpecifiers:a3 photoProperties:v17 videoProperties:v20 unfilteredPhotoProperties:0 unfilteredVideoProperties:0 assetAdjustments:v23 error:0];

      char v11 = [(CAMCVCStillImageResultCoordinator *)self _dispatchedResultSpecifiers];
      __int16 v27 = [NSNumber numberWithUnsignedInteger:a3];
      [v11 addObject:v27];

      goto LABEL_20;
    }
    char v12 = [(CAMCVCStillImageResultCoordinator *)self identifier];
    if ((a3 & 2) != 0)
    {
      id v13 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if ((a3 & 1) == 0)
      {
LABEL_11:
        if (![(__CFString *)v13 length])
        {

          id v13 = @"None";
        }
        *(_DWORD *)buf = 138543618;
        id v34 = v12;
        __int16 v35 = 2114;
        BOOL v36 = v13;
        _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "ResultCoordinator %{public}@: Dispatching %{public}@", buf, 0x16u);

        goto LABEL_14;
      }
    }
    else
    {
      id v13 = &stru_26BD78BA0;
      if ((a3 & 1) == 0) {
        goto LABEL_11;
      }
    }
    uint64_t v14 = [(__CFString *)v13 stringByAppendingString:@"HDR"];

    id v13 = (__CFString *)v14;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v29 = [(CAMCVCStillImageResultCoordinator *)self identifier];
    v30 = [v8 localizedDescription];
    if ((a3 & 2) != 0)
    {
      id v31 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
    }
    else
    {
      id v31 = &stru_26BD78BA0;
    }
    if (a3)
    {
      uint64_t v32 = [(__CFString *)v31 stringByAppendingString:@"HDR"];

      id v31 = (__CFString *)v32;
    }
    if (![(__CFString *)v31 length])
    {

      id v31 = @"None";
    }
    *(_DWORD *)buf = 138543874;
    id v34 = v29;
    __int16 v35 = 2114;
    BOOL v36 = v30;
    __int16 v37 = 2114;
    BOOL v38 = v31;
    _os_log_error_impl(&dword_2099F8000, v10, OS_LOG_TYPE_ERROR, "ResultCoordinator %{public}@: %{public}@ for %{public}@", buf, 0x20u);
  }
  if (v7)
  {
    char v11 = [(CAMCVCStillImageResultCoordinator *)self delegate];
    [v11 stillImagePersistenceCoordinator:self requestsDispatchForResultSpecifiers:a3 photoProperties:0 videoProperties:0 unfilteredPhotoProperties:0 unfilteredVideoProperties:0 assetAdjustments:0 error:v8];
LABEL_20:
  }
  return v8 == 0;
}

- (id)_errorForResultSpecifiers:(unint64_t)a3 allowMissingVideo:(BOOL)a4
{
  BOOL v7 = [(CAMCVCStillImageResultCoordinator *)self isExpectingPairedVideo];
  uint64_t v8 = [(CAMCVCStillImageResultCoordinator *)self _pendingPhotoProperties];
  BOOL v9 = [NSNumber numberWithUnsignedInteger:a3];
  v10 = [v8 objectForKeyedSubscript:v9];

  char v11 = [(CAMCVCStillImageResultCoordinator *)self _pendingVideoProperties];
  char v12 = [NSNumber numberWithUnsignedInteger:a3];
  id v13 = [v11 objectForKeyedSubscript:v12];

  uint64_t v14 = [v10 objectForKeyedSubscript:@"CAMCameraViewControllerCaptureError"];
  if (v14)
  {
    uint64_t v15 = -38101;
    uint64_t v16 = @"Photo capture error";
LABEL_3:
    id v17 = [(CAMCVCStillImageResultCoordinator *)self _errorWithDescription:v16 code:v15];
    goto LABEL_4;
  }
  if (!v10)
  {
    uint64_t v15 = -38102;
    uint64_t v16 = @"Missing photo properties";
    goto LABEL_3;
  }
  id v17 = 0;
  if (v7 && !v13 && !a4)
  {
    uint64_t v15 = -38103;
    uint64_t v16 = @"Missing video properties";
    goto LABEL_3;
  }
LABEL_4:

  return v17;
}

- (id)_errorWithDescription:(id)a3 code:(int64_t)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F08320];
  v11[0] = a3;
  BOOL v5 = NSDictionary;
  id v6 = a3;
  BOOL v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"CAMCVCStillImageResultCoordinatorErrorDomain" code:a4 userInfo:v7];

  return v8;
}

- (CAMCVCStillImageResultCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMCVCStillImageResultCoordinatorDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)allExpectedResultSpecifiers
{
  return self->_allExpectedResultSpecifiers;
}

- (BOOL)isExpectingPairedVideo
{
  return self->_expectingPairedVideo;
}

- (BOOL)allowMultipleCaptures
{
  return self->_allowMultipleCaptures;
}

- (BOOL)shouldReturnFilteredPhotosAsSingleAsset
{
  return self->_shouldReturnFilteredPhotosAsSingleAsset;
}

- (NSMutableSet)_receivedPhotos
{
  return self->__receivedPhotos;
}

- (NSMutableSet)_receivedVideos
{
  return self->__receivedVideos;
}

- (NSMutableSet)_photoResultSpecifiersDelayingForcedDispatch
{
  return self->__photoResultSpecifiersDelayingForcedDispatch;
}

- (NSMutableSet)_videoResultSpecifiersDelayingForcedDispatch
{
  return self->__videoResultSpecifiersDelayingForcedDispatch;
}

- (BOOL)_didReceiveForceRemainingDispatchesIfPossible
{
  return self->__didReceiveForceRemainingDispatchesIfPossible;
}

- (void)_setDidReceiveForceRemainingDispatchesIfPossible:(BOOL)a3
{
  self->__didReceiveForceRemainingDispatchesIfPossible = a3;
}

- (NSMutableSet)_handledResultSpecifiers
{
  return self->__handledResultSpecifiers;
}

- (NSMutableSet)_dispatchedResultSpecifiers
{
  return self->__dispatchedResultSpecifiers;
}

- (NSMutableDictionary)_pendingPhotoProperties
{
  return self->__pendingPhotoProperties;
}

- (NSMutableDictionary)_pendingVideoProperties
{
  return self->__pendingVideoProperties;
}

- (NSMutableDictionary)_pendingAssetAdjustments
{
  return self->__pendingAssetAdjustments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pendingAssetAdjustments, 0);
  objc_storeStrong((id *)&self->__pendingVideoProperties, 0);
  objc_storeStrong((id *)&self->__pendingPhotoProperties, 0);
  objc_storeStrong((id *)&self->__dispatchedResultSpecifiers, 0);
  objc_storeStrong((id *)&self->__handledResultSpecifiers, 0);
  objc_storeStrong((id *)&self->__videoResultSpecifiersDelayingForcedDispatch, 0);
  objc_storeStrong((id *)&self->__photoResultSpecifiersDelayingForcedDispatch, 0);
  objc_storeStrong((id *)&self->__receivedVideos, 0);
  objc_storeStrong((id *)&self->__receivedPhotos, 0);
  objc_storeStrong((id *)&self->_allExpectedResultSpecifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end