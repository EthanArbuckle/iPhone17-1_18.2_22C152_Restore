@interface RPDaemonProxy
+ (id)daemonProxy;
- (NSURL)broadcastURL;
- (NSXPCConnection)connection;
- (RPDaemonProxy)init;
- (id)issueSandboxExtensionForClientFileWrite:(id)a3;
- (void)captureHandlerWithAudioSample:(id)a3 bufferType:(int64_t)a4;
- (void)captureHandlerWithSample:(id)a3 timingData:(id)a4;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)consumeSandboxExtension:(id)a3 processNewConnection:(BOOL)a4;
- (void)discardInAppRecordingWithHandler:(id)a3;
- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)getSystemBroadcastExtensionInfo:(id)a3;
- (void)getSystemBroadcastPickerInfo:(id)a3;
- (void)issueSandboxExtensionForMainBundleRead;
- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4;
- (void)macApplicationDidResignActive;
- (void)openControlCenterSystemRecordingView;
- (void)pauseInAppBroadcast;
- (void)pauseInAppCapture;
- (void)pauseInAppRecording;
- (void)recordingDidPause;
- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4;
- (void)recordingLockInterrupted:(id)a3;
- (void)recordingTimerDidUpdate:(id)a3;
- (void)reportCameraUsage:(int64_t)a3;
- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4;
- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3;
- (void)resumeSystemRecordingWithCompletionHandler:(id)a3;
- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4;
- (void)saveVideo:(id)a3 handler:(id)a4;
- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4;
- (void)setBroadcastPickerPreferredExt:(id)a3 showsMicButton:(BOOL)a4;
- (void)setBroadcastURL:(id)a3;
- (void)setConnection:(id)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7;
- (void)shouldResumeSessionType:(id)a3;
- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7;
- (void)startInAppBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)startSystemBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8;
- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7;
- (void)stopAllActiveClients;
- (void)stopClipBufferingWithCompletionHandler:(id)a3;
- (void)stopCurrentActiveSessionWithHandler:(id)a3;
- (void)stopInAppBroadcastWithHandler:(id)a3;
- (void)stopInAppCaptureWithHandler:(id)a3;
- (void)stopInAppRecordingWithHandler:(id)a3;
- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4;
- (void)stopSystemBroadcastWithHandler:(id)a3;
- (void)stopSystemRecordingWithHandler:(id)a3;
- (void)stopSystemRecordingWithURLHandler:(id)a3;
- (void)updateBroadcastServiceInfo:(id)a3;
- (void)updateBroadcastURL:(id)a3;
- (void)updateProcessIDForAudioCaptureWithPID:(int)a3;
- (void)updateScreenRecordingStateWithCurrentState:(id)a3;
@end

@implementation RPDaemonProxy

+ (id)daemonProxy
{
  if (daemonProxy_onceToken != -1) {
    dispatch_once(&daemonProxy_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)daemonProxy_daemonProxy;

  return v2;
}

uint64_t __28__RPDaemonProxy_daemonProxy__block_invoke()
{
  daemonProxy_daemonProxy = objc_alloc_init(RPDaemonProxy);

  return MEMORY[0x270F9A758]();
}

- (RPDaemonProxy)init
{
  v12.receiver = self;
  v12.super_class = (Class)RPDaemonProxy;
  v2 = [(RPDaemonProxy *)&v12 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.replayd" options:256];
    [(RPDaemonProxy *)v2 setConnection:v3];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D139C90];
    [(NSXPCConnection *)v2->_connection setExportedInterface:v4];

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D139C10];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection setDelegate:v2];
    objc_initWeak(&location, v2);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __21__RPDaemonProxy_init__block_invoke;
    v9[3] = &unk_26451DC38;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:v9];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __21__RPDaemonProxy_init__block_invoke_143;
    v7[3] = &unk_26451DC38;
    objc_copyWeak(&v8, &location);
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:v7];
    [(NSXPCConnection *)v2->_connection resume];
    [(RPDaemonProxy *)v2 issueSandboxExtensionForMainBundleRead];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __21__RPDaemonProxy_init__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: connection invalidated", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ReplayKit.RPRecordingErrorDomain" code:-5814 userInfo:0];
  [WeakRetained recordingDidStopWithError:v3 movieURL:0];
}

void __21__RPDaemonProxy_init__block_invoke_143(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: connection INTERRUPTED", v6, 2u);
  }
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ReplayKit.RPRecordingErrorDomain" code:-5815 userInfo:0];
  [WeakRetained recordingDidStopWithError:v4 movieURL:0];

  id v5 = objc_loadWeakRetained(v2);
  [v5 issueSandboxExtensionForMainBundleRead];
}

- (void)issueSandboxExtensionForMainBundleRead
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!__RPLogLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    v3 = "-[RPDaemonProxy issueSandboxExtensionForMainBundleRead]";
    __int16 v4 = 1024;
    int v5 = 122;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d ", (uint8_t *)&v2, 0x12u);
  }
}

- (id)issueSandboxExtensionForClientFileWrite:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [a3 path];
  __int16 v4 = [v3 stringByDeletingLastPathComponent];

  id v5 = v4;
  uint64_t v6 = [v5 fileSystemRepresentation];
  uint64_t v7 = sandbox_extension_issue_file();
  if (v7)
  {
    id v8 = (void *)v7;
    v9 = [NSString stringWithCString:v7 encoding:4];
    free(v8);
    if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446722;
      objc_super v12 = "-[RPDaemonProxy issueSandboxExtensionForClientFileWrite:]";
      __int16 v13 = 1024;
      int v14 = 148;
      __int16 v15 = 2080;
      uint64_t v16 = v6;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Issued sandbox extension for client folder path %s", (uint8_t *)&v11, 0x1Cu);
    }
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPDaemonProxy issueSandboxExtensionForClientFileWrite:]();
    }
    v9 = 0;
  }

  return v9;
}

- (void)stopCurrentActiveSessionWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopCurrentActiveSessionWithHandler:withHandler:", v6, 2u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_147];
  [v5 stopCurrentActiveSessionWithHandler:v4];
}

void __53__RPDaemonProxy_stopCurrentActiveSessionWithHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __53__RPDaemonProxy_stopCurrentActiveSessionWithHandler___block_invoke_cold_1(a2);
  }
}

- (void)stopAllActiveClients
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopAllActiveClients:withHandler:", v4, 2u);
  }
  v3 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_149];
  [v3 stopAllActiveClients];
}

void __37__RPDaemonProxy_stopAllActiveClients__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __37__RPDaemonProxy_stopAllActiveClients__block_invoke_cold_1(a2);
  }
}

- (void)startInAppRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: startInAppRecordingWithContextID:withHandler:", v16, 2u);
  }
  __int16 v15 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_151];
  objc_msgSend(v15, "startInAppRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v13, v9, v8, v14, width, height);
}

void __105__RPDaemonProxy_startInAppRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __105__RPDaemonProxy_startInAppRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(a2);
  }
}

- (void)stopInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopInAppRecordingWithHandler:withHandler:", v6, 2u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_153];
  [v5 stopInAppRecordingWithHandler:v4];
}

void __47__RPDaemonProxy_stopInAppRecordingWithHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __47__RPDaemonProxy_stopInAppRecordingWithHandler___block_invoke_cold_1(a2);
  }
}

- (void)stopInAppRecordingWithUrl:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446466;
    objc_super v12 = "-[RPDaemonProxy stopInAppRecordingWithUrl:handler:]";
    __int16 v13 = 1024;
    int v14 = 208;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v11, 0x12u);
  }
  BOOL v8 = [(RPDaemonProxy *)self issueSandboxExtensionForClientFileWrite:v6];
  BOOL v9 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_155];
  id v10 = v9;
  if (v8)
  {
    [v9 stopInAppRecordingWithUrl:v6 extensionToken:v8 handler:v7];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPDaemonProxy stopInAppRecordingWithUrl:handler:]();
    }
    [v10 stopInAppRecordingWithUrl:v6 handler:v7];
  }
}

void __51__RPDaemonProxy_stopInAppRecordingWithUrl_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __51__RPDaemonProxy_stopInAppRecordingWithUrl_handler___block_invoke_cold_1(v2);
  }
}

- (void)discardInAppRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: discardInAppRecordingWithHandler:withHandler:", v6, 2u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_157];
  [v5 discardInAppRecordingWithHandler:v4];
}

void __50__RPDaemonProxy_discardInAppRecordingWithHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __50__RPDaemonProxy_discardInAppRecordingWithHandler___block_invoke_cold_1(a2);
  }
}

- (void)pauseInAppRecording
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: pauseInAppRecording:", v4, 2u);
  }
  v3 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_159];
  [v3 pauseInAppRecording];
}

void __36__RPDaemonProxy_pauseInAppRecording__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __36__RPDaemonProxy_pauseInAppRecording__block_invoke_cold_1(a2);
  }
}

- (void)resumeInAppRecordingWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    id v10 = "-[RPDaemonProxy resumeInAppRecordingWithWindowLayerContextID:completionHandler:]";
    __int16 v11 = 1024;
    int v12 = 253;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  BOOL v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_161];
  [v8 resumeInAppRecordingWithWindowLayerContextID:v6 completionHandler:v7];
}

void __80__RPDaemonProxy_resumeInAppRecordingWithWindowLayerContextID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __80__RPDaemonProxy_resumeInAppRecordingWithWindowLayerContextID_completionHandler___block_invoke_cold_1(v2);
  }
}

- (void)startInAppCaptureWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: startInAppCaptureWithContextID:withHandler:", v16, 2u);
  }
  uint64_t v15 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_163];
  objc_msgSend(v15, "startInAppCaptureWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v13, v9, v8, v14, width, height);
}

void __103__RPDaemonProxy_startInAppCaptureWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __103__RPDaemonProxy_startInAppCaptureWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(a2);
  }
}

- (void)stopInAppCaptureWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopInAppCaptureWithHandler:withHandler:", v6, 2u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_165];
  [v5 stopInAppCaptureWithHandler:v4];
}

void __45__RPDaemonProxy_stopInAppCaptureWithHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __45__RPDaemonProxy_stopInAppCaptureWithHandler___block_invoke_cold_1(a2);
  }
}

- (void)pauseInAppCapture
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: pauseInAppCapture", v4, 2u);
  }
  v3 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_167];
  [v3 pauseInAppCapture];
}

void __34__RPDaemonProxy_pauseInAppCapture__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __34__RPDaemonProxy_pauseInAppCapture__block_invoke_cold_1(a2);
  }
}

- (void)resumeInAppCaptureWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    id v10 = "-[RPDaemonProxy resumeInAppCaptureWithWindowLayerContextID:completionHandler:]";
    __int16 v11 = 1024;
    int v12 = 304;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  BOOL v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_169];
  [v8 resumeInAppCaptureWithWindowLayerContextID:v6 completionHandler:v7];
}

void __78__RPDaemonProxy_resumeInAppCaptureWithWindowLayerContextID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __78__RPDaemonProxy_resumeInAppCaptureWithWindowLayerContextID_completionHandler___block_invoke_cold_1(v2);
  }
}

- (void)setupBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: setupBroadcastWithHostBundleID:", v18, 2u);
  }
  uint64_t v17 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_171];
  [v17 setupBroadcastWithHostBundleID:v12 broadcastExtensionBundleID:v13 broadcastConfigurationData:v14 userInfo:v15 handler:v16];
}

void __119__RPDaemonProxy_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __119__RPDaemonProxy_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke_cold_1(a2);
  }
}

- (void)startInAppBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: startInAppBroadcastWithContextID:withHandler:", v19, 2u);
  }
  v18 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_173];
  objc_msgSend(v18, "startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v15, v11, v10, v16, v17, width, height);
}

void __122__RPDaemonProxy_startInAppBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __122__RPDaemonProxy_startInAppBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke_cold_1(a2);
  }
}

- (void)stopInAppBroadcastWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopInAppBroadcastWithHandler:withHandler:", v6, 2u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_175];
  [v5 stopInAppBroadcastWithHandler:v4];
}

void __47__RPDaemonProxy_stopInAppBroadcastWithHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __47__RPDaemonProxy_stopInAppBroadcastWithHandler___block_invoke_cold_1(a2);
  }
}

- (void)pauseInAppBroadcast
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: pauseInAppBroadcast:", v4, 2u);
  }
  v3 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_177];
  [v3 pauseInAppBroadcast];
}

void __36__RPDaemonProxy_pauseInAppBroadcast__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __36__RPDaemonProxy_pauseInAppBroadcast__block_invoke_cold_1(a2);
  }
}

- (void)resumeInAppBroadcastWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    BOOL v10 = "-[RPDaemonProxy resumeInAppBroadcastWithWindowLayerContextID:completionHandler:]";
    __int16 v11 = 1024;
    int v12 = 368;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  BOOL v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_179];
  [v8 resumeInAppBroadcastWithWindowLayerContextID:v6 completionHandler:v7];
}

void __80__RPDaemonProxy_resumeInAppBroadcastWithWindowLayerContextID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __80__RPDaemonProxy_resumeInAppBroadcastWithWindowLayerContextID_completionHandler___block_invoke_cold_1(v2);
  }
}

- (void)startSystemRecordingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  id v13 = a3;
  id v14 = a7;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: startSystemRecordingWithContextID:withHandler:", v16, 2u);
  }
  id v15 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_181];
  objc_msgSend(v15, "startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v13, v9, v8, v14, width, height);
}

void __106__RPDaemonProxy_startSystemRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __106__RPDaemonProxy_startSystemRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(a2);
  }
}

- (void)stopSystemRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopSystemRecordingWithHandler:withHandler:", v6, 2u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_183];
  [v5 stopSystemRecordingWithHandler:v4];
}

void __48__RPDaemonProxy_stopSystemRecordingWithHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __48__RPDaemonProxy_stopSystemRecordingWithHandler___block_invoke_cold_1(a2);
  }
}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[RPDaemonProxy stopSystemRecordingWithURLHandler:]";
    __int16 v8 = 1024;
    int v9 = 409;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_185];
  [v5 stopSystemRecordingWithURLHandler:v4];
}

void __51__RPDaemonProxy_stopSystemRecordingWithURLHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __51__RPDaemonProxy_stopSystemRecordingWithURLHandler___block_invoke_cold_1(v2);
  }
}

- (void)resumeSystemRecordingWithCompletionHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[RPDaemonProxy resumeSystemRecordingWithCompletionHandler:]";
    __int16 v8 = 1024;
    int v9 = 424;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_187];
  [v5 resumeSystemRecordingWithCompletionHandler:v4];
}

void __60__RPDaemonProxy_resumeSystemRecordingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __60__RPDaemonProxy_resumeSystemRecordingWithCompletionHandler___block_invoke_cold_1(v2);
  }
}

- (void)setupSystemBroadcastWithHostBundleID:(id)a3 broadcastExtensionBundleID:(id)a4 broadcastConfigurationData:(id)a5 userInfo:(id)a6 handler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: setupSystemBroadcastWithHostBundleID:withHandler:", v18, 2u);
  }
  id v17 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_189];
  [v17 setupSystemBroadcastWithHostBundleID:v12 broadcastExtensionBundleID:v13 broadcastConfigurationData:v14 userInfo:v15 handler:v16];
}

void __125__RPDaemonProxy_setupSystemBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __125__RPDaemonProxy_setupSystemBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke_cold_1(a2);
  }
}

- (void)startSystemBroadcastWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 listenerEndpoint:(id)a7 withHandler:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: startSystemBroadcastWithContextID:withHandler:", v19, 2u);
  }
  v18 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_191];
  objc_msgSend(v18, "startSystemBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v15, v11, v10, v16, v17, width, height);
}

void __123__RPDaemonProxy_startSystemBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __123__RPDaemonProxy_startSystemBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke_cold_1(a2);
  }
}

- (void)stopSystemBroadcastWithHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: stopSystemBroadcastWithHandler:withHandler:", v6, 2u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_193];
  [v5 stopSystemBroadcastWithHandler:v4];
}

void __48__RPDaemonProxy_stopSystemBroadcastWithHandler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __48__RPDaemonProxy_stopSystemBroadcastWithHandler___block_invoke_cold_1(a2);
  }
}

- (void)resumeSystemBroadcastWithCompletionHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[RPDaemonProxy resumeSystemBroadcastWithCompletionHandler:]";
    __int16 v8 = 1024;
    int v9 = 477;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_195];
  [v5 resumeSystemBroadcastWithCompletionHandler:v4];
}

void __60__RPDaemonProxy_resumeSystemBroadcastWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __60__RPDaemonProxy_resumeSystemBroadcastWithCompletionHandler___block_invoke_cold_1(v2);
  }
}

- (void)getSystemBroadcastExtensionInfo:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: getSystemBroadcastExtensionInfo:", v6, 2u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_197];
  [v5 getSystemBroadcastExtensionInfo:v4];
}

void __49__RPDaemonProxy_getSystemBroadcastExtensionInfo___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __119__RPDaemonProxy_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke_cold_1(a2);
  }
}

- (void)consumeSandboxExtension:(id)a3 processNewConnection:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPDaemonProxy consumeSandboxExtension:processNewConnection:]";
    __int16 v10 = 1024;
    int v11 = 506;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  id v7 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_199];
  [v7 consumeSandboxExtension:v6 processNewConnection:v4];
}

void __62__RPDaemonProxy_consumeSandboxExtension_processNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __62__RPDaemonProxy_consumeSandboxExtension_processNewConnection___block_invoke_cold_1(v2);
  }
}

- (void)macApplicationDidResignActive
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: macApplicationDidResignActive:", v4, 2u);
  }
  v3 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_201];
  [v3 macApplicationDidResignActive];
}

void __46__RPDaemonProxy_macApplicationDidResignActive__block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __46__RPDaemonProxy_macApplicationDidResignActive__block_invoke_cold_1(a2);
  }
}

- (void)macApplicationDidBecomeActiveWithContextID:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    __int16 v10 = "-[RPDaemonProxy macApplicationDidBecomeActiveWithContextID:completionHandler:]";
    __int16 v11 = 1024;
    int v12 = 529;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  int v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_203];
  [v8 macApplicationDidBecomeActiveWithContextID:v6 completionHandler:v7];
}

void __78__RPDaemonProxy_macApplicationDidBecomeActiveWithContextID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __78__RPDaemonProxy_macApplicationDidBecomeActiveWithContextID_completionHandler___block_invoke_cold_1(v2);
  }
}

- (void)saveVideo:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446466;
    int v12 = "-[RPDaemonProxy saveVideo:handler:]";
    __int16 v13 = 1024;
    int v14 = 558;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v11, 0x12u);
  }
  int v8 = [(RPDaemonProxy *)self issueSandboxExtensionForClientFileWrite:v6];
  int v9 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_205];
  __int16 v10 = v9;
  if (v8)
  {
    [v9 saveVideo:v6 extensionToken:v8 handler:v7];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPDaemonProxy saveVideo:handler:]();
    }
    [v10 saveVideo:v6 handler:v7];
  }
}

void __35__RPDaemonProxy_saveVideo_handler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __35__RPDaemonProxy_saveVideo_handler___block_invoke_cold_1(v2);
  }
}

- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: saveVideoToCameraRoll:", v9, 2u);
  }
  int v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_207];
  [v8 saveVideoToCameraRoll:v6 handler:v7];
}

void __47__RPDaemonProxy_saveVideoToCameraRoll_handler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __47__RPDaemonProxy_saveVideoToCameraRoll_handler___block_invoke_cold_1(a2);
  }
}

- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446466;
    int v12 = "-[RPDaemonProxy saveClipToCameraRoll:handler:]";
    __int16 v13 = 1024;
    int v14 = 593;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v11, 0x12u);
  }
  int v8 = [(RPDaemonProxy *)self issueSandboxExtensionForClientFileWrite:v6];
  int v9 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_209];
  __int16 v10 = v9;
  if (v8)
  {
    [v9 saveClipToCameraRoll:v6 extensionToken:v8 handler:v7];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPDaemonProxy saveClipToCameraRoll:handler:]();
    }
    [v10 saveClipToCameraRoll:v6 handler:v7];
  }
}

void __46__RPDaemonProxy_saveClipToCameraRoll_handler___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __46__RPDaemonProxy_saveClipToCameraRoll_handler___block_invoke_cold_1(a2);
  }
}

- (void)reportCameraUsage:(int64_t)a3
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: reportFrontCameraUsage", v6, 2u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_211];
  [v5 reportCameraUsage:a3];
}

void __35__RPDaemonProxy_reportCameraUsage___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __35__RPDaemonProxy_reportCameraUsage___block_invoke_cold_1(a2);
  }
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[RPDaemonProxy setMicrophoneEnabled:]";
    __int16 v8 = 1024;
    int v9 = 626;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_213];
  [v5 setMicrophoneEnabled:v3];
}

void __38__RPDaemonProxy_setMicrophoneEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __38__RPDaemonProxy_setMicrophoneEnabled___block_invoke_cold_1(v2);
  }
}

- (void)getSystemBroadcastPickerInfo:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[RPDaemonProxy getSystemBroadcastPickerInfo:]";
    __int16 v8 = 1024;
    int v9 = 635;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_215];
  [v5 getSystemBroadcastPickerInfo:v4];
}

void __46__RPDaemonProxy_getSystemBroadcastPickerInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __46__RPDaemonProxy_getSystemBroadcastPickerInfo___block_invoke_cold_1(v2);
  }
}

- (void)setBroadcastPickerPreferredExt:(id)a3 showsMicButton:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPDaemonProxy setBroadcastPickerPreferredExt:showsMicButton:]";
    __int16 v10 = 1024;
    int v11 = 644;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  id v7 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_217];
  [v7 setBroadcastPickerPreferredExt:v6 showsMicButton:v4];
}

void __63__RPDaemonProxy_setBroadcastPickerPreferredExt_showsMicButton___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __63__RPDaemonProxy_setBroadcastPickerPreferredExt_showsMicButton___block_invoke_cold_1(v2);
  }
}

- (void)openControlCenterSystemRecordingView
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    id v5 = "-[RPDaemonProxy openControlCenterSystemRecordingView]";
    __int16 v6 = 1024;
    int v7 = 654;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  BOOL v3 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_219];
  [v3 openControlCenterSystemRecordingView];
}

void __53__RPDaemonProxy_openControlCenterSystemRecordingView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __53__RPDaemonProxy_openControlCenterSystemRecordingView__block_invoke_cold_1(v2);
  }
}

- (void)updateProcessIDForAudioCaptureWithPID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    int v7 = "-[RPDaemonProxy updateProcessIDForAudioCaptureWithPID:]";
    __int16 v8 = 1024;
    int v9 = 666;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_221];
  [v5 updateProcessIDForAudioCaptureWithPID:v3];
}

void __55__RPDaemonProxy_updateProcessIDForAudioCaptureWithPID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __55__RPDaemonProxy_updateProcessIDForAudioCaptureWithPID___block_invoke_cold_1(v2);
  }
}

- (void)updateScreenRecordingStateWithCurrentState:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: updateScreenRecordingStateWithCurrentState", v5, 2u);
  }
  int v4 = +[RPScreenRecorder sharedRecorder];
  [v4 updateScreenRecordingStateWithCurrentState:v3];
}

- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v8 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: recordingDidStopWithError:movieURL:", v8, 2u);
  }
  int v7 = +[RPScreenRecorder sharedRecorder];
  [v7 recordingDidStopWithError:v5 movieURL:v6];
}

- (void)shouldResumeSessionType:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: shouldResumeSessionType", v5, 2u);
  }
  int v4 = +[RPScreenRecorder sharedRecorder];
  [v4 shouldResumeSessionType:v3];
}

- (void)recordingDidPause
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: recordingDidPause", v3, 2u);
  }
  id v2 = +[RPScreenRecorder sharedRecorder];
  [v2 recordingDidPause];
}

- (void)updateBroadcastServiceInfo:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: updateBroadcastServiceInfo:", v5, 2u);
  }
  int v4 = +[RPScreenRecorder sharedRecorder];
  [v4 clientDidUpdateBroadcastServiceInfo:v3];
}

- (void)updateBroadcastURL:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: updateBroadcastURL:", v9, 2u);
  }
  int v4 = +[RPScreenRecorder sharedRecorder];
  id v5 = [v4 activeBroadcastController];

  [v5 setBroadcastURL:v3];
  id v6 = [v5 delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    __int16 v8 = [v5 delegate];
    [v8 broadcastController:v5 didUpdateBroadcastURL:v3];
  }
}

- (void)captureHandlerWithSample:(id)a3 timingData:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (!__RPLogLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "-[RPDaemonProxy captureHandlerWithSample:timingData:]";
    __int16 v10 = 1024;
    int v11 = 726;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d ", (uint8_t *)&v8, 0x12u);
  }
  char v7 = +[RPScreenRecorder sharedRecorder];
  [v7 captureHandlerWithSample:v5 timingData:v6];
}

- (void)captureHandlerWithAudioSample:(id)a3 bufferType:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!__RPLogLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    int v8 = "-[RPDaemonProxy captureHandlerWithAudioSample:bufferType:]";
    __int16 v9 = 1024;
    int v10 = 733;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  id v6 = +[RPScreenRecorder sharedRecorder];
  [v6 captureHandlerWithAudioSample:v5 bufferType:a4];
}

- (void)recordingLockInterrupted:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: recordingLockInterrupted:", v5, 2u);
  }
  int v4 = +[RPScreenRecorder sharedRecorder];
  [v4 recordingLockInterrupted:v3];
}

- (void)recordingTimerDidUpdate:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "RPDaemonProxy: recordingTimerDidUpdate:", v5, 2u);
  }
  int v4 = +[RPScreenRecorder sharedRecorder];
  [v4 recordingTimerDidUpdate:v3];
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v5)
  {
    if (!__RPLogLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446466;
      uint64_t v11 = "-[RPDaemonProxy connection:handleInvocation:isReply:]";
      __int16 v12 = 1024;
      int v13 = 757;
      _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d received reply for invocation", (uint8_t *)&v10, 0x12u);
    }
    [v8 retainArguments];
  }
  else if (!__RPLogLevel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136446466;
    uint64_t v11 = "-[RPDaemonProxy connection:handleInvocation:isReply:]";
    __int16 v12 = 1024;
    int v13 = 763;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d did not receive reply for invocation", (uint8_t *)&v10, 0x12u);
  }
  [v8 invoke];
  __int16 v9 = [MEMORY[0x263EFF9D0] null];
  [v8 setTarget:v9];
}

- (void)setBroadcastURL:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_227];
  [v5 setBroadcastURL:v4];
}

void __33__RPDaemonProxy_setBroadcastURL___block_invoke(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __33__RPDaemonProxy_setBroadcastURL___block_invoke_cold_1(a2);
  }
}

- (void)startClipBufferingWithContextID:(id)a3 windowSize:(CGSize)a4 microphoneEnabled:(BOOL)a5 cameraEnabled:(BOOL)a6 withCompletionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  double height = a4.height;
  double width = a4.width;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a7;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136446466;
    id v17 = "-[RPDaemonProxy startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:]";
    __int16 v18 = 1024;
    int v19 = 781;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v16, 0x12u);
  }
  uint64_t v15 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_229];
  objc_msgSend(v15, "startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:", v13, v9, v8, v14, width, height);
}

void __114__RPDaemonProxy_startClipBufferingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __114__RPDaemonProxy_startClipBufferingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withCompletionHandler___block_invoke_cold_1(v2);
  }
}

- (void)stopClipBufferingWithCompletionHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    id v7 = "-[RPDaemonProxy stopClipBufferingWithCompletionHandler:]";
    __int16 v8 = 1024;
    int v9 = 794;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  id v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_231];
  [v5 stopClipBufferingWithCompletionHandler:v4];
}

void __56__RPDaemonProxy_stopClipBufferingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __56__RPDaemonProxy_stopClipBufferingWithCompletionHandler___block_invoke_cold_1(v2);
  }
}

- (void)exportClipToURL:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446466;
    id v14 = "-[RPDaemonProxy exportClipToURL:duration:completionHandler:]";
    __int16 v15 = 1024;
    int v16 = 807;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v13, 0x12u);
  }
  uint64_t v10 = [(RPDaemonProxy *)self issueSandboxExtensionForClientFileWrite:v8];
  uint64_t v11 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_233];
  __int16 v12 = v11;
  if (v10)
  {
    [v11 exportClipToURL:v8 duration:v10 extensionToken:v9 completionHandler:a4];
  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[RPDaemonProxy exportClipToURL:duration:completionHandler:]();
    }
    [v12 exportClipToURL:v8 duration:v9 completionHandler:a4];
  }
}

void __60__RPDaemonProxy_exportClipToURL_duration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __60__RPDaemonProxy_exportClipToURL_duration_completionHandler___block_invoke_cold_1(v2);
  }
}

- (void)resumeInAppClipWithWindowLayerContextID:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    uint64_t v10 = "-[RPDaemonProxy resumeInAppClipWithWindowLayerContextID:completionHandler:]";
    __int16 v11 = 1024;
    int v12 = 827;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v9, 0x12u);
  }
  id v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_235];
  [v8 resumeInAppClipWithWindowLayerContextID:v6 completionHandler:v7];
}

void __75__RPDaemonProxy_resumeInAppClipWithWindowLayerContextID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __75__RPDaemonProxy_resumeInAppClipWithWindowLayerContextID_completionHandler___block_invoke_cold_1(v2);
  }
}

- (NSURL)broadcastURL
{
  return self->_broadcastURL;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_broadcastURL, 0);
}

- (void)issueSandboxExtensionForClientFileWrite:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d Error issuing sandbox extension for client folder path %s", v1, v2, v3, v4, 2u);
}

void __53__RPDaemonProxy_stopCurrentActiveSessionWithHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: stopCurrentActiveSessionWithHandler: proxy error: %d", v2, v3, v4, v5, v6);
}

void __37__RPDaemonProxy_stopAllActiveClients__block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: stopAllActiveClients: proxy error: %d", v2, v3, v4, v5, v6);
}

void __105__RPDaemonProxy_startInAppRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: startInAppRecordingWithContextID: proxy error: %d", v2, v3, v4, v5, v6);
}

void __47__RPDaemonProxy_stopInAppRecordingWithHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: stopInAppRecordingWithHandler: proxy error: %d", v2, v3, v4, v5, v6);
}

- (void)stopInAppRecordingWithUrl:handler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d error issuing sandbox extension for client file %@", v1, v2, v3, v4, 2u);
}

void __51__RPDaemonProxy_stopInAppRecordingWithUrl_handler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __50__RPDaemonProxy_discardInAppRecordingWithHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: discardInAppRecordingWithHandler: proxy error: %d", v2, v3, v4, v5, v6);
}

void __36__RPDaemonProxy_pauseInAppRecording__block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: pauseInAppRecording: proxy error: %d", v2, v3, v4, v5, v6);
}

void __80__RPDaemonProxy_resumeInAppRecordingWithWindowLayerContextID_completionHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d error: %d", v2, v3, v4, v5, 2u);
}

void __103__RPDaemonProxy_startInAppCaptureWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: startInAppCaptureWithContextID: proxy error: %d", v2, v3, v4, v5, v6);
}

void __45__RPDaemonProxy_stopInAppCaptureWithHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: stopInAppCaptureWithHandler: proxy error: %d", v2, v3, v4, v5, v6);
}

void __34__RPDaemonProxy_pauseInAppCapture__block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: pauseInAppCapture: proxy error: %d", v2, v3, v4, v5, v6);
}

void __78__RPDaemonProxy_resumeInAppCaptureWithWindowLayerContextID_completionHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d error: %d", v2, v3, v4, v5, 2u);
}

void __119__RPDaemonProxy_setupBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "error: %d", v2, v3, v4, v5, v6);
}

void __122__RPDaemonProxy_startInAppBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: startInAppBroadcastWithContextID: proxy error: %d", v2, v3, v4, v5, v6);
}

void __47__RPDaemonProxy_stopInAppBroadcastWithHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: stopInAppBroadcastWithHandler: proxy error: %d", v2, v3, v4, v5, v6);
}

void __36__RPDaemonProxy_pauseInAppBroadcast__block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: pauseInAppBroadcast: proxy error: %d", v2, v3, v4, v5, v6);
}

void __80__RPDaemonProxy_resumeInAppBroadcastWithWindowLayerContextID_completionHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d error: %d", v2, v3, v4, v5, 2u);
}

void __106__RPDaemonProxy_startSystemRecordingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: startSystemRecordingWithContextID: proxy error: %d", v2, v3, v4, v5, v6);
}

void __48__RPDaemonProxy_stopSystemRecordingWithHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: stopSystemRecordingWithHandler: proxy error: %d", v2, v3, v4, v5, v6);
}

void __51__RPDaemonProxy_stopSystemRecordingWithURLHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __60__RPDaemonProxy_resumeSystemRecordingWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __125__RPDaemonProxy_setupSystemBroadcastWithHostBundleID_broadcastExtensionBundleID_broadcastConfigurationData_userInfo_handler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: setupSystemBroadcastWithHostBundleID: proxy error: %d", v2, v3, v4, v5, v6);
}

void __123__RPDaemonProxy_startSystemBroadcastWithContextID_windowSize_microphoneEnabled_cameraEnabled_listenerEndpoint_withHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: startSystemBroadcastWithContextID: proxy error: %d", v2, v3, v4, v5, v6);
}

void __48__RPDaemonProxy_stopSystemBroadcastWithHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: stopSystemBroadcastWithHandler: proxy error: %d", v2, v3, v4, v5, v6);
}

void __60__RPDaemonProxy_resumeSystemBroadcastWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __62__RPDaemonProxy_consumeSandboxExtension_processNewConnection___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __46__RPDaemonProxy_macApplicationDidResignActive__block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: macApplicationDidResignActive proxy error: %d", v2, v3, v4, v5, v6);
}

void __78__RPDaemonProxy_macApplicationDidBecomeActiveWithContextID_completionHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d error: %d", v2, v3, v4, v5, 2u);
}

- (void)saveVideo:handler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d error issuing sandbox extension for client file %@", v1, v2, v3, v4, 2u);
}

void __35__RPDaemonProxy_saveVideo_handler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __47__RPDaemonProxy_saveVideoToCameraRoll_handler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: saveVideoToCameraRoll proxy error: %d", v2, v3, v4, v5, v6);
}

- (void)saveClipToCameraRoll:handler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d error issuing sandbox extension for client file %@", v1, v2, v3, v4, 2u);
}

void __46__RPDaemonProxy_saveClipToCameraRoll_handler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProxy: saveClipToCameraRoll proxy error: %d", v2, v3, v4, v5, v6);
}

void __35__RPDaemonProxy_reportCameraUsage___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProtocol: reportFrontCameraUsage: proxy error: %d", v2, v3, v4, v5, v6);
}

void __38__RPDaemonProxy_setMicrophoneEnabled___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __46__RPDaemonProxy_getSystemBroadcastPickerInfo___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __63__RPDaemonProxy_setBroadcastPickerPreferredExt_showsMicButton___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __53__RPDaemonProxy_openControlCenterSystemRecordingView__block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __55__RPDaemonProxy_updateProcessIDForAudioCaptureWithPID___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __33__RPDaemonProxy_setBroadcastURL___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0(&dword_21F69F000, &_os_log_internal, v1, "RPDaemonProtocol: hasUserConsentForMicrophone: proxy error: %d", v2, v3, v4, v5, v6);
}

void __114__RPDaemonProxy_startClipBufferingWithContextID_windowSize_microphoneEnabled_cameraEnabled_withCompletionHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __56__RPDaemonProxy_stopClipBufferingWithCompletionHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

- (void)exportClipToURL:duration:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0(&dword_21F69F000, &_os_log_internal, v0, " [ERROR] %{public}s:%d error issuing sandbox extension for client file %@", v1, v2, v3, v4, 2u);
}

void __60__RPDaemonProxy_exportClipToURL_duration_completionHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d proxy error: %d", v2, v3, v4, v5, 2u);
}

void __75__RPDaemonProxy_resumeInAppClipWithWindowLayerContextID_completionHandler___block_invoke_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21F69F000, &_os_log_internal, v1, " [ERROR] %{public}s:%d error: %d", v2, v3, v4, v5, 2u);
}

@end