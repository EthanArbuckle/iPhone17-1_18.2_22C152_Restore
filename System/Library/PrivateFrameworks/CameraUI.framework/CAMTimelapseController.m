@interface CAMTimelapseController
+ (__IOSurface)_newVideoPreviewSurfaceForTimelapseState:(id)a3;
+ (id)createPlaceholderResultForTimelapseState:(id)a3;
- (BOOL)_backendRecoveryNeeded;
- (BOOL)_canCapturePhoto;
- (BOOL)_enqueueCaptureRequest;
- (BOOL)_ignoringTimerCallbacksForTearDown;
- (BOOL)_ignoringTimerCallbacksWaitingForCaptureResponse;
- (BOOL)_isFocusAndExposureAdjusted;
- (BOOL)_previewStarted;
- (BOOL)_shouldUpdateFocusAndExposureWhenContrastDetectionCompletes;
- (BOOL)isCapturing;
- (BOOL)startCapturingWithCaptureDevice:(int64_t)a3 captureSession:(unsigned __int16)a4;
- (BOOL)stopCapturingWithReasons:(int64_t)a3;
- (CAMCaptureGraphConfiguration)_graphConfigurationForCurrentState;
- (CAMFocusResult)lastFocusResult;
- (CAMLibrarySelectionController)_librarySelectionController;
- (CAMLocationController)_locationController;
- (CAMMotionController)_motionController;
- (CAMNebulaDaemonProxyManager)_nebulaDaemonProxyManager;
- (CAMPersistenceController)_persistenceController;
- (CAMStorageController)_storageController;
- (CAMTimelapseController)init;
- (CAMTimelapseController)initWithCaptureController:(id)a3 locationController:(id)a4 motionController:(id)a5 persistenceController:(id)a6 storageController:(id)a7 librarySelectionController:(id)a8 nebulaDaemonProxyManager:(id)a9;
- (CAMTimelapseControllerDelegate)delegate;
- (CAMTimelapseState)_state;
- (CUCaptureController)_captureController;
- (NSCountedSet)_inFlightTimelapseUUIDs;
- (NSDate)captureStartTime;
- (NSMutableSet)_pendingCompletedStates;
- (OS_dispatch_source)_captureTimer;
- (ct_green_tea_logger_s)_greenTeaLogger;
- (id)_createThumbnailImageFromPlaceholderResult:(id)a3;
- (id)_stillImageCaptureRequestWithCurrentSettings;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_captureTimerFired;
- (void)_enqueueCaptureRequest;
- (void)_invalidateCachedGraphConfiguration;
- (void)_notifyInsufficientDiskSpaceForContinuingCapture;
- (void)_notifyInsufficientDiskSpaceForStartingCaptureWithNeededBytes:(int64_t)a3 availableBytes:(int64_t)a4;
- (void)_prepareForTimelapseCaptureSetModeAndDevice:(BOOL)a3;
- (void)_previewStarted:(id)a3;
- (void)_reserveDiskSpaceForTimelapseUUID:(id)a3 preferHEVC:(BOOL)a4 withCompletionBlock:(id)a5;
- (void)_resetIgnoringTimerCallbacksWaitingForCaptureResponse;
- (void)_restoreCaptureStateFromDisk;
- (void)_saveStateToDisk:(id)a3;
- (void)_sessionRuntimeErrored:(id)a3;
- (void)_setBackendRecoveryNeeded:(BOOL)a3;
- (void)_setFocusAndExposureAdjusted:(BOOL)a3;
- (void)_setNewCaptureStateForCaptureDevice:(int64_t)a3 captureSession:(unsigned __int16)a4;
- (void)_setPreviewStarted:(BOOL)a3;
- (void)_setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:(BOOL)a3;
- (void)_startCaptureTimer;
- (void)_startCapturingWithCaptureDevice:(int64_t)a3 captureSession:(unsigned __int16)a4;
- (void)_stopCapturingWithReasons:(int64_t)a3;
- (void)_teardownCaptureTimer;
- (void)_triggerBackendCrashRecoveryIfNeeded;
- (void)_updateFocusAndExposureForStartCapturing;
- (void)_updateFocusLensPosition:(float)a3 forTimelapseUUID:(id)a4 forceUpdate:(BOOL)a5;
- (void)_updateLocationIfNecessary;
- (void)dealloc;
- (void)forceStopTimelapseCaptureWithReasons:(int64_t)a3;
- (void)restoreConfiguration;
- (void)setDelegate:(id)a3;
- (void)setLastFocusResult:(id)a3;
- (void)stillImageRequestDidCompleteStillImageCapture:(id)a3 withResponse:(id)a4 error:(id)a5;
- (void)stillImageRequestDidCompleteStillImageLocalPersistence:(id)a3 withResponse:(id)a4 error:(id)a5;
@end

@implementation CAMTimelapseController

- (void)restoreConfiguration
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if ([(CAMTimelapseController *)self isCapturing])
  {
    v3 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(CAMTimelapseState *)self->__state timelapseUUID];
      int v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Resuming timelapse capture for %{public}@", (uint8_t *)&v7, 0xCu);
    }
    [(CAMTimelapseController *)self _prepareForTimelapseCaptureSetModeAndDevice:1];
    v5 = [(CAMTimelapseController *)self _nebulaDaemonProxyManager];
    v6 = [(CAMTimelapseState *)self->__state timelapseUUID];
    [v5 resumeTimelapseWithUUID:v6];
  }
  [(CAMTimelapseController *)self _setBackendRecoveryNeeded:1];
}

- (BOOL)isCapturing
{
  return self->__state != 0;
}

- (void)_setBackendRecoveryNeeded:(BOOL)a3
{
  if (self->__backendRecoveryNeeded != a3)
  {
    self->__backendRecoveryNeeded = a3;
    [(CAMTimelapseController *)self _triggerBackendCrashRecoveryIfNeeded];
  }
}

- (void)_triggerBackendCrashRecoveryIfNeeded
{
  if ([(CAMTimelapseController *)self _backendRecoveryNeeded]
    && [(CAMTimelapseController *)self _previewStarted])
  {
    uint64_t v3 = [(CAMTimelapseController *)self isCapturing] ^ 1;
    id v4 = [(CAMTimelapseController *)self _nebulaDaemonProxyManager];
    [v4 performCrashRecoveryIfNeededForceEndLastTimelapseSession:v3];
    [(CAMTimelapseController *)self _setBackendRecoveryNeeded:0];
  }
}

- (BOOL)_backendRecoveryNeeded
{
  return self->__backendRecoveryNeeded;
}

- (BOOL)_previewStarted
{
  return self->__previewStarted;
}

- (void)setLastFocusResult:(id)a3
{
  uint64_t v4 = (uint64_t)a3;
  uint64_t v5 = v4;
  if (self->_lastFocusResult != (CAMFocusResult *)v4)
  {
    self->_lastFocusResult = (CAMFocusResult *)v4;
    uint64_t v6 = v4;
    uint64_t v4 = [(CAMTimelapseController *)self _shouldUpdateFocusAndExposureWhenContrastDetectionCompletes];
    uint64_t v5 = v6;
    if (v4)
    {
      [(CAMTimelapseController *)self _setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:0];
      uint64_t v4 = [(CAMTimelapseController *)self _updateFocusAndExposureForStartCapturing];
      uint64_t v5 = v6;
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (BOOL)_shouldUpdateFocusAndExposureWhenContrastDetectionCompletes
{
  return self->__shouldUpdateFocusAndExposureWhenContrastDetectionCompletes;
}

- (void)_resetIgnoringTimerCallbacksWaitingForCaptureResponse
{
}

- (void)_previewStarted:(id)a3
{
  [(CAMTimelapseController *)self _setPreviewStarted:1];
  if ([(CAMTimelapseController *)self isCapturing])
  {
    [(CAMTimelapseController *)self _updateFocusAndExposureForStartCapturing];
  }
}

- (void)_setPreviewStarted:(BOOL)a3
{
  if (self->__previewStarted != a3)
  {
    self->__previewStarted = a3;
    if (!a3) {
      [(CAMTimelapseController *)self _setFocusAndExposureAdjusted:0];
    }
    [(CAMTimelapseController *)self _triggerBackendCrashRecoveryIfNeeded];
  }
}

- (CAMNebulaDaemonProxyManager)_nebulaDaemonProxyManager
{
  return self->__nebulaDaemonProxyManager;
}

- (void)_applicationDidEnterBackground:(id)a3
{
  [(CAMTimelapseController *)self _setPreviewStarted:0];
  if ([(CAMTimelapseController *)self isCapturing])
  {
    [(CAMTimelapseController *)self stopCapturingWithReasons:4];
  }
}

- (void)_setFocusAndExposureAdjusted:(BOOL)a3
{
  self->__focusAndExposureAdjusted = a3;
}

- (CAMTimelapseController)initWithCaptureController:(id)a3 locationController:(id)a4 motionController:(id)a5 persistenceController:(id)a6 storageController:(id)a7 librarySelectionController:(id)a8 nebulaDaemonProxyManager:(id)a9
{
  id v31 = a3;
  id v30 = a4;
  id v29 = a5;
  id v28 = a6;
  id v27 = a7;
  id v16 = a8;
  id v17 = a9;
  v32.receiver = self;
  v32.super_class = (Class)CAMTimelapseController;
  v18 = [(CAMTimelapseController *)&v32 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->__captureController, a3);
    objc_storeStrong((id *)&v19->__locationController, a4);
    objc_storeStrong((id *)&v19->__motionController, a5);
    objc_storeStrong((id *)&v19->__storageController, a7);
    objc_storeStrong((id *)&v19->__persistenceController, a6);
    objc_storeStrong((id *)&v19->__librarySelectionController, a8);
    objc_storeStrong((id *)&v19->__nebulaDaemonProxyManager, a9);
    [(CAMNebulaDaemonProxyManager *)v19->__nebulaDaemonProxyManager setTimelapseClientDelegate:v19];
    v20 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    inFlightTimelapseUUIDs = v19->__inFlightTimelapseUUIDs;
    v19->__inFlightTimelapseUUIDs = v20;

    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    pendingCompletedStates = v19->__pendingCompletedStates;
    v19->__pendingCompletedStates = v22;

    v19->__greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v19 selector:sel__deviceStarted_ name:*MEMORY[0x263EF9610] object:0];
    [v24 addObserver:v19 selector:sel__sessionStarted_ name:*MEMORY[0x263EF9700] object:0];
    [v24 addObserver:v19 selector:sel__sessionRuntimeErrored_ name:*MEMORY[0x263EF9798] object:0];
    [v24 addObserver:v19 selector:sel__previewStarted_ name:*MEMORY[0x263EF97C8] object:0];
    v25 = +[CAMPriorityNotificationCenter defaultCenter];
    [v25 addObserver:v19 selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
    [v25 addObserver:v19 selector:sel__applicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
  }
  return v19;
}

- (CAMTimelapseController)init
{
  return [(CAMTimelapseController *)self initWithCaptureController:0 locationController:0 motionController:0 persistenceController:0 storageController:0 librarySelectionController:0 nebulaDaemonProxyManager:0];
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  uint64_t v4 = +[CAMPriorityNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  [(CAMTimelapseController *)self _teardownCaptureTimer];
  v5.receiver = self;
  v5.super_class = (Class)CAMTimelapseController;
  [(CAMTimelapseController *)&v5 dealloc];
}

- (void)_prepareForTimelapseCaptureSetModeAndDevice:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(CAMTimelapseController *)self _nebulaDaemonProxyManager];
  [v9 ensureConnectionToDaemon];
  objc_super v5 = [(CAMTimelapseController *)self _captureController];
  if (v3)
  {
    uint64_t v6 = [(CAMTimelapseController *)self _graphConfigurationForCurrentState];
    [v5 changeToGraphConfiguration:v6 zoomFactor:0 minimumExecutionTime:1.0 outputToExternalStorage:0.0];
  }
  int v7 = [(CAMTimelapseController *)self _graphConfigurationForCurrentState];
  uint64_t v8 = [v7 devicePosition];

  [v5 setCapturingTimelapse:1 forDevicePosition:v8];
  [(CAMTimelapseController *)self _updateFocusAndExposureForStartCapturing];
  [(CAMTimelapseController *)self _startCaptureTimer];
}

- (BOOL)startCapturingWithCaptureDevice:(int64_t)a3 captureSession:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  BOOL v7 = [(CAMTimelapseController *)self isCapturing];
  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Error: trying to start timelapse capture when already in progress", v12, 2u);
    }

    uint64_t v9 = [(CAMTimelapseState *)self->__state captureOrientation];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained timelapseController:self startedWithCaptureOrientation:v9];
  }
  else
  {
    [(CAMTimelapseController *)self _startCapturingWithCaptureDevice:a3 captureSession:v4];
  }
  return !v7;
}

- (BOOL)stopCapturingWithReasons:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v5 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = a3;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Stopping timelapse capture with reasons %ld", (uint8_t *)&v9, 0xCu);
  }

  BOOL v6 = [(CAMTimelapseController *)self isCapturing];
  if (v6)
  {
    [(CAMTimelapseController *)self _stopCapturingWithReasons:a3];
  }
  else
  {
    BOOL v7 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Error: trying to stop timelapse capture when none in progress", (uint8_t *)&v9, 2u);
    }
  }
  return v6;
}

- (void)_startCapturingWithCaptureDevice:(int64_t)a3 captureSession:(unsigned __int16)a4
{
  [(CAMTimelapseController *)self _setNewCaptureStateForCaptureDevice:a3 captureSession:a4];
  objc_super v5 = [(CAMTimelapseState *)self->__state timelapseUUID];
  BOOL v6 = [(CAMTimelapseController *)self _state];
  uint64_t v7 = [v6 preferHEVC];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__CAMTimelapseController__startCapturingWithCaptureDevice_captureSession___block_invoke;
  v9[3] = &unk_263FA4B90;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [(CAMTimelapseController *)self _reserveDiskSpaceForTimelapseUUID:v8 preferHEVC:v7 withCompletionBlock:v9];
}

void __74__CAMTimelapseController__startCapturingWithCaptureDevice_captureSession___block_invoke(uint64_t a1, char a2, char a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    if (a3)
    {
      [v4 _prepareForTimelapseCaptureSetModeAndDevice:0];
      *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
      [*(id *)(a1 + 32) _greenTeaLogger];
      objc_super v5 = getCTGreenTeaOsLogHandle();
      BOOL v6 = v5;
      if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_INFO, "Take a video", buf, 2u);
      }

      uint64_t v7 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v15 = v8;
        _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Starting timelapse capture for %{public}@", buf, 0xCu);
      }

      int v9 = [*(id *)(a1 + 32) _nebulaDaemonProxyManager];
      [v9 startTimelapseWithUUID:*(void *)(a1 + 40)];
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 40) captureOrientation];
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
      [WeakRetained timelapseController:*(void *)(a1 + 32) startedWithCaptureOrientation:v10];
    }
    else
    {
      v12 = (void *)v4[5];
      v4[5] = 0;

      [*(id *)(a1 + 32) _invalidateCachedGraphConfiguration];
      id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
      [v13 timelapseControllerStopped:*(void *)(a1 + 32)];
    }
  }
}

- (void)_stopCapturingWithReasons:(int64_t)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  objc_super v5 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = [(CAMTimelapseState *)self->__state timelapseUUID];
    *(_DWORD *)buf = 138543618;
    v45 = v6;
    __int16 v46 = 2048;
    int64_t v47 = a3;
    _os_log_impl(&dword_2099F8000, v5, OS_LOG_TYPE_DEFAULT, "Stopping timelapse capture for %{public}@, reason %ld", buf, 0x16u);
  }
  [(CAMTimelapseController *)self _teardownCaptureTimer];
  state = self->__state;
  uint64_t v8 = [MEMORY[0x263EFF910] date];
  [(CAMTimelapseState *)state addStopReasons:a3 stopTime:v8];

  int v9 = [(CAMTimelapseState *)self->__state timelapseUUID];
  v40 = v9;
  if ([(NSCountedSet *)self->__inFlightTimelapseUUIDs countForObject:v9])
  {
    if ([v9 length]) {
      [(NSMutableSet *)self->__pendingCompletedStates addObject:self->__state];
    }
  }
  else
  {
    [(CAMTimelapseState *)self->__state setAllFramesWritten:1];
  }
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v11 = NSURL;
  v12 = [(CAMTimelapseState *)self->__state timelapseUUID];
  id v13 = +[CAMPersistenceController uniqueIncomingPathForAssetWithUUID:v12 captureTime:@"MDATA" extension:Current];
  uint64_t v14 = [v11 fileURLWithPath:v13];

  uint64_t v15 = [(CAMTimelapseController *)self _persistenceController];
  v39 = [(CAMTimelapseController *)self _librarySelectionController];
  uint64_t v16 = [v39 sharedLibraryMode];
  id v17 = [(CAMTimelapseController *)self _librarySelectionController];
  v18 = [v17 acquiredSignalResults];
  v19 = [v18 identitiesInProximity];
  v20 = CAMLibrarySelectionIdentityContactIdentifiersForIdentities(v19);
  v21 = [(CAMTimelapseController *)self _librarySelectionController];
  v22 = [v21 librarySelectionDiagnostics];
  v41 = (void *)v14;
  LODWORD(v14) = [v15 writePrivateMetadataFileToURL:v14 withPrivateClientMetadata:0 sharedLibraryMode:v16 contactIDsInProximity:v20 sharedLibraryDiagnostics:v22];

  if (v14) {
    [(CAMTimelapseState *)self->__state setLocalPrivateMetadataFileURL:v41];
  }
  [(CAMTimelapseController *)self _saveStateToDisk:self->__state];
  v23 = [(CAMTimelapseController *)self _nebulaDaemonProxyManager];
  v24 = [(CAMTimelapseState *)self->__state timelapseUUID];
  [v23 updateTimelapseWithUUID:v24];

  v25 = [(CAMTimelapseState *)self->__state timelapseUUID];
  [v23 stopTimelapseWithUUID:v25];

  if ([(CAMTimelapseState *)self->__state allFramesWritten]) {
    [v23 closeConnectionToDaemon];
  }
  uint64_t v26 = [(CAMTimelapseState *)self->__state nextFrameIndex];
  uint64_t v27 = [(CAMTimelapseState *)self->__state sessionIdentifier];
  id v28 = [(CAMTimelapseState *)self->__state timelapseUUID];
  id v29 = self->__state;
  id v30 = self->__state;
  self->__state = 0;

  [(CAMTimelapseController *)self _invalidateCachedGraphConfiguration];
  [(CAMTimelapseController *)self _setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:0];
  id v31 = [(CAMTimelapseController *)self _captureController];
  uint64_t v32 = [(CAMTimelapseState *)v29 captureDevice];
  uint64_t v33 = 0;
  if ((unint64_t)(v32 - 1) <= 0xA) {
    uint64_t v33 = qword_209C7B530[v32 - 1];
  }
  [v31 setCapturingTimelapse:0 forDevicePosition:v33];
  if (v26 < 1)
  {
    id v34 = 0;
    goto LABEL_17;
  }
  id v34 = [(id)objc_opt_class() createPlaceholderResultForTimelapseState:v29];
  if (!v34)
  {
LABEL_17:
    v36 = 0;
    goto LABEL_18;
  }
  v35 = [(CAMTimelapseController *)self _persistenceController];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __52__CAMTimelapseController__stopCapturingWithReasons___block_invoke;
  v42[3] = &unk_263FA4BB8;
  v42[4] = self;
  id v34 = v34;
  id v43 = v34;
  [v35 persistPlaceholderTimelapseVideoWithResult:v34 completionHandler:v42];
  v36 = [(CAMTimelapseController *)self _createThumbnailImageFromPlaceholderResult:v34];

LABEL_18:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained timelapseController:self generatedPlaceholderResult:v34 withThumbnailImage:v36 forAssetUUID:v28 inCaptureSession:v27];

  id v38 = objc_loadWeakRetained((id *)&self->_delegate);
  [v38 timelapseControllerStopped:self];
}

void __52__CAMTimelapseController__stopCapturingWithReasons___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 40);
  id v4 = v3;
  pl_dispatch_async();
}

void __52__CAMTimelapseController__stopCapturingWithReasons___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 24));
  [WeakRetained timelapseController:a1[4] persistedPlaceholderResult:a1[5] error:a1[6]];
}

- (void)_setNewCaptureStateForCaptureDevice:(int64_t)a3 captureSession:(unsigned __int16)a4
{
  unsigned int v18 = a4;
  BOOL v6 = [(CAMTimelapseController *)self _motionController];
  uint64_t v7 = [v6 captureOrientation];
  uint64_t v8 = [(CAMTimelapseController *)self _captureController];
  int v9 = +[CAMUserPreferences preferences];
  uint64_t v10 = [v9 videoEncodingBehaviorForConfiguration:0 mode:5 desiredProResVideoMode:0 outputToExternalStorage:0 spatialVideoEnabled:0];
  uint64_t v11 = 0;
  if ((unint64_t)(a3 - 1) <= 0xA) {
    uint64_t v11 = qword_209C7B530[a3 - 1];
  }
  BOOL v12 = v10 == 1;
  uint64_t v13 = [v9 mirrorCameraCapturesForDevicePosition:v11 mode:5];
  uint64_t v14 = objc_alloc_init(CAMTimelapseState);
  state = self->__state;
  self->__state = v14;

  uint64_t v16 = self->__state;
  id v17 = [MEMORY[0x263EFF910] date];
  [(CAMTimelapseState *)v16 setStartTime:v17];

  [(CAMTimelapseState *)self->__state setCaptureOrientation:v7];
  [(CAMTimelapseState *)self->__state setCaptureMirrored:v13];
  [(CAMTimelapseState *)self->__state setCaptureDevice:a3];
  [(CAMTimelapseState *)self->__state setSessionIdentifier:v18];
  [(CAMTimelapseState *)self->__state setPreferHEVC:v12];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __77__CAMTimelapseController__setNewCaptureStateForCaptureDevice_captureSession___block_invoke;
  v19[3] = &unk_263FA4BE0;
  v19[4] = self;
  [v8 queryTimelapseDimensionsWithCompletionBlock:v19];
  [(CAMTimelapseController *)self _invalidateCachedGraphConfiguration];
}

uint64_t __77__CAMTimelapseController__setNewCaptureStateForCaptureDevice_captureSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setNominalIntermediateFrameSize:", (double)a2, (double)a3);
}

- (CAMCaptureGraphConfiguration)_graphConfigurationForCurrentState
{
  state = self->__state;
  if (state)
  {
    if (!self->__graphConfigurationForCurrentState)
    {
      uint64_t v4 = [(CAMTimelapseState *)state captureDevice];
      id v5 = +[CAMUserPreferences preferences];
      uint64_t v6 = [v5 photoEncodingBehavior];
      uint64_t v7 = [v5 videoEncodingBehaviorForConfiguration:0 mode:5 desiredProResVideoMode:0 outputToExternalStorage:0 spatialVideoEnabled:0];
      uint64_t v8 = +[CAMCaptureCapabilities capabilities];
      int v9 = v8;
      uint64_t v10 = 0;
      unint64_t v11 = v4 - 1;
      if ((unint64_t)(v4 - 1) <= 0xA) {
        uint64_t v10 = qword_209C7B530[v11];
      }
      uint64_t v12 = [v8 maxSupportedPhotoQualityPrioritizationForMode:5 devicePosition:v10];

      uint64_t v13 = +[CAMCaptureCapabilities capabilities];
      char v14 = [v13 shouldSuspendVideoHDRForHDRMode:0 captureMode:5];

      uint64_t v15 = 0;
      if (v11 <= 0xA) {
        uint64_t v15 = qword_209C7B530[v11];
      }
      BYTE2(v25) = 0;
      LOWORD(v25) = 0;
      LOWORD(v24) = 0;
      BYTE2(v23) = 0;
      LOWORD(v23) = 0;
      LOWORD(v22) = [v5 mirrorCameraCapturesForDevicePosition:v15 mode:5];
      BYTE1(v21) = v14;
      LOBYTE(v21) = 0;
      LOBYTE(v20) = 0;
      uint64_t v16 = -[CAMCaptureGraphConfiguration initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:]([CAMCaptureGraphConfiguration alloc], "initWithCaptureMode:captureDevice:macroMode:videoConfiguration:audioConfiguration:mixAudioWithOthers:windNoiseRemovalEnabled:previewConfiguration:previewSampleBufferVideoFormat:previewFilters:videoThumbnailOutputConfiguration:photoEncodingBehavior:videoEncodingBehavior:enableAutoFPSVideo:videoHDRSuspended:aspectRatioCrop:photoQualityPrioritization:captureMirrored:enableRAWCaptureIfSupported:semanticStyleSupport:previewSemanticStyle:enableContentAwareDistortionCorrection:enableResponsiveShutter:suspendLivePhotoCapture:videoStabilizationStrength:maximumPhotoResolution:colorSpace:enableDepthSuggestion:enableZoomPIP:customLensGroup:enableStereoVideoCapture:trueVideoEnabled:prefersHDR10BitVideo:", 5, v4, 0, 0, 0, 0, v20, 1, 0, 0, 0,
              v6,
              v7,
              v21,
              0,
              v12,
              v22,
              0,
              0,
              v23,
              0,
              0,
              [v5 colorSpaceForMode:5 videoConfiguration:0 videoEncodingBehavior:v7 spatialVideoEnabled:0 device:v4], v24, 0, v25);
      graphConfigurationForCurrentState = self->__graphConfigurationForCurrentState;
      self->__graphConfigurationForCurrentState = v16;
    }
  }
  else
  {
    [(CAMTimelapseController *)self _invalidateCachedGraphConfiguration];
  }
  unsigned int v18 = self->__graphConfigurationForCurrentState;
  return v18;
}

- (void)_invalidateCachedGraphConfiguration
{
  self->__graphConfigurationForCurrentState = 0;
  MEMORY[0x270F9A758]();
}

- (void)_restoreCaptureStateFromDisk
{
  id v5 = +[CAMTimelapseDiskUtilities readSortedStatesFromDiskMergeSecondaryState:1];
  id v3 = [v5 lastObject];
  uint64_t v4 = v3;
  if (v3 && [v3 canContinueCapture])
  {
    objc_storeStrong((id *)&self->__state, v4);
    [(CAMTimelapseController *)self _invalidateCachedGraphConfiguration];
  }
}

- (void)_reserveDiskSpaceForTimelapseUUID:(id)a3 preferHEVC:(BOOL)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(CAMTimelapseController *)self _captureController];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __91__CAMTimelapseController__reserveDiskSpaceForTimelapseUUID_preferHEVC_withCompletionBlock___block_invoke;
  v13[3] = &unk_263FA4C08;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a4;
  v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  [v10 queryTimelapseDimensionsWithCompletionBlock:v13];
}

uint64_t __91__CAMTimelapseController__reserveDiskSpaceForTimelapseUUID_preferHEVC_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([*(id *)(a1 + 32) isCapturing])
  {
    if (!a4 || !a5)
    {
      uint64_t v10 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "Failed to query video dimensions, falling back to 1080p, assuming no overscan", buf, 2u);
      }

      a4 = 1920;
      a5 = 1080;
    }
    id v11 = (void *)MEMORY[0x263F5DB48];
    id v12 = NSHomeDirectory();
    uint64_t v13 = [v11 diskSpaceAvailableForPath:v12];

    id v14 = +[CAMTimelapseSettings sharedInstance];
    uint64_t v15 = [v14 minAvailableBytesNeededForCaptureForWidth:a4 height:a5 useHEVC:*(unsigned __int8 *)(a1 + 56)];

    BOOL v17 = v13 < 0 || v15 <= v13;
    if (v17)
    {
      unsigned int v18 = dispatch_queue_create("com.apple.camera.timelapse", 0);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __91__CAMTimelapseController__reserveDiskSpaceForTimelapseUUID_preferHEVC_withCompletionBlock___block_invoke_223;
      v22[3] = &unk_263FA3500;
      id v23 = *(id *)(a1 + 40);
      uint64_t v24 = a2;
      uint64_t v25 = a3;
      char v26 = *(unsigned char *)(a1 + 56);
      dispatch_async(v18, v22);
    }
    else
    {
      uint64_t v21 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v28 = v15;
        __int16 v29 = 2048;
        uint64_t v30 = v13;
        _os_log_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEFAULT, "Not enough storage to start capture: %lld needed, %lld available", buf, 0x16u);
      }

      [*(id *)(a1 + 32) _notifyInsufficientDiskSpaceForStartingCaptureWithNeededBytes:v15 availableBytes:v13];
    }
    uint64_t result = *(void *)(a1 + 48);
    if (result) {
      return (*(uint64_t (**)(uint64_t, void, BOOL))(result + 16))(result, 0, v17);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      uint64_t v20 = *(uint64_t (**)(void))(result + 16);
      return v20();
    }
  }
  return result;
}

BOOL __91__CAMTimelapseController__reserveDiskSpaceForTimelapseUUID_preferHEVC_withCompletionBlock___block_invoke_223(uint64_t a1)
{
  return +[CAMTimelapseDiskUtilities reserveDummyFileForTimelapseUUID:*(void *)(a1 + 32) width:*(void *)(a1 + 40) height:*(void *)(a1 + 48) useHEVC:*(unsigned __int8 *)(a1 + 56)];
}

- (NSDate)captureStartTime
{
  if ([(CAMTimelapseController *)self isCapturing])
  {
    id v3 = [(CAMTimelapseState *)self->__state startTime];
  }
  else
  {
    id v3 = 0;
  }
  return (NSDate *)v3;
}

- (void)_startCaptureTimer
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->__captureTimer) {
    [(CAMTimelapseController *)self _teardownCaptureTimer];
  }
  [(CAMTimelapseState *)self->__state captureTimeInterval];
  long double v4 = v3;
  if (v3 <= 0.0)
  {
    id v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      long double v19 = v4;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Error: invalid captureTimeInterval: %f", buf, 0xCu);
    }
  }
  else
  {
    self->__ignoringTimerCallbacksForTearDown = 0;
    id v5 = +[CAMCaptureCapabilities capabilities];
    [v5 timelapseFirstShotDelay];
    double v7 = v6;

    id v8 = [(CAMTimelapseState *)self->__state startTime];
    id v9 = [v8 dateByAddingTimeInterval:v7];
    [v9 timeIntervalSinceNow];
    double v11 = v10;
    if (v10 <= 0.0) {
      double v11 = v4 - fmod(-v10, v4);
    }
    id v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    captureTimer = self->__captureTimer;
    self->__captureTimer = v12;

    id v14 = self->__captureTimer;
    if (v14)
    {
      dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
      dispatch_source_set_timer(v14, v15, (unint64_t)(v4 * 1000000000.0), 0);
      BOOL v16 = self->__captureTimer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __44__CAMTimelapseController__startCaptureTimer__block_invoke;
      handler[3] = &unk_263FA0208;
      handler[4] = self;
      dispatch_source_set_event_handler(v16, handler);
      dispatch_resume((dispatch_object_t)self->__captureTimer);
    }
  }
}

void __44__CAMTimelapseController__startCaptureTimer__block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    if (!v2[9]) {
      return;
    }
    goto LABEL_5;
  }
  if (v2[9])
  {
LABEL_5:
    double v3 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long double v4 = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring timelapse capture because we're waiting for capture response", v4, 2u);
    }

    return;
  }
  [v2 _captureTimerFired];
}

- (void)_teardownCaptureTimer
{
  self->__ignoringTimerCallbacksForTearDown = 1;
  captureTimer = self->__captureTimer;
  if (captureTimer)
  {
    dispatch_source_cancel(captureTimer);
    long double v4 = self->__captureTimer;
    self->__captureTimer = 0;
  }
}

- (void)_captureTimerFired
{
}

- (BOOL)_canCapturePhoto
{
  double v3 = [(CAMTimelapseController *)self _captureController];
  char v4 = [v3 isInterrupted];
  char v5 = [v3 isCaptureAvailable];
  BOOL v6 = [(CAMTimelapseController *)self _isFocusAndExposureAdjusted];
  double v7 = [(CAMTimelapseController *)self _storageController];
  id v8 = [(CAMTimelapseController *)self _graphConfigurationForCurrentState];
  char v9 = [v7 hasDiskSpaceToAllowCaptureWithConfiguration:v8 allowPurging:1];

  return v5 & ~v4 & v6 & v9;
}

- (BOOL)_enqueueCaptureRequest
{
  double v3 = [(CAMTimelapseState *)self->__state timelapseUUID];
  if ([v3 length])
  {
    char v4 = [(CAMTimelapseController *)self _stillImageCaptureRequestWithCurrentSettings];
    [v4 setTimelapseIdentifier:v3];
    [(NSCountedSet *)self->__inFlightTimelapseUUIDs addObject:v3];
    char v5 = [(CAMTimelapseController *)self _captureController];
    uint64_t v15 = 0;
    char v6 = [v5 captureStillImageWithRequest:v4 error:&v15];
  }
  else
  {
    char v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(CAMTimelapseController *)v4 _enqueueCaptureRequest];
    }
    char v6 = 0;
  }

  return v6;
}

- (id)_stillImageCaptureRequestWithCurrentSettings
{
  uint64_t v3 = [(CAMTimelapseState *)self->__state captureOrientation];
  int64_t v4 = [(CAMTimelapseState *)self->__state captureDevice];
  char v5 = +[CAMUserPreferences preferences];
  char v6 = [(CAMTimelapseState *)self->__state filePathForNextFrameIndex];
  uint64_t v7 = [NSURL fileURLWithPath:v6];
  uint64_t v8 = +[CAMCaptureCapabilities capabilities];
  uint64_t v9 = v8;
  unint64_t v10 = v4 - 1;
  if ((unint64_t)(v4 - 1) > 0xA) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_209C7B530[v10];
  }
  uint64_t v12 = [v8 maxSupportedPhotoQualityPrioritizationForMode:5 devicePosition:v11];

  uint64_t v13 = objc_alloc_init(CAMMutableStillImageCaptureRequest);
  [(CAMMutableStillImageCaptureRequest *)v13 setDelegate:self];
  [(CAMMutableStillImageCaptureRequest *)v13 setPersistenceOptions:1];
  [(CAMMutableStillImageCaptureRequest *)v13 setLocalDestinationURL:v7];
  [(CAMMutableStillImageCaptureRequest *)v13 setCaptureOrientation:v3];
  if (v10 > 0xA) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = qword_209C7B530[v10];
  }
  -[CAMMutableStillImageCaptureRequest setCaptureMirrored:](v13, "setCaptureMirrored:", [v5 mirrorCameraCapturesForDevicePosition:v14 mode:5]);
  [(CAMMutableStillImageCaptureRequest *)v13 setCaptureDevice:v4];
  [(CAMMutableStillImageCaptureRequest *)v13 setFlashMode:0];
  [(CAMMutableStillImageCaptureRequest *)v13 setHdrMode:0];
  [(CAMMutableStillImageCaptureRequest *)v13 setIrisMode:0];
  [(CAMMutableStillImageCaptureRequest *)v13 setPhotoQualityPrioritization:v12];
  [(CAMMutableStillImageCaptureRequest *)v13 setWantsAudioForCapture:0];
  [(CAMMutableStillImageCaptureRequest *)v13 setWantsHighResolutionStills:0];
  [(CAMMutableStillImageCaptureRequest *)v13 setStillDuringVideo:0];
  [(CAMMutableStillImageCaptureRequest *)v13 setWantsSemanticSceneFilter:0];
  [(CAMMutableStillImageCaptureRequest *)v13 setPhotoEncodingBehavior:0];
  uint64_t v15 = [(CAMTimelapseController *)self _locationController];
  BOOL v16 = [v15 currentLocation];
  if (v16) {
    [(CAMMutableStillImageCaptureRequest *)v13 setLocation:v16];
  }
  if ([v5 sharedLibraryEnabled])
  {
    BOOL v17 = [(CAMTimelapseController *)self _librarySelectionController];
    -[CAMMutableStillImageCaptureRequest setSharedLibraryMode:](v13, "setSharedLibraryMode:", [v17 sharedLibraryMode]);

    unsigned int v18 = +[CAMCaptureCapabilities capabilities];
    int v19 = [v18 isInternalInstall];

    if (v19)
    {
      uint64_t v20 = [(CAMTimelapseController *)self _librarySelectionController];
      uint64_t v21 = [v20 librarySelectionDiagnostics];
      [(CAMMutableStillImageCaptureRequest *)v13 setSharedLibraryDiagnostics:v21];
    }
    uint64_t v22 = +[CAMCaptureCapabilities capabilities];
    int v23 = [v22 peopleProximityPersistenceSupported];

    if (v23)
    {
      uint64_t v24 = [(CAMTimelapseController *)self _librarySelectionController];
      uint64_t v25 = [v24 acquiredSignalResults];

      char v26 = [v25 identitiesInProximity];
      uint64_t v27 = CAMLibrarySelectionIdentityContactIdentifiersForIdentities(v26);
      [(CAMMutableStillImageCaptureRequest *)v13 setContactIDsInProximity:v27];
    }
  }

  return v13;
}

- (void)_updateFocusAndExposureForStartCapturing
{
  [(CAMTimelapseController *)self _setFocusAndExposureAdjusted:0];
  uint64_t v3 = [(CAMTimelapseController *)self lastFocusResult];
  if ([v3 isPerformingContrastDetection])
  {
    [(CAMTimelapseController *)self _setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:1];
  }
  else
  {
    int64_t v4 = [(CAMTimelapseController *)self _captureController];
    [(CAMTimelapseState *)self->__state focusLensPosition];
    float v6 = v5;
    uint64_t v7 = [(CAMTimelapseState *)self->__state timelapseUUID];
    uint64_t v8 = (void *)[v7 copy];

    +[CUCaptureController focusLensPositionCurrentSentinel];
    BOOL v10 = v6 == v9;
    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__CAMTimelapseController__updateFocusAndExposureForStartCapturing__block_invoke;
    v13[3] = &unk_263FA4C30;
    objc_copyWeak(&v15, &location);
    id v11 = v8;
    id v14 = v11;
    BOOL v16 = v10;
    *(float *)&double v12 = v6;
    [v4 lockFocusAtLensPosition:v13 completionBlock:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __66__CAMTimelapseController__updateFocusAndExposureForStartCapturing__block_invoke(uint64_t a1, float a2)
{
  int64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _setFocusAndExposureAdjusted:1];

  id v7 = objc_loadWeakRetained(v4);
  *(float *)&double v6 = a2;
  [v7 _updateFocusLensPosition:*(void *)(a1 + 32) forTimelapseUUID:*(unsigned __int8 *)(a1 + 48) forceUpdate:v6];
}

- (void)_updateFocusLensPosition:(float)a3 forTimelapseUUID:(id)a4 forceUpdate:(BOOL)a5
{
  state = self->__state;
  id v8 = a4;
  float v9 = [(CAMTimelapseState *)state timelapseUUID];
  int v10 = [v9 isEqualToString:v8];

  if (v10)
  {
    +[CUCaptureController focusLensPositionCurrentSentinel];
    float v12 = v11;
    [(CAMTimelapseState *)self->__state focusLensPosition];
    if (v13 == v12)
    {
      [(CAMTimelapseState *)self->__state focusLensPosition];
      if (*(float *)&v14 != a3)
      {
        *(float *)&double v14 = a3;
        [(CAMTimelapseState *)self->__state setFocusLensPosition:v14];
        [(CAMTimelapseController *)self _saveStateToDisk:self->__state];
        id v16 = [(CAMTimelapseController *)self _nebulaDaemonProxyManager];
        id v15 = [(CAMTimelapseState *)self->__state timelapseUUID];
        [v16 updateTimelapseWithUUID:v15];
      }
    }
  }
}

- (void)_saveStateToDisk:(id)a3
{
  id v4 = a3;
  float v5 = [v4 timelapseUUID];
  if ([v5 length])
  {
    if ([v4 canContinueCapture])
    {
      double v6 = +[CAMTimelapseDiskUtilities readSecondaryStateForTimelapseUUID:v5];
      [v4 mergeSecondaryState:v6];
      char v7 = [v4 canContinueCapture];

      +[CAMTimelapseDiskUtilities writeStateToDisk:v4 createDirectoryIfNeeded:1];
      if ((v7 & 1) == 0) {
        [(CAMTimelapseController *)self _stopCapturingWithReasons:0];
      }
    }
    else
    {
      +[CAMTimelapseDiskUtilities writeStateToDisk:v4 createDirectoryIfNeeded:1];
    }
  }
  else
  {
    id v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)float v9 = 0;
      _os_log_impl(&dword_2099F8000, v8, OS_LOG_TYPE_DEFAULT, "Error: cannot save state without timelapseUUID", v9, 2u);
    }
  }
}

- (void)stillImageRequestDidCompleteStillImageCapture:(id)a3 withResponse:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->__ignoringTimerCallbacksWaitingForCaptureResponse) {
    self->__ignoringTimerCallbacksWaitingForCaptureResponse = 0;
  }
  float v11 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CAMTimelapseController stillImageRequestDidCompleteStillImageCapture:withResponse:error:]((uint64_t)v10, v11);
  }

  if (!v10)
  {
    uint64_t v37 = 0;
    id v38 = &v37;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__15;
    v41 = __Block_byref_object_dispose__15;
    id v42 = 0;
    float v12 = [v8 timelapseIdentifier];
    if ([v12 length]
      && ([(CAMTimelapseState *)self->__state timelapseUUID],
          float v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v12 isEqualToString:v13],
          v13,
          v14))
    {
      id v15 = v38;
      id v16 = self->__state;
      BOOL v17 = (void *)v15[5];
      v15[5] = (uint64_t)v16;
    }
    else
    {
      pendingCompletedStates = self->__pendingCompletedStates;
      uint64_t v31 = MEMORY[0x263EF8330];
      uint64_t v32 = 3221225472;
      uint64_t v33 = __91__CAMTimelapseController_stillImageRequestDidCompleteStillImageCapture_withResponse_error___block_invoke;
      id v34 = &unk_263FA4C58;
      id v35 = v12;
      v36 = &v37;
      [(NSMutableSet *)pendingCompletedStates enumerateObjectsUsingBlock:&v31];
      BOOL v17 = v35;
    }

    int v19 = (void *)v38[5];
    if (v19)
    {
      int v20 = [v19 incrementFrameIndex];
      uint64_t v21 = v38;
      if (v20 && (CAMTimelapseState *)v38[5] == self->__state)
      {
        uint64_t v22 = [(CAMTimelapseController *)self _state];
        [v22 captureTimeInterval];
        double v24 = v23;

        uint64_t v25 = [(CAMTimelapseController *)self _captureController];
        double v26 = 1.0 / v24;
        *(float *)&double v26 = 1.0 / v24;
        [v25 changeToTimelapseCaptureRate:v26];

        [(CAMTimelapseController *)self _startCaptureTimer];
        uint64_t v21 = v38;
      }
      uint64_t v27 = (void *)v21[5];
      uint64_t v28 = objc_msgSend(MEMORY[0x263EFF910], "date", v31, v32, v33, v34);
      [v27 setLastFrameResponseTime:v28];

      [(CAMTimelapseController *)self _saveStateToDisk:v38[5]];
      __int16 v29 = [(CAMTimelapseController *)self _nebulaDaemonProxyManager];
      uint64_t v30 = [(id)v38[5] timelapseUUID];
      [v29 updateTimelapseWithUUID:v30];
    }
    _Block_object_dispose(&v37, 8);
  }
}

void __91__CAMTimelapseController_stillImageRequestDidCompleteStillImageCapture_withResponse_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  double v6 = [v8 timelapseUUID];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)stillImageRequestDidCompleteStillImageLocalPersistence:(id)a3 withResponse:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  float v11 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[CAMTimelapseController stillImageRequestDidCompleteStillImageLocalPersistence:withResponse:error:]((uint64_t)v10, v11);
  }

  float v12 = [v8 timelapseIdentifier];
  if ([v12 length])
  {
    [(NSCountedSet *)self->__inFlightTimelapseUUIDs removeObject:v12];
    float v13 = [(CAMTimelapseController *)self _nebulaDaemonProxyManager];
    [v13 finishCaptureForTimelapseWithUUID:v12];
    if (![(NSCountedSet *)self->__inFlightTimelapseUUIDs countForObject:v12])
    {
      uint64_t v26 = 0;
      uint64_t v27 = &v26;
      uint64_t v28 = 0x3032000000;
      __int16 v29 = __Block_byref_object_copy__15;
      uint64_t v30 = __Block_byref_object_dispose__15;
      id v31 = 0;
      pendingCompletedStates = self->__pendingCompletedStates;
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __100__CAMTimelapseController_stillImageRequestDidCompleteStillImageLocalPersistence_withResponse_error___block_invoke;
      double v23 = &unk_263FA4C58;
      id v24 = v12;
      uint64_t v25 = &v26;
      [(NSMutableSet *)pendingCompletedStates enumerateObjectsUsingBlock:&v20];
      id v15 = (void *)v27[5];
      if (v15)
      {
        objc_msgSend(v15, "setAllFramesWritten:", 1, v20, v21, v22, v23);
        [(CAMTimelapseController *)self _saveStateToDisk:v27[5]];
        id v16 = [(CAMTimelapseController *)self _nebulaDaemonProxyManager];
        BOOL v17 = [(id)v27[5] timelapseUUID];
        [v16 updateTimelapseWithUUID:v17];

        [v16 closeConnectionToDaemon];
        [(NSMutableSet *)self->__pendingCompletedStates removeObject:v27[5]];
      }
      _Block_object_dispose(&v26, 8);
    }
  }
  unsigned int v18 = [(CAMTimelapseController *)self _storageController];
  int v19 = [(CAMTimelapseController *)self _graphConfigurationForCurrentState];
  [v18 hasDiskSpaceToAllowCaptureWithConfiguration:v19 allowPurging:1];
}

void __100__CAMTimelapseController_stillImageRequestDidCompleteStillImageLocalPersistence_withResponse_error___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  double v6 = [v8 timelapseUUID];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)_createThumbnailImageFromPlaceholderResult:(id)a3
{
  if ([a3 previewImageSurface] && (uint64_t v3 = PLCreateImageFromPreviewImageSurface()) != 0)
  {
    id v4 = (const void *)v3;
    float v5 = (void *)MEMORY[0x263F827E8];
    double v6 = [MEMORY[0x263F82B60] mainScreen];
    [v6 scale];
    int v7 = objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v4, 0);

    CFRelease(v4);
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

+ (id)createPlaceholderResultForTimelapseState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _newVideoPreviewSurfaceForTimelapseState:v4];
  if (v5)
  {
    double v6 = (const void *)v5;
    int v7 = [v4 timelapseUUID];
    id v8 = [v4 startTime];
    unsigned int v9 = [v4 captureOrientation];
    uint64_t v10 = v9;
    uint64_t v11 = [v4 captureDevice];
    [v4 nominalIntermediateFrameSize];
    if (v9 > 4)
    {
      double v15 = *MEMORY[0x263F001B0];
      double v14 = *(double *)(MEMORY[0x263F001B0] + 8);
    }
    else
    {
      double v14 = v13;
      if (((1 << v9) & 0x19) != 0)
      {
        double v15 = v12;
      }
      else
      {
        double v15 = v13;
        double v14 = v12;
      }
    }
    BOOL v17 = [v4 startTime];
    unsigned int v18 = [v4 stopTime];
    if (!v18)
    {
      unsigned int v18 = [MEMORY[0x263EFF910] date];
    }
    [v18 timeIntervalSinceDate:v17];
    double v20 = v19;
    uint64_t v21 = [v4 localPrivateMetadataFileURL];
    id v16 = -[CAMTimelapsePlaceholderResult initWithAssetUUID:captureSession:creationDate:captureOrientation:captureDevice:videoDimensions:duration:previewImageSurface:localPrivateMetadataFileURL:]([CAMTimelapsePlaceholderResult alloc], "initWithAssetUUID:captureSession:creationDate:captureOrientation:captureDevice:videoDimensions:duration:previewImageSurface:localPrivateMetadataFileURL:", v7, [v4 sessionIdentifier], v8, v10, v11, v6, v15, v14, v20, v21);
    CFRelease(v6);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (__IOSurface)_newVideoPreviewSurfaceForTimelapseState:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[CAMTimelapseDiskUtilities fileNameForImageFrameIndex:0];
  uint64_t v5 = [v3 timelapseUUID];
  double v6 = +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:v5];

  int v7 = [v6 stringByAppendingPathComponent:v4];
  id v8 = [MEMORY[0x263F08850] defaultManager];
  char v9 = [v8 fileExistsAtPath:v7];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = os_log_create("com.apple.camera", "Nebula");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      uint64_t v21 = 0;
      goto LABEL_17;
    }
    uint64_t v22 = [v3 timelapseUUID];
    int v24 = 138543362;
    uint64_t v25 = v22;
    _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "First frame not found for timelapse %{public}@", (uint8_t *)&v24, 0xCu);
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v10 = +[CAMTimelapseJPEGReader newDataFromFilePath:v7];
  if (!v10)
  {
    uint64_t v22 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[CAMTimelapseController _newVideoPreviewSurfaceForTimelapseState:](v3, v22);
    }
    goto LABEL_13;
  }
  uint64_t v11 = [MEMORY[0x263F82B60] mainScreen];
  [v11 scale];
  float v13 = v12;
  [v11 bounds];
  double v16 = v15 * v13;
  if (v14 * v13 >= v16) {
    double v16 = v14 * v13;
  }
  unint64_t v17 = vcvtpd_s64_f64(v16);
  [v3 nominalIntermediateFrameSize];
  unsigned int v18 = +[CAMTimelapseJPEGReader createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:cleanApertureSize:](CAMTimelapseJPEGReader, "createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:cleanApertureSize:", v10, 1, v17, 1);
  if (v18)
  {
    double v19 = v18;
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(v18);
    uint64_t v21 = IOSurface;
    if (IOSurface) {
      CFRetain(IOSurface);
    }
    CVPixelBufferRelease(v19);
  }
  else
  {
    uint64_t v21 = 0;
  }

LABEL_17:
  return v21;
}

- (void)_sessionRuntimeErrored:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x263EF9710]];

  if (v5)
  {
    [(CAMTimelapseController *)self _resetIgnoringTimerCallbacksWaitingForCaptureResponse];
    [(CAMTimelapseController *)self _setPreviewStarted:0];
  }
}

- (void)_notifyInsufficientDiskSpaceForStartingCaptureWithNeededBytes:(int64_t)a3 availableBytes:(int64_t)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  int64_t v5 = a3 / 0x100000;
  int64_t v6 = a4 / 0x100000;
  int v7 = CAMLocalizedFrameworkString(@"TIMELAPSE_INSUFFICIENT_DISK_SPACE_TO_START_TITLE", 0);
  id v8 = NSString;
  char v9 = CAMLocalizedFrameworkString(@"TIMELAPSE_INSUFFICIENT_DISK_SPACE_TO_START_MESSAGE_FORMAT_NEEDEDMB_AVAILABLEMB", 0);
  uint64_t v10 = objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, @"%d%d", 0, v5, v6);

  v13[0] = @"CAMTimelapseLowDiskSpaceTitleInfo";
  v13[1] = @"CAMTimelapseLowDiskSpaceMessageInfo";
  v14[0] = v7;
  v14[1] = v10;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  double v12 = [MEMORY[0x263F08A00] defaultCenter];
  [v12 postNotificationName:@"CAMTimelapseLowDiskSpaceNotification" object:self userInfo:v11];
}

- (void)_notifyInsufficientDiskSpaceForContinuingCapture
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = CAMLocalizedFrameworkString(@"TIMELAPSE_INSUFFICIENT_DISK_SPACE_TO_CONTINUE_TITLE", 0);
  id v4 = CAMLocalizedFrameworkString(@"TIMELAPSE_INSUFFICIENT_DISK_SPACE_TO_CONTINUE_MESSAGE", 0);
  v7[0] = @"CAMTimelapseLowDiskSpaceTitleInfo";
  v7[1] = @"CAMTimelapseLowDiskSpaceMessageInfo";
  v8[0] = v3;
  v8[1] = v4;
  int64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  int64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 postNotificationName:@"CAMTimelapseLowDiskSpaceNotification" object:self userInfo:v5];
}

- (void)_applicationWillEnterForeground:(id)a3
{
}

- (void)_updateLocationIfNecessary
{
  state = self->__state;
  if (state)
  {
    id v4 = [(CAMTimelapseState *)state startLocation];
    if (!v4)
    {
      int64_t v5 = [(CAMTimelapseController *)self _locationController];
      id v9 = [v5 currentLocation];
      if (v9)
      {
        [(CAMTimelapseState *)self->__state setStartLocation:v9];
        [(CAMTimelapseController *)self _saveStateToDisk:self->__state];
        int64_t v6 = [(CAMTimelapseController *)self _nebulaDaemonProxyManager];
        int v7 = [(CAMTimelapseState *)self->__state timelapseUUID];
        [v6 updateTimelapseWithUUID:v7];

        id v8 = [(CAMTimelapseController *)self _captureController];
        [v8 notifyTimelapseControllerFinishedUpdatingWithLocation];
      }
      id v4 = v9;
    }
  }
}

- (void)forceStopTimelapseCaptureWithReasons:(int64_t)a3
{
  if ([(CAMTimelapseController *)self isCapturing])
  {
    [(CAMTimelapseController *)self stopCapturingWithReasons:a3];
  }
}

- (CAMTimelapseControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMTimelapseControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAMFocusResult)lastFocusResult
{
  return self->_lastFocusResult;
}

- (CAMTimelapseState)_state
{
  return self->__state;
}

- (OS_dispatch_source)_captureTimer
{
  return self->__captureTimer;
}

- (BOOL)_ignoringTimerCallbacksForTearDown
{
  return self->__ignoringTimerCallbacksForTearDown;
}

- (BOOL)_ignoringTimerCallbacksWaitingForCaptureResponse
{
  return self->__ignoringTimerCallbacksWaitingForCaptureResponse;
}

- (NSCountedSet)_inFlightTimelapseUUIDs
{
  return self->__inFlightTimelapseUUIDs;
}

- (NSMutableSet)_pendingCompletedStates
{
  return self->__pendingCompletedStates;
}

- (void)_setShouldUpdateFocusAndExposureWhenContrastDetectionCompletes:(BOOL)a3
{
  self->__shouldUpdateFocusAndExposureWhenContrastDetectionCompletes = a3;
}

- (ct_green_tea_logger_s)_greenTeaLogger
{
  return self->__greenTeaLogger;
}

- (BOOL)_isFocusAndExposureAdjusted
{
  return self->__focusAndExposureAdjusted;
}

- (CUCaptureController)_captureController
{
  return self->__captureController;
}

- (CAMLocationController)_locationController
{
  return self->__locationController;
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (CAMPersistenceController)_persistenceController
{
  return self->__persistenceController;
}

- (CAMStorageController)_storageController
{
  return self->__storageController;
}

- (CAMLibrarySelectionController)_librarySelectionController
{
  return self->__librarySelectionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__nebulaDaemonProxyManager, 0);
  objc_storeStrong((id *)&self->__librarySelectionController, 0);
  objc_storeStrong((id *)&self->__storageController, 0);
  objc_storeStrong((id *)&self->__persistenceController, 0);
  objc_storeStrong((id *)&self->__motionController, 0);
  objc_storeStrong((id *)&self->__locationController, 0);
  objc_storeStrong((id *)&self->__captureController, 0);
  objc_storeStrong((id *)&self->__pendingCompletedStates, 0);
  objc_storeStrong((id *)&self->__inFlightTimelapseUUIDs, 0);
  objc_storeStrong((id *)&self->__captureTimer, 0);
  objc_storeStrong((id *)&self->__state, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__graphConfigurationForCurrentState, 0);
}

- (void)_enqueueCaptureRequest
{
}

- (void)stillImageRequestDidCompleteStillImageCapture:(uint64_t)a1 withResponse:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2099F8000, a2, OS_LOG_TYPE_DEBUG, "Generated timelapse capture response (%{public}@)", (uint8_t *)&v2, 0xCu);
}

- (void)stillImageRequestDidCompleteStillImageLocalPersistence:(uint64_t)a1 withResponse:(NSObject *)a2 error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2099F8000, a2, OS_LOG_TYPE_DEBUG, "Finished writing timelapse capture response (%{public}@)", (uint8_t *)&v2, 0xCu);
}

+ (void)_newVideoPreviewSurfaceForTimelapseState:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 timelapseUUID];
  int v4 = 138543362;
  int64_t v5 = v3;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Error creating video preview surface for timelapse %{public}@", (uint8_t *)&v4, 0xCu);
}

@end