@interface RPScreenRecorder
+ (RPScreenRecorder)sharedRecorder;
- (BOOL)checkContextID:(id)a3 withHandler:(id)a4;
- (BOOL)hasUserConsentForCamera;
- (BOOL)hasUserConsentForMicrophone;
- (BOOL)isAvailable;
- (BOOL)isCameraEnabled;
- (BOOL)isConnectionInterruptedOrInvalid:(id)a3;
- (BOOL)isMicrophoneEnabled;
- (BOOL)isPaused;
- (BOOL)isRecording;
- (BOOL)screenRecordingAllowed;
- (BOOL)screenRecordingSupportedOnDevice;
- (BOOL)shouldNotifyDidStop;
- (BOOL)systemRecording;
- (CGSize)currentWindowSize;
- (NSString)previousAudioCategory;
- (NSURL)broadcastURL;
- (RPBroadcastController)activeBroadcastController;
- (RPCameraPosition)cameraPosition;
- (RPPipViewController)pipViewController;
- (RPScreenCaptureKitContentSharingPickerDelegate)screenCaptureKitContentSharingPickerDelegate;
- (RPScreenCaptureKitControlCenterManagerDelegate)screenCaptureKitControlCenterManagerDelegate;
- (RPScreenRecorder)init;
- (RPScreenRecorderDelegate)secondDelegate;
- (RPScreenRecorderPrivateDelegate)privateDelegate;
- (RPScreenRecorderScreenCapureKitDelegate)screenCaptureKitDelegate;
- (RPScreenRecorderScreenCapureKitPreviewDelegate)screenCaptureKitPreviewDelegate;
- (RPScreenRecorderScreenCapureKitRecordingOutputDelegate)screenCaptureKitRecordingOutputDelegate;
- (UIView)cameraPreviewView;
- (UIWindow)windowToRecord;
- (id)applicationWindow;
- (id)audioQueue;
- (id)captureHandler;
- (id)currentWindowLayerContextID;
- (id)delegate;
- (id)handleUnavailableState;
- (id)processQueue;
- (id)saveVideoToCameraRollCompletionBlock;
- (id)videoQueue;
- (int)processIDForAudioCapture;
- (unint64_t)previousAudioSessionOptions;
- (void)captureHandlerWithAudioSample:(id)a3 bufferType:(int64_t)a4;
- (void)captureHandlerWithSample:(id)a3 timingData:(id)a4;
- (void)clientDidUpdateBroadcastServiceInfo:(id)a3;
- (void)dealloc;
- (void)didStopRecordingWithError:(id)a3 previewViewController:(id)a4;
- (void)discardRecordingWithHandler:(void *)handler;
- (void)exportClipToURL:(NSURL *)url duration:(NSTimeInterval)duration completionHandler:(void *)completionHandler;
- (void)handleUnavailableState;
- (void)instantiatePipView;
- (void)isScreenRecordingAvailable;
- (void)notifyDelegateOfUpdatedState;
- (void)pauseInAppBroadcast;
- (void)pauseInAppCapture;
- (void)pauseInAppRecording;
- (void)recordingDidPause;
- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4;
- (void)recordingLockInterrupted:(id)a3;
- (void)recordingTimerDidUpdate:(id)a3;
- (void)registerAppForStateChangeSetRotationLock:(BOOL)a3;
- (void)removePipView;
- (void)resumeInAppBroadcast;
- (void)resumeInAppCapture;
- (void)resumeInAppClip;
- (void)resumeInAppRecording;
- (void)resumeSystemBroadcast;
- (void)resumeSystemRecording;
- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4;
- (void)saveVideo:(id)a3 handler:(id)a4;
- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4;
- (void)setActiveBroadcastController:(id)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setBroadcastURL:(id)a3;
- (void)setCameraEnabled:(BOOL)cameraEnabled;
- (void)setCameraPosition:(RPCameraPosition)cameraPosition;
- (void)setCameraPreviewView:(id)a3;
- (void)setCaptureHandler:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setHasUserConsentForCamera:(BOOL)a3;
- (void)setHasUserConsentForMicrophone:(BOOL)a3;
- (void)setMicrophoneEnabled:(BOOL)microphoneEnabled;
- (void)setPaused:(BOOL)a3;
- (void)setPipViewController:(id)a3;
- (void)setPreviousAudioCategory:(id)a3;
- (void)setPreviousAudioSessionOptions:(unint64_t)a3;
- (void)setPrivateDelegate:(id)a3;
- (void)setRecording:(BOOL)a3;
- (void)setSaveVideoToCameraRollCompletionBlock:(id)a3;
- (void)setScreenCaptureKitContentSharingPickerDelegate:(id)a3;
- (void)setScreenCaptureKitControlCenterManagerDelegate:(id)a3;
- (void)setScreenCaptureKitDelegate:(id)a3;
- (void)setScreenCaptureKitPreviewDelegate:(id)a3;
- (void)setScreenCaptureKitRecordingOutputDelegate:(id)a3;
- (void)setSecondDelegate:(id)a3;
- (void)setSystemRecording:(BOOL)a3;
- (void)setWindowRotationLocked:(BOOL)a3;
- (void)setWindowToRecord:(id)a3;
- (void)setupSystemBroadcastWithExtension:(id)a3 handler:(id)a4;
- (void)shouldResumeSessionType:(id)a3;
- (void)startCaptureWithHandler:(void *)captureHandler completionHandler:(void *)completionHandler;
- (void)startClipBufferingWithCompletionHandler:(void *)completionHandler;
- (void)startInAppBroadcastWithHandler:(id)a3;
- (void)startRecordingWithHandler:(void *)handler;
- (void)startRecordingWithMicrophoneEnabled:(BOOL)microphoneEnabled handler:(void *)handler;
- (void)startSystemBroadcastWithHandler:(id)a3;
- (void)startSystemRecordingWithMicrophoneEnabled:(BOOL)a3 handler:(id)a4;
- (void)stopCaptureWithHandler:(void *)handler;
- (void)stopClipBufferingWithCompletionHandler:(void *)completionHandler;
- (void)stopInAppBroadcastWithHandler:(id)a3;
- (void)stopRecordingWithAdditionalShareFileAttachment:(id)a3 overrideShareMessage:(id)a4 previewViewControllerOverrideTintColor:(id)a5 handler:(id)a6;
- (void)stopRecordingWithHandler:(void *)handler;
- (void)stopRecordingWithOutputURL:(NSURL *)url completionHandler:(void *)completionHandler;
- (void)stopRecordingWithVideoURLHandler:(id)a3;
- (void)stopSystemBroadcastWithHandler:(id)a3;
- (void)stopSystemRecording:(id)a3;
- (void)stopSystemRecordingWithURLHandler:(id)a3;
- (void)updateProcessIDForAudioCapture:(int)a3;
- (void)updateRecordingAvailability:(id)a3;
- (void)updateScreenRecordingStateWithCurrentState:(id)a3;
- (void)updateStateWithActive:(BOOL)a3 error:(id)a4;
@end

@implementation RPScreenRecorder

- (RPScreenRecorder)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5.receiver = self;
  v5.super_class = (Class)RPScreenRecorder;
  v2 = [(RPScreenRecorder *)&v5 init];
  if (v2)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v7 = "-[RPScreenRecorder init]";
      __int16 v8 = 1024;
      int v9 = 135;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
    }
    *(_WORD *)(v2 + 9) = 0;
    v2[15] = 0;
    *((_WORD *)v2 + 6) = 0;
    v3 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = 0;

    v2[8] = 1;
    [v2 updateStateWithActive:0 error:0];
    [v2 isScreenRecordingAvailable];
  }
  return (RPScreenRecorder *)v2;
}

- (void)setDelegate:(id)delegate
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = delegate;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446722;
    uint64_t v10 = "-[RPScreenRecorder setDelegate:]";
    __int16 v11 = 1024;
    int v12 = 165;
    __int16 v13 = 2048;
    id v14 = v4;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d delegate %p", (uint8_t *)&v9, 0x1Cu);
  }
  id v5 = objc_storeWeak((id *)&self->_delegate, v4);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL available = self->_available;
      int v9 = 136446722;
      uint64_t v10 = "-[RPScreenRecorder setDelegate:]";
      __int16 v11 = 1024;
      int v12 = 168;
      __int16 v13 = 1024;
      LODWORD(v14) = available;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify client available %d", (uint8_t *)&v9, 0x18u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained screenRecorderDidChangeAvailability:self];
  }
}

- (void)setSecondDelegate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446722;
    __int16 v8 = "-[RPScreenRecorder setSecondDelegate:]";
    __int16 v9 = 1024;
    int v10 = 174;
    __int16 v11 = 2048;
    id v12 = v5;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d secondDelegate %p", (uint8_t *)&v7, 0x1Cu);
  }
  objc_storeStrong((id *)&self->_secondDelegate, a3);
  if (objc_opt_respondsToSelector())
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      BOOL available = self->_available;
      int v7 = 136446722;
      __int16 v8 = "-[RPScreenRecorder setSecondDelegate:]";
      __int16 v9 = 1024;
      int v10 = 177;
      __int16 v11 = 1024;
      LODWORD(v12) = available;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify client available %d", (uint8_t *)&v7, 0x18u);
    }
    [(RPScreenRecorderDelegate *)self->_secondDelegate screenRecorderDidChangeAvailability:self];
  }
}

- (void)setMicrophoneEnabled:(BOOL)microphoneEnabled
{
  BOOL v3 = microphoneEnabled;
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446978;
    int v7 = "-[RPScreenRecorder setMicrophoneEnabled:]";
    __int16 v8 = 1024;
    int v9 = 183;
    __int16 v10 = 1024;
    BOOL v11 = v3;
    __int16 v12 = 1024;
    BOOL v13 = [(RPScreenRecorder *)self isMicrophoneEnabled];
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d :%d from current mic state:%d", (uint8_t *)&v6, 0x1Eu);
  }
  if (self->_microphoneEnabled != v3)
  {
    if ([(RPScreenRecorder *)self systemRecording])
    {
      id v5 = +[RPDaemonProxy daemonProxy];
      [v5 setMicrophoneEnabled:v3];
    }
    self->_microphoneEnabled = v3;
  }
  [(RPScreenRecorder *)self notifyDelegateOfUpdatedState];
}

+ (RPScreenRecorder)sharedRecorder
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__RPScreenRecorder_sharedRecorder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRecorder_onceToken != -1) {
    dispatch_once(&sharedRecorder_onceToken, block);
  }
  if (!__RPLogLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v7 = "+[RPScreenRecorder sharedRecorder]";
    __int16 v8 = 1024;
    int v9 = 228;
    __int16 v10 = 2048;
    id v11 = a1;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d Accessing the sharedRecorder %p", buf, 0x1Cu);
  }
  BOOL v3 = (void *)sharedRecorder_replayRecorder;

  return (RPScreenRecorder *)v3;
}

uint64_t __34__RPScreenRecorder_sharedRecorder__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedRecorder_replayRecorder;
  sharedRecorder_replayRecorder = (uint64_t)v0;

  v2 = [(id)sharedRecorder_replayRecorder processQueue];
  dispatch_async(v2, &__block_literal_global_3);

  BOOL v3 = (void *)sharedRecorder_replayRecorder;

  return [v3 setCameraPosition:1];
}

void __34__RPScreenRecorder_sharedRecorder__block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 addObserver:sharedRecorder_replayRecorder selector:sel_updateRecordingAvailability_ name:*MEMORY[0x263F536E0] object:0];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v6 = "-[RPScreenRecorder dealloc]";
    __int16 v7 = 1024;
    int v8 = 233;
    __int16 v9 = 2048;
    __int16 v10 = self;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RPScreenRecorder;
  [(RPScreenRecorder *)&v4 dealloc];
}

- (BOOL)isAvailable
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    BOOL available = self->_available;
    int v5 = 136446722;
    int v6 = "-[RPScreenRecorder isAvailable]";
    __int16 v7 = 1024;
    int v8 = 240;
    __int16 v9 = 1024;
    BOOL v10 = available;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d isAvailable %d", (uint8_t *)&v5, 0x18u);
  }
  if (self->_available) {
    return 1;
  }
  [(RPScreenRecorder *)self isScreenRecordingAvailable];
  return self->_available;
}

- (void)startRecordingWithMicrophoneEnabled:(BOOL)microphoneEnabled handler:(void *)handler
{
  BOOL v4 = microphoneEnabled;
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v6 = handler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    int v8 = "-[RPScreenRecorder startRecordingWithMicrophoneEnabled:handler:]";
    __int16 v9 = 1024;
    int v10 = 251;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  [(RPScreenRecorder *)self setMicrophoneEnabled:v4];
  [(RPScreenRecorder *)self startRecordingWithHandler:v6];
}

- (void)stopRecordingWithVideoURLHandler:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    int v6 = "-[RPScreenRecorder stopRecordingWithVideoURLHandler:]";
    __int16 v7 = 1024;
    int v8 = 261;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  [(RPScreenRecorder *)self stopSystemRecordingWithURLHandler:v4];
}

- (void)stopRecordingWithAdditionalShareFileAttachment:(id)a3 overrideShareMessage:(id)a4 previewViewControllerOverrideTintColor:(id)a5 handler:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446466;
    uint64_t v15 = "-[RPScreenRecorder stopRecordingWithAdditionalShareFileAttachment:overrideShareMessage:previewViewControllerOv"
          "errideTintColor:handler:]";
    __int16 v16 = 1024;
    int v17 = 274;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v14, 0x12u);
  }
  [(RPScreenRecorder *)self stopRecordingWithHandler:v13];
}

- (void)startRecordingWithHandler:(void *)handler
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = handler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPScreenRecorder startRecordingWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 280;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder startRecordingWithHandler:]();
    }
    uint64_t v5 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5830 userInfo:0];
  }
  else
  {
    if (self->_available)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __46__RPScreenRecorder_startRecordingWithHandler___block_invoke;
      v7[3] = &unk_26451D9B8;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(MEMORY[0x263EF83A0], v7);

      goto LABEL_12;
    }
    if (!v4) {
      goto LABEL_12;
    }
    uint64_t v5 = [(RPScreenRecorder *)self handleUnavailableState];
  }
  int v6 = (void *)v5;
  (*((void (**)(void *, uint64_t))v4 + 2))(v4, v5);

LABEL_12:
}

void __46__RPScreenRecorder_startRecordingWithHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentWindowLayerContextID];
  [*(id *)(a1 + 32) currentWindowSize];
  double v4 = v3;
  double v6 = v5;
  if ([*(id *)(a1 + 32) checkContextID:v2 withHandler:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) registerAppForStateChangeSetRotationLock:1];
    uint64_t v7 = [*(id *)(a1 + 32) isCameraEnabled];
    uint64_t v8 = [*(id *)(a1 + 32) isMicrophoneEnabled];
    uint64_t v9 = +[RPDaemonProxy daemonProxy];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_2;
    v11[3] = &unk_26451D990;
    id v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    objc_msgSend(v9, "startInAppRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v2, v8, v7, v11, v4, v6);
  }
}

void __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (v7)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_2_cold_1();
    }
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPScreenRecorder startRecordingWithHandler:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 313;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  [*(id *)(a1 + 32) setHasUserConsentForCamera:a3];
  [*(id *)(a1 + 32) setHasUserConsentForMicrophone:a4];
  uint64_t v8 = *(unsigned char **)(a1 + 32);
  if (a3) {
    BOOL v9 = v8[11] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  [v8 setCameraEnabled:v9];
  id v10 = *(unsigned char **)(a1 + 32);
  if (a4) {
    BOOL v11 = v10[10] != 0;
  }
  else {
    BOOL v11 = 0;
  }
  [v10 setMicrophoneEnabled:v11];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_9;
  v15[3] = &unk_26451D968;
  char v19 = a3;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 40);
  id v16 = v7;
  uint64_t v17 = v12;
  id v18 = v13;
  id v14 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 40) instantiatePipView];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  [*(id *)(a1 + 40) updateStateWithActive:1 error:v2];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    double v4 = *(void (**)(void))(v3 + 16);
    v4();
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_9_cold_1();
  }
}

- (void)stopRecordingWithHandler:(void *)handler
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v4 = handler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPScreenRecorder stopRecordingWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 347;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    [(RPScreenRecorder *)self setWindowRotationLocked:0];
    double v5 = +[RPDaemonProxy daemonProxy];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke;
    v7[3] = &unk_26451DA08;
    v7[4] = self;
    id v8 = v4;
    [v5 stopInAppRecordingWithHandler:v7];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder stopRecordingWithHandler:]();
    }
    double v6 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5829 userInfo:0];
    (*((void (**)(void *, void, void *))v4 + 2))(v4, 0, v6);
  }
}

void __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) updateStateWithActive:0 error:v6];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    if (v6)
    {
      if (__RPLogLevel <= 2)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_cold_1(v6);
        }
        uint64_t v7 = *(void *)(a1 + 40);
      }
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
    else if (v5)
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v12 = "-[RPScreenRecorder stopRecordingWithHandler:]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 365;
        _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop recording successful", buf, 0x12u);
      }
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_12;
      v8[3] = &unk_26451D9B8;
      id v9 = v5;
      id v10 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x263EF83A0], v8);
    }
  }
}

void __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_12(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_2;
  v2[3] = &unk_26451D9E0;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  +[RPPreviewViewController loadPreviewViewControllerWithMovieURL:v1 attachmentURL:0 overrideShareMessage:0 overrideTintColor:0 completion:v2];
}

void __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    uint64_t v7 = "-[RPScreenRecorder stopRecordingWithHandler:]_block_invoke_2";
    __int16 v8 = 1024;
    int v9 = 381;
    __int16 v10 = 1024;
    BOOL v11 = v5 == 1;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d shouldApplyPadUILayout=%d", (uint8_t *)&v6, 0x18u);
  }
  if (v5 == 1) {
    [v3 setModalPresentationStyle:7];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopRecordingWithOutputURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v6 = url;
  uint64_t v7 = completionHandler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v13 = "-[RPScreenRecorder stopRecordingWithOutputURL:completionHandler:]";
    __int16 v14 = 1024;
    int v15 = 400;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[RPScreenRecorder stopRecordingWithOutputURL:completionHandler:]();
      if (!v7) {
        goto LABEL_12;
      }
    }
    else if (!v7)
    {
      goto LABEL_12;
    }
    int v9 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5829 userInfo:0];
    v7[2](v7, v9);

    goto LABEL_12;
  }
  if (!self->_systemRecording) {
    [(RPScreenRecorder *)self setWindowRotationLocked:0];
  }
  __int16 v8 = +[RPDaemonProxy daemonProxy];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__RPScreenRecorder_stopRecordingWithOutputURL_completionHandler___block_invoke;
  v10[3] = &unk_26451DA30;
  v10[4] = self;
  BOOL v11 = v7;
  [v8 stopInAppRecordingWithUrl:v6 handler:v10];

LABEL_12:
}

void __65__RPScreenRecorder_stopRecordingWithOutputURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) setRecording:0];
  [*(id *)(a1 + 32) updateProcessIDForAudioCapture:0];
  [*(id *)(a1 + 32) updateStateWithActive:0 error:v4];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)discardRecordingWithHandler:(void *)handler
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = handler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    uint64_t v7 = "-[RPScreenRecorder discardRecordingWithHandler:]";
    __int16 v8 = 1024;
    int v9 = 428;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  if (!self->_recording)
  {
    uint64_t v5 = +[RPDaemonProxy daemonProxy];
    [v5 discardInAppRecordingWithHandler:v4];
  }
}

- (void)pauseInAppRecording
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[RPScreenRecorder pauseInAppRecording]";
    __int16 v6 = 1024;
    int v7 = 436;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  if (self->_recording && !self->_paused)
  {
    uint64_t v3 = +[RPDaemonProxy daemonProxy];
    [v3 pauseInAppRecording];
  }
}

- (void)resumeInAppRecording
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    BOOL recording = self->_recording;
    BOOL paused = self->_paused;
    *(_DWORD *)buf = 136446978;
    int v9 = "-[RPScreenRecorder resumeInAppRecording]";
    __int16 v10 = 1024;
    int v11 = 444;
    __int16 v12 = 1024;
    BOOL v13 = recording;
    __int16 v14 = 1024;
    BOOL v15 = paused;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recording %d paused %d", buf, 0x1Eu);
  }
  if (self->_recording && self->_paused)
  {
    uint64_t v5 = +[RPDaemonProxy daemonProxy];
    __int16 v6 = [(RPScreenRecorder *)self currentWindowLayerContextID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__RPScreenRecorder_resumeInAppRecording__block_invoke;
    v7[3] = &unk_26451DA58;
    v7[4] = self;
    [v5 resumeInAppRecordingWithWindowLayerContextID:v6 completionHandler:v7];
  }
}

void __40__RPScreenRecorder_resumeInAppRecording__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  [*(id *)(a1 + 32) setPaused:0];
  if (v7)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446722;
      BOOL v13 = "-[RPScreenRecorder resumeInAppRecording]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 450;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d can not resume with error %@", (uint8_t *)&v12, 0x1Cu);
    }
    [*(id *)(a1 + 32) recordingDidStopWithError:v7 movieURL:0];
  }
  [*(id *)(a1 + 32) setHasUserConsentForCamera:a3];
  [*(id *)(a1 + 32) setHasUserConsentForMicrophone:a4];
  uint64_t v8 = *(unsigned char **)(a1 + 32);
  if (a3) {
    BOOL v9 = v8[11] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  [v8 setCameraEnabled:v9];
  __int16 v10 = *(unsigned char **)(a1 + 32);
  if (a4) {
    BOOL v11 = v10[10] != 0;
  }
  else {
    BOOL v11 = 0;
  }
  [v10 setMicrophoneEnabled:v11];
}

- (void)startCaptureWithHandler:(void *)captureHandler completionHandler:(void *)completionHandler
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  __int16 v6 = captureHandler;
  id v7 = completionHandler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v14 = "-[RPScreenRecorder startCaptureWithHandler:completionHandler:]";
    __int16 v15 = 1024;
    int v16 = 466;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder startCaptureWithHandler:completionHandler:]();
    }
    uint64_t v8 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5830 userInfo:0];
  }
  else
  {
    if (self->_available)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke;
      block[3] = &unk_26451DA80;
      block[4] = self;
      id v11 = v7;
      id v12 = v6;
      dispatch_async(MEMORY[0x263EF83A0], block);

      goto LABEL_12;
    }
    if (!v7) {
      goto LABEL_12;
    }
    uint64_t v8 = [(RPScreenRecorder *)self handleUnavailableState];
  }
  BOOL v9 = (void *)v8;
  (*((void (**)(void *, uint64_t))v7 + 2))(v7, v8);

LABEL_12:
}

void __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentWindowLayerContextID];
  [*(id *)(a1 + 32) currentWindowSize];
  double v4 = v3;
  double v6 = v5;
  if ([*(id *)(a1 + 32) checkContextID:v2 withHandler:*(void *)(a1 + 40)])
  {
    id v7 = (void *)[*(id *)(a1 + 48) copy];
    [*(id *)(a1 + 32) setCaptureHandler:v7];

    [*(id *)(a1 + 32) registerAppForStateChangeSetRotationLock:1];
    uint64_t v8 = [*(id *)(a1 + 32) isCameraEnabled];
    uint64_t v9 = [*(id *)(a1 + 32) isMicrophoneEnabled];
    __int16 v10 = +[RPDaemonProxy daemonProxy];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_2;
    v12[3] = &unk_26451D990;
    id v11 = *(void **)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = v11;
    objc_msgSend(v10, "startInAppCaptureWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v2, v9, v8, v12, v4, v6);
  }
}

void __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (v7)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_2_cold_1();
    }
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPScreenRecorder startCaptureWithHandler:completionHandler:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 502;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  [*(id *)(a1 + 32) setHasUserConsentForCamera:a3];
  [*(id *)(a1 + 32) setHasUserConsentForMicrophone:a4];
  uint64_t v8 = *(unsigned char **)(a1 + 32);
  if (a3) {
    BOOL v9 = v8[11] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  [v8 setCameraEnabled:v9];
  __int16 v10 = *(unsigned char **)(a1 + 32);
  if (a4) {
    BOOL v11 = v10[10] != 0;
  }
  else {
    BOOL v11 = 0;
  }
  [v10 setMicrophoneEnabled:v11];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_19;
  v15[3] = &unk_26451D968;
  char v19 = a3;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(a1 + 40);
  id v16 = v7;
  uint64_t v17 = v12;
  id v18 = v13;
  id v14 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_19(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 40) instantiatePipView];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  [*(id *)(a1 + 40) updateStateWithActive:1 error:v2];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    double v4 = *(void (**)(void))(v3 + 16);
    v4();
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_19_cold_1();
  }
}

- (void)stopCaptureWithHandler:(void *)handler
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v4 = handler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v10 = "-[RPScreenRecorder stopCaptureWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 537;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    double v5 = +[RPDaemonProxy daemonProxy];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__RPScreenRecorder_stopCaptureWithHandler___block_invoke;
    v7[3] = &unk_26451DA30;
    v7[4] = self;
    id v8 = v4;
    [v5 stopInAppCaptureWithHandler:v7];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder stopCaptureWithHandler:]();
    }
    double v6 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5829 userInfo:0];
    (*((void (**)(void *, void *))v4 + 2))(v4, v6);
  }
}

void __43__RPScreenRecorder_stopCaptureWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)pauseInAppCapture
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    double v5 = "-[RPScreenRecorder pauseInAppCapture]";
    __int16 v6 = 1024;
    int v7 = 556;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  if (self->_recording && !self->_paused)
  {
    uint64_t v3 = +[RPDaemonProxy daemonProxy];
    [v3 pauseInAppCapture];
  }
}

- (void)resumeInAppCapture
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    BOOL recording = self->_recording;
    BOOL paused = self->_paused;
    *(_DWORD *)buf = 136446978;
    BOOL v9 = "-[RPScreenRecorder resumeInAppCapture]";
    __int16 v10 = 1024;
    int v11 = 564;
    __int16 v12 = 1024;
    BOOL v13 = recording;
    __int16 v14 = 1024;
    BOOL v15 = paused;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recording %d paused %d", buf, 0x1Eu);
  }
  if (self->_recording && self->_paused)
  {
    double v5 = +[RPDaemonProxy daemonProxy];
    __int16 v6 = [(RPScreenRecorder *)self currentWindowLayerContextID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__RPScreenRecorder_resumeInAppCapture__block_invoke;
    v7[3] = &unk_26451DA58;
    v7[4] = self;
    [v5 resumeInAppCaptureWithWindowLayerContextID:v6 completionHandler:v7];
  }
}

void __38__RPScreenRecorder_resumeInAppCapture__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  [*(id *)(a1 + 32) setPaused:0];
  if (v7)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446722;
      BOOL v13 = "-[RPScreenRecorder resumeInAppCapture]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 570;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d can not resume with error %@", (uint8_t *)&v12, 0x1Cu);
    }
    [*(id *)(a1 + 32) recordingDidStopWithError:v7 movieURL:0];
  }
  [*(id *)(a1 + 32) setHasUserConsentForCamera:a3];
  [*(id *)(a1 + 32) setHasUserConsentForMicrophone:a4];
  uint64_t v8 = *(unsigned char **)(a1 + 32);
  if (a3) {
    BOOL v9 = v8[11] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  [v8 setCameraEnabled:v9];
  __int16 v10 = *(unsigned char **)(a1 + 32);
  if (a4) {
    BOOL v11 = v10[10] != 0;
  }
  else {
    BOOL v11 = 0;
  }
  [v10 setMicrophoneEnabled:v11];
}

- (void)captureHandlerWithSample:(id)a3 timingData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RPScreenRecorder *)self videoQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__RPScreenRecorder_captureHandlerWithSample_timingData___block_invoke;
  block[3] = &unk_26451DAA8;
  id v12 = v6;
  id v13 = v7;
  __int16 v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __56__RPScreenRecorder_captureHandlerWithSample_timingData___block_invoke(uint64_t a1)
{
  uint64_t v2 = (__IOSurface *)[*(id *)(a1 + 32) ioSurface];
  memset(&v5, 0, sizeof(v5));
  [*(id *)(a1 + 40) getBytes:&v5 length:72];
  CMSampleTimingInfo v4 = v5;
  CMSampleBufferRef v3 = RPSampleBufferUtilities_CreateSampleBufferFromIOSurface(v2, &v4);
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 48) + 88) + 16))();
  CFRelease(v3);
}

- (void)captureHandlerWithAudioSample:(id)a3 bufferType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(RPScreenRecorder *)self audioQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__RPScreenRecorder_captureHandlerWithAudioSample_bufferType___block_invoke;
  block[3] = &unk_26451DAD0;
  id v10 = v6;
  BOOL v11 = self;
  int64_t v12 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __61__RPScreenRecorder_captureHandlerWithAudioSample_bufferType___block_invoke(uint64_t a1)
{
  CMSampleBufferRef DecodeAudioSampleBuffer = RPSampleBufferUtilities_CreateDecodeAudioSampleBuffer(*(void **)(a1 + 32));
  if (DecodeAudioSampleBuffer)
  {
    CMSampleBufferRef v3 = DecodeAudioSampleBuffer;
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 88) + 16))();
    CFRelease(v3);
  }
}

- (void)startInAppBroadcastWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPScreenRecorder startInAppBroadcastWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 621;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!self->_recording)
  {
    if (self->_available)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke;
      v7[3] = &unk_26451D9B8;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(MEMORY[0x263EF83A0], v7);

      goto LABEL_18;
    }
    if (!v4) {
      goto LABEL_18;
    }
    uint64_t v5 = [(RPScreenRecorder *)self handleUnavailableState];
    goto LABEL_9;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[RPScreenRecorder startInAppBroadcastWithHandler:]();
    if (v4) {
      goto LABEL_8;
    }
  }
  else if (v4)
  {
LABEL_8:
    uint64_t v5 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5830 userInfo:0];
LABEL_9:
    id v6 = (void *)v5;
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v5);

    goto LABEL_18;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[RPScreenRecorder startInAppBroadcastWithHandler:]();
  }
LABEL_18:
}

void __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentWindowLayerContextID];
  [*(id *)(a1 + 32) currentWindowSize];
  double v4 = v3;
  double v6 = v5;
  if ([*(id *)(a1 + 32) checkContextID:v2 withHandler:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) registerAppForStateChangeSetRotationLock:1];
    uint64_t v7 = [*(id *)(a1 + 32) isCameraEnabled];
    uint64_t v8 = [*(id *)(a1 + 32) isMicrophoneEnabled];
    id v9 = +[RPDaemonProxy daemonProxy];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_2;
    v11[3] = &unk_26451D990;
    id v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    objc_msgSend(v9, "startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v2, v8, v7, 0, v11, v4, v6);
  }
}

void __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (v7)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_2_cold_1();
    }
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPScreenRecorder startInAppBroadcastWithHandler:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 655;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  [*(id *)(a1 + 32) setHasUserConsentForCamera:a3];
  [*(id *)(a1 + 32) setHasUserConsentForMicrophone:a4];
  uint64_t v8 = *(unsigned char **)(a1 + 32);
  if (a3) {
    BOOL v9 = v8[11] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  [v8 setCameraEnabled:v9];
  id v10 = *(unsigned char **)(a1 + 32);
  if (a4) {
    BOOL v11 = v10[10] != 0;
  }
  else {
    BOOL v11 = 0;
  }
  [v10 setMicrophoneEnabled:v11];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_21;
  v15[3] = &unk_26451D968;
  char v19 = a3;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 40);
  id v16 = v7;
  uint64_t v17 = v12;
  id v18 = v13;
  id v14 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_21(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 40) instantiatePipView];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  [*(id *)(a1 + 40) updateStateWithActive:1 error:v2];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    double v4 = *(void (**)(void))(v3 + 16);
    v4();
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_21_cold_1();
  }
}

- (void)stopInAppBroadcastWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v10 = "-[RPScreenRecorder stopInAppBroadcastWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 694;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPScreenRecorder *)self isRecording])
  {
    double v5 = +[RPDaemonProxy daemonProxy];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__RPScreenRecorder_stopInAppBroadcastWithHandler___block_invoke;
    v7[3] = &unk_26451DA30;
    v7[4] = self;
    id v8 = v4;
    [v5 stopInAppBroadcastWithHandler:v7];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder stopInAppBroadcastWithHandler:]();
    }
    double v6 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5829 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

void __50__RPScreenRecorder_stopInAppBroadcastWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __50__RPScreenRecorder_stopInAppBroadcastWithHandler___block_invoke_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) updateStateWithActive:0 error:0];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v3);
  }
}

- (void)pauseInAppBroadcast
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    double v5 = "-[RPScreenRecorder pauseInAppBroadcast]";
    __int16 v6 = 1024;
    int v7 = 716;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  if (self->_recording && !self->_paused)
  {
    id v3 = +[RPDaemonProxy daemonProxy];
    [v3 pauseInAppBroadcast];
  }
}

- (void)resumeInAppBroadcast
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    BOOL recording = self->_recording;
    BOOL paused = self->_paused;
    *(_DWORD *)buf = 136446978;
    BOOL v9 = "-[RPScreenRecorder resumeInAppBroadcast]";
    __int16 v10 = 1024;
    int v11 = 724;
    __int16 v12 = 1024;
    BOOL v13 = recording;
    __int16 v14 = 1024;
    BOOL v15 = paused;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recording %d paused %d", buf, 0x1Eu);
  }
  if (self->_recording && self->_paused)
  {
    double v5 = +[RPDaemonProxy daemonProxy];
    __int16 v6 = [(RPScreenRecorder *)self currentWindowLayerContextID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__RPScreenRecorder_resumeInAppBroadcast__block_invoke;
    v7[3] = &unk_26451DA58;
    v7[4] = self;
    [v5 resumeInAppBroadcastWithWindowLayerContextID:v6 completionHandler:v7];
  }
}

void __40__RPScreenRecorder_resumeInAppBroadcast__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  [*(id *)(a1 + 32) setPaused:0];
  if (v7)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446722;
      BOOL v13 = "-[RPScreenRecorder resumeInAppBroadcast]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 730;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d can not resume with error %@", (uint8_t *)&v12, 0x1Cu);
    }
    [*(id *)(a1 + 32) recordingDidStopWithError:v7 movieURL:0];
  }
  [*(id *)(a1 + 32) setHasUserConsentForCamera:a3];
  [*(id *)(a1 + 32) setHasUserConsentForMicrophone:a4];
  uint64_t v8 = *(unsigned char **)(a1 + 32);
  if (a3) {
    BOOL v9 = v8[11] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  [v8 setCameraEnabled:v9];
  __int16 v10 = *(unsigned char **)(a1 + 32);
  if (a4) {
    BOOL v11 = v10[10] != 0;
  }
  else {
    BOOL v11 = 0;
  }
  [v10 setMicrophoneEnabled:v11];
}

- (void)setBroadcastURL:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastURL, a3);
  id v4 = a3;
  id v5 = +[RPDaemonProxy daemonProxy];
  [v5 setBroadcastURL:v4];
}

- (void)clientDidUpdateBroadcastServiceInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  activeBroadcastController = self->_activeBroadcastController;
  if (activeBroadcastController)
  {
    if (__RPLogLevel <= 1)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v6 = self->_activeBroadcastController;
        int v12 = 136446722;
        BOOL v13 = "-[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:]";
        __int16 v14 = 1024;
        int v15 = 752;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d activeBroadcastController: %@", (uint8_t *)&v12, 0x1Cu);
      }
      activeBroadcastController = self->_activeBroadcastController;
    }
    [(RPBroadcastController *)activeBroadcastController setServiceInfo:v4];
    id v7 = [(RPBroadcastController *)self->_activeBroadcastController delegate];

    if (v7)
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [(RPBroadcastController *)self->_activeBroadcastController delegate];
        int v12 = 136446722;
        BOOL v13 = "-[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:]";
        __int16 v14 = 1024;
        int v15 = 755;
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d activeBroadcastController delegate: %@", (uint8_t *)&v12, 0x1Cu);
      }
      BOOL v9 = [(RPBroadcastController *)self->_activeBroadcastController delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136446466;
          BOOL v13 = "-[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:]";
          __int16 v14 = 1024;
          int v15 = 758;
          _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d delegate responds to protocol", (uint8_t *)&v12, 0x12u);
        }
        BOOL v11 = [(RPBroadcastController *)self->_activeBroadcastController delegate];
        [v11 broadcastController:self->_activeBroadcastController didUpdateServiceInfo:v4];
      }
      else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        -[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:]();
      }
    }
    else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:]();
    }
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:]();
  }
}

- (void)startSystemRecordingWithMicrophoneEnabled:(BOOL)a3 handler:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    BOOL v11 = "-[RPScreenRecorder startSystemRecordingWithMicrophoneEnabled:handler:]";
    __int16 v12 = 1024;
    int v13 = 774;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder startSystemRecordingWithMicrophoneEnabled:handler:]();
    }
    uint64_t v6 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5830 userInfo:0];
  }
  else
  {
    [(RPScreenRecorder *)self setSystemRecording:1];
    if (self->_available)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke;
      v8[3] = &unk_26451D9B8;
      void v8[4] = self;
      id v9 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v8);

      goto LABEL_12;
    }
    if (!v5) {
      goto LABEL_12;
    }
    uint64_t v6 = [(RPScreenRecorder *)self handleUnavailableState];
  }
  id v7 = (void *)v6;
  (*((void (**)(id, uint64_t))v5 + 2))(v5, v6);

LABEL_12:
}

void __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v2 = [MEMORY[0x263F1C408] sharedApplication];
  id v3 = [v2 windows];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v22 + 1) + 8 * v7);
        NSClassFromString(&cfstr_Fbrootwindow.isa);
        if (objc_opt_isKindOfClass()) {
          [*(id *)(a1 + 32) setWindowToRecord:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v5);
  }

  id v9 = [*(id *)(a1 + 32) currentWindowLayerContextID];
  [*(id *)(a1 + 32) currentWindowSize];
  double v11 = v10;
  double v13 = v12;
  [*(id *)(a1 + 32) registerAppForStateChangeSetRotationLock:1];
  uint64_t v14 = +[RPFeatureFlagUtility sharedInstance];
  char v15 = [v14 screenRecordingCameraPip];

  if ((v15 & 1) == 0) {
    [*(id *)(a1 + 32) setCameraEnabled:0];
  }
  uint64_t v16 = [*(id *)(a1 + 32) isMicrophoneEnabled];
  uint64_t v17 = [*(id *)(a1 + 32) isCameraEnabled];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v27 = "-[RPScreenRecorder startSystemRecordingWithMicrophoneEnabled:handler:]_block_invoke";
    __int16 v28 = 1024;
    int v29 = 814;
    __int16 v30 = 1024;
    int v31 = v16;
    __int16 v32 = 1024;
    int v33 = v17;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempting to start system recording with mic:%d cam:%d", buf, 0x1Eu);
  }
  uint64_t v18 = +[RPDaemonProxy daemonProxy];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_27;
  v20[3] = &unk_26451DA30;
  char v19 = *(void **)(a1 + 40);
  v20[4] = *(void *)(a1 + 32);
  id v21 = v19;
  objc_msgSend(v18, "startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v9, v16, v17, v20, v11, v13);
}

void __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_27_cold_1();
    }
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[RPScreenRecorder startSystemRecordingWithMicrophoneEnabled:handler:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = 823;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_28;
  block[3] = &unk_26451D758;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_28(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStateWithActive:1 error:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    id v3 = *(void (**)(void))(v2 + 16);
    v3();
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_28_cold_1();
  }
}

- (void)stopSystemRecording:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[RPScreenRecorder stopSystemRecording:]";
    __int16 v11 = 1024;
    int v12 = 848;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPScreenRecorder *)self isRecording])
  {
    id v5 = +[RPDaemonProxy daemonProxy];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__RPScreenRecorder_stopSystemRecording___block_invoke;
    v7[3] = &unk_26451DA30;
    v7[4] = self;
    id v8 = v4;
    [v5 stopSystemRecordingWithHandler:v7];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder stopSystemRecording:]();
    }
    uint64_t v6 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5829 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v6);
  }
}

void __40__RPScreenRecorder_stopSystemRecording___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0);
  [*(id *)(a1 + 32) setSystemRecording:0];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[RPScreenRecorder stopSystemRecordingWithURLHandler:]";
    __int16 v11 = 1024;
    int v12 = 869;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPScreenRecorder *)self isRecording])
  {
    id v5 = +[RPDaemonProxy daemonProxy];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__RPScreenRecorder_stopSystemRecordingWithURLHandler___block_invoke;
    v7[3] = &unk_26451DA08;
    v7[4] = self;
    id v8 = v4;
    [v5 stopSystemRecordingWithURLHandler:v7];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder stopSystemRecordingWithURLHandler:]();
    }
    uint64_t v6 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5830 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

void __54__RPScreenRecorder_stopSystemRecordingWithURLHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) updateStateWithActive:0 error:v5];
  [*(id *)(a1 + 32) setSystemRecording:0];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (void)resumeSystemRecording
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v6 = "-[RPScreenRecorder resumeSystemRecording]";
    __int16 v7 = 1024;
    int v8 = 892;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording && self->_paused)
  {
    uint64_t v3 = +[RPDaemonProxy daemonProxy];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __41__RPScreenRecorder_resumeSystemRecording__block_invoke;
    v4[3] = &unk_26451DAF8;
    v4[4] = self;
    [v3 resumeSystemRecordingWithCompletionHandler:v4];
  }
}

void __41__RPScreenRecorder_resumeSystemRecording__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 setPaused:0];
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __41__RPScreenRecorder_resumeSystemRecording__block_invoke_cold_1();
  }
}

- (void)setupSystemBroadcastWithExtension:(id)a3 handler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v17 = "-[RPScreenRecorder setupSystemBroadcastWithExtension:handler:]";
    __int16 v18 = 1024;
    int v19 = 908;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  __int16 v7 = [MEMORY[0x263F086E0] mainBundle];
  int v8 = [v7 bundleIdentifier];

  id v9 = objc_alloc_init(NSDictionary);
  double v10 = objc_alloc_init(RPBroadcastConfiguration);
  __int16 v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:v10];
  int v12 = +[RPDaemonProxy daemonProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __62__RPScreenRecorder_setupSystemBroadcastWithExtension_handler___block_invoke;
  v14[3] = &unk_26451DB20;
  id v15 = v6;
  id v13 = v6;
  [v12 setupSystemBroadcastWithHostBundleID:v8 broadcastExtensionBundleID:v5 broadcastConfigurationData:v11 userInfo:v9 handler:v14];
}

void __62__RPScreenRecorder_setupSystemBroadcastWithExtension_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && __RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __62__RPScreenRecorder_setupSystemBroadcastWithExtension_handler___block_invoke_cold_1(v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startSystemBroadcastWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[RPScreenRecorder startSystemBroadcastWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 926;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder startSystemBroadcastWithHandler:]();
    }
    uint64_t v5 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5830 userInfo:0];
  }
  else
  {
    [(RPScreenRecorder *)self setSystemRecording:1];
    if (self->_available)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke;
      v7[3] = &unk_26451D9B8;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(MEMORY[0x263EF83A0], v7);

      goto LABEL_12;
    }
    if (!v4) {
      goto LABEL_12;
    }
    uint64_t v5 = [(RPScreenRecorder *)self handleUnavailableState];
  }
  id v6 = (void *)v5;
  (*((void (**)(id, uint64_t))v4 + 2))(v4, v5);

LABEL_12:
}

void __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v2 = [MEMORY[0x263F1C408] sharedApplication];
  id v3 = [v2 windows];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * v7);
        NSClassFromString(&cfstr_Fbrootwindow.isa);
        if (objc_opt_isKindOfClass()) {
          [*(id *)(a1 + 32) setWindowToRecord:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v5);
  }

  id v9 = [*(id *)(a1 + 32) currentWindowLayerContextID];
  [*(id *)(a1 + 32) currentWindowSize];
  double v11 = v10;
  double v13 = v12;
  [*(id *)(a1 + 32) registerAppForStateChangeSetRotationLock:1];
  uint64_t v14 = +[RPFeatureFlagUtility sharedInstance];
  char v15 = [v14 screenRecordingCameraPip];

  if ((v15 & 1) == 0) {
    [*(id *)(a1 + 32) setCameraEnabled:0];
  }
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = [*(id *)(a1 + 32) isMicrophoneEnabled];
    int v17 = [*(id *)(a1 + 32) isCameraEnabled];
    *(_DWORD *)buf = 136446978;
    int v29 = "-[RPScreenRecorder startSystemBroadcastWithHandler:]_block_invoke";
    __int16 v30 = 1024;
    int v31 = 954;
    __int16 v32 = 1024;
    int v33 = v16;
    __int16 v34 = 1024;
    int v35 = v17;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempting to start system broadcast with mic:%d cam:%d", buf, 0x1Eu);
  }
  __int16 v18 = +[RPDaemonProxy daemonProxy];
  uint64_t v19 = [*(id *)(a1 + 32) isMicrophoneEnabled];
  uint64_t v20 = [*(id *)(a1 + 32) isCameraEnabled];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_34;
  v22[3] = &unk_26451DA30;
  id v21 = *(void **)(a1 + 40);
  v22[4] = *(void *)(a1 + 32);
  id v23 = v21;
  objc_msgSend(v18, "startSystemBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v9, v19, v20, 0, v22, v11, v13);
}

void __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_34_cold_1();
    }
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[RPScreenRecorder startSystemBroadcastWithHandler:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = 964;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_35;
  block[3] = &unk_26451D758;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_35(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStateWithActive:1 error:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    id v3 = *(void (**)(void))(v2 + 16);
    v3();
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_35_cold_1();
  }
}

- (void)stopSystemBroadcastWithHandler:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[RPScreenRecorder stopSystemBroadcastWithHandler:]";
    __int16 v11 = 1024;
    int v12 = 989;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if ([(RPScreenRecorder *)self isRecording])
  {
    id v5 = +[RPDaemonProxy daemonProxy];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__RPScreenRecorder_stopSystemBroadcastWithHandler___block_invoke;
    v7[3] = &unk_26451DA30;
    v7[4] = self;
    id v8 = v4;
    [v5 stopSystemBroadcastWithHandler:v7];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder stopSystemBroadcastWithHandler:]();
    }
    uint64_t v6 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5829 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v6);
  }
}

void __51__RPScreenRecorder_stopSystemBroadcastWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v4);
  }
}

- (void)resumeSystemBroadcast
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v6 = "-[RPScreenRecorder resumeSystemBroadcast]";
    __int16 v7 = 1024;
    int v8 = 1007;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording && self->_paused)
  {
    uint64_t v3 = +[RPDaemonProxy daemonProxy];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __41__RPScreenRecorder_resumeSystemBroadcast__block_invoke;
    v4[3] = &unk_26451DAF8;
    v4[4] = self;
    [v3 resumeSystemBroadcastWithCompletionHandler:v4];
  }
}

void __41__RPScreenRecorder_resumeSystemBroadcast__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    [v2 setPaused:0];
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __41__RPScreenRecorder_resumeSystemBroadcast__block_invoke_cold_1();
  }
}

- (void)startClipBufferingWithCompletionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = completionHandler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[RPScreenRecorder startClipBufferingWithCompletionHandler:]";
    __int16 v11 = 1024;
    int v12 = 1024;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!self->_recording)
  {
    if (self->_available)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke;
      v7[3] = &unk_26451D9B8;
      v7[4] = self;
      id v8 = v4;
      dispatch_async(MEMORY[0x263EF83A0], v7);

      goto LABEL_12;
    }
    if (!v4) {
      goto LABEL_12;
    }
    uint64_t v5 = [(RPScreenRecorder *)self handleUnavailableState];
    goto LABEL_9;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[RPScreenRecorder startClipBufferingWithCompletionHandler:]();
    if (!v4) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (v4)
  {
LABEL_8:
    uint64_t v5 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5830 userInfo:0];
LABEL_9:
    uint64_t v6 = (void *)v5;
    (*((void (**)(void *, uint64_t))v4 + 2))(v4, v5);
  }
LABEL_12:
}

void __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentWindowLayerContextID];
  [*(id *)(a1 + 32) currentWindowSize];
  double v4 = v3;
  double v6 = v5;
  if ([*(id *)(a1 + 32) checkContextID:v2 withHandler:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) registerAppForStateChangeSetRotationLock:1];
    uint64_t v7 = [*(id *)(a1 + 32) isCameraEnabled];
    uint64_t v8 = [*(id *)(a1 + 32) isMicrophoneEnabled];
    uint64_t v9 = +[RPDaemonProxy daemonProxy];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_26451D990;
    double v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    objc_msgSend(v9, "startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:", v2, v8, v7, v11, v4, v6);
  }
}

void __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (v7)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_2_cold_1();
    }
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    id v21 = "-[RPScreenRecorder startClipBufferingWithCompletionHandler:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 1057;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  [*(id *)(a1 + 32) setHasUserConsentForCamera:a3];
  [*(id *)(a1 + 32) setHasUserConsentForMicrophone:a4];
  uint64_t v8 = *(unsigned char **)(a1 + 32);
  if (a3) {
    BOOL v9 = v8[11] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  [v8 setCameraEnabled:v9];
  double v10 = *(unsigned char **)(a1 + 32);
  if (a4) {
    BOOL v11 = v10[10] != 0;
  }
  else {
    BOOL v11 = 0;
  }
  [v10 setMicrophoneEnabled:v11];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_37;
  v15[3] = &unk_26451D968;
  char v19 = a3;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(a1 + 40);
  id v16 = v7;
  uint64_t v17 = v12;
  id v18 = v13;
  id v14 = v7;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

void __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      [*(id *)(a1 + 40) instantiatePipView];
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  [*(id *)(a1 + 40) updateStateWithActive:1 error:v2];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    double v4 = *(void (**)(void))(v3 + 16);
    v4();
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_37_cold_1();
  }
}

- (void)stopClipBufferingWithCompletionHandler:(void *)completionHandler
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v4 = completionHandler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v10 = "-[RPScreenRecorder stopClipBufferingWithCompletionHandler:]";
    __int16 v11 = 1024;
    int v12 = 1095;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[RPScreenRecorder stopClipBufferingWithCompletionHandler:]();
      if (!v4) {
        goto LABEL_10;
      }
    }
    else if (!v4)
    {
      goto LABEL_10;
    }
    double v6 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5829 userInfo:0];
    v4[2](v4, v6);

    goto LABEL_10;
  }
  double v5 = +[RPDaemonProxy daemonProxy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__RPScreenRecorder_stopClipBufferingWithCompletionHandler___block_invoke;
  v7[3] = &unk_26451DA30;
  v7[4] = self;
  uint64_t v8 = v4;
  [v5 stopClipBufferingWithCompletionHandler:v7];

LABEL_10:
}

void __59__RPScreenRecorder_stopClipBufferingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    double v6 = "-[RPScreenRecorder stopClipBufferingWithCompletionHandler:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 1099;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stopped", (uint8_t *)&v5, 0x12u);
  }
  [*(id *)(a1 + 32) updateStateWithActive:0 error:v3];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

- (void)exportClipToURL:(NSURL *)url duration:(NSTimeInterval)duration completionHandler:(void *)completionHandler
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v8 = url;
  uint64_t v9 = completionHandler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446466;
    int v12 = "-[RPScreenRecorder exportClipToURL:duration:completionHandler:]";
    __int16 v13 = 1024;
    int v14 = 1116;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v11, 0x12u);
  }
  if (self->_recording)
  {
    double v10 = +[RPDaemonProxy daemonProxy];
    [v10 exportClipToURL:v8 duration:v9 completionHandler:duration];
LABEL_10:

    goto LABEL_11;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[RPScreenRecorder exportClipToURL:duration:completionHandler:]();
    if (!v9) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (v9)
  {
LABEL_9:
    double v10 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5832 userInfo:0];
    v9[2](v9, v10);
    goto LABEL_10;
  }
LABEL_11:
}

- (void)resumeInAppClip
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    BOOL recording = self->_recording;
    BOOL paused = self->_paused;
    *(_DWORD *)buf = 136446978;
    uint64_t v9 = "-[RPScreenRecorder resumeInAppClip]";
    __int16 v10 = 1024;
    int v11 = 1129;
    __int16 v12 = 1024;
    BOOL v13 = recording;
    __int16 v14 = 1024;
    BOOL v15 = paused;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recording %d paused %d", buf, 0x1Eu);
  }
  if (self->_recording && self->_paused)
  {
    int v5 = +[RPDaemonProxy daemonProxy];
    double v6 = [(RPScreenRecorder *)self currentWindowLayerContextID];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__RPScreenRecorder_resumeInAppClip__block_invoke;
    v7[3] = &unk_26451DA58;
    v7[4] = self;
    [v5 resumeInAppClipWithWindowLayerContextID:v6 completionHandler:v7];
  }
}

void __35__RPScreenRecorder_resumeInAppClip__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a2;
  [*(id *)(a1 + 32) setPaused:0];
  if (v7)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446722;
      BOOL v13 = "-[RPScreenRecorder resumeInAppClip]_block_invoke";
      __int16 v14 = 1024;
      int v15 = 1135;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d can not resume with error %@", (uint8_t *)&v12, 0x1Cu);
    }
    [*(id *)(a1 + 32) recordingDidStopWithError:v7 movieURL:0];
  }
  [*(id *)(a1 + 32) setHasUserConsentForCamera:a3];
  [*(id *)(a1 + 32) setHasUserConsentForMicrophone:a4];
  int v8 = *(unsigned char **)(a1 + 32);
  if (a3) {
    BOOL v9 = v8[11] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  [v8 setCameraEnabled:v9];
  __int16 v10 = *(unsigned char **)(a1 + 32);
  if (a4) {
    BOOL v11 = v10[10] != 0;
  }
  else {
    BOOL v11 = 0;
  }
  [v10 setMicrophoneEnabled:v11];
}

- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v12 = "-[RPScreenRecorder saveVideoToCameraRoll:handler:]";
    __int16 v13 = 1024;
    int v14 = 1152;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v7 = +[RPDaemonProxy daemonProxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__RPScreenRecorder_saveVideoToCameraRoll_handler___block_invoke;
  v9[3] = &unk_26451DB20;
  id v10 = v6;
  id v8 = v6;
  [v7 saveVideoToCameraRoll:v5 handler:v9];
}

uint64_t __50__RPScreenRecorder_saveVideoToCameraRoll_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v12 = "-[RPScreenRecorder saveClipToCameraRoll:handler:]";
    __int16 v13 = 1024;
    int v14 = 1162;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v7 = +[RPDaemonProxy daemonProxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__RPScreenRecorder_saveClipToCameraRoll_handler___block_invoke;
  v9[3] = &unk_26451DB20;
  id v10 = v6;
  id v8 = v6;
  [v7 saveClipToCameraRoll:v5 handler:v9];
}

uint64_t __49__RPScreenRecorder_saveClipToCameraRoll_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)saveVideo:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v12 = "-[RPScreenRecorder saveVideo:handler:]";
    __int16 v13 = 1024;
    int v14 = 1171;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v7 = +[RPDaemonProxy daemonProxy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__RPScreenRecorder_saveVideo_handler___block_invoke;
  v9[3] = &unk_26451DB20;
  id v10 = v6;
  id v8 = v6;
  [v7 saveVideo:v5 handler:v9];
}

uint64_t __38__RPScreenRecorder_saveVideo_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removePipView
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__RPScreenRecorder_removePipView__block_invoke;
  block[3] = &unk_26451D7F0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __33__RPScreenRecorder_removePipView__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[RPScreenRecorder removePipView]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 1183;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d remove camera pip from view", (uint8_t *)&v6, 0x12u);
  }
  [*(id *)(*(void *)(a1 + 32) + 40) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;
}

- (void)setCameraEnabled:(BOOL)cameraEnabled
{
  BOOL v3 = cameraEnabled;
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    int v6 = "-[RPScreenRecorder setCameraEnabled:]";
    __int16 v7 = 1024;
    int v8 = 1197;
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d camera enabled %d", (uint8_t *)&v5, 0x18u);
  }
  if (self->_cameraEnabled != v3)
  {
    if ([(RPScreenRecorder *)self isRecording])
    {
      if (v3)
      {
        if (self->_hasUserConsentForCamera)
        {
          if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            int v5 = 136446466;
            int v6 = "-[RPScreenRecorder setCameraEnabled:]";
            __int16 v7 = 1024;
            int v8 = 1205;
            _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d start camera pip", (uint8_t *)&v5, 0x12u);
          }
          [(RPPipViewController *)self->_pipViewController startPipSession];
        }
        else if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v5 = 136446466;
          int v6 = "-[RPScreenRecorder setCameraEnabled:]";
          __int16 v7 = 1024;
          int v8 = 1203;
          _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Camera must be enabled first prior to startRecording", (uint8_t *)&v5, 0x12u);
        }
      }
      else
      {
        if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v5 = 136446466;
          int v6 = "-[RPScreenRecorder setCameraEnabled:]";
          __int16 v7 = 1024;
          int v8 = 1209;
          _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop camera pip", (uint8_t *)&v5, 0x12u);
        }
        [(RPPipViewController *)self->_pipViewController stopPipSession];
        [(RPScreenRecorder *)self removePipView];
      }
    }
    self->_cameraEnabled = v3;
  }
}

- (void)setCameraPosition:(RPCameraPosition)cameraPosition
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446722;
    BOOL v10 = "-[RPScreenRecorder setCameraPosition:]";
    __int16 v11 = 1024;
    int v12 = 1226;
    __int16 v13 = 1024;
    int v14 = cameraPosition;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d camera position %d", (uint8_t *)&v9, 0x18u);
  }
  if (self->_cameraPosition != cameraPosition)
  {
    pipViewController = self->_pipViewController;
    if (!pipViewController)
    {
LABEL_13:
      self->_cameraPosition = cameraPosition;
      return;
    }
    if (cameraPosition == RPCameraPositionFront)
    {
      uint64_t v6 = 2;
    }
    else
    {
      if (cameraPosition != RPCameraPositionBack) {
        goto LABEL_11;
      }
      uint64_t v6 = 1;
    }
    [(RPPipViewController *)pipViewController setCameraPosition:v6];
LABEL_11:
    if ([(RPScreenRecorder *)self isRecording])
    {
      __int16 v7 = +[RPDaemonProxy daemonProxy];
      int v8 = [(RPScreenRecorder *)self pipViewController];
      objc_msgSend(v7, "reportCameraUsage:", objc_msgSend(v8, "cameraPosition"));
    }
    goto LABEL_13;
  }
}

- (void)instantiatePipView
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 orientation];

  if ([(RPScreenRecorder *)self isCameraEnabled])
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446722;
      int v12 = "-[RPScreenRecorder instantiatePipView]";
      __int16 v13 = 1024;
      int v14 = 1256;
      __int16 v15 = 1024;
      int v16 = [(RPScreenRecorder *)self cameraPosition];
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d create pip for camera position %d", (uint8_t *)&v11, 0x18u);
    }
    if ([(RPScreenRecorder *)self cameraPosition] == RPCameraPositionFront)
    {
      uint64_t v5 = 2;
    }
    else
    {
      if ([(RPScreenRecorder *)self cameraPosition] != RPCameraPositionBack)
      {
LABEL_10:
        __int16 v7 = +[RPDaemonProxy daemonProxy];
        int v8 = [(RPScreenRecorder *)self pipViewController];
        objc_msgSend(v7, "reportCameraUsage:", objc_msgSend(v8, "cameraPosition"));

        int v9 = [(RPScreenRecorder *)self pipViewController];
        BOOL v10 = [v9 view];
        [(RPScreenRecorder *)self setCameraPreviewView:v10];

        return;
      }
      uint64_t v5 = 1;
    }
    uint64_t v6 = [[RPPipViewController alloc] initWithOrientation:v4 position:v5];
    [(RPScreenRecorder *)self setPipViewController:v6];

    goto LABEL_10;
  }
}

- (void)isScreenRecordingAvailable
{
  BOOL v3 = [(RPScreenRecorder *)self processQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__RPScreenRecorder_isScreenRecordingAvailable__block_invoke;
  block[3] = &unk_26451D7F0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __46__RPScreenRecorder_isScreenRecordingAvailable__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) screenRecordingAllowed];
  int v3 = [*(id *)(a1 + 32) screenRecordingSupportedOnDevice];
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(unsigned __int8 *)(v4 + 8);
  *(unsigned char *)(v4 + 8) = v2 & v3;
  if (__RPLogLevel <= 1)
  {
    int v6 = v3;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
      int v14 = 136447490;
      __int16 v15 = "-[RPScreenRecorder isScreenRecordingAvailable]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 1301;
      __int16 v18 = 1024;
      int v19 = v7;
      __int16 v20 = 1024;
      int v21 = 1;
      __int16 v22 = 1024;
      int v23 = v2;
      __int16 v24 = 1024;
      int v25 = v6;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recording available %i with display available %i, allowed %i, and supported on device %i", (uint8_t *)&v14, 0x2Au);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v5 != *(unsigned __int8 *)(v8 + 8))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v8 + 24));
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
        int v14 = 136446722;
        __int16 v15 = "-[RPScreenRecorder isScreenRecordingAvailable]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 1305;
        __int16 v18 = 1024;
        int v19 = v11;
        _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify client available %d", (uint8_t *)&v14, 0x18u);
      }
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
      [v12 screenRecorderDidChangeAvailability:*(void *)(a1 + 32)];
    }
    if (objc_opt_respondsToSelector())
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
        int v14 = 136446722;
        __int16 v15 = "-[RPScreenRecorder isScreenRecordingAvailable]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 1309;
        __int16 v18 = 1024;
        int v19 = v13;
        _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify client available %d", (uint8_t *)&v14, 0x18u);
      }
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "screenRecorderDidChangeAvailability:");
    }
  }
}

- (void)registerAppForStateChangeSetRotationLock:(BOOL)a3
{
}

- (void)updateStateWithActive:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446978;
    uint64_t v8 = "-[RPScreenRecorder updateStateWithActive:error:]";
    __int16 v9 = 1024;
    int v10 = 1328;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    __int16 v13 = 1024;
    BOOL v14 = v6 != 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d update state with isActive %d error %d", (uint8_t *)&v7, 0x1Eu);
  }
  if (v6 || !v4)
  {
    [(RPScreenRecorder *)self setRecording:0];
    [(RPScreenRecorder *)self removePipView];
    [(RPScreenRecorder *)self updateProcessIDForAudioCapture:0];
    [(RPScreenRecorder *)self setWindowRotationLocked:0];
  }
  else
  {
    [(RPScreenRecorder *)self setRecording:1];
  }
}

- (id)handleUnavailableState
{
  if ([(RPScreenRecorder *)self screenRecordingAllowed])
  {
    int v3 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5803 userInfo:0];
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder handleUnavailableState]();
    }
  }
  else
  {
    int v3 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5802 userInfo:0];
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPScreenRecorder handleUnavailableState]();
    }
  }
  [(RPScreenRecorder *)self isScreenRecordingAvailable];

  return v3;
}

- (id)applicationWindow
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  windowToRecord = self->_windowToRecord;
  if (windowToRecord)
  {
    int v3 = windowToRecord;
  }
  else
  {
    BOOL v4 = [MEMORY[0x263F1C408] sharedApplication];
    int v5 = [v4 delegate];

    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v5 window], (int v3 = (UIWindow *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136446466;
        int v10 = "-[RPScreenRecorder applicationWindow]";
        __int16 v11 = 1024;
        int v12 = 1421;
        _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d appWindow: app doesn't have the window property set on UIApplicationDelegate. Using first window.", (uint8_t *)&v9, 0x12u);
      }
      id v6 = [MEMORY[0x263F1C408] sharedApplication];
      int v7 = [v6 windows];
      int v3 = [v7 firstObject];
    }
  }

  return v3;
}

- (CGSize)currentWindowSize
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = [MEMORY[0x263F1C920] mainScreen];
  [v8 scale];
  double v10 = v9;

  if (!self->_systemRecording)
  {
    __int16 v11 = [(RPScreenRecorder *)self applicationWindow];
    [v11 frame];
    double v5 = v12;
    double v7 = v13;
  }
  float v14 = v5;
  double v15 = v10 * ceilf(v14);
  float v16 = v7;
  double v17 = v10 * ceilf(v16);
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136446978;
    int v21 = "-[RPScreenRecorder currentWindowSize]";
    __int16 v22 = 1024;
    int v23 = 1439;
    __int16 v24 = 2048;
    double v25 = v15;
    __int16 v26 = 2048;
    double v27 = v17;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d scaled window size width %.1f x height:%.1f", (uint8_t *)&v20, 0x26u);
  }
  double v18 = v15;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)currentWindowLayerContextID
{
  int v3 = [(RPScreenRecorder *)self windowToRecord];

  if (v3)
  {
    double v4 = [(UIWindow *)self->_windowToRecord layer];
    double v5 = [v4 context];
    uint64_t v6 = [v5 contextId];
LABEL_3:

    goto LABEL_6;
  }
  if (!self->_systemRecording)
  {
    double v4 = [(RPScreenRecorder *)self applicationWindow];
    double v5 = [v4 layer];
    double v10 = [v5 context];
    uint64_t v6 = [v10 contextId];

    goto LABEL_3;
  }
  uint64_t v6 = 0xFFFFFFFFLL;
LABEL_6:
  double v7 = [NSNumber numberWithUnsignedInt:v6];
  uint64_t v8 = [v7 stringValue];

  return v8;
}

- (void)setWindowRotationLocked:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__RPScreenRecorder_setWindowRotationLocked___block_invoke;
  v3[3] = &unk_26451DB48;
  BOOL v4 = a3;
  v3[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __44__RPScreenRecorder_setWindowRotationLocked___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int8 *)(a1 + 40);
    int v4 = 136446722;
    double v5 = "-[RPScreenRecorder setWindowRotationLocked:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1502;
    __int16 v8 = 1024;
    int v9 = v2;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setWindowRotationLocked: %i", (uint8_t *)&v4, 0x18u);
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      double v5 = "-[RPScreenRecorder setWindowRotationLocked:]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 1511;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d disabling autorotation", (uint8_t *)&v4, 0x12u);
    }
    int v3 = [*(id *)(a1 + 32) applicationWindow];
    [v3 beginDisablingInterfaceAutorotation];
  }
  else
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      double v5 = "-[RPScreenRecorder setWindowRotationLocked:]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 1522;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d enabling autorotation", (uint8_t *)&v4, 0x12u);
    }
    int v3 = [*(id *)(a1 + 32) applicationWindow];
    [v3 endDisablingInterfaceAutorotation];
  }
}

- (id)audioQueue
{
  if (audioQueue_onceToken != -1) {
    dispatch_once(&audioQueue_onceToken, &__block_literal_global_44);
  }
  int v2 = (void *)audioQueue_sAudioQueue;

  return v2;
}

void __30__RPScreenRecorder_audioQueue__block_invoke()
{
  int v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.replaykit.capture.AudioSampleQueue", v2);
  uint64_t v1 = (void *)audioQueue_sAudioQueue;
  audioQueue_sAudioQueue = (uint64_t)v0;
}

- (id)videoQueue
{
  if (videoQueue_onceToken != -1) {
    dispatch_once(&videoQueue_onceToken, &__block_literal_global_47);
  }
  int v2 = (void *)videoQueue_sVideoQueue;

  return v2;
}

void __30__RPScreenRecorder_videoQueue__block_invoke()
{
  int v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.replaykit.capture.VideoSampleQueue", v2);
  uint64_t v1 = (void *)videoQueue_sVideoQueue;
  videoQueue_sVideoQueue = (uint64_t)v0;
}

- (id)processQueue
{
  if (processQueue_onceToken != -1) {
    dispatch_once(&processQueue_onceToken, &__block_literal_global_50);
  }
  int v2 = (void *)processQueue_sProcessQueue;

  return v2;
}

void __32__RPScreenRecorder_processQueue__block_invoke()
{
  int v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.replaykit.capture.ProcessQueue", v2);
  uint64_t v1 = (void *)processQueue_sProcessQueue;
  processQueue_sProcessQueue = (uint64_t)v0;
}

- (void)recordingLockInterrupted:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446722;
    double v5 = "-[RPScreenRecorder recordingLockInterrupted:]";
    __int16 v6 = 1024;
    int v7 = 1563;
    __int16 v8 = 1024;
    int v9 = [v3 code];
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recordingLockInterrupted error[%d]", (uint8_t *)&v4, 0x18u);
  }
}

- (void)recordingTimerDidUpdate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPScreenRecorder recordingTimerDidUpdate:]";
    __int16 v8 = 1024;
    int v9 = 1568;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d time[%@]", (uint8_t *)&v6, 0x1Cu);
  }
  double v5 = [(RPScreenRecorder *)self privateDelegate];
  [v5 recordingTimerDidUpdate:v4];
}

- (void)recordingDidPause
{
  if (self->_recording) {
    [(RPScreenRecorder *)self setPaused:1];
  }
}

- (void)shouldResumeSessionType:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    BOOL systemRecording = self->_systemRecording;
    BOOL recording = self->_recording;
    BOOL paused = self->_paused;
    *(_DWORD *)buf = 136447234;
    float v14 = "-[RPScreenRecorder shouldResumeSessionType:]";
    __int16 v15 = 1024;
    int v16 = 1581;
    __int16 v17 = 1024;
    BOOL v18 = systemRecording;
    __int16 v19 = 1024;
    BOOL v20 = recording;
    __int16 v21 = 1024;
    BOOL v22 = paused;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d system recording %d isRecording %d paused %d", buf, 0x24u);
  }
  if (self->_recording && self->_paused)
  {
    if ([v4 isEqualToString:@"RPInAppRecording"])
    {
      [(RPScreenRecorder *)self resumeInAppRecording];
    }
    else if ([v4 isEqualToString:@"RPInAppCapture"])
    {
      [(RPScreenRecorder *)self resumeInAppCapture];
    }
    else if ([v4 isEqualToString:@"RPInAppBroadcast"])
    {
      [(RPScreenRecorder *)self resumeInAppBroadcast];
    }
    else
    {
      if (![v4 isEqualToString:@"RPInAppClip"])
      {
        if ([v4 isEqualToString:@"RPSystemRecording"])
        {
          dispatch_time_t v8 = dispatch_time(0, 200000000);
          int v9 = [(RPScreenRecorder *)self processQueue];
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __44__RPScreenRecorder_shouldResumeSessionType___block_invoke;
          v12[3] = &unk_26451D7F0;
          v12[4] = self;
          __int16 v10 = v12;
        }
        else
        {
          if (![v4 isEqualToString:@"RPSystemBroadcast"]) {
            goto LABEL_19;
          }
          dispatch_time_t v8 = dispatch_time(0, 200000000);
          int v9 = [(RPScreenRecorder *)self processQueue];
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = __44__RPScreenRecorder_shouldResumeSessionType___block_invoke_2;
          v11[3] = &unk_26451D7F0;
          v11[4] = self;
          __int16 v10 = v11;
        }
        dispatch_after(v8, v9, v10);

        goto LABEL_19;
      }
      [(RPScreenRecorder *)self resumeInAppClip];
    }
  }
LABEL_19:
}

uint64_t __44__RPScreenRecorder_shouldResumeSessionType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeSystemRecording];
}

uint64_t __44__RPScreenRecorder_shouldResumeSessionType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) resumeSystemBroadcast];
}

- (void)updateScreenRecordingStateWithCurrentState:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    int v6 = "-[RPScreenRecorder updateScreenRecordingStateWithCurrentState:]";
    __int16 v7 = 1024;
    int v8 = 1609;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d updateScreenRecordingStateWithCurrentState", (uint8_t *)&v5, 0x12u);
  }
  [(RPScreenRecorder *)self notifyDelegateOfUpdatedState];
}

- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__RPScreenRecorder_recordingDidStopWithError_movieURL___block_invoke;
  block[3] = &unk_26451DAA8;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __55__RPScreenRecorder_recordingDidStopWithError_movieURL___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v13 = "-[RPScreenRecorder recordingDidStopWithError:movieURL:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 1615;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  int v2 = *(unsigned char **)(a1 + 32);
  if (!v2[15])
  {
    [v2 setWindowRotationLocked:0];
    int v2 = *(unsigned char **)(a1 + 32);
  }
  [v2 updateStateWithActive:0 error:*(void *)(a1 + 40)];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 96) delegate];
  char v4 = objc_opt_respondsToSelector();

  int v5 = *(id **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5[12] delegate];
    [v6 broadcastController:*(void *)(*(void *)(a1 + 32) + 96) didFinishWithError:*(void *)(a1 + 40)];
  }
  else if ([v5 shouldNotifyDidStop])
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      if (__RPLogLevel <= 1)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 136446722;
          double v13 = "-[RPScreenRecorder recordingDidStopWithError:movieURL:]_block_invoke";
          __int16 v14 = 1024;
          int v15 = 1639;
          __int16 v16 = 2112;
          uint64_t v17 = v8;
          _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d movieURL: %@", buf, 0x1Cu);
        }
        uint64_t v7 = *(void *)(a1 + 48);
      }
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __55__RPScreenRecorder_recordingDidStopWithError_movieURL___block_invoke_72;
      v10[3] = &unk_26451DB70;
      id v9 = *(void **)(a1 + 40);
      v10[4] = *(void *)(a1 + 32);
      id v11 = v9;
      +[RPPreviewViewController loadPreviewViewControllerWithMovieURL:v7 completion:v10];
    }
    else
    {
      [*(id *)(a1 + 32) didStopRecordingWithError:*(void *)(a1 + 40) previewViewController:0];
    }
  }
}

void __55__RPScreenRecorder_recordingDidStopWithError_movieURL___block_invoke_72(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446722;
    int v5 = "-[RPScreenRecorder recordingDidStopWithError:movieURL:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 1645;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d previewViewController %@", (uint8_t *)&v4, 0x1Cu);
  }
  [v3 setPreviewControllerDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) didStopRecordingWithError:*(void *)(a1 + 40) previewViewController:v3];
}

- (BOOL)isConnectionInterruptedOrInvalid:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 code] == -5815 || objc_msgSend(v3, "code") == -5814;

  return v4;
}

- (BOOL)shouldNotifyDidStop
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    char v4 = 1;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    char v4 = objc_opt_respondsToSelector();
  }
  if (objc_opt_respondsToSelector()) {
    char v6 = 1;
  }
  else {
    char v6 = objc_opt_respondsToSelector();
  }
  return (v4 | v6) & 1;
}

- (void)didStopRecordingWithError:(id)a3 previewViewController:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  int v7 = [(RPScreenRecorder *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  id v9 = [(RPScreenRecorder *)self delegate];
  uint64_t v10 = v9;
  if (v8)
  {
    [v9 screenRecorder:self didStopRecordingWithPreviewViewController:v6 error:v17];
  }
  else
  {
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v10 = [(RPScreenRecorder *)self delegate];
    [v10 screenRecorder:self didStopRecordingWithError:v17 previewViewController:v6];
  }

LABEL_6:
  id v12 = [(RPScreenRecorder *)self secondDelegate];
  char v13 = objc_opt_respondsToSelector();

  __int16 v14 = [(RPScreenRecorder *)self secondDelegate];
  int v15 = v14;
  if (v13)
  {
    [v14 screenRecorder:self didStopRecordingWithPreviewViewController:v6 error:v17];
  }
  else
  {
    char v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) == 0) {
      goto LABEL_11;
    }
    int v15 = [(RPScreenRecorder *)self secondDelegate];
    [v15 screenRecorder:self didStopRecordingWithError:v17 previewViewController:v6];
  }

LABEL_11:
}

- (void)notifyDelegateOfUpdatedState
{
}

- (void)updateRecordingAvailability:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPScreenRecorder updateRecordingAvailability:]";
    __int16 v7 = 1024;
    int v8 = 1707;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  [(RPScreenRecorder *)self isScreenRecordingAvailable];
}

- (void)updateProcessIDForAudioCapture:(int)a3
{
  if (self->_processIDForAudioCapture != a3)
  {
    uint64_t v3 = *(void *)&a3;
    if ([(RPScreenRecorder *)self isRecording])
    {
      int v5 = +[RPDaemonProxy daemonProxy];
      [v5 updateProcessIDForAudioCaptureWithPID:v3];
    }
    self->_processIDForAudioCapture = v3;
  }
}

- (BOOL)checkContextID:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (!v5)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[RPScreenRecorder checkContextID:withHandler:]();
      if (!v6) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
    if (v6)
    {
LABEL_5:
      __int16 v7 = [MEMORY[0x263F087E8] _rpUserErrorForCode:-5803 userInfo:0];
      v6[2](v6, v7);
    }
  }
LABEL_6:

  return v5 != 0;
}

- (BOOL)screenRecordingSupportedOnDevice
{
  return 1;
}

- (BOOL)screenRecordingAllowed
{
  int v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53A40]] != 2;

  return v3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setAvailable:(BOOL)a3
{
  self->_BOOL available = a3;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_BOOL recording = a3;
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (BOOL)isCameraEnabled
{
  return self->_cameraEnabled;
}

- (RPCameraPosition)cameraPosition
{
  return self->_cameraPosition;
}

- (UIView)cameraPreviewView
{
  return self->_cameraPreviewView;
}

- (void)setCameraPreviewView:(id)a3
{
}

- (unint64_t)previousAudioSessionOptions
{
  return self->_previousAudioSessionOptions;
}

- (void)setPreviousAudioSessionOptions:(unint64_t)a3
{
  self->_previousAudioSessionOptions = a3;
}

- (NSString)previousAudioCategory
{
  return self->_previousAudioCategory;
}

- (void)setPreviousAudioCategory:(id)a3
{
}

- (UIWindow)windowToRecord
{
  return self->_windowToRecord;
}

- (void)setWindowToRecord:(id)a3
{
}

- (RPPipViewController)pipViewController
{
  return self->_pipViewController;
}

- (void)setPipViewController:(id)a3
{
}

- (id)saveVideoToCameraRollCompletionBlock
{
  return self->_saveVideoToCameraRollCompletionBlock;
}

- (void)setSaveVideoToCameraRollCompletionBlock:(id)a3
{
}

- (BOOL)hasUserConsentForCamera
{
  return self->_hasUserConsentForCamera;
}

- (void)setHasUserConsentForCamera:(BOOL)a3
{
  self->_hasUserConsentForCamera = a3;
}

- (BOOL)hasUserConsentForMicrophone
{
  return self->_hasUserConsentForMicrophone;
}

- (void)setHasUserConsentForMicrophone:(BOOL)a3
{
  self->_hasUserConsentForMicrophone = a3;
}

- (id)captureHandler
{
  return self->_captureHandler;
}

- (void)setCaptureHandler:(id)a3
{
}

- (RPBroadcastController)activeBroadcastController
{
  return self->_activeBroadcastController;
}

- (void)setActiveBroadcastController:(id)a3
{
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_BOOL paused = a3;
}

- (int)processIDForAudioCapture
{
  return self->_processIDForAudioCapture;
}

- (BOOL)systemRecording
{
  return self->_systemRecording;
}

- (void)setSystemRecording:(BOOL)a3
{
  self->_BOOL systemRecording = a3;
}

- (NSURL)broadcastURL
{
  return self->_broadcastURL;
}

- (RPScreenRecorderPrivateDelegate)privateDelegate
{
  return self->_privateDelegate;
}

- (void)setPrivateDelegate:(id)a3
{
}

- (RPScreenRecorderScreenCapureKitDelegate)screenCaptureKitDelegate
{
  return self->_screenCaptureKitDelegate;
}

- (void)setScreenCaptureKitDelegate:(id)a3
{
}

- (RPScreenCaptureKitControlCenterManagerDelegate)screenCaptureKitControlCenterManagerDelegate
{
  return self->_screenCaptureKitControlCenterManagerDelegate;
}

- (void)setScreenCaptureKitControlCenterManagerDelegate:(id)a3
{
}

- (RPScreenCaptureKitContentSharingPickerDelegate)screenCaptureKitContentSharingPickerDelegate
{
  return self->_screenCaptureKitContentSharingPickerDelegate;
}

- (void)setScreenCaptureKitContentSharingPickerDelegate:(id)a3
{
}

- (RPScreenRecorderScreenCapureKitPreviewDelegate)screenCaptureKitPreviewDelegate
{
  return self->_screenCaptureKitPreviewDelegate;
}

- (void)setScreenCaptureKitPreviewDelegate:(id)a3
{
}

- (RPScreenRecorderScreenCapureKitRecordingOutputDelegate)screenCaptureKitRecordingOutputDelegate
{
  return self->_screenCaptureKitRecordingOutputDelegate;
}

- (void)setScreenCaptureKitRecordingOutputDelegate:(id)a3
{
}

- (RPScreenRecorderDelegate)secondDelegate
{
  return self->_secondDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondDelegate, 0);
  objc_storeStrong((id *)&self->_screenCaptureKitRecordingOutputDelegate, 0);
  objc_storeStrong((id *)&self->_screenCaptureKitPreviewDelegate, 0);
  objc_storeStrong((id *)&self->_screenCaptureKitContentSharingPickerDelegate, 0);
  objc_storeStrong((id *)&self->_screenCaptureKitControlCenterManagerDelegate, 0);
  objc_storeStrong((id *)&self->_screenCaptureKitDelegate, 0);
  objc_storeStrong((id *)&self->_privateDelegate, 0);
  objc_storeStrong((id *)&self->_broadcastURL, 0);
  objc_storeStrong((id *)&self->_activeBroadcastController, 0);
  objc_storeStrong(&self->_captureHandler, 0);
  objc_storeStrong(&self->_saveVideoToCameraRollCompletionBlock, 0);
  objc_storeStrong((id *)&self->_pipViewController, 0);
  objc_storeStrong((id *)&self->_windowToRecord, 0);
  objc_storeStrong((id *)&self->_previousAudioCategory, 0);
  objc_storeStrong((id *)&self->_cameraPreviewView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startRecordingWithHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
}

void __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
}

void __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
}

- (void)stopRecordingWithHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to stop in app recording because we're not recording", v1, v2, v3, v4, v5);
}

void __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 code];
  *(_DWORD *)uint64_t v3 = 136446722;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v3[7] = 362;
  v3[9] = v1;
  int v4 = v2;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d stop recording error: %i", (uint8_t *)v3, 0x18u);
}

- (void)stopRecordingWithOutputURL:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to stop in app recording because we're not recording", v1, v2, v3, v4, v5);
}

- (void)startCaptureWithHandler:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
}

void __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
}

void __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
}

- (void)stopCaptureWithHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to stop in app capture because we're not recording", v1, v2, v3, v4, v5);
}

- (void)startInAppBroadcastWithHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
}

- (void)startInAppBroadcastWithHandler:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
}

void __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
}

void __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
}

- (void)stopInAppBroadcastWithHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to stop in app broadcast because we're not recording", v1, v2, v3, v4, v5);
}

void __50__RPScreenRecorder_stopInAppBroadcastWithHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to stop in app broadacast due to error: %@", v1, v2, v3, v4, 2u);
}

- (void)clientDidUpdateBroadcastServiceInfo:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d No active broadcast controller", v1, v2, v3, v4, v5);
}

- (void)clientDidUpdateBroadcastServiceInfo:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d delegate does not exist", v1, v2, v3, v4, v5);
}

- (void)clientDidUpdateBroadcastServiceInfo:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d delegate DOES NOT responds to protocol", v1, v2, v3, v4, v5);
}

- (void)startSystemRecordingWithMicrophoneEnabled:handler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
}

void __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
}

void __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_28_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
}

- (void)stopSystemRecording:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to stop system recording because we're not recording", v1, v2, v3, v4, v5);
}

- (void)stopSystemRecordingWithURLHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to stop system recording because we're not recording", v1, v2, v3, v4, v5);
}

void __41__RPScreenRecorder_resumeSystemRecording__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Failed to resume system recording", v1, v2, v3, v4, v5);
}

void __62__RPScreenRecorder_setupSystemBroadcastWithExtension_handler___block_invoke_cold_1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  [a1 code];
  *(_DWORD *)uint64_t v3 = 136446722;
  OUTLINED_FUNCTION_0_0();
  *(_DWORD *)&v3[7] = 919;
  v3[9] = v1;
  int v4 = v2;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error setting up broadcast, error code: %i", (uint8_t *)v3, 0x18u);
}

- (void)startSystemBroadcastWithHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
}

void __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_34_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
}

void __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_35_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
}

- (void)stopSystemBroadcastWithHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to stop system broadcast because we're not recording", v1, v2, v3, v4, v5);
}

void __41__RPScreenRecorder_resumeSystemBroadcast__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Failed to resume system broadcast", v1, v2, v3, v4, v5);
}

- (void)startClipBufferingWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
}

void __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
}

void __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
}

- (void)stopClipBufferingWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to stop in app clip recording because we're not recording", v1, v2, v3, v4, v5);
}

- (void)exportClipToURL:duration:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to export app clip because clip buferring has not started", v1, v2, v3, v4, v5);
}

- (void)handleUnavailableState
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d failed to start because screen is not allowed", v1, v2, v3, v4, v5);
}

- (void)checkContextID:withHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d contextID is nil", v1, v2, v3, v4, v5);
}

@end