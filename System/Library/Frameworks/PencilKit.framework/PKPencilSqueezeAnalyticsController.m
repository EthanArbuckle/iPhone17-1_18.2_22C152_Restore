@interface PKPencilSqueezeAnalyticsController
+ (uint64_t)currentSqueezeThresholdIndex;
- (id)initWithDelegate:(id *)a1;
- (void)_didHideMiniPaletteWithBlock:(uint64_t)a1;
- (void)_logSqueezeCategory:(uint64_t)a1;
- (void)didHideMiniPaletteByChangingContext;
- (void)didHideMiniPaletteByDrawing;
- (void)didHideMiniPaletteBySqueezingAgain;
- (void)didHideMiniPaletteByTappingOutsideOnScreen;
- (void)didShowMiniPaletteIsUndoRedoPalette:(uint64_t)a1;
- (void)didUseMiniPalette;
@end

@implementation PKPencilSqueezeAnalyticsController

- (id)initWithDelegate:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)PKPencilSqueezeAnalyticsController;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4) {
      objc_storeWeak(v4 + 3, v3);
    }
  }

  return a1;
}

- (void)didShowMiniPaletteIsUndoRedoPalette:(uint64_t)a1
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1 && !*(unsigned char *)(a1 + 9))
  {
    v4 = PKPencilSqueezeAnalyticsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = a2;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "did show mini palette, isUndoRedoPalette: %{BOOL}d", (uint8_t *)v5, 8u);
    }

    *(_WORD *)(a1 + 9) = 1;
    *(unsigned char *)(a1 + 11) = 0;
    *(unsigned char *)(a1 + 8) = a2;
    *(CFTimeInterval *)(a1 + 16) = CACurrentMediaTime();
  }
}

- (void)didUseMiniPalette
{
  if (a1 && *(unsigned char *)(a1 + 9) && !*(unsigned char *)(a1 + 10))
  {
    v2 = PKPencilSqueezeAnalyticsLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "did use mini palette", v3, 2u);
    }

    *(unsigned char *)(a1 + 10) = 1;
  }
}

- (void)didHideMiniPaletteByDrawing
{
  if (a1)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __65__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByDrawing__block_invoke;
    v1[3] = &unk_1E64C61C0;
    v1[4] = a1;
    -[PKPencilSqueezeAnalyticsController _didHideMiniPaletteWithBlock:](a1, v1);
  }
}

void __65__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByDrawing__block_invoke(uint64_t a1)
{
  v2 = PKPencilSqueezeAnalyticsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "did hide mini palette by drawing", v3, 2u);
  }

  -[PKPencilSqueezeAnalyticsController _logSqueezeCategory:](*(void *)(a1 + 32), 3);
}

- (void)_logSqueezeCategory:(uint64_t)a1
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v4 = [MEMORY[0x1E4FB1A80] preferredSqueezeAction];
    uint64_t v5 = v4;
    if (v4 >= 5)
    {
      if (v4 == 6)
      {
        uint64_t v5 = 8;
      }
      else if (v4 == 5)
      {
        if (*(unsigned char *)(a1 + 8)) {
          uint64_t v5 = 10;
        }
        else {
          uint64_t v5 = 9;
        }
      }
      else
      {
        v35 = PKPencilSqueezeAnalyticsLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v5;
          _os_log_error_impl(&dword_1C44F8000, v35, OS_LOG_TYPE_ERROR, "Unable to map squeeze trigger action: %lu", (uint8_t *)&buf, 0xCu);
        }

        uint64_t v5 = 0;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    int v7 = [WeakRetained pencilSqueezeAnalyticsControllerIsHovering:a1];

    id v8 = objc_loadWeakRetained((id *)(a1 + 24));
    [v8 pencilSqueezeAnalyticsControllerHoverZOffset:a1];
    double v10 = v9;

    id v11 = objc_loadWeakRetained((id *)(a1 + 24));
    v12 = v11;
    if (!v7 || (v10 >= 0.1 ? (BOOL v13 = v10 > 1.0) : (BOOL v13 = 1), v13))
    {
      unsigned __int8 v17 = [v11 pencilSqueezeAnalyticsControllerIsHovering:a1];

      id v18 = objc_loadWeakRetained((id *)(a1 + 24));
      [v18 pencilSqueezeAnalyticsControllerHoverZOffset:a1];
      double v20 = v19;

      if ((v17 & (v20 == 0.0)) != 0) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 0;
      }
    }
    else
    {
      v14 = [v11 pencilSqueezeAnalyticsControllerHoverSettings:a1];
      int v15 = [(id)objc_opt_class() allowDoubleTapOnlyWithPencilHover];

      if (v15) {
        uint64_t v16 = 3;
      }
      else {
        uint64_t v16 = 1;
      }
    }
    v21 = +[PKPencilDevice squeezeThreshold];
    uint64_t v22 = PKPencilSqueezeThresholdMap(v21);
    id v23 = objc_loadWeakRetained((id *)(a1 + 24));
    v24 = [v23 pencilSqueezeAnalyticsControllerHoverSettings:a1];
    uint64_t v25 = [v24 toolPreviewActive];

    v40[0] = @"squeezeCategory";
    v26 = [NSNumber numberWithInteger:a2];
    *(void *)&long long buf = v26;
    v40[1] = @"triggerAction";
    v27 = [NSNumber numberWithInteger:v5];
    *((void *)&buf + 1) = v27;
    v40[2] = @"pencilLocation";
    v28 = [NSNumber numberWithInteger:v16];
    v42 = v28;
    v40[3] = @"squeezeThreshold";
    v29 = [NSNumber numberWithInteger:v22];
    v43 = v29;
    v40[4] = @"hoverSettingState";
    v30 = [NSNumber numberWithBool:v25];
    v44 = v30;
    v40[5] = @"bundleId_category";
    v31 = +[PKStatisticsManager bundleIDCategory]();
    v45 = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&buf forKeys:v40 count:6];

    v33 = PKPencilSqueezeAnalyticsLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v36) = 138477827;
      *(void *)((char *)&v36 + 4) = v32;
      _os_log_impl(&dword_1C44F8000, v33, OS_LOG_TYPE_DEFAULT, "Send event: %{private}@", (uint8_t *)&v36, 0xCu);
    }

    *(void *)&long long v36 = MEMORY[0x1E4F143A8];
    *((void *)&v36 + 1) = 3221225472;
    v37 = __102__PKPencilSqueezeAnalyticsController__logSqueezeCategory_action_location_threshold_hoverSettingState___block_invoke;
    v38 = &unk_1E64C70A8;
    id v39 = v32;
    id v34 = v32;
    AnalyticsSendEventLazy();
  }
}

- (void)_didHideMiniPaletteWithBlock:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && *(unsigned char *)(a1 + 9) && !*(unsigned char *)(a1 + 11))
  {
    unint64_t v4 = v3;
    v3[2]();
    id v3 = v4;
    *(_DWORD *)(a1 + 8) = 0x1000000;
  }
}

- (void)didHideMiniPaletteBySqueezingAgain
{
  if (a1)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __72__PKPencilSqueezeAnalyticsController_didHideMiniPaletteBySqueezingAgain__block_invoke;
    v1[3] = &unk_1E64C61C0;
    v1[4] = a1;
    -[PKPencilSqueezeAnalyticsController _didHideMiniPaletteWithBlock:](a1, v1);
  }
}

void __72__PKPencilSqueezeAnalyticsController_didHideMiniPaletteBySqueezingAgain__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 10))
  {
    -[PKPencilSqueezeAnalyticsController _logSqueezeCategory:](v2, 6);
  }
  else
  {
    double v3 = CACurrentMediaTime() - *(double *)(*(void *)(a1 + 32) + 16);
    unint64_t v4 = PKPencilSqueezeAnalyticsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
      int v7 = 134218240;
      double v8 = v3;
      __int16 v9 = 1024;
      int v10 = v5;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "did hide mini palette after %.2f seconds, isUndoRedoPalette: %{BOOL}d", (uint8_t *)&v7, 0x12u);
    }

    if (v3 >= 0.5) {
      uint64_t v6 = 12;
    }
    else {
      uint64_t v6 = 8;
    }
    -[PKPencilSqueezeAnalyticsController _logSqueezeCategory:](*(void *)(a1 + 32), v6);
  }
}

- (void)didHideMiniPaletteByTappingOutsideOnScreen
{
  if (a1)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __80__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByTappingOutsideOnScreen__block_invoke;
    v1[3] = &unk_1E64C61C0;
    v1[4] = a1;
    -[PKPencilSqueezeAnalyticsController _didHideMiniPaletteWithBlock:](a1, v1);
  }
}

void __80__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByTappingOutsideOnScreen__block_invoke(uint64_t a1)
{
}

- (void)didHideMiniPaletteByChangingContext
{
  if (a1)
  {
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __73__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByChangingContext__block_invoke;
    v1[3] = &unk_1E64C61C0;
    v1[4] = a1;
    -[PKPencilSqueezeAnalyticsController _didHideMiniPaletteWithBlock:](a1, v1);
  }
}

void __73__PKPencilSqueezeAnalyticsController_didHideMiniPaletteByChangingContext__block_invoke(uint64_t a1)
{
}

id __102__PKPencilSqueezeAnalyticsController__logSqueezeCategory_action_location_threshold_hoverSettingState___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (uint64_t)currentSqueezeThresholdIndex
{
  self;
  v0 = +[PKPencilDevice squeezeThreshold];
  uint64_t v1 = PKPencilSqueezeThresholdMap(v0);

  return v1;
}

- (void).cxx_destruct
{
}

@end