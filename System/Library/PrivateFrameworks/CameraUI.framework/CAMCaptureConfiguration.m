@interface CAMCaptureConfiguration
+ (id)captureGraphConfigurationUsingConfiguration:(id)a3 outputToExternalStorage:(BOOL)a4;
+ (id)configuration:(id)a3 withDevice:(int64_t)a4;
+ (id)tinyConfigurationForConfiguration:(id)a3 preserveFilters:(BOOL)a4;
+ (int64_t)_fallbackVideoConfigurationForUnsupportedConfiguration:(int64_t)a3 spatialVideoEnabled:(BOOL)a4;
+ (int64_t)sanitizeVideoConfigurationForDesiredConfiguration:(int64_t)a3 mode:(int64_t)a4 device:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 trueVideoEnabled:(BOOL)a7;
- (BOOL)isPhotoBooth;
- (BOOL)mirrorFrontCameraCaptures;
- (BOOL)mixAudioWithOthers;
- (BOOL)optionalDepthEffectEnabled;
- (BOOL)spatialVideoEnabled;
- (BOOL)zoomPIPEnabled;
- (CAMCaptureConfiguration)initWithCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4 videoConfiguration:(int64_t)a5 audioConfiguration:(unint64_t)a6 mixAudioWithOthers:(BOOL)a7 flashMode:(int64_t)a8 torchMode:(int64_t)a9 HDRMode:(int64_t)a10 irisMode:(int64_t)a11 timerDuration:(int64_t)a12 photoModeAspectRatioCrop:(int64_t)a13 photoModeEffectFilterType:(int64_t)a14 squareModeEffectFilterType:(int64_t)a15 portraitModeEffectFilterType:(int64_t)a16 portraitModeLightingEffectType:(int64_t)a17 portraitModeApertureValue:(double)a18 portraitModeIntensityValue:(double)a19 mirrorFrontCameraCaptures:(BOOL)a20 exposureBiasesByMode:(id)a21 macroMode:(int64_t)a22 photoResolution:(int64_t)a23 rawMode:(int64_t)a24 proResVideoMode:(int64_t)a25 semanticStyles:(id)a26 selectedSemanticStyleIndex:(unint64_t)a27 smartStyleSystemStyleIndex:(unint64_t)a28 videoStabilizationMode:(int64_t)a29 zoomPIPEnabled:(BOOL)a30 spatialVideoEnabled:(BOOL)a31 optionalDepthEffectEnabled:(BOOL)a32 sharedLibraryMode:(int64_t)a33;
- (CAMCaptureConfiguration)initWithConfiguration:(id)a3;
- (NSArray)semanticStyles;
- (NSDictionary)exposureBiasesByMode;
- (double)portraitModeApertureValue;
- (double)portraitModeIntensityValue;
- (id)_previewFilters;
- (id)initForPhotoBoothWithCaptureDevice:(int64_t)a3;
- (int64_t)HDRMode;
- (int64_t)device;
- (int64_t)flashMode;
- (int64_t)irisMode;
- (int64_t)macroMode;
- (int64_t)mode;
- (int64_t)photoModeAspectRatioCrop;
- (int64_t)photoModeEffectFilterType;
- (int64_t)photoResolution;
- (int64_t)portraitModeEffectFilterType;
- (int64_t)portraitModeLightingEffectType;
- (int64_t)proResVideoMode;
- (int64_t)rawMode;
- (int64_t)sharedLibraryMode;
- (int64_t)squareModeEffectFilterType;
- (int64_t)timerDuration;
- (int64_t)torchMode;
- (int64_t)videoConfiguration;
- (int64_t)videoStabilizationMode;
- (unint64_t)audioConfiguration;
- (unint64_t)selectedSemanticStyleIndex;
- (unint64_t)smartStyleSystemStyleIndex;
- (void)setMirrorFrontCameraCaptures:(BOOL)a3;
- (void)setSelectedSemanticStyleIndex:(unint64_t)a3;
- (void)setSemanticStyles:(id)a3;
- (void)setSharedLibraryMode:(int64_t)a3;
- (void)setSmartStyleSystemStyleIndex:(unint64_t)a3;
@end

@implementation CAMCaptureConfiguration

- (int64_t)device
{
  return self->_device;
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (int64_t)HDRMode
{
  return self->_HDRMode;
}

- (int64_t)timerDuration
{
  return self->_timerDuration;
}

- (int64_t)photoModeEffectFilterType
{
  return self->_photoModeEffectFilterType;
}

- (int64_t)squareModeEffectFilterType
{
  return self->_squareModeEffectFilterType;
}

- (int64_t)portraitModeEffectFilterType
{
  return self->_portraitModeEffectFilterType;
}

- (int64_t)portraitModeLightingEffectType
{
  return self->_portraitModeLightingEffectType;
}

- (int64_t)irisMode
{
  return self->_irisMode;
}

- (BOOL)isPhotoBooth
{
  return self->_photoBooth;
}

- (id)_previewFilters
{
  if ([(CAMCaptureConfiguration *)self isPhotoBooth])
  {
    int64_t v3 = 0;
    uint64_t v4 = 0;
    int64_t v5 = 0;
  }
  else
  {
    int64_t v6 = [(CAMCaptureConfiguration *)self mode];
    uint64_t v4 = 0;
    int64_t v3 = 0;
    int64_t v5 = 0;
    switch(v6)
    {
      case 0:
        int64_t v7 = [(CAMCaptureConfiguration *)self photoModeEffectFilterType];
        goto LABEL_6;
      case 4:
        int64_t v7 = [(CAMCaptureConfiguration *)self squareModeEffectFilterType];
LABEL_6:
        int64_t v5 = v7;
        int64_t v3 = 0;
        uint64_t v4 = 0;
        break;
      case 6:
        int64_t v5 = [(CAMCaptureConfiguration *)self portraitModeEffectFilterType];
        int64_t v3 = [(CAMCaptureConfiguration *)self portraitModeLightingEffectType];
        goto LABEL_9;
      case 7:
        int64_t v3 = 0;
        int64_t v5 = 0;
LABEL_9:
        uint64_t v4 = 1;
        break;
      default:
        break;
    }
  }
  return +[CAMEffectFilterManager filtersForFilterType:v5 lightingType:v3 applyDepthEffect:v4];
}

- (int64_t)videoConfiguration
{
  return self->_videoConfiguration;
}

- (unint64_t)audioConfiguration
{
  return self->_audioConfiguration;
}

- (CAMCaptureConfiguration)initWithCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4 videoConfiguration:(int64_t)a5 audioConfiguration:(unint64_t)a6 mixAudioWithOthers:(BOOL)a7 flashMode:(int64_t)a8 torchMode:(int64_t)a9 HDRMode:(int64_t)a10 irisMode:(int64_t)a11 timerDuration:(int64_t)a12 photoModeAspectRatioCrop:(int64_t)a13 photoModeEffectFilterType:(int64_t)a14 squareModeEffectFilterType:(int64_t)a15 portraitModeEffectFilterType:(int64_t)a16 portraitModeLightingEffectType:(int64_t)a17 portraitModeApertureValue:(double)a18 portraitModeIntensityValue:(double)a19 mirrorFrontCameraCaptures:(BOOL)a20 exposureBiasesByMode:(id)a21 macroMode:(int64_t)a22 photoResolution:(int64_t)a23 rawMode:(int64_t)a24 proResVideoMode:(int64_t)a25 semanticStyles:(id)a26 selectedSemanticStyleIndex:(unint64_t)a27 smartStyleSystemStyleIndex:(unint64_t)a28 videoStabilizationMode:(int64_t)a29 zoomPIPEnabled:(BOOL)a30 spatialVideoEnabled:(BOOL)a31 optionalDepthEffectEnabled:(BOOL)a32 sharedLibraryMode:(int64_t)a33
{
  id v42 = a21;
  id v43 = a26;
  v49.receiver = self;
  v49.super_class = (Class)CAMCaptureConfiguration;
  v44 = [(CAMCaptureConfiguration *)&v49 init];
  if (v44)
  {
    v44->_mode = a3;
    v44->_device = a4;
    v44->_videoConfiguration = a5;
    v44->_audioConfiguration = a6;
    v44->_mixAudioWithOthers = a7;
    v44->_flashMode = a8;
    v44->_torchMode = a9;
    v44->_HDRMode = a10;
    v44->_timerDuration = a12;
    v44->_irisMode = a11;
    v44->_photoModeAspectRatioCrop = a13;
    v44->_photoModeEffectFilterType = a14;
    v44->_squareModeEffectFilterType = a15;
    v44->_portraitModeEffectFilterType = a16;
    v44->_portraitModeLightingEffectType = a17;
    v44->_photoBooth = 0;
    v44->_portraitModeApertureValue = a18;
    v44->_portraitModeIntensityValue = a19;
    v44->_mirrorFrontCameraCaptures = a20;
    uint64_t v45 = [v42 copy];
    exposureBiasesByMode = v44->_exposureBiasesByMode;
    v44->_exposureBiasesByMode = (NSDictionary *)v45;

    v44->_macroMode = a22;
    v44->_photoResolution = a23;
    v44->_rawMode = a24;
    v44->_proResVideoMode = a25;
    objc_storeStrong((id *)&v44->_semanticStyles, a26);
    v44->_selectedSemanticStyleIndex = a27;
    v44->_smartStyleSystemStyleIndex = a28;
    v44->_zoomPIPEnabled = a30;
    v44->_videoStabilizationMode = a29;
    v44->_sharedLibraryMode = a33;
    v44->_spatialVideoEnabled = a31;
    v44->_optionalDepthEffectEnabled = a32;
    v47 = v44;
  }

  return v44;
}

- (CAMCaptureConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMCaptureConfiguration;
  int64_t v5 = [(CAMCaptureConfiguration *)&v14 init];
  if (v5)
  {
    v5->_mode = [v4 mode];
    v5->_device = [v4 device];
    v5->_videoConfiguration = [v4 videoConfiguration];
    v5->_audioConfiguration = [v4 audioConfiguration];
    v5->_mixAudioWithOthers = [v4 mixAudioWithOthers];
    v5->_flashMode = [v4 flashMode];
    v5->_torchMode = [v4 torchMode];
    v5->_HDRMode = [v4 HDRMode];
    v5->_irisMode = [v4 irisMode];
    v5->_timerDuration = [v4 timerDuration];
    v5->_photoModeAspectRatioCrop = [v4 photoModeAspectRatioCrop];
    v5->_photoModeEffectFilterType = [v4 photoModeEffectFilterType];
    v5->_squareModeEffectFilterType = [v4 squareModeEffectFilterType];
    v5->_portraitModeEffectFilterType = [v4 portraitModeEffectFilterType];
    v5->_portraitModeLightingEffectType = [v4 portraitModeLightingEffectType];
    v5->_photoBooth = [v4 isPhotoBooth];
    [v4 portraitModeApertureValue];
    v5->_portraitModeApertureValue = v6;
    [v4 portraitModeIntensityValue];
    v5->_portraitModeIntensityValue = v7;
    v5->_mirrorFrontCameraCaptures = [v4 mirrorFrontCameraCaptures];
    v8 = [v4 exposureBiasesByMode];
    uint64_t v9 = [v8 copy];
    exposureBiasesByMode = v5->_exposureBiasesByMode;
    v5->_exposureBiasesByMode = (NSDictionary *)v9;

    v5->_macroMode = [v4 macroMode];
    v5->_photoResolution = [v4 photoResolution];
    v5->_rawMode = [v4 rawMode];
    v5->_proResVideoMode = [v4 proResVideoMode];
    uint64_t v11 = [v4 semanticStyles];
    semanticStyles = v5->_semanticStyles;
    v5->_semanticStyles = (NSArray *)v11;

    v5->_selectedSemanticStyleIndex = [v4 selectedSemanticStyleIndex];
    v5->_smartStyleSystemStyleIndex = [v4 smartStyleSystemStyleIndex];
    v5->_videoStabilizationMode = [v4 videoStabilizationMode];
    v5->_zoomPIPEnabled = [v4 zoomPIPEnabled];
    v5->_sharedLibraryMode = [v4 sharedLibraryMode];
    v5->_spatialVideoEnabled = [v4 spatialVideoEnabled];
    v5->_optionalDepthEffectEnabled = [v4 optionalDepthEffectEnabled];
  }

  return v5;
}

- (id)initForPhotoBoothWithCaptureDevice:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CAMCaptureConfiguration;
  id v4 = [(CAMCaptureConfiguration *)&v9 init];
  int64_t v5 = v4;
  if (v4)
  {
    *((void *)v4 + 2) = 0;
    *((void *)v4 + 3) = a3;
    v4[8] = 0;
    *((_OWORD *)v4 + 2) = 0u;
    *((_OWORD *)v4 + 3) = 0u;
    *((_OWORD *)v4 + 4) = 0u;
    *((_OWORD *)v4 + 5) = 0u;
    *((_OWORD *)v4 + 6) = 0u;
    *((_OWORD *)v4 + 7) = xmmword_209C7BA90;
    v4[10] = 1;
    *(_OWORD *)(v4 + 136) = 0u;
    *(_OWORD *)(v4 + 152) = 0u;
    *(_OWORD *)(v4 + 168) = 0u;
    double v6 = (void *)*((void *)v4 + 23);
    *((void *)v4 + 23) = 0;

    *((int64x2_t *)v5 + 12) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *((void *)v5 + 26) = 0;
    *(_WORD *)(v5 + 11) = 0;
    v5[13] = 0;
    double v7 = v5;
  }

  return v5;
}

+ (id)captureGraphConfigurationUsingConfiguration:(id)a3 outputToExternalStorage:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 mode];
  uint64_t v58 = [v5 device];
  if ((unint64_t)(v58 - 8) < 3 || v58 == 11 || v58 == 1)
  {
    char v7 = 0;
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    char v7 = 1;
  }
  unsigned int v55 = [v5 isPhotoBooth];
  v60 = +[CAMCaptureCapabilities capabilities];
  v59 = +[CAMUserPreferences preferences];
  if ([v5 zoomPIPEnabled])
  {
    objc_super v9 = +[CAMCaptureCapabilities capabilities];
    char v50 = [v9 isZoomPIPSupportedForMode:v6 devicePosition:v8];
  }
  else
  {
    char v50 = 0;
  }
  if ([v60 isCustomLensSupportedForMode:v6 device:v58 isTrueVideo:0])
  {
    v52 = [v59 customLensGroup];
  }
  else
  {
    v52 = 0;
  }
  v51 = [v5 _previewFilters];
  uint64_t v10 = [v5 videoConfiguration];
  uint64_t v49 = [v5 audioConfiguration];
  if (v55)
  {
    v48 = 0;
  }
  else
  {
    v48 = [v59 videoThumbnailOutputConfigurationForMode:v6 devicePosition:v8];
  }
  if ([v60 isSpatialVideoInVideoModeSupportedForMode:v6 devicePosition:v8]) {
    uint64_t v11 = [v5 spatialVideoEnabled];
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v47 = [v59 photoEncodingBehavior];
  uint64_t v57 = objc_msgSend(v59, "videoEncodingBehaviorForConfiguration:mode:desiredProResVideoMode:outputToExternalStorage:spatialVideoEnabled:", v10, v6, objc_msgSend(v5, "proResVideoMode"), v4, v11);
  char v46 = objc_msgSend(v60, "shouldSuspendVideoHDRForHDRMode:captureMode:", objc_msgSend(v5, "HDRMode"), v6);
  if (v6)
  {
    uint64_t v45 = 0;
    if (v7)
    {
LABEL_19:
      char v44 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v45 = [v5 photoModeAspectRatioCrop];
    if (v7) {
      goto LABEL_19;
    }
  }
  char v44 = [v5 mirrorFrontCameraCaptures];
LABEL_22:
  char v43 = [v59 isAutoFPSVideoEnabledForMode:v6 device:v58 videoConfiguration:v10 encodingBehavior:v57 outputToExternalStorage:v4 spatialVideoEnabled:v11];
  uint64_t v42 = [v60 maxSupportedPhotoQualityPrioritizationForMode:v6 devicePosition:v8];
  unsigned int v54 = v11;
  if ([v59 rawControlEnabled]) {
    int v53 = [v60 isLinearDNGSupportedForMode:v6];
  }
  else {
    int v53 = 0;
  }
  uint64_t v12 = [v60 semanticStyleSupportForMode:v6 devicePosition:v8];
  v13 = [v5 semanticStyles];
  v41 = objc_msgSend(v60, "captureStyleForPreviewWithSupport:styles:selectedStyleIndex:smartStyleSystemStyleIndex:", v12, v13, objc_msgSend(v5, "selectedSemanticStyleIndex"), objc_msgSend(v5, "smartStyleSystemStyleIndex"));

  if ([v59 shouldUseContentAwareDistortionCorrection]) {
    char v40 = [v60 isContentAwareDistortionCorrectionSupportedForMode:v6];
  }
  else {
    char v40 = 0;
  }
  if ([v59 responsiveShutterEnabled]) {
    char v39 = [v60 isResponsiveShutterSupportedForMode:v6];
  }
  else {
    char v39 = 0;
  }
  objc_super v14 = +[CAMUserPreferences preferences];
  int v15 = objc_msgSend(v60, "isVideoStabilizationControlSupportedForMode:device:videoConfiguration:videoEncodingBehavior:trueVideoEnabled:prefersHDR10BitVideo:", v6, v58, v10, v57, 0, objc_msgSend(v14, "prefersHDR10BitVideoForCapabilities:", v60));

  if (v15) {
    uint64_t v16 = [v5 videoStabilizationMode];
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = [v59 videoStabilizationStrengthForVideoStabilizationMode:v16 captureMode:v6 spatialVideoEnabled:v54];
  v18 = +[CAMUserPreferences preferences];
  BYTE2(v26) = [v18 prefersHDR10BitVideoForCapabilities:v60];
  LOWORD(v26) = v54;
  int v19 = objc_msgSend(v60, "isVideoStabilizationStrength:supportedForMode:device:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:trueVideoEnabled:prefersHDR10BitVideo:", v17, v6, v58, v10, v57, v4, v26);

  uint64_t v38 = [v59 maximumPhotoResolutionForMode:v6 device:v58];
  BOOL v20 = 0;
  if (v53) {
    BOOL v20 = [v5 rawMode] == 1;
  }
  BOOL v34 = v20;
  if (v19) {
    uint64_t v21 = v17;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v36 = v21;
  uint64_t v37 = v55;
  uint64_t v22 = 1;
  if (v55) {
    uint64_t v22 = 2;
  }
  uint64_t v56 = v22;
  uint64_t v33 = [v59 colorSpaceForMode:v6 videoConfiguration:v10 videoEncodingBehavior:v57 spatialVideoEnabled:v54 device:v58];
  char v23 = [v59 shouldUseDepthSuggestionInPhotoMode];
  char v35 = [v59 windRemovalEnabledForAudioConfiguration:v49];
  BYTE2(v32) = [v59 prefersHDR10BitVideoForCapabilities:v60];
  LOWORD(v32) = v54;
  BYTE1(v31) = v50;
  LOBYTE(v31) = v23;
  BYTE2(v30) = v34;
  BYTE1(v30) = v39;
  LOBYTE(v30) = v40;
  BYTE1(v29) = v53;
  LOBYTE(v29) = v44;
  BYTE1(v28) = v46;
  LOBYTE(v28) = v43;
  LOBYTE(v27) = v35;
  v24 = -[CAMCaptureGraphConfiguration initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:]([CAMCaptureGraphConfiguration alloc], "initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:", v6, v58, [v5 macroMode], v10, v49, objc_msgSend(v5, "mixAudioWithOthers"), v27, v56, v37, v51, v48,
          v47,
          v57,
          v28,
          v45,
          v42,
          v29,
          v12,
          v41,
          v30,
          v36,
          v38,
          v33,
          v31,
          v52,
          v32);

  return v24;
}

+ (int64_t)sanitizeVideoConfigurationForDesiredConfiguration:(int64_t)a3 mode:(int64_t)a4 device:(int64_t)a5 spatialVideoEnabled:(BOOL)a6 trueVideoEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  v13 = +[CAMCaptureCapabilities capabilities];
  do
  {
    if ([v13 isSupportedVideoConfiguration:a3 forMode:a4 device:a5 spatialVideoEnabled:v8 trueVideoEnabled:v7])break; {
    a3 = [a1 _fallbackVideoConfigurationForUnsupportedConfiguration:a3 spatialVideoEnabled:v8];
    }
  }
  while (a3);

  return a3;
}

+ (int64_t)_fallbackVideoConfigurationForUnsupportedConfiguration:(int64_t)a3 spatialVideoEnabled:(BOOL)a4
{
  if (a3 > 12)
  {
    int64_t v4 = 9;
    uint64_t v5 = 12;
    if (a3 != 14) {
      uint64_t v5 = 0;
    }
    if (a3 != 13) {
      int64_t v4 = v5;
    }
  }
  else
  {
    int64_t v4 = a3 == 4 || a3 == 9;
  }
  if (a4) {
    return 7;
  }
  else {
    return v4;
  }
}

+ (id)tinyConfigurationForConfiguration:(id)a3 preserveFilters:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = [[CAMCaptureConfiguration alloc] initWithConfiguration:v5];

  v6->_mode = 0;
  if (!a4)
  {
    v6->_photoModeEffectFilterType = +[CAMUserPreferences defaultFilterTypeForMode:0];
    v6->_squareModeEffectFilterType = +[CAMUserPreferences defaultFilterTypeForMode:4];
    v6->_portraitModeEffectFilterType = +[CAMUserPreferences defaultFilterTypeForMode:6];
    v6->_portraitModeLightingEffectType = +[CAMUserPreferences defaultLightingTypeForMode:6];
  }
  return v6;
}

+ (id)configuration:(id)a3 withDevice:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [[CAMCaptureConfiguration alloc] initWithConfiguration:v5];

  v6->_device = a4;
  return v6;
}

- (BOOL)mixAudioWithOthers
{
  return self->_mixAudioWithOthers;
}

- (int64_t)photoModeAspectRatioCrop
{
  return self->_photoModeAspectRatioCrop;
}

- (NSDictionary)exposureBiasesByMode
{
  return self->_exposureBiasesByMode;
}

- (double)portraitModeApertureValue
{
  return self->_portraitModeApertureValue;
}

- (double)portraitModeIntensityValue
{
  return self->_portraitModeIntensityValue;
}

- (BOOL)mirrorFrontCameraCaptures
{
  return self->_mirrorFrontCameraCaptures;
}

- (void)setMirrorFrontCameraCaptures:(BOOL)a3
{
  self->_mirrorFrontCameraCaptures = a3;
}

- (int64_t)macroMode
{
  return self->_macroMode;
}

- (int64_t)photoResolution
{
  return self->_photoResolution;
}

- (int64_t)rawMode
{
  return self->_rawMode;
}

- (int64_t)proResVideoMode
{
  return self->_proResVideoMode;
}

- (NSArray)semanticStyles
{
  return self->_semanticStyles;
}

- (void)setSemanticStyles:(id)a3
{
}

- (unint64_t)selectedSemanticStyleIndex
{
  return self->_selectedSemanticStyleIndex;
}

- (void)setSelectedSemanticStyleIndex:(unint64_t)a3
{
  self->_selectedSemanticStyleIndex = a3;
}

- (unint64_t)smartStyleSystemStyleIndex
{
  return self->_smartStyleSystemStyleIndex;
}

- (void)setSmartStyleSystemStyleIndex:(unint64_t)a3
{
  self->_smartStyleSystemStyleIndex = a3;
}

- (int64_t)videoStabilizationMode
{
  return self->_videoStabilizationMode;
}

- (BOOL)zoomPIPEnabled
{
  return self->_zoomPIPEnabled;
}

- (BOOL)spatialVideoEnabled
{
  return self->_spatialVideoEnabled;
}

- (BOOL)optionalDepthEffectEnabled
{
  return self->_optionalDepthEffectEnabled;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  self->_sharedLibraryMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticStyles, 0);
  objc_storeStrong((id *)&self->_exposureBiasesByMode, 0);
}

@end