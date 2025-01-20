@interface CAMRemoteShutterController
- (BOOL)cameraConnection:(id)a3 setCaptureDevice:(int64_t)a4;
- (BOOL)cameraConnection:(id)a3 setCaptureMode:(int64_t)a4;
- (BOOL)cameraConnectionBeginBurstCapture:(id)a3;
- (BOOL)cameraConnectionBurstSupport:(id)a3;
- (BOOL)cameraConnectionEndBurstCapture:(id)a3;
- (BOOL)cameraConnectionIsMirrored:(id)a3;
- (BOOL)cameraConnectionIsShowingLivePreview:(id)a3;
- (BOOL)cameraConnectionIsSpatialCapture:(id)a3;
- (BOOL)cameraConnectionPauseCapture:(id)a3;
- (BOOL)cameraConnectionResumeCapture:(id)a3;
- (BOOL)cameraConnectionStartCapture:(id)a3;
- (BOOL)cameraConnectionStopCapture:(id)a3;
- (BOOL)cameraConnectionSupportsMomentCapture:(id)a3;
- (BOOL)cameraConnectionToggleCameraDeviceSupport:(id)a3;
- (BOOL)cameraConnectionZoomMagnificationSupport:(id)a3;
- (BOOL)cameraConnectionZoomSupport:(id)a3;
- (BOOL)currentZoomMagnificationAllowed;
- (BOOL)currentlyEmulatingMulticam;
- (BOOL)isCapturingTimelapse;
- (BOOL)isCapturingVideo;
- (BOOL)isConnected;
- (BOOL)isShowingPreview;
- (BOOL)sharedLibrarySupported;
- (BOOL)spatialEnabled;
- (CAMCaptureGraphConfiguration)currentGraphConfiguration;
- (CAMMotionController)_motionController;
- (CAMRemoteShutterController)initWithCaptureConfiguration:(id)a3 motionController:(id)a4;
- (CAMRemoteShutterDelegate)delegate;
- (CCCameraConnection)connection;
- (NSArray)availableCaptureModes;
- (NSArray)currentContinuousDisplayZoomFactors;
- (NSArray)currentContinuousZoomFactors;
- (double)_displayZoomValueForZoomFactor:(double)result;
- (double)_zoomFactorForDisplayZoomValue:(double)result;
- (double)cameraConnectionCurrentZoomMagnification:(id)a3;
- (double)cameraConnectionMaximumZoomMagnification:(id)a3;
- (double)cameraConnectionMinimumZoomMagnification:(id)a3;
- (double)cameraConnectionZoomAmount:(id)a3;
- (double)zoomAmount;
- (double)zoomFactor;
- (id)cameraConnectionSignificantZoomMagnifications:(id)a3;
- (id)cameraConnectionSupportedCaptureDevices:(id)a3;
- (id)cameraConnectionSupportedCaptureModes:(id)a3;
- (int64_t)_convertCaptureDevice:(int64_t)a3;
- (int64_t)_convertMode:(int64_t)a3;
- (int64_t)_convertPanoramaDirection:(int64_t)a3;
- (int64_t)_currentCaptureDevice;
- (int64_t)_currentMode;
- (int64_t)cameraConnectionFlashMode:(id)a3;
- (int64_t)cameraConnectionFlashSupport:(id)a3;
- (int64_t)cameraConnectionHDRMode:(id)a3;
- (int64_t)cameraConnectionHDRSupport:(id)a3;
- (int64_t)cameraConnectionIrisMode:(id)a3;
- (int64_t)cameraConnectionIrisSupport:(id)a3;
- (int64_t)cameraConnectionOrientation:(id)a3;
- (int64_t)cameraConnectionSharedLibraryMode:(id)a3;
- (int64_t)cameraConnectionSharedLibrarySupport:(id)a3;
- (int64_t)captureDevice;
- (int64_t)captureMode;
- (int64_t)currentResolvedDevice;
- (int64_t)flashMode;
- (int64_t)hdrMode;
- (int64_t)irisMode;
- (int64_t)shallowDepthOfFieldStatus;
- (int64_t)sharedLibraryMode;
- (void)_captureOrientationDidChange:(id)a3;
- (void)_enterBackground:(id)a3;
- (void)_enterForeground:(id)a3;
- (void)_refreshZoomMagnificationState;
- (void)_sendMode;
- (void)applyCaptureConfiguration:(id)a3;
- (void)burstCaptureDidStop;
- (void)burstCaptureNumberOfPhotosDidChange:(unint64_t)a3;
- (void)burstCaptureWillStart;
- (void)cameraConnection:(id)a3 setFlashMode:(int64_t)a4;
- (void)cameraConnection:(id)a3 setFocusPoint:(CGPoint)a4;
- (void)cameraConnection:(id)a3 setHDRMode:(int64_t)a4;
- (void)cameraConnection:(id)a3 setIrisMode:(int64_t)a4;
- (void)cameraConnection:(id)a3 setSharedLibraryMode:(int64_t)a4;
- (void)cameraConnection:(id)a3 setZoomAmount:(double)a4;
- (void)cameraConnection:(id)a3 setZoomMagnificationAmount:(double)a4;
- (void)cameraConnection:(id)a3 takePhotoWithCountdown:(unint64_t)a4;
- (void)cameraConnectionCancelCountdown:(id)a3;
- (void)cameraConnectionSuspend:(id)a3;
- (void)cameraConnectionToggleCameraDevice:(id)a3;
- (void)closeConnection;
- (void)countdownCanceled;
- (void)createConnectionIfNecessary;
- (void)dealloc;
- (void)didPauseCaptureTimerWithPauseTime:(id)a3;
- (void)didResumeCaptureTimerWithNewStartTime:(id)a3;
- (void)didStartCaptureTimer;
- (void)didStopCapture;
- (void)openConnection;
- (void)sendThumbnailData:(id)a3 isVideo:(BOOL)a4;
- (void)sendThumbnailImage:(id)a3 isVideo:(BOOL)a4;
- (void)setAvailableCaptureModes:(id)a3;
- (void)setCaptureDevice:(int64_t)a3;
- (void)setCaptureMode:(int64_t)a3;
- (void)setCapturingTimelapse:(BOOL)a3;
- (void)setCapturingVideo:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentContinuousDisplayZoomFactors:(id)a3;
- (void)setCurrentContinuousZoomFactors:(id)a3;
- (void)setCurrentGraphConfiguration:(id)a3;
- (void)setCurrentResolvedDevice:(int64_t)a3;
- (void)setCurrentZoomMagnificationAllowed:(BOOL)a3;
- (void)setCurrentlyEmulatingMulticam:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setHdrMode:(int64_t)a3;
- (void)setIrisMode:(int64_t)a3;
- (void)setPanoramaDirection:(int64_t)a3;
- (void)setShallowDepthOfFieldStatus:(int64_t)a3;
- (void)setSharedLibraryMode:(int64_t)a3;
- (void)setSharedLibrarySupported:(BOOL)a3;
- (void)setShowingPreview:(BOOL)a3;
- (void)setSpatialEnabled:(BOOL)a3;
- (void)setZoomAmount:(double)a3;
- (void)setZoomFactor:(double)a3;
- (void)willStartCapturing;
@end

@implementation CAMRemoteShutterController

- (CAMRemoteShutterController)initWithCaptureConfiguration:(id)a3 motionController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CAMRemoteShutterController;
  v8 = [(CAMRemoteShutterController *)&v13 init];
  if (v8)
  {
    v8->_captureMode = [v6 mode];
    v8->_captureDevice = [v6 device];
    v8->_flashMode = [v6 flashMode];
    v8->_hdrMode = [v6 HDRMode];
    v8->_irisMode = [v6 irisMode];
    v8->_sharedLibraryMode = [v6 sharedLibraryMode];
    v8->_spatialEnabled = [v6 spatialVideoEnabled];
    v8->_showingPreview = 1;
    objc_storeStrong((id *)&v8->__motionController, a4);
    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v8 selector:sel__enterForeground_ name:*MEMORY[0x263F833B8] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v8 selector:sel__enterBackground_ name:*MEMORY[0x263F83330] object:0];

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v8 selector:sel__captureOrientationDidChange_ name:@"CAMMotionControllerCaptureOrientationChangedNotification" object:0];
  }
  return v8;
}

- (void)setDelegate:(id)a3
{
}

- (void)setFlashMode:(int64_t)a3
{
  if (self->_flashMode != a3)
  {
    self->_flashMode = a3;
    [(CCCameraConnection *)self->_connection flashModeDidChange];
  }
}

- (void)setHdrMode:(int64_t)a3
{
  if (self->_hdrMode != a3)
  {
    self->_hdrMode = a3;
    [(CCCameraConnection *)self->_connection hdrModeDidChange];
  }
}

- (void)setAvailableCaptureModes:(id)a3
{
}

- (void)setShowingPreview:(BOOL)a3
{
  if (self->_showingPreview != a3)
  {
    self->_showingPreview = a3;
    [(CCCameraConnection *)self->_connection showingLivePreviewDidChange];
  }
}

- (void)setZoomAmount:(double)a3
{
  if (self->_zoomAmount != a3)
  {
    self->_zoomAmount = a3;
    -[CCCameraConnection zoomDidChange:](self->_connection, "zoomDidChange:");
  }
}

- (void)createConnectionIfNecessary
{
  if (!self->_connection)
  {
    v3 = (CCCameraConnection *)objc_alloc_init(NSClassFromString(&cfstr_Cccameraconnec.isa));
    connection = self->_connection;
    self->_connection = v3;

    [(CCCameraConnection *)self->_connection setDelegate:self];
    v5 = self->_connection;
    [(CCCameraConnection *)v5 open];
  }
}

- (void)sendThumbnailImage:(id)a3 isVideo:(BOOL)a4
{
  BOOL v4 = a4;
  image = (UIImage *)a3;
  if ([(CCCameraConnection *)self->_connection isOpen])
  {
    id v6 = UIImageJPEGRepresentation(image, 0.8);
    [(CAMRemoteShutterController *)self sendThumbnailData:v6 isVideo:v4];
  }
}

- (void)_enterBackground:(id)a3
{
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(CAMRemoteShutterController *)self closeConnection];
  v4.receiver = self;
  v4.super_class = (Class)CAMRemoteShutterController;
  [(CAMRemoteShutterController *)&v4 dealloc];
}

- (void)applyCaptureConfiguration:(id)a3
{
  id v4 = a3;
  -[CAMRemoteShutterController setCaptureMode:](self, "setCaptureMode:", [v4 mode]);
  -[CAMRemoteShutterController setCaptureDevice:](self, "setCaptureDevice:", [v4 device]);
  -[CAMRemoteShutterController setFlashMode:](self, "setFlashMode:", [v4 flashMode]);
  -[CAMRemoteShutterController setHdrMode:](self, "setHdrMode:", [v4 HDRMode]);
  -[CAMRemoteShutterController setIrisMode:](self, "setIrisMode:", [v4 irisMode]);
  -[CAMRemoteShutterController setSharedLibraryMode:](self, "setSharedLibraryMode:", [v4 sharedLibraryMode]);
  uint64_t v5 = [v4 spatialVideoEnabled];

  [(CAMRemoteShutterController *)self setSpatialEnabled:v5];
}

- (void)openConnection
{
}

- (void)closeConnection
{
}

- (BOOL)isConnected
{
  return [(CCCameraConnection *)self->_connection isOpen];
}

- (int64_t)_convertCaptureDevice:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA) {
    return 0;
  }
  else {
    return qword_209C7AD68[a3 - 1];
  }
}

- (int64_t)_convertMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 0;
  }
  else {
    return qword_209C7ACB8[a3 - 1];
  }
}

- (int64_t)_convertPanoramaDirection:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (int64_t)_currentCaptureDevice
{
  return [(CAMRemoteShutterController *)self _convertCaptureDevice:self->_captureDevice];
}

- (int64_t)_currentMode
{
  return [(CAMRemoteShutterController *)self _convertMode:self->_captureMode];
}

- (void)_sendMode
{
  connection = self->_connection;
  int64_t v3 = [(CAMRemoteShutterController *)self _currentMode];
  [(CCCameraConnection *)connection modeSelected:v3];
}

- (void)setCaptureMode:(int64_t)a3
{
  if (self->_captureMode != a3)
  {
    self->_captureMode = a3;
    [(CAMRemoteShutterController *)self _sendMode];
  }
}

- (void)setCaptureDevice:(int64_t)a3
{
  if (self->_captureDevice != a3)
  {
    self->_captureDevice = a3;
    connection = self->_connection;
    int64_t v4 = [(CAMRemoteShutterController *)self _currentCaptureDevice];
    [(CCCameraConnection *)connection captureDeviceDidChange:v4];
  }
}

- (void)setPanoramaDirection:(int64_t)a3
{
  connection = self->_connection;
  int64_t v4 = [(CAMRemoteShutterController *)self _convertPanoramaDirection:a3];
  [(CCCameraConnection *)connection panoramaDirectionDidChange:v4];
}

- (void)setSpatialEnabled:(BOOL)a3
{
  if (self->_spatialEnabled != a3)
  {
    self->_spatialEnabled = a3;
    [(CCCameraConnection *)self->_connection spatialModeDidChange];
  }
}

- (void)setIrisMode:(int64_t)a3
{
  if (self->_irisMode != a3)
  {
    self->_irisMode = a3;
    [(CCCameraConnection *)self->_connection irisModeDidChange];
  }
}

- (void)setSharedLibrarySupported:(BOOL)a3
{
  if (self->_sharedLibrarySupported != a3)
  {
    self->_sharedLibrarySupported = a3;
    [(CCCameraConnection *)self->_connection sharedLibrarySupportDidChange];
  }
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    [(CCCameraConnection *)self->_connection sharedLibraryModeDidChange];
  }
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3
{
  if (self->_shallowDepthOfFieldStatus != a3)
  {
    self->_shallowDepthOfFieldStatus = a3;
    if ((unint64_t)(a3 - 1) > 0xD) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = qword_209C7ACF8[a3 - 1];
    }
    [(CCCameraConnection *)self->_connection didUpdateShallowDepthOfFieldStatus:v3];
  }
}

- (void)sendThumbnailData:(id)a3 isVideo:(BOOL)a4
{
}

- (void)countdownCanceled
{
}

- (void)burstCaptureWillStart
{
}

- (void)burstCaptureNumberOfPhotosDidChange:(unint64_t)a3
{
}

- (void)burstCaptureDidStop
{
}

- (void)willStartCapturing
{
}

- (void)didStartCaptureTimer
{
}

- (void)didPauseCaptureTimerWithPauseTime:(id)a3
{
}

- (void)didResumeCaptureTimerWithNewStartTime:(id)a3
{
}

- (void)didStopCapture
{
}

- (void)_enterForeground:(id)a3
{
}

- (void)_captureOrientationDidChange:(id)a3
{
  int64_t v4 = [(CAMRemoteShutterController *)self _motionController];
  uint64_t v5 = [v4 captureOrientation];

  connection = self->_connection;
  [(CCCameraConnection *)connection switchedOrientation:v5];
}

- (void)cameraConnection:(id)a3 takePhotoWithCountdown:(unint64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutter:self takePhotoWithCountdown:a4];
}

- (void)cameraConnectionCancelCountdown:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutterCancelCountdown:self];
}

- (BOOL)cameraConnectionBeginBurstCapture:(id)a3
{
  uint64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained remoteShutterBeginBurstCapture:v3];

  return (char)v3;
}

- (BOOL)cameraConnectionEndBurstCapture:(id)a3
{
  uint64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained remoteShutterEndBurstCapture:v3];

  return (char)v3;
}

- (id)cameraConnectionSupportedCaptureDevices:(id)a3
{
  int64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  uint64_t v5 = +[CAMCaptureCapabilities capabilities];
  if ([v5 isSupportedMode:self->_captureMode withDevice:0])
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMRemoteShutterController _convertCaptureDevice:](self, "_convertCaptureDevice:", 0));
    [v4 addObject:v6];
  }
  if ([v5 isSupportedMode:self->_captureMode withDevice:1])
  {
    id v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMRemoteShutterController _convertCaptureDevice:](self, "_convertCaptureDevice:", 1));
    [v4 addObject:v7];
  }
  v8 = (void *)[v4 copy];

  return v8;
}

- (BOOL)cameraConnection:(id)a3 setCaptureDevice:(int64_t)a4
{
  if ([(CAMRemoteShutterController *)self isCapturingVideo]
    || [(CAMRemoteShutterController *)self isCapturingTimelapse])
  {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutter:self setCaptureDevice:a4 == 1];

  return 1;
}

- (id)cameraConnectionSupportedCaptureModes:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](self->_availableCaptureModes, "count", a3));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_availableCaptureModes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[CAMRemoteShutterController _convertMode:](self, "_convertMode:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "integerValue", (void)v13)));
        [v4 addObject:v10];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];
  return v11;
}

- (BOOL)cameraConnection:(id)a3 setCaptureMode:(int64_t)a4
{
  if ([(CAMRemoteShutterController *)self isCapturingVideo]
    || [(CAMRemoteShutterController *)self isCapturingTimelapse])
  {
    return 0;
  }
  if ((unint64_t)(a4 - 1) >= 7) {
    a4 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutter:self setMode:a4];

  return 1;
}

- (void)cameraConnection:(id)a3 setFocusPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteShutter:focusOn:", self, x, y);
}

- (BOOL)cameraConnectionStartCapture:(id)a3
{
  uint64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained remoteShutterStartCapture:v3];

  return (char)v3;
}

- (BOOL)cameraConnectionPauseCapture:(id)a3
{
  uint64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained remoteShutterPauseCapture:v3];

  return (char)v3;
}

- (BOOL)cameraConnectionResumeCapture:(id)a3
{
  uint64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained remoteShutterResumeCapture:v3];

  return (char)v3;
}

- (BOOL)cameraConnectionStopCapture:(id)a3
{
  uint64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained remoteShutterStopCapture:v3];

  return (char)v3;
}

- (void)cameraConnectionSuspend:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v5 = [WeakRetained remoteShutterShouldSuspendApp:self];

  uint64_t v6 = os_log_create("com.apple.camera", "Camera");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Suspending camera for -[CCCameraConnection cameraConnectionSuspend:]", buf, 2u);
    }

    uint64_t v6 = [MEMORY[0x263F82438] sharedApplication];
    [v6 suspend];
  }
  else if (v7)
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring -[CCCameraConnection cameraConnectionSuspend:]", v8, 2u);
  }
}

- (BOOL)cameraConnectionIsMirrored:(id)a3
{
  return (self->_captureDevice < 0xCuLL) & (0xF02u >> self->_captureDevice);
}

- (int64_t)cameraConnectionOrientation:(id)a3
{
  uint64_t v3 = [(CAMRemoteShutterController *)self _motionController];
  int64_t v4 = [v3 captureOrientation];

  return v4;
}

- (BOOL)cameraConnectionZoomSupport:(id)a3
{
  return (self->_captureMode < 5uLL) & (0x17u >> self->_captureMode);
}

- (void)cameraConnection:(id)a3 setZoomAmount:(double)a4
{
  self->_zoomAmount = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutter:self setZoomAmount:a4];
}

- (double)cameraConnectionZoomAmount:(id)a3
{
  return self->_zoomAmount;
}

- (void)_refreshZoomMagnificationState
{
  *(_WORD *)&self->_currentZoomMagnificationAllowed = 0;
  p_currentContinuousZoomFactors = &self->_currentContinuousZoomFactors;
  currentContinuousZoomFactors = self->_currentContinuousZoomFactors;
  self->_currentContinuousZoomFactors = 0;

  p_currentContinuousDisplayZoomFactors = &self->_currentContinuousDisplayZoomFactors;
  currentContinuousDisplayZoomFactors = self->_currentContinuousDisplayZoomFactors;
  self->_currentContinuousDisplayZoomFactors = 0;

  int64_t v7 = [(CAMCaptureGraphConfiguration *)self->_currentGraphConfiguration mode];
  int64_t v8 = [(CAMCaptureGraphConfiguration *)self->_currentGraphConfiguration device];
  int64_t v9 = [(CAMCaptureGraphConfiguration *)self->_currentGraphConfiguration videoConfiguration];
  v10 = +[CAMCaptureCapabilities capabilities];
  int64_t v11 = objc_msgSend(v10, "resolvedDeviceForDesiredDevice:mode:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", v8, v7, v9, -[CAMCaptureGraphConfiguration videoStabilizationStrength](self->_currentGraphConfiguration, "videoStabilizationStrength"), -[CAMCaptureGraphConfiguration enableStereoVideoCapture](self->_currentGraphConfiguration, "enableStereoVideoCapture"));
  self->_int64_t currentResolvedDevice = v11;
  if (objc_msgSend(v10, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", v7, v11, v9, -[CAMCaptureGraphConfiguration videoStabilizationStrength](self->_currentGraphConfiguration, "videoStabilizationStrength")))
  {
    int64_t currentResolvedDevice = self->_currentResolvedDevice;
    int64_t v13 = [(CAMCaptureGraphConfiguration *)self->_currentGraphConfiguration videoStabilizationStrength];
    id v27 = 0;
    id v28 = 0;
    BOOL v14 = +[CAMZoomControlUtilities shouldApplyContinuousZoomForMode:v7 device:currentResolvedDevice videoConfiguration:v9 videoStabilizationStrength:v13 zoomFactors:&v28 displayZoomFactors:&v27];
    id v15 = v28;
    id v26 = v28;
    id v16 = v27;
    id v17 = v27;
    if (v14)
    {
      self->_currentZoomMagnificationAllowed = 1;
      objc_storeStrong((id *)p_currentContinuousZoomFactors, v15);
      objc_storeStrong((id *)&self->_currentContinuousDisplayZoomFactors, v16);
      BOOL v18 = +[CAMZoomControlUtilities shouldEmulateTripleCameraZoomForMode:v7 device:self->_currentResolvedDevice videoConfiguration:v9 videoStabilizationStrength:[(CAMCaptureGraphConfiguration *)self->_currentGraphConfiguration videoStabilizationStrength]];
      self->_currentlyEmulatingMulticam = v18 | +[CAMZoomControlUtilities shouldEmulateWideDualCameraZoomForMode:v7 device:self->_currentResolvedDevice videoConfiguration:v9 videoStabilizationStrength:[(CAMCaptureGraphConfiguration *)self->_currentGraphConfiguration videoStabilizationStrength]];
      if (objc_msgSend(v10, "isCustomLensSupportedForMode:device:isTrueVideo:", v7, self->_currentResolvedDevice, -[CAMCaptureGraphConfiguration trueVideoEnabled](self->_currentGraphConfiguration, "trueVideoEnabled")))
      {
        v19 = +[CAMUserPreferences preferences];
        v20 = [v19 customLensGroup];
        v21 = +[CAMZoomPoint zoomPointsWithFactors:v26 displayZoomFactors:v17 customLensGroup:v20];
        uint64_t v22 = +[CAMZoomPoint zoomFactorsFromZoomPoints:v21];
        v23 = *p_currentContinuousZoomFactors;
        *p_currentContinuousZoomFactors = (NSArray *)v22;

        uint64_t v24 = +[CAMZoomPoint displayZoomFactorsFromZoomPoints:v21];
        v25 = *p_currentContinuousDisplayZoomFactors;
        *p_currentContinuousDisplayZoomFactors = (NSArray *)v24;
      }
    }
  }
}

- (double)_displayZoomValueForZoomFactor:(double)result
{
  if (self->_currentContinuousZoomFactors)
  {
    if (self->_currentContinuousDisplayZoomFactors) {
      +[CAMZoomControlUtilities piecewiseLinearMappingForX:fromXValues:toYValues:](CAMZoomControlUtilities, "piecewiseLinearMappingForX:fromXValues:toYValues:", result);
    }
  }
  return result;
}

- (double)_zoomFactorForDisplayZoomValue:(double)result
{
  if (self->_currentContinuousZoomFactors)
  {
    if (self->_currentContinuousDisplayZoomFactors) {
      +[CAMZoomControlUtilities piecewiseLinearMappingForX:fromXValues:toYValues:](CAMZoomControlUtilities, "piecewiseLinearMappingForX:fromXValues:toYValues:", result);
    }
  }
  return result;
}

- (BOOL)cameraConnectionIsSpatialCapture:(id)a3
{
  return self->_spatialEnabled;
}

- (BOOL)cameraConnectionZoomMagnificationSupport:(id)a3
{
  [(CAMRemoteShutterController *)self _refreshZoomMagnificationState];
  int64_t v4 = +[CAMCaptureCapabilities capabilities];
  if ([v4 zoomControlSupported])
  {
    BOOL v5 = 0;
    switch(self->_captureMode)
    {
      case 0:
      case 1:
      case 4:
        goto LABEL_3;
      case 6:
        if (![v4 continuousZoomSupportedForPortraitMode]) {
          goto LABEL_9;
        }
        goto LABEL_3;
      case 7:
        if (([v4 continuousZoomSupportedForCinematicMode] & 1) == 0) {
          goto LABEL_9;
        }
LABEL_3:
        unint64_t v6 = self->_currentResolvedDevice - 1;
        if (v6 < 0xB && ((0x781u >> v6) & 1) != 0) {
          goto LABEL_9;
        }
        BOOL v5 = !self->_currentlyEmulatingMulticam;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_9:
    BOOL v5 = 0;
  }

  return v5;
}

- (void)cameraConnection:(id)a3 setZoomMagnificationAmount:(double)a4
{
  -[CAMRemoteShutterController _zoomFactorForDisplayZoomValue:](self, "_zoomFactorForDisplayZoomValue:", a3, a4);
  double v6 = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutter:self setZoomFactor:v6];
}

- (double)cameraConnectionMinimumZoomMagnification:(id)a3
{
  uint64_t v3 = [(CAMRemoteShutterController *)self currentContinuousDisplayZoomFactors];
  int64_t v4 = [v3 firstObject];

  if (v4)
  {
    [v4 floatValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

- (double)cameraConnectionMaximumZoomMagnification:(id)a3
{
  uint64_t v3 = [(CAMRemoteShutterController *)self currentContinuousDisplayZoomFactors];
  int64_t v4 = [v3 lastObject];

  if (v4)
  {
    [v4 floatValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

- (id)cameraConnectionSignificantZoomMagnifications:(id)a3
{
  return self->_currentContinuousDisplayZoomFactors;
}

- (double)cameraConnectionCurrentZoomMagnification:(id)a3
{
  -[CAMRemoteShutterController _displayZoomValueForZoomFactor:](self, "_displayZoomValueForZoomFactor:", a3, self->_zoomFactor);
  return result;
}

- (int64_t)cameraConnectionFlashSupport:(id)a3
{
  unint64_t captureMode = self->_captureMode;
  BOOL v4 = captureMode > 7;
  uint64_t v5 = (1 << captureMode) & 0xD7;
  if (v4 || v5 == 0) {
    return 0;
  }
  int64_t v8 = +[CAMCaptureCapabilities capabilities];
  int64_t v9 = v8;
  unint64_t v10 = self->_captureDevice - 1;
  if (v10 > 0xA) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = qword_209C7AD68[v10];
  }
  if ([v8 isFlashSupportedForDevicePosition:v11]) {
    int64_t v12 = 2;
  }
  else {
    int64_t v12 = 0;
  }

  return v12;
}

- (int64_t)cameraConnectionFlashMode:(id)a3
{
  int64_t flashMode = self->_flashMode;
  if (flashMode == 1) {
    return 1;
  }
  else {
    return 2 * (flashMode != 0);
  }
}

- (int64_t)cameraConnectionHDRSupport:(id)a3
{
  BOOL v4 = +[CAMCaptureCapabilities capabilities];
  if (([v4 isHDRSettingAllowed] & 1) == 0 && (objc_msgSend(v4, "isModernHDRSupported") & 1) != 0
    || ((captureMode = self->_captureMode, BOOL v6 = captureMode > 9, v7 = (1 << captureMode) & 0x211, !v6)
      ? (BOOL v8 = v7 == 0)
      : (BOOL v8 = 1),
        v8))
  {
    int64_t v11 = 0;
  }
  else
  {
    unint64_t v9 = self->_captureDevice - 1;
    if (v9 > 0xA) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = qword_209C7AD68[v9];
    }
    unsigned int v12 = [v4 isHDROnSupportedForDevicePosition:v10];
    int v13 = [v4 isAutomaticHDRSupportedForDevicePosition:v10];
    uint64_t v14 = 2;
    if (v12) {
      uint64_t v14 = 3;
    }
    if (v13) {
      int64_t v11 = v14;
    }
    else {
      int64_t v11 = v12;
    }
  }

  return v11;
}

- (int64_t)cameraConnectionHDRMode:(id)a3
{
  int64_t hdrMode = self->_hdrMode;
  if (hdrMode == 1) {
    return 1;
  }
  else {
    return 2 * (hdrMode != 0);
  }
}

- (int64_t)cameraConnectionIrisSupport:(id)a3
{
  BOOL v4 = +[CAMCaptureCapabilities capabilities];
  uint64_t v5 = v4;
  unint64_t v6 = self->_captureDevice - 1;
  if (v6 > 0xA) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_209C7AD68[v6];
  }
  if ([v4 isLivePhotoSupportedForMode:self->_captureMode devicePosition:v7])
  {
    if ([v5 isLivePhotoAutoModeSupported]) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)cameraConnectionIrisMode:(id)a3
{
  int64_t irisMode = self->_irisMode;
  if (irisMode == 2) {
    return 2;
  }
  else {
    return irisMode == 1;
  }
}

- (BOOL)cameraConnectionBurstSupport:(id)a3
{
  BOOL v4 = +[CAMCaptureCapabilities capabilities];
  LOBYTE(self) = objc_msgSend(v4, "isBurstSupportedForMode:device:", -[CAMRemoteShutterController captureMode](self, "captureMode"), -[CAMRemoteShutterController captureDevice](self, "captureDevice"));

  return (char)self;
}

- (BOOL)cameraConnectionSupportsMomentCapture:(id)a3
{
  BOOL v4 = +[CAMCaptureCapabilities capabilities];
  LOBYTE(self) = objc_msgSend(v4, "isCTMVideoCaptureSupportedForMode:", -[CAMRemoteShutterController captureMode](self, "captureMode"));

  return (char)self;
}

- (BOOL)cameraConnectionToggleCameraDeviceSupport:(id)a3
{
  unint64_t captureMode = self->_captureMode;
  BOOL v4 = captureMode > 5;
  uint64_t v5 = (1 << captureMode) & 0x33;
  if (v4 || v5 == 0) {
    return 0;
  }
  uint64_t v7 = +[CAMCaptureCapabilities capabilities];
  if ([v7 isBackCameraSupported]) {
    char v8 = [v7 isFrontCameraSupported];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (void)cameraConnectionToggleCameraDevice:(id)a3
{
  unint64_t v4 = self->_captureDevice - 1;
  if (v4 > 0xA) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = qword_209C7ADC0[v4];
  }
  self->_captureDevice = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutter:self setCaptureDevice:self->_captureDevice];
}

- (void)cameraConnection:(id)a3 setFlashMode:(int64_t)a4
{
  int64_t v5 = a4 == 1;
  if (a4 == 2) {
    int64_t v5 = 2;
  }
  self->_int64_t flashMode = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutter:self setFlashMode:self->_flashMode];
}

- (void)cameraConnection:(id)a3 setHDRMode:(int64_t)a4
{
  int64_t v5 = a4 == 1;
  if (a4 == 2) {
    int64_t v5 = 2;
  }
  self->_int64_t hdrMode = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutter:self setHDRMode:self->_hdrMode];
}

- (void)cameraConnection:(id)a3 setIrisMode:(int64_t)a4
{
  int64_t v5 = a4 == 1;
  if (a4 == 2) {
    int64_t v5 = 2;
  }
  self->_int64_t irisMode = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutter:self setIrisMode:self->_irisMode];
}

- (BOOL)cameraConnectionIsShowingLivePreview:(id)a3
{
  return self->_showingPreview;
}

- (int64_t)cameraConnectionSharedLibrarySupport:(id)a3
{
  return self->_sharedLibrarySupported;
}

- (int64_t)cameraConnectionSharedLibraryMode:(id)a3
{
  return CAMSharedLibraryModeIsOn(self->_sharedLibraryMode);
}

- (void)cameraConnection:(id)a3 setSharedLibraryMode:(int64_t)a4
{
  int64_t v5 = 2 * (a4 == 1);
  if (!a4) {
    int64_t v5 = 3;
  }
  self->_sharedLibraryMode = v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteShutter:self setSharedLibraryMode:self->_sharedLibraryMode];
}

- (BOOL)isShowingPreview
{
  return self->_showingPreview;
}

- (CAMCaptureGraphConfiguration)currentGraphConfiguration
{
  return self->_currentGraphConfiguration;
}

- (void)setCurrentGraphConfiguration:(id)a3
{
}

- (NSArray)availableCaptureModes
{
  return self->_availableCaptureModes;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (int64_t)captureDevice
{
  return self->_captureDevice;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (int64_t)hdrMode
{
  return self->_hdrMode;
}

- (int64_t)irisMode
{
  return self->_irisMode;
}

- (BOOL)sharedLibrarySupported
{
  return self->_sharedLibrarySupported;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

- (double)zoomAmount
{
  return self->_zoomAmount;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (void)setZoomFactor:(double)a3
{
  self->_zoomFactor = a3;
}

- (int64_t)shallowDepthOfFieldStatus
{
  return self->_shallowDepthOfFieldStatus;
}

- (BOOL)spatialEnabled
{
  return self->_spatialEnabled;
}

- (BOOL)isCapturingVideo
{
  return self->_capturingVideo;
}

- (void)setCapturingVideo:(BOOL)a3
{
  self->_capturingVideo = a3;
}

- (BOOL)isCapturingTimelapse
{
  return self->_capturingTimelapse;
}

- (void)setCapturingTimelapse:(BOOL)a3
{
  self->_capturingTimelapse = a3;
}

- (CAMRemoteShutterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMRemoteShutterDelegate *)WeakRetained;
}

- (CCCameraConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (BOOL)currentZoomMagnificationAllowed
{
  return self->_currentZoomMagnificationAllowed;
}

- (void)setCurrentZoomMagnificationAllowed:(BOOL)a3
{
  self->_currentZoomMagnificationAllowed = a3;
}

- (int64_t)currentResolvedDevice
{
  return self->_currentResolvedDevice;
}

- (void)setCurrentResolvedDevice:(int64_t)a3
{
  self->_int64_t currentResolvedDevice = a3;
}

- (BOOL)currentlyEmulatingMulticam
{
  return self->_currentlyEmulatingMulticam;
}

- (void)setCurrentlyEmulatingMulticam:(BOOL)a3
{
  self->_currentlyEmulatingMulticam = a3;
}

- (NSArray)currentContinuousZoomFactors
{
  return self->_currentContinuousZoomFactors;
}

- (void)setCurrentContinuousZoomFactors:(id)a3
{
}

- (NSArray)currentContinuousDisplayZoomFactors
{
  return self->_currentContinuousDisplayZoomFactors;
}

- (void)setCurrentContinuousDisplayZoomFactors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContinuousDisplayZoomFactors, 0);
  objc_storeStrong((id *)&self->_currentContinuousZoomFactors, 0);
  objc_storeStrong((id *)&self->__motionController, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_availableCaptureModes, 0);
  objc_storeStrong((id *)&self->_currentGraphConfiguration, 0);
}

@end