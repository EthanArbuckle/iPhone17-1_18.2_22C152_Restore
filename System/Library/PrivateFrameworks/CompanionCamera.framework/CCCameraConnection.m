@interface CCCameraConnection
- (BOOL)_burstSupport;
- (BOOL)_isShowingLivePreview;
- (BOOL)_isSpatialCapture;
- (BOOL)_shouldReportEvent;
- (BOOL)_stopScheduledCaptureIfNeeded;
- (BOOL)_supportsMomentCapture;
- (BOOL)_supportsZoomMagnification;
- (BOOL)_toggleCameraDeviceSupport;
- (BOOL)_zoomSupport;
- (BOOL)isOpen;
- (BOOL)isPreviewConnected;
- (CCCameraConnection)init;
- (CCCameraConnectionDelegate)delegate;
- (double)_currentZoomMagnification;
- (double)_maximumZoomMagnification;
- (double)_minimumZoomMagnification;
- (double)_zoomAmount;
- (id)_significantZoomMagnifications;
- (id)_supportedCaptureDevices;
- (id)_supportedCaptureModes;
- (int64_t)_captureDevice;
- (int64_t)_captureMode;
- (int64_t)_currentOrientation;
- (int64_t)_flashMode;
- (int64_t)_flashSupport;
- (int64_t)_hdrMode;
- (int64_t)_hdrSupport;
- (int64_t)_irisMode;
- (int64_t)_irisSupport;
- (int64_t)_sharedLibraryMode;
- (int64_t)_sharedLibrarySupport;
- (unsigned)_currentCameraAppOrientation;
- (void)_captureButtonUp;
- (void)_checkin;
- (void)_connect;
- (void)_disconnect;
- (void)_handleCaptureStartTimerFired:(id)a3;
- (void)_handleDockKitConnectedEvent:(BOOL)a3;
- (void)_handleDockKitSystemEvent:(id)a3;
- (void)_handleInterruption;
- (void)_handleInvalidation;
- (void)_performPreviewStateTransitionsIfNeeded;
- (void)_registerForDockKitButtonEvents;
- (void)_reportToDockKitCameraModeChangedIfNeeded;
- (void)_reportToDockKitCameraStartCaptureIfNeeded;
- (void)_reportToDockKitCameraStopCaptureIfNeeded;
- (void)_reportToDockKitPanoramaDirectionChangedIfNeeded:(int64_t)a3;
- (void)_resetCurrentZoomMagnificationState;
- (void)_scheduleStartCaptureIfNeeded;
- (void)_startCaptureIfNeeded;
- (void)_stopCaptureIfNeeded;
- (void)_updateCurrentZoomMagnificationState;
- (void)_zoomTimerFired;
- (void)burstCaptureDidStop;
- (void)burstCaptureNumberOfPhotosDidChange:(unint64_t)a3;
- (void)burstCaptureWillStart;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4;
- (void)cameraViewfinderSession:(id)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6;
- (void)cameraViewfinderSession:(id)a3 previewStreamDidCloseWithStatus:(int)a4;
- (void)cameraViewfinderSessionPreviewStreamDidOpen:(id)a3;
- (void)captureDeviceDidChange;
- (void)captureDeviceDidChange:(int64_t)a3;
- (void)close;
- (void)closePreview;
- (void)countdownCanceled;
- (void)dealloc;
- (void)didPauseCaptureTimerWithPauseTime:(id)a3;
- (void)didResumeCaptureTimerWithNewStartTime:(id)a3;
- (void)didStartCaptureTimer;
- (void)didStopCapture;
- (void)didUpdateShallowDepthOfFieldStatus:(int64_t)a3;
- (void)didUpdateThumbnailWithData:(id)a3 isVideo:(BOOL)a4;
- (void)flashModeDidChange;
- (void)hdrModeDidChange;
- (void)irisModeDidChange;
- (void)modeSelected:(int64_t)a3;
- (void)open;
- (void)openPreview;
- (void)photoTaken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sharedLibraryModeDidChange;
- (void)sharedLibrarySupportDidChange;
- (void)showingLivePreviewDidChange;
- (void)spatialModeDidChange;
- (void)switchedOrientation:(int64_t)a3;
- (void)takePhotoWithCountdown:(unint64_t)a3;
- (void)willStartCapturing;
- (void)xpc_beginBurstCaptureWithReply:(id)a3;
- (void)xpc_cancelCountdown;
- (void)xpc_endBurstCaptureWithReply:(id)a3;
- (void)xpc_ensureSwitchedToOneOfSupportedCaptureModes:(id)a3 reply:(id)a4;
- (void)xpc_fetchCurrentStateIncludingSupportedCaptureModes:(BOOL)a3 reply:(id)a4;
- (void)xpc_pauseCaptureWithReply:(id)a3;
- (void)xpc_resumeCaptureWithReply:(id)a3;
- (void)xpc_setCaptureDevice:(int64_t)a3 reply:(id)a4;
- (void)xpc_setCaptureMode:(int64_t)a3 reply:(id)a4;
- (void)xpc_setFlashMode:(int64_t)a3;
- (void)xpc_setFocusPoint:(id)a3;
- (void)xpc_setHDRMode:(int64_t)a3;
- (void)xpc_setIrisMode:(int64_t)a3;
- (void)xpc_setPreviewEndpoint:(id)a3;
- (void)xpc_setSharedLibraryMode:(int64_t)a3;
- (void)xpc_setZoom:(float)a3 reply:(id)a4;
- (void)xpc_setZoomMagnification:(float)a3 reply:(id)a4;
- (void)xpc_startCaptureWithMode:(int64_t)a3 reply:(id)a4;
- (void)xpc_stopCaptureWithReply:(id)a3;
- (void)xpc_suspend;
- (void)xpc_toggleCameraDevice;
- (void)zoomDidChange:(double)a3;
@end

@implementation CCCameraConnection

- (void)setDelegate:(id)a3
{
}

- (void)open
{
  [(CCCameraConnection *)self _connect];
  if (!self->_dockKitAgent)
  {
    v3 = (DKSystemEventsAgent *)objc_alloc_init(MEMORY[0x263F3A9E8]);
    dockKitAgent = self->_dockKitAgent;
    self->_dockKitAgent = v3;

    [(CCCameraConnection *)self _registerForDockKitButtonEvents];
  }
}

- (void)_handleInvalidation
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    v7 = "-[CCCameraConnection _handleInvalidation]";
    __int16 v8 = 2080;
    v9 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v10 = 1024;
    int v11 = 1232;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v6, 0x1Cu);
  }

  self->_interruptionCount = 0;
  xpc = self->_xpc;
  self->_xpc = 0;

  previewEndpoint = self->_previewEndpoint;
  self->_previewEndpoint = 0;

  [(CCCameraConnection *)self closePreview];
}

void __30__CCCameraConnection__connect__block_invoke_2(uint64_t a1)
{
  v2 = nanocamera_log_control();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __30__CCCameraConnection__connect__block_invoke_2_cold_1();
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__CCCameraConnection__connect__block_invoke_91;
  block[3] = &unk_264CAB480;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v5 = (FigCameraViewfinderSession *)a4;
  int v6 = nanocamera_log_preview();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    v9 = "-[CCCameraConnection cameraViewfinder:viewfinderSessionDidBegin:]";
    __int16 v10 = 2080;
    int v11 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v12 = 1024;
    int v13 = 1162;
    _os_log_impl(&dword_236723000, v6, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v8, 0x1Cu);
  }

  remoteViewfinderSession = self->_remoteViewfinderSession;
  self->_remoteViewfinderSession = v5;

  self->_currentPreviewState = 0;
  [(CCCameraConnection *)self _performPreviewStateTransitionsIfNeeded];
}

- (void)_connect
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_236723000, v0, v1, "Resumed xpc connection %@", v2, v3, v4, v5, v6);
}

- (void)closePreview
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_preview();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    uint64_t v5 = "-[CCCameraConnection closePreview]";
    __int16 v6 = 2080;
    v7 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v8 = 1024;
    int v9 = 1128;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v4, 0x1Cu);
  }

  self->_desiredPreviewState = 0;
  [(CCCameraConnection *)self _performPreviewStateTransitionsIfNeeded];
}

- (void)_performPreviewStateTransitionsIfNeeded
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_preview();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t desiredPreviewState = self->_desiredPreviewState;
    unint64_t currentPreviewState = self->_currentPreviewState;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v18 = desiredPreviewState;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = currentPreviewState;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "Preview desired state: %d, current state: %d", buf, 0xEu);
  }

  unint64_t v6 = self->_desiredPreviewState;
  if (v6)
  {
    if (v6 == 2 && !self->_currentPreviewState && self->_remoteViewfinderSession && self->_previewEndpoint)
    {
      v7 = nanocamera_log_preview();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        previewEndpoint = self->_previewEndpoint;
        remoteViewfinderSession = self->_remoteViewfinderSession;
        *(_DWORD *)buf = 138412546;
        *(void *)v18 = previewEndpoint;
        *(_WORD *)&v18[8] = 2112;
        v19 = remoteViewfinderSession;
        _os_log_impl(&dword_236723000, v7, OS_LOG_TYPE_DEFAULT, "Opening preview stream, destination: %@, session:%@", buf, 0x16u);
      }

      uint64_t v10 = self->_remoteViewfinderSession;
      int v11 = self->_previewEndpoint;
      uint64_t v15 = *MEMORY[0x263F2BFC8];
      v16 = v11;
      __int16 v12 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      [(FigCameraViewfinderSession *)v10 openPreviewStreamWithOptions:v12];

      self->_unint64_t currentPreviewState = 1;
    }
  }
  else if (self->_currentPreviewState == 2 && self->_remoteViewfinderSession)
  {
    int v13 = nanocamera_log_preview();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = self->_remoteViewfinderSession;
      *(_DWORD *)buf = 138412290;
      *(void *)v18 = v14;
      _os_log_impl(&dword_236723000, v13, OS_LOG_TYPE_DEFAULT, "Closing preview stream, session:%@", buf, 0xCu);
    }

    [(FigCameraViewfinderSession *)self->_remoteViewfinderSession closePreviewStream];
    self->_unint64_t currentPreviewState = 3;
  }
}

- (CCCameraConnection)init
{
  v18.receiver = self;
  v18.super_class = (Class)CCCameraConnection;
  id v2 = [(CCCameraConnection *)&v18 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(CCCameraConnectionInternal);
    int v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    [*((id *)v2 + 1) setParent:v2];
    *((_DWORD *)v2 + 23) = -1082130432;
    *((unsigned char *)v2 + 104) = 0;
    objc_initWeak(&location, v2);
    uint64_t v5 = MEMORY[0x263EF83A0];
    dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    v7 = (void *)*((void *)v2 + 10);
    *((void *)v2 + 10) = v6;

    __int16 v8 = *((void *)v2 + 10);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __26__CCCameraConnection_init__block_invoke;
    handler[3] = &unk_264CAB480;
    objc_copyWeak(&v16, &location);
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(*((dispatch_object_t *)v2 + 10));
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __26__CCCameraConnection_init__block_invoke_2;
    v13[3] = &unk_264CAB4A8;
    objc_copyWeak(&v14, &location);
    notify_register_dispatch("com.apple.companion.camera.device-connected", (int *)v2 + 24, v5, v13);
    int v9 = MEMORY[0x263EF83A0];

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __26__CCCameraConnection_init__block_invoke_5;
    v11[3] = &unk_264CAB4A8;
    objc_copyWeak(&v12, &location);
    notify_register_dispatch("com.apple.companion.camera.device-disconnected", (int *)v2 + 25, v9, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return (CCCameraConnection *)v2;
}

- (void)_checkin
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    dispatch_source_t v6 = "-[CCCameraConnection _checkin]";
    __int16 v7 = 2080;
    __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v9 = 1024;
    int v10 = 199;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  int v4 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global];
  [v4 checkin];
}

- (void)_registerForDockKitButtonEvents
{
  [(CCCameraConnection *)self _resetCurrentZoomMagnificationState];
  dockKitAgent = self->_dockKitAgent;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__CCCameraConnection__registerForDockKitButtonEvents__block_invoke;
  v5[3] = &unk_264CAB658;
  v5[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__CCCameraConnection__registerForDockKitButtonEvents__block_invoke_3;
  v4[3] = &unk_264CAB680;
  v4[4] = self;
  [(DKSystemEventsAgent *)dockKitAgent registerForSystemEvents:v5 forConnectedEvents:v4];
}

- (void)_resetCurrentZoomMagnificationState
{
  self->_currentZoomMagnification = 1.0;
  self->_zoomMagnificationChanged = 0;
  self->_zoomInProgress = 0;
}

- (void)didUpdateShallowDepthOfFieldStatus:(int64_t)a3
{
  self->_shallowDepthOfFieldStatus = a3;
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v5 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_125];
    objc_msgSend(v5, "xpc_didUpdateShallowDepthOfFieldStatus:", a3);
  }
}

- (BOOL)_shouldReportEvent
{
  return self->_xpc && self->_previewEndpoint != 0;
}

void __26__CCCameraConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _zoomTimerFired];
}

void __26__CCCameraConnection_init__block_invoke_2(uint64_t a1)
{
  id v2 = nanocamera_log_control();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __26__CCCameraConnection_init__block_invoke_2_cold_1();
  }

  uint64_t v3 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v4 = [v3 applicationState];

  if (v4 != 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _connect];
  }
}

void __26__CCCameraConnection_init__block_invoke_5(uint64_t a1)
{
  id v2 = nanocamera_log_control();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __26__CCCameraConnection_init__block_invoke_5_cold_1();
  }

  uint64_t v3 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v4 = [v3 applicationState];

  if (v4 != 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _disconnect];
  }
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    dispatch_source_t v6 = "-[CCCameraConnection dealloc]";
    __int16 v7 = 2080;
    __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v9 = 1024;
    int v10 = 128;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  [(CCCameraConnection *)self close];
  notify_cancel(self->_deviceDisconnectedNotificationToken);
  notify_cancel(self->_deviceConnectedNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)CCCameraConnection;
  [(CCCameraConnection *)&v4 dealloc];
}

void __30__CCCameraConnection__connect__block_invoke(uint64_t a1)
{
  id v2 = nanocamera_log_control();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __30__CCCameraConnection__connect__block_invoke_cold_1();
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__CCCameraConnection__connect__block_invoke_90;
  block[3] = &unk_264CAB480;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v4);
}

void __30__CCCameraConnection__connect__block_invoke_90(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInterruption];
}

void __30__CCCameraConnection__connect__block_invoke_91(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

void __30__CCCameraConnection__checkin__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)close
{
  [(CCCameraConnection *)self _disconnect];
  dockKitAgent = self->_dockKitAgent;
  if (dockKitAgent)
  {
    [(DKSystemEventsAgent *)dockKitAgent deregisterForSystemEvents];
    id v4 = self->_dockKitAgent;
    self->_dockKitAgent = 0;
  }
  captureStartTimer = self->_captureStartTimer;
  if (captureStartTimer)
  {
    [(NSTimer *)captureStartTimer invalidate];
    dispatch_source_t v6 = self->_captureStartTimer;
    self->_captureStartTimer = 0;
  }
}

- (void)_disconnect
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[CCCameraConnection _disconnect]";
    __int16 v12 = 2080;
    int v13 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v14 = 1024;
    int v15 = 230;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v10, 0x1Cu);
  }

  if (self->_burstInProgress)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      int v7 = [v6 cameraConnectionEndBurstCapture:self];

      if (v7) {
        self->_burstInProgress = 0;
      }
    }
  }
  xpc = self->_xpc;
  if (xpc)
  {
    [(NSXPCConnection *)xpc setInvalidationHandler:0];
    [(NSXPCConnection *)self->_xpc setInterruptionHandler:0];
    [(NSXPCConnection *)self->_xpc invalidate];
    [(CCCameraConnection *)self _handleInvalidation];
  }
  previewEndpoint = self->_previewEndpoint;
  self->_previewEndpoint = 0;

  [(CCCameraConnection *)self closePreview];
}

- (BOOL)isOpen
{
  return self->_xpc != 0;
}

- (void)photoTaken:(id)a3
{
}

- (void)didUpdateThumbnailWithData:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = nanocamera_log_control();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CCCameraConnection didUpdateThumbnailWithData:isVideo:]();
  }

  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    __int16 v8 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_96];
    objc_msgSend(v8, "xpc_didUpdateThumbnailWithData:isVideo:", v6, v4);
  }
}

void __57__CCCameraConnection_didUpdateThumbnailWithData_isVideo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)burstCaptureWillStart
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    id v6 = "-[CCCameraConnection burstCaptureWillStart]";
    __int16 v7 = 2080;
    __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v9 = 1024;
    int v10 = 276;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    BOOL v4 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_98];
    objc_msgSend(v4, "xpc_burstCaptureWillStart");
  }
}

void __43__CCCameraConnection_burstCaptureWillStart__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)burstCaptureNumberOfPhotosDidChange:(unint64_t)a3
{
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v5 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_100];
    objc_msgSend(v5, "xpc_burstCaptureNumberOfPhotosDidChange:", a3);
  }
}

void __58__CCCameraConnection_burstCaptureNumberOfPhotosDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)burstCaptureDidStop
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    id v6 = "-[CCCameraConnection burstCaptureDidStop]";
    __int16 v7 = 2080;
    __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v9 = 1024;
    int v10 = 298;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    BOOL v4 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_102];
    objc_msgSend(v4, "xpc_burstCaptureDidStop");
  }
}

void __41__CCCameraConnection_burstCaptureDidStop__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)willStartCapturing
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    __int16 v8 = "-[CCCameraConnection willStartCapturing]";
    __int16 v9 = 2080;
    int v10 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v11 = 1024;
    int v12 = 309;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v7, 0x1Cu);
  }

  [(CCCameraConnection *)self _reportToDockKitCameraStartCaptureIfNeeded];
  self->_capturing = 1;
  captureStartDate = self->_captureStartDate;
  self->_captureStartDate = 0;

  self->_capturingPaused = 0;
  capturePauseDate = self->_capturePauseDate;
  self->_capturePauseDate = 0;

  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v6 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_104];
    objc_msgSend(v6, "xpc_willStartCapturing");
  }
}

void __40__CCCameraConnection_willStartCapturing__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)didStartCaptureTimer
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    __int16 v9 = "-[CCCameraConnection didStartCaptureTimer]";
    __int16 v10 = 2080;
    __int16 v11 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v12 = 1024;
    int v13 = 330;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v8, 0x1Cu);
  }

  BOOL v4 = [MEMORY[0x263EFF910] date];
  captureStartDate = self->_captureStartDate;
  self->_captureStartDate = v4;

  self->_capturingPaused = 0;
  capturePauseDate = self->_capturePauseDate;
  self->_capturePauseDate = 0;

  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    int v7 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_107];
    objc_msgSend(v7, "xpc_didStartCaptureTimerWithDate:", self->_captureStartDate);
  }
}

void __42__CCCameraConnection_didStartCaptureTimer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)didPauseCaptureTimerWithPauseTime:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = nanocamera_log_control();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    __int16 v9 = "-[CCCameraConnection didPauseCaptureTimerWithPauseTime:]";
    __int16 v10 = 2080;
    __int16 v11 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v12 = 1024;
    int v13 = 345;
    _os_log_impl(&dword_236723000, v6, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v8, 0x1Cu);
  }

  self->_capturingPaused = 1;
  objc_storeStrong((id *)&self->_capturePauseDate, a3);
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    int v7 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_109];
    objc_msgSend(v7, "xpc_didPauseCaptureTimerWithDate:", self->_capturePauseDate);
  }
}

void __56__CCCameraConnection_didPauseCaptureTimerWithPauseTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)didResumeCaptureTimerWithNewStartTime:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = nanocamera_log_control();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    __int16 v10 = "-[CCCameraConnection didResumeCaptureTimerWithNewStartTime:]";
    __int16 v11 = 2080;
    __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v13 = 1024;
    int v14 = 359;
    _os_log_impl(&dword_236723000, v6, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v9, 0x1Cu);
  }

  objc_storeStrong((id *)&self->_captureStartDate, a3);
  self->_capturingPaused = 0;
  capturePauseDate = self->_capturePauseDate;
  self->_capturePauseDate = 0;

  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    int v8 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_111];
    objc_msgSend(v8, "xpc_didResumeCaptureTimerWithDate:", v5);
  }
}

void __60__CCCameraConnection_didResumeCaptureTimerWithNewStartTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)didStopCapture
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    int v8 = "-[CCCameraConnection didStopCapture]";
    __int16 v9 = 2080;
    __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v11 = 1024;
    int v12 = 374;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v7, 0x1Cu);
  }

  [(CCCameraConnection *)self _reportToDockKitCameraStopCaptureIfNeeded];
  self->_capturing = 0;
  captureStartDate = self->_captureStartDate;
  self->_captureStartDate = 0;

  self->_capturingPaused = 0;
  capturePauseDate = self->_capturePauseDate;
  self->_capturePauseDate = 0;

  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v6 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_113];
    objc_msgSend(v6, "xpc_didStopCapture");
  }
}

void __36__CCCameraConnection_didStopCapture__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)captureDeviceDidChange:(int64_t)a3
{
  id v5 = nanocamera_log_control();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CCCameraConnection captureDeviceDidChange:]();
  }

  [(CCCameraConnection *)self _resetCurrentZoomMagnificationState];
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v6 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_115];
    objc_msgSend(v6, "xpc_captureDeviceDidChange:", a3);
  }
}

void __45__CCCameraConnection_captureDeviceDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)modeSelected:(int64_t)a3
{
  id v5 = nanocamera_log_control();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CCCameraConnection modeSelected:]();
  }

  [(CCCameraConnection *)self _resetCurrentZoomMagnificationState];
  [(CCCameraConnection *)self _reportToDockKitCameraModeChangedIfNeeded];
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v6 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_117];
    objc_msgSend(v6, "xpc_captureModeSelected:", a3);
  }
}

void __35__CCCameraConnection_modeSelected___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (int64_t)_currentOrientation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v4 = [WeakRetained cameraConnectionOrientation:self];

  return v4;
}

- (void)switchedOrientation:(int64_t)a3
{
  id v5 = nanocamera_log_control();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CCCameraConnection switchedOrientation:](a3, v5);
  }

  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v6 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_119];
    objc_msgSend(v6, "xpc_orientationChanged:", a3);
  }
}

void __42__CCCameraConnection_switchedOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)countdownCanceled
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    id v6 = "-[CCCameraConnection countdownCanceled]";
    __int16 v7 = 2080;
    int v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v9 = 1024;
    int v10 = 441;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    int64_t v4 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_121];
    objc_msgSend(v4, "xpc_countdownCanceled");
  }
}

void __39__CCCameraConnection_countdownCanceled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)zoomDidChange:(double)a3
{
  self->_zoomMagnificationChanged = 1;
  if (vabdd_f64(a3, self->_lastSentZoomAmount) >= 0.05 && self->_previewEndpoint)
  {
    float v3 = a3;
    self->_pendingZoomAmount = v3;
    zoomTimer = self->_zoomTimer;
    dispatch_time_t v5 = dispatch_time(0, 50000000);
    dispatch_source_set_timer(zoomTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  }
}

- (void)_zoomTimerFired
{
  dispatch_source_set_timer((dispatch_source_t)self->_zoomTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    self->_lastSentZoomAmount = self->_pendingZoomAmount;
    id v4 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_123];
    *(float *)&double v3 = self->_pendingZoomAmount;
    objc_msgSend(v4, "xpc_zoomChanged:", v3);
  }
}

void __37__CCCameraConnection__zoomTimerFired__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

void __57__CCCameraConnection_didUpdateShallowDepthOfFieldStatus___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)captureDeviceDidChange
{
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v3 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_127];
    objc_msgSend(v3, "xpc_captureDeviceDidChange");
  }
}

void __44__CCCameraConnection_captureDeviceDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)flashModeDidChange
{
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v3 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_129];
    objc_msgSend(v3, "xpc_flashModeDidChange:", -[CCCameraConnection _flashMode](self, "_flashMode"));
  }
}

void __40__CCCameraConnection_flashModeDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)spatialModeDidChange
{
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v3 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_131];
    objc_msgSend(v3, "xpc_spatialCaptureDidChange:", -[CCCameraConnection _isSpatialCapture](self, "_isSpatialCapture"));
  }
}

void __42__CCCameraConnection_spatialModeDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)hdrModeDidChange
{
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v3 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_133];
    objc_msgSend(v3, "xpc_hdrModeDidChange:", -[CCCameraConnection _hdrMode](self, "_hdrMode"));
  }
}

void __38__CCCameraConnection_hdrModeDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)irisModeDidChange
{
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v3 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_135];
    objc_msgSend(v3, "xpc_irisModeDidChange:", -[CCCameraConnection _irisMode](self, "_irisMode"));
  }
}

void __39__CCCameraConnection_irisModeDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)sharedLibrarySupportDidChange
{
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v3 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_137];
    objc_msgSend(v3, "xpc_sharedLibrarySupportDidChange:", -[CCCameraConnection _sharedLibrarySupport](self, "_sharedLibrarySupport"));
  }
}

void __51__CCCameraConnection_sharedLibrarySupportDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)sharedLibraryModeDidChange
{
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v3 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_139];
    objc_msgSend(v3, "xpc_sharedLibraryModeDidChange:", -[CCCameraConnection _sharedLibraryMode](self, "_sharedLibraryMode"));
  }
}

void __48__CCCameraConnection_sharedLibraryModeDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)showingLivePreviewDidChange
{
  if ([(CCCameraConnection *)self _shouldReportEvent])
  {
    id v3 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_141];
    objc_msgSend(v3, "xpc_showingLivePreviewDidChange:", -[CCCameraConnection _isShowingLivePreview](self, "_isShowingLivePreview"));
  }
}

void __49__CCCameraConnection_showingLivePreviewDidChange__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

- (void)xpc_ensureSwitchedToOneOfSupportedCaptureModes:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = nanocamera_log_control();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "-[CCCameraConnection xpc_ensureSwitchedToOneOfSupportedCaptureModes:reply:]";
    __int16 v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v18 = 1024;
    int v19 = 570;
    _os_log_impl(&dword_236723000, v8, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__CCCameraConnection_xpc_ensureSwitchedToOneOfSupportedCaptureModes_reply___block_invoke;
  block[3] = &unk_264CAB4F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __75__CCCameraConnection_xpc_ensureSwitchedToOneOfSupportedCaptureModes_reply___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _captureMode];
  id v3 = *(void **)(a1 + 40);
  id v4 = [NSNumber numberWithInteger:v2];
  LOBYTE(v3) = [v3 containsObject:v4];

  if ((v3 & 1) == 0)
  {
    dispatch_time_t v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    id v6 = [*(id *)(a1 + 32) _supportedCaptureModes];
    [v5 intersectOrderedSet:v6];

    if ([v5 count])
    {
      id v7 = [v5 firstObject];
      uint64_t v8 = [v7 integerValue];

      id v9 = nanocamera_log_control();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = _ncCaptureModeFromCCCaptureMode(v8);
        if v10 < 0xB && ((0x7ABu >> v10))
        {
          uint64_t v11 = off_264CAB6C8[(int)v10];
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
          uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_236723000, v9, OS_LOG_TYPE_DEFAULT, "Forcing mode to %@", buf, 0xCu);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
        [v14 cameraConnection:*(void *)(a1 + 32) setCaptureMode:v8];
      }
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)takePhotoWithCountdown:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  dispatch_time_t v5 = nanocamera_log_control();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v8 = "-[CCCameraConnection takePhotoWithCountdown:]";
    __int16 v9 = 2080;
    uint64_t v10 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v11 = 1024;
    int v12 = 596;
    _os_log_impl(&dword_236723000, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__CCCameraConnection_takePhotoWithCountdown___block_invoke;
  v6[3] = &unk_264CAB518;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __45__CCCameraConnection_takePhotoWithCountdown___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  [WeakRetained cameraConnection:*(void *)(a1 + 32) takePhotoWithCountdown:*(void *)(a1 + 40)];
}

- (void)xpc_beginBurstCaptureWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_time_t v5 = nanocamera_log_control();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = "-[CCCameraConnection xpc_beginBurstCaptureWithReply:]";
    __int16 v11 = 2080;
    int v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v13 = 1024;
    int v14 = 605;
    _os_log_impl(&dword_236723000, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__CCCameraConnection_xpc_beginBurstCaptureWithReply___block_invoke;
  v7[3] = &unk_264CAB540;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __53__CCCameraConnection_xpc_beginBurstCaptureWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    int v5 = [v4 cameraConnectionBeginBurstCapture:*(void *)(a1 + 32)];

    if (v5) {
      *(unsigned char *)(*(void *)(a1 + 32) + 104) = 1;
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)xpc_endBurstCaptureWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = nanocamera_log_control();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = "-[CCCameraConnection xpc_endBurstCaptureWithReply:]";
    __int16 v11 = 2080;
    int v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v13 = 1024;
    int v14 = 623;
    _os_log_impl(&dword_236723000, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__CCCameraConnection_xpc_endBurstCaptureWithReply___block_invoke;
  v7[3] = &unk_264CAB540;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __51__CCCameraConnection_xpc_endBurstCaptureWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    int v5 = [v4 cameraConnectionEndBurstCapture:*(void *)(a1 + 32)];

    if (v5) {
      *(unsigned char *)(*(void *)(a1 + 32) + 104) = 0;
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)xpc_setCaptureDevice:(int64_t)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = nanocamera_log_control();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v13 = "-[CCCameraConnection xpc_setCaptureDevice:reply:]";
    __int16 v14 = 2080;
    uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v16 = 1024;
    int v17 = 641;
    _os_log_impl(&dword_236723000, v7, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CCCameraConnection_xpc_setCaptureDevice_reply___block_invoke;
  block[3] = &unk_264CAB568;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __49__CCCameraConnection_xpc_setCaptureDevice_reply___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 168));
    [v4 cameraConnection:a1[4] setCaptureDevice:a1[6]];
  }
  uint64_t result = a1[5];
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)xpc_setCaptureMode:(int64_t)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = nanocamera_log_control();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v13 = "-[CCCameraConnection xpc_setCaptureMode:reply:]";
    __int16 v14 = 2080;
    uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v16 = 1024;
    int v17 = 656;
    _os_log_impl(&dword_236723000, v7, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CCCameraConnection_xpc_setCaptureMode_reply___block_invoke;
  block[3] = &unk_264CAB568;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __47__CCCameraConnection_xpc_setCaptureMode_reply___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(a1[4] + 168));
    [v4 cameraConnection:a1[4] setCaptureMode:a1[6]];
  }
  uint64_t result = a1[5];
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)xpc_startCaptureWithMode:(int64_t)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = nanocamera_log_control();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v13 = "-[CCCameraConnection xpc_startCaptureWithMode:reply:]";
    __int16 v14 = 2080;
    uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v16 = 1024;
    int v17 = 671;
    _os_log_impl(&dword_236723000, v7, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CCCameraConnection_xpc_startCaptureWithMode_reply___block_invoke;
  block[3] = &unk_264CAB568;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__CCCameraConnection_xpc_startCaptureWithMode_reply___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == [*(id *)(a1 + 32) _captureMode])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
      int v5 = [v4 cameraConnectionStartCapture:*(void *)(a1 + 32)];

      if (v5) {
        *(unsigned char *)(*(void *)(a1 + 32) + 105) = 1;
      }
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)xpc_pauseCaptureWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = nanocamera_log_control();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CCCameraConnection xpc_pauseCaptureWithReply:]";
    __int16 v11 = 2080;
    int v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v13 = 1024;
    int v14 = 690;
    _os_log_impl(&dword_236723000, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__CCCameraConnection_xpc_pauseCaptureWithReply___block_invoke;
  v7[3] = &unk_264CAB540;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __48__CCCameraConnection_xpc_pauseCaptureWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    [v4 cameraConnectionPauseCapture:*(void *)(a1 + 32)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)xpc_resumeCaptureWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = nanocamera_log_control();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CCCameraConnection xpc_resumeCaptureWithReply:]";
    __int16 v11 = 2080;
    int v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v13 = 1024;
    int v14 = 705;
    _os_log_impl(&dword_236723000, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CCCameraConnection_xpc_resumeCaptureWithReply___block_invoke;
  v7[3] = &unk_264CAB540;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __49__CCCameraConnection_xpc_resumeCaptureWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    [v4 cameraConnectionResumeCapture:*(void *)(a1 + 32)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)xpc_stopCaptureWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = nanocamera_log_control();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CCCameraConnection xpc_stopCaptureWithReply:]";
    __int16 v11 = 2080;
    int v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v13 = 1024;
    int v14 = 720;
    _os_log_impl(&dword_236723000, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CCCameraConnection_xpc_stopCaptureWithReply___block_invoke;
  v7[3] = &unk_264CAB540;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __47__CCCameraConnection_xpc_stopCaptureWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    int v5 = [v4 cameraConnectionStopCapture:*(void *)(a1 + 32)];

    if (v5) {
      *(unsigned char *)(*(void *)(a1 + 32) + 105) = 0;
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)xpc_suspend
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v6 = "-[CCCameraConnection xpc_suspend]";
    __int16 v7 = 2080;
    id v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v9 = 1024;
    int v10 = 738;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__CCCameraConnection_xpc_suspend__block_invoke;
  block[3] = &unk_264CAB590;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __33__CCCameraConnection_xpc_suspend__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    [v4 cameraConnectionSuspend:*(void *)(a1 + 32)];
  }
}

- (void)xpc_setPreviewEndpoint:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = nanocamera_log_preview();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v10 = "-[CCCameraConnection xpc_setPreviewEndpoint:]";
    __int16 v11 = 2080;
    int v12 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v13 = 1024;
    int v14 = 748;
    _os_log_impl(&dword_236723000, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__CCCameraConnection_xpc_setPreviewEndpoint___block_invoke;
  v7[3] = &unk_264CAB5B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

uint64_t __45__CCCameraConnection_xpc_setPreviewEndpoint___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[4])
  {
    return [v2 openPreview];
  }
  else
  {
    return [v2 closePreview];
  }
}

- (void)xpc_setFocusPoint:(id)a3
{
  long long v9 = 0uLL;
  id v4 = a3;
  if (!strcmp((const char *)[v4 objCType], "{CGPoint=dd}"))
  {
    [v4 getValue:&v9];
    id v6 = nanocamera_log_control();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CCCameraConnection xpc_setFocusPoint:]();
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__CCCameraConnection_xpc_setFocusPoint___block_invoke;
    block[3] = &unk_264CAB5E0;
    void block[4] = self;
    long long v8 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    int v5 = nanocamera_log_control();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CCCameraConnection xpc_setFocusPoint:]();
    }
  }
}

void __40__CCCameraConnection_xpc_setFocusPoint___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    objc_msgSend(v4, "cameraConnection:setFocusPoint:", *(void *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

- (id)_supportedCaptureDevices
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    __int16 v7 = [v6 cameraConnectionSupportedCaptureDevices:self];

    long long v8 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v7];
  }
  else
  {
    long long v8 = objc_msgSend(MEMORY[0x263EFF9D8], "orderedSetWithObjects:", &unk_26E9ACD78, &unk_26E9ACD90, 0);
  }
  return v8;
}

- (int64_t)_captureDevice
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  int64_t v7 = [v6 cameraConnectionCaptureDevice:self];

  return v7;
}

- (id)_supportedCaptureModes
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    int64_t v7 = [v6 cameraConnectionSupportedCaptureModes:self];

    long long v8 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v7];
  }
  else
  {
    long long v8 = [MEMORY[0x263EFF9D8] orderedSetWithObject:&unk_26E9ACD78];
  }
  return v8;
}

- (int64_t)_captureMode
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  int64_t v7 = [v6 cameraConnectionCaptureMode:self];

  return v7;
}

- (BOOL)_toggleCameraDeviceSupport
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = [v6 cameraConnectionToggleCameraDeviceSupport:self];

  return v7;
}

- (BOOL)_zoomSupport
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = [v6 cameraConnectionZoomSupport:self];

  return v7;
}

- (double)_zoomAmount
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v5 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 cameraConnectionZoomAmount:self];
    double v5 = v7;
  }
  if (v5 > 1.0 || v5 < 0.0) {
    return 0.0;
  }
  else {
    return v5;
  }
}

- (int64_t)_flashSupport
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  int64_t v7 = [v6 cameraConnectionFlashSupport:self];

  return v7;
}

- (int64_t)_flashMode
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [v6 cameraConnectionFlashSupport:self];

  if (!v7) {
    return 0;
  }
  id v8 = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0) {
    return 0;
  }
  id v10 = objc_loadWeakRetained((id *)p_delegate);
  int64_t v11 = [v10 cameraConnectionFlashMode:self];

  return v11;
}

- (BOOL)_isSpatialCapture
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = [v6 cameraConnectionIsSpatialCapture:self];

  return v7;
}

- (int64_t)_hdrSupport
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  int64_t v7 = [v6 cameraConnectionHDRSupport:self];

  return v7;
}

- (int64_t)_hdrMode
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [v6 cameraConnectionHDRSupport:self];

  if (!v7) {
    return 0;
  }
  id v8 = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0) {
    return 0;
  }
  id v10 = objc_loadWeakRetained((id *)p_delegate);
  int64_t v11 = [v10 cameraConnectionHDRMode:self];

  return v11;
}

- (int64_t)_irisSupport
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  int64_t v7 = [v6 cameraConnectionIrisSupport:self];

  return v7;
}

- (int64_t)_irisMode
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [v6 cameraConnectionIrisSupport:self];

  if (!v7) {
    return 0;
  }
  id v8 = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0) {
    return 0;
  }
  id v10 = objc_loadWeakRetained((id *)p_delegate);
  int64_t v11 = [v10 cameraConnectionIrisMode:self];

  return v11;
}

- (int64_t)_sharedLibrarySupport
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  int64_t v7 = [v6 cameraConnectionSharedLibrarySupport:self];

  return v7;
}

- (int64_t)_sharedLibraryMode
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [v6 cameraConnectionSharedLibrarySupport:self];

  if (!v7) {
    return 0;
  }
  id v8 = objc_loadWeakRetained((id *)p_delegate);
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0) {
    return 0;
  }
  id v10 = objc_loadWeakRetained((id *)p_delegate);
  int64_t v11 = [v10 cameraConnectionSharedLibraryMode:self];

  return v11;
}

- (BOOL)_supportsZoomMagnification
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = [v6 cameraConnectionZoomMagnificationSupport:self];

  return v7;
}

- (double)_minimumZoomMagnification
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0.0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  [v6 cameraConnectionMinimumZoomMagnification:self];
  double v8 = v7;

  return v8;
}

- (double)_maximumZoomMagnification
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0.0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  [v6 cameraConnectionMaximumZoomMagnification:self];
  double v8 = v7;

  return v8;
}

- (id)_significantZoomMagnifications
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    double v7 = [v6 cameraConnectionSignificantZoomMagnifications:self];
  }
  else
  {
    double v7 = (void *)MEMORY[0x263EFFA68];
  }
  return v7;
}

- (double)_currentZoomMagnification
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0.0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  [v6 cameraConnectionCurrentZoomMagnification:self];
  double v8 = v7;

  return v8;
}

- (BOOL)_supportsMomentCapture
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = [v6 cameraConnectionSupportsMomentCapture:self];

  return v7;
}

- (BOOL)_burstSupport
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = [v6 cameraConnectionBurstSupport:self];

  return v7;
}

- (BOOL)_isShowingLivePreview
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 1;
  }
  id v6 = objc_loadWeakRetained((id *)p_delegate);
  char v7 = [v6 cameraConnectionIsShowingLivePreview:self];

  return v7;
}

- (void)xpc_fetchCurrentStateIncludingSupportedCaptureModes:(BOOL)a3 reply:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__CCCameraConnection_xpc_fetchCurrentStateIncludingSupportedCaptureModes_reply___block_invoke;
  block[3] = &unk_264CAB608;
  BOOL v10 = a3;
  void block[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __80__CCCameraConnection_xpc_fetchCurrentStateIncludingSupportedCaptureModes_reply___block_invoke(uint64_t a1)
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _supportedCaptureDevices];
  uint64_t v81 = [*(id *)(a1 + 32) _captureDevice];
  if (*(unsigned char *)(a1 + 48))
  {
    char v3 = [*(id *)(a1 + 32) _supportedCaptureModes];
  }
  else
  {
    char v3 = 0;
  }
  uint64_t v80 = [*(id *)(a1 + 32) _captureMode];
  uint64_t v4 = *(void *)(a1 + 32);
  int v78 = *(unsigned __int8 *)(v4 + 105);
  id v5 = *(id *)(v4 + 112);
  uint64_t v6 = *(void *)(a1 + 32);
  int v76 = *(unsigned __int8 *)(v6 + 120);
  id v7 = *(id *)(v6 + 128);
  uint64_t v79 = [*(id *)(a1 + 32) _currentOrientation];
  int v77 = [*(id *)(a1 + 32) _toggleCameraDeviceSupport];
  int v75 = [*(id *)(a1 + 32) _zoomSupport];
  [*(id *)(a1 + 32) _zoomAmount];
  float v9 = v8;
  int v74 = [*(id *)(a1 + 32) _supportsZoomMagnification];
  [*(id *)(a1 + 32) _minimumZoomMagnification];
  float v11 = v10;
  [*(id *)(a1 + 32) _maximumZoomMagnification];
  float v13 = v12;
  int v14 = [*(id *)(a1 + 32) _significantZoomMagnifications];
  [*(id *)(a1 + 32) _currentZoomMagnification];
  float v16 = v15;
  uint64_t v73 = [*(id *)(a1 + 32) _flashSupport];
  uint64_t v72 = [*(id *)(a1 + 32) _flashMode];
  uint64_t v71 = [*(id *)(a1 + 32) _hdrSupport];
  uint64_t v70 = [*(id *)(a1 + 32) _hdrMode];
  uint64_t v69 = [*(id *)(a1 + 32) _irisSupport];
  uint64_t v68 = [*(id *)(a1 + 32) _irisMode];
  uint64_t v67 = [*(id *)(a1 + 32) _sharedLibrarySupport];
  uint64_t v66 = [*(id *)(a1 + 32) _sharedLibraryMode];
  int v65 = [*(id *)(a1 + 32) _supportsMomentCapture];
  int v64 = [*(id *)(a1 + 32) _burstSupport];
  int v17 = [*(id *)(a1 + 32) _isShowingLivePreview];
  uint64_t v18 = *(void **)(a1 + 32);
  uint64_t v19 = v18[17];
  int v63 = [v18 _isSpatialCapture];
  uint64_t v20 = nanocamera_log_control();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    BOOL v22 = _ncCaptureDeviceFromCCCaptureDevice(v81);
    if (v22)
    {
      if (v22)
      {
        v23 = @"Front";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v23 = @"Back";
    }
    v56 = v23;
    v24 = @"not-included";
    if (v3) {
      v24 = v3;
    }
    v51 = v24;
    uint64_t v25 = _ncCaptureModeFromCCCaptureMode(v80);
    if v25 < 0xB && ((0x7ABu >> v25))
    {
      v26 = off_264CAB6C8[(int)v25];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v55 = v26;
    uint64_t v27 = _ncOrientationFromDeviceOrientation(v79);
    if (v27 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v27);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_264CAB720[(int)v27];
    }
    v62 = v28;
    uint64_t v29 = _ncFlashSupportFromCCFlashSupport(v73);
    if (v29 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v29);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_264CAB768[(int)v29];
    }
    v61 = v30;
    uint64_t v31 = _ncFlashModeFromCCFlashMode(v72);
    if (v31 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v31);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_264CAB780[(int)v31];
    }
    v54 = v32;
    uint64_t v33 = _ncHDRSupportFromCCHDRSupport(v71);
    if (v33 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v33);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_264CAB748[(int)v33];
    }
    v60 = v34;
    uint64_t v35 = _ncHDRModeFromCCHDRMode(v70);
    if (v35 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v35);
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v36 = off_264CAB780[(int)v35];
    }
    v59 = v36;
    uint64_t v37 = _ncIrisSupportFromCCIrisSupport(v69);
    if (v37 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v37);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_264CAB768[(int)v37];
    }
    v58 = v38;
    uint64_t v39 = _ncIrisModeFromCCIrisMode(v68);
    if (v39 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v39);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = off_264CAB780[(int)v39];
    }
    v57 = v40;
    BOOL v41 = _ncSharedLibrarySupportFromCCSharedLibrarySupport(v67);
    if (v41)
    {
      if (v41)
      {
        v42 = @"OnOff";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v41);
        v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v42 = @"None";
    }
    v53 = v42;
    BOOL v43 = _ncSharedLibraryModeFromCCSharedLibraryMode(v66);
    if (v43)
    {
      if (v43)
      {
        v44 = @"On";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v43);
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v44 = @"Off";
    }
    v52 = v44;
    uint64_t v45 = _ncShallowDepthOfFieldStatusFromCCShallowDepthOfFieldStatus(v19);
    if (v45 >= 9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v45);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = off_264CAB798[(int)v45];
    }
    v50 = v46;
    *(_DWORD *)buf = 138419714;
    v83 = v2;
    __int16 v84 = 2112;
    v85 = v56;
    __int16 v86 = 2112;
    v87 = v51;
    __int16 v88 = 2112;
    v89 = v55;
    __int16 v90 = 1024;
    int v91 = v78;
    __int16 v92 = 2112;
    id v93 = v5;
    __int16 v94 = 1024;
    int v95 = v76;
    __int16 v96 = 2112;
    id v97 = v7;
    __int16 v98 = 2112;
    v99 = v62;
    __int16 v100 = 1024;
    int v101 = v77;
    __int16 v102 = 1024;
    int v103 = v75;
    __int16 v104 = 2048;
    double v105 = v9;
    __int16 v106 = 1024;
    int v107 = v74;
    __int16 v108 = 2048;
    double v109 = v11;
    __int16 v110 = 2048;
    double v111 = v13;
    __int16 v112 = 2112;
    v113 = v14;
    __int16 v114 = 2048;
    double v115 = v16;
    __int16 v116 = 2112;
    v117 = v61;
    __int16 v118 = 2112;
    v119 = v54;
    __int16 v120 = 2112;
    v121 = v60;
    __int16 v122 = 2112;
    v123 = v59;
    __int16 v124 = 2112;
    v125 = v58;
    __int16 v126 = 2112;
    v127 = v57;
    __int16 v128 = 2112;
    v129 = v53;
    __int16 v130 = 2112;
    v131 = v52;
    __int16 v132 = 1024;
    int v133 = v65;
    __int16 v134 = 1024;
    int v135 = v64;
    __int16 v136 = 1024;
    int v137 = v17;
    __int16 v138 = 2112;
    v139 = v46;
    __int16 v140 = 1024;
    int v141 = v63;
    _os_log_debug_impl(&dword_236723000, v20, OS_LOG_TYPE_DEBUG, "supportedCaptureDevices:%@ captureDevice:%@ supportedCaptureModes:%@ captureMode:%@ capturing:%d captureStartDate:%@ capturingPaused:%d capturePauseDate:%@ orientation:%@ toggleCameraDeviceSupport:%d zoomSupport:%d zoomAmount:%f zoomMagnificationSupport:%d minimumZoomMagnification:%f maximumZoomMagnification:%f significantZoomMagnifications:%@ currentZoomMagnification:%f flashSupport:%@ flashMode:%@ hdrSupport:%@ hdrMode:%@ irisSupport:%@ irisMode:%@ sharedLibrarySupport:%@ sharedLibraryMode:%@ supportsMomentCapture:%d burstSupport:%d showingLivePreview:%d shallowDepthOfFieldStatus:%@ isSpatialCapture:%d", buf, 0x10Au);
  }
  uint64_t v21 = *(void *)(a1 + 40);
  if (v21)
  {
    char v49 = v63;
    BYTE2(v48) = v17;
    BYTE1(v48) = v64;
    LOBYTE(v48) = v65;
    BYTE2(v47) = v74;
    BYTE1(v47) = v75;
    LOBYTE(v47) = v77;
    (*(void (**)(uint64_t, void *, uint64_t, __CFString *, uint64_t, BOOL, id, BOOL, float, float, float, float, id, uint64_t, int, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int, uint64_t, char))(v21 + 16))(v21, v2, v81, v3, v80, v78 != 0, v5, v76 != 0, v9, v11, v13, v16, v7, v79, v47, v14, v73, v72, v71,
      v70,
      v69,
      v68,
      v67,
      v66,
      v48,
      v19,
      v49);
  }
}

- (void)xpc_cancelCountdown
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__CCCameraConnection_xpc_cancelCountdown__block_invoke;
  block[3] = &unk_264CAB590;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __41__CCCameraConnection_xpc_cancelCountdown__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    [v4 cameraConnectionCancelCountdown:*(void *)(a1 + 32)];
  }
}

- (void)xpc_setZoom:(float)a3 reply:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__CCCameraConnection_xpc_setZoom_reply___block_invoke;
  block[3] = &unk_264CAB630;
  float v10 = a3;
  void block[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __40__CCCameraConnection_xpc_setZoom_reply___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 92) = *(_DWORD *)(a1 + 48);
  float v3 = 0.0;
  if ([*(id *)(a1 + 32) _zoomSupport])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
      [v6 cameraConnection:*(void *)(a1 + 32) setZoomAmount:*(float *)(a1 + 48)];

      [*(id *)(a1 + 32) _zoomAmount];
      float v3 = v2.n128_f64[0];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v8 = *(uint64_t (**)(__n128))(result + 16);
    v2.n128_f32[0] = v3;
    return v8(v2);
  }
  return result;
}

- (void)xpc_setZoomMagnification:(float)a3 reply:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CCCameraConnection_xpc_setZoomMagnification_reply___block_invoke;
  block[3] = &unk_264CAB630;
  float v10 = a3;
  void block[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__CCCameraConnection_xpc_setZoomMagnification_reply___block_invoke(uint64_t a1)
{
  float v3 = 0.0;
  if ([*(id *)(a1 + 32) _supportsZoomMagnification])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
      [v6 cameraConnection:*(void *)(a1 + 32) setZoomMagnificationAmount:*(float *)(a1 + 48)];

      [*(id *)(a1 + 32) _currentZoomMagnification];
      float v3 = v2.n128_f64[0];
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v8 = *(uint64_t (**)(__n128))(result + 16);
    v2.n128_f32[0] = v3;
    return v8(v2);
  }
  return result;
}

- (void)xpc_setFlashMode:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__CCCameraConnection_xpc_setFlashMode___block_invoke;
  v3[3] = &unk_264CAB518;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __39__CCCameraConnection_xpc_setFlashMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    [v4 cameraConnection:*(void *)(a1 + 32) setFlashMode:*(void *)(a1 + 40)];
  }
}

- (void)xpc_setHDRMode:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37__CCCameraConnection_xpc_setHDRMode___block_invoke;
  v3[3] = &unk_264CAB518;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __37__CCCameraConnection_xpc_setHDRMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    [v4 cameraConnection:*(void *)(a1 + 32) setHDRMode:*(void *)(a1 + 40)];
  }
}

- (void)xpc_setIrisMode:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __38__CCCameraConnection_xpc_setIrisMode___block_invoke;
  v3[3] = &unk_264CAB518;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __38__CCCameraConnection_xpc_setIrisMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    [v4 cameraConnection:*(void *)(a1 + 32) setIrisMode:*(void *)(a1 + 40)];
  }
}

- (void)xpc_setSharedLibraryMode:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __47__CCCameraConnection_xpc_setSharedLibraryMode___block_invoke;
  v3[3] = &unk_264CAB518;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __47__CCCameraConnection_xpc_setSharedLibraryMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    [v4 cameraConnection:*(void *)(a1 + 32) setSharedLibraryMode:*(void *)(a1 + 40)];
  }
}

- (void)xpc_toggleCameraDevice
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CCCameraConnection_xpc_toggleCameraDevice__block_invoke;
  block[3] = &unk_264CAB590;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__CCCameraConnection_xpc_toggleCameraDevice__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
    [v4 cameraConnectionToggleCameraDevice:*(void *)(a1 + 32)];
  }
}

- (void)openPreview
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v3 = nanocamera_log_preview();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315650;
    char v5 = "-[CCCameraConnection openPreview]";
    __int16 v6 = 2080;
    id v7 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v8 = 1024;
    int v9 = 1120;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v4, 0x1Cu);
  }

  self->_unint64_t desiredPreviewState = 2;
  [(CCCameraConnection *)self _performPreviewStateTransitionsIfNeeded];
}

- (BOOL)isPreviewConnected
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  char v3 = nanocamera_log_preview();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    __int16 v6 = "-[CCCameraConnection isPreviewConnected]";
    __int16 v7 = 2080;
    __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v9 = 1024;
    int v10 = 1155;
    _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  return self->_remoteViewfinderSession && self->_previewEndpoint != 0;
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v5 = (FigCameraViewfinderSession *)a4;
  __int16 v6 = nanocamera_log_preview();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    __int16 v9 = "-[CCCameraConnection cameraViewfinder:viewfinderSessionDidEnd:]";
    __int16 v10 = 2080;
    uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v12 = 1024;
    int v13 = 1171;
    _os_log_impl(&dword_236723000, v6, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v8, 0x1Cu);
  }

  if (self->_remoteViewfinderSession == v5)
  {
    self->_unint64_t currentPreviewState = 0;
    self->_remoteViewfinderSession = 0;
    __int16 v7 = v5;
  }
  else
  {
    __int16 v7 = nanocamera_log_preview();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CCCameraConnection cameraViewfinder:viewfinderSessionDidEnd:]();
    }
  }
}

- (void)cameraViewfinderSession:(id)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  __int16 v6 = nanocamera_log_preview();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315650;
    int v8 = "-[CCCameraConnection cameraViewfinderSession:didCapturePhotoWithStatus:thumbnailData:timestamp:]";
    __int16 v9 = 2080;
    __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v11 = 1024;
    int v12 = 1184;
    _os_log_impl(&dword_236723000, v6, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v7, 0x1Cu);
  }
}

- (void)cameraViewfinderSessionPreviewStreamDidOpen:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v4 = (FigCameraViewfinderSession *)a3;
  int v5 = nanocamera_log_preview();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    __int16 v9 = "-[CCCameraConnection cameraViewfinderSessionPreviewStreamDidOpen:]";
    __int16 v10 = 2080;
    __int16 v11 = "/Library/Caches/com.apple.xbs/Sources/NanoCamera/CompanionCamera/CCCameraConnection.m";
    __int16 v12 = 1024;
    int v13 = 1189;
    _os_log_impl(&dword_236723000, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v8, 0x1Cu);
  }

  remoteViewfinderSession = self->_remoteViewfinderSession;
  if (!remoteViewfinderSession || remoteViewfinderSession == v4)
  {
    self->_unint64_t currentPreviewState = 2;
    [(CCCameraConnection *)self _performPreviewStateTransitionsIfNeeded];
  }
  else
  {
    int v7 = nanocamera_log_preview();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CCCameraConnection cameraViewfinderSessionPreviewStreamDidOpen:]();
    }
  }
}

- (void)cameraViewfinderSession:(id)a3 previewStreamDidCloseWithStatus:(int)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  __int16 v6 = (FigCameraViewfinderSession *)a3;
  int v7 = nanocamera_log_preview();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = a4;
    _os_log_impl(&dword_236723000, v7, OS_LOG_TYPE_DEFAULT, "status: %d", (uint8_t *)v10, 8u);
  }

  remoteViewfinderSession = self->_remoteViewfinderSession;
  if (!remoteViewfinderSession || remoteViewfinderSession == v6)
  {
    self->_unint64_t currentPreviewState = 0;
    [(CCCameraConnection *)self _performPreviewStateTransitionsIfNeeded];
  }
  else
  {
    __int16 v9 = nanocamera_log_preview();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CCCameraConnection cameraViewfinderSession:previewStreamDidCloseWithStatus:]();
    }
  }
}

- (void)_handleInterruption
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_236723000, v0, v1, "Connection interrupted %lu times", v2, v3, v4, v5, v6);
}

void __53__CCCameraConnection__registerForDockKitButtonEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__CCCameraConnection__registerForDockKitButtonEvents__block_invoke_2;
  v5[3] = &unk_264CAB5B8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __53__CCCameraConnection__registerForDockKitButtonEvents__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDockKitSystemEvent:*(void *)(a1 + 40)];
}

uint64_t __53__CCCameraConnection__registerForDockKitButtonEvents__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleDockKitConnectedEvent:a2];
}

- (void)_handleDockKitConnectedEvent:(BOOL)a3
{
  self->_connectedToDockKitDevice = a3;
  if (!a3) {
    [(CCCameraConnection *)self _stopScheduledCaptureIfNeeded];
  }
  [(CCCameraConnection *)self _reportToDockKitCameraModeChangedIfNeeded];
}

- (void)_handleDockKitSystemEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  switch([v4 type])
  {
    case 0u:
      uint64_t v5 = nanocamera_log_control();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [v4 value];
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = [v6 intValue];
        _os_log_impl(&dword_236723000, v5, OS_LOG_TYPE_DEFAULT, "shutter event triggered. Payload is %d", buf, 8u);
      }
      int v7 = [v4 value];
      int v8 = [v7 intValue];

      if (v8) {
        [(CCCameraConnection *)self _captureButtonUp];
      }
      else {
        [(CCCameraConnection *)self _captureButtonDown];
      }
      break;
    case 1u:
      __int16 v9 = nanocamera_log_control();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = [v4 value];
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = [v10 intValue];
        _os_log_impl(&dword_236723000, v9, OS_LOG_TYPE_DEFAULT, "flip event triggered. Payload is %d", buf, 8u);
      }
      uint64_t v11 = [v4 value];
      int v12 = [v11 intValue];

      if (!v12)
      {
        [(CCCameraConnection *)self xpc_toggleCameraDevice];
        [(CCCameraConnection *)self _resetCurrentZoomMagnificationState];
        if ([(CCCameraConnection *)self _shouldReportEvent])
        {
          int v13 = [(NSXPCConnection *)self->_xpc remoteObjectProxyWithErrorHandler:&__block_literal_global_236];
          [v13 xpc_captureDeviceDidChange];
          goto LABEL_22;
        }
      }
      break;
    case 2u:
      uint64_t v14 = nanocamera_log_control();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        double v15 = [v4 value];
        [v15 doubleValue];
        *(_DWORD *)buf = 134217984;
        uint64_t v24 = v16;
        _os_log_impl(&dword_236723000, v14, OS_LOG_TYPE_DEFAULT, "zoom event triggered. Payload is %0.2f", buf, 0xCu);
      }
      if ([(CCCameraConnection *)self _supportsZoomMagnification]
        && !self->_zoomInProgress)
      {
        self->_zoomInProgress = 1;
        int v17 = [v4 value];
        [v17 doubleValue];
        double v19 = v18;

        if (self->_zoomMagnificationChanged) {
          [(CCCameraConnection *)self _updateCurrentZoomMagnificationState];
        }
        double v20 = -1.0;
        if (v19 > 0.0) {
          double v20 = 1.0;
        }
        double v21 = self->_currentZoomMagnification + v20 * 0.1;
        *(float *)&double v21 = v21;
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __48__CCCameraConnection__handleDockKitSystemEvent___block_invoke_237;
        v22[3] = &unk_264CAB6A8;
        v22[4] = self;
        [(CCCameraConnection *)self xpc_setZoomMagnification:v22 reply:v21];
      }
      break;
    case 3u:
      int v13 = nanocamera_log_control();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_236723000, v13, OS_LOG_TYPE_DEFAULT, "unknown event triggered, ignoring", buf, 2u);
      }
LABEL_22:

      break;
    default:
      break;
  }
}

void __48__CCCameraConnection__handleDockKitSystemEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = nanocamera_log_control();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CCCameraConnection__checkin__block_invoke_cold_1();
  }
}

void __48__CCCameraConnection__handleDockKitSystemEvent___block_invoke_237(uint64_t a1, float a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = nanocamera_log_control();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    double v6 = a2;
    _os_log_impl(&dword_236723000, v4, OS_LOG_TYPE_DEFAULT, "zoom set to %0.2f", (uint8_t *)&v5, 0xCu);
  }

  *(float *)(*(void *)(a1 + 32) + 160) = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 166) = 0;
}

- (void)_updateCurrentZoomMagnificationState
{
  [(CCCameraConnection *)self _currentZoomMagnification];
  *(float *)&double v3 = v3;
  self->_currentZoomMagnification = *(float *)&v3;
  self->_zoomMagnificationChanged = 0;
}

- (unsigned)_currentCameraAppOrientation
{
  unint64_t v2 = [(CCCameraConnection *)self _currentOrientation];
  unint64_t v3 = 0x302010004uLL >> (8 * v2);
  if (v2 >= 5) {
    LOBYTE(v3) = 4;
  }
  return v3 & 7;
}

- (void)_reportToDockKitPanoramaDirectionChangedIfNeeded:(int64_t)a3
{
  if (self->_connectedToDockKitDevice) {
    [(DKSystemEventsAgent *)self->_dockKitAgent panoramaCaptureDirectionChanged:a3];
  }
}

- (void)_reportToDockKitCameraModeChangedIfNeeded
{
  if (self->_connectedToDockKitDevice)
  {
    BOOL v3 = [(CCCameraConnection *)self _captureMode] != 3;
    dockKitAgent = self->_dockKitAgent;
    [(DKSystemEventsAgent *)dockKitAgent cameraShutterModeChanged:v3];
  }
}

- (void)_reportToDockKitCameraStartCaptureIfNeeded
{
  if (self->_connectedToDockKitDevice
    && !self->_capturing
    && [(CCCameraConnection *)self _captureMode] == 3)
  {
    dockKitAgent = self->_dockKitAgent;
    uint64_t v4 = [(CCCameraConnection *)self _currentCameraAppOrientation];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __64__CCCameraConnection__reportToDockKitCameraStartCaptureIfNeeded__block_invoke;
    v5[3] = &unk_264CAB680;
    v5[4] = self;
    [(DKSystemEventsAgent *)dockKitAgent startCaptureIfNeeded:0 orientation:v4 finished:v5];
  }
}

uint64_t __64__CCCameraConnection__reportToDockKitCameraStartCaptureIfNeeded__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    BOOL v3 = nanocamera_log_control();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_236723000, v3, OS_LOG_TYPE_DEFAULT, "dockkit capture failed.", v5, 2u);
    }
  }
  return [*(id *)(a1 + 32) _stopCaptureIfNeeded];
}

- (void)_reportToDockKitCameraStopCaptureIfNeeded
{
  if (self->_connectedToDockKitDevice
    && self->_capturing
    && [(CCCameraConnection *)self _captureMode] == 3)
  {
    dockKitAgent = self->_dockKitAgent;
    [(DKSystemEventsAgent *)dockKitAgent stopCaptureIfNeeded:0];
  }
}

- (void)_captureButtonUp
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CCCameraConnection__captureButtonUp__block_invoke;
  block[3] = &unk_264CAB590;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __38__CCCameraConnection__captureButtonUp__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _stopScheduledCaptureIfNeeded];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(unsigned char **)(a1 + 32);
    if (v3[105])
    {
      return [v3 _stopCaptureIfNeeded];
    }
    else
    {
      uint64_t v4 = [v3 _captureMode];
      if (v4 == 6 || v4 == 0)
      {
        double v6 = *(void **)(a1 + 32);
        return [v6 takePhotoWithCountdown:0];
      }
      else
      {
        uint64_t v7 = *(void **)(a1 + 32);
        return [v7 _startCaptureIfNeeded];
      }
    }
  }
  return result;
}

- (void)_scheduleStartCaptureIfNeeded
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CCCameraConnection__scheduleStartCaptureIfNeeded__block_invoke;
  block[3] = &unk_264CAB590;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __51__CCCameraConnection__scheduleStartCaptureIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _supportsMomentCapture];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 152) invalidate];
    *(void *)(*(void *)(a1 + 32) + 152) = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:sel__handleCaptureStartTimerFired_ selector:0 userInfo:0 repeats:0.4];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)_handleCaptureStartTimerFired:(id)a3
{
  if ([(CCCameraConnection *)self _supportsMomentCapture])
  {
    [(CCCameraConnection *)self _startCaptureIfNeeded];
  }
}

- (void)_startCaptureIfNeeded
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__CCCameraConnection__startCaptureIfNeeded__block_invoke;
  block[3] = &unk_264CAB590;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __43__CCCameraConnection__startCaptureIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 105))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 168));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
      *(unsigned char *)(*(void *)(a1 + 32) + 105) = [v5 cameraConnectionStartCapture:*(void *)(a1 + 32)];
    }
  }
}

- (BOOL)_stopScheduledCaptureIfNeeded
{
  captureStartTimer = self->_captureStartTimer;
  if (!captureStartTimer) {
    goto LABEL_4;
  }
  if ([(NSTimer *)captureStartTimer isValid])
  {
    captureStartTimer = self->_captureStartTimer;
LABEL_4:
    [(NSTimer *)captureStartTimer invalidate];
    BOOL v4 = 0;
    goto LABEL_8;
  }
  if ([(CCCameraConnection *)self _supportsMomentCapture]) {
    [(CCCameraConnection *)self _stopCaptureIfNeeded];
  }
  BOOL v4 = 1;
LABEL_8:
  id v5 = self->_captureStartTimer;
  self->_captureStartTimer = 0;

  return v4;
}

- (void)_stopCaptureIfNeeded
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CCCameraConnection__stopCaptureIfNeeded__block_invoke;
  block[3] = &unk_264CAB590;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __42__CCCameraConnection__stopCaptureIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 105))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 168));
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 168));
      int v6 = [v5 cameraConnectionStopCapture:*(void *)(a1 + 32)];

      if (v6) {
        *(unsigned char *)(*(void *)(a1 + 32) + 105) = 0;
      }
    }
  }
}

- (CCCameraConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CCCameraConnectionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_captureStartTimer, 0);
  objc_storeStrong((id *)&self->_dockKitAgent, 0);
  objc_storeStrong((id *)&self->_capturePauseDate, 0);
  objc_storeStrong((id *)&self->_captureStartDate, 0);
  objc_storeStrong((id *)&self->_zoomTimer, 0);
  objc_storeStrong((id *)&self->_remoteViewfinderSession, 0);
  objc_storeStrong((id *)&self->_remoteViewfinder, 0);
  objc_storeStrong((id *)&self->_previewEndpoint, 0);
  objc_storeStrong(&self->_orientationChangeObserver, 0);
  objc_storeStrong((id *)&self->_xpc, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

void __26__CCCameraConnection_init__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_236723000, v0, v1, "Device connected", v2, v3, v4, v5, v6);
}

void __26__CCCameraConnection_init__block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_236723000, v0, v1, "Device disconnected", v2, v3, v4, v5, v6);
}

void __30__CCCameraConnection__connect__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_236723000, v0, v1, "interruption", v2, v3, v4, v5, v6);
}

void __30__CCCameraConnection__connect__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_236723000, v0, v1, "invalidation", v2, v3, v4, v5, v6);
}

void __30__CCCameraConnection__checkin__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236723000, v0, v1, "%@", v2, v3, v4, v5, v6);
}

- (void)didUpdateThumbnailWithData:isVideo:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_236723000, v0, v1, "_xpc is %@", v2, v3, v4, v5, v6);
}

- (void)captureDeviceDidChange:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_236723000, v0, v1, "captureDevice: %lu", v2, v3, v4, v5, v6);
}

- (void)modeSelected:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_236723000, v0, v1, "captureMode: %lu", v2, v3, v4, v5, v6);
}

- (void)switchedOrientation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = _ncOrientationFromDeviceOrientation(a1);
  if (v3 > 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = off_264CAB720[(int)v3];
  }
  *(_DWORD *)buf = 138412290;
  uint8_t v6 = v4;
  _os_log_debug_impl(&dword_236723000, a2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

- (void)xpc_setFocusPoint:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_236723000, v1, OS_LOG_TYPE_DEBUG, "Focus Point: {%.4f, %.4f}", v2, 0x16u);
}

- (void)xpc_setFocusPoint:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_236723000, v0, v1, "Passed invalid focusPoint parameter %@", v2, v3, v4, v5, v6);
}

- (void)cameraViewfinder:viewfinderSessionDidEnd:.cold.1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_236723000, v0, v1, "[lifecycle] Skipping sessionDidEnd (mismatch) stored=%@ eventSession=%@");
}

- (void)cameraViewfinderSessionPreviewStreamDidOpen:.cold.1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_236723000, v0, v1, "[lifecycle] Skipping streamDidOpen (mismatch) stored=%@ eventSession=%@");
}

- (void)cameraViewfinderSession:previewStreamDidCloseWithStatus:.cold.1()
{
  OUTLINED_FUNCTION_7(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_236723000, v0, v1, "[lifecycle] Skipping streamDidCloseWithStatus (mismatch) stored=%@ eventSession=%@");
}

@end