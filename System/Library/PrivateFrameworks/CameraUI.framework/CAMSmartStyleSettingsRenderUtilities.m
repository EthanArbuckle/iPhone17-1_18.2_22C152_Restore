@interface CAMSmartStyleSettingsRenderUtilities
+ (id)_styleCastForSmartStyle:(int64_t)a3;
+ (id)compositionForStyle:(id)a3 compositionController:(id)a4 originalAsset:(id)a5 aspectRatio:(double)a6;
@end

@implementation CAMSmartStyleSettingsRenderUtilities

+ (id)compositionForStyle:(id)a3 compositionController:(id)a4 originalAsset:(id)a5 aspectRatio:(double)a6
{
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    v12 = (void *)MEMORY[0x263F5E418];
    id v13 = a3;
    v14 = objc_msgSend(a1, "_styleCastForSmartStyle:", objc_msgSend(v13, "castType"));
    [v13 toneBias];
    double v16 = v15;
    [v13 colorBias];
    double v18 = v17;
    [v13 castIntensity];
    double v20 = v19;

    [v12 updateCompositionController:v10 withStyleCast:v14 tone:v16 color:v18 intensity:v20];
    v21 = [v10 orientationAdjustmentControllerCreatingIfNecessary:0];
    uint64_t v22 = [v21 orientation];
    if (v11 && a6 != 0.0)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *MEMORY[0x263F5D6E0];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __108__CAMSmartStyleSettingsRenderUtilities_compositionForStyle_compositionController_originalAsset_aspectRatio___block_invoke;
      v28[3] = &unk_263FA5018;
      double v30 = a6;
      id v29 = v11;
      uint64_t v31 = v23;
      [v10 modifyAdjustmentWithKey:v24 modificationBlock:v28];
    }
    v25 = [v10 composition];
    v26 = (void *)[v25 copy];

    [v26 setMediaType:1];
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

void __108__CAMSmartStyleSettingsRenderUtilities_compositionForStyle_compositionController_originalAsset_aspectRatio___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (uint64_t *)(a1 + 40);
  if (*(double *)(a1 + 40) == 1.0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = *(id *)(a1 + 32);
    }
    else {
      id v5 = 0;
    }
    double v7 = fmin((double)(unint64_t)[*(id *)(a1 + 32) pixelWidth], (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "pixelHeight"));
    if (v5) {
      objc_msgSend(v5, "suggestedCropForTargetSize:", v7, v7);
    }
    else {
      UIRectCenteredIntegralRect();
    }
    NUOrientationTransformRect();
    objc_msgSend(v3, "setCropRect:");
    [v3 setEnabled:1];
  }
  else
  {
    v6 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __108__CAMSmartStyleSettingsRenderUtilities_compositionForStyle_compositionController_originalAsset_aspectRatio___block_invoke_cold_1(v4, v6);
    }
  }
}

+ (id)_styleCastForSmartStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
  {
    v4 = &stru_26BD78BA0;
  }
  else
  {
    v4 = (__CFString *)**((id **)&unk_263FA5038 + a3);
  }
  return v4;
}

void __108__CAMSmartStyleSettingsRenderUtilities_compositionForStyle_compositionController_originalAsset_aspectRatio___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Need to handle aspect ratio %.3f", (uint8_t *)&v3, 0xCu);
}

@end