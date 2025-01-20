@interface CAMCaptureConversions
+ ($2825F4736939C4A6D3AD43837233062D)CMVideoDimensionsForCAMPhotoResolution:(int64_t)a3;
+ (id)AVCaptureDeviceTypeForCAMCaptureDevice:(int64_t)a3;
+ (id)AVCaptureSmartStyleForCEKSmartStyle:(id)a3;
+ (id)AVSmartStyleCastTypeForCEKCastType:(int64_t)a3;
+ (id)CEKSmartStyleForAVCaptureSmartStyle:(id)a3;
+ (id)PISemanticStyleCastForCEKCastType:(int64_t)a3;
+ (id)previewLayerVideoGravityForPreviewViewAspectMode:(int64_t)a3;
+ (int64_t)AVCaptureColorSpaceForColorSpace:(int64_t)a3 hasValidConversion:(BOOL *)a4;
+ (int64_t)AVCaptureDeviceAudioCaptureModeForCAMAudioConfiguration:(unint64_t)a3;
+ (int64_t)AVCaptureDeviceVideoZoomRampTuningForCAMVideoZoomRampTuning:(int64_t)a3;
+ (int64_t)AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:(int64_t)a3;
+ (int64_t)AVDevicePositionForCAMDevicePosition:(int64_t)a3;
+ (int64_t)CAMDevicePositionForAVDevicePosition:(int64_t)a3;
+ (int64_t)CAMPhotoQualityPrioritizationForAVCapturePhotoQualityPrioritization:(int64_t)a3;
+ (int64_t)CAMStereoCaptureStatusForAVStereoCaptureStatus:(unint64_t)a3;
+ (int64_t)CAMStereoCaptureStatusForAVStereoVideoCaptureStatus:(unint64_t)a3;
+ (int64_t)CEKSmartStylePresetTypeForAVSmartStyleCastType:(id)a3;
+ (int64_t)captureDigitalFlashModeForLowLightMode:(int64_t)a3;
+ (int64_t)captureExposureModeForExposureMode:(int64_t)a3;
+ (int64_t)captureFlashModeForFlashMode:(int64_t)a3;
+ (int64_t)captureFocusModeForFocusMode:(int64_t)a3 isPerformingContrastBasedFocus:(BOOL)a4;
+ (int64_t)captureHDRModeForHDRMode:(int64_t)a3;
+ (int64_t)captureTorchModeForTorchMode:(int64_t)a3;
+ (int64_t)captureWhiteBalanceModeForWhiteBalanceMode:(int64_t)a3;
+ (int64_t)exposureModeForCaptureExposureMode:(int64_t)a3;
+ (int64_t)flashModeForCaptureFlashMode:(int64_t)a3;
+ (int64_t)flashModeForTorchMode:(int64_t)a3;
+ (int64_t)focusModeForCaptureFocusMode:(int64_t)a3;
+ (int64_t)hdrModeForCaptureHDRMode:(int64_t)a3;
+ (int64_t)lowLightStatusForCaptureStatus:(int64_t)a3;
+ (int64_t)overCapturePreviewStatusForAVPreviewStatus:(int64_t)a3;
+ (int64_t)shallowDepthOfFieldStatusForCaptureStatus:(int64_t)a3;
+ (int64_t)stagePreviewStatusForCaptureStatus:(int64_t)a3;
+ (int64_t)torchModeForCaptureTorchMode:(int64_t)a3;
+ (int64_t)torchModeForFlashMode:(int64_t)a3;
+ (int64_t)viewContentModeForPreviewViewAspectMode:(int64_t)a3;
+ (int64_t)whiteBalanceModeForCaptureWhiteBalanceMode:(int64_t)a3;
+ (unint64_t)CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:(unint64_t)a3;
+ (unint64_t)buttonPhaseForCaptureButtonPhase:(unint64_t)a3;
@end

@implementation CAMCaptureConversions

+ (id)previewLayerVideoGravityForPreviewViewAspectMode:(int64_t)a3
{
  if (!a3)
  {
    v4 = (id *)MEMORY[0x263EF9C78];
LABEL_5:
    id v5 = *v4;
    return v5;
  }
  if (a3 == 1)
  {
    v4 = (id *)MEMORY[0x263EF9C70];
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

+ (int64_t)captureHDRModeForHDRMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)captureFlashModeForFlashMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int64_t)captureTorchModeForTorchMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int64_t)exposureModeForCaptureExposureMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    return 2;
  }
  else {
    return a3;
  }
}

+ (int64_t)focusModeForCaptureFocusMode:(int64_t)a3
{
  int64_t v3 = 2;
  if (a3 != 1) {
    int64_t v3 = 3;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int64_t)captureWhiteBalanceModeForWhiteBalanceMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int64_t)captureExposureModeForExposureMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 4) {
    return 2;
  }
  else {
    return a3;
  }
}

+ (int64_t)flashModeForCaptureFlashMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int64_t)torchModeForCaptureTorchMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int64_t)hdrModeForCaptureHDRMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)captureFocusModeForFocusMode:(int64_t)a3 isPerformingContrastBasedFocus:(BOOL)a4
{
  int64_t v4 = 2;
  if (!a3) {
    int64_t v4 = 0;
  }
  if (a3 == 1) {
    int64_t v4 = a4;
  }
  if (a3 == 2) {
    return 1;
  }
  else {
    return v4;
  }
}

+ (int64_t)whiteBalanceModeForCaptureWhiteBalanceMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int64_t)viewContentModeForPreviewViewAspectMode:(int64_t)a3
{
  if (a3 == 1) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (int64_t)shallowDepthOfFieldStatusForCaptureStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xF) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)stagePreviewStatusForCaptureStatus:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)AVDevicePositionForCAMDevicePosition:(int64_t)a3
{
  if (a3) {
    return 2 * (a3 == 1);
  }
  else {
    return 1;
  }
}

+ (int64_t)CAMDevicePositionForAVDevicePosition:(int64_t)a3
{
  return a3 == 2;
}

+ (id)AVCaptureDeviceTypeForCAMCaptureDevice:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 8)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_263FA5DB8 + a3 - 2);
  }
  return v4;
}

+ (int64_t)AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 == 1) {
    int64_t v3 = 2;
  }
  if (a3 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

+ (int64_t)CAMPhotoQualityPrioritizationForAVCapturePhotoQualityPrioritization:(int64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

+ (int64_t)torchModeForFlashMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)flashModeForTorchMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)captureDigitalFlashModeForLowLightMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)lowLightStatusForCaptureStatus:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)overCapturePreviewStatusForAVPreviewStatus:(int64_t)a3
{
  if ((unint64_t)a3 >= 6) {
    return 4;
  }
  else {
    return a3;
  }
}

+ (unint64_t)CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:(unint64_t)a3
{
  return a3 & 7;
}

+ ($2825F4736939C4A6D3AD43837233062D)CMVideoDimensionsForCAMPhotoResolution:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return ($2825F4736939C4A6D3AD43837233062D)0;
  }
  else {
    return ($2825F4736939C4A6D3AD43837233062D)(qword_209C7B950[a3 - 1] | qword_209C7B938[a3 - 1]);
  }
}

+ (int64_t)AVCaptureDeviceVideoZoomRampTuningForCAMVideoZoomRampTuning:(int64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

+ (int64_t)AVCaptureColorSpaceForColorSpace:(int64_t)a3 hasValidConversion:(BOOL *)a4
{
  BOOL v4 = a3 != 1;
  if (a3 == 2)
  {
    BOOL v4 = 1;
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = a3 == 1;
  }
  if (a3 == 3)
  {
    BOOL v4 = 1;
    int64_t result = 3;
  }
  else
  {
    int64_t result = v5;
  }
  if (a4) {
    *a4 = v4;
  }
  return result;
}

+ (int64_t)CAMStereoCaptureStatusForAVStereoCaptureStatus:(unint64_t)a3
{
  return a3 & 7;
}

+ (int64_t)CAMStereoCaptureStatusForAVStereoVideoCaptureStatus:(unint64_t)a3
{
  return a3 & 7;
}

+ (unint64_t)buttonPhaseForCaptureButtonPhase:(unint64_t)a3
{
  unint64_t v3 = 2;
  if (a3 != 1) {
    unint64_t v3 = 3;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

+ (int64_t)AVCaptureDeviceAudioCaptureModeForCAMAudioConfiguration:(unint64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

+ (id)AVSmartStyleCastTypeForCEKCastType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_263FA5E00 + a3);
  }
  return v4;
}

+ (int64_t)CEKSmartStylePresetTypeForAVSmartStyleCastType:(id)a3
{
  id v3 = a3;
  if (CEKSmartStylePresetTypeForAVSmartStyleCastType__onceToken != -1) {
    dispatch_once(&CEKSmartStylePresetTypeForAVSmartStyleCastType__onceToken, &__block_literal_global_49);
  }
  id v4 = [(id)CEKSmartStylePresetTypeForAVSmartStyleCastType__presetTypeNumberByAVCastType objectForKeyedSubscript:v3];
  int64_t v5 = v4;
  if (v4) {
    int64_t v6 = [v4 integerValue];
  }
  else {
    int64_t v6 = 1;
  }

  return v6;
}

void __72__CAMCaptureConversions_CEKSmartStylePresetTypeForAVSmartStyleCastType___block_invoke()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = CEKSmartStyleAllPresetTypes();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        int64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(v6, "integerValue", (void)v10);
        if (v7)
        {
          v8 = +[CAMCaptureConversions AVSmartStyleCastTypeForCEKCastType:](CAMCaptureConversions, "AVSmartStyleCastTypeForCEKCastType:", [MEMORY[0x263F306F8] castTypeForPresetType:v7]);
          [v0 setObject:v6 forKeyedSubscript:v8];
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }

  v9 = (void *)CEKSmartStylePresetTypeForAVSmartStyleCastType__presetTypeNumberByAVCastType;
  CEKSmartStylePresetTypeForAVSmartStyleCastType__presetTypeNumberByAVCastType = (uint64_t)v0;
}

+ (id)PISemanticStyleCastForCEKCastType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_263FA5E78 + a3);
  }
  return v4;
}

+ (id)AVCaptureSmartStyleForCEKSmartStyle:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int64_t v5 = objc_msgSend(a1, "AVSmartStyleCastTypeForCEKCastType:", objc_msgSend(v4, "castType"));
    int64_t v6 = (void *)MEMORY[0x263EFA648];
    [v4 castIntensity];
    float v8 = v7;
    [v4 toneBias];
    float v10 = v9;
    [v4 colorBias];
    double v12 = v11;

    *(float *)&double v13 = v12;
    *(float *)&double v14 = v8;
    *(float *)&double v15 = v10;
    v16 = [v6 styleWithCast:v5 intensity:v14 toneBias:v15 colorBias:v13];
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

+ (id)CEKSmartStyleForAVCaptureSmartStyle:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    int64_t v6 = [v5 cast];
    uint64_t v7 = [a1 CEKSmartStylePresetTypeForAVSmartStyleCastType:v6];

    id v8 = objc_alloc(MEMORY[0x263F306F8]);
    [v5 intensity];
    double v10 = v9;
    [v5 toneBias];
    double v12 = v11;
    [v5 colorBias];
    float v14 = v13;

    double v15 = (void *)[v8 initWithPresetType:v7 castIntensity:v10 toneBias:v12 colorBias:v14];
  }
  else
  {
    double v15 = 0;
  }
  return v15;
}

@end