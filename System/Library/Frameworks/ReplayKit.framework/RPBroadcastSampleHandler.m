@interface RPBroadcastSampleHandler
- (RPBroadcastDaemonProtocol)daemonProxy;
- (id)audioQueue;
- (id)group;
- (id)videoQueue;
- (void)_processPayload:(id)a3;
- (void)_processPayloadWithAudioSample:(id)a3 type:(int64_t)a4;
- (void)_processPayloadWithVideoSample:(id)a3;
- (void)_setupListenerWithEndpoint:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)extensionContext:(id)a3 setEndpoint:(id)a4;
- (void)finishBroadcastWithError:(NSError *)error;
- (void)processPayload:(id)a3 completion:(id)a4;
- (void)setDaemonProxy:(id)a3;
- (void)updateBroadcastURL:(id)a3;
- (void)updateServiceInfo:(id)a3;
@end

@implementation RPBroadcastSampleHandler

- (id)group
{
  if (group_queueToken != -1) {
    dispatch_once(&group_queueToken, &__block_literal_global_5);
  }
  v2 = (void *)group_group;

  return v2;
}

uint64_t __33__RPBroadcastSampleHandler_group__block_invoke()
{
  group_group = (uint64_t)dispatch_group_create();

  return MEMORY[0x270F9A758]();
}

- (id)audioQueue
{
  if (audioQueue_onceToken_0 != -1) {
    dispatch_once(&audioQueue_onceToken_0, &__block_literal_global_2_0);
  }
  v2 = (void *)audioQueue_sAudioQueue_0;

  return v2;
}

void __38__RPBroadcastSampleHandler_audioQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.replaykit.broadcast.AudioSampleQueue", v2);
  v1 = (void *)audioQueue_sAudioQueue_0;
  audioQueue_sAudioQueue_0 = (uint64_t)v0;
}

- (id)videoQueue
{
  if (videoQueue_onceToken_0 != -1) {
    dispatch_once(&videoQueue_onceToken_0, &__block_literal_global_5_0);
  }
  v2 = (void *)videoQueue_sVideoQueue_0;

  return v2;
}

void __38__RPBroadcastSampleHandler_videoQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.replaykit.broadcast.VideoSampleQueue", v2);
  v1 = (void *)videoQueue_sVideoQueue_0;
  videoQueue_sVideoQueue_0 = (uint64_t)v0;
}

- (void)updateServiceInfo:(id)a3
{
}

- (void)updateBroadcastURL:(id)a3
{
}

- (void)finishBroadcastWithError:(NSError *)error
{
  v4 = error;
  v5 = [(RPBroadcastSampleHandler *)self group];
  v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__RPBroadcastSampleHandler_finishBroadcastWithError___block_invoke;
  v8[3] = &unk_26451D7A8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(v5, v6, v8);
}

uint64_t __53__RPBroadcastSampleHandler_finishBroadcastWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) finishBroadcastWithError:*(void *)(a1 + 40)];
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  [(RPBroadcastHandler *)self setExtensionContext:v4];
  [v4 setDelegate:self];
}

- (void)extensionContext:(id)a3 setEndpoint:(id)a4
{
}

- (void)_processPayload:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeySampleType"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyActionType"];
  uint64_t v8 = [v7 integerValue];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyFrontmostAppBundleID"];
  v10 = (void *)v9;
  if (v6 == 1)
  {
    [(RPBroadcastSampleHandler *)self _processPayloadWithVideoSample:v4];
  }
  else if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(RPBroadcastSampleHandler *)self _processPayloadWithAudioSample:v4 type:v6];
  }
  else if (v9)
  {
    v17 = @"RPApplicationInfoBundleIdentifier";
    v18[0] = v9;
    v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    [(RPBroadcastSampleHandler *)self broadcastAnnotatedWithApplicationInfo:v11];
LABEL_7:
  }
  else
  {
    switch(v8)
    {
      case 1:
        v12 = [(RPBroadcastSampleHandler *)self group];
        dispatch_group_enter(v12);

        v11 = [v4 objectForKeyedSubscript:@"RPBroadcastExtensionKeyExtensionUserInfo"];
        [(RPBroadcastSampleHandler *)self broadcastStartedWithSetupInfo:v11];
        v13 = [(RPBroadcastSampleHandler *)self group];
        dispatch_group_leave(v13);

        goto LABEL_7;
      case 2:
        [(RPBroadcastSampleHandler *)self broadcastPaused];
        break;
      case 3:
        [(RPBroadcastSampleHandler *)self broadcastResumed];
        break;
      case 4:
        v14 = [(RPBroadcastSampleHandler *)self group];
        dispatch_group_enter(v14);

        [(RPBroadcastSampleHandler *)self broadcastFinished];
        v15 = [(RPBroadcastSampleHandler *)self group];
        dispatch_group_leave(v15);

        v16 = [(RPBroadcastHandler *)self extensionContext];
        [v16 completeRequestReturningItems:MEMORY[0x263EFFA68] completionHandler:&__block_literal_global_19];

        break;
      default:
        break;
    }
  }
}

void __44__RPBroadcastSampleHandler__processPayload___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v0 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "completed extension request", v0, 2u);
  }
}

- (void)_processPayloadWithVideoSample:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.duration.value) = 136446466;
    *(CMTimeValue *)((char *)&buf.duration.value + 4) = (CMTimeValue)"-[RPBroadcastSampleHandler _processPayloadWithVideoSample:]";
    LOWORD(buf.duration.flags) = 1024;
    *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = 150;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Broadcast extension received video payload from replayd", (uint8_t *)&buf, 0x12u);
  }
  v5 = [v4 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyIOSurface"];
  uint64_t v6 = [v5 ioSurface];
  if (v6)
  {
    v7 = (__IOSurface *)v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyTimingInfo"];
    memset(&buf, 0, sizeof(buf));
    [v8 getBytes:&buf length:72];
    CMSampleTimingInfo v11 = buf;
    CMSampleBufferRef v9 = RPSampleBufferUtilities_CreateSampleBufferFromIOSurface(v7, &v11);
    v10 = [v4 objectForKeyedSubscript:@"RPSampleBufferVideoOrientation"];

    CMSetAttachment(v9, @"RPSampleBufferVideoOrientation", v10, 0);
    if (v9)
    {
      [(RPBroadcastSampleHandler *)self processSampleBuffer:v9 withType:1];
      CFRelease(v9);
    }
    else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[RPBroadcastSampleHandler _processPayloadWithVideoSample:]();
    }
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[RPBroadcastSampleHandler _processPayloadWithVideoSample:]();
  }
}

- (void)_processPayloadWithAudioSample:(id)a3 type:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    CMSampleBufferRef v9 = "-[RPBroadcastSampleHandler _processPayloadWithAudioSample:type:]";
    __int16 v10 = 1024;
    int v11 = 180;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Broadcast extension received audio payload from replayd", (uint8_t *)&v8, 0x12u);
  }
  CMSampleBufferRef DecodeAudioSampleBuffer = RPSampleBufferUtilities_CreateDecodeAudioSampleBuffer(v6);
  [(RPBroadcastSampleHandler *)self processSampleBuffer:DecodeAudioSampleBuffer withType:a4];
  if (DecodeAudioSampleBuffer) {
    CFRelease(DecodeAudioSampleBuffer);
  }
}

- (void)processPayload:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  [(RPBroadcastSampleHandler *)self _processPayload:a3];
  v6[2]();
}

- (void)_setupListenerWithEndpoint:(id)a3
{
  v20[8] = *MEMORY[0x263EF8340];
  id v4 = (objc_class *)MEMORY[0x263F08D68];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithListenerEndpoint:v5];

  [(RPBroadcastHandler *)self setConnection:v6];
  v7 = [(RPBroadcastHandler *)self connection];
  [v7 setExportedObject:self];

  int v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D138FE0];
  CMSampleBufferRef v9 = (void *)MEMORY[0x263EFFA08];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v20[2] = objc_opt_class();
  v20[3] = objc_opt_class();
  v20[4] = objc_opt_class();
  v20[5] = objc_opt_class();
  v20[6] = objc_opt_class();
  v20[7] = objc_opt_class();
  __int16 v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:8];
  int v11 = [v9 setWithArray:v10];
  [v8 setClasses:v11 forSelector:sel_processPayload_completion_ argumentIndex:0 ofReply:0];

  uint64_t v12 = [(RPBroadcastHandler *)self connection];
  [v12 setExportedInterface:v8];

  uint64_t v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D139048];
  v14 = [(RPBroadcastHandler *)self connection];
  [v14 setRemoteObjectInterface:v13];

  v15 = [(RPBroadcastHandler *)self connection];
  [v15 setInvalidationHandler:&__block_literal_global_93];

  v16 = [(RPBroadcastHandler *)self connection];
  [v16 setInterruptionHandler:&__block_literal_global_96];

  v17 = [(RPBroadcastHandler *)self connection];
  [v17 resume];

  v18 = [(RPBroadcastHandler *)self connection];
  v19 = [v18 remoteObjectProxyWithErrorHandler:&__block_literal_global_100];
  [(RPBroadcastSampleHandler *)self setDaemonProxy:v19];

  [(RPBroadcastDaemonProtocol *)self->_daemonProxy ping];
}

void __55__RPBroadcastSampleHandler__setupListenerWithEndpoint___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v0 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "connection to replayd invalidated", v0, 2u);
  }
}

void __55__RPBroadcastSampleHandler__setupListenerWithEndpoint___block_invoke_94()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v0 = 0;
    _os_log_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "connection to replayd interrupted", v0, 2u);
  }
}

void __55__RPBroadcastSampleHandler__setupListenerWithEndpoint___block_invoke_97(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __55__RPBroadcastSampleHandler__setupListenerWithEndpoint___block_invoke_97_cold_1(a2);
  }
}

- (RPBroadcastDaemonProtocol)daemonProxy
{
  return self->_daemonProxy;
}

- (void)setDaemonProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_processPayloadWithVideoSample:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  int v1 = 155;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Invalid video sample", v0, 0x12u);
}

- (void)_processPayloadWithVideoSample:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_1();
  int v1 = 173;
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Invalid sample buffer", v0, 0x12u);
}

void __55__RPBroadcastSampleHandler__setupListenerWithEndpoint___block_invoke_97_cold_1(void *a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = [a1 code];
  _os_log_error_impl(&dword_21F69F000, &_os_log_internal, OS_LOG_TYPE_ERROR, "error = %d", (uint8_t *)v1, 8u);
}

@end