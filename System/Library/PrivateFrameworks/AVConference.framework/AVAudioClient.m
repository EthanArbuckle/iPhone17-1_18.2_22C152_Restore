@interface AVAudioClient
+ (BOOL)hasActiveAudioSession;
+ (BOOL)isMicrophoneMuted;
+ (BOOL)isMixingVoiceWithMediaEnabled;
+ (BOOL)setInputDevice:(id)a3;
+ (BOOL)setOutputDevice:(id)a3;
+ (id)currentInputDevice;
+ (id)currentOutputDevice;
+ (id)defaultInputDevice;
+ (id)defaultOutputDevice;
+ (id)sharedInstance;
+ (int)registerForMutedTalkerNotifications:(id)a3;
+ (int)setMuteStateChangedHandler:(id)a3;
+ (int)unregisterFromMutedTalkerNotifications;
+ (void)registerSecureMicrophoneEngagedHandler:(id)a3;
+ (void)resetAudioSessionOutputPortOverride;
+ (void)setAudioSessionProperties:(id)a3;
+ (void)setFollowSystemInputEnabled:(BOOL)a3;
+ (void)setFollowSystemOutputEnabled:(BOOL)a3;
+ (void)setMicrophoneMuted:(BOOL)a3;
+ (void)setMixingVoiceWithMediaEnabled:(BOOL)a3;
+ (void)startAudioSession;
+ (void)startAudioSessionWithCompletionHandler:(id)a3;
+ (void)stopAudioSession;
- (AVAudioClient)init;
- (AVAudioDevice)currentInputDevice;
- (AVAudioDevice)currentOutputDevice;
- (AVAudioDeviceList)deviceList;
- (BOOL)hasActiveAudioSession;
- (BOOL)isMicrophoneMuted;
- (BOOL)isMixingVoiceWithMediaEnabled;
- (BOOL)reregisterClientSideHandlersOverXPC;
- (BOOL)reregisterMuteStateChangedHandlerOverXPC;
- (BOOL)reregisterMutedTalkerNotificationOverXPC;
- (BOOL)setInputDevice:(id)a3;
- (BOOL)setOutputDevice:(id)a3;
- (BOOL)setupXPCConnection;
- (BOOL)shouldSetUpXPCConnection;
- (id)changeListener;
- (id)devices;
- (id)initSharedInstance;
- (id)inputDevices;
- (id)outputDevices;
- (id)sendMessageSync:(char *)a3 arguments:(id)a4;
- (int)registerForMutedTalkerNotifications:(id)a3;
- (int)setMuteStateChangedEventHandler:(id)a3;
- (int)unregisterFromMutedTalkerNotifications;
- (void)cleanUpMuteStateChangedHandler;
- (void)cleanupMutedTalkerNotificationHandler;
- (void)cleanupSecureMicrophoneEngagedHandler;
- (void)cleanupXPCConnection;
- (void)dealloc;
- (void)dispatchedHandleMuteStateChangedEventWithXPCArguments:(id)a3;
- (void)handleMutedTalkerNotificationWithXPCArguments:(id)a3;
- (void)initSharedInstance;
- (void)registerBlocksForDelegateNotifications;
- (void)registerSecureMicrophoneEngagedHandler:(id)a3;
- (void)resetAudioSessionOutputPortOverride;
- (void)resetXPCConnection;
- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 reply:(id)a5;
- (void)setAudioSessionProperties:(id)a3;
- (void)setChangeListener:(id)a3;
- (void)setDeviceList:(id)a3;
- (void)setFollowSystemInputEnabled:(BOOL)a3;
- (void)setFollowSystemOutputEnabled:(BOOL)a3;
- (void)setMicrophoneMuted:(BOOL)a3;
- (void)setMixingVoiceWithMediaEnabled:(BOOL)a3;
- (void)setupXPCConnection;
- (void)startAudioSessionWithCompletionHandler:(id)a3;
- (void)stopAudioSession;
- (void)unregisterBlocksForDelegateNotifications;
@end

@implementation AVAudioClient

+ (id)sharedInstance
{
  id result = (id)sharedInstance__sharedAudioClient;
  if (!sharedInstance__sharedAudioClient)
  {
    v3 = objc_opt_class();
    objc_sync_enter(v3);
    if (!sharedInstance__sharedAudioClient) {
      sharedInstance__sharedAudioClient = [[AVAudioClient alloc] initSharedInstance];
    }
    objc_sync_exit(v3);
    return (id)sharedInstance__sharedAudioClient;
  }
  return result;
}

- (id)initSharedInstance
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)AVAudioClient;
  v2 = [(AVAudioClient *)&v11 init];
  if (v2)
  {
    VRTraceReset();
    v2->_processId = getpid();
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.AVConference.AVAudioClient.AudioSessionQueue", 0, CustomRootQueue);
    v2->_clientAudioSessionQueue = (OS_dispatch_queue *)v4;
    if (v4)
    {
      MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-initializeAudioSessionQ");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v13 = v5;
          __int16 v14 = 2080;
          v15 = "-[AVAudioClient initSharedInstance]";
          __int16 v16 = 1024;
          int v17 = 88;
          __int16 v18 = 2048;
          v19 = v2;
          _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-initializeAudioSessionQ (%p)", buf, 0x26u);
        }
      }
      v7 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
      v2->_audioSessionRefCondVar = v7;
      if (v7)
      {
        if ([(AVAudioClient *)v2 setupXPCConnection]) {
          goto LABEL_8;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[AVAudioClient initSharedInstance]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVAudioClient initSharedInstance]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVAudioClient initSharedInstance]();
      }
    }

    v2 = 0;
  }
LABEL_8:
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-initSharedInstance");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      v15 = "-[AVAudioClient initSharedInstance]";
      __int16 v16 = 1024;
      int v17 = 106;
      __int16 v18 = 2048;
      v19 = v2;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-initSharedInstance (%p)", buf, 0x26u);
    }
  }
  return v2;
}

- (AVAudioClient)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)AVAudioClient;
  v2 = [(AVAudioClient *)&v6 init];
  if (v2)
  {
    VRTraceReset();
    v2->deviceList = objc_alloc_init(AVAudioDeviceList);
  }
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    dispatch_queue_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      v10 = "-[AVAudioClient init]";
      __int16 v11 = 1024;
      int v12 = 115;
      __int16 v13 = 2048;
      __int16 v14 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-init (%p)", buf, 0x26u);
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    dispatch_queue_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      v10 = "-[AVAudioClient dealloc]";
      __int16 v11 = 1024;
      int v12 = 120;
      __int16 v13 = 2048;
      __int16 v14 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-dealloc (%p)", buf, 0x26u);
    }
  }
  [(AVAudioClient *)self cleanupXPCConnection];

  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  if (clientAudioSessionQueue) {
    dispatch_release(clientAudioSessionQueue);
  }
  [(AVAudioClient *)self cleanupSecureMicrophoneEngagedHandler];
  [(AVAudioClient *)self cleanupMutedTalkerNotificationHandler];
  [(AVAudioClient *)self cleanUpMuteStateChangedHandler];
  [(AVAudioDeviceList *)self->deviceList setChangeListener:0];

  v6.receiver = self;
  v6.super_class = (Class)AVAudioClient;
  [(AVAudioClient *)&v6 dealloc];
}

- (BOOL)shouldSetUpXPCConnection
{
  return self->_mutedTalkerNotificationHandler || self->_muteStateChangedHandler != 0;
}

- (BOOL)reregisterMutedTalkerNotificationOverXPC
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_mutedTalkerNotificationHandler
    || (uint64_t v3 = objc_msgSend(-[AVAudioClient sendMessageSync:arguments:](self, "sendMessageSync:arguments:", "mutedTalkerRegister", 0), "objectForKeyedSubscript:", @"ERROR")) == 0)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  uint64_t v4 = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_6;
  }
  uint64_t v5 = VRTraceErrorLogLevelToCSTR();
  objc_super v6 = *MEMORY[0x1E4F47A50];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v7)
  {
    int processId = self->_processId;
    unsigned int connectionAttempts = self->_connectionAttempts;
    int v11 = 136316418;
    uint64_t v12 = v5;
    __int16 v13 = 2080;
    __int16 v14 = "-[AVAudioClient reregisterMutedTalkerNotificationOverXPC]";
    __int16 v15 = 1024;
    int v16 = 160;
    __int16 v17 = 1024;
    int v18 = processId;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    __int16 v21 = 1024;
    unsigned int v22 = connectionAttempts;
    _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to reregister the muted talker notification block. processId=%d error=%@ connectionAttempts=%u", (uint8_t *)&v11, 0x32u);
LABEL_6:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)reregisterMuteStateChangedHandlerOverXPC
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_muteStateChangedHandler
    || (uint64_t v3 = objc_msgSend(-[AVAudioClient sendMessageSync:arguments:](self, "sendMessageSync:arguments:", "muteStateChangedHandler", &unk_1F3DC8ED0), "objectForKeyedSubscript:", @"ERROR")) == 0)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  uint64_t v4 = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_6;
  }
  uint64_t v5 = VRTraceErrorLogLevelToCSTR();
  objc_super v6 = *MEMORY[0x1E4F47A50];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v7)
  {
    int processId = self->_processId;
    unsigned int connectionAttempts = self->_connectionAttempts;
    int v11 = 136316418;
    uint64_t v12 = v5;
    __int16 v13 = 2080;
    __int16 v14 = "-[AVAudioClient reregisterMuteStateChangedHandlerOverXPC]";
    __int16 v15 = 1024;
    int v16 = 184;
    __int16 v17 = 1024;
    int v18 = processId;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    __int16 v21 = 1024;
    unsigned int v22 = connectionAttempts;
    _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to reregister the mute state changed handler block. processId=%d error=%@ connectionAttempts=%u", (uint8_t *)&v11, 0x32u);
LABEL_6:
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)reregisterClientSideHandlersOverXPC
{
  BOOL v3 = [(AVAudioClient *)self reregisterMutedTalkerNotificationOverXPC];
  if (v3)
  {
    LOBYTE(v3) = [(AVAudioClient *)self reregisterMuteStateChangedHandlerOverXPC];
  }
  return v3;
}

- (BOOL)setupXPCConnection
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_alloc_init(AVConferenceXPCClient);
  self->_xpcConnection = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVAudioClient setupXPCConnection]();
      }
    }
    return 0;
  }
  [(AVConferenceXPCClient *)v3 setConnectionPersists:1];
  id v4 = [(AVConferenceXPCClient *)self->_xpcConnection sendMessageSync:"newClient" arguments:0];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"ERROR"];
  self->_mixingVoiceWithMediaEnabled = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"audioClientAudioSessionMixingVoiceWithMedia"), "BOOLValue");
  if (v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int processId = self->_processId;
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        __int16 v13 = "-[AVAudioClient setupXPCConnection]";
        __int16 v14 = 1024;
        int v15 = 222;
        __int16 v16 = 1024;
        int v17 = processId;
        __int16 v18 = 2112;
        uint64_t v19 = v5;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to initialize the server side object. processId=%d error=%@", (uint8_t *)&v10, 0x2Cu);
      }
    }
    return 0;
  }
  [(AVAudioClient *)self registerBlocksForDelegateNotifications];

  return [(AVAudioClient *)self reregisterClientSideHandlersOverXPC];
}

- (void)cleanupMutedTalkerNotificationHandler
{
  id mutedTalkerNotificationHandler = self->_mutedTalkerNotificationHandler;
  if (mutedTalkerNotificationHandler)
  {
    _Block_release(mutedTalkerNotificationHandler);
    self->_id mutedTalkerNotificationHandler = 0;
  }
}

- (void)cleanUpMuteStateChangedHandler
{
  self->_muteStateChangedHandler = 0;
}

- (void)cleanupXPCConnection
{
  if (self->_xpcConnection)
  {
    [(AVAudioClient *)self unregisterBlocksForDelegateNotifications];

    self->_xpcConnection = 0;
    *(_WORD *)&self->_followSystemInputEnabled = 0;
  }
}

- (id)sendMessageSync:(char *)a3 arguments:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
LABEL_4:
    return [(AVConferenceXPCClient *)xpcConnection sendMessageSync:a3 arguments:a4];
  }
  if ([(AVAudioClient *)self setupXPCConnection])
  {
    xpcConnection = self->_xpcConnection;
    goto LABEL_4;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    int v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int processId = self->_processId;
      *(_DWORD *)buf = 136315906;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      int v17 = "-[AVAudioClient sendMessageSync:arguments:]";
      __int16 v18 = 1024;
      int v19 = 265;
      __int16 v20 = 1024;
      int v21 = processId;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d Failed to setup the connection. processId=%d", buf, 0x22u);
    }
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "AVConferenceServiceError:detailCode:description:", 32002, 0, @"Failed to setup connection", @"ERROR");
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
}

- (void)sendMessageAsync:(char *)a3 arguments:(id)a4 reply:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
LABEL_4:
    [(AVConferenceXPCClient *)xpcConnection sendMessageAsync:a3 arguments:a4 reply:a5];
    return;
  }
  if ([(AVAudioClient *)self setupXPCConnection])
  {
    xpcConnection = self->_xpcConnection;
    goto LABEL_4;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int processId = self->_processId;
      int v13 = 136315906;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      __int16 v16 = "-[AVAudioClient sendMessageAsync:arguments:reply:]";
      __int16 v17 = 1024;
      int v18 = 273;
      __int16 v19 = 1024;
      int v20 = processId;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d Failed to setup the connection. processId=%d", (uint8_t *)&v13, 0x22u);
    }
  }
  if (a5) {
    (*((void (**)(id, void, uint64_t))a5 + 2))(a5, 0, [MEMORY[0x1E4F28C58] AVConferenceServiceError:32002 detailCode:0 description:@"Failed to setup connection"]);
  }
}

- (void)startAudioSessionWithCompletionHandler:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVAudioClient_startAudioSessionWithCompletionHandler___block_invoke;
  block[3] = &unk_1E6DB5178;
  block[4] = self;
  block[5] = a3;
  dispatch_async(clientAudioSessionQueue, block);
}

uint64_t __56__AVAudioClient_startAudioSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    BOOL v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v4 + 57)) {
        uint64_t v5 = "Redundant";
      }
      else {
        uint64_t v5 = "New";
      }
      int v6 = *(_DWORD *)(v4 + 84);
      *(_DWORD *)buf = 136316162;
      uint64_t v13 = v2;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVAudioClient startAudioSessionWithCompletionHandler:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 288;
      __int16 v18 = 2080;
      __int16 v19 = v5;
      __int16 v20 = 1024;
      int v21 = v6;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d %s startAudioSession call from client. processId=%d", buf, 0x2Cu);
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 57) = 1;
  uint64_t v10 = @"startAudioSession";
  uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__AVAudioClient_startAudioSessionWithCompletionHandler___block_invoke_33;
  v9[3] = &unk_1E6DB7D80;
  return [*(id *)(a1 + 32) sendMessageAsync:"audioSession" arguments:v7 reply:v9];
}

uint64_t __56__AVAudioClient_startAudioSessionWithCompletionHandler___block_invoke_33(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (!a3 || [a3 code] == 32025 || objc_msgSend(a3, "code") == 32005)
    && ([*(id *)(*(void *)(a1 + 32) + 64) lock],
        *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1,
        [*(id *)(*(void *)(a1 + 32) + 64) signal],
        [*(id *)(*(void *)(a1 + 32) + 64) unlock],
        !a3)
    && *(unsigned char *)(*(void *)(a1 + 32) + 56) != 0;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-didStart");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = *(_DWORD *)(v8 + 84);
      int v12 = 136316930;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      __int16 v15 = "-[AVAudioClient startAudioSessionWithCompletionHandler:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 309;
      __int16 v18 = 2048;
      uint64_t v19 = v8;
      __int16 v20 = 1024;
      int v21 = v10;
      __int16 v22 = 2048;
      uint64_t v23 = v9;
      __int16 v24 = 1024;
      BOOL v25 = v5;
      __int16 v26 = 2112;
      v27 = a3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-didStart (%p), processId=%d, completionHandler=%p, didSucceed=%d, error=%@", (uint8_t *)&v12, 0x46u);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, void *))(result + 16))(result, v5, a3);
  }
  return result;
}

- (void)setAudioSessionProperties:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    clientAudioSessionQueue = self->_clientAudioSessionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__AVAudioClient_setAudioSessionProperties___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = a3;
    block[5] = self;
    dispatch_async(clientAudioSessionQueue, block);
  }
}

uint64_t __43__AVAudioClient_setAudioSessionProperties___block_invoke(uint64_t a1)
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v3[0] = @"setAudioSessionProperties";
  v3[1] = @"audioClientAudioSessionParams";
  v4[0] = [MEMORY[0x1E4F1CA98] null];
  v4[1] = *(void *)(a1 + 32);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessageAsync:arguments:reply:", "audioSession", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v4, v3, 2), &__block_literal_global_109);
}

void __43__AVAudioClient_setAudioSessionProperties___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    BOOL v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[AVAudioClient setAudioSessionProperties:]_block_invoke_2";
      __int16 v10 = 1024;
      int v11 = 330;
      __int16 v12 = 2112;
      uint64_t v13 = a3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d setAudioSessionProperties failed with error=%@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)stopAudioSession
{
  v3[5] = *MEMORY[0x1E4F143B8];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __33__AVAudioClient_stopAudioSession__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(clientAudioSessionQueue, v3);
}

void __33__AVAudioClient_stopAudioSession__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 57)) {
    goto LABEL_5;
  }
  [*(id *)(v2 + 64) lock];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 56)
    || (char v4 = objc_msgSend(*(id *)(v3 + 64), "waitUntilDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", 5.0)), v3 = *(void *)(a1 + 32), (v4 & 1) != 0))
  {
    *(unsigned char *)(v3 + 56) = 0;
    [*(id *)(*(void *)(a1 + 32) + 64) unlock];
LABEL_5:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        if (*(unsigned char *)(v7 + 57)) {
          __int16 v8 = "New";
        }
        else {
          __int16 v8 = "Redundant";
        }
        int v9 = *(_DWORD *)(v7 + 84);
        *(_DWORD *)buf = 136316162;
        uint64_t v14 = v5;
        __int16 v15 = 2080;
        __int16 v16 = "-[AVAudioClient stopAudioSession]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 355;
        __int16 v19 = 2080;
        __int16 v20 = v8;
        __int16 v21 = 1024;
        int v22 = v9;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d %s stopAudioSession call from client. processId=%d", buf, 0x2Cu);
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 57) = 0;
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", @"stopAudioSession");
    objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSession", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), 0);
    return;
  }
  [*(id *)(v3 + 64) unlock];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __33__AVAudioClient_stopAudioSession__block_invoke_cold_1(v10);
    }
  }
}

- (void)resetAudioSessionOutputPortOverride
{
  v3[5] = *MEMORY[0x1E4F143B8];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  void v3[2] = __52__AVAudioClient_resetAudioSessionOutputPortOverride__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(clientAudioSessionQueue, v3);
}

uint64_t __52__AVAudioClient_resetAudioSessionOutputPortOverride__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 84);
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v2;
      __int16 v10 = 2080;
      uint64_t v11 = "-[AVAudioClient resetAudioSessionOutputPortOverride]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 370;
      __int16 v14 = 1024;
      int v15 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
    }
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", @"resetAudioSessionOutputPortOverride");
  return objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSession", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1), 0);
}

- (BOOL)hasActiveAudioSession
{
  [(NSCondition *)self->_audioSessionRefCondVar lock];
  BOOL audioSessionIsActive = self->_audioSessionIsActive;
  [(NSCondition *)self->_audioSessionRefCondVar unlock];
  return audioSessionIsActive;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AVAudioClient_setMicrophoneMuted___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(clientAudioSessionQueue, block);
}

uint64_t __36__AVAudioClient_setMicrophoneMuted___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 84);
      *(_DWORD *)buf = 136315906;
      uint64_t v9 = v2;
      __int16 v10 = 2080;
      uint64_t v11 = "-[AVAudioClient setMicrophoneMuted:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 392;
      __int16 v14 = 1024;
      int v15 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
    }
  }
  v6[1] = @"audioClientAudioSessionMute";
  v7[0] = objc_msgSend(MEMORY[0x1E4F1CA98], "null", @"setMute");
  v7[1] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  return objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSession", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v7, v6, 2), 0);
}

- (BOOL)isMicrophoneMuted
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AVAudioClient_isMicrophoneMuted__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(clientAudioSessionQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__AVAudioClient_isMicrophoneMuted__block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  char v3 = @"getMute";
  v4[0] = [MEMORY[0x1E4F1CA98] null];
  uint64_t result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSession", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1)), "objectForKeyedSubscript:", @"audioClientAudioSessionMute"), "BOOLValue");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setMixingVoiceWithMediaEnabled:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int processId = self->_processId;
      *(_DWORD *)buf = 136315906;
      uint64_t v12 = v5;
      __int16 v13 = 2080;
      __int16 v14 = "-[AVAudioClient setMixingVoiceWithMediaEnabled:]";
      __int16 v15 = 1024;
      int v16 = 418;
      __int16 v17 = 1024;
      int v18 = processId;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
    }
  }
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__AVAudioClient_setMixingVoiceWithMediaEnabled___block_invoke;
  v9[3] = &unk_1E6DB3DF0;
  void v9[4] = self;
  BOOL v10 = a3;
  dispatch_async(clientAudioSessionQueue, v9);
}

void __48__AVAudioClient_setMixingVoiceWithMediaEnabled___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(*(void *)(a1 + 32) + 80) == v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      int v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 80);
        int v6 = 136315906;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        char v9 = "-[AVAudioClient setMixingVoiceWithMediaEnabled:]_block_invoke";
        __int16 v10 = 1024;
        int v11 = 426;
        __int16 v12 = 1024;
        int v13 = v5;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d ignoring, isMixingVoiceWithMediaEnabled already set to %d", (uint8_t *)&v6, 0x22u);
      }
    }
  }
  else
  {
    __int16 v14 = @"audioClientAudioSessionMixingVoiceWithMedia";
    v15[0] = [NSNumber numberWithBool:v2 != 0];
    objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSessionVoiceMixing", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1));
    *(unsigned char *)(*(void *)(a1 + 32) + 80) = *(unsigned char *)(a1 + 40);
  }
}

- (BOOL)isMixingVoiceWithMediaEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVAudioClient_isMixingVoiceWithMediaEnabled__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(clientAudioSessionQueue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__AVAudioClient_isMixingVoiceWithMediaEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

- (AVAudioDevice)currentInputDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__43;
  int v11 = __Block_byref_object_dispose__43;
  uint64_t v12 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AVAudioClient_currentInputDevice__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(clientAudioSessionQueue, block);
  id v3 = (id)v8[5];
  int v4 = (AVAudioDevice *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __35__AVAudioClient_currentInputDevice__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  int v5 = @"getCurrentAudioInputDevice";
  v6[0] = [MEMORY[0x1E4F1CA98] null];
  int v2 = objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSession", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  id v3 = (void *)[v2 objectForKeyedSubscript:@"audioClientAudioDevice"];
  uint64_t result = objc_msgSend(v3, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)+[AVAudioDeviceList deviceForUID:](AVAudioDeviceList, "deviceForUID:", [v2 objectForKeyedSubscript:@"audioClientAudioDevice"]);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (AVAudioDevice)currentOutputDevice
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__43;
  int v11 = __Block_byref_object_dispose__43;
  uint64_t v12 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__AVAudioClient_currentOutputDevice__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  void block[5] = &v7;
  dispatch_sync(clientAudioSessionQueue, block);
  id v3 = (id)v8[5];
  int v4 = (AVAudioDevice *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __36__AVAudioClient_currentOutputDevice__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  int v5 = @"getCurrentAudioOutputDevice";
  v6[0] = [MEMORY[0x1E4F1CA98] null];
  int v2 = objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSession", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  id v3 = (void *)[v2 objectForKeyedSubscript:@"audioClientAudioDevice"];
  uint64_t result = objc_msgSend(v3, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)+[AVAudioDeviceList deviceForUID:](AVAudioDeviceList, "deviceForUID:", [v2 objectForKeyedSubscript:@"audioClientAudioDevice"]);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)setInputDevice:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a3 UID])
  {
    uint64_t v10 = 0;
    int v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    clientAudioSessionQueue = self->_clientAudioSessionQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__AVAudioClient_setInputDevice___block_invoke;
    v9[3] = &unk_1E6DB6928;
    void v9[4] = self;
    void v9[5] = a3;
    v9[6] = &v10;
    dispatch_async(clientAudioSessionQueue, v9);
    BOOL v6 = *((unsigned char *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVAudioClient setInputDevice:](v7, a3);
      }
    }
    return 0;
  }
  return v6;
}

void *__32__AVAudioClient_setInputDevice___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    id v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 84);
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVAudioClient setInputDevice:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 496;
      __int16 v15 = 1024;
      int v16 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
    }
  }
  v7[1] = @"audioClientAudioDevice";
  v8[0] = objc_msgSend(MEMORY[0x1E4F1CA98], "null", @"setCurrentAudioInputDevice");
  v8[1] = [*(id *)(a1 + 40) UID];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSession", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  if (result)
  {
    BOOL v6 = result;
    uint64_t result = (void *)[result objectForKeyedSubscript:@"ERROR"];
    if (!result)
    {
      uint64_t result = (void *)[v6 objectForKeyedSubscript:@"SERVERDIED"];
      if (!result) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
  }
  return result;
}

- (BOOL)setOutputDevice:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a3 UID])
  {
    uint64_t v10 = 0;
    __int16 v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    clientAudioSessionQueue = self->_clientAudioSessionQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__AVAudioClient_setOutputDevice___block_invoke;
    v9[3] = &unk_1E6DB6928;
    void v9[4] = self;
    void v9[5] = a3;
    v9[6] = &v10;
    dispatch_async(clientAudioSessionQueue, v9);
    BOOL v6 = *((unsigned char *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVAudioClient setOutputDevice:](v7, a3);
      }
    }
    return 0;
  }
  return v6;
}

void *__33__AVAudioClient_setOutputDevice___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    id v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 84);
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v2;
      __int16 v11 = 2080;
      uint64_t v12 = "-[AVAudioClient setOutputDevice:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 522;
      __int16 v15 = 1024;
      int v16 = v4;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
    }
  }
  v7[1] = @"audioClientAudioDevice";
  v8[0] = objc_msgSend(MEMORY[0x1E4F1CA98], "null", @"setCurrentAudioOutputDevice");
  v8[1] = [*(id *)(a1 + 40) UID];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "audioSession", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
  if (result)
  {
    BOOL v6 = result;
    uint64_t result = (void *)[result objectForKeyedSubscript:@"ERROR"];
    if (!result)
    {
      uint64_t result = (void *)[v6 objectForKeyedSubscript:@"SERVERDIED"];
      if (!result) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
    }
  }
  return result;
}

- (void)setFollowSystemInputEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AVAudioClient_setFollowSystemInputEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(clientAudioSessionQueue, block);
}

void __45__AVAudioClient_setFollowSystemInputEnabled___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 81);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2 == v3)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 81);
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = v5;
        __int16 v15 = 2080;
        int v16 = "-[AVAudioClient setFollowSystemInputEnabled:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 549;
        __int16 v19 = 1024;
        int v20 = v7;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d ignoring, _followSystemInputEnabled=%d already", buf, 0x22u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 84);
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = v8;
        __int16 v15 = 2080;
        int v16 = "-[AVAudioClient setFollowSystemInputEnabled:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 544;
        __int16 v19 = 1024;
        int v20 = v10;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
      }
    }
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40), @"audioClientFollowSystemInput");
    objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSessionFollowSystemInput", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), 0);
    *(unsigned char *)(*(void *)(a1 + 32) + 81) = *(unsigned char *)(a1 + 40);
  }
}

- (void)setFollowSystemOutputEnabled:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AVAudioClient_setFollowSystemOutputEnabled___block_invoke;
  block[3] = &unk_1E6DB3DF0;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async(clientAudioSessionQueue, block);
}

void __46__AVAudioClient_setFollowSystemOutputEnabled___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 82);
  int v3 = *(unsigned __int8 *)(a1 + 40);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2 == v3)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 82);
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = v5;
        __int16 v15 = 2080;
        int v16 = "-[AVAudioClient setFollowSystemOutputEnabled:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 572;
        __int16 v19 = 1024;
        int v20 = v7;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d ignoring, _followSystemOutputEnabled=%d already", buf, 0x22u);
      }
    }
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 84);
        *(_DWORD *)buf = 136315906;
        uint64_t v14 = v8;
        __int16 v15 = 2080;
        int v16 = "-[AVAudioClient setFollowSystemOutputEnabled:]_block_invoke";
        __int16 v17 = 1024;
        int v18 = 567;
        __int16 v19 = 1024;
        int v20 = v10;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d processId=%d", buf, 0x22u);
      }
    }
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40), @"audioClientFollowSystemOutput");
    objc_msgSend(*(id *)(a1 + 32), "sendMessageAsync:arguments:reply:", "audioSessionFollowSystemOutput", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), 0);
    *(unsigned char *)(*(void *)(a1 + 32) + 82) = *(unsigned char *)(a1 + 40);
  }
}

- (int)registerForMutedTalkerNotifications:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    int v11 = 0;
    clientAudioSessionQueue = self->_clientAudioSessionQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __53__AVAudioClient_registerForMutedTalkerNotifications___block_invoke;
    v7[3] = &unk_1E6DB3E90;
    v7[5] = a3;
    v7[6] = &v8;
    v7[4] = self;
    dispatch_sync(clientAudioSessionQueue, v7);
    int v4 = *((_DWORD *)v9 + 6);
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    int v4 = 1768846960;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVAudioClient registerForMutedTalkerNotifications:](v5);
      }
    }
  }
  return v4;
}

void __53__AVAudioClient_registerForMutedTalkerNotifications___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1634887015;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __53__AVAudioClient_registerForMutedTalkerNotifications___block_invoke_cold_1();
      }
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 24) = _Block_copy(*(const void **)(a1 + 40));
    uint64_t v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "mutedTalkerRegister", 0), "objectForKeyedSubscript:", @"ERROR");
    if (v3)
    {
      int v4 = (void *)v3;
      [*(id *)(a1 + 32) cleanupMutedTalkerNotificationHandler];
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 code];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v7 = *(_DWORD *)(*(void *)v2 + 84);
          int v8 = 136316162;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          int v11 = "-[AVAudioClient registerForMutedTalkerNotifications:]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 622;
          __int16 v14 = 1024;
          int v15 = v7;
          __int16 v16 = 2112;
          __int16 v17 = v4;
          _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to register the muted talker notification block. processId=%d error=%@", (uint8_t *)&v8, 0x2Cu);
        }
      }
    }
  }
}

- (int)unregisterFromMutedTalkerNotifications
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AVAudioClient_unregisterFromMutedTalkerNotifications__block_invoke;
  block[3] = &unk_1E6DB3EB8;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(clientAudioSessionQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __55__AVAudioClient_unregisterFromMutedTalkerNotifications__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[3])
  {
    int v4 = objc_msgSend((id)objc_msgSend(v2, "sendMessageSync:arguments:", "mutedTalkerUnregister", 0), "objectForKeyedSubscript:", @"ERROR");
    [*v3 cleanupMutedTalkerNotificationHandler];
    if (v4)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 code];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v7 = *((_DWORD *)*v3 + 21);
          int v8 = 136316162;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          int v11 = "-[AVAudioClient unregisterFromMutedTalkerNotifications]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 657;
          __int16 v14 = 1024;
          int v15 = v7;
          __int16 v16 = 2112;
          __int16 v17 = v4;
          _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to unregister the muted talker notification block. processId=%d error=%@", (uint8_t *)&v8, 0x2Cu);
        }
      }
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1752066412;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __55__AVAudioClient_unregisterFromMutedTalkerNotifications__block_invoke_cold_1();
      }
    }
  }
}

- (void)handleMutedTalkerNotificationWithXPCArguments:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v4 = (void *)[a3 objectForKeyedSubscript:@"mutedTalkerNotificationType"];
  uint64_t v5 = v4;
  if (!self->_mutedTalkerNotificationHandler)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    int v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int processId = self->_processId;
    int v17 = 136316162;
    uint64_t v18 = v10;
    __int16 v19 = 2080;
    int v20 = "-[AVAudioClient handleMutedTalkerNotificationWithXPCArguments:]";
    __int16 v21 = 1024;
    int v22 = 668;
    __int16 v23 = 1024;
    int v24 = processId;
    __int16 v25 = 2112;
    __int16 v26 = v5;
    int v13 = "AVCAudioClient [%s] %s:%d Notification received but handler is not registered processId=%d notificationType=%@";
    goto LABEL_18;
  }
  int v6 = [v4 unsignedIntValue];
  if (v6 != 1)
  {
    if (!v6)
    {
      (*((void (**)(void))self->_mutedTalkerNotificationHandler + 2))();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        int v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136315650;
          uint64_t v18 = v7;
          __int16 v19 = 2080;
          int v20 = "-[AVAudioClient handleMutedTalkerNotificationWithXPCArguments:]";
          __int16 v21 = 1024;
          int v22 = 674;
          uint64_t v9 = "AVCAudioClient [%s] %s:%d MutedTalkerNotificationHandler Begin";
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, 0x1Cu);
          return;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    int v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v16 = self->_processId;
    int v17 = 136316162;
    uint64_t v18 = v15;
    __int16 v19 = 2080;
    int v20 = "-[AVAudioClient handleMutedTalkerNotificationWithXPCArguments:]";
    __int16 v21 = 1024;
    int v22 = 681;
    __int16 v23 = 1024;
    int v24 = v16;
    __int16 v25 = 2112;
    __int16 v26 = v5;
    int v13 = "AVCAudioClient [%s] %s:%d Unknown notification type. processId=%d notificationType=%@";
LABEL_18:
    _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v17, 0x2Cu);
    return;
  }
  (*((void (**)(void))self->_mutedTalkerNotificationHandler + 2))();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    int v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      int v20 = "-[AVAudioClient handleMutedTalkerNotificationWithXPCArguments:]";
      __int16 v21 = 1024;
      int v22 = 678;
      uint64_t v9 = "AVCAudioClient [%s] %s:%d MutedTalkerNotificationHandler End";
      goto LABEL_13;
    }
  }
}

- (int)setMuteStateChangedEventHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __49__AVAudioClient_setMuteStateChangedEventHandler___block_invoke;
  v6[3] = &unk_1E6DB9F38;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v7;
  dispatch_sync(clientAudioSessionQueue, v6);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__AVAudioClient_setMuteStateChangedEventHandler___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v1 + 32);
  if (v3 != v2)
  {
    _Block_release(*(const void **)(v1 + 32));
    *(void *)(*(void *)(a1 + 32) + 32) = _Block_copy(*(const void **)(a1 + 40));
    if (v3) {
      BOOL v5 = v2 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      int v24 = @"muteStateChangedEnableHandler";
      v25[0] = [NSNumber numberWithInt:*(void *)(*(void *)(a1 + 32) + 32) != 0];
      uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sendMessageSync:arguments:", "muteStateChangedHandler", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1)), "objectForKeyedSubscript:", @"ERROR");
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        [*(id *)(a1 + 32) cleanUpMuteStateChangedHandler];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 code];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          uint64_t v9 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v10 = *(void *)(a1 + 40);
            int v11 = *(_DWORD *)(*(void *)(a1 + 32) + 84);
            int v12 = 136316418;
            uint64_t v13 = v8;
            __int16 v14 = 2080;
            uint64_t v15 = "-[AVAudioClient setMuteStateChangedEventHandler:]_block_invoke";
            __int16 v16 = 1024;
            int v17 = 718;
            __int16 v18 = 1024;
            int v19 = v11;
            __int16 v20 = 2112;
            uint64_t v21 = v10;
            __int16 v22 = 2112;
            __int16 v23 = v7;
            _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Failed to set the muted state changed handler block. processId=%d handler=%@ error=%@", (uint8_t *)&v12, 0x36u);
          }
        }
      }
    }
  }
}

- (void)dispatchedHandleMuteStateChangedEventWithXPCArguments:(id)a3
{
  *(void *)&v31[5] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientAudioSessionQueue);
  int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"muteStateChangedMuteState"), "BOOLValue");
  uint64_t v6 = (void *)[a3 objectForKeyedSubscript:@"muteStateChangedReason"];
  uint64_t v7 = v6;
  if (!self->_muteStateChangedHandler)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int processId = self->_processId;
    int v22 = 136316418;
    uint64_t v23 = v12;
    __int16 v24 = 2080;
    __int16 v25 = "-[AVAudioClient dispatchedHandleMuteStateChangedEventWithXPCArguments:]";
    __int16 v26 = 1024;
    int v27 = 737;
    __int16 v28 = 1024;
    int v29 = processId;
    __int16 v30 = 1024;
    v31[0] = v5;
    LOWORD(v31[1]) = 2112;
    *(void *)((char *)&v31[1] + 2) = v7;
    uint64_t v15 = "AVCAudioClient [%s] %s:%d Notification received but handler is not registered processId=%d isMuted=%{BOOL}d reason=%@";
    __int16 v16 = v13;
    uint32_t v17 = 50;
    goto LABEL_18;
  }
  int v8 = [v6 unsignedCharValue];
  if (v8 != 1)
  {
    if (!v8)
    {
      (*((void (**)(void))self->_muteStateChangedHandler + 2))();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 136315906;
          uint64_t v23 = v9;
          __int16 v24 = 2080;
          __int16 v25 = "-[AVAudioClient dispatchedHandleMuteStateChangedEventWithXPCArguments:]";
          __int16 v26 = 1024;
          int v27 = 743;
          __int16 v28 = 1024;
          int v29 = v5;
          int v11 = "AVCAudioClient [%s] %s:%d Mute State Changed - Client Initiated, isMuted=%{BOOL}d";
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v22, 0x22u);
          return;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v21 = self->_processId;
    int v22 = 136316162;
    uint64_t v23 = v19;
    __int16 v24 = 2080;
    __int16 v25 = "-[AVAudioClient dispatchedHandleMuteStateChangedEventWithXPCArguments:]";
    __int16 v26 = 1024;
    int v27 = 750;
    __int16 v28 = 1024;
    int v29 = v21;
    __int16 v30 = 2112;
    *(void *)v31 = v7;
    uint64_t v15 = "AVCAudioClient [%s] %s:%d Unknown mute reason type, dropping notification. processId=%d reason=%@";
    __int16 v16 = v20;
    uint32_t v17 = 44;
LABEL_18:
    _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v22, v17);
    return;
  }
  (*((void (**)(void))self->_muteStateChangedHandler + 2))();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136315906;
      uint64_t v23 = v18;
      __int16 v24 = 2080;
      __int16 v25 = "-[AVAudioClient dispatchedHandleMuteStateChangedEventWithXPCArguments:]";
      __int16 v26 = 1024;
      int v27 = 747;
      __int16 v28 = 1024;
      int v29 = v5;
      int v11 = "AVCAudioClient [%s] %s:%d Mute State Changed - Hardware Initiated, isMuted=%{BOOL}d";
      goto LABEL_13;
    }
  }
}

- (void)cleanupSecureMicrophoneEngagedHandler
{
  id secureMicrophoneEngagedHandler = self->_secureMicrophoneEngagedHandler;
  if (secureMicrophoneEngagedHandler)
  {
    _Block_release(secureMicrophoneEngagedHandler);
    self->_id secureMicrophoneEngagedHandler = 0;
  }
}

- (void)registerSecureMicrophoneEngagedHandler:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  clientAudioSessionQueue = self->_clientAudioSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVAudioClient_registerSecureMicrophoneEngagedHandler___block_invoke;
  block[3] = &unk_1E6DB5178;
  block[4] = self;
  void block[5] = a3;
  dispatch_sync(clientAudioSessionQueue, block);
}

void *__56__AVAudioClient_registerSecureMicrophoneEngagedHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanupSecureMicrophoneEngagedHandler];
  uint64_t result = *(void **)(a1 + 40);
  if (result)
  {
    uint64_t result = _Block_copy(result);
    *(void *)(*(void *)(a1 + 32) + 48) = result;
  }
  return result;
}

- (void)resetXPCConnection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientAudioSessionQueue);
  [(AVAudioClient *)self cleanupXPCConnection];
  if ([(AVAudioClient *)self shouldSetUpXPCConnection])
  {
    unsigned int v3 = self->_connectionAttempts + 1;
    self->_unsigned int connectionAttempts = v3;
    if ((double)v3 + (double)v3 > 10.0) {
      double v4 = 10.0;
    }
    else {
      double v4 = 2.0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int connectionAttempts = self->_connectionAttempts;
        *(_DWORD *)buf = 136316162;
        uint64_t v12 = v5;
        __int16 v13 = 2080;
        __int16 v14 = "-[AVAudioClient resetXPCConnection]";
        __int16 v15 = 1024;
        int v16 = 793;
        __int16 v17 = 2048;
        double v18 = v4;
        __int16 v19 = 1024;
        unsigned int v20 = connectionAttempts;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d Retrying connection to server with delayInSeconds=%g connectionAttempts=%u", buf, 0x2Cu);
      }
    }
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    current_queue = dispatch_get_current_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__AVAudioClient_resetXPCConnection__block_invoke;
    block[3] = &unk_1E6DB3DC8;
    block[4] = self;
    dispatch_after(v8, current_queue, block);
  }
}

uint64_t __35__AVAudioClient_resetXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setupXPCConnection];
  if (result) {
    *(_DWORD *)(*(void *)(a1 + 32) + 16) = 0;
  }
  return result;
}

- (void)registerBlocksForDelegateNotifications
{
  v7[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke;
  v7[3] = &unk_1E6DB4338;
  v7[4] = v3;
  [(AVConferenceXPCClient *)self->_xpcConnection registerBlockForService:"mutedTalkerNotification" block:v7 queue:self->_clientAudioSessionQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_2;
  v6[3] = &unk_1E6DB4338;
  v6[4] = v3;
  [(AVConferenceXPCClient *)self->_xpcConnection registerBlockForService:"muteStateChangedEvent" block:v6 queue:self->_clientAudioSessionQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_3;
  v5[3] = &unk_1E6DB4338;
  v5[4] = self;
  objc_msgSend(+[AVConferenceXPCClient AVConferenceXPCClientSingleton](AVConferenceXPCClient, "AVConferenceXPCClientSingleton"), "registerBlockForService:block:queue:", "vcSecureMicNotification", v5, self->_clientAudioSessionQueue);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_101;
  void v4[3] = &unk_1E6DB81C0;
  v4[4] = self;
  v4[5] = v3;
  [(AVConferenceXPCClient *)self->_xpcConnection registerBlockForService:"audioSessionServerDied" block:v4 queue:self->_clientAudioSessionQueue];
}

uint64_t __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
    return [v5 handleMutedTalkerNotificationWithXPCArguments:a2];
  }
  return result;
}

uint64_t __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    uint64_t v5 = (void *)[*(id *)(a1 + 32) strong];
    return [v5 dispatchedHandleMuteStateChangedEventWithXPCArguments:a2];
  }
  return result;
}

uint64_t __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (!result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        uint64_t v9 = "-[AVAudioClient registerBlocksForDelegateNotifications]_block_invoke_3";
        __int16 v10 = 1024;
        int v11 = 827;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d AVAudioClient-Secure-Mic-Notification!!", (uint8_t *)&v6, 0x1Cu);
      }
    }
    uint64_t result = *(void *)(*(void *)(a1 + 32) + 48);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

uint64_t __55__AVAudioClient_registerBlocksForDelegateNotifications__block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t result = [a2 objectForKeyedSubscript:@"SERVERDIED"];
  if (result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 84);
        int v7 = 136315906;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        __int16 v10 = "-[AVAudioClient registerBlocksForDelegateNotifications]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 838;
        __int16 v13 = 1024;
        int v14 = v6;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d Server died. Attempt reconnect. processId=%d", (uint8_t *)&v7, 0x22u);
      }
    }
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "strong"), "resetXPCConnection");
  }
  return result;
}

- (void)unregisterBlocksForDelegateNotifications
{
  [(AVConferenceXPCClient *)self->_xpcConnection deregisterFromService:"audioSessionServerDied"];
  objc_msgSend(+[AVConferenceXPCClient AVConferenceXPCClientSingleton](AVConferenceXPCClient, "AVConferenceXPCClientSingleton"), "deregisterFromService:", "vcSecureMicNotification");
  [(AVConferenceXPCClient *)self->_xpcConnection deregisterFromService:"muteStateChangedEvent"];
  xpcConnection = self->_xpcConnection;

  [(AVConferenceXPCClient *)xpcConnection deregisterFromService:"mutedTalkerNotification"];
}

+ (void)startAudioSessionWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "+[AVAudioClient startAudioSessionWithCompletionHandler:]";
      __int16 v11 = 1024;
      int v12 = 858;
      __int16 v13 = 2048;
      int v14 = v4;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-start (%p)", (uint8_t *)&v7, 0x26u);
    }
  }
  [(AVAudioClient *)v4 startAudioSessionWithCompletionHandler:a3];
}

+ (void)startAudioSession
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-startAudioSession");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "+[AVAudioClient startAudioSession]";
      __int16 v9 = 1024;
      int v10 = 864;
      __int16 v11 = 2048;
      int v12 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-startAudioSession (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
  MEMORY[0x1E4E57AD0](&dword_1E1EA4000, "+[AVAudioClient startAudioSession]");
  [(AVAudioClient *)v2 startAudioSessionWithCompletionHandler:0];
}

+ (void)setAudioSessionProperties:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-setAudioSessionProperties");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      int v10 = "+[AVAudioClient setAudioSessionProperties:]";
      __int16 v11 = 1024;
      int v12 = 871;
      __int16 v13 = 2048;
      int v14 = v4;
      __int16 v15 = 2112;
      id v16 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setAudioSessionProperties (%p) audioParams=%@", (uint8_t *)&v7, 0x30u);
    }
  }
  [(AVAudioClient *)v4 setAudioSessionProperties:a3];
}

+ (void)stopAudioSession
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "+[AVAudioClient stopAudioSession]";
      __int16 v9 = 1024;
      int v10 = 877;
      __int16 v11 = 2048;
      int v12 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-stop (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
  [(AVAudioClient *)v2 stopAudioSession];
}

+ (void)resetAudioSessionOutputPortOverride
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-resetAudioSessionOutputPortOverride");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315906;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "+[AVAudioClient resetAudioSessionOutputPortOverride]";
      __int16 v9 = 1024;
      int v10 = 883;
      __int16 v11 = 2048;
      int v12 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-resetAudioSessionOutputPortOverride (%p)", (uint8_t *)&v5, 0x26u);
    }
  }
  [(AVAudioClient *)v2 resetAudioSessionOutputPortOverride];
}

+ (BOOL)hasActiveAudioSession
{
  uint64_t v2 = +[AVAudioClient sharedInstance];

  return [(AVAudioClient *)v2 hasActiveAudioSession];
}

+ (void)setMicrophoneMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-setMicrophoneMuted");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      int v10 = "+[AVAudioClient setMicrophoneMuted:]";
      __int16 v11 = 1024;
      int v12 = 894;
      __int16 v13 = 2048;
      int v14 = v4;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setMicrophoneMuted (%p) isMuted=%d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  [(AVAudioClient *)v4 setMicrophoneMuted:v3];
}

+ (BOOL)isMicrophoneMuted
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-isMicrophoneMuted");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "+[AVAudioClient isMicrophoneMuted]";
      __int16 v10 = 1024;
      int v11 = 900;
      __int16 v12 = 2048;
      __int16 v13 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-isMicrophoneMuted (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return [(AVAudioClient *)v2 isMicrophoneMuted];
}

+ (void)setMixingVoiceWithMediaEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-setMixingVoiceWithMediaEnabled");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "+[AVAudioClient setMixingVoiceWithMediaEnabled:]";
      __int16 v11 = 1024;
      int v12 = 906;
      __int16 v13 = 2048;
      uint64_t v14 = v4;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setMixingVoiceWithMediaEnabled (%p) isMixingVoiceWithMediaEnabled=%d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  [(AVAudioClient *)v4 setMixingVoiceWithMediaEnabled:v3];
}

+ (BOOL)isMixingVoiceWithMediaEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-isMixingVoiceWithMediaEnabled");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "+[AVAudioClient isMixingVoiceWithMediaEnabled]";
      __int16 v10 = 1024;
      int v11 = 912;
      __int16 v12 = 2048;
      __int16 v13 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-isMixingVoiceWithMediaEnabled (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return [(AVAudioClient *)v2 isMixingVoiceWithMediaEnabled];
}

+ (id)defaultInputDevice
{
  return +[AVAudioDeviceList defaultInputDevice];
}

+ (id)defaultOutputDevice
{
  return +[AVAudioDeviceList defaultOutputDevice];
}

+ (id)currentInputDevice
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-currentInputDevice");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "+[AVAudioClient currentInputDevice]";
      __int16 v10 = 1024;
      int v11 = 926;
      __int16 v12 = 2048;
      __int16 v13 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-currentInputDevice (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return [(AVAudioClient *)v2 currentInputDevice];
}

+ (id)currentOutputDevice
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-currentOutputDevice");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "+[AVAudioClient currentOutputDevice]";
      __int16 v10 = 1024;
      int v11 = 932;
      __int16 v12 = 2048;
      __int16 v13 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-currentOutputDevice (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return [(AVAudioClient *)v2 currentOutputDevice];
}

+ (BOOL)setInputDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-setInputDevice");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      int v11 = "+[AVAudioClient setInputDevice:]";
      __int16 v12 = 1024;
      int v13 = 938;
      __int16 v14 = 2048;
      __int16 v15 = v4;
      __int16 v16 = 2112;
      id v17 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setInputDevice (%p) inputDevice=%@", (uint8_t *)&v8, 0x30u);
    }
  }
  return [(AVAudioClient *)v4 setInputDevice:a3];
}

+ (BOOL)setOutputDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-setOutputDevice");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      int v11 = "+[AVAudioClient setOutputDevice:]";
      __int16 v12 = 1024;
      int v13 = 944;
      __int16 v14 = 2048;
      __int16 v15 = v4;
      __int16 v16 = 2112;
      id v17 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setOutputDevice (%p) outputDevice=%@", (uint8_t *)&v8, 0x30u);
    }
  }
  return [(AVAudioClient *)v4 setOutputDevice:a3];
}

+ (void)setFollowSystemInputEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-setFollowSystemInputEnabled");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "+[AVAudioClient setFollowSystemInputEnabled:]";
      __int16 v11 = 1024;
      int v12 = 950;
      __int16 v13 = 2048;
      __int16 v14 = v4;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setFollowSystemInputEnabled (%p) enabled=%d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  [(AVAudioClient *)v4 setFollowSystemInputEnabled:v3];
}

+ (void)setFollowSystemOutputEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-setFollowSystemOutputEnabled");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "+[AVAudioClient setFollowSystemOutputEnabled:]";
      __int16 v11 = 1024;
      int v12 = 956;
      __int16 v13 = 2048;
      __int16 v14 = v4;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setFollowSystemOutputEnabled (%p) enabled=%d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  [(AVAudioClient *)v4 setFollowSystemOutputEnabled:v3];
}

+ (int)registerForMutedTalkerNotifications:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-registerForMutedTalkerNotifications");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      __int16 v11 = "+[AVAudioClient registerForMutedTalkerNotifications:]";
      __int16 v12 = 1024;
      int v13 = 965;
      __int16 v14 = 2048;
      __int16 v15 = v4;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-registerForMutedTalkerNotifications (%p)", (uint8_t *)&v8, 0x26u);
    }
  }
  return [(AVAudioClient *)v4 registerForMutedTalkerNotifications:a3];
}

+ (int)unregisterFromMutedTalkerNotifications
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-unregisterFromMutedTalkerNotifications");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      uint64_t v9 = "+[AVAudioClient unregisterFromMutedTalkerNotifications]";
      __int16 v10 = 1024;
      int v11 = 975;
      __int16 v12 = 2048;
      int v13 = v2;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-unregisterFromMutedTalkerNotifications (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
  return [(AVAudioClient *)v2 unregisterFromMutedTalkerNotifications];
}

+ (int)setMuteStateChangedHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-setMuteStateChangedHandler");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      int v11 = "+[AVAudioClient setMuteStateChangedHandler:]";
      __int16 v12 = 1024;
      int v13 = 985;
      __int16 v14 = 2048;
      __int16 v15 = v4;
      __int16 v16 = 2048;
      id v17 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setMuteStateChangedHandler (%p) handler=%p", (uint8_t *)&v8, 0x30u);
    }
  }
  return [(AVAudioClient *)v4 setMuteStateChangedEventHandler:a3];
}

+ (void)registerSecureMicrophoneEngagedHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[AVAudioClient sharedInstance];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-registerSecureMicrophoneEngagedHandler");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "+[AVAudioClient registerSecureMicrophoneEngagedHandler:]";
      __int16 v11 = 1024;
      int v12 = 992;
      __int16 v13 = 2048;
      __int16 v14 = v4;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-registerSecureMicrophoneEngagedHandler (%p)", (uint8_t *)&v7, 0x26u);
    }
  }
  [(AVAudioClient *)v4 registerSecureMicrophoneEngagedHandler:a3];
}

- (void)setChangeListener:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(AVAudioDeviceList *)[(AVAudioClient *)self deviceList] setChangeListener:a3];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ AVAudioClient-setChangeListener");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    uint64_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      __int16 v9 = "-[AVAudioClient setChangeListener:]";
      __int16 v10 = 1024;
      int v11 = 998;
      __int16 v12 = 2048;
      __int16 v13 = self;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d @:@ AVAudioClient-setChangeListener (%p)", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (id)changeListener
{
  uint64_t v2 = [(AVAudioClient *)self deviceList];

  return [(AVAudioDeviceList *)v2 changeListener];
}

- (id)devices
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVAudioDeviceList *)[(AVAudioClient *)self deviceList] devices];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    return v3;
  }
  __str = 0;
  if (self)
  {
    uint64_t v4 = (const char *)objc_msgSend((id)-[AVAudioClient description](self, "description"), "UTF8String");
    if (v3)
    {
LABEL_4:
      uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = "<nil>";
    if (v3) {
      goto LABEL_4;
    }
  }
  uint64_t v5 = "<nil>";
LABEL_7:
  asprintf(&__str, "self=%s devices=%s", v4, v5);
  if (__str)
  {
    __lasts = 0;
    int v6 = strtok_r(__str, "\n", &__lasts);
    uint64_t v7 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        __int16 v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v14 = v8;
          __int16 v15 = 2080;
          __int16 v16 = "-[AVAudioClient devices]";
          __int16 v17 = 1024;
          int v18 = 1007;
          __int16 v19 = 2080;
          unsigned int v20 = "AVAudioClient-devices";
          __int16 v21 = 2080;
          int v22 = v6;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      int v6 = strtok_r(0, "\n", &__lasts);
    }
    while (v6);
    free(__str);
  }
  return v3;
}

- (id)inputDevices
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVAudioDeviceList *)[(AVAudioClient *)self deviceList] inputDevices];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    return v3;
  }
  __str = 0;
  if (self)
  {
    uint64_t v4 = (const char *)objc_msgSend((id)-[AVAudioClient description](self, "description"), "UTF8String");
    if (v3)
    {
LABEL_4:
      uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = "<nil>";
    if (v3) {
      goto LABEL_4;
    }
  }
  uint64_t v5 = "<nil>";
LABEL_7:
  asprintf(&__str, "self=%s inputDevices=%s", v4, v5);
  if (__str)
  {
    __lasts = 0;
    int v6 = strtok_r(__str, "\n", &__lasts);
    uint64_t v7 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        __int16 v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v14 = v8;
          __int16 v15 = 2080;
          __int16 v16 = "-[AVAudioClient inputDevices]";
          __int16 v17 = 1024;
          int v18 = 1013;
          __int16 v19 = 2080;
          unsigned int v20 = "AVAudioClient-inputDevices";
          __int16 v21 = 2080;
          int v22 = v6;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      int v6 = strtok_r(0, "\n", &__lasts);
    }
    while (v6);
    free(__str);
  }
  return v3;
}

- (id)outputDevices
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVAudioDeviceList *)[(AVAudioClient *)self deviceList] outputDevices];
  if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
    return v3;
  }
  __str = 0;
  if (self)
  {
    uint64_t v4 = (const char *)objc_msgSend((id)-[AVAudioClient description](self, "description"), "UTF8String");
    if (v3)
    {
LABEL_4:
      uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v4 = "<nil>";
    if (v3) {
      goto LABEL_4;
    }
  }
  uint64_t v5 = "<nil>";
LABEL_7:
  asprintf(&__str, "self=%s outputDevices=%s", v4, v5);
  if (__str)
  {
    __lasts = 0;
    int v6 = strtok_r(__str, "\n", &__lasts);
    uint64_t v7 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        __int16 v9 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v14 = v8;
          __int16 v15 = 2080;
          __int16 v16 = "-[AVAudioClient outputDevices]";
          __int16 v17 = 1024;
          int v18 = 1019;
          __int16 v19 = 2080;
          unsigned int v20 = "AVAudioClient-outputDevices";
          __int16 v21 = 2080;
          int v22 = v6;
          _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, "AVCAudioClient [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      int v6 = strtok_r(0, "\n", &__lasts);
    }
    while (v6);
    free(__str);
  }
  return v3;
}

- (AVAudioDeviceList)deviceList
{
  return self->deviceList;
}

- (void)setDeviceList:(id)a3
{
}

- (void)initSharedInstance
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVCAudioClient [%s] %s:%d Failed to initialize the XPC connection. processId=%d", v2, v3, v4, v5);
}

- (void)setupXPCConnection
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVCAudioClient [%s] %s:%d Failed to initialize the XPC connect. processId=%d", v2, v3, v4, v5);
}

void __33__AVAudioClient_stopAudioSession__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  int v5 = "-[AVAudioClient stopAudioSession]_block_invoke";
  OUTLINED_FUNCTION_3();
  int v6 = 346;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Timed out after waiting for audioSessionRef for 5 secs", (uint8_t *)&v2, 0x1Cu);
}

- (void)setInputDevice:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  [a2 UID];
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_20();
  OUTLINED_FUNCTION_5_11(&dword_1E1EA4000, v2, v3, "AVCAudioClient [%s] %s:%d Invalid input device. inputDevice=%@ UID=%@", v4, v5, v6, v7, v8);
}

- (void)setOutputDevice:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  [a2 UID];
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_20();
  OUTLINED_FUNCTION_5_11(&dword_1E1EA4000, v2, v3, "AVCAudioClient [%s] %s:%d Invalid output device. outputDevice=%@ UID=%@", v4, v5, v6, v7, v8);
}

- (void)registerForMutedTalkerNotifications:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[AVAudioClient registerForMutedTalkerNotifications:]";
  OUTLINED_FUNCTION_3();
  int v6 = 593;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, "AVCAudioClient [%s] %s:%d Invalid handler", (uint8_t *)&v2, 0x1Cu);
}

void __53__AVAudioClient_registerForMutedTalkerNotifications___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVCAudioClient [%s] %s:%d Muted talker handler is already registered. processId=%d", v2, v3, v4, v5);
}

void __55__AVAudioClient_unregisterFromMutedTalkerNotifications__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "AVCAudioClient [%s] %s:%d Muted talker handler is not registered. processId=%d", v2, v3, v4, v5);
}

@end