@interface CFXEffectMessagesStickerUtilities
+ (CGSize)JFX_recommendedStickerPreviewSizeInPixelsForStickerSize:(int64_t)a3;
+ (id)animatedPreviewFileNameForOverlayID:(id)a3;
+ (id)animatedPreviewsDirectory;
+ (id)overlayIDFromAnimatedPreviewFileName:(id)a3;
+ (id)stickerPropertiesForIndex:(int64_t)a3 forEffectTypeId:(id)a4;
+ (int64_t)numberOfStickersForEffectTypeId:(id)a3;
+ (void)cacheAnimatedStickerPreviewsForOverlayTypeId:(id)a3 atStickerSize:(int64_t)a4 previewDuration:(double)a5 previewFrameRate:(unint64_t)a6 previewCompletedBlock:(id)a7;
@end

@implementation CFXEffectMessagesStickerUtilities

+ (void)cacheAnimatedStickerPreviewsForOverlayTypeId:(id)a3 atStickerSize:(int64_t)a4 previewDuration:(double)a5 previewFrameRate:(unint64_t)a6 previewCompletedBlock:(id)a7
{
  v56[3] = *MEMORY[0x263EF8340];
  id v36 = a3;
  id v35 = a7;
  id v39 = a1;
  v37 = [a1 animatedPreviewsDirectory];
  if (cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__onceToken != -1) {
    dispatch_once(&cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__onceToken, &__block_literal_global_37);
  }
  id v10 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v11 = *MEMORY[0x263F614E0];
  v56[0] = *MEMORY[0x263F614D8];
  v56[1] = v11;
  v56[2] = *MEMORY[0x263F614E8];
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:3];
  v34 = (void *)[v10 initWithArray:v12];

  id v13 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v14 = *MEMORY[0x263F61400];
  v55[0] = *MEMORY[0x263F613F8];
  v55[1] = v14;
  v55[2] = *MEMORY[0x263F61408];
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:3];
  v33 = (void *)[v13 initWithArray:v15];

  v16 = JFXLog_pickerUI();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[CFXEffectMessagesStickerUtilities cacheAnimatedStickerPreviewsForOverlayTypeId:atStickerSize:previewDuration:previewFrameRate:previewCompletedBlock:](v16);
  }

  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = 0;
  v38 = +[CFXEffectType effectTypeWithIdentifier:v36];
  v17 = +[CFXEffect effectIdentifiersForEffectType:](CFXEffect, "effectIdentifiersForEffectType:");
  uint64_t v18 = [v17 count];
  if (v18)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      v20 = [v17 objectAtIndexedSubscript:i];
      v21 = +[CFXEffect effectWithIdentifier:v20 forEffectType:v38];
      v22 = [v21 jtEffect];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0
        || ([v21 jtEffect],
            v24 = objc_claimAutoreleasedReturnValue(),
            char v25 = [v24 isEmoji],
            v24,
            (v25 & 1) == 0))
      {
        v26 = [v39 animatedPreviewFileNameForOverlayID:v20];
        v27 = [v37 stringByAppendingPathComponent:v26];
        v28 = [MEMORY[0x263F08850] defaultManager];
        char v29 = [v28 fileExistsAtPath:v27];

        if ((v29 & 1) == 0)
        {
          dispatch_group_enter((dispatch_group_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup);
          v30 = cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_17;
          block[3] = &unk_264C0B980;
          double v49 = a5;
          unint64_t v50 = a6;
          id v42 = v36;
          id v43 = v34;
          id v44 = v20;
          id v45 = v33;
          id v51 = v39;
          int64_t v52 = a4;
          id v46 = v27;
          v48 = v54;
          id v47 = v35;
          uint64_t v53 = i;
          dispatch_async(v30, block);
        }
      }
    }
  }
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_20;
  v40[3] = &unk_264C0B510;
  v40[4] = v54;
  dispatch_group_notify((dispatch_group_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup, MEMORY[0x263EF83A0], v40);

  _Block_object_dispose(v54, 8);
}

uint64_t __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(2);
  v1 = (void *)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingSemaphore;
  cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingSemaphore = (uint64_t)v0;

  dispatch_queue_t v2 = dispatch_queue_create("EffectBrowser.animatedPreviewWritingQ", 0);
  v3 = (void *)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingQueue;
  cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingQueue = (uint64_t)v2;

  cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup = (uint64_t)dispatch_group_create();
  return MEMORY[0x270F9A758]();
}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_17(uint64_t a1)
{
  dispatch_queue_t v2 = cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingSemaphore;
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v3);
  double v4 = *(double *)(a1 + 88);
  double v5 = (double)*(unint64_t *)(a1 + 96);
  if (*(__CFString **)(a1 + 32) == @"Shapes")
  {
    if ([*(id *)(a1 + 40) containsObject:*(void *)(a1 + 48)])
    {
      double v4 = 0.8;
    }
    else if ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F614F0]])
    {
      double v5 = 22.0;
    }
    else if ([*(id *)(a1 + 56) containsObject:*(void *)(a1 + 48)])
    {
      double v5 = 10.0;
    }
    else if ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61418]])
    {
      double v5 = 6.0;
    }
    else if ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F613E8]])
    {
      double v5 = 8.0;
    }
  }
  if (([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61400]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F613F0]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61408]] & 1) != 0
    || [*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61410]])
  {
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61428]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61470]] & 1) != 0
    || (uint64_t v7 = *MEMORY[0x263F61438], ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61438]] & 1) != 0)
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F614B0]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61478]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61430]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61450]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61498]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61490]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61488]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61448]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61468]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F614A0]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61440]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61458]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F614A8]] & 1) != 0
    || ([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F614B8]] & 1) != 0
    || [*(id *)(a1 + 48) isEqualToString:v7])
  {
    double v5 = 8.0;
  }
  if (([*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61480]] & 1) != 0
    || [*(id *)(a1 + 48) isEqualToString:*MEMORY[0x263F61460]])
  {
    double v5 = 6.0;
  }
  objc_msgSend((id)objc_opt_class(), "JFX_recommendedStickerPreviewSizeInPixelsForStickerSize:", *(void *)(a1 + 112));
  double v9 = v8;
  double v11 = v10;
  v12 = -[CFXOverlayPickerAnimatedPreviewWriter initWithOverlayEffectId:previewSizeInPixels:previewDuration:previewFrameRate:previewStartFrameIndex:]([CFXOverlayPickerAnimatedPreviewWriter alloc], "initWithOverlayEffectId:previewSizeInPixels:previewDuration:previewFrameRate:previewStartFrameIndex:", *(void *)(a1 + 48), (unint64_t)v5, v6, v8, v10, v4);
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 64);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2;
    v16[3] = &unk_264C0B958;
    long long v15 = *(_OWORD *)(a1 + 72);
    id v14 = (id)v15;
    long long v18 = v15;
    uint64_t v19 = *(void *)(a1 + 120);
    id v17 = *(id *)(a1 + 64);
    double v20 = v9;
    double v21 = v11;
    [(CFXOverlayPickerAnimatedPreviewWriter *)v12 writeAnimatedPreviewToPath:v13 completion:v16];
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingSemaphore);
    dispatch_group_leave((dispatch_group_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup);
  }
}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (*(void *)(a1 + 40))
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_3;
      v6[3] = &unk_264C0B930;
      id v3 = *(id *)(a1 + 40);
      uint64_t v4 = *(void *)(a1 + 56);
      id v7 = v3;
      uint64_t v8 = v4;
      dispatch_async(MEMORY[0x263EF83A0], v6);
    }
    double v5 = JFXLog_pickerUI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2_cold_1(a1, v5);
    }
  }
  else
  {
    double v5 = JFXLog_pickerUI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2_cold_2(a1, v5);
    }
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewWritingSemaphore);
  dispatch_group_leave((dispatch_group_t)cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock__s_animatedPreviewProcessingGroup);
}

uint64_t __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_20(uint64_t a1)
{
  dispatch_queue_t v2 = JFXLog_pickerUI();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_20_cold_1(v2);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    [MEMORY[0x263F61248] noteApplicationDidReceiveMemoryWarning];
  }
}

+ (CGSize)JFX_recommendedStickerPreviewSizeInPixelsForStickerSize:(int64_t)a3
{
  double v3 = dbl_234D61420[a3 == 1];
  if (a3 == 2) {
    double v3 = 618.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)animatedPreviewsDirectory
{
  dispatch_queue_t v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  double v3 = [v2 lastObject];

  double v4 = [v3 stringByAppendingPathComponent:@"animatedPreviews"];
  double v5 = [MEMORY[0x263F08850] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08850] defaultManager];
    [v7 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v4;
}

+ (id)animatedPreviewFileNameForOverlayID:(id)a3
{
  double v3 = (void *)MEMORY[0x263EFF960];
  id v4 = a3;
  double v5 = [v3 preferredLanguages];
  char v6 = [v5 firstObject];

  id v7 = [NSString stringWithFormat:@"%@_%@_%@", @"CFXAnimatedPreviewV10", v4, v6];

  uint64_t v8 = [v7 stringByAppendingPathExtension:@"png"];

  return v8;
}

+ (id)overlayIDFromAnimatedPreviewFileName:(id)a3
{
  double v3 = [a3 lastPathComponent];
  if ([v3 isEqualToString:@"EmojiCustomAnimatedPreview.png"])
  {
    id v4 = (id)*MEMORY[0x263F61420];
    double v5 = v3;
  }
  else
  {
    double v5 = [v3 stringByDeletingPathExtension];

    if ([v5 hasPrefix:@"CFXAnimatedPreviewV10"])
    {
      char v6 = [v5 componentsSeparatedByString:@"_"];
      if ([v6 count] == 3)
      {
        id v4 = [v6 objectAtIndexedSubscript:1];
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

+ (int64_t)numberOfStickersForEffectTypeId:(id)a3
{
  id v3 = a3;
  id v4 = +[CFXEffectType effectTypeWithIdentifier:v3];
  double v5 = +[CFXEffect effectIdentifiersForEffectType:v4];
  char v6 = JFXLog_pickerUI();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[CFXEffectMessagesStickerUtilities numberOfStickersForEffectTypeId:]((uint64_t)v3, v6);
  }

  int64_t v7 = [v5 count];
  return v7;
}

+ (id)stickerPropertiesForIndex:(int64_t)a3 forEffectTypeId:(id)a4
{
  id v5 = a4;
  char v6 = +[CFXEffectType effectTypeWithIdentifier:v5];
  int64_t v7 = [v6 effects];
  uint64_t v8 = JFXLog_pickerUI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[CFXEffectMessagesStickerUtilities stickerPropertiesForIndex:forEffectTypeId:]((uint64_t)v5, a3, v8);
  }
  char v25 = v5;

  double v9 = [v7 objectAtIndex:a3];
  double v10 = [v9 identifier];
  double v11 = [v9 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([v9 jtEffect],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isEmoji],
        v13,
        v14))
  {
    long long v15 = [MEMORY[0x263F086E0] jfxBundle];
    v16 = [v15 pathForResource:@"EmojiCustomAnimatedPreview.png" ofType:0];
  }
  else
  {
    long long v15 = +[CFXEffectMessagesStickerUtilities animatedPreviewsDirectory];
    id v17 = +[CFXEffectMessagesStickerUtilities animatedPreviewFileNameForOverlayID:v10];
    v16 = [v15 stringByAppendingPathComponent:v17];
  }
  long long v18 = [NSURL fileURLWithPath:v16];
  uint64_t v19 = [CFXEffectMessagesStickerProperties alloc];
  double v20 = [v9 identifier];
  double v21 = [v9 jtEffect];
  v22 = [v21 accessibilityName];
  v23 = [(CFXEffectMessagesStickerProperties *)v19 initWithEffectID:v20 previewUrl:v18 localizedDescription:v22];

  return v23;
}

+ (void)cacheAnimatedStickerPreviewsForOverlayTypeId:(os_log_t)log atStickerSize:previewDuration:previewFrameRate:previewCompletedBlock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "began writing animated previews for overlays", v1, 2u);
}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = NSStringFromCGSize(*(CGSize *)(a1 + 64));
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "wrote animated preview to %@ at size %@", (uint8_t *)&v5, 0x16u);
}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "failed to write animated preview to %@", (uint8_t *)&v3, 0xCu);
}

void __151__CFXEffectMessagesStickerUtilities_cacheAnimatedStickerPreviewsForOverlayTypeId_atStickerSize_previewDuration_previewFrameRate_previewCompletedBlock___block_invoke_20_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "finished writing animated previews for overlays", v1, 2u);
}

+ (void)numberOfStickersForEffectTypeId:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "funcamStickerBrowser requested sticker count for effect type %@", (uint8_t *)&v2, 0xCu);
}

+ (void)stickerPropertiesForIndex:(os_log_t)log forEffectTypeId:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "funcamStickerBrowser requested sticker at %ld for effect type %@", (uint8_t *)&v3, 0x16u);
}

@end