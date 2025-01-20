@interface CUCaptureController
+ (float)focusLensPositionCurrentSentinel;
- (AVCaptureVideoPreviewLayer)videoPreviewLayer;
- (BOOL)_canBeginCaptureCheckAvailability:(BOOL)a3 error:(id *)a4;
- (BOOL)_didCompleteInitialConfiguration;
- (BOOL)_internalCaptureStillImageWithRequest:(id)a3 error:(id *)a4;
- (BOOL)_internalStartCapturingVideoWithRequest:(id)a3 error:(id *)a4;
- (BOOL)_isCapturingPairedVideoPaused;
- (BOOL)_isFailedConfigurationPreventingCapture;
- (BOOL)_isVideoCaptureAvailable;
- (BOOL)_isWaitingForRecordingToStart;
- (BOOL)_kvoDidEndForChange:(id)a3;
- (BOOL)_kvoDidStartForChange:(id)a3;
- (BOOL)_needsInitialPairedVideoUpdate;
- (BOOL)_shouldLockWhiteBalanceForActiveVideoRequest;
- (BOOL)_shouldLockWhiteBalanceForCTMVideoRequest:(id)a3;
- (BOOL)_shouldLockWhiteBalanceForVideoCaptureRequest:(id)a3;
- (BOOL)_shouldManageFocusForMode:(int64_t)a3;
- (BOOL)_shouldMonitorSystemPressureState;
- (BOOL)_shouldResetFocusAndExposureAfterCapture;
- (BOOL)_shouldTrackInflightCountForRequest:(id)a3;
- (BOOL)_stopCapturingVideoAndDisableCaptureAvailabilityWhileStopping:(BOOL)a3;
- (BOOL)_wantsImageAnalysisForGraphConfiguration:(id)a3;
- (BOOL)_wantsMachineReadableCodesForGraphConfiguration:(id)a3;
- (BOOL)captureStillImageWithRequest:(id)a3 error:(id *)a4;
- (BOOL)hasActiveCTMVideoCaptures;
- (BOOL)initiateCTMCaptureWithSettings:(id)a3 error:(id *)a4;
- (BOOL)intervalometer:(id)a3 didGenerateCaptureRequest:(id)a4;
- (BOOL)isAutoMacroActive;
- (BOOL)isAutoMacroSuggested;
- (BOOL)isCaptureAvailable;
- (BOOL)isCapturingBurst;
- (BOOL)isCapturingCTMVideo;
- (BOOL)isCapturingLivePhotoVideo;
- (BOOL)isCapturingLowLightImage;
- (BOOL)isCapturingPanorama;
- (BOOL)isCapturingStandardVideo;
- (BOOL)isCapturingStillImage;
- (BOOL)isCapturingTimelapse;
- (BOOL)isCapturingVideo;
- (BOOL)isConfigurationAvailable;
- (BOOL)isFlashActive;
- (BOOL)isFlashAvailable;
- (BOOL)isHDRSuggested;
- (BOOL)isInterrupted;
- (BOOL)isPreviewDisabled;
- (BOOL)isRampingVideoZoom;
- (BOOL)isTorchActive;
- (BOOL)isTorchAvailable;
- (BOOL)pauseCapturingVideo;
- (BOOL)resumeCaptureVideo;
- (BOOL)shouldAllowUserToChangeFocusAndExposure;
- (BOOL)startCapturingBurstWithRequest:(id)a3 error:(id *)a4;
- (BOOL)startCapturingPanoramaWithRequest:(id)a3 error:(id *)a4;
- (BOOL)startCapturingVideoWithRequest:(id)a3 error:(id *)a4;
- (BOOL)stopCapturingPanoramaInterrupted:(BOOL)a3;
- (BOOL)stopCapturingVideo;
- (BOOL)videoCapturePaused;
- (CAMAvailabilityDelegate)availabilityDelegate;
- (CAMBurstController)_burstController;
- (CAMBurstDelegate)burstDelegate;
- (CAMCaptureControllerSystemPressureStateDelegate)systemPressureStateDelegate;
- (CAMCaptureEngine)_captureEngine;
- (CAMCaptureInterruptionDelegate)interruptionDelegate;
- (CAMCaptureRecoveryDelegate)recoveryDelegate;
- (CAMCaptureRequestIntervalometer)currentBurstIntervalometer;
- (CAMCaptureResultDelegate)resultDelegate;
- (CAMCaptureRunningDelegate)runningDelegate;
- (CAMConfigurationDelegate)configurationDelegate;
- (CAMControlsDelegate)controlsDelegate;
- (CAMDocumentSceneResultDelegate)documentSceneResultDelegate;
- (CAMExposureDelegate)exposureDelegate;
- (CAMFacesDelegate)facesDelegate;
- (CAMFocusDelegate)focusDelegate;
- (CAMHistogramDelegate)histogramDelegate;
- (CAMIrisVideoController)_irisVideoController;
- (CAMKeyValueCoalescer)_exposureCoalescer;
- (CAMKeyValueCoalescer)_focusCoalescer;
- (CAMLocationController)_locationController;
- (CAMMachineReadableCodeDelegate)machineReadableCodeDelegate;
- (CAMMotionController)_motionController;
- (CAMPanoramaCaptureRequest)_capturingPanoramaRequest;
- (CAMPanoramaChangeDelegate)panoramaChangeDelegate;
- (CAMPanoramaPreviewView)panoramaPreviewView;
- (CAMPowerController)_powerController;
- (CAMPreviewLayerOverCaptureStatusDelegate)previewLayerOverCaptureStatusDelegate;
- (CAMProtectionController)_protectionController;
- (CAMRemoteShutterController)_remoteShutterController;
- (CAMShallowDepthOfFieldStatusDelegate)shallowDepthOfFieldStatusDelegate;
- (CAMStereoCaptureStatusDelegate)stereoCaptureStatusDelegate;
- (CAMStillImageCaptureRequest)_capturingCTMVideoRequest;
- (CAMStillImageCaptureRequest)_capturingLowLightStillImageRequest;
- (CAMStillImageCapturingVideoDelegate)stillImageCapturingVideoDelegate;
- (CAMSuggestionDelegate)suggestionDelegate;
- (CAMSystemPressureState)currentCameraSystemPressureState;
- (CAMTextRegionResultDelegate)textRegionResultDelegate;
- (CAMThumbnailGenerator)_responseThumbnailGenerator;
- (CAMVideoCaptureRequest)_capturingVideoRequest;
- (CAMVideoCaptureRequest)_pendingVideoCaptureRequest;
- (CAMZoomDelegate)zoomDelegate;
- (CUCaptureController)initWithCaptureConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5 engineOptions:(int64_t)a6 locationController:(id)a7 motionController:(id)a8 burstController:(id)a9 protectionController:(id)a10 powerController:(id)a11 irisVideoController:(id)a12 remoteShutterController:(id)a13;
- (NSCountedSet)_numberOfInflightRequestsByType;
- (NSMutableDictionary)_persistenceUUIDToSignpostID;
- (NSMutableSet)_identifiersForActiveCTMVideoCaptures;
- (NSMutableSet)_identifiersForActiveLivePhotoVideoCaptures;
- (OS_dispatch_queue)_responseQueue;
- (PLCameraDeferredProcessingCoordinator)_deferredProcessingCoordinator;
- (id)_availabilityKeyPaths;
- (id)_commandForChangeToGraphConfiguration:(id)a3 zoomFactor:(double)a4 minimumExecutionTime:(double)a5 outputToExternalStorage:(BOOL)a6 outRequestID:(int *)a7;
- (id)_commandForConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5 outRequestID:(int *)a6;
- (id)_commandForLockingExposureIncludingFocus:(BOOL)a3;
- (id)_commandForResetFocus:(BOOL)a3 resetExposure:(BOOL)a4 resetExposureTargetBias:(BOOL)a5;
- (id)_exposureKVOKeyPaths;
- (id)_focusKVOKeyPaths;
- (id)_identifierForPendingVideoForStillImageRequest:(id)a3;
- (id)_realtimeMetadataCommandsForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 capturing:(BOOL)a5 wantsMachineReadableCodes:(BOOL)a6 wantsImageAnalysis:(BOOL)a7;
- (id)_sanitizePanoramaRequest:(id)a3;
- (id)_sanitizeStillImageRequest:(id)a3;
- (id)_sanitizeVideoRequest:(id)a3;
- (id)_suggestionKeyPaths;
- (id)_systemPressureStateMonitoringKeyPaths;
- (id)_textAnalysisImageFromStillImageResult:(id)a3 imageOrientation:(int64_t)a4;
- (id)_thumbnailImageFromStillImageCaptureResult:(id)a3 imageOrientation:(int64_t)a4;
- (id)_thumbnailImageFromVideoCaptureResult:(id)a3 previewOrientation:(int64_t)a4 previewImage:(id *)a5;
- (id)_updateFocusAndExposureForStartBurstCapture;
- (id)_updateFocusAndExposureForStartPanorama;
- (id)_zoomMonitoringKeyPaths;
- (int)_uniqueRequestIDForChangeToModeAndDevice;
- (int)applyCaptureConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5;
- (int)changeToGraphConfiguration:(id)a3 zoomFactor:(double)a4 minimumExecutionTime:(double)a5 outputToExternalStorage:(BOOL)a6;
- (int64_t)_cinematicMetadataObjectIDForMetadataObject:(id)a3;
- (int64_t)_maximumNumberOfStillImageRequests;
- (int64_t)lowLightStatus;
- (unint64_t)_maximumNumberOfStillImageRequestsDuringBurst;
- (unint64_t)_nextSignpostID;
- (unint64_t)currentBurstCount;
- (unint64_t)flashCompromise;
- (void)_availabilityResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)_beginTrackingCTMVideoRecordingForIdentifier:(id)a3;
- (void)_beginTrackingLivePhotoVideoRecordingForIdentifier:(id)a3;
- (void)_didPlayBeginVideoRecordingSound;
- (void)_documentScanningChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)_endCaptureSignpostIntervalForPersistenceUUID:(id)a3;
- (void)_endTrackingCTMVideoRecordingForIdentifier:(id)a3;
- (void)_endTrackingLivePhotoVideoRecordingForIdentifier:(id)a3;
- (void)_exposureResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)_focusResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)_handleCaptureEngineExecutionNotification:(id)a3;
- (void)_handleShallowDepthOfFieldStatusChangedNotification:(id)a3;
- (void)_handleSystemPressureState:(id)a3;
- (void)_notifyDelegateOfCaptureAvailabilityChanged:(BOOL)a3;
- (void)_notifyDelegateOfConfigurationAvailabilityChanged:(BOOL)a3;
- (void)_overCapturePreviewStatusChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)_processCapturedBurstRequest:(id)a3 withResult:(id)a4;
- (void)_processPendingVideoCaptureRequest:(id)a3;
- (void)_resetCapturingVideoState;
- (void)_resetFocusAndExposureAfterCapture;
- (void)_resetFocusAndExposureAfterCaptureForType:(int64_t)a3;
- (void)_resetFocusAndExposureIfAppropriateForReason:(int64_t)a3;
- (void)_scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:(int64_t)a3;
- (void)_setCaptureAvailable:(BOOL)a3;
- (void)_setCapturingCTMVideoRequest:(id)a3;
- (void)_setCapturingLowLightStillImageRequest:(id)a3;
- (void)_setCapturingPairedVideoPaused:(BOOL)a3;
- (void)_setCapturingPanoramaRequest:(id)a3;
- (void)_setCapturingVideoRequest:(id)a3;
- (void)_setConfigurationAvailable:(BOOL)a3;
- (void)_setCurrentBurstIntervalometer:(id)a3;
- (void)_setCurrentCameraSystemPressureState:(id)a3;
- (void)_setDeferredProcessingCoordinator:(id)a3;
- (void)_setDidCompleteInitialConfiguration:(BOOL)a3;
- (void)_setFailedConfigurationPreventingCapture:(BOOL)a3;
- (void)_setFlashActive:(BOOL)a3;
- (void)_setFlashAvailable:(BOOL)a3;
- (void)_setFlashCompromise:(unint64_t)a3;
- (void)_setHDRSuggested:(BOOL)a3;
- (void)_setLowLightStatus:(int64_t)a3;
- (void)_setMaximumNumberOfStillImageRequests:(int64_t)a3;
- (void)_setNeedsInitialPairedVideoUpdate:(BOOL)a3;
- (void)_setNextSignpostID:(unint64_t)a3;
- (void)_setPendingVideoCaptureRequest:(id)a3;
- (void)_setTorchActive:(BOOL)a3;
- (void)_setTorchAvailable:(BOOL)a3;
- (void)_setVideoCaptureAvailable:(BOOL)a3;
- (void)_setVideoCapturePaused:(BOOL)a3;
- (void)_setWaitingForRecordingToStart:(BOOL)a3;
- (void)_setupAvailabilityMonitoring;
- (void)_setupDocumentScanningMonitoring;
- (void)_setupExposureMonitoring;
- (void)_setupFocusAndExposureMonitoring;
- (void)_setupFocusMonitoring;
- (void)_setupOverCapturePreviewMonitoring;
- (void)_setupStereoCaptureStatusMonitoring;
- (void)_setupStereoVideoCaptureStatusMonitoring;
- (void)_setupSuggestionMonitoring;
- (void)_setupSystemPressureStateMonitoring;
- (void)_setupZoomMonitoring;
- (void)_setupZoomPIPMonitoring;
- (void)_startCaptureSignpostIntervalForPersistenceUUID:(id)a3;
- (void)_stereoCaptureStatusChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)_stereoVideoCaptureStatusChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)_subjectAreaDidChange:(id)a3;
- (void)_suggestionResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)_systemPressureStateMonitoringChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)_tearDownDocumentScanningMonitoring;
- (void)_tearDownOverCapturePreviewMonitoring;
- (void)_teardownAvailabilityMonitoring;
- (void)_teardownFocusAndExposureMonitoring;
- (void)_teardownStereoCaptureStatusMonitoring;
- (void)_teardownStereoVideoCaptureStatusMonitoring;
- (void)_teardownSuggestionMonitoring;
- (void)_teardownSystemPressureStateMonitoring;
- (void)_teardownZoomMonitoring;
- (void)_teardownZoomPIPMonitoring;
- (void)_updateAutoMacroActive;
- (void)_updateAutoMacroSuggested;
- (void)_updateAvailabilityAfterCapturedRequest:(id)a3;
- (void)_updateAvailabilityAfterEnqueuedRequest:(id)a3;
- (void)_updateAvailabilityAfterStopCapturingForRequest:(id)a3;
- (void)_updateAvailabilityForRequestType:(int64_t)a3;
- (void)_updateAvailabilityWhenPreparingToStopCapturingForRequest:(id)a3;
- (void)_updateMaximumNumberOfStillImageRequestsAfterBurst;
- (void)_updateMaximumNumberOfStillImageRequestsAfterCapturedRequestIfNecessary:(id)a3;
- (void)_updateMaximumNumberOfStillImageRequestsAfterEnqueuingRequest:(id)a3;
- (void)_zoomPIPChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)_zoomResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5;
- (void)attemptToEndInterruptions;
- (void)cancelAutoResumeAfterDate:(id)a3;
- (void)cancelCTMCaptureForSettings:(id)a3;
- (void)cancelDelayedFocusAndExposureReset;
- (void)changeExposureTargetBias:(float)a3;
- (void)changeToAspectRatioCrop:(int64_t)a3;
- (void)changeToFlashMode:(int64_t)a3;
- (void)changeToLockedExposure;
- (void)changeToLockedFocusAndExposure;
- (void)changeToLowLightMode:(int64_t)a3;
- (void)changeToPanoramaDirection:(int64_t)a3;
- (void)changeToPanoramaEncodingBehavior:(int64_t)a3;
- (void)changeToPortraitAperture:(double)a3;
- (void)changeToPortraitLightingEffectStrength:(double)a3;
- (void)changeToPreviewConfiguration:(unint64_t)a3;
- (void)changeToPreviewDisabled;
- (void)changeToPreviewEnabledWithConfiguration:(unint64_t)a3;
- (void)changeToPreviewFilters:(id)a3 captureMode:(int64_t)a4;
- (void)changeToSmartStyle:(id)a3;
- (void)changeToTimelapseCaptureRate:(float)a3;
- (void)changeToTorchLevel:(float)a3;
- (void)changeToTorchMode:(int64_t)a3;
- (void)changeToVideoHDRSuspended:(BOOL)a3;
- (void)changeToVideoRecordingCaptureOrientation:(int64_t)a3;
- (void)changeToVideoZoomFactor:(double)a3 graphConfiguration:(id)a4;
- (void)dealloc;
- (void)endCTMVideoCapture;
- (void)focusAndExposeAtPoint:(CGPoint)a3 lockFocus:(BOOL)a4 resetExposureTargetBias:(BOOL)a5;
- (void)focusAtCenterForVideoRecording;
- (void)focusAtPoint:(CGPoint)a3 lockFocus:(BOOL)a4;
- (void)forceDisableSubjectAreaChangeMonitoring;
- (void)handleSessionDidStartRunning;
- (void)handleSessionDidStopRunning;
- (void)handleSessionInterruptionEnded;
- (void)handleSessionInterruptionForReason:(int64_t)a3;
- (void)intervalometer:(id)a3 didReachMaximumCountWithRequest:(id)a4;
- (void)invalidateController;
- (void)lockFocusAtLensPosition:(float)a3 completionBlock:(id)a4;
- (void)logCaptureAvailabilityDescription;
- (void)metadataWasRecognized:(id)a3 forMetadataObjectTypes:(id)a4 deviceFormat:(id)a5;
- (void)notifyTimelapseControllerFinishedUpdatingWithLocation;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)panoramaConfigurationDidChangeWithImageQueue:(_CAImageQueue *)a3 direction:(int64_t)a4;
- (void)panoramaRequest:(id)a3 didCompleteCaptureWithResult:(id)a4;
- (void)panoramaRequest:(id)a3 didReceiveNotification:(int64_t)a4;
- (void)panoramaRequestDidStartCapturing:(id)a3;
- (void)panoramaRequestDidStopCapturing:(id)a3 interrupted:(BOOL)a4;
- (void)pauseCapturingStillImagePairedVideo;
- (void)prepareDeferredProcessingWithStillImageRequest:(id)a3;
- (void)preparePhotoOutputForExpectedPhotoResolution:(int64_t)a3;
- (void)prepareToCaptureStillImageAtSystemTime:(int64_t)a3;
- (void)queryTimelapseDimensionsWithCompletionBlock:(id)a3;
- (void)queryVideoDimensionsWithCompletionBlock:(id)a3;
- (void)registerCaptureService:(id)a3;
- (void)registerEffectsPreviewSampleBufferDelegate:(id)a3;
- (void)registerVideoThumbnailContentsDelegate:(id)a3;
- (void)resetFocusAndExposure;
- (void)resumeCapturingStillImagePairedVideo;
- (void)setAutoMacroActive:(BOOL)a3;
- (void)setAutoMacroSuggested:(BOOL)a3;
- (void)setAvailabilityDelegate:(id)a3;
- (void)setBurstDelegate:(id)a3;
- (void)setCapturingTimelapse:(BOOL)a3 forDevicePosition:(int64_t)a4;
- (void)setCinematicFocusAtPoint:(CGPoint)a3 useFixedOpticalFocus:(BOOL)a4 useHardFocus:(BOOL)a5;
- (void)setCinematicFocusForMetadataObject:(id)a3 atPoint:(CGPoint)a4 useFixedOpticalFocus:(BOOL)a5 useHardFocus:(BOOL)a6;
- (void)setConfigurationDelegate:(id)a3;
- (void)setControlsDelegate:(id)a3;
- (void)setDocumentSceneResultDelegate:(id)a3;
- (void)setExposureDelegate:(id)a3;
- (void)setFacesDelegate:(id)a3;
- (void)setFallbackPrimaryConstituentDeviceSelection:(int64_t)a3;
- (void)setFocusDelegate:(id)a3;
- (void)setHistogramDelegate:(id)a3;
- (void)setInterruptionDelegate:(id)a3;
- (void)setMachineReadableCodeDelegate:(id)a3;
- (void)setPanoramaChangeDelegate:(id)a3;
- (void)setPreviewLayerOverCaptureStatusDelegate:(id)a3;
- (void)setRampingVideoZoom:(BOOL)a3;
- (void)setRecoveryDelegate:(id)a3;
- (void)setResultDelegate:(id)a3;
- (void)setRunningDelegate:(id)a3;
- (void)setShallowDepthOfFieldStatusDelegate:(id)a3;
- (void)setStereoCaptureStatusDelegate:(id)a3;
- (void)setStillImageCapturingVideoDelegate:(id)a3;
- (void)setSuggestionDelegate:(id)a3;
- (void)setSystemPressureStateDelegate:(id)a3;
- (void)setTextRegionResultDelegate:(id)a3;
- (void)setZoomDelegate:(id)a3;
- (void)startCaptureSession;
- (void)startCaptureSessionWithRetryCount:(unint64_t)a3 retryInterval:(double)a4 logReason:(id)a5 completion:(id)a6;
- (void)startMonitoringForHDRSuggestions;
- (void)startRampToVideoZoomFactor:(double)a3 withDuration:(double)a4 zoomRampTuning:(int64_t)a5 graphConfiguration:(id)a6;
- (void)startRampToVideoZoomFactor:(double)a3 withRate:(float)a4 graphConfiguration:(id)a5;
- (void)stillImageRequest:(id)a3 didCompleteStillImageCaptureWithResult:(id)a4;
- (void)stillImageRequest:(id)a3 didCompleteVideoCaptureWithResult:(id)a4;
- (void)stillImageRequest:(id)a3 didStopCapturingCTMVideoForCoordinationInfo:(id)a4;
- (void)stillImageRequest:(id)a3 didStopCapturingLivePhotoVideoForCoordinationInfo:(id)a4;
- (void)stillImageRequestDidBeginCaptureBeforeResolvingSettings:(id)a3;
- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4;
- (void)stillImageRequestDidStartCapturing:(id)a3 resolvedSettings:(id)a4;
- (void)stillImageRequestDidStopCapturingStillImage:(id)a3;
- (void)stillImageRequestDidUnblockResponsiveCapture:(id)a3;
- (void)stillImageRequestWillStartCapturingVideo:(id)a3;
- (void)stopCaptureSession;
- (void)stopCaptureSessionWithCompletion:(id)a3;
- (void)stopCapturingBurst;
- (void)stopMonitoringForAccidentalLaunch;
- (void)stopMonitoringForHDRSuggestions;
- (void)stopRampToVideoZoomFactor;
- (void)unregisterCaptureService:(id)a3;
- (void)unregisterEffectsPreviewSampleBufferDelegate:(id)a3;
- (void)unregisterVideoThumbnailContentsDelegate:(id)a3;
- (void)updateCaptureButtonControlsForCaptureMode:(int64_t)a3 devicePosition:(int64_t)a4 isRecording:(BOOL)a5;
- (void)updateRealtimeMetadataConfigurationForGraphConfiguration:(id)a3 isCapturing:(BOOL)a4;
- (void)videoRequest:(id)a3 didCompleteCaptureWithResult:(id)a4;
- (void)videoRequestDidResumeCapturing:(id)a3;
- (void)videoRequestDidStartCapturing:(id)a3;
- (void)videoRequestDidStopCapturing:(id)a3;
- (void)willPerformRecoveryFromRuntimeError:(id)a3;
@end

@implementation CUCaptureController

- (void)_setupFocusAndExposureMonitoring
{
  [(CUCaptureController *)self _setupFocusMonitoring];
  [(CUCaptureController *)self _setupExposureMonitoring];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__subjectAreaDidChange_ name:*MEMORY[0x263EF9618] object:0];
}

- (void)_setupFocusMonitoring
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(CUCaptureController *)self _captureEngine];
  objc_initWeak(&location, self);
  v4 = [CAMKeyValueCoalescer alloc];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__CUCaptureController__setupFocusMonitoring__block_invoke;
  v15[3] = &unk_263FA47D0;
  objc_copyWeak(&v16, &location);
  v5 = [(CAMKeyValueCoalescer *)v4 initWithInterval:v15 handler:0.05];
  focusCoalescer = self->__focusCoalescer;
  self->__focusCoalescer = v5;

  [(CUCaptureController *)self _focusKVOKeyPaths];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(void *)(*((void *)&v11 + 1) + 8 * v10++), 3, CAMFocusResultContext, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v18 count:16];
    }
    while (v8);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (CAMCaptureEngine)_captureEngine
{
  return self->__captureEngine;
}

- (id)_focusKVOKeyPaths
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = @"currentCameraDevice.focusMode";
  v4[1] = @"currentCameraDevice.focusPointOfInterest";
  v4[2] = @"currentCameraDevice.adjustingFocus";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return v2;
}

- (void)_setupExposureMonitoring
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(CUCaptureController *)self _captureEngine];
  objc_initWeak(&location, self);
  v4 = [CAMKeyValueCoalescer alloc];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __47__CUCaptureController__setupExposureMonitoring__block_invoke;
  v15[3] = &unk_263FA47D0;
  objc_copyWeak(&v16, &location);
  v5 = [(CAMKeyValueCoalescer *)v4 initWithInterval:v15 handler:0.05];
  exposureCoalescer = self->__exposureCoalescer;
  self->__exposureCoalescer = v5;

  [(CUCaptureController *)self _exposureKVOKeyPaths];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, *(void *)(*((void *)&v11 + 1) + 8 * v10++), 3, CAMExposureResultContext, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v18 count:16];
    }
    while (v8);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (id)_exposureKVOKeyPaths
{
  void v4[4] = *MEMORY[0x263EF8340];
  v4[0] = @"currentCameraDevice.exposureMode";
  v4[1] = @"currentCameraDevice.exposurePointOfInterest";
  v4[2] = @"currentCameraDevice.exposureTargetBias";
  v4[3] = @"currentCameraDevice.adjustingExposure";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  return v2;
}

- (void)_setupSuggestionMonitoring
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(CUCaptureController *)self _captureEngine];
  v4 = [(CUCaptureController *)self _suggestionKeyPaths];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) options:3 context:CAMSuggestionResultContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_suggestionKeyPaths
{
  v4[7] = *MEMORY[0x263EF8340];
  v4[0] = @"currentCameraDevice.flashActive";
  v4[1] = @"currentCameraDevice.torchActive";
  v4[2] = @"currentStillImageOutput.isHDRScene";
  v4[3] = @"currentStillImageOutput.digitalFlashStatus";
  void v4[4] = @"currentStillImageOutput.digitalFlashExposureTimes";
  void v4[5] = @"currentCameraDevice.activePrimaryConstituentDevice";
  v4[6] = @"currentCameraDevice.preferredPrimaryConstituentDevice";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:7];
  return v2;
}

- (void)_setupAvailabilityMonitoring
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(CUCaptureController *)self _captureEngine];
  v4 = [(CUCaptureController *)self _availabilityKeyPaths];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) options:3 context:CAMAvailabilityResultContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_availabilityKeyPaths
{
  v7[2] = *MEMORY[0x263EF8340];
  v7[0] = @"currentCameraDevice.flashAvailable";
  v7[1] = @"currentCameraDevice.torchAvailable";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 isFlashMitigationSupported];

  if (v4)
  {
    uint64_t v5 = [v2 arrayByAddingObject:@"currentCameraDevice.degradedCaptureQualityFactors"];

    v2 = (void *)v5;
  }
  return v2;
}

- (void)_setupZoomMonitoring
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(CUCaptureController *)self _captureEngine];
  int v4 = [(CUCaptureController *)self _zoomMonitoringKeyPaths];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) options:1 context:CAMZoomResultContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_zoomMonitoringKeyPaths
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = @"currentCameraDevice.videoZoomFactor";
  v4[1] = @"currentCameraDevice.minAvailableVideoZoomFactor";
  v4[2] = @"currentCameraDevice.rampingVideoZoom";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return v2;
}

- (void)_setupSystemPressureStateMonitoring
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(CUCaptureController *)self _shouldMonitorSystemPressureState])
  {
    id v3 = [(CUCaptureController *)self _captureEngine];
    int v4 = [(CUCaptureController *)self _systemPressureStateMonitoringKeyPaths];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 addObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) options:5 context:CAMSystemPressureStateMonitoringContext];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)_shouldMonitorSystemPressureState
{
  v2 = +[CAMCaptureCapabilities capabilities];
  if ([v2 isBackPortraitModeSupported]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isFrontPortraitModeSupported];
  }

  return v3;
}

- (int)_uniqueRequestIDForChangeToModeAndDevice
{
  return atomic_fetch_add(&self->_uniqueRequestIDForConfigurationChange, 1u);
}

- (BOOL)isPreviewDisabled
{
  return self->_previewDisabled;
}

- (BOOL)_wantsMachineReadableCodesForGraphConfiguration:(id)a3
{
  id v3 = a3;
  int v4 = +[CAMUserPreferences preferences];
  int v5 = [v4 shouldShowQRBanners];

  unint64_t v6 = [v3 device];
  return v5 & ((v6 > 0xB) | (0xFDu >> v6));
}

- (void)_setVideoCaptureAvailable:(BOOL)a3
{
  self->__isVideoCaptureAvailable = a3;
}

- (void)setFocusDelegate:(id)a3
{
}

- (void)setExposureDelegate:(id)a3
{
}

- (void)setMachineReadableCodeDelegate:(id)a3
{
}

- (void)setConfigurationDelegate:(id)a3
{
}

- (void)setSuggestionDelegate:(id)a3
{
}

- (void)setAvailabilityDelegate:(id)a3
{
}

- (void)setBurstDelegate:(id)a3
{
}

- (void)setRecoveryDelegate:(id)a3
{
}

- (void)setInterruptionDelegate:(id)a3
{
}

- (void)setRunningDelegate:(id)a3
{
}

- (void)setZoomDelegate:(id)a3
{
}

- (void)setStillImageCapturingVideoDelegate:(id)a3
{
}

- (void)setShallowDepthOfFieldStatusDelegate:(id)a3
{
}

- (void)registerCaptureService:(id)a3
{
  id v4 = a3;
  id v5 = [(CUCaptureController *)self _captureEngine];
  [v5 registerCaptureService:v4];
}

- (BOOL)isCapturingVideo
{
  if ([(CUCaptureController *)self isCapturingStandardVideo]) {
    return 1;
  }
  return [(CUCaptureController *)self isCapturingCTMVideo];
}

- (CAMVideoCaptureRequest)_capturingVideoRequest
{
  return self->__capturingVideoRequest;
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return [(CAMCaptureEngine *)self->__captureEngine videoPreviewLayer];
}

- (BOOL)isFlashAvailable
{
  return self->_flashAvailable;
}

- (BOOL)isCapturingBurst
{
  v2 = [(CUCaptureController *)self currentBurstIntervalometer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAMCaptureRequestIntervalometer)currentBurstIntervalometer
{
  return self->_currentBurstIntervalometer;
}

- (void)pauseCapturingStillImagePairedVideo
{
  BOOL v3 = [(CUCaptureController *)self _needsInitialPairedVideoUpdate];
  if (![(CUCaptureController *)self _isCapturingPairedVideoPaused] || v3)
  {
    id v4 = [(CUCaptureController *)self _captureEngine];
    id v5 = [[CAMPausePairedVideoRecordingCommand alloc] initWithRecordingPaused:1];
    [v4 enqueueCommand:v5];
    [(CUCaptureController *)self _setCapturingPairedVideoPaused:1];
    [(CUCaptureController *)self _setNeedsInitialPairedVideoUpdate:0];
    unint64_t v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Paused live photo video capture", v7, 2u);
    }
  }
}

- (BOOL)_needsInitialPairedVideoUpdate
{
  return self->__needsInitialPairedVideoUpdate;
}

- (BOOL)_isCapturingPairedVideoPaused
{
  return self->__capturingPairedVideoPaused;
}

- (void)_setCapturingPairedVideoPaused:(BOOL)a3
{
  self->__capturingPairedVideoPaused = a3;
}

- (void)_setNeedsInitialPairedVideoUpdate:(BOOL)a3
{
  self->__needsInitialPairedVideoUpdate = a3;
}

- (BOOL)isCapturingTimelapse
{
  return self->_capturingTimelapse;
}

- (BOOL)isCapturingPanorama
{
  v2 = [(CUCaptureController *)self _capturingPanoramaRequest];
  BOOL v3 = v2 != 0;

  return v3;
}

- (CAMPanoramaCaptureRequest)_capturingPanoramaRequest
{
  return self->__capturingPanoramaRequest;
}

- (BOOL)isFlashActive
{
  return self->_flashActive;
}

- (BOOL)isHDRSuggested
{
  return self->_HDRSuggested;
}

- (void)changeToFlashMode:(int64_t)a3
{
  id v5 = [[CAMFlashCommand alloc] initWithFlashMode:a3];
  id v4 = [(CUCaptureController *)self _captureEngine];
  [v4 enqueueCommand:v5];
}

- (void)startMonitoringForHDRSuggestions
{
  id v3 = [(CUCaptureController *)self _captureEngine];
  v2 = [[CAMHDRSuggestionMonitoringCommand alloc] initWithHDRSuggestionMonitoringEnabled:1];
  [v3 enqueueCommand:v2];
}

- (BOOL)isConfigurationAvailable
{
  return self->_configurationAvailable;
}

- (BOOL)isCaptureAvailable
{
  return self->_captureAvailable;
}

- (BOOL)isInterrupted
{
  v2 = [(CUCaptureController *)self _captureEngine];
  char v3 = [v2 isInterrupted];

  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)CAMFocusResultContext == a6)
  {
    [(CUCaptureController *)self _focusResultChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else if ((void *)CAMExposureResultContext == a6)
  {
    [(CUCaptureController *)self _exposureResultChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else if ((void *)CAMSuggestionResultContext == a6)
  {
    [(CUCaptureController *)self _suggestionResultChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else if ((void *)CAMAvailabilityResultContext == a6)
  {
    [(CUCaptureController *)self _availabilityResultChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else if ((void *)CAMZoomResultContext == a6)
  {
    [(CUCaptureController *)self _zoomResultChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else if ((void *)CAMSystemPressureStateMonitoringContext == a6)
  {
    [(CUCaptureController *)self _systemPressureStateMonitoringChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else if ((void *)CAMOverCapturePreviewContext == a6)
  {
    [(CUCaptureController *)self _overCapturePreviewStatusChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else if ((void *)CAMPreviewZoomPIPContext == a6)
  {
    [(CUCaptureController *)self _zoomPIPChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else if ((void *)CAMStereoCaptureStatusContext == a6)
  {
    [(CUCaptureController *)self _stereoCaptureStatusChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else if ((void *)CAMStereoVideoCaptureStatusContext == a6)
  {
    [(CUCaptureController *)self _stereoVideoCaptureStatusChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else if ((void *)CAMDocumentScanningResultsContext == a6)
  {
    [(CUCaptureController *)self _documentScanningChangedForKeyPath:v10 ofObject:v11 change:v12];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CUCaptureController;
    [(CUCaptureController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_suggestionResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  id v12 = [v11 currentCameraDevice];
  if ([v8 isEqualToString:@"currentStillImageOutput.isHDRScene"])
  {
    id v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if (!v13) {
      goto LABEL_6;
    }
    id v14 = [MEMORY[0x263EFF9D0] null];

    if (v13 == v14) {
      goto LABEL_6;
    }
    [v13 BOOLValue];
LABEL_5:
    pl_dispatch_async();
LABEL_6:

    goto LABEL_11;
  }
  if ([v8 isEqualToString:@"currentCameraDevice.flashActive"])
  {
    [v12 isFlashActive];
    id v21 = v11;
    pl_dispatch_async();

    goto LABEL_11;
  }
  if ([v8 isEqualToString:@"currentCameraDevice.torchActive"])
  {
    [v12 isTorchActive];
    pl_dispatch_async();
    goto LABEL_11;
  }
  if ([v8 isEqualToString:@"currentStillImageOutput.digitalFlashStatus"])
  {
    id v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if (!v13) {
      goto LABEL_6;
    }
    id v15 = [MEMORY[0x263EFF9D0] null];

    if (v13 == v15) {
      goto LABEL_6;
    }
    +[CAMCaptureConversions lowLightStatusForCaptureStatus:](CAMCaptureConversions, "lowLightStatusForCaptureStatus:", [v13 integerValue]);
    goto LABEL_5;
  }
  if ([v8 isEqualToString:@"currentStillImageOutput.digitalFlashExposureTimes"])
  {
    id v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if (v13)
    {
      uint64_t v16 = [MEMORY[0x263EFF9D0] null];
      if (v13 == (id)v16)
      {
      }
      else
      {
        v17 = (void *)v16;
        uint64_t v18 = [v13 count];

        if (v18)
        {
          uint64_t v19 = [v13 objectForKeyedSubscript:&unk_26BDDE778];
          [v19 doubleValue];
          v20 = [v13 objectForKeyedSubscript:&unk_26BDDE790];
          [v20 doubleValue];

          pl_dispatch_async();
        }
      }
    }

    goto LABEL_6;
  }
  if ([v8 isEqual:@"currentCameraDevice.activePrimaryConstituentDevice"])
  {
    [(CUCaptureController *)self _updateAutoMacroActive];
  }
  else if ([v8 isEqual:@"currentCameraDevice.preferredPrimaryConstituentDevice"])
  {
    [(CUCaptureController *)self _updateAutoMacroSuggested];
  }
LABEL_11:
}

- (void)_zoomResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 isEqualToString:@"currentCameraDevice.videoZoomFactor"])
  {
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if (!v9) {
      goto LABEL_14;
    }
    id v10 = [MEMORY[0x263EFF9D0] null];

    if (v9 == v10) {
      goto LABEL_14;
    }
    goto LABEL_4;
  }
  if ([v7 isEqualToString:@"currentCameraDevice.minAvailableVideoZoomFactor"])
  {
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if (!v9) {
      goto LABEL_14;
    }
    id v11 = [MEMORY[0x263EFF9D0] null];

    if (v9 == v11) {
      goto LABEL_14;
    }
LABEL_4:
    [v9 floatValue];
LABEL_13:
    pl_dispatch_async();
LABEL_14:

    goto LABEL_15;
  }
  if ([v7 isEqualToString:@"currentCameraDevice.rampingVideoZoom"])
  {
    id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    if (!v9) {
      goto LABEL_14;
    }
    id v12 = [MEMORY[0x263EFF9D0] null];

    if (v9 == v12) {
      goto LABEL_14;
    }
    -[CUCaptureController setRampingVideoZoom:](self, "setRampingVideoZoom:", [v9 BOOLValue]);
    goto LABEL_13;
  }
LABEL_15:
}

- (void)_availabilityResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [a5 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  if (!v7) {
    goto LABEL_12;
  }
  id v8 = [MEMORY[0x263EFF9D0] null];

  if (v7 == v8) {
    goto LABEL_12;
  }
  id v9 = v7;
  if ([v6 isEqualToString:@"currentCameraDevice.flashAvailable"]
    || [v6 isEqualToString:@"currentCameraDevice.torchAvailable"])
  {
    [v9 BOOLValue];
LABEL_8:
    pl_dispatch_async();
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"currentCameraDevice.degradedCaptureQualityFactors"])
  {
    [v9 unsignedIntegerValue];
    goto LABEL_8;
  }
LABEL_9:
  id v10 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v9;
    _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Observed availability key path %{public}@ change to %{public}@", buf, 0x16u);
  }

LABEL_12:
}

- (void)_exposureResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v30 = a3;
  id v8 = a5;
  id v9 = [a4 currentCameraDevice];
  uint64_t v10 = [v9 exposureMode];
  [v9 exposurePointOfInterest];
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [v9 isAdjustingExposure];
  [v9 exposureTargetBias];
  int v17 = v16;
  uint64_t v18 = [(CUCaptureController *)self _exposureCoalescer];
  uint64_t v19 = [NSNumber numberWithInteger:v10];
  [v18 coalesceValue:v19 forKeyPath:@"currentCameraDevice.exposureMode"];

  v20 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v12, v14);
  [v18 coalesceValue:v20 forKeyPath:@"currentCameraDevice.exposurePointOfInterest"];

  LODWORD(v21) = v17;
  v22 = [NSNumber numberWithFloat:v21];
  [v18 coalesceValue:v22 forKeyPath:@"currentCameraDevice.exposureTargetBias"];

  v23 = [NSNumber numberWithBool:v15];
  [v18 coalesceValue:v23 forKeyPath:@"currentCameraDevice.adjustingExposure"];

  uint64_t v24 = [v9 isFocusModeSupported:2];
  v25 = [NSNumber numberWithBool:v24];
  [v18 coalesceValue:v25 forKeyPath:@"deviceSupportsFocusKeyPath"];

  if ([v30 isEqual:@"currentCameraDevice.adjustingExposure"]) {
    BOOL v26 = [(CUCaptureController *)self _kvoDidStartForChange:v8];
  }
  else {
    BOOL v26 = 0;
  }
  if ([v30 isEqual:@"currentCameraDevice.adjustingExposure"]) {
    BOOL v27 = [(CUCaptureController *)self _kvoDidEndForChange:v8];
  }
  else {
    BOOL v27 = 0;
  }
  v28 = [NSNumber numberWithBool:v26];
  [v18 coalesceValue:v28 forKeyPath:@"exposureDidStartKeyPath"];

  v29 = [NSNumber numberWithBool:v27];
  [v18 coalesceValue:v29 forKeyPath:@"exposureDidEndKeyPath"];

  if (v26 || v27) {
    [v18 flush];
  }
}

- (CAMKeyValueCoalescer)_exposureCoalescer
{
  return self->__exposureCoalescer;
}

- (BOOL)_kvoDidStartForChange:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F081C8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    goto LABEL_10;
  }
  uint64_t v8 = [MEMORY[0x263EFF9D0] null];
  if (v5 == (void *)v8)
  {

LABEL_10:
    char v11 = 0;
    goto LABEL_11;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [MEMORY[0x263EFF9D0] null];

  if (v6 == v10 || ([v5 BOOLValue] & 1) != 0) {
    goto LABEL_10;
  }
  char v11 = [v6 BOOLValue];
LABEL_11:

  return v11;
}

- (BOOL)_kvoDidEndForChange:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F081C8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:v3];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    goto LABEL_10;
  }
  uint64_t v8 = [MEMORY[0x263EFF9D0] null];
  if (v5 == (void *)v8)
  {

LABEL_10:
    LOBYTE(v11) = 0;
    goto LABEL_11;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [MEMORY[0x263EFF9D0] null];

  if (v6 == v10 || ![v5 BOOLValue]) {
    goto LABEL_10;
  }
  int v11 = [v6 BOOLValue] ^ 1;
LABEL_11:

  return v11;
}

- (void)_focusResultChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v26 = a3;
  id v8 = a5;
  id v9 = [a4 currentCameraDevice];
  uint64_t v10 = [v9 focusMode];
  [v9 focusPointOfInterest];
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [v9 isAdjustingFocus];
  int v16 = [(CUCaptureController *)self _focusCoalescer];
  int v17 = [NSNumber numberWithInteger:v10];
  [v16 coalesceValue:v17 forKeyPath:@"currentCameraDevice.focusMode"];

  uint64_t v18 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", v12, v14);
  [v16 coalesceValue:v18 forKeyPath:@"currentCameraDevice.focusPointOfInterest"];

  uint64_t v19 = [NSNumber numberWithBool:v15];
  [v16 coalesceValue:v19 forKeyPath:@"currentCameraDevice.adjustingFocus"];

  uint64_t v20 = [v9 isFocusModeSupported:2];
  double v21 = [NSNumber numberWithBool:v20];
  [v16 coalesceValue:v21 forKeyPath:@"deviceSupportsFocusKeyPath"];

  if ([v26 isEqual:@"currentCameraDevice.adjustingFocus"]) {
    BOOL v22 = [(CUCaptureController *)self _kvoDidStartForChange:v8];
  }
  else {
    BOOL v22 = 0;
  }
  if ([v26 isEqual:@"currentCameraDevice.adjustingFocus"]) {
    BOOL v23 = [(CUCaptureController *)self _kvoDidEndForChange:v8];
  }
  else {
    BOOL v23 = 0;
  }
  uint64_t v24 = [NSNumber numberWithBool:v22];
  [v16 coalesceValue:v24 forKeyPath:@"contrastBasedFocusDidStartKeyPath"];

  v25 = [NSNumber numberWithBool:v23];
  [v16 coalesceValue:v25 forKeyPath:@"contrastBasedFocusDidEndKeyPath"];

  if (v22 || v23) {
    [v16 flush];
  }
}

- (CAMKeyValueCoalescer)_focusCoalescer
{
  return self->__focusCoalescer;
}

void __47__CUCaptureController__setupExposureMonitoring__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = objc_msgSend(v4, "cam_compareKey:withDictionary:", @"currentCameraDevice.exposureMode", v5);
  int v7 = objc_msgSend(v4, "cam_compareKey:withDictionary:", @"currentCameraDevice.exposurePointOfInterest", v5);
  int v8 = objc_msgSend(v4, "cam_compareKey:withDictionary:", @"currentCameraDevice.exposureTargetBias", v5);
  id v9 = [v4 objectForKeyedSubscript:@"currentCameraDevice.exposureMode"];
  uint64_t v10 = [v9 integerValue];

  int64_t v31 = +[CAMCaptureConversions exposureModeForCaptureExposureMode:v10];
  double v11 = [v4 objectForKeyedSubscript:@"currentCameraDevice.exposurePointOfInterest"];
  [v11 CGPointValue];
  double v13 = v12;
  double v15 = v14;

  int v16 = [v4 objectForKeyedSubscript:@"currentCameraDevice.exposureTargetBias"];
  [v16 floatValue];
  int v18 = v17;

  uint64_t v19 = [v4 objectForKeyedSubscript:@"currentCameraDevice.adjustingExposure"];
  uint64_t v20 = [v19 BOOLValue];

  double v21 = [v4 objectForKeyedSubscript:@"exposureDidStartKeyPath"];
  uint64_t v22 = [v21 BOOLValue];

  BOOL v23 = [v4 objectForKeyedSubscript:@"exposureDidEndKeyPath"];
  uint64_t v24 = [v23 BOOLValue];

  v25 = [v4 objectForKeyedSubscript:@"deviceSupportsFocusKeyPath"];
  uint64_t v26 = [v25 BOOLValue];

  if (!v6 || !v7 || !v8 || (v22 & 1) != 0 || v24)
  {
    BOOL v27 = [CAMExposureResult alloc];
    LODWORD(v28) = v18;
    v29 = -[CAMExposureResult initWithMode:pointOfInterest:exposureTargetBias:adjusting:exposureDidStart:exposureDidEnd:deviceSupportsFocus:](v27, "initWithMode:pointOfInterest:exposureTargetBias:adjusting:exposureDidStart:exposureDidEnd:deviceSupportsFocus:", v31, v20, v22, v24, v26, v13, v15, v28);
    id v30 = MEMORY[0x263EF83A0];
    objc_copyWeak(&v34, (id *)(a1 + 32));
    v33 = v29;
    pl_dispatch_async();

    objc_destroyWeak(&v34);
  }
}

void __44__CUCaptureController__setupFocusMonitoring__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = objc_msgSend(v4, "cam_compareKey:withDictionary:", @"currentCameraDevice.focusMode", v5);
  int v7 = objc_msgSend(v4, "cam_compareKey:withDictionary:", @"currentCameraDevice.focusPointOfInterest", v5);
  int v8 = [v4 objectForKeyedSubscript:@"currentCameraDevice.focusMode"];
  uint64_t v9 = [v8 integerValue];

  int64_t v10 = +[CAMCaptureConversions focusModeForCaptureFocusMode:v9];
  double v11 = [v4 objectForKeyedSubscript:@"currentCameraDevice.focusPointOfInterest"];
  [v11 CGPointValue];
  double v13 = v12;
  double v15 = v14;

  int v16 = [v4 objectForKeyedSubscript:@"deviceSupportsFocusKeyPath"];
  uint64_t v17 = [v16 BOOLValue];

  int v18 = [v4 objectForKeyedSubscript:@"contrastBasedFocusDidStartKeyPath"];
  uint64_t v19 = [v18 BOOLValue];

  uint64_t v20 = [v4 objectForKeyedSubscript:@"contrastBasedFocusDidEndKeyPath"];
  uint64_t v21 = [v20 BOOLValue];

  uint64_t v22 = [v4 objectForKeyedSubscript:@"currentCameraDevice.adjustingFocus"];
  uint64_t v23 = [v22 BOOLValue];

  if (!v6 || !v7 || (v19 & 1) != 0 || v21)
  {
    uint64_t v24 = -[CAMFocusResult initWithMode:pointOfInterest:performingContrastDetection:contrastBasedFocusDidStart:contrastBasedFocusDidEnd:deviceSupportsFocus:]([CAMFocusResult alloc], "initWithMode:pointOfInterest:performingContrastDetection:contrastBasedFocusDidStart:contrastBasedFocusDidEnd:deviceSupportsFocus:", v10, v23, v19, v21, v17, v13, v15);
    id v25 = MEMORY[0x263EF83A0];
    objc_copyWeak(&v28, (id *)(a1 + 32));
    BOOL v27 = v24;
    pl_dispatch_async();

    objc_destroyWeak(&v28);
  }
}

void __74__CUCaptureController__suggestionResultChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setHDRSuggested:*(unsigned __int8 *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) suggestionDelegate];
  [v2 captureController:*(void *)(a1 + 32) didOutputHDRSuggestion:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_setHDRSuggested:(BOOL)a3
{
  self->_HDRSuggested = a3;
}

- (CAMSuggestionDelegate)suggestionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionDelegate);
  return (CAMSuggestionDelegate *)WeakRetained;
}

uint64_t __68__CUCaptureController__zoomResultChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 184));
  [WeakRetained captureController:*(void *)(a1 + 32) didOutputVideoZoomFactor:*(double *)(a1 + 40)];

  [*(id *)(a1 + 32) _updateAutoMacroActive];
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _updateAutoMacroSuggested];
}

- (void)_setTorchAvailable:(BOOL)a3
{
  self->_torchAvailable = a3;
}

- (CAMAvailabilityDelegate)availabilityDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_availabilityDelegate);
  return (CAMAvailabilityDelegate *)WeakRetained;
}

- (BOOL)isTorchAvailable
{
  return self->_torchAvailable;
}

void __76__CUCaptureController__availabilityResultChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setFlashAvailable:*(unsigned __int8 *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) availabilityDelegate];
  [v2 captureController:*(void *)(a1 + 32) didOutputFlashAvailability:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_setFlashAvailable:(BOOL)a3
{
  self->_flashAvailable = a3;
}

- (void)_setTorchActive:(BOOL)a3
{
  self->_torchActive = a3;
}

- (void)_setFlashActive:(BOOL)a3
{
  self->_flashActive = a3;
}

void __47__CUCaptureController__setupExposureMonitoring__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained exposureDelegate];
  [v2 captureController:WeakRetained didOutputExposureResult:*(void *)(a1 + 32)];
}

- (CAMExposureDelegate)exposureDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_exposureDelegate);
  return (CAMExposureDelegate *)WeakRetained;
}

void __44__CUCaptureController__setupFocusMonitoring__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained focusDelegate];
  [v2 captureController:WeakRetained didOutputFocusResult:*(void *)(a1 + 32)];
}

- (CAMFocusDelegate)focusDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusDelegate);
  return (CAMFocusDelegate *)WeakRetained;
}

- (void)changeToTorchMode:(int64_t)a3
{
  id v5 = [[CAMTorchCommand alloc] initWithTorchMode:a3];
  id v4 = [(CUCaptureController *)self _captureEngine];
  [v4 enqueueCommand:v5];
}

- (void)handleSessionDidStartRunning
{
}

uint64_t __51__CUCaptureController_handleSessionDidStartRunning__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) runningDelegate];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 captureControllerDidStartRunning:*(void *)(a1 + 32)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (CAMCaptureRunningDelegate)runningDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_runningDelegate);
  return (CAMCaptureRunningDelegate *)WeakRetained;
}

- (void)_handleCaptureEngineExecutionNotification:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:@"CAMModeAndDeviceCommandDesiredConfiguration"];
  int v6 = [v4 objectForKey:@"CAMModeAndDeviceCommandResolvedConfiguration"];
  uint64_t v7 = [v4 objectForKey:@"CAMModeAndDeviceCommandRequestID"];
  int v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0) {
    goto LABEL_18;
  }
  [(CUCaptureController *)self _setDidCompleteInitialConfiguration:1];
  double v11 = [v4 objectForKey:@"CAMModeAndDeviceConfigurationError"];
  if (v11)
  {
    double v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController _handleCaptureEngineExecutionNotification:]((uint64_t)v11, v12);
    }

    double v13 = [v11 domain];
    int v14 = [v13 isEqualToString:@"CAMModeAndDeviceCommandCannotCaptureErrorDomain"];

    if (!v14) {
      goto LABEL_15;
    }
    double v15 = self;
    uint64_t v16 = 1;
  }
  else
  {
    double v15 = self;
    uint64_t v16 = 0;
  }
  [(CUCaptureController *)v15 _setFailedConfigurationPreventingCapture:v16];
LABEL_15:
  uint64_t v17 = -[CUCaptureController _commandForResetFocus:resetExposure:resetExposureTargetBias:](self, "_commandForResetFocus:resetExposure:resetExposureTargetBias:", -[CUCaptureController _shouldManageFocusForMode:](self, "_shouldManageFocusForMode:", [v6 mode]), 1, 1);
  int v18 = [(CUCaptureController *)self _captureEngine];
  [v18 enqueueCommand:v17];
  uint64_t v19 = [v8 integerValue];
  uint64_t v20 = [(CUCaptureController *)self configurationDelegate];
  if (objc_opt_respondsToSelector()) {
    [v20 captureController:self didChangeToGraphConfiguration:v6 forDesiredConfiguration:v5 requestID:v19];
  }

LABEL_18:
}

- (void)_setFailedConfigurationPreventingCapture:(BOOL)a3
{
  self->_failedConfigurationPreventingCapture = a3;
}

- (id)_commandForResetFocus:(BOOL)a3 resetExposure:(BOOL)a4 resetExposureTargetBias:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusDelegate);
  [WeakRetained captureControllerWillResetFocusAndExposure:self];

  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v11 = [[CAMSubjectAreaChangeMonitoringCommand alloc] initWithSubjectAreaChangeMonitoringEnabled:0];
  [v10 addObject:v11];
  if (v7)
  {
    uint64_t v20 = -[CAMFocusCommand initWithFocusMode:atPointOfInterest:smooth:]([CAMFocusCommand alloc], "initWithFocusMode:atPointOfInterest:smooth:", 3, [(CUCaptureController *)self _useSmoothFocus], 0.5, 0.5);
    [v10 addObject:v20];

    if (!v6)
    {
LABEL_3:
      if (!v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v6)
  {
    goto LABEL_3;
  }
  uint64_t v21 = -[CAMExposureCommand initWithExposureMode:atPointOfInterest:]([CAMExposureCommand alloc], "initWithExposureMode:atPointOfInterest:", 2, 0.5, 0.5);
  [v10 addObject:v21];
  if (![(CUCaptureController *)self _shouldLockWhiteBalanceForActiveVideoRequest])
  {
    uint64_t v22 = [[CAMWhiteBalanceCommand alloc] initWithWhiteBalanceMode:2];
    [v10 addObject:v22];
  }
  if (v5)
  {
LABEL_4:
    double v12 = [(CUCaptureController *)self exposureDelegate];
    [v12 baselineExposureValueForCaptureController:self];
    int v14 = v13;

    double v15 = [CAMExposureTargetBiasCommand alloc];
    LODWORD(v16) = v14;
    uint64_t v17 = [(CAMExposureTargetBiasCommand *)v15 initWithExposureTargetBias:v16];
    [v10 addObject:v17];
  }
LABEL_5:
  int v18 = [[CAMCaptureCommand alloc] initWithSubcommands:v10];

  return v18;
}

- (CAMConfigurationDelegate)configurationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationDelegate);
  return (CAMConfigurationDelegate *)WeakRetained;
}

- (void)cancelDelayedFocusAndExposureReset
{
  uint64_t v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__resetFocusAndExposureAfterCapture object:0];
}

- (void)prepareToCaptureStillImageAtSystemTime:(int64_t)a3
{
  BOOL v5 = [[CAMPrepareStillImageCaptureCommand alloc] initWithSystemTime:a3];
  id v4 = [(CUCaptureController *)self _captureEngine];
  [v4 enqueueCommand:v5];
}

- (BOOL)captureStillImageWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v12 = 0;
  BOOL v7 = [(CUCaptureController *)self _internalCaptureStillImageWithRequest:v6 error:&v12];
  id v8 = v12;
  if (!v7)
  {
    BOOL v9 = [v6 persistenceUUID];
    [(CUCaptureController *)self _endCaptureSignpostIntervalForPersistenceUUID:v9];

    id v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController captureStillImageWithRequest:error:]((uint64_t)v6, v8);
    }
  }
  if (a4) {
    *a4 = v8;
  }

  return v7;
}

- (BOOL)_isFailedConfigurationPreventingCapture
{
  return self->_failedConfigurationPreventingCapture;
}

- (id)_sanitizeStillImageRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[v4 mutableCopy];
  if (!self->_capturingTimelapse)
  {
    id v6 = [(CUCaptureController *)self _motionController];
    objc_msgSend(v5, "setCaptureOrientation:", objc_msgSend(v6, "captureOrientation"));
  }
  if ([(CUCaptureController *)self isCapturingBurst])
  {
    [v5 setFlashMode:0];
    [v5 setHdrMode:0];
    [v5 setIrisMode:0];
    [v5 setPhotoQualityPrioritization:0];
    [v5 setWantsAutoDualCameraFusion:0];
    BOOL v7 = +[CAMCaptureCapabilities capabilities];
    int v8 = objc_msgSend(v7, "isBurstSupportedForMode:device:", objc_msgSend(v5, "captureMode"), objc_msgSend(v5, "captureDevice"));

    if (v8)
    {
      BOOL v9 = [(CUCaptureController *)self _burstController];
      id v10 = [v9 currentBurstIdentifier];
      [v5 setBurstIdentifier:v10];

      [v5 setDeferredPersistenceOptions:2];
    }
  }
  if ([(CUCaptureController *)self isCapturingVideo])
  {
    [v5 setFlashMode:0];
    [v5 setHdrMode:0];
    [v5 setIrisMode:0];
    objc_msgSend(v5, "setPhotoQualityPrioritization:", -[CUCaptureController isCapturingCTMVideo](self, "isCapturingCTMVideo") ^ 1);
    [v5 setPhotoEncodingBehavior:0];
  }
  double v11 = [(CUCaptureController *)self _irisVideoController];
  int v12 = [v11 shouldHandleLivePhotoRenderingForRequest:v5];

  unsigned int v36 = [v5 shouldPersistToIncomingDirectory];
  double Current = CFAbsoluteTimeGetCurrent();
  int v14 = [MEMORY[0x263F086E0] mainBundle];
  double v15 = [v14 bundleIdentifier];

  unint64_t v16 = [v4 irisMode] - 3;
  uint64_t v17 = [v5 irisVideoPersistenceUUIDForEV0:0];
  uint64_t v18 = [v4 irisLocalVideoDestinationURLForEV0:0];
  uint64_t v19 = (void *)v18;
  if (v16 >= 0xFFFFFFFFFFFFFFFELL && !v18)
  {
    if (v12) {
      +[CAMIrisDiskUtilities videoDestinationPathForStillImageRequest:v5 captureTime:0 isEV0ForHDR:v15 bundleIdentifier:Current];
    }
    else {
    uint64_t v20 = +[CAMPersistenceController uniquePathForAssetWithUUID:v17 captureTime:@"MOV" extension:v36 usingIncomingDirectory:Current];
    }
    uint64_t v19 = [NSURL fileURLWithPath:v20];
    [v5 setLocalVideoDestinationURL:v19];
  }
  uint64_t v21 = [v5 irisVideoPersistenceUUIDForEV0:1];
  uint64_t v22 = [v4 irisLocalVideoDestinationURLForEV0:1];
  uint64_t v23 = (void *)v22;
  if (v16 >= 0xFFFFFFFFFFFFFFFELL && !v22)
  {
    uint64_t v24 = v17;
    if (v12) {
      +[CAMIrisDiskUtilities videoDestinationPathForStillImageRequest:v5 captureTime:1 isEV0ForHDR:v15 bundleIdentifier:Current];
    }
    else {
    id v25 = +[CAMPersistenceController uniquePathForAssetWithUUID:v21 captureTime:@"MOV" extension:v36 usingIncomingDirectory:Current];
    }
    uint64_t v23 = [NSURL fileURLWithPath:v25];
    [v5 setEV0LocalVideoDestinationURL:v23];

    uint64_t v17 = v24;
  }
  if ([v4 isCTMVideo])
  {
    uint64_t v26 = [v4 localCTMVideoDestinationURL];
    if (!v26)
    {
      id v34 = v17;
      double v27 = CFAbsoluteTimeGetCurrent();
      uint64_t v28 = [v5 persistenceUUID];
      if (v12)
      {
        v29 = (void *)v28;
        +[CAMIrisDiskUtilities videoDestinationPathForStillImageRequest:v5 captureTime:0 isEV0ForHDR:v15 bundleIdentifier:v27];
      }
      else
      {
        v29 = (void *)v28;
        +[CAMPersistenceController uniquePathForAssetWithUUID:v28 captureTime:@"MOV" extension:v36 usingIncomingDirectory:v27];
      id v30 = };
      uint64_t v26 = objc_msgSend(NSURL, "fileURLWithPath:", v30, v34);
      [v5 setLocalCTMVideoDestinationURL:v26];

      uint64_t v17 = v35;
    }
  }
  if (![v5 assertionIdentifier])
  {
    int64_t v31 = [(CUCaptureController *)self _powerController];
    objc_msgSend(v5, "setAssertionIdentifier:", objc_msgSend(v31, "generateAssertionIdentifier"));
  }
  v32 = (void *)[v5 copy];

  return v32;
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (CAMPowerController)_powerController
{
  return self->__powerController;
}

- (int64_t)_maximumNumberOfStillImageRequests
{
  return self->__maximumNumberOfStillImageRequests;
}

- (void)_setMaximumNumberOfStillImageRequests:(int64_t)a3
{
  self->__maximumNumberOfStillImageRequests = a3;
}

- (void)_updateAvailabilityAfterEnqueuedRequest:(id)a3
{
  id v8 = a3;
  id v4 = [v8 persistenceUUID];
  [(CUCaptureController *)self _startCaptureSignpostIntervalForPersistenceUUID:v4];

  if ([(CUCaptureController *)self _shouldTrackInflightCountForRequest:v8])
  {
    uint64_t v5 = [v8 type];
    id v6 = [(CUCaptureController *)self _numberOfInflightRequestsByType];
    BOOL v7 = [NSNumber numberWithInteger:v5];
    [v6 addObject:v7];

    [(CUCaptureController *)self _updateAvailabilityForRequestType:v5];
  }
}

- (NSCountedSet)_numberOfInflightRequestsByType
{
  return self->__numberOfInflightRequestsByType;
}

- (void)_updateAvailabilityForRequestType:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (a3 == 1)
  {
    BOOL v8 = [(CUCaptureController *)self _isVideoCaptureAvailable];
  }
  else if (a3)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = [(CUCaptureController *)self _numberOfInflightRequestsByType];
    id v6 = [NSNumber numberWithInteger:0];
    unint64_t v7 = [v5 countForObject:v6];

    BOOL v8 = v7 < [(CUCaptureController *)self _maximumNumberOfStillImageRequests];
  }
  BOOL v9 = [(CUCaptureController *)self isCaptureAvailable];
  BOOL v10 = v8 ^ [(CUCaptureController *)self isConfigurationAvailable];
  [(CUCaptureController *)self _setCaptureAvailable:v8];
  [(CUCaptureController *)self _setConfigurationAvailable:v8];
  if (v8 != v9) {
    [(CUCaptureController *)self _notifyDelegateOfCaptureAvailabilityChanged:v8];
  }
  if (v10)
  {
    [(CUCaptureController *)self _notifyDelegateOfConfigurationAvailabilityChanged:v8];
  }
}

- (void)_setCaptureAvailable:(BOOL)a3
{
  if (self->_captureAvailable != a3)
  {
    self->_captureAvailable = a3;
    id v4 = os_log_create("com.apple.camera", "Camera");
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (a3)
    {
      if (v5)
      {
        *(_WORD *)unint64_t v7 = 0;
        _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Capture became available", v7, 2u);
      }
      int v6 = 64;
    }
    else
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Capture became unavailable", buf, 2u);
      }
      int v6 = 63;
    }

    CAMSignpostWithIDAndArgs(v6, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  }
}

- (void)_setConfigurationAvailable:(BOOL)a3
{
  self->_configurationAvailable = a3;
}

- (void)stillImageRequestDidStartCapturing:(id)a3 resolvedSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  pl_dispatch_async();
}

void __75__CUCaptureController_stillImageRequestDidStartCapturing_resolvedSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 stillImageRequestDidStartCapturing:*(void *)(a1 + 32) resolvedSettings:*(void *)(a1 + 40)];
  }
}

- (void)stillImageRequest:(id)a3 didCompleteStillImageCaptureWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 burstIdentifier];
  if (v8) {
    [(CUCaptureController *)self _processCapturedBurstRequest:v6 withResult:v7];
  }
  BOOL v9 = [v7 error];
  BOOL v10 = [(CUCaptureController *)self resultDelegate];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v10 captureController:self didGenerateStillImageCaptureResult:v7 fromRequest:v6];
  }
  id v11 = [(CUCaptureController *)self _capturingLowLightStillImageRequest];

  if (v11 == v6) {
    pl_dispatch_async();
  }
  int v12 = [(CUCaptureController *)self _responseQueue];
  unint64_t v16 = v6;
  uint64_t v17 = v7;
  id v13 = v9;
  id v14 = v7;
  id v15 = v6;
  pl_dispatch_async();
}

- (CAMCaptureResultDelegate)resultDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultDelegate);
  return (CAMCaptureResultDelegate *)WeakRetained;
}

- (OS_dispatch_queue)_responseQueue
{
  return self->__responseQueue;
}

- (id)_thumbnailImageFromStillImageCaptureResult:(id)a3 imageOrientation:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 stillImageFilteredPreviewSurface];
  if (!v7) {
    uint64_t v7 = [v6 stillImageUnfilteredPreviewSurface];
  }
  id v8 = [(CUCaptureController *)self _responseThumbnailGenerator];
  BOOL v9 = (CGImage *)objc_msgSend(v8, "newBGRAImageOfFormat:inOrientation:usingSurface:", objc_msgSend(MEMORY[0x263F5DB18], "masterThumbnailFormat"), a4, v7);
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:v9];
  CGImageRelease(v9);

  return v10;
}

- (CAMThumbnailGenerator)_responseThumbnailGenerator
{
  return self->__responseThumbnailGenerator;
}

- (void)stillImageRequestDidCompleteCapture:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  pl_dispatch_async();
}

uint64_t __80__CUCaptureController_stillImageRequest_didCompleteStillImageCaptureWithResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCapturingLowLightStillImageRequest:0];
}

- (void)_updateAvailabilityAfterCapturedRequest:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 type];
  if ([(CUCaptureController *)self _shouldTrackInflightCountForRequest:v8])
  {
    id v5 = [(CUCaptureController *)self _numberOfInflightRequestsByType];
    id v6 = [NSNumber numberWithInteger:v4];
    [v5 removeObject:v6];

    if (v4 != 1) {
      goto LABEL_6;
    }
  }
  else if (v4 != 1)
  {
    goto LABEL_7;
  }
  [(CUCaptureController *)self _setVideoCaptureAvailable:1];
LABEL_6:
  [(CUCaptureController *)self _updateAvailabilityForRequestType:v4];
LABEL_7:
  id v7 = [v8 persistenceUUID];
  [(CUCaptureController *)self _endCaptureSignpostIntervalForPersistenceUUID:v7];
}

- (void)_updateMaximumNumberOfStillImageRequestsAfterCapturedRequestIfNecessary:(id)a3
{
  uint64_t v4 = [a3 captureRequest];
  uint64_t v5 = [v4 type];

  id v11 = [(CUCaptureController *)self _numberOfInflightRequestsByType];
  id v6 = [NSNumber numberWithInteger:v5];
  uint64_t v7 = [v11 countForObject:v6];

  id v8 = v11;
  if (v7 <= 0)
  {
    BOOL v9 = +[CAMCaptureCapabilities capabilities];
    uint64_t v10 = [v9 maximumNumberOfInflightRequests];

    if ([(CUCaptureController *)self isCapturingBurst]) {
      uint64_t v10 = [(CUCaptureController *)self _maximumNumberOfStillImageRequestsDuringBurst];
    }
    [(CUCaptureController *)self _setMaximumNumberOfStillImageRequests:v10];
    id v8 = v11;
  }
}

void __65__CUCaptureController_stillImageRequestDidCompleteCapture_error___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = [*(id *)(a1 + 32) assertionIdentifier];
  if (objc_opt_respondsToSelector()) {
    [v4 stillImageRequestDidCompleteCapture:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  }
  uint64_t v3 = [*(id *)(a1 + 48) _powerController];
  [v3 removeAssertionForIdentifier:v2 withReason:1];
}

- (id)_identifierForPendingVideoForStillImageRequest:(id)a3
{
  return (id)[a3 persistenceUUID];
}

void __80__CUCaptureController_stillImageRequest_didCompleteStillImageCaptureWithResult___block_invoke_2(id *a1)
{
  uint64_t v28 = [a1[4] delegate];
  unsigned int v26 = [a1[4] sessionIdentifier];
  uint64_t v2 = [a1[4] burstIdentifier];
  if (v2)
  {
    uint64_t v3 = [a1[5] _burstController];
    uint64_t v25 = [v3 estimatedCountForIdentifier:v2];
  }
  else
  {
    uint64_t v25 = 0;
  }
  int64_t v4 = +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", a1[6], [a1[4] captureDevice], objc_msgSend(a1[4], "captureOrientation"));
  double v27 = [a1[5] _thumbnailImageFromStillImageCaptureResult:a1[6] imageOrientation:v4];
  uint64_t v5 = [a1[6] metadata];
  id v6 = [a1[4] textAnalysisIdentifier];

  if (v6)
  {
    uint64_t v7 = [a1[5] _textAnalysisImageFromStillImageResult:a1[6] imageOrientation:v4];
  }
  else
  {
    uint64_t v7 = 0;
  }
  +[CAMAspectCropUtilities finalExpectedSizeWithPhotoMetadata:aspectRatio:](CAMAspectCropUtilities, "finalExpectedSizeWithPhotoMetadata:aspectRatio:", v5, [a1[4] aspectRatioCrop]);
  double v9 = v8;
  double v11 = v10;
  int v12 = [a1[6] capturePhoto];
  id v13 = [v12 resolvedSettings];
  uint64_t v14 = [v13 uniqueID];

  id v15 = [CAMStillImageCaptureResponse alloc];
  unint64_t v16 = [a1[6] persistenceUUID];
  uint64_t v17 = [a1[6] captureDate];
  [a1[6] metadata];
  uint64_t v18 = v24 = (void *)v5;
  uint64_t v19 = [a1[6] coordinationInfo];
  LOBYTE(v23) = [a1[6] isExpectingPairedVideo];
  uint64_t v20 = -[CAMStillImageCaptureResponse initWithUUID:captureSession:captureDate:metadata:burstIdentifier:burstRepresentedCount:imageWellImage:textAnalysisImage:coordinationInfo:finalExpectedPixelSize:expectingPairedVideo:captureID:semanticEnhanceScene:](v15, "initWithUUID:captureSession:captureDate:metadata:burstIdentifier:burstRepresentedCount:imageWellImage:textAnalysisImage:coordinationInfo:finalExpectedPixelSize:expectingPairedVideo:captureID:semanticEnhanceScene:", v16, v26, v17, v18, v2, v25, v9, v11, v27, v7, v19, v23, v14, [a1[6] semanticEnhancement]);

  id v29 = a1[4];
  id v30 = a1[7];
  uint64_t v21 = v20;
  id v22 = v28;
  pl_dispatch_async();
}

- (BOOL)isCapturingStillImage
{
  uint64_t v2 = [(CUCaptureController *)self _numberOfInflightRequestsByType];
  BOOL v3 = [v2 countForObject:&unk_26BDDE760] != 0;

  return v3;
}

- (void)_resetFocusAndExposureAfterCapture
{
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  if ([(CUCaptureController *)self _shouldResetFocusAndExposureAfterCapture])
  {
    [(CUCaptureController *)self _resetFocusAndExposureIfAppropriateForReason:1];
  }
  else
  {
    BOOL v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v4 = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Not resetting focus/exposure because still capturing", v4, 2u);
    }
  }
}

- (void)_resetFocusAndExposureIfAppropriateForReason:(int64_t)a3
{
  uint64_t v5 = [(CUCaptureController *)self focusDelegate];
  id v13 = v5;
  if (v5 && ![v5 captureController:self shouldResetFocusAndExposureForReason:a3])
  {
    uint64_t v10 = 0;
    uint64_t v6 = 0;
  }
  else
  {
    if ([(CUCaptureController *)self isCapturingVideo]) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = [(CUCaptureController *)self isCapturingTimelapse] ^ 1;
    }
    if (![(CUCaptureController *)self isCapturingVideo]
      || (id WeakRetained = objc_loadWeakRetained((id *)&self->_exposureDelegate),
          char v8 = objc_opt_respondsToSelector(),
          WeakRetained,
          (v8 & 1) == 0))
    {
      uint64_t v10 = 1;
LABEL_11:
      double v11 = [(CUCaptureController *)self _commandForResetFocus:v6 resetExposure:v10 resetExposureTargetBias:v10];
      int v12 = [(CUCaptureController *)self _captureEngine];
      [v12 enqueueCommand:v11];

      goto LABEL_14;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_exposureDelegate);
    uint64_t v10 = [v9 captureControllerUserHasAdjustedExposureTargetBiasFromBaseline:self] ^ 1;

    if (v6) {
      goto LABEL_11;
    }
  }
  if (v10) {
    goto LABEL_11;
  }
LABEL_14:
}

- (void)panoramaConfigurationDidChangeWithImageQueue:(_CAImageQueue *)a3 direction:(int64_t)a4
{
  if (a3) {
    CFRetain(a3);
  }
  pl_dispatch_async();
}

void __78__CUCaptureController_panoramaConfigurationDidChangeWithImageQueue_direction___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) panoramaPreviewView];
  [v4 setImageQueue:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) panoramaChangeDelegate];
  [v2 panoramaConfigurationDidChangeWithDirection:*(void *)(a1 + 48)];
  BOOL v3 = *(const void **)(a1 + 40);
  if (v3) {
    CFRelease(v3);
  }
}

- (CAMPanoramaPreviewView)panoramaPreviewView
{
  panoramaPreviewView = self->_panoramaPreviewView;
  if (!panoramaPreviewView)
  {
    id v4 = [CAMPanoramaPreviewView alloc];
    uint64_t v5 = -[CAMPanoramaPreviewView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    uint64_t v6 = self->_panoramaPreviewView;
    self->_panoramaPreviewView = v5;

    panoramaPreviewView = self->_panoramaPreviewView;
  }
  return panoramaPreviewView;
}

- (CAMPanoramaChangeDelegate)panoramaChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_panoramaChangeDelegate);
  return (CAMPanoramaChangeDelegate *)WeakRetained;
}

- (void)handleSessionInterruptionForReason:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__CUCaptureController_handleSessionInterruptionForReason___block_invoke;
  v3[3] = &unk_263FA0208;
  v3[4] = self;
  cam_perform_on_main_asap(v3);
}

- (void)handleSessionDidStopRunning
{
  BOOL v3 = [(CUCaptureController *)self _protectionController];
  [v3 abortOutstandingNebulaDaemonWriteProtectionsForReason:@"Capture session stopped running"];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__CUCaptureController_handleSessionDidStopRunning__block_invoke;
  v4[3] = &unk_263FA0208;
  void v4[4] = self;
  cam_perform_on_main_asap(v4);
}

uint64_t __58__CUCaptureController_handleSessionInterruptionForReason___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interruptionDelegate];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 captureControllerWasInterrupted:*(void *)(a1 + 32)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (CAMCaptureInterruptionDelegate)interruptionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interruptionDelegate);
  return (CAMCaptureInterruptionDelegate *)WeakRetained;
}

uint64_t __50__CUCaptureController_handleSessionDidStopRunning__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isCapturingTimelapse] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) _commandForResetFocus:1 resetExposure:1 resetExposureTargetBias:1];
    BOOL v3 = [*(id *)(a1 + 32) _captureEngine];
    [v3 enqueueCommand:v2];
  }
  uint64_t v4 = [*(id *)(a1 + 32) runningDelegate];
  if (v4)
  {
    uint64_t v6 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v6 captureControllerDidStopRunning:*(void *)(a1 + 32)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (CUCaptureController)initWithCaptureConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5 engineOptions:(int64_t)a6 locationController:(id)a7 motionController:(id)a8 burstController:(id)a9 protectionController:(id)a10 powerController:(id)a11 irisVideoController:(id)a12 remoteShutterController:(id)a13
{
  int64_t v43 = a6;
  BOOL v44 = a5;
  id v18 = a3;
  id v50 = a7;
  id v49 = a8;
  id v48 = a9;
  id v47 = a10;
  id v19 = a11;
  id v46 = a12;
  id v45 = a13;
  v51.receiver = self;
  v51.super_class = (Class)CUCaptureController;
  uint64_t v20 = [(CUCaptureController *)&v51 init];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->__locationController, a7);
    objc_storeStrong((id *)&v21->__motionController, a8);
    objc_storeStrong((id *)&v21->__burstController, a9);
    objc_storeStrong((id *)&v21->__protectionController, a10);
    objc_storeStrong((id *)&v21->__powerController, a11);
    objc_storeStrong((id *)&v21->__irisVideoController, a12);
    objc_storeStrong((id *)&v21->__remoteShutterController, a13);
    id v22 = v19;
    uint64_t v23 = [[CAMCaptureEngine alloc] initWithPowerController:v19 captureController:v21 options:v43];
    captureEngine = v21->__captureEngine;
    v21->__captureEngine = v23;

    [(CAMCaptureEngine *)v21->__captureEngine registerCaptureService:v21];
    [(CUCaptureController *)v21 _setupFocusAndExposureMonitoring];
    [(CUCaptureController *)v21 _setupSuggestionMonitoring];
    [(CUCaptureController *)v21 _setupAvailabilityMonitoring];
    [(CUCaptureController *)v21 _setupZoomMonitoring];
    [(CUCaptureController *)v21 _setupZoomPIPMonitoring];
    [(CUCaptureController *)v21 _setupSystemPressureStateMonitoring];
    [(CUCaptureController *)v21 _setupOverCapturePreviewMonitoring];
    [(CUCaptureController *)v21 _setupDocumentScanningMonitoring];
    [(CUCaptureController *)v21 _setupStereoCaptureStatusMonitoring];
    [(CUCaptureController *)v21 _setupStereoVideoCaptureStatusMonitoring];
    uint64_t v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v21 selector:sel__handleCaptureEngineExecutionNotification_ name:@"CAMCaptureEngineExecutedCommandWithContextNotification" object:v21->__captureEngine];
    unsigned int v26 = +[CAMCaptureCapabilities capabilities];
    if (([v26 isBackPortraitModeSupported] & 1) != 0
      || [v26 isFrontPortraitModeSupported])
    {
      objc_msgSend(v25, "addObserver:selector:name:object:", v21, sel__handleShallowDepthOfFieldStatusChangedNotification_, @"AVCaptureDeviceShallowDepthOfFieldStatusChangedNotification", 0, v43);
    }
    double v27 = -[CUCaptureController _commandForConfiguration:zoomFactor:outputToExternalStorage:outRequestID:](v21, "_commandForConfiguration:zoomFactor:outputToExternalStorage:outRequestID:", v18, v44, 0, a4, v43);
    [(CAMCaptureEngine *)v21->__captureEngine enqueueCommand:v27];
    [(CAMCaptureEngine *)v21->__captureEngine startWithRetryCount:0 retryInterval:@"initial configuration" logReason:0 completion:0.0];
    uint64_t v28 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.camera.capture-controller.response-queue", v28);
    responseQueue = v21->__responseQueue;
    v21->__responseQueue = (OS_dispatch_queue *)v29;

    int64_t v31 = objc_alloc_init(CAMThumbnailGenerator);
    responseThumbnailGenerator = v21->__responseThumbnailGenerator;
    v21->__responseThumbnailGenerator = v31;

    v33 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    numberOfInflightRequestsByType = v21->__numberOfInflightRequestsByType;
    v21->__numberOfInflightRequestsByType = v33;

    v35 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    identifiersForActiveLivePhotoVideoCaptures = v21->__identifiersForActiveLivePhotoVideoCaptures;
    v21->__identifiersForActiveLivePhotoVideoCaptures = v35;

    v37 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    identifiersForActiveCTMVideoCaptures = v21->__identifiersForActiveCTMVideoCaptures;
    v21->__identifiersForActiveCTMVideoCaptures = v37;

    v21->__needsInitialPairedVideoUpdate = 1;
    *(_DWORD *)&v21->_captureAvailable = 16843009;
    v21->_flashCompromise = 0;
    [(CUCaptureController *)v21 _setVideoCaptureAvailable:1];
    v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    persistenceUUIDToSignpostID = v21->__persistenceUUIDToSignpostID;
    v21->__persistenceUUIDToSignpostID = v39;

    v21->__nextSignpostID = 1;
    v41 = v21;

    id v19 = v22;
  }

  return v21;
}

- (void)dealloc
{
  [(CUCaptureController *)self invalidateController];
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CUCaptureController;
  [(CUCaptureController *)&v4 dealloc];
}

- (void)invalidateController
{
  [(CUCaptureController *)self _teardownFocusAndExposureMonitoring];
  [(CUCaptureController *)self _teardownSuggestionMonitoring];
  [(CUCaptureController *)self _teardownAvailabilityMonitoring];
  [(CUCaptureController *)self _teardownZoomMonitoring];
  [(CUCaptureController *)self _teardownZoomPIPMonitoring];
  [(CUCaptureController *)self _teardownSystemPressureStateMonitoring];
  [(CUCaptureController *)self _tearDownOverCapturePreviewMonitoring];
  [(CUCaptureController *)self _teardownStereoCaptureStatusMonitoring];
  [(CUCaptureController *)self _teardownStereoVideoCaptureStatusMonitoring];
  [(CUCaptureController *)self _tearDownDocumentScanningMonitoring];
  captureEngine = self->__captureEngine;
  self->__captureEngine = 0;
}

- (int)applyCaptureConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5
{
  uint64_t v5 = self;
  int v8 = 0;
  uint64_t v6 = [(CUCaptureController *)self _commandForConfiguration:a3 zoomFactor:a5 outputToExternalStorage:&v8 outRequestID:a4];
  [(CAMCaptureEngine *)v5->__captureEngine enqueueCommand:v6];
  LODWORD(v5) = v8;

  return (int)v5;
}

- (void)_setupOverCapturePreviewMonitoring
{
  id v4 = [(CUCaptureController *)self _captureEngine];
  BOOL v3 = [v4 overCaptureVideoPreviewLayer];

  if (v3) {
    [v4 addObserver:self forKeyPath:@"overCaptureVideoPreviewLayer.overCaptureStatus" options:1 context:CAMOverCapturePreviewContext];
  }
}

- (void)_tearDownOverCapturePreviewMonitoring
{
  id v4 = [(CUCaptureController *)self _captureEngine];
  BOOL v3 = [v4 overCaptureVideoPreviewLayer];

  if (v3) {
    [v4 removeObserver:self forKeyPath:@"overCaptureVideoPreviewLayer.overCaptureStatus" context:CAMOverCapturePreviewContext];
  }
}

- (void)_overCapturePreviewStatusChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 overCaptureVideoPreviewLayer];
  double v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

  if (v11) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12
    && [v7 isEqualToString:@"overCaptureVideoPreviewLayer.overCaptureStatus"])
  {
    +[CAMCaptureConversions overCapturePreviewStatusForAVPreviewStatus:](CAMCaptureConversions, "overCapturePreviewStatusForAVPreviewStatus:", [v11 integerValue]);
    pl_dispatch_async();
  }
}

void __82__CUCaptureController__overCapturePreviewStatusChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewLayerOverCaptureStatusDelegate];
  [v2 captureController:*(void *)(a1 + 32) didOutputOverCapturePreviewStatus:*(void *)(a1 + 40)];
}

- (id)_thumbnailImageFromVideoCaptureResult:(id)a3 previewOrientation:(int64_t)a4 previewImage:(id *)a5
{
  id v8 = (__CVBuffer *)[a3 videoPreviewPixelBuffer];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F827E8]) _initWithIOSurface:CVPixelBufferGetIOSurface(v8) imageOrientation:a4];
  uint64_t v10 = [(CUCaptureController *)self _responseThumbnailGenerator];
  double v11 = (CGImage *)objc_msgSend(v10, "newBGRAImageOfFormat:inOrientation:usingPixelBuffer:", objc_msgSend(MEMORY[0x263F5DB18], "masterThumbnailFormat"), a4, v8);
  BOOL v12 = (void *)[objc_alloc(MEMORY[0x263F827E8]) initWithCGImage:v11];
  CGImageRelease(v11);
  if (a5 && v9) {
    *a5 = v9;
  }

  return v12;
}

- (id)_textAnalysisImageFromStillImageResult:(id)a3 imageOrientation:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 stillImageFilteredPreviewSurface];
  if (!v7) {
    uint64_t v7 = [v6 stillImageUnfilteredPreviewSurface];
  }
  id v8 = [(CUCaptureController *)self _responseThumbnailGenerator];
  id v9 = (CGImage *)[v8 newBGRAImageInOrientation:a4 usingSurface:v7];

  id v10 = objc_alloc(MEMORY[0x263F827E8]);
  double v11 = [MEMORY[0x263F82B60] mainScreen];
  [v11 scale];
  BOOL v12 = objc_msgSend(v10, "initWithCGImage:scale:orientation:", v9, 0);

  CGImageRelease(v9);
  return v12;
}

- (BOOL)initiateCTMCaptureWithSettings:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(CUCaptureController *)self _canBeginCaptureCheckAvailability:1 error:a4];
  if (v7)
  {
    id v8 = [v6 persistenceUUID];
    [(CUCaptureController *)self _startCaptureSignpostIntervalForPersistenceUUID:v8];

    id v9 = [(CUCaptureController *)self _sanitizeStillImageRequest:v6];
    id v10 = [[CAMCTMInitiateCaptureCommand alloc] initWithSettings:v9];
    double v11 = [(CUCaptureController *)self _captureEngine];
    [v11 enqueueCommand:v10];
  }
  return v7;
}

- (void)endCTMVideoCapture
{
  BOOL v3 = [(CUCaptureController *)self _capturingCTMVideoRequest];
  if (v3)
  {
    [(CUCaptureController *)self _setCapturingCTMVideoRequest:0];
    id v4 = [v3 persistenceUUID];
    uint64_t v5 = [[CAMCTMEndCaptureCommand alloc] initWithPersistenceUUID:v4];
    id v6 = [(CUCaptureController *)self _captureEngine];
    [v6 enqueueCommand:v5];
  }
  else
  {
    BOOL v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Cannot stop CTM video recording: no capture request found", v8, 2u);
    }
  }
}

- (void)cancelCTMCaptureForSettings:(id)a3
{
  if (a3)
  {
    id v7 = [a3 persistenceUUID];
    id v4 = [[CAMCTMCancelMomentCaptureCommand alloc] initWithPersistenceUUID:v7];
    uint64_t v5 = [(CUCaptureController *)self _captureEngine];
    [v5 enqueueCommand:v4];
  }
  else
  {
    id v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController cancelCTMCaptureForSettings:]();
    }
  }
}

- (BOOL)_canBeginCaptureCheckAvailability:(BOOL)a3 error:(id *)a4
{
  if (a3 && ![(CUCaptureController *)self isCaptureAvailable])
  {
    if (a4)
    {
      uint64_t v6 = -22100;
      goto LABEL_14;
    }
    return 0;
  }
  if ([(CUCaptureController *)self _isFailedConfigurationPreventingCapture])
  {
    if (a4)
    {
      uint64_t v6 = -22102;
LABEL_14:
      CAMCaptureControllerError(v6, 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a4 = v7;
      return result;
    }
    return 0;
  }
  if (![(CUCaptureController *)self _didCompleteInitialConfiguration])
  {
    if (a4)
    {
      uint64_t v6 = -22103;
      goto LABEL_14;
    }
    return 0;
  }
  if ([(CUCaptureController *)self isInterrupted])
  {
    if (a4)
    {
      uint64_t v6 = -22101;
      goto LABEL_14;
    }
    return 0;
  }
  return 1;
}

- (BOOL)_internalCaptureStillImageWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(CUCaptureController *)self _canBeginCaptureCheckAvailability:1 error:a4];
  if (v7)
  {
    id v8 = [(CUCaptureController *)self _sanitizeStillImageRequest:v6];

    id v9 = [MEMORY[0x263EFF980] array];
    if ([v8 isCTMVideo])
    {
      [(CUCaptureController *)self _setCapturingCTMVideoRequest:v8];
      id v10 = [(CAMCaptureCommand *)[CAMUpdateFocusAndExposureForStartVideoRecordingCommand alloc] initWithSubcommands:0];
      [v9 addObject:v10];
      if ([(CUCaptureController *)self _shouldLockWhiteBalanceForCTMVideoRequest:v8])
      {
        double v11 = [[CAMWhiteBalanceCommand alloc] initWithWhiteBalanceMode:0];
        [v9 addObject:v11];
      }
    }
    else if ([v8 lowLightMode])
    {
      [(CUCaptureController *)self _setCapturingLowLightStillImageRequest:v8];
    }
    BOOL v12 = [[CAMStillImageCaptureCommand alloc] initWithRequest:v8];
    [v9 addObject:v12];
    id v13 = [[CAMCaptureCommand alloc] initWithSubcommands:v9];
    uint64_t v14 = [(CUCaptureController *)self _captureEngine];
    [v14 enqueueCommand:v13];
    id v15 = [(CUCaptureController *)self _powerController];
    objc_msgSend(v15, "addAssertionForIndentifier:withReason:", objc_msgSend(v8, "assertionIdentifier"), 1);
    unint64_t v16 = [v8 burstIdentifier];

    if (v16)
    {
      uint64_t v17 = [(CUCaptureController *)self _burstController];
      [v17 processEnqueuedRequest:v8];
    }
    [(CUCaptureController *)self _updateMaximumNumberOfStillImageRequestsAfterEnqueuingRequest:v8];
    [(CUCaptureController *)self _updateAvailabilityAfterEnqueuedRequest:v8];
  }
  else
  {
    id v8 = v6;
  }

  return v7;
}

- (void)resumeCapturingStillImagePairedVideo
{
  BOOL v3 = [(CUCaptureController *)self _needsInitialPairedVideoUpdate];
  if ([(CUCaptureController *)self _isCapturingPairedVideoPaused] || v3)
  {
    id v4 = [(CUCaptureController *)self _captureEngine];
    uint64_t v5 = [[CAMPausePairedVideoRecordingCommand alloc] initWithRecordingPaused:0];
    [v4 enqueueCommand:v5];
    [(CUCaptureController *)self _setCapturingPairedVideoPaused:0];
    [(CUCaptureController *)self _setNeedsInitialPairedVideoUpdate:0];
    id v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Resumed live photo video capture", v7, 2u);
    }
  }
}

- (void)prepareDeferredProcessingWithStillImageRequest:(id)a3
{
  id v4 = a3;
  id v7 = [(CUCaptureController *)self _deferredProcessingCoordinator];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F5D8B0]);
    -[CUCaptureController _setDeferredProcessingCoordinator:](self, "_setDeferredProcessingCoordinator:");
  }
  uint64_t v5 = [[CAMPrepareDeferredProcessingCommand alloc] initWithRequest:v4 coordinator:v7];

  id v6 = [(CUCaptureController *)self _captureEngine];
  [v6 enqueueCommand:v5];
}

- (void)preparePhotoOutputForExpectedPhotoResolution:(int64_t)a3
{
  if (![(CUCaptureController *)self isCapturingBurst])
  {
    id v6 = [[CAMUltraHighResolutionZeroShutterLagEnabledCommand alloc] initWithEnabled:a3 == 3];
    uint64_t v5 = [(CUCaptureController *)self _captureEngine];
    [v5 enqueueCommand:v6];
  }
}

- (void)stillImageRequestWillStartCapturingVideo:(id)a3
{
  id v4 = a3;
  [v4 isCTMVideo];
  uint64_t v5 = [(CUCaptureController *)self _identifierForPendingVideoForStillImageRequest:v4];
  if ([v4 shouldProtectPersistenceForVideo])
  {
    id v6 = [(CUCaptureController *)self _protectionController];
    [v6 startProtectingPersistenceForRequest:v4];
  }
  id v7 = [(CUCaptureController *)self _protectionController];
  [v7 startProtectingNebulaDaemonWritesForIdentifier:v5];

  id v8 = v5;
  pl_dispatch_async();
}

uint64_t __64__CUCaptureController_stillImageRequestWillStartCapturingVideo___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    return [v3 _beginTrackingCTMVideoRecordingForIdentifier:v4];
  }
  else {
    return [v3 _beginTrackingLivePhotoVideoRecordingForIdentifier:v4];
  }
}

- (void)stillImageRequestDidBeginCaptureBeforeResolvingSettings:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  pl_dispatch_async();
}

void __79__CUCaptureController_stillImageRequestDidBeginCaptureBeforeResolvingSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 stillImageRequestDidBeginCaptureBeforeResolvingSettings:*(void *)(a1 + 32)];
  }
}

- (void)stillImageRequestDidStopCapturingStillImage:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  pl_dispatch_async();
}

void __67__CUCaptureController_stillImageRequestDidStopCapturingStillImage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:0];
  id v2 = [*(id *)(a1 + 40) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 stillImageRequestDidStopCapturingStillImage:*(void *)(a1 + 40)];
  }
}

- (void)stillImageRequestDidUnblockResponsiveCapture:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  pl_dispatch_async();
}

uint64_t __68__CUCaptureController_stillImageRequestDidUnblockResponsiveCapture___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAvailabilityAfterCapturedRequest:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _updateMaximumNumberOfStillImageRequestsAfterCapturedRequestIfNecessary:v3];
}

uint64_t __80__CUCaptureController_stillImageRequest_didCompleteStillImageCaptureWithResult___block_invoke_3(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    return [v3 stillImageRequestDidCompleteStillImageCapture:v4 withResponse:v5 error:v6];
  }
  return result;
}

- (void)stillImageRequest:(id)a3 didStopCapturingLivePhotoVideoForCoordinationInfo:(id)a4
{
  id v6 = a3;
  if ([a4 isFinalExpectedVideoResult])
  {
    id v8 = [(CUCaptureController *)self _identifierForPendingVideoForStillImageRequest:v6];
    id v7 = v8;
    pl_dispatch_async();
  }
}

uint64_t __91__CUCaptureController_stillImageRequest_didStopCapturingLivePhotoVideoForCoordinationInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _endTrackingLivePhotoVideoRecordingForIdentifier:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 _resetFocusAndExposureAfterCaptureForType:1];
}

- (void)stillImageRequest:(id)a3 didStopCapturingCTMVideoForCoordinationInfo:(id)a4
{
  id v6 = a3;
  if ([a4 isFinalExpectedVideoResult])
  {
    id v7 = [(CUCaptureController *)self _identifierForPendingVideoForStillImageRequest:v6];
    id v9 = v6;
    id v8 = v7;
    pl_dispatch_async();
  }
}

void __85__CUCaptureController_stillImageRequest_didStopCapturingCTMVideoForCoordinationInfo___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _endTrackingCTMVideoRecordingForIdentifier:*(void *)(a1 + 40)];
  uint64_t v5 = [(CAMCaptureCommand *)[CAMUpdateFocusAndExposureForStopVideoRecordingCommand alloc] initWithSubcommands:0];
  id v2 = [*(id *)(a1 + 32) _captureEngine];
  [v2 enqueueCommand:v5];

  if ([*(id *)(a1 + 32) _shouldLockWhiteBalanceForCTMVideoRequest:*(void *)(a1 + 48)])
  {
    uint64_t v3 = [[CAMWhiteBalanceCommand alloc] initWithMatchExposureMode];
    uint64_t v4 = [*(id *)(a1 + 32) _captureEngine];
    [v4 enqueueCommand:v3];
  }
  [*(id *)(a1 + 32) _resetFocusAndExposureAfterCaptureForType:3];
}

- (void)stillImageRequest:(id)a3 didCompleteVideoCaptureWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 isCTMVideo];
  id v9 = [(CUCaptureController *)self _identifierForPendingVideoForStillImageRequest:v6];
  id v10 = [v7 coordinationInfo];
  if ([v10 isFinalExpectedVideoResult])
  {
    double v11 = [(CUCaptureController *)self _protectionController];
    [v11 stopProtectingNebulaDaemonWritesForIdentifier:v9];
  }
  if (v8)
  {
    id v21 = v6;
    pl_dispatch_async();
  }
  BOOL v12 = [v7 error];

  if (v12)
  {
    id v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController stillImageRequest:didCompleteVideoCaptureWithResult:](v7, v13);
    }
  }
  uint64_t v14 = [(CUCaptureController *)self resultDelegate];
  if (v14 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v14 captureController:self didGenerateVideoCaptureResult:v7 fromRequest:v6];
  }
  id v15 = [(CUCaptureController *)self _responseQueue];
  id v19 = v7;
  uint64_t v20 = v6;
  id v16 = v10;
  id v17 = v6;
  id v18 = v7;
  pl_dispatch_async();
}

uint64_t __75__CUCaptureController_stillImageRequest_didCompleteVideoCaptureWithResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _capturingCTMVideoRequest];
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3) {
    [*(id *)(a1 + 32) _setCapturingCTMVideoRequest:0];
  }
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _updateAvailabilityAfterCapturedRequest:v5];
}

void __75__CUCaptureController_stillImageRequest_didCompleteVideoCaptureWithResult___block_invoke_113(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localDestinationURL];
  uint64_t v3 = [*(id *)(a1 + 40) isEV0LocalVideoDestinationURL:v2];
  uint64_t v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 64)) {
    [v4 persistenceUUID];
  }
  else {
  int64_t v31 = [v4 irisVideoPersistenceUUIDForEV0:v3];
  }
  v33 = [*(id *)(a1 + 40) irisStillImagePersistenceUUIDForEV0:v3];
  uint64_t v5 = [*(id *)(a1 + 32) captureDate];
  long long v43 = 0uLL;
  uint64_t v44 = 0;
  id v6 = *(void **)(a1 + 32);
  v32 = (void *)v5;
  if (v6 && ([v6 duration], id v7 = *(void **)(a1 + 32), v41 = 0uLL, v42 = 0, v7))
  {
    [v7 stillDisplayTime];
    int v8 = *(void **)(a1 + 32);
  }
  else
  {
    int v8 = 0;
    long long v41 = 0uLL;
    uint64_t v42 = 0;
  }
  uint64_t v9 = [v8 reason];
  [*(id *)(a1 + 32) videoZoomFactor];
  double v11 = v10;
  BOOL v12 = [*(id *)(a1 + 32) error];
  uint64_t v13 = [*(id *)(a1 + 40) sessionIdentifier];
  int64_t v14 = +[CAMOrientationUtilities imageOrientationForVideoRequest:*(void *)(a1 + 40)];
  id v15 = 0;
  if (*(unsigned char *)(a1 + 64))
  {
    id v16 = 0;
    if (!v12)
    {
      id v17 = *(void **)(a1 + 48);
      uint64_t v18 = *(void *)(a1 + 32);
      id v40 = 0;
      id v15 = [v17 _thumbnailImageFromVideoCaptureResult:v18 previewOrientation:v14 previewImage:&v40];
      id v16 = v40;
    }
  }
  else
  {
    id v16 = 0;
  }
  +[CAMAspectCropUtilities finalExpectedSizeWithCaptureDimensions:orientation:aspectRatio:](CAMAspectCropUtilities, "finalExpectedSizeWithCaptureDimensions:orientation:aspectRatio:", [*(id *)(a1 + 32) dimensions], PLExifOrientationFromImageOrientation(), objc_msgSend(*(id *)(a1 + 40), "aspectRatioCrop"));
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [CAMVideoCaptureResponse alloc];
  uint64_t v24 = [*(id *)(a1 + 40) captureMode];
  uint64_t v25 = *(void *)(a1 + 56);
  char v26 = [*(id *)(a1 + 32) slowWriterFrameDrops];
  long long v38 = v43;
  uint64_t v39 = v44;
  long long v36 = v41;
  uint64_t v37 = v42;
  LOBYTE(v30) = v26;
  double v27 = -[CAMVideoCaptureResponse initWithUUID:captureMode:captureSession:url:captureDate:duration:stillPersistenceUUID:stillDisplayTime:reason:videoZoomFactor:finalExpectedPixelSize:imageWellImage:previewImage:coordinationInfo:slowWriterFrameDrops:](v23, "initWithUUID:captureMode:captureSession:url:captureDate:duration:stillPersistenceUUID:stillDisplayTime:reason:videoZoomFactor:finalExpectedPixelSize:imageWellImage:previewImage:coordinationInfo:slowWriterFrameDrops:", v31, v24, v13, v2, v32, &v38, v11, v20, v22, v33, &v36, v9, v15, v16, v25, v30);
  id v34 = *(id *)(a1 + 40);
  v35 = v27;
  id v28 = v12;
  dispatch_queue_t v29 = v27;
  pl_dispatch_async();
}

uint64_t __75__CUCaptureController_stillImageRequest_didCompleteVideoCaptureWithResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 stillImageRequestDidCompleteVideoCapture:*(void *)(a1 + 32) withResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
    }
  }
  return MEMORY[0x270F9A838]();
}

- (void)_beginTrackingLivePhotoVideoRecordingForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v4)
  {
    uint64_t v5 = [(CUCaptureController *)self _identifiersForActiveLivePhotoVideoCaptures];
    uint64_t v6 = [v5 count];
    [v5 addObject:v4];
    uint64_t v7 = [v5 count];
    if (!v6 && v7)
    {
      int v8 = [(CUCaptureController *)self stillImageCapturingVideoDelegate];
      if (objc_opt_respondsToSelector()) {
        [v8 stillImageRequestsWillStartCapturingLivePhotoVideo];
      }
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController _beginTrackingLivePhotoVideoRecordingForIdentifier:]();
    }
  }
}

- (void)_endTrackingLivePhotoVideoRecordingForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v4)
  {
    uint64_t v5 = [(CUCaptureController *)self _identifiersForActiveLivePhotoVideoCaptures];
    uint64_t v6 = [v5 count];
    [v5 removeObject:v4];
    uint64_t v7 = [v5 count];
    if (v6 && !v7)
    {
      int v8 = [(CUCaptureController *)self stillImageCapturingVideoDelegate];
      if (objc_opt_respondsToSelector()) {
        [v8 stillImageRequestsDidCompleteCapturingLivePhotoVideo];
      }
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController _endTrackingLivePhotoVideoRecordingForIdentifier:]();
    }
  }
}

- (BOOL)isCapturingLivePhotoVideo
{
  uint64_t v2 = [(CUCaptureController *)self _identifiersForActiveLivePhotoVideoCaptures];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_beginTrackingCTMVideoRecordingForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v4)
  {
    uint64_t v5 = [(CUCaptureController *)self _identifiersForActiveCTMVideoCaptures];
    uint64_t v6 = [v5 count];
    [v5 addObject:v4];
    if ([v5 count])
    {
      uint64_t v7 = [(CUCaptureController *)self stillImageCapturingVideoDelegate];
      if (objc_opt_respondsToSelector()) {
        [v7 stillImageRequestWillStartCapturingCTMVideoWithCaptureInFlight:v6 != 0];
      }
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController _beginTrackingCTMVideoRecordingForIdentifier:]();
    }
  }
}

- (void)_endTrackingCTMVideoRecordingForIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v4)
  {
    uint64_t v5 = [(CUCaptureController *)self _identifiersForActiveCTMVideoCaptures];
    uint64_t v6 = [v5 count];
    [v5 removeObject:v4];
    uint64_t v7 = [v5 count];
    if (v6 && !v7)
    {
      int v8 = [(CUCaptureController *)self stillImageCapturingVideoDelegate];
      if (objc_opt_respondsToSelector()) {
        [v8 stillImageRequestsDidStopCapturingCTMVideo];
      }
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController _endTrackingCTMVideoRecordingForIdentifier:]();
    }
  }
}

- (BOOL)isCapturingCTMVideo
{
  uint64_t v2 = [(CUCaptureController *)self _capturingCTMVideoRequest];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setCapturingCTMVideoRequest:(id)a3
{
  uint64_t v5 = (CAMStillImageCaptureRequest *)a3;
  if (self->__capturingCTMVideoRequest != v5)
  {
    id v15 = v5;
    BOOL v6 = [(CUCaptureController *)self isCapturingCTMVideo];
    objc_storeStrong((id *)&self->__capturingCTMVideoRequest, a3);
    BOOL v7 = [(CUCaptureController *)self isCapturingCTMVideo];
    BOOL v8 = v7;
    if (!v7 || v6)
    {
      if (v7 || !v6) {
        goto LABEL_10;
      }
      BOOL v12 = [(CUCaptureController *)self stillImageCapturingVideoDelegate];
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0) {
        goto LABEL_10;
      }
      double v11 = [(CUCaptureController *)self stillImageCapturingVideoDelegate];
      [v11 stillImageRequestsWillRequestCTMVideoCaptureEnd];
    }
    else
    {
      uint64_t v9 = [(CUCaptureController *)self stillImageCapturingVideoDelegate];
      char v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
      {
LABEL_10:
        int64_t v14 = [(CUCaptureController *)self _remoteShutterController];
        [v14 setCapturingVideo:v8];

        uint64_t v5 = v15;
        goto LABEL_11;
      }
      double v11 = [(CUCaptureController *)self stillImageCapturingVideoDelegate];
      [v11 stillImageRequestsWillRequestCTMVideoCaptureStart];
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (BOOL)hasActiveCTMVideoCaptures
{
  uint64_t v2 = [(CUCaptureController *)self _identifiersForActiveCTMVideoCaptures];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isCapturingLowLightImage
{
  uint64_t v2 = [(CUCaptureController *)self _capturingLowLightStillImageRequest];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)changeToLowLightMode:(int64_t)a3
{
  uint64_t v5 = [[CAMLowLightModeCommand alloc] initWithLowLightMode:a3];
  id v4 = [(CUCaptureController *)self _captureEngine];
  [v4 enqueueCommand:v5];
}

- (BOOL)isCapturingStandardVideo
{
  uint64_t v2 = [(CUCaptureController *)self _capturingVideoRequest];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_sanitizeVideoRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[v4 mutableCopy];
  BOOL v6 = [(CUCaptureController *)self _motionController];
  objc_msgSend(v5, "setCaptureOrientation:", objc_msgSend(v6, "captureOrientation"));
  BOOL v7 = [v4 localDestinationURL];
  if (!v7)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v9 = [v5 persistenceUUID];
    char v10 = +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:](CAMPersistenceController, "uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:", v9, @"MOV", [v5 shouldPersistToIncomingDirectory], Current);
    BOOL v7 = [NSURL fileURLWithPath:v10];
    [v5 setLocalDestinationURL:v7];
  }
  if ([MEMORY[0x263F82438] isRunningInStoreDemoMode]) {
    [v5 setMaximumRecordedDuration:120.0];
  }
  double v11 = +[CAMCaptureCapabilities capabilities];
  uint64_t v12 = [v11 maximumRecordedFileSize];
  if (v12 >= 1)
  {
    uint64_t v13 = v12;
    if (v12 < [v5 maximumRecordedFileSize]) {
      [v5 setMaximumRecordedFileSize:v13];
    }
  }
  uint64_t v14 = [MEMORY[0x263F5DB48] freeDiskSpaceThreshold];
  uint64_t v15 = [v4 remainingDiskUsageThreshold];
  if (v14 <= v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = v14;
  }
  [v5 setRemainingDiskUsageThreshold:v16];
  if (![v5 assertionIdentifier])
  {
    id v17 = [(CUCaptureController *)self _powerController];
    objc_msgSend(v5, "setAssertionIdentifier:", objc_msgSend(v17, "generateAssertionIdentifier"));
  }
  uint64_t v18 = (void *)[v5 copy];

  return v18;
}

- (void)_processPendingVideoCaptureRequest:(id)a3
{
  v18[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CUCaptureController *)self _locationController];
  [v5 setEnabled:0];
  BOOL v6 = -[CAMTorchCommand initWithTorchMode:]([CAMTorchCommand alloc], "initWithTorchMode:", [v4 torchMode]);
  BOOL v7 = +[CAMUserPreferences preferences];
  BOOL v8 = -[CAMVideoRecordingCameraSelectionBehaviorCommand initWithCameraSwitchingEnabled:]([CAMVideoRecordingCameraSelectionBehaviorCommand alloc], "initWithCameraSwitchingEnabled:", objc_msgSend(v7, "shouldDisableCameraSwitchingDuringVideoRecordingForMode:", objc_msgSend(v4, "captureMode")) ^ 1);
  uint64_t v9 = [[CAMStartVideoRecordingCommand alloc] initWithRequest:v4];
  id v10 = objc_alloc(MEMORY[0x263EFF980]);
  v18[0] = v6;
  v18[1] = v8;
  v18[2] = v9;
  double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  uint64_t v12 = (void *)[v10 initWithArray:v11];

  if (([v4 trueVideoEnabled] & 1) == 0)
  {
    uint64_t v13 = -[CUCaptureController _realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:](self, "_realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:", [v4 captureMode], objc_msgSend(v4, "captureVideoConfiguration"), 1, 0, 0);
    [v12 insertObject:v13 atIndex:0];
  }
  if (-[CUCaptureController _shouldManageFocusForMode:](self, "_shouldManageFocusForMode:", [v4 captureMode]))
  {
    uint64_t v14 = [(CAMCaptureCommand *)[CAMUpdateFocusAndExposureForStartVideoRecordingCommand alloc] initWithSubcommands:0];
    [v12 insertObject:v14 atIndex:0];
  }
  if ([(CUCaptureController *)self _shouldLockWhiteBalanceForVideoCaptureRequest:v4])
  {
    uint64_t v15 = [[CAMWhiteBalanceCommand alloc] initWithWhiteBalanceMode:0];
    [v12 insertObject:v15 atIndex:0];
  }
  uint64_t v16 = [[CAMCaptureCommand alloc] initWithSubcommands:v12];
  id v17 = [(CUCaptureController *)self _captureEngine];
  [v17 enqueueCommand:v16];
  [(CUCaptureController *)self _setPendingVideoCaptureRequest:0];
}

- (BOOL)startCapturingVideoWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v11 = 0;
  BOOL v7 = [(CUCaptureController *)self _internalStartCapturingVideoWithRequest:v6 error:&v11];
  id v8 = v11;
  if (!v7)
  {
    uint64_t v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController startCapturingVideoWithRequest:error:]((uint64_t)v6, v8);
    }
  }
  if (a4) {
    *a4 = v8;
  }

  return v7;
}

- (BOOL)_internalStartCapturingVideoWithRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(CUCaptureController *)self _canBeginCaptureCheckAvailability:0 error:a4])
  {
    BOOL v7 = [(CUCaptureController *)self isCapturingStandardVideo];
    if (v7)
    {
      if (a4)
      {
        CAMCaptureControllerError(-22100, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      id v8 = v6;
    }
    else
    {
      id v8 = [(CUCaptureController *)self _sanitizeVideoRequest:v6];

      [(CUCaptureController *)self _setPendingVideoCaptureRequest:v8];
      [(CUCaptureController *)self _setCapturingVideoRequest:v8];
      [(CUCaptureController *)self _setWaitingForRecordingToStart:1];
      id v10 = [(CUCaptureController *)self _powerController];
      objc_msgSend(v10, "addAssertionForIndentifier:withReason:", objc_msgSend(v8, "assertionIdentifier"), 2);

      id v11 = +[CAMCaptureCapabilities capabilities];
      if ([v8 trueVideoEnabled]
        && ![v11 isRegionalShutterSoundEnabled])
      {
        [(CUCaptureController *)self _didPlayBeginVideoRecordingSound];
      }
      else
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __69__CUCaptureController__internalStartCapturingVideoWithRequest_error___block_invoke;
        v14[3] = &unk_263FA04E0;
        *(CFAbsoluteTime *)&v14[5] = Current;
        v14[4] = self;
        AudioServicesPlaySystemSoundWithCompletion(0x45Du, v14);
      }
      [(CUCaptureController *)self _updateAvailabilityAfterEnqueuedRequest:v8];
    }
    BOOL v9 = !v7;
    id v6 = v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __69__CUCaptureController__internalStartCapturingVideoWithRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  double v2 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
  if (v2 > 0.1)
  {
    BOOL v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      double v6 = v2;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Begin video recording sound took %.3f seconds", (uint8_t *)&v5, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) _didPlayBeginVideoRecordingSound];
}

- (BOOL)stopCapturingVideo
{
  return [(CUCaptureController *)self _stopCapturingVideoAndDisableCaptureAvailabilityWhileStopping:1];
}

- (BOOL)_stopCapturingVideoAndDisableCaptureAvailabilityWhileStopping:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(CUCaptureController *)self isCapturingStandardVideo])
  {
    if (v3)
    {
      [(CUCaptureController *)self _setVideoCaptureAvailable:0];
      int v5 = [(CUCaptureController *)self _capturingVideoRequest];
      [(CUCaptureController *)self _updateAvailabilityWhenPreparingToStopCapturingForRequest:v5];
    }
    double v6 = [(CUCaptureController *)self _pendingVideoCaptureRequest];
    [(CUCaptureController *)self _resetCapturingVideoState];
    if (!v6)
    {
      uint64_t v13 = objc_alloc_init(CAMStopVideoRecordingCommand);
      uint64_t v14 = [(CUCaptureController *)self _captureEngine];
      [v14 enqueueCommand:v13];

      BOOL v11 = 1;
      goto LABEL_11;
    }
    uint64_t v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Stopped capturing a video before the recording sound finished playing; pending request: %{public}@",
        buf,
        0xCu);
    }

    [(CUCaptureController *)self videoRequestDidStopCapturing:v6];
    id v8 = CAMVideoCaptureRequestError(-28000, 0);
    BOOL v9 = [CAMVideoCaptureResult alloc];
    *(_OWORD *)buf = *MEMORY[0x263F01090];
    uint64_t v19 = *(void *)(MEMORY[0x263F01090] + 16);
    long long v16 = *(_OWORD *)buf;
    uint64_t v17 = v19;
    LOBYTE(v15) = 0;
    id v10 = [(CAMVideoCaptureResult *)v9 initWithURL:0 filteredLocalDestinationURL:0 duration:buf stillDisplayTime:&v16 dimensions:0 metadata:0 videoZoomFactor:1.0 reason:0 videoPreviewPixelBuffer:0 coordinationInfo:0 error:v8 slowWriterFrameDrops:v15];
    [(CUCaptureController *)self videoRequest:v6 didCompleteCaptureWithResult:v10];
  }
  else
  {
    double v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring request to stop capturing video, because we aren't recording.", buf, 2u);
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)_setCapturingVideoRequest:(id)a3
{
  int v5 = (CAMVideoCaptureRequest *)a3;
  if (self->__capturingVideoRequest != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->__capturingVideoRequest, a3);
    BOOL v6 = [(CUCaptureController *)self isCapturingVideo];
    uint64_t v7 = [(CUCaptureController *)self _remoteShutterController];
    [v7 setCapturingVideo:v6];

    int v5 = v8;
  }
}

- (void)_resetCapturingVideoState
{
  [(CUCaptureController *)self _setPendingVideoCaptureRequest:0];
  [(CUCaptureController *)self _setCapturingVideoRequest:0];
  [(CUCaptureController *)self _setWaitingForRecordingToStart:0];
  [(CUCaptureController *)self _setVideoCapturePaused:0];
}

- (void)changeToVideoRecordingCaptureOrientation:(int64_t)a3
{
  if (![(CUCaptureController *)self isCapturingVideo])
  {
    int v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring request to change the video recording capture orientation because we are not recording.", v8, 2u);
    }
  }
  if (a3)
  {
    BOOL v6 = [[CAMSetVideoOrientationCommand alloc] initWithCaptureOrientation:a3];
    uint64_t v7 = [(CUCaptureController *)self _captureEngine];
    [v7 enqueueCommand:v6];
  }
}

- (BOOL)pauseCapturingVideo
{
  if ([(CUCaptureController *)self isCapturingStandardVideo])
  {
    if ([(CUCaptureController *)self videoCapturePaused])
    {
      BOOL v3 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        id v4 = "Ignoring request to pause capturing video because we are already paused.";
        int v5 = (uint8_t *)&v11;
LABEL_10:
        _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      }
    }
    else
    {
      if (![(CUCaptureController *)self _isWaitingForRecordingToStart])
      {
        BOOL v6 = 1;
        [(CUCaptureController *)self _setVideoCapturePaused:1];
        id v8 = objc_alloc_init(CAMPauseVideoRecordingCommand);
        BOOL v9 = [(CUCaptureController *)self _captureEngine];
        [v9 enqueueCommand:v8];

        return v6;
      }
      BOOL v3 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        id v4 = "Ignoring request to pause capturing video because recording has not started.";
        int v5 = (uint8_t *)&v10;
        goto LABEL_10;
      }
    }
  }
  else
  {
    BOOL v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      id v4 = "Ignoring request to pause capturing video because we aren't recording.";
      int v5 = (uint8_t *)&v12;
      goto LABEL_10;
    }
  }

  return 0;
}

- (BOOL)resumeCaptureVideo
{
  if ([(CUCaptureController *)self isCapturingStandardVideo])
  {
    if ([(CUCaptureController *)self videoCapturePaused])
    {
      [(CUCaptureController *)self _setVideoCapturePaused:0];
      BOOL v3 = objc_alloc_init(CAMResumeVideoRecordingCommand);
      id v4 = [(CUCaptureController *)self _captureEngine];
      [v4 enqueueCommand:v3];

      return 1;
    }
    BOOL v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      uint64_t v7 = "Ignoring request to resume capturing video because we are not paused.";
      id v8 = (uint8_t *)&v9;
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      uint64_t v7 = "Ignoring request to resume capturing video because we aren't recording.";
      id v8 = (uint8_t *)&v10;
LABEL_8:
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }

  return 0;
}

- (void)_didPlayBeginVideoRecordingSound
{
}

uint64_t __55__CUCaptureController__didPlayBeginVideoRecordingSound__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _pendingVideoCaptureRequest];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v2 = [*(id *)(a1 + 32) _processPendingVideoCaptureRequest:v2];
    uint64_t v3 = v5;
  }
  return MEMORY[0x270F9A758](v2, v3);
}

- (void)videoRequestDidStartCapturing:(id)a3
{
  id v4 = a3;
  if ([v4 shouldProtectPersistence])
  {
    uint64_t v5 = [(CUCaptureController *)self _protectionController];
    [v5 startProtectingPersistenceForRequest:v4];
    BOOL v6 = [v4 persistenceUUID];
    [v5 startProtectingNebulaDaemonWritesForIdentifier:v6];
  }
  id v7 = v4;
  pl_dispatch_async();
}

uint64_t __53__CUCaptureController_videoRequestDidStartCapturing___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _capturingVideoRequest];
  uint64_t v3 = *(void **)(a1 + 40);

  if (v2 == v3) {
    [*(id *)(a1 + 32) _setWaitingForRecordingToStart:0];
  }
  uint64_t v4 = [*(id *)(a1 + 40) delegate];
  if (v4)
  {
    BOOL v6 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v6 videoRequestDidStartCapturing:*(void *)(a1 + 40)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (void)videoRequestDidStopCapturing:(id)a3
{
  id v4 = a3;
  if ([v4 shouldProtectPersistence])
  {
    uint64_t v5 = [v4 persistenceUUID];
    BOOL v6 = [(CUCaptureController *)self _protectionController];
    [v6 stopProtectingNebulaDaemonWritesForIdentifier:v5];
  }
  id v7 = v4;
  pl_dispatch_async();
}

void __52__CUCaptureController_videoRequestDidStopCapturing___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _capturingVideoRequest];
  uint64_t v3 = *(void *)(a1 + 40);
  id v13 = (id)v2;
  if (v2 == v3)
  {
    [*(id *)(a1 + 32) _resetCapturingVideoState];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  [*(id *)(a1 + 32) _updateAvailabilityAfterStopCapturingForRequest:v3];
  id v4 = [*(id *)(a1 + 32) _captureEngine];
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldManageFocusForMode:", objc_msgSend(*(id *)(a1 + 40), "captureMode")))
  {
    uint64_t v5 = [(CAMCaptureCommand *)[CAMUpdateFocusAndExposureForStopVideoRecordingCommand alloc] initWithSubcommands:0];
    [v4 enqueueCommand:v5];
    [*(id *)(a1 + 32) _scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:3];
  }
  if ([*(id *)(a1 + 32) _shouldLockWhiteBalanceForVideoCaptureRequest:*(void *)(a1 + 40)])
  {
    BOOL v6 = [[CAMWhiteBalanceCommand alloc] initWithMatchExposureMode];
    [v4 enqueueCommand:v6];
  }
  int v7 = [*(id *)(a1 + 40) trueVideoEnabled];
  if ((v7 & 1) == 0)
  {
    id v8 = objc_msgSend(*(id *)(a1 + 32), "_realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:", objc_msgSend(*(id *)(a1 + 40), "captureMode"), objc_msgSend(*(id *)(a1 + 40), "captureVideoConfiguration"), 0, 0, 0);
    [v4 enqueueCommand:v8];
  }
  __int16 v9 = [*(id *)(a1 + 32) _locationController];
  [v9 setEnabled:1];
  __int16 v10 = +[CAMCaptureCapabilities capabilities];
  __int16 v11 = v10;
  if (!v7 || [v10 isRegionalShutterSoundEnabled]) {
    AudioServicesPlaySystemSound(0x45Eu);
  }
  __int16 v12 = [*(id *)(a1 + 40) delegate];
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v12 videoRequestDidStopCapturing:*(void *)(a1 + 40)];
  }
}

- (void)videoRequest:(id)a3 didCompleteCaptureWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  pl_dispatch_async();
  __int16 v9 = [(CUCaptureController *)self resultDelegate];
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v9 captureController:self didGenerateVideoCaptureResult:v7 fromRequest:v8];
  }
  __int16 v10 = [(CUCaptureController *)self _responseQueue];
  id v13 = v7;
  id v11 = v8;
  id v12 = v7;
  pl_dispatch_async();
}

uint64_t __65__CUCaptureController_videoRequest_didCompleteCaptureWithResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAvailabilityAfterCapturedRequest:*(void *)(a1 + 40)];
}

void __65__CUCaptureController_videoRequest_didCompleteCaptureWithResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];
  if (v2)
  {
    id v3 = 0;
    uint64_t v4 = 0;
  }
  else
  {
    int64_t v5 = +[CAMOrientationUtilities imageOrientationForVideoRequest:*(void *)(a1 + 40)];
    id v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    v45[0] = 0;
    uint64_t v4 = [v6 _thumbnailImageFromVideoCaptureResult:v7 previewOrientation:v5 previewImage:v45];
    id v3 = v45[0];
  }
  uint64_t v8 = [*(id *)(a1 + 40) persistenceUUID];
  uint64_t v9 = [*(id *)(a1 + 32) localDestinationURL];
  uint64_t v10 = [*(id *)(a1 + 32) captureDate];
  long long v43 = 0uLL;
  uint64_t v44 = 0;
  id v11 = *(void **)(a1 + 32);
  v33 = (void *)v10;
  id v34 = (void *)v9;
  if (v11 && ([v11 duration], id v12 = *(void **)(a1 + 32), v41 = 0uLL, v42 = 0, v12))
  {
    id v13 = (void *)v8;
    uint64_t v14 = v3;
    uint64_t v15 = (void *)v4;
    [v12 stillDisplayTime];
    long long v16 = *(void **)(a1 + 32);
  }
  else
  {
    id v13 = (void *)v8;
    uint64_t v14 = v3;
    uint64_t v15 = (void *)v4;
    long long v16 = 0;
    long long v41 = 0uLL;
    uint64_t v42 = 0;
  }
  uint64_t v17 = [v16 reason];
  [*(id *)(a1 + 32) videoZoomFactor];
  double v19 = v18;
  uint64_t v20 = [*(id *)(a1 + 40) sessionIdentifier];
  +[CAMOrientationUtilities imageOrientationForVideoRequest:*(void *)(a1 + 40)];
  PLExifOrientationFromImageOrientation();
  [*(id *)(a1 + 32) dimensions];
  CAMSizeForDimensions();
  double v22 = v21;
  double v24 = v23;
  uint64_t v25 = [CAMVideoCaptureResponse alloc];
  uint64_t v26 = [*(id *)(a1 + 40) captureMode];
  double v27 = [*(id *)(a1 + 32) coordinationInfo];
  char v28 = [*(id *)(a1 + 32) slowWriterFrameDrops];
  long long v39 = v43;
  uint64_t v40 = v44;
  long long v37 = v41;
  uint64_t v38 = v42;
  LOBYTE(v32) = v28;
  dispatch_queue_t v29 = -[CAMVideoCaptureResponse initWithUUID:captureMode:captureSession:url:captureDate:duration:stillPersistenceUUID:stillDisplayTime:reason:videoZoomFactor:finalExpectedPixelSize:imageWellImage:previewImage:coordinationInfo:slowWriterFrameDrops:](v25, "initWithUUID:captureMode:captureSession:url:captureDate:duration:stillPersistenceUUID:stillDisplayTime:reason:videoZoomFactor:finalExpectedPixelSize:imageWellImage:previewImage:coordinationInfo:slowWriterFrameDrops:", v13, v26, v20, v34, v33, &v39, v19, v22, v24, 0, &v37, v17, v15, v14, v27, v32);

  id v35 = *(id *)(a1 + 40);
  long long v36 = v29;
  id v30 = v2;
  int64_t v31 = v29;
  pl_dispatch_async();
}

void __65__CUCaptureController_videoRequest_didCompleteCaptureWithResult___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) delegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v3 videoRequestDidCompleteCapture:*(void *)(a1 + 32) withResponse:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
  uint64_t v2 = [*(id *)(a1 + 56) _powerController];
  objc_msgSend(v2, "removeAssertionForIdentifier:withReason:", objc_msgSend(*(id *)(a1 + 32), "assertionIdentifier"), 2);
}

- (void)videoRequestDidResumeCapturing:(id)a3
{
  id v3 = a3;
  uint64_t v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "CAMCaptureController videoRequestDidResumeCapturing:", buf, 2u);
  }

  id v6 = v3;
  id v5 = v3;
  pl_dispatch_async();
}

uint64_t __54__CUCaptureController_videoRequestDidResumeCapturing___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 videoRequestDidResumeCapturing:*(void *)(a1 + 32)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (id)_sanitizePanoramaRequest:(id)a3
{
  uint64_t v4 = (void *)[a3 mutableCopy];
  id v5 = [(CUCaptureController *)self _motionController];
  objc_msgSend(v4, "setCaptureOrientation:", objc_msgSend(v5, "panoramaCaptureOrientation"));
  if (![v4 assertionIdentifier])
  {
    id v6 = [(CUCaptureController *)self _powerController];
    objc_msgSend(v4, "setAssertionIdentifier:", objc_msgSend(v6, "generateAssertionIdentifier"));
  }
  uint64_t v7 = (void *)[v4 copy];

  return v7;
}

- (BOOL)startCapturingPanoramaWithRequest:(id)a3 error:(id *)a4
{
  v19[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(CUCaptureController *)self _canBeginCaptureCheckAvailability:0 error:a4])
  {
    BOOL v7 = [(CUCaptureController *)self isCapturingPanorama];
    if (v7)
    {
      if (a4)
      {
        CAMCaptureControllerError(-22100, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v9 = [(CUCaptureController *)self _sanitizePanoramaRequest:v6];

      [(CUCaptureController *)self _setCapturingPanoramaRequest:v9];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __63__CUCaptureController_startCapturingPanoramaWithRequest_error___block_invoke;
      v18[3] = &unk_263FA0208;
      void v18[4] = self;
      AudioServicesPlaySystemSoundWithCompletion(0x45Du, v18);
      uint64_t v10 = [(CUCaptureController *)self _updateFocusAndExposureForStartPanorama];
      id v11 = [[CAMStartPanoramaCommand alloc] initWithRequest:v9];
      id v12 = [CAMCaptureCommand alloc];
      v19[0] = v10;
      v19[1] = v11;
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
      uint64_t v14 = [(CAMCaptureCommand *)v12 initWithSubcommands:v13];

      uint64_t v15 = [(CUCaptureController *)self _captureEngine];
      [v15 enqueueCommand:v14];
      long long v16 = [(CUCaptureController *)self _powerController];
      objc_msgSend(v16, "addAssertionForIndentifier:withReason:", objc_msgSend(v9, "assertionIdentifier"), 4);
      [(CUCaptureController *)self _updateAvailabilityAfterEnqueuedRequest:v9];

      id v6 = v9;
    }
    BOOL v8 = !v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __63__CUCaptureController_startCapturingPanoramaWithRequest_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didPlayBeginVideoRecordingSound];
}

- (id)_updateFocusAndExposureForStartPanorama
{
  v10[4] = *MEMORY[0x263EF8340];
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  uint64_t v2 = [[CAMSubjectAreaChangeMonitoringCommand alloc] initWithSubjectAreaChangeMonitoringEnabled:0];
  id v3 = [[CAMFocusCommand alloc] initWithFocusMode:0];
  uint64_t v4 = [[CAMExposureCommand alloc] initWithExposureMode:0];
  id v5 = [[CAMWhiteBalanceCommand alloc] initWithWhiteBalanceMode:0];
  id v6 = [CAMCaptureCommand alloc];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
  BOOL v8 = [(CAMCaptureCommand *)v6 initWithSubcommands:v7];

  return v8;
}

- (BOOL)stopCapturingPanoramaInterrupted:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CUCaptureController *)self isCapturingPanorama];
  if (v5)
  {
    AudioServicesPlaySystemSound(0x45Eu);
    [(CUCaptureController *)self _setCapturingPanoramaRequest:0];
    id v6 = [(CUCaptureController *)self _captureEngine];
    BOOL v7 = [[CAMStopPanoramaCommand alloc] initWithInterrupted:v3];
    [v6 enqueueCommand:v7];
  }
  return v5;
}

- (void)changeToPanoramaDirection:(int64_t)a3
{
  BOOL v7 = [[CAMPanoramaDirectionCommand alloc] initWithDirection:a3];
  BOOL v5 = [(CUCaptureController *)self _captureEngine];
  id v6 = [(CUCaptureController *)self _remoteShutterController];
  [v6 setPanoramaDirection:a3];

  [v5 enqueueCommand:v7];
}

- (void)changeToPanoramaEncodingBehavior:(int64_t)a3
{
  BOOL v5 = [[CAMPanoramaEncodingCommand alloc] initWithPhotoEncodingBehavior:a3];
  uint64_t v4 = [(CUCaptureController *)self _captureEngine];
  [v4 enqueueCommand:v5];
}

- (void)panoramaRequestDidStartCapturing:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  pl_dispatch_async();
}

uint64_t __56__CUCaptureController_panoramaRequestDidStartCapturing___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 panoramaRequestDidStartCapturing:*(void *)(a1 + 32)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (void)panoramaRequestDidStopCapturing:(id)a3 interrupted:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  pl_dispatch_async();
}

void __67__CUCaptureController_panoramaRequestDidStopCapturing_interrupted___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _capturingPanoramaRequest];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = (id)v2;
  if (v2 == v3)
  {
    [*(id *)(a1 + 32) _setCapturingPanoramaRequest:0];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  [*(id *)(a1 + 32) _updateAvailabilityAfterStopCapturingForRequest:v3];
  [*(id *)(a1 + 32) _scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:4];
  id v4 = [*(id *)(a1 + 40) delegate];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 panoramaRequestDidStopCapturing:*(void *)(a1 + 40) interrupted:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)panoramaRequest:(id)a3 didCompleteCaptureWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v12 = v6;
  pl_dispatch_async();
  BOOL v8 = [(CUCaptureController *)self _responseQueue];
  id v11 = v7;
  id v9 = v12;
  id v10 = v7;
  pl_dispatch_async();
}

uint64_t __68__CUCaptureController_panoramaRequest_didCompleteCaptureWithResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAvailabilityAfterCapturedRequest:*(void *)(a1 + 40)];
}

void __68__CUCaptureController_panoramaRequest_didCompleteCaptureWithResult___block_invoke_2(id *a1)
{
  double v21 = [a1[4] error];
  uint64_t v20 = [a1[5] delegate];
  [a1[5] assertionIdentifier];
  uint64_t v2 = objc_msgSend(a1[6], "_thumbnailImageFromStillImageCaptureResult:imageOrientation:", a1[4], +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", a1[4], objc_msgSend(a1[5], "captureDevice"), objc_msgSend(a1[5], "captureOrientation")));
  uint64_t v3 = [a1[4] capturePhoto];
  id v4 = [v3 resolvedSettings];
  uint64_t v5 = [v4 uniqueID];

  id v6 = [CAMStillImageCaptureResponse alloc];
  id v7 = [a1[4] persistenceUUID];
  uint64_t v8 = [a1[5] sessionIdentifier];
  id v9 = [a1[4] captureDate];
  id v10 = [a1[4] metadata];
  id v11 = [a1[4] coordinationInfo];
  id v12 = [a1[4] metadata];
  double v13 = CAMSizeForPhotoMetadata(v12);
  LOBYTE(v19) = 0;
  uint64_t v15 = -[CAMStillImageCaptureResponse initWithUUID:captureSession:captureDate:metadata:burstIdentifier:burstRepresentedCount:imageWellImage:textAnalysisImage:coordinationInfo:finalExpectedPixelSize:expectingPairedVideo:captureID:semanticEnhanceScene:](v6, "initWithUUID:captureSession:captureDate:metadata:burstIdentifier:burstRepresentedCount:imageWellImage:textAnalysisImage:coordinationInfo:finalExpectedPixelSize:expectingPairedVideo:captureID:semanticEnhanceScene:", v7, v8, v9, v10, 0, 0, v13, v14, v2, 0, v11, v19, v5, [a1[4] semanticEnhancement]);

  id v22 = a1[5];
  id v16 = v21;
  uint64_t v17 = v15;
  id v18 = v20;
  pl_dispatch_async();
}

void __68__CUCaptureController_panoramaRequest_didCompleteCaptureWithResult___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (objc_opt_respondsToSelector() & 1) != 0) {
    [*(id *)(a1 + 32) panoramaRequestDidCompleteCapture:*(void *)(a1 + 40) withResponse:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
  }
  id v2 = [*(id *)(a1 + 64) _powerController];
  [v2 removeAssertionForIdentifier:*(unsigned int *)(a1 + 72) withReason:4];
}

- (void)panoramaRequest:(id)a3 didReceiveNotification:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if ((unint64_t)(a4 + 6001) <= 1)
  {
    id v7 = v5;
    pl_dispatch_async();
  }
}

uint64_t __62__CUCaptureController_panoramaRequest_didReceiveNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) analyticsEvent];
  [v2 populateFromPanoramaCaptureNotification:*(void *)(a1 + 48)];

  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 stopCapturingPanoramaInterrupted:1];
}

- (unint64_t)currentBurstCount
{
  id v2 = [(CUCaptureController *)self _burstController];
  unint64_t v3 = [v2 currentBurstCount];

  return v3;
}

- (BOOL)startCapturingBurstWithRequest:(id)a3 error:(id *)a4
{
  v36[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(CUCaptureController *)self _canBeginCaptureCheckAvailability:1 error:a4];
  if (v7)
  {
    uint64_t v8 = [v6 captureRequest];
    uint64_t v9 = [v8 captureDevice];
    uint64_t v10 = [v8 captureMode];
    id v11 = +[CAMCaptureCapabilities capabilities];
    int v12 = [v11 isBurstSupportedForMode:v10 device:v9];
    double v13 = [(CUCaptureController *)self _updateFocusAndExposureForStartBurstCapture];
    double v14 = [[CAMBlinkAndSmileDetectionCommand alloc] initWithBlinkDetection:1 smileDetection:1];
    uint64_t v15 = [CAMCaptureCommand alloc];
    id v35 = v14;
    v36[0] = v13;
    v36[1] = v14;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    uint64_t v17 = [(CAMCaptureCommand *)v15 initWithSubcommands:v16];

    id v18 = [(CUCaptureController *)self _captureEngine];
    id v34 = (void *)v17;
    [v18 enqueueCommand:v17];
    int v33 = v12;
    if (v12)
    {
      uint64_t v19 = v18;
      uint64_t v32 = v13;
      uint64_t v20 = [(CUCaptureController *)self _burstController];
      double v21 = [v8 analyticsEvent];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v23 = [v8 analyticsEvent];
      }
      else
      {
        double v23 = 0;
      }
      id v25 = (id)[v20 startBurstCaptureWithAnalyticsEvent:v23];

      uint64_t v24 = [v11 maximumBurstLength];
      uint64_t v26 = [v6 maximumBurstLength];
      if (v26 >= v24) {
        uint64_t v27 = v24;
      }
      else {
        uint64_t v27 = v26;
      }
      if (v26 > 0) {
        uint64_t v24 = v27;
      }
      double v13 = v32;
      id v18 = v19;
    }
    else
    {
      uint64_t v24 = [v6 maximumBurstLength];
    }
    [v11 captureIntervalForDevice:v9];
    dispatch_queue_t v29 = [[CAMCaptureRequestIntervalometer alloc] initWithDelegate:self interval:v24 delay:v28 maximumCount:v28];
    [(CAMCaptureRequestIntervalometer *)v29 setPrototypeRequest:v8];
    [(CAMCaptureRequestIntervalometer *)v29 startGeneratingRequests];
    [(CUCaptureController *)self _setCurrentBurstIntervalometer:v29];
    if (v33) {
      AudioServicesStartSystemSound();
    }
    id v30 = [(CUCaptureController *)self burstDelegate];
    if (v30 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v30 captureControllerWillStartCapturingBurst:self];
    }
    [(CAMCaptureRequestIntervalometer *)v29 manuallyGenerateRequest];
  }
  return v7;
}

- (id)_updateFocusAndExposureForStartBurstCapture
{
  v10[2] = *MEMORY[0x263EF8340];
  id v2 = [[CAMSubjectAreaChangeMonitoringCommand alloc] initWithSubjectAreaChangeMonitoringEnabled:0];
  unint64_t v3 = +[CAMCaptureCapabilities capabilities];
  uint64_t v4 = [v3 captureOnTouchDown];

  id v5 = [[CAMFocusCommand alloc] initWithFocusMode:v4];
  id v6 = [CAMCaptureCommand alloc];
  v10[0] = v2;
  v10[1] = v5;
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  uint64_t v8 = [(CAMCaptureCommand *)v6 initWithSubcommands:v7];

  return v8;
}

- (void)stopCapturingBurst
{
  if ([(CUCaptureController *)self isCapturingBurst])
  {
    unint64_t v3 = [(CUCaptureController *)self currentBurstIntervalometer];
    uint64_t v4 = [v3 prototypeRequest];
    uint64_t v5 = [v4 captureDevice];
    id v6 = +[CAMCaptureCapabilities capabilities];
    int v7 = objc_msgSend(v6, "isBurstSupportedForMode:device:", objc_msgSend(v4, "captureMode"), v5);

    if (v7)
    {
      uint64_t v8 = [(CUCaptureController *)self _burstController];
      [v8 finishBurstCaptureForDevice:v5];

      [v3 stopGeneratingRequests];
      [(CUCaptureController *)self _setCurrentBurstIntervalometer:0];
      AudioServicesStopSystemSound();
      uint64_t v9 = [(CUCaptureController *)self burstDelegate];
      if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
        [v9 captureControllerWillStartPlayingBurstEndSound:self];
      }
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      id v16 = __41__CUCaptureController_stopCapturingBurst__block_invoke;
      uint64_t v17 = &unk_263FA0408;
      id v18 = v9;
      uint64_t v19 = self;
      id v10 = v9;
      AudioServicesPlaySystemSoundWithCompletion(0x462u, &v14);
    }
    else
    {
      [v3 stopGeneratingRequests];
      [(CUCaptureController *)self _setCurrentBurstIntervalometer:0];
    }
    -[CUCaptureController _resetFocusAndExposureAfterCaptureForType:](self, "_resetFocusAndExposureAfterCaptureForType:", 2, v14, v15, v16, v17);
    id v11 = [[CAMBlinkAndSmileDetectionCommand alloc] initWithBlinkDetection:0 smileDetection:0];
    int v12 = [(CUCaptureController *)self _captureEngine];
    [v12 enqueueCommand:v11];
    double v13 = [(CUCaptureController *)self burstDelegate];
    if (v13)
    {
      if (objc_opt_respondsToSelector()) {
        [v13 captureControllerDidStopCapturingBurst:self];
      }
    }
  }
}

void __41__CUCaptureController_stopCapturingBurst__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__CUCaptureController_stopCapturingBurst__block_invoke_2;
  v4[3] = &unk_263FA0408;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

uint64_t __41__CUCaptureController_stopCapturingBurst__block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      return [v3 captureControllerDidStopPlayingBurstEndSound:v4];
    }
  }
  return result;
}

- (void)_processCapturedBurstRequest:(id)a3 withResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CUCaptureController *)self _burstController];
  [v8 processCapturedRequest:v7 withResult:v6];
}

- (BOOL)intervalometer:(id)a3 didGenerateCaptureRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CUCaptureController *)self currentBurstIntervalometer];

  BOOL v9 = v8 == v7
    && ![v6 type]
    && [(CUCaptureController *)self captureStillImageWithRequest:v6 error:0];

  return v9;
}

- (void)intervalometer:(id)a3 didReachMaximumCountWithRequest:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    uint64_t v9 = [v5 maximumCount];
    _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Reached maximum burst count: %ld", (uint8_t *)&v8, 0xCu);
  }

  AudioServicesStopSystemSound();
  id v7 = [(CUCaptureController *)self burstDelegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v7 captureControllerDidReachMaximumBurstLength:self];
  }
}

- (void)changeToSmartStyle:(id)a3
{
  id v4 = a3;
  id v6 = [[CAMSessionSmartStyleCommand alloc] initWithSmartStyle:v4];

  id v5 = [(CUCaptureController *)self _captureEngine];
  [v5 enqueueCommand:v6];
}

- (void)setCapturingTimelapse:(BOOL)a3 forDevicePosition:(int64_t)a4
{
  v16[4] = *MEMORY[0x263EF8340];
  if (self->_capturingTimelapse != a3)
  {
    BOOL v5 = a3;
    self->_capturingTimelapse = a3;
    if (a3)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __63__CUCaptureController_setCapturingTimelapse_forDevicePosition___block_invoke;
      v15[3] = &unk_263FA0208;
      void v15[4] = self;
      AudioServicesPlaySystemSoundWithCompletion(0x45Du, v15);
    }
    else
    {
      AudioServicesPlaySystemSound(0x45Eu);
      id v7 = [(CUCaptureController *)self _locationController];
      [v7 setEnabled:1];
      [(CUCaptureController *)self _scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:3];
    }
    int v8 = [(CUCaptureController *)self _captureEngine];
    uint64_t v9 = [[CAMTimelapseCaptureRateCommand alloc] initWithDefaultTimelapseCaptureRate];
    uint64_t v10 = [[CAMImageControlModeCommand alloc] initWithCaptureMode:5 capturing:v5];
    id v11 = [(CUCaptureController *)self _realtimeMetadataCommandsForMode:5 videoConfiguration:0 capturing:self->_capturingTimelapse wantsMachineReadableCodes:0 wantsImageAnalysis:0];
    int v12 = [[CAMUpdateCaptureButtonControlsCommand alloc] initWithRecording:v5 captureMode:5 devicePosition:a4];
    v16[0] = v9;
    v16[1] = v10;
    v16[2] = v11;
    v16[3] = v12;
    double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:4];
    [v8 enqueueCommands:v13];

    uint64_t v14 = [(CUCaptureController *)self _remoteShutterController];
    [v14 setCapturingTimelapse:v5];
  }
}

uint64_t __63__CUCaptureController_setCapturingTimelapse_forDevicePosition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didPlayBeginVideoRecordingSound];
}

- (void)changeToTimelapseCaptureRate:(float)a3
{
  BOOL v5 = [CAMTimelapseCaptureRateCommand alloc];
  *(float *)&double v6 = a3;
  int v8 = [(CAMTimelapseCaptureRateCommand *)v5 initWithTimelapseCaptureRate:v6];
  id v7 = [(CUCaptureController *)self _captureEngine];
  [v7 enqueueCommand:v8];
}

- (void)notifyTimelapseControllerFinishedUpdatingWithLocation
{
  id v2 = [(CUCaptureController *)self _locationController];
  [v2 setEnabled:0];
}

- (id)_commandForConfiguration:(id)a3 zoomFactor:(double)a4 outputToExternalStorage:(BOOL)a5 outRequestID:(int *)a6
{
  BOOL v7 = a5;
  v26[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = +[CAMCaptureCapabilities capabilities];
  int v12 = +[CAMCaptureConfiguration captureGraphConfigurationUsingConfiguration:v10 outputToExternalStorage:v7];
  unint64_t v13 = [v12 mode];
  uint64_t v14 = [v12 devicePosition];
  uint64_t v15 = 0;
  if (v13 > 7)
  {
    uint64_t v16 = 0;
  }
  else if (((1 << v13) & 0x51) != 0)
  {
    uint64_t v16 = [v10 flashMode];
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    if (((1 << v13) & 0x86) != 0)
    {
      uint64_t v15 = [v10 torchMode];
      uint64_t v16 = 0;
    }
  }
  if ([v11 isHDRSupportedForMode:v13 devicePosition:v14]) {
    BOOL v17 = [v10 HDRMode] == 2;
  }
  else {
    BOOL v17 = 0;
  }
  id v18 = [(CUCaptureController *)self _commandForChangeToGraphConfiguration:v12 zoomFactor:v7 minimumExecutionTime:a6 outputToExternalStorage:a4 outRequestID:0.0];
  uint64_t v19 = [[CAMFlashCommand alloc] initWithFlashMode:v16];
  uint64_t v20 = [[CAMTorchCommand alloc] initWithTorchMode:v15];
  double v21 = [[CAMHDRSuggestionMonitoringCommand alloc] initWithHDRSuggestionMonitoringEnabled:v17];
  id v22 = [CAMCaptureCommand alloc];
  v26[0] = v18;
  v26[1] = v19;
  v26[2] = v20;
  v26[3] = v21;
  double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
  uint64_t v24 = [(CAMCaptureCommand *)v22 initWithSubcommands:v23];

  return v24;
}

- (id)_commandForChangeToGraphConfiguration:(id)a3 zoomFactor:(double)a4 minimumExecutionTime:(double)a5 outputToExternalStorage:(BOOL)a6 outRequestID:(int *)a7
{
  BOOL v70 = a6;
  id v11 = a3;
  int v12 = +[CAMCaptureCapabilities capabilities];
  uint64_t v13 = [(CUCaptureController *)self _uniqueRequestIDForChangeToModeAndDevice];
  uint64_t v14 = v13;
  if (a7) {
    *a7 = v13;
  }
  uint64_t v74 = [v11 mode];
  uint64_t v73 = [v11 device];
  v72 = v12;
  if ([(CUCaptureController *)self isPreviewDisabled])
  {
    v69 = [CAMCaptureGraphConfiguration alloc];
    uint64_t v68 = [v11 macroMode];
    uint64_t v67 = [v11 videoConfiguration];
    uint64_t v66 = [v11 audioConfiguration];
    unsigned int v65 = [v11 mixAudioWithOthers];
    char v64 = [v11 windNoiseRemovalEnabled];
    uint64_t v63 = [v11 previewSampleBufferVideoFormat];
    v62 = [v11 previewFilters];
    v61 = [v11 videoThumbnailOutputConfiguration];
    uint64_t v60 = [v11 photoEncodingBehavior];
    uint64_t v59 = [v11 videoEncodingBehavior];
    char v58 = [v11 enableAutoFPSVideo];
    char v15 = [v11 isVideoHDRSuspended];
    uint64_t v57 = [v11 aspectRatioCrop];
    uint64_t v56 = [v11 photoQualityPrioritization];
    char v55 = [v11 isCaptureMirrored];
    char v54 = [v11 enableRAWCaptureIfSupported];
    uint64_t v52 = [v11 semanticStyleSupport];
    v53 = [v11 previewSemanticStyle];
    char v51 = [v11 enableContentAwareDistortionCorrection];
    char v50 = [v11 enableResponsiveShutter];
    char v49 = [v11 suspendLivePhotoCapture];
    uint64_t v48 = [v11 videoStabilizationStrength];
    uint64_t v47 = [v11 maximumPhotoResolution];
    uint64_t v16 = [v11 colorSpace];
    char v17 = [v11 enableDepthSuggestion];
    id v18 = self;
    char v19 = [v11 enableZoomPIP];
    uint64_t v20 = [v11 customLensGroup];
    char v21 = [v11 enableStereoVideoCapture];
    char v22 = [v11 trueVideoEnabled];
    BYTE2(v46) = [v11 prefersHDR10BitVideo];
    BYTE1(v46) = v22;
    LOBYTE(v46) = v21;
    BYTE1(v45) = v19;
    self = v18;
    LOBYTE(v45) = v17;
    uint64_t v44 = v16;
    int v12 = v72;
    BYTE2(v43) = v49;
    BYTE1(v43) = v50;
    LOBYTE(v43) = v51;
    BYTE1(v42) = v54;
    LOBYTE(v42) = v55;
    BYTE1(v41) = v15;
    LOBYTE(v41) = v58;
    LOBYTE(v40) = v64;
    uint64_t v23 = -[CAMCaptureGraphConfiguration initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:](v69, "initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:", v74, v73, v68, v67, v66, v65, v40, 0, v63, v62, v61,
            v60,
            v59,
            v41,
            v57,
            v56,
            v42,
            v52,
            v53,
            v43,
            v48,
            v47,
            v44,
            v45,
            v20,
            v46);

    id v11 = (id)v23;
  }
  uint64_t v24 = [[CAMModeAndDeviceCommand alloc] initWithGraphConfiguration:v11 minimumExecutionTime:v14 requestID:v70 outputToExternalStorage:a5];
  id v25 = [MEMORY[0x263EFF980] arrayWithObject:v24];
  uint64_t v26 = [[CAMSetVideoZoomFactorCommand alloc] initWithVideoZoomFactor:v11 graphConfiguration:a4];
  [v25 addObject:v26];
  if ([v12 isLowLightSupported])
  {
    uint64_t v27 = -[CAMLowLightConfigurationCommand initWithLowLightEnabled:]([CAMLowLightConfigurationCommand alloc], "initWithLowLightEnabled:", [v12 isLowLightSupportedForMode:v74 device:v73 zoomFactor:a4]);
    [v25 addObject:v27];
    double v28 = [[CAMLowLightModeCommand alloc] initWithLowLightMode:0];
    [v25 addObject:v28];
  }
  dispatch_queue_t v29 = -[CUCaptureController _realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:](self, "_realtimeMetadataCommandsForMode:videoConfiguration:capturing:wantsMachineReadableCodes:wantsImageAnalysis:", v74, [v11 videoConfiguration], 0, -[CUCaptureController _wantsMachineReadableCodesForGraphConfiguration:](self, "_wantsMachineReadableCodesForGraphConfiguration:", v11), -[CUCaptureController _wantsImageAnalysisForGraphConfiguration:](self, "_wantsImageAnalysisForGraphConfiguration:", v11));
  [v25 addObject:v29];
  if ([v12 focalLengthPickerSupported])
  {
    v71 = +[CAMUserPreferences preferences];
    id v30 = [v71 customLensGroup];
    uint64_t v31 = [v11 videoConfiguration];
    uint64_t v32 = v26;
    uint64_t v33 = [v11 videoStabilizationStrength];
    uint64_t v34 = [v11 trueVideoEnabled];
    uint64_t v35 = v33;
    uint64_t v26 = v32;
    long long v36 = +[CAMZoomControlUtilities exifFocalLengthsByZoomFactorForMode:v74 device:v73 videoConfiguration:v31 videoStabilizationStrength:v35 customLensGroup:v30 isTrueVideo:v34];
    long long v37 = [[CAMSetExifFocalLengthsByZoomFactorCommand alloc] initWithExifFocalLengthsByZoomFactor:v36];
    [v25 addObject:v37];

    int v12 = v72;
  }
  uint64_t v38 = [[CAMCaptureCommand alloc] initWithSubcommands:v25];

  return v38;
}

- (void)updateRealtimeMetadataConfigurationForGraphConfiguration:(id)a3 isCapturing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(CUCaptureController *)self _wantsMachineReadableCodesForGraphConfiguration:v6];
  BOOL v8 = [(CUCaptureController *)self _wantsImageAnalysisForGraphConfiguration:v6];
  uint64_t v9 = [v6 mode];
  uint64_t v10 = [v6 videoConfiguration];

  id v12 = [(CUCaptureController *)self _realtimeMetadataCommandsForMode:v9 videoConfiguration:v10 capturing:v4 wantsMachineReadableCodes:v7 wantsImageAnalysis:v8];
  id v11 = [(CUCaptureController *)self _captureEngine];
  [v11 enqueueCommand:v12];
}

- (id)_realtimeMetadataCommandsForMode:(int64_t)a3 videoConfiguration:(int64_t)a4 capturing:(BOOL)a5 wantsMachineReadableCodes:(BOOL)a6 wantsImageAnalysis:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  v24[2] = *MEMORY[0x263EF8340];
  id v12 = +[CAMCaptureCapabilities capabilities];
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v14 = v13;
  uint64_t v15 = 1;
  int v16 = 0;
  uint64_t v17 = 0;
  switch(a3)
  {
    case 0:
    case 4:
      if (v8)
      {
        [v13 addObject:&unk_26BDDE778];
        [v14 addObject:&unk_26BDDE790];
      }
      if (v7) {
        [v14 addObject:&unk_26BDDE7A8];
      }
      goto LABEL_9;
    case 1:
    case 2:
    case 8:
      if (a5) {
        goto LABEL_3;
      }
      goto LABEL_9;
    case 3:
      uint64_t v15 = 0;
LABEL_9:
      int v16 = 0;
      goto LABEL_10;
    case 5:
      goto LABEL_13;
    case 6:
    case 9:
      goto LABEL_10;
    case 7:
      int v16 = 1;
LABEL_10:
      [v14 addObject:&unk_26BDDE760];
      [v14 addObject:&unk_26BDDE7C0];
      [v14 addObject:&unk_26BDDE7D8];
      if (v16)
      {
        [v14 addObject:&unk_26BDDE7F0];
        [v14 addObject:&unk_26BDDE808];
        [v14 addObject:&unk_26BDDE820];
        [v14 addObject:&unk_26BDDE838];
        [v14 addObject:&unk_26BDDE850];
      }
      uint64_t v17 = v15;
LABEL_13:
      if ([v12 isExposureClippingIndicatorSupportedForMode:a3 videoConfiguration:a4]) {
        [v14 addObject:&unk_26BDDE868];
      }
      break;
    default:
LABEL_3:
      uint64_t v17 = 1;
      break;
  }
  id v18 = [[CAMRealtimeMetadataCommand alloc] initWithTypes:v14];
  char v19 = [[CAMFaceDrivenImageProcessingCommand alloc] initWithFaceDrivenImageProcessingEnabled:v17];
  uint64_t v20 = [CAMCaptureCommand alloc];
  v24[0] = v18;
  v24[1] = v19;
  char v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  char v22 = [(CAMCaptureCommand *)v20 initWithSubcommands:v21];

  return v22;
}

- (BOOL)_wantsImageAnalysisForGraphConfiguration:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[CAMUserPreferences preferences];
  char v5 = [v4 isImageAnalysisEnabled];

  id v6 = +[CAMCaptureCapabilities capabilities];
  uint64_t v7 = [v3 mode];
  uint64_t v8 = [v3 devicePosition];

  LOBYTE(v3) = [v6 isImageAnalysisSupportedForMode:v7 devicePosition:v8];
  return v5 & v3;
}

- (int)changeToGraphConfiguration:(id)a3 zoomFactor:(double)a4 minimumExecutionTime:(double)a5 outputToExternalStorage:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  if ([(CUCaptureController *)self isCapturingStandardVideo])
  {
    id v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Changing graph configuration while capturing video or while waiting for video capture. Attempting to stop video.", buf, 2u);
    }

    [(CUCaptureController *)self _stopCapturingVideoAndDisableCaptureAvailabilityWhileStopping:0];
  }
  int v16 = 0;
  id v12 = [(CUCaptureController *)self _commandForChangeToGraphConfiguration:v10 zoomFactor:v6 minimumExecutionTime:&v16 outputToExternalStorage:a4 outRequestID:a5];
  id v13 = [(CUCaptureController *)self _captureEngine];
  [v13 enqueueCommand:v12];
  int v14 = v16;

  return v14;
}

- (void)changeToTorchLevel:(float)a3
{
  char v5 = [CAMTorchCommand alloc];
  *(float *)&double v6 = a3;
  uint64_t v8 = [(CAMTorchCommand *)v5 initWithTorchLevel:v6];
  uint64_t v7 = [(CUCaptureController *)self _captureEngine];
  [v7 enqueueCommand:v8];
}

- (void)changeToPreviewDisabled
{
  if (!self->_previewDisabled)
  {
    self->_previewDisabled = 1;
    BOOL v4 = [[CAMPreviewConfigurationCommand alloc] initWithPreviewConfiguration:0];
    id v3 = [(CUCaptureController *)self _captureEngine];
    [v3 enqueueCommand:v4];
  }
}

- (void)changeToPreviewEnabledWithConfiguration:(unint64_t)a3
{
  if (self->_previewDisabled)
  {
    self->_previewDisabled = 0;
    char v5 = [[CAMPreviewConfigurationCommand alloc] initWithPreviewConfiguration:a3];
    BOOL v4 = [(CUCaptureController *)self _captureEngine];
    [v4 enqueueCommand:v5];
  }
}

- (void)changeToPreviewConfiguration:(unint64_t)a3
{
  if (!self->_previewDisabled)
  {
    char v5 = [[CAMPreviewConfigurationCommand alloc] initWithPreviewConfiguration:a3];
    BOOL v4 = [(CUCaptureController *)self _captureEngine];
    [v4 enqueueCommand:v5];
  }
}

- (void)changeToPreviewFilters:(id)a3 captureMode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [[CAMPreviewFiltersCommand alloc] initWithFilters:v6 captureMode:a4];

  [(CAMCaptureEngine *)self->__captureEngine enqueueCommand:v7];
}

- (void)changeToVideoHDRSuspended:(BOOL)a3
{
  char v5 = [[CAMVideoHDRSuspensionCommand alloc] initWithVideoHDRSuspended:a3];
  BOOL v4 = [(CUCaptureController *)self _captureEngine];
  [v4 enqueueCommand:v5];
}

- (BOOL)shouldAllowUserToChangeFocusAndExposure
{
  if ([(CUCaptureController *)self isCapturingPanorama]
    || [(CUCaptureController *)self isCapturingTimelapse])
  {
    return 0;
  }
  else
  {
    return ![(CUCaptureController *)self isCapturingBurst];
  }
}

- (BOOL)_shouldLockWhiteBalanceForActiveVideoRequest
{
  id v3 = [(CUCaptureController *)self _capturingVideoRequest];
  if ([(CUCaptureController *)self _shouldLockWhiteBalanceForVideoCaptureRequest:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = [(CUCaptureController *)self _capturingCTMVideoRequest];
    BOOL v4 = [(CUCaptureController *)self _shouldLockWhiteBalanceForCTMVideoRequest:v5];
  }
  return v4;
}

- (BOOL)_shouldLockWhiteBalanceForCTMVideoRequest:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 && [v3 isCTMVideo]) {
    char v5 = [v4 wantsWhiteBalanceLockedDuringVideoRecording];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldLockWhiteBalanceForVideoCaptureRequest:(id)a3
{
  if (a3) {
    return [a3 wantsWhiteBalanceLocked];
  }
  else {
    return 0;
  }
}

- (void)focusAtPoint:(CGPoint)a3 lockFocus:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  v16[2] = *MEMORY[0x263EF8340];
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  BOOL v8 = [(CUCaptureController *)self _useSmoothFocus];
  BOOL v9 = [(CUCaptureController *)self isCapturingVideo];
  if (v4) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 3;
  }
  id v11 = -[CAMFocusCommand initWithFocusMode:atPointOfInterest:smooth:]([CAMFocusCommand alloc], "initWithFocusMode:atPointOfInterest:smooth:", v10, v8, x, y);
  id v12 = [[CAMSubjectAreaChangeMonitoringCommand alloc] initWithSubjectAreaChangeMonitoringEnabled:!v9];
  v16[0] = v11;
  v16[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  int v14 = [[CAMCaptureCommand alloc] initWithSubcommands:v13];
  uint64_t v15 = [(CUCaptureController *)self _captureEngine];
  [v15 enqueueCommand:v14];
}

- (void)focusAndExposeAtPoint:(CGPoint)a3 lockFocus:(BOOL)a4 resetExposureTargetBias:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  v26[2] = *MEMORY[0x263EF8340];
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  BOOL v10 = [(CUCaptureController *)self _useSmoothFocus];
  if (v6) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 3;
  }
  id v12 = -[CAMFocusCommand initWithFocusMode:atPointOfInterest:smooth:]([CAMFocusCommand alloc], "initWithFocusMode:atPointOfInterest:smooth:", v11, v10, x, y);
  id v13 = -[CAMExposureCommand initWithExposureMode:atPointOfInterest:]([CAMExposureCommand alloc], "initWithExposureMode:atPointOfInterest:", 2, x, y);
  v26[0] = v12;
  v26[1] = v13;
  int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  uint64_t v15 = (void *)[v14 mutableCopy];

  if (![(CUCaptureController *)self _shouldLockWhiteBalanceForActiveVideoRequest])
  {
    int v16 = [[CAMWhiteBalanceCommand alloc] initWithWhiteBalanceMode:2];
    [v15 addObject:v16];
  }
  if (v5)
  {
    uint64_t v17 = [(CUCaptureController *)self exposureDelegate];
    [v17 baselineExposureValueForCaptureController:self];
    int v19 = v18;

    uint64_t v20 = [CAMExposureTargetBiasCommand alloc];
    LODWORD(v21) = v19;
    char v22 = [(CAMExposureTargetBiasCommand *)v20 initWithExposureTargetBias:v21];
    [v15 addObject:v22];
  }
  uint64_t v23 = [[CAMSubjectAreaChangeMonitoringCommand alloc] initWithSubjectAreaChangeMonitoringEnabled:[(CUCaptureController *)self isCapturingVideo] ^ 1];
  [v15 addObject:v23];

  uint64_t v24 = [[CAMCaptureCommand alloc] initWithSubcommands:v15];
  id v25 = [(CUCaptureController *)self _captureEngine];
  [v25 enqueueCommand:v24];
}

- (id)_commandForLockingExposureIncludingFocus:(BOOL)a3
{
  BOOL v3 = a3;
  v15[1] = *MEMORY[0x263EF8340];
  BOOL v5 = [[CAMExposureCommand alloc] initWithExposureMode:0];
  v15[0] = v5;
  BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  uint64_t v7 = (void *)[v6 mutableCopy];

  if (![(CUCaptureController *)self _shouldLockWhiteBalanceForActiveVideoRequest])
  {
    BOOL v8 = [(CUCaptureController *)self isFlashActive];
    BOOL v9 = [CAMWhiteBalanceCommand alloc];
    if (v8) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = [(CAMWhiteBalanceCommand *)v9 initWithWhiteBalanceMode:v10];
    [v7 addObject:v11];
  }
  if (v3)
  {
    id v12 = [[CAMFocusCommand alloc] initWithFocusMode:0];
    [v7 addObject:v12];
  }
  id v13 = [[CAMCaptureCommand alloc] initWithSubcommands:v7];

  return v13;
}

- (void)changeToLockedExposure
{
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  id v4 = [(CUCaptureController *)self _commandForLockingExposureIncludingFocus:0];
  BOOL v3 = [(CUCaptureController *)self _captureEngine];
  [v3 enqueueCommand:v4];
}

- (void)changeToLockedFocusAndExposure
{
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  id v4 = [(CUCaptureController *)self _commandForLockingExposureIncludingFocus:1];
  BOOL v3 = [(CUCaptureController *)self _captureEngine];
  [v3 enqueueCommand:v4];
}

- (void)resetFocusAndExposure
{
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  [(CUCaptureController *)self _resetFocusAndExposureIfAppropriateForReason:3];
}

- (void)forceDisableSubjectAreaChangeMonitoring
{
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  id v4 = [[CAMSubjectAreaChangeMonitoringCommand alloc] initWithSubjectAreaChangeMonitoringEnabled:0];
  BOOL v3 = [(CUCaptureController *)self _captureEngine];
  [v3 enqueueCommand:v4];
}

+ (float)focusLensPositionCurrentSentinel
{
  +[CAMFocusLockWithLensPositionCommand currentLensPositionSentinel];
  return result;
}

- (void)lockFocusAtLensPosition:(float)a3 completionBlock:(id)a4
{
  id v6 = a4;
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  uint64_t v7 = [CAMFocusLockWithLensPositionCommand alloc];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__CUCaptureController_lockFocusAtLensPosition_completionBlock___block_invoke;
  v12[3] = &unk_263FA47A8;
  id v13 = v6;
  id v8 = v6;
  *(float *)&double v9 = a3;
  uint64_t v10 = [(CAMFocusLockWithLensPositionCommand *)v7 initWithLensPosition:v12 completionBlock:v9];
  uint64_t v11 = [(CUCaptureController *)self _captureEngine];
  [v11 enqueueCommand:v10];
}

void __63__CUCaptureController_lockFocusAtLensPosition_completionBlock___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  pl_dispatch_async();
}

uint64_t __63__CUCaptureController_lockFocusAtLensPosition_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(float))(result + 16))(*(float *)(a1 + 40));
  }
  return result;
}

- (void)focusAtCenterForVideoRecording
{
  if ([(CUCaptureController *)self isCapturingVideo])
  {
    BOOL v3 = [(CUCaptureController *)self focusDelegate];
    id v8 = v3;
    if (!v3
      || (uint64_t v4 = [v3 captureController:self shouldResetFocusAndExposureForReason:2],
          BOOL v5 = v8,
          v4))
    {
      id v6 = objc_alloc_init(CAMFocusAtCenterForVideoRecordingCommand);
      uint64_t v7 = [(CUCaptureController *)self _captureEngine];
      [v7 enqueueCommand:v6];

      BOOL v5 = v8;
    }
    MEMORY[0x270F9A758](v4, v5);
  }
}

- (void)setCinematicFocusForMetadataObject:(id)a3 atPoint:(CGPoint)a4 useFixedOpticalFocus:(BOOL)a5 useHardFocus:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  id v12 = [CAMCinematicFocusCommand alloc];
  int64_t v13 = [(CUCaptureController *)self _cinematicMetadataObjectIDForMetadataObject:v11];

  uint64_t v15 = -[CAMCinematicFocusCommand initWithMetadataObjectID:atPointOfInterest:useFixedOpticalFocus:useHardFocus:](v12, "initWithMetadataObjectID:atPointOfInterest:useFixedOpticalFocus:useHardFocus:", v13, v7, v6, x, y);
  int v14 = [(CUCaptureController *)self _captureEngine];
  [v14 enqueueCommand:v15];
}

- (void)setCinematicFocusAtPoint:(CGPoint)a3 useFixedOpticalFocus:(BOOL)a4 useHardFocus:(BOOL)a5
{
}

- (int64_t)_cinematicMetadataObjectIDForMetadataObject:(id)a3
{
  if (a3)
  {
    BOOL v3 = [a3 underlyingMetadataObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = [v3 faceID];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = [v3 bodyID];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v7 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v8 = 0;
            _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Cinematic: Trying to find ID for Cinematic focus for an unsupported metadata object", v8, 2u);
          }

          int64_t v5 = -1;
          goto LABEL_10;
        }
        uint64_t v4 = [v3 objectID];
      }
    }
    int64_t v5 = v4;
LABEL_10:

    return v5;
  }
  return -1;
}

- (BOOL)_shouldManageFocusForMode:(int64_t)a3
{
  return ((unint64_t)a3 < 0xA) & (0x37Fu >> a3);
}

- (BOOL)_shouldResetFocusAndExposureAfterCapture
{
  if ([(CUCaptureController *)self isCapturingLivePhotoVideo]
    || [(CUCaptureController *)self isCapturingStandardVideo]
    || [(CUCaptureController *)self isCapturingBurst]
    || [(CUCaptureController *)self isCapturingTimelapse])
  {
    return 0;
  }
  else
  {
    return ![(CUCaptureController *)self hasActiveCTMVideoCaptures];
  }
}

- (void)_scheduleFocusAndExposureResetAfterCaptureIfNecessaryForType:(int64_t)a3
{
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  int64_t v5 = [(CUCaptureController *)self focusDelegate];
  LODWORD(a3) = [v5 captureController:self shouldResetFocusAndExposureAfterCaptureForType:a3];

  if (a3)
  {
    if ([(CUCaptureController *)self _shouldResetFocusAndExposureAfterCapture])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_focusDelegate);
      char v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0
        && (id v8 = objc_loadWeakRetained((id *)&self->_focusDelegate),
            [v8 captureControllerDelayBeforeResettingFocusAndExposureAfterCapture:self],
            double v10 = v9,
            v8,
            v10 > 0.0))
      {
        [(CUCaptureController *)self performSelector:sel__resetFocusAndExposureAfterCapture withObject:0 afterDelay:v10];
      }
      else
      {
        [(CUCaptureController *)self _resetFocusAndExposureAfterCapture];
      }
    }
    else
    {
      id v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "Not scheduling focus/exposure reset because still capturing", v12, 2u);
      }
    }
  }
}

- (void)_resetFocusAndExposureAfterCaptureForType:(int64_t)a3
{
  int64_t v5 = [(CUCaptureController *)self focusDelegate];
  LODWORD(a3) = [v5 captureController:self shouldResetFocusAndExposureAfterCaptureForType:a3];

  if (a3)
  {
    [(CUCaptureController *)self _resetFocusAndExposureAfterCapture];
  }
}

- (void)changeExposureTargetBias:(float)a3
{
  [(CUCaptureController *)self cancelDelayedFocusAndExposureReset];
  int64_t v5 = [CAMExposureTargetBiasCommand alloc];
  *(float *)&double v6 = a3;
  id v8 = [(CAMExposureTargetBiasCommand *)v5 initWithExposureTargetBias:v6];
  char v7 = [(CUCaptureController *)self _captureEngine];
  [v7 enqueueCommand:v8];
}

- (void)_teardownFocusAndExposureMonitoring
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CUCaptureController *)self _captureEngine];
  uint64_t v4 = [(CUCaptureController *)self _focusKVOKeyPaths];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v19 + 1) + 8 * v8++) context:CAMFocusResultContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
  double v9 = [(CUCaptureController *)self _exposureKVOKeyPaths];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v15 + 1) + 8 * v13++) context:CAMExposureResultContext];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }
  int v14 = [MEMORY[0x263F08A00] defaultCenter];
  [v14 removeObserver:self name:*MEMORY[0x263EF9618] object:0];
}

- (void)stopMonitoringForHDRSuggestions
{
  id v3 = [(CUCaptureController *)self _captureEngine];
  id v2 = [[CAMHDRSuggestionMonitoringCommand alloc] initWithHDRSuggestionMonitoringEnabled:0];
  [v3 enqueueCommand:v2];
}

- (void)_teardownSuggestionMonitoring
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(CUCaptureController *)self _captureEngine];
  uint64_t v4 = [(CUCaptureController *)self _suggestionKeyPaths];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) context:CAMSuggestionResultContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateAutoMacroSuggested
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 isSuperWideAutoMacroSupported];

  if (v4)
  {
    uint64_t v5 = [(CUCaptureController *)self _captureEngine];
    uint64_t v6 = [v5 currentCameraDevice];

    uint64_t v7 = [v6 preferredPrimaryConstituentDevice];
    [v6 videoZoomFactor];
    double v9 = v8;
    long long v10 = [v6 virtualDeviceSwitchOverVideoZoomFactors];
    long long v11 = [v10 firstObject];
    [v11 floatValue];
    double v13 = v12;

    uint64_t v14 = [v7 deviceType];

    if (![v6 isRampingVideoZoom] || v9 < v13)
    {
      BOOL v16 = v9 >= v13 && v14 == (void *)*MEMORY[0x263EF9660];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __48__CUCaptureController__updateAutoMacroSuggested__block_invoke;
      v17[3] = &unk_263FA02A8;
      BOOL v18 = v16;
      v17[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], v17);
    }
  }
}

void __48__CUCaptureController__updateAutoMacroSuggested__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (v2 != [*(id *)(a1 + 32) isAutoMacroSuggested])
  {
    [*(id *)(a1 + 32) setAutoMacroSuggested:*(unsigned __int8 *)(a1 + 40)];
    id v3 = [*(id *)(a1 + 32) suggestionDelegate];
    [v3 captureController:*(void *)(a1 + 32) didChangeAutoMacroSuggested:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)_updateAutoMacroActive
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 isSuperWideAutoMacroSupported];

  if (v4)
  {
    uint64_t v5 = [(CUCaptureController *)self _captureEngine];
    uint64_t v6 = [v5 currentCameraDevice];

    uint64_t v7 = [v6 activePrimaryConstituentDevice];
    [v6 videoZoomFactor];
    double v9 = v8;
    long long v10 = [v6 virtualDeviceSwitchOverVideoZoomFactors];
    long long v11 = [v10 firstObject];
    [v11 floatValue];
    double v13 = v12;

    uint64_t v14 = [v7 deviceType];

    if (![v6 isRampingVideoZoom] || v9 < v13)
    {
      BOOL v16 = v9 >= v13 && v14 == (void *)*MEMORY[0x263EF9660];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __45__CUCaptureController__updateAutoMacroActive__block_invoke;
      v17[3] = &unk_263FA02A8;
      BOOL v18 = v16;
      v17[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], v17);
    }
  }
}

void __45__CUCaptureController__updateAutoMacroActive__block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (v2 != [*(id *)(a1 + 32) isAutoMacroActive])
  {
    [*(id *)(a1 + 32) setAutoMacroActive:*(unsigned __int8 *)(a1 + 40)];
    id v3 = [*(id *)(a1 + 32) suggestionDelegate];
    [v3 captureController:*(void *)(a1 + 32) didChangeAutoMacroActive:*(unsigned __int8 *)(a1 + 40)];
  }
}

void __74__CUCaptureController__suggestionResultChangedForKeyPath_ofObject_change___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setFlashActive:*(unsigned __int8 *)(a1 + 48)];
  id v6 = [*(id *)(a1 + 32) suggestionDelegate];
  [v6 captureController:*(void *)(a1 + 32) didOutputFlashActive:*(unsigned __int8 *)(a1 + 48)];
  if (([*(id *)(a1 + 32) _shouldLockWhiteBalanceForActiveVideoRequest] & 1) == 0)
  {
    int v2 = *(unsigned __int8 *)(a1 + 48);
    id v3 = [CAMWhiteBalanceCommand alloc];
    if (v2) {
      uint64_t v4 = [(CAMWhiteBalanceCommand *)v3 initWithWhiteBalanceMode:2];
    }
    else {
      uint64_t v4 = [(CAMWhiteBalanceCommand *)v3 initWithMatchExposureMode];
    }
    uint64_t v5 = (void *)v4;
    [*(id *)(a1 + 40) enqueueCommand:v4];
  }
}

void __74__CUCaptureController__suggestionResultChangedForKeyPath_ofObject_change___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setTorchActive:*(unsigned __int8 *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) suggestionDelegate];
  [v2 captureController:*(void *)(a1 + 32) didOutputTorchActive:*(unsigned __int8 *)(a1 + 40)];
}

void __74__CUCaptureController__suggestionResultChangedForKeyPath_ofObject_change___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _setLowLightStatus:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) suggestionDelegate];
  [v2 captureController:*(void *)(a1 + 32) didOutputLowLightStatus:*(void *)(a1 + 40)];
}

void __74__CUCaptureController__suggestionResultChangedForKeyPath_ofObject_change___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) suggestionDelegate];
  objc_msgSend(v2, "captureController:didOutputLowLightModeDurationMapping:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)_teardownAvailabilityMonitoring
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(CUCaptureController *)self _captureEngine];
  uint64_t v4 = [(CUCaptureController *)self _availabilityKeyPaths];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) context:CAMAvailabilityResultContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __76__CUCaptureController__availabilityResultChangedForKeyPath_ofObject_change___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setTorchAvailable:*(unsigned __int8 *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) availabilityDelegate];
  [v2 captureController:*(void *)(a1 + 32) didOutputTorchAvailability:*(unsigned __int8 *)(a1 + 40)];
}

void __76__CUCaptureController__availabilityResultChangedForKeyPath_ofObject_change___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 != [*(id *)(a1 + 32) flashCompromise])
  {
    [*(id *)(a1 + 32) _setFlashCompromise:*(void *)(a1 + 40)];
    id v3 = [*(id *)(a1 + 32) availabilityDelegate];
    [v3 captureController:*(void *)(a1 + 32) didOutputFlashCompromise:*(void *)(a1 + 40)];
  }
}

- (void)_updateMaximumNumberOfStillImageRequestsAfterEnqueuingRequest:(id)a3
{
  id v16 = a3;
  uint64_t v4 = +[CAMCaptureCapabilities capabilities];
  uint64_t v5 = [(CUCaptureController *)self _maximumNumberOfStillImageRequests];
  if (!v5) {
    uint64_t v5 = [v4 maximumNumberOfInflightRequests];
  }
  uint64_t v6 = [v16 ctmCaptureType];
  uint64_t v7 = v16;
  if (v6 != 2)
  {
    uint64_t v8 = [v16 flashMode];
    BOOL v9 = [(CUCaptureController *)self isFlashActive];
    if (v8 == 1 || v8 == 2 && v9) {
      uint64_t v5 = 1;
    }
    uint64_t v10 = [v16 hdrMode];
    BOOL v11 = [(CUCaptureController *)self isHDRSuggested];
    uint64_t v7 = v16;
    if (v10 == 1 || v10 == 2 && v11) {
      uint64_t v5 = 1;
    }
  }
  long long v12 = [v7 burstIdentifier];

  if (v12) {
    uint64_t v5 = [(CUCaptureController *)self _maximumNumberOfStillImageRequestsDuringBurst];
  }
  if ([v4 portraitModeOverlappingCapturesSupported])
  {
    double v13 = v16;
  }
  else
  {
    uint64_t v14 = [v16 adjustmentFilters];
    BOOL v15 = +[CAMEffectFilterManager isDepthEffectInFilters:v14];

    double v13 = v16;
    if (v15) {
      uint64_t v5 = 1;
    }
  }
  if ([v13 lowLightMode]) {
    uint64_t v5 = 1;
  }
  if ([v16 maximumPhotoResolution] == 3
    && ![v4 supportsOverlappingCapturesForResolution:3])
  {
    uint64_t v5 = 1;
  }
  [(CUCaptureController *)self _setMaximumNumberOfStillImageRequests:v5];
}

- (void)_updateMaximumNumberOfStillImageRequestsAfterBurst
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  -[CUCaptureController _setMaximumNumberOfStillImageRequests:](self, "_setMaximumNumberOfStillImageRequests:", [v3 maximumNumberOfInflightRequests]);
}

- (unint64_t)_maximumNumberOfStillImageRequestsDuringBurst
{
  uint64_t v2 = +[CAMCaptureCapabilities capabilities];
  if ([v2 isPipelinedStillImageProcessingSupported])
  {
    unint64_t v3 = 3;
  }
  else
  {
    uint64_t v4 = +[CAMCaptureCapabilities capabilities];
    unint64_t v3 = [v4 maximumNumberOfInflightRequests];
  }
  return v3;
}

- (void)logCaptureAvailabilityDescription
{
  if ([(CUCaptureController *)self isCaptureAvailable])
  {
    unint64_t v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Capture is available", v5, 2u);
    }
  }
  uint64_t v4 = [(CUCaptureController *)self _captureEngine];
  [v4 currentInflightCapturesStringWithCompletionHandler:&__block_literal_global_37];
}

void __56__CUCaptureController_logCaptureAvailabilityDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  unint64_t v3 = [NSString stringWithFormat:@"Capture unavailable. Still image requests: %@ and / or video requests: %@ are still in flight", a2, a3];
  uint64_t v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

- (BOOL)_shouldTrackInflightCountForRequest:(id)a3
{
  id v3 = a3;
  if ([v3 type]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [v3 ctmCaptureType] != 2;
  }

  return v4;
}

- (void)_updateAvailabilityWhenPreparingToStopCapturingForRequest:(id)a3
{
  uint64_t v4 = [a3 type];
  [(CUCaptureController *)self _updateAvailabilityForRequestType:v4];
}

- (void)_updateAvailabilityAfterStopCapturingForRequest:(id)a3
{
  uint64_t v4 = [a3 type];
  [(CUCaptureController *)self _updateAvailabilityForRequestType:v4];
}

- (void)_notifyDelegateOfCaptureAvailabilityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CUCaptureController *)self availabilityDelegate];
  [v5 captureController:self didOutputCaptureAvailability:v3];
}

- (void)_notifyDelegateOfConfigurationAvailabilityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CUCaptureController *)self availabilityDelegate];
  [v5 captureController:self didOutputConfigurationAvailability:v3];
}

- (void)metadataWasRecognized:(id)a3 forMetadataObjectTypes:(id)a4 deviceFormat:(id)a5
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v43 = a4;
  id v47 = a5;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v51 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v53 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v46 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v45 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v49 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (!v11)
  {
    uint64_t v48 = 0;
    id v14 = v51;
    goto LABEL_42;
  }
  uint64_t v12 = v11;
  uint64_t v48 = 0;
  uint64_t v13 = *(void *)v61;
  uint64_t v50 = *MEMORY[0x263EF9F50];
  uint64_t v44 = *MEMORY[0x263EF9F68];
  id v14 = v51;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v61 != v13) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(void **)(*((void *)&v60 + 1) + 8 * v15);
      if ([v16 isHumanFace])
      {
        long long v17 = v16;
        BOOL v18 = [[CAMFaceResult alloc] initWithFaceObject:v17];
        long long v19 = v8;
        goto LABEL_8;
      }
      if (([v16 isPetHead] & 1) != 0 || objc_msgSend(v16, "isHumanHead"))
      {
        BOOL v18 = [[CAMHeadObjectResult alloc] initWithHeadObject:v16];
        [v9 addObject:v18];
        goto LABEL_14;
      }
      if (([v16 isPetBody] & 1) != 0 || objc_msgSend(v16, "isHumanBody"))
      {
        long long v17 = v16;
        BOOL v18 = [[CAMBodyObjectResult alloc] initWithBodyObject:v17];
        long long v19 = v14;
        goto LABEL_8;
      }
      if ([v16 isSalientObject])
      {
        long long v17 = v16;
        BOOL v18 = [[CAMSalientObjectResult alloc] initWithSalientObject:v17];
        long long v19 = v53;
LABEL_8:
        long long v20 = v18;
LABEL_9:
        [v19 addObject:v20];
LABEL_10:

        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v18 = v16;
        long long v17 = [[CAMMachineReadableCodeResult alloc] initWithMachineReadableCodeObject:v18];
        uint64_t v21 = [(CAMMachineReadableCodeResult *)v17 mrcType];
        if (v21 == 2)
        {
          double v28 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v41 = [(CAMFaceResult *)v18 description];
            *(_DWORD *)buf = 138543362;
            uint64_t v65 = (uint64_t)v41;
            _os_log_impl(&dword_2099F8000, v28, OS_LOG_TYPE_DEFAULT, "Unknown machine readable code type %{public}@", buf, 0xCu);
          }
          id v14 = v51;
          goto LABEL_10;
        }
        if (v21 == 1)
        {
          long long v19 = v45;
        }
        else
        {
          if (v21) {
            goto LABEL_10;
          }
          long long v19 = v46;
        }
        long long v20 = v17;
        goto LABEL_9;
      }
      long long v22 = [v16 type];
      int v23 = [v22 isEqualToString:v50];

      if (v23)
      {
        id v24 = v16;
        BOOL v18 = [[CAMTextRegionResult alloc] initWithTextRegionObject:v24];
        [v49 addObject:v18];
      }
      else
      {
        uint64_t v25 = [v16 type];
        int v26 = [v25 isEqualToString:v44];

        if (v26)
        {
          BOOL v18 = v16;
          uint64_t v27 = [[CAMHistogramResult alloc] initWithHistogramObject:v18 forDeviceFormat:v47];

          uint64_t v48 = v27;
          goto LABEL_38;
        }
        BOOL v18 = (CAMFaceResult *)os_log_create("com.apple.camera", "Camera");
        if (!os_log_type_enabled(&v18->super, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_38;
        }
        uint64_t v29 = objc_opt_class();
        id v24 = [v16 type];
        *(_DWORD *)buf = 138543618;
        uint64_t v65 = v29;
        __int16 v66 = 2114;
        id v67 = v24;
        _os_log_impl(&dword_2099F8000, &v18->super, OS_LOG_TYPE_DEFAULT, "Unhandled metadata object %{public}@/%{public}@", buf, 0x16u);
      }

LABEL_38:
      id v14 = v51;
LABEL_14:

      ++v15;
    }
    while (v12 != v15);
    uint64_t v30 = [v10 countByEnumeratingWithState:&v60 objects:v68 count:16];
    uint64_t v12 = v30;
  }
  while (v30);
LABEL_42:

  [v43 count];
  [(CUCaptureController *)self _burstController];
  v32 = uint64_t v31 = v14;
  [v32 processFaceResults:v8];
  char v55 = v10;
  uint64_t v56 = v8;
  uint64_t v57 = v9;
  char v58 = v31;
  uint64_t v59 = v53;
  uint64_t v52 = v48;
  id v54 = v53;
  id v33 = v31;
  id v34 = v9;
  id v35 = v8;
  id v36 = v49;
  id v37 = v45;
  id v38 = v10;
  id v39 = v46;
  id v40 = v43;
  pl_dispatch_async();
}

void __81__CUCaptureController_metadataWasRecognized_forMetadataObjectTypes_deviceFormat___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 120))
  {
    int v2 = [*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9F08]];
    if (([*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9EE0]] & 1) != 0
      || ([*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9EA8]] & 1) != 0)
    {
      int v3 = 1;
    }
    else
    {
      int v3 = [*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9F10]];
    }
    int v4 = [*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9F40]];
    int v5 = [*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9E98]];
    int v6 = [*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9F50]];
    int v7 = [*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9F48]];
    if (([*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9F20]] & 1) == 0
      && ([*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9EB0]] & 1) == 0)
    {
      int v8 = [*(id *)(a1 + 32) containsObject:*MEMORY[0x263EF9EE8]];
      if (((v2 | v3 | v7) & 1) == 0 && !v8)
      {
        if (!v4) {
          goto LABEL_13;
        }
        goto LABEL_24;
      }
    }
  }
  else
  {
    if ([*(id *)(a1 + 40) count]) {
      LOBYTE(v4) = 1;
    }
    else {
      LOBYTE(v4) = [*(id *)(a1 + 48) count] == 0;
    }
    if ([*(id *)(a1 + 56) count]) {
      int v5 = 1;
    }
    else {
      int v5 = [*(id *)(a1 + 48) count] == 0;
    }
    if ([*(id *)(a1 + 64) count]) {
      int v6 = 1;
    }
    else {
      int v6 = [*(id *)(a1 + 48) count] == 0;
    }
  }
  id v10 = [*(id *)(a1 + 72) facesDelegate];
  [v10 captureController:*(void *)(a1 + 72) didOutputFaceResults:*(void *)(a1 + 80) headResults:*(void *)(a1 + 88) bodyResults:*(void *)(a1 + 96) salientObjectResults:*(void *)(a1 + 104)];

  if ((v4 & 1) == 0)
  {
LABEL_13:
    if (v5) {
      goto LABEL_14;
    }
LABEL_25:
    if (!v6) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v11 = [*(id *)(a1 + 72) machineReadableCodeDelegate];
  [v11 captureController:*(void *)(a1 + 72) didOutputQRCodeResults:*(void *)(a1 + 40)];

  if ((v5 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_14:
  id v9 = [*(id *)(a1 + 72) machineReadableCodeDelegate];
  [v9 captureController:*(void *)(a1 + 72) didOutputAppClipCodeResults:*(void *)(a1 + 56)];

  if (v6)
  {
LABEL_26:
    uint64_t v12 = [*(id *)(a1 + 72) textRegionResultDelegate];
    [v12 captureController:*(void *)(a1 + 72) didOutputTextRegionResults:*(void *)(a1 + 64)];
  }
LABEL_27:
  if (*(void *)(a1 + 112))
  {
    id v13 = [*(id *)(a1 + 72) histogramDelegate];
    [v13 captureController:*(void *)(a1 + 72) didOutputHistogramResult:*(void *)(a1 + 112)];
  }
}

- (void)_subjectAreaDidChange:(id)a3
{
}

- (void)queryVideoDimensionsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  int v5 = [(CUCaptureController *)self _captureEngine];
  int v6 = [CAMQueryVideoDimensionsCommand alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__CUCaptureController_queryVideoDimensionsWithCompletionBlock___block_invoke;
  v9[3] = &unk_263FA4868;
  id v10 = v4;
  id v7 = v4;
  int v8 = [(CAMQueryVideoDimensionsCommand *)v6 initWithCompletionBlock:v9];
  [v5 enqueueCommand:v8];
}

void __63__CUCaptureController_queryVideoDimensionsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  pl_dispatch_async();
}

uint64_t __63__CUCaptureController_queryVideoDimensionsWithCompletionBlock___block_invoke_2(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[5], a1[6]);
  }
  return result;
}

- (void)queryTimelapseDimensionsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  int v5 = [(CUCaptureController *)self _captureEngine];
  int v6 = [CAMQueryTimelapseDimensionsCommand alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__CUCaptureController_queryTimelapseDimensionsWithCompletionBlock___block_invoke;
  v9[3] = &unk_263FA48B8;
  id v10 = v4;
  id v7 = v4;
  int v8 = [(CAMQueryTimelapseDimensionsCommand *)v6 initWithCompletionBlock:v9];
  [v5 enqueueCommand:v8];
}

void __67__CUCaptureController_queryTimelapseDimensionsWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 32);
  pl_dispatch_async();
}

uint64_t __67__CUCaptureController_queryTimelapseDimensionsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, void))(result + 16))(result, *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
  }
  return result;
}

- (void)willPerformRecoveryFromRuntimeError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __59__CUCaptureController_willPerformRecoveryFromRuntimeError___block_invoke;
  v6[3] = &unk_263FA0408;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  cam_perform_on_main_asap(v6);
}

void __59__CUCaptureController_willPerformRecoveryFromRuntimeError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recoveryDelegate];
  [v2 captureController:*(void *)(a1 + 32) willRecoverFromRuntimeError:*(void *)(a1 + 40)];
}

- (void)startCaptureSessionWithRetryCount:(unint64_t)a3 retryInterval:(double)a4 logReason:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [(CUCaptureController *)self _captureEngine];
  [v12 startWithRetryCount:a3 retryInterval:v11 logReason:v10 completion:a4];
}

- (void)startCaptureSession
{
}

- (void)stopCaptureSessionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CUCaptureController *)self _captureEngine];
  [v5 stopWithCompletion:v4];
}

- (void)stopCaptureSession
{
}

- (void)cancelAutoResumeAfterDate:(id)a3
{
  id v4 = a3;
  id v5 = [(CUCaptureController *)self _captureEngine];
  [v5 cancelAutoResumeAfterDate:v4];
}

- (void)attemptToEndInterruptions
{
  if ([(CUCaptureController *)self isInterrupted])
  {
    id v3 = [(CUCaptureController *)self _captureEngine];
    [v3 startWithRetryCount:0 retryInterval:@"attemptToEndInterruptions" logReason:0 completion:0.0];
  }
}

- (void)handleSessionInterruptionEnded
{
}

uint64_t __53__CUCaptureController_handleSessionInterruptionEnded__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interruptionDelegate];
  if (v2)
  {
    id v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 captureControllerInterruptionEnded:*(void *)(a1 + 32)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (void)unregisterCaptureService:(id)a3
{
  id v4 = a3;
  id v5 = [(CUCaptureController *)self _captureEngine];
  [v5 unregisterCaptureService:v4];
}

- (void)registerEffectsPreviewSampleBufferDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CUCaptureController *)self _captureEngine];
  [v5 registerEffectsPreviewSampleBufferDelegate:v4];
}

- (void)unregisterEffectsPreviewSampleBufferDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CUCaptureController *)self _captureEngine];
  [v5 unregisterEffectsPreviewSampleBufferDelegate:v4];
}

- (void)registerVideoThumbnailContentsDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CUCaptureController *)self _captureEngine];
  [v5 registerVideoThumbnailContentsDelegate:v4];
}

- (void)unregisterVideoThumbnailContentsDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CUCaptureController *)self _captureEngine];
  [v5 unregisterVideoThumbnailContentsDelegate:v4];
}

- (void)changeToVideoZoomFactor:(double)a3 graphConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = [[CAMSetVideoZoomFactorCommand alloc] initWithVideoZoomFactor:v6 graphConfiguration:a3];

  [(CAMCaptureEngine *)self->__captureEngine enqueueCommand:v7];
}

- (void)startRampToVideoZoomFactor:(double)a3 withRate:(float)a4 graphConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = [CAMRampToVideoZoomFactorCommand alloc];
  *(float *)&double v10 = a4;
  id v11 = [(CAMRampToVideoZoomFactorCommand *)v9 initWithVideoZoomFactor:v8 rate:a3 graphConfiguration:v10];

  [(CAMCaptureEngine *)self->__captureEngine enqueueCommand:v11];
}

- (void)startRampToVideoZoomFactor:(double)a3 withDuration:(double)a4 zoomRampTuning:(int64_t)a5 graphConfiguration:(id)a6
{
  id v10 = a6;
  id v11 = [[CAMRampToVideoZoomFactorCommand alloc] initWithVideoZoomFactor:a5 duration:v10 zoomRampTuning:a3 graphConfiguration:a4];

  [(CAMCaptureEngine *)self->__captureEngine enqueueCommand:v11];
}

- (void)stopRampToVideoZoomFactor
{
  id v3 = objc_alloc_init(CAMCancelVideoZoomRampCommand);
  [(CAMCaptureEngine *)self->__captureEngine enqueueCommand:v3];
}

- (void)_teardownZoomMonitoring
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(CUCaptureController *)self _captureEngine];
  id v4 = [(CUCaptureController *)self _zoomMonitoringKeyPaths];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) context:CAMZoomResultContext];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void __68__CUCaptureController__zoomResultChangedForKeyPath_ofObject_change___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 184));
  [WeakRetained captureController:*(void *)(a1 + 32) didOutputMinAvailableVideoZoomFactor:*(double *)(a1 + 40)];
}

void __68__CUCaptureController__zoomResultChangedForKeyPath_ofObject_change___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 184));
  objc_msgSend(WeakRetained, "captureController:didChangeRampingVideoZoom:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "isRampingVideoZoom"));
}

- (void)_setupZoomPIPMonitoring
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 isZoomPIPSupported];

  if (v4)
  {
    id v6 = [(CUCaptureController *)self _captureEngine];
    uint64_t v5 = [v6 videoPreviewLayer];

    if (v5) {
      [v6 addObserver:self forKeyPath:@"videoPreviewLayer.zoomPictureInPictureOverlayRect" options:1 context:CAMPreviewZoomPIPContext];
    }
  }
}

- (void)_teardownZoomPIPMonitoring
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 isZoomPIPSupported];

  if (v4)
  {
    id v6 = [(CUCaptureController *)self _captureEngine];
    uint64_t v5 = [v6 videoPreviewLayer];

    if (v5) {
      [v6 removeObserver:self forKeyPath:@"videoPreviewLayer.zoomPictureInPictureOverlayRect" context:CAMPreviewZoomPIPContext];
    }
  }
}

- (void)_zoomPIPChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [v9 videoPreviewLayer];
  long long v12 = [v10 objectForKeyedSubscript:*MEMORY[0x263F081B8]];

  if (v12) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if ([v8 isEqualToString:@"videoPreviewLayer.zoomPictureInPictureOverlayRect"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 CGRectValue];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __65__CUCaptureController__zoomPIPChangedForKeyPath_ofObject_change___block_invoke;
        v18[3] = &unk_263FA06F8;
        void v18[4] = self;
        void v18[5] = v14;
        v18[6] = v15;
        v18[7] = v16;
        v18[8] = v17;
        cam_perform_on_main_asap(v18);
      }
    }
  }
}

void __65__CUCaptureController__zoomPIPChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) zoomDelegate];
  objc_msgSend(v2, "captureController:didChangePreviewZoomPIPRect:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)changeToPortraitAperture:(double)a3
{
  uint64_t v5 = [[CAMPortraitApertureCommand alloc] initWithAperture:a3];
  int v4 = [(CUCaptureController *)self _captureEngine];
  [v4 enqueueCommand:v5];
}

- (void)_handleShallowDepthOfFieldStatusChangedNotification:(id)a3
{
  id v3 = [a3 userInfo];
  int v4 = [v3 objectForKeyedSubscript:@"AVCaptureDeviceShallowDepthOfFieldStatusChangedKeyEffectStatus"];
  +[CAMCaptureConversions shallowDepthOfFieldStatusForCaptureStatus:](CAMCaptureConversions, "shallowDepthOfFieldStatusForCaptureStatus:", [v4 integerValue]);
  uint64_t v5 = [v3 objectForKeyedSubscript:@"AVCaptureDeviceShallowDepthOfFieldStatusChangedKeyStagePreviewStatus"];
  +[CAMCaptureConversions stagePreviewStatusForCaptureStatus:](CAMCaptureConversions, "stagePreviewStatusForCaptureStatus:", [v5 integerValue]);
  pl_dispatch_async();
}

void __75__CUCaptureController__handleShallowDepthOfFieldStatusChangedNotification___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) shallowDepthOfFieldStatusDelegate];
  [v2 captureController:*(void *)(a1 + 32) didOutputShallowDepthOfFieldStatus:*(void *)(a1 + 40) stagePreviewStatus:*(void *)(a1 + 48)];
}

- (void)changeToPortraitLightingEffectStrength:(double)a3
{
  uint64_t v5 = [[CAMPortraitLightingEffectStrengthCommand alloc] initWithEffectStrength:a3];
  int v4 = [(CUCaptureController *)self _captureEngine];
  [v4 enqueueCommand:v5];
}

- (id)_systemPressureStateMonitoringKeyPaths
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"currentCameraDevice.systemPressureState";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)_teardownSystemPressureStateMonitoring
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(CUCaptureController *)self _shouldMonitorSystemPressureState])
  {
    id v3 = [(CUCaptureController *)self _captureEngine];
    int v4 = [(CUCaptureController *)self _systemPressureStateMonitoringKeyPaths];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) context:CAMSystemPressureStateMonitoringContext];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)_systemPressureStateMonitoringChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v7 = a3;
  uint64_t v8 = [a5 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  if (v8)
  {
    long long v9 = [MEMORY[0x263EFF9D0] null];

    if (v8 != v9)
    {
      if ([v7 isEqualToString:@"currentCameraDevice.systemPressureState"])
      {
        id v10 = v8;
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __87__CUCaptureController__systemPressureStateMonitoringChangedForKeyPath_ofObject_change___block_invoke;
        v11[3] = &unk_263FA0408;
        id v12 = v10;
        BOOL v13 = self;
        cam_perform_on_main_asap(v11);
      }
    }
  }
}

void __87__CUCaptureController__systemPressureStateMonitoringChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2 = [[CAMSystemPressureState alloc] initWithCaptureSystemPressureState:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _handleSystemPressureState:v2];
}

- (void)_handleSystemPressureState:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_alloc_init(CAMSystemPressureMitigationCommand);
  uint64_t v5 = [(CUCaptureController *)self _captureEngine];
  [v5 enqueueCommand:v6];

  [(CUCaptureController *)self _setCurrentCameraSystemPressureState:v4];
}

- (void)_setCurrentCameraSystemPressureState:(id)a3
{
  uint64_t v5 = (CAMSystemPressureState *)a3;
  uint64_t v6 = v5;
  if (self->_currentCameraSystemPressureState != v5)
  {
    uint64_t v8 = v5;
    uint64_t v5 = (CAMSystemPressureState *)-[CAMSystemPressureState isEqual:](v5, "isEqual:");
    uint64_t v6 = v8;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentCameraSystemPressureState, a3);
      id v7 = [(CUCaptureController *)self systemPressureStateDelegate];
      [v7 captureController:self didChangeCameraSystemPressureState:v8];

      uint64_t v6 = v8;
    }
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)changeToAspectRatioCrop:(int64_t)a3
{
  uint64_t v5 = [[CAMNonDestructiveCropAspectRatioCommand alloc] initWithAspectRatioCrop:a3];
  id v4 = [(CUCaptureController *)self _captureEngine];
  [v4 enqueueCommand:v5];
}

- (void)setFallbackPrimaryConstituentDeviceSelection:(int64_t)a3
{
  uint64_t v5 = [[CAMFallbackPrimaryConstituentDeviceCommand alloc] initWithFallbackPrimaryConstituentDeviceSelection:a3];
  id v4 = [(CUCaptureController *)self _captureEngine];
  [v4 enqueueCommand:v5];
}

- (void)_setupStereoCaptureStatusMonitoring
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 isSpatialModeSupported];

  if (v4)
  {
    id v6 = [(CUCaptureController *)self _captureEngine];
    uint64_t v5 = [v6 videoPreviewLayer];

    if (v5) {
      [v6 addObserver:self forKeyPath:@"currentCameraDevice.stereoCaptureStatus" options:5 context:CAMStereoCaptureStatusContext];
    }
  }
}

- (void)_teardownStereoCaptureStatusMonitoring
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 isSpatialModeSupported];

  if (v4)
  {
    id v6 = [(CUCaptureController *)self _captureEngine];
    uint64_t v5 = [v6 videoPreviewLayer];

    if (v5) {
      [v6 removeObserver:self forKeyPath:@"currentCameraDevice.stereoCaptureStatus" context:CAMStereoCaptureStatusContext];
    }
  }
}

- (void)_stereoCaptureStatusChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v6 = a3;
  id v7 = [a5 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  if (v7
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v6 isEqualToString:@"currentCameraDevice.stereoCaptureStatus"])
  {
    +[CAMCaptureConversions CAMStereoCaptureStatusForAVStereoCaptureStatus:](CAMCaptureConversions, "CAMStereoCaptureStatusForAVStereoCaptureStatus:", [v7 integerValue]);
    pl_dispatch_async();
  }
}

void __77__CUCaptureController__stereoCaptureStatusChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stereoCaptureStatusDelegate];
  [v2 captureController:*(void *)(a1 + 32) didOutputStereoCaptureStatus:*(void *)(a1 + 40)];
}

- (void)_setupStereoVideoCaptureStatusMonitoring
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 isSpatialVideoCaptureSupported];

  if (v4)
  {
    id v6 = [(CUCaptureController *)self _captureEngine];
    uint64_t v5 = [v6 videoPreviewLayer];

    if (v5) {
      [v6 addObserver:self forKeyPath:@"currentCameraDevice.stereoVideoCaptureStatus" options:5 context:CAMStereoVideoCaptureStatusContext];
    }
  }
}

- (void)_teardownStereoVideoCaptureStatusMonitoring
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = [v3 isSpatialVideoCaptureSupported];

  if (v4)
  {
    id v6 = [(CUCaptureController *)self _captureEngine];
    uint64_t v5 = [v6 videoPreviewLayer];

    if (v5) {
      [v6 removeObserver:self forKeyPath:@"currentCameraDevice.stereoVideoCaptureStatus" context:CAMStereoVideoCaptureStatusContext];
    }
  }
}

- (void)_stereoVideoCaptureStatusChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v6 = a3;
  id v7 = [a5 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  if (v7
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v6 isEqualToString:@"currentCameraDevice.stereoVideoCaptureStatus"])
  {
    +[CAMCaptureConversions CAMStereoCaptureStatusForAVStereoVideoCaptureStatus:](CAMCaptureConversions, "CAMStereoCaptureStatusForAVStereoVideoCaptureStatus:", [v7 integerValue]);
    pl_dispatch_async();
  }
}

void __82__CUCaptureController__stereoVideoCaptureStatusChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stereoCaptureStatusDelegate];
  [v2 captureController:*(void *)(a1 + 32) didOutputStereoCaptureStatus:*(void *)(a1 + 40)];
}

- (void)_startCaptureSignpostIntervalForPersistenceUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CUCaptureController *)self _persistenceUUIDToSignpostID];
    id v6 = [v5 objectForKeyedSubscript:v4];

    if (!v6)
    {
      unint64_t v7 = [(CUCaptureController *)self _nextSignpostID];
      [(CUCaptureController *)self _setNextSignpostID:v7 + 1];
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
      [v5 setObject:v8 forKeyedSubscript:v4];

      CAMSignpostWithIDAndArgs(66, v7, v7, 0, 0, 0);
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController _startCaptureSignpostIntervalForPersistenceUUID:]();
    }
  }
}

- (void)_endCaptureSignpostIntervalForPersistenceUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CUCaptureController *)self _persistenceUUIDToSignpostID];
    id v6 = [v5 objectForKeyedSubscript:v4];
    if (v6)
    {
      [v5 setObject:0 forKeyedSubscript:v4];
      uint64_t v7 = [v6 unsignedIntegerValue];
      CAMSignpostWithIDAndArgs(67, v7, v7, 0, 0, 0);
    }
    else
    {
      uint64_t v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CUCaptureController _endCaptureSignpostIntervalForPersistenceUUID:]((uint64_t)v4, v8);
      }
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CUCaptureController _startCaptureSignpostIntervalForPersistenceUUID:]();
    }
  }
}

- (void)_setupDocumentScanningMonitoring
{
  id v4 = +[CAMCaptureCapabilities capabilities];
  if ([v4 isDocumentScanningSupported])
  {
    id v3 = [(CUCaptureController *)self _captureEngine];
    [v3 addObserver:self forKeyPath:@"currentCameraDevice.documentSceneConfidence" options:3 context:CAMDocumentScanningResultsContext];
  }
}

- (void)_tearDownDocumentScanningMonitoring
{
  id v4 = +[CAMCaptureCapabilities capabilities];
  if ([v4 isDocumentScanningSupported])
  {
    id v3 = [(CUCaptureController *)self _captureEngine];
    [v3 removeObserver:self forKeyPath:@"currentCameraDevice.documentSceneConfidence" context:CAMDocumentScanningResultsContext];
  }
}

- (void)_documentScanningChangedForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5
{
  id v6 = objc_msgSend(a4, "currentCameraDevice", a3);
  [v6 documentSceneConfidence];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__CUCaptureController__documentScanningChangedForKeyPath_ofObject_change___block_invoke;
  v8[3] = &unk_263FA48E0;
  v8[4] = self;
  int v9 = v7;
  cam_perform_on_main_asap(v8);
}

void __74__CUCaptureController__documentScanningChangedForKeyPath_ofObject_change___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) documentSceneResultDelegate];
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  [v3 captureController:*(void *)(a1 + 32) didChangeDocumentSceneConfidenceResults:v2];
}

- (void)updateCaptureButtonControlsForCaptureMode:(int64_t)a3 devicePosition:(int64_t)a4 isRecording:(BOOL)a5
{
  int v7 = [[CAMUpdateCaptureButtonControlsCommand alloc] initWithRecording:a5 captureMode:a3 devicePosition:a4];
  id v6 = [(CUCaptureController *)self _captureEngine];
  [v6 enqueueCommand:v7];
}

- (void)stopMonitoringForAccidentalLaunch
{
  id v2 = [(CUCaptureController *)self _captureEngine];
  [v2 stopMonitoringForAccidentalLaunch];
}

- (CAMPreviewLayerOverCaptureStatusDelegate)previewLayerOverCaptureStatusDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewLayerOverCaptureStatusDelegate);
  return (CAMPreviewLayerOverCaptureStatusDelegate *)WeakRetained;
}

- (void)setPreviewLayerOverCaptureStatusDelegate:(id)a3
{
}

- (CAMStillImageCapturingVideoDelegate)stillImageCapturingVideoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stillImageCapturingVideoDelegate);
  return (CAMStillImageCapturingVideoDelegate *)WeakRetained;
}

- (int64_t)lowLightStatus
{
  return self->_lowLightStatus;
}

- (void)_setLowLightStatus:(int64_t)a3
{
  self->_lowLightStatus = a3;
}

- (BOOL)videoCapturePaused
{
  return self->_videoCapturePaused;
}

- (void)_setVideoCapturePaused:(BOOL)a3
{
  self->_videoCapturePaused = a3;
}

- (void)setPanoramaChangeDelegate:(id)a3
{
}

- (CAMBurstDelegate)burstDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_burstDelegate);
  return (CAMBurstDelegate *)WeakRetained;
}

- (BOOL)isTorchActive
{
  return self->_torchActive;
}

- (unint64_t)flashCompromise
{
  return self->_flashCompromise;
}

- (void)_setFlashCompromise:(unint64_t)a3
{
  self->_flashCompromise = a3;
}

- (BOOL)isAutoMacroActive
{
  return self->_autoMacroActive;
}

- (void)setAutoMacroActive:(BOOL)a3
{
  self->_autoMacroActive = a3;
}

- (BOOL)isAutoMacroSuggested
{
  return self->_autoMacroSuggested;
}

- (void)setAutoMacroSuggested:(BOOL)a3
{
  self->_autoMacroSuggested = a3;
}

- (CAMDocumentSceneResultDelegate)documentSceneResultDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentSceneResultDelegate);
  return (CAMDocumentSceneResultDelegate *)WeakRetained;
}

- (void)setDocumentSceneResultDelegate:(id)a3
{
}

- (CAMShallowDepthOfFieldStatusDelegate)shallowDepthOfFieldStatusDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shallowDepthOfFieldStatusDelegate);
  return (CAMShallowDepthOfFieldStatusDelegate *)WeakRetained;
}

- (CAMFacesDelegate)facesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_facesDelegate);
  return (CAMFacesDelegate *)WeakRetained;
}

- (void)setFacesDelegate:(id)a3
{
}

- (CAMMachineReadableCodeDelegate)machineReadableCodeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_machineReadableCodeDelegate);
  return (CAMMachineReadableCodeDelegate *)WeakRetained;
}

- (CAMHistogramDelegate)histogramDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_histogramDelegate);
  return (CAMHistogramDelegate *)WeakRetained;
}

- (void)setHistogramDelegate:(id)a3
{
}

- (CAMTextRegionResultDelegate)textRegionResultDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textRegionResultDelegate);
  return (CAMTextRegionResultDelegate *)WeakRetained;
}

- (void)setTextRegionResultDelegate:(id)a3
{
}

- (void)setResultDelegate:(id)a3
{
}

- (CAMZoomDelegate)zoomDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoomDelegate);
  return (CAMZoomDelegate *)WeakRetained;
}

- (BOOL)isRampingVideoZoom
{
  return self->_rampingVideoZoom;
}

- (void)setRampingVideoZoom:(BOOL)a3
{
  self->_rampingVideoZoom = a3;
}

- (CAMControlsDelegate)controlsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlsDelegate);
  return (CAMControlsDelegate *)WeakRetained;
}

- (void)setControlsDelegate:(id)a3
{
}

- (CAMCaptureRecoveryDelegate)recoveryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recoveryDelegate);
  return (CAMCaptureRecoveryDelegate *)WeakRetained;
}

- (CAMSystemPressureState)currentCameraSystemPressureState
{
  return self->_currentCameraSystemPressureState;
}

- (CAMCaptureControllerSystemPressureStateDelegate)systemPressureStateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPressureStateDelegate);
  return (CAMCaptureControllerSystemPressureStateDelegate *)WeakRetained;
}

- (void)setSystemPressureStateDelegate:(id)a3
{
}

- (CAMStereoCaptureStatusDelegate)stereoCaptureStatusDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stereoCaptureStatusDelegate);
  return (CAMStereoCaptureStatusDelegate *)WeakRetained;
}

- (void)setStereoCaptureStatusDelegate:(id)a3
{
}

- (CAMStillImageCaptureRequest)_capturingCTMVideoRequest
{
  return self->__capturingCTMVideoRequest;
}

- (CAMVideoCaptureRequest)_pendingVideoCaptureRequest
{
  return self->__pendingVideoCaptureRequest;
}

- (void)_setPendingVideoCaptureRequest:(id)a3
{
}

- (BOOL)_isWaitingForRecordingToStart
{
  return self->__waitingForRecordingToStart;
}

- (void)_setWaitingForRecordingToStart:(BOOL)a3
{
  self->__waitingForRecordingToStart = a3;
}

- (void)_setCapturingPanoramaRequest:(id)a3
{
}

- (CAMStillImageCaptureRequest)_capturingLowLightStillImageRequest
{
  return self->__capturingLowLightStillImageRequest;
}

- (void)_setCapturingLowLightStillImageRequest:(id)a3
{
}

- (void)_setCurrentBurstIntervalometer:(id)a3
{
}

- (BOOL)_didCompleteInitialConfiguration
{
  return self->__didCompleteInitialConfiguration;
}

- (void)_setDidCompleteInitialConfiguration:(BOOL)a3
{
  self->__didCompleteInitialConfiguration = a3;
}

- (BOOL)_isVideoCaptureAvailable
{
  return self->__isVideoCaptureAvailable;
}

- (NSMutableSet)_identifiersForActiveLivePhotoVideoCaptures
{
  return self->__identifiersForActiveLivePhotoVideoCaptures;
}

- (NSMutableSet)_identifiersForActiveCTMVideoCaptures
{
  return self->__identifiersForActiveCTMVideoCaptures;
}

- (NSMutableDictionary)_persistenceUUIDToSignpostID
{
  return self->__persistenceUUIDToSignpostID;
}

- (unint64_t)_nextSignpostID
{
  return self->__nextSignpostID;
}

- (void)_setNextSignpostID:(unint64_t)a3
{
  self->__nextSignpostID = a3;
}

- (PLCameraDeferredProcessingCoordinator)_deferredProcessingCoordinator
{
  return self->__deferredProcessingCoordinator;
}

- (void)_setDeferredProcessingCoordinator:(id)a3
{
}

- (CAMLocationController)_locationController
{
  return self->__locationController;
}

- (CAMBurstController)_burstController
{
  return self->__burstController;
}

- (CAMProtectionController)_protectionController
{
  return self->__protectionController;
}

- (CAMIrisVideoController)_irisVideoController
{
  return self->__irisVideoController;
}

- (CAMRemoteShutterController)_remoteShutterController
{
  return self->__remoteShutterController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__remoteShutterController, 0);
  objc_storeStrong((id *)&self->__irisVideoController, 0);
  objc_storeStrong((id *)&self->__powerController, 0);
  objc_storeStrong((id *)&self->__protectionController, 0);
  objc_storeStrong((id *)&self->__burstController, 0);
  objc_storeStrong((id *)&self->__motionController, 0);
  objc_storeStrong((id *)&self->__locationController, 0);
  objc_storeStrong((id *)&self->__deferredProcessingCoordinator, 0);
  objc_storeStrong((id *)&self->__persistenceUUIDToSignpostID, 0);
  objc_storeStrong((id *)&self->__identifiersForActiveCTMVideoCaptures, 0);
  objc_storeStrong((id *)&self->__identifiersForActiveLivePhotoVideoCaptures, 0);
  objc_storeStrong((id *)&self->__numberOfInflightRequestsByType, 0);
  objc_storeStrong((id *)&self->__exposureCoalescer, 0);
  objc_storeStrong((id *)&self->__focusCoalescer, 0);
  objc_storeStrong((id *)&self->_currentBurstIntervalometer, 0);
  objc_storeStrong((id *)&self->__capturingLowLightStillImageRequest, 0);
  objc_storeStrong((id *)&self->__capturingPanoramaRequest, 0);
  objc_storeStrong((id *)&self->__pendingVideoCaptureRequest, 0);
  objc_storeStrong((id *)&self->__capturingVideoRequest, 0);
  objc_storeStrong((id *)&self->__capturingCTMVideoRequest, 0);
  objc_storeStrong((id *)&self->__responseThumbnailGenerator, 0);
  objc_storeStrong((id *)&self->__responseQueue, 0);
  objc_storeStrong((id *)&self->__captureEngine, 0);
  objc_destroyWeak((id *)&self->_stereoCaptureStatusDelegate);
  objc_destroyWeak((id *)&self->_systemPressureStateDelegate);
  objc_storeStrong((id *)&self->_currentCameraSystemPressureState, 0);
  objc_destroyWeak((id *)&self->_interruptionDelegate);
  objc_destroyWeak((id *)&self->_runningDelegate);
  objc_destroyWeak((id *)&self->_recoveryDelegate);
  objc_destroyWeak((id *)&self->_controlsDelegate);
  objc_destroyWeak((id *)&self->_zoomDelegate);
  objc_destroyWeak((id *)&self->_resultDelegate);
  objc_destroyWeak((id *)&self->_textRegionResultDelegate);
  objc_destroyWeak((id *)&self->_histogramDelegate);
  objc_destroyWeak((id *)&self->_machineReadableCodeDelegate);
  objc_destroyWeak((id *)&self->_facesDelegate);
  objc_destroyWeak((id *)&self->_shallowDepthOfFieldStatusDelegate);
  objc_destroyWeak((id *)&self->_exposureDelegate);
  objc_destroyWeak((id *)&self->_focusDelegate);
  objc_destroyWeak((id *)&self->_documentSceneResultDelegate);
  objc_destroyWeak((id *)&self->_availabilityDelegate);
  objc_destroyWeak((id *)&self->_suggestionDelegate);
  objc_destroyWeak((id *)&self->_configurationDelegate);
  objc_destroyWeak((id *)&self->_burstDelegate);
  objc_destroyWeak((id *)&self->_panoramaChangeDelegate);
  objc_destroyWeak((id *)&self->_stillImageCapturingVideoDelegate);
  objc_destroyWeak((id *)&self->_previewLayerOverCaptureStatusDelegate);
  objc_storeStrong((id *)&self->_panoramaPreviewView, 0);
}

- (void)cancelCTMCaptureForSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Cannot cancel CTM capture with nil settings", v2, v3, v4, v5, v6);
}

- (void)captureStillImageWithRequest:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_2099F8000, v3, v4, "Failed to capture still image with request %{public}@ (%{public}@)", v5, v6, v7, v8, v9);
}

- (void)stillImageRequest:(void *)a1 didCompleteVideoCaptureWithResult:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 error];
  uint64_t v4 = [v3 localizedDescription];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Error: \"%{public}@\" on CAMVideoCaptureResult occurred", (uint8_t *)&v5, 0xCu);
}

- (void)_beginTrackingLivePhotoVideoRecordingForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Cannot track live photo video recording for nil identifier", v2, v3, v4, v5, v6);
}

- (void)_endTrackingLivePhotoVideoRecordingForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Cannot end tracking live photo video recording for nil identifier", v2, v3, v4, v5, v6);
}

- (void)_beginTrackingCTMVideoRecordingForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Cannot track CTM video recording for nil identifier", v2, v3, v4, v5, v6);
}

- (void)_endTrackingCTMVideoRecordingForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Cannot end tracking CTM video recording for nil identifier", v2, v3, v4, v5, v6);
}

- (void)startCapturingVideoWithRequest:(uint64_t)a1 error:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_2099F8000, v3, v4, "Failed to start video capture with request %{public}@: (%{public}@)", v5, v6, v7, v8, v9);
}

- (void)_handleCaptureEngineExecutionNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "CAMModeAndDeviceCommand configuration failed! (%{public}@)", (uint8_t *)&v2, 0xCu);
}

- (void)_startCaptureSignpostIntervalForPersistenceUUID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "No persistenceUUID for tracking signposts", v2, v3, v4, v5, v6);
}

- (void)_endCaptureSignpostIntervalForPersistenceUUID:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "No signpostID found for persistenceUUID %{public}@", (uint8_t *)&v2, 0xCu);
}

@end