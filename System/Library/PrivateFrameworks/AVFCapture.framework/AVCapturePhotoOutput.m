@interface AVCapturePhotoOutput
+ ($2825F4736939C4A6D3AD43837233062D)maxLivePhotoMovieDimensions;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)isAppleProRAWPixelFormat:(OSType)pixelFormat;
+ (BOOL)isBayerRAWPixelFormat:(OSType)pixelFormat;
+ (BOOL)isBayerRawPixelFormat:(unsigned int)a3;
+ (BOOL)isDemosaicedRawPixelFormat:(unsigned int)a3;
+ (NSData)DNGPhotoDataRepresentationForRawSampleBuffer:(CMSampleBufferRef)rawSampleBuffer previewPhotoSampleBuffer:(CMSampleBufferRef)previewPhotoSampleBuffer;
+ (NSData)JPEGPhotoDataRepresentationForJPEGSampleBuffer:(CMSampleBufferRef)JPEGSampleBuffer previewPhotoSampleBuffer:(CMSampleBufferRef)previewPhotoSampleBuffer;
+ (__CFDictionary)_copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:(opaqueCMSampleBuffer *)a3;
+ (id)validMetadataTopLevelCGImagePropertiesKeys;
+ (unint64_t)maxLivePhotoDataSize;
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)livePhotoMovieDimensions;
- ($2825F4736939C4A6D3AD43837233062D)optimizedImageDimensionsForOfflineStabilization;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoMovieDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoMovieVideoFrameDuration;
- (AVCapturePhotoOutput)init;
- (AVCapturePhotoOutputCaptureReadiness)captureReadiness;
- (AVCapturePhotoQualityPrioritization)maxPhotoQualityPrioritization;
- (AVCapturePhotoSettings)photoSettingsForSceneMonitoring;
- (BOOL)_HEVCAndHEIFAreAvailableForSourceDevice:(id)a3;
- (BOOL)_isStillImageStabilizationSupported;
- (BOOL)_requestUsesWaitingForCaptureReadiness:(id)a3;
- (BOOL)_requestUsesWaitingForProcessingReadiness:(id)a3;
- (BOOL)arePrivatePhotoDimensionsEnabled;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)isAppleProRAWEnabled;
- (BOOL)isAppleProRAWSupported;
- (BOOL)isAutoDeferredPhotoDeliveryEnabled;
- (BOOL)isAutoDeferredPhotoDeliverySupported;
- (BOOL)isAutoRedEyeReductionSupported;
- (BOOL)isCameraCalibrationDataDeliverySupported;
- (BOOL)isConstantColorClippingRecoveryEnabled;
- (BOOL)isConstantColorEnabled;
- (BOOL)isConstantColorSaturationBoostEnabled;
- (BOOL)isConstantColorSupported;
- (BOOL)isContentAwareDistortionCorrectionEnabled;
- (BOOL)isContentAwareDistortionCorrectionSupported;
- (BOOL)isDepthDataDeliveryEnabled;
- (BOOL)isDepthDataDeliverySupported;
- (BOOL)isDigitalFlashCaptureEnabled;
- (BOOL)isDualCameraDualPhotoDeliveryEnabled;
- (BOOL)isDualCameraDualPhotoDeliverySupported;
- (BOOL)isDualCameraFusionSupported;
- (BOOL)isEV0PhotoDeliverySupported;
- (BOOL)isFastCapturePrioritizationEnabled;
- (BOOL)isFastCapturePrioritizationSupported;
- (BOOL)isFilterRenderingEnabled;
- (BOOL)isFlashScene;
- (BOOL)isFocusPixelBlurScoreEnabled;
- (BOOL)isFocusPixelBlurScoreSupported;
- (BOOL)isHDRScene;
- (BOOL)isHighResolutionCaptureEnabled;
- (BOOL)isImageOptimizationForOfflineVideoStabilizationSupported;
- (BOOL)isLensStabilizationDuringBracketedCaptureSupported;
- (BOOL)isLivePhotoAutoTrimmingEnabled;
- (BOOL)isLivePhotoCaptureEnabled;
- (BOOL)isLivePhotoCaptureSupported;
- (BOOL)isLivePhotoCaptureSuspended;
- (BOOL)isLivePhotoMovieProcessingSuspended;
- (BOOL)isMovieRecordingEnabled;
- (BOOL)isMovieRecordingSupported;
- (BOOL)isPortraitEffectsMatteDeliveryEnabled;
- (BOOL)isPortraitEffectsMatteDeliverySupported;
- (BOOL)isPreviewQualityAdjustedPhotoFilterRenderingEnabled;
- (BOOL)isPreviewQualityAdjustedPhotoFilterRenderingSupported;
- (BOOL)isProcessedPhotoZoomWithoutUpscalingSupported;
- (BOOL)isResponsiveCaptureEnabled;
- (BOOL)isResponsiveCaptureSupported;
- (BOOL)isSemanticStyleRenderingEnabled;
- (BOOL)isSemanticStyleRenderingSupported;
- (BOOL)isShutterSoundSuppressionSupported;
- (BOOL)isSpatialOverCaptureEnabled;
- (BOOL)isSpatialOverCaptureSupported;
- (BOOL)isSpatialPhotoCaptureEnabled;
- (BOOL)isSpatialPhotoCaptureSupported;
- (BOOL)isStillImageStabilizationScene;
- (BOOL)isUltraHighResolutionZeroShutterLagEnabled;
- (BOOL)isUltraHighResolutionZeroShutterLagSupportEnabled;
- (BOOL)isUltraHighResolutionZeroShutterLagSupported;
- (BOOL)isVideoCaptureEnabled;
- (BOOL)isVideoCaptureSupported;
- (BOOL)isVirtualDeviceConstituentPhotoDeliveryEnabled;
- (BOOL)isVirtualDeviceConstituentPhotoDeliverySupported;
- (BOOL)isVirtualDeviceFusionSupported;
- (BOOL)isZeroShutterLagEnabled;
- (BOOL)isZeroShutterLagSupported;
- (BOOL)maxPhotoDimensionsAreHighResolution;
- (BOOL)optimizesImagesForOfflineVideoStabilization;
- (BOOL)preservesLivePhotoCaptureSuspendedOnSessionStop;
- (CMVideoDimensions)maxPhotoDimensions;
- (NSArray)availableLivePhotoVideoCodecTypes;
- (NSArray)availablePhotoCodecTypes;
- (NSArray)availablePhotoFileTypes;
- (NSArray)availablePhotoPixelFormatTypes;
- (NSArray)availableRawPhotoCodecTypes;
- (NSArray)availableRawPhotoFileTypes;
- (NSArray)availableRawPhotoPixelFormatTypes;
- (NSArray)availableSemanticSegmentationMatteTypes;
- (NSArray)enabledSemanticSegmentationMatteTypes;
- (NSArray)preparedPhotoSettingsArray;
- (NSArray)supportedFlashModes;
- (NSArray)supportedPhotoCodecTypesForFileType:(AVFileType)fileType;
- (NSArray)supportedPhotoPixelFormatTypesForFileType:(AVFileType)fileType;
- (NSArray)supportedRawPhotoPixelFormatTypesForFileType:(AVFileType)fileType;
- (NSUInteger)maxBracketedCapturePhotoCount;
- (float)timeLapseCaptureRate;
- (id)_avErrorUserInfoDictionaryForError:(int)a3 movieRequest:(id)a4 payload:(id)a5 isSpatialOverCaptureMovie:(BOOL)a6;
- (id)_avErrorUserInfoDictionaryForError:(int)a3 photoRequest:(id)a4 payload:(id)a5 isOriginalMovie:(BOOL)a6;
- (id)_errorForFigCaptureSessionNotificationPayloadErrorStatus:(int)a3 userInfo:(id)a4;
- (id)_figCaptureIrisPreparedSettingsForRequest:(id)a3;
- (id)_figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:(id)a3 captureRequestIdentifier:(id)a4 delegate:(id)a5 connections:(id)a6;
- (id)_figCaptureMovieFileRecordingSettingsForAVMomentCaptureMovieRecordingSettings:(id)a3 momentCaptureSettings:(id)a4 delegate:(id)a5 connections:(id)a6;
- (id)_movieRequestForUniqueID:(int64_t)a3;
- (id)_photoRequestForUniqueID:(int64_t)a3;
- (id)_sanitizedSettingsForSettings:(id)a3;
- (id)addConnection:(id)a3 error:(id *)a4;
- (id)connectionMediaTypes;
- (id)deferredSettingsForCapturingPhotoWithSettings:(id)a3;
- (id)digitalFlashExposureTimes;
- (id)exifFocalLengthsByZoomFactor;
- (id)figCaptureIrisPreparedSettings;
- (id)supportedDigitalFlashModes;
- (id)supportedHDRModes;
- (id)supportedRawPhotoCodecTypesForRawPhotoPixelFormatType:(unsigned int)a3 fileType:(id)a4;
- (int64_t)digitalFlashStatus;
- (unsigned)_internalRawFormatFromRawFormat:(unsigned int)a3;
- (void)_addReadinessCoordinator:(id)a3;
- (void)_decrementObserverCountForKeyPath:(id)a3;
- (void)_dispatchFailureCallbacks:(unsigned int)a3 forMovieRequest:(id)a4 withError:(id)a5 cleanupRequest:(BOOL)a6;
- (void)_dispatchFailureCallbacks:(unsigned int)a3 forPhotoRequest:(id)a4 withError:(id)a5 cleanupRequest:(BOOL)a6;
- (void)_dispatchFailureCallbacksForMovieRecordingSettings:(id)a3 momentCaptureSettings:(id)a4 toDelegate:(id)a5 withError:(id)a6;
- (void)_dispatchFailureCallbacksForPhotoSettings:(id)a3 toDelegate:(id)a4 withError:(id)a5;
- (void)_handleDidBeginRecordingMomentCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleDidCaptureStillImageNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleDidFinishCaptureNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleDidFinishMovieCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleDidFinishRecordingIrisMovieNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleDidFinishRecordingVideoNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleDidFinishWritingMomentCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleDidRecordIrisMovieNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_handlePotentiallyFinalPhotoRequestCallbackWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handlePreparationCompleteNotificationWithPayload:(id)a3 settingsID:(int64_t)a4;
- (void)_handleReadyForResponsiveRequestWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleStillImageCompleteNotification:(id)a3 withPayload:(id)a4 forRequest:(id)a5;
- (void)_handleWillBeginCaptureBeforeResolvingSettingsNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleWillBeginCaptureNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_handleWillCaptureStillImageNotificationWithPayload:(id)a3 forRequest:(id)a4;
- (void)_incrementObserverCountForKeyPath:(id)a3;
- (void)_removeReadinessCoordinator:(id)a3;
- (void)_resetLivePhotoCaptureSuspended;
- (void)_resetLivePhotoMovieProcessingSuspended;
- (void)_resetTimeLapseCaptureRate;
- (void)_setDigitalFlashScene:(id)a3 fireStatusKVO:(BOOL)a4 fireExposureTimesKVO:(BOOL)a5;
- (void)_setHighResolutionCaptureEnabled:(BOOL)a3 bumpChangeSeedOut:(BOOL *)a4;
- (void)_setIsFlashScene:(BOOL)a3 firingKVO:(BOOL)a4;
- (void)_setIsHDRScene:(BOOL)a3 firingKVO:(BOOL)a4;
- (void)_setIsStillImageStabilizationScene:(BOOL)a3 firingKVO:(BOOL)a4;
- (void)_setMaxPhotoDimensions:(id)a3 bumpChangeSeedOut:(BOOL *)a4;
- (void)_setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3;
- (void)_updateAppleProRAWSupportedForDevice:(id)a3;
- (void)_updateAutoRedReductionSupportedForSourceDevice:(id)a3;
- (void)_updateAvailableLivePhotoVideoCodecTypesForSourceDevice:(id)a3;
- (void)_updateAvailablePhotoCodecTypesForSourceDevice:(id)a3;
- (void)_updateAvailablePhotoFileTypesForSourceDevice:(id)a3;
- (void)_updateAvailablePhotoPixelFormatTypesForSourceDevice:(id)a3;
- (void)_updateAvailableRawPhotoFileTypesForSourceDevice:(id)a3;
- (void)_updateAvailableRawPhotoPixelFormatTypesForSourceDevice:(id)a3;
- (void)_updateCameraCalibrationDataDeliverySupportedForSourceDevice:(id)a3;
- (void)_updateCaptureReadiness;
- (void)_updateCaptureReadinessStateForCompletedRequest:(id)a3;
- (void)_updateConstantColorSupportedForSourceDevice:(id)a3;
- (void)_updateContentAwareDistortionCorrectionSupportedForDevice:(id)a3;
- (void)_updateDeferredProcessingSupportedForSourceDevice:(id)a3;
- (void)_updateDepthDataDeliverySupportedForSourceDevice:(id)a3;
- (void)_updateFocusPixelBlurScoreSupportedForDevice:(id)a3;
- (void)_updateHighPhotoQualitySupportedForDevice:(id)a3;
- (void)_updateLensStabilizationDuringBracketedCaptureSupportedForSourceDevice:(id)a3;
- (void)_updateLivePhotoCaptureSupportedForSourceDevice:(id)a3;
- (void)_updateLivePhotoMovieDimensionsForSourceDevice:(id)a3;
- (void)_updateMaxBracketedCapturePhotoCountForSourceDevice:(id)a3;
- (void)_updateMaxPhotoDimensionsForDevice:(id)a3;
- (void)_updateMovieRecordingSupportedForSourceDevice:(id)a3;
- (void)_updateOfflineVISSupportedForSourceDevice:(id)a3;
- (void)_updatePreviewQualityAdjustedPhotoFilterRenderingSupportedForDevice:(id)a3;
- (void)_updateProcessedPhotoZoomWithoutUpscalingSupportedForSourceDevice:(id)a3;
- (void)_updateSceneMonitoringForSourceDevice:(id)a3;
- (void)_updateSemanticStyleRenderingSupportedForDevice:(id)a3;
- (void)_updateSpatialOverCaptureSupportedForSourceDevice:(id)a3;
- (void)_updateSpatialPhotoCaptureSupportedForDevice:(id)a3;
- (void)_updateStillImageStabilizationSupportedForSourceDevice:(id)a3;
- (void)_updateSupportedDigitalFlashModesForSourceDevice:(id)a3;
- (void)_updateSupportedFlashModesForSourceDevice:(id)a3;
- (void)_updateSupportedHDRModesForSourceDevice:(id)a3;
- (void)_updateSupportedPropertiesForSourceDevice:(id)a3;
- (void)_updateTimeLapseCaptureRate;
- (void)_updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:(id)a3;
- (void)_updateVirtualDeviceFusionSupportedForSourceDevice:(id)a3;
- (void)_updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:(id)a3;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)beginMomentCaptureWithSettings:(id)a3;
- (void)beginMomentCaptureWithSettings:(id)a3 delegate:(id)a4;
- (void)cancelMomentCaptureWithUniqueID:(int64_t)a3;
- (void)capturePhotoWithSettings:(AVCapturePhotoSettings *)settings delegate:(id)delegate;
- (void)commitCaptureWithSettings:(id)a3 delegate:(id)a4;
- (void)commitMomentCaptureToPhotoWithUniqueID:(int64_t)a3;
- (void)commitMomentCaptureWithUniqueID:(int64_t)a3 toMovieRecordingWithSettings:(id)a4 delegate:(id)a5;
- (void)commitMomentCaptureWithUniqueID:(int64_t)a3 toPhotoCaptureWithSettings:(id)a4 delegate:(id)a5;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)endCaptureWithUniqueID:(int64_t)a3;
- (void)endMomentCaptureWithUniqueID:(int64_t)a3;
- (void)handleBackgroundBlurActiveChangedForDevice:(id)a3;
- (void)handleBackgroundReplacementActiveChangedForDevice:(id)a3;
- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4;
- (void)handleStudioLightingActiveChangedForDevice:(id)a3;
- (void)initiateCaptureWithSettings:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeConnection:(id)a3;
- (void)removeObserver:(id)a3 forKeyPath:(id)a4;
- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)setAppleProRAWEnabled:(BOOL)appleProRAWEnabled;
- (void)setAutoDeferredPhotoDeliveryEnabled:(BOOL)autoDeferredPhotoDeliveryEnabled;
- (void)setConstantColorClippingRecoveryEnabled:(BOOL)a3;
- (void)setConstantColorEnabled:(BOOL)a3;
- (void)setConstantColorSaturationBoostEnabled:(BOOL)a3;
- (void)setContentAwareDistortionCorrectionEnabled:(BOOL)contentAwareDistortionCorrectionEnabled;
- (void)setDepthDataDeliveryEnabled:(BOOL)depthDataDeliveryEnabled;
- (void)setDigitalFlashCaptureEnabled:(BOOL)a3;
- (void)setDualCameraDualPhotoDeliveryEnabled:(BOOL)dualCameraDualPhotoDeliveryEnabled;
- (void)setEnabledSemanticSegmentationMatteTypes:(NSArray *)enabledSemanticSegmentationMatteTypes;
- (void)setExifFocalLengthsByZoomFactor:(id)a3;
- (void)setFastCapturePrioritizationEnabled:(BOOL)fastCapturePrioritizationEnabled;
- (void)setFastCapturePrioritizationSupported:(BOOL)fastCapturePrioritizationSupported;
- (void)setFigCaptureSessionSectionProperty:(__CFString *)a3 withHostTime:(id *)a4;
- (void)setFigCaptureSessionSectionProperty:(__CFString *)a3 withValue:(void *)a4;
- (void)setFilterRenderingEnabled:(BOOL)a3;
- (void)setFocusPixelBlurScoreEnabled:(BOOL)a3;
- (void)setHighResolutionCaptureEnabled:(BOOL)highResolutionCaptureEnabled;
- (void)setLivePhotoAutoTrimmingEnabled:(BOOL)livePhotoAutoTrimmingEnabled;
- (void)setLivePhotoCaptureEnabled:(BOOL)livePhotoCaptureEnabled;
- (void)setLivePhotoCaptureSuspended:(BOOL)livePhotoCaptureSuspended;
- (void)setLivePhotoMovieProcessingSuspended:(BOOL)a3;
- (void)setMaxPhotoDimensions:(CMVideoDimensions)maxPhotoDimensions;
- (void)setMaxPhotoQualityPrioritization:(AVCapturePhotoQualityPrioritization)maxPhotoQualityPrioritization;
- (void)setMovieRecordingEnabled:(BOOL)a3;
- (void)setOptimizesImagesForOfflineVideoStabilization:(BOOL)a3;
- (void)setPhotoSettingsForSceneMonitoring:(AVCapturePhotoSettings *)photoSettingsForSceneMonitoring;
- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)portraitEffectsMatteDeliveryEnabled;
- (void)setPreparedPhotoSettingsArray:(NSArray *)preparedPhotoSettingsArray completionHandler:(void *)completionHandler;
- (void)setPreservesLivePhotoCaptureSuspendedOnSessionStop:(BOOL)preservesLivePhotoCaptureSuspendedOnSessionStop;
- (void)setPreviewQualityAdjustedPhotoFilterRenderingEnabled:(BOOL)a3;
- (void)setPrivatePhotoDimensionsEnabled:(BOOL)a3;
- (void)setResponsiveCaptureEnabled:(BOOL)responsiveCaptureEnabled;
- (void)setSemanticStyleRenderingEnabled:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setSpatialOverCaptureEnabled:(BOOL)a3;
- (void)setSpatialPhotoCaptureEnabled:(BOOL)a3;
- (void)setTimeLapseCaptureRate:(float)a3;
- (void)setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3;
- (void)setUltraHighResolutionZeroShutterLagSupportEnabled:(BOOL)a3;
- (void)setVideoCaptureEnabled:(BOOL)a3;
- (void)setVirtualDeviceConstituentPhotoDeliveryEnabled:(BOOL)virtualDeviceConstituentPhotoDeliveryEnabled;
- (void)setZeroShutterLagEnabled:(BOOL)zeroShutterLagEnabled;
- (void)userInitiatedCaptureRequestAtTime:(unint64_t)a3;
@end

@implementation AVCapturePhotoOutput

- (BOOL)isConstantColorEnabled
{
  return self->_internal->constantColorEnabled;
}

+ (id)validMetadataTopLevelCGImagePropertiesKeys
{
  v15[24] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F2F800];
  v15[0] = *MEMORY[0x1E4F2FD40];
  v15[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F2FB80];
  v15[2] = *MEMORY[0x1E4F2FCD8];
  v15[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F2F630];
  v15[4] = *MEMORY[0x1E4F2FA18];
  v15[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F513E0];
  v15[6] = *MEMORY[0x1E4F2FC20];
  v15[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1F240];
  v15[8] = *MEMORY[0x1E4F51450];
  v15[9] = v6;
  uint64_t v7 = *MEMORY[0x1E4F2F420];
  v15[10] = *MEMORY[0x1E4F1F248];
  v15[11] = v7;
  uint64_t v8 = *MEMORY[0x1E4F2FCE8];
  v15[12] = *MEMORY[0x1E4F2F980];
  v15[13] = v8;
  uint64_t v9 = *MEMORY[0x1E4F2F6A8];
  v15[14] = *MEMORY[0x1E4F2FD00];
  v15[15] = v9;
  uint64_t v10 = *MEMORY[0x1E4F2FCA0];
  v15[16] = *MEMORY[0x1E4F2F6B0];
  v15[17] = v10;
  uint64_t v11 = *MEMORY[0x1E4F2FBE8];
  v15[18] = *MEMORY[0x1E4F2FBE0];
  v15[19] = v11;
  uint64_t v12 = *MEMORY[0x1E4F2F578];
  v15[20] = *MEMORY[0x1E4F2FB40];
  v15[21] = v12;
  uint64_t v13 = *MEMORY[0x1E4F2F6D8];
  v15[22] = *MEMORY[0x1E4F2FD10];
  v15[23] = v13;
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:24];
}

uint64_t __59__AVCapturePhotoOutput_setPhotoSettingsForSceneMonitoring___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 320) = result;
  return result;
}

- (void)_updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:(id)a3
{
  int v5 = objc_msgSend((id)objc_msgSend(a3, "constituentDevices"), "count");
  int v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "figCaptureSourceVideoFormat"), "capturesStillsFromVideoStream");
  internal = self->_internal;
  if (internal->spatialPhotoCaptureEnabled)
  {
    char v8 = 1;
  }
  else
  {
    BOOL v9 = !internal->depthDataDeliveryEnabled || v5 <= 2;
    char v8 = !v9;
  }
  if ([a3 isVirtualDevice]
    && ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "constituentDevices"), "count") < 2 ? (char v10 = 1) : (char v10 = v8),
        (v10 & 1) == 0
     && ((objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isStillImageDisparitySupported") & 1) != 0
      || [a3 isConstituentPhotoCalibrationDataSupported])))
  {
    if (self->_internal->appleProRAWEnabled) {
      int v11 = 0;
    }
    else {
      int v11 = v6 ^ 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (self->_internal->virtualDeviceConstituentPhotoDeliverySupported == v11)
  {
    if (!v11)
    {
LABEL_27:
      BOOL v12 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"virtualDeviceConstituentPhotoDeliverySupported"];
    self->_internal->virtualDeviceConstituentPhotoDeliverySupported = v11;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"virtualDeviceConstituentPhotoDeliverySupported"];
    if ((v11 & 1) == 0)
    {
      if (self->_internal->virtualDeviceConstituentPhotoDeliveryEnabled)
      {
        [(AVCapturePhotoOutput *)self willChangeValueForKey:@"virtualDeviceConstituentPhotoDeliveryEnabled"];
        self->_internal->virtualDeviceConstituentPhotoDeliveryEnabled = 0;
        [(AVCapturePhotoOutput *)self _updateCameraCalibrationDataDeliverySupportedForSourceDevice:a3];
        [(AVCapturePhotoOutput *)self didChangeValueForKey:@"virtualDeviceConstituentPhotoDeliveryEnabled"];
      }
      goto LABEL_27;
    }
  }
  BOOL v12 = [a3 deviceType] == (void)@"AVCaptureDeviceTypeBuiltInDualCamera";
LABEL_28:
  if (self->_internal->dualCameraDualPhotoDeliverySupported != v12)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"dualCameraDualPhotoDeliverySupported"];
    self->_internal->dualCameraDualPhotoDeliverySupported = v12;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"dualCameraDualPhotoDeliverySupported"];
    if (!v12 && self->_internal->dualCameraDualPhotoDeliveryEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"dualCameraDualPhotoDeliveryEnabled"];
      self->_internal->dualCameraDualPhotoDeliveryEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"dualCameraDualPhotoDeliveryEnabled"];
    }
  }
}

- (void)setPhotoSettingsForSceneMonitoring:(AVCapturePhotoSettings *)photoSettingsForSceneMonitoring
{
  if (photoSettingsForSceneMonitoring && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v13);
    }
    NSLog(&cfstr_SuppressingExc.isa, v13);
  }
  else
  {
    int64_t v5 = [(AVCapturePhotoSettings *)self->_internal->photoSettingsForSceneMonitoring HDRMode];
    int64_t v6 = [(AVCapturePhotoSettings *)photoSettingsForSceneMonitoring HDRMode];
    AVCaptureFlashMode v14 = [(AVCapturePhotoSettings *)self->_internal->photoSettingsForSceneMonitoring flashMode];
    AVCaptureFlashMode v7 = [(AVCapturePhotoSettings *)photoSettingsForSceneMonitoring flashMode];
    AVCapturePhotoQualityPrioritization v8 = [(AVCapturePhotoSettings *)self->_internal->photoSettingsForSceneMonitoring photoQualityPrioritization];
    AVCapturePhotoQualityPrioritization v9 = [(AVCapturePhotoSettings *)photoSettingsForSceneMonitoring photoQualityPrioritization];
    int64_t v10 = [(AVCapturePhotoSettings *)self->_internal->photoSettingsForSceneMonitoring digitalFlashMode];
    int64_t v11 = [(AVCapturePhotoSettings *)photoSettingsForSceneMonitoring digitalFlashMode];
    if (v5 != v6) {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"isHDRScene"];
    }
    if (v14 != v7) {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"isFlashScene"];
    }
    if (v8 != v9) {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"isStillImageStabilizationScene"];
    }
    if (v10 != v11)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"digitalFlashStatus"];
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"digitalFlashExposureTimes"];
    }
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__AVCapturePhotoOutput_setPhotoSettingsForSceneMonitoring___block_invoke;
    block[3] = &unk_1E5A72D70;
    block[4] = self;
    block[5] = photoSettingsForSceneMonitoring;
    dispatch_sync(sceneDetectionObserversDispatchQueue, block);
    if (v5 != v6) {
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"isHDRScene"];
    }
    if (v14 != v7) {
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"isFlashScene"];
    }
    if (v8 != v9) {
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"isStillImageStabilizationScene"];
    }
    if (v10 != v11)
    {
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"digitalFlashExposureTimes"];
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"digitalFlashStatus"];
    }
    [(AVCapturePhotoOutput *)self _updateSceneMonitoringForSourceDevice:[(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice]];
  }
}

- (void)_updateSceneMonitoringForSourceDevice:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3052000000;
    v15 = __Block_byref_object_copy__8;
    internal = self->_internal;
    v16 = __Block_byref_object_dispose__8;
    uint64_t v17 = 0;
    sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__AVCapturePhotoOutput__updateSceneMonitoringForSourceDevice___block_invoke;
    block[3] = &unk_1E5A74078;
    block[4] = self;
    block[5] = &v12;
    dispatch_sync(sceneDetectionObserversDispatchQueue, block);
    AVCaptureFlashMode v7 = [(AVCapturePhotoOutput *)self supportedFlashModes];
    if (!-[NSArray containsObject:](v7, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)v13[5], "flashMode"))))objc_msgSend((id)v13[5], "setFlashMode:", 0); {
    id v8 = [(AVCapturePhotoOutput *)self supportedHDRModes];
    }
    if ((objc_msgSend(v8, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)v13[5], "HDRMode"))) & 1) == 0)objc_msgSend((id)v13[5], "setHDRMode:", 0); {
    if (![(AVCapturePhotoOutput *)self _isStillImageStabilizationSupported]
    }
      && !self->_internal->highPhotoQualitySupported)
    {
      [(id)v13[5] setPhotoQualityPrioritization:1];
    }
    id v9 = [(AVCapturePhotoOutput *)self supportedDigitalFlashModes];
    if ((objc_msgSend(v9, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)v13[5], "digitalFlashMode"))) & 1) == 0)objc_msgSend((id)v13[5], "setDigitalFlashMode:", 0); {
    [a3 _setPhotoSettingsForSceneMonitoring:v13[5]];
    }

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    [(AVCapturePhotoOutput *)self _setIsFlashScene:0 firingKVO:1];
    [(AVCapturePhotoOutput *)self _setIsHDRScene:0 firingKVO:1];
    [(AVCapturePhotoOutput *)self _setIsStillImageStabilizationScene:0 firingKVO:1];
    uint64_t v10 = *MEMORY[0x1E4F521E0];
    v18[0] = *MEMORY[0x1E4F521E8];
    v18[1] = v10;
    v19[0] = &unk_1EF4FA8B0;
    v19[1] = MEMORY[0x1E4F1CC08];
    -[AVCapturePhotoOutput _setDigitalFlashScene:fireStatusKVO:fireExposureTimesKVO:](self, "_setDigitalFlashScene:fireStatusKVO:fireExposureTimesKVO:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2], 1, 1);
  }
}

- (id)supportedDigitalFlashModes
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__8;
  internal = self->_internal;
  int64_t v11 = __Block_byref_object_dispose__8;
  uint64_t v12 = 0;
  sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__AVCapturePhotoOutput_supportedDigitalFlashModes__block_invoke;
  v6[3] = &unk_1E5A74078;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)supportedHDRModes
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__8;
  internal = self->_internal;
  int64_t v11 = __Block_byref_object_dispose__8;
  uint64_t v12 = 0;
  sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__AVCapturePhotoOutput_supportedHDRModes__block_invoke;
  v6[3] = &unk_1E5A74078;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NSArray)supportedFlashModes
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__8;
  internal = self->_internal;
  int64_t v11 = __Block_byref_object_dispose__8;
  uint64_t v12 = 0;
  sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__AVCapturePhotoOutput_supportedFlashModes__block_invoke;
  v6[3] = &unk_1E5A74078;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
  uint64_t v4 = (NSArray *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_isStillImageStabilizationSupported
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  internal = self->_internal;
  char v10 = 0;
  sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__AVCapturePhotoOutput__isStillImageStabilizationSupported__block_invoke;
  v6[3] = &unk_1E5A74078;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)_figCaptureIrisPreparedSettingsForRequest:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F50F20]);
  id v30 = a3;
  objc_msgSend(v5, "setSettingsID:", objc_msgSend(a3, "requestID"));
  [v5 setOutputHeight:0xFFFFFFFFLL];
  [v5 setOutputWidth:0xFFFFFFFFLL];
  [v5 setQualityPrioritization:1];
  int64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  availablePhotoCodecTypes = self->_internal->availablePhotoCodecTypes;
  uint64_t v8 = [(NSArray *)availablePhotoCodecTypes countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(availablePhotoCodecTypes);
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", AVOSTypeForString()));
      }
      uint64_t v9 = [(NSArray *)availablePhotoCodecTypes countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v9);
  }
  [v6 addObjectsFromArray:self->_internal->availablePhotoPixelFormatTypes];
  v32 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "activeFormat");
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = (id)[v30 photoSettingsArray];
  uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v31 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v16 = objc_msgSend((id)objc_msgSend(v15, "bracketedSettings"), "count");
          if (v16 > [v5 bracketedImageCount])
          {
            unint64_t v17 = objc_msgSend((id)objc_msgSend(v15, "bracketedSettings"), "count");
            unint64_t maxBracketedCapturePhotoCount = self->_internal->maxBracketedCapturePhotoCount;
            if (v17 < maxBracketedCapturePhotoCount) {
              unint64_t maxBracketedCapturePhotoCount = objc_msgSend((id)objc_msgSend(v15, "bracketedSettings"), "count");
            }
            [v5 setBracketedImageCount:maxBracketedCapturePhotoCount];
          }
        }
        if ([v15 formatFourCC])
        {
          uint64_t v19 = objc_msgSend(v6, "indexOfObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "processedOutputFormat")));
          uint64_t v20 = objc_msgSend(v6, "indexOfObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "formatFourCC")));
          uint64_t v21 = v19 == 0x7FFFFFFFFFFFFFFFLL ? -1 : v19;
          uint64_t v22 = v20 == 0x7FFFFFFFFFFFFFFFLL ? -1 : v20;
          if (v22 > v21) {
            objc_msgSend(v5, "setProcessedOutputFormat:", objc_msgSend(v15, "formatFourCC"));
          }
        }
        if ([v15 rawPhotoPixelFormatType]
          && -[NSDictionary objectForKeyedSubscript:](self->_internal->availableRawPhotoPixelFormatTypes, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "rawPhotoPixelFormatType"))))
        {
          objc_msgSend(v5, "setRawOutputFormat:", -[AVCapturePhotoOutput _internalRawFormatFromRawFormat:](self, "_internalRawFormatFromRawFormat:", objc_msgSend(v15, "rawPhotoPixelFormatType")));
        }
        uint64_t v33 = 0;
        if (po_requestingDefaultHighResStillForAVCapturePhotoSettings(v15, v32, &v33))
        {
          [v5 setOutputHeight:0];
          [v5 setOutputWidth:0];
        }
        else if ([v5 outputWidth] == -1)
        {
          [v5 setOutputWidth:v33];
          [v5 setOutputHeight:HIDWORD(v33)];
        }
        internal = self->_internal;
        if (internal->stillImageStabilizationSupported || internal->highPhotoQualitySupported)
        {
          int v24 = [v5 qualityPrioritization];
          if (v24 <= (int)[v15 photoQualityPrioritization]) {
            uint64_t v25 = [v15 photoQualityPrioritization];
          }
          else {
            uint64_t v25 = [v5 qualityPrioritization];
          }
          [v5 setQualityPrioritization:v25];
        }
        uint64_t v26 = [v15 HDRMode];
        if (v26 > (int)[v5 HDRMode]
          && -[NSArray containsObject:](self->_internal->supportedHDRModes, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "HDRMode"))))
        {
          objc_msgSend(v5, "setHDRMode:", objc_msgSend(v15, "HDRMode"));
        }
        uint64_t v27 = [v15 digitalFlashMode];
        if (v27 > (int)[v5 digitalFlashMode]
          && -[NSArray containsObject:](self->_internal->supportedDigitalFlashModes, "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "digitalFlashMode"))))
        {
          objc_msgSend(v5, "setDigitalFlashMode:", objc_msgSend(v15, "digitalFlashMode"));
        }
        if (objc_msgSend((id)objc_msgSend(v15, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count")
          && self->_internal->virtualDeviceConstituentPhotoDeliverySupported)
        {
          objc_msgSend(v5, "setBravoConstituentImageDeliveryDeviceTypes:", po_deviceArrayToFigCaptureSourceDeviceTypesArray(objc_msgSend(v15, "virtualDeviceConstituentPhotoDeliveryEnabledDevices")));
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v13);
  }
  return v5;
}

+ (BOOL)isBayerRAWPixelFormat:(OSType)pixelFormat
{
  BOOL result = 1;
  if ((int)pixelFormat <= 1734505011)
  {
    if (pixelFormat == 1650943796) {
      return result;
    }
    int v4 = 1651519798;
    goto LABEL_7;
  }
  if (pixelFormat != 1734505012 && pixelFormat != 1735549492)
  {
    int v4 = 1919379252;
LABEL_7:
    if (pixelFormat != v4) {
      return 0;
    }
  }
  return result;
}

- (void)_setIsStillImageStabilizationScene:(BOOL)a3 firingKVO:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"isStillImageStabilizationScene"];
  }
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__AVCapturePhotoOutput__setIsStillImageStabilizationScene_firingKVO___block_invoke;
  v8[3] = &unk_1E5A74028;
  v8[4] = self;
  BOOL v9 = a3;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v8);
  if (v4) {
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"isStillImageStabilizationScene"];
  }
}

- (void)_setDigitalFlashScene:(id)a3 fireStatusKVO:(BOOL)a4 fireExposureTimesKVO:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (a4) {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"digitalFlashStatus"];
  }
  if (v5) {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"digitalFlashExposureTimes"];
  }
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__AVCapturePhotoOutput__setDigitalFlashScene_fireStatusKVO_fireExposureTimesKVO___block_invoke;
  v10[3] = &unk_1E5A72D70;
  v10[4] = self;
  v10[5] = a3;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v10);
  if (v5) {
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"digitalFlashExposureTimes"];
  }
  if (v6) {
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"digitalFlashStatus"];
  }
}

- (void)_setIsHDRScene:(BOOL)a3 firingKVO:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"isHDRScene"];
  }
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__AVCapturePhotoOutput__setIsHDRScene_firingKVO___block_invoke;
  v8[3] = &unk_1E5A74028;
  v8[4] = self;
  BOOL v9 = a3;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v8);
  if (v4) {
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"isHDRScene"];
  }
}

- (void)_setIsFlashScene:(BOOL)a3 firingKVO:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4) {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"isFlashScene"];
  }
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__AVCapturePhotoOutput__setIsFlashScene_firingKVO___block_invoke;
  v8[3] = &unk_1E5A74028;
  v8[4] = self;
  BOOL v9 = a3;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v8);
  if (v4) {
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"isFlashScene"];
  }
}

- (id)deferredSettingsForCapturingPhotoWithSettings:(id)a3
{
  id v4 = -[AVCapturePhotoOutput _figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:](self, "_figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:", a3, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), 0, -[AVCaptureOutput connections](self, "connections"));
  [v4 setDepthDataDeliveryEnabled:self->_internal->depthDataDeliveryEnabled];
  objc_msgSend(v4, "setEmbedsDepthDataInImage:", objc_msgSend(v4, "depthDataDeliveryEnabled"));
  [v4 setPortraitEffectsMatteDeliveryEnabled:self->_internal->portraitEffectsMatteDeliveryEnabled];
  objc_msgSend(v4, "setEmbedsPortraitEffectsMatteInImage:", objc_msgSend(v4, "portraitEffectsMatteDeliveryEnabled"));
  objc_msgSend(v4, "setEnabledSemanticSegmentationMatteURNs:", AVSemanticSegmentationCMPhotoURNsForMatteTypes(-[AVCapturePhotoOutput enabledSemanticSegmentationMatteTypes](self, "enabledSemanticSegmentationMatteTypes")));
  objc_msgSend(v4, "setEmbedsSemanticSegmentationMattesInImage:", objc_msgSend((id)objc_msgSend(v4, "enabledSemanticSegmentationMatteURNs"), "count") != 0);
  id v5 = -[AVCaptureDeferredPhotoSettings _initWithCaptureSettings:serializedProcessingSettings:]([AVCaptureDeferredPhotoSettings alloc], "_initWithCaptureSettings:serializedProcessingSettings:", v4, objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "serializedProcessingSettings"));

  return v5;
}

- (AVCapturePhotoSettings)photoSettingsForSceneMonitoring
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__8;
  internal = self->_internal;
  int64_t v11 = __Block_byref_object_dispose__8;
  uint64_t v12 = 0;
  sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__AVCapturePhotoOutput_photoSettingsForSceneMonitoring__block_invoke;
  v6[3] = &unk_1E5A74078;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
  id v4 = (AVCapturePhotoSettings *)(id)[(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __62__AVCapturePhotoOutput__updateSceneMonitoringForSourceDevice___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 320) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_sanitizedSettingsForSettings:(id)a3
{
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__AVCapturePhotoOutput__sanitizedSettingsForSettings___block_invoke;
  v15[3] = &unk_1E5A79E60;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = &v26;
  v15[7] = &v22;
  v15[8] = &v18;
  v15[9] = v16;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v15);
  if (!*((unsigned char *)v19 + 24) && !self->_internal->highPhotoQualitySupported)
  {
    int64_t maxPhotoQualityPrioritization = 1;
    goto LABEL_6;
  }
  uint64_t v6 = [a3 photoQualityPrioritization];
  int64_t maxPhotoQualityPrioritization = self->_internal->maxPhotoQualityPrioritization;
  if (v6 > maxPhotoQualityPrioritization) {
LABEL_6:
  }
    [a3 _setPhotoQualityPrioritization:maxPhotoQualityPrioritization];
  id v8 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDeviceInput];
  uint64_t v9 = (void *)[v8 device];
  if ([v9 isCenterStageActive]) {
    int v10 = [v8 isCenterStageAllowed];
  }
  else {
    int v10 = 0;
  }
  if ([v9 isBackgroundBlurActive]) {
    int v11 = [v8 isBackgroundBlurAllowed];
  }
  else {
    int v11 = 0;
  }
  if ([v9 isStudioLightActive]) {
    int v12 = [v8 isStudioLightingAllowed];
  }
  else {
    int v12 = 0;
  }
  int v13 = [v9 isBackgroundReplacementActive];
  if (v13) {
    int v13 = [v8 isBackgroundReplacementAllowed];
  }
  if (((v10 | v11 | v12) & 1) != 0 || v13) {
    [a3 _setPhotoQualityPrioritization:1];
  }
  if (self->_internal->highPhotoQualitySupported
    && [a3 photoQualityPrioritization] == 3
    && (AVGestaltGetBoolAnswer(@"AVGQCaptureHighPhotoQualityFrameDropAllowed") & 1) == 0)
  {
    [a3 _setPhotoQualityPrioritization:2];
  }
  if (self->_internal->depthDataDeliveryEnabled
    && [a3 photoQualityPrioritization] == 3
    && (AVGestaltGetBoolAnswer(@"AVGQCaptureDepthWithDeepFusionSupported") & 1) == 0)
  {
    [a3 _setPhotoQualityPrioritization:2];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [a3 _setPhotoQualityPrioritization:1];
  }
  if (!self->_internal->virtualDeviceFusionSupported) {
    [a3 setAutoVirtualDeviceFusionEnabled:0];
  }
  if (!*((unsigned char *)v23 + 24)) {
    [a3 setHDRMode:0];
  }
  if (!*((unsigned char *)v27 + 24)) {
    [a3 setFlashMode:0];
  }
  if ([a3 flashMode] == 2 && objc_msgSend(a3, "isConstantColorEnabled")) {
    [a3 setFlashMode:1];
  }
  if (![a3 HDRMode]) {
    [a3 setEV0PhotoDeliveryEnabled:0];
  }
  if (AVCIFilterArrayContainsPortraitFilters((void *)[a3 adjustedPhotoFilters])) {
    [a3 setAutoVirtualDeviceFusionEnabled:0];
  }
  if ([a3 rawPhotoPixelFormatType])
  {
    if (+[AVCapturePhotoOutput isAppleProRAWPixelFormat:](AVCapturePhotoOutput, "isAppleProRAWPixelFormat:", [a3 rawPhotoPixelFormatType]))
    {
      [a3 setLivePhotoMovieFileURL:0];
      [a3 setAutoContentAwareDistortionCorrectionEnabled:0];
      [a3 setAutoRedEyeReductionEnabled:0];
      [a3 setDepthDataDeliveryEnabled:0];
      [a3 setPortraitEffectsMatteDeliveryEnabled:0];
      [a3 setEnabledSemanticSegmentationMatteTypes:MEMORY[0x1E4F1CBF0]];
    }
    else if (![a3 formatFourCC])
    {
      [a3 setTurboModeEnabled:1];
      [a3 setProcessedPhotoZoomWithoutUpscalingEnabled:0];
    }
  }
  if (objc_msgSend((id)objc_msgSend(a3, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count")) {
    [a3 setAutoVirtualDeviceFusionEnabled:0];
  }
  if (([a3 isDepthDataDeliveryEnabled] & 1) == 0)
  {
    [a3 setEmbedsDepthDataInPhoto:0];
    [a3 setDepthDataFiltered:0];
  }
  if (([a3 isPortraitEffectsMatteDeliveryEnabled] & 1) == 0) {
    [a3 setEmbedsPortraitEffectsMatteInPhoto:0];
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "enabledSemanticSegmentationMatteTypes"), "count")) {
    [a3 setEmbedsSemanticSegmentationMattesInPhoto:0];
  }
  if ([a3 livePhotoMovieFileURL])
  {
    [a3 setSquareCropEnabled:0];
    [a3 setShutterSound:0];
  }
  if (![a3 livePhotoMovieFileURL])
  {
    [a3 setLivePhotoMovieMetadata:0];
    [a3 setLivePhotoMovieFileURLForOriginalPhoto:0];
    [a3 setLivePhotoMovieMetadataForOriginalPhoto:0];
  }
  if (([a3 isEV0PhotoDeliveryEnabled] & 1) == 0)
  {
    [a3 setLivePhotoMovieFileURLForOriginalPhoto:0];
    [a3 setLivePhotoMovieMetadataForOriginalPhoto:0];
  }
  if ([a3 isBurstQualityCaptureEnabled])
  {
    [a3 setHDRMode:0];
    [a3 _setPhotoQualityPrioritization:1];
    [a3 setAutoVirtualDeviceFusionEnabled:0];
    [a3 setFlashMode:0];
    [a3 setConstantColorEnabled:0];
    [a3 setLivePhotoMovieFileURL:0];
  }
  if ([a3 digitalFlashMode]) {
    [a3 setShutterSound:1119];
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return a3;
}

uint64_t __59__AVCapturePhotoOutput__isStillImageStabilizationSupported__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16)
                                                                            + 89);
  return result;
}

uint64_t __55__AVCapturePhotoOutput_photoSettingsForSceneMonitoring__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 16)
                                                                              + 320);
  return result;
}

id __50__AVCapturePhotoOutput_supportedDigitalFlashModes__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 120);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __43__AVCapturePhotoOutput_supportedFlashModes__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 112);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __41__AVCapturePhotoOutput_supportedHDRModes__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 96);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __64__AVCapturePhotoOutput__updateSupportedHDRModesForSourceDevice___block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 96) = result;
  return result;
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[a3 mediaType];
  uint64_t v8 = *MEMORY[0x1E4F47C68];
  if (([v7 isEqualToString:*MEMORY[0x1E4F47C68]] & 1) == 0
    && ([v7 isEqualToString:*MEMORY[0x1E4F47C40]] & 1) == 0
    && (![v7 isEqualToString:*MEMORY[0x1E4F47C50]]
     || !AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined()))
  {
    uint64_t v9 = 1;
    goto LABEL_23;
  }
  if (([v7 isEqualToString:v8] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x1E4F47C40]])
  {
    if ([(AVCaptureOutput *)self connectionWithMediaType:v7])
    {
      uint64_t v9 = 2;
LABEL_23:
      uint64_t v19 = (void *)AVCaptureOutputConnectionFailureReasonString(v9, (uint64_t)self, a3);
      BOOL result = 0;
      *a4 = v19;
      return result;
    }
    return 1;
  }
  uint64_t v10 = *MEMORY[0x1E4F47C50];
  if (![v7 isEqualToString:*MEMORY[0x1E4F47C50]]) {
    return 1;
  }
  int v11 = objc_msgSend((id)objc_msgSend(a3, "inputPorts"), "firstObject");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v12 = [(AVCaptureOutput *)self connections];
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v13) {
    return 1;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v21 != v15) {
        objc_enumerationMutation(v12);
      }
      char v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v17, "mediaType"), "isEqualToString:", v10)
        && (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "inputPorts"), "firstObject"), "input"), "isEqual:", objc_msgSend(v11, "input")) & 1) == 0)
      {
        uint64_t v9 = 3;
        goto LABEL_23;
      }
    }
    uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    BOOL result = 1;
    if (v14) {
      continue;
    }
    return result;
  }
}

- (BOOL)isDepthDataDeliveryEnabled
{
  return self->_internal->depthDataDeliveryEnabled;
}

- (BOOL)isVirtualDeviceConstituentPhotoDeliveryEnabled
{
  return self->_internal->virtualDeviceConstituentPhotoDeliveryEnabled;
}

- (BOOL)isLivePhotoCaptureEnabled
{
  return self->_internal->livePhotoCaptureEnabled;
}

- (NSArray)enabledSemanticSegmentationMatteTypes
{
  uint64_t v2 = self->_internal->enabledSemanticSegmentationTypes;

  return v2;
}

- (BOOL)isUltraHighResolutionZeroShutterLagSupportEnabled
{
  return self->_internal->ultraHighResolutionZeroShutterLagSupportEnabled;
}

- (BOOL)isAppleProRAWEnabled
{
  return self->_internal->appleProRAWEnabled;
}

- (BOOL)isSemanticStyleRenderingEnabled
{
  return self->_internal->semanticStyleRenderingEnabled;
}

- (BOOL)maxPhotoDimensionsAreHighResolution
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "activeFormat"), "defaultPhotoDimensionsWithHighResolutionCaptureEnabled:", 1);
  internal = self->_internal;
  return internal->maxPhotoDimensions.width >= (int)v3 && internal->maxPhotoDimensions.height >= SHIDWORD(v3);
}

- (BOOL)isSpatialPhotoCaptureEnabled
{
  return self->_internal->spatialPhotoCaptureEnabled;
}

- (BOOL)isContentAwareDistortionCorrectionEnabled
{
  return self->_internal->contentAwareDistortionCorrectionEnabled;
}

- (BOOL)isAutoDeferredPhotoDeliveryEnabled
{
  return self->_internal->autoDeferredPhotoDeliveryEnabled;
}

- (id)figCaptureIrisPreparedSettings
{
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2);
  id v3 = [(AVCapturePhotoOutput *)self _figCaptureIrisPreparedSettingsForRequest:[(NSMutableArray *)self->_internal->prepareRequests lastObject]];
  MEMORY[0x1A6234340](self->_internal->requestsLock);
  return v3;
}

- (BOOL)preservesLivePhotoCaptureSuspendedOnSessionStop
{
  return self->_internal->preservesLivePhotoCaptureSuspendedOnSessionStop;
}

- (BOOL)optimizesImagesForOfflineVideoStabilization
{
  return self->_internal->optimizesImagesForOfflineVideoStabilization;
}

- (AVCapturePhotoQualityPrioritization)maxPhotoQualityPrioritization
{
  return self->_internal->maxPhotoQualityPrioritization;
}

- (CMVideoDimensions)maxPhotoDimensions
{
  return (CMVideoDimensions)self->_internal->maxPhotoDimensions;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoMovieVideoFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 184);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoMovieDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 160);
  return self;
}

- (BOOL)isZeroShutterLagEnabled
{
  return self->_internal->zeroShutterLagEnabled;
}

- (BOOL)isSpatialOverCaptureEnabled
{
  return self->_internal->spatialOverCaptureEnabled;
}

- (BOOL)isResponsiveCaptureEnabled
{
  return self->_internal->responsiveCaptureEnabled;
}

- (BOOL)isPreviewQualityAdjustedPhotoFilterRenderingEnabled
{
  return self->_internal->previewQualityAdjustedPhotoFilterRenderingEnabled;
}

- (BOOL)isPortraitEffectsMatteDeliveryEnabled
{
  return self->_internal->portraitEffectsMatteDeliveryEnabled;
}

- (BOOL)isMovieRecordingEnabled
{
  return self->_internal->movieRecordingEnabled;
}

- (BOOL)isLivePhotoCaptureSuspended
{
  return self->_internal->livePhotoCaptureSuspended;
}

- (BOOL)isLivePhotoAutoTrimmingEnabled
{
  return self->_internal->livePhotoAutoTrimmingEnabled;
}

- (BOOL)isFocusPixelBlurScoreEnabled
{
  return self->_internal->focusPixelFocusBlurScoreEnabled;
}

- (BOOL)isFilterRenderingEnabled
{
  return self->_internal->filterRenderingEnabled;
}

- (BOOL)isFastCapturePrioritizationEnabled
{
  return self->_internal->fastCapturePrioritizationEnabled;
}

- (BOOL)isDigitalFlashCaptureEnabled
{
  return self->_internal->digitalFlashCaptureEnabled;
}

- (BOOL)isConstantColorSaturationBoostEnabled
{
  return self->_internal->constantColorSaturationBoostEnabled;
}

- (BOOL)isConstantColorClippingRecoveryEnabled
{
  return self->_internal->constantColorClippingRecoveryEnabled;
}

- (id)exifFocalLengthsByZoomFactor
{
  uint64_t v2 = (void *)[(NSDictionary *)self->_internal->exifFocalLengthsByZoomFactor copy];

  return v2;
}

- ($2825F4736939C4A6D3AD43837233062D)livePhotoMovieDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_internal->livePhotoMovieDimensions;
}

- (void)setSession:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVCapturePhotoOutput;
  -[AVCaptureOutput setSession:](&v5, sel_setSession_);
  if (!self->_internal->maxPhotoQualityPrioritizationHasBeenSetByClient)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v4 = 1;
    }
    else {
      int64_t v4 = 2;
    }
    if (self->_internal->maxPhotoQualityPrioritization != v4)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"maxPhotoQualityPrioritization"];
      self->_internal->int64_t maxPhotoQualityPrioritization = v4;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"maxPhotoQualityPrioritization"];
    }
  }
}

uint64_t __69__AVCapturePhotoOutput__setIsStillImageStabilizationScene_firingKVO___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16) + 286) = *(unsigned char *)(result + 40);
  return result;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AVCapturePhotoOutput;
  id v5 = [(AVCaptureOutput *)&v12 addConnection:a3 error:a4];
  uint64_t v6 = (void *)[v5 mediaType];
  if ([v6 isEqual:*MEMORY[0x1E4F47C68]])
  {
    uint64_t v7 = (void *)[v5 sourceDevice];
    [v7 addObserver:self forKeyPath:@"flashSceneDetectedForPhotoOutput" options:7 context:AVCapturePhotoOutputDeviceFlashSceneDetectedForPhotoOutputChangedContext];
    [v7 addObserver:self forKeyPath:@"HDRSceneDetectedForPhotoOutput" options:7 context:AVCapturePhotoOutputDeviceHDRSceneDetectedForPhotoOutputChangedContext];
    [v7 addObserver:self forKeyPath:@"isStillImageStabilizationScene" options:7 context:AVCapturePhotoOutputDeviceStillImageStabilizationSceneChangedContext];
    [v7 addObserver:self forKeyPath:@"digitalFlashSceneForPhotoOutput" options:7 context:AVCapturePhotoOutputDeviceDigitalFlashSceneForPhotoOutputChangedContext];
    [v7 addObserver:self forKeyPath:@"videoHDREnabled" options:0 context:AVCapturePhotoOutputDeviceVideoHDREnabledChangedContext];
    [v7 addObserver:self forKeyPath:@"spatialOverCaptureEnabled" options:0 context:AVCapturePhotoOutputDeviceSpatialOverCaptureEnabledChangedContext];
    id v8 = [(AVCaptureOutput *)self session];
    [v8 addObserver:self forKeyPath:@"sessionPreset" options:0 context:AVCapturePhotoOutputSessionPresetChangedContext];
    id v9 = [(AVCaptureOutput *)self session];
    [v9 addObserver:self forKeyPath:@"outputs" options:0 context:AVCapturePhotoOutputSessionOutputsChangedContext];
    id v10 = [(AVCaptureOutput *)self session];
    [v10 addObserver:self forKeyPath:@"running" options:5 context:AVCapturePhotoOutputSessionIsRunningChangedContext];
    [v7 addObserver:self forKeyPath:@"geometricDistortionCorrectionEnabled" options:3 context:AVCapturePhotoOutputDeviceGDCEnabledChangedContext];
    self->_internal->timeLapseCaptureRateNeedsUpdate = 1;
    [v7 addObserver:self forKeyPath:@"imageControlMode" options:15 context:AVCapturePhotoOutputDeviceImageControlModeChangedContext];
    [(AVCapturePhotoOutput *)self _updateSupportedPropertiesForSourceDevice:v7];
  }
  return v5;
}

- (void)_updateSemanticStyleRenderingSupportedForDevice:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isSemanticStyleRenderingSupported");
  internal = self->_internal;
  if (v4) {
    BOOL v6 = internal->maxPhotoQualityPrioritization > 1;
  }
  else {
    BOOL v6 = 0;
  }
  if (internal->semanticStyleRenderingSupported == v6) {
    return;
  }
  [(AVCapturePhotoOutput *)self willChangeValueForKey:@"semanticStyleRenderingSupported"];
  self->_internal->BOOL semanticStyleRenderingSupported = v6;
  uint64_t v7 = self->_internal;
  BOOL semanticStyleRenderingSupported = v7->semanticStyleRenderingSupported;
  BOOL semanticStyleRenderingEnabled = v7->semanticStyleRenderingEnabled;
  if (semanticStyleRenderingSupported)
  {
    if (!semanticStyleRenderingEnabled)
    {
      BOOL v10 = 1;
LABEL_10:
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"semanticStyleRenderingEnabled"];
      self->_internal->BOOL semanticStyleRenderingEnabled = v10;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"semanticStyleRenderingEnabled"];
    }
  }
  else if (semanticStyleRenderingEnabled)
  {
    BOOL v10 = 0;
    goto LABEL_10;
  }

  [(AVCapturePhotoOutput *)self didChangeValueForKey:@"semanticStyleRenderingSupported"];
}

- (void)_updateSpatialPhotoCaptureSupportedForDevice:(id)a3
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "figCaptureSourceVideoFormat"), "isStereoPhotoCaptureSupported"))int BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQMZMLNHBX4MFF5QD4PJWZFEVCEI"); {
  else
  }
    int BoolAnswer = 0;
  if (self->_internal->spatialPhotoCaptureSupported != BoolAnswer)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"spatialPhotoCaptureSupported"];
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"stereoPhotoCaptureSupported"];
    self->_internal->spatialPhotoCaptureSupported = BoolAnswer;
    internal = self->_internal;
    if (!internal->spatialPhotoCaptureSupported && internal->spatialPhotoCaptureEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"spatialPhotoCaptureEnabled"];
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"stereoPhotoCaptureEnabled"];
      self->_internal->spatialPhotoCaptureEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"stereoPhotoCaptureEnabled"];
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"spatialPhotoCaptureEnabled"];
    }
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"stereoPhotoCaptureSupported"];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"spatialPhotoCaptureSupported"];
  }
}

- (id)_figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:(id)a3 captureRequestIdentifier:(id)a4 delegate:(id)a5 connections:(id)a6
{
  uint64_t v7 = v6;
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F50F30]), "initWithSettingsID:captureRequestIdentifier:", objc_msgSend(a3, "uniqueID"), a4);
  v149 = (void *)[MEMORY[0x1E4F1CA80] set];
  objc_msgSend(v11, "setClientQualityPrioritization:", objc_msgSend(a3, "photoQualityPrioritization"));
  id v147 = [(AVCapturePhotoOutput *)self _sanitizedSettingsForSettings:a3];
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v168 = 0u;
  uint64_t v12 = [a6 countByEnumeratingWithState:&v165 objects:v172 count:16];
  v153 = v11;
  v148 = self;
  if (!v12)
  {
    v151 = 0;
LABEL_19:
    uint64_t v146 = v7;
    LODWORD(v145) = 0;
    FigDebugAssert3();
    long long v23 = 0;
    goto LABEL_20;
  }
  uint64_t v13 = v12;
  v151 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = *(void *)v166;
  uint64_t v16 = *MEMORY[0x1E4F47C68];
  uint64_t v17 = *MEMORY[0x1E4F47C40];
  uint64_t v18 = *MEMORY[0x1E4F47C50];
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v166 != v15) {
        objc_enumerationMutation(a6);
      }
      long long v20 = *(void **)(*((void *)&v165 + 1) + 8 * i);
      long long v21 = objc_msgSend((id)objc_msgSend(v20, "inputPorts"), "firstObject");
      if ([v20 isEnabled] && objc_msgSend(v21, "isEnabled"))
      {
        long long v22 = (void *)[v21 mediaType];
        if ([v22 isEqual:v16])
        {
          uint64_t v14 = v20;
        }
        else if ([v22 isEqual:v17])
        {
          v151 = v20;
        }
        else if ([v22 isEqual:v18])
        {
          [v149 addObject:v20];
        }
      }
    }
    uint64_t v13 = [a6 countByEnumeratingWithState:&v165 objects:v172 count:16];
  }
  while (v13);
  id v11 = v153;
  self = v148;
  uint64_t v7 = v6;
  long long v23 = v14;
  if (!v14) {
    goto LABEL_19;
  }
LABEL_20:
  v150 = v23;
  if (objc_msgSend(v147, "livePhotoMovieFileURL", v145, v146))
  {
    [v11 setMovieMode:1];
    id v24 = objc_alloc_init(MEMORY[0x1E4F50F48]);
    objc_msgSend(v24, "setSettingsID:", objc_msgSend(v147, "uniqueID"));
    [v24 setIrisRecording:1];
    objc_msgSend(v24, "setOutputURL:", objc_msgSend(v147, "livePhotoMovieFileURL"));
    uint64_t v25 = *MEMORY[0x1E4F47C08];
    [v24 setOutputFileType:*MEMORY[0x1E4F47C08]];
    long long v163 = *MEMORY[0x1E4F1F9F8];
    uint64_t v164 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [v24 setMaxDuration:&v163];
    [v24 setMaxFileSize:0];
    [v24 setMinFreeDiskSpaceLimit:0];
    $2825F4736939C4A6D3AD43837233062D v26 = [(AVCapturePhotoOutput *)self livePhotoMovieDimensions];
    unint64_t v27 = HIDWORD(*(unint64_t *)&v26);
    v170[0] = *MEMORY[0x1E4F24E10];
    v171[0] = [NSNumber numberWithInt:v26];
    v170[1] = *MEMORY[0x1E4F24D08];
    v171[1] = [NSNumber numberWithInt:v27];
    objc_msgSend(v24, "setVideoSettings:", -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v23, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v171, v170, 2), objc_msgSend(v147, "livePhotoVideoCodecType"), v25, 1, 0));
    objc_msgSend(v24, "setVideoMirrored:", objc_msgSend(v23, "isVideoMirrored"));
    objc_msgSend(v24, "setVideoOrientation:", objc_msgSend(v23, "_videoOrientation"));
    [v24 setRecordVideoOrientationAndMirroringChanges:1];
    int v28 = [v23 isDebugMetadataSidecarFileEnabled];
    if (v28) {
      LOBYTE(v28) = objc_opt_respondsToSelector();
    }
    [v24 setDebugMetadataSidecarFileEnabled:v28 & 1];
    [v24 setMetadataIdentifiersEnabled:objc_opt_respondsToSelector() & 1];
    [v24 setSendPreviewIOSurface:0];
    if (v151) {
      objc_msgSend(v24, "setAudioSettings:", -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v151, 0, 0, *MEMORY[0x1E4F47C18], 1, 0));
    }
    CMTimeMake(&v162, 1, 1);
    CMTime v161 = v162;
    [v24 setMovieFragmentInterval:&v161];
    objc_msgSend(v24, "setMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E4F47DC8], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(v147, "livePhotoMovieMetadata")));
    if ([v147 isAutoSpatialOverCaptureEnabled])
    {
      objc_msgSend(v24, "setSpatialOverCaptureMovieURL:", objc_msgSend(v147, "spatialOverCaptureLivePhotoMovieFileURL"));
      objc_msgSend(v24, "setSpatialOverCaptureMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E4F47DC8], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(v147, "spatialOverCaptureLivePhotoMovieMetadata")));
    }
    [v11 setMovieRecordingSettings:v24];
  }
  [v11 setSettingsProvider:1];
  [v11 setPayloadType:objc_opt_respondsToSelector() & 1];
  objc_msgSend(v11, "setOutputFormat:", objc_msgSend(v147, "formatFourCC"));
  objc_msgSend(v11, "setOutputFileType:", po_figCaptureStillImageSettingsFileTypeForAVFileType(objc_msgSend(v147, "processedFileType")));
  objc_msgSend(v11, "setRawOutputFormat:", -[AVCapturePhotoOutput _internalRawFormatFromRawFormat:](self, "_internalRawFormatFromRawFormat:", objc_msgSend(v147, "rawPhotoPixelFormatType")));
  objc_msgSend(v11, "setRawOutputFileType:", po_figCaptureStillImageSettingsFileTypeForAVFileType(objc_msgSend(v147, "rawFileType")));
  v152 = (void *)[v23 sourceDevice];
  char v29 = self;
  id v30 = (void *)[v152 activeFormat];
  uint64_t v160 = 0;
  int v31 = po_requestingDefaultHighResStillForAVCapturePhotoSettings(v147, v30, &v160);
  int v32 = v160;
  int v33 = HIDWORD(v160);
  if (v31)
  {
    unint64_t v34 = 0;
    unint64_t v35 = 0;
  }
  else if (v29->_internal->optimizesImagesForOfflineVideoStabilization)
  {
    unint64_t v35 = [(AVCapturePhotoOutput *)v29 optimizedImageDimensionsForOfflineStabilization];
    unint64_t v34 = HIDWORD(v35);
  }
  else
  {
    unint64_t v34 = HIDWORD(v160);
    unint64_t v35 = v160;
  }
  objc_msgSend(v11, "setSquareCropEnabled:", objc_msgSend(v147, "isSquareCropEnabled"));
  [v11 setOutputWidth:v35];
  [v11 setOutputHeight:v34];
  long long v36 = (void *)[v147 format];
  objc_msgSend(v11, "setVtCompressionProperties:", objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E4F47D40]));
  id v37 = [(AVCaptureConnection *)[(AVCaptureOutput *)v148 connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice];
  objc_msgSend(v11, "setDeferredSourceDeviceType:", objc_msgSend(v37, "figCaptureSourceDeviceType"));
  objc_msgSend(v11, "setDeferredSourcePosition:", objc_msgSend(v37, "figCaptureSourcePosition"));
  objc_msgSend(v11, "setDeferredVideoFormatUniqueID:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "activeFormat"), "figCaptureSourceVideoFormat"), "uniqueID"));
  if ([(AVCapturePhotoOutput *)v148 isDepthDataDeliverySupported]
    && [(AVCapturePhotoOutput *)v148 isDepthDataDeliveryEnabled])
  {
    objc_msgSend(v11, "setDeferredDepthDataFormatUniqueID:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "activeDepthDataFormat"), "figCaptureSourceDepthDataFormat"), "uniqueID"));
  }
  double v38 = (double)v32;
  double v39 = (double)v33;
  objc_msgSend(v11, "setOutputMirroring:", objc_msgSend(v23, "isVideoMirrored"));
  objc_msgSend(v11, "setOutputOrientation:", objc_msgSend(v23, "_videoOrientation"));
  objc_msgSend(v11, "setPreviewEnabled:", objc_msgSend(v147, "previewFormatFourCC") != 0);
  int v40 = [v11 previewEnabled];
  long long v41 = (double *)MEMORY[0x1E4F1DB30];
  if (v40)
  {
    double v42 = (double)[v11 outputWidth];
    double v43 = (double)[v11 outputHeight];
    [v147 previewCGSize];
    BOOL v46 = v44 == *v41;
    BOOL v47 = v45 == v41[1];
    if (v46 && v47) {
      double height = 640.0;
    }
    else {
      double height = v45;
    }
    if (v46 && v47) {
      double v49 = 852.0;
    }
    else {
      double v49 = v44;
    }
    if (v31)
    {
      double v43 = (double)v33;
      double v50 = (double)v32;
    }
    else
    {
      double v50 = v42;
    }
    int v51 = [v147 isSquareCropEnabled];
    if (v50 >= v43) {
      double v52 = v43;
    }
    else {
      double v52 = v50;
    }
    if (v51) {
      double v53 = v52;
    }
    else {
      double v53 = v43;
    }
    if (v51) {
      double v54 = v52;
    }
    else {
      double v54 = v50;
    }
    int v55 = [v147 arePreviewPhotoFormatDimensionsLimitedToDisplayDimensions];
    double v56 = v53;
    double v57 = v54;
    if (v55) {
      double v56 = AVCaptureMainScreenPixelSize();
    }
    if (v49 <= v57) {
      double width = v49;
    }
    else {
      double width = v57;
    }
    if (height > v56) {
      double height = v56;
    }
    float v59 = v54 / v53;
    float v60 = width / height;
    if (vabds_f32(v59, v60) >= 0.01)
    {
      uint64_t v61 = 0;
      uint64_t v62 = 0;
      v174.double width = v54;
      v174.double height = v53;
      double v63 = height;
      CGRect v175 = AVMakeRectWithAspectRatioInsideRect(v174, *(CGRect *)(&width - 2));
      double width = v175.size.width;
      double height = v175.size.height;
    }
    float v64 = width * 0.5;
    [v11 setPreviewWidth:2 * llroundf(v64)];
    float v65 = height * 0.5;
    [v11 setPreviewHeight:2 * llroundf(v65)];
    objc_msgSend(v11, "setPreviewFormat:", objc_msgSend(v147, "previewFormatFourCC"));
    objc_msgSend(v11, "setPreviewMirroring:", objc_msgSend(v11, "outputMirroring"));
    objc_msgSend(v11, "setPreviewOrientation:", objc_msgSend(v11, "outputOrientation"));
  }
  objc_msgSend(v11, "setThumbnailEnabled:", objc_msgSend(v147, "embeddedThumbnailFormatFourCC") != 0);
  if ([v11 thumbnailEnabled])
  {
    double v66 = (double)[v11 outputWidth];
    double v67 = (double)[v11 outputHeight];
    [v147 embeddedThumbnailCGSize];
    double v70 = v69;
    double v71 = v68;
    if (v69 == *v41
      && v68 == v41[1]
      && ([v11 outputFileType] == 1785096550
       || [v11 outputFileType] == 1953064550))
    {
      double v70 = 160.0;
      double v71 = 160.0;
    }
    if (v31)
    {
      double v67 = (double)v33;
      double v72 = (double)v32;
    }
    else
    {
      double v72 = v66;
    }
    if ([v11 outputFileType] == 1785096550
      || (int v73 = [v11 outputFileType], v74 = v72, v75 = v67, v73 == 1953064550))
    {
      double v74 = 160.0;
      double v75 = 160.0;
    }
    BOOL v76 = v70 > v74;
    if (v71 > v75) {
      BOOL v76 = 1;
    }
    if (v76) {
      double v77 = v74;
    }
    else {
      double v77 = v70;
    }
    if (v76) {
      double v78 = v75;
    }
    else {
      double v78 = v71;
    }
    int v79 = [v147 isSquareCropEnabled];
    if (v72 >= v67) {
      double v80 = v67;
    }
    else {
      double v80 = v72;
    }
    if (v79) {
      double v81 = v80;
    }
    else {
      double v81 = v67;
    }
    if (!v79) {
      double v80 = v72;
    }
    float v82 = v80 / v81;
    float v83 = v77 / v78;
    if (vabds_f32(v82, v83) >= 0.01)
    {
      v178.origin.x = 0.0;
      v178.origin.y = 0.0;
      v178.size.double width = v77;
      v178.size.double height = v78;
      CGRect v176 = AVMakeRectWithAspectRatioInsideRect(*(CGSize *)&v80, v178);
      double v77 = v176.size.width;
      double v78 = v176.size.height;
    }
    float v84 = v77 * 0.5;
    [v11 setThumbnailWidth:2 * llroundf(v84)];
    float v85 = v78 * 0.5;
    [v11 setThumbnailHeight:2 * llroundf(v85)];
    objc_msgSend(v11, "setThumbnailFormat:", objc_msgSend(v147, "embeddedThumbnailFormatFourCC"));
  }
  uint64_t v86 = [v147 rawFileFormat];
  v87 = (void *)MEMORY[0x1E4F47D00];
  if (v86)
  {
    v88 = (void *)[v147 rawFileFormat];
    v89 = (void *)[v88 objectForKeyedSubscript:*MEMORY[0x1E4F47CE8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v11, "setRawOutputFileBitDepth:", objc_msgSend(v89, "unsignedIntValue"));
    }
    if (objc_msgSend((id)objc_msgSend(v147, "rawFileFormat"), "objectForKeyedSubscript:", *v87)) {
      [v11 setRawOutputFileCodec:AVOSTypeForString()];
    }
    v90 = (void *)[v147 rawFileFormat];
    v91 = (void *)[v90 objectForKeyedSubscript:*MEMORY[0x1E4F47D88]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v91 floatValue];
      objc_msgSend(v11, "setRawOutputFileCodecQuality:");
    }
  }
  objc_msgSend(v11, "setRawThumbnailEnabled:", objc_msgSend(v147, "rawEmbeddedThumbnailFormatFourCC") != 0);
  if ([v11 rawThumbnailEnabled])
  {
    double v92 = (double)[v11 outputWidth];
    double v93 = (double)[v11 outputHeight];
    [v147 rawEmbeddedThumbnailCGSize];
    double v96 = v95;
    double v97 = v94;
    if (v95 == *v41 && v94 == v41[1] && [v11 rawOutputFileType] == 1684956519)
    {
      double v96 = 320.0;
      double v97 = 320.0;
    }
    if (v31)
    {
      double v92 = v38;
      double v98 = v39;
    }
    else
    {
      double v98 = v93;
    }
    int v99 = [v147 isSquareCropEnabled];
    if (v92 >= v98) {
      double v100 = v98;
    }
    else {
      double v100 = v92;
    }
    if (v99) {
      double v101 = v100;
    }
    else {
      double v101 = v92;
    }
    if (!v99) {
      double v100 = v98;
    }
    BOOL v102 = v96 > v101;
    if (v97 > v100) {
      BOOL v102 = 1;
    }
    if (v102) {
      double v103 = v101;
    }
    else {
      double v103 = v96;
    }
    if (v102) {
      double v104 = v100;
    }
    else {
      double v104 = v97;
    }
    float v105 = v101 / v100;
    float v106 = v103 / v104;
    if (vabds_f32(v105, v106) >= 0.01)
    {
      uint64_t v107 = 0;
      uint64_t v108 = 0;
      double v109 = v104;
      CGRect v177 = AVMakeRectWithAspectRatioInsideRect(*(CGSize *)(&v100 - 1), *(CGRect *)(&v103 - 2));
      double v103 = v177.size.width;
      double v104 = v177.size.height;
    }
    float v110 = v103 * 0.5;
    [v11 setRawThumbnailWidth:2 * llroundf(v110)];
    float v111 = v104 * 0.5;
    [v11 setRawThumbnailHeight:2 * llroundf(v111)];
    objc_msgSend(v11, "setRawThumbnailFormat:", objc_msgSend(v147, "rawEmbeddedThumbnailFormatFourCC"));
  }
  objc_msgSend(v11, "setNoiseReductionEnabled:", objc_msgSend(v147, "isTurboModeEnabled") ^ 1);
  objc_msgSend(v11, "setBurstQualityCaptureEnabled:", objc_msgSend(v147, "isBurstQualityCaptureEnabled"));
  [v23 videoScaleAndCropFactor];
  *(float *)&double v112 = v112;
  [v11 setScaleFactor:v112];
  objc_msgSend(v11, "setShutterSound:", objc_msgSend(v147, "shutterSound"));
  objc_msgSend(v11, "setFlashMode:", objc_msgSend(v147, "flashMode"));
  objc_msgSend(v11, "setAutoRedEyeReductionEnabled:", objc_msgSend(v147, "isAutoRedEyeReductionEnabled"));
  objc_msgSend(v11, "setDigitalFlashMode:", objc_msgSend(v147, "digitalFlashMode"));
  objc_msgSend(v11, "setConstantColorEnabled:", objc_msgSend(v147, "isConstantColorEnabled"));
  objc_msgSend(v11, "setConstantColorFallbackPhotoDeliveryEnabled:", objc_msgSend(v147, "isConstantColorFallbackPhotoDeliveryEnabled"));
  objc_msgSend(v11, "setAutoStereoPhotoCaptureEnabled:", objc_msgSend(v147, "isAutoSpatialPhotoCaptureEnabled"));
  [v11 setWideColorMode:2];
  objc_msgSend(v11, "setProvidesOriginalImage:", objc_msgSend(v147, "isEV0PhotoDeliveryEnabled"));
  objc_msgSend(v11, "setHDRMode:", objc_msgSend(v147, "HDRMode"));
  if ([v30 videoHDRFlavor] == 2
    && ([v147 photoQualityPrioritization] > 1 || objc_msgSend(v147, "HDRMode")))
  {
    if ([v152 isVideoHDREnabled])
    {
      if ([v152 isVideoHDRSuspended]) {
        uint64_t v113 = 0;
      }
      else {
        uint64_t v113 = 2;
      }
    }
    else
    {
      uint64_t v113 = 0;
    }
    [v11 setHDRMode:v113];
  }
  objc_msgSend(v11, "setDepthDataDeliveryEnabled:", objc_msgSend(v147, "isDepthDataDeliveryEnabled"));
  objc_msgSend(v11, "setEmbedsDepthDataInImage:", objc_msgSend(v147, "embedsDepthDataInPhoto"));
  objc_msgSend(v11, "setDepthDataFiltered:", objc_msgSend(v147, "isDepthDataFiltered"));
  objc_msgSend(v11, "setCameraCalibrationDataDeliveryEnabled:", objc_msgSend(v147, "isCameraCalibrationDataDeliveryEnabled"));
  objc_msgSend(v11, "setPortraitEffectsMatteDeliveryEnabled:", objc_msgSend(v147, "isPortraitEffectsMatteDeliveryEnabled"));
  objc_msgSend(v11, "setEmbedsPortraitEffectsMatteInImage:", objc_msgSend(v147, "embedsPortraitEffectsMatteInPhoto"));
  if (objc_msgSend((id)objc_msgSend(v147, "enabledSemanticSegmentationMatteTypes"), "count"))
  {
    objc_msgSend(v11, "setEnabledSemanticSegmentationMatteURNs:", AVSemanticSegmentationCMPhotoURNsForMatteTypes(objc_msgSend(v147, "enabledSemanticSegmentationMatteTypes")));
    objc_msgSend(v11, "setEmbedsSemanticSegmentationMattesInImage:", objc_msgSend(v147, "embedsSemanticSegmentationMattesInPhoto"));
  }
  if ([v147 isDepthDataDeliveryEnabled]
    && AVCIFilterArrayContainsPortraitFilters((void *)[v147 adjustedPhotoFilters]))
  {
    v114 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "inputPorts"), "firstObject"), "input");
    [v114 simulatedAperture];
    objc_msgSend(v11, "setSimulatedAperture:");
    [v114 portraitLightingEffectStrength];
    objc_msgSend(v11, "setPortraitLightingEffectStrength:");
  }
  objc_msgSend(v11, "setMetadata:", objc_msgSend(v147, "metadata"));
  objc_msgSend(v11, "setMetadataForOriginalImage:", objc_msgSend(v147, "metadataForOriginalPhoto"));
  objc_msgSend(v11, "setOriginalImageFilters:", objc_msgSend(v147, "photoFilters"));
  objc_msgSend(v11, "setProcessedImageFilters:", objc_msgSend(v147, "adjustedPhotoFilters"));
  if ([v147 isAutoSpatialOverCaptureEnabled])
  {
    objc_msgSend(v11, "setSpatialOverCaptureMetadata:", objc_msgSend(v147, "spatialOverCaptureMetadata"));
    if ([v11 providesOriginalImage]) {
      objc_msgSend(v11, "setSpatialOverCaptureMetadataForOriginalImage:", objc_msgSend(v147, "spatialOverCaptureMetadataForOriginalPhoto"));
    }
  }
  if ([v11 providesOriginalImage])
  {
    if ([v147 livePhotoMovieFileURL])
    {
      objc_msgSend(v11, "setMovieURLForOriginalImage:", objc_msgSend(v147, "livePhotoMovieFileURLForOriginalPhoto"));
      objc_msgSend(v11, "setMovieLevelMetadataForOriginalImage:", objc_msgSend(MEMORY[0x1E4F47DC8], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(v147, "livePhotoMovieMetadataForOriginalPhoto")));
      if ([v147 isAutoSpatialOverCaptureEnabled])
      {
        objc_msgSend(v11, "setSpatialOverCaptureMovieURLForOriginalImage:", objc_msgSend(v147, "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"));
        objc_msgSend(v11, "setSpatialOverCaptureMovieLevelMetadataForOriginalImage:", objc_msgSend(MEMORY[0x1E4F47DC8], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(v147, "spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto")));
      }
    }
  }
  objc_msgSend(v11, "setAutoDeferredProcessingEnabled:", -[AVCapturePhotoOutput isAutoDeferredPhotoDeliveryEnabled](v148, "isAutoDeferredPhotoDeliveryEnabled"));
  objc_msgSend(v11, "setQualityPrioritization:", objc_msgSend(v147, "photoQualityPrioritization"));
  if ([v147 isAutoVirtualDeviceFusionEnabled]) {
    [v11 setBravoImageFusionMode:2];
  }
  objc_msgSend(v11, "setBravoConstituentImageDeliveryDeviceTypes:", po_deviceArrayToFigCaptureSourceDeviceTypesArray(objc_msgSend(v147, "virtualDeviceConstituentPhotoDeliveryEnabledDevices")));
  objc_msgSend(v11, "setZoomWithoutUpscalingEnabled:", objc_msgSend(v147, "isProcessedPhotoZoomWithoutUpscalingEnabled"));
  objc_msgSend(v11, "setAutoIntelligentDistortionCorrectionEnabled:", objc_msgSend(v147, "isAutoContentAwareDistortionCorrectionEnabled"));
  char v115 = [v147 isConstantColorEnabled];
  id v116 = (id)[v147 semanticStyle];
  if ([(AVCapturePhotoOutput *)v148 isSemanticStyleRenderingEnabled] && !v116)
  {
    if ([v147 isBurstQualityCaptureEnabled]) {
      goto LABEL_167;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_167;
    }
    char v117 = [v147 photoQualityPrioritization] < 2 ? 1 : v115;
    if (v117) {
      goto LABEL_167;
    }
    id v116 = +[AVSemanticStyle identityStyle];
  }
  if (v116) {
    char v118 = v115;
  }
  else {
    char v118 = 1;
  }
  if ((v118 & 1) == 0)
  {
    v119 = (void *)MEMORY[0x1E4F50F60];
    [v116 toneBias];
    int v121 = v120;
    [v116 warmthBias];
    LODWORD(v123) = v122;
    LODWORD(v124) = v121;
    objc_msgSend(v11, "setSemanticStyle:", objc_msgSend(v119, "semanticStyleWithToneBias:warmthBias:", v124, v123));
  }
LABEL_167:
  uint64_t IntegerAnswer = AVGestaltGetIntegerAnswer(@"AVGQGYSWMQKMTMQOUYQ2AKUCKEN6AA");
  if (objc_msgSend((id)objc_msgSend(v11, "semanticStyle"), "isIdentity")
    && (unint64_t)(IntegerAnswer - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    [v11 setSemanticStyle:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v126 = (void *)[v147 bracketedSettings];
    objc_msgSend(v153, "setLensStabilizationDuringBracketEnabled:", objc_msgSend(v147, "isLensStabilizationEnabled"));
    [v126 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      char v128 = 0;
      uint64_t v129 = 1;
    }
    else
    {
      [v126 firstObject];
      objc_opt_class();
      char v128 = objc_opt_isKindOfClass();
      uint64_t v129 = (v128 & 1) != 0 ? 2 : 0;
    }
    objc_msgSend(v153, "setBracketType:imageCount:", v129, objc_msgSend(v126, "count"));
    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    uint64_t v130 = [v126 countByEnumeratingWithState:&v156 objects:v169 count:16];
    if (v130)
    {
      uint64_t v131 = v130;
      uint64_t v132 = 0;
      uint64_t v133 = *(void *)v157;
      do
      {
        uint64_t v134 = 0;
        uint64_t v135 = 24 * v132;
        do
        {
          if (*(void *)v157 != v133) {
            objc_enumerationMutation(v126);
          }
          v136 = *(void **)(*((void *)&v156 + 1) + 8 * v134);
          if (isKindOfClass)
          {
            uint64_t v137 = [v153 exposureDurations];
            if (v136)
            {
              [v136 exposureDuration];
            }
            else
            {
              long long v154 = 0uLL;
              uint64_t v155 = 0;
            }
            uint64_t v141 = v137 + v135;
            *(void *)(v141 + 16) = v155;
            *(_OWORD *)uint64_t v141 = v154;
            [v136 ISO];
            int v139 = v142;
            uint64_t v140 = [v153 ISOs];
          }
          else
          {
            if ((v128 & 1) == 0) {
              goto LABEL_189;
            }
            [*(id *)(*((void *)&v156 + 1) + 8 * v134) exposureTargetBias];
            int v139 = v138;
            uint64_t v140 = [v153 exposureTargetBiases];
          }
          *(_DWORD *)(v140 + 4 * v132) = v139;
LABEL_189:
          ++v132;
          ++v134;
          v135 += 24;
        }
        while (v131 != v134);
        uint64_t v131 = [v126 countByEnumeratingWithState:&v156 objects:v169 count:16];
      }
      while (v131);
    }
  }
  if (objc_msgSend((id)objc_msgSend(v152, "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeContinuityCamera"))
  {
    v143 = (void *)[v147 format];
    objc_msgSend(v153, "setCmioCompressedFormat:", objc_msgSend(v143, "objectForKeyedSubscript:", *MEMORY[0x1E4F47D00]));
    objc_msgSend(v153, "setCmioHighResolutionPhotoEnabled:", objc_msgSend(v147, "isHighResolutionPhotoEnabled"));
    objc_msgSend(v153, "setCmioMaxPhotoDimensionsWidth:", objc_msgSend(v147, "maxPhotoDimensions"));
    objc_msgSend(v153, "setCmioMaxPhotoDimensionsHeight:", (unint64_t)objc_msgSend(v147, "maxPhotoDimensions") >> 32);
  }
  objc_msgSend(v153, "setStillImageUserInitiatedRequestTime:", objc_msgSend(v147, "userInitiatedPhotoRequestTime"));
  objc_msgSend(v153, "setDeviceOrientationCorrectionEnabled:", objc_msgSend(v150, "isVideoDeviceOrientationCorrectionEnabled"));
  return v153;
}

- (void)_updateSupportedHDRModesForSourceDevice:(id)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "videoHDRFlavor");
  if (!objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isHDRSupported")
    || (uint64_t v6 = &unk_1EF4FAB78, [a3 isVideoHDREnabled]) && v5 != 2)
  {
    uint64_t v6 = &unk_1EF4FAB90;
  }
  if (([v6 isEqual:self->_internal->supportedHDRModes] & 1) == 0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"supportedHDRModes"];
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"HDRSupported"];
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__AVCapturePhotoOutput__updateSupportedHDRModesForSourceDevice___block_invoke;
    block[3] = &unk_1E5A72D70;
    block[4] = self;
    block[5] = v6;
    dispatch_sync(sceneDetectionObserversDispatchQueue, block);
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"HDRSupported"];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"supportedHDRModes"];
  }
  int v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "figCaptureSourceVideoFormat"), "isHDROriginalImageDeliverySupported");
  if (self->_internal->EV0PhotoDeliverySupported != v8)
  {
    char v9 = v8;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"EV0PhotoDeliverySupported"];
    BOOL v10 = self->_internal->sceneDetectionObserversDispatchQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__AVCapturePhotoOutput__updateSupportedHDRModesForSourceDevice___block_invoke_2;
    v11[3] = &unk_1E5A74028;
    v11[4] = self;
    char v12 = v9;
    dispatch_sync(v10, v11);
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"EV0PhotoDeliverySupported"];
  }
}

- (BOOL)isDepthDataDeliverySupported
{
  return self->_internal->depthDataDeliverySupported;
}

- (unsigned)_internalRawFormatFromRawFormat:(unsigned int)a3
{
  id v3 = -[NSDictionary objectForKeyedSubscript:](self->_internal->availableRawPhotoPixelFormatTypes, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:*(void *)&a3]);

  return [v3 intValue];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  if (([a3 isEqualToString:@"highResolutionCaptureEnabled"] & 1) != 0
    || ([a3 isEqualToString:@"maxPhotoDimensions"] & 1) != 0)
  {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVCapturePhotoOutput;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (BOOL)isSpatialPhotoCaptureSupported
{
  return self->_internal->spatialPhotoCaptureSupported;
}

- (BOOL)isSemanticStyleRenderingSupported
{
  return self->_internal->semanticStyleRenderingSupported;
}

- (BOOL)isPortraitEffectsMatteDeliverySupported
{
  return self->_internal->portraitEffectsMatteDeliverySupported;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  [(AVCapturePhotoOutput *)self _incrementObserverCountForKeyPath:a4];
  v11.receiver = self;
  v11.super_class = (Class)AVCapturePhotoOutput;
  [(AVCapturePhotoOutput *)&v11 addObserver:a3 forKeyPath:a4 options:a5 context:a6];
}

- (void)_incrementObserverCountForKeyPath:(id)a3
{
  char v5 = [a3 isEqualToString:@"isFlashScene"];
  char v6 = [a3 isEqualToString:@"isHDRScene"];
  char v7 = [a3 isEqualToString:@"isStillImageStabilizationScene"];
  char v8 = [a3 isEqualToString:@"digitalFlashStatus"];
  int v9 = [a3 isEqualToString:@"digitalFlashExposureTimes"];
  if ((v5 & 1) != 0 || (v6 & 1) != 0 || (v7 & 1) != 0 || (v8 & 1) != 0 || v9)
  {
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__AVCapturePhotoOutput__incrementObserverCountForKeyPath___block_invoke;
    v11[3] = &unk_1E5A79E38;
    char v12 = v5;
    v11[4] = self;
    char v13 = v6;
    char v14 = v7;
    char v15 = v8;
    char v16 = v9;
    dispatch_async(sceneDetectionObserversDispatchQueue, v11);
  }
}

- (void)setLivePhotoCaptureEnabled:(BOOL)livePhotoCaptureEnabled
{
  BOOL v3 = livePhotoCaptureEnabled;
  if (livePhotoCaptureEnabled
    && ![(AVCapturePhotoOutput *)self isLivePhotoCaptureSupported])
  {
    char v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->livePhotoCaptureEnabled != v3)
    {
      internal->livePhotoCaptureEnabled = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (void)setPreservesLivePhotoCaptureSuspendedOnSessionStop:(BOOL)preservesLivePhotoCaptureSuspendedOnSessionStop
{
  BOOL v3 = preservesLivePhotoCaptureSuspendedOnSessionStop;
  memset(&v7, 0, sizeof(v7));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v7, HostTimeClock);
  if (v3 && ![(AVCapturePhotoOutput *)self isLivePhotoCaptureSupported])
  {
    char v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6, v7.value, *(void *)&v7.timescale, v7.epoch);
  }
  else
  {
    self->_internal->preservesLivePhotoCaptureSuspendedOnSessionStop = v3;
    -[AVCapturePhotoOutput setFigCaptureSessionSectionProperty:withValue:](self, "setFigCaptureSessionSectionProperty:withValue:", *MEMORY[0x1E4F51648], [NSNumber numberWithBool:v3]);
  }
}

- (void)setFigCaptureSessionSectionProperty:(__CFString *)a3 withValue:(void *)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__AVCapturePhotoOutput_setFigCaptureSessionSectionProperty_withValue___block_invoke;
  v4[3] = &unk_1E5A79F78;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVCapturePhotoOutputDeviceVideoHDREnabledChangedContext == a6)
  {
    id v9 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68], a4, a5), "sourceDevice");
    [(AVCapturePhotoOutput *)self _updateSupportedHDRModesForSourceDevice:v9];
  }
  else if ((void *)AVCapturePhotoOutputSessionOutputsChangedContext == a6 {
         || AVCapturePhotoOutputSessionPresetChangedContext == (void)a6)
  }
  {
    id v8 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68], a4, a5), "sourceDevice");
    [(AVCapturePhotoOutput *)self _updateLivePhotoCaptureSupportedForSourceDevice:v8];
    [(AVCapturePhotoOutput *)self _updateLivePhotoMovieDimensionsForSourceDevice:v8];
    [(AVCapturePhotoOutput *)self _updateAvailableLivePhotoVideoCodecTypesForSourceDevice:v8];
    [(AVCapturePhotoOutput *)self _updateAvailableRawPhotoPixelFormatTypesForSourceDevice:v8];
    [(AVCapturePhotoOutput *)self _updateAvailableRawPhotoFileTypesForSourceDevice:v8];
  }
  else
  {
    if ((void *)AVCapturePhotoOutputSessionIsRunningChangedContext != a6)
    {
      if ((void *)AVCapturePhotoOutputDeviceFlashSceneDetectedForPhotoOutputChangedContext == a6)
      {
        int v15 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0], a4), "BOOLValue");
        uint64_t v16 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
        if (v15 == v16) {
          return;
        }
        uint64_t v17 = v16;
        uint64_t v54 = 0;
        int v55 = &v54;
        uint64_t v56 = 0x2020000000;
        internal = self->_internal;
        char v57 = 0;
        sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_1E5A74078;
        block[4] = self;
        block[5] = &v54;
        dispatch_sync(sceneDetectionObserversDispatchQueue, block);
        [(AVCapturePhotoOutput *)self _setIsFlashScene:v17 firingKVO:*((unsigned __int8 *)v55 + 24)];
      }
      else if ((void *)AVCapturePhotoOutputDeviceHDRSceneDetectedForPhotoOutputChangedContext == a6)
      {
        int v20 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0], a4), "BOOLValue");
        uint64_t v21 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
        if (v20 == v21) {
          return;
        }
        uint64_t v22 = v21;
        uint64_t v54 = 0;
        int v55 = &v54;
        uint64_t v56 = 0x2020000000;
        long long v23 = self->_internal;
        char v57 = 0;
        id v24 = v23->sceneDetectionObserversDispatchQueue;
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
        v52[3] = &unk_1E5A74078;
        v52[4] = self;
        v52[5] = &v54;
        dispatch_sync(v24, v52);
        [(AVCapturePhotoOutput *)self _setIsHDRScene:v22 firingKVO:*((unsigned __int8 *)v55 + 24)];
      }
      else if ((void *)AVCapturePhotoOutputDeviceStillImageStabilizationSceneChangedContext == a6)
      {
        int v25 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0], a4), "BOOLValue");
        uint64_t v26 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
        if (v25 == v26) {
          return;
        }
        uint64_t v27 = v26;
        uint64_t v54 = 0;
        int v55 = &v54;
        uint64_t v56 = 0x2020000000;
        int v28 = self->_internal;
        char v57 = 0;
        char v29 = v28->sceneDetectionObserversDispatchQueue;
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
        v51[3] = &unk_1E5A74078;
        v51[4] = self;
        v51[5] = &v54;
        dispatch_sync(v29, v51);
        [(AVCapturePhotoOutput *)self _setIsStillImageStabilizationScene:v27 firingKVO:*((unsigned __int8 *)v55 + 24)];
      }
      else
      {
        if ((void *)AVCapturePhotoOutputDeviceDigitalFlashSceneForPhotoOutputChangedContext != a6)
        {
          if ((void *)AVCapturePhotoOutputDeviceImageControlModeChangedContext == a6)
          {
            char v42 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284D8], a4), "BOOLValue");
            int v43 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "intValue");
            int v44 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "intValue");
            if (v43 == 5) {
              char v45 = v42;
            }
            else {
              char v45 = 0;
            }
            if ((v45 & 1) != 0 || v44 == 6)
            {
              [(AVCapturePhotoOutput *)self _updateTimeLapseCaptureRate];
            }
          }
          else if ((void *)AVCapturePhotoOutputDeviceSpatialOverCaptureEnabledChangedContext == a6)
          {
            [(AVCapturePhotoOutput *)self _updateLivePhotoMovieDimensionsForSourceDevice:a4];
          }
          else if ((void *)AVCapturePhotoOutputDeviceGDCEnabledChangedContext == a6)
          {
            int v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0], a4), "BOOLValue");
            if (v11 != objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue"))
            {
              id v12 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice];
              [(AVCapturePhotoOutput *)self _updateCameraCalibrationDataDeliverySupportedForSourceDevice:v12];
            }
          }
          return;
        }
        id v30 = objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0], a4);
        int v31 = (void *)[a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
        uint64_t v32 = *MEMORY[0x1E4F521E8];
        int v33 = objc_msgSend((id)objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E4F521E8]), "intValue");
        uint64_t v34 = *MEMORY[0x1E4F521E0];
        unint64_t v35 = (void *)[v30 objectForKeyedSubscript:*MEMORY[0x1E4F521E0]];
        int v36 = objc_msgSend((id)objc_msgSend(v31, "objectForKeyedSubscript:", v32), "intValue");
        unsigned int v37 = objc_msgSend(v35, "isEqualToDictionary:", objc_msgSend(v31, "objectForKeyedSubscript:", v34)) ^ 1;
        if (v33 == v36 && !v37) {
          return;
        }
        uint64_t v54 = 0;
        int v55 = &v54;
        uint64_t v56 = 0x2020000000;
        char v57 = 0;
        uint64_t v47 = 0;
        v48 = &v47;
        uint64_t v49 = 0x2020000000;
        char v50 = 0;
        double v38 = self->_internal->sceneDetectionObserversDispatchQueue;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_4;
        v46[3] = &unk_1E5A79E10;
        v46[4] = self;
        v46[5] = &v54;
        v46[6] = &v47;
        dispatch_sync(v38, v46);
        if (*((unsigned char *)v55 + 24)) {
          BOOL v39 = v33 == v36;
        }
        else {
          BOOL v39 = 1;
        }
        uint64_t v40 = !v39;
        if (*((unsigned char *)v48 + 24)) {
          uint64_t v41 = v37;
        }
        else {
          uint64_t v41 = 0;
        }
        [(AVCapturePhotoOutput *)self _setDigitalFlashScene:v31 fireStatusKVO:v40 fireExposureTimesKVO:v41];
        _Block_object_dispose(&v47, 8);
      }
      _Block_object_dispose(&v54, 8);
      return;
    }
    int v13 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8], a4), "BOOLValue");
    MEMORY[0x1A6234330](self->_internal->requestsLock);
    char v14 = self->_internal;
    if (v14->readinessState.sessionIsRunning == v13)
    {
      JUMPOUT(0x1A6234340);
    }
    v14->readinessState.sessionIsRunning = v13;
    MEMORY[0x1A6234340](self->_internal->requestsLock);
    [(AVCapturePhotoOutput *)self _updateCaptureReadiness];
  }
}

- (void)_updateLivePhotoCaptureSupportedForSourceDevice:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isIrisSupported"))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    char v5 = objc_msgSend(-[AVCaptureOutput session](self, "session"), "outputs");
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v23;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v10 = 1;
            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    char v10 = 0;
LABEL_12:
    if (objc_msgSend((id)objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"), "isEqual:", @"AVCaptureSessionPresetInputPriority"))
    {
      if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isPhotoFormat"))
      {
        long long v20 = 0u;
        long long v21 = 0u;
        long long v19 = 0u;
        int v11 = objc_msgSend(-[AVCaptureOutput session](self, "session", 0, 0), "outputs");
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
LABEL_16:
          uint64_t v15 = 0;
          while (1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_23;
            }
            if (v13 == ++v15)
            {
              uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v13) {
                goto LABEL_16;
              }
              break;
            }
          }
        }
      }
    }
    if (v10)
    {
LABEL_23:
      int v16 = 0;
      goto LABEL_25;
    }
  }
  int v16 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isIrisSupported");
LABEL_25:
  if (self->_internal->livePhotoCaptureSupported != v16)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"livePhotoCaptureSupported"];
    self->_internal->livePhotoCaptureSupported = v16;
    self->_internal->videoCaptureSupported = v16;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"livePhotoCaptureSupported"];
    internal = self->_internal;
    if ((v16 & 1) == 0)
    {
      if (internal->livePhotoCaptureEnabled)
      {
        [(AVCapturePhotoOutput *)self willChangeValueForKey:@"livePhotoCaptureEnabled"];
        self->_internal->livePhotoCaptureEnabled = v16;
        [(AVCapturePhotoOutput *)self didChangeValueForKey:@"livePhotoCaptureEnabled"];
        internal = self->_internal;
      }
      if (internal->preservesLivePhotoCaptureSuspendedOnSessionStop)
      {
        [(AVCapturePhotoOutput *)self willChangeValueForKey:@"preservesLivePhotoCaptureSuspendedOnSessionStop"];
        self->_internal->preservesLivePhotoCaptureSuspendedOnSessionStop = v16;
        [(AVCapturePhotoOutput *)self didChangeValueForKey:@"preservesLivePhotoCaptureSuspendedOnSessionStop"];
        internal = self->_internal;
      }
    }
    if (internal->livePhotoAutoTrimmingEnabled != v16)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"livePhotoAutoTrimmingEnabled"];
      self->_internal->livePhotoAutoTrimmingEnabled = v16;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"livePhotoAutoTrimmingEnabled"];
    }
  }
}

- (void)_updateAvailableRawPhotoPixelFormatTypesForSourceDevice:(id)a3
{
  char v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "supportedRawPixelFormat");
  if (objc_msgSend((id)objc_msgSend(-[AVCaptureOutput session](self, "session"), "sessionPreset"), "isEqualToString:", @"AVCaptureSessionPresetPhoto"))BOOL v7 = v6 == 0; {
  else
  }
    BOOL v7 = 1;
  if (!v7)
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInt:v6];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6));
  }
  if ([(AVCapturePhotoOutput *)self isAppleProRAWEnabled]
    && objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDemosaicedRawSupported"))
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "internalDemosaicedRawPixelFormat");
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "supportedDemosaicedRawPixelFormat");
    uint64_t v11 = [NSNumber numberWithUnsignedInt:v9];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10));
  }
  if (([v5 isEqual:self->_internal->availableRawPhotoPixelFormatTypes] & 1) == 0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"availableRawPhotoPixelFormatTypes"];

    self->_internal->availableRawPhotoPixelFormatTypes = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v5];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"availableRawPhotoPixelFormatTypes"];
  }
}

- (void)_updateAvailableLivePhotoVideoCodecTypesForSourceDevice:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  char v5 = (void *)[a3 activeFormat];
  if ([(AVCapturePhotoOutput *)self isLivePhotoCaptureSupported]
    && [v5 isPhotoFormat])
  {
    uint64_t v6 = objc_opt_class();
    internal = self->_internal;
    uint64_t v8 = *MEMORY[0x1E4F47C08];
    uint64_t v9 = *MEMORY[0x1E4F47D30];
    v11[0] = *MEMORY[0x1E4F47D28];
    v11[1] = v9;
    uint64_t v10 = objc_msgSend(v6, "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", a3, 0, *(void *)&internal->livePhotoMovieDimensions, v8, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 2));
  }
  else
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1C978] array];
  }
  if (([v10 isEqual:self->_internal->availableLivePhotoVideoCodecTypes] & 1) == 0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"availableLivePhotoVideoCodecTypes"];

    self->_internal->availableLivePhotoVideoCodecTypes = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v10];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"availableLivePhotoVideoCodecTypes"];
  }
}

- (void)_updateLivePhotoMovieDimensionsForSourceDevice:(id)a3
{
  int v4 = (void *)[a3 activeFormat];
  if ([(AVCapturePhotoOutput *)self isLivePhotoCaptureSupported]
    && [v4 isPhotoFormat])
  {
    unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v4 formatDescription]);
    int32_t v6 = Dimensions;
    unint64_t v7 = HIDWORD(Dimensions);
    uint64_t v8 = [(id)objc_opt_class() maxLivePhotoMovieDimensions];
    BOOL v10 = v6 < (int)v8 || (int)v7 < SHIDWORD(v8);
    if (v10) {
      int v11 = v6;
    }
    else {
      int v11 = v8;
    }
    if (!v10) {
      LODWORD(v7) = HIDWORD(v8);
    }
  }
  else
  {
    int v11 = 0;
    LODWORD(v7) = 0;
  }
  internal = self->_internal;
  if (internal->livePhotoMovieDimensions.width != v11 || internal->livePhotoMovieDimensions.height != v7)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"livePhotoMovieDimensions"];
    uint64_t v13 = self->_internal;
    v13->livePhotoMovieDimensions.double width = v11;
    v13->livePhotoMovieDimensions.double height = v7;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"livePhotoMovieDimensions"];
  }
}

- (BOOL)isLivePhotoCaptureSupported
{
  return self->_internal->livePhotoCaptureSupported;
}

+ (unint64_t)maxLivePhotoDataSize
{
  uint64_t v2 = [(id)objc_opt_class() maxLivePhotoMovieDimensions];
  return (unint64_t)((double)(int)v2 * 4.1 * (double)SHIDWORD(v2) * 0.125 * 3.4) + 8233312;
}

+ ($2825F4736939C4A6D3AD43837233062D)maxLivePhotoMovieDimensions
{
  if ((int)FigCapturePlatformIdentifier() > 5
    || [&unk_1EF4FAB48 containsObject:FigCaptureGetModelSpecificName()])
  {
    return ($2825F4736939C4A6D3AD43837233062D)0x5A000000780;
  }
  else
  {
    return ($2825F4736939C4A6D3AD43837233062D)0x438000005A0;
  }
}

- (void)_updateCaptureReadiness
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2);
  internal = self->_internal;
  *(void *)&v29[13] = internal->readinessState.inflightUniqueIDWaitingForProcessing;
  long long v4 = *(_OWORD *)((char *)&internal->readinessState.inflightNonOverlappingCaptureUniqueID + 3);
  long long v28 = *(_OWORD *)(&internal->readinessState.responsiveCaptureEnabled + 1);
  *(_OWORD *)char v29 = v4;
  BOOL sessionIsRunning = internal->readinessState.sessionIsRunning;
  BOOL autoDeferredPhotoDeliveryEnabled = internal->autoDeferredPhotoDeliveryEnabled;
  BOOL responsiveCaptureEnabled = internal->responsiveCaptureEnabled;
  BOOL v22 = sessionIsRunning;
  BOOL v23 = autoDeferredPhotoDeliveryEnabled;
  BOOL v24 = responsiveCaptureEnabled;
  long long v25 = v28;
  *(_OWORD *)uint64_t v26 = *(_OWORD *)((char *)&internal->readinessState.inflightNonOverlappingCaptureUniqueID + 3);
  *(void *)&v26[13] = internal->readinessState.inflightUniqueIDWaitingForProcessing;
  int64_t v8 = +[AVCapturePhotoOutputReadinessCoordinator _captureReadinessFromReadinessState:&v22];
  uint64_t v9 = self->_internal;
  int64_t captureReadiness = v9->captureReadiness;
  int64_t v17 = v8;
  id v10 = (id)[(NSMutableArray *)v9->readinessCoordinators copy];
  MEMORY[0x1A6234340](self->_internal->requestsLock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        BOOL v22 = sessionIsRunning;
        BOOL v23 = autoDeferredPhotoDeliveryEnabled;
        BOOL v24 = responsiveCaptureEnabled;
        long long v25 = v28;
        *(_OWORD *)uint64_t v26 = *(_OWORD *)v29;
        *(void *)&v26[13] = *(void *)&v29[13];
        [v15 _photoOutputDidUpdateCaptureReadinessState:&v22];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v12);
  }
  if (v17 != captureReadiness)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"captureReadiness"];
    MEMORY[0x1A6234330](self->_internal->requestsLock);
    self->_internal->int64_t captureReadiness = v17;
    MEMORY[0x1A6234340](self->_internal->requestsLock);
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"captureReadiness"];
  }
}

- (void)setLivePhotoCaptureSuspended:(BOOL)livePhotoCaptureSuspended
{
  BOOL v3 = livePhotoCaptureSuspended;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(&v18, 0, sizeof(v18));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v18, HostTimeClock);
  if (dword_1EB4C9220)
  {
    int v17 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v3)
  {
    unint64_t v7 = (uint64_t *)MEMORY[0x1E4F51630];
LABEL_7:
    self->_internal->livePhotoCaptureSuspended = v3;
    uint64_t v8 = *v7;
    if (*v7)
    {
      if (sIsForcedShutterSoundRegion)
      {
        internal = self->_internal;
        beginEndIrisMovieCaptureHostTimeQueue = internal->beginEndIrisMovieCaptureHostTimeQueue;
        beginEndIrisMovieCaptureHostTimeDispatchGroup = internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__AVCapturePhotoOutput_setLivePhotoCaptureSuspended___block_invoke;
        block[3] = &unk_1E5A72F98;
        block[4] = self;
        block[5] = v8;
        dispatch_group_async(beginEndIrisMovieCaptureHostTimeDispatchGroup, beginEndIrisMovieCaptureHostTimeQueue, block);
      }
      else
      {
        uint64_t v13 = CMClockGetHostTimeClock();
        CMClockGetTime(&v14, v13);
        [(AVCapturePhotoOutput *)self setFigCaptureSessionSectionProperty:v8 withHostTime:&v14];
      }
    }
    return;
  }
  if ([(AVCapturePhotoOutput *)self isLivePhotoCaptureEnabled])
  {
    unint64_t v7 = (uint64_t *)MEMORY[0x1E4F51638];
    goto LABEL_7;
  }
  uint64_t v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v12);
  }
  NSLog(&cfstr_SuppressingExc.isa, v12);
}

- (void)setFigCaptureSessionSectionProperty:(__CFString *)a3 withHostTime:(id *)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__AVCapturePhotoOutput_setFigCaptureSessionSectionProperty_withHostTime___block_invoke;
  v4[3] = &unk_1E5A79F50;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  v4[4] = self;
  v4[5] = a3;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v4];
}

uint64_t __58__AVCapturePhotoOutput__incrementObserverCountForKeyPath___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = 272;
  }
  else if (*(unsigned char *)(result + 41))
  {
    uint64_t v1 = 276;
  }
  else if (*(unsigned char *)(result + 42))
  {
    uint64_t v1 = 280;
  }
  else if (*(unsigned char *)(result + 43))
  {
    uint64_t v1 = 288;
  }
  else
  {
    if (!*(unsigned char *)(result + 44)) {
      return result;
    }
    uint64_t v1 = 304;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 16) + v1);
  return result;
}

uint64_t __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePreparationCompleteNotificationWithPayload:0 settingsID:*(void *)(a1 + 40)];
}

- (void)setPrivatePhotoDimensionsEnabled:(BOOL)a3
{
  self->_internal->privatePhotoDimensionsEnabled = a3;
}

- (BOOL)isUltraHighResolutionZeroShutterLagSupported
{
  return self->_internal->ultraHighResolutionZeroShutterLagSupported;
}

- (BOOL)isPreviewQualityAdjustedPhotoFilterRenderingSupported
{
  return self->_internal->previewQualityAdjustedPhotoFilterRenderingSupported;
}

- (BOOL)isMovieRecordingSupported
{
  return self->_internal->movieRecordingSupported;
}

- (BOOL)isImageOptimizationForOfflineVideoStabilizationSupported
{
  return self->_internal->imageOptimizationForOfflineVideoStabilizationSupported;
}

- (BOOL)isFastCapturePrioritizationSupported
{
  return self->_internal->fastCapturePrioritizationSupported;
}

- (BOOL)isAppleProRAWSupported
{
  return self->_internal->appleProRAWSupported;
}

id __81__AVCapturePhotoOutput__setDigitalFlashScene_fireStatusKVO_fireExposureTimesKVO___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 296) = (int)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E4F521E8]), "intValue");

  id result = (id)[*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F521E0]];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 312) = result;
  return result;
}

- (AVCapturePhotoOutput)init
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)AVCapturePhotoOutput;
  uint64_t v2 = [(AVCaptureOutput *)&v11 initSubclass];
  if (v2)
  {
    BOOL v3 = objc_alloc_init(AVCapturePhotoOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
      v2->_internal->sceneDetectionObserversDispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.photooutput.observed_scene_detection_queue", 0);
      v2->_internal->requestsLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
      v2->_internal->photoRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v2->_internal->movieRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v2->_internal->readinessCoordinators = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      internal = v2->_internal;
      CMTimeMakeWithSeconds(&v10, 3.0, 1000);
      internal->livePhotoMovieDuration = ($95D729B680665BEAEFA1D6FCA8238556)v10;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v2->_internal;
      CMTimeMake(&v10, 1, 30);
      v5->livePhotoMovieVideoFrameDuration = ($95D729B680665BEAEFA1D6FCA8238556)v10;
      v2->_internal->availablePhotoPixelFormatTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v2->_internal->availablePhotoCodecTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v2->_internal->availableRawPhotoPixelFormatTypes = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      v2->_internal->availablePhotoFileTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v2->_internal->availableRawPhotoCodecTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v2->_internal->availableRawPhotoFileTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v2->_internal->availableLivePhotoVideoCodecTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v2->_internal->supportedHDRModes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", &unk_1EF4FA778, 0);
      v2->_internal->supportedFlashModes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", &unk_1EF4FA778, 0);
      v2->_internal->availableSemanticSegmentationTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v2->_internal->enabledSemanticSegmentationTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      v2->_internal->int64_t maxPhotoQualityPrioritization = 2;
      v2->_internal->timeLapseCaptureRate = 2.0;
      v2->_internal->timeLapseCaptureRateNeedsUpdate = 1;
      v2->_internal->supportedDigitalFlashModes = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", &unk_1EF4FA778, 0);
      v2->_internal->digitalFlashStatus = -1;
      v2->_internal->digitalFlashExposureTimes = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      int32_t v6 = +[AVCapturePhotoSettings photoSettings];
      unint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
      if (([v7 isEqualToString:0x1EF4D53D0] & 1) != 0
        || ([v7 isEqualToString:0x1EF4D6410] & 1) != 0
        || [v7 isEqualToString:0x1EF4D6430])
      {
        [(AVCapturePhotoSettings *)v6 setHDRMode:2];
      }
      v12[0] = v6;
      uint64_t v8 = +[AVCapturePreparedPhotoSettingsArrayRequest preparedPhotoSettingsArrayRequestWithArray:completionHandler:](AVCapturePreparedPhotoSettingsArrayRequest, "preparedPhotoSettingsArrayRequestWithArray:completionHandler:", [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1], 0);
      v2->_internal->prepareRequests = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v8, 0);
      if (sIsForcedShutterSoundRegion)
      {
        v2->_internal->beginEndIrisMovieCaptureHostTimeQueue = (OS_dispatch_queue *)dispatch_queue_create("avcapturephotooutput-begin-end-iris-movie-capture-host-time-queue", 0);
        v2->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup = (OS_dispatch_group *)dispatch_group_create();
      }
      v2->_internal->greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
      v2->_internal->zeroShutterLagAutomaticallyEnabled = AVGestaltGetBoolAnswer(@"AVGQCaptureZeroShutterLagAutomaticallyEnabled");
      v2->_internal->int64_t captureReadiness = 1;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)setPreparedPhotoSettingsArray:(NSArray *)preparedPhotoSettingsArray completionHandler:(void *)completionHandler
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (preparedPhotoSettingsArray)
  {
    long long v25 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = [(NSArray *)preparedPhotoSettingsArray countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(preparedPhotoSettingsArray);
          }
          if (!po_photoSettingsAreValid(*(void **)(*((void *)&v21 + 1) + 8 * v10), 0, 0, 0, &v25))
          {
            int v16 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v17 = *MEMORY[0x1E4F1C3C8];
            goto LABEL_19;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)preparedPhotoSettingsArray countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    objc_super v11 = +[AVCapturePreparedPhotoSettingsArrayRequest preparedPhotoSettingsArrayRequestWithArray:preparedPhotoSettingsArray completionHandler:completionHandler];
    int v12 = objc_msgSend(-[AVCaptureOutput session](self, "session"), "isBeingConfigured");
    if (!completionHandler)
    {
      if (v12)
      {
        id v13 = [(AVCapturePhotoOutput *)self figCaptureIrisPreparedSettings];
        id v14 = [(AVCapturePhotoOutput *)self _figCaptureIrisPreparedSettingsForRequest:v11];
        objc_msgSend(v14, "setSettingsID:", objc_msgSend(v13, "settingsID"));
        if ([v14 isEqual:v13]) {
          -[AVCapturePreparedPhotoSettingsArrayRequest _setRequestID:](v11, "_setRequestID:", [v13 settingsID]);
        }
      }
    }
    MEMORY[0x1A6234330](self->_internal->requestsLock);
    uint64_t v15 = objc_msgSend((id)-[NSMutableArray lastObject](self->_internal->prepareRequests, "lastObject"), "requestID");
    [(NSMutableArray *)self->_internal->prepareRequests addObject:v11];
    MEMORY[0x1A6234340](self->_internal->requestsLock);
    if (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isBeingConfigured"))
    {
      if (v15 >= 1)
      {
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke;
        v20[3] = &unk_1E5A72F98;
        v20[4] = self;
        v20[5] = v15;
        [(AVCaptureOutput *)self performBlockOnSessionNotifyingThread:v20];
      }
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke_2;
      void v19[3] = &unk_1E5A79D98;
      v19[4] = self;
      v19[5] = v11;
      v19[6] = v15;
      [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v19];
    }
  }
  else
  {
    int v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
LABEL_19:
    CMTime v18 = (void *)[v16 exceptionWithName:v17 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v18);
    }
    NSLog(&cfstr_SuppressingExc.isa, v18);
  }
}

- (void)setHighResolutionCaptureEnabled:(BOOL)highResolutionCaptureEnabled
{
  if (self->_internal->highResolutionCaptureEnabled != highResolutionCaptureEnabled)
  {
    BOOL v3 = highResolutionCaptureEnabled;
    char v6 = 0;
    -[AVCapturePhotoOutput _setHighResolutionCaptureEnabled:bumpChangeSeedOut:](self, "_setHighResolutionCaptureEnabled:bumpChangeSeedOut:");
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "activeFormat");
    if (v5) {
      -[AVCapturePhotoOutput _setMaxPhotoDimensions:bumpChangeSeedOut:](self, "_setMaxPhotoDimensions:bumpChangeSeedOut:", [v5 defaultPhotoDimensionsWithHighResolutionCaptureEnabled:v3], &v6);
    }
    if (v6) {
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (void)setDepthDataDeliveryEnabled:(BOOL)depthDataDeliveryEnabled
{
  internal = self->_internal;
  if (depthDataDeliveryEnabled && !internal->depthDataDeliverySupported)
  {
    char v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else if (internal->depthDataDeliveryEnabled != depthDataDeliveryEnabled)
  {
    internal->depthDataDeliveryEnabled = depthDataDeliveryEnabled;
    id v5 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice];
    [(AVCapturePhotoOutput *)self _updateContentAwareDistortionCorrectionSupportedForDevice:v5];
    [(AVCapturePhotoOutput *)self _updateAppleProRAWSupportedForDevice:v5];
    [(AVCapturePhotoOutput *)self _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:v5];
    [(AVCapturePhotoOutput *)self _updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:v5];
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)_updateSupportedPropertiesForSourceDevice:(id)a3
{
  id v5 = (NSString *)(id)[a3 deviceType];
  internal = self->_internal;
  sourceDeviceType = internal->sourceDeviceType;
  internal->sourceDeviceType = v5;

  [(AVCapturePhotoOutput *)self _updateAvailablePhotoPixelFormatTypesForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateAvailablePhotoCodecTypesForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateAvailableRawPhotoPixelFormatTypesForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateAvailablePhotoFileTypesForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateAvailableRawPhotoFileTypesForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateAutoRedReductionSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateStillImageStabilizationSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateVirtualDeviceFusionSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateSupportedHDRModesForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateSupportedFlashModesForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateSupportedDigitalFlashModesForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateMaxBracketedCapturePhotoCountForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateLensStabilizationDuringBracketedCaptureSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateLivePhotoCaptureSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateLivePhotoMovieDimensionsForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateAvailableLivePhotoVideoCodecTypesForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateOfflineVISSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateSceneMonitoringForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateDepthDataDeliverySupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateConstantColorSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateMovieRecordingSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateSpatialOverCaptureSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateDeferredProcessingSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateProcessedPhotoZoomWithoutUpscalingSupportedForSourceDevice:a3];
  [(AVCapturePhotoOutput *)self _updateFocusPixelBlurScoreSupportedForDevice:a3];
  [(AVCapturePhotoOutput *)self _updatePreviewQualityAdjustedPhotoFilterRenderingSupportedForDevice:a3];
  [(AVCapturePhotoOutput *)self _updateContentAwareDistortionCorrectionSupportedForDevice:a3];
  [(AVCapturePhotoOutput *)self _updateAppleProRAWSupportedForDevice:a3];
  [(AVCapturePhotoOutput *)self _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:a3];
  [(AVCapturePhotoOutput *)self _updateHighPhotoQualitySupportedForDevice:a3];
  [(AVCapturePhotoOutput *)self _updateSemanticStyleRenderingSupportedForDevice:a3];
  [(AVCapturePhotoOutput *)self _updateMaxPhotoDimensionsForDevice:a3];

  [(AVCapturePhotoOutput *)self _updateSpatialPhotoCaptureSupportedForDevice:a3];
}

- (void)_updateAvailableRawPhotoFileTypesForSourceDevice:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(NSDictionary *)self->_internal->availableRawPhotoPixelFormatTypes count])
  {
    v5[0] = *MEMORY[0x1E4F47BE0];
    long long v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    long long v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (([v4 isEqual:self->_internal->availableRawPhotoFileTypes] & 1) == 0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"availableRawPhotoFileTypes"];

    self->_internal->availableRawPhotoFileTypes = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"availableRawPhotoFileTypes"];
  }
}

- (void)_updateContentAwareDistortionCorrectionSupportedForDevice:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isContentAwareDistortionCorrectionSupported"))
  {
    if (self->_internal->depthDataDeliveryEnabled) {
      int v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDCProcessingWithDepthSupported");
    }
    else {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
  }
  if (self->_internal->contentAwareDistortionCorrectionSupported != v5)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"contentAwareDistortionCorrectionSupported"];
    self->_internal->contentAwareDistortionCorrectionSupported = v5;
    internal = self->_internal;
    if (!internal->contentAwareDistortionCorrectionSupported && internal->contentAwareDistortionCorrectionEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"contentAwareDistortionCorrectionEnabled"];
      self->_internal->contentAwareDistortionCorrectionEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"contentAwareDistortionCorrectionEnabled"];
    }
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"contentAwareDistortionCorrectionSupported"];
  }
}

- (void)_updateAppleProRAWSupportedForDevice:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDemosaicedRawSupported"))
  {
    if (self->_internal->depthDataDeliveryEnabled) {
      int v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDemosaicedRawConfigurationWithDepthSupported");
    }
    else {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 0;
  }
  if (self->_internal->appleProRAWSupported != v5)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"appleProRAWSupported"];
    self->_internal->appleProRAWSupported = v5;
    internal = self->_internal;
    if (!internal->appleProRAWSupported && internal->appleProRAWEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"appleProRAWEnabled"];
      self->_internal->appleProRAWEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"appleProRAWEnabled"];
    }
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"appleProRAWSupported"];
  }
}

- (void)setMaxPhotoQualityPrioritization:(AVCapturePhotoQualityPrioritization)maxPhotoQualityPrioritization
{
  if ((unint64_t)(maxPhotoQualityPrioritization - 1) >= 3)
  {
    int v5 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, maxPhotoQualityPrioritization);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
  else
  {
    internal = self->_internal;
    if (internal->maxPhotoQualityPrioritization != maxPhotoQualityPrioritization)
    {
      internal->int64_t maxPhotoQualityPrioritization = maxPhotoQualityPrioritization;
      [(AVCapturePhotoOutput *)self _updateSemanticStyleRenderingSupportedForDevice:[(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice]];
      [(AVCaptureOutput *)self bumpChangeSeed];
      internal = self->_internal;
    }
    internal->maxPhotoQualityPrioritizationHasBeenSetByClient = 1;
  }
}

- (void)setMaxPhotoDimensions:(CMVideoDimensions)maxPhotoDimensions
{
  id v5 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice];
  char v6 = (void *)[v5 activeFormat];
  if (v6)
  {
    if ([v6 validateMaxPhotoDimensions:maxPhotoDimensions privateDimensionsEnabled:self->_internal->privatePhotoDimensionsEnabled])
    {
      char v10 = 0;
      [(AVCapturePhotoOutput *)self _setMaxPhotoDimensions:maxPhotoDimensions bumpChangeSeedOut:&v10];
      [(AVCapturePhotoOutput *)self _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:v5];
      [(AVCapturePhotoOutput *)self _setHighResolutionCaptureEnabled:[(AVCapturePhotoOutput *)self maxPhotoDimensionsAreHighResolution] bumpChangeSeedOut:&v10];
      if (v10) {
        [(AVCaptureOutput *)self bumpChangeSeed];
      }
      return;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
  }
  uint64_t v9 = (void *)[v7 exceptionWithName:v8 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v9);
  }
  NSLog(&cfstr_SuppressingExc.isa, v9);
}

- (void)_setMaxPhotoDimensions:(id)a3 bumpChangeSeedOut:(BOOL *)a4
{
  int var0 = a3.var0;
  int var1 = a3.var1;
  if (*(void *)&self->_internal->maxPhotoDimensions != a3)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"maxPhotoDimensions"];
    internal = self->_internal;
    internal->maxPhotoDimensions.double width = var0;
    internal->maxPhotoDimensions.double height = var1;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"maxPhotoDimensions"];
    if (a4) {
      *a4 = 1;
    }
  }
}

- (void)_setHighResolutionCaptureEnabled:(BOOL)a3 bumpChangeSeedOut:(BOOL *)a4
{
  if (self->_internal->highResolutionCaptureEnabled != a3)
  {
    BOOL v5 = a3;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"highResolutionCaptureEnabled"];
    self->_internal->highResolutionCaptureEnabled = v5;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"highResolutionCaptureEnabled"];
    uint64_t v7 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "activeFormat");
    if (v5)
    {
      int v8 = [v7 supportsQuadraHighResolutionStillImageOutput];
      if (a4)
      {
        if (v8) {
          *a4 = 1;
        }
      }
    }
  }
}

- (void)setResponsiveCaptureEnabled:(BOOL)responsiveCaptureEnabled
{
  BOOL v3 = responsiveCaptureEnabled;
  if (responsiveCaptureEnabled
    && ![(AVCapturePhotoOutput *)self isResponsiveCaptureSupported])
  {
    char v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->responsiveCaptureEnabled != v3)
    {
      internal->BOOL responsiveCaptureEnabled = v3;
      [(AVCapturePhotoOutput *)self _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:[(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice]];
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (void)_updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:(id)a3
{
  BOOL v5 = (void *)[a3 activeFormat];
  if ([v5 isZeroShutterLagSupported])
  {
    internal = self->_internal;
    if (!internal->depthDataDeliveryEnabled)
    {
LABEL_5:
      int v7 = !internal->virtualDeviceConstituentPhotoDeliveryEnabled;
      goto LABEL_7;
    }
    if ([v5 isZeroShutterLagWithDepthSupported])
    {
      internal = self->_internal;
      goto LABEL_5;
    }
  }
  int v7 = 0;
LABEL_7:
  int v8 = self->_internal;
  int zeroShutterLagSupported = v8->zeroShutterLagSupported;
  int zeroShutterLagEnabled = v8->zeroShutterLagEnabled;
  if (!v8->zeroShutterLagAutomaticallyEnabled)
  {
    BOOL v10 = 0;
    if (!v8->zeroShutterLagEnabled || v7 == 0)
    {
      BOOL v34 = zeroShutterLagEnabled != 0;
      int v11 = 0;
      goto LABEL_20;
    }
LABEL_16:
    BOOL v34 = v10;
    int v13 = [v5 isUltraHighResolutionZeroShutterLagSupported];
    int v8 = self->_internal;
    if (v13)
    {
      int v11 = [v5 maxPhotoDimensionsAreUltraHighResolution:*(void *)&v8->maxPhotoDimensions privateDimensionsEnabled:v8->privatePhotoDimensionsEnabled];
      int v8 = self->_internal;
    }
    else
    {
      int v11 = 0;
    }
    BOOL v10 = 1;
    goto LABEL_20;
  }
  BOOL v10 = zeroShutterLagEnabled != v7;
  if (v7) {
    goto LABEL_16;
  }
  BOOL v34 = zeroShutterLagEnabled != v7;
  BOOL v10 = 0;
  int v11 = 0;
LABEL_20:
  BOOL ultraHighResolutionZeroShutterLagSupported = v8->ultraHighResolutionZeroShutterLagSupported;
  BOOL v35 = v10;
  int v15 = v10 & v11 ^ 1;
  if (!v8->ultraHighResolutionZeroShutterLagSupportEnabled) {
    int v15 = 0;
  }
  int v37 = v15;
  if (v8->ultraHighResolutionZeroShutterLagSupportEnabled) {
    int v16 = v10 & v11;
  }
  else {
    int v16 = 0;
  }
  if (v8->ultraHighResolutionZeroShutterLagEnabled) {
    int v17 = v16 ^ 1;
  }
  else {
    int v17 = 0;
  }
  if (v8->ultraHighResolutionZeroShutterLagEnabled) {
    int v18 = v16;
  }
  else {
    int v18 = 0;
  }
  int v19 = [a3 ultraHighResolutionZeroShutterLagEnabled];
  unsigned int v32 = v18;
  if ((v18 & 1) == 0 && v19) {
    [a3 setUltraHighResolutionZeroShutterLagEnabled:0];
  }
  if (![v5 isFastCapturePrioritizationSupported]) {
    goto LABEL_40;
  }
  long long v20 = self->_internal;
  if (!v20->depthDataDeliveryEnabled) {
    goto LABEL_38;
  }
  if (![a3 isResponsiveCaptureWithDepthSupported])
  {
LABEL_40:
    int v24 = ultraHighResolutionZeroShutterLagSupported;
    long long v20 = self->_internal;
    BOOL v36 = !v20->responsiveCaptureSupported;
    BOOL responsiveCaptureEnabled = v20->responsiveCaptureEnabled;
    int v21 = v17;
    goto LABEL_41;
  }
  long long v20 = self->_internal;
LABEL_38:
  int v21 = v17;
  BOOL responsiveCaptureEnabled = v20->responsiveCaptureEnabled;
  BOOL v23 = v20->responsiveCaptureEnabled;
  BOOL v36 = v20->responsiveCaptureSupported == v35;
  int v24 = ultraHighResolutionZeroShutterLagSupported;
  if (v35)
  {
    BOOL v25 = 0;
    BOOL v26 = 1;
    goto LABEL_42;
  }
LABEL_41:
  BOOL v26 = 0;
  BOOL v23 = 0;
  BOOL v25 = responsiveCaptureEnabled;
LABEL_42:
  int v27 = v26 && v23;
  int fastCapturePrioritizationSupported = v20->fastCapturePrioritizationSupported;
  int v29 = !v36;
  if (fastCapturePrioritizationSupported != (v26 && v23)) {
    int v29 = 1;
  }
  if (zeroShutterLagSupported != v7) {
    int v29 = 1;
  }
  if (v24 != v11) {
    int v29 = 1;
  }
  if ((v21 | v37 | v29))
  {
    int v33 = v24;
    if (!v36) {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"responsiveCaptureSupported"];
    }
    if (fastCapturePrioritizationSupported != v27) {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"fastCapturePrioritizationSupported"];
    }
    if (v33 != v11) {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"ultraHighResolutionZeroShutterLagSupported"];
    }
    if (v37) {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"ultraHighResolutionZeroShutterLagSupportEnabled"];
    }
    if (zeroShutterLagSupported != v7) {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"zeroShutterLagSupported"];
    }
    self->_internal->responsiveCaptureSupported = v26;
    self->_internal->int fastCapturePrioritizationSupported = v27;
    self->_internal->BOOL ultraHighResolutionZeroShutterLagSupported = v11;
    self->_internal->ultraHighResolutionZeroShutterLagSupportEnabled = v16;
    self->_internal->int zeroShutterLagSupported = v7;
    if (v25)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"responsiveCaptureEnabled"];
      self->_internal->BOOL responsiveCaptureEnabled = 0;
    }
    uint64_t v30 = self->_internal;
    if (v30->fastCapturePrioritizationSupported || !v30->fastCapturePrioritizationEnabled)
    {
      int v31 = 0;
      if (!v21) {
        goto LABEL_64;
      }
    }
    else
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"fastCapturePrioritizationEnabled"];
      self->_internal->fastCapturePrioritizationEnabled = 0;
      int v31 = 1;
      if (!v21)
      {
LABEL_64:
        if (v34)
        {
          [(AVCapturePhotoOutput *)self willChangeValueForKey:@"zeroShutterLagEnabled"];
          self->_internal->int zeroShutterLagEnabled = v35;
          [(AVCapturePhotoOutput *)self didChangeValueForKey:@"zeroShutterLagEnabled"];
          if (!v21)
          {
LABEL_66:
            if (!v31) {
              goto LABEL_67;
            }
            goto LABEL_81;
          }
        }
        else if (!v21)
        {
          goto LABEL_66;
        }
        [(AVCapturePhotoOutput *)self didChangeValueForKey:@"ultraHighResolutionZeroShutterLagEnabled"];
        if (!v31)
        {
LABEL_67:
          if (!v25)
          {
LABEL_69:
            if (zeroShutterLagSupported != v7) {
              [(AVCapturePhotoOutput *)self didChangeValueForKey:@"zeroShutterLagSupported"];
            }
            if (v37) {
              [(AVCapturePhotoOutput *)self didChangeValueForKey:@"ultraHighResolutionZeroShutterLagSupportEnabled"];
            }
            if (v33 != v11) {
              [(AVCapturePhotoOutput *)self didChangeValueForKey:@"ultraHighResolutionZeroShutterLagSupported"];
            }
            if (fastCapturePrioritizationSupported != v27) {
              [(AVCapturePhotoOutput *)self didChangeValueForKey:@"fastCapturePrioritizationSupported"];
            }
            if (!v36)
            {
              [(AVCapturePhotoOutput *)self didChangeValueForKey:@"responsiveCaptureSupported"];
            }
            return;
          }
LABEL_68:
          [(AVCapturePhotoOutput *)self didChangeValueForKey:@"responsiveCaptureEnabled"];
          goto LABEL_69;
        }
LABEL_81:
        [(AVCapturePhotoOutput *)self didChangeValueForKey:@"fastCapturePrioritizationEnabled"];
        if (!v25) {
          goto LABEL_69;
        }
        goto LABEL_68;
      }
    }
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"ultraHighResolutionZeroShutterLagEnabled"];
    [(AVCapturePhotoOutput *)self _setUltraHighResolutionZeroShutterLagEnabled:v32];
    goto LABEL_64;
  }
}

- (BOOL)isResponsiveCaptureSupported
{
  return self->_internal->responsiveCaptureSupported;
}

- (void)setMovieRecordingEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3)
  {
    if (internal->videoCaptureEnabled)
    {
      long long v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3C8];
LABEL_4:
      char v6 = (void *)[v4 exceptionWithName:v5 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v6);
      }
      NSLog(&cfstr_SuppressingExc.isa, v6);
      return;
    }
    if (!internal->movieRecordingSupported)
    {
      long long v4 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v5 = *MEMORY[0x1E4F1C3C8];
      goto LABEL_4;
    }
  }
  if (internal->movieRecordingEnabled != a3)
  {
    internal->movieRecordingEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)_updateVirtualDeviceFusionSupportedForSourceDevice:(id)a3
{
  if ([a3 isVirtualDevice]) {
    int v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isStereoFusionSupported");
  }
  else {
    int v5 = 0;
  }
  if (self->_internal->virtualDeviceFusionSupported != v5)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"virtualDeviceFusionSupported"];
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"dualCameraFusionSupported"];
    self->_internal->virtualDeviceFusionSupported = v5;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"dualCameraFusionSupported"];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"virtualDeviceFusionSupported"];
  }
}

- (void)_updateSupportedFlashModesForSourceDevice:(id)a3
{
  if ([a3 hasFlash]) {
    long long v4 = &unk_1EF4FABA8;
  }
  else {
    long long v4 = &unk_1EF4FABC0;
  }
  if (([v4 isEqual:self->_internal->supportedFlashModes] & 1) == 0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"supportedFlashModes"];
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"flashSupported"];
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__AVCapturePhotoOutput__updateSupportedFlashModesForSourceDevice___block_invoke;
    v6[3] = &unk_1E5A72D70;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"flashSupported"];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"supportedFlashModes"];
  }
}

- (void)_updateSupportedDigitalFlashModesForSourceDevice:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDigitalFlashSupported")) {
    long long v4 = &unk_1EF4FABD8;
  }
  else {
    long long v4 = &unk_1EF4FABF0;
  }
  if (([v4 isEqual:self->_internal->supportedDigitalFlashModes] & 1) == 0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"supportedDigitalFlashModes"];
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__AVCapturePhotoOutput__updateSupportedDigitalFlashModesForSourceDevice___block_invoke;
    v6[3] = &unk_1E5A72D70;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"supportedDigitalFlashModes"];
    if ((unint64_t)[v4 count] <= 1 && self->_internal->digitalFlashCaptureEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"digitalFlashCaptureEnabled"];
      self->_internal->digitalFlashCaptureEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"digitalFlashCaptureEnabled"];
    }
  }
}

- (void)_updateStillImageStabilizationSupportedForSourceDevice:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isSISSupported");
  if (self->_internal->stillImageStabilizationSupported != v4)
  {
    char v5 = v4;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"stillImageStabilizationSupported"];
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__AVCapturePhotoOutput__updateStillImageStabilizationSupportedForSourceDevice___block_invoke;
    v7[3] = &unk_1E5A74028;
    v7[4] = self;
    char v8 = v5;
    dispatch_sync(sceneDetectionObserversDispatchQueue, v7);
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"stillImageStabilizationSupported"];
  }
}

- (void)_updateSpatialOverCaptureSupportedForSourceDevice:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isSpatialOverCaptureSupported");
  if (self->_internal->spatialOverCaptureSupported != v4)
  {
    BOOL v5 = v4;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"spatialOverCaptureSupported"];
    self->_internal->spatialOverCaptureSupported = v5;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"spatialOverCaptureSupported"];
    if (!v5 && self->_internal->spatialOverCaptureEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"spatialOverCaptureEnabled"];
      self->_internal->spatialOverCaptureEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"spatialOverCaptureEnabled"];
    }
  }
}

- (void)_updateProcessedPhotoZoomWithoutUpscalingSupportedForSourceDevice:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isMomentCaptureMovieRecordingSupported");
  if (self->_internal->processedPhotoZoomWithoutUpscalingSupported != v4)
  {
    BOOL v5 = v4;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"processedPhotoZoomWithoutUpscalingSupported"];
    self->_internal->processedPhotoZoomWithoutUpscalingSupported = v5;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"processedPhotoZoomWithoutUpscalingSupported"];
  }
}

- (void)_updatePreviewQualityAdjustedPhotoFilterRenderingSupportedForDevice:(id)a3
{
  int v4 = [a3 isPreviewQualityAdjustedPhotoFilterRenderingSupported];
  if (self->_internal->previewQualityAdjustedPhotoFilterRenderingSupported != v4)
  {
    BOOL v5 = v4;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"previewQualityAdjustedPhotoFilterRenderingSupported"];
    self->_internal->previewQualityAdjustedPhotoFilterRenderingSupported = v5;
    internal = self->_internal;
    if (!internal->previewQualityAdjustedPhotoFilterRenderingSupported
      && internal->previewQualityAdjustedPhotoFilterRenderingEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"previewQualityAdjustedPhotoFilterRenderingEnabled"];
      self->_internal->previewQualityAdjustedPhotoFilterRenderingEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"previewQualityAdjustedPhotoFilterRenderingEnabled"];
    }
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"previewQualityAdjustedPhotoFilterRenderingSupported"];
  }
}

- (void)_updateOfflineVISSupportedForSourceDevice:(id)a3
{
  int v4 = (void *)[a3 activeFormat];
  int v5 = [v4 isVideoStabilizationModeSupported:2];
  if (self->_internal->imageOptimizationForOfflineVideoStabilizationSupported != v5)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"imageOptimizationForOfflineVideoStabilizationSupported"];
    self->_internal->imageOptimizationForOfflineVideoStabilizationSupported = v5;
    internal = self->_internal;
    if (!internal->imageOptimizationForOfflineVideoStabilizationSupported
      && internal->optimizesImagesForOfflineVideoStabilization)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"optimizesImagesForOfflineVideoStabilization"];
      self->_internal->optimizesImagesForOfflineVideoStabilization = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"optimizesImagesForOfflineVideoStabilization"];
    }
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"imageOptimizationForOfflineVideoStabilizationSupported"];
  }
  if (v5)
  {
    BOOL v7 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourcesFromFrontFacingCamera];
    char v8 = (float *)MEMORY[0x1E4F513F8];
    if (!v7) {
      char v8 = (float *)MEMORY[0x1E4F513F0];
    }
    float v9 = *v8;
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v4 formatDescription]);
    int v5 = 4 * llroundf((float)(int)(float)((float)(v9 + 1.0) * (float)Dimensions.width) * 0.25);
    int v11 = 4 * llroundf((float)(int)(float)((float)(v9 + 1.0) * (float)Dimensions.height) * 0.25);
  }
  else
  {
    int v11 = 0;
  }
  int v12 = self->_internal;
  if (v5 != v12->optimizedImageDimensionsForOfflineStabilization.width
    || v11 != v12->optimizedImageDimensionsForOfflineStabilization.height)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"optimizedImageDimensionsForOfflineStabilization"];
    int v13 = self->_internal;
    v13->optimizedImageDimensionsForOfflineStabilization.double width = v5;
    v13->optimizedImageDimensionsForOfflineStabilization.double height = v11;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"optimizedImageDimensionsForOfflineStabilization"];
  }
}

- (void)_updateMovieRecordingSupportedForSourceDevice:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isMomentCaptureMovieRecordingSupported");
  if (self->_internal->movieRecordingSupported != v4)
  {
    BOOL v5 = v4;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"movieRecordingSupported"];
    self->_internal->movieRecordingSupported = v5;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"movieRecordingSupported"];
    if (!v5 && self->_internal->movieRecordingEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"movieRecordingEnabled"];
      self->_internal->movieRecordingEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"movieRecordingEnabled"];
    }
  }
}

- (void)_updateMaxPhotoDimensionsForDevice:(id)a3
{
  if ([a3 activeFormat]) {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "defaultPhotoDimensionsWithHighResolutionCaptureEnabled:", self->_internal->highResolutionCaptureEnabled);
  }
  else {
    uint64_t v5 = 0;
  }

  [(AVCapturePhotoOutput *)self _setMaxPhotoDimensions:v5 bumpChangeSeedOut:0];
}

- (void)_updateMaxBracketedCapturePhotoCountForSourceDevice:(id)a3
{
  uint64_t v5 = (void *)[a3 activeFormat];
  if ((int)FigCapturePlatformIdentifier() >= 5) {
    uint64_t v6 = 8;
  }
  else {
    uint64_t v6 = 4;
  }
  [(AVCaptureOutput *)self session];
  objc_opt_class();
  unint64_t v7 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0 && v5)
  {
    id v8 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDeviceInput];
    if ([a3 isCenterStageActive]) {
      int v9 = [v8 isCenterStageAllowed];
    }
    else {
      int v9 = 0;
    }
    if ([a3 isBackgroundBlurActive]) {
      int v10 = [v8 isBackgroundBlurAllowed];
    }
    else {
      int v10 = 0;
    }
    if ([a3 isStudioLightActive]) {
      int v11 = [v8 isStudioLightingAllowed];
    }
    else {
      int v11 = 0;
    }
    int v12 = [a3 isBackgroundReplacementActive];
    if (v12) {
      LOBYTE(v12) = [v8 isBackgroundReplacementAllowed];
    }
    unint64_t v7 = 0;
    if (((v9 | v10 | v11) & 1) == 0 && (v12 & 1) == 0)
    {
      unint64_t v7 = v6;
      if ([v5 supportsQuadraHighResolutionStillImageOutput])
      {
        if (self->_internal->highResolutionCaptureEnabled) {
          unint64_t v7 = 0;
        }
        else {
          unint64_t v7 = v6;
        }
      }
    }
  }
  MEMORY[0x1A6234330](self->_internal->requestsLock);
  internal = self->_internal;
  unint64_t maxBracketedCapturePhotoCount = internal->maxBracketedCapturePhotoCount;
  MEMORY[0x1A6234340](internal->requestsLock);
  if (v7 != maxBracketedCapturePhotoCount) {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"maxBracketedCapturePhotoCount"];
  }
  MEMORY[0x1A6234330](self->_internal->requestsLock);
  self->_internal->unint64_t maxBracketedCapturePhotoCount = v7;
  MEMORY[0x1A6234340](self->_internal->requestsLock);
  if (v7 != maxBracketedCapturePhotoCount)
  {
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"maxBracketedCapturePhotoCount"];
  }
}

- (void)_updateLensStabilizationDuringBracketedCaptureSupportedForSourceDevice:(id)a3
{
  if ([a3 isLensStabilizationSupported])
  {
    MEMORY[0x1A6234330](self->_internal->requestsLock);
    internal = self->_internal;
    BOOL v5 = internal->maxBracketedCapturePhotoCount != 0;
    MEMORY[0x1A6234340](internal->requestsLock);
  }
  else
  {
    BOOL v5 = 0;
  }
  if (self->_internal->lensStabilizationDuringBracketedCaptureSupported != v5)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"lensStabilizationDuringBracketedCaptureSupported"];
    self->_internal->lensStabilizationDuringBracketedCaptureSupported = v5;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"lensStabilizationDuringBracketedCaptureSupported"];
  }
}

- (void)_updateHighPhotoQualitySupportedForDevice:(id)a3
{
  self->_internal->highPhotoQualitySupported = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isHighPhotoQualitySupported");
}

- (void)_updateFocusPixelBlurScoreSupportedForDevice:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "figCaptureSourceVideoFormat"), "isFocusPixelBlurScoreSupported");
  if (self->_internal->focusPixelFocusBlurScoreSupported != v4)
  {
    BOOL v5 = v4;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"focusPixelBlurScoreSupported"];
    self->_internal->focusPixelFocusBlurScoreSupported = v5;
    if (!v5 && self->_internal->focusPixelFocusBlurScoreEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"focusPixelBlurScoreEnabled"];
      self->_internal->focusPixelFocusBlurScoreEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"focusPixelBlurScoreEnabled"];
    }
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"focusPixelBlurScoreSupported"];
  }
}

- (void)_updateDepthDataDeliverySupportedForSourceDevice:(id)a3
{
  id v5 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDeviceInput];
  BOOL v6 = [a3 isBackgroundBlurActive]
    && ([v5 isBackgroundBlurAllowed] & 1) != 0
    || [a3 isStudioLightActive] && (objc_msgSend(v5, "isStudioLightingAllowed") & 1) != 0
    || [a3 isBackgroundReplacementActive]
    && [v5 isBackgroundReplacementAllowed];
  BOOL v7 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isStillImageDisparitySupported") & !v6;
  if (self->_internal->depthDataDeliverySupported != v7)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"depthDataDeliverySupported"];
    self->_internal->depthDataDeliverySupported = v7;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"depthDataDeliverySupported"];
    if (!v7 && self->_internal->depthDataDeliveryEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"depthDataDeliveryEnabled"];
      self->_internal->depthDataDeliveryEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"depthDataDeliveryEnabled"];
    }
  }
  BOOL v8 = objc_msgSend((id)objc_msgSend(a3, "activeDepthDataFormat"), "isPortraitEffectsMatteStillImageDeliverySupported") & !v6;
  if (self->_internal->portraitEffectsMatteDeliverySupported != v8)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"portraitEffectsMatteDeliverySupported"];
    self->_internal->portraitEffectsMatteDeliverySupported = v8;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"portraitEffectsMatteDeliverySupported"];
    if (!v8 && self->_internal->portraitEffectsMatteDeliveryEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"portraitEffectsMatteDeliveryEnabled"];
      self->_internal->portraitEffectsMatteDeliveryEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"portraitEffectsMatteDeliveryEnabled"];
    }
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", objc_msgSend((id)objc_msgSend(a3, "activeDepthDataFormat"), "supportedSemanticSegmentationMatteTypes"));
  if (v6) {
    int v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else {
    int v10 = (void *)v9;
  }
  if (([v10 isEqual:self->_internal->availableSemanticSegmentationTypes] & 1) == 0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"availableSemanticSegmentationTypes"];

    self->_internal->availableSemanticSegmentationTypes = (NSArray *)v10;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"availableSemanticSegmentationTypes"];
    if ([(NSArray *)self->_internal->enabledSemanticSegmentationTypes count])
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"enabledSemanticSegmentationTypes"];

      self->_internal->enabledSemanticSegmentationTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"enabledSemanticSegmentationTypes"];
    }
  }
}

- (void)_updateDeferredProcessingSupportedForSourceDevice:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isDeferredPhotoProcessingSupported");
  if (self->_internal->autoDeferredPhotoDeliverySupported != v4)
  {
    BOOL v5 = v4;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"autoDeferredPhotoDeliverySupported"];
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"deferredProcessingSupported"];
    self->_internal->autoDeferredPhotoDeliverySupported = v5;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"deferredProcessingSupported"];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"autoDeferredPhotoDeliverySupported"];
    if (!v5 && self->_internal->autoDeferredPhotoDeliveryEnabled)
    {
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"autoDeferredPhotoDeliveryEnabled"];
      [(AVCapturePhotoOutput *)self willChangeValueForKey:@"deferredProcessingEnabled"];
      self->_internal->BOOL autoDeferredPhotoDeliveryEnabled = 0;
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"deferredProcessingEnabled"];
      [(AVCapturePhotoOutput *)self didChangeValueForKey:@"autoDeferredPhotoDeliveryEnabled"];
    }
  }
}

- (void)_updateConstantColorSupportedForSourceDevice:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "figCaptureSourceVideoFormat"), "isConstantColorSupported");
  if (self->_internal->constantColorSupported != v4)
  {
    BOOL v5 = v4;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"constantColorSupported"];
    self->_internal->constantColorSupported = v5;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"constantColorSupported"];
    if (!v5)
    {
      internal = self->_internal;
      if (internal->constantColorEnabled)
      {
        [(AVCapturePhotoOutput *)self willChangeValueForKey:@"constantColorEnabled"];
        self->_internal->constantColorEnabled = 0;
        [(AVCapturePhotoOutput *)self didChangeValueForKey:@"constantColorEnabled"];
        internal = self->_internal;
      }
      if (internal->constantColorClippingRecoveryEnabled)
      {
        [(AVCapturePhotoOutput *)self willChangeValueForKey:@"constantColorClippingRecoveryEnabled"];
        self->_internal->constantColorClippingRecoveryEnabled = 0;
        [(AVCapturePhotoOutput *)self didChangeValueForKey:@"constantColorClippingRecoveryEnabled"];
        internal = self->_internal;
      }
      if (internal->constantColorSaturationBoostEnabled)
      {
        [(AVCapturePhotoOutput *)self willChangeValueForKey:@"constantColorSaturationBoostEnabled"];
        self->_internal->constantColorSaturationBoostEnabled = 0;
        [(AVCapturePhotoOutput *)self didChangeValueForKey:@"constantColorSaturationBoostEnabled"];
      }
    }
  }
}

- (void)_updateAvailablePhotoPixelFormatTypesForSourceDevice:(id)a3
{
  BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (a3)
  {
    uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "formatDescription"));
    if ((MediaSubType & 0xFFFFFFFD) == 0x78343230)
    {
      [v5 addObjectsFromArray:&unk_1EF4FAB60];
    }
    else
    {
      int v7 = MediaSubType;
      objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", MediaSubType));
      if (v7 == 875704422) {
        uint64_t v8 = 875704438;
      }
      else {
        uint64_t v8 = 875704422;
      }
      objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8));
    }
    [v5 addObject:&unk_1EF4FA898];
  }
  if (([v5 isEqual:self->_internal->availablePhotoPixelFormatTypes] & 1) == 0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"availablePhotoPixelFormatTypes"];

    self->_internal->availablePhotoPixelFormatTypes = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"availablePhotoPixelFormatTypes"];
  }
}

- (void)_updateAvailablePhotoCodecTypesForSourceDevice:(id)a3
{
  BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  BOOL v6 = v5;
  if (a3)
  {
    [v5 addObject:*MEMORY[0x1E4F47D38]];
    if ([(AVCapturePhotoOutput *)self _HEVCAndHEIFAreAvailableForSourceDevice:a3])
    {
      [v6 addObject:*MEMORY[0x1E4F47D30]];
    }
  }
  if (([v6 isEqual:self->_internal->availablePhotoCodecTypes] & 1) == 0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"availablePhotoCodecTypes"];

    self->_internal->availablePhotoCodecTypes = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"availablePhotoCodecTypes"];
  }
}

- (void)_updateAvailablePhotoFileTypesForSourceDevice:(id)a3
{
  BOOL v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v5 addObject:*MEMORY[0x1E4F47BF8]];
  if ([(AVCapturePhotoOutput *)self _HEVCAndHEIFAreAvailableForSourceDevice:a3])
  {
    [v5 addObject:*MEMORY[0x1E4F47BE8]];
  }
  [v5 addObject:*MEMORY[0x1E4F47C10]];
  if (([v5 isEqual:self->_internal->availablePhotoFileTypes] & 1) == 0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"availablePhotoFileTypes"];

    self->_internal->availablePhotoFileTypes = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"availablePhotoFileTypes"];
  }
}

- (BOOL)_HEVCAndHEIFAreAvailableForSourceDevice:(id)a3
{
  BOOL result = 0;
  if ([a3 isHEIFSupported])
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "formatDescription"));
    objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "videoSupportedFrameRateRanges"), "lastObject"), "maxFrameRate");
    double v6 = v5;
    if ((objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isPhotoFormat") & 1) != 0
      || v6 * (double)(Dimensions.height * Dimensions.width) * 0.0625 * 0.0625 <= 1000000.0)
    {
      return 1;
    }
  }
  return result;
}

- (void)_updateAutoRedReductionSupportedForSourceDevice:(id)a3
{
  int v4 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "supportsRedEyeReduction");
  if (self->_internal->autoRedEyeReductionSupported != v4)
  {
    char v5 = v4;
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"autoRedEyeReductionSupported"];
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__AVCapturePhotoOutput__updateAutoRedReductionSupportedForSourceDevice___block_invoke;
    v7[3] = &unk_1E5A74028;
    v7[4] = self;
    char v8 = v5;
    dispatch_sync(sceneDetectionObserversDispatchQueue, v7);
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"autoRedEyeReductionSupported"];
  }
}

uint64_t __79__AVCapturePhotoOutput__updateStillImageStabilizationSupportedForSourceDevice___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16) + 89) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __72__AVCapturePhotoOutput__updateAutoRedReductionSupportedForSourceDevice___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16) + 129) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __51__AVCapturePhotoOutput__setIsFlashScene_firingKVO___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16) + 284) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __49__AVCapturePhotoOutput__setIsHDRScene_firingKVO___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16) + 285) = *(unsigned char *)(result + 40);
  return result;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  char v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515F8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51620] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51618] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51628] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515C8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51610] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51600] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515A8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515E0] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515D0] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515E8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515F0] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515B8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515D8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51608] object:a3 flags:0];
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePhotoOutput;
  [(AVCaptureOutput *)&v6 attachSafelyToFigCaptureSession:a3];
}

- (void)setFilterRenderingEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (internal->filterRenderingEnabled != a3)
  {
    internal->filterRenderingEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

uint64_t __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(result + 32)
                                                                                         + 16)
                                                                             + 280) > 0;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    uint64_t v2 = (const void *)MGCopyAnswer();
    sIsForcedShutterSoundRegion = v2 == (const void *)*MEMORY[0x1E4F1CFD0];
    if (v2)
    {
      CFRelease(v2);
    }
  }
}

void *__71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_4(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(_DWORD *)(*(void *)(result[4] + 16) + 288) > 0;
  *(unsigned char *)(*(void *)(result[6] + 8) + 24) = *(_DWORD *)(*(void *)(result[4] + 16) + 304) > 0;
  return result;
}

id __73__AVCapturePhotoOutput__updateSupportedDigitalFlashModesForSourceDevice___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 120) = result;
  return result;
}

id __66__AVCapturePhotoOutput__updateSupportedFlashModesForSourceDevice___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 16) + 112) = result;
  return result;
}

- (void)setAutoDeferredPhotoDeliveryEnabled:(BOOL)autoDeferredPhotoDeliveryEnabled
{
  BOOL v3 = autoDeferredPhotoDeliveryEnabled;
  if (autoDeferredPhotoDeliveryEnabled
    && ![(AVCapturePhotoOutput *)self isAutoDeferredPhotoDeliverySupported])
  {
    objc_super v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->autoDeferredPhotoDeliveryEnabled != v3)
    {
      internal->BOOL autoDeferredPhotoDeliveryEnabled = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isAutoDeferredPhotoDeliverySupported
{
  return self->_internal->autoDeferredPhotoDeliverySupported;
}

uint64_t __42__AVCapturePhotoOutput_digitalFlashStatus__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(*(void *)(a1[4] + 16) + 296);
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = *(_DWORD *)(*(void *)(a1[4] + 16) + 288);
  uint64_t result = [*(id *)(*(void *)(a1[4] + 16) + 320) digitalFlashMode];
  *(void *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

uint64_t __34__AVCapturePhotoOutput_isHDRScene__block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 16) + 285);
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = *(_DWORD *)(*(void *)(a1[4] + 16) + 276);
  uint64_t result = [*(id *)(*(void *)(a1[4] + 16) + 320) HDRMode];
  *(void *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (void)setExifFocalLengthsByZoomFactor:(id)a3
{
  exifFocalLengthsByZoomFactor = self->_internal->exifFocalLengthsByZoomFactor;
  if (exifFocalLengthsByZoomFactor != a3)
  {

    self->_internal->exifFocalLengthsByZoomFactor = (NSDictionary *)[a3 copy];
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

void __73__AVCapturePhotoOutput_setFigCaptureSessionSectionProperty_withHostTime___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CMTime v11 = *(CMTime *)(a1 + 48);
    CFDictionaryRef v5 = CMTimeCopyAsDictionary(&v11, v4);
    uint64_t v6 = [*(id *)(a1 + 32) sinkID];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    int v10 = *(void (**)(uint64_t, uint64_t, uint64_t, CFDictionaryRef))(v9 + 8);
    if (v10) {
      v10(a2, v6, v7, v5);
    }
    CFRelease(v5);
  }
}

uint64_t __49__AVCapturePhotoOutput_digitalFlashExposureTimes__block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = *(id *)(*(void *)(a1[4] + 16) + 312);
  *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(*(void *)(a1[4] + 16) + 296);
  *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = *(_DWORD *)(*(void *)(a1[4] + 16) + 304);
  uint64_t result = [*(id *)(*(void *)(a1[4] + 16) + 320) digitalFlashMode];
  *(void *)(*(void *)(a1[8] + 8) + 24) = result;
  return result;
}

- (void)setContentAwareDistortionCorrectionEnabled:(BOOL)contentAwareDistortionCorrectionEnabled
{
  BOOL v3 = contentAwareDistortionCorrectionEnabled;
  if (contentAwareDistortionCorrectionEnabled
    && ![(AVCapturePhotoOutput *)self isContentAwareDistortionCorrectionSupported])
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->contentAwareDistortionCorrectionEnabled != v3)
    {
      internal->contentAwareDistortionCorrectionEnabled = v3;
      [(AVCapturePhotoOutput *)self _updateCameraCalibrationDataDeliverySupportedForSourceDevice:[(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice]];
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isContentAwareDistortionCorrectionSupported
{
  return self->_internal->contentAwareDistortionCorrectionSupported;
}

- (void)_updateCameraCalibrationDataDeliverySupportedForSourceDevice:(id)a3
{
  BOOL v5 = self->_internal->virtualDeviceConstituentPhotoDeliveryEnabled
    && ([a3 isGeometricDistortionCorrectionEnabled] & 1) == 0
    && !self->_internal->contentAwareDistortionCorrectionEnabled;
  if (objc_msgSend((id)objc_msgSend(a3, "constituentDevices"), "count") == 2) {
    int v6 = objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isStillImageDisparitySupported");
  }
  else {
    int v6 = 1;
  }
  int v7 = v5 & v6;
  if (self->_internal->cameraCalibrationDataDeliverySupported != v7)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"cameraCalibrationDataDeliverySupported"];
    self->_internal->cameraCalibrationDataDeliverySupported = v7;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"cameraCalibrationDataDeliverySupported"];
  }
}

- (void)setEnabledSemanticSegmentationMatteTypes:(NSArray *)enabledSemanticSegmentationMatteTypes
{
  if (!enabledSemanticSegmentationMatteTypes)
  {
    CMTime v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v9 = v11;
    uint64_t v10 = v12;
    goto LABEL_5;
  }
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:");
  objc_msgSend(v5, "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[AVCapturePhotoOutput availableSemanticSegmentationMatteTypes](self, "availableSemanticSegmentationMatteTypes")));
  if ([v5 count])
  {
    int v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    int v15 = v5;
    uint64_t v8 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v9 = v6;
    uint64_t v10 = v7;
LABEL_5:
    int v13 = objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v8, 0, v15);
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v13);
    }
    NSLog(&cfstr_SuppressingExc.isa, v13);
    return;
  }
  id v14 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:self->_internal->enabledSemanticSegmentationTypes];
  if ((objc_msgSend(v14, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", enabledSemanticSegmentationMatteTypes)) & 1) == 0)
  {

    self->_internal->enabledSemanticSegmentationTypes = (NSArray *)[(NSArray *)enabledSemanticSegmentationMatteTypes copy];
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (NSArray)availableSemanticSegmentationMatteTypes
{
  uint64_t v2 = self->_internal->availableSemanticSegmentationTypes;

  return v2;
}

uint64_t __54__AVCapturePhotoOutput__sanitizedSettingsForSettings___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 112), "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "flashMode")));
  uint64_t result = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 16) + 96), "containsObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "HDRMode")));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 16) + 89);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 16)
                                                                        + 432);
  return result;
}

- (void)setDigitalFlashCaptureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && (unint64_t)objc_msgSend(-[AVCapturePhotoOutput supportedDigitalFlashModes](self, "supportedDigitalFlashModes"), "count") <= 1)
  {
    int v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->digitalFlashCaptureEnabled != v3)
    {
      internal->digitalFlashCaptureEnabled = v3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (void)_handlePreparationCompleteNotificationWithPayload:(id)a3 settingsID:(int64_t)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  if (v7) {
    id v28 = [(AVCapturePhotoOutput *)self _errorForFigCaptureSessionNotificationPayloadErrorStatus:v7 userInfo:0];
  }
  else {
    id v28 = 0;
  }
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
  MEMORY[0x1A6234330](self->_internal->requestsLock);
  uint64_t v10 = [(NSMutableArray *)self->_internal->prepareRequests lastObject];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  prepareRequests = self->_internal->prepareRequests;
  uint64_t v12 = [(NSMutableArray *)prepareRequests countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    BOOL v26 = self;
    int v27 = v7;
    uint64_t v14 = *(void *)v34;
LABEL_6:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v34 != v14) {
        objc_enumerationMutation(prepareRequests);
      }
      int v16 = *(void **)(*((void *)&v33 + 1) + 8 * v15);
      if ([v16 requestID] >= (unint64_t)a4) {
        break;
      }
      [v8 addObject:v16];
      if (v16 != (void *)v10) {
        [v9 addObject:v16];
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [(NSMutableArray *)prepareRequests countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v13) {
          goto LABEL_6;
        }
        goto LABEL_20;
      }
    }
    if ([v16 requestID] != a4)
    {
LABEL_20:
      id v17 = 0;
      LODWORD(v7) = v27;
      self = v26;
      goto LABEL_21;
    }
    id v17 = v16;
    self = v26;
    if (v16 != (void *)v10) {
      [v9 addObject:v16];
    }
    LODWORD(v7) = v27;
  }
  else
  {
    id v17 = 0;
  }
LABEL_21:
  [(NSMutableArray *)self->_internal->prepareRequests removeObjectsInArray:v9];
  MEMORY[0x1A6234340](self->_internal->requestsLock);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v18 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v8);
        }
        long long v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (([v22 isCompleted] & 1) == 0)
        {
          if ([v22 completionHandler])
          {
            uint64_t v23 = [v22 completionHandler];
            (*(void (**)(uint64_t, void, void))(v23 + 16))(v23, 0, 0);
          }
          [v22 setCompleted:1];
        }
      }
      uint64_t v19 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v19);
  }
  if (([v17 isCompleted] & 1) == 0)
  {
    if ([v17 completionHandler])
    {
      uint64_t v24 = [v17 completionHandler];
      if (v7) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = [v9 containsObject:v17] ^ 1;
      }
      (*(void (**)(uint64_t, uint64_t, id))(v24 + 16))(v24, v25, v28);
    }
    [v17 setCompleted:1];
  }
  [v9 count];
}

- (void)setAppleProRAWEnabled:(BOOL)appleProRAWEnabled
{
  BOOL v3 = appleProRAWEnabled;
  if (appleProRAWEnabled && ![(AVCapturePhotoOutput *)self isAppleProRAWSupported])
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  else
  {
    internal = self->_internal;
    if (internal->appleProRAWEnabled != v3)
    {
      internal->appleProRAWEnabled = v3;
      id v6 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice];
      [(AVCapturePhotoOutput *)self _updateAvailableRawPhotoPixelFormatTypesForSourceDevice:v6];
      [(AVCapturePhotoOutput *)self _updateAvailableRawPhotoFileTypesForSourceDevice:v6];
      [(AVCapturePhotoOutput *)self _updateVirtualDeviceConstituentPhotoDeliveryAndDualCameraDualPhotoDeliverySupportedForSourceDevice:v6];
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (int64_t)digitalFlashStatus
{
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__AVCapturePhotoOutput_digitalFlashStatus__block_invoke;
  v6[3] = &unk_1E5A74190;
  v6[4] = self;
  v6[5] = &v15;
  void v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
  if (v8[3])
  {
    if (*((_DWORD *)v12 + 6))
    {
      int64_t v4 = v16[3];
    }
    else
    {
      int64_t v4 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "_digitalFlashStatus");
      void v16[3] = v4;
    }
  }
  else
  {
    int64_t v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v4;
}

- (BOOL)isHDRScene
{
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__AVCapturePhotoOutput_isHDRScene__block_invoke;
  v6[3] = &unk_1E5A74190;
  v6[4] = self;
  v6[5] = &v15;
  void v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
  if (v8[3])
  {
    if (*((_DWORD *)v12 + 6))
    {
      char v4 = *((unsigned char *)v16 + 24) != 0;
    }
    else
    {
      char v4 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "_isHighDynamicRangeScene");
      *((unsigned char *)v16 + 24) = v4;
    }
  }
  else
  {
    char v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v4;
}

- (void)setSpatialPhotoCaptureEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3 && !internal->spatialPhotoCaptureSupported)
  {
    char v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (internal->spatialPhotoCaptureEnabled != a3)
  {
    internal->spatialPhotoCaptureEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)setSpatialOverCaptureEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3 && !internal->spatialOverCaptureSupported)
  {
    char v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (internal->spatialOverCaptureEnabled != a3)
  {
    internal->spatialOverCaptureEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)setPreviewQualityAdjustedPhotoFilterRenderingEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3 && !internal->previewQualityAdjustedPhotoFilterRenderingSupported)
  {
    char v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (internal->previewQualityAdjustedPhotoFilterRenderingEnabled != a3)
  {
    internal->previewQualityAdjustedPhotoFilterRenderingEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)portraitEffectsMatteDeliveryEnabled
{
  internal = self->_internal;
  if (portraitEffectsMatteDeliveryEnabled && !internal->portraitEffectsMatteDeliverySupported)
  {
    char v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (internal->portraitEffectsMatteDeliveryEnabled != portraitEffectsMatteDeliveryEnabled)
  {
    internal->portraitEffectsMatteDeliveryEnabled = portraitEffectsMatteDeliveryEnabled;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)fastCapturePrioritizationEnabled
{
  internal = self->_internal;
  if (fastCapturePrioritizationEnabled && !internal->fastCapturePrioritizationSupported)
  {
    char v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (internal->fastCapturePrioritizationEnabled != fastCapturePrioritizationEnabled)
  {
    internal->fastCapturePrioritizationEnabled = fastCapturePrioritizationEnabled;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (internal->semanticStyleRenderingSupported || !a3)
  {
    if (internal->semanticStyleRenderingEnabled != a3)
    {
      internal->BOOL semanticStyleRenderingEnabled = a3;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    BOOL v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (id)digitalFlashExposureTimes
{
  v31[2] = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3052000000;
  int v27 = __Block_byref_object_copy__8;
  id v28 = __Block_byref_object_dispose__8;
  uint64_t v29 = 0;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__AVCapturePhotoOutput_digitalFlashExposureTimes__block_invoke;
  void v11[3] = &unk_1E5A79DC0;
  v11[4] = self;
  void v11[5] = &v24;
  v11[6] = &v20;
  v11[7] = &v16;
  v11[8] = &v12;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v11);
  if (v13[3] && v21[3])
  {
    if (*((_DWORD *)v17 + 6))
    {
      id v4 = (id)v25[5];
    }
    else
    {
      id v6 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice];

      id v4 = (id)[v6 _digitalFlashExposureTimes];
      v25[5] = (uint64_t)v4;
    }
    if ([v4 count])
    {
      v30[0] = &unk_1EF4FA7A8;
      uint64_t v7 = NSNumber;
      objc_msgSend((id)objc_msgSend((id)v25[5], "objectForKeyedSubscript:", *MEMORY[0x1E4F521D8]), "doubleValue");
      uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
      v30[1] = &unk_1EF4FA7C0;
      v31[0] = v8;
      uint64_t v9 = NSNumber;
      objc_msgSend((id)objc_msgSend((id)v25[5], "objectForKeyedSubscript:", *MEMORY[0x1E4F521D0]), "doubleValue");
      v31[1] = objc_msgSend(v9, "numberWithDouble:");
      BOOL v5 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    }
    else
    {
      BOOL v5 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {

    BOOL v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v5;
}

uint64_t __70__AVCapturePhotoOutput_setFigCaptureSessionSectionProperty_withValue___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(v3 + 48);
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v9 = *(void *)(VTable + 16);
    uint64_t result = VTable + 16;
    uint64_t v8 = v9;
    uint64_t v10 = v9 ? v8 : 0;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 8);
    if (v11)
    {
      return v11(a2, v4, v5, v6);
    }
  }
  return result;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    while ([(NSMutableArray *)self->_internal->readinessCoordinators count])
      [(AVCapturePhotoOutput *)self _removeReadinessCoordinator:[(NSMutableArray *)self->_internal->readinessCoordinators lastObject]];

    if (sIsForcedShutterSoundRegion)
    {
      beginEndIrisMovieCaptureHostTimeDispatchGroup = self->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
      dispatch_time_t v5 = dispatch_time(0, 5000000000);
      dispatch_group_wait(beginEndIrisMovieCaptureHostTimeDispatchGroup, v5);
    }
    FigSimpleMutexDestroy();

    ct_green_tea_logger_destroy();
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePhotoOutput;
  [(AVCaptureOutput *)&v6 dealloc];
}

- (void)removeObserver:(id)a3 forKeyPath:(id)a4
{
  [(AVCapturePhotoOutput *)self _decrementObserverCountForKeyPath:a4];
  v7.receiver = self;
  v7.super_class = (Class)AVCapturePhotoOutput;
  [(AVCapturePhotoOutput *)&v7 removeObserver:a3 forKeyPath:a4];
}

- (void)capturePhotoWithSettings:(AVCapturePhotoSettings *)settings delegate:(id)delegate
{
  v26[1] = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v20 = 0;
  if (!delegate)
  {
    uint64_t v16 = @"Nil delegate";
LABEL_20:
    uint64_t v20 = v16;
LABEL_11:
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v13);
    }
    NSLog(&cfstr_SuppressingExc.isa, v13);
    goto LABEL_13;
  }
  uint64_t v8 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", v8) & 1) == 0)
  {
    uint64_t v16 = @"No active and enabled video connection";
    goto LABEL_20;
  }
  if ([(AVCapturePhotoSettings *)settings isAutoSpatialOverCaptureEnabled])
  {
    uint64_t v16 = @"autoSpatialOverCaptureEnabled is not supported through this interface. Use beginMomentCapture...";
    goto LABEL_20;
  }
  if (!self->_internal->optimizesImagesForOfflineVideoStabilization)
  {
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    uint64_t v15 = CTGreenTeaOsLogHandle;
    if (CTGreenTeaOsLogHandle)
    {
      if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A152C000, v15, OS_LOG_TYPE_INFO, "Take a photo", buf, 2u);
      }
    }
  }
  id v9 = (id)[(AVCapturePhotoSettings *)settings copy];
  if (po_photoSettingsAreValid(v9, (uint64_t)delegate, self, v8, &v20))
  {
    if (sIsForcedShutterSoundRegion)
    {
      beginEndIrisMovieCaptureHostTimeDispatchGroup = self->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
      dispatch_time_t v11 = dispatch_time(0, 2000000000);
      dispatch_group_wait(beginEndIrisMovieCaptureHostTimeDispatchGroup, v11);
    }
    self->_internal->lastSettingsUniqueID = [v9 uniqueID];
    id v12 = -[AVCapturePhotoOutput _figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:](self, "_figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:", v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), delegate, -[AVCaptureOutput connections](self, "connections"));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __58__AVCapturePhotoOutput_capturePhotoWithSettings_delegate___block_invoke;
    v18[3] = &unk_1E5A79D70;
    v18[7] = v12;
    v18[8] = &v21;
    v18[4] = v9;
    v18[5] = self;
    v18[6] = delegate;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v18];
    uint64_t v25 = *MEMORY[0x1E4F47B88];
    v26[0] = &unk_1EF4FA790;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    if (!*((unsigned char *)v22 + 24))
    {
      LODWORD(v17) = 0;
      FigDebugAssert3();
      -[AVCapturePhotoOutput _dispatchFailureCallbacksForPhotoSettings:toDelegate:withError:](self, "_dispatchFailureCallbacksForPhotoSettings:toDelegate:withError:", settings, delegate, AVLocalizedError(), v17, v4);
    }
  }
  if (v20) {
    goto LABEL_11;
  }
LABEL_13:
  _Block_object_dispose(&v21, 8);
}

uint64_t __58__AVCapturePhotoOutput_capturePhotoWithSettings_delegate___block_invoke(uint64_t result, uint64_t a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24) = a2 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    uint64_t v3 = result;
    objc_opt_class();
    BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && *(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 16) + 144) != 0;
    dispatch_time_t v5 = +[AVCapturePhotoRequest requestWithDelegate:*(void *)(v3 + 48) settings:*(void *)(v3 + 32) lensStabilizationSupported:v4];
    MEMORY[0x1A6234330](*(void *)(*(void *)(*(void *)(v3 + 40) + 16) + 328));
    [*(id *)(*(void *)(*(void *)(v3 + 40) + 16) + 336) addObject:v5];
    ++*(_DWORD *)(*(void *)(*(void *)(v3 + 40) + 16) + 460);
    *(void *)(*(void *)(*(void *)(v3 + 40) + 16) + 464) = [*(id *)(v3 + 56) settingsID];
    if (!+[AVCapturePhotoOutputReadinessCoordinator _isOverlappingCaptureSupportedForPhotoSettings:autoDeferredPhotoDeliveryEnabled:responsiveCaptureEnabled:](AVCapturePhotoOutputReadinessCoordinator, "_isOverlappingCaptureSupportedForPhotoSettings:autoDeferredPhotoDeliveryEnabled:responsiveCaptureEnabled:", *(void *)(v3 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(v3 + 40) + 16) + 433), *(unsigned __int8 *)(*(void *)(*(void *)(v3 + 40) + 16) + 440)))*(void *)(*(void *)(*(void *)(v3 + 40) + 16) + 472) = [*(id *)(v3 + 56) settingsID]; {
    MEMORY[0x1A6234340](*(void *)(*(void *)(*(void *)(v3 + 40) + 16) + 328));
    }
    [*(id *)(v3 + 40) _updateCaptureReadiness];
    uint64_t v6 = [*(id *)(v3 + 40) sinkID];
    uint64_t v7 = *(void *)(v3 + 56);
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 96);
    if (v10)
    {
      return v10(a2, v6, v7);
    }
    else
    {
      uint64_t v11 = *MEMORY[0x1E4F516D8];
      v12[0] = &unk_1EF4FA8F8;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (NSArray)preparedPhotoSettingsArray
{
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2);
  uint64_t v3 = (void *)[(NSMutableArray *)self->_internal->prepareRequests lastObject];
  BOOL v4 = (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithArray:copyItems:", objc_msgSend(v3, "photoSettingsArray"), 1);
  MEMORY[0x1A6234340](self->_internal->requestsLock);
  return v4;
}

uint64_t __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = [*(id *)(result + 32) _figCaptureIrisPreparedSettingsForRequest:*(void *)(result + 40)];
    uint64_t v5 = [*(id *)(v2 + 32) sinkID];
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    if (*(void *)(v7 + 96))
    {
      uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 104);
      return v10(a2, v5, v4);
    }
    else
    {
      uint64_t v12 = *MEMORY[0x1E4F516D8];
      v13[0] = &unk_1EF4FA8F8;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(result + 48);
    if (v8 >= 1)
    {
      uint64_t v9 = *(void **)(result + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke_3;
      void v11[3] = &unk_1E5A72F98;
      v11[4] = v9;
      void v11[5] = v8;
      return [v9 performBlockOnSessionNotifyingThread:v11];
    }
  }
  return result;
}

uint64_t __72__AVCapturePhotoOutput_setPreparedPhotoSettingsArray_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePreparationCompleteNotificationWithPayload:0 settingsID:*(void *)(a1 + 40)];
}

- (NSArray)availablePhotoPixelFormatTypes
{
  uint64_t v2 = self->_internal->availablePhotoPixelFormatTypes;

  return v2;
}

- (NSArray)availablePhotoCodecTypes
{
  uint64_t v2 = self->_internal->availablePhotoCodecTypes;

  return v2;
}

+ (BOOL)isBayerRawPixelFormat:(unsigned int)a3
{
  return +[AVCapturePhotoOutput isBayerRAWPixelFormat:*(void *)&a3];
}

+ (BOOL)isAppleProRAWPixelFormat:(OSType)pixelFormat
{
  return pixelFormat == 1815491698;
}

+ (BOOL)isDemosaicedRawPixelFormat:(unsigned int)a3
{
  return +[AVCapturePhotoOutput isAppleProRAWPixelFormat:*(void *)&a3];
}

- (NSArray)availableRawPhotoPixelFormatTypes
{
  return [(NSDictionary *)self->_internal->availableRawPhotoPixelFormatTypes allKeys];
}

- (NSArray)availablePhotoFileTypes
{
  uint64_t v2 = self->_internal->availablePhotoFileTypes;

  return v2;
}

- (NSArray)availableRawPhotoFileTypes
{
  uint64_t v2 = self->_internal->availableRawPhotoFileTypes;

  return v2;
}

- (NSArray)availableRawPhotoCodecTypes
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (AVGestaltGetBoolAnswer(@"AVGQLBZEVZETJU77LU4MEZH4LWJ54M"))
  {
    uint64_t v7 = *MEMORY[0x1E4F47D38];
    uint64_t v8 = AVStringForOSType();
    uint64_t v2 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v3 = &v7;
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F47D38];
    uint64_t v2 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v3 = &v6;
    uint64_t v4 = 1;
  }
  return (NSArray *)objc_msgSend(v2, "arrayWithObjects:count:", v3, v4, v6, v7, v8, v9);
}

- (id)supportedRawPhotoCodecTypesForRawPhotoPixelFormatType:(unsigned int)a3 fileType:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v7[1] = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)[(AVCapturePhotoOutput *)self availableRawPhotoFileTypes] containsObject:a4])return (id)MEMORY[0x1E4F1CBF0]; {
  if (!+[AVCapturePhotoOutput isAppleProRAWPixelFormat:v4])
  }
  {
    if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:v4])
    {
      v7[0] = *MEMORY[0x1E4F47D38];
      return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    }
    return (id)MEMORY[0x1E4F1CBF0];
  }

  return [(AVCapturePhotoOutput *)self availableRawPhotoCodecTypes];
}

- (NSArray)supportedPhotoPixelFormatTypesForFileType:(AVFileType)fileType
{
  if (![(NSArray *)[(AVCapturePhotoOutput *)self availablePhotoFileTypes] containsObject:fileType]|| ![(NSString *)fileType isEqualToString:*MEMORY[0x1E4F47C10]])
  {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  return [(AVCapturePhotoOutput *)self availablePhotoPixelFormatTypes];
}

- (NSArray)supportedPhotoCodecTypesForFileType:(AVFileType)fileType
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)[(AVCapturePhotoOutput *)self availablePhotoFileTypes] containsObject:fileType])
  {
    if ([(NSString *)fileType isEqualToString:*MEMORY[0x1E4F47BF8]])
    {
      v8[0] = *MEMORY[0x1E4F47D38];
      uint64_t v4 = v8;
      return (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 1, v6, v7, v8[0]);
    }
    if ([(NSString *)fileType isEqualToString:*MEMORY[0x1E4F47BE8]])
    {
      uint64_t v7 = *MEMORY[0x1E4F47D30];
      uint64_t v4 = &v7;
      return (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 1, v6, v7, v8[0]);
    }
    if ([(NSString *)fileType isEqualToString:*MEMORY[0x1E4F47BF0]])
    {
      uint64_t v6 = *MEMORY[0x1E4F47D30];
      uint64_t v4 = &v6;
      return (NSArray *)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v4, 1, v6, v7, v8[0]);
    }
  }
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)supportedRawPhotoPixelFormatTypesForFileType:(AVFileType)fileType
{
  if (![(NSArray *)[(AVCapturePhotoOutput *)self availableRawPhotoFileTypes] containsObject:fileType])return (NSArray *)MEMORY[0x1E4F1CBF0]; {

  }
  return [(AVCapturePhotoOutput *)self availableRawPhotoPixelFormatTypes];
}

- (BOOL)isEV0PhotoDeliverySupported
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  internal = self->_internal;
  char v10 = 0;
  sceneDetectionObserversDispatchQueue = internal->sceneDetectionObserversDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__AVCapturePhotoOutput_isEV0PhotoDeliverySupported__block_invoke;
  v6[3] = &unk_1E5A74078;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __51__AVCapturePhotoOutput_isEV0PhotoDeliverySupported__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16)
                                                                            + 104);
  return result;
}

- (BOOL)isStillImageStabilizationScene
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__AVCapturePhotoOutput_isStillImageStabilizationScene__block_invoke;
  v6[3] = &unk_1E5A74190;
  v6[4] = self;
  v6[5] = &v15;
  void v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
  if (*((unsigned char *)v8 + 24))
  {
    if (*((_DWORD *)v12 + 6))
    {
      char v4 = *((unsigned char *)v16 + 24) != 0;
    }
    else
    {
      char v4 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "_isStillImageStabilizationScene");
      *((unsigned char *)v16 + 24) = v4;
    }
  }
  else
  {
    char v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v4;
}

uint64_t __54__AVCapturePhotoOutput_isStillImageStabilizationScene__block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 16) + 286);
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = *(_DWORD *)(*(void *)(a1[4] + 16) + 280);
  uint64_t result = [*(id *)(*(void *)(a1[4] + 16) + 320) isAutoStillImageStabilizationEnabled];
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (BOOL)isAutoRedEyeReductionSupported
{
  return self->_internal->autoRedEyeReductionSupported;
}

- (BOOL)isFlashScene
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__AVCapturePhotoOutput_isFlashScene__block_invoke;
  v6[3] = &unk_1E5A74190;
  v6[4] = self;
  v6[5] = &v15;
  void v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(sceneDetectionObserversDispatchQueue, v6);
  if (v8[3])
  {
    if (*((_DWORD *)v12 + 6))
    {
      char v4 = *((unsigned char *)v16 + 24) != 0;
    }
    else
    {
      char v4 = objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "_isFlashScene");
      *((unsigned char *)v16 + 24) = v4;
    }
  }
  else
  {
    char v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v4;
}

uint64_t __36__AVCapturePhotoOutput_isFlashScene__block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(*(void *)(a1[4] + 16) + 284);
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = *(_DWORD *)(*(void *)(a1[4] + 16) + 272);
  uint64_t result = [*(id *)(*(void *)(a1[4] + 16) + 320) flashMode];
  *(void *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

- (BOOL)isVirtualDeviceFusionSupported
{
  return self->_internal->virtualDeviceFusionSupported;
}

- (BOOL)isDualCameraFusionSupported
{
  return self->_internal->virtualDeviceFusionSupported;
}

- (BOOL)isVirtualDeviceConstituentPhotoDeliverySupported
{
  return self->_internal->virtualDeviceConstituentPhotoDeliverySupported;
}

- (BOOL)isDualCameraDualPhotoDeliverySupported
{
  return self->_internal->dualCameraDualPhotoDeliverySupported;
}

- (void)setVirtualDeviceConstituentPhotoDeliveryEnabled:(BOOL)virtualDeviceConstituentPhotoDeliveryEnabled
{
  BOOL v3 = virtualDeviceConstituentPhotoDeliveryEnabled;
  if (virtualDeviceConstituentPhotoDeliveryEnabled
    && ![(AVCapturePhotoOutput *)self isVirtualDeviceConstituentPhotoDeliverySupported])
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
  else
  {
    internal = self->_internal;
    if (internal->virtualDeviceConstituentPhotoDeliveryEnabled != v3)
    {
      if (internal->dualCameraDualPhotoDeliverySupported)
      {
        [(AVCapturePhotoOutput *)self willChangeValueForKey:@"dualCameraDualPhotoDeliveryEnabled"];
        internal = self->_internal;
      }
      internal->virtualDeviceConstituentPhotoDeliveryEnabled = v3;
      uint64_t v6 = self->_internal;
      if (v6->dualCameraDualPhotoDeliverySupported) {
        v6->dualCameraDualPhotoDeliveryEnabled = v3;
      }
      id v7 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice];
      [(AVCapturePhotoOutput *)self _updateCameraCalibrationDataDeliverySupportedForSourceDevice:v7];
      if (self->_internal->dualCameraDualPhotoDeliverySupported) {
        [(AVCapturePhotoOutput *)self didChangeValueForKey:@"dualCameraDualPhotoDeliveryEnabled"];
      }
      [(AVCapturePhotoOutput *)self _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:v7];
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isDualCameraDualPhotoDeliveryEnabled
{
  return self->_internal->dualCameraDualPhotoDeliveryEnabled;
}

- (void)setDualCameraDualPhotoDeliveryEnabled:(BOOL)dualCameraDualPhotoDeliveryEnabled
{
  BOOL v3 = dualCameraDualPhotoDeliveryEnabled;
  if (dualCameraDualPhotoDeliveryEnabled
    && ![(AVCapturePhotoOutput *)self isDualCameraDualPhotoDeliverySupported])
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
  else if (self->_internal->dualCameraDualPhotoDeliveryEnabled != v3)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"virtualDeviceConstituentPhotoDeliveryEnabled"];
    self->_internal->dualCameraDualPhotoDeliveryEnabled = v3;
    self->_internal->virtualDeviceConstituentPhotoDeliveryEnabled = v3;
    [(AVCapturePhotoOutput *)self _updateCameraCalibrationDataDeliverySupportedForSourceDevice:[(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice]];
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"virtualDeviceConstituentPhotoDeliveryEnabled"];
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (BOOL)isCameraCalibrationDataDeliverySupported
{
  return self->_internal->cameraCalibrationDataDeliverySupported;
}

- (BOOL)isFocusPixelBlurScoreSupported
{
  return self->_internal->focusPixelFocusBlurScoreSupported;
}

- (void)setFocusPixelBlurScoreEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3 && !internal->focusPixelFocusBlurScoreSupported)
  {
    char v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (internal->focusPixelFocusBlurScoreEnabled != a3)
  {
    internal->focusPixelFocusBlurScoreEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (BOOL)arePrivatePhotoDimensionsEnabled
{
  return self->_internal->privatePhotoDimensionsEnabled;
}

- (BOOL)isHighResolutionCaptureEnabled
{
  return self->_internal->highResolutionCaptureEnabled;
}

- (NSUInteger)maxBracketedCapturePhotoCount
{
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2);
  internal = self->_internal;
  NSUInteger maxBracketedCapturePhotoCount = internal->maxBracketedCapturePhotoCount;
  MEMORY[0x1A6234340](internal->requestsLock);
  return maxBracketedCapturePhotoCount;
}

- (BOOL)isLensStabilizationDuringBracketedCaptureSupported
{
  return self->_internal->lensStabilizationDuringBracketedCaptureSupported;
}

uint64_t __53__AVCapturePhotoOutput_setLivePhotoCaptureSuspended___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v5, HostTimeClock);
  return [v1 setFigCaptureSessionSectionProperty:v2 withHostTime:&v5];
}

- (void)setLivePhotoAutoTrimmingEnabled:(BOOL)livePhotoAutoTrimmingEnabled
{
  internal = self->_internal;
  if (internal->livePhotoCaptureSupported || !livePhotoAutoTrimmingEnabled)
  {
    if (internal->livePhotoAutoTrimmingEnabled != livePhotoAutoTrimmingEnabled)
    {
      internal->livePhotoAutoTrimmingEnabled = livePhotoAutoTrimmingEnabled;
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
  else
  {
    CMTime v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (NSArray)availableLivePhotoVideoCodecTypes
{
  uint64_t v2 = self->_internal->availableLivePhotoVideoCodecTypes;

  return v2;
}

- (BOOL)isLivePhotoMovieProcessingSuspended
{
  return self->_internal->livePhotoMovieProcessingSuspended;
}

- (void)setLivePhotoMovieProcessingSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && ![(AVCapturePhotoOutput *)self isLivePhotoCaptureEnabled])
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->livePhotoMovieProcessingSuspended != v3)
    {
      internal->livePhotoMovieProcessingSuspended = v3;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      void v7[2] = __61__AVCapturePhotoOutput_setLivePhotoMovieProcessingSuspended___block_invoke;
      v7[3] = &unk_1E5A73168;
      v7[4] = self;
      BOOL v8 = v3;
      [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v7];
    }
  }
}

void *__61__AVCapturePhotoOutput_setLivePhotoMovieProcessingSuspended___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a1 + 32);
  if (!a2) {
    goto LABEL_8;
  }
  uint64_t v5 = [result sinkID];
  uint64_t v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(v8 + 8);
  if (!v9 || (uint64_t result = (void *)v9(a2, v5, *MEMORY[0x1E4F51640], v6), result))
  {
    uint64_t result = *(void **)(a1 + 32);
LABEL_8:
    *(unsigned char *)(result[2] + 257) = 0;
  }
  return result;
}

+ (NSData)JPEGPhotoDataRepresentationForJPEGSampleBuffer:(CMSampleBufferRef)JPEGSampleBuffer previewPhotoSampleBuffer:(CMSampleBufferRef)previewPhotoSampleBuffer
{
  CMBlockBufferRef blockBufferOut = 0;
  if (!JPEGSampleBuffer)
  {
    EXIFJPEGData = 0;
LABEL_17:
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v16);
    }
    NSLog(&cfstr_SuppressingExc.isa, v16);
    return EXIFJPEGData;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(JPEGSampleBuffer);
  if (CMFormatDescriptionGetMediaSubType(FormatDescription) == 1785750887)
  {
    DataBuffer = CMSampleBufferGetDataBuffer(JPEGSampleBuffer);
    if (DataBuffer)
    {
      CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (CMBlockBufferCreateContiguous((CFAllocatorRef)*MEMORY[0x1E4F1CF80], DataBuffer, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, 0, 0, &blockBufferOut)|| (size_t totalLengthOut = 0, dataPointerOut = 0, CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, &totalLengthOut, &dataPointerOut)))
      {
        EXIFJPEGData = 0;
        PreviewJPEGRepresentationForSampleBuffer = 0;
      }
      else
      {
        CFDataRef v10 = CFDataCreateWithBytesNoCopy(v9, (const UInt8 *)dataPointerOut, totalLengthOut, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
        uint64_t v11 = (const void *)[a1 _copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:JPEGSampleBuffer];
        if (previewPhotoSampleBuffer) {
          PreviewJPEGRepresentationForSampleBuffer = (void *)po_createPreviewJPEGRepresentationForSampleBuffer((uint64_t)previewPhotoSampleBuffer, (uint64_t)&unk_1EF4FA7D8);
        }
        else {
          PreviewJPEGRepresentationForSampleBuffer = 0;
        }
        EXIFJPEGData = (NSData *)CGImageCreateEXIFJPEGData();
        int v14 = EXIFJPEGData;
        if (v11) {
          CFRelease(v11);
        }
        if (v10) {
          CFRelease(v10);
        }
      }
      char v15 = 1;
    }
    else
    {
      EXIFJPEGData = 0;
      char v15 = 0;
      PreviewJPEGRepresentationForSampleBuffer = 0;
    }
  }
  else
  {
    EXIFJPEGData = 0;
    char v15 = 0;
    PreviewJPEGRepresentationForSampleBuffer = 0;
  }
  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }

  if ((v15 & 1) == 0) {
    goto LABEL_17;
  }
  return EXIFJPEGData;
}

+ (NSData)DNGPhotoDataRepresentationForRawSampleBuffer:(CMSampleBufferRef)rawSampleBuffer previewPhotoSampleBuffer:(CMSampleBufferRef)previewPhotoSampleBuffer
{
  if (rawSampleBuffer)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(rawSampleBuffer);
    if (objc_msgSend(&unk_1EF4FAB30, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", CMFormatDescriptionGetMediaSubType(FormatDescription))))
    {
      if (CMSampleBufferGetImageBuffer(rawSampleBuffer))
      {
        if (previewPhotoSampleBuffer) {
          PreviewJPEGRepresentationForSampleBuffer = (void *)po_createPreviewJPEGRepresentationForSampleBuffer((uint64_t)previewPhotoSampleBuffer, 0);
        }
        else {
          PreviewJPEGRepresentationForSampleBuffer = 0;
        }
        CFAllocatorRef v9 = (const void *)[a1 _copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:rawSampleBuffer];
        CMPhotoDNGCreateDNGFromRAWPixelBuffer();
        if (v9) {
          CFRelease(v9);
        }

        return (NSData *)0;
      }
    }
    else if (![NSString stringWithFormat:@"Unrecognized raw format %@", AVStringForOSType()])
    {
      return (NSData *)0;
    }
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v11);
  }
  NSLog(&cfstr_SuppressingExc.isa, v11);
  return 0;
}

- (BOOL)isZeroShutterLagSupported
{
  return self->_internal->zeroShutterLagSupported;
}

- (void)setZeroShutterLagEnabled:(BOOL)zeroShutterLagEnabled
{
  BOOL v3 = zeroShutterLagEnabled;
  if (zeroShutterLagEnabled && ![(AVCapturePhotoOutput *)self isZeroShutterLagSupported])
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    self->_internal->zeroShutterLagAutomaticallyEnabled = 0;
    internal = self->_internal;
    if (internal->zeroShutterLagEnabled != v3)
    {
      internal->int zeroShutterLagEnabled = v3;
      [(AVCapturePhotoOutput *)self _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:[(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice]];
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (void)setUltraHighResolutionZeroShutterLagSupportEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ![(AVCapturePhotoOutput *)self isUltraHighResolutionZeroShutterLagSupported])
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->ultraHighResolutionZeroShutterLagSupportEnabled != v3)
    {
      internal->ultraHighResolutionZeroShutterLagSupportEnabled = v3;
      [(AVCapturePhotoOutput *)self _updateZeroShutterLagResponsiveCaptureAndFastCapturePrioritizationSupportedForDevice:[(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice]];
      [(AVCaptureOutput *)self bumpChangeSeed];
    }
  }
}

- (BOOL)isUltraHighResolutionZeroShutterLagEnabled
{
  return self->_internal->ultraHighResolutionZeroShutterLagEnabled;
}

- (void)setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ![(AVCapturePhotoOutput *)self isUltraHighResolutionZeroShutterLagSupportEnabled])
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
  else
  {
    [(AVCapturePhotoOutput *)self _setUltraHighResolutionZeroShutterLagEnabled:v3];
  }
}

- (void)_setUltraHighResolutionZeroShutterLagEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (internal->ultraHighResolutionZeroShutterLagEnabled != a3)
  {
    BOOL v4 = a3;
    internal->ultraHighResolutionZeroShutterLagEnabled = a3;
    id v5 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice];
    [v5 setUltraHighResolutionZeroShutterLagEnabled:v4];
  }
}

- (AVCapturePhotoOutputCaptureReadiness)captureReadiness
{
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2);
  internal = self->_internal;
  AVCapturePhotoOutputCaptureReadiness captureReadiness = internal->captureReadiness;
  MEMORY[0x1A6234340](internal->requestsLock);
  return captureReadiness;
}

- (void)_updateCaptureReadinessStateForCompletedRequest:(id)a3
{
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2);
  --self->_internal->readinessState.numberOfPhotoCapturesInflight;
  internal = self->_internal;
  if (internal->readinessState.inflightNonOverlappingCaptureUniqueID)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "resolvedSettings"), "uniqueID");
    internal = self->_internal;
    if (v6 >= internal->readinessState.inflightNonOverlappingCaptureUniqueID)
    {
      internal->readinessState.inflightNonOverlappingCaptureUniqueID = 0;
      internal = self->_internal;
    }
  }
  if (internal->readinessState.inflightUniqueIDWaitingForCapture)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "resolvedSettings"), "uniqueID");
    internal = self->_internal;
    if (v7 >= internal->readinessState.inflightUniqueIDWaitingForCapture)
    {
      internal->readinessState.inflightUniqueIDWaitingForCapture = 0;
      internal = self->_internal;
    }
  }
  if (internal->readinessState.inflightUniqueIDWaitingForProcessing)
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "resolvedSettings"), "uniqueID");
    internal = self->_internal;
    if (v8 >= internal->readinessState.inflightUniqueIDWaitingForProcessing)
    {
      internal->readinessState.inflightUniqueIDWaitingForProcessing = 0;
      internal = self->_internal;
    }
  }
  MEMORY[0x1A6234340](internal->requestsLock);

  [(AVCapturePhotoOutput *)self _updateCaptureReadiness];
}

- (BOOL)_requestUsesWaitingForCaptureReadiness:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = (void *)[a3 unresolvedSettings];
  id v5 = (void *)[a3 resolvedSettings];
  if ([v4 digitalFlashMode] > 0) {
    return 1;
  }

  return [v5 isFlashEnabled];
}

- (BOOL)_requestUsesWaitingForProcessingReadiness:(id)a3
{
  if (a3)
  {
    BOOL v4 = (void *)[a3 unresolvedSettings];
    if ([v4 digitalFlashMode] <= 0
      && (int v5 = [v4 maxPhotoDimensions],
          (int)(((unint64_t)[v4 maxPhotoDimensions] >> 32) * v5) <= 47999999)
      && ((internal = self->_internal, internal->autoDeferredPhotoDeliveryEnabled)
       || internal->responsiveCaptureEnabled
       || [v4 photoQualityPrioritization] != 3))
    {
      int v6 = [(AVCapturePhotoOutput *)self isFilterRenderingEnabled];
      if (v6)
      {
        LOBYTE(v6) = [v4 isDepthDataDeliveryEnabled];
      }
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_addReadinessCoordinator:(id)a3
{
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2);
  [(NSMutableArray *)self->_internal->readinessCoordinators addObject:a3];
  internal = self->_internal;
  long long v6 = *(_OWORD *)&internal->readinessState.inflightNonOverlappingCaptureUniqueID;
  v7[0] = *(_OWORD *)&internal->readinessState.sessionIsRunning;
  v7[1] = v6;
  int64_t inflightUniqueIDWaitingForProcessing = internal->readinessState.inflightUniqueIDWaitingForProcessing;
  [a3 _photoOutputDidUpdateCaptureReadinessState:v7];
  MEMORY[0x1A6234340](self->_internal->requestsLock);
}

- (void)_removeReadinessCoordinator:(id)a3
{
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2);
  [(NSMutableArray *)self->_internal->readinessCoordinators removeObjectIdenticalTo:a3];

  JUMPOUT(0x1A6234340);
}

- (void)setOptimizesImagesForOfflineVideoStabilization:(BOOL)a3
{
  internal = self->_internal;
  if (!a3)
  {
    if (!internal->optimizesImagesForOfflineVideoStabilization) {
      return;
    }
    internal->optimizesImagesForOfflineVideoStabilization = 0;
    goto LABEL_7;
  }
  if (internal->imageOptimizationForOfflineVideoStabilizationSupported)
  {
    if (internal->optimizesImagesForOfflineVideoStabilization == a3) {
      return;
    }
    internal->optimizesImagesForOfflineVideoStabilization = a3;
    [(AVCapturePhotoOutput *)self optimizedImageDimensionsForOfflineStabilization];
    CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68]), "sourceDevice"), "activeFormat"), "formatDescription"));
LABEL_7:
    [(AVCaptureOutput *)self bumpChangeSeed];
    return;
  }
  int v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v5);
  }
  NSLog(&cfstr_SuppressingExc.isa, v5);
}

- ($2825F4736939C4A6D3AD43837233062D)optimizedImageDimensionsForOfflineStabilization
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_internal->optimizedImageDimensionsForOfflineStabilization;
}

- (float)timeLapseCaptureRate
{
  return self->_internal->timeLapseCaptureRate;
}

- (void)setTimeLapseCaptureRate:(float)a3
{
  internal = self->_internal;
  float timeLapseCaptureRate = internal->timeLapseCaptureRate;
  if (timeLapseCaptureRate != a3
    || (timeLapseCaptureRate == 2.0 ? (BOOL v5 = !internal->timeLapseCaptureRateNeedsUpdate) : (BOOL v5 = 1), !v5))
  {
    internal->float timeLapseCaptureRate = a3;
    self->_internal->timeLapseCaptureRateNeedsUpdate = 1;
    [(AVCapturePhotoOutput *)self _updateTimeLapseCaptureRate];
  }
}

- (void)_updateTimeLapseCaptureRate
{
  if (self->_internal->timeLapseCaptureRateNeedsUpdate)
  {
    id v3 = [(AVCaptureConnection *)[(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]] sourceDevice];
    if (v3)
    {
      *(float *)&double v4 = self->_internal->timeLapseCaptureRate;
      [v3 setTimeLapseCaptureRate:v4];
      self->_internal->timeLapseCaptureRateNeedsUpdate = 0;
    }
  }
}

- (void)_resetTimeLapseCaptureRate
{
  self->_internal->timeLapseCaptureRateNeedsUpdate = 1;
  if (self->_internal->timeLapseCaptureRate != 2.0)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"timeLapseCaptureRate"];
    self->_internal->float timeLapseCaptureRate = 2.0;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"timeLapseCaptureRate"];
  }
}

- (void)userInitiatedCaptureRequestAtTime:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__AVCapturePhotoOutput_userInitiatedCaptureRequestAtTime___block_invoke;
  v3[3] = &unk_1E5A73380;
  v3[4] = self;
  v3[5] = a3;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v3];
}

uint64_t __58__AVCapturePhotoOutput_userInitiatedCaptureRequestAtTime___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(v3 + 40)];
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 16);
    uint64_t result = VTable + 16;
    uint64_t v7 = v8;
    uint64_t v9 = v8 ? v7 : 0;
    CFDataRef v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8);
    if (v10)
    {
      uint64_t v11 = *MEMORY[0x1E4F51650];
      return v10(a2, v4, v11, v5);
    }
  }
  return result;
}

- (BOOL)isSpatialOverCaptureSupported
{
  return self->_internal->spatialOverCaptureSupported;
}

- (void)beginMomentCaptureWithSettings:(id)a3
{
}

- (void)beginMomentCaptureWithSettings:(id)a3 delegate:(id)a4
{
  uint64_t v17 = 0;
  if (!self->_internal->movieRecordingEnabled)
  {
    char v15 = @"movieRecordingEnabled must be YES in order to begin moment capture";
LABEL_29:
    uint64_t v17 = v15;
LABEL_19:
    int v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
    return;
  }
  if (!a3)
  {
    char v15 = @"Nil momentCaptureSettings";
    goto LABEL_29;
  }
  if ([a3 uniqueID] <= self->_internal->lastMomentSettingsUniqueID)
  {
    char v15 = @"momentCaptureSettings may not be re-used";
    goto LABEL_29;
  }
  uint64_t v7 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
  if ([a3 torchMode]
    && (objc_msgSend(-[AVCaptureConnection sourceDevice](v7, "sourceDevice"), "isTorchModeSupported:", objc_msgSend(a3, "torchMode")) & 1) == 0)
  {
    char v15 = @"torchMode is unsupported in this configuration";
    goto LABEL_29;
  }
  int v8 = [a3 isAutoSpatialOverCaptureEnabled];
  internal = self->_internal;
  if (v8 && !internal->spatialOverCaptureEnabled)
  {
    char v15 = @"spatialOverCaptureEnabled must be YES on the AVCapturePhotoOutput in order to begin a moment capture with autoSpatialOverCaptureEnabled set to YES";
    goto LABEL_29;
  }
  if (internal->momentCaptureInFlight)
  {
    char v15 = @"Can't begin a new moment capture when you've already got a moment capture in flight";
    goto LABEL_29;
  }
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", v7) & 1) == 0)
  {
    char v15 = @"No active and enabled video connection";
    goto LABEL_29;
  }
  if (![a3 photoSettings]
    || po_photoSettingsAreValid((void *)[a3 photoSettings], (uint64_t)a4, self, v7, &v17))
  {
    self->_internal->momentCaptureInFlight = (AVMomentCaptureSettings *)[a3 copy];
    self->_internal->momentPhotoCaptureDelegateInFlight = (AVCapturePhotoCaptureDelegate *)a4;
    self->_internal->momentCaptureRequestIdentifierInFlight = (NSString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), "copy");
    self->_internal->lastMomentSettingsUniqueID = [a3 uniqueID];
    if ([a3 photoSettings])
    {
      id v10 = -[AVCapturePhotoOutput _figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:](self, "_figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:captureRequestIdentifier:delegate:connections:", [a3 photoSettings], self->_internal->momentCaptureRequestIdentifierInFlight, a4, -[AVCaptureOutput connections](self, "connections"));
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F50FD8]) initWithStillImageSettings:v10];
    }
    else
    {
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F50FD8]), "initWithSettingsID:captureRequestIdentifier:userInitiatedCaptureTime:", objc_msgSend(a3, "uniqueID"), self->_internal->momentCaptureRequestIdentifierInFlight, objc_msgSend(a3, "userInitiatedCaptureTime"));
      objc_msgSend(v11, "setFlashMode:", objc_msgSend(a3, "flashMode"));
      objc_msgSend(v11, "setAutoRedEyeReductionEnabled:", objc_msgSend(a3, "isAutoRedEyeReductionEnabled"));
      objc_msgSend(v11, "setDigitalFlashMode:", objc_msgSend(a3, "digitalFlashMode"));
      uint64_t v12 = [a3 photoQualityPrioritization];
      int64_t maxPhotoQualityPrioritization = self->_internal->maxPhotoQualityPrioritization;
      if (v12 < maxPhotoQualityPrioritization) {
        int64_t maxPhotoQualityPrioritization = [a3 photoQualityPrioritization];
      }
      [v11 setQualityPrioritization:maxPhotoQualityPrioritization];
      objc_msgSend(v11, "setClientQualityPrioritization:", objc_msgSend(a3, "photoQualityPrioritization"));
      objc_msgSend(v11, "setHDRMode:", objc_msgSend(a3, "HDRMode"));
      objc_msgSend(v11, "setAutoOriginalPhotoDeliveryEnabled:", objc_msgSend(a3, "isAutoOriginalPhotoDeliveryEnabled"));
      objc_msgSend(v11, "setAutoSpatialOverCaptureEnabled:", objc_msgSend(a3, "isAutoSpatialOverCaptureEnabled"));
      objc_msgSend(v11, "setAutoDeferredProcessingEnabled:", -[AVCapturePhotoOutput isAutoDeferredPhotoDeliveryEnabled](self, "isAutoDeferredPhotoDeliveryEnabled"));
      objc_msgSend(v11, "setRawOutputFormat:", -[AVCapturePhotoOutput _internalRawFormatFromRawFormat:](self, "_internalRawFormatFromRawFormat:", objc_msgSend(a3, "rawOutputFormat")));
      objc_msgSend(v11, "setOutputWidth:", objc_msgSend(a3, "maxPhotoDimensions"));
      objc_msgSend(v11, "setOutputHeight:", (unint64_t)objc_msgSend(a3, "maxPhotoDimensions") >> 32);
      objc_msgSend(v11, "setDepthDataDeliveryEnabled:", objc_msgSend(a3, "isDepthDataDeliveryEnabled"));
    }
    objc_msgSend(v11, "setTorchMode:", objc_msgSend(a3, "torchMode"));
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__AVCapturePhotoOutput_beginMomentCaptureWithSettings_delegate___block_invoke;
    void v16[3] = &unk_1E5A731B8;
    v16[4] = self;
    v16[5] = v11;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v16];
  }
  if (v17) {
    goto LABEL_19;
  }
}

uint64_t __64__AVCapturePhotoOutput_beginMomentCaptureWithSettings_delegate___block_invoke(uint64_t result, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 112);
    if (v8)
    {
      return v8(a2, v4, v5);
    }
    else
    {
      uint64_t v9 = *MEMORY[0x1E4F516D8];
      v10[0] = &unk_1EF4FA8F8;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)commitMomentCaptureToPhotoWithUniqueID:(int64_t)a3
{
  internal = self->_internal;
  momentCaptureInFlight = internal->momentCaptureInFlight;
  if (momentCaptureInFlight && internal->momentPhotoCaptureDelegateInFlight)
  {
    [(AVCapturePhotoOutput *)self commitMomentCaptureWithUniqueID:a3 toPhotoCaptureWithSettings:[(AVMomentCaptureSettings *)momentCaptureInFlight photoSettings] delegate:self->_internal->momentPhotoCaptureDelegateInFlight];

    self->_internal->momentPhotoCaptureDelegateInFlight = 0;
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)commitMomentCaptureWithUniqueID:(int64_t)a3 toPhotoCaptureWithSettings:(id)a4 delegate:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v28 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  if (!a4)
  {
    uint64_t v20 = @"Nil photoSettings";
LABEL_24:
    id v28 = v20;
LABEL_13:
    uint64_t v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v17);
    }
    NSLog(&cfstr_SuppressingExc.isa, v17);
    goto LABEL_15;
  }
  if (!a5)
  {
    uint64_t v20 = @"Nil delegate";
    goto LABEL_24;
  }
  internal = self->_internal;
  if (!internal->momentCaptureInFlight)
  {
    uint64_t v20 = @"You must call beginMomentCaptureWithSettings: first";
    goto LABEL_24;
  }
  int64_t lastMomentSettingsUniqueID = internal->lastMomentSettingsUniqueID;
  if (lastMomentSettingsUniqueID != objc_msgSend(a4, "uniqueID", a3))
  {
    uint64_t v20 = @"MomentCapture and PhotoSettings uniqueID mismatch";
    goto LABEL_24;
  }
  uint64_t v11 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", v11) & 1) == 0)
  {
    uint64_t v20 = @"No active and enabled video connection";
    goto LABEL_24;
  }

  self->_internal->momentCaptureInFlight = 0;
  uint64_t v12 = self->_internal->momentCaptureRequestIdentifierInFlight;
  self->_internal->momentCaptureRequestIdentifierInFlight = 0;
  if (!self->_internal->optimizesImagesForOfflineVideoStabilization)
  {
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    int v19 = CTGreenTeaOsLogHandle;
    if (CTGreenTeaOsLogHandle)
    {
      if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A152C000, v19, OS_LOG_TYPE_INFO, "Take a photo", buf, 2u);
      }
    }
  }
  id v13 = (id)[a4 copy];
  if (po_photoSettingsAreValid(v13, (uint64_t)a5, self, v11, &v28))
  {
    if (sIsForcedShutterSoundRegion)
    {
      beginEndIrisMovieCaptureHostTimeDispatchGroup = self->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
      dispatch_time_t v15 = dispatch_time(0, 2000000000);
      dispatch_group_wait(beginEndIrisMovieCaptureHostTimeDispatchGroup, v15);
    }
    self->_internal->lastSettingsUniqueID = [v13 uniqueID];
    id v16 = [(AVCapturePhotoOutput *)self _figCaptureIrisStillImageSettingsForAVCapturePhotoSettings:v13 captureRequestIdentifier:v12 delegate:a5 connections:[(AVCaptureOutput *)self connections]];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __92__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toPhotoCaptureWithSettings_delegate___block_invoke;
    v22[3] = &unk_1E5A79D70;
    v22[7] = v16;
    v22[8] = &v24;
    v22[4] = v13;
    v22[5] = self;
    v22[6] = a5;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v22];
    uint64_t v29 = *MEMORY[0x1E4F47B88];
    v30[0] = &unk_1EF4FA790;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    if (!*((unsigned char *)v25 + 24))
    {
      LODWORD(v21) = 0;
      FigDebugAssert3();
      -[AVCapturePhotoOutput _dispatchFailureCallbacksForPhotoSettings:toDelegate:withError:](self, "_dispatchFailureCallbacksForPhotoSettings:toDelegate:withError:", a4, a5, AVLocalizedError(), v21, v5);
    }
  }
  if (v28) {
    goto LABEL_13;
  }
LABEL_15:
  _Block_object_dispose(&v24, 8);
}

uint64_t __92__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toPhotoCaptureWithSettings_delegate___block_invoke(uint64_t result, uint64_t a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24) = a2 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    uint64_t v3 = result;
    objc_opt_class();
    BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && *(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 16) + 144) != 0;
    uint64_t v5 = +[AVCapturePhotoRequest requestWithDelegate:*(void *)(v3 + 48) settings:*(void *)(v3 + 32) lensStabilizationSupported:v4];
    MEMORY[0x1A6234330](*(void *)(*(void *)(*(void *)(v3 + 40) + 16) + 328));
    [*(id *)(*(void *)(*(void *)(v3 + 40) + 16) + 336) addObject:v5];
    MEMORY[0x1A6234340](*(void *)(*(void *)(*(void *)(v3 + 40) + 16) + 328));
    uint64_t v6 = [*(id *)(v3 + 40) sinkID];
    uint64_t v7 = *(void *)(v3 + 56);
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 120);
    if (v10)
    {
      return v10(a2, v6, v7);
    }
    else
    {
      uint64_t v11 = *MEMORY[0x1E4F516D8];
      v12[0] = &unk_1EF4FA8F8;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)commitMomentCaptureWithUniqueID:(int64_t)a3 toMovieRecordingWithSettings:(id)a4 delegate:(id)a5
{
  v37[1] = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  if (!a4) {
    goto LABEL_28;
  }
  if (!a5) {
    goto LABEL_28;
  }
  internal = self->_internal;
  if (!internal->momentCaptureInFlight) {
    goto LABEL_28;
  }
  int64_t lastMomentSettingsUniqueID = internal->lastMomentSettingsUniqueID;
  if (lastMomentSettingsUniqueID != objc_msgSend(a4, "uniqueID", a3)) {
    goto LABEL_28;
  }
  uint64_t v11 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C68]];
  if (!objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", v11)) {
    goto LABEL_28;
  }
  CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
  id v13 = CTGreenTeaOsLogHandle;
  if (CTGreenTeaOsLogHandle && os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A152C000, v13, OS_LOG_TYPE_INFO, "Record a video", buf, 2u);
  }
  if ((id v14 = (id)[a4 copy], (v15 = v14) != 0)
    && ((id v16 = self->_internal) == 0
     || [v14 uniqueID] == v16->lastMomentSettingsUniqueID
     && -[NSArray containsObject:](v16->availableLivePhotoVideoCodecTypes, "containsObject:", [v15 videoCodecType]))&& objc_msgSend(v15, "movieFileURL")&& objc_msgSend((id)objc_msgSend(v15, "movieFileURL"), "isFileURL")&& ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)&& (!objc_msgSend(v15, "isAutoSpatialOverCaptureEnabled")|| (!v11|| objc_msgSend(-[AVCaptureConnection sourceDevice](v11, "sourceDevice"), "isSpatialOverCaptureEnabled"))&& objc_msgSend(v15, "spatialOverCaptureMovieFileURL")&& objc_msgSend((id)objc_msgSend(v15, "spatialOverCaptureMovieFileURL"), "isFileURL")))
  {
    if (sIsForcedShutterSoundRegion)
    {
      beginEndIrisMovieCaptureHostTimeDispatchGroup = self->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
      dispatch_time_t v18 = dispatch_time(0, 2000000000);
      dispatch_group_wait(beginEndIrisMovieCaptureHostTimeDispatchGroup, v18);
      beginEndIrisMovieCaptureHostTimeQueue = self->_internal->beginEndIrisMovieCaptureHostTimeQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke;
      block[3] = &unk_1E5A73EF0;
      block[4] = self;
      block[5] = &v28;
      dispatch_sync(beginEndIrisMovieCaptureHostTimeQueue, block);
      uint64_t v20 = self->_internal->beginEndIrisMovieCaptureHostTimeDispatchGroup;
      dispatch_time_t v21 = dispatch_time(0, 2000000000);
      if (dispatch_group_wait(v20, v21)) {
        v29[3] = mach_absolute_time();
      }
    }
    self->_internal->lastSettingsUniqueID = [v15 uniqueID];
    uint64_t v22 = self->_internal->momentCaptureInFlight;
    self->_internal->momentCaptureInFlight = 0;

    self->_internal->momentPhotoCaptureDelegateInFlight = 0;
    self->_internal->momentCaptureRequestIdentifierInFlight = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke_3;
    v25[3] = &unk_1E5A79DE8;
    v25[4] = self;
    v25[5] = v15;
    v25[6] = v22;
    v25[7] = a5;
    v25[8] = &v32;
    v25[9] = &v28;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v25];
    uint64_t v36 = *MEMORY[0x1E4F47B88];
    v37[0] = &unk_1EF4FA790;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
    if (!*((unsigned char *)v33 + 24))
    {
      LODWORD(v24) = 0;
      FigDebugAssert3();
      -[AVCapturePhotoOutput _dispatchFailureCallbacksForMovieRecordingSettings:momentCaptureSettings:toDelegate:withError:](self, "_dispatchFailureCallbacksForMovieRecordingSettings:momentCaptureSettings:toDelegate:withError:", a4, v22, a5, AVLocalizedError(), v24, v5);
    }
  }
  else
  {
LABEL_28:
    uint64_t v23 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v23);
    }
    NSLog(&cfstr_SuppressingExc.isa, v23);
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
}

void __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 32) + 16) + 368));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F51638];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v7, HostTimeClock);
  [v2 setFigCaptureSessionSectionProperty:v3 withHostTime:&v7];
  inCompletionBlock[0] = MEMORY[0x1E4F143A8];
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke_2;
  inCompletionBlock[3] = &unk_1E5A73EF0;
  long long v6 = *(_OWORD *)(a1 + 32);
  AudioServicesPlaySystemSoundWithCompletion(0x45Du, inCompletionBlock);
}

void __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F51630];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v5, HostTimeClock);
  [v2 setFigCaptureSessionSectionProperty:v3 withHostTime:&v5];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = mach_absolute_time();
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 32) + 16) + 368));
}

uint64_t __94__AVCapturePhotoOutput_commitMomentCaptureWithUniqueID_toMovieRecordingWithSettings_delegate___block_invoke_3(uint64_t result, uint64_t a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24) = a2 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    uint64_t v3 = result;
    BOOL v4 = objc_msgSend(*(id *)(result + 32), "_figCaptureMovieFileRecordingSettingsForAVMomentCaptureMovieRecordingSettings:momentCaptureSettings:delegate:connections:", *(void *)(result + 40), *(void *)(result + 48), *(void *)(result + 56), objc_msgSend(*(id *)(result + 32), "connections"));
    CMTime v5 = v4;
    if (*(void *)(*(void *)(*(void *)(v3 + 72) + 8) + 24)) {
      objc_msgSend(v4, "setMovieStartTimeOverride:");
    }
    long long v6 = +[AVMomentCaptureMovieRequest requestWithDelegate:*(void *)(v3 + 56) movieRecordingSettings:*(void *)(v3 + 40) momentSettings:*(void *)(v3 + 48)];
    MEMORY[0x1A6234330](*(void *)(*(void *)(*(void *)(v3 + 32) + 16) + 328));
    [*(id *)(*(void *)(*(void *)(v3 + 32) + 16) + 352) addObject:v6];
    MEMORY[0x1A6234340](*(void *)(*(void *)(*(void *)(v3 + 32) + 16) + 328));
    uint64_t v7 = [*(id *)(v3 + 32) sinkID];
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = *(uint64_t (**)(uint64_t, uint64_t, void *))(v9 + 128);
    if (v10)
    {
      return v10(a2, v7, v5);
    }
    else
    {
      uint64_t v11 = *MEMORY[0x1E4F516D8];
      v12[0] = &unk_1EF4FA8F8;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)cancelMomentCaptureWithUniqueID:(int64_t)a3
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  char v10 = 0;
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68])) & 1) != 0&& (internal = self->_internal, internal->lastMomentSettingsUniqueID == a3)&& (momentCaptureInFlight = internal->momentCaptureInFlight) != 0)
  {

    self->_internal->momentCaptureInFlight = 0;
    self->_internal->momentPhotoCaptureDelegateInFlight = 0;

    self->_internal->momentCaptureRequestIdentifierInFlight = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __56__AVCapturePhotoOutput_cancelMomentCaptureWithUniqueID___block_invoke;
    v8[3] = &unk_1E5A72FC0;
    v8[4] = self;
    void v8[5] = v9;
    v8[6] = a3;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v8];
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
  _Block_object_dispose(v9, 8);
}

uint64_t __56__AVCapturePhotoOutput_cancelMomentCaptureWithUniqueID___block_invoke(uint64_t result, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = *(void *)(v3 + 48);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 136);
    if (v8)
    {
      return v8(a2, v4, v5);
    }
    else
    {
      uint64_t v9 = *MEMORY[0x1E4F516D8];
      v10[0] = &unk_1EF4FA8F8;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (void)endMomentCaptureWithUniqueID:(int64_t)a3
{
  v8[0] = 0;
  v8[1] = v8;
  void v8[2] = 0x2020000000;
  char v9 = 0;
  if ((objc_msgSend(-[AVCaptureOutput liveConnections](self, "liveConnections"), "containsObject:", -[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", *MEMORY[0x1E4F47C68])) & 1) != 0&& (internal = self->_internal, !internal->momentCaptureInFlight)&& internal->lastMomentSettingsUniqueID == a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _OWORD v7[2] = __53__AVCapturePhotoOutput_endMomentCaptureWithUniqueID___block_invoke;
    v7[3] = &unk_1E5A72FC0;
    v7[4] = self;
    void v7[5] = v8;
    v7[6] = a3;
    [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v7];
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  _Block_object_dispose(v8, 8);
}

uint64_t __53__AVCapturePhotoOutput_endMomentCaptureWithUniqueID___block_invoke(uint64_t result, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = *(void *)(v3 + 48);
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 144);
    if (v8)
    {
      return v8(a2, v4, v5);
    }
    else
    {
      uint64_t v9 = *MEMORY[0x1E4F516D8];
      v10[0] = &unk_1EF4FA8F8;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      CMNotificationCenterGetDefaultLocalCenter();
      return CMNotificationCenterPostNotification();
    }
  }
  return result;
}

- (BOOL)isVideoCaptureSupported
{
  return self->_internal->videoCaptureSupported;
}

- (void)setVideoCaptureEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3 && internal->movieRecordingEnabled)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (internal->videoCaptureEnabled != a3)
  {
    internal->videoCaptureEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (BOOL)isVideoCaptureEnabled
{
  return self->_internal->videoCaptureEnabled;
}

- (void)initiateCaptureWithSettings:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__AVCapturePhotoOutput_initiateCaptureWithSettings___block_invoke;
  v3[3] = &unk_1E5A731B8;
  v3[4] = self;
  v3[5] = a3;
  [(AVCaptureOutput *)self performFigCaptureSessionOperationSafelyUsingBlock:v3];
}

uint64_t __52__AVCapturePhotoOutput_initiateCaptureWithSettings___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = [*(id *)(result + 32) sinkID];
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(v3 + 40), "timestamp"));
    uint64_t VTable = CMBaseObjectGetVTable();
    uint64_t v8 = *(void *)(VTable + 16);
    uint64_t result = VTable + 16;
    uint64_t v7 = v8;
    uint64_t v9 = v8 ? v7 : 0;
    char v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8);
    if (v10)
    {
      uint64_t v11 = *MEMORY[0x1E4F51650];
      return v10(a2, v4, v11, v5);
    }
  }
  return result;
}

- (void)commitCaptureWithSettings:(id)a3 delegate:(id)a4
{
  if ([a3 videoFileURL])
  {
    self->_internal->resumeLivePhotoMovieCaptureAfterVideoCaptureEnds = ![(AVCapturePhotoOutput *)self isLivePhotoCaptureSuspended];
    if ([(AVCapturePhotoOutput *)self isLivePhotoCaptureSuspended]) {
      [(AVCapturePhotoOutput *)self setLivePhotoCaptureSuspended:0];
    }
    [a3 setTurboModeEnabled:1];
    objc_msgSend(a3, "setLivePhotoMovieFileURL:", objc_msgSend(a3, "videoFileURL"));
    uint64_t v7 = (void *)[a3 videoFormat];
    uint64_t v8 = *MEMORY[0x1E4F47D00];
    if ([v7 objectForKeyedSubscript:*MEMORY[0x1E4F47D00]]) {
      objc_msgSend(a3, "setLivePhotoVideoCodecType:", objc_msgSend((id)objc_msgSend(a3, "videoFormat"), "objectForKeyedSubscript:", v8));
    }
    objc_msgSend(a3, "setLivePhotoMovieMetadata:", objc_msgSend(a3, "videoFileMetadata"));
  }

  [(AVCapturePhotoOutput *)self capturePhotoWithSettings:a3 delegate:a4];
}

- (void)endCaptureWithUniqueID:(int64_t)a3
{
  [(AVCapturePhotoOutput *)self setLivePhotoCaptureSuspended:1];
  if (self->_internal->resumeLivePhotoMovieCaptureAfterVideoCaptureEnds)
  {
    [(AVCapturePhotoOutput *)self setLivePhotoCaptureSuspended:0];
  }
}

- (BOOL)isProcessedPhotoZoomWithoutUpscalingSupported
{
  return self->_internal->processedPhotoZoomWithoutUpscalingSupported;
}

- (BOOL)isConstantColorSupported
{
  return self->_internal->constantColorSupported;
}

- (void)setConstantColorEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3 && !internal->constantColorSupported)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (internal->constantColorEnabled != a3)
  {
    internal->constantColorEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)setConstantColorClippingRecoveryEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3 && !internal->constantColorSupported)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (internal->constantColorClippingRecoveryEnabled != a3)
  {
    internal->constantColorClippingRecoveryEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)setConstantColorSaturationBoostEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3 && !internal->constantColorSupported)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else if (internal->constantColorSaturationBoostEnabled != a3)
  {
    internal->constantColorSaturationBoostEnabled = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (BOOL)isShutterSoundSuppressionSupported
{
  return sIsForcedShutterSoundRegion == 0;
}

- (id)connectionMediaTypes
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
  {
    v5[0] = *MEMORY[0x1E4F47C68];
    uint64_t v2 = v5;
  }
  else
  {
    uint64_t v4 = *MEMORY[0x1E4F47C68];
    uint64_t v2 = &v4;
  }
  v2[1] = *MEMORY[0x1E4F47C40];
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
}

- (void)removeConnection:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)AVCapturePhotoOutput;
  -[AVCaptureOutput removeConnection:](&v17, sel_removeConnection_);
  uint64_t v5 = (void *)[a3 mediaType];
  if ([v5 isEqual:*MEMORY[0x1E4F47C68]])
  {
    uint64_t v6 = (void *)[a3 sourceDevice];
    [v6 removeObserver:self forKeyPath:@"imageControlMode" context:AVCapturePhotoOutputDeviceImageControlModeChangedContext];
    uint64_t v7 = (void *)[a3 sourceDevice];
    [v7 removeObserver:self forKeyPath:@"geometricDistortionCorrectionEnabled" context:AVCapturePhotoOutputDeviceGDCEnabledChangedContext];
    id v8 = [(AVCaptureOutput *)self session];
    [v8 removeObserver:self forKeyPath:@"outputs" context:AVCapturePhotoOutputSessionOutputsChangedContext];
    id v9 = [(AVCaptureOutput *)self session];
    [v9 removeObserver:self forKeyPath:@"sessionPreset" context:AVCapturePhotoOutputSessionPresetChangedContext];
    id v10 = [(AVCaptureOutput *)self session];
    [v10 removeObserver:self forKeyPath:@"running" context:AVCapturePhotoOutputSessionIsRunningChangedContext];
    uint64_t v11 = (void *)[a3 sourceDevice];
    [v11 removeObserver:self forKeyPath:@"spatialOverCaptureEnabled" context:AVCapturePhotoOutputDeviceSpatialOverCaptureEnabledChangedContext];
    uint64_t v12 = (void *)[a3 sourceDevice];
    [v12 removeObserver:self forKeyPath:@"videoHDREnabled" context:AVCapturePhotoOutputDeviceVideoHDREnabledChangedContext];
    id v13 = (void *)[a3 sourceDevice];
    [v13 removeObserver:self forKeyPath:@"digitalFlashSceneForPhotoOutput" context:AVCapturePhotoOutputDeviceDigitalFlashSceneForPhotoOutputChangedContext];
    id v14 = (void *)[a3 sourceDevice];
    [v14 removeObserver:self forKeyPath:@"isStillImageStabilizationScene" context:AVCapturePhotoOutputDeviceStillImageStabilizationSceneChangedContext];
    dispatch_time_t v15 = (void *)[a3 sourceDevice];
    [v15 removeObserver:self forKeyPath:@"HDRSceneDetectedForPhotoOutput" context:AVCapturePhotoOutputDeviceHDRSceneDetectedForPhotoOutputChangedContext];
    id v16 = (void *)[a3 sourceDevice];
    [v16 removeObserver:self forKeyPath:@"flashSceneDetectedForPhotoOutput" context:AVCapturePhotoOutputDeviceFlashSceneDetectedForPhotoOutputChangedContext];
    [(AVCapturePhotoOutput *)self _updateSupportedPropertiesForSourceDevice:0];
  }
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515F8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51620] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51618] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51628] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515C8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51610] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51600] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515A8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515E0] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515D0] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515E8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515F0] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515B8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F515D8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:po_notificationHandler name:*MEMORY[0x1E4F51608] object:a3];
  [(AVCapturePhotoOutput *)self _resetTimeLapseCaptureRate];
  [(AVCapturePhotoOutput *)self _resetLivePhotoMovieProcessingSuspended];
  [(AVCapturePhotoOutput *)self _resetLivePhotoCaptureSuspended];
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePhotoOutput;
  [(AVCaptureOutput *)&v6 detachSafelyFromFigCaptureSession:a3];
}

- (void)safelyHandleServerConnectionDeathForFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2, a3);
  uint64_t v4 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_internal->photoRequests];
  [(NSMutableArray *)self->_internal->photoRequests removeAllObjects];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_internal->movieRequests];
  [(NSMutableArray *)self->_internal->movieRequests removeAllObjects];
  MEMORY[0x1A6234340](self->_internal->requestsLock);
  uint64_t v7 = *MEMORY[0x1E4F47B88];
  v33[0] = *MEMORY[0x1E4F47B90];
  uint64_t v6 = v33[0];
  v33[1] = v7;
  v34[0] = MEMORY[0x1E4F1CC28];
  v34[1] = &unk_1EF4FA850;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
  uint64_t v8 = AVLocalizedErrorWithUnderlyingOSStatus();
  v31[0] = v6;
  v31[1] = v7;
  v32[0] = MEMORY[0x1E4F1CC38];
  v32[1] = &unk_1EF4FA850;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  uint64_t v9 = AVLocalizedErrorWithUnderlyingOSStatus();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v10 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v4);
        }
        [(AVCapturePhotoOutput *)self _dispatchFailureCallbacks:2147549183 forPhotoRequest:*(void *)(*((void *)&v25 + 1) + 8 * i) withError:v8 cleanupRequest:0];
      }
      uint64_t v11 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v5);
        }
        dispatch_time_t v18 = *(void **)(*((void *)&v21 + 1) + 8 * j);
        uint64_t v19 = objc_msgSend((id)objc_msgSend(v18, "resolvedSettings"), "movieURL");
        uint64_t v20 = v8;
        if (v19)
        {
          if (FigConsolidateMovieFragments()) {
            uint64_t v20 = v8;
          }
          else {
            uint64_t v20 = v9;
          }
        }
        [(AVCapturePhotoOutput *)self _dispatchFailureCallbacks:63 forMovieRequest:v18 withError:v20 cleanupRequest:0];
      }
      uint64_t v15 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  [(AVCapturePhotoOutput *)self _updateSupportedPropertiesForSourceDevice:a4];
  v7.receiver = self;
  v7.super_class = (Class)AVCapturePhotoOutput;
  [(AVCaptureOutput *)&v7 handleChangedActiveFormat:a3 forDevice:a4];
}

- (void)handleBackgroundBlurActiveChangedForDevice:(id)a3
{
  -[AVCapturePhotoOutput _updateMaxBracketedCapturePhotoCountForSourceDevice:](self, "_updateMaxBracketedCapturePhotoCountForSourceDevice:");

  [(AVCapturePhotoOutput *)self _updateDepthDataDeliverySupportedForSourceDevice:a3];
}

- (void)handleStudioLightingActiveChangedForDevice:(id)a3
{
  -[AVCapturePhotoOutput _updateMaxBracketedCapturePhotoCountForSourceDevice:](self, "_updateMaxBracketedCapturePhotoCountForSourceDevice:");

  [(AVCapturePhotoOutput *)self _updateDepthDataDeliverySupportedForSourceDevice:a3];
}

- (void)handleBackgroundReplacementActiveChangedForDevice:(id)a3
{
  -[AVCapturePhotoOutput _updateMaxBracketedCapturePhotoCountForSourceDevice:](self, "_updateMaxBracketedCapturePhotoCountForSourceDevice:");

  [(AVCapturePhotoOutput *)self _updateDepthDataDeliverySupportedForSourceDevice:a3];
}

uint64_t __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(result + 32)
                                                                                         + 16)
                                                                             + 272) > 0;
  return result;
}

uint64_t __71__AVCapturePhotoOutput_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(result + 32)
                                                                                         + 16)
                                                                             + 276) > 0;
  return result;
}

uint64_t __64__AVCapturePhotoOutput__updateSupportedHDRModesForSourceDevice___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 16) + 104) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_resetLivePhotoCaptureSuspended
{
  if (self->_internal->livePhotoCaptureSuspended)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"livePhotoCaptureSuspended"];
    self->_internal->livePhotoCaptureSuspended = 0;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"livePhotoCaptureSuspended"];
  }
}

- (void)_resetLivePhotoMovieProcessingSuspended
{
  if (self->_internal->livePhotoMovieProcessingSuspended)
  {
    [(AVCapturePhotoOutput *)self willChangeValueForKey:@"livePhotoMovieProcessingSuspended"];
    self->_internal->livePhotoMovieProcessingSuspended = 0;
    [(AVCapturePhotoOutput *)self didChangeValueForKey:@"livePhotoMovieProcessingSuspended"];
  }
}

- (void)_decrementObserverCountForKeyPath:(id)a3
{
  char v5 = [a3 isEqualToString:@"isFlashScene"];
  char v6 = [a3 isEqualToString:@"isHDRScene"];
  char v7 = [a3 isEqualToString:@"isStillImageStabilizationScene"];
  char v8 = [a3 isEqualToString:@"digitalFlashStatus"];
  int v9 = [a3 isEqualToString:@"digitalFlashExposureTimes"];
  if ((v5 & 1) != 0 || (v6 & 1) != 0 || (v7 & 1) != 0 || (v8 & 1) != 0 || v9)
  {
    sceneDetectionObserversDispatchQueue = self->_internal->sceneDetectionObserversDispatchQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __58__AVCapturePhotoOutput__decrementObserverCountForKeyPath___block_invoke;
    void v11[3] = &unk_1E5A79E38;
    char v12 = v5;
    v11[4] = self;
    char v13 = v6;
    char v14 = v7;
    char v15 = v8;
    char v16 = v9;
    dispatch_async(sceneDetectionObserversDispatchQueue, v11);
  }
}

uint64_t __58__AVCapturePhotoOutput__decrementObserverCountForKeyPath___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    uint64_t v1 = 272;
  }
  else if (*(unsigned char *)(result + 41))
  {
    uint64_t v1 = 276;
  }
  else if (*(unsigned char *)(result + 42))
  {
    uint64_t v1 = 280;
  }
  else if (*(unsigned char *)(result + 43))
  {
    uint64_t v1 = 288;
  }
  else
  {
    if (!*(unsigned char *)(result + 44)) {
      return result;
    }
    uint64_t v1 = 304;
  }
  --*(_DWORD *)(*(void *)(*(void *)(result + 32) + 16) + v1);
  return result;
}

- (id)_figCaptureMovieFileRecordingSettingsForAVMomentCaptureMovieRecordingSettings:(id)a3 momentCaptureSettings:(id)a4 delegate:(id)a5 connections:(id)a6
{
  uint64_t v7 = v6;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = objc_alloc_init(MEMORY[0x1E4F50F48]);
  uint64_t v39 = (void *)[MEMORY[0x1E4F1CA80] set];
  if (([a3 isAutoSpatialOverCaptureEnabled] & 1) == 0)
  {
    [a3 setSpatialOverCaptureMovieFileURL:0];
    [a3 setSpatialOverCaptureMovieMetadata:0];
  }
  id v36 = a4;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v13 = [a6 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (!v13)
  {
    long long v24 = 0;
LABEL_21:
    uint64_t v34 = v7;
    LODWORD(v33) = 0;
    FigDebugAssert3();
    char v15 = 0;
    goto LABEL_22;
  }
  uint64_t v14 = v13;
  char v35 = self;
  id v37 = a3;
  id v38 = v12;
  uint64_t v40 = 0;
  char v15 = 0;
  uint64_t v16 = *(void *)v50;
  uint64_t v17 = *MEMORY[0x1E4F47C68];
  uint64_t v18 = *MEMORY[0x1E4F47C40];
  uint64_t v19 = *MEMORY[0x1E4F47C50];
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v50 != v16) {
        objc_enumerationMutation(a6);
      }
      long long v21 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      long long v22 = objc_msgSend((id)objc_msgSend(v21, "inputPorts"), "firstObject");
      if ([v21 isEnabled] && objc_msgSend(v22, "isEnabled"))
      {
        long long v23 = (void *)[v22 mediaType];
        if ([v23 isEqual:v17])
        {
          char v15 = v21;
        }
        else if ([v23 isEqual:v18])
        {
          uint64_t v40 = v21;
        }
        else if ([v23 isEqual:v19])
        {
          [v39 addObject:v21];
        }
      }
    }
    uint64_t v14 = [a6 countByEnumeratingWithState:&v49 objects:v55 count:16];
  }
  while (v14);
  a3 = v37;
  id v12 = v38;
  uint64_t v7 = v6;
  self = v35;
  long long v24 = v40;
  if (!v15) {
    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(v12, "setSettingsID:", objc_msgSend(a3, "uniqueID", v33, v34));
  [v12 setIrisRecording:1];
  [v12 setIrisMovieRecording:1];
  objc_msgSend(v12, "setOutputURL:", objc_msgSend(a3, "movieFileURL"));
  uint64_t v25 = *MEMORY[0x1E4F47C08];
  [v12 setOutputFileType:*MEMORY[0x1E4F47C08]];
  long long v47 = *MEMORY[0x1E4F1F9F8];
  uint64_t v48 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  [v12 setMaxDuration:&v47];
  [v12 setMaxFileSize:0];
  [v12 setMinFreeDiskSpaceLimit:0];
  $2825F4736939C4A6D3AD43837233062D v26 = [(AVCapturePhotoOutput *)self livePhotoMovieDimensions];
  unint64_t v27 = HIDWORD(*(unint64_t *)&v26);
  v53[0] = *MEMORY[0x1E4F24E10];
  uint64_t v28 = [NSNumber numberWithInt:v26];
  v53[1] = *MEMORY[0x1E4F24D08];
  v54[0] = v28;
  v54[1] = [NSNumber numberWithInt:v27];
  objc_msgSend(v12, "setVideoSettings:", -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v15, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v54, v53, 2), objc_msgSend(a3, "videoCodecType"), v25, 0, 0));
  objc_msgSend(v12, "setVideoMirrored:", objc_msgSend(v15, "isVideoMirrored"));
  objc_msgSend(v12, "setVideoOrientation:", objc_msgSend(v15, "_videoOrientation"));
  [v12 setRecordVideoOrientationAndMirroringChanges:1];
  [v12 setSendPreviewIOSurface:1];
  objc_msgSend(v12, "setDebugMetadataSidecarFileEnabled:", objc_msgSend(v15, "isDebugMetadataSidecarFileEnabled"));
  if (v24) {
    objc_msgSend(v12, "setAudioSettings:", -[AVCaptureOutput recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:](self, "recommendedOutputSettingsForConnection:sourceSettings:videoCodecType:fileType:isIris:outputFileURL:", v24, 0, 0, *MEMORY[0x1E4F47C18], 0, 0));
  }
  CMTimeMake(&v46, 1, 1);
  CMTime v45 = v46;
  [v12 setMovieFragmentInterval:&v45];
  objc_msgSend(v12, "setMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E4F47DC8], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(a3, "movieMetadata")));
  if (objc_msgSend((id)objc_msgSend(v15, "sourceDevice"), "isVirtualDevice")
    && (unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "sourceDevice"), "constituentDevices"), "count") >= 2)
  {
    if (objc_msgSend((id)objc_msgSend(v36, "bravoCameraSelectionBehaviorForRecording"), "isEqualToString:", @"AVCaptureBravoCameraSelectionBehaviorEvaluatesContinuously"))
    {
      long long v29 = xmmword_1A1636AC0;
    }
    else if (objc_msgSend((id)objc_msgSend(v36, "bravoCameraSelectionBehaviorForRecording"), "isEqualToString:", @"AVCaptureBravoCameraSelectionBehaviorEvaluatesOnZoomChange"))
    {
      long long v29 = xmmword_1A1636AD0;
    }
    else
    {
      int v30 = objc_msgSend((id)objc_msgSend(v36, "bravoCameraSelectionBehaviorForRecording"), "isEqualToString:", @"AVCaptureBravoCameraSelectionBehaviorEvaluatesNever");
      uint64_t v31 = 3;
      if (!v30) {
        uint64_t v31 = 0;
      }
      long long v29 = (unint64_t)v31;
    }
    char v43 = 0;
    __int16 v42 = 0;
    char v41 = 1;
    long long v44 = v29;
    [v12 setBravoCameraSelectionConfigurationForRecording:&v41];
  }
  if ([a3 isAutoSpatialOverCaptureEnabled])
  {
    objc_msgSend(v12, "setSpatialOverCaptureMovieURL:", objc_msgSend(a3, "spatialOverCaptureMovieFileURL"));
    objc_msgSend(v12, "setSpatialOverCaptureMovieLevelMetadata:", objc_msgSend(MEMORY[0x1E4F47DC8], "_figMetadataPropertyFromMetadataItems:", objc_msgSend(a3, "spatialOverCaptureMovieMetadata")));
  }
  return v12;
}

+ (__CFDictionary)_copyAttachmentsAndPropagateFaceRegionsToExifAuxDictionaryForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFDictionaryRef v4 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, 1u);
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    Value = CFDictionaryGetValue(v4, @"FaceRegions");
    if (Value)
    {
      uint64_t v7 = Value;
      char v8 = (const void *)*MEMORY[0x1E4F2F6D8];
      if (!CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E4F2F6D8]))
      {
        Mutable = CFDictionaryCreateMutable(v3, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        if (Mutable)
        {
          uint64_t v10 = Mutable;
          CFDictionarySetValue(Mutable, v8, v7);
          CFIndex Count = CFDictionaryGetCount(v5);
          MutableCopy = CFDictionaryCreateMutableCopy(v3, Count, v5);
          CFDictionarySetValue(MutableCopy, v8, v10);
          CFRelease(v10);
          CFRelease(v5);
          return MutableCopy;
        }
      }
    }
  }
  return v5;
}

- (void)_dispatchFailureCallbacksForPhotoSettings:(id)a3 toDelegate:(id)a4 withError:(id)a5
{
  objc_opt_class();
  BOOL v9 = (objc_opt_isKindOfClass() & 1) != 0 && self->_internal->lensStabilizationDuringBracketedCaptureSupported;
  uint64_t v10 = +[AVCapturePhotoRequest requestWithDelegate:a4 settings:a3 lensStabilizationSupported:v9];

  [(AVCapturePhotoOutput *)self _dispatchFailureCallbacks:2147549183 forPhotoRequest:v10 withError:a5 cleanupRequest:0];
}

- (void)_dispatchFailureCallbacks:(unsigned int)a3 forPhotoRequest:(id)a4 withError:(id)a5 cleanupRequest:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (![a4 resolvedSettings])
  {
    double v53 = self;
    char v51 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "isTurboModeEnabled");
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "flashMode");
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "HDRMode");
    BOOL v47 = v6;
    if (v11 == 1) {
      char v12 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "isEV0PhotoDeliveryEnabled");
    }
    else {
      char v12 = 0;
    }
    BOOL v13 = v11 == 1;
    BOOL v14 = v10 == 1;
    char v15 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "isSquareCropEnabled");
    BOOL v16 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURL") != 0;
    id v17 = (id)objc_msgSend((id)objc_msgSend(a4, "expectedPhotoManifest"), "copy");
    char v18 = [a4 firedCallbackFlags];
    uint64_t v19 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID");
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    long long v74 = *MEMORY[0x1E4F1FA20];
    long long v75 = v20;
    long long v76 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    LOBYTE(v45) = v18 & 1;
    LOWORD(v44) = 0;
    LOBYTE(v43) = v15;
    HIWORD(v42) = 0;
    BYTE5(v42) = v12;
    *(_WORD *)((char *)&v42 + 3) = v13;
    *(_WORD *)((char *)&v42 + 1) = v14;
    LOBYTE(v42) = v51;
    LOBYTE(v40) = v16;
    id v21 = +[AVCaptureResolvedPhotoSettings resolvedSettingsWithUniqueID:photoDimensions:rawPhotoDimensions:previewDimensions:embeddedThumbnailDimensions:rawEmbeddedThumbnailDimensions:livePhotoMovieEnabled:livePhotoMovieDimensions:portraitEffectsMatteDimensions:hairSegmentationMatteDimensions:skinSegmentationMatteDimensions:teethSegmentationMatteDimensions:glassesSegmentationMatteDimensions:spatialOverCapturePhotoDimensions:turboModeEnabled:flashEnabled:redEyeReductionEnabled:HDREnabled:adjustedPhotoFiltersEnabled:EV0PhotoDeliveryEnabled:stillImageStabilizationEnabled:virtualDeviceFusionEnabled:squareCropEnabled:deferredPhotoProxyDimensions:photoProcessingTimeRange:contentAwareDistortionCorrectionEnabled:spatialPhotoCaptureEnabled:photoManifest:digitalFlashUserInterfaceHints:digitalFlashUserInterfaceRGBEstimate:captureBeforeResolvingSettingsEnabled:](AVCaptureResolvedPhotoSettings, "resolvedSettingsWithUniqueID:photoDimensions:rawPhotoDimensions:previewDimensions:embeddedThumbnailDimensions:rawEmbeddedThumbnailDimensions:livePhotoMovieEnabled:livePhotoMovieDimensions:portraitEffectsMatteDimensions:hairSegmentationMatteDimensions:skinSegmentationMatteDimensions:teethSegmentationMatteDimensions:glassesSegmentationMatteDimensions:spatialOverCapturePhotoDimensions:turboModeEnabled:flashEnabled:redEyeReductionEnabled:HDREnabled:adjustedPhotoFiltersEnabled:EV0PhotoDeliveryEnabled:stillImageStabilizationEnabled:virtualDeviceFusionEnabled:squareCropEnabled:deferredPhotoProxyDimensions:photoProcessingTimeRange:contentAwareDistortionCorrectionEnabled:spatialPhotoCaptureEnabled:photoManifest:digitalFlashUserInterfaceHints:digitalFlashUserInterfaceRGBEstimate:captureBeforeResolvingSettingsEnabled:", v19, 0, 0, 0, 0, 0, v40, 0, 0, 0,
            0,
            0,
            0,
            0,
            v42,
            v43,
            0,
            &v74,
            v44,
            v17,
            0,
            0,
            v45);
    self = v53;
    BOOL v6 = v47;
    [a4 setResolvedSettings:v21];
  }
  uint64_t v54 = (void *)[a4 resolvedSettings];
  int v22 = [a4 firedCallbackFlags];
  *(void *)&long long v74 = 0;
  *((void *)&v74 + 1) = &v74;
  long long v75 = 0x2020000000uLL;
  unint64_t v50 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count");
  [a4 unresolvedSettings];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v52 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "bracketedSettings");
    BOOL v48 = v6;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v23 = (void *)[v54 photoManifest];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v70 objects:v77 count:16];
    uint64_t v25 = self;
    unint64_t v26 = 0;
    unint64_t v27 = 0;
    if (v24)
    {
      uint64_t v28 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v71 != v28) {
            objc_enumerationMutation(v23);
          }
          unsigned int v30 = [*(id *)(*((void *)&v70 + 1) + 8 * i) unsignedIntValue];
          if ((v30 & 0x10000) == 0) {
            ++v26;
          }
          v27 += ((v30 >> 7) & 1) + (unint64_t)((v30 & 0x10000) >> 16);
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v70 objects:v77 count:16];
      }
      while (v24);
    }
    self = v25;
    if (v50)
    {
      v26 /= v50;
      v27 /= v50;
    }
    BOOL v6 = v48;
    if ([v52 count] != v26 && objc_msgSend(v52, "count") != v27)
    {
      uint64_t v41 = v46;
      LODWORD(v40) = 0;
      FigDebugAssert3();
    }
  }
  else
  {
    long long v52 = 0;
  }
  if ((((v22 & 2) == 0) & (a3 >> 1)) != 0) {
    int v31 = 2;
  }
  else {
    int v31 = 0;
  }
  if ((((v22 & 4) == 0) & (a3 >> 2)) != 0) {
    v31 |= 4u;
  }
  uint64_t v64 = MEMORY[0x1E4F143A8];
  uint64_t v65 = 3221225472;
  double v66 = __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forPhotoRequest_withError_cleanupRequest___block_invoke;
  double v67 = &unk_1E5A72D70;
  if ((((v22 & 8) == 0) & (a3 >> 3)) != 0) {
    int v32 = v31 | 8;
  }
  else {
    int v32 = v31;
  }
  double v68 = self;
  id v69 = a4;
  if ((a3 & 0x8000) != 0 && (v22 & 0x8000) == 0)
  {
    [(AVCapturePhotoOutput *)self _updateCaptureReadinessStateForCompletedRequest:a4];
    v32 |= 0x8000u;
  }
  uint64_t v57 = MEMORY[0x1E4F143A8];
  uint64_t v58 = 3221225472;
  float v59 = __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forPhotoRequest_withError_cleanupRequest___block_invoke_2;
  float v60 = &unk_1E5A73F18;
  double v63 = &v74;
  id v61 = a4;
  id v62 = v54;
  if ((a3 & 0x10) != 0 && (v22 & 0x10) == 0)
  {
    *(void *)(*((void *)v63 + 1) + 24) = [a4 firedPhotoCallbacksCount];
    objc_msgSend(v61, "setFiredPhotoCallbacksCount:", objc_msgSend((id)objc_msgSend(v62, "photoManifest"), "count"));
    v32 |= 0x10u;
  }
  if (objc_msgSend(v54, "livePhotoMovieEnabled", v40, v41)
    && !objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "videoFileURL"))
  {
    if ([v54 isEV0PhotoDeliveryEnabled]
      && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto"))
    {
      int v36 = (((v22 & 0x20) == 0) & (a3 >> 5)) != 0 ? v32 | 0x20 : v32;
      int v32 = (((v22 & 0x200) == 0) & (a3 >> 9)) != 0 ? v36 | 0x200 : v36;
      if ((int)[v54 spatialOverCapturePhotoDimensions] >= 1
        && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"))
      {
        if ((((v22 & 0x40) == 0) & (a3 >> 6)) != 0) {
          int v37 = v32 | 0x40;
        }
        else {
          int v37 = v32;
        }
        if ((((v22 & 0x400) == 0) & (a3 >> 10)) != 0) {
          int v32 = v37 | 0x400;
        }
        else {
          int v32 = v37;
        }
      }
    }
    if ((((v22 & 0x80) == 0) & (a3 >> 7)) != 0) {
      int v38 = v32 | 0x80;
    }
    else {
      int v38 = v32;
    }
    if ((((v22 & 0x800) == 0) & (a3 >> 11)) != 0) {
      int v32 = v38 | 0x800;
    }
    else {
      int v32 = v38;
    }
    if ((int)[v54 spatialOverCapturePhotoDimensions] >= 1
      && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL"))
    {
      if ((((v22 & 0x100) == 0) & (a3 >> 8)) != 0) {
        int v39 = v32 | 0x100;
      }
      else {
        int v39 = v32;
      }
      if ((((v22 & 0x1000) == 0) & (a3 >> 12)) != 0) {
        int v32 = v39 | 0x1000;
      }
      else {
        int v32 = v39;
      }
    }
  }
  if (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "HEICSFileURL")
    && (((v22 & 0x2000) == 0) & (a3 >> 13)) != 0)
  {
    v32 |= 0x2000u;
  }
  if (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "videoFileURL")
    && (((v22 & 0x4000) == 0) & (a3 >> 14)) != 0)
  {
    v32 |= 0x4000u;
  }
  if (v22 > -1 && (a3 & 0x80000000) != 0) {
    unsigned int v34 = v32 | 0x80000000;
  }
  else {
    unsigned int v34 = v32;
  }
  objc_msgSend(a4, "setFiredCallbackFlags:", v34 | objc_msgSend(a4, "firedCallbackFlags"));
  char v35 = (void *)[a4 delegateStorage];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forPhotoRequest_withError_cleanupRequest___block_invoke_3;
  v55[3] = &unk_1E5A79E88;
  unsigned int v56 = v34;
  v55[4] = self;
  v55[5] = v54;
  v55[6] = a4;
  v55[7] = v52;
  v55[9] = &v74;
  v55[10] = v50;
  v55[8] = a5;
  [v35 invokeDelegateCallbackWithBlock:v55];
  if (v6)
  {
    MEMORY[0x1A6234330](self->_internal->requestsLock);
    [(NSMutableArray *)self->_internal->photoRequests removeObject:a4];
    MEMORY[0x1A6234340](self->_internal->requestsLock);
  }
  _Block_object_dispose(&v74, 8);
}

uint64_t __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forPhotoRequest_withError_cleanupRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCaptureReadinessStateForCompletedRequest:*(void *)(a1 + 40)];
}

uint64_t __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forPhotoRequest_withError_cleanupRequest___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) firedPhotoCallbacksCount];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "photoManifest"), "count");
  CFAllocatorRef v3 = *(void **)(a1 + 32);

  return [v3 setFiredPhotoCallbacksCount:v2];
}

unint64_t __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forPhotoRequest_withError_cleanupRequest___block_invoke_3(unint64_t result, void *a2)
{
  unint64_t v3 = result;
  if ((*(unsigned char *)(result + 88) & 2) != 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = [a2 captureOutput:*(void *)(v3 + 32) willBeginCaptureForResolvedSettings:*(void *)(v3 + 40)];
    }
  }
  if ((*(unsigned char *)(v3 + 88) & 4) != 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = [a2 captureOutput:*(void *)(v3 + 32) willCapturePhotoForResolvedSettings:*(void *)(v3 + 40)];
    }
  }
  if ((*(unsigned char *)(v3 + 88) & 8) != 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = [a2 captureOutput:*(void *)(v3 + 32) didCapturePhotoForResolvedSettings:*(void *)(v3 + 40)];
    }
  }
  if ((*(unsigned char *)(v3 + 89) & 0x80) != 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = [a2 captureOutput:*(void *)(v3 + 32) readyForResponsiveRequestAfterResolvedSettings:*(void *)(v3 + 40)];
    }
  }
  if ((*(unsigned char *)(v3 + 88) & 0x10) != 0)
  {
    unint64_t v4 = *(void *)(*(void *)(*(void *)(v3 + 72) + 8) + 24);
    uint64_t result = [*(id *)(v3 + 48) expectedPhotoCount];
    if (v4 < result)
    {
      CFDictionaryRef v5 = (long long *)MEMORY[0x1E4F1F9F8];
      do
      {
        uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "resolvedSettings"), "photoManifest"), "objectAtIndexedSubscript:", v4), "unsignedIntValue");
        if (*(void *)(v3 + 56))
        {
          unint64_t v7 = v4;
          if (objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "rawPhotoPixelFormatType"))unint64_t v7 = v4 >> (objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "formatFourCC") != 0); {
          unint64_t v8 = *(void *)(v3 + 80);
          }
          if (v8) {
            v7 /= v8;
          }
          uint64_t v9 = [*(id *)(v3 + 56) objectAtIndexedSubscript:v7];
          unint64_t v10 = v7 + 1;
        }
        else
        {
          uint64_t v9 = 0;
          unint64_t v10 = 0;
        }
        ++v4;
        if ([*(id *)(v3 + 48) photoCallbackFlavor])
        {
          if ([*(id *)(v3 + 48) photoCallbackFlavor] == 1)
          {
            uint64_t v11 = *(void *)(v3 + 32);
            uint64_t v12 = *(void *)(v3 + 40);
            uint64_t v13 = *(void *)(v3 + 64);
            if ((v6 & 0x10080) != 0) {
              [a2 captureOutput:v11 didFinishProcessingRawPhotoSampleBuffer:0 previewPhotoSampleBuffer:0 resolvedSettings:v12 bracketSettings:v9 error:v13];
            }
            else {
              [a2 captureOutput:v11 didFinishProcessingPhotoSampleBuffer:0 previewPhotoSampleBuffer:0 resolvedSettings:v12 bracketSettings:v9 error:v13];
            }
          }
        }
        else
        {
          uint64_t v14 = po_metadataWithMakerNoteProcessingFlags(v6);
          if ([*(id *)(v3 + 40) deferredPhotoProxyDimensions])
          {
            char v15 = [AVCaptureDeferredPhotoProxy alloc];
            long long v64 = *v5;
            uint64_t v65 = *((void *)v5 + 2);
            BOOL v16 = [(AVCaptureDeferredPhotoProxy *)v15 initWithApplicationIdentifier:0 captureRequestIdentifier:0 photoIdentifier:0 timestamp:&v64 expectedPhotoProcessingFlags:v6];
            [a2 captureOutput:*(void *)(v3 + 32) didFinishCapturingDeferredPhotoProxy:v16 error:*(void *)(v3 + 64)];
          }
          else
          {
            id v17 = [AVCapturePhoto alloc];
            uint64_t v18 = *(void *)(v3 + 48);
            uint64_t v19 = *(void *)(*(void *)(*(void *)(v3 + 32) + 16) + 376);
            long long v64 = *v5;
            uint64_t v65 = *((void *)v5 + 2);
            LODWORD(v61) = v6;
            BOOL v16 = -[AVCapturePhoto initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:](v17, "initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:", &v64, 0, 0, 0, 0, 0, v14, 0, 0, 0, 0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    v18,
                    v9,
                    v10,
                    v4,
                    v61,
                    v19);
            [a2 captureOutput:*(void *)(v3 + 32) didFinishProcessingPhoto:v16 error:*(void *)(v3 + 64)];
          }
        }
        uint64_t result = [*(id *)(v3 + 48) expectedPhotoCount];
      }
      while (v4 < result);
    }
  }
  if ((*(unsigned char *)(v3 + 89) & 0x20) != 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = objc_msgSend(a2, "captureOutput:didFinishProcessingPhotoFileAtURL:resolvedSettings:error:", *(void *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "HEICSFileURL"), *(void *)(v3 + 40), *(void *)(v3 + 64));
    }
  }
  if ((*(unsigned char *)(v3 + 88) & 0x20) != 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = objc_msgSend(a2, "captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", *(void *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto"), *(void *)(v3 + 40));
    }
  }
  if ((*(unsigned char *)(v3 + 88) & 0x40) != 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = objc_msgSend(a2, "captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", *(void *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"), *(void *)(v3 + 40));
    }
  }
  if ((*(unsigned char *)(v3 + 88) & 0x80) != 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = objc_msgSend(a2, "captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", *(void *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURL"), *(void *)(v3 + 40));
    }
  }
  if (*(unsigned char *)(v3 + 89))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = objc_msgSend(a2, "captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", *(void *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL"), *(void *)(v3 + 40));
    }
  }
  if ((*(unsigned char *)(v3 + 89) & 2) != 0)
  {
    if ([*(id *)(v3 + 48) delegateSupportsMetadataIdentifiersCallback])
    {
      uint64_t v20 = *(void *)(v3 + 32);
      uint64_t v21 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto");
      uint64_t v22 = *(void *)(v3 + 40);
      uint64_t v23 = *(void *)(v3 + 64);
      long long v64 = *MEMORY[0x1E4F1F9F8];
      uint64_t v65 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v62 = v64;
      uint64_t v63 = v65;
      uint64_t result = [a2 captureOutput:v20 didFinishProcessingLivePhotoToMovieFileAtURL:v21 duration:&v64 photoDisplayTime:&v62 metadataIdentifiers:MEMORY[0x1E4F1CC08] resolvedSettings:v22 error:v23];
    }
    else
    {
      int v24 = [*(id *)(v3 + 48) delegateSupportsDebugMetadataSidecarFile];
      uint64_t v25 = *(void *)(v3 + 32);
      uint64_t v26 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto");
      uint64_t v27 = *(void *)(v3 + 40);
      uint64_t v28 = *(void *)(v3 + 64);
      long long v64 = *MEMORY[0x1E4F1F9F8];
      uint64_t v65 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v62 = v64;
      uint64_t v63 = v65;
      if (v24) {
        uint64_t result = [a2 captureOutput:v25 didFinishProcessingLivePhotoToMovieFileAtURL:v26 debugMetadataSidecarFileURL:0 duration:&v64 photoDisplayTime:&v62 resolvedSettings:v27 error:v28];
      }
      else {
        uint64_t result = [a2 captureOutput:v25 didFinishProcessingLivePhotoToMovieFileAtURL:v26 duration:&v64 photoDisplayTime:&v62 resolvedSettings:v27 error:v28];
      }
    }
  }
  if ((*(unsigned char *)(v3 + 89) & 4) != 0)
  {
    if ([*(id *)(v3 + 48) delegateSupportsMetadataIdentifiersCallback])
    {
      uint64_t v29 = *(void *)(v3 + 32);
      uint64_t v30 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto");
      uint64_t v31 = *(void *)(v3 + 40);
      uint64_t v32 = *(void *)(v3 + 64);
      long long v64 = *MEMORY[0x1E4F1F9F8];
      uint64_t v65 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v62 = v64;
      uint64_t v63 = v65;
      uint64_t result = [a2 captureOutput:v29 didFinishProcessingLivePhotoToMovieFileAtURL:v30 duration:&v64 photoDisplayTime:&v62 metadataIdentifiers:MEMORY[0x1E4F1CC08] resolvedSettings:v31 error:v32];
    }
    else
    {
      int v33 = [*(id *)(v3 + 48) delegateSupportsDebugMetadataSidecarFile];
      uint64_t v34 = *(void *)(v3 + 32);
      uint64_t v35 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto");
      uint64_t v36 = *(void *)(v3 + 40);
      uint64_t v37 = *(void *)(v3 + 64);
      long long v64 = *MEMORY[0x1E4F1F9F8];
      uint64_t v65 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v62 = v64;
      uint64_t v63 = v65;
      if (v33) {
        uint64_t result = [a2 captureOutput:v34 didFinishProcessingLivePhotoToMovieFileAtURL:v35 debugMetadataSidecarFileURL:0 duration:&v64 photoDisplayTime:&v62 resolvedSettings:v36 error:v37];
      }
      else {
        uint64_t result = [a2 captureOutput:v34 didFinishProcessingLivePhotoToMovieFileAtURL:v35 duration:&v64 photoDisplayTime:&v62 resolvedSettings:v36 error:v37];
      }
    }
  }
  if ((*(unsigned char *)(v3 + 89) & 8) != 0)
  {
    if ([*(id *)(v3 + 48) delegateSupportsMetadataIdentifiersCallback])
    {
      uint64_t v38 = *(void *)(v3 + 32);
      uint64_t v39 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURL");
      uint64_t v40 = *(void *)(v3 + 40);
      uint64_t v41 = *(void *)(v3 + 64);
      long long v64 = *MEMORY[0x1E4F1F9F8];
      uint64_t v65 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v62 = v64;
      uint64_t v63 = v65;
      uint64_t result = [a2 captureOutput:v38 didFinishProcessingLivePhotoToMovieFileAtURL:v39 duration:&v64 photoDisplayTime:&v62 metadataIdentifiers:MEMORY[0x1E4F1CC08] resolvedSettings:v40 error:v41];
    }
    else
    {
      int v42 = [*(id *)(v3 + 48) delegateSupportsDebugMetadataSidecarFile];
      uint64_t v43 = *(void *)(v3 + 32);
      uint64_t v44 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "livePhotoMovieFileURL");
      uint64_t v45 = *(void *)(v3 + 40);
      uint64_t v46 = *(void *)(v3 + 64);
      long long v64 = *MEMORY[0x1E4F1F9F8];
      uint64_t v65 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v62 = v64;
      uint64_t v63 = v65;
      if (v42) {
        uint64_t result = [a2 captureOutput:v43 didFinishProcessingLivePhotoToMovieFileAtURL:v44 debugMetadataSidecarFileURL:0 duration:&v64 photoDisplayTime:&v62 resolvedSettings:v45 error:v46];
      }
      else {
        uint64_t result = [a2 captureOutput:v43 didFinishProcessingLivePhotoToMovieFileAtURL:v44 duration:&v64 photoDisplayTime:&v62 resolvedSettings:v45 error:v46];
      }
    }
  }
  if ((*(unsigned char *)(v3 + 89) & 0x10) != 0)
  {
    if ([*(id *)(v3 + 48) delegateSupportsMetadataIdentifiersCallback])
    {
      uint64_t v47 = *(void *)(v3 + 32);
      uint64_t v48 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL");
      uint64_t v49 = *(void *)(v3 + 40);
      uint64_t v50 = *(void *)(v3 + 64);
      long long v64 = *MEMORY[0x1E4F1F9F8];
      uint64_t v65 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v62 = v64;
      uint64_t v63 = v65;
      uint64_t result = [a2 captureOutput:v47 didFinishProcessingLivePhotoToMovieFileAtURL:v48 duration:&v64 photoDisplayTime:&v62 metadataIdentifiers:MEMORY[0x1E4F1CC08] resolvedSettings:v49 error:v50];
    }
    else
    {
      int v51 = [*(id *)(v3 + 48) delegateSupportsDebugMetadataSidecarFile];
      uint64_t v52 = *(void *)(v3 + 32);
      uint64_t v53 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL");
      uint64_t v54 = *(void *)(v3 + 40);
      uint64_t v55 = *(void *)(v3 + 64);
      long long v64 = *MEMORY[0x1E4F1F9F8];
      uint64_t v65 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      long long v62 = v64;
      uint64_t v63 = v65;
      if (v51) {
        uint64_t result = [a2 captureOutput:v52 didFinishProcessingLivePhotoToMovieFileAtURL:v53 debugMetadataSidecarFileURL:0 duration:&v64 photoDisplayTime:&v62 resolvedSettings:v54 error:v55];
      }
      else {
        uint64_t result = [a2 captureOutput:v52 didFinishProcessingLivePhotoToMovieFileAtURL:v53 duration:&v64 photoDisplayTime:&v62 resolvedSettings:v54 error:v55];
      }
    }
  }
  int v56 = *(_DWORD *)(v3 + 88);
  if ((v56 & 0x4000) != 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v57 = *(void *)(v3 + 32);
      uint64_t v58 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "videoFileURL");
      uint64_t v59 = *(void *)(v3 + 40);
      uint64_t v60 = *(void *)(v3 + 64);
      long long v64 = *MEMORY[0x1E4F1F9F8];
      uint64_t v65 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      uint64_t result = [a2 captureOutput:v57 didFinishProcessingVideoFileAtURL:v58 resolvedSettings:v59 previewPixelBuffer:0 recordedDuration:&v64 error:v60];
    }
    int v56 = *(_DWORD *)(v3 + 88);
  }
  if (v56 < 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return [a2 captureOutput:*(void *)(v3 + 32) didFinishCaptureForResolvedSettings:*(void *)(v3 + 40) error:*(void *)(v3 + 64)];
    }
  }
  return result;
}

- (id)_photoRequestForUniqueID:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  photoRequests = self->_internal->photoRequests;
  uint64_t v6 = [(NSMutableArray *)photoRequests countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(photoRequests);
        }
        unint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "unresolvedSettings"), "uniqueID") == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)photoRequests countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:
  MEMORY[0x1A6234340](self->_internal->requestsLock);
  return v11;
}

- (void)_dispatchFailureCallbacksForMovieRecordingSettings:(id)a3 momentCaptureSettings:(id)a4 toDelegate:(id)a5 withError:(id)a6
{
  uint64_t v8 = +[AVMomentCaptureMovieRequest requestWithDelegate:a5 movieRecordingSettings:a3 momentSettings:a4];

  [(AVCapturePhotoOutput *)self _dispatchFailureCallbacks:63 forMovieRequest:v8 withError:a6 cleanupRequest:0];
}

- (void)_dispatchFailureCallbacks:(unsigned int)a3 forMovieRequest:(id)a4 withError:(id)a5 cleanupRequest:(BOOL)a6
{
  BOOL v6 = a6;
  if (![a4 resolvedSettings]) {
    objc_msgSend(a4, "setResolvedSettings:", +[AVMomentCaptureMovieRecordingResolvedSettings movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:](AVMomentCaptureMovieRecordingResolvedSettings, "movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID"), objc_msgSend((id)objc_msgSend(a4, "momentCaptureSettings"), "torchMode") == 1, objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "movieFileURL"), 0, 0));
  }
  id v11 = (void *)[a4 resolvedSettings];
  char v12 = [a4 firedCallbackFlags];
  char v13 = v12;
  int v14 = a3 & ((v12 & 1) == 0);
  if ((((v12 & 2) == 0) & (a3 >> 1)) != 0) {
    v14 |= 2u;
  }
  if ((((v12 & 8) == 0) & (a3 >> 3)) != 0) {
    v14 |= 8u;
  }
  if ((((v12 & 0x20) == 0) & (a3 >> 5)) != 0) {
    int v15 = v14 | 0x20;
  }
  else {
    int v15 = v14;
  }
  uint64_t v16 = [v11 spatialOverCaptureURL];
  if ((((v13 & 4) == 0) & (a3 >> 2)) != 0) {
    int v17 = v15 | 4;
  }
  else {
    int v17 = v15;
  }
  if ((((v13 & 0x10) == 0) & (a3 >> 4)) != 0) {
    v17 |= 0x10u;
  }
  if (v16) {
    int v18 = v17;
  }
  else {
    int v18 = v15;
  }
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | v18);
  uint64_t v19 = (void *)[a4 delegateStorage];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forMovieRequest_withError_cleanupRequest___block_invoke;
  v20[3] = &unk_1E5A79EB0;
  int v21 = v18;
  v20[4] = self;
  v20[5] = v11;
  void v20[6] = a4;
  v20[7] = a5;
  [v19 invokeDelegateCallbackWithBlock:v20];
  if (v6)
  {
    MEMORY[0x1A6234330](self->_internal->requestsLock);
    [(NSMutableArray *)self->_internal->movieRequests removeObject:a4];
    MEMORY[0x1A6234340](self->_internal->requestsLock);
  }
}

uint64_t __91__AVCapturePhotoOutput__dispatchFailureCallbacks_forMovieRequest_withError_cleanupRequest___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3 = result;
  if (*(unsigned char *)(result + 64))
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = [a2 captureOutput:*(void *)(v3 + 32) didBeginMovieCaptureForResolvedSettings:*(void *)(v3 + 40)];
    }
  }
  if ((*(unsigned char *)(v3 + 64) & 2) != 0)
  {
    if (objc_opt_respondsToSelector())
    {
      if (![*(id *)(v3 + 48) movie]) {
        objc_msgSend(*(id *)(v3 + 48), "setMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(v3 + 48), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieFileURL"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieMetadata")));
      }
      uint64_t result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovie:", *(void *)(v3 + 32), objc_msgSend(*(id *)(v3 + 48), "movie"));
    }
    else
    {
      uint64_t result = objc_opt_respondsToSelector();
      if (result) {
        uint64_t result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovieFileAtEventualURL:resolvedSettings:", *(void *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieFileURL"), *(void *)(v3 + 40));
      }
    }
  }
  if ((*(unsigned char *)(v3 + 64) & 4) != 0)
  {
    if (objc_opt_respondsToSelector())
    {
      if (![*(id *)(v3 + 48) spatialOverCaptureMovie]) {
        objc_msgSend(*(id *)(v3 + 48), "setSpatialOverCaptureMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(v3 + 48), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieFileURL"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieMetadata")));
      }
      uint64_t result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovie:", *(void *)(v3 + 32), objc_msgSend(*(id *)(v3 + 48), "spatialOverCaptureMovie"));
    }
    else
    {
      uint64_t result = objc_opt_respondsToSelector();
      if (result) {
        uint64_t result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovieFileAtEventualURL:resolvedSettings:", *(void *)(v3 + 32), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieFileURL"), *(void *)(v3 + 40));
      }
    }
  }
  if ((*(unsigned char *)(v3 + 64) & 8) != 0)
  {
    if (objc_opt_respondsToSelector())
    {
      if (![*(id *)(v3 + 48) movie]) {
        objc_msgSend(*(id *)(v3 + 48), "setMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(v3 + 48), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieFileURL"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieMetadata")));
      }
      uint64_t result = objc_msgSend(a2, "captureOutput:didFinishWritingMovie:error:", *(void *)(v3 + 32), objc_msgSend(*(id *)(v3 + 48), "movie"), *(void *)(v3 + 56));
    }
    else
    {
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v4 = *(void *)(v3 + 32);
        uint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "movieFileURL");
        uint64_t v6 = *(void *)(v3 + 40);
        uint64_t v7 = *(void *)(v3 + 56);
        long long v12 = *MEMORY[0x1E4F1F9F8];
        uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        uint64_t result = [a2 captureOutput:v4 didFinishWritingMovieFileAtURL:v5 debugMetadataSidecarFileURL:0 previewPixelBuffer:0 duration:&v12 resolvedSettings:v6 error:v7];
      }
    }
  }
  if ((*(unsigned char *)(v3 + 64) & 0x10) != 0)
  {
    if (objc_opt_respondsToSelector())
    {
      if (![*(id *)(v3 + 48) spatialOverCaptureMovie]) {
        objc_msgSend(*(id *)(v3 + 48), "setSpatialOverCaptureMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(v3 + 48), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieFileURL"), objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieMetadata")));
      }
      uint64_t result = objc_msgSend(a2, "captureOutput:didFinishWritingMovie:error:", *(void *)(v3 + 32), objc_msgSend(*(id *)(v3 + 48), "spatialOverCaptureMovie"), *(void *)(v3 + 56));
    }
    else
    {
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v8 = *(void *)(v3 + 32);
        uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 48), "unresolvedSettings"), "spatialOverCaptureMovieFileURL");
        uint64_t v10 = *(void *)(v3 + 40);
        uint64_t v11 = *(void *)(v3 + 56);
        long long v12 = *MEMORY[0x1E4F1F9F8];
        uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
        uint64_t result = [a2 captureOutput:v8 didFinishWritingMovieFileAtURL:v9 debugMetadataSidecarFileURL:0 previewPixelBuffer:0 duration:&v12 resolvedSettings:v10 error:v11];
      }
    }
  }
  if ((*(unsigned char *)(v3 + 64) & 0x20) != 0)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return [a2 captureOutput:*(void *)(v3 + 32) didFinishMovieCaptureForResolvedSettings:*(void *)(v3 + 40) error:*(void *)(v3 + 56)];
    }
  }
  return result;
}

- (id)_movieRequestForUniqueID:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1A6234330](self->_internal->requestsLock, a2);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  movieRequests = self->_internal->movieRequests;
  uint64_t v6 = [(NSMutableArray *)movieRequests countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(movieRequests);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v10, "unresolvedSettings"), "uniqueID") == a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)movieRequests countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:
  MEMORY[0x1A6234340](self->_internal->requestsLock);
  return v11;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51778]), "longLongValue");
    if ([a3 isEqualToString:*MEMORY[0x1E4F515F8]])
    {
      [(AVCapturePhotoOutput *)self _handlePreparationCompleteNotificationWithPayload:a4 settingsID:v7];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F515F0]])
    {
      [(AVCapturePhotoOutput *)self _resetLivePhotoMovieProcessingSuspended];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F515E8]])
    {
      [(AVCapturePhotoOutput *)self _resetLivePhotoCaptureSuspended];
    }
    else
    {
      unint64_t v8 = [(AVCapturePhotoOutput *)self _photoRequestForUniqueID:v7];
      unint64_t v9 = [(AVCapturePhotoOutput *)self _movieRequestForUniqueID:v7];
      if (v8 | v9)
      {
        if (v8)
        {
          if ([a3 isEqualToString:*MEMORY[0x1E4F51620]])
          {
            [(AVCapturePhotoOutput *)self _handleWillBeginCaptureBeforeResolvingSettingsNotificationWithPayload:a4 forRequest:v8];
          }
          else if ([a3 isEqualToString:*MEMORY[0x1E4F51618]])
          {
            [(AVCapturePhotoOutput *)self _handleWillBeginCaptureNotificationWithPayload:a4 forRequest:v8];
          }
          else if ([a3 isEqualToString:*MEMORY[0x1E4F51628]])
          {
            [(AVCapturePhotoOutput *)self _handleWillCaptureStillImageNotificationWithPayload:a4 forRequest:v8];
          }
          else if ([a3 isEqualToString:*MEMORY[0x1E4F515C8]])
          {
            [(AVCapturePhotoOutput *)self _handleDidCaptureStillImageNotificationWithPayload:a4 forRequest:v8];
          }
          else if ([a3 isEqualToString:*MEMORY[0x1E4F51608]])
          {
            [(AVCapturePhotoOutput *)self _handleReadyForResponsiveRequestWithPayload:a4 forRequest:v8];
          }
          else if (([a3 isEqualToString:*MEMORY[0x1E4F51610]] & 1) != 0 {
                 || ([a3 isEqualToString:*MEMORY[0x1E4F51600]] & 1) != 0
          }
                 || [a3 isEqualToString:*MEMORY[0x1E4F515A8]])
          {
            [(AVCapturePhotoOutput *)self _handleStillImageCompleteNotification:a3 withPayload:a4 forRequest:v8];
          }
          else if ([a3 isEqualToString:*MEMORY[0x1E4F515E0]])
          {
            if (!objc_msgSend((id)objc_msgSend((id)v8, "unresolvedSettings"), "videoFileURL"))
            {
              [(AVCapturePhotoOutput *)self _handleDidRecordIrisMovieNotificationWithPayload:a4 forRequest:v8];
            }
          }
          else if ([a3 isEqualToString:*MEMORY[0x1E4F515D0]])
          {
            if (objc_msgSend((id)objc_msgSend((id)v8, "unresolvedSettings"), "videoFileURL"))
            {
              [(AVCapturePhotoOutput *)self _handleDidFinishRecordingVideoNotificationWithPayload:a4 forRequest:v8];
            }
            else
            {
              [(AVCapturePhotoOutput *)self _handleDidFinishRecordingIrisMovieNotificationWithPayload:a4 forRequest:v8];
            }
          }
        }
        else
        {
          unint64_t v10 = v9;
          if (v9)
          {
            if ([a3 isEqualToString:*MEMORY[0x1E4F515B8]])
            {
              [(AVCapturePhotoOutput *)self _handleDidBeginRecordingMomentCaptureMovieNotificationWithPayload:a4 forRequest:v10];
            }
            else if ([a3 isEqualToString:*MEMORY[0x1E4F515E0]])
            {
              [(AVCapturePhotoOutput *)self _handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload:a4 forRequest:v10];
            }
            else if ([a3 isEqualToString:*MEMORY[0x1E4F515D8]])
            {
              [(AVCapturePhotoOutput *)self _handleDidFinishWritingMomentCaptureMovieNotificationWithPayload:a4 forRequest:v10];
            }
          }
        }
      }
    }
  }
}

- (id)_errorForFigCaptureSessionNotificationPayloadErrorStatus:(int)a3 userInfo:(id)a4
{
  if (!a3) {
    return 0;
  }
  if (a3 == -15541) {
    return (id)AVLocalizedError();
  }
  return (id)AVLocalizedErrorWithUnderlyingOSStatus();
}

- (void)_handleWillBeginCaptureBeforeResolvingSettingsNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  if (!objc_msgSend(a4, "resolvedSettings", a3))
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 1);
    uint64_t v6 = (void *)[a4 delegateStorage];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _OWORD v7[2] = __105__AVCapturePhotoOutput__handleWillBeginCaptureBeforeResolvingSettingsNotificationWithPayload_forRequest___block_invoke;
    v7[3] = &unk_1E5A73C30;
    v7[4] = self;
    void v7[5] = a4;
    [v6 invokeDelegateCallbackWithBlock:v7];
  }
}

uint64_t __105__AVCapturePhotoOutput__handleWillBeginCaptureBeforeResolvingSettingsNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "unresolvedSettings"), "uniqueID");
    return [a2 captureOutput:v5 willBeginCaptureBeforeResolvingSettingsForUniqueID:v6];
  }
  return result;
}

- (void)_handleWillBeginCaptureNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  unsigned int v65 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A50]), "intValue");
  uint64_t v64 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A48]), "intValue");
  if (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "previewPhotoFormat"))
  {
    LODWORD(v7) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F519D0]), "intValue");
    uint64_t v63 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F519C8]), "intValue") << 32;
    uint64_t v7 = v7;
  }
  else
  {
    uint64_t v63 = 0;
    uint64_t v7 = 0;
  }
  unsigned int v61 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A70]), "intValue");
  uint64_t v60 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A68]), "intValue");
  unsigned int v59 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F519F8]), "intValue");
  uint64_t v58 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F519F0]), "intValue");
  unsigned int v57 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F519E8]), "intValue");
  uint64_t v56 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F519E0]), "intValue");
  int v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51990]), "intValue");
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51988]), "intValue");
  unsigned int v55 = v8;
  uint64_t v62 = v7;
  uint64_t v54 = v9;
  BOOL v10 = v8 >= 1 && (int)v9 > 0 || objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURL") != 0;
  BOOL v31 = v10;
  unsigned int v53 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F519C0]), "intValue");
  uint64_t v52 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F519B8]), "intValue");
  unsigned int v51 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51978]), "intValue");
  uint64_t v50 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51970]), "intValue");
  unsigned int v49 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A18]), "intValue");
  uint64_t v48 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A10]), "intValue");
  unsigned int v47 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A60]), "intValue");
  uint64_t v46 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A58]), "intValue");
  unsigned int v45 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51960]), "intValue");
  uint64_t v44 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51958]), "intValue");
  unsigned int v43 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A30]), "intValue");
  uint64_t v42 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A28]), "intValue");
  uint64_t v11 = *MEMORY[0x1E4F51998];
  if ([a3 objectForKeyedSubscript:*MEMORY[0x1E4F51998]]) {
    int v41 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v11), "BOOLValue") ^ 1;
  }
  else {
    LOBYTE(v41) = 0;
  }
  double v66 = self;
  char v40 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51950]), "BOOLValue");
  char v39 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A00]), "BOOLValue");
  char v38 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51968]), "BOOLValue");
  char v37 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F519D8]), "BOOLValue");
  char v36 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F519A0]), "BOOLValue");
  char v35 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A08]), "BOOLValue");
  char v34 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A38]), "BOOLValue");
  char v33 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51928]), "BOOLValue");
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&v69.start.value = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&v69.start.epoch = v12;
  *(_OWORD *)&v69.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  CFDictionaryRef v13 = (const __CFDictionary *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F519B0]];
  if (v13) {
    CMTimeRangeMakeFromDictionary(&v69, v13);
  }
  char v32 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51980]), "BOOLValue");
  char v14 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A40]), "BOOLValue");
  id v15 = (id)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F519A8]];
  unsigned int v16 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51938]), "intValue");
  uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51930]), "intValue");
  uint64_t v18 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  if (v18 && !v15) {
    id v15 = (id)objc_msgSend((id)objc_msgSend(a4, "expectedPhotoManifest"), "copy");
  }
  char v19 = [a4 firedCallbackFlags];
  uint64_t v20 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51940]), "unsignedIntegerValue");
  uint64_t v21 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51948]];
  uint64_t v22 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID");
  CMTimeRange v68 = v69;
  LOBYTE(v30) = v19 & 1;
  BYTE1(v29) = v14;
  LOBYTE(v29) = v32;
  LOBYTE(v28) = v34;
  HIBYTE(v27) = v33;
  BYTE6(v27) = v35;
  BYTE5(v27) = v36;
  BYTE4(v27) = v37;
  BYTE3(v27) = v38;
  BYTE2(v27) = v39;
  BYTE1(v27) = v40;
  LOBYTE(v27) = v41;
  LOBYTE(v26) = v31;
  id v23 = +[AVCaptureResolvedPhotoSettings resolvedSettingsWithUniqueID:photoDimensions:rawPhotoDimensions:previewDimensions:embeddedThumbnailDimensions:rawEmbeddedThumbnailDimensions:livePhotoMovieEnabled:livePhotoMovieDimensions:portraitEffectsMatteDimensions:hairSegmentationMatteDimensions:skinSegmentationMatteDimensions:teethSegmentationMatteDimensions:glassesSegmentationMatteDimensions:spatialOverCapturePhotoDimensions:turboModeEnabled:flashEnabled:redEyeReductionEnabled:HDREnabled:adjustedPhotoFiltersEnabled:EV0PhotoDeliveryEnabled:stillImageStabilizationEnabled:virtualDeviceFusionEnabled:squareCropEnabled:deferredPhotoProxyDimensions:photoProcessingTimeRange:contentAwareDistortionCorrectionEnabled:spatialPhotoCaptureEnabled:photoManifest:digitalFlashUserInterfaceHints:digitalFlashUserInterfaceRGBEstimate:captureBeforeResolvingSettingsEnabled:](AVCaptureResolvedPhotoSettings, "resolvedSettingsWithUniqueID:photoDimensions:rawPhotoDimensions:previewDimensions:embeddedThumbnailDimensions:rawEmbeddedThumbnailDimensions:livePhotoMovieEnabled:livePhotoMovieDimensions:portraitEffectsMatteDimensions:hairSegmentationMatteDimensions:skinSegmentationMatteDimensions:teethSegmentationMatteDimensions:glassesSegmentationMatteDimensions:spatialOverCapturePhotoDimensions:turboModeEnabled:flashEnabled:redEyeReductionEnabled:HDREnabled:adjustedPhotoFiltersEnabled:EV0PhotoDeliveryEnabled:stillImageStabilizationEnabled:virtualDeviceFusionEnabled:squareCropEnabled:deferredPhotoProxyDimensions:photoProcessingTimeRange:contentAwareDistortionCorrectionEnabled:spatialPhotoCaptureEnabled:photoManifest:digitalFlashUserInterfaceHints:digitalFlashUserInterfaceRGBEstimate:captureBeforeResolvingSettingsEnabled:", v22, v65 | (unint64_t)(v64 << 32), v57 | (unint64_t)(v56 << 32), v62 | v63, v61 | (unint64_t)(v60 << 32), v59 | (unint64_t)(v58 << 32), v26, v55 | (unint64_t)(v54 << 32), v53 | (unint64_t)(v52 << 32), v51 | (unint64_t)(v50 << 32),
          v49 | (unint64_t)(v48 << 32),
          v47 | (unint64_t)(v46 << 32),
          v45 | (unint64_t)(v44 << 32),
          v43 | (unint64_t)(v42 << 32),
          v27,
          v28,
          v16 | (unint64_t)(v17 << 32),
          &v68,
          v29,
          v15,
          v20,
          v21,
          v30);
  [a4 setResolvedSettings:v23];
  MEMORY[0x1A6234330](v66->_internal->requestsLock);
  BOOL v24 = [(AVCapturePhotoOutput *)v66 _requestUsesWaitingForCaptureReadiness:a4];
  if (v24) {
    v66->_internal->readinessState.inflightUniqueIDWaitingForCapture = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID");
  }
  if ([(AVCapturePhotoOutput *)v66 _requestUsesWaitingForProcessingReadiness:a4])
  {
    v66->_internal->readinessState.int64_t inflightUniqueIDWaitingForProcessing = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID");
    MEMORY[0x1A6234340](v66->_internal->requestsLock);
  }
  else
  {
    MEMORY[0x1A6234340](v66->_internal->requestsLock);
    if (!v24) {
      goto LABEL_22;
    }
  }
  [(AVCapturePhotoOutput *)v66 _updateCaptureReadiness];
LABEL_22:
  if (v18)
  {
    uint64_t v70 = *MEMORY[0x1E4F47B88];
    v71[0] = &unk_1EF4FA790;
    -[AVCapturePhotoOutput _dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:](v66, "_dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:", 2147549183, a4, -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](v66, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v18, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1]), 1);
  }
  else
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 2);
    uint64_t v25 = (void *)[a4 delegateStorage];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __82__AVCapturePhotoOutput__handleWillBeginCaptureNotificationWithPayload_forRequest___block_invoke;
    v67[3] = &unk_1E5A73C30;
    v67[4] = v66;
    v67[5] = v23;
    [v25 invokeDelegateCallbackWithBlock:v67];
  }
}

uint64_t __82__AVCapturePhotoOutput__handleWillBeginCaptureNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [a2 captureOutput:v5 willBeginCaptureForResolvedSettings:v6];
  }
  return result;
}

- (void)_handleWillCaptureStillImageNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  v17[20] = *MEMORY[0x1E4F143B8];
  if (sIsForcedShutterSoundRegion
    || (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "isShutterSoundSuppressionEnabled") & 1) == 0)
  {
    unsigned int v8 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "shutterSound");
    if (v8) {
      AVCaptureStillImageOutputPlayShutterSound(self, v8);
    }
  }
  else if (dword_1EB4C9220)
  {
    int v15 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8], v11, v12), "intValue");
  if (v9)
  {
    uint64_t v16 = *MEMORY[0x1E4F47B88];
    v17[0] = &unk_1EF4FA8C8;
    -[AVCapturePhotoOutput _dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:", 2147549183, a4, -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v9, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1]), 1);
  }
  else
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 4);
    BOOL v10 = (void *)[a4 delegateStorage];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __87__AVCapturePhotoOutput__handleWillCaptureStillImageNotificationWithPayload_forRequest___block_invoke;
    v13[3] = &unk_1E5A73C30;
    v13[4] = self;
    v13[5] = a4;
    [v10 invokeDelegateCallbackWithBlock:v13];
  }
}

uint64_t __87__AVCapturePhotoOutput__handleWillCaptureStillImageNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) resolvedSettings];
    return [a2 captureOutput:v5 willCapturePhotoForResolvedSettings:v6];
  }
  return result;
}

- (void)_handleDidCaptureStillImageNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  MEMORY[0x1A6234330](self->_internal->requestsLock);
  internal = self->_internal;
  if (internal->readinessState.inflightUniqueIDWaitingForCapture
    && (uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "uniqueID"),
        internal = self->_internal,
        v8 >= internal->readinessState.inflightUniqueIDWaitingForCapture))
  {
    internal->readinessState.inflightUniqueIDWaitingForCapture = 0;
    MEMORY[0x1A6234340](self->_internal->requestsLock);
    [(AVCapturePhotoOutput *)self _updateCaptureReadiness];
    if (v6) {
      goto LABEL_4;
    }
  }
  else
  {
    MEMORY[0x1A6234340](internal->requestsLock);
    if (v6)
    {
LABEL_4:
      uint64_t v11 = *MEMORY[0x1E4F47B88];
      v12[0] = &unk_1EF4FA8C8;
      -[AVCapturePhotoOutput _dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forPhotoRequest:withError:cleanupRequest:", 2147549183, a4, -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v6, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1]), 1);
      return;
    }
  }
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 8);
  uint64_t v9 = (void *)[a4 delegateStorage];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __86__AVCapturePhotoOutput__handleDidCaptureStillImageNotificationWithPayload_forRequest___block_invoke;
  v10[3] = &unk_1E5A73C30;
  v10[4] = self;
  v10[5] = a4;
  [v9 invokeDelegateCallbackWithBlock:v10];
}

uint64_t __86__AVCapturePhotoOutput__handleDidCaptureStillImageNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) resolvedSettings];
    return [a2 captureOutput:v5 didCapturePhotoForResolvedSettings:v6];
  }
  return result;
}

- (void)_handleReadyForResponsiveRequestWithPayload:(id)a3 forRequest:(id)a4
{
  if (([a4 firedCallbackFlags] & 0x8000) == 0)
  {
    [(AVCapturePhotoOutput *)self _updateCaptureReadinessStateForCompletedRequest:a4];
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x8000);
    uint64_t v7 = (void *)[a4 delegateStorage];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __79__AVCapturePhotoOutput__handleReadyForResponsiveRequestWithPayload_forRequest___block_invoke;
    void v8[3] = &unk_1E5A73C30;
    v8[4] = self;
    void v8[5] = a4;
    [v7 invokeDelegateCallbackWithBlock:v8];
    [(AVCapturePhotoOutput *)self _handlePotentiallyFinalPhotoRequestCallbackWithPayload:a3 forRequest:a4];
  }
}

uint64_t __79__AVCapturePhotoOutput__handleReadyForResponsiveRequestWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) resolvedSettings];
    return [a2 captureOutput:v5 readyForResponsiveRequestAfterResolvedSettings:v6];
  }
  return result;
}

- (void)_handleStillImageCompleteNotification:(id)a3 withPayload:(id)a4 forRequest:(id)a5
{
  v84[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  uint64_t v83 = *MEMORY[0x1E4F47B88];
  v84[0] = &unk_1EF4FA8C8;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
  if (v9) {
    uint64_t v11 = [(AVCapturePhotoOutput *)self _errorForFigCaptureSessionNotificationPayloadErrorStatus:v9 userInfo:v10];
  }
  else {
    uint64_t v11 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "rawPhotoPixelFormatType")) {
    char v12 = objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "formatFourCC") != 0;
  }
  else {
    char v12 = 0;
  }
  uint64_t v13 = [a5 firedPhotoCallbacksCount];
  if (v13 == [a5 expectedPhotoCount]) {
    return;
  }
  objc_msgSend(a5, "setFiredPhotoCallbacksCount:", objc_msgSend(a5, "firedPhotoCallbacksCount") + 1);
  uint64_t v14 = [a5 firedPhotoCallbacksCount];
  if (v14 == [a5 expectedPhotoCount])
  {
    objc_msgSend(a5, "setFiredCallbackFlags:", objc_msgSend(a5, "firedCallbackFlags") | 0x10);
    if (objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "digitalFlashMode")) {
      AVCaptureStillImageOutputPlayShutterSound(self, 0x462u);
    }
  }
  uint64_t v15 = [a5 firedPhotoCallbacksCount];
  unint64_t v16 = v15 - 1;
  uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "resolvedSettings"), "photoManifest"), "objectAtIndexedSubscript:", v15 - 1), "unsignedIntValue");
  if (![a5 photoCallbackFlavor])
  {
    uint64_t v75 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51790]];
    uint64_t v74 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51798]), "unsignedIntegerValue");
    uint64_t v21 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51748]];
    if (v21)
    {
      uint64_t v72 = v21;
      objc_msgSend(a5, "setPreviewSurface:");
    }
    else
    {
      uint64_t v72 = [a5 previewSurface];
    }
    uint64_t v26 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F517B0]];
    if (v26)
    {
      uint64_t v69 = v26;
      [a5 setThumbnailSurface:v26];
    }
    else
    {
      uint64_t v69 = [a5 thumbnailSurface];
    }
    uint64_t v71 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F516B0]];
    uint64_t v70 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516B8]), "unsignedIntegerValue");
    unsigned int v68 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516A0]), "unsignedIntValue");
    unsigned int v67 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F516A8]), "intValue");
    long long v76 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51708]];
    CMTime v82 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    CFDictionaryRef v27 = (const __CFDictionary *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F51738]];
    if (v27) {
      CMTimeMakeFromDictionary(&v82, v27);
    }
    unsigned int v63 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51710]), "unsignedIntValue");
    unsigned int v61 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51718]), "intValue");
    uint64_t v66 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F516C0]];
    uint64_t v65 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F516C8]];
    uint64_t v64 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51730]];
    uint64_t v62 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51728]];
    uint64_t v60 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51700]];
    uint64_t v59 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F516F8]];
    uint64_t v58 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51788]];
    uint64_t v57 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51780]];
    uint64_t v56 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F517A8]];
    uint64_t v55 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F517A0]];
    uint64_t v54 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F516F0]];
    uint64_t v53 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F516E8]];
    uint64_t v52 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51688]];
    uint64_t v51 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51690]];
    if (!v75 || !v74)
    {
      BOOL v28 = !v70 || v71 == 0;
      if (v28 && !v11) {
        uint64_t v11 = AVLocalizedError();
      }
    }
    if (!v76) {
      long long v76 = (void *)po_metadataWithMakerNoteProcessingFlags(v17);
    }
    [a5 unresolvedSettings];
    objc_opt_class();
    uint64_t v73 = v15;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = (void *)[v76 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
      uint64_t v30 = (void *)[v29 objectForKeyedSubscript:*MEMORY[0x1E4F51040]];
      if (v30)
      {
        uint64_t v31 = [v30 integerValue];
        uint64_t v32 = v31 - 1;
      }
      else
      {
        unint64_t v34 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count");
        if (v34) {
          v16 /= v34;
        }
        uint64_t v32 = v16 >> v12;
        uint64_t v31 = (v16 >> v12) + 1;
      }
      uint64_t v33 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "bracketedSettings"), "objectAtIndexedSubscript:", v32);
    }
    else
    {
      uint64_t v31 = 0;
      uint64_t v33 = 0;
    }
    int v35 = v17;
    if ([a3 isEqualToString:*MEMORY[0x1E4F515A8]])
    {
      uint64_t v36 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
      uint64_t v37 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51678]];
      uint64_t v38 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51720]];
      id v39 = +[AVCapturePhoto AVFileTypeFromFigCaptureStillImageSettingsFileType:codec:unresolvedSettings:](AVCapturePhoto, "AVFileTypeFromFigCaptureStillImageSettingsFileType:codec:unresolvedSettings:", v67, v68, [a5 unresolvedSettings]);
      char v40 = [AVCaptureDeferredPhotoProxy alloc];
      sourceDeviceType = self->_internal->sourceDeviceType;
      CMTime v81 = v82;
      LODWORD(v49) = v35;
      uint64_t v42 = [(AVCaptureDeferredPhotoProxy *)v40 initWithTimestamp:&v81 proxySurface:v71 proxySurfaceSize:v70 proxyFileType:v39 previewPhotoSurface:v72 metadata:v76 captureRequest:a5 sequenceCount:v31 photoCount:v73 applicationIdentifier:v36 captureRequestIdentifier:v37 photoIdentifier:v38 expectedPhotoProcessingFlags:v49 sourceDeviceType:sourceDeviceType];
      BOOL v24 = (void *)[a5 delegateStorage];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke_2;
      v79[3] = &unk_1E5A73BB8;
      v79[4] = self;
      v79[5] = v42;
      v79[6] = v11;
      uint64_t v25 = v79;
    }
    else
    {
      id v43 = +[AVCapturePhoto AVFileTypeFromFigCaptureStillImageSettingsFileType:codec:unresolvedSettings:](AVCapturePhoto, "AVFileTypeFromFigCaptureStillImageSettingsFileType:codec:unresolvedSettings:", v61, v63, [a5 unresolvedSettings]);
      uint64_t v44 = [AVCapturePhoto alloc];
      unsigned int v45 = self->_internal->sourceDeviceType;
      CMTime v81 = v82;
      LODWORD(v50) = v17;
      uint64_t v46 = -[AVCapturePhoto initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:](v44, "initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:", &v81, v75, v74, v43, v72, v69, v76, v66, v65, v64, v62,
              v60,
              v59,
              v58,
              v57,
              v56,
              v55,
              v54,
              v53,
              v52,
              v51,
              a5,
              v33,
              v31,
              v73,
              v50,
              v45);
      BOOL v24 = (void *)[a5 delegateStorage];
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke;
      v80[3] = &unk_1E5A73BB8;
      v80[4] = self;
      v80[5] = v46;
      v80[6] = v11;
      uint64_t v25 = v80;
    }
    goto LABEL_57;
  }
  uint64_t v18 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51768]];
  uint64_t v19 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51740]];
  if (v19)
  {
    uint64_t v20 = (const void *)v19;
    [a5 setPreviewSampleBuffer:v19];
  }
  else
  {
    uint64_t v20 = (const void *)[a5 previewSampleBuffer];
  }
  if (!(v18 | v11)) {
    uint64_t v11 = AVLocalizedError();
  }
  uint64_t v22 = (void *)CMGetAttachment((CMAttachmentBearerRef)v18, (CFStringRef)*MEMORY[0x1E4F2FC20], 0);
  if (v22) {
    LODWORD(v17) = objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", @"25"), "unsignedIntValue");
  }
  [a5 unresolvedSettings];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "unresolvedSettings"), "bracketedSettings"), "objectAtIndexedSubscript:", v16 >> v12);
    if (!v18) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  uint64_t v23 = 0;
  if (v18) {
LABEL_25:
  }
    CFRetain((CFTypeRef)v18);
LABEL_26:
  if (v20) {
    CFRetain(v20);
  }
  BOOL v24 = (void *)[a5 delegateStorage];
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke_3;
  v77[3] = &unk_1E5A79ED8;
  int v78 = v17;
  v77[8] = v18;
  v77[9] = v20;
  v77[4] = self;
  v77[5] = a5;
  v77[6] = v23;
  v77[7] = v11;
  uint64_t v25 = v77;
LABEL_57:
  [v24 invokeDelegateCallbackWithBlock:v25];
  uint64_t v47 = [a5 firedPhotoCallbacksCount];
  if (v47 == [a5 expectedPhotoCount])
  {
    [a5 setPreviewSurface:0];
    [a5 setPreviewSampleBuffer:0];
    [a5 setThumbnailSurface:0];
  }
  [(AVCapturePhotoOutput *)self _handlePotentiallyFinalPhotoRequestCallbackWithPayload:a4 forRequest:a5];
  if (v11)
  {
    uint64_t v48 = [a5 firedPhotoCallbacksCount];
    if (v48 == [a5 expectedPhotoCount] && po_allLivePhotoCallbacksHaveFinishedRecordingForRequest(a5)) {
      [(AVCapturePhotoOutput *)self _dispatchFailureCallbacks:2147549183 forPhotoRequest:a5 withError:v11 cleanupRequest:1];
    }
  }
}

void __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke(void *a1, void *a2)
{
  [a2 captureOutput:a1[4] didFinishProcessingPhoto:a1[5] error:a1[6]];
  uint64_t v3 = (void *)a1[5];
}

void __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke_2(void *a1, void *a2)
{
  [a2 captureOutput:a1[4] didFinishCapturingDeferredPhotoProxy:a1[5] error:a1[6]];
  uint64_t v3 = (void *)a1[5];
}

void __85__AVCapturePhotoOutput__handleStillImageCompleteNotification_withPayload_forRequest___block_invoke_3(uint64_t a1, void *a2)
{
  int v4 = *(_DWORD *)(a1 + 80) & 0x10080;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) resolvedSettings];
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  if (v4) {
    [a2 captureOutput:v7 didFinishProcessingRawPhotoSampleBuffer:v5 previewPhotoSampleBuffer:v6 resolvedSettings:v8 bracketSettings:v9 error:v10];
  }
  else {
    [a2 captureOutput:v7 didFinishProcessingPhotoSampleBuffer:v5 previewPhotoSampleBuffer:v6 resolvedSettings:v8 bracketSettings:v9 error:v10];
  }
  uint64_t v11 = *(const void **)(a1 + 64);
  if (v11) {
    CFRelease(v11);
  }
  char v12 = *(const void **)(a1 + 72);
  if (v12)
  {
    CFRelease(v12);
  }
}

- (void)_handleDidRecordIrisMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v6 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings", a3), "isEV0PhotoDeliveryEnabled")
    && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto")
    && ([a4 firedCallbackFlags] & 0x20) == 0;
  int v7 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "spatialOverCapturePhotoDimensions");
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
  int v9 = [a4 firedCallbackFlags];
  if (v6)
  {
    [a4 setFiredCallbackFlags:v9 | 0x20u];
    objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto"));
    if (v7 >= 1
      && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"))
    {
      objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x40);
      objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"));
    }
  }
  else
  {
    [a4 setFiredCallbackFlags:v9 | 0x80u];
    objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURL"));
    if (v7 >= 1 && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL"))
    {
      objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x100);
      objc_msgSend(v8, "addObject:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL"));
    }
    if (sIsForcedShutterSoundRegion)
    {
      MEMORY[0x1A6234330](self->_internal->requestsLock);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      photoRequests = self->_internal->photoRequests;
      uint64_t v11 = [(NSMutableArray *)photoRequests countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(photoRequests);
            }
            if (!po_allLivePhotoCallbacksHaveFinishedRecordingForRequest(*(void **)(*((void *)&v19 + 1) + 8 * i)))
            {
              MEMORY[0x1A6234340](self->_internal->requestsLock);
              goto LABEL_23;
            }
          }
          uint64_t v12 = [(NSMutableArray *)photoRequests countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      MEMORY[0x1A6234340](self->_internal->requestsLock);
      beginEndIrisMovieCaptureHostTimeQueue = self->_internal->beginEndIrisMovieCaptureHostTimeQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke;
      block[3] = &unk_1E5A72ED0;
      block[4] = self;
      dispatch_async(beginEndIrisMovieCaptureHostTimeQueue, block);
    }
  }
LABEL_23:
  unint64_t v16 = (void *)[a4 delegateStorage];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke_3;
  v17[3] = &unk_1E5A73BB8;
  v17[4] = v8;
  v17[5] = self;
  v17[6] = a4;
  [v16 invokeDelegateCallbackWithBlock:v17];
}

void __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 32) + 16) + 368));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F51638];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v6, HostTimeClock);
  [v2 setFigCaptureSessionSectionProperty:v3 withHostTime:&v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke_2;
  void v5[3] = &unk_1E5A72ED0;
  v5[4] = *(void *)(a1 + 32);
  AudioServicesPlaySystemSoundWithCompletion(0x45Eu, v5);
}

void __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F51630];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v5, HostTimeClock);
  [v2 setFigCaptureSessionSectionProperty:v3 withHostTime:&v5];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 32) + 16) + 368));
}

uint64_t __84__AVCapturePhotoOutput__handleDidRecordIrisMovieNotificationWithPayload_forRequest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v4 = *(void **)(a1 + 32);
  uint64_t result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(a2, "captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", *(void *)(a1 + 40), v9, objc_msgSend(*(id *)(a1 + 48), "resolvedSettings"));
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

- (void)_handlePotentiallyFinalPhotoRequestCallbackWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7 = [a4 firedPhotoCallbacksCount];
  if (v7 == [a4 expectedPhotoCount])
  {
    if (!objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "livePhotoMovieEnabled")) {
      goto LABEL_16;
    }
    int v8 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "isEV0PhotoDeliveryEnabled");
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "spatialOverCapturePhotoDimensions");
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURL");
    int v11 = v10 != 0;
    if (v8)
    {
      uint64_t v12 = v10;
      uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto");
      int v14 = v12 ? 2 : 1;
      if (v13) {
        int v11 = v14;
      }
    }
    if (v9)
    {
      if (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL")) {
        ++v11;
      }
      if (v8
        && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto"))
      {
        ++v11;
      }
    }
    unsigned int v15 = ([a4 firedCallbackFlags] >> 11) & 1;
    unsigned int v16 = (([a4 firedCallbackFlags] >> 9) & 1) + v15;
    unsigned int v17 = ([a4 firedCallbackFlags] >> 12) & 1;
    if (v16 + v17 + (([a4 firedCallbackFlags] >> 10) & 1) == v11)
    {
LABEL_16:
      if (([a4 firedCallbackFlags] & 0x8000) != 0)
      {
        [(AVCapturePhotoOutput *)self _handleDidFinishCaptureNotificationWithPayload:a3 forRequest:a4];
      }
    }
  }
}

- (void)_handleDidFinishRecordingIrisMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  memset(&v26, 0, sizeof(v26));
  CMTimeMakeFromDictionary(&v26, (CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51508]]);
  memset(&v25, 0, sizeof(v25));
  CMTimeMakeFromDictionary(&v25, (CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51510]]);
  int v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F514F8]), "BOOLValue");
  BOOL v9 = (int)objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "spatialOverCapturePhotoDimensions") >= 1
    && objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureLivePhotoMovieFileURL") != 0;
  int v10 = v8 & v9;
  int v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F514F0]), "BOOLValue");
  if (objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "isEV0PhotoDeliveryEnabled")
    && (objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "livePhotoMovieFileURLForOriginalPhoto")
      ? (int v12 = v11)
      : (int v12 = 0),
        v12 == 1))
  {
    uint64_t v13 = (void *)[a4 unresolvedSettings];
    if (v10)
    {
      uint64_t v14 = [v13 spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto];
      uint64_t v15 = 1;
      int v16 = 1024;
    }
    else
    {
      uint64_t v14 = [v13 livePhotoMovieFileURLForOriginalPhoto];
      uint64_t v15 = 1;
      int v16 = 512;
    }
  }
  else
  {
    unsigned int v17 = (void *)[a4 unresolvedSettings];
    if (v10)
    {
      uint64_t v14 = [v17 spatialOverCaptureLivePhotoMovieFileURL];
      uint64_t v15 = 0;
      int v16 = 4096;
    }
    else
    {
      uint64_t v14 = [v17 livePhotoMovieFileURL];
      uint64_t v15 = 0;
      int v16 = 2048;
    }
  }
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | v16);
  if (v7) {
    id v18 = [(AVCapturePhotoOutput *)self _errorForFigCaptureSessionNotificationPayloadErrorStatus:v7 userInfo:[(AVCapturePhotoOutput *)self _avErrorUserInfoDictionaryForError:v7 photoRequest:a4 payload:a3 isOriginalMovie:v15]];
  }
  else {
    id v18 = 0;
  }
  long long v19 = (void *)[a4 delegateStorage];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__AVCapturePhotoOutput__handleDidFinishRecordingIrisMovieNotificationWithPayload_forRequest___block_invoke;
  v20[3] = &unk_1E5A79F00;
  char v23 = v15;
  char v24 = v10;
  v20[4] = a4;
  v20[5] = a3;
  void v20[6] = self;
  v20[7] = v14;
  CMTime v21 = v26;
  CMTime v22 = v25;
  void v20[8] = v18;
  [v19 invokeDelegateCallbackWithBlock:v20];
  [(AVCapturePhotoOutput *)self _handlePotentiallyFinalPhotoRequestCallbackWithPayload:a3 forRequest:a4];
}

uint64_t __93__AVCapturePhotoOutput__handleDidFinishRecordingIrisMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  if ([*(id *)(a1 + 32) delegateSupportsMetadataIdentifiersCallback])
  {
    uint64_t v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F51500]];
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = MEMORY[0x1E4F1CC08];
    }
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = [*(id *)(a1 + 32) resolvedSettings];
    uint64_t v9 = *(void *)(a1 + 64);
    long long v23 = *(_OWORD *)(a1 + 72);
    uint64_t v24 = *(void *)(a1 + 88);
    long long v21 = *(_OWORD *)(a1 + 96);
    uint64_t v22 = *(void *)(a1 + 112);
    return [a2 captureOutput:v6 didFinishProcessingLivePhotoToMovieFileAtURL:v7 duration:&v23 photoDisplayTime:&v21 metadataIdentifiers:v5 resolvedSettings:v8 error:v9];
  }
  else if ([*(id *)(a1 + 32) delegateSupportsDebugMetadataSidecarFile])
  {
    uint64_t v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F51698]];
    if (v11) {
      uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v19 = [*(id *)(a1 + 32) resolvedSettings];
    uint64_t v20 = *(void *)(a1 + 64);
    long long v23 = *(_OWORD *)(a1 + 72);
    uint64_t v24 = *(void *)(a1 + 88);
    long long v21 = *(_OWORD *)(a1 + 96);
    uint64_t v22 = *(void *)(a1 + 112);
    return [a2 captureOutput:v17 didFinishProcessingLivePhotoToMovieFileAtURL:v18 debugMetadataSidecarFileURL:v12 duration:&v23 photoDisplayTime:&v21 resolvedSettings:v19 error:v20];
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = [*(id *)(a1 + 32) resolvedSettings];
    uint64_t v16 = *(void *)(a1 + 64);
    long long v23 = *(_OWORD *)(a1 + 72);
    uint64_t v24 = *(void *)(a1 + 88);
    long long v21 = *(_OWORD *)(a1 + 96);
    uint64_t v22 = *(void *)(a1 + 112);
    return [a2 captureOutput:v13 didFinishProcessingLivePhotoToMovieFileAtURL:v14 duration:&v23 photoDisplayTime:&v21 resolvedSettings:v15 error:v16];
  }
}

- (void)_handleDidFinishRecordingVideoNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeFromDictionary(&v13, (CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51508]]);
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x4000);
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "videoFileURL");
  if (v7) {
    id v9 = [(AVCapturePhotoOutput *)self _errorForFigCaptureSessionNotificationPayloadErrorStatus:v7 userInfo:[(AVCapturePhotoOutput *)self _avErrorUserInfoDictionaryForError:v7 photoRequest:a4 payload:a3 isOriginalMovie:0]];
  }
  else {
    id v9 = 0;
  }
  int v10 = (void *)[a4 delegateStorage];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__AVCapturePhotoOutput__handleDidFinishRecordingVideoNotificationWithPayload_forRequest___block_invoke;
  void v11[3] = &unk_1E5A79F28;
  v11[4] = self;
  void v11[5] = v8;
  v11[7] = v9;
  v11[8] = 0;
  CMTime v12 = v13;
  void v11[6] = a4;
  [v10 invokeDelegateCallbackWithBlock:v11];
  if (([a4 firedCallbackFlags] & 0x2010) != 0) {
    [(AVCapturePhotoOutput *)self _handleDidFinishCaptureNotificationWithPayload:a3 forRequest:a4];
  }
}

uint64_t __89__AVCapturePhotoOutput__handleDidFinishRecordingVideoNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 48) resolvedSettings];
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  long long v10 = *(_OWORD *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 88);
  return [a2 captureOutput:v4 didFinishProcessingVideoFileAtURL:v5 resolvedSettings:v6 previewPixelBuffer:v7 recordedDuration:&v10 error:v8];
}

- (id)_avErrorUserInfoDictionaryForError:(int)a3 photoRequest:(id)a4 payload:(id)a5 isOriginalMovie:(BOOL)a6
{
  BOOL v6 = a6;
  long long v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F51760]];
  if (v11) {
    [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F47B90]];
  }
  [v10 setObject:&unk_1EF4FA8E0 forKeyedSubscript:*MEMORY[0x1E4F47B88]];
  if (a3 == -16411)
  {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "videoFileURL");
    CMTime v13 = (void *)[a4 unresolvedSettings];
    if (v12)
    {
      uint64_t v14 = [v13 videoFileURL];
    }
    else if (v6)
    {
      uint64_t v14 = [v13 livePhotoMovieFileURLForOriginalPhoto];
    }
    else
    {
      uint64_t v14 = [v13 livePhotoMovieFileURL];
    }
    if (v14) {
      [v10 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
    }
  }
  return v10;
}

- (id)_avErrorUserInfoDictionaryForError:(int)a3 movieRequest:(id)a4 payload:(id)a5 isSpatialOverCaptureMovie:(BOOL)a6
{
  BOOL v6 = a6;
  long long v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F51760]];
  if (v11) {
    [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F47B90]];
  }
  [v10 setObject:&unk_1EF4FA8E0 forKeyedSubscript:*MEMORY[0x1E4F47B88]];
  if (a3 == -16411)
  {
    uint64_t v12 = (void *)[a4 unresolvedSettings];
    if (v6) {
      uint64_t v13 = [v12 spatialOverCaptureMovieFileURL];
    }
    else {
      uint64_t v13 = [v12 movieFileURL];
    }
    if (v13) {
      [v10 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
    }
  }
  return v10;
}

- (void)_handleDidFinishCaptureNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  if (v7) {
    id v8 = [(AVCapturePhotoOutput *)self _errorForFigCaptureSessionNotificationPayloadErrorStatus:v7 userInfo:0];
  }
  else {
    id v8 = 0;
  }
  MEMORY[0x1A6234330](self->_internal->requestsLock);
  [(NSMutableArray *)self->_internal->photoRequests removeObject:a4];
  MEMORY[0x1A6234340](self->_internal->requestsLock);
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x80000000);
  id v9 = (void *)[a4 delegateStorage];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __82__AVCapturePhotoOutput__handleDidFinishCaptureNotificationWithPayload_forRequest___block_invoke;
  v10[3] = &unk_1E5A73BB8;
  v10[4] = self;
  v10[5] = a4;
  void v10[6] = v8;
  [v9 invokeDelegateCallbackWithBlock:v10];
}

uint64_t __82__AVCapturePhotoOutput__handleDidFinishCaptureNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) resolvedSettings];
    uint64_t v7 = *(void *)(a1 + 48);
    return [a2 captureOutput:v5 didFinishCaptureForResolvedSettings:v6 error:v7];
  }
  return result;
}

- (void)_handleDidBeginRecordingMomentCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F514E8]), "BOOLValue");
  unsigned int v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51990]), "intValue");
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51988]), "intValue");
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F51A20]), "BOOLValue")) {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "spatialOverCaptureMovieFileURL");
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = +[AVMomentCaptureMovieRecordingResolvedSettings movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:](AVMomentCaptureMovieRecordingResolvedSettings, "movieRecordingResolvedSettingsWithUniqueID:torchEnabled:movieURL:spatialOverCaptureURL:movieDimensions:", objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "uniqueID"), v8, objc_msgSend((id)objc_msgSend(a4, "unresolvedSettings"), "movieFileURL"), v11, v9 | (unint64_t)(v10 << 32));
  [a4 setResolvedSettings:v12];
  if (v7)
  {
    uint64_t v15 = *MEMORY[0x1E4F47B88];
    v16[0] = &unk_1EF4FA790;
    -[AVCapturePhotoOutput _dispatchFailureCallbacks:forMovieRequest:withError:cleanupRequest:](self, "_dispatchFailureCallbacks:forMovieRequest:withError:cleanupRequest:", 63, a4, -[AVCapturePhotoOutput _errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:](self, "_errorForFigCaptureSessionNotificationPayloadErrorStatus:userInfo:", v7, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1]), 1);
  }
  else
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 1);
    uint64_t v13 = (void *)[a4 delegateStorage];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __101__AVCapturePhotoOutput__handleDidBeginRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke;
    v14[3] = &unk_1E5A73C30;
    v14[4] = self;
    v14[5] = v12;
    [v13 invokeDelegateCallbackWithBlock:v14];
  }
}

uint64_t __101__AVCapturePhotoOutput__handleDidBeginRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    return [a2 captureOutput:v5 didBeginMovieCaptureForResolvedSettings:v6];
  }
  return result;
}

- (void)_handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings", a3), "spatialOverCaptureURL");
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 2);
  if (v6) {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 4);
  }
  if (sIsForcedShutterSoundRegion)
  {
    MEMORY[0x1A6234330](self->_internal->requestsLock);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    photoRequests = self->_internal->photoRequests;
    uint64_t v8 = [(NSMutableArray *)photoRequests countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(photoRequests);
          }
          if (!po_allLivePhotoCallbacksHaveFinishedRecordingForRequest(*(void **)(*((void *)&v17 + 1) + 8 * i)))
          {
            MEMORY[0x1A6234340](self->_internal->requestsLock);
            goto LABEL_14;
          }
        }
        uint64_t v9 = [(NSMutableArray *)photoRequests countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    MEMORY[0x1A6234340](self->_internal->requestsLock);
    beginEndIrisMovieCaptureHostTimeQueue = self->_internal->beginEndIrisMovieCaptureHostTimeQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke;
    block[3] = &unk_1E5A72ED0;
    block[4] = self;
    dispatch_async(beginEndIrisMovieCaptureHostTimeQueue, block);
  }
LABEL_14:
  uint64_t v13 = (void *)[a4 delegateStorage];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke_3;
  v14[3] = &unk_1E5A79FA0;
  v14[4] = a4;
  v14[5] = self;
  BOOL v15 = v6 != 0;
  [v13 invokeDelegateCallbackWithBlock:v14];
}

void __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 32) + 16) + 368));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F51638];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v6, HostTimeClock);
  [v2 setFigCaptureSessionSectionProperty:v3 withHostTime:&v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke_2;
  void v5[3] = &unk_1E5A72ED0;
  v5[4] = *(void *)(a1 + 32);
  AudioServicesPlaySystemSoundWithCompletion(0x45Eu, v5);
}

void __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F51630];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v5, HostTimeClock);
  [v2 setFigCaptureSessionSectionProperty:v3 withHostTime:&v5];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 32) + 16) + 368));
}

uint64_t __102__AVCapturePhotoOutput__handleDidFinishRecordingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke_3(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector())
  {
    if (![*(id *)(a1 + 32) movie]) {
      objc_msgSend(*(id *)(a1 + 32), "setMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), "movieURL"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "unresolvedSettings"), "movieMetadata")));
    }
    uint64_t result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovie:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "movie"));
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      uint64_t result = objc_msgSend(a2, "captureOutput:didFinishRecordingMovieFileAtEventualURL:resolvedSettings:", *(void *)(a1 + 40), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), "movieURL"), objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"));
    }
  }
  if (*(unsigned char *)(a1 + 48))
  {
    if (objc_opt_respondsToSelector())
    {
      if (![*(id *)(a1 + 32) spatialOverCaptureMovie]) {
        objc_msgSend(*(id *)(a1 + 32), "setSpatialOverCaptureMovie:", +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), "spatialOverCaptureURL"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "unresolvedSettings"), "spatialOverCaptureMovieMetadata")));
      }
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = [*(id *)(a1 + 32) spatialOverCaptureMovie];
      return [a2 captureOutput:v5 didFinishRecordingMovie:v6];
    }
    else
    {
      uint64_t result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v7 = *(void *)(a1 + 40);
        uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "resolvedSettings"), "spatialOverCaptureURL");
        uint64_t v9 = [*(id *)(a1 + 32) resolvedSettings];
        return [a2 captureOutput:v7 didFinishRecordingMovieFileAtEventualURL:v8 resolvedSettings:v9];
      }
    }
  }
  return result;
}

- (void)_handleDidFinishWritingMomentCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  memset(&v24, 0, sizeof(v24));
  CMTimeMakeFromDictionary(&v24, (CFDictionaryRef)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51508]]);
  int v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F514F8]), "BOOLValue");
  char v9 = v8;
  if (v8 && objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "spatialOverCaptureURL"))
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x10);
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "spatialOverCaptureURL");
    uint64_t v11 = 1;
  }
  else
  {
    objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 8);
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a4, "resolvedSettings"), "movieURL");
    uint64_t v11 = 0;
  }
  uint64_t v12 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F51698]];
  if (v12) {
    uint64_t v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
  }
  else {
    uint64_t v13 = 0;
  }
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v14 = (__IOSurface *)[a3 objectForKeyedSubscript:*MEMORY[0x1E4F51748]];
  if (v14) {
    CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v14, 0, &pixelBufferOut);
  }
  if (v7) {
    id v15 = [(AVCapturePhotoOutput *)self _errorForFigCaptureSessionNotificationPayloadErrorStatus:v7 userInfo:[(AVCapturePhotoOutput *)self _avErrorUserInfoDictionaryForError:v7 movieRequest:a4 payload:a3 isSpatialOverCaptureMovie:v11]];
  }
  else {
    id v15 = 0;
  }
  uint64_t v16 = (void *)[a4 delegateStorage];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__AVCapturePhotoOutput__handleDidFinishWritingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke;
  void v19[3] = &unk_1E5A79FC8;
  char v21 = v11;
  char v22 = v9;
  v19[4] = a4;
  v19[5] = v10;
  CMTime v20 = v24;
  v19[6] = v13;
  void v19[7] = self;
  v19[8] = v15;
  v19[9] = pixelBufferOut;
  [v16 invokeDelegateCallbackWithBlock:v19];
  unsigned int v17 = ([a4 firedCallbackFlags] >> 3) & 1;
  uint64_t v18 = (([a4 firedCallbackFlags] >> 4) & 1) + v17;
  if ([a4 expectedMovieCount] == v18) {
    [(AVCapturePhotoOutput *)self _handleDidFinishMovieCaptureMovieNotificationWithPayload:a3 forRequest:a4];
  }
}

void __100__AVCapturePhotoOutput__handleDidFinishWritingMomentCaptureMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 105)) {
      uint64_t v5 = [v4 spatialOverCaptureMovie];
    }
    else {
      uint64_t v5 = [v4 movie];
    }
    uint64_t v12 = (AVMomentCaptureMovie *)v5;
    if (!v5)
    {
      int v13 = *(unsigned __int8 *)(a1 + 105);
      uint64_t v14 = (void *)[*(id *)(a1 + 32) unresolvedSettings];
      if (v13) {
        uint64_t v15 = [v14 spatialOverCaptureMovieMetadata];
      }
      else {
        uint64_t v15 = [v14 movieMetadata];
      }
      uint64_t v12 = +[AVMomentCaptureMovie movieWithResolvedSettings:outputFileURL:movieMetadata:](AVMomentCaptureMovie, "movieWithResolvedSettings:outputFileURL:movieMetadata:", [*(id *)(a1 + 32) resolvedSettings], *(void *)(a1 + 40), v15);
    }
    long long v18 = *(_OWORD *)(a1 + 80);
    uint64_t v19 = *(void *)(a1 + 96);
    [(AVMomentCaptureMovie *)v12 _setDuration:&v18];
    [(AVMomentCaptureMovie *)v12 _setPreviewPixelBuffer:*(void *)(a1 + 72)];
    [(AVMomentCaptureMovie *)v12 _setDebugMetadataSidecarFileURL:*(void *)(a1 + 48)];
    [a2 captureOutput:*(void *)(a1 + 56) didFinishWritingMovie:v12 error:*(void *)(a1 + 64)];
    uint64_t v16 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 105)) {
      [v16 setSpatialOverCaptureMovie:0];
    }
    else {
      [v16 setMovie:0];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [*(id *)(a1 + 32) resolvedSettings];
    uint64_t v11 = *(void *)(a1 + 64);
    long long v18 = *(_OWORD *)(a1 + 80);
    uint64_t v19 = *(void *)(a1 + 96);
    [a2 captureOutput:v6 didFinishWritingMovieFileAtURL:v9 debugMetadataSidecarFileURL:v7 previewPixelBuffer:v8 duration:&v18 resolvedSettings:v10 error:v11];
  }
  unsigned int v17 = *(const void **)(a1 + 72);
  if (v17) {
    CFRelease(v17);
  }
}

- (void)_handleDidFinishMovieCaptureMovieNotificationWithPayload:(id)a3 forRequest:(id)a4
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D8]), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F516D0]), "intValue");
  if (v7) {
    id v8 = [(AVCapturePhotoOutput *)self _errorForFigCaptureSessionNotificationPayloadErrorStatus:v7 userInfo:0];
  }
  else {
    id v8 = 0;
  }
  MEMORY[0x1A6234330](self->_internal->requestsLock);
  [(NSMutableArray *)self->_internal->movieRequests removeObject:a4];
  MEMORY[0x1A6234340](self->_internal->requestsLock);
  objc_msgSend(a4, "setFiredCallbackFlags:", objc_msgSend(a4, "firedCallbackFlags") | 0x20);
  uint64_t v9 = (void *)[a4 delegateStorage];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __92__AVCapturePhotoOutput__handleDidFinishMovieCaptureMovieNotificationWithPayload_forRequest___block_invoke;
  v10[3] = &unk_1E5A73BB8;
  v10[4] = self;
  v10[5] = a4;
  void v10[6] = v8;
  [v9 invokeDelegateCallbackWithBlock:v10];
}

uint64_t __92__AVCapturePhotoOutput__handleDidFinishMovieCaptureMovieNotificationWithPayload_forRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) resolvedSettings];
    uint64_t v7 = *(void *)(a1 + 48);
    return [a2 captureOutput:v5 didFinishMovieCaptureForResolvedSettings:v6 error:v7];
  }
  return result;
}

- (void)setFastCapturePrioritizationSupported:(BOOL)fastCapturePrioritizationSupported
{
  self->_int fastCapturePrioritizationSupported = fastCapturePrioritizationSupported;
}

@end