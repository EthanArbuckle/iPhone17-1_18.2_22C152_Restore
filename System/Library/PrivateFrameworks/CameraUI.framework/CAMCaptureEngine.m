@interface CAMCaptureEngine
+ (id)_cacheKeyForDeviceType:(id)a3 position:(int64_t)a4;
+ (void)preheatCaptureResources;
- ($42FF7B9720B8FFE93045C4EB8F3F13A3)_previewFilterSetForRequest:(SEL)a3 photo:(id)a4;
- ($42FF7B9720B8FFE93045C4EB8F3F13A3)_previewFilterSetForRequest:(SEL)a3 previewSize:(id)a4;
- (AVCaptureDevice)currentCameraDevice;
- (AVCapturePhotoOutput)currentStillImageOutput;
- (AVCaptureSession)_captureSession;
- (AVCaptureVideoPreviewLayer)_videoPreviewLayer;
- (AVCaptureVideoPreviewLayer)videoPreviewLayer;
- (AVSpatialOverCaptureVideoPreviewLayer)_overCaptureVideoPreviewLayer;
- (BOOL)_cameraTransitionInProcess;
- (BOOL)_isPerformingRecovery;
- (BOOL)_isSessionModificationRequiredByCommand:(id)a3 logReason:(id *)a4 minimumExecutionTime:(double *)a5;
- (BOOL)_lockAllEngineManagedDevices;
- (BOOL)_lockManagedCapturedDevice:(id)a3;
- (BOOL)_shouldStartSessionOnConfigurationChanges;
- (BOOL)_updatePanoramaSubgraphForEnteringBackground:(BOOL)a3;
- (BOOL)areManagedDevicesLockedForConfiguration;
- (BOOL)controlsSupported;
- (BOOL)isInterrupted;
- (CAMCaptureEngine)initWithPowerController:(id)a3 captureController:(id)a4 options:(int64_t)a5;
- (CAMMemoizationCache)_captureEngineDeviceCache;
- (CAMPanoramaProcessor)_panoramaProcessor;
- (CAMPowerController)_powerController;
- (CIContext)_effectsPreviewSurfaceFilteringContext;
- (CUCaptureController)_captureController;
- (FBSDisplayLayoutMonitor)_layoutMonitor;
- (NSDate)_lastTapToRadarTime;
- (NSHashTable)_effectsPreviewSampleBufferDelegates;
- (NSHashTable)_videoThumbnailContentsDelegates;
- (NSMutableArray)_servicesQueueCaptureServices;
- (NSMutableDictionary)_resultsQueueRegisteredStillImageRequests;
- (NSMutableDictionary)_resultsQueueRequestsBeingRecorded;
- (NSMutableDictionary)_sessionQueueCachedPhotoInitiationSettings;
- (NSMutableSet)_didEmitCaptureIntervalStartedSignpostsForUniqueID;
- (NSMutableSet)_resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue;
- (NSString)_accidentalLaunchPrewarmReason;
- (NSURL)_resultsQueueLastCompletedVideoURL;
- (OS_dispatch_queue)_captureResultsQueue;
- (OS_dispatch_queue)_captureServicesQueue;
- (OS_dispatch_queue)_captureSessionQueue;
- (OS_dispatch_queue)_effectsPreviewSampleBufferQueue;
- (OS_dispatch_queue)_effectsPreviewSurfaceFilteringQueue;
- (OS_dispatch_queue)_metadataObjectsQueue;
- (OS_dispatch_queue)_panoramaFirstImageQueueUpdateSemaphoreQueue;
- (OS_dispatch_queue)_panoramaSampleBufferQueue;
- (OS_dispatch_queue)_panoramaSubgraphQueue;
- (OS_dispatch_queue)_recoveryMutexQueue;
- (OS_dispatch_queue)_signpostMutexQueue;
- (OS_dispatch_semaphore)_panoramaFirstImageQueueUpdateSemaphore;
- (_CAImageQueue)_panoramaImageQueue;
- (__CVBuffer)_createOutputPixelBufferWithSize:(CGSize)a3 matchingInputPixelBuffer:(__CVBuffer *)a4;
- (__CVBuffer)_newFilteredPixelBufferFromPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4 filters:(id)a5;
- (double)_accidentalLaunchPrewarmTime;
- (double)_accidentalLaunchTimeout;
- (double)_delayForRecoveryAttempt:(unint64_t)a3;
- (double)_resultsQueueLastCompletedVideoZoomFactor;
- (id)_TTRKeywordIDsFromCaptureRequest:(id)a3;
- (id)_accumulatedUserInfoFromCommand:(id)a3;
- (id)_captureEngineDeviceForDeviceType:(id)a3 position:(int64_t)a4;
- (id)_coordinationInfoForCTMVideoRequest:(id)a3 videoOutputURL:(id)a4 resolvedMomentCaptureMovieSettings:(id)a5;
- (id)_coordinationInfoForRequest:(id)a3 photo:(id)a4;
- (id)_coordinationInfoForRequest:(id)a3 resolvedSettings:(id)a4 videoComplementURL:(id)a5 isFiltered:(BOOL)a6;
- (id)_currentNotificationCenter;
- (id)_expectedResultSpecifiersForResolvedMomentCaptureMovieSettings:(id)a3;
- (id)_expectedResultSpecifiersForResolvedPhotoSettings:(id)a3;
- (id)_photoOutputFromSession:(id)a3;
- (id)_previewFiltersForFilterSet:(id *)a3;
- (id)_validateVideoAtURL:(id)a3 forCaptureRequest:(id)a4 captureID:(int64_t)a5 captureError:(id)a6 isVideoComplement:(BOOL)a7 stillImageDisplayTime:(id *)a8 reportedDuration:(id *)a9 outActualDuration:(id *)a10 outVideoRecordingStoppedReason:(int64_t *)a11 outSlowWriterFrameDrops:(BOOL *)a12;
- (id)_videoDeviceInputFromSession:(id)a3;
- (id)apertureSlider;
- (id)audioCaptureDevice;
- (id)audioCaptureDeviceInput;
- (id)backCameraDevice;
- (id)backDualCameraDevice;
- (id)backSuperWideCameraDevice;
- (id)backTelephotoCameraDevice;
- (id)backTripleCameraDevice;
- (id)backWideDualCameraDevice;
- (id)cachedMomentCaptureSettingsForIdentifier:(id)a3;
- (id)colorBiasSlider;
- (id)creativeStylePicker;
- (id)effectsPreviewVideoDataOutput;
- (id)emulatedZoomSlider;
- (id)frontCameraDevice;
- (id)frontPearlCameraDevice;
- (id)frontSuperWideCameraDevice;
- (id)intensitySlider;
- (id)metadataOutput;
- (id)movieFileOutput;
- (id)overCaptureVideoPreviewLayer;
- (id)panoramaVideoDataOutput;
- (id)prewarmedAudioDeviceInput:(id)a3 device:(id)a4;
- (id)prewarmedCaptureSession;
- (id)prewarmedVideoDeviceInput:(id)a3 position:(int64_t)a4 device:(id)a5;
- (id)stillImageOutput;
- (id)stylePickerIncludingSystemStyles:(BOOL)a3 resolvedSystemStyle:(id)a4 creativeStyles:(BOOL)a5;
- (id)systemPreferredCameraDevice;
- (id)systemStylePicker;
- (id)toneBiasSlider;
- (id)videoThumbnailOutput;
- (int64_t)_engineOptions;
- (int64_t)_notificationForError:(__CFString *)a3;
- (unint64_t)_numberOfRecoveryAttempts;
- (unsigned)_panoramaAssertionIdentifier;
- (void)_beginSessionConfigurationIfRequiredByCommand:(id)a3 withContext:(id)a4 logReason:(id *)a5 minimumExecutionTime:(double *)a6;
- (void)_cancelDelayedSessionNonstartRecovery;
- (void)_captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 forVideoCaptureRequest:(id)a6 videoZoomFactor:(double)a7 error:(id)a8;
- (void)_checkCallbacksForUniqueID:(int64_t)a3 afterDelay:(double)a4 startTime:(double)a5;
- (void)_commitSessionConfigurationIfNecessaryWithLogReason:(id)a3;
- (void)_didFinishStillImageCaptureForUniqueID:(int64_t)a3 error:(id)a4;
- (void)_ensureApertureSliderForGraphConfiguration:(id)a3;
- (void)_ensureEmulatedZoomSliderForGraphConfiguration:(id)a3;
- (void)_enumerateCaptureServicesUsingBlock:(id)a3;
- (void)_enumerateCaptureServicesUsingBlock:(id)a3 completion:(id)a4;
- (void)_executeCommand:(id)a3 withContext:(id)a4;
- (void)_handleApplicationDidEnterBackground:(id)a3;
- (void)_handleApplicationWillEnterForeground:(id)a3;
- (void)_handleCaptureOutputDidFinishCapturingPhoto:(id)a3 deferredPhotoProxy:(id)a4 error:(id)a5;
- (void)_handleFailedSessionRecoveryAttemptAfterDelay:(BOOL)a3;
- (void)_handleSessionDidStartRunning:(id)a3;
- (void)_handleSessionDidStopRunning:(id)a3;
- (void)_handleSessionInterruption:(id)a3;
- (void)_handleSessionInterruptionEnded:(id)a3;
- (void)_handleSessionRuntimeError:(id)a3;
- (void)_handleSessionWasPrewarmed:(id)a3;
- (void)_notifyServicesOfPanoramaConfigurationChangeWithImageQueue:(_CAImageQueue *)a3 direction:(int64_t)a4;
- (void)_panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted:(BOOL)a3;
- (void)_performSessionNonstartRecoveryIfNeeded;
- (void)_performSessionRuntimeRecovery:(id)a3;
- (void)_recoverFromSessionRuntimeError;
- (void)_resetPerformingRecoveryState;
- (void)_resultsQueue_logReceivedCallbacksForID:(int64_t)a3 withIntroString:(id)a4;
- (void)_resultsQueue_performPostprocessingForPreviewBuffer:(__CVBuffer *)a3 metadata:(id)a4 filters:(id *)a5 stillImageCaptureRequestKey:(id)a6 completionHandler:(id)a7;
- (void)_scheduleDelayedRecoveryCheckIfNecessary;
- (void)_scheduleDelayedSessionNonstartRecovery;
- (void)_sessionQueuePanoramaSetup;
- (void)_sessionQueuePanoramaTeardown;
- (void)_sessionQueue_startWithRetryCount:(unint64_t)a3 retryInterval:(double)a4 logReason:(id)a5 completion:(id)a6;
- (void)_setAccidentalLaunchPrewarmReason:(id)a3;
- (void)_setAccidentalLaunchPrewarmTime:(double)a3;
- (void)_setAccidentalLaunchTimeout:(double)a3;
- (void)_setInterrupted:(BOOL)a3;
- (void)_setNumberOfRecoveryAttempts:(unint64_t)a3;
- (void)_setPanoramaAssertionIdentifier:(unsigned int)a3;
- (void)_setPanoramaFirstImageQueueUpdateSemaphore:(id)a3;
- (void)_setPanoramaImageQueue:(_CAImageQueue *)a3;
- (void)_setPanoramaProcessor:(id)a3;
- (void)_setPerformingRecovery:(BOOL)a3;
- (void)_setResultsQueueLastCompletedVideoURL:(id)a3;
- (void)_setResultsQueueLastCompletedVideoZoomFactor:(double)a3;
- (void)_showAccidentalLaunchNotificationIfNecessary;
- (void)_subgraphQueueCreatePanoramaImageQueueIfNecessary;
- (void)_subgraphQueueCreatePanoramaProcessorIfNecessaryWithEncodingBehavior:(int64_t)a3;
- (void)_subgraphQueueHandlePanoramaErrorNotification:(__CFString *)a3;
- (void)_subgraphQueueHandlePanoramaStatusNotification:(__CFString *)a3;
- (void)_subgraphQueueHandlePanoramaWarningNotification:(__CFString *)a3;
- (void)_unlockAllEngineManagedDevices;
- (void)_unlockManagedCaptureDevice:(id)a3;
- (void)_updateContext:(id)a3;
- (void)_updateCurrentlyConfiguredObjects;
- (void)_updateEffectsSubgraph;
- (void)_updateVideoThumbnailSubgraph;
- (void)_validateSessionRecovery;
- (void)audioCaptureDeviceInput;
- (void)cacheMomentCaptureSettings:(id)a3 forIdentifier:(id)a4;
- (void)cancelAutoResumeAfterDate:(id)a3;
- (void)captureEngineDevice:(id)a3 didChangeLensSelectorZoomFactor:(float)a4;
- (void)captureEngineDevice:(id)a3 didChangeSystemExposureTargetBias:(float)a4;
- (void)captureOutput:(id)a3 didBeginMovieCaptureForResolvedSettings:(id)a4;
- (void)captureOutput:(id)a3 didCapturePhotoForResolvedSettings:(id)a4;
- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didFinishCapturingDeferredPhotoProxy:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didFinishMovieCaptureForResolvedSettings:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(id)a4 duration:(id *)a5 photoDisplayTime:(id *)a6 metadataIdentifiers:(id)a7 resolvedSettings:(id)a8 error:(id)a9;
- (void)captureOutput:(id)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(id)a4 duration:(id *)a5 photoDisplayTime:(id *)a6 resolvedSettings:(id)a7 error:(id)a8;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didFinishRecordingLivePhotoMovieForEventualFileAtURL:(id)a4 resolvedSettings:(id)a5;
- (void)captureOutput:(id)a3 didFinishRecordingMovie:(id)a4;
- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6;
- (void)captureOutput:(id)a3 didFinishWritingMovie:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didResumeRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5;
- (void)captureOutput:(id)a3 didStartRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5;
- (void)captureOutput:(id)a3 readyForResponsiveRequestAfterResolvedSettings:(id)a4;
- (void)captureOutput:(id)a3 willBeginCaptureBeforeResolvingSettingsForUniqueID:(int64_t)a4;
- (void)captureOutput:(id)a3 willBeginCaptureForResolvedSettings:(id)a4;
- (void)captureOutput:(id)a3 willCapturePhotoForResolvedSettings:(id)a4;
- (void)changePanoramaEncodingBehaviorIfNeeded:(int64_t)a3;
- (void)changeToPanoramaDirection:(int64_t)a3;
- (void)clearCachedMomentCaptureSettingsForIdentifier:(id)a3;
- (void)currentInflightCapturesStringWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)enqueueCommand:(id)a3;
- (void)enqueueCommands:(id)a3;
- (void)ensureControlsForGraphConfiguration:(id)a3;
- (void)panoramaProcessor:(id)a3 didProcessSampleBuffer:(opaqueCMSampleBuffer *)a4 withStatus:(int)a5 forRequest:(id)a6;
- (void)registerCaptureService:(id)a3;
- (void)registerEffectsPreviewSampleBufferDelegate:(id)a3;
- (void)registerStillImageCaptureRequest:(id)a3 withSettings:(id)a4;
- (void)registerVideoCaptureRequest:(id)a3;
- (void)registerVideoEndZoomFactor:(double)a3;
- (void)registerVideoThumbnailContentsDelegate:(id)a3;
- (void)session:(id)a3 controlsDidChangeAutoFocusLocked:(BOOL)a4;
- (void)session:(id)a3 didChangeActiveControl:(id)a4;
- (void)sessionControlsDidBecomeActive:(id)a3;
- (void)sessionControlsDidBecomeInactive:(id)a3;
- (void)sessionControlsWillEnterFullscreenAppearance:(id)a3;
- (void)sessionControlsWillExitFullscreenAppearance:(id)a3;
- (void)setCurrentCameraDevice:(id)a3;
- (void)setCurrentStillImageOutput:(id)a3;
- (void)setManagedDevicesLockedForConfiguration:(BOOL)a3;
- (void)set_cameraTransitionInProcess:(BOOL)a3;
- (void)set_lastTapToRadarTime:(id)a3;
- (void)set_layoutMonitor:(id)a3;
- (void)setupLayoutMonitor;
- (void)startPanoramaCaptureWithRequest:(id)a3;
- (void)startWithRetryCount:(unint64_t)a3 retryInterval:(double)a4 logReason:(id)a5 completion:(id)a6;
- (void)stopMonitoringForAccidentalLaunch;
- (void)stopPanoramaCaptureInterrupted:(BOOL)a3;
- (void)stopRecording;
- (void)stopWithCompletion:(id)a3;
- (void)systemPreferredCameraDevice;
- (void)unregisterCaptureService:(id)a3;
- (void)unregisterEffectsPreviewSampleBufferDelegate:(id)a3;
- (void)unregisterVideoThumbnailContentsDelegate:(id)a3;
- (void)videoThumbnailOutput:(id)a3 willBeginRenderingThumbnailsWithContents:(id)a4;
- (void)videoThumbnailOutputWillEndRenderingThumbnails:(id)a3;
@end

@implementation CAMCaptureEngine

+ (void)preheatCaptureResources
{
  if (preheatCaptureResources_onceToken != -1) {
    dispatch_once(&preheatCaptureResources_onceToken, &__block_literal_global_46);
  }
}

void __43__CAMCaptureEngine_preheatCaptureResources__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.camera.capture-engine.session-queue", v2);
  v1 = (void *)prewarmedCaptureSessionQueue;
  prewarmedCaptureSessionQueue = (uint64_t)v0;

  dispatch_async((dispatch_queue_t)prewarmedCaptureSessionQueue, &__block_literal_global_49);
  dispatch_async((dispatch_queue_t)prewarmedCaptureSessionQueue, &__block_literal_global_51);
  dispatch_async((dispatch_queue_t)prewarmedCaptureSessionQueue, &__block_literal_global_53);
}

id __43__CAMCaptureEngine_preheatCaptureResources__block_invoke_2()
{
  return _prewarmAVCaptureSession();
}

- (id)prewarmedCaptureSession
{
  v2 = _prewarmAVCaptureSession();
  v3 = (void *)prewarmedAVCaptureSession;
  prewarmedAVCaptureSession = 0;

  return v2;
}

void __43__CAMCaptureEngine_preheatCaptureResources__block_invoke_3()
{
  if (_prewarmAudioVideoDeviceTypes_onceToken != -1) {
    dispatch_once(&_prewarmAudioVideoDeviceTypes_onceToken, &__block_literal_global_37);
  }
}

void __43__CAMCaptureEngine_preheatCaptureResources__block_invoke_4()
{
  if (_prewarmAudioVideoDevices_onceToken != -1) {
    dispatch_once(&_prewarmAudioVideoDevices_onceToken, &__block_literal_global_41);
  }
}

- (void)registerCaptureService:(id)a3
{
  id v4 = a3;
  v5 = [(CAMCaptureEngine *)self _captureServicesQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__CAMCaptureEngine_registerCaptureService___block_invoke;
  v7[3] = &unk_263FA0408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (OS_dispatch_queue)_captureServicesQueue
{
  return self->__captureServicesQueue;
}

void __43__CAMCaptureEngine_registerCaptureService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _servicesQueueCaptureServices];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSMutableArray)_servicesQueueCaptureServices
{
  return self->__servicesQueueCaptureServices;
}

- (id)stillImageOutput
{
  stillImageOutput = self->_stillImageOutput;
  if (!stillImageOutput)
  {
    id v4 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v4];
    v5 = (AVCapturePhotoOutput *)objc_alloc_init(MEMORY[0x263EFA620]);
    id v6 = self->_stillImageOutput;
    self->_stillImageOutput = v5;

    v7 = [MEMORY[0x263EFA628] photoSettings];
    [(AVCapturePhotoOutput *)self->_stillImageOutput setPhotoSettingsForSceneMonitoring:v7];
    [(AVCapturePhotoOutput *)self->_stillImageOutput setPrivatePhotoDimensionsEnabled:1];
    [(CAMCaptureEngine *)self didChangeValueForKey:v4];

    stillImageOutput = self->_stillImageOutput;
  }
  return stillImageOutput;
}

- (void)enqueueCommand:(id)a3
{
  id v4 = (void *)[a3 copy];
  v5 = [[CAMCaptureCommandContext alloc] initWithCaptureEngine:self];
  id v6 = [(CAMCaptureEngine *)self _captureSessionQueue];
  v9 = v4;
  v7 = v5;
  id v8 = v4;
  pl_dispatch_async();
}

- (OS_dispatch_queue)_captureSessionQueue
{
  return self->__captureSessionQueue;
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return self->__videoPreviewLayer;
}

void __35__CAMCaptureEngine_enqueueCommand___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  double Current = CFAbsoluteTimeGetCurrent();
  id v11 = 0;
  double v12 = 0.0;
  [*(id *)(a1 + 32) _beginSessionConfigurationIfRequiredByCommand:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48) logReason:&v11 minimumExecutionTime:&v12];
  id v3 = v11;
  if ([*(id *)(a1 + 32) _lockAllEngineManagedDevices])
  {
    [*(id *)(a1 + 32) _executeCommand:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _unlockAllEngineManagedDevices];
  }
  [*(id *)(a1 + 32) _commitSessionConfigurationIfNecessaryWithLogReason:v3];
  double v4 = CFAbsoluteTimeGetCurrent() - Current;
  if (v12 > 0.0 && v4 < v12)
  {
    double v6 = v12 - v4;
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v14 = v6;
      __int16 v15 = 2048;
      double v16 = v12;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Sleeping for %.3f seconds to meet minimum mode change time %.3f", buf, 0x16u);
    }

    [MEMORY[0x263F08B88] sleepForTimeInterval:v6];
  }
  id v8 = objc_msgSend(*(id *)(a1 + 32), "_accumulatedUserInfoFromCommand:", *(void *)(a1 + 40), v4);
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
    pl_dispatch_async();
  }
}

- (AVCaptureSession)_captureSession
{
  return self->__captureSession;
}

- (BOOL)_lockAllEngineManagedDevices
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  captureEngineDeviceCache = self->__captureEngineDeviceCache;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__CAMCaptureEngine__lockAllEngineManagedDevices__block_invoke;
  v7[3] = &unk_263FA58B0;
  v7[4] = self;
  void v7[5] = &v8;
  [(CAMMemoizationCache *)captureEngineDeviceCache enumerateKeysAndObjectsUsingBlock:v7];
  BOOL v4 = [(CAMCaptureEngine *)self _lockManagedCapturedDevice:self->_audioCameraDevice];
  if (*((unsigned char *)v9 + 24)) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  [(CAMCaptureEngine *)self setManagedDevicesLockedForConfiguration:v5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)_lockManagedCapturedDevice:(id)a3
{
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    id v9 = 0;
    char v5 = [v3 lockForConfiguration:&v9];
    id v6 = v9;
    if ((v5 & 1) == 0)
    {
      v7 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CAMCaptureEngine _lockManagedCapturedDevice:]();
      }
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)setManagedDevicesLockedForConfiguration:(BOOL)a3
{
  self->_managedDevicesLockedForConfiguration = a3;
}

- (void)_executeCommand:(id)a3 withContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CAMCaptureEngine *)self _captureSessionQueue];
  dispatch_assert_queue_V2(v8);

  [(CAMCaptureEngine *)self _updateContext:v7];
  CAMSignpostWithIDAndArgs(23, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  [v6 executeWithContext:v7];
  CAMSignpostWithIDAndArgs(24, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = objc_msgSend(v6, "subcommands", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(CAMCaptureEngine *)self _executeCommand:*(void *)(*((void *)&v14 + 1) + 8 * v13++) withContext:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)_updateContext:(id)a3
{
  id v4 = a3;
  [v4 clear];
  char v5 = [(CAMCaptureEngine *)self _captureSession];
  [v4 setCurrentCaptureSession:v5];
  id v6 = [v5 inputs];
  id v7 = [v5 outputs];
  v27 = [v5 controls];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __35__CAMCaptureEngine__updateContext___block_invoke;
  v37[3] = &unk_263FA57E8;
  v37[4] = self;
  id v8 = v4;
  id v38 = v8;
  v28 = v6;
  [v6 enumerateObjectsUsingBlock:v37];
  id v9 = [(CAMCaptureEngine *)self _videoDeviceInputFromSession:v5];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 device];
    [v8 setCurrentVideoDevice:v11];
    uint64_t v12 = [v11 activeFormat];
    [v8 setCurrentVideoDeviceFormat:v12];

    uint64_t v13 = [v11 activeDepthDataFormat];
    [v8 setCurrentDepthDataFormat:v13];

    long long v14 = [v5 sessionPreset];
    [v8 setCurrentVideoDevicePreset:v14];

    [v8 setCurrentVideoDeviceInput:v10];
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __35__CAMCaptureEngine__updateContext___block_invoke_2;
  v35[3] = &unk_263FA5810;
  v35[4] = self;
  id v15 = v8;
  id v36 = v15;
  long long v16 = v7;
  [v7 enumerateObjectsUsingBlock:v35];
  if (v10)
  {
    long long v17 = [v10 device];
    v18 = [v17 deviceType];
    uint64_t v19 = -[CAMCaptureEngine _captureEngineDeviceForDeviceType:position:](self, "_captureEngineDeviceForDeviceType:position:", v18, [v17 position]);

    v20 = [v19 systemZoomSlider];
    v21 = [v19 systemLensSelector];
    v22 = [v19 systemExposureSlider];
    [v19 setSystemDeviceActionDelegate:self];
  }
  else
  {
    v22 = 0;
    v21 = 0;
    v20 = 0;
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __35__CAMCaptureEngine__updateContext___block_invoke_3;
  v29[3] = &unk_263FA5838;
  id v30 = v20;
  id v31 = v15;
  id v32 = v21;
  id v33 = v22;
  v34 = self;
  id v23 = v22;
  id v24 = v21;
  id v25 = v15;
  id v26 = v20;
  [v27 enumerateObjectsUsingBlock:v29];
  [v25 setCurrentVideoPreviewLayer:self->__videoPreviewLayer];
}

- (id)backCameraDevice
{
  return [(CAMCaptureEngine *)self _captureEngineDeviceForDeviceType:*MEMORY[0x263EF9670] position:1];
}

- (CAMMemoizationCache)_captureEngineDeviceCache
{
  return self->__captureEngineDeviceCache;
}

- (BOOL)areManagedDevicesLockedForConfiguration
{
  return self->_managedDevicesLockedForConfiguration;
}

- (id)prewarmedVideoDeviceInput:(id)a3 position:(int64_t)a4 device:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (_prewarmAudioVideoDeviceTypes_onceToken != -1) {
    dispatch_once(&_prewarmAudioVideoDeviceTypes_onceToken, &__block_literal_global_37);
  }
  if ((id)prewarmedVideoDeviceType != v7 || prewarmedVideoDevicePosition != a4) {
    goto LABEL_11;
  }
  if (_prewarmAudioVideoDevices_onceToken != -1) {
    dispatch_once(&_prewarmAudioVideoDevices_onceToken, &__block_literal_global_41);
  }
  if ((id)prewarmedVideoDevice == v8)
  {
    id v10 = (id)prewarmedVideoDeviceInput;
    uint64_t v12 = (void *)prewarmedVideoDeviceInput;
    prewarmedVideoDeviceInput = 0;
  }
  else
  {
LABEL_11:
    id v10 = 0;
  }

  return v10;
}

- (id)videoThumbnailOutput
{
  videoThumbnailOutput = self->_videoThumbnailOutput;
  if (!videoThumbnailOutput)
  {
    id v4 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v4];
    char v5 = (AVCaptureVideoThumbnailOutput *)objc_alloc_init(MEMORY[0x263EFA6B8]);
    id v6 = self->_videoThumbnailOutput;
    self->_videoThumbnailOutput = v5;

    [(CAMCaptureEngine *)self didChangeValueForKey:v4];
    videoThumbnailOutput = self->_videoThumbnailOutput;
  }
  return videoThumbnailOutput;
}

- (id)metadataOutput
{
  metadataOutput = self->_metadataOutput;
  if (!metadataOutput)
  {
    id v4 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v4];
    char v5 = (AVCaptureMetadataOutput *)objc_alloc_init(MEMORY[0x263EFA5F0]);
    id v6 = self->_metadataOutput;
    self->_metadataOutput = v5;

    [(CAMCaptureEngine *)self didChangeValueForKey:v4];
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    id v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.camera.capture-engine.metadata-queue", v7);
    metadataObjectsQueue = self->__metadataObjectsQueue;
    self->__metadataObjectsQueue = v8;

    id v10 = self->_metadataOutput;
    uint64_t v11 = [(CAMCaptureEngine *)self _metadataObjectsQueue];
    [(AVCaptureMetadataOutput *)v10 setMetadataObjectsDelegate:self queue:v11];

    metadataOutput = self->_metadataOutput;
  }
  return metadataOutput;
}

- (OS_dispatch_queue)_metadataObjectsQueue
{
  return self->__metadataObjectsQueue;
}

uint64_t __35__CAMCaptureEngine__updateContext___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(result + 32);
  if (*(void *)(v4 + 16) == a2)
  {
    uint64_t v6 = result;
    [*(id *)(result + 40) setCurrentAudioDevice:*(void *)(v4 + 8)];
    result = [*(id *)(v6 + 40) setCurrentAudioDeviceInput:*(void *)(*(void *)(v6 + 32) + 16)];
    *a4 = 1;
  }
  return result;
}

- (BOOL)isInterrupted
{
  return self->_interrupted;
}

- (void)_unlockAllEngineManagedDevices
{
  captureEngineDeviceCache = self->__captureEngineDeviceCache;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__CAMCaptureEngine__unlockAllEngineManagedDevices__block_invoke;
  v4[3] = &unk_263FA58D8;
  v4[4] = self;
  [(CAMMemoizationCache *)captureEngineDeviceCache enumerateKeysAndObjectsUsingBlock:v4];
  [(CAMCaptureEngine *)self _unlockManagedCaptureDevice:self->_audioCameraDevice];
  [(CAMCaptureEngine *)self setManagedDevicesLockedForConfiguration:0];
}

void __50__CAMCaptureEngine__unlockAllEngineManagedDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 captureDevice];
  [*(id *)(a1 + 32) _unlockManagedCaptureDevice:v4];
}

- (void)_unlockManagedCaptureDevice:(id)a3
{
  id v3 = a3;
  if ([v3 isLockedForConfiguration]) {
    [v3 unlockForConfiguration];
  }
}

- (BOOL)_updatePanoramaSubgraphForEnteringBackground:(BOOL)a3
{
  char v5 = [(AVCaptureSession *)self->__captureSession outputs];
  uint64_t v6 = self->_panoramaVideoDataOutput;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__CAMCaptureEngine__updatePanoramaSubgraphForEnteringBackground___block_invoke;
  v15[3] = &unk_263FA5BA0;
  id v7 = v6;
  long long v16 = v7;
  uint64_t v8 = [v5 indexOfObjectPassingTest:v15];
  uint64_t v9 = [(AVCaptureVideoDataOutput *)v7 sampleBufferDelegate];
  id v10 = (void *)v9;
  if (a3 || (v8 == 0x7FFFFFFFFFFFFFFFLL ? (BOOL v11 = v9 == 0) : (BOOL v11 = 1), !v11))
  {
    [(CAMCaptureEngine *)self _sessionQueuePanoramaTeardown];
LABEL_14:
    BOOL v13 = 0;
    goto LABEL_15;
  }
  if (v8 == 0x7FFFFFFFFFFFFFFFLL || v9 != 0) {
    goto LABEL_14;
  }
  [(CAMCaptureEngine *)self _sessionQueuePanoramaSetup];
  BOOL v13 = 1;
LABEL_15:

  return v13;
}

BOOL __65__CAMCaptureEngine__updatePanoramaSubgraphForEnteringBackground___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

- (void)_updateEffectsSubgraph
{
  id v10 = [(AVCaptureSession *)self->__captureSession outputs];
  int v3 = [v10 containsObject:self->_effectsPreviewVideoDataOutput];
  uint64_t v4 = [(AVCaptureVideoDataOutput *)self->_effectsPreviewVideoDataOutput sampleBufferDelegate];
  char v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v8 = [(CAMCaptureEngine *)self effectsPreviewVideoDataOutput];
    uint64_t v9 = [(CAMCaptureEngine *)self _effectsPreviewSampleBufferQueue];
    [v8 setSampleBufferDelegate:self queue:v9];
  }
  else
  {
    if (v4) {
      char v7 = v3;
    }
    else {
      char v7 = 1;
    }
    if ((v7 & 1) == 0) {
      [(AVCaptureVideoDataOutput *)self->_effectsPreviewVideoDataOutput setSampleBufferDelegate:0 queue:0];
    }
  }
}

- (void)_updateVideoThumbnailSubgraph
{
  int v3 = [(CAMCaptureEngine *)self _captureSessionQueue];
  dispatch_assert_queue_V2(v3);

  id v10 = [(AVCaptureSession *)self->__captureSession outputs];
  int v4 = [v10 containsObject:self->_videoThumbnailOutput];
  uint64_t v5 = [(AVCaptureVideoThumbnailOutput *)self->_videoThumbnailOutput thumbnailContentsDelegate];
  BOOL v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v9 = [(CAMCaptureEngine *)self videoThumbnailOutput];
    [v9 setThumbnailContentsDelegate:self];
  }
  else
  {
    if (v5) {
      char v8 = v4;
    }
    else {
      char v8 = 1;
    }
    if ((v8 & 1) == 0) {
      [(AVCaptureVideoThumbnailOutput *)self->_videoThumbnailOutput setThumbnailContentsDelegate:0];
    }
  }
}

- (BOOL)_shouldStartSessionOnConfigurationChanges
{
  return ([(CAMCaptureEngine *)self _engineOptions] & 1) == 0;
}

- (int64_t)_engineOptions
{
  return self->__engineOptions;
}

- (void)_scheduleDelayedSessionNonstartRecovery
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__CAMCaptureEngine__scheduleDelayedSessionNonstartRecovery__block_invoke;
  v2[3] = &unk_263FA0208;
  v2[4] = self;
  cam_perform_on_main_asap(v2);
}

uint64_t __59__CAMCaptureEngine__scheduleDelayedSessionNonstartRecovery__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelDelayedSessionNonstartRecovery];
  id v2 = *(void **)(a1 + 32);
  return [v2 performSelector:sel__performSessionNonstartRecoveryIfNeeded withObject:0 afterDelay:5.0];
}

- (void)_cancelDelayedSessionNonstartRecovery
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__CAMCaptureEngine__cancelDelayedSessionNonstartRecovery__block_invoke;
  v2[3] = &unk_263FA0208;
  v2[4] = self;
  cam_perform_on_main_asap(v2);
}

uint64_t __57__CAMCaptureEngine__cancelDelayedSessionNonstartRecovery__block_invoke(uint64_t a1)
{
  return [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:*(void *)(a1 + 32) selector:sel__performSessionNonstartRecoveryIfNeeded object:0];
}

- (void)_handleSessionDidStartRunning:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = (id)objc_opt_class();
    id v5 = v9;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] AVCaptureSession started running!", buf, 0xCu);
  }
  BOOL v6 = [(CAMCaptureEngine *)self _captureResultsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__CAMCaptureEngine__handleSessionDidStartRunning___block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_async(v6, block);

  [(CAMCaptureEngine *)self _scheduleDelayedRecoveryCheckIfNecessary];
  [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:&__block_literal_global_103];
}

- (void)_scheduleDelayedRecoveryCheckIfNecessary
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  int v3 = [(CAMCaptureEngine *)self _recoveryMutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CAMCaptureEngine__scheduleDelayedRecoveryCheckIfNecessary__block_invoke;
  block[3] = &unk_263FA35E8;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(v3, block);

  if (*((unsigned char *)v7 + 24))
  {
    dispatch_time(0, 250000000);
    int v4 = [(CAMCaptureEngine *)self _captureSessionQueue];
    pl_dispatch_after();
  }
  _Block_object_dispose(&v6, 8);
}

- (OS_dispatch_queue)_recoveryMutexQueue
{
  return self->__recoveryMutexQueue;
}

uint64_t __60__CAMCaptureEngine__scheduleDelayedRecoveryCheckIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isPerformingRecovery];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isPerformingRecovery
{
  return self->__performingRecovery;
}

- (void)_enumerateCaptureServicesUsingBlock:(id)a3
{
}

- (void)_enumerateCaptureServicesUsingBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CAMCaptureEngine *)self _captureServicesQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CAMCaptureEngine__enumerateCaptureServicesUsingBlock_completion___block_invoke;
  block[3] = &unk_263FA5928;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __67__CAMCaptureEngine__enumerateCaptureServicesUsingBlock_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _servicesQueueCaptureServices];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__CAMCaptureEngine__enumerateCaptureServicesUsingBlock_completion___block_invoke_2;
  v4[3] = &unk_263FA5900;
  id v5 = *(id *)(a1 + 40);
  [v2 enumerateObjectsUsingBlock:v4];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
}

uint64_t __67__CAMCaptureEngine__enumerateCaptureServicesUsingBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_accumulatedUserInfoFromCommand:(id)a3
{
  id v4 = a3;
  id v5 = [v4 subcommands];
  id v6 = v5;
  if (v5 && [v5 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    long long v14 = __52__CAMCaptureEngine__accumulatedUserInfoFromCommand___block_invoke;
    id v15 = &unk_263FA5888;
    long long v16 = self;
    id v8 = v7;
    id v17 = v8;
    [v6 enumerateObjectsUsingBlock:&v12];
    uint64_t v9 = objc_msgSend(v8, "count", v12, v13, v14, v15, v16);
    id v10 = [v4 userInfo];
    if (v9)
    {
      [v8 addEntriesFromDictionary:v10];

      id v10 = v8;
    }
  }
  else
  {
    id v10 = [v4 userInfo];
  }

  return v10;
}

uint64_t __52__CAMCaptureEngine__accumulatedUserInfoFromCommand___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _accumulatedUserInfoFromCommand:a2];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 40) addEntriesFromDictionary:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

void __48__CAMCaptureEngine__lockAllEngineManagedDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 captureDevice];
  if ((objc_msgSend(*(id *)(a1 + 32), "_lockManagedCapturedDevice:") & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)_performSessionNonstartRecoveryIfNeeded
{
  uint64_t v3 = [(CAMCaptureEngine *)self _captureSession];
  char v4 = [v3 isRunning];
  char v5 = [v3 isInterrupted];
  if ((v4 & 1) == 0 && (v5 & 1) == 0)
  {
    uint64_t v6 = [(CAMCaptureEngine *)self _recoveryMutexQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__CAMCaptureEngine__performSessionNonstartRecoveryIfNeeded__block_invoke;
    block[3] = &unk_263FA0208;
    block[4] = self;
    dispatch_sync(v6, block);

    [(CAMCaptureEngine *)self _handleFailedSessionRecoveryAttemptAfterDelay:0];
  }
}

- (void)registerStillImageCaptureRequest:(id)a3 withSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAMCaptureEngine *)self _captureResultsQueue];
  BOOL v11 = v7;
  id v9 = v6;
  id v10 = v7;
  pl_dispatch_async();
}

- (void)captureOutput:(id)a3 willBeginCaptureForResolvedSettings:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 uniqueID];
  mach_absolute_time();
  CAMSignpostWithIDAndArgs(35, v8, v8, 0, 0, 0);
  [(CAMCaptureEngine *)self stopMonitoringForAccidentalLaunch];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v9 = [(CAMCaptureEngine *)self _signpostMutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__CAMCaptureEngine_captureOutput_willBeginCaptureForResolvedSettings___block_invoke;
  block[3] = &unk_263FA51E8;
  void block[5] = &v14;
  void block[6] = v8;
  block[4] = self;
  dispatch_sync(v9, block);

  if (*((unsigned char *)v15 + 24))
  {
    CAMSignpostWithIDAndArgs(70, v8, v8, 0, 0, 0);
    CAMSignpostWithIDAndArgs(72, v8, v8, 0, 0, 0);
  }
  if (objc_msgSend(v7, "cam_isRecordingMovieForLivePhoto"))
  {
    id v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = v8;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:willBeginCaptureForResolvedSettings: with video", buf, 0xCu);
    }

    BOOL v11 = [(CAMCaptureEngine *)self _captureResultsQueue];
    id v12 = v7;
    pl_dispatch_async();
  }
  else
  {
    CAMSignpostWithIDAndArgs(36, v8, v8, 0, 0, 0);
  }
  _Block_object_dispose(&v14, 8);
}

- (void)captureOutput:(id)a3 willCapturePhotoForResolvedSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 uniqueID];
  CAMSignpostWithIDAndArgs(37, v8, v8, 0, 0, 0);
  mach_absolute_time();
  id v9 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v12 = v7;
  id v10 = v6;
  id v11 = v7;
  pl_dispatch_async();
}

void __70__CAMCaptureEngine_captureOutput_willCapturePhotoForResolvedSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  char v4 = [v2 objectForKeyedSubscript:v3];

  char v5 = [v4 request];
  if (([v5 isCTMVideo] & 1) == 0)
  {
    [v4 didReceiveCallback:1 atAbsoluteTime:*(void *)(a1 + 56)];
    uint64_t v6 = [*(id *)(a1 + 40) isHDREnabled];
    unsigned int v7 = [*(id *)(a1 + 48) isDepthDataDeliveryEnabled];
    int v8 = [*(id *)(a1 + 40) isAdjustedPhotoFilterRenderingEnabled];
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = [*(id *)(a1 + 40) isCaptureBeforeResolvingSettingsEnabled];
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = v8 & v7;
    if ((unint64_t)([v5 lowLightMode] - 1) > 1)
    {
      SRGB = 0;
      unint64_t v27 = 0;
      uint64_t v28 = 0;
      double v29 = 0.0;
    }
    else
    {
      memset(v40, 0, sizeof(v40));
      long long v39 = 0u;
      id v11 = *(void **)(a1 + 40);
      if (v11) {
        [v11 photoProcessingTimeRange];
      }
      *(_OWORD *)&time.value = v39;
      time.epoch = *(void *)&v40[0];
      double Seconds = CMTimeGetSeconds(&time);
      CMTime time = *(CMTime *)((char *)v40 + 8);
      double v13 = CMTimeGetSeconds(&time) * 0.5;
      uint64_t v14 = [*(id *)(a1 + 40) digitalFlashUserInterfaceRGBEstimate];
      if ((unint64_t)[v14 count] < 3)
      {
        SRGB = 0;
      }
      else
      {
        unsigned int v34 = v6;
        CGFloat v15 = 1.0;
        if ((unint64_t)[v14 count] >= 4)
        {
          uint64_t v16 = [v14 objectAtIndexedSubscript:3];
          [v16 doubleValue];
          CGFloat v15 = v17;
        }
        v18 = [v14 objectAtIndexedSubscript:0];
        [v18 doubleValue];
        CGFloat v20 = v19;
        v21 = [v14 objectAtIndexedSubscript:1];
        [v21 doubleValue];
        CGFloat v23 = v22;
        id v24 = [v14 objectAtIndexedSubscript:2];
        [v24 doubleValue];
        SRGB = CGColorCreateSRGB(v20, v23, v25, v15);

        uint64_t v6 = v34;
      }
      double v29 = Seconds + v13;
      unint64_t v30 = [*(id *)(a1 + 40) digitalFlashUserInterfaceHints];
      unint64_t v27 = v30 & 1;

      uint64_t v28 = (v30 >> 1) & 1;
    }
    id v31 = [[CAMStillImageCaptureResolvedSettings alloc] initWithHDREnabled:v6 portraitEffectEnabled:v10 lowLightCaptureTime:SRGB lowLightPreviewColorEstimate:v27 lowLightCaptureHasInitialPreviewFeedbackSensitivity:v28 lowLightCaptureHasConstantPreviewFeedbackSensitivity:v9 captureBeforeResolvingSettingsEnabled:v29];
    if (SRGB) {
      CGColorRelease(SRGB);
    }
    id v32 = *(void **)(a1 + 32);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __70__CAMCaptureEngine_captureOutput_willCapturePhotoForResolvedSettings___block_invoke_2;
    v35[3] = &unk_263FA5978;
    id v36 = v5;
    v37 = v31;
    id v33 = v31;
    [v32 _enumerateCaptureServicesUsingBlock:v35];
    CAMSignpostWithIDAndArgs(38, *(void *)(a1 + 64), *(void *)(a1 + 64), 0, 0, 0);
  }
}

void __70__CAMCaptureEngine_captureOutput_willCapturePhotoForResolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequestDidStartCapturing:*(void *)(a1 + 32) resolvedSettings:*(void *)(a1 + 40)];
  }
}

- (void)captureOutput:(id)a3 didCapturePhotoForResolvedSettings:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 uniqueID];
  CAMSignpostWithIDAndArgs(39, v6, v6, 0, 0, 0);
  CAMSignpostWithIDAndArgs(71, v6, v6, 0, 0, 0);
  unsigned int v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v6;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didCapturePhotoForResolvedSettings:", buf, 0xCu);
  }

  mach_absolute_time();
  int v8 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v9 = v5;
  pl_dispatch_async();
}

void __69__CAMCaptureEngine_captureOutput_didCapturePhotoForResolvedSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  char v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [v4 request];
  if (([v5 isCTMVideo] & 1) == 0)
  {
    [v4 didReceiveCallback:2 atAbsoluteTime:*(void *)(a1 + 48)];
    uint64_t v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__CAMCaptureEngine_captureOutput_didCapturePhotoForResolvedSettings___block_invoke_2;
    v7[3] = &unk_263FA5728;
    id v8 = v5;
    [v6 _enumerateCaptureServicesUsingBlock:v7];
    CAMSignpostWithIDAndArgs(40, *(void *)(a1 + 56), *(void *)(a1 + 56), 0, 0, 0);
  }
}

void __69__CAMCaptureEngine_captureOutput_didCapturePhotoForResolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequestDidStopCapturingStillImage:*(void *)(a1 + 32)];
  }
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = [v8 resolvedSettings];
  uint64_t v10 = [v9 uniqueID];

  CAMSignpostWithIDAndArgs(41, v10, v10, 0, 0, 0);
  uint64_t v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218242;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishProcessingPhoto:error:, error=%{public}@", (uint8_t *)&v12, 0x16u);
  }

  [(CAMCaptureEngine *)self _handleCaptureOutputDidFinishCapturingPhoto:v8 deferredPhotoProxy:0 error:v7];
}

- (void)captureOutput:(id)a3 didFinishCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    uint64_t v11 = [v7 uniqueID];
    __int16 v12 = 2114;
    id v13 = v8;
    _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishCaptureForResolvedSettings:, error: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[CAMCaptureEngine _didFinishStillImageCaptureForUniqueID:error:](self, "_didFinishStillImageCaptureForUniqueID:error:", [v7 uniqueID], v8);
}

- (id)_coordinationInfoForRequest:(id)a3 photo:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 resolvedSettings];
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"captureID:%lld", objc_msgSend(v6, "uniqueID"));
  id v8 = [(CAMCaptureEngine *)self _expectedResultSpecifiersForResolvedPhotoSettings:v6];
  unsigned int v9 = [v5 expectedPhotoProcessingFlags];

  int v10 = [[CAMCaptureCoordinationInfo alloc] initWithIdentifier:v7 allExpectedResultSpecifiers:v8 resultSpecifiers:(v9 >> 2) & 2 | (v9 >> 1) & 1];
  return v10;
}

- (id)_expectedResultSpecifiersForResolvedPhotoSettings:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF9C0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = [v4 photoManifest];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__CAMCaptureEngine__expectedResultSpecifiersForResolvedPhotoSettings___block_invoke;
  v9[3] = &unk_263FA33C8;
  id v7 = v5;
  id v10 = v7;
  [v6 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __70__CAMCaptureEngine__expectedResultSpecifiersForResolvedPhotoSettings___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 unsignedIntegerValue];
  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithUnsignedInteger:(v3 >> 2) & 2 | (v3 >> 1) & 1];
  [v4 addObject:v5];
}

- (void)_handleApplicationDidEnterBackground:(id)a3
{
  [(CAMCaptureEngine *)self _showAccidentalLaunchNotificationIfNecessary];
  id v4 = [(CAMCaptureEngine *)self _captureSessionQueue];
  pl_dispatch_async();
}

uint64_t __57__CAMCaptureEngine__handleApplicationDidEnterBackground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePanoramaSubgraphForEnteringBackground:1];
}

- (void)_sessionQueuePanoramaTeardown
{
  unint64_t v3 = [(CAMCaptureEngine *)self panoramaVideoDataOutput];
  [v3 setSampleBufferDelegate:0 queue:0];
  id v4 = self;
  id v5 = [(CAMCaptureEngine *)v4 _panoramaSampleBufferQueue];
  pl_dispatch_async();
}

- (id)panoramaVideoDataOutput
{
  v10[1] = *MEMORY[0x263EF8340];
  panoramaVideoDataOutput = self->_panoramaVideoDataOutput;
  if (!panoramaVideoDataOutput)
  {
    id v4 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v4];
    id v5 = [[CAMPanoramaOutput alloc] initWithEngine:self];
    uint64_t v6 = self->_panoramaVideoDataOutput;
    self->_panoramaVideoDataOutput = v5;

    uint64_t v9 = *MEMORY[0x263F04180];
    v10[0] = &unk_26BDDEE98;
    id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [(AVCaptureVideoDataOutput *)self->_panoramaVideoDataOutput setVideoSettings:v7];
    [(AVCaptureVideoDataOutput *)self->_panoramaVideoDataOutput setAlwaysDiscardsLateVideoFrames:0];
    [(CAMCaptureEngine *)self didChangeValueForKey:v4];

    panoramaVideoDataOutput = self->_panoramaVideoDataOutput;
  }
  return panoramaVideoDataOutput;
}

- (OS_dispatch_queue)_panoramaSampleBufferQueue
{
  return self->__panoramaSampleBufferQueue;
}

void __49__CAMCaptureEngine__sessionQueuePanoramaTeardown__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted:", 1);
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__24;
  id v10 = __Block_byref_object_dispose__24;
  id v11 = 0;
  id v2 = [*(id *)(a1 + 32) _panoramaSubgraphQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__CAMCaptureEngine__sessionQueuePanoramaTeardown__block_invoke_2;
  v5[3] = &unk_263FA35E8;
  v5[4] = *(void *)(a1 + 32);
  v5[5] = &v6;
  dispatch_sync(v2, v5);

  [(id)v7[5] invalidate];
  unint64_t v3 = (void *)v7[5];
  void v7[5] = 0;

  [*(id *)(a1 + 32) _notifyServicesOfPanoramaConfigurationChangeWithImageQueue:0 direction:0];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _powerController];
    objc_msgSend(v4, "removeAssertionForIdentifier:withReason:", objc_msgSend(*(id *)(a1 + 32), "_panoramaAssertionIdentifier"), 8);
  }
  _Block_object_dispose(&v6, 8);
}

- (OS_dispatch_queue)_panoramaSubgraphQueue
{
  return self->__panoramaSubgraphQueue;
}

- (CAMPanoramaProcessor)_panoramaProcessor
{
  return self->__panoramaProcessor;
}

void __49__CAMCaptureEngine__sessionQueuePanoramaTeardown__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaProcessor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) _setPanoramaProcessor:0];
  [*(id *)(a1 + 32) _setPanoramaImageQueue:0];
  id v5 = *(const void **)(a1 + 32);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, v5, (CFNotificationName)*MEMORY[0x263F20810], 0);
  id v7 = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(v7, v5, (CFNotificationName)*MEMORY[0x263F20828], 0);
  uint64_t v8 = CFNotificationCenterGetLocalCenter();
  CFStringRef v9 = (const __CFString *)*MEMORY[0x263F20788];
  CFNotificationCenterRemoveObserver(v8, v5, v9, 0);
}

- (void)_setPanoramaProcessor:(id)a3
{
}

- (void)_setPanoramaImageQueue:(_CAImageQueue *)a3
{
  panoramaImageQueue = self->__panoramaImageQueue;
  if (panoramaImageQueue) {
    CFRelease(panoramaImageQueue);
  }
  self->__panoramaImageQueue = a3;
  if (a3)
  {
    CFRetain(a3);
  }
}

- (void)_notifyServicesOfPanoramaConfigurationChangeWithImageQueue:(_CAImageQueue *)a3 direction:(int64_t)a4
{
  if (a3) {
    CFRetain(a3);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__CAMCaptureEngine__notifyServicesOfPanoramaConfigurationChangeWithImageQueue_direction___block_invoke;
  v8[3] = &__block_descriptor_48_e29_v16__0___CAMCaptureService__8l;
  v8[4] = a3;
  v8[5] = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__CAMCaptureEngine__notifyServicesOfPanoramaConfigurationChangeWithImageQueue_direction___block_invoke_2;
  v7[3] = &__block_descriptor_40_e5_v8__0l;
  void v7[4] = a3;
  [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:v8 completion:v7];
}

void __89__CAMCaptureEngine__notifyServicesOfPanoramaConfigurationChangeWithImageQueue_direction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 panoramaConfigurationDidChangeWithImageQueue:*(void *)(a1 + 32) direction:*(void *)(a1 + 40)];
  }
}

void __89__CAMCaptureEngine__notifyServicesOfPanoramaConfigurationChangeWithImageQueue_direction___block_invoke_2(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    CFRelease(v1);
  }
}

- (void)_handleSessionInterruption:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CAMCaptureEngine *)self _panoramaSampleBufferQueue];
  void block[5] = MEMORY[0x263EF8330];
  void block[6] = 3221225472;
  void block[7] = __47__CAMCaptureEngine__handleSessionInterruption___block_invoke;
  block[8] = &unk_263FA0208;
  block[9] = self;
  pl_dispatch_async();

  uint64_t v6 = [v4 userInfo];
  id v7 = [v6 objectForKey:*MEMORY[0x263EF9720]];
  uint64_t v8 = [v7 integerValue];
  switch(v8)
  {
    case 1:
      CFStringRef v9 = @"VideoDeviceNotAvailableInBackground";
      break;
    case 2:
      CFStringRef v9 = @"AudioDeviceInUseByAnotherClient";
      break;
    case 3:
      CFStringRef v9 = @"VideoDeviceInUseByAnotherClient";
      break;
    case 4:
      CFStringRef v9 = @"VideoDeviceNotAvailableWithMultipleForegroundApps";
      break;
    case 5:
      id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263EF9728]];
      CFStringRef v9 = [NSString stringWithFormat:@"VideoDeviceNotAvailableDueToSystemPressure(%@)", v10];

      break;
    default:
      CFStringRef v9 = 0;
      break;
  }
  id v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v17 = (id)objc_opt_class();
    __int16 v18 = 2114;
    double v19 = v9;
    __int16 v20 = 2114;
    id v21 = v4;
    id v12 = v17;
    _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] AVCaptureSession was interrupted for %{public}@! (%{public}@)", buf, 0x20u);
  }
  [(CAMCaptureEngine *)self _setInterrupted:1];
  id v13 = [(CAMCaptureEngine *)self _recoveryMutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CAMCaptureEngine__handleSessionInterruption___block_invoke_133;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_sync(v13, block);

  [(CAMCaptureEngine *)self _cancelDelayedSessionNonstartRecovery];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__CAMCaptureEngine__handleSessionInterruption___block_invoke_134;
  v14[3] = &__block_descriptor_40_e29_v16__0___CAMCaptureService__8l;
  v14[4] = v8;
  [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:v14];
}

uint64_t __47__CAMCaptureEngine__handleSessionInterruption___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted:", 1);
}

- (void)_setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (void)_handleSessionDidStopRunning:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got AVCaptureSession did stop running notification", (uint8_t *)&buf, 0xCu);
  }
  [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:&__block_literal_global_107];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v7 = [(CAMCaptureEngine *)self _recoveryMutexQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__CAMCaptureEngine__handleSessionDidStopRunning___block_invoke_2;
  v8[3] = &unk_263FA35E8;
  v8[4] = self;
  v8[5] = &buf;
  dispatch_sync(v7, v8);

  if (*(unsigned char *)(*((void *)&buf + 1) + 24) && ![(CAMCaptureEngine *)self isInterrupted]) {
    [(CAMCaptureEngine *)self _recoverFromSessionRuntimeError];
  }
  _Block_object_dispose(&buf, 8);
}

- (id)prewarmedAudioDeviceInput:(id)a3 device:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_prewarmAudioVideoDeviceTypes_onceToken != -1) {
    dispatch_once(&_prewarmAudioVideoDeviceTypes_onceToken, &__block_literal_global_37);
  }
  if ((id)prewarmedAudioDeviceType != v5) {
    goto LABEL_7;
  }
  if (_prewarmAudioVideoDevices_onceToken != -1) {
    dispatch_once(&_prewarmAudioVideoDevices_onceToken, &__block_literal_global_41);
  }
  if ((id)prewarmedAudioDevice == v6)
  {
    id v7 = (id)prewarmedAudioDeviceInput;
    CFStringRef v9 = (void *)prewarmedAudioDeviceInput;
    prewarmedAudioDeviceInput = 0;
  }
  else
  {
LABEL_7:
    id v7 = 0;
  }

  return v7;
}

- (CAMCaptureEngine)initWithPowerController:(id)a3 captureController:(id)a4 options:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v86.receiver = self;
  v86.super_class = (Class)CAMCaptureEngine;
  char v11 = [(CAMCaptureEngine *)&v86 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->__captureController, v10);
    objc_storeStrong((id *)&v12->__powerController, a3);
    v12->__engineOptions = a5;
    uint64_t v13 = [(CAMCaptureEngine *)v12 prewarmedCaptureSession];
    captureSession = v12->__captureSession;
    v12->__captureSession = (AVCaptureSession *)v13;

    if (!v12->__captureSession)
    {
      id v15 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x263EFA638]);
      uint64_t v16 = v12->__captureSession;
      v12->__captureSession = v15;
    }
    AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout();
    id v17 = off_263F9E000;
    __int16 v18 = +[CAMCaptureCapabilities capabilities];
    id v73 = v9;
    v71 = v18;
    if (([v18 isSpatialOverCaptureSupported] & 1) != 0
      || [v18 isAspectRatioCropSupported])
    {
      uint64_t v19 = [objc_alloc(MEMORY[0x263EFA8A0]) initWithSession:v12->__captureSession];
      overCaptureVideoPreviewLayer = v12->__overCaptureVideoPreviewLayer;
      v12->__overCaptureVideoPreviewLayer = (AVSpatialOverCaptureVideoPreviewLayer *)v19;

      objc_storeStrong((id *)&v12->__videoPreviewLayer, v12->__overCaptureVideoPreviewLayer);
      if (objc_opt_respondsToSelector()) {
        [(AVSpatialOverCaptureVideoPreviewLayer *)v12->__overCaptureVideoPreviewLayer setAutomaticallyDimsOverCaptureRegion:0];
      }
    }
    else
    {
      uint64_t v21 = [objc_alloc(MEMORY[0x263EFA6B0]) initWithSession:v12->__captureSession];
      videoPreviewLayer = v12->__videoPreviewLayer;
      v12->__videoPreviewLayer = (AVCaptureVideoPreviewLayer *)v21;
    }
    CGFloat v23 = [[CAMMemoizationCache alloc] initWithMemoizesNil:0];
    captureEngineDeviceCache = v12->__captureEngineDeviceCache;
    v12->__captureEngineDeviceCache = v23;

    CGFloat v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v12 selector:sel__handleSessionDidStartRunning_ name:*MEMORY[0x263EF9700] object:v12->__captureSession];
    [v25 addObserver:v12 selector:sel__handleSessionDidStopRunning_ name:*MEMORY[0x263EF9708] object:v12->__captureSession];
    [v25 addObserver:v12 selector:sel__handleSessionRuntimeError_ name:*MEMORY[0x263EF9798] object:v12->__captureSession];
    [v25 addObserver:v12 selector:sel__handleSessionInterruption_ name:*MEMORY[0x263EF97A0] object:v12->__captureSession];
    [v25 addObserver:v12 selector:sel__handleSessionInterruptionEnded_ name:*MEMORY[0x263EF9718] object:v12->__captureSession];
    id v26 = +[CAMCaptureCapabilities capabilities];
    int v27 = [v26 isInternalInstall];

    if (v27) {
      [v25 addObserver:v12 selector:sel__handleSessionWasPrewarmed_ name:@"AVCaptureSessionWasPrewarmedNotification" object:v12->__captureSession];
    }
    id v72 = v10;
    uint64_t v28 = +[CAMPriorityNotificationCenter defaultCenter];
    [v28 addObserver:v12 selector:sel__handleApplicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
    v70 = v28;
    [v28 addObserver:v12 selector:sel__handleApplicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
    p_captureSessionQueue = (void **)&v12->__captureSessionQueue;
    objc_storeStrong((id *)&v12->__captureSessionQueue, (id)prewarmedCaptureSessionQueue);
    captureSessionQueue = v12->__captureSessionQueue;
    if (!captureSessionQueue)
    {
      id v31 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v32 = dispatch_queue_create("com.apple.camera.capture-engine.session-queue", v31);
      id v33 = *p_captureSessionQueue;
      *p_captureSessionQueue = v32;

      captureSessionQueue = *p_captureSessionQueue;
    }
    [(AVCaptureSession *)v12->__captureSession setControlsDelegate:v12 queue:captureSessionQueue];
    uint64_t v81 = MEMORY[0x263EF8330];
    uint64_t v82 = 3221225472;
    v83 = __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke;
    v84 = &unk_263FA0208;
    unsigned int v34 = v12;
    v85 = v34;
    pl_dispatch_async();
    v69 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v35 = dispatch_queue_create("com.apple.camera.capture-engine.results-queue", v69);
    captureResultsQueue = v34->__captureResultsQueue;
    v34->__captureResultsQueue = (OS_dispatch_queue *)v35;

    uint64_t v76 = MEMORY[0x263EF8330];
    uint64_t v77 = 3221225472;
    v78 = __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke_2;
    v79 = &unk_263FA0208;
    v37 = v34;
    v80 = v37;
    pl_dispatch_async();
    v68 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v38 = dispatch_queue_create("com.apple.camera.capture-engine.services-queue", v68);
    captureServicesQueue = v37->__captureServicesQueue;
    v37->__captureServicesQueue = (OS_dispatch_queue *)v38;

    v40 = v37->__captureServicesQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke_3;
    block[3] = &unk_263FA0208;
    v41 = v37;
    v75 = v41;
    dispatch_sync(v40, block);
    dispatch_queue_t v42 = dispatch_queue_create("com.apple.camera.capture-engine.recovery-queue", 0);
    recoveryMutexQueue = v41->__recoveryMutexQueue;
    v41->__recoveryMutexQueue = (OS_dispatch_queue *)v42;

    v44 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v45 = dispatch_queue_create("com.apple.camera.capture-engine.panorama-first-image-semaphore-queue", v44);
    panoramaFirstImageQueueUpdateSemaphoreQueue = v41->__panoramaFirstImageQueueUpdateSemaphoreQueue;
    v41->__panoramaFirstImageQueueUpdateSemaphoreQueue = (OS_dispatch_queue *)v45;

    v47 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v48 = dispatch_queue_create("com.apple.camera.capture-engine.effects-sample-buffer-queue", v47);
    effectsPreviewSampleBufferQueue = v41->__effectsPreviewSampleBufferQueue;
    v41->__effectsPreviewSampleBufferQueue = (OS_dispatch_queue *)v48;

    v67 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v50 = dispatch_queue_create("com.apple.camera.capture-engine.panorama-subgraph-queue", v67);
    panoramaSubgraphQueue = v41->__panoramaSubgraphQueue;
    v41->__panoramaSubgraphQueue = (OS_dispatch_queue *)v50;

    v52 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v53 = dispatch_queue_create("com.apple.camera.capture-engine.panorama-sample-buffer-queue", v52);
    panoramaSampleBufferQueue = v41->__panoramaSampleBufferQueue;
    v41->__panoramaSampleBufferQueue = (OS_dispatch_queue *)v53;

    v55 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v56 = dispatch_queue_create("com.apple.camera.capture-engine.signpost-mutex-queue", v55);
    signpostMutexQueue = v41->__signpostMutexQueue;
    v41->__signpostMutexQueue = (OS_dispatch_queue *)v56;

    uint64_t v58 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:8];
    didEmitCaptureIntervalStartedSignpostsForUniqueID = v41->__didEmitCaptureIntervalStartedSignpostsForUniqueID;
    v41->__didEmitCaptureIntervalStartedSignpostsForUniqueID = (NSMutableSet *)v58;

    v60 = +[CAMCaptureCapabilities capabilities];
    if ([v60 hostProcess])
    {
      v61 = +[CAMCaptureCapabilities capabilities];
      BOOL v62 = [v61 hostProcess] == 4;

      id v17 = off_263F9E000;
    }
    else
    {
      BOOL v62 = 1;
    }

    v63 = [(__objc2_class *)v17[18] capabilities];
    int v64 = [v63 shouldEnableUserNotifications];

    if (v64 && v62) {
      [(CAMCaptureEngine *)v41 setupLayoutMonitor];
    }
    v65 = v41;

    id v10 = v72;
    id v9 = v73;
  }

  return v12;
}

uint64_t __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 264);
  *(void *)(v3 + 264) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

uint64_t __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 248);
  *(void *)(v3 + 248) = v2;

  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = v5;

  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v9 + 272);
  *(void *)(v9 + 272) = v8;
  return MEMORY[0x270F9A758](v8, v10);
}

uint64_t __70__CAMCaptureEngine_initWithPowerController_captureController_options___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 304);
  *(void *)(v3 + 304) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)setupLayoutMonitor
{
  uint64_t v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "setupLayoutMonitor as enabled", (uint8_t *)buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  [v4 setNeedsUserInteractivePriority:1];
  objc_initWeak(buf, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __38__CAMCaptureEngine_setupLayoutMonitor__block_invoke;
  v6[3] = &unk_263FA56B8;
  objc_copyWeak(&v7, buf);
  [v4 setTransitionHandler:v6];
  id v5 = [MEMORY[0x263F3F728] monitorWithConfiguration:v4];
  [(CAMCaptureEngine *)self set_layoutMonitor:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __38__CAMCaptureEngine_setupLayoutMonitor__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__CAMCaptureEngine_setupLayoutMonitor__block_invoke_2;
  v7[3] = &unk_263FA0408;
  id v8 = v4;
  id v9 = WeakRetained;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __38__CAMCaptureEngine_setupLayoutMonitor__block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v1 = [*(id *)(a1 + 32) elements];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v26;
    id v6 = @"com.apple.camera";
    id v7 = "com.apple.camera";
    id v8 = "Camera";
    *(void *)&long long v3 = 138412802;
    long long v22 = v3;
    do
    {
      uint64_t v9 = 0;
      uint64_t v23 = v4;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * v9);
        char v11 = objc_msgSend(v10, "identifier", v22);
        if ([v11 isEqual:v6])
        {
          uint64_t v12 = [v10 layoutRole];

          if (v12 == 6)
          {
            uint64_t v13 = os_log_create(v7, v8);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v14 = [v10 description];
              id v15 = v6;
              uint64_t v16 = v5;
              id v17 = v1;
              __int16 v18 = v8;
              uint64_t v19 = v7;
              int v20 = objc_msgSend(v10, "sb_isTransitioning");
              int v21 = [*(id *)(a1 + 40) _cameraTransitionInProcess];
              *(_DWORD *)long long buf = v22;
              unint64_t v30 = v14;
              __int16 v31 = 1024;
              int v32 = v20;
              id v7 = v19;
              id v8 = v18;
              v1 = v17;
              uint64_t v5 = v16;
              id v6 = v15;
              uint64_t v4 = v23;
              __int16 v33 = 1024;
              int v34 = v21;
              _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "transitionHandler Camera was foreground transitionHandler %@, sb_isTransitioning %i, _cameraTransitionInProccess %i", buf, 0x18u);
            }
            objc_msgSend(*(id *)(a1 + 40), "set_cameraTransitionInProcess:", objc_msgSend(v10, "sb_isTransitioning"));
          }
        }
        else
        {
        }
        ++v9;
      }
      while (v4 != v9);
      uint64_t v4 = [v1 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v4);
  }
}

- (void)dealloc
{
  long long v3 = [(CAMCaptureEngine *)self _layoutMonitor];
  [v3 invalidate];

  uint64_t v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  uint64_t v5 = +[CAMPriorityNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)CAMCaptureEngine;
  [(CAMCaptureEngine *)&v6 dealloc];
}

- (void)startWithRetryCount:(unint64_t)a3 retryInterval:(double)a4 logReason:(id)a5 completion:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  uint64_t v10 = [(CAMCaptureEngine *)self _captureSessionQueue];
  uint64_t v13 = v9;
  id v11 = v9;
  id v12 = v8;
  pl_dispatch_async();
}

uint64_t __75__CAMCaptureEngine_startWithRetryCount_retryInterval_logReason_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionQueue_startWithRetryCount:retryInterval:logReason:completion:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 64));
}

- (void)_sessionQueue_startWithRetryCount:(unint64_t)a3 retryInterval:(double)a4 logReason:(id)a5 completion:(id)a6
{
  *(void *)&v27[13] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = (void (**)(void))a6;
  id v12 = [(CAMCaptureEngine *)self _captureSessionQueue];
  dispatch_assert_queue_V2(v12);

  uint64_t v13 = [(CAMCaptureEngine *)self _captureSession];
  uint64_t v14 = [NSString stringWithFormat:@"CAMCaptureEngine start (id=%ld: \"%@\"", ++_sessionQueue_startWithRetryCount_retryInterval_logReason_completion__uniqueID, v10];
  LODWORD(v12) = [v13 isRunning];
  id v15 = os_log_create("com.apple.camera", "Camera");
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v16)
    {
      *(_DWORD *)long long buf = 138543362;
      long long v25 = v14;
      _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Session is already running. Skipping call to -[AVCaptureSession startRunning].", buf, 0xCu);
    }
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)long long buf = 138543362;
      long long v25 = v14;
      _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Session is not running. Calling -[AVCaptureSession startRunning].", buf, 0xCu);
    }

    [(CAMCaptureEngine *)self _scheduleDelayedSessionNonstartRecovery];
    double Current = CFAbsoluteTimeGetCurrent();
    if (a3 == -1)
    {
LABEL_7:
      double v18 = CFAbsoluteTimeGetCurrent();
      id v15 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = [v13 isInterrupted];
        *(_DWORD *)long long buf = 138543874;
        long long v25 = v14;
        __int16 v26 = 1024;
        *(_DWORD *)long long v27 = v19;
        v27[2] = 2048;
        *(double *)&v27[3] = v18 - Current;
        _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to start capture session. isInterrupted=%d (took %.3f seconds)", buf, 0x1Cu);
      }
    }
    else
    {
      for (uint64_t i = 0; ; ++i)
      {
        CAMSignpostWithIDAndArgs(4, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
        CAMSignpostWithIDAndArgs(15, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
        [v13 startRunning];
        CAMSignpostWithIDAndArgs(16, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
        if ([v13 isRunning]) {
          break;
        }
        if (a3 == i) {
          goto LABEL_7;
        }
        int v21 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          long long v25 = v14;
          __int16 v26 = 2048;
          *(double *)long long v27 = a4;
          _os_log_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: -[AVCaptureSession startRunning] failed. Waiting %.3f seconds for retry.", buf, 0x16u);
        }

        [MEMORY[0x263F08B88] sleepForTimeInterval:a4];
        long long v22 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543618;
          long long v25 = v14;
          __int16 v26 = 2048;
          *(void *)long long v27 = i + 2;
          _os_log_impl(&dword_2099F8000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling -[AVCaptureSession startRunning] for attempt #%ld", buf, 0x16u);
        }
      }
      double v23 = CFAbsoluteTimeGetCurrent();
      id v15 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        long long v25 = v14;
        __int16 v26 = 2048;
        *(double *)long long v27 = v23 - Current;
        _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: -[AVCaptureSession startRunning] succeeded (took %.3f seconds)", buf, 0x16u);
      }
    }
  }

  if (v11) {
    v11[2](v11);
  }
}

- (void)stopWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CAMCaptureEngine *)self _cancelDelayedSessionNonstartRecovery];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(CAMCaptureEngine *)self _recoveryMutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CAMCaptureEngine_stopWithCompletion___block_invoke;
  block[3] = &unk_263FA35E8;
  void block[4] = self;
  void block[5] = &v12;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v13 + 24))
  {
    objc_super v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_opt_class();
      *(_DWORD *)long long buf = 138543362;
      id v17 = v7;
      id v8 = v7;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing performing recovery flag due to calling stopWithCompletion: ", buf, 0xCu);
    }
    [(CAMCaptureEngine *)self _resetPerformingRecoveryState];
  }
  id v9 = [(CAMCaptureEngine *)self _captureSessionQueue];
  id v10 = v4;
  pl_dispatch_async();

  _Block_object_dispose(&v12, 8);
}

uint64_t __39__CAMCaptureEngine_stopWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isPerformingRecovery];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __39__CAMCaptureEngine_stopWithCompletion___block_invoke_100(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Servicing an explicit request to stop the session using -[AVCaptureSession stopRunning] regardless of whether it is running or not", v5, 2u);
  }

  long long v3 = [*(id *)(a1 + 32) _captureSession];
  [*(id *)(a1 + 32) _cancelDelayedSessionNonstartRecovery];
  CAMSignpostWithIDAndArgs(8, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  CAMSignpostWithIDAndArgs(17, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  [v3 stopRunning];
  CAMSignpostWithIDAndArgs(18, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

- (void)cancelAutoResumeAfterDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMCaptureEngine *)self _captureSessionQueue];
  id v6 = v4;
  pl_dispatch_async();
}

void __46__CAMCaptureEngine_cancelAutoResumeAfterDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _captureSession];
  [v2 cancelForegroundAutoResumeAfterDate:*(void *)(a1 + 40)];
}

uint64_t __50__CAMCaptureEngine__handleSessionDidStartRunning___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setResultsQueueLastCompletedVideoURL:0];
}

void __50__CAMCaptureEngine__handleSessionDidStartRunning___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 handleSessionDidStartRunning];
  }
}

void __49__CAMCaptureEngine__handleSessionDidStopRunning___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 handleSessionDidStopRunning];
  }
}

uint64_t __49__CAMCaptureEngine__handleSessionDidStopRunning___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isPerformingRecovery];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_handleSessionRuntimeError:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x263EF9710]];
  uint64_t v19 = 0;
  int v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v7 = [(CAMCaptureEngine *)self _recoveryMutexQueue];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__CAMCaptureEngine__handleSessionRuntimeError___block_invoke;
  v18[3] = &unk_263FA35E8;
  v18[4] = self;
  v18[5] = &v19;
  dispatch_sync(v7, v18);

  if (*((unsigned char *)v20 + 24)) {
    id v8 = @"during recovery ";
  }
  else {
    id v8 = &stru_26BD78BA0;
  }
  id v9 = v8;
  id v10 = os_log_create("com.apple.camera", "Camera");
  id v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)long long buf = 138543874;
      id v24 = v12;
      __int16 v25 = 2114;
      __int16 v26 = v9;
      __int16 v27 = 2114;
      id v28 = v6;
      id v13 = v12;
      _os_log_error_impl(&dword_2099F8000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] Received a session runtime error notification %{public}@: %{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = objc_opt_class();
    *(_DWORD *)long long buf = 138543874;
    id v24 = v14;
    __int16 v25 = 2114;
    __int16 v26 = v9;
    __int16 v27 = 2114;
    id v28 = v4;
    id v15 = v14;
    _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received a session runtime error notification %{public}@without an explicit error: %{public}@", buf, 0x20u);
  }
  if (*((unsigned char *)v20 + 24))
  {
    BOOL v16 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = objc_opt_class();
      [(CAMCaptureEngine *)v17 _handleSessionRuntimeError:(uint64_t)buf];
    }
  }
  else
  {
    [(CAMCaptureEngine *)self _performSessionRuntimeRecovery:v6];
  }

  _Block_object_dispose(&v19, 8);
}

uint64_t __47__CAMCaptureEngine__handleSessionRuntimeError___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isPerformingRecovery];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __59__CAMCaptureEngine__performSessionNonstartRecoveryIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isPerformingRecovery];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) _setPerformingRecovery:1];
    long long v3 = *(void **)(a1 + 32);
    return [v3 _setNumberOfRecoveryAttempts:0];
  }
  return result;
}

- (void)_performSessionRuntimeRecovery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    [(CAMCaptureEngine *)(uint64_t)self _performSessionRuntimeRecovery:v5];
  }

  id v6 = [(CAMCaptureEngine *)self _recoveryMutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CAMCaptureEngine__performSessionRuntimeRecovery___block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  dispatch_sync(v6, block);

  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __51__CAMCaptureEngine__performSessionRuntimeRecovery___block_invoke_2;
  id v11 = &unk_263FA5728;
  id v12 = v4;
  id v7 = v4;
  [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:&v8];
  [(CAMCaptureEngine *)self _recoverFromSessionRuntimeError];
}

uint64_t __51__CAMCaptureEngine__performSessionRuntimeRecovery___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPerformingRecovery:1];
}

void __51__CAMCaptureEngine__performSessionRuntimeRecovery___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 willPerformRecoveryFromRuntimeError:*(void *)(a1 + 32)];
  }
}

uint64_t __47__CAMCaptureEngine__handleSessionInterruption___block_invoke_133(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(a1 + 32) _isPerformingRecovery];
  if (result)
  {
    id v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = (id)objc_opt_class();
      id v4 = v6;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Clearing performing recovery flag due to interruptions ", (uint8_t *)&v5, 0xCu);
    }
    [*(id *)(a1 + 32) _setPerformingRecovery:0];
    return [*(id *)(a1 + 32) _setNumberOfRecoveryAttempts:0];
  }
  return result;
}

void __47__CAMCaptureEngine__handleSessionInterruption___block_invoke_134(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 handleSessionInterruptionForReason:*(void *)(a1 + 32)];
  }
}

- (void)_handleSessionInterruptionEnded:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] AVCaptureSession interruption ended!", (uint8_t *)&v6, 0xCu);
  }
  [(CAMCaptureEngine *)self _setInterrupted:0];
  [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:&__block_literal_global_139];
}

void __52__CAMCaptureEngine__handleSessionInterruptionEnded___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 handleSessionInterruptionEnded];
  }
}

- (double)_delayForRecoveryAttempt:(unint64_t)a3
{
  unint64_t v3 = 4;
  if (a3 < 4) {
    unint64_t v3 = a3;
  }
  return _delayForRecoveryAttempt__delayForAttempt[v3];
}

- (void)_recoverFromSessionRuntimeError
{
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  id v1 = v0;
  OUTLINED_FUNCTION_0(&dword_2099F8000, v2, v3, "[%{public}@] Attempting to recover from a session runtime error by restarting the AVCaptureSession...", v4, v5, v6, v7, v8);
}

- (void)_resetPerformingRecoveryState
{
  uint64_t v3 = [(CAMCaptureEngine *)self _recoveryMutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CAMCaptureEngine__resetPerformingRecoveryState__block_invoke;
  block[3] = &unk_263FA0208;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __49__CAMCaptureEngine__resetPerformingRecoveryState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setPerformingRecovery:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _setNumberOfRecoveryAttempts:0];
}

- (void)_handleFailedSessionRecoveryAttemptAfterDelay:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v5 = [(CAMCaptureEngine *)self _recoveryMutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke;
  block[3] = &unk_263FA35E8;
  void block[4] = self;
  void block[5] = &v21;
  dispatch_sync(v5, block);

  if (*((unsigned char *)v22 + 24))
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    uint64_t v6 = [(CAMCaptureEngine *)self _recoveryMutexQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke_2;
    v15[3] = &unk_263FA35E8;
    void v15[4] = self;
    v15[5] = &v16;
    dispatch_sync(v6, v15);

    unint64_t v7 = v17[3];
    if (v7 == 5)
    {
      uint8_t v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_opt_class();
        -[CAMCaptureEngine _handleFailedSessionRecoveryAttemptAfterDelay:]();
      }
    }
    else
    {
      if (v7 < 6)
      {
        if (v3)
        {
          -[CAMCaptureEngine _delayForRecoveryAttempt:](self, "_delayForRecoveryAttempt:");
          double v10 = v9;
          id v11 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            id v12 = objc_opt_class();
            [(CAMCaptureEngine *)v12 _handleFailedSessionRecoveryAttemptAfterDelay:v10];
          }

          dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
          id v13 = [(CAMCaptureEngine *)self _captureSessionQueue];
          pl_dispatch_after();
        }
        else
        {
          uint64_t v14 = [(CAMCaptureEngine *)self _captureSessionQueue];
          pl_dispatch_async();
        }
        goto LABEL_15;
      }
      uint8_t v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_opt_class();
        -[CAMCaptureEngine _handleFailedSessionRecoveryAttemptAfterDelay:]();
      }
    }

LABEL_15:
    _Block_object_dispose(&v16, 8);
  }
  _Block_object_dispose(&v21, 8);
}

uint64_t __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isPerformingRecovery];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _numberOfRecoveryAttempts]+ 1;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return [v2 _setNumberOfRecoveryAttempts:v3];
}

uint64_t __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke_145(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recoverFromSessionRuntimeError];
}

uint64_t __66__CAMCaptureEngine__handleFailedSessionRecoveryAttemptAfterDelay___block_invoke_2_146(uint64_t a1)
{
  return [*(id *)(a1 + 32) _recoverFromSessionRuntimeError];
}

- (void)_validateSessionRecovery
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CAMCaptureEngine *)self _captureSession];
  if ([v3 isRunning])
  {
    uint64_t v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = (id)objc_opt_class();
      id v5 = v7;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] AVCaptureSession is successfully running after error recovery!", (uint8_t *)&v6, 0xCu);
    }
    [(CAMCaptureEngine *)self _resetPerformingRecoveryState];
  }
  else
  {
    [(CAMCaptureEngine *)self _handleFailedSessionRecoveryAttemptAfterDelay:1];
  }
}

uint64_t __60__CAMCaptureEngine__scheduleDelayedRecoveryCheckIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _validateSessionRecovery];
}

- (void)_handleApplicationWillEnterForeground:(id)a3
{
  uint64_t v3 = [(CAMCaptureEngine *)self _captureSessionQueue];
  pl_dispatch_async();
}

uint64_t __58__CAMCaptureEngine__handleApplicationWillEnterForeground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePanoramaSubgraphForEnteringBackground:0];
}

- (id)_currentNotificationCenter
{
  uint64_t v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  if ([v3 isEqualToString:@"com.apple.camera.CameraMessagesApp"])
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F1DFB0]) initWithBundleIdentifier:v3];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F1DFB0] currentNotificationCenter];
  }
  id v5 = (void *)v4;

  return v5;
}

- (void)_handleSessionWasPrewarmed:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  int v6 = [v4 userInfo];

  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263EF96E8]];

  uint64_t v8 = os_log_create("com.apple.camera", "Camera");
  double v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Session was prewarmed for %@", (uint8_t *)&v11, 0xCu);
    }

    if ([v7 isEqualToString:*MEMORY[0x263EF96D8]])
    {
      [(CAMCaptureEngine *)self _setAccidentalLaunchPrewarmTime:Current];
      [(CAMCaptureEngine *)self _setAccidentalLaunchTimeout:3.0];
      [(CAMCaptureEngine *)self _setAccidentalLaunchPrewarmReason:v7];
    }
    else
    {
      double v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[CAMCaptureEngine _handleSessionWasPrewarmed:]();
      }
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureEngine _handleSessionWasPrewarmed:]();
    }
  }
}

- (void)stopMonitoringForAccidentalLaunch
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__CAMCaptureEngine_stopMonitoringForAccidentalLaunch__block_invoke;
  v2[3] = &unk_263FA0208;
  v2[4] = self;
  cam_perform_on_main_asap(v2);
}

uint64_t __53__CAMCaptureEngine_stopMonitoringForAccidentalLaunch__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setAccidentalLaunchPrewarmTime:0.0];
  [*(id *)(a1 + 32) _setAccidentalLaunchTimeout:0.0];
  [*(id *)(a1 + 32) _setAccidentalLaunchPrewarmReason:0];
  uint64_t v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "set_cameraTransitionInProcess:", 0);
}

- (void)_showAccidentalLaunchNotificationIfNecessary
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "TTR: Showing an accidental launch TapToRadar alert, prewarmReason: %{public}@", v2, v3, v4, v5, v6);
}

void __64__CAMCaptureEngine__showAccidentalLaunchNotificationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__CAMCaptureEngine__showAccidentalLaunchNotificationIfNecessary__block_invoke_cold_1(a1, v3);
    }
  }
}

- (NSDate)_lastTapToRadarTime
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->__lastTapToRadarTime)
  {
    id v3 = (NSDate *)CFPreferencesCopyAppValue(@"lastTapToRadar", @"com.apple.camera");
    lastTapToRadarTime = self->__lastTapToRadarTime;
    self->__lastTapToRadarTime = v3;

    uint64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint8_t v6 = self->__lastTapToRadarTime;
      int v13 = 138412290;
      uint64_t v14 = v6;
      _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "TTR: read last fired time: %@", (uint8_t *)&v13, 0xCu);
    }

    id v7 = self->__lastTapToRadarTime;
    if (!v7 || ([(NSDate *)v7 timeIntervalSinceNow], v8 > 0.0))
    {
      double v9 = [MEMORY[0x263EFF910] distantPast];
      double v10 = self->__lastTapToRadarTime;
      self->__lastTapToRadarTime = v9;
    }
  }
  int v11 = self->__lastTapToRadarTime;
  return v11;
}

- (id)_videoDeviceInputFromSession:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__24;
  id v12 = __Block_byref_object_dispose__24;
  id v13 = 0;
  uint64_t v4 = [v3 inputs];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CAMCaptureEngine__videoDeviceInputFromSession___block_invoke;
  v7[3] = &unk_263FA5798;
  void v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  id v5 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __49__CAMCaptureEngine__videoDeviceInputFromSession___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v12;
  if (isKindOfClass)
  {
    id v9 = v12;
    uint64_t v10 = [v9 device];
    if ([v10 hasMediaType:*MEMORY[0x263EF9D48]])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a4 = 1;
    }

    id v8 = v12;
  }
  return MEMORY[0x270F9A758](isKindOfClass, v8);
}

- (id)_photoOutputFromSession:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int v11 = __Block_byref_object_copy__24;
  id v12 = __Block_byref_object_dispose__24;
  id v13 = 0;
  uint64_t v4 = [v3 outputs];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CAMCaptureEngine__photoOutputFromSession___block_invoke;
  v7[3] = &unk_263FA57C0;
  void v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __44__CAMCaptureEngine__photoOutputFromSession___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __35__CAMCaptureEngine__updateContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v7 = v3;
  if ((id)v4[3] == v3)
  {
    id v3 = (id)[*(id *)(a1 + 40) setCurrentStillImageOutput:v3];
  }
  else
  {
    id v5 = v3;
    if ((id)v4[4] == v3)
    {
      id v3 = (id)[*(id *)(a1 + 40) setCurrentMovieFileOutput:v3];
    }
    else if ((id)v4[5] == v3)
    {
      id v3 = (id)[*(id *)(a1 + 40) setCurrentPanoramaOutput:v3];
    }
    else if ((id)v4[6] == v3)
    {
      id v3 = (id)[*(id *)(a1 + 40) setCurrentMetadataOutput:v3];
    }
    else if ((id)v4[7] == v3)
    {
      id v3 = (id)[*(id *)(a1 + 40) setCurrentEffectsPreviewOutput:v3];
    }
    else
    {
      if ((id)v4[8] != v3) {
        goto LABEL_14;
      }
      id v3 = (id)[*(id *)(a1 + 40) setCurrentVideoThumbnailOutput:v3];
    }
  }
  id v5 = v7;
LABEL_14:
  return MEMORY[0x270F9A758](v3, v5);
}

uint64_t __35__CAMCaptureEngine__updateContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(id *)(a1 + 32) == v3)
  {
    id v7 = v3;
    id v3 = (id)[*(id *)(a1 + 40) setSystemZoomSlider:v3];
  }
  else if (*(id *)(a1 + 48) == v3)
  {
    id v7 = v3;
    id v3 = (id)[*(id *)(a1 + 40) setSystemLensSelector:v3];
  }
  else if (*(id *)(a1 + 56) == v3)
  {
    id v7 = v3;
    id v3 = (id)[*(id *)(a1 + 40) setSystemExposureBiasSlider:v3];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 64);
    if (*(id *)(v5 + 72) == v3)
    {
      id v7 = v3;
      id v3 = (id)[*(id *)(a1 + 40) setApertureSlider:v3];
    }
    else
    {
      if (*(id *)(v5 + 88) != v3) {
        goto LABEL_12;
      }
      id v7 = v3;
      id v3 = (id)[*(id *)(a1 + 40) setEmulatedZoomSlider:v3];
    }
  }
  id v4 = v7;
LABEL_12:
  return MEMORY[0x270F9A758](v3, v4);
}

- (BOOL)_isSessionModificationRequiredByCommand:(id)a3 logReason:(id *)a4 minimumExecutionTime:(double *)a5
{
  id v8 = a3;
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  char v29 = [v8 requiresSessionModification];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__24;
  char v24 = __Block_byref_object_dispose__24;
  id v25 = 0;
  uint64_t v16 = 0;
  id v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if (*((unsigned char *)v27 + 24))
  {
    uint64_t v9 = [v8 sessionModificationLogReason];
    uint64_t v10 = (void *)v21[5];
    v21[5] = v9;

    [v8 sessionModificationMinimumExecutionTime];
    *((void *)v17 + 3) = v11;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v14 = [v8 subcommands];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__CAMCaptureEngine__isSessionModificationRequiredByCommand_logReason_minimumExecutionTime___block_invoke;
  v15[3] = &unk_263FA5860;
  void v15[4] = self;
  v15[5] = &v26;
  void v15[6] = &v20;
  v15[7] = &v16;
  [v14 enumerateObjectsUsingBlock:v15];

  if (a4) {
LABEL_3:
  }
    *a4 = (id) v21[5];
LABEL_4:
  if (a5) {
    *a5 = v17[3];
  }
  char v12 = *((unsigned char *)v27 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

void __91__CAMCaptureEngine__isSessionModificationRequiredByCommand_logReason_minimumExecutionTime___block_invoke(void *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint8_t v6 = (void *)a1[4];
  uint64_t v7 = a1[7];
  id v8 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  char v9 = [v6 _isSessionModificationRequiredByCommand:a2 logReason:&obj minimumExecutionTime:*(void *)(v7 + 8) + 24];
  objc_storeStrong(v8, obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v9;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24)) {
    *a4 = 1;
  }
}

- (void)_beginSessionConfigurationIfRequiredByCommand:(id)a3 withContext:(id)a4 logReason:(id *)a5 minimumExecutionTime:(double *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v20 = 0;
  char v12 = [(CAMCaptureEngine *)self _captureSession];
  id v13 = 0;
  if (([v12 isBeingConfigured] & 1) == 0)
  {
    id v19 = 0;
    BOOL v14 = [(CAMCaptureEngine *)self _isSessionModificationRequiredByCommand:v10 logReason:&v19 minimumExecutionTime:&v20];
    id v13 = v19;
    if (v14)
    {
      [v11 setCurrentCaptureSession:v12];
      uint64_t v15 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        id v22 = v13;
        _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling -[AVCaptureSession beginConfiguration]", buf, 0xCu);
      }

      double Current = CFAbsoluteTimeGetCurrent();
      CAMSignpostWithIDAndArgs(19, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
      [v12 beginConfiguration];
      CAMSignpostWithIDAndArgs(20, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
      double v17 = CFAbsoluteTimeGetCurrent();
      uint64_t v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543618;
        id v22 = v13;
        __int16 v23 = 2048;
        double v24 = v17 - Current;
        _os_log_impl(&dword_2099F8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished -[AVCaptureSession beginConfiguration] (took %.3f seconds)", buf, 0x16u);
      }
    }
  }
  if (a5) {
    *a5 = v13;
  }
  if (a6) {
    *(void *)a6 = v20;
  }
}

- (void)_commitSessionConfigurationIfNecessaryWithLogReason:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CAMCaptureEngine *)self _captureSession];
  if ([v5 isBeingConfigured])
  {
    uint8_t v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v26 = (uint64_t)v4;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling -[AVCaptureSession commitConfiguration]", buf, 0xCu);
    }

    double Current = CFAbsoluteTimeGetCurrent();
    CAMSignpostWithIDAndArgs(21, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
    [v5 commitConfiguration];
    CAMSignpostWithIDAndArgs(22, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
    double v8 = CFAbsoluteTimeGetCurrent();
    char v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      uint64_t v26 = (uint64_t)v4;
      __int16 v27 = 2048;
      double v28 = v8 - Current;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished -[AVCaptureSession commitConfiguration] (took %.3f seconds)", buf, 0x16u);
    }

    [(CAMCaptureEngine *)self _updateCurrentlyConfiguredObjects];
    BOOL v10 = [(CAMCaptureEngine *)self _updatePanoramaSubgraphForEnteringBackground:0];
    [(CAMCaptureEngine *)self _updateEffectsSubgraph];
    [(CAMCaptureEngine *)self _updateVideoThumbnailSubgraph];
    int v11 = [v5 isRunning];
    int v12 = [v5 isInterrupted];
    BOOL v13 = [(CAMCaptureEngine *)self _shouldStartSessionOnConfigurationChanges];
    if ((v11 & ~v12 & 1) == 0 && v13) {
      [(CAMCaptureEngine *)self _sessionQueue_startWithRetryCount:0 retryInterval:@"post commitConfiguration" logReason:0 completion:0.0];
    }
    int v14 = [v5 isRunning];
    char v15 = [v5 isInterrupted];
    if (v10 && (v15 & 1) == 0 && v14)
    {
      dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
      double v17 = [(CAMCaptureEngine *)self _panoramaFirstImageQueueUpdateSemaphoreQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __72__CAMCaptureEngine__commitSessionConfigurationIfNecessaryWithLogReason___block_invoke;
      block[3] = &unk_263FA0408;
      void block[4] = self;
      uint64_t v18 = v16;
      double v24 = v18;
      dispatch_sync(v17, block);

      dispatch_time_t v19 = dispatch_time(0, 4000000000);
      if (dispatch_semaphore_wait(v18, v19))
      {
        uint64_t v20 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v26 = 0x4010000000000000;
          _os_log_impl(&dword_2099F8000, v20, OS_LOG_TYPE_DEFAULT, "Failed to update panorama image queue in %f seconds. Continuing configuration", buf, 0xCu);
        }
      }
      uint64_t v21 = [(CAMCaptureEngine *)self _panoramaFirstImageQueueUpdateSemaphoreQueue];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __72__CAMCaptureEngine__commitSessionConfigurationIfNecessaryWithLogReason___block_invoke_200;
      v22[3] = &unk_263FA0208;
      v22[4] = self;
      dispatch_sync(v21, v22);
    }
  }
}

uint64_t __72__CAMCaptureEngine__commitSessionConfigurationIfNecessaryWithLogReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPanoramaFirstImageQueueUpdateSemaphore:*(void *)(a1 + 40)];
}

uint64_t __72__CAMCaptureEngine__commitSessionConfigurationIfNecessaryWithLogReason___block_invoke_200(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPanoramaFirstImageQueueUpdateSemaphore:0];
}

- (void)_updateCurrentlyConfiguredObjects
{
  id v3 = [(CAMCaptureEngine *)self _captureSession];
  id v9 = [(CAMCaptureEngine *)self _videoDeviceInputFromSession:v3];

  id v4 = [v9 device];
  uint64_t v5 = [(CAMCaptureEngine *)self _captureSession];
  uint8_t v6 = [(CAMCaptureEngine *)self _photoOutputFromSession:v5];

  uint64_t v7 = [(CAMCaptureEngine *)self currentCameraDevice];

  if (v7 != v4) {
    [(CAMCaptureEngine *)self setCurrentCameraDevice:v4];
  }
  double v8 = [(CAMCaptureEngine *)self currentStillImageOutput];

  if (v8 != v6) {
    [(CAMCaptureEngine *)self setCurrentStillImageOutput:v6];
  }
}

void __35__CAMCaptureEngine_enqueueCommand___block_invoke_203(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"CAMCaptureEngineExecutedCommandWithContextNotification" object:*(void *)(a1 + 32) userInfo:*(void *)(a1 + 40)];
}

- (void)enqueueCommands:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[CAMCaptureCommand alloc] initWithSubcommands:v4];

  [(CAMCaptureEngine *)self enqueueCommand:v5];
}

- (void)unregisterCaptureService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMCaptureEngine *)self _captureServicesQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__CAMCaptureEngine_unregisterCaptureService___block_invoke;
  v7[3] = &unk_263FA0408;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __45__CAMCaptureEngine_unregisterCaptureService___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _servicesQueueCaptureServices];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (id)overCaptureVideoPreviewLayer
{
  return self->__overCaptureVideoPreviewLayer;
}

uint64_t __66__CAMCaptureEngine_registerStillImageCaptureRequest_withSettings___block_invoke(uint64_t a1)
{
  id v2 = [[CAMCaptureRequestInfo alloc] initWithRequest:*(void *)(a1 + 48)];
  id v3 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  [v3 setObject:v2 forKeyedSubscript:v4];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) uniqueID];
  double Current = CFAbsoluteTimeGetCurrent();
  return [v5 _checkCallbacksForUniqueID:v6 afterDelay:5.0 startTime:Current];
}

- (void)_checkCallbacksForUniqueID:(int64_t)a3 afterDelay:(double)a4 startTime:(double)a5
{
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  BOOL v10 = [(CAMCaptureEngine *)self _captureResultsQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__CAMCaptureEngine__checkCallbacksForUniqueID_afterDelay_startTime___block_invoke;
  v11[3] = &unk_263FA53D0;
  v11[4] = self;
  v11[5] = a3;
  *(double *)&v11[6] = a5;
  *(double *)&v11[7] = a4;
  dispatch_after(v9, v10, v11);
}

void __68__CAMCaptureEngine__checkCallbacksForUniqueID_afterDelay_startTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"captureID:%lld Have not received final callback in %f seconds. ", *(void *)(a1 + 40), CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_resultsQueue_logReceivedCallbacksForID:withIntroString:", *(void *)(a1 + 40), v5);
    [*(id *)(a1 + 32) _checkCallbacksForUniqueID:*(void *)(a1 + 40) afterDelay:*(double *)(a1 + 56) + 5.0 startTime:*(double *)(a1 + 48)];
  }
}

- (void)_resultsQueue_logReceivedCallbacksForID:(int64_t)a3 withIntroString:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [(CAMCaptureEngine *)self _captureResultsQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CAMCaptureEngine *)self _resultsQueueRegisteredStillImageRequests];
  dispatch_time_t v9 = [NSNumber numberWithLongLong:a3];
  BOOL v10 = [v8 objectForKey:v9];

  int v11 = [MEMORY[0x263F089D8] stringWithString:v6];
  int v12 = [v10 callbackReceipts];
  [v11 appendString:@"Callbacks received:\n"];
  if ([v12 count])
  {
    __int16 v27 = v10;
    id v28 = v6;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v26 = v12;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      double v17 = 0.0;
      do
      {
        uint64_t v18 = 0;
        double v19 = v17;
        do
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * v18);
          unint64_t v21 = [v20 callback];
          if (v21 > 0xC) {
            id v22 = 0;
          }
          else {
            id v22 = off_263FA5CF8[v21];
          }
          [v20 secondsSinceBegin];
          double v17 = v23;
          objc_msgSend(v11, "appendFormat:", @"\t%.3fs", *(void *)&v23);
          if (v19 == 0.0) {
            objc_msgSend(v11, "appendFormat:", @"\t\t\t", v25);
          }
          else {
            objc_msgSend(v11, "appendFormat:", @"\t(%.3fs)", v17 - v19);
          }
          [v11 appendFormat:@"\t%@\n", v22];
          ++v18;
          double v19 = v17;
        }
        while (v15 != v18);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v15);
    }

    double v24 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      dispatch_queue_t v35 = v11;
      _os_log_impl(&dword_2099F8000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
    BOOL v10 = v27;
    id v6 = v28;
    int v12 = v26;
  }
  else
  {
    [v11 appendString:@"None"];
    double v24 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      dispatch_queue_t v35 = v11;
      _os_log_impl(&dword_2099F8000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
}

- (void)currentInflightCapturesStringWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v6 = v4;
  pl_dispatch_async();
}

void __71__CAMCaptureEngine_currentInflightCapturesStringWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v3 = [v2 allKeys];
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v5 = [*(id *)(a1 + 32) _resultsQueueRequestsBeingRecorded];
  id v6 = [v5 allKeys];
  id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([v3 count])
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __71__CAMCaptureEngine_currentInflightCapturesStringWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_263FA33C8;
    id v8 = v4;
    id v14 = v8;
    [v3 enumerateObjectsUsingBlock:v13];
  }
  else
  {
    id v8 = [MEMORY[0x263F089D8] stringWithString:@"None"];
  }
  if ([v6 count])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __71__CAMCaptureEngine_currentInflightCapturesStringWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_263FA5950;
    id v9 = v7;
    id v12 = v9;
    [v6 enumerateObjectsUsingBlock:v11];
    id v7 = v12;
  }
  else
  {
    id v9 = [MEMORY[0x263F089D8] stringWithString:@"None"];
  }

  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8, v9, v10);
}

void __71__CAMCaptureEngine_currentInflightCapturesStringWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 stringValue];
  [v2 appendFormat:@"%@, ", v3];
}

uint64_t __71__CAMCaptureEngine_currentInflightCapturesStringWithCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@, ", a2];
}

- (void)cacheMomentCaptureSettings:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CAMCaptureEngine *)self _captureSessionQueue];
  dispatch_assert_queue_V2(v8);

  if (v7)
  {
    id v9 = [(CAMCaptureEngine *)self _sessionQueueCachedPhotoInitiationSettings];
    [v9 setObject:v6 forKeyedSubscript:v7];
  }
  else
  {
    id v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureEngine cacheMomentCaptureSettings:forIdentifier:]();
    }
  }
}

- (id)cachedMomentCaptureSettingsForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCaptureEngine *)self _captureSessionQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = [(CAMCaptureEngine *)self _sessionQueueCachedPhotoInitiationSettings];
    id v7 = [v6 objectForKeyedSubscript:v4];
  }
  else
  {
    id v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureEngine cachedMomentCaptureSettingsForIdentifier:]();
    }

    id v7 = 0;
  }

  return v7;
}

- (void)clearCachedMomentCaptureSettingsForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCaptureEngine *)self _captureSessionQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    id v6 = [(CAMCaptureEngine *)self _sessionQueueCachedPhotoInitiationSettings];
    [v6 setObject:0 forKeyedSubscript:v4];
  }
  else
  {
    id v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureEngine clearCachedMomentCaptureSettingsForIdentifier:]();
    }
  }
}

- (void)captureOutput:(id)a3 willBeginCaptureBeforeResolvingSettingsForUniqueID:(int64_t)a4
{
  CAMSignpostWithIDAndArgs(76, a4, a4, 0, 0, 0);
  CAMSignpostWithIDAndArgs(70, a4, a4, 0, 0, 0);
  CAMSignpostWithIDAndArgs(72, a4, a4, 0, 0, 0);
  mach_absolute_time();
  id v6 = [(CAMCaptureEngine *)self _signpostMutexQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__CAMCaptureEngine_captureOutput_willBeginCaptureBeforeResolvingSettingsForUniqueID___block_invoke;
  block[3] = &unk_263FA04E0;
  void block[4] = self;
  void block[5] = a4;
  dispatch_sync(v6, block);

  id v7 = [(CAMCaptureEngine *)self _captureResultsQueue];
  pl_dispatch_async();
}

void __85__CAMCaptureEngine_captureOutput_willBeginCaptureBeforeResolvingSettingsForUniqueID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _didEmitCaptureIntervalStartedSignpostsForUniqueID];
  id v2 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  [v3 addObject:v2];
}

void __85__CAMCaptureEngine_captureOutput_willBeginCaptureBeforeResolvingSettingsForUniqueID___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [v4 request];
  [v4 didReceiveCallback:11 atAbsoluteTime:*(void *)(a1 + 48)];
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__CAMCaptureEngine_captureOutput_willBeginCaptureBeforeResolvingSettingsForUniqueID___block_invoke_3;
  v8[3] = &unk_263FA5728;
  id v9 = v5;
  id v7 = v5;
  [v6 _enumerateCaptureServicesUsingBlock:v8];
  CAMSignpostWithIDAndArgs(77, *(void *)(a1 + 40), *(void *)(a1 + 40), 0, 0, 0);
}

void __85__CAMCaptureEngine_captureOutput_willBeginCaptureBeforeResolvingSettingsForUniqueID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequestDidBeginCaptureBeforeResolvingSettings:*(void *)(a1 + 32)];
  }
}

void __70__CAMCaptureEngine_captureOutput_willBeginCaptureForResolvedSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _didEmitCaptureIntervalStartedSignpostsForUniqueID];
  id v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  int v4 = [v2 containsObject:v3];

  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) _didEmitCaptureIntervalStartedSignpostsForUniqueID];
    id v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
    [v6 removeObject:v5];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __70__CAMCaptureEngine_captureOutput_willBeginCaptureForResolvedSettings___block_invoke_237(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  int v4 = [v2 objectForKeyedSubscript:v3];

  [v4 didReceiveCallback:0 atAbsoluteTime:*(void *)(a1 + 48)];
  id v5 = [v4 request];
  id v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__CAMCaptureEngine_captureOutput_willBeginCaptureForResolvedSettings___block_invoke_2;
  v8[3] = &unk_263FA5728;
  id v9 = v5;
  id v7 = v5;
  [v6 _enumerateCaptureServicesUsingBlock:v8];
  CAMSignpostWithIDAndArgs(36, *(void *)(a1 + 56), *(void *)(a1 + 56), 0, 0, 0);
}

void __70__CAMCaptureEngine_captureOutput_willBeginCaptureForResolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequestWillStartCapturingVideo:*(void *)(a1 + 32)];
  }
}

- (void)captureOutput:(id)a3 readyForResponsiveRequestAfterResolvedSettings:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend(a4, "uniqueID", a3);
  CAMSignpostWithIDAndArgs(99, v5, v5, 0, 0, 0);
  id v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v9 = v5;
    _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:readyForResponsiveRequestAfterResolvedSettings:", buf, 0xCu);
  }

  mach_absolute_time();
  id v7 = [(CAMCaptureEngine *)self _captureResultsQueue];
  pl_dispatch_async();
}

void __81__CAMCaptureEngine_captureOutput_readyForResponsiveRequestAfterResolvedSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 40)];
  int v4 = [v2 objectForKeyedSubscript:v3];

  uint64_t v5 = [v4 request];
  if (([v5 isCTMVideo] & 1) == 0)
  {
    [v4 didReceiveCallback:12 atAbsoluteTime:*(void *)(a1 + 48)];
    id v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __81__CAMCaptureEngine_captureOutput_readyForResponsiveRequestAfterResolvedSettings___block_invoke_2;
    v7[3] = &unk_263FA5728;
    id v8 = v5;
    [v6 _enumerateCaptureServicesUsingBlock:v7];
    CAMSignpostWithIDAndArgs(100, *(void *)(a1 + 40), *(void *)(a1 + 40), 0, 0, 0);
  }
}

void __81__CAMCaptureEngine_captureOutput_readyForResponsiveRequestAfterResolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequestDidUnblockResponsiveCapture:*(void *)(a1 + 32)];
  }
}

- (void)captureOutput:(id)a3 didFinishCapturingDeferredPhotoProxy:(id)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [v8 resolvedSettings];
  uint64_t v10 = [v9 uniqueID];

  CAMSignpostWithIDAndArgs(61, v10, v10, 0, 0, 0);
  int v11 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218242;
    uint64_t v13 = v10;
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishCapturingDeferredPhotoProxy:error:, error=%{public}@", (uint8_t *)&v12, 0x16u);
  }

  [(CAMCaptureEngine *)self _handleCaptureOutputDidFinishCapturingPhoto:0 deferredPhotoProxy:v8 error:v7];
}

- (void)_handleCaptureOutputDidFinishCapturingPhoto:(id)a3 deferredPhotoProxy:(id)a4 error:(id)a5
{
  uint64_t v26 = self;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = v8;
  }
  id v11 = v10;
  int v12 = [v11 resolvedSettings];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v13 = [v12 photoManifest];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        unsigned int v18 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "intValue", v26);
        if (v18 > [v11 expectedPhotoProcessingFlags])
        {

          goto LABEL_14;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  uint64_t v19 = [v12 uniqueID];
  CAMSignpostWithIDAndArgs(73, v19, v19, 0, 0, 0);
  CAMSignpostWithIDAndArgs(74, v19, v19, 0, 0, 0);
LABEL_14:
  mach_absolute_time();
  uint64_t v20 = [(CAMCaptureEngine *)v26 _captureResultsQueue];
  __int16 v27 = v11;
  id v28 = v9;
  long long v30 = v8;
  long long v29 = v7;
  id v21 = v8;
  id v22 = v7;
  id v23 = v9;
  id v24 = v11;
  id v25 = v12;
  pl_dispatch_async();
}

void __89__CAMCaptureEngine__handleCaptureOutputDidFinishCapturingPhoto_deferredPhotoProxy_error___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "uniqueID"));
  id v3 = [*(id *)(a1 + 40) _resultsQueueRegisteredStillImageRequests];
  int v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "uniqueID"));
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  id v6 = [v5 request];
  if (([v6 isCTMVideo] & 1) == 0)
  {
    id v7 = [*(id *)(a1 + 40) _coordinationInfoForRequest:v6 photo:*(void *)(a1 + 48)];
    id v8 = [v6 adjustmentFilters];
    BOOL v9 = v8 != 0;
    uint64_t v36 = v2;
    if (v7 && ([v7 isEV0ForHDREV0Pair] & 1) != 0)
    {
      uint64_t v10 = [v6 EV0PersistenceUUID];
    }
    else
    {
      uint64_t v10 = [v6 persistenceUUID];
    }
    id v11 = (void *)v10;
    char v12 = [v7 isUnfilteredImageForFilteredPair];
    uint64_t v13 = 0;
    long long v55 = 0uLL;
    if (*(void *)(a1 + 56))
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      if ((v12 & 1) == 0)
      {
        uint64_t v16 = *(void **)(a1 + 40);
        if (v16)
        {
          [v16 _previewFilterSetForRequest:v6 photo:*(void *)(a1 + 48)];
          uint64_t v14 = *((void *)&v52 + 1);
          uint64_t v15 = v52;
          uint64_t v13 = v54;
        }
        else
        {
          uint64_t v13 = 0;
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v54 = 0;
          long long v52 = 0u;
          long long v53 = 0u;
        }
        long long v55 = v53;
      }
    }
    if (*(void *)(a1 + 64)) {
      uint64_t v17 = 3;
    }
    else {
      uint64_t v17 = 4;
    }
    [v5 didReceiveCallback:v17 atAbsoluteTime:*(void *)(a1 + 80)];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __89__CAMCaptureEngine__handleCaptureOutputDidFinishCapturingPhoto_deferredPhotoProxy_error___block_invoke_2;
    aBlock[3] = &unk_263FA59C8;
    id v38 = *(id *)(a1 + 64);
    id v39 = *(id *)(a1 + 32);
    id v18 = v8;
    id v40 = v18;
    BOOL v51 = v9;
    id v19 = v11;
    id v41 = v19;
    id v20 = v7;
    id v42 = v20;
    uint64_t v47 = v15;
    uint64_t v48 = v14;
    long long v49 = v55;
    uint64_t v50 = v13;
    id v43 = *(id *)(a1 + 56);
    id v21 = *(id *)(a1 + 72);
    uint64_t v22 = *(void *)(a1 + 40);
    id v44 = v21;
    uint64_t v45 = v22;
    id v46 = v6;
    id v23 = _Block_copy(aBlock);
    id v24 = v23;
    uint64_t v25 = v15 != 0;
    if (v14) {
      ++v25;
    }
    if ((unint64_t)(v13 - 1) >= 0xFFFFFFFFFFFFFFFELL) {
      uint64_t v26 = 0;
    }
    else {
      uint64_t v26 = -1;
    }
    if (v25 == v26)
    {
      (*((void (**)(void *, void))v23 + 2))(v23, 0);
      id v2 = v36;
    }
    else
    {
      dispatch_queue_t v35 = v5;
      id v27 = v20;
      id v28 = v18;
      long long v29 = *(void **)(a1 + 40);
      id v34 = v19;
      uint64_t v30 = [*(id *)(a1 + 48) previewPixelBuffer];
      long long v31 = [*(id *)(a1 + 48) metadata];
      *(void *)&long long v52 = v15;
      *((void *)&v52 + 1) = v14;
      long long v53 = v55;
      uint64_t v54 = v13;
      long long v32 = v29;
      id v18 = v28;
      id v20 = v27;
      uint64_t v33 = v30;
      id v19 = v34;
      uint64_t v5 = v35;
      id v2 = v36;
      objc_msgSend(v32, "_resultsQueue_performPostprocessingForPreviewBuffer:metadata:filters:stillImageCaptureRequestKey:completionHandler:", v33, v31, &v52, v36, v24);
    }
  }
}

void __89__CAMCaptureEngine__handleCaptureOutputDidFinishCapturingPhoto_deferredPhotoProxy_error___block_invoke_2(uint64_t a1, CVPixelBufferRef pixelBuffer)
{
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(pixelBuffer);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [CAMStillImageCaptureResult alloc];
  if (v4)
  {
    id v6 = -[CAMStillImageCaptureResult initWithCapturePhoto:expectingPairedVideo:adjustmentFilters:filteredPreviewSurface:shouldPersistAdjustmentSidecar:persistenceUUID:coordinationInfo:semanticEnhancement:error:](v5, "initWithCapturePhoto:expectingPairedVideo:adjustmentFilters:filteredPreviewSurface:shouldPersistAdjustmentSidecar:persistenceUUID:coordinationInfo:semanticEnhancement:error:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "cam_isRecordingMovieForLivePhoto"), *(void *)(a1 + 48), IOSurface, *(unsigned __int8 *)(a1 + 144), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 136), *(void *)(a1 + 72));
    int v7 = 42;
  }
  else
  {
    id v6 = -[CAMStillImageCaptureResult initWithCaptureDeferredPhotoProxy:expectingPairedVideo:adjustmentFilters:filteredPreviewSurface:shouldPersistAdjustmentSidecar:persistenceUUID:coordinationInfo:semanticEnhancement:error:](v5, "initWithCaptureDeferredPhotoProxy:expectingPairedVideo:adjustmentFilters:filteredPreviewSurface:shouldPersistAdjustmentSidecar:persistenceUUID:coordinationInfo:semanticEnhancement:error:", *(void *)(a1 + 80), objc_msgSend(*(id *)(a1 + 40), "cam_isRecordingMovieForLivePhoto"), *(void *)(a1 + 48), IOSurface, *(unsigned __int8 *)(a1 + 144), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 136), *(void *)(a1 + 72));
    int v7 = 62;
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __89__CAMCaptureEngine__handleCaptureOutputDidFinishCapturingPhoto_deferredPhotoProxy_error___block_invoke_3;
  v10[3] = &unk_263FA5978;
  id v8 = *(void **)(a1 + 88);
  id v11 = *(id *)(a1 + 96);
  char v12 = v6;
  BOOL v9 = v6;
  [v8 _enumerateCaptureServicesUsingBlock:v10];
  CAMSignpostWithIDAndArgs(v7, [*(id *)(a1 + 40) uniqueID], objc_msgSend(*(id *)(a1 + 40), "uniqueID"), 0, 0, 0);
}

void __89__CAMCaptureEngine__handleCaptureOutputDidFinishCapturingPhoto_deferredPhotoProxy_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequest:*(void *)(a1 + 32) didCompleteStillImageCaptureWithResult:*(void *)(a1 + 40)];
  }
}

- (id)_coordinationInfoForRequest:(id)a3 resolvedSettings:(id)a4 videoComplementURL:(id)a5 isFiltered:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v10 = NSString;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = objc_msgSend(v10, "stringWithFormat:", @"captureID:%lld", objc_msgSend(v12, "uniqueID"));
  uint64_t v15 = [(CAMCaptureEngine *)self _expectedResultSpecifiersForResolvedPhotoSettings:v12];
  int v16 = [v12 isHDREnabled];

  int v17 = [v13 isEV0LocalVideoDestinationURL:v11];
  if (v6) {
    uint64_t v18 = v16 & (v17 ^ 1u) | 2;
  }
  else {
    uint64_t v18 = v16 & (v17 ^ 1u);
  }
  id v19 = [[CAMCaptureCoordinationInfo alloc] initWithIdentifier:v14 allExpectedResultSpecifiers:v15 resultSpecifiers:v18];

  return v19;
}

- (id)_coordinationInfoForCTMVideoRequest:(id)a3 videoOutputURL:(id)a4 resolvedMomentCaptureMovieSettings:(id)a5
{
  BOOL v6 = NSString;
  id v7 = a5;
  id v8 = objc_msgSend(v6, "stringWithFormat:", @"captureID:%lld", objc_msgSend(v7, "uniqueID"));
  BOOL v9 = [(CAMCaptureEngine *)self _expectedResultSpecifiersForResolvedMomentCaptureMovieSettings:v7];

  uint64_t v10 = [[CAMCaptureCoordinationInfo alloc] initWithIdentifier:v8 allExpectedResultSpecifiers:v9 resultSpecifiers:0];
  return v10;
}

- (id)_expectedResultSpecifiersForResolvedMomentCaptureMovieSettings:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263EFF9C0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  BOOL v6 = [v4 movieURL];

  if (v6) {
    [v5 addObject:&unk_26BDDEDF0];
  }
  return v5;
}

- (void)captureOutput:(id)a3 didFinishRecordingLivePhotoMovieForEventualFileAtURL:(id)a4 resolvedSettings:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 uniqueID];
  CAMSignpostWithIDAndArgs(43, v9, v9, 0, 0, 0);
  uint64_t v10 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v16 = [v8 uniqueID];
    _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishRecordingLivePhotoMovieForEventualFileAtURL:resolvedSettings:", buf, 0xCu);
  }

  mach_absolute_time();
  id v11 = [(CAMCaptureEngine *)self _captureResultsQueue];
  uint64_t v14 = v7;
  id v12 = v7;
  id v13 = v8;
  pl_dispatch_async();
}

void __104__CAMCaptureEngine_captureOutput_didFinishRecordingLivePhotoMovieForEventualFileAtURL_resolvedSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [v4 request];
  if (([v5 isCTMVideo] & 1) == 0)
  {
    [v4 didReceiveCallback:6 atAbsoluteTime:*(void *)(a1 + 56)];
    BOOL v6 = [*(id *)(a1 + 32) _coordinationInfoForRequest:v5 resolvedSettings:*(void *)(a1 + 40) videoComplementURL:*(void *)(a1 + 48) isFiltered:0];
    id v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __104__CAMCaptureEngine_captureOutput_didFinishRecordingLivePhotoMovieForEventualFileAtURL_resolvedSettings___block_invoke_2;
    v9[3] = &unk_263FA5978;
    id v10 = v5;
    id v11 = v6;
    id v8 = v6;
    [v7 _enumerateCaptureServicesUsingBlock:v9];
    CAMSignpostWithIDAndArgs(44, *(void *)(a1 + 64), *(void *)(a1 + 64), 0, 0, 0);
  }
}

void __104__CAMCaptureEngine_captureOutput_didFinishRecordingLivePhotoMovieForEventualFileAtURL_resolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequest:*(void *)(a1 + 32) didStopCapturingLivePhotoVideoForCoordinationInfo:*(void *)(a1 + 40)];
  }
}

- (void)captureOutput:(id)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(id)a4 duration:(id *)a5 photoDisplayTime:(id *)a6 resolvedSettings:(id)a7 error:(id)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a6;
  [(CAMCaptureEngine *)self captureOutput:a3 didFinishProcessingLivePhotoToMovieFileAtURL:a4 duration:&v9 photoDisplayTime:&v8 metadataIdentifiers:0 resolvedSettings:a7 error:a8];
}

- (void)captureOutput:(id)a3 didFinishProcessingLivePhotoToMovieFileAtURL:(id)a4 duration:(id *)a5 photoDisplayTime:(id *)a6 metadataIdentifiers:(id)a7 resolvedSettings:(id)a8 error:(id)a9
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = a7;
  id v14 = a8;
  id v15 = a9;
  uint64_t v16 = [v14 uniqueID];
  CAMSignpostWithIDAndArgs(45, v16, v16, 0, 0, 0);
  uint64_t v17 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218498;
    uint64_t v26 = [v14 uniqueID];
    __int16 v27 = 2114;
    id v28 = v12;
    __int16 v29 = 2114;
    id v30 = v15;
    _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishProcessingLivePhotoToMovieFileAtURL:, url=%{public}@, error: %{public}@", buf, 0x20u);
  }

  mach_absolute_time();
  uint64_t v18 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v23 = v14;
  id v24 = v12;
  id v19 = v13;
  id v20 = v15;
  id v21 = v12;
  id v22 = v14;
  pl_dispatch_async();
}

void __148__CAMCaptureEngine_captureOutput_didFinishProcessingLivePhotoToMovieFileAtURL_duration_photoDisplayTime_metadataIdentifiers_resolvedSettings_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [v4 request];
  if (([v5 isCTMVideo] & 1) == 0)
  {
    [v4 didReceiveCallback:7 atAbsoluteTime:*(void *)(a1 + 72)];
    BOOL v6 = [*(id *)(a1 + 32) _coordinationInfoForRequest:v5 resolvedSettings:*(void *)(a1 + 40) videoComplementURL:*(void *)(a1 + 48) isFiltered:0];
    long long v31 = *(_OWORD *)(a1 + 88);
    uint64_t v32 = *(void *)(a1 + 104);
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    long long v29 = *(_OWORD *)(a1 + 112);
    uint64_t v30 = *(void *)(a1 + 128);
    long long v27 = *(_OWORD *)(a1 + 88);
    uint64_t v28 = *(void *)(a1 + 104);
    id v11 = [v7 _validateVideoAtURL:v9 forCaptureRequest:v5 captureID:v8 captureError:v10 isVideoComplement:1 stillImageDisplayTime:&v29 reportedDuration:&v27 outActualDuration:&v31 outVideoRecordingStoppedReason:0 outSlowWriterFrameDrops:0];
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    id v13 = *(void **)(a1 + 64);
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __148__CAMCaptureEngine_captureOutput_didFinishProcessingLivePhotoToMovieFileAtURL_duration_photoDisplayTime_metadataIdentifiers_resolvedSettings_error___block_invoke_2;
    v25[3] = &unk_263FA5A18;
    id v26 = v12;
    id v14 = v12;
    [v13 enumerateKeysAndObjectsUsingBlock:v25];
    id v15 = [CAMVideoCaptureResult alloc];
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = [*(id *)(a1 + 40) livePhotoMovieDimensions];
    long long v29 = v31;
    uint64_t v30 = v32;
    long long v27 = *(_OWORD *)(a1 + 112);
    uint64_t v28 = *(void *)(a1 + 128);
    LOBYTE(v21) = 0;
    uint64_t v18 = [(CAMVideoCaptureResult *)v15 initWithURL:v16 filteredLocalDestinationURL:0 duration:&v29 stillDisplayTime:&v27 dimensions:v17 metadata:v14 videoZoomFactor:1.0 reason:0 videoPreviewPixelBuffer:0 coordinationInfo:v6 error:v11 slowWriterFrameDrops:v21];
    id v19 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __148__CAMCaptureEngine_captureOutput_didFinishProcessingLivePhotoToMovieFileAtURL_duration_photoDisplayTime_metadataIdentifiers_resolvedSettings_error___block_invoke_3;
    v22[3] = &unk_263FA5978;
    id v23 = v5;
    id v24 = v18;
    id v20 = v18;
    [v19 _enumerateCaptureServicesUsingBlock:v22];
    CAMSignpostWithIDAndArgs(46, *(void *)(a1 + 80), *(void *)(a1 + 80), 0, 0, 0);
  }
}

void __148__CAMCaptureEngine_captureOutput_didFinishProcessingLivePhotoToMovieFileAtURL_duration_photoDisplayTime_metadataIdentifiers_resolvedSettings_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x263EFA790];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_alloc_init(v5);
  [v8 setKeySpace:*MEMORY[0x263EF9E88]];
  [v8 setKey:v7];

  [v8 setValue:v6];
  [*(id *)(a1 + 32) addObject:v8];
}

void __148__CAMCaptureEngine_captureOutput_didFinishProcessingLivePhotoToMovieFileAtURL_duration_photoDisplayTime_metadataIdentifiers_resolvedSettings_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequest:*(void *)(a1 + 32) didCompleteVideoCaptureWithResult:*(void *)(a1 + 40)];
  }
}

- (void)_didFinishStillImageCaptureForUniqueID:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  CAMSignpostWithIDAndArgs(47, a3, a3, 0, 0, 0);
  mach_absolute_time();
  id v7 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v8 = v6;
  pl_dispatch_async();
}

void __65__CAMCaptureEngine__didFinishStillImageCaptureForUniqueID_error___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  id v3 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v4 = [v3 objectForKeyedSubscript:v2];
  id v5 = [v4 request];
  [v4 didReceiveCallback:5 atAbsoluteTime:*(void *)(a1 + 56)];
  uint64_t aBlock = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __65__CAMCaptureEngine__didFinishStillImageCaptureForUniqueID_error___block_invoke_2;
  uint64_t v18 = &unk_263FA0CD0;
  uint64_t v19 = *(void *)(a1 + 32);
  id v6 = v5;
  id v20 = v6;
  id v21 = *(id *)(a1 + 40);
  id v7 = (void (**)(void))_Block_copy(&aBlock);
  id v8 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue];
  int v9 = [v8 containsObject:v2];

  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 32) _effectsPreviewSurfaceFilteringQueue];
    pl_dispatch_async();
  }
  else
  {
    v7[2](v7);
  }
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = objc_msgSend(NSString, "stringWithFormat:", @"captureID:%lld received final callback. ", v12, aBlock, v16, v17, v18, v19);
  objc_msgSend(v11, "_resultsQueue_logReceivedCallbacksForID:withIntroString:", v12, v13);

  [v3 removeObjectForKey:v2];
  id v14 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue];
  [v14 removeObject:v2];

  CAMSignpostWithIDAndArgs(48, *(void *)(a1 + 48), *(void *)(a1 + 48), 0, 0, 0);
}

void __65__CAMCaptureEngine__didFinishStillImageCaptureForUniqueID_error___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__CAMCaptureEngine__didFinishStillImageCaptureForUniqueID_error___block_invoke_3;
  v3[3] = &unk_263FA5978;
  id v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _enumerateCaptureServicesUsingBlock:v3];
}

void __65__CAMCaptureEngine__didFinishStillImageCaptureForUniqueID_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequestDidCompleteCapture:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  }
}

- (void)captureOutput:(id)a3 didBeginMovieCaptureForResolvedSettings:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 uniqueID];
  CAMSignpostWithIDAndArgs(57, v6, v6, 0, 0, 0);
  id v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218242;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didBeginMovieCaptureForResolvedSettings:, %{public}@", buf, 0x16u);
  }

  mach_absolute_time();
  [(CAMCaptureEngine *)self stopMonitoringForAccidentalLaunch];
  id v8 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v9 = v5;
  pl_dispatch_async();
}

void __74__CAMCaptureEngine_captureOutput_didBeginMovieCaptureForResolvedSettings___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "uniqueID"));
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [v4 request];
  [v4 didReceiveCallback:8 atAbsoluteTime:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _setResultsQueueLastCompletedVideoZoomFactor:0.0];
  uint64_t v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__CAMCaptureEngine_captureOutput_didBeginMovieCaptureForResolvedSettings___block_invoke_2;
  v8[3] = &unk_263FA5728;
  id v9 = v5;
  id v7 = v5;
  [v6 _enumerateCaptureServicesUsingBlock:v8];
  CAMSignpostWithIDAndArgs(58, *(void *)(a1 + 56), *(void *)(a1 + 56), 0, 0, 0);
}

void __74__CAMCaptureEngine_captureOutput_didBeginMovieCaptureForResolvedSettings___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequestWillStartCapturingVideo:*(void *)(a1 + 32)];
  }
}

- (void)captureOutput:(id)a3 didFinishRecordingMovie:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [v5 resolvedSettings];
  uint64_t v7 = [v6 uniqueID];

  id v8 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 outputFileURL];
    *(_DWORD *)long long buf = 134218242;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishRecordingMovie:, url=%{public}@", buf, 0x16u);
  }
  mach_absolute_time();
  uint64_t v10 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v11 = v5;
  pl_dispatch_async();
}

void __58__CAMCaptureEngine_captureOutput_didFinishRecordingMovie___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v3 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  id v5 = [v4 request];
  [v4 didReceiveCallback:9 atAbsoluteTime:*(void *)(a1 + 56)];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) outputFileURL];
  id v8 = [*(id *)(a1 + 40) resolvedSettings];
  id v9 = [v6 _coordinationInfoForCTMVideoRequest:v5 videoOutputURL:v7 resolvedMomentCaptureMovieSettings:v8];

  uint64_t v10 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__CAMCaptureEngine_captureOutput_didFinishRecordingMovie___block_invoke_2;
  v13[3] = &unk_263FA5978;
  id v14 = v5;
  id v15 = v9;
  id v11 = v9;
  id v12 = v5;
  [v10 _enumerateCaptureServicesUsingBlock:v13];
}

void __58__CAMCaptureEngine_captureOutput_didFinishRecordingMovie___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequest:*(void *)(a1 + 32) didStopCapturingCTMVideoForCoordinationInfo:*(void *)(a1 + 40)];
  }
}

- (void)captureOutput:(id)a3 didFinishWritingMovie:(id)a4 error:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = [v7 resolvedSettings];
  uint64_t v10 = [v9 uniqueID];

  CAMSignpostWithIDAndArgs(59, v10, v10, 0, 0, 0);
  id v11 = [v7 outputFileURL];
  id v12 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218498;
    uint64_t v20 = v10;
    __int16 v21 = 2114;
    id v22 = v11;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishWritingMovie:, url=%{public}@, error: %{public}@", buf, 0x20u);
  }

  CVPixelBufferRetain((CVPixelBufferRef)[v7 previewPixelBuffer]);
  mach_absolute_time();
  uint64_t v13 = [(CAMCaptureEngine *)self _captureResultsQueue];
  uint64_t v17 = v7;
  uint64_t v18 = v8;
  id v14 = v8;
  id v15 = v7;
  id v16 = v11;
  pl_dispatch_async();
}

void __62__CAMCaptureEngine_captureOutput_didFinishWritingMovie_error___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithLongLong:*(void *)(a1 + 64)];
  id v3 = [*(id *)(a1 + 32) _resultsQueueRegisteredStillImageRequests];
  id v4 = [v3 objectForKeyedSubscript:v2];

  id v5 = [v4 request];
  [v4 didReceiveCallback:10 atAbsoluteTime:*(void *)(a1 + 72)];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 48) resolvedSettings];
  id v9 = [v6 _coordinationInfoForCTMVideoRequest:v5 videoOutputURL:v7 resolvedMomentCaptureMovieSettings:v8];

  long long v56 = 0uLL;
  uint64_t v57 = 0;
  uint64_t v10 = *(void **)(a1 + 48);
  if (v10)
  {
    [v10 duration];
    uint64_t v10 = *(void **)(a1 + 48);
  }
  uint64_t v55 = 0;
  char v54 = 0;
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  if (v10) {
    [v10 duration];
  }
  else {
    memset(v53, 0, sizeof(v53));
  }
  long long v49 = *MEMORY[0x263F01090];
  *(void *)&long long v50 = *(void *)(MEMORY[0x263F01090] + 16);
  id v15 = [v11 _validateVideoAtURL:v12 forCaptureRequest:v5 captureID:v13 captureError:v14 isVideoComplement:0 stillImageDisplayTime:&v49 reportedDuration:v53 outActualDuration:&v56 outVideoRecordingStoppedReason:&v55 outSlowWriterFrameDrops:&v54];
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  long long v52 = 0uLL;
  if (!*(void *)(a1 + 56))
  {
    size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 80));
    size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 80));
    __int16 v21 = *(void **)(a1 + 32);
    if (v21)
    {
      objc_msgSend(v21, "_previewFilterSetForRequest:previewSize:", v5, (double)Width, (double)Height);
      uint64_t v17 = *((void *)&v49 + 1);
      uint64_t v18 = v49;
      uint64_t v16 = v51;
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v51 = 0;
      long long v49 = 0u;
      long long v50 = 0u;
    }
    long long v52 = v50;
  }
  [*(id *)(a1 + 32) _resultsQueueLastCompletedVideoZoomFactor];
  uint64_t v23 = v22;
  [*(id *)(a1 + 32) _setResultsQueueLastCompletedVideoZoomFactor:0.0];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CAMCaptureEngine_captureOutput_didFinishWritingMovie_error___block_invoke_2;
  aBlock[3] = &unk_263FA5A68;
  id v36 = *(id *)(a1 + 40);
  long long v46 = v56;
  uint64_t v47 = v57;
  id v37 = *(id *)(a1 + 48);
  uint64_t v42 = v23;
  uint64_t v43 = v55;
  id v24 = v9;
  id v38 = v24;
  id v25 = v15;
  char v48 = v54;
  uint64_t v44 = *(void *)(a1 + 80);
  uint64_t v26 = *(void *)(a1 + 32);
  id v39 = v25;
  uint64_t v40 = v26;
  id v27 = v5;
  uint64_t v28 = *(void *)(a1 + 64);
  id v41 = v27;
  uint64_t v45 = v28;
  long long v29 = _Block_copy(aBlock);
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)(a1 + 80);
  if (!v31) {
    goto LABEL_18;
  }
  uint64_t v32 = v18 != 0;
  if (v17) {
    ++v32;
  }
  uint64_t v33 = (unint64_t)(v16 - 1) >= 0xFFFFFFFFFFFFFFFELL ? 0 : -1;
  if (v32 != v33)
  {
    id v34 = *(void **)(a1 + 32);
    *(void *)&long long v49 = v18;
    *((void *)&v49 + 1) = v17;
    long long v50 = v52;
    uint64_t v51 = v16;
    objc_msgSend(v34, "_resultsQueue_performPostprocessingForPreviewBuffer:metadata:filters:stillImageCaptureRequestKey:completionHandler:", v31, 0, &v49, v2, v30);
  }
  else
  {
LABEL_18:
    (*((void (**)(void *))v29 + 2))(v29);
  }
}

void __62__CAMCaptureEngine_captureOutput_didFinishWritingMovie_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [CAMVideoCaptureResult alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) resolvedSettings];
  uint64_t v7 = [v6 movieDimensions];
  id v8 = [*(id *)(a1 + 40) movieMetadata];
  double v9 = *(double *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  char v13 = *(unsigned char *)(a1 + 136);
  long long v23 = *(_OWORD *)(a1 + 112);
  uint64_t v24 = *(void *)(a1 + 128);
  long long v21 = *MEMORY[0x263F01090];
  uint64_t v22 = *(void *)(MEMORY[0x263F01090] + 16);
  LOBYTE(v17) = v13;
  uint64_t v14 = [(CAMVideoCaptureResult *)v4 initWithURL:v5 filteredLocalDestinationURL:0 duration:&v23 stillDisplayTime:&v21 dimensions:v7 metadata:v8 videoZoomFactor:v9 reason:v10 videoPreviewPixelBuffer:a2 coordinationInfo:v11 error:v12 slowWriterFrameDrops:v17];

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 96));
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__CAMCaptureEngine_captureOutput_didFinishWritingMovie_error___block_invoke_3;
  v18[3] = &unk_263FA5978;
  id v15 = *(void **)(a1 + 64);
  id v19 = *(id *)(a1 + 72);
  uint64_t v20 = v14;
  uint64_t v16 = v14;
  [v15 _enumerateCaptureServicesUsingBlock:v18];
  CAMSignpostWithIDAndArgs(60, *(void *)(a1 + 104), *(void *)(a1 + 104), 0, 0, 0);
}

void __62__CAMCaptureEngine_captureOutput_didFinishWritingMovie_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 stillImageRequest:*(void *)(a1 + 32) didCompleteVideoCaptureWithResult:*(void *)(a1 + 40)];
  }
}

- (void)captureOutput:(id)a3 didFinishMovieCaptureForResolvedSettings:(id)a4 error:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  double v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218242;
    uint64_t v11 = [v7 uniqueID];
    __int16 v12 = 2114;
    id v13 = v8;
    _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "captureID:%lld captureOutput:didFinishMovieCaptureForResolvedSettings:, error: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  -[CAMCaptureEngine _didFinishStillImageCaptureForUniqueID:error:](self, "_didFinishStillImageCaptureForUniqueID:error:", [v7 uniqueID], v8);
}

- ($42FF7B9720B8FFE93045C4EB8F3F13A3)_previewFilterSetForRequest:(SEL)a3 photo:(id)a4
{
  id v16 = a5;
  id v8 = a4;
  double v9 = [v16 resolvedSettings];
  unint64_t v10 = [v9 previewDimensions];
  int v11 = v10;
  unint64_t v12 = HIDWORD(v10);

  retstr->var3 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var2 = 0u;
  -[CAMCaptureEngine _previewFilterSetForRequest:previewSize:](self, "_previewFilterSetForRequest:previewSize:", v8, (double)v11, (double)(int)v12);
  LODWORD(self) = [v8 wantsSemanticSceneFilter];

  if (self)
  {
    id v13 = (void *)MEMORY[0x263F5DF78];
    uint64_t v14 = [v16 privateClientMetadata];
    retstr->var3 = [v13 semanticEnhanceSceneForPrivateClientMetadata:v14];
  }

  return result;
}

- ($42FF7B9720B8FFE93045C4EB8F3F13A3)_previewFilterSetForRequest:(SEL)a3 previewSize:(id)a4
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var2 = 0u;
  retstr->var3 = 0;
  retstr->var1 = [v11 aspectRatioCrop];
  retstr->var2.CGFloat width = width;
  retstr->var2.CGFloat height = height;
  id v8 = [v11 adjustmentFilters];
  int64_t v9 = 0;
  if (!v8) {
    int64_t v9 = [v11 effectFilterType];
  }
  retstr->var0 = v9;

  return result;
}

- (id)_previewFiltersForFilterSet:(id *)a3
{
  if (a3->var0) {
    uint64_t v4 = (a3->var1 != 0) + 1;
  }
  else {
    uint64_t v4 = a3->var1 != 0;
  }
  if ((unint64_t)(a3->var3 - 1) >= 0xFFFFFFFFFFFFFFFELL) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 + 1;
  }
  uint64_t v6 = [MEMORY[0x263EFF980] arrayWithCapacity:v5];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__CAMCaptureEngine__previewFiltersForFilterSet___block_invoke;
  aBlock[3] = &unk_263FA5AB8;
  id v7 = v6;
  id v22 = v7;
  id v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  int64_t v9 = [MEMORY[0x263F5DF78] filterForSemanticEnhanceScene:a3->var3];
  if (v9)
  {
    unint64_t v10 = +[CAMCaptureCapabilities capabilities];
    int v11 = [v10 enableSemanticDevelopmentFilterDebugging];

    if (v11)
    {
      unint64_t v12 = (void *)MEMORY[0x263F00640];
      id v13 = [v9 name];
      uint64_t v14 = [v12 filterWithName:v13 withInputParameters:&unk_26BDDF880];

      int64_t v9 = (void *)v14;
    }
  }
  v8[2](v8, v9);
  id v15 = (void *)MEMORY[0x263F00640];
  id v16 = +[CAMEffectFilterManager ciFilterNameForFilterType:a3->var0];
  uint64_t v17 = [v15 filterWithName:v16];
  v8[2](v8, v17);

  uint64_t v18 = +[CAMAspectCropUtilities cropFilterForAspectRatio:imageSize:](CAMAspectCropUtilities, "cropFilterForAspectRatio:imageSize:", a3->var1, a3->var2.width, a3->var2.height);
  v8[2](v8, v18);

  id v19 = v7;
  return v19;
}

uint64_t __48__CAMCaptureEngine__previewFiltersForFilterSet___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (__CVBuffer)_createOutputPixelBufferWithSize:(CGSize)a3 matchingInputPixelBuffer:(__CVBuffer *)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  CVPixelBufferGetPixelFormatType(a4);
  CVPixelBufferGetAttributes();
  FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
  uint64_t v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CAMCaptureEngine _createOutputPixelBufferWithSize:matchingInputPixelBuffer:]();
  }

  CVPixelBufferRelease(0);
  return 0;
}

- (__CVBuffer)_newFilteredPixelBufferFromPixelBuffer:(__CVBuffer *)a3 metadata:(id)a4 filters:(id)a5
{
  v47[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v46 = *MEMORY[0x263F00908];
    v47[0] = v8;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v36 = self;
  id v37 = v8;
  id v34 = a3;
  dispatch_queue_t v35 = (void *)v10;
  int v11 = (void *)[objc_alloc(MEMORY[0x263F00650]) initWithCVPixelBuffer:a3 options:v10];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
    uint64_t v16 = *MEMORY[0x263F00968];
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        [v18 setValue:v11 forKey:v16];
        id v19 = [v18 outputImage];

        uint64_t v20 = [v18 name];
        int v21 = [v20 isEqualToString:@"CICrop"];

        if (v21)
        {
          id v22 = [v18 valueForKey:@"inputRectangle"];
          [v22 CGRectValue];
          CGAffineTransformMakeTranslation(&v40, -v23, -v24);
          int v11 = [v19 imageByApplyingTransform:&v40];
        }
        else
        {
          int v11 = v19;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v14);
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__CAMCaptureEngine__newFilteredPixelBufferFromPixelBuffer_metadata_filters___block_invoke;
  aBlock[3] = &unk_263FA0208;
  id v25 = v12;
  id v39 = v25;
  uint64_t v26 = (void (**)(void))_Block_copy(aBlock);
  [v11 extent];
  long long v29 = -[CAMCaptureEngine _createOutputPixelBufferWithSize:matchingInputPixelBuffer:](v36, "_createOutputPixelBufferWithSize:matchingInputPixelBuffer:", v34, v27, v28);
  if (v29)
  {
    effectsPreviewSurfaceFilteringContext = v36->__effectsPreviewSurfaceFilteringContext;
    if (!effectsPreviewSurfaceFilteringContext)
    {
      uint64_t v31 = (CIContext *)objc_alloc_init(MEMORY[0x263F00628]);
      uint64_t v32 = v36->__effectsPreviewSurfaceFilteringContext;
      v36->__effectsPreviewSurfaceFilteringContext = v31;

      effectsPreviewSurfaceFilteringContext = v36->__effectsPreviewSurfaceFilteringContext;
    }
    [(CIContext *)effectsPreviewSurfaceFilteringContext render:v11 toCVPixelBuffer:v29];
  }
  v26[2](v26);

  return v29;
}

uint64_t __76__CAMCaptureEngine__newFilteredPixelBufferFromPixelBuffer_metadata_filters___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_295];
}

uint64_t __76__CAMCaptureEngine__newFilteredPixelBufferFromPixelBuffer_metadata_filters___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:0 forKey:*MEMORY[0x263F00968]];
}

- (void)_resultsQueue_performPostprocessingForPreviewBuffer:(__CVBuffer *)a3 metadata:(id)a4 filters:(id *)a5 stillImageCaptureRequestKey:(id)a6 completionHandler:(id)a7
{
  id v10 = a4;
  id v11 = a7;
  id v12 = a6;
  uint64_t v13 = [(CAMCaptureEngine *)self _captureResultsQueue];
  dispatch_assert_queue_V2(v13);

  uint64_t v14 = [(CAMCaptureEngine *)self _resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue];
  [v14 addObject:v12];

  if (!self->__effectsPreviewSurfaceFilteringQueue)
  {
    uint64_t v15 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    uint64_t v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.camera.capture-engine.effects-preview-surface-filtering-queue", v15);
    effectsPreviewSurfaceFilteringQueue = self->__effectsPreviewSurfaceFilteringQueue;
    self->__effectsPreviewSurfaceFilteringQueue = v16;
  }
  uint64_t v18 = [(CAMCaptureEngine *)self _effectsPreviewSurfaceFilteringQueue];
  int v21 = v10;
  id v19 = v11;
  id v20 = v10;
  pl_dispatch_async();
}

void __135__CAMCaptureEngine__resultsQueue_performPostprocessingForPreviewBuffer_metadata_filters_stillImageCaptureRequestKey_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 72);
  v6[0] = *(_OWORD *)(a1 + 56);
  v6[1] = v3;
  uint64_t v7 = *(void *)(a1 + 88);
  uint64_t v4 = [v2 _previewFiltersForFilterSet:v6];
  uint64_t v5 = (__CVBuffer *)[*(id *)(a1 + 32) _newFilteredPixelBufferFromPixelBuffer:*(void *)(a1 + 96) metadata:*(void *)(a1 + 40) filters:v4];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  CVPixelBufferRelease(v5);
}

- (void)registerVideoCaptureRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v6 = v4;
  pl_dispatch_async();
}

void __48__CAMCaptureEngine_registerVideoCaptureRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) _resultsQueueRequestsBeingRecorded];
  long long v3 = [*(id *)(a1 + 40) localDestinationURL];
  [v4 setObject:v2 forKeyedSubscript:v3];
}

- (void)registerVideoEndZoomFactor:(double)a3
{
  long long v3 = [(CAMCaptureEngine *)self _captureResultsQueue];
  pl_dispatch_async();
}

uint64_t __47__CAMCaptureEngine_registerVideoEndZoomFactor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setResultsQueueLastCompletedVideoZoomFactor:*(double *)(a1 + 40)];
}

- (void)stopRecording
{
  long long v3 = [(CAMCaptureEngine *)self movieFileOutput];
  id v4 = [v3 outputFileURL];
  uint64_t v5 = [v3 currentRequest];
  id v6 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v10 = v4;
  id v11 = v3;
  id v7 = v3;
  id v8 = v5;
  id v9 = v4;
  pl_dispatch_async();
}

void __33__CAMCaptureEngine_stopRecording__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _resultsQueueRequestsBeingRecorded];
  long long v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v4 = *(void **)(a1 + 40);
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      id v5 = [*(id *)(a1 + 48) localDestinationURL];
    }
    id v6 = v5;
    id v7 = [*(id *)(a1 + 32) _resultsQueueLastCompletedVideoURL];
    int v8 = [v7 isEqual:v6];

    if (v8)
    {
      id v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v18 = v6;
        _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "Detected stop-after-completion case for %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v10 = [*(id *)(a1 + 56) connections];
      id v11 = CAMVideoCaptureRequestError(-28000, 0);
      [v2 setObject:*(void *)(a1 + 48) forKey:v6];
      id v12 = dispatch_get_global_queue(2, 0);
      id v14 = v6;
      id v15 = *(id *)(a1 + 56);
      uint64_t v16 = v11;
      id v13 = v11;
      id v9 = v10;
      pl_dispatch_async();
    }
  }
}

uint64_t __33__CAMCaptureEngine_stopRecording__block_invoke_298(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Handling stop-before-start for video capture: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) captureOutput:*(void *)(a1 + 48) didFinishRecordingToOutputFileAtURL:*(void *)(a1 + 32) fromConnections:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

- (void)captureOutput:(id)a3 didResumeRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5
{
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "CAMCaptureEngine didResumeRecordingToOutputFileAtURL:", buf, 2u);
  }

  int v8 = [v6 currentRequest];

  id v9 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v10 = v8;
  pl_dispatch_async();
}

void __86__CAMCaptureEngine_captureOutput_didResumeRecordingToOutputFileAtURL_fromConnections___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __86__CAMCaptureEngine_captureOutput_didResumeRecordingToOutputFileAtURL_fromConnections___block_invoke_2;
  v2[3] = &unk_263FA5728;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _enumerateCaptureServicesUsingBlock:v2];
}

void __86__CAMCaptureEngine_captureOutput_didResumeRecordingToOutputFileAtURL_fromConnections___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 videoRequestDidResumeCapturing:*(void *)(a1 + 32)];
  }
}

- (void)captureOutput:(id)a3 didStartRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMCaptureEngine *)self stopMonitoringForAccidentalLaunch];
  id v10 = [v8 currentRequest];

  [v10 userInitationTimestamp];
  if (v11 != 0.0)
  {
    double v12 = v11;
    id v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v19 = v7;
      __int16 v20 = 2048;
      double v21 = Current - v12;
      _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "CAMCaptureEngine captureOutput:didStartRecordingToOutputFileAtURL: url=%{public}@ (after %.3f seconds)", buf, 0x16u);
    }
  }
  id v14 = [(CAMCaptureEngine *)self _captureResultsQueue];
  uint64_t v17 = v7;
  id v15 = v7;
  id v16 = v10;
  pl_dispatch_async();
}

void __85__CAMCaptureEngine_captureOutput_didStartRecordingToOutputFileAtURL_fromConnections___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _setResultsQueueLastCompletedVideoZoomFactor:0.0];
  uint64_t v2 = [*(id *)(a1 + 40) localDestinationURL];
  id v3 = v2;
  if (*(void *)(a1 + 40) && ([v2 isEqual:*(void *)(a1 + 48)] & 1) != 0)
  {
    if ([*(id *)(a1 + 40) shouldGenerateVideoPreviewImage])
    {
      id v4 = [MEMORY[0x263F08A00] defaultCenter];
      objc_initWeak(&location, v4);
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      double v21 = __Block_byref_object_copy__24;
      uint64_t v22 = __Block_byref_object_dispose__24;
      id v23 = 0;
      int v5 = [MEMORY[0x263F08A48] currentQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __85__CAMCaptureEngine_captureOutput_didStartRecordingToOutputFileAtURL_fromConnections___block_invoke_302;
      v15[3] = &unk_263FA5B50;
      id v16 = *(id *)(a1 + 40);
      objc_copyWeak(&v18, &location);
      uint64_t v6 = *MEMORY[0x263EF96C8];
      uint64_t v17 = buf;
      uint64_t v7 = [v4 addObserverForName:v6 object:0 queue:v5 usingBlock:v15];
      id v8 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v7;

      _Block_object_dispose(buf, 8);
      objc_destroyWeak(&v18);

      objc_destroyWeak(&location);
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __85__CAMCaptureEngine_captureOutput_didStartRecordingToOutputFileAtURL_fromConnections___block_invoke_2;
    v13[3] = &unk_263FA5728;
    id v9 = *(void **)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    [v9 _enumerateCaptureServicesUsingBlock:v13];
    id v10 = v14;
  }
  else
  {
    id v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      double v12 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 48);
      *(_DWORD *)long long buf = 138543874;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v3;
      *(_WORD *)&buf[22] = 2114;
      double v21 = v12;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Started recording for an unexpected video request %{public}@ (%{public}@, %{public}@)", buf, 0x20u);
    }
  }
}

void __85__CAMCaptureEngine_captureOutput_didStartRecordingToOutputFileAtURL_fromConnections___block_invoke_302(uint64_t a1, void *a2)
{
  id v6 = [a2 userInfo];
  id v3 = [v6 objectForKey:*MEMORY[0x263EF96D0]];
  id v4 = [[CAMIOSurfaceWrapper alloc] initWithIOSurface:v3];
  objc_setAssociatedObject(*(id *)(a1 + 32), (const void *)_associatedVideoPreviewSurfaceKey, v4, (void *)1);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __85__CAMCaptureEngine_captureOutput_didStartRecordingToOutputFileAtURL_fromConnections___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 videoRequestDidStartCapturing:*(void *)(a1 + 32)];
  }
}

- (void)_captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 forVideoCaptureRequest:(id)a6 videoZoomFactor:(double)a7 error:(id)a8
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  uint64_t v17 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138544130;
    id v33 = v14;
    __int16 v34 = 2114;
    id v35 = v15;
    __int16 v36 = 2048;
    double v37 = a7;
    __int16 v38 = 2114;
    id v39 = v16;
    _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "CAMCaptureEngine _captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:forVideoCaptureRequest:videoZoomFactor:error url=%{public}@, request=%{public}@, videoZoomFactor=%.2f, error=%{public}@", buf, 0x2Au);
  }

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke;
  v30[3] = &unk_263FA5728;
  id v18 = v15;
  id v31 = v18;
  [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:v30];
  id v19 = [v13 metadata];
  __int16 v20 = [(CAMCaptureEngine *)self _captureResultsQueue];
  uint64_t v26 = v13;
  double v27 = v14;
  double v28 = v16;
  long long v29 = v19;
  id v21 = v19;
  id v22 = v16;
  id v23 = v18;
  id v24 = v14;
  id v25 = v13;
  pl_dispatch_async();
}

void __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 videoRequestDidStopCapturing:*(void *)(a1 + 32)];
  }
}

void __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_2(uint64_t a1)
{
  long long v36 = 0uLL;
  uint64_t v37 = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 recordedDuration];
    uint64_t v2 = *(void **)(a1 + 32);
  }
  uint64_t v35 = 0;
  char v34 = 0;
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  if (v2) {
    [v2 recordedDuration];
  }
  else {
    memset(v33, 0, sizeof(v33));
  }
  long long v24 = *MEMORY[0x263F01090];
  long long v31 = *MEMORY[0x263F01090];
  uint64_t v7 = *(void *)(MEMORY[0x263F01090] + 16);
  uint64_t v32 = v7;
  id v8 = [v3 _validateVideoAtURL:v4 forCaptureRequest:v5 captureID:0 captureError:v6 isVideoComplement:0 stillImageDisplayTime:&v31 reportedDuration:v33 outActualDuration:&v36 outVideoRecordingStoppedReason:&v35 outSlowWriterFrameDrops:&v34];
  if (v8)
  {
    if (*(void *)(a1 + 48))
    {
      id v9 = [MEMORY[0x263F08850] defaultManager];
      id v10 = [*(id *)(a1 + 48) path];
      int v11 = [v9 fileExistsAtPath:v10];

      if (v11)
      {

        id v8 = 0;
      }
    }
  }
  double v12 = objc_getAssociatedObject(*(id *)(a1 + 56), (const void *)_associatedVideoPreviewSurfaceKey);
  id v13 = (__IOSurface *)[v12 surface];
  CVPixelBufferRef pixelBufferOut = 0;
  if (v13)
  {
    if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x263EFFB08], v13, 0, &pixelBufferOut))
    {
      id v14 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_2_cold_2();
      }

      CVPixelBufferRelease(pixelBufferOut);
      CVPixelBufferRef pixelBufferOut = 0;
    }
  }
  else
  {
    id v15 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_2_cold_1();
    }
  }
  id v16 = [CAMVideoCaptureResult alloc];
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 72);
  double v19 = *(double *)(a1 + 80);
  long long v31 = v36;
  uint64_t v32 = v37;
  long long v28 = v24;
  uint64_t v29 = v7;
  LOBYTE(v23) = v34;
  __int16 v20 = [(CAMVideoCaptureResult *)v16 initWithURL:v17 filteredLocalDestinationURL:0 duration:&v31 stillDisplayTime:&v28 dimensions:0 metadata:v18 videoZoomFactor:v19 reason:v35 videoPreviewPixelBuffer:pixelBufferOut coordinationInfo:0 error:v8 slowWriterFrameDrops:v23];
  objc_setAssociatedObject(*(id *)(a1 + 56), (const void *)_associatedVideoPreviewSurfaceKey, 0, (void *)1);
  CVPixelBufferRelease(pixelBufferOut);
  id v21 = *(void **)(a1 + 40);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_310;
  v25[3] = &unk_263FA5978;
  id v26 = *(id *)(a1 + 56);
  double v27 = v20;
  id v22 = v20;
  [v21 _enumerateCaptureServicesUsingBlock:v25];
}

void __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_310(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 videoRequest:*(void *)(a1 + 32) didCompleteCaptureWithResult:*(void *)(a1 + 40)];
  }
}

- (id)_validateVideoAtURL:(id)a3 forCaptureRequest:(id)a4 captureID:(int64_t)a5 captureError:(id)a6 isVideoComplement:(BOOL)a7 stillImageDisplayTime:(id *)a8 reportedDuration:(id *)a9 outActualDuration:(id *)a10 outVideoRecordingStoppedReason:(int64_t *)a11 outSlowWriterFrameDrops:(BOOL *)a12
{
  BOOL v105 = a7;
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v109 = a4;
  id v15 = a6;
  uint64_t v16 = [v15 code];
  if (!v15)
  {
    uint64_t v17 = 0;
    int v18 = 0;
    id v19 = 0;
    goto LABEL_16;
  }
  if (v16 > -11819)
  {
    int v18 = 0;
    id v19 = 0;
    uint64_t v17 = 1;
    switch(v16)
    {
      case -11811:
        int v18 = 0;
        id v19 = 0;
        uint64_t v17 = 3;
        break;
      case -11810:
        int v18 = 0;
        id v19 = 0;
        uint64_t v17 = 2;
        break;
      case -11809:
      case -11808:
      case -11806:
        goto LABEL_14;
      case -11807:
        break;
      case -11805:
        goto LABEL_10;
      default:
        if (v16 != -11818) {
          goto LABEL_14;
        }
        id v19 = v15;
        int v18 = 0;
        uint64_t v17 = 4;
        break;
    }
  }
  else
  {
    switch(v16)
    {
      case -28000:
        goto LABEL_10;
      case -11911:
        CAMVideoCaptureRequestError(-28003, v15);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v17 = 0;
        int v18 = 1;
        goto LABEL_16;
      case -11904:
LABEL_10:
        id v19 = v15;
        int v18 = 1;
        break;
      default:
LABEL_14:
        id v19 = v15;
        int v18 = 0;
        break;
    }
    uint64_t v17 = 5;
  }
LABEL_16:
  int64_t v100 = v17;
  CMTimeValue var0 = a9->var0;
  CMTimeFlags var2 = a9->var2;
  CMTimeScale var1 = a9->var1;
  CMTimeEpoch var3 = a9->var3;
  CMTimeFlags flags = var2;
  int v21 = var2 & 0x1D;
  Float64 Seconds = 0.0;
  if (v21 == 1)
  {
    time.value = a9->var0;
    time.timescale = a9->var1;
    time.CMTimeFlags flags = var2;
    time.epoch = var3;
    Float64 Seconds = CMTimeGetSeconds(&time);
  }
  if (v14)
  {
    id v23 = v14;
    long long v24 = [v14 path];
    BOOL v25 = [v24 length] != 0;
  }
  else
  {
    id v23 = 0;
    BOOL v25 = 0;
  }
  unsigned int v26 = a9->var2;
  if (v21 != 1)
  {
    if (v105) {
      uint64_t v32 = @"Live Photo movie";
    }
    else {
      uint64_t v32 = @"video";
    }
    v104 = v32;
    if (v26)
    {
      long long v31 = v23;
      goto LABEL_38;
    }
    int v29 = 0;
    uint64_t v30 = @"Invalid";
LABEL_36:
    long long v31 = v23;
    goto LABEL_39;
  }
  time.value = var0;
  time.timescale = var1;
  time.CMTimeFlags flags = flags;
  time.epoch = var3;
  double v27 = CMTimeGetSeconds(&time);
  if (v105) {
    long long v28 = @"Live Photo movie";
  }
  else {
    long long v28 = @"video";
  }
  v104 = v28;
  int v29 = v26 | (v27 == 0.0);
  if (v26) {
    uint64_t v30 = @"Zero";
  }
  else {
    uint64_t v30 = @"Invalid";
  }
  if ((v26 & 1) == 0) {
    goto LABEL_36;
  }
  long long v31 = v23;
  if (v27 != 0.0)
  {
LABEL_38:
    objc_msgSend(NSString, "stringWithFormat:", @"%.3fs", *(void *)&Seconds);
    uint64_t v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v29 = 0;
  }
LABEL_39:
  BOOL v34 = (v26 & 1) == 0 || v15 != 0;
  uint64_t v35 = (void *)MEMORY[0x263F08608];
  if (v25 & ~v18) == 1 && ((v34 | v29))
  {
    long long v36 = os_log_create("com.apple.camera", "Camera");
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (v15)
    {
      if (!v37) {
        goto LABEL_51;
      }
      LODWORD(time.value) = 138544130;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v104;
      LOWORD(time.flags) = 2114;
      *(void *)((char *)&time.flags + 2) = v30;
      HIWORD(time.epoch) = 2114;
      id v118 = v15;
      __int16 v119 = 2114;
      id v120 = v31;
      __int16 v38 = "Encountered an error during %{public}@ recording! (duration: %{public}@ error: %{public}@, file: %{public}@)";
      id v39 = v36;
      uint32_t v40 = 42;
    }
    else
    {
      if (!v37) {
        goto LABEL_51;
      }
      LODWORD(time.value) = 138543874;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v104;
      LOWORD(time.flags) = 2114;
      *(void *)((char *)&time.flags + 2) = v30;
      HIWORD(time.epoch) = 2114;
      id v118 = v31;
      __int16 v38 = "Encountered a reported %{public}@ duration of %{public}@! (file: %{public}@)";
      id v39 = v36;
      uint32_t v40 = 32;
    }
    _os_log_error_impl(&dword_2099F8000, v39, OS_LOG_TYPE_ERROR, v38, (uint8_t *)&time, v40);
LABEL_51:

    long long v41 = [MEMORY[0x263F08850] defaultManager];
    long long v42 = [v31 path];
    char v43 = [v41 fileExistsAtPath:v42];

    if ((v43 & 1) == 0)
    {
      id v54 = v15;

      long long v50 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:].cold.6();
      }
      goto LABEL_81;
    }
    if (v15)
    {
      long long v44 = [v15 userInfo];
      uint64_t v45 = [v44 objectForKeyedSubscript:*MEMORY[0x263EF9828]];
      if (v45)
      {
        uint64_t v46 = v45;
        char v47 = [v45 BOOLValue];

        if ((v47 & 1) != 0 || !v105)
        {
          if ((v47 & 1) == 0)
          {
            id v55 = v15;

            long long v56 = os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
              -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:].cold.4();
            }

LABEL_99:
            v61 = 0;
LABEL_107:
            v60 = os_log_create("com.apple.camera", "Camera");
            v103 = v30;
            v108 = v61;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              LODWORD(time.value) = 138543874;
              *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v104;
              LOWORD(time.flags) = 2114;
              *(void *)((char *)&time.flags + 2) = v30;
              HIWORD(time.epoch) = 2114;
              id v118 = v31;
              _os_log_error_impl(&dword_2099F8000, v60, OS_LOG_TYPE_ERROR, "Encountered a reported %{public}@ duration of %{public}@! (file: %{public}@)", (uint8_t *)&time, 0x20u);
            }
            id v19 = v15;
            goto LABEL_110;
          }
          goto LABEL_59;
        }
        long long v44 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:].cold.5();
        }
      }
    }
LABEL_59:
    char v48 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:]();
    }

    id v116 = 0;
    int v49 = [MEMORY[0x263EFA5F8] consolidateMovieFragmentsInFile:v31 error:&v116];
    long long v50 = v116;
    uint64_t v51 = os_log_create("com.apple.camera", "Camera");
    BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
    if (v49)
    {
      if (v52) {
        -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:]();
      }

      long long v53 = [MEMORY[0x263EFA8D0] URLAssetWithURL:v31 options:0];
      id v19 = v53;
      if (v53)
      {
        [v53 duration];
        CMTimeFlags flags = time.flags;
        CMTimeEpoch var3 = time.epoch;
      }
      else
      {
        CMTimeEpoch var3 = 0;
        CMTimeFlags flags = 0;
        memset(&time, 0, sizeof(time));
      }
      CMTimeValue var0 = time.value;
      CMTimeScale var1 = time.timescale;
      uint64_t v57 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        time.value = var0;
        time.timescale = var1;
        time.CMTimeFlags flags = flags;
        time.epoch = var3;
        Float64 v93 = CMTimeGetSeconds(&time);
        LODWORD(time.value) = 134218242;
        *(Float64 *)((char *)&time.value + 4) = v93;
        LOWORD(time.flags) = 2114;
        *(void *)((char *)&time.flags + 2) = v30;
        _os_log_error_impl(&dword_2099F8000, v57, OS_LOG_TYPE_ERROR, "Replaced duration with asset duration %f (reportedDuration was %{public}@)", (uint8_t *)&time, 0x16u);
      }

      id v54 = 0;
    }
    else
    {
      if (v52) {
        -[CAMCaptureEngine _validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:]();
      }

      CAMVideoCaptureRequestError(-28001, v15);
      id v54 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_81:
    id v19 = v54;
  }
  if (v19) {
    goto LABEL_95;
  }
  if (!v15 || !v105)
  {
    int v58 = flags & 0x1D;
    goto LABEL_92;
  }
  int v58 = flags & 0x1D;
  if ((a8->var2 & 1) == 0 || v58 != 1)
  {
LABEL_92:
    if (v58 == 1)
    {
      time.value = var0;
      time.timescale = var1;
      time.CMTimeFlags flags = flags;
      time.epoch = var3;
      if (CMTimeGetSeconds(&time) > 0.0) {
        goto LABEL_100;
      }
    }
    goto LABEL_94;
  }
  CMTime time = (CMTime)*a8;
  time2.value = var0;
  time2.timescale = var1;
  time2.CMTimeFlags flags = flags;
  time2.epoch = var3;
  if (CMTimeCompare(&time, &time2) < 0) {
    goto LABEL_100;
  }
  v59 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
  {
    CMTime time = (CMTime)*a8;
    Float64 v94 = CMTimeGetSeconds(&time);
    LODWORD(time.value) = 138543618;
    *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v30;
    LOWORD(time.flags) = 2048;
    *(Float64 *)((char *)&time.flags + 2) = v94;
    _os_log_error_impl(&dword_2099F8000, v59, OS_LOG_TYPE_ERROR, "LivePhoto video complement had duration of %{public}@, which is less than still image time of %.3f", (uint8_t *)&time, 0x16u);
  }

LABEL_94:
  CAMVideoCaptureRequestError(-28002, v15);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
LABEL_95:
    if (v19 != v15)
    {
      v60 = os_log_create("com.apple.camera", "Camera");
      v103 = v30;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        LODWORD(time.value) = 138544130;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v104;
        LOWORD(time.flags) = 2114;
        *(void *)((char *)&time.flags + 2) = v30;
        HIWORD(time.epoch) = 2114;
        id v118 = v31;
        __int16 v119 = 2114;
        id v120 = v19;
        _os_log_error_impl(&dword_2099F8000, v60, OS_LOG_TYPE_ERROR, "Encountered an error during %{public}@ recording! (duration: %{public}@, file: %{public}@, error: %{public}@)", (uint8_t *)&time, 0x2Au);
      }
      v108 = 0;
LABEL_110:

      v63 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", &unk_26BDDEE08, &unk_26BDDEE20, &unk_26BDDEE38, &unk_26BDDEE50, &unk_26BDDEE68, 0);
      v67 = +[CAMCaptureCapabilities capabilities];
      int v68 = [v67 shouldEnableUserNotifications];

      v69 = [v19 userInfo];
      v70 = [v69 objectForKeyedSubscript:*v35];

      v71 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v70, "code"));
      char v72 = [v63 containsObject:v71];

      if (((v18 | v68 ^ 1) & 1) == 0 && (v72 & 1) == 0)
      {
        v99 = [(CAMCaptureEngine *)self _currentNotificationCenter];
        id v73 = objc_alloc_init(MEMORY[0x263F1DEF0]);
        v98 = objc_msgSend(NSString, "stringWithFormat:", @"validateVideoURLErrorNotificationID%ld%ld%lld", objc_msgSend(v19, "code"), objc_msgSend(v70, "code"), a5);
        v74 = [v15 userInfo];
        v75 = [v74 objectForKeyedSubscript:*MEMORY[0x263EF9820]];

        v97 = v75;
        uint64_t v76 = [v75 unsignedIntegerValue];
        uint64_t v77 = v108;
        if (!v108)
        {
          if ((unint64_t)(v76 - 2) >= 3)
          {
            v78 = @"Video Error:";
            if (v105) {
              v78 = @"Live Photo Error:";
            }
            uint64_t v77 = v78;
          }
          else
          {
            uint64_t v77 = off_263FA5D60[v76 - 2];
          }
        }
        v108 = v77;
        v79 = -[__CFString stringByAppendingFormat:](v77, "stringByAppendingFormat:", @" %ld, %ld", [v19 code], objc_msgSend(v70, "code"));
        v80 = [MEMORY[0x263F08850] defaultManager];
        v106 = v31;
        uint64_t v81 = [v31 path];
        int v82 = [v80 fileExistsAtPath:v81];

        if (v82)
        {
          [NSString stringWithFormat:@"An error occurred while recording a %@ (duration:%@). The video has been placed in the Photo Library. Tap to file a Radar and please attach the video.", v104, v103];
        }
        else
        {
          if ([v109 persistenceOptions] == 3)
          {
            v83 = @"An error occurred, the storage drive might have been disconnected. Tap to file a Radar.";
          }
          else
          {
            v95 = v104;
            v83 = @"An error occurred and no %@ was recorded. Tap to file a Radar.";
          }
          objc_msgSend(NSString, "stringWithFormat:", v83, v95, v96);
        v84 = };
        id v85 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        objc_super v86 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a5);
        [v85 setObject:v86 forKeyedSubscript:@"captureID"];

        v87 = objc_msgSend(NSString, "stringWithFormat:", @"%ld%ld", objc_msgSend(v19, "code"), objc_msgSend(v70, "code"));
        [v85 setObject:v87 forKeyedSubscript:@"error"];

        v88 = [(CAMCaptureEngine *)self _TTRKeywordIDsFromCaptureRequest:v109];
        [v85 setObject:v88 forKeyedSubscript:@"keywordIDs"];

        [v73 setTitle:v79];
        [v73 setBody:v84];
        [v73 setUserInfo:v85];
        v89 = [MEMORY[0x263F1DF48] requestWithIdentifier:v98 content:v73 trigger:0];
        v112[0] = MEMORY[0x263EF8330];
        v112[1] = 3221225472;
        v112[2] = __211__CAMCaptureEngine__validateVideoAtURL_forCaptureRequest_captureID_captureError_isVideoComplement_stillImageDisplayTime_reportedDuration_outActualDuration_outVideoRecordingStoppedReason_outSlowWriterFrameDrops___block_invoke;
        v112[3] = &unk_263FA4BB8;
        id v113 = v79;
        id v114 = v84;
        id v90 = v84;
        id v91 = v79;
        [v99 addNotificationRequest:v89 withCompletionHandler:v112];

        long long v31 = v106;
      }

      uint64_t v30 = v103;
      v61 = v108;
      goto LABEL_126;
    }
    goto LABEL_99;
  }
LABEL_100:
  BOOL v62 = [v15 userInfo];
  v63 = [v62 objectForKeyedSubscript:*v35];

  uint64_t v64 = [v63 code];
  if (v64 == -15437)
  {
    id v66 = v15;
    if (a12) {
      *a12 = 1;
    }
    v61 = @"Frame Drops Reported (Slow Writer):";
  }
  else
  {
    if (v64 != -15435)
    {
      id v19 = 0;
      v61 = 0;
LABEL_126:

      goto LABEL_127;
    }
    id v65 = v15;
    v61 = @"Frame Drops Reported:";
  }

  if (v15) {
    goto LABEL_107;
  }
  id v19 = 0;
LABEL_127:
  if (a10)
  {
    a10->CMTimeValue var0 = var0;
    a10->CMTimeScale var1 = var1;
    a10->CMTimeFlags var2 = flags;
    a10->CMTimeEpoch var3 = var3;
  }
  if (a11) {
    *a11 = v100;
  }

  return v19;
}

void __211__CAMCaptureEngine__validateVideoAtURL_forCaptureRequest_captureID_captureError_isVideoComplement_stillImageDisplayTime_reportedDuration_outActualDuration_outVideoRecordingStoppedReason_outSlowWriterFrameDrops___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __211__CAMCaptureEngine__validateVideoAtURL_forCaptureRequest_captureID_captureError_isVideoComplement_stillImageDisplayTime_reportedDuration_outActualDuration_outVideoRecordingStoppedReason_outSlowWriterFrameDrops___block_invoke_cold_1(a1, v3);
    }
  }
}

- (id)_TTRKeywordIDsFromCaptureRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 videoEncodingBehavior] == 2) {
    [v4 addObject:&unk_26BDDEE80];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        if (v8)
        {
          uint64_t v11 = [v8 stringByAppendingFormat:@", %@", *(void *)(*((void *)&v13 + 1) + 8 * i)];

          id v8 = (void *)v11;
        }
        else
        {
          id v8 = [NSString stringWithFormat:@"%@", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)captureOutput:(id)a3 didFinishRecordingToOutputFileAtURL:(id)a4 fromConnections:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [(CAMCaptureEngine *)self _captureResultsQueue];
  id v19 = v11;
  __int16 v20 = v13;
  int v21 = v12;
  id v15 = v12;
  id v16 = v10;
  id v17 = v13;
  id v18 = v11;
  pl_dispatch_async();
}

void __92__CAMCaptureEngine_captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_error___block_invoke(id *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    id v4 = a1[5];
    *(_DWORD *)long long buf = 138543618;
    id v25 = v3;
    __int16 v26 = 2114;
    double v27 = v4;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "CAMCaptureEngine captureOutput:didFinishRecordingToOutputFileAtURL:fromConnections:error url=%{public}@, error=%{public}@", buf, 0x16u);
  }

  id v5 = [a1[6] _resultsQueueRequestsBeingRecorded];
  uint64_t v6 = [v5 objectForKey:a1[4]];
  if (!v6)
  {
    uint64_t v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = a1[4];
      *(_DWORD *)long long buf = 138543362;
      id v25 = v8;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "CAMCaptureEngine could not find CAMVideoCaptureRequest for url=%{public}@, using the current capture request", buf, 0xCu);
    }

    uint64_t v6 = [a1[7] currentRequest];
  }
  uint64_t v9 = [a1[6] _resultsQueueLastCompletedVideoURL];
  int v10 = [v9 isEqual:a1[4]];

  if (v10)
  {
    id v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = a1[4];
      id v13 = a1[5];
      *(_DWORD *)long long buf = 138543874;
      id v25 = v12;
      __int16 v26 = 2114;
      double v27 = v6;
      __int16 v28 = 2114;
      id v29 = v13;
      long long v14 = "Skipping duplicate handling for %{public}@, %{public}@, %{public}@";
      id v15 = v11;
      uint32_t v16 = 32;
LABEL_14:
      _os_log_impl(&dword_2099F8000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (!v6)
  {
    id v11 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = a1[4];
      *(_DWORD *)long long buf = 138543362;
      id v25 = v18;
      long long v14 = "Finished recording for an unexpected video URL %{public}@";
      id v15 = v11;
      uint32_t v16 = 12;
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  [v5 removeObjectForKey:a1[4]];
  [a1[6] _setResultsQueueLastCompletedVideoURL:a1[4]];
  [a1[6] _resultsQueueLastCompletedVideoZoomFactor];
  [a1[6] _setResultsQueueLastCompletedVideoZoomFactor:0.0];
  id v17 = dispatch_get_global_queue(2, 0);
  id v19 = a1[7];
  id v20 = a1[4];
  id v21 = a1[8];
  id v22 = v6;
  id v23 = a1[5];
  pl_dispatch_async();

LABEL_16:
}

uint64_t __92__CAMCaptureEngine_captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_error___block_invoke_393(uint64_t a1)
{
  return [*(id *)(a1 + 32) _captureOutput:*(void *)(a1 + 40) didFinishRecordingToOutputFileAtURL:*(void *)(a1 + 48) fromConnections:*(void *)(a1 + 56) forVideoCaptureRequest:*(void *)(a1 + 64) videoZoomFactor:*(void *)(a1 + 72) error:*(double *)(a1 + 80)];
}

- (void)_subgraphQueueHandlePanoramaStatusNotification:(__CFString *)a3
{
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x263F20778]))
  {
    id v4 = [(CAMCaptureEngine *)self _panoramaProcessor];
    id v5 = [v4 request];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __67__CAMCaptureEngine__subgraphQueueHandlePanoramaStatusNotification___block_invoke;
    v7[3] = &unk_263FA5728;
    id v8 = v5;
    id v6 = v5;
    [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:v7];
  }
}

uint64_t __67__CAMCaptureEngine__subgraphQueueHandlePanoramaStatusNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    if (objc_opt_respondsToSelector()) {
      [v5 panoramaRequestDidStartCapturing:*(void *)(a1 + 32)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (void)_subgraphQueueHandlePanoramaWarningNotification:(__CFString *)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a3;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Received panorama warning %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (int64_t)_notificationForError:(__CFString *)a3
{
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x263F207B0])) {
    return -6000;
  }
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x263F20820])) {
    return -6001;
  }
  return 0;
}

- (void)_subgraphQueueHandlePanoramaErrorNotification:(__CFString *)a3
{
  int v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CAMCaptureEngine _subgraphQueueHandlePanoramaErrorNotification:]();
  }

  id v6 = [(CAMCaptureEngine *)self _panoramaProcessor];
  uint64_t v7 = [v6 request];
  int64_t v8 = [(CAMCaptureEngine *)self _notificationForError:a3];
  if (v8)
  {
    int64_t v9 = v8;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __66__CAMCaptureEngine__subgraphQueueHandlePanoramaErrorNotification___block_invoke;
    v10[3] = &unk_263FA5B78;
    id v11 = v7;
    int64_t v12 = v9;
    [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:v10];
  }
}

uint64_t __66__CAMCaptureEngine__subgraphQueueHandlePanoramaErrorNotification___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v5 = v3;
    if (objc_opt_respondsToSelector()) {
      [v5 panoramaRequest:*(void *)(a1 + 32) didReceiveNotification:*(void *)(a1 + 40)];
    }
  }
  return MEMORY[0x270F9A830]();
}

- (void)_sessionQueuePanoramaSetup
{
  id v3 = [(CAMCaptureEngine *)self panoramaVideoDataOutput];
  uint64_t v4 = [v3 photoEncodingBehavior];
  int v5 = [(CAMCaptureEngine *)self _panoramaSampleBufferQueue];
  uint64_t v8 = MEMORY[0x263EF8330];
  pl_dispatch_async();

  id v6 = [(CAMCaptureEngine *)self panoramaVideoDataOutput];
  uint64_t v7 = [(CAMCaptureEngine *)self _panoramaSampleBufferQueue];
  [v6 setSampleBufferDelegate:self queue:v7];
}

void __46__CAMCaptureEngine__sessionQueuePanoramaSetup__block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaSubgraphQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__CAMCaptureEngine__sessionQueuePanoramaSetup__block_invoke_2;
  v5[3] = &unk_263FA5BC8;
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  v5[5] = &v10;
  void v5[6] = &v6;
  v5[7] = v3;
  dispatch_sync(v2, v5);

  [*(id *)(a1 + 32) _notifyServicesOfPanoramaConfigurationChangeWithImageQueue:v11[3] direction:v7[3]];
  uint64_t v4 = (const void *)v11[3];
  if (v4) {
    CFRelease(v4);
  }
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
}

void __46__CAMCaptureEngine__sessionQueuePanoramaSetup__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaProcessor];

  if (!v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _powerController];
    objc_msgSend(v3, "addAssertionForIndentifier:withReason:", objc_msgSend(*(id *)(a1 + 32), "_panoramaAssertionIdentifier"), 8);
  }
  [*(id *)(a1 + 32) _subgraphQueueCreatePanoramaProcessorIfNecessaryWithEncodingBehavior:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) _subgraphQueueCreatePanoramaImageQueueIfNecessary];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _panoramaImageQueue];
  uint64_t v4 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v4) {
    CFRetain(v4);
  }
  id v7 = [*(id *)(a1 + 32) _panoramaProcessor];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 direction];
  int v5 = *(const void **)(a1 + 32);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, v5, (CFNotificationCallback)_PanoramaNotificationCallback, (CFStringRef)*MEMORY[0x263F20810], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(LocalCenter, v5, (CFNotificationCallback)_PanoramaNotificationCallback, (CFStringRef)*MEMORY[0x263F20828], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(LocalCenter, v5, (CFNotificationCallback)_PanoramaNotificationCallback, (CFStringRef)*MEMORY[0x263F20788], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_subgraphQueueCreatePanoramaProcessorIfNecessaryWithEncodingBehavior:(int64_t)a3
{
  if (!self->__panoramaProcessor)
  {
    uint64_t v4 = [[CAMPanoramaProcessor alloc] initWithDelegate:self encodingBehavior:a3];
    panoramaProcessor = self->__panoramaProcessor;
    self->__panoramaProcessor = v4;
    MEMORY[0x270F9A758](v4, panoramaProcessor);
  }
}

- (void)_subgraphQueueCreatePanoramaImageQueueIfNecessary
{
  uint64_t v2 = NSStringFromCGSize(*(CGSize *)&a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2099F8000, v3, v4, "Failed to create a panorama image queue because ACT returned a panorama size of %{public}@", v5, v6, v7, v8, v9);
}

- (void)changeToPanoramaDirection:(int64_t)a3
{
  uint64_t v3 = [(CAMCaptureEngine *)self _panoramaSampleBufferQueue];
  pl_dispatch_async();
}

void __46__CAMCaptureEngine_changeToPanoramaDirection___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__24;
  uint64_t v8 = __Block_byref_object_dispose__24;
  id v9 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaSubgraphQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __46__CAMCaptureEngine_changeToPanoramaDirection___block_invoke_2;
  v3[3] = &unk_263FA35E8;
  void v3[4] = *(void *)(a1 + 32);
  v3[5] = &v4;
  dispatch_sync(v2, v3);

  [(id)v5[5] setDirection:*(void *)(a1 + 40)];
  _Block_object_dispose(&v4, 8);
}

uint64_t __46__CAMCaptureEngine_changeToPanoramaDirection___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaProcessor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)changePanoramaEncodingBehaviorIfNeeded:(int64_t)a3
{
  uint64_t v3 = [(CAMCaptureEngine *)self _panoramaSampleBufferQueue];
  pl_dispatch_async();
}

void __59__CAMCaptureEngine_changePanoramaEncodingBehaviorIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaSubgraphQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __59__CAMCaptureEngine_changePanoramaEncodingBehaviorIfNeeded___block_invoke_2;
  v4[3] = &unk_263FA04E0;
  uint64_t v3 = *(void *)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  void v4[5] = v3;
  dispatch_sync(v2, v4);
}

void __59__CAMCaptureEngine_changePanoramaEncodingBehaviorIfNeeded___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaProcessor];
  uint64_t v3 = v2;
  if (v2 && [v2 photoEncodingBehavior] != *(void *)(a1 + 40))
  {
    uint64_t v4 = [*(id *)(a1 + 32) _captureSessionQueue];
    pl_dispatch_async();
  }
}

uint64_t __59__CAMCaptureEngine_changePanoramaEncodingBehaviorIfNeeded___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _sessionQueuePanoramaTeardown];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _sessionQueuePanoramaSetup];
}

- (void)startPanoramaCaptureWithRequest:(id)a3
{
  id v4 = a3;
  [(CAMCaptureEngine *)self stopMonitoringForAccidentalLaunch];
  uint64_t v5 = [(CAMCaptureEngine *)self _panoramaSampleBufferQueue];
  id v6 = v4;
  pl_dispatch_async();
}

void __52__CAMCaptureEngine_startPanoramaCaptureWithRequest___block_invoke(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__24;
  uint64_t v8 = __Block_byref_object_dispose__24;
  id v9 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaSubgraphQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__CAMCaptureEngine_startPanoramaCaptureWithRequest___block_invoke_2;
  v3[3] = &unk_263FA35E8;
  void v3[4] = *(void *)(a1 + 32);
  v3[5] = &v4;
  dispatch_sync(v2, v3);

  [(id)v5[5] startPanoramaCaptureWithRequest:*(void *)(a1 + 40)];
  _Block_object_dispose(&v4, 8);
}

uint64_t __52__CAMCaptureEngine_startPanoramaCaptureWithRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaProcessor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)stopPanoramaCaptureInterrupted:(BOOL)a3
{
  uint64_t v3 = [(CAMCaptureEngine *)self _panoramaSampleBufferQueue];
  pl_dispatch_async();
}

uint64_t __51__CAMCaptureEngine_stopPanoramaCaptureInterrupted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted:(BOOL)a3
{
  uint64_t v5 = [(CAMCaptureEngine *)self _panoramaSampleBufferQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__24;
  id v23 = __Block_byref_object_dispose__24;
  id v24 = 0;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint32_t v16 = __Block_byref_object_copy__24;
  id v17 = __Block_byref_object_dispose__24;
  id v18 = 0;
  uint64_t v6 = [(CAMCaptureEngine *)self _panoramaSubgraphQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke;
  block[3] = &unk_263FA54A8;
  void block[4] = self;
  void block[5] = &v13;
  void block[6] = &v19;
  dispatch_sync(v6, block);

  if ([(id)v14[5] isCapturingPanorama])
  {
    [(id)v14[5] stopPanoramaCapture];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_2;
    v10[3] = &unk_263FA5C10;
    void v10[4] = &v19;
    BOOL v11 = a3;
    [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:v10];
    uint64_t v7 = (void *)v14[5];
    uint64_t v8 = v20[5];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_3;
    v9[3] = &unk_263FA5C60;
    void v9[4] = self;
    v9[5] = &v19;
    [v7 processPanoramaCaptureWithRequest:v8 completionHandler:v9];
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

uint64_t __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaProcessor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) request];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  return MEMORY[0x270F9A758](v5, v7);
}

uint64_t __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v5 = v3;
    if (objc_opt_respondsToSelector()) {
      [v5 panoramaRequestDidStopCapturing:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) interrupted:*(unsigned __int8 *)(a1 + 40)];
    }
  }
  return MEMORY[0x270F9A830]();
}

void __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_4;
  v7[3] = &unk_263FA5C38;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 _enumerateCaptureServicesUsingBlock:v7];
}

void __89__CAMCaptureEngine__panoramaSampleBufferQueue_stopPanoramaCaptureIfNecessaryInterrupted___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 panoramaRequest:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) didCompleteCaptureWithResult:*(void *)(a1 + 32)];
  }
}

- (void)panoramaProcessor:(id)a3 didProcessSampleBuffer:(opaqueCMSampleBuffer *)a4 withStatus:(int)a5 forRequest:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v49 = 0;
  long long v50 = &v49;
  uint64_t v51 = 0x2020000000;
  uint64_t v52 = 0;
  BOOL v11 = [(CAMCaptureEngine *)self _panoramaSubgraphQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke;
  block[3] = &unk_263FA35E8;
  void block[4] = self;
  void block[5] = &v49;
  dispatch_sync(v11, block);

  if (v50[3]) {
    CAImageQueueCollect();
  }
  if (a4)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a4);
    uint64_t v13 = ImageBuffer;
    if (ImageBuffer)
    {
      if (CVPixelBufferGetIOSurface(ImageBuffer) && v50[3] && CAImageQueueRegisterIOSurfaceBuffer()) {
        CAImageQueueInsertImage();
      }
      CFDictionaryRef v14 = CMCopyDictionaryOfAttachments((CFAllocatorRef)*MEMORY[0x263EFFB08], v13, 1u);
      Value = (void *)CFDictionaryGetValue(v14, (const void *)*MEMORY[0x263F20808]);
      if (Value) {
        uint64_t v16 = [Value integerValue];
      }
      else {
        uint64_t v16 = 0;
      }
      id v17 = +[CAMPanoramaConfiguration sharedInstance];
      uint64_t v18 = [v17 sampleBufferWidth];

      if (v18) {
        double v19 = (double)v16 / (double)v18;
      }
      else {
        double v19 = 0.0;
      }
      CGSize v20 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
      rect.origin = (CGPoint)*MEMORY[0x263F001A8];
      rect.size = v20;
      CFDictionaryRef v21 = (const __CFDictionary *)CFDictionaryGetValue(v14, (const void *)*MEMORY[0x263F207D0]);
      if (v21) {
        CGRectMakeWithDictionaryRepresentation(v21, &rect);
      }
      id v22 = [MEMORY[0x263F82B60] mainScreen];
      [v22 scale];
      double v33 = 1.0 / v23;

      rect.origin = (CGPoint)vmulq_n_f64((float64x2_t)rect.origin, v33);
      rect.size = (CGSize)vmulq_n_f64((float64x2_t)rect.size, v33);
      id v24 = (void *)CFDictionaryGetValue(v14, (const void *)*MEMORY[0x263F207E0]);
      if (v24)
      {
        [v24 doubleValue];
        double v26 = v25;
      }
      else
      {
        double v26 = 0.0;
      }
      double v27 = [CAMPanoramaPaintingStatus alloc];
      __int16 v28 = -[CAMPanoramaPaintingStatus initWithSpeed:cropRectangle:normalizedBaselineOffset:](v27, "initWithSpeed:cropRectangle:normalizedBaselineOffset:", v26, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v19);
      id v29 = MEMORY[0x263EF83A0];
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      char v43 = __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke_2;
      long long v44 = &unk_263FA0408;
      id v45 = v10;
      uint64_t v30 = v28;
      uint64_t v46 = v30;
      pl_dispatch_async();

      CFRelease(v14);
      uint64_t v35 = 0;
      long long v36 = &v35;
      uint64_t v37 = 0x3032000000;
      __int16 v38 = __Block_byref_object_copy__24;
      id v39 = __Block_byref_object_dispose__24;
      id v40 = 0;
      long long v31 = [(CAMCaptureEngine *)self _panoramaFirstImageQueueUpdateSemaphoreQueue];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke_3;
      v34[3] = &unk_263FA35E8;
      v34[4] = self;
      v34[5] = &v35;
      dispatch_sync(v31, v34);

      uint64_t v32 = v36[5];
      if (v32) {
        dispatch_semaphore_signal(v32);
      }
      _Block_object_dispose(&v35, 8);
    }
  }
  _Block_object_dispose(&v49, 8);
}

uint64_t __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _panoramaImageQueue];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v4 = (void *)v2;
    if (objc_opt_respondsToSelector()) {
      [v4 panoramaRequest:*(void *)(a1 + 32) didGeneratePaintingStatus:*(void *)(a1 + 40)];
    }
  }
  return MEMORY[0x270F9A830]();
}

uint64_t __83__CAMCaptureEngine_panoramaProcessor_didProcessSampleBuffer_withStatus_forRequest___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaFirstImageQueueUpdateSemaphore];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)registerEffectsPreviewSampleBufferDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CAMCaptureEngine *)self _effectsPreviewSampleBufferQueue];
    id v6 = v4;
    pl_dispatch_async();
  }
}

uint64_t __63__CAMCaptureEngine_registerEffectsPreviewSampleBufferDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 392);
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 392);
    *(void *)(v4 + 392) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 392);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v2 addObject:v6];
}

- (void)unregisterEffectsPreviewSampleBufferDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(CAMCaptureEngine *)self _effectsPreviewSampleBufferQueue];
    id v6 = v4;
    pl_dispatch_async();
  }
}

uint64_t __65__CAMCaptureEngine_unregisterEffectsPreviewSampleBufferDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 392) removeObject:*(void *)(a1 + 40)];
}

- (void)registerVideoThumbnailContentsDelegate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    videoThumbnailContentsDelegates = self->__videoThumbnailContentsDelegates;
    id v9 = v5;
    if (!videoThumbnailContentsDelegates)
    {
      uint64_t v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      id v8 = self->__videoThumbnailContentsDelegates;
      self->__videoThumbnailContentsDelegates = v7;

      videoThumbnailContentsDelegates = self->__videoThumbnailContentsDelegates;
    }
    id v4 = (id)[(NSHashTable *)videoThumbnailContentsDelegates addObject:v9];
    id v5 = v9;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)unregisterVideoThumbnailContentsDelegate:(id)a3
{
  if (a3) {
    -[NSHashTable removeObject:](self->__videoThumbnailContentsDelegates, "removeObject:");
  }
}

- (void)videoThumbnailOutput:(id)a3 willBeginRenderingThumbnailsWithContents:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  pl_dispatch_async();
}

void __82__CAMCaptureEngine_videoThumbnailOutput_willBeginRenderingThumbnailsWithContents___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _videoThumbnailContentsDelegates];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) videoThumbnailOutputWillBeginRenderingThumbnailsWithContents:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)videoThumbnailOutputWillEndRenderingThumbnails:(id)a3
{
}

void __67__CAMCaptureEngine_videoThumbnailOutputWillEndRenderingThumbnails___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = [*(id *)(a1 + 32) _videoThumbnailContentsDelegates];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) videoThumbnailOutputWillEndRenderingThumbnails];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v8 = (CAMPanoramaOutput *)a3;
  id v9 = a5;
  if (self->_panoramaVideoDataOutput == v8)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__24;
    double v25 = __Block_byref_object_dispose__24;
    id v26 = 0;
    CFDictionaryRef v14 = [(CAMCaptureEngine *)self _panoramaSubgraphQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__CAMCaptureEngine_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke;
    block[3] = &unk_263FA35E8;
    void block[4] = self;
    void block[5] = &v21;
    dispatch_sync(v14, block);

    if (a4)
    {
      uint64_t v15 = (void *)v22[5];
      if (v15) {
        [v15 processSampleBuffer:a4];
      }
    }
    _Block_object_dispose(&v21, 8);
  }
  else if ((CAMPanoramaOutput *)self->_effectsPreviewVideoDataOutput == v8)
  {
    long long v10 = [(CAMCaptureEngine *)self _effectsPreviewSampleBufferDelegates];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v13++) effectsPreviewVideoDataOutputDidOutputSampleBuffer:a4];
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v27 count:16];
      }
      while (v11);
    }
  }
}

uint64_t __71__CAMCaptureEngine_captureOutput_didOutputSampleBuffer_fromConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _panoramaProcessor];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_effectsPreviewVideoDataOutput == a3)
  {
    long long v6 = [(CAMCaptureEngine *)self _effectsPreviewSampleBufferDelegates];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) effectsPreviewVideoDataOutputDidDropSampleBuffer:a4];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 forMetadataObjectTypes:(id)a5 fromConnection:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(CAMCaptureEngine *)self currentCameraDevice];
  long long v11 = [v10 activeFormat];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __97__CAMCaptureEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke;
  v15[3] = &unk_263FA5C88;
  id v16 = v8;
  id v17 = v9;
  id v18 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v8;
  [(CAMCaptureEngine *)self _enumerateCaptureServicesUsingBlock:v15];
}

void __97__CAMCaptureEngine_captureOutput_didOutputMetadataObjects_forMetadataObjectTypes_fromConnection___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 metadataWasRecognized:a1[4] forMetadataObjectTypes:a1[5] deviceFormat:a1[6]];
  }
}

- (id)frontCameraDevice
{
  return [(CAMCaptureEngine *)self _captureEngineDeviceForDeviceType:*MEMORY[0x263EF9670] position:2];
}

- (id)frontPearlCameraDevice
{
  return [(CAMCaptureEngine *)self _captureEngineDeviceForDeviceType:*MEMORY[0x263EF9658] position:2];
}

- (id)frontSuperWideCameraDevice
{
  return [(CAMCaptureEngine *)self _captureEngineDeviceForDeviceType:*MEMORY[0x263EF9660] position:2];
}

- (id)backTelephotoCameraDevice
{
  return [(CAMCaptureEngine *)self _captureEngineDeviceForDeviceType:*MEMORY[0x263EF9638] position:1];
}

- (id)backDualCameraDevice
{
  return [(CAMCaptureEngine *)self _captureEngineDeviceForDeviceType:*MEMORY[0x263EF9620] position:1];
}

- (id)backSuperWideCameraDevice
{
  return [(CAMCaptureEngine *)self _captureEngineDeviceForDeviceType:*MEMORY[0x263EF9660] position:1];
}

- (id)backWideDualCameraDevice
{
  return [(CAMCaptureEngine *)self _captureEngineDeviceForDeviceType:*MEMORY[0x263EF9628] position:1];
}

- (id)backTripleCameraDevice
{
  return [(CAMCaptureEngine *)self _captureEngineDeviceForDeviceType:*MEMORY[0x263EF9648] position:1];
}

+ (id)_cacheKeyForDeviceType:(id)a3 position:(int64_t)a4
{
  return (id)[NSString stringWithFormat:@"%@ %ld", a3, a4];
}

- (id)_captureEngineDeviceForDeviceType:(id)a3 position:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(CAMCaptureEngine *)self _captureEngineDeviceCache];
  id v8 = [(id)objc_opt_class() _cacheKeyForDeviceType:v6 position:a4];
  id v9 = +[CAMCaptureCapabilities capabilities];
  int v10 = [v9 featureDevelopmentEmulateSuperWide];

  if (v10)
  {
    if ((id)*MEMORY[0x263EF9648] == v6 || *MEMORY[0x263EF9628] == (void)v6)
    {
      id v12 = +[CAMCaptureCapabilities capabilities];
      int v13 = [v12 isBackDualSupported];

      id v14 = (id *)MEMORY[0x263EF9670];
      if (v13) {
        id v14 = (id *)MEMORY[0x263EF9620];
      }
    }
    else
    {
      if ((id)*MEMORY[0x263EF9660] != v6) {
        goto LABEL_13;
      }
      id v14 = (id *)MEMORY[0x263EF9670];
    }
    id v15 = *v14;

    id v6 = v15;
  }
LABEL_13:
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__CAMCaptureEngine__captureEngineDeviceForDeviceType_position___block_invoke;
  v19[3] = &unk_263FA5CB0;
  uint64_t v21 = self;
  int64_t v22 = a4;
  id v20 = v6;
  id v16 = v6;
  id v17 = [v7 objectForKey:v8 memoizationBlock:v19];

  return v17;
}

CAMCaptureEngineDevice *__63__CAMCaptureEngine__captureEngineDeviceForDeviceType_position___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 32);
  id v3 = (void *)(a1 + 48);
  uint64_t v4 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:*(void *)(a1 + 32) mediaType:*MEMORY[0x263EF9D48] position:*(void *)(a1 + 48)];
  if (v4)
  {
    uint64_t v5 = [[CAMCaptureEngineDevice alloc] initWithEngine:*(void *)(a1 + 40) captureDevice:v4];
    if ([*(id *)(a1 + 40) areManagedDevicesLockedForConfiguration]) {
      [*(id *)(a1 + 40) _lockManagedCapturedDevice:v4];
    }
  }
  else
  {
    id v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __63__CAMCaptureEngine__captureEngineDeviceForDeviceType_position___block_invoke_cold_1(v2, v3, v6);
    }

    uint64_t v7 = +[CAMCaptureCapabilities capabilities];
    int v8 = [v7 fallbackCameraSupported];

    if (v8)
    {
      id v9 = +[CAMUserPreferences preferences];
      [v9 writeAvailableDevicesWithCompletion:&__block_literal_global_426];
    }
    uint64_t v5 = 0;
  }

  return v5;
}

void __63__CAMCaptureEngine__captureEngineDeviceForDeviceType_position___block_invoke_423(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Failed to get device writing fallback completed with success %i", (uint8_t *)v4, 8u);
  }
}

- (id)systemPreferredCameraDevice
{
  id v3 = [MEMORY[0x263EFA598] systemPreferredCamera];
  if (v3)
  {
    uint64_t v4 = [[CAMCaptureEngineDevice alloc] initWithEngine:self captureDevice:v3];
    if ([(CAMCaptureEngine *)self areManagedDevicesLockedForConfiguration]) {
      [(CAMCaptureEngine *)self _lockManagedCapturedDevice:v3];
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CAMCaptureEngine systemPreferredCameraDevice]();
    }

    uint64_t v4 = 0;
  }

  return v4;
}

- (id)audioCaptureDevice
{
  audioCameraDevice = self->_audioCameraDevice;
  if (!audioCameraDevice)
  {
    uint64_t v4 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v4];
    uint64_t v5 = [MEMORY[0x263EFA598] defaultDeviceWithMediaType:*MEMORY[0x263EF9CE8]];
    id v6 = self->_audioCameraDevice;
    self->_audioCameraDevice = v5;

    [(CAMCaptureEngine *)self didChangeValueForKey:v4];
    if ([(CAMCaptureEngine *)self areManagedDevicesLockedForConfiguration]) {
      [(CAMCaptureEngine *)self _lockManagedCapturedDevice:self->_audioCameraDevice];
    }

    audioCameraDevice = self->_audioCameraDevice;
  }
  return audioCameraDevice;
}

- (id)audioCaptureDeviceInput
{
  audioCaptureDeviceInput = self->_audioCaptureDeviceInput;
  if (!audioCaptureDeviceInput)
  {
    uint64_t v5 = [(CAMCaptureEngine *)self audioCaptureDevice];
    id v6 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v6];
    uint64_t v7 = [v5 deviceType];
    int v8 = [(CAMCaptureEngine *)self prewarmedAudioDeviceInput:v7 device:v5];
    id v9 = self->_audioCaptureDeviceInput;
    self->_audioCaptureDeviceInput = v8;

    if (!self->_audioCaptureDeviceInput)
    {
      id v15 = 0;
      int v10 = [MEMORY[0x263EFA5B8] deviceInputWithDevice:v5 error:&v15];
      id v11 = v15;
      id v12 = self->_audioCaptureDeviceInput;
      self->_audioCaptureDeviceInput = v10;

      if (v11)
      {
        int v13 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[CAMCaptureEngine audioCaptureDeviceInput]();
        }
      }
    }
    [(CAMCaptureEngine *)self didChangeValueForKey:v6];

    audioCaptureDeviceInput = self->_audioCaptureDeviceInput;
  }
  return audioCaptureDeviceInput;
}

- (id)movieFileOutput
{
  movieFileOutput = self->_movieFileOutput;
  if (!movieFileOutput)
  {
    uint64_t v4 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v4];
    uint64_t v5 = [[CAMCaptureMovieFileOutput alloc] initWithEngine:self];
    id v6 = self->_movieFileOutput;
    self->_movieFileOutput = v5;

    [(CAMCaptureEngine *)self didChangeValueForKey:v4];
    movieFileOutput = self->_movieFileOutput;
  }
  return movieFileOutput;
}

- (id)effectsPreviewVideoDataOutput
{
  effectsPreviewVideoDataOutput = self->_effectsPreviewVideoDataOutput;
  if (!effectsPreviewVideoDataOutput)
  {
    uint64_t v4 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v4];
    uint64_t v5 = (AVCaptureVideoDataOutput *)objc_alloc_init(MEMORY[0x263EFA6A0]);
    id v6 = self->_effectsPreviewVideoDataOutput;
    self->_effectsPreviewVideoDataOutput = v5;

    [(AVCaptureVideoDataOutput *)self->_effectsPreviewVideoDataOutput setAlwaysDiscardsLateVideoFrames:1];
    [(AVCaptureVideoDataOutput *)self->_effectsPreviewVideoDataOutput setVideoSettings:0];
    [(CAMCaptureEngine *)self didChangeValueForKey:v4];

    effectsPreviewVideoDataOutput = self->_effectsPreviewVideoDataOutput;
  }
  return effectsPreviewVideoDataOutput;
}

- (BOOL)controlsSupported
{
  return [(AVCaptureSession *)self->__captureSession supportsControls];
}

- (id)systemStylePicker
{
  systemStylePicker = self->_systemStylePicker;
  if (!systemStylePicker)
  {
    uint64_t v4 = [(CAMCaptureEngine *)self stylePickerIncludingSystemStyles:1 resolvedSystemStyle:0 creativeStyles:0];
    uint64_t v5 = self->_systemStylePicker;
    self->_systemStylePicker = v4;

    systemStylePicker = self->_systemStylePicker;
  }
  return systemStylePicker;
}

- (id)creativeStylePicker
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  uint64_t v4 = [v3 allowSystemSmartStylesInPicker];

  uint64_t v5 = +[CAMSmartStyleUtilities readAVCaptureSystemStyle];
  id v6 = [v5 cast];
  uint64_t v7 = [(AVCaptureSmartStyle *)self->_cachedSystemStyleForCreativeStylePicker cast];
  if (v6 != v7 && ([v6 isEqualToString:v7] & 1) == 0)
  {
    creativeStylePicker = self->_creativeStylePicker;
    self->_creativeStylePicker = 0;
  }
  id v9 = self->_creativeStylePicker;
  if (!v9)
  {
    int v10 = [(CAMCaptureEngine *)self stylePickerIncludingSystemStyles:v4 resolvedSystemStyle:v5 creativeStyles:1];
    id v11 = self->_creativeStylePicker;
    self->_creativeStylePicker = v10;

    objc_storeStrong((id *)&self->_cachedSystemStyleForCreativeStylePicker, v5);
    id v9 = self->_creativeStylePicker;
  }
  id v12 = v9;

  return v12;
}

- (id)stylePickerIncludingSystemStyles:(BOOL)a3 resolvedSystemStyle:(id)a4 creativeStyles:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a4;
  int v8 = +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:v7];
  id v9 = [MEMORY[0x263F306F8] defaultStylesIncludingSystemStyles:v6 systemStylePlaceholder:v7 != 0 creativeStyles:v5];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v15 presetType])
        {
          if (v7)
          {
            uint64_t v16 = [v15 presetType];
            if (v16 == [v8 presetType]) {
              continue;
            }
          }
          id v17 = +[CAMCaptureConversions AVCaptureSmartStyleForCEKSmartStyle:v15];
        }
        else
        {
          id v17 = v7;
        }
        id v18 = v17;
        if (v17)
        {
          [v10 addObject:v17];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  long long v19 = [(CAMCaptureEngine *)self _captureSession];
  id v20 = [(CAMCaptureEngine *)self _captureController];
  objc_initWeak(&location, v20);

  id v21 = objc_alloc(MEMORY[0x263EFA688]);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __88__CAMCaptureEngine_stylePickerIncludingSystemStyles_resolvedSystemStyle_creativeStyles___block_invoke;
  v25[3] = &unk_263FA5CD8;
  objc_copyWeak(&v26, &location);
  int64_t v22 = (void *)[v21 initWithSession:v19 styles:v10 action:v25];
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v22;
}

void __88__CAMCaptureEngine_stylePickerIncludingSystemStyles_resolvedSystemStyle_creativeStyles___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:v3];

  BOOL v5 = [WeakRetained controlsDelegate];
  [v5 captureController:WeakRetained receivedOverlayChangeSmartStyle:v4];
}

- (id)toneBiasSlider
{
  toneBiasSlider = self->_toneBiasSlider;
  if (!toneBiasSlider)
  {
    uint64_t v4 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v4];
    BOOL v5 = [(CAMCaptureEngine *)self _captureSession];
    BOOL v6 = [(CAMCaptureEngine *)self _captureController];
    objc_initWeak(&location, v6);

    id v7 = objc_alloc(MEMORY[0x263EFA690]);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __34__CAMCaptureEngine_toneBiasSlider__block_invoke;
    id v14 = &unk_263FA5CD8;
    objc_copyWeak(&v15, &location);
    int v8 = (AVCaptureSystemStyleSlider *)[v7 initWithSession:v5 parameter:2 action:&v11];
    id v9 = self->_toneBiasSlider;
    self->_toneBiasSlider = v8;

    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    toneBiasSlider = self->_toneBiasSlider;
  }
  return toneBiasSlider;
}

void __34__CAMCaptureEngine_toneBiasSlider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:v3];

  BOOL v5 = [WeakRetained controlsDelegate];
  [v5 captureController:WeakRetained receivedOverlayUpdateSmartStyle:v4];
}

- (id)colorBiasSlider
{
  colorBiasSlider = self->_colorBiasSlider;
  if (!colorBiasSlider)
  {
    uint64_t v4 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v4];
    BOOL v5 = [(CAMCaptureEngine *)self _captureSession];
    BOOL v6 = [(CAMCaptureEngine *)self _captureController];
    objc_initWeak(&location, v6);

    id v7 = objc_alloc(MEMORY[0x263EFA690]);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __35__CAMCaptureEngine_colorBiasSlider__block_invoke;
    id v14 = &unk_263FA5CD8;
    objc_copyWeak(&v15, &location);
    int v8 = (AVCaptureSystemStyleSlider *)[v7 initWithSession:v5 parameter:1 action:&v11];
    id v9 = self->_colorBiasSlider;
    self->_colorBiasSlider = v8;

    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    colorBiasSlider = self->_colorBiasSlider;
  }
  return colorBiasSlider;
}

void __35__CAMCaptureEngine_colorBiasSlider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:v3];

  BOOL v5 = [WeakRetained controlsDelegate];
  [v5 captureController:WeakRetained receivedOverlayUpdateSmartStyle:v4];
}

- (id)intensitySlider
{
  intensitySlider = self->_intensitySlider;
  if (!intensitySlider)
  {
    uint64_t v4 = NSStringFromSelector(a2);
    [(CAMCaptureEngine *)self willChangeValueForKey:v4];
    BOOL v5 = [(CAMCaptureEngine *)self _captureSession];
    BOOL v6 = [(CAMCaptureEngine *)self _captureController];
    objc_initWeak(&location, v6);

    id v7 = objc_alloc(MEMORY[0x263EFA690]);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __35__CAMCaptureEngine_intensitySlider__block_invoke;
    id v14 = &unk_263FA5CD8;
    objc_copyWeak(&v15, &location);
    int v8 = (AVCaptureSystemStyleSlider *)[v7 initWithSession:v5 parameter:0 action:&v11];
    id v9 = self->_intensitySlider;
    self->_intensitySlider = v8;

    -[CAMCaptureEngine didChangeValueForKey:](self, "didChangeValueForKey:", v4, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

    intensitySlider = self->_intensitySlider;
  }
  return intensitySlider;
}

void __35__CAMCaptureEngine_intensitySlider__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = +[CAMCaptureConversions CEKSmartStyleForAVCaptureSmartStyle:v3];

  BOOL v5 = [WeakRetained controlsDelegate];
  [v5 captureController:WeakRetained receivedOverlayUpdateSmartStyle:v4];
}

- (id)apertureSlider
{
  return self->_apertureSlider;
}

- (id)emulatedZoomSlider
{
  return self->_emulatedZoomSlider;
}

- (void)_ensureApertureSliderForGraphConfiguration:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[CAMCaptureCapabilities capabilities];
  if ([v5 isDepthEffectApertureSupported])
  {
    BOOL v6 = self->_apertureSlider;
    uint64_t v7 = [v4 mode];
    uint64_t v8 = [v4 device];
    if ((unint64_t)(v8 - 1) > 0xA) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = qword_209C7B8E0[v8 - 1];
    }
    if ([v5 isDepthEffectApertureSupportedForMode:v7 devicePosition:v9])
    {
      uint64_t v10 = v7;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
    }
    [v5 minimumDepthEffectApertureForMode:v10 device:v8];
    double v12 = v11;
    [v5 maximumDepthEffectApertureForMode:v10 device:v8];
    double v14 = v13;
    uint64_t v15 = [MEMORY[0x263F30688] indexOfClosestValidValueForAperture:v12];
    uint64_t v16 = [MEMORY[0x263F30688] indexOfClosestValidValueForAperture:v14] - v15 + 1;
    id v17 = [MEMORY[0x263F30688] validApertureValues];
    id v18 = objc_msgSend(v17, "subarrayWithRange:", v15, v16);

    [v5 defaultZoomFactorForGraphConfiguration:v4 captureOrientation:1 customLens:0 outputToExternalStorage:0 overrodeWithForcedZoomValue:0];
    objc_msgSend(v5, "defaultDepthEffectApertureForMode:device:zoomFactor:", v10, v8);
    double v20 = v19;
    if (v6 && ([v18 isEqualToArray:self->_apertureSliderValues] & 1) != 0)
    {
      int64_t v22 = v6;
    }
    else
    {
      uint64_t v23 = [(CAMCaptureEngine *)self _captureController];
      objc_initWeak(&location, v23);

      id v24 = objc_alloc(MEMORY[0x263EFA640]);
      double v25 = CAMLocalizedFrameworkString(@"CAMERA_OVERLAY_APERTURE_SLIDER_TITLE", 0);
      int64_t v22 = (AVCaptureSlider *)[v24 initWithLocalizedTitle:v25 symbolName:@"f.cursive" values:v18];

      id v26 = CAMLocalizedFrameworkString(@"CAMERA_OVERLAY_APERTURE_SLIDER_VALUE_FORMAT", 0);
      [(AVCaptureSlider *)v22 setLocalizedValueFormat:v26];

      captureSessionQueue = self->__captureSessionQueue;
      uint64_t v29 = MEMORY[0x263EF8330];
      uint64_t v30 = 3221225472;
      long long v31 = __63__CAMCaptureEngine__ensureApertureSliderForGraphConfiguration___block_invoke;
      uint64_t v32 = &unk_263FA0910;
      objc_copyWeak(&v33, &location);
      [(AVCaptureSlider *)v22 setActionQueue:captureSessionQueue action:&v29];
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    *(float *)&double v21 = v20;
    -[AVCaptureSlider setValue:](v22, "setValue:", v21, v29, v30, v31, v32);
    [(AVCaptureSlider *)v22 setProminentValues:&unk_26BDE04C0];
    if (v22 != self->_apertureSlider)
    {
      long long v28 = NSStringFromSelector(sel_apertureSlider);
      [(CAMCaptureEngine *)self willChangeValueForKey:v28];
      objc_storeStrong((id *)&self->_apertureSlider, v22);
      objc_storeStrong((id *)&self->_apertureSliderValues, v18);
      [(CAMCaptureEngine *)self didChangeValueForKey:v28];
    }
  }
}

void __63__CAMCaptureEngine__ensureApertureSliderForGraphConfiguration___block_invoke(uint64_t a1, float a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__CAMCaptureEngine__ensureApertureSliderForGraphConfiguration___block_invoke_2;
  v3[3] = &unk_263FA1018;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  float v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
}

void __63__CAMCaptureEngine__ensureApertureSliderForGraphConfiguration___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained controlsDelegate];
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  [v2 captureController:WeakRetained receivedOverlaySimulatedAperture:v3];
}

- (void)ensureControlsForGraphConfiguration:(id)a3
{
  id v4 = a3;
  [(CAMCaptureEngine *)self _ensureEmulatedZoomSliderForGraphConfiguration:v4];
  [(CAMCaptureEngine *)self _ensureApertureSliderForGraphConfiguration:v4];
}

- (void)_ensureEmulatedZoomSliderForGraphConfiguration:(id)a3
{
  id v4 = a3;
  emulatedZoomSlider = self->_emulatedZoomSlider;
  if (emulatedZoomSlider)
  {
    self->_emulatedZoomSlider = 0;
  }
  id v21 = 0;
  BOOL v6 = +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:](CAMZoomControlUtilities, "shouldApplyContinuousZoomForMode:device:videoConfiguration:videoStabilizationStrength:zoomFactors:displayZoomFactors:", [v4 mode], objc_msgSend(v4, "device"), objc_msgSend(v4, "videoConfiguration"), objc_msgSend(v4, "videoStabilizationStrength"), &v21, 0);
  id v7 = v21;
  uint64_t v8 = v7;
  if (v6 && [v7 count])
  {
    uint64_t v9 = [v8 firstObject];
    [v9 floatValue];
    int v11 = v10;

    double v12 = [v8 lastObject];
    [v12 floatValue];
    int v14 = v13;

    id v15 = objc_alloc(MEMORY[0x263EFA640]);
    uint64_t v16 = CAMLocalizedFrameworkString(@"ZOOM", 0);
    LODWORD(v17) = v11;
    LODWORD(v18) = v14;
    double v19 = (AVCaptureSlider *)[v15 initWithLocalizedTitle:v16 symbolName:@"magnifyingglass" minValue:v17 maxValue:v18];
    double v20 = self->_emulatedZoomSlider;
    self->_emulatedZoomSlider = v19;

    [(AVCaptureSlider *)self->_emulatedZoomSlider setProminentValues:v8];
    [(AVCaptureSlider *)self->_emulatedZoomSlider setActionQueue:MEMORY[0x263EF83A0] action:&__block_literal_global_470];
  }
}

- (void)sessionControlsDidBecomeActive:(id)a3
{
  double v3 = [(CAMCaptureEngine *)self _captureController];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CAMCaptureEngine_sessionControlsDidBecomeActive___block_invoke;
  block[3] = &unk_263FA0208;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__CAMCaptureEngine_sessionControlsDidBecomeActive___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controlsDelegate];
  [v2 captureController:*(void *)(a1 + 32) receivedOverlayVisible:1];
}

- (void)sessionControlsDidBecomeInactive:(id)a3
{
  double v3 = [(CAMCaptureEngine *)self _captureController];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CAMCaptureEngine_sessionControlsDidBecomeInactive___block_invoke;
  block[3] = &unk_263FA0208;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__CAMCaptureEngine_sessionControlsDidBecomeInactive___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controlsDelegate];
  [v2 captureController:*(void *)(a1 + 32) receivedOverlayVisible:0];
}

- (void)sessionControlsWillEnterFullscreenAppearance:(id)a3
{
  double v3 = [(CAMCaptureEngine *)self _captureController];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CAMCaptureEngine_sessionControlsWillEnterFullscreenAppearance___block_invoke;
  block[3] = &unk_263FA0208;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__CAMCaptureEngine_sessionControlsWillEnterFullscreenAppearance___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controlsDelegate];
  [v2 captureController:*(void *)(a1 + 32) receivedQuietUIActive:1];
}

- (void)sessionControlsWillExitFullscreenAppearance:(id)a3
{
  double v3 = [(CAMCaptureEngine *)self _captureController];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CAMCaptureEngine_sessionControlsWillExitFullscreenAppearance___block_invoke;
  block[3] = &unk_263FA0208;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__CAMCaptureEngine_sessionControlsWillExitFullscreenAppearance___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controlsDelegate];
  [v2 captureController:*(void *)(a1 + 32) receivedQuietUIActive:0];
}

- (void)session:(id)a3 controlsDidChangeAutoFocusLocked:(BOOL)a4
{
  float v5 = [(CAMCaptureEngine *)self _captureController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CAMCaptureEngine_session_controlsDidChangeAutoFocusLocked___block_invoke;
  v7[3] = &unk_263FA02A8;
  id v8 = v5;
  BOOL v9 = a4;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __61__CAMCaptureEngine_session_controlsDidChangeAutoFocusLocked___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controlsDelegate];
  [v2 captureController:*(void *)(a1 + 32) receivedFocusLocked:*(unsigned __int8 *)(a1 + 40)];
}

- (void)session:(id)a3 didChangeActiveControl:(id)a4
{
  id v5 = a4;
  id v6 = [(CAMCaptureEngine *)self _captureController];
  if (v5)
  {
    id v7 = [(CAMCaptureEngine *)self creativeStylePicker];
    if (v7 == v5)
    {
      BOOL v12 = 1;
    }
    else
    {
      id v8 = [(CAMCaptureEngine *)self systemStylePicker];
      if (v8 == v5)
      {
        BOOL v12 = 1;
      }
      else
      {
        id v9 = [(CAMCaptureEngine *)self intensitySlider];
        if (v9 == v5)
        {
          BOOL v12 = 1;
        }
        else
        {
          id v10 = [(CAMCaptureEngine *)self colorBiasSlider];
          if (v10 == v5)
          {
            BOOL v12 = 1;
          }
          else
          {
            id v11 = [(CAMCaptureEngine *)self toneBiasSlider];
            BOOL v12 = v11 == v5;
          }
        }
      }
    }

    id v14 = [(CAMCaptureEngine *)self apertureSlider];
    BOOL v13 = v14 == v5;
  }
  else
  {
    BOOL v13 = 0;
    BOOL v12 = 0;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__CAMCaptureEngine_session_didChangeActiveControl___block_invoke;
  v16[3] = &unk_263FA02D0;
  id v17 = v6;
  BOOL v18 = v12;
  BOOL v19 = v13;
  id v15 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v16);
}

void __51__CAMCaptureEngine_session_didChangeActiveControl___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controlsDelegate];
  [v2 captureController:*(void *)(a1 + 32) receivedOverlayStyleControlActive:*(unsigned __int8 *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) controlsDelegate];
  [v3 captureController:*(void *)(a1 + 32) receivedOverlayApertureControlActive:*(unsigned __int8 *)(a1 + 41)];
}

- (void)captureEngineDevice:(id)a3 didChangeSystemExposureTargetBias:(float)a4
{
  id v5 = [(CAMCaptureEngine *)self _captureController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__CAMCaptureEngine_captureEngineDevice_didChangeSystemExposureTargetBias___block_invoke;
  v7[3] = &unk_263FA48E0;
  id v8 = v5;
  float v9 = a4;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __74__CAMCaptureEngine_captureEngineDevice_didChangeSystemExposureTargetBias___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controlsDelegate];
  [v2 captureController:*(void *)(a1 + 32) receivedSystemOverlayUpdateExposureBias:*(float *)(a1 + 40)];
}

- (void)captureEngineDevice:(id)a3 didChangeLensSelectorZoomFactor:(float)a4
{
  id v5 = [(CAMCaptureEngine *)self _captureController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__CAMCaptureEngine_captureEngineDevice_didChangeLensSelectorZoomFactor___block_invoke;
  v7[3] = &unk_263FA48E0;
  id v8 = v5;
  float v9 = a4;
  id v6 = v5;
  cam_perform_on_main_asap(v7);
}

void __72__CAMCaptureEngine_captureEngineDevice_didChangeLensSelectorZoomFactor___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controlsDelegate];
  [v2 captureController:*(void *)(a1 + 32) receivedSystemOverlayLensSelectorZoomFactor:*(float *)(a1 + 40)];
}

- (OS_dispatch_queue)_captureResultsQueue
{
  return self->__captureResultsQueue;
}

- (AVCaptureVideoPreviewLayer)_videoPreviewLayer
{
  return self->__videoPreviewLayer;
}

- (AVSpatialOverCaptureVideoPreviewLayer)_overCaptureVideoPreviewLayer
{
  return self->__overCaptureVideoPreviewLayer;
}

- (FBSDisplayLayoutMonitor)_layoutMonitor
{
  return self->__layoutMonitor;
}

- (void)set_layoutMonitor:(id)a3
{
}

- (CUCaptureController)_captureController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__captureController);
  return (CUCaptureController *)WeakRetained;
}

- (CAMPowerController)_powerController
{
  return self->__powerController;
}

- (unsigned)_panoramaAssertionIdentifier
{
  return self->__panoramaAssertionIdentifier;
}

- (void)_setPanoramaAssertionIdentifier:(unsigned int)a3
{
  self->__panoramaAssertionIdentifier = a3;
}

- (AVCaptureDevice)currentCameraDevice
{
  return self->_currentCameraDevice;
}

- (void)setCurrentCameraDevice:(id)a3
{
}

- (AVCapturePhotoOutput)currentStillImageOutput
{
  return self->_currentStillImageOutput;
}

- (void)setCurrentStillImageOutput:(id)a3
{
}

- (NSMutableDictionary)_resultsQueueRegisteredStillImageRequests
{
  return self->__resultsQueueRegisteredStillImageRequests;
}

- (NSMutableSet)_resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue
{
  return self->__resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue;
}

- (NSMutableDictionary)_sessionQueueCachedPhotoInitiationSettings
{
  return self->__sessionQueueCachedPhotoInitiationSettings;
}

- (NSMutableDictionary)_resultsQueueRequestsBeingRecorded
{
  return self->__resultsQueueRequestsBeingRecorded;
}

- (NSURL)_resultsQueueLastCompletedVideoURL
{
  return self->__resultsQueueLastCompletedVideoURL;
}

- (void)_setResultsQueueLastCompletedVideoURL:(id)a3
{
}

- (double)_resultsQueueLastCompletedVideoZoomFactor
{
  return self->__resultsQueueLastCompletedVideoZoomFactor;
}

- (void)_setResultsQueueLastCompletedVideoZoomFactor:(double)a3
{
  self->__resultsQueueLastCompletedVideoZoomFactor = a3;
}

- (_CAImageQueue)_panoramaImageQueue
{
  return self->__panoramaImageQueue;
}

- (OS_dispatch_semaphore)_panoramaFirstImageQueueUpdateSemaphore
{
  return self->__panoramaFirstImageQueueUpdateSemaphore;
}

- (void)_setPanoramaFirstImageQueueUpdateSemaphore:(id)a3
{
}

- (OS_dispatch_queue)_panoramaFirstImageQueueUpdateSemaphoreQueue
{
  return self->__panoramaFirstImageQueueUpdateSemaphoreQueue;
}

- (OS_dispatch_queue)_effectsPreviewSurfaceFilteringQueue
{
  return self->__effectsPreviewSurfaceFilteringQueue;
}

- (CIContext)_effectsPreviewSurfaceFilteringContext
{
  return self->__effectsPreviewSurfaceFilteringContext;
}

- (OS_dispatch_queue)_effectsPreviewSampleBufferQueue
{
  return self->__effectsPreviewSampleBufferQueue;
}

- (NSHashTable)_effectsPreviewSampleBufferDelegates
{
  return self->__effectsPreviewSampleBufferDelegates;
}

- (NSHashTable)_videoThumbnailContentsDelegates
{
  return self->__videoThumbnailContentsDelegates;
}

- (void)_setPerformingRecovery:(BOOL)a3
{
  self->__performingRecovery = a3;
}

- (unint64_t)_numberOfRecoveryAttempts
{
  return self->__numberOfRecoveryAttempts;
}

- (void)_setNumberOfRecoveryAttempts:(unint64_t)a3
{
  self->__numberOfRecoveryAttempts = a3;
}

- (double)_accidentalLaunchPrewarmTime
{
  return self->__accidentalLaunchPrewarmTime;
}

- (void)_setAccidentalLaunchPrewarmTime:(double)a3
{
  self->__accidentalLaunchPrewarmTime = a3;
}

- (double)_accidentalLaunchTimeout
{
  return self->__accidentalLaunchTimeout;
}

- (void)_setAccidentalLaunchTimeout:(double)a3
{
  self->__accidentalLaunchTimeout = a3;
}

- (NSString)_accidentalLaunchPrewarmReason
{
  return self->__accidentalLaunchPrewarmReason;
}

- (void)_setAccidentalLaunchPrewarmReason:(id)a3
{
}

- (BOOL)_cameraTransitionInProcess
{
  return self->__cameraTransitionInProcess;
}

- (void)set_cameraTransitionInProcess:(BOOL)a3
{
  self->__cameraTransitionInProcess = a3;
}

- (void)set_lastTapToRadarTime:(id)a3
{
}

- (OS_dispatch_queue)_signpostMutexQueue
{
  return self->__signpostMutexQueue;
}

- (NSMutableSet)_didEmitCaptureIntervalStartedSignpostsForUniqueID
{
  return self->__didEmitCaptureIntervalStartedSignpostsForUniqueID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__didEmitCaptureIntervalStartedSignpostsForUniqueID, 0);
  objc_storeStrong((id *)&self->__signpostMutexQueue, 0);
  objc_storeStrong((id *)&self->__lastTapToRadarTime, 0);
  objc_storeStrong((id *)&self->__accidentalLaunchPrewarmReason, 0);
  objc_storeStrong((id *)&self->__recoveryMutexQueue, 0);
  objc_storeStrong((id *)&self->__videoThumbnailContentsDelegates, 0);
  objc_storeStrong((id *)&self->__effectsPreviewSampleBufferDelegates, 0);
  objc_storeStrong((id *)&self->__effectsPreviewSampleBufferQueue, 0);
  objc_storeStrong((id *)&self->__effectsPreviewSurfaceFilteringContext, 0);
  objc_storeStrong((id *)&self->__effectsPreviewSurfaceFilteringQueue, 0);
  objc_storeStrong((id *)&self->__panoramaFirstImageQueueUpdateSemaphoreQueue, 0);
  objc_storeStrong((id *)&self->__panoramaFirstImageQueueUpdateSemaphore, 0);
  objc_storeStrong((id *)&self->__panoramaProcessor, 0);
  objc_storeStrong((id *)&self->__panoramaSubgraphQueue, 0);
  objc_storeStrong((id *)&self->__panoramaSampleBufferQueue, 0);
  objc_storeStrong((id *)&self->__metadataObjectsQueue, 0);
  objc_storeStrong((id *)&self->__servicesQueueCaptureServices, 0);
  objc_storeStrong((id *)&self->__captureServicesQueue, 0);
  objc_storeStrong((id *)&self->__resultsQueueLastCompletedVideoURL, 0);
  objc_storeStrong((id *)&self->__resultsQueueRequestsBeingRecorded, 0);
  objc_storeStrong((id *)&self->__sessionQueueCachedPhotoInitiationSettings, 0);
  objc_storeStrong((id *)&self->__resultsQueueRegisteredStillImageRequestsDispatchedToFilteringQueue, 0);
  objc_storeStrong((id *)&self->__resultsQueueRegisteredStillImageRequests, 0);
  objc_storeStrong((id *)&self->_currentStillImageOutput, 0);
  objc_storeStrong((id *)&self->_currentCameraDevice, 0);
  objc_storeStrong((id *)&self->__powerController, 0);
  objc_destroyWeak((id *)&self->__captureController);
  objc_storeStrong((id *)&self->__layoutMonitor, 0);
  objc_storeStrong((id *)&self->__overCaptureVideoPreviewLayer, 0);
  objc_storeStrong((id *)&self->__videoPreviewLayer, 0);
  objc_storeStrong((id *)&self->__captureResultsQueue, 0);
  objc_storeStrong((id *)&self->__captureSessionQueue, 0);
  objc_storeStrong((id *)&self->__captureSession, 0);
  objc_storeStrong((id *)&self->__captureEngineDeviceCache, 0);
  objc_storeStrong((id *)&self->_toneBiasSlider, 0);
  objc_storeStrong((id *)&self->_colorBiasSlider, 0);
  objc_storeStrong((id *)&self->_intensitySlider, 0);
  objc_storeStrong((id *)&self->_cachedSystemStyleForCreativeStylePicker, 0);
  objc_storeStrong((id *)&self->_creativeStylePicker, 0);
  objc_storeStrong((id *)&self->_systemStylePicker, 0);
  objc_storeStrong((id *)&self->_emulatedZoomSlider, 0);
  objc_storeStrong((id *)&self->_apertureSliderValues, 0);
  objc_storeStrong((id *)&self->_apertureSlider, 0);
  objc_storeStrong((id *)&self->_videoThumbnailOutput, 0);
  objc_storeStrong((id *)&self->_effectsPreviewVideoDataOutput, 0);
  objc_storeStrong((id *)&self->_metadataOutput, 0);
  objc_storeStrong((id *)&self->_panoramaVideoDataOutput, 0);
  objc_storeStrong((id *)&self->_movieFileOutput, 0);
  objc_storeStrong((id *)&self->_stillImageOutput, 0);
  objc_storeStrong((id *)&self->_audioCaptureDeviceInput, 0);
  objc_storeStrong((id *)&self->_audioCameraDevice, 0);
}

- (void)_handleSessionRuntimeError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  id v3 = a1;
  OUTLINED_FUNCTION_6_1(&dword_2099F8000, v4, v5, "[%{public}@] Encountered another AVCaptureSession runtime error during session recovery… (%{public}@)");
}

- (void)_performSessionRuntimeRecovery:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  id v5 = v7;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Performing recovery from error: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_handleFailedSessionRecoveryAttemptAfterDelay:.cold.1()
{
  OUTLINED_FUNCTION_12();
  id v3 = (id)OUTLINED_FUNCTION_8_0(v0, v1, v2, 5.8382e-34);
  OUTLINED_FUNCTION_6_1(&dword_2099F8000, v4, v5, "[%{public}@] Stopping recovery after %ld failed attempts! Please file a radar with /DiagnosticLogs/com.apple.photos/ and syslog attached.");
}

- (void)_handleFailedSessionRecoveryAttemptAfterDelay:.cold.2()
{
  OUTLINED_FUNCTION_12();
  uint64_t v5 = (void *)OUTLINED_FUNCTION_8_0(v2, v3, v4, 5.8383e-34);
  *(_WORD *)(v6 + 22) = v7;
  *(void *)(v6 + 24) = 5;
  id v8 = v5;
  _os_log_error_impl(&dword_2099F8000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] Not attempting to recover from an AVCaptureSession error, because we've already had %ld failed attempts, more than the maximum %ld", v1, 0x20u);
}

- (void)_handleFailedSessionRecoveryAttemptAfterDelay:(double)a3 .cold.3(void *a1, uint64_t a2, double a3)
{
  *(_DWORD *)a2 = 138543618;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = a3;
  id v3 = a1;
  OUTLINED_FUNCTION_6_1(&dword_2099F8000, v4, v5, "[%{public}@] Backing off from an AVCaptureSession error recovery retry for %f seconds...");
}

- (void)_handleSessionWasPrewarmed:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Session was prewarmed without a reason!", v2, v3, v4, v5, v6);
}

- (void)_handleSessionWasPrewarmed:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_2099F8000, v0, OS_LOG_TYPE_DEBUG, "Ignoring prewarm reason %@", v1, 0xCu);
}

void __64__CAMCaptureEngine__showAccidentalLaunchNotificationIfNecessary__block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) title];
  uint64_t v5 = [*(id *)(a1 + 32) body];
  [a2 code];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_2099F8000, v6, v7, "Error posting UNNotificationRequest for %{public}@. \n Original message was: %{public}@, but encountered %ld", v8, v9, v10, v11, 2u);
}

- (void)_lockManagedCapturedDevice:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to lock %{public}@ for configuration", v2, v3, v4, v5, v6);
}

- (void)cacheMomentCaptureSettings:forIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Cannot cache initiation settings for nil identifier", v2, v3, v4, v5, v6);
}

- (void)cachedMomentCaptureSettingsForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Cannot retrieve cached initiation settings for nil identifier", v2, v3, v4, v5, v6);
}

- (void)clearCachedMomentCaptureSettingsForIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Cannot clear cached moment capture settings for nil identifier", v2, v3, v4, v5, v6);
}

- (void)_createOutputPixelBufferWithSize:matchingInputPixelBuffer:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Failed to create IOSurface backed pixel buffer matching the input for filtering: %d", v2, v3, v4, v5, v6);
}

- (void)_createOutputPixelBufferWithSize:matchingInputPixelBuffer:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Failed to get bulk attachments from input IOSurface before filtering: %d", v2, v3, v4, v5, v6);
}

- (void)_createOutputPixelBufferWithSize:matchingInputPixelBuffer:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Failed to set bulk attachments on output IOSurface for filtering: %d", v2, v3, v4, v5, v6);
}

void __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Missing video preview surface (AVCaptureMovieFileOutputRecordingCompletedNotification not called)", v2, v3, v4, v5, v6);
}

void __132__CAMCaptureEngine__captureOutput_didFinishRecordingToOutputFileAtURL_fromConnections_forVideoCaptureRequest_videoZoomFactor_error___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_2099F8000, v0, v1, "Error creating pixel buffer from video preview surface: %d", v2, v3, v4, v5, v6);
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Successfully recovered movie fragments into a usable movie file.", v2, v3, v4, v5, v6);
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Failed to recover the movie fragments into a usable movie file. (%{public}@)", v2, v3, v4, v5, v6);
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Attempting to recover from movie fragments…", v2, v3, v4, v5, v6);
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.4()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Did not attempt recovery of %{public}@ because AVErrorRecordingSuccessfullyFinishedKey==NO: %{public}@");
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "AVErrorRecordingSuccessfullyFinishedKey==NO for Live Photo movie but file exists so we will try to recover anyway", v2, v3, v4, v5, v6);
}

- (void)_validateVideoAtURL:forCaptureRequest:captureID:captureError:isVideoComplement:stillImageDisplayTime:reportedDuration:outActualDuration:outVideoRecordingStoppedReason:outSlowWriterFrameDrops:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "File does not exist: %{public}@", v2, v3, v4, v5, v6);
}

void __211__CAMCaptureEngine__validateVideoAtURL_forCaptureRequest_captureID_captureError_isVideoComplement_stillImageDisplayTime_reportedDuration_outActualDuration_outVideoRecordingStoppedReason_outSlowWriterFrameDrops___block_invoke_cold_1(uint64_t a1, void *a2)
{
  [a2 code];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10(&dword_2099F8000, v2, v3, "Error posting UNNotificationRequest for %{public}@. \n Original message was: %{public}@, but encountered %ld", v4, v5, v6, v7, 2u);
}

- (void)_subgraphQueueHandlePanoramaErrorNotification:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Received panorama error %{public}@", v2, v3, v4, v5, v6);
}

void __63__CAMCaptureEngine__captureEngineDeviceForDeviceType_position___block_invoke_cold_1(void *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&void v3[4] = *a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_5(&dword_2099F8000, (uint64_t)a2, a3, "Failed to get device from -[AVCaptureDevice defaultDeviceWithDeviceType:%{public}@ mediaType:AVMediaTypeVideo position:%ld]", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)systemPreferredCameraDevice
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2099F8000, v0, v1, "Failed to get device from +[AVCaptureDevice systemPreferredCamera]", v2, v3, v4, v5, v6);
}

- (void)audioCaptureDeviceInput
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_2099F8000, v0, v1, "Creating an AVCaptureDeviceInput for the audio device (%{public}@) failed. (%{public}@)");
}

@end