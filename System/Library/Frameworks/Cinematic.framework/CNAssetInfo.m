@interface CNAssetInfo
+ (void)checkIfCinematic:(AVAsset *)asset completionHandler:(void *)completionHandler;
+ (void)loadFromAsset:(AVAsset *)asset completionHandler:(void *)completionHandler;
+ (void)loadFromCinematicVideoTrack:(id)a3 completionHandler:(id)a4;
- (AVAsset)asset;
- (AVAssetTrack)cinematicDisparityTrack;
- (AVAssetTrack)cinematicMetadataTrack;
- (AVAssetTrack)cinematicVideoTrack;
- (CGAffineTransform)preferredTransform;
- (CGSize)naturalSize;
- (CGSize)preferredSize;
- (CMTimeRange)timeRange;
- (NSArray)allCinematicTracks;
- (NSArray)sampleDataTrackIDs;
- (NSArray)videoCompositionTrackIDs;
- (NSArray)videoCompositionTracks;
- (id)_initWithVideoTrack:(id)a3 disparityTrack:(id)a4 metadataTrack:(id)a5;
- (void)setCinematicDisparityTrack:(id)a3;
- (void)setCinematicMetadataTrack:(id)a3;
- (void)setCinematicVideoTrack:(id)a3;
@end

@implementation CNAssetInfo

+ (void)checkIfCinematic:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  id v5 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__CNAssetInfo_checkIfCinematic_completionHandler___block_invoke;
  v7[3] = &unk_26517A2E8;
  id v8 = v5;
  id v6 = v5;
  +[CNAssetInfo loadFromAsset:asset completionHandler:v7];
}

uint64_t __50__CNAssetInfo_checkIfCinematic_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2) {
    BOOL v4 = a3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = v4;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v5);
}

+ (void)loadFromAsset:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  id v6 = asset;
  id v7 = completionHandler;
  uint64_t v8 = *MEMORY[0x263EF9D48];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke;
  v11[3] = &unk_26517A338;
  v12 = v6;
  id v13 = v7;
  id v14 = a1;
  id v9 = v7;
  v10 = v6;
  [(AVAsset *)v10 loadTracksWithMediaType:v8 completionHandler:v11];
}

void __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a2;
  v16 = v4;
  id v17 = a3;
  if (v17)
  {
    uint64_t v5 = _CNLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_cold_2();
    }

    id v6 = _CNCinematicError(3, v17);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
  else
  {
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy_;
    v31[4] = __Block_byref_object_dispose_;
    id v32 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    id v7 = dispatch_group_create();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v4;
    uint64_t v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16, v4);
    if (v9)
    {
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v12 isEnabled])
          {
            dispatch_group_enter(v7);
            id v13 = *(void **)(a1 + 48);
            v19[0] = MEMORY[0x263EF8330];
            v19[1] = 3221225472;
            v19[2] = __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_2;
            v19[3] = &unk_26517A310;
            v21 = v31;
            v22 = &v27;
            v20 = v7;
            [v13 loadFromCinematicVideoTrack:v12 completionHandler:v19];
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v9);
    }

    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v28 + 24))
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      id v14 = _CNLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_cold_1(v14);
      }

      v15 = _CNCinematicError(3, 0);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v31, 8);
  }
}

void __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (!a3)
  {
    id v6 = [v9 cinematicDisparityTrack];
    if ([v6 isEnabled])
    {
      id v7 = [v9 cinematicMetadataTrack];
      int v8 = [v7 isEnabled];

      if (v8)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
    else
    {
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (void)loadFromCinematicVideoTrack:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke;
  v11[3] = &unk_26517A388;
  id v12 = v6;
  id v13 = v7;
  id v14 = a1;
  int v8 = (void *)*MEMORY[0x263EFA1C0];
  id v9 = v7;
  id v10 = v6;
  _CNLoadFirstAssociatedTrack(v10, v8, v11);
}

void __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _CNLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    int v8 = *(void **)(a1 + 32);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4;
    v19 = &unk_26517A360;
    id v20 = v8;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v22 = v9;
    uint64_t v23 = v10;
    id v21 = v5;
    id v11 = v20;
    id v12 = &v16;
    id v13 = objc_msgSend(v11, "asset", v16, v17, v18, v19);
    uint64_t v14 = *MEMORY[0x263EF9D08];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = ___CNLoadMetadataTrackForVideoTrack_block_invoke;
    v24[3] = &unk_26517A2B8;
    id v25 = v11;
    long long v26 = v12;
    id v15 = v11;
    [v13 loadTracksWithMediaType:v14 completionHandler:v24];
  }
}

void __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v15 = _CNLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4_cold_1();
    }

    uint64_t v16 = 3;
    uint64_t v17 = v7;
    goto LABEL_12;
  }
  int v8 = [v5 formatDescriptions];
  id v9 = [v8 firstObject];

  if (!v9
    || (CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v9),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [@"mdta/" stringByAppendingString:0x26F895670],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v10 containsObject:v11],
        v11,
        v10,
        (v12 & 1) == 0))
  {
    v18 = _CNLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4_cold_2();
    }

    uint64_t v16 = 4;
    uint64_t v17 = 0;
LABEL_12:
    id v13 = _CNCinematicError(v16, v17);
    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_13;
  }
  id v13 = (void *)[objc_alloc(*(Class *)(a1 + 56)) _initWithVideoTrack:*(void *)(a1 + 32) disparityTrack:*(void *)(a1 + 40) metadataTrack:v5];
  uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_13:
  v14();
}

- (AVAsset)asset
{
  v2 = [(CNAssetInfo *)self cinematicVideoTrack];
  uint64_t v3 = [v2 asset];

  return (AVAsset *)v3;
}

- (CMTimeRange)timeRange
{
  *(_OWORD *)&retstr->start.epoch = 0u;
  *(_OWORD *)&retstr->duration.timescale = 0u;
  *(_OWORD *)&retstr->start.value = 0u;
  id v5 = [(CNAssetInfo *)self cinematicVideoTrack];
  id v6 = v5;
  if (v5)
  {
    [v5 timeRange];
  }
  else
  {
    *(_OWORD *)&retstr->start.epoch = 0u;
    *(_OWORD *)&retstr->duration.timescale = 0u;
    *(_OWORD *)&retstr->start.value = 0u;
  }

  id v7 = [(CNAssetInfo *)self cinematicDisparityTrack];
  int v8 = v7;
  if (v7) {
    [v7 timeRange];
  }
  else {
    memset(&otherRange, 0, sizeof(otherRange));
  }
  long long v9 = *(_OWORD *)&retstr->start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&retstr->start.value;
  *(_OWORD *)&range.start.epoch = v9;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&retstr->duration.timescale;
  CMTimeRangeGetIntersection(&v19, &range, &otherRange);
  long long v10 = *(_OWORD *)&v19.start.epoch;
  *(_OWORD *)&retstr->start.value = *(_OWORD *)&v19.start.value;
  *(_OWORD *)&retstr->start.epoch = v10;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)&v19.duration.timescale;

  id v11 = [(CNAssetInfo *)self cinematicMetadataTrack];
  char v12 = v11;
  if (v11) {
    [v11 timeRange];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  long long v13 = *(_OWORD *)&retstr->start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&retstr->start.value;
  *(_OWORD *)&range.start.epoch = v13;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&retstr->duration.timescale;
  CMTimeRangeGetIntersection(&v19, &range, &v16);
  long long v14 = *(_OWORD *)&v19.start.epoch;
  *(_OWORD *)&retstr->start.value = *(_OWORD *)&v19.start.value;
  *(_OWORD *)&retstr->start.epoch = v14;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)&v19.duration.timescale;

  return result;
}

- (CGSize)naturalSize
{
  v2 = [(CNAssetInfo *)self cinematicVideoTrack];
  [v2 naturalSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)preferredSize
{
  CGFloat v3 = *MEMORY[0x263F001A8];
  CGFloat v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(CNAssetInfo *)self naturalSize];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [(CNAssetInfo *)self preferredTransform];
  v13.origin.x = v3;
  v13.origin.y = v4;
  v13.size.double width = v6;
  v13.size.double height = v8;
  CGRect v14 = CGRectApplyAffineTransform(v13, &v11);
  double width = v14.size.width;
  double height = v14.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  CGFloat v4 = [(CNAssetInfo *)self cinematicVideoTrack];
  if (v4)
  {
    CGFloat v6 = v4;
    [v4 preferredTransform];
    CGFloat v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (NSArray)allCinematicTracks
{
  v8[3] = *MEMORY[0x263EF8340];
  CGFloat v3 = [(CNAssetInfo *)self cinematicVideoTrack];
  CGFloat v4 = [(CNAssetInfo *)self cinematicDisparityTrack];
  v8[1] = v4;
  double v5 = [(CNAssetInfo *)self cinematicMetadataTrack];
  v8[2] = v5;
  CGFloat v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return (NSArray *)v6;
}

- (NSArray)videoCompositionTracks
{
  v7[2] = *MEMORY[0x263EF8340];
  CGFloat v3 = [(CNAssetInfo *)self cinematicVideoTrack];
  v7[0] = v3;
  CGFloat v4 = [(CNAssetInfo *)self cinematicDisparityTrack];
  v7[1] = v4;
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- (NSArray)videoCompositionTrackIDs
{
  v11[2] = *MEMORY[0x263EF8340];
  CGFloat v3 = NSNumber;
  CGFloat v4 = [(CNAssetInfo *)self cinematicVideoTrack];
  double v5 = objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "trackID"));
  v11[0] = v5;
  CGFloat v6 = NSNumber;
  double v7 = [(CNAssetInfo *)self cinematicDisparityTrack];
  CGFloat v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "trackID"));
  v11[1] = v8;
  long long v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSArray)sampleDataTrackIDs
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = NSNumber;
  CGFloat v3 = [(CNAssetInfo *)self cinematicMetadataTrack];
  CGFloat v4 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "trackID"));
  v7[0] = v4;
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return (NSArray *)v5;
}

- (id)_initWithVideoTrack:(id)a3 disparityTrack:(id)a4 metadataTrack:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CNAssetInfo;
  char v12 = [(CNAssetInfo *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cinematicVideoTrack, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (AVAssetTrack)cinematicVideoTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCinematicVideoTrack:(id)a3
{
}

- (AVAssetTrack)cinematicDisparityTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCinematicDisparityTrack:(id)a3
{
}

- (AVAssetTrack)cinematicMetadataTrack
{
  return (AVAssetTrack *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCinematicMetadataTrack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cinematicMetadataTrack, 0);
  objc_storeStrong((id *)&self->_cinematicDisparityTrack, 0);

  objc_storeStrong((id *)&self->_cinematicVideoTrack, 0);
}

void __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_243267000, log, OS_LOG_TYPE_DEBUG, "Error: unable to find video track with associated cinematic tracks", v1, 2u);
}

void __47__CNAssetInfo_loadFromAsset_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_243267000, v0, v1, "Error: (%@) loading video tracks in asset %@");
}

void __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_243267000, v0, v1, "Error: (%@) unable to locate disparity track for video track %@");
}

void __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_243267000, v0, v1, "Error: (%@) unable to locate metadata track for video track %@");
}

void __61__CNAssetInfo_loadFromCinematicVideoTrack_completionHandler___block_invoke_4_cold_2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_243267000, v0, v1, "Error: located metadata track %@ for video track %@ does not have expected format");
}

@end