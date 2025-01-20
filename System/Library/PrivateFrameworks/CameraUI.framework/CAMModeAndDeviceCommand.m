@interface CAMModeAndDeviceCommand
- (BOOL)_isStillImageMode:(int64_t)a3;
- (BOOL)_outputToExternalStorage;
- (BOOL)_shouldEnableLivePhotoCaptureForMode:(int64_t)a3 device:(int64_t)a4;
- (BOOL)_wantsLivePhotoMetadataInVideosForMode:(int64_t)a3 device:(int64_t)a4;
- (BOOL)requiresSessionModification;
- (CAMCaptureGraphConfiguration)_desiredGraphConfiguration;
- (CAMCaptureGraphConfiguration)_resolvedGraphConfiguration;
- (CAMModeAndDeviceCommand)initWithCoder:(id)a3;
- (CAMModeAndDeviceCommand)initWithGraphConfiguration:(id)a3 minimumExecutionTime:(double)a4 requestID:(int)a5 outputToExternalStorage:(BOOL)a6;
- (NSError)_configurationError;
- (double)_minimumExecutionTime;
- (id)_desiredInputsWithContext:(id)a3 captureEngineDevice:(id)a4;
- (id)_existingInputsWithContext:(id)a3 without:(id)a4;
- (id)_existingOutputsWithContext:(id)a3 without:(id)a4;
- (id)_specificEncodingBehaviorCommandForGraphConfiguration:(id)a3;
- (id)_specificFramerateCommandForGraphConfiguration:(id)a3 withContext:(id)a4;
- (id)_specificPreparePhotoSettingsCommandForGraphConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sessionModificationLogReason;
- (id)userInfo;
- (int)_requestID;
- (void)_performPostConfigurationSanityCheckForGraphConfiguration:(id)a3 withContext:(id)a4;
- (void)_performPostConfigurationSetupForGraphConfiguration:(id)a3 withContext:(id)a4;
- (void)_sanitizeDeviceUsingContext:(id)a3;
- (void)_setConfigurationError:(id)a3;
- (void)_setResolvedGraphConfiguration:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMModeAndDeviceCommand

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CAMModeAndDeviceCommand;
  v4 = [(CAMCaptureCommand *)&v11 copyWithZone:a3];
  uint64_t v5 = [(CAMModeAndDeviceCommand *)self _desiredGraphConfiguration];
  v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(CAMModeAndDeviceCommand *)self _resolvedGraphConfiguration];
  v8 = (void *)v4[5];
  v4[5] = v7;

  [(CAMModeAndDeviceCommand *)self _minimumExecutionTime];
  v4[6] = v9;
  *((_DWORD *)v4 + 7) = [(CAMModeAndDeviceCommand *)self _requestID];
  return v4;
}

- (CAMCaptureGraphConfiguration)_desiredGraphConfiguration
{
  return self->__desiredGraphConfiguration;
}

- (CAMCaptureGraphConfiguration)_resolvedGraphConfiguration
{
  return self->__resolvedGraphConfiguration;
}

- (double)_minimumExecutionTime
{
  return self->__minimumExecutionTime;
}

- (int)_requestID
{
  return self->__requestID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__configurationError, 0);
  objc_storeStrong((id *)&self->__resolvedGraphConfiguration, 0);
  objc_storeStrong((id *)&self->__desiredGraphConfiguration, 0);
}

- (BOOL)requiresSessionModification
{
  return 1;
}

- (void)executeWithContext:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CAMModeAndDeviceCommand *)self _sanitizeDeviceUsingContext:v4];
  uint64_t v5 = [(CAMModeAndDeviceCommand *)self _resolvedGraphConfiguration];
  uint64_t v6 = [v5 mode];
  unint64_t v7 = [v5 device];
  uint64_t v8 = [v5 videoConfiguration];
  uint64_t v9 = [v4 currentCaptureSession];
  unint64_t v36 = v7;
  v10 = objc_msgSend(v4, "videoDeviceForMode:desiredDevice:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:resolvedDevice:", v6, v7, v8, objc_msgSend(v5, "videoStabilizationStrength"), objc_msgSend(v5, "enableStereoVideoCapture"), &v36);
  if (v36 != v7)
  {
    objc_super v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(CAMModeAndDeviceCommand *)&v36 executeWithContext:v11];
    }
  }
  v35 = [v10 captureDevice];
  uint64_t v12 = [v10 videoDeviceFormatForGraphConfiguration:v5];
  uint64_t v13 = [v10 videoDevicePresetForGraphConfiguration:v5];
  v14 = (void *)v13;
  if (v12 && v13)
  {
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CAMModeAndDeviceCommand executeWithContext:](v15);
    }
  }
  else
  {
    if (v12 | v13) {
      goto LABEL_13;
    }
    v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CAMModeAndDeviceCommand executeWithContext:](v15);
    }
  }

LABEL_13:
  uint64_t v16 = [(CAMModeAndDeviceCommand *)self _desiredInputsWithContext:v4 captureEngineDevice:v10];
  v17 = [(CAMModeAndDeviceCommand *)self _existingInputsWithContext:v4 without:v16];
  v34 = v17;
  if ([v17 count])
  {
    v18 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      [v17 componentsJoinedByString:@","];
      v20 = uint64_t v19 = v16;
      *(_DWORD *)buf = 138543362;
      v38 = v20;
      _os_log_impl(&dword_2099F8000, v18, OS_LOG_TYPE_DEFAULT, "Removing inputs: %{public}@", buf, 0xCu);

      uint64_t v16 = v19;
      v17 = v34;
    }
  }
  objc_msgSend(v9, "cam_removeInputs:", v17);
  if (v12 || !v14)
  {
    id v21 = (id)*MEMORY[0x263EF9768];

    v14 = v21;
  }
  if ([v35 supportsAVCaptureSessionPreset:v14]
    && [v9 canSetSessionPreset:v14])
  {
    [v9 setSessionPreset:v14];
  }
  else
  {
    v22 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      [(CAMModeAndDeviceCommand *)(uint64_t)v14 executeWithContext:v22];
    }
  }
  v31 = (void *)v16;
  objc_msgSend(v9, "cam_ensureInputs:", v16);
  if (v12) {
    [v35 setActiveFormat:v12];
  }
  v32 = v14;
  v33 = v10;
  v23 = objc_alloc_init(CAMResetVideoMinFrameDurationOverrideCommand);
  [(CAMCaptureCommand *)self addSubcommand:v23];
  if (v12)
  {
    if ([v35 isAutoVideoFrameRateEnabled])
    {
      v24 = [[CAMAutoFPSVideoCommand alloc] initWithAutoFPSVideoEnabled:0];
      [(CAMCaptureCommand *)self addSubcommand:v24];
    }
    v25 = [(CAMModeAndDeviceCommand *)self _specificFramerateCommandForGraphConfiguration:v5 withContext:v4];
    if (v25) {
      [(CAMCaptureCommand *)self addSubcommand:v25];
    }
  }
  v26 = [v4 outputsForGraphConfiguration:v5];
  v27 = [(CAMModeAndDeviceCommand *)self _existingOutputsWithContext:v4 without:v26];
  objc_msgSend(v9, "cam_ensureOutputs:whileRemoving:", v26, v27);
  v28 = [v4 controlsForGraphConfiguration:v5 recording:0];
  objc_msgSend(v9, "cam_ensureControls:", v28);
  [(CAMModeAndDeviceCommand *)self _performPostConfigurationSetupForGraphConfiguration:v5 withContext:v4];
  v29 = v9;
  v30 = [[CAMGraphConfigurationInspectionCommand alloc] initWithKnownGraphConfiguration:v5];
  [(CAMCaptureCommand *)self addSubcommand:v30];
  [(CAMModeAndDeviceCommand *)self _performPostConfigurationSanityCheckForGraphConfiguration:v5 withContext:v4];
}

- (void)_sanitizeDeviceUsingContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CAMCaptureCapabilities capabilities];
  uint64_t v6 = [(CAMModeAndDeviceCommand *)self _desiredGraphConfiguration];
  uint64_t v7 = [v6 mode];
  uint64_t v8 = [v6 device];
  uint64_t v9 = [v6 videoConfiguration];
  uint64_t v10 = [v5 sanitizeDesiredDevice:v8 forMode:v7];
  uint64_t v11 = [v6 videoEncodingBehavior];
  uint64_t v12 = v7;
  int64_t v13 = +[CAMCaptureConfiguration sanitizeVideoConfigurationForDesiredConfiguration:mode:device:spatialVideoEnabled:trueVideoEnabled:](CAMCaptureConfiguration, "sanitizeVideoConfigurationForDesiredConfiguration:mode:device:spatialVideoEnabled:trueVideoEnabled:", v9, v7, v10, [v6 enableStereoVideoCapture], objc_msgSend(v6, "trueVideoEnabled"));
  uint64_t v64 = v10;
  v63 = objc_msgSend(v4, "videoDeviceForMode:desiredDevice:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:resolvedDevice:", v7, v10, v13, objc_msgSend(v6, "videoStabilizationStrength"), objc_msgSend(v6, "enableStereoVideoCapture"), &v64);

  uint64_t v14 = v64;
  BOOL v15 = v7 == 2;
  int v16 = [v6 enableStereoVideoCapture];
  if (v13)
  {
    BOOL v15 = 0;
    BOOL v17 = 0;
  }
  else
  {
    BOOL v17 = v16;
  }
  if ([v5 isSpatialModeSupported]) {
    BOOL v17 = v12 == 8 && v13 == 0;
  }
  v61 = self;
  v62 = v5;
  uint64_t v58 = v12;
  uint64_t v59 = v14;
  if (v15 || v17)
  {
    BOOL v19 = [(CAMModeAndDeviceCommand *)self _outputToExternalStorage];
    uint64_t v20 = [v6 enableStereoVideoCapture];
    LOBYTE(v31) = [v6 prefersHDR10BitVideo];
    uint64_t v60 = [v5 resolvedVideoConfigurationForMode:v12 device:v14 videoEncodingBehavior:v11 videoConfiguration:v13 outputToExternalStorage:v19 spatialVideoEnabled:v20 prefersHDR10BitVideo:v31];
  }
  else
  {
    uint64_t v60 = v13;
  }
  v57 = [CAMCaptureGraphConfiguration alloc];
  uint64_t v56 = [v6 macroMode];
  uint64_t v55 = [v6 audioConfiguration];
  unsigned int v54 = [v6 mixAudioWithOthers];
  char v53 = [v6 windNoiseRemovalEnabled];
  uint64_t v52 = [v6 previewConfiguration];
  uint64_t v51 = [v6 previewSampleBufferVideoFormat];
  v50 = [v6 previewFilters];
  v49 = [v6 videoThumbnailOutputConfiguration];
  uint64_t v48 = [v6 photoEncodingBehavior];
  uint64_t v47 = [v6 videoEncodingBehavior];
  char v46 = [v6 enableAutoFPSVideo];
  char v45 = [v6 isVideoHDRSuspended];
  uint64_t v44 = [v6 aspectRatioCrop];
  uint64_t v43 = [v6 photoQualityPrioritization];
  char v42 = [v6 isCaptureMirrored];
  char v40 = [v6 enableRAWCaptureIfSupported];
  uint64_t v39 = [v6 semanticStyleSupport];
  v41 = [v6 previewSemanticStyle];
  char v38 = [v6 enableContentAwareDistortionCorrection];
  char v37 = [v6 enableResponsiveShutter];
  char v21 = [v6 suspendLivePhotoCapture];
  uint64_t v22 = [v6 videoStabilizationStrength];
  uint64_t v23 = [v6 maximumPhotoResolution];
  uint64_t v24 = [v6 colorSpace];
  char v25 = [v6 enableDepthSuggestion];
  char v26 = [v6 enableZoomPIP];
  v27 = [v6 customLensGroup];
  char v28 = [v6 enableStereoVideoCapture];
  char v29 = [v6 trueVideoEnabled];
  BYTE2(v36) = [v6 prefersHDR10BitVideo];
  BYTE1(v36) = v29;
  LOBYTE(v36) = v28;
  BYTE1(v35) = v26;
  LOBYTE(v35) = v25;
  BYTE2(v34) = v21;
  BYTE1(v34) = v37;
  LOBYTE(v34) = v38;
  BYTE1(v33) = v40;
  LOBYTE(v33) = v42;
  BYTE1(v32) = v45;
  LOBYTE(v32) = v46;
  LOBYTE(v31) = v53;
  v30 = -[CAMCaptureGraphConfiguration initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:](v57, "initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:", v58, v59, v56, v60, v55, v54, v31, v52, v51, v50, v49,
          v48,
          v47,
          v32,
          v44,
          v43,
          v33,
          v39,
          v41,
          v34,
          v22,
          v23,
          v24,
          v35,
          v27,
          v36);

  [(CAMModeAndDeviceCommand *)v61 _setResolvedGraphConfiguration:v30];
}

- (void)_setResolvedGraphConfiguration:(id)a3
{
}

- (id)_existingInputsWithContext:(id)a3 without:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 currentVideoDeviceInput];
  uint64_t v8 = [v6 currentAudioDeviceInput];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v10 = v9;
  if (v7) {
    [v9 addObject:v7];
  }
  if (v8) {
    [v10 addObject:v8];
  }
  [v10 removeObjectsInArray:v5];

  return v10;
}

- (id)_existingOutputsWithContext:(id)a3 without:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 currentStillImageOutput];
  uint64_t v8 = [v6 currentMovieFileOutput];
  id v9 = [v6 currentPanoramaOutput];
  uint64_t v10 = [v6 currentMetadataOutput];
  uint64_t v11 = [v6 currentEffectsPreviewOutput];
  uint64_t v12 = [v6 currentVideoThumbnailOutput];

  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v14 = v13;
  if (v7) {
    [v13 addObject:v7];
  }
  if (v8) {
    [v14 addObject:v8];
  }
  if (v9) {
    [v14 addObject:v9];
  }
  if (v10) {
    [v14 addObject:v10];
  }
  if (v11) {
    [v14 addObject:v11];
  }
  if (v12) {
    [v14 addObject:v12];
  }
  [v14 removeObjectsInArray:v5];

  return v14;
}

- (void)_performPostConfigurationSetupForGraphConfiguration:(id)a3 withContext:(id)a4
{
  id v91 = a3;
  unint64_t v5 = [v91 mode];
  uint64_t v6 = [v91 device];
  uint64_t v7 = [v91 devicePosition];
  uint64_t v8 = +[CAMCaptureCapabilities capabilities];
  id v9 = [[CAMIrisVideoRecordingCommand alloc] initWithVideoRecordingEnabled:[(CAMModeAndDeviceCommand *)self _shouldEnableLivePhotoCaptureForMode:v5 device:v6]];
  [(CAMCaptureCommand *)self addSubcommand:v9];
  uint64_t v10 = -[CAMPausePairedVideoRecordingCommand initWithRecordingPaused:]([CAMPausePairedVideoRecordingCommand alloc], "initWithRecordingPaused:", [v91 suspendLivePhotoCapture]);
  [(CAMCaptureCommand *)self addSubcommand:v10];
  v65 = v8;
  uint64_t v11 = -[CAMCTMVideoCaptureEnabledCommand initWithEnabled:]([CAMCTMVideoCaptureEnabledCommand alloc], "initWithEnabled:", [v8 isCTMVideoCaptureSupportedForMode:v5]);
  [(CAMCaptureCommand *)self addSubcommand:v11];
  uint64_t v12 = [[CAMHighResolutionStillImageCommand alloc] initWithHighResolutionStillImageCaptureEnabled:v5 != 5];
  [(CAMCaptureCommand *)self addSubcommand:v12];
  uint64_t v89 = v6;
  v82 = [[CAMQuadraHighResolutionStillImageCommand alloc] initWithFeatureEnabled:[(CAMModeAndDeviceCommand *)self _wantsQuadraHighResolutionForMode:v5 device:v6]];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if (v5 == 5)
  {
    id v13 = [[CAMTimelapseCaptureRateCommand alloc] initWithDefaultTimelapseCaptureRate];
    [(CAMCaptureCommand *)self addSubcommand:v13];
  }
  uint64_t v87 = v7;
  v81 = [[CAMImageControlModeCommand alloc] initWithCaptureMode:v5 capturing:0];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v80 = [[CAMPanoramaRetainedBufferHintCommand alloc] initWithPanoramaRetainedBufferHintEnabled:v5 == 3];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if (([v91 enableAutoFPSVideo] & 1) == 0)
  {
    uint64_t v14 = [[CAMAutoFPSVideoCommand alloc] initWithAutoFPSVideoEnabled:0];
    [(CAMCaptureCommand *)self addSubcommand:v14];
  }
  v79 = [[CAMLowLightTimelapseCommand alloc] initWithTimelapseLowLightCompensationEnabled:v5 == 5];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v78 = [[CAMLowLightBoostCommand alloc] initWithLowLightBoostEnabled:[(CAMModeAndDeviceCommand *)self _wantsLowLightBoostForMode:v5 device:v6]];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v77 = -[CAMVideoStabilizationCommand initWithAutomaticVideoStabilizationEnabled:strength:]([CAMVideoStabilizationCommand alloc], "initWithAutomaticVideoStabilizationEnabled:strength:", (v5 < 9) & (0x186u >> v5), [v91 videoStabilizationStrength]);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v76 = [[CAMVideoHDRCommand alloc] initWithVideoHDREnabled:1];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  BOOL v15 = -[CAMVideoHDRSuspensionCommand initWithVideoHDRSuspended:]([CAMVideoHDRSuspensionCommand alloc], "initWithVideoHDRSuspended:", [v91 isVideoHDRSuspended]);
  [(CAMCaptureCommand *)self addSubcommand:v15];
  v74 = [[CAMTimelapseStabilizationCommand alloc] initWithTimelapseStabilizationEnabled:v5 == 5];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v73 = [[CAMVideoRecordOrientationCommand alloc] initWithEnabled:v5 == 1];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v72 = [[CAMVideoRecordFaceMetadataCommand alloc] initWithEnabled:v5 == 1];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v71 = [[CAMVideoLivePhotoMetadataWritingEnabledCommand alloc] initWithEnabled:[(CAMModeAndDeviceCommand *)self _wantsLivePhotoMetadataInVideosForMode:v5 device:v6]];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  int v16 = -[CAMSampleBufferVideoFormatOutputCommand initWithSampleBufferVideoFormat:]([CAMSampleBufferVideoFormatOutputCommand alloc], "initWithSampleBufferVideoFormat:", [v91 previewSampleBufferVideoFormat]);
  [(CAMCaptureCommand *)self addSubcommand:v16];
  uint64_t v17 = [v91 videoThumbnailOutputConfiguration];
  if (v17)
  {
    v18 = [[CAMVideoThumbnailOutputConfigurationCommand alloc] initWithConfiguration:v17];
    [(CAMCaptureCommand *)self addSubcommand:v18];
  }
  v69 = (void *)v17;
  v68 = -[CAMPreviewConfigurationCommand initWithPreviewConfiguration:]([CAMPreviewConfigurationCommand alloc], "initWithPreviewConfiguration:", [v91 previewConfiguration]);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  BOOL v19 = -[CAMColorSpaceCommand initWithColorSpace:]([CAMColorSpaceCommand alloc], "initWithColorSpace:", [v91 colorSpace]);
  [(CAMCaptureCommand *)self addSubcommand:v19];
  uint64_t v20 = 0;
  v85 = v10;
  v86 = v9;
  v83 = v12;
  v84 = v11;
  v75 = v15;
  v70 = v16;
  v67 = v19;
  char v21 = v65;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  switch(v5)
  {
    case 0uLL:
      if ([v65 isPhotoModeDepthSuggestionSupportedForDevicePosition:v87]) {
        uint64_t v20 = [v91 enableDepthSuggestion];
      }
      else {
        uint64_t v20 = 0;
      }
      uint64_t v25 = [v65 previewQualityStillImageFilteringForPhotoModeSupported] & v20;
      uint64_t v22 = 0;
      uint64_t v27 = [v65 isLiveFilteringSupported] | v20;
      uint64_t v23 = v20;
      uint64_t v24 = v20;
      uint64_t v26 = v20;
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 8uLL:
      break;
    case 4uLL:
      uint64_t v27 = [v65 isLiveFilteringSupported];
      uint64_t v20 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      break;
    case 6uLL:
      uint64_t v25 = [v65 isDeferredPortraitRenderingSupported];
      uint64_t v20 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = 1;
      uint64_t v24 = 1;
      uint64_t v26 = 1;
      goto LABEL_13;
    case 7uLL:
      uint64_t v20 = 0;
      uint64_t v23 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v22 = 1;
      uint64_t v24 = 1;
LABEL_13:
      uint64_t v27 = 1;
      break;
    case 9uLL:
      uint64_t v20 = 0;
      uint64_t v22 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      uint64_t v23 = 1;
      break;
    default:
      char v21 = v65;
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      break;
  }
  v66 = [[CAMPreviewFilteredRenderingEnabledCommand alloc] initWithFilteredRenderingEnabled:v27];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  uint64_t v64 = [[CAMStillImageFilteredRenderingEnabledCommand alloc] initWithFilteredRenderingEnabled:v26];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v63 = [[CAMStillImagePreviewQualityFilteredRenderingEnabledCommand alloc] initWithPreviewQualityFilteredRenderingEnabled:v25];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v62 = [[CAMPreviewDepthDataDeliveryEnabledCommand alloc] initWithDepthDataDeliveryEnabled:v24];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v61 = [[CAMStillImageDepthDataDeliveryEnabledCommand alloc] initWithDepthDataDeliveryEnabled:v23];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  uint64_t v60 = [[CAMPortraitAutoSuggestEnabledCommand alloc] initWithPortraitAutoSuggestEnabled:v20];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if (v23)
  {
    char v28 = objc_alloc_init(CAMEnableAvailableSemanticSegmentationMatteTypesCommand);
    [(CAMCaptureCommand *)self addSubcommand:v28];
  }
  uint64_t v59 = [[CAMStillImagePortraitEffectsMatteDeliveryEnabledCommand alloc] initWithPortraitEffectsMatteDeliveryEnabled:v23];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  uint64_t v58 = [[CAMVideoDepthDataEnabledCommand alloc] initWithEnabled:v22];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v57 = [v91 previewFilters];
  uint64_t v56 = [[CAMPreviewFiltersCommand alloc] initWithFilters:v57 captureMode:v5];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if ([v21 smartStylesSupported])
  {
    char v29 = [v91 previewSemanticStyle];
    v30 = [[CAMSessionSmartStyleCommand alloc] initWithSmartStyle:v29];
    [(CAMCaptureCommand *)self addSubcommand:v30];
  }
  else
  {
    char v29 = -[CAMSemanticStylesEnabledCommand initWithEnabled:]([CAMSemanticStylesEnabledCommand alloc], "initWithEnabled:", [v91 semanticStyleSupport] & 1);
    [(CAMCaptureCommand *)self addSubcommand:v29];
    unint64_t v31 = [v91 semanticStyleSupport];
    char v32 = v31;
    v30 = [[CAMSemanticStylesPreviewEnabledCommand alloc] initWithEnabled:(v31 >> 2) & 1];
    [(CAMCaptureCommand *)self addSubcommand:v30];
    if ((v32 & 4) != 0)
    {
      uint64_t v33 = [CAMSemanticStylesPreviewStyleCommand alloc];
      uint64_t v34 = [v91 previewSemanticStyle];
      uint64_t v35 = [(CAMSemanticStylesPreviewStyleCommand *)v33 initWithStyle:v34];

      [(CAMCaptureCommand *)self addSubcommand:v35];
    }
  }

  uint64_t v55 = -[CAMPreviewLayerZoomPIPEnabledCommand initWithEnabled:]([CAMPreviewLayerZoomPIPEnabledCommand alloc], "initWithEnabled:", [v91 enableZoomPIP]);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  uint64_t v36 = [(CAMModeAndDeviceCommand *)self _specificEncodingBehaviorCommandForGraphConfiguration:v91];
  if (v36) {
    [(CAMCaptureCommand *)self addSubcommand:v36];
  }
  unsigned int v54 = (void *)v36;
  uint64_t v37 = [(CAMModeAndDeviceCommand *)self _specificPreparePhotoSettingsCommandForGraphConfiguration:v91];
  if (v37) {
    [(CAMCaptureCommand *)self addSubcommand:v37];
  }
  char v53 = (void *)v37;
  uint64_t v52 = objc_alloc_init(CAMSystemPressureMitigationCommand);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if (objc_msgSend(v21, "isAutoFPSVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", v5, objc_msgSend(v91, "videoConfiguration"), objc_msgSend(v91, "videoEncodingBehavior"), -[CAMModeAndDeviceCommand _outputToExternalStorage](self, "_outputToExternalStorage"), objc_msgSend(v91, "enableStereoVideoCapture"), objc_msgSend(v91, "prefersHDR10BitVideo")))uint64_t v38 = objc_msgSend(v91, "enableAutoFPSVideo"); {
  else
  }
    uint64_t v38 = 0;
  uint64_t v39 = v87;
  v88 = [[CAMAutoFPSVideoCommand alloc] initWithAutoFPSVideoEnabled:v38];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  v90 = -[CAMSpatialOverCaptureEnabledCommand initWithSpatialOverCaptureEnabled:]([CAMSpatialOverCaptureEnabledCommand alloc], "initWithSpatialOverCaptureEnabled:", [v21 spatialOverCaptureSupportForMode:v5 device:v89] & 1);
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  uint64_t v40 = [v21 isAspectRatioCropSupportedForMode:v5 devicePosition:v39];
  uint64_t v51 = [[CAMNonDestructiveCropEnabledCommand alloc] initWithNonDestructiveCropEnabled:v40];
  -[CAMCaptureCommand addSubcommand:](self, "addSubcommand:");
  if (v40)
  {
    v41 = -[CAMNonDestructiveCropAspectRatioCommand initWithAspectRatioCrop:]([CAMNonDestructiveCropAspectRatioCommand alloc], "initWithAspectRatioCrop:", [v91 aspectRatioCrop]);
    [(CAMCaptureCommand *)self addSubcommand:v41];
  }
  v50 = -[CAMDeferredProcessingEnabledCommand initWithDeferredProcessingEnabled:]([CAMDeferredProcessingEnabledCommand alloc], "initWithDeferredProcessingEnabled:", [v21 isDeferredProcessingSupportedForMode:v5 devicePosition:v39]);
  [(CAMCaptureCommand *)self addSubcommand:v50];
  v49 = -[CAMPhotoQualityPrioritizationConfigurationCommand initWithPhotoQualityPrioritization:]([CAMPhotoQualityPrioritizationConfigurationCommand alloc], "initWithPhotoQualityPrioritization:", [v91 photoQualityPrioritization]);
  [(CAMCaptureCommand *)self addSubcommand:v49];
  uint64_t v48 = -[CAMMirrorOutputVideoCommand initWithOutputMirrored:]([CAMMirrorOutputVideoCommand alloc], "initWithOutputMirrored:", [v91 isCaptureMirrored]);
  [(CAMCaptureCommand *)self addSubcommand:v48];
  uint64_t v47 = -[CAMContentAwareDistortionCorrectionCommand initWithContentAwareDistortionCorrectionEnabled:]([CAMContentAwareDistortionCorrectionCommand alloc], "initWithContentAwareDistortionCorrectionEnabled:", [v91 enableContentAwareDistortionCorrection]);
  [(CAMCaptureCommand *)self addSubcommand:v47];
  char v42 = -[CAMDemosaicedRAWEnabledCommand initWithEnabled:]([CAMDemosaicedRAWEnabledCommand alloc], "initWithEnabled:", [v91 enableRAWCaptureIfSupported]);
  [(CAMCaptureCommand *)self addSubcommand:v42];
  uint64_t v43 = -[CAMResponsiveShutterEnabledCommand initWithEnabled:]([CAMResponsiveShutterEnabledCommand alloc], "initWithEnabled:", [v91 enableResponsiveShutter]);
  [(CAMCaptureCommand *)self addSubcommand:v43];
  uint64_t v44 = -[CAMMaximumPhotoResolutionCommand initWithMaximumPhotoResolution:]([CAMMaximumPhotoResolutionCommand alloc], "initWithMaximumPhotoResolution:", [v91 maximumPhotoResolution]);
  [(CAMCaptureCommand *)self addSubcommand:v44];
  char v45 = -[CAMFallbackPrimaryConstituentDeviceCommand initWithFallbackPrimaryConstituentDeviceSelection:]([CAMFallbackPrimaryConstituentDeviceCommand alloc], "initWithFallbackPrimaryConstituentDeviceSelection:", objc_msgSend(v21, "fallbackPrimaryConstituentDeviceSelectionForMode:device:videoConfiguration:videoStabilizationStrength:macroMode:spatialVideoEnabled:", objc_msgSend(v91, "mode"), objc_msgSend(v91, "device"), objc_msgSend(v91, "videoConfiguration"), objc_msgSend(v91, "videoStabilizationStrength"), objc_msgSend(v91, "macroMode"), objc_msgSend(v91, "enableStereoVideoCapture")));
  [(CAMCaptureCommand *)self addSubcommand:v45];
  char v46 = [[CAMPostConfigurationSetupCommand alloc] initWithGraphConfiguration:v91];
  [(CAMCaptureCommand *)self addSubcommand:v46];
}

- (BOOL)_shouldEnableLivePhotoCaptureForMode:(int64_t)a3 device:(int64_t)a4
{
  uint64_t v6 = +[CAMCaptureCapabilities capabilities];
  uint64_t v7 = v6;
  if ((unint64_t)(a4 - 1) > 0xA) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = qword_209C79620[a4 - 1];
  }
  char v9 = [v6 isLivePhotoSupportedForDevicePosition:v8];
  if (a3) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v9;
  }
  if (a3 == 4) {
    BOOL v10 = v9;
  }
  if (a3 == 9) {
    BOOL v11 = v9;
  }
  else {
    BOOL v11 = v10;
  }

  return v11;
}

- (BOOL)_isStillImageMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x251u >> a3);
}

- (id)_specificEncodingBehaviorCommandForGraphConfiguration:(id)a3
{
  id v3 = a3;
  if ([v3 mode] == 3) {
    id v4 = -[CAMPanoramaEncodingCommand initWithPhotoEncodingBehavior:]([CAMPanoramaEncodingCommand alloc], "initWithPhotoEncodingBehavior:", [v3 photoEncodingBehavior]);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_specificPreparePhotoSettingsCommandForGraphConfiguration:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 mode];
  if (v4 > 9 || ((1 << v4) & 0x251) == 0) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [[CAMPreparePhotoSettingsCommand alloc] initWithGraphConfiguration:v3];
  }

  return v6;
}

- (void)_performPostConfigurationSanityCheckForGraphConfiguration:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 mode];
  uint64_t v8 = [v6 currentCaptureSession];
  char v9 = [v8 outputs];
  BOOL v10 = [v6 primaryOutputForMode:v7];

  if ([v9 containsObject:v10])
  {
    BOOL v11 = [v10 connectionWithMediaType:*MEMORY[0x263EF9D48]];
    if (v11)
    {
      id v13 = 0;
    }
    else
    {
      id v13 = [MEMORY[0x263F087E8] errorWithDomain:@"CAMModeAndDeviceCommandCannotCaptureErrorDomain" code:-32200 userInfo:0];
    }

    uint64_t v12 = (uint64_t)v13;
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"CAMModeAndDeviceCommandCannotCaptureErrorDomain" code:-32201 userInfo:0];
  }
  id v14 = (id)v12;
  [(CAMModeAndDeviceCommand *)self _setConfigurationError:v12];
}

- (void)_setConfigurationError:(id)a3
{
}

- (id)userInfo
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v4 = [(CAMModeAndDeviceCommand *)self _desiredGraphConfiguration];
  [v3 setObject:v4 forKey:@"CAMModeAndDeviceCommandDesiredConfiguration"];
  uint64_t v5 = [(CAMModeAndDeviceCommand *)self _requestID];
  id v6 = [NSNumber numberWithInt:v5];
  [v3 setObject:v6 forKeyedSubscript:@"CAMModeAndDeviceCommandRequestID"];

  uint64_t v7 = [(CAMModeAndDeviceCommand *)self _configurationError];
  if (v7) {
    [v3 setObject:v7 forKey:@"CAMModeAndDeviceConfigurationError"];
  }

  return v3;
}

- (NSError)_configurationError
{
  return self->__configurationError;
}

- (CAMModeAndDeviceCommand)initWithGraphConfiguration:(id)a3 minimumExecutionTime:(double)a4 requestID:(int)a5 outputToExternalStorage:(BOOL)a6
{
  id v11 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAMModeAndDeviceCommand;
  uint64_t v12 = [(CAMCaptureCommand *)&v18 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->__desiredGraphConfiguration, a3);
    resolvedGraphConfiguration = v13->__resolvedGraphConfiguration;
    v13->__resolvedGraphConfiguration = 0;

    v13->__minimumExecutionTime = a4;
    v13->__requestID = a5;
    configurationError = v13->__configurationError;
    v13->__configurationError = 0;

    v13->__outputToExternalStorage = a6;
    int v16 = v13;
  }

  return v13;
}

- (CAMModeAndDeviceCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMModeAndDeviceCommand;
  uint64_t v5 = [(CAMCaptureCommand *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMModeAndDeviceCommandDesiredConfiguration"];
    desiredGraphConfiguration = v5->__desiredGraphConfiguration;
    v5->__desiredGraphConfiguration = (CAMCaptureGraphConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"CAMModeAndDeviceCommandResolvedConfiguration"];
    resolvedGraphConfiguration = v5->__resolvedGraphConfiguration;
    v5->__resolvedGraphConfiguration = (CAMCaptureGraphConfiguration *)v8;

    [v4 decodeDoubleForKey:@"CAMModeAndDeviceCommandMinimumExecutionTime"];
    v5->__minimumExecutionTime = v10;
    v5->__requestID = [v4 decodeInt32ForKey:@"CAMModeAndDeviceCommandRequestID"];
    id v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMModeAndDeviceCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v7 encodeWithCoder:v4];
  uint64_t v5 = [(CAMModeAndDeviceCommand *)self _desiredGraphConfiguration];
  [v4 encodeObject:v5 forKey:@"CAMModeAndDeviceCommandDesiredConfiguration"];

  uint64_t v6 = [(CAMModeAndDeviceCommand *)self _resolvedGraphConfiguration];
  [v4 encodeObject:v6 forKey:@"CAMModeAndDeviceCommandResolvedConfiguration"];

  [(CAMModeAndDeviceCommand *)self _minimumExecutionTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"CAMModeAndDeviceCommandMinimumExecutionTime");
  objc_msgSend(v4, "encodeInt32:forKey:", -[CAMModeAndDeviceCommand _requestID](self, "_requestID"), @"CAMModeAndDeviceCommandRequestID");
}

- (id)sessionModificationLogReason
{
  id v3 = NSString;
  id v4 = [(CAMModeAndDeviceCommand *)self _desiredGraphConfiguration];
  uint64_t v5 = [v4 shortDescription];
  uint64_t v6 = [v3 stringWithFormat:@"%@ (requestID=%d)", v5, -[CAMModeAndDeviceCommand _requestID](self, "_requestID")];

  return v6;
}

- (id)_desiredInputsWithContext:(id)a3 captureEngineDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CAMModeAndDeviceCommand *)self _resolvedGraphConfiguration];
  uint64_t v9 = [v8 audioConfiguration];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v11 = [v7 captureDeviceInput];

  if (v11) {
    [v10 addObject:v11];
  }
  if (v9)
  {
    uint64_t v12 = [v6 audioDeviceInput];
    if (v12) {
      [v10 addObject:v12];
    }
  }
  return v10;
}

- (id)_specificFramerateCommandForGraphConfiguration:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 mode];
  if (v7 > 9)
  {
    uint64_t v8 = 0;
  }
  else if (v7 == 3)
  {
    id v10 = [CAMPanoramaConfigurationCommand alloc];
    id v11 = [v6 currentPanoramaConfiguration];
    uint64_t v8 = [(CAMPanoramaConfigurationCommand *)v10 initWithConfiguration:v11];
  }
  else
  {
    uint64_t v8 = -[CAMVideoFramerateCommand initWithVideoConfiguration:]([CAMVideoFramerateCommand alloc], "initWithVideoConfiguration:", [v5 videoConfiguration]);
  }

  return v8;
}

- (BOOL)_wantsLivePhotoMetadataInVideosForMode:(int64_t)a3 device:(int64_t)a4
{
  return a3 == 1;
}

- (BOOL)_outputToExternalStorage
{
  return self->__outputToExternalStorage;
}

- (void)executeWithContext:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_5(&dword_2099F8000, a2, a3, "Attempting to use an unsupported session preset %{public}@ on device %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)executeWithContext:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Attempting to configure a mode with both a preset and a device format! We prefer the format over the preset, but the results may be unexpected.", v1, 2u);
}

- (void)executeWithContext:(os_log_t)log .cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Attempting to configure a mode with out a preset or device format! Results may be unexpected.", v1, 2u);
}

- (void)executeWithContext:(NSObject *)a3 .cold.4(void *a1, unint64_t a2, NSObject *a3)
{
  if (*a1 >= 0xCuLL) {
    id v3 = 0;
  }
  else {
    id v3 = off_263FA2990[*a1];
  }
  if (a2 >= 0xC) {
    id v4 = 0;
  }
  else {
    id v4 = off_263FA2990[a2];
  }
  *(_DWORD *)id v5 = 138543618;
  *(void *)&v5[4] = v3;
  *(_WORD *)&v5[12] = 2114;
  *(void *)&v5[14] = v4;
  OUTLINED_FUNCTION_5(&dword_2099F8000, a2, a3, "Resolved device %{public}@ does not match desired device %{public}@. Should have already been resolved in _sanitizeDeviceUsingContext", *(void *)v5, *(void *)&v5[8], *(void *)&v5[16], *MEMORY[0x263EF8340]);
}

@end