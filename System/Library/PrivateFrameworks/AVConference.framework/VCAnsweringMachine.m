@interface VCAnsweringMachine
+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5;
- (AVCAnsweringMachineConfiguration)configuration;
- (AudioStreamBasicDescription)defaultAudioFormat;
- (BOOL)autoRunOnStart;
- (BOOL)configureAudioIO;
- (BOOL)setUpAnnouncementAssetInjection;
- (BOOL)setUpConfigurationIndependentInternalState;
- (BOOL)setUpInternalStateWithConfiguration:(id)a3;
- (BOOL)setupCaptionsCoordinator;
- (BOOL)setupMediaRecorder;
- (BOOL)setupRealtimeContextWithToken:(int64_t)a3;
- (BOOL)setupReportingAgentWithCallID:(unsigned int)a3;
- (NSURL)recordingURL;
- (OS_dispatch_queue)dispatchQueue;
- (VCAnsweringMachine)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (__CFDictionary)clientSpecificUserInfo;
- (__CFDictionary)reportingInitialConfiguration;
- (id)newInjectorConfigurationForAnnouncementAsset:(id)a3;
- (id)onStart;
- (id)onStop;
- (id)start;
- (id)stop;
- (int)deviceRoleForCallSource:(unsigned __int8)a3;
- (int64_t)messageAudioToken;
- (tagVCAudioIOConfiguration)defaultAudioIOConfiguration;
- (void)cleanupAnnouncementAssetInjection;
- (void)cleanupCaptionsCoordinator;
- (void)cleanupMediaRecorder;
- (void)cleanupPeriodicReporting;
- (void)cleanupRealtimeContext;
- (void)configureAudioIO;
- (void)dealloc;
- (void)handleThermalPressureNotification:(id)a3;
- (void)invalidate;
- (void)onStart;
- (void)onStop;
- (void)registerForThermalNotifications;
- (void)setDispatchQueue:(id)a3;
- (void)setUpAnnouncementAssetInjection;
- (void)setUpConfigurationIndependentInternalState;
- (void)setUpRealtimeDefaults;
- (void)setupCaptionsCoordinator;
- (void)setupInternalFormat;
- (void)setupMediaRecorder;
- (void)setupPeriodicReporting;
- (void)stopMediaRecording;
- (void)streamToken:(int64_t)a3 didEndProcessingRequest:(id)a4 urlContext:(const tagVCMediaRecorderDelegateURLContext *)a5 error:(id)a6;
- (void)unregisterForThermalNotifications;
@end

@implementation VCAnsweringMachine

- (BOOL)setUpConfigurationIndependentInternalState
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_uuid = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v4 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.VideoConference.VCAnsweringMachine.dispatchQueue", 0, CustomRootQueue);
  self->_dispatchQueue = v4;
  if (!v4)
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAnsweringMachine setUpConfigurationIndependentInternalState]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v6 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v9 = 136316162;
          uint64_t v10 = v7;
          __int16 v11 = 2080;
          v12 = "-[VCAnsweringMachine setUpConfigurationIndependentInternalState]";
          __int16 v13 = 1024;
          int v14 = 199;
          __int16 v15 = 2112;
          v16 = v6;
          __int16 v17 = 2048;
          v18 = self;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the dispatch queue", (uint8_t *)&v9, 0x30u);
        }
      }
    }
  }
  return v4 != 0;
}

- (BOOL)setUpInternalStateWithConfiguration:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  self->_configuration = (AVCAnsweringMachineConfiguration *)a3;
  uint64_t ID = VCUniqueIDGenerator_GenerateID();
  BOOL v5 = [(VCAnsweringMachine *)self setupReportingAgentWithCallID:ID];
  if (v5)
  {
    self->_deviceRole = [(VCAnsweringMachine *)self deviceRoleForCallSource:[(AVCAnsweringMachineConfiguration *)self->_configuration source]];
    [(VCAnsweringMachine *)self setupInternalFormat];
    if ([(VCAnsweringMachine *)self setupRealtimeContextWithToken:ID])
    {
      if ([(VCAnsweringMachine *)self configureAudioIO])
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      if ((VCAnsweringMachine *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v5) {
            return v5;
          }
          -[VCAnsweringMachine setUpInternalStateWithConfiguration:]();
        }
        goto LABEL_27;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        int v13 = 136316162;
        uint64_t v14 = v11;
        __int16 v15 = 2080;
        v16 = "-[VCAnsweringMachine setUpInternalStateWithConfiguration:]";
        __int16 v17 = 1024;
        int v18 = 219;
        __int16 v19 = 2112;
        v20 = v7;
        __int16 v21 = 2048;
        v22 = self;
        uint64_t v10 = " [%s] %s:%d %@(%p) Failed to configure AudioIO";
LABEL_26:
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 0x30u);
      }
    }
    else
    {
      if ((VCAnsweringMachine *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v5) {
            return v5;
          }
          -[VCAnsweringMachine setUpInternalStateWithConfiguration:]();
        }
        goto LABEL_27;
      }
      if (objc_opt_respondsToSelector()) {
        v6 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        int v9 = *MEMORY[0x1E4F47A50];
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        int v13 = 136316162;
        uint64_t v14 = v8;
        __int16 v15 = 2080;
        v16 = "-[VCAnsweringMachine setUpInternalStateWithConfiguration:]";
        __int16 v17 = 1024;
        int v18 = 216;
        __int16 v19 = 2112;
        v20 = v6;
        __int16 v21 = 2048;
        v22 = self;
        uint64_t v10 = " [%s] %s:%d %@(%p) Failed to setup the realtime context";
        goto LABEL_26;
      }
    }
LABEL_27:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (VCAnsweringMachine)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAnsweringMachine-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v34 = v9;
      __int16 v35 = 2080;
      v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      __int16 v37 = 1024;
      int v38 = 226;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAnsweringMachine-init ", buf, 0x1Cu);
    }
  }
  if (!a3)
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]();
        }
      }
      goto LABEL_55;
    }
    if (objc_opt_respondsToSelector()) {
      v16 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_55;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v34 = v19;
    __int16 v35 = 2080;
    v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
    __int16 v37 = 1024;
    int v38 = 229;
    __int16 v39 = 2112;
    v40 = v16;
    __int16 v41 = 2048;
    v42 = self;
    __int16 v21 = " [%s] %s:%d %@(%p) Invalid configuration";
LABEL_50:
    _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x30u);
    goto LABEL_55;
  }
  if (!a4)
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]();
        }
      }
      goto LABEL_55;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_55;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v34 = v22;
    __int16 v35 = 2080;
    v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
    __int16 v37 = 1024;
    int v38 = 230;
    __int16 v39 = 2112;
    v40 = v17;
    __int16 v41 = 2048;
    v42 = self;
    __int16 v21 = " [%s] %s:%d %@(%p) The delegate is nil";
    goto LABEL_50;
  }
  if (!a5)
  {
    if ((VCAnsweringMachine *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        int v18 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        int v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_55;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v34 = v23;
      __int16 v35 = 2080;
      v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      __int16 v37 = 1024;
      int v38 = 231;
      __int16 v39 = 2112;
      v40 = v18;
      __int16 v41 = 2048;
      v42 = self;
      __int16 v21 = " [%s] %s:%d %@(%p) The delegate queue is nil";
      goto LABEL_50;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]();
      }
    }
LABEL_55:
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_64;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v34 = v25;
      __int16 v35 = 2080;
      v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      __int16 v37 = 1024;
      int v38 = 246;
      __int16 v39 = 2112;
      v40 = a3;
      __int16 v41 = 2048;
      v42 = self;
      v27 = " [%s] %s:%d VCAnsweringMachine-init FAILED with configuration=%@, instance=%p";
      v28 = v26;
      uint32_t v29 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v24 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_64;
      }
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v34 = v30;
      __int16 v35 = 2080;
      v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      __int16 v37 = 1024;
      int v38 = 246;
      __int16 v39 = 2112;
      v40 = v24;
      __int16 v41 = 2048;
      v42 = self;
      __int16 v43 = 2112;
      id v44 = a3;
      __int16 v45 = 2048;
      v46 = self;
      v27 = " [%s] %s:%d %@(%p) VCAnsweringMachine-init FAILED with configuration=%@, instance=%p";
      v28 = v31;
      uint32_t v29 = 68;
    }
    _os_log_error_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
LABEL_64:

    return 0;
  }
  v32.receiver = self;
  v32.super_class = (Class)VCAnsweringMachine;
  uint64_t v11 = [(VCMediaDevice *)&v32 init];
  if (!v11)
  {
    if (objc_opt_class())
    {
      if (objc_opt_respondsToSelector()) {
        [0 performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.5();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:].cold.4();
      }
    }
    self = 0;
    goto LABEL_55;
  }
  self = v11;
  if (![(VCAnsweringMachine *)v11 setUpConfigurationIndependentInternalState]|| ![(VCAnsweringMachine *)self setUpInternalStateWithConfiguration:a3])
  {
    goto LABEL_55;
  }
  dispatch_retain((dispatch_object_t)a5);
  self->_delegateQueue = (OS_dispatch_queue *)a5;
  self->_delegate = (VCAnsweringMachineDelegate *)a4;
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAnsweringMachine-init");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      *(_DWORD *)buf = 136316162;
      uint64_t v34 = v12;
      __int16 v35 = 2080;
      v36 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
      __int16 v37 = 1024;
      int v38 = 243;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2080;
      v42 = (VCAnsweringMachine *)v14;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAnsweringMachine-init (%p) Succeeded with configuration=%s", buf, 0x30u);
    }
  }
  return self;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCAnsweringMachine-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v3;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCAnsweringMachine dealloc]";
      __int16 v13 = 1024;
      int v14 = 254;
      __int16 v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCAnsweringMachine-dealloc (%p)", buf, 0x26u);
    }
  }
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  delegate = self->_delegate;
  if (delegate)
  {
    CFRelease(delegate);
    self->_delegate = 0;
  }
  [(VCAnsweringMachine *)self cleanupRealtimeContext];

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  v8.receiver = self;
  v8.super_class = (Class)VCAnsweringMachine;
  [(VCObject *)&v8 dealloc];
}

- (void)invalidate
{
  v3[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__VCAnsweringMachine_invalidate__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(dispatchQueue, v3);
}

uint64_t __32__VCAnsweringMachine_invalidate__block_invoke(uint64_t result)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(result + 32) + 393))
  {
    uint64_t v1 = result;
    v3.receiver = *(id *)(result + 32);
    v3.super_class = (Class)VCAnsweringMachine;
    objc_msgSendSuper2(&v3, sel_stop);
    [*(id *)(*(void *)(v1 + 32) + 232) invalidate];
    [*(id *)(*(void *)(v1 + 32) + 256) setMediaRecorderDelegate:0];
    [*(id *)(*(void *)(v1 + 32) + 256) invalidate];
    dispatch_sync(*(dispatch_queue_t *)(*(void *)(v1 + 32) + 192), &__block_literal_global_27);
    uint64_t v2 = *(void *)(v1 + 32);
    if (*(void *)(v2 + 192))
    {
      dispatch_release(*(dispatch_object_t *)(v2 + 192));
      *(void *)(*(void *)(v1 + 32) + 192) = 0;
      uint64_t v2 = *(void *)(v1 + 32);
    }
    if (*(void *)(v2 + 184))
    {
      CFRelease(*(CFTypeRef *)(v2 + 184));
      *(void *)(*(void *)(v1 + 32) + 184) = 0;
      uint64_t v2 = *(void *)(v1 + 32);
    }
    [(id)v2 reportingAgent];
    result = VCReporting_finalizeAggregation();
    *(unsigned char *)(*(void *)(v1 + 32) + 393) = 1;
  }
  return result;
}

- (id)start
{
  v4[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__VCAnsweringMachine_start__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
  return 0;
}

void __27__VCAnsweringMachine_start__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[393])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __27__VCAnsweringMachine_start__block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        objc_super v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        objc_super v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          uint64_t v13 = v7;
          __int16 v14 = 2080;
          __int16 v15 = "-[VCAnsweringMachine start]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 287;
          __int16 v18 = 2112;
          uint64_t v19 = v3;
          __int16 v20 = 2048;
          uint64_t v21 = v9;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Start called after invalidate!", buf, 0x30u);
        }
      }
    }
  }
  else
  {
    v11.receiver = v2;
    v11.super_class = (Class)VCAnsweringMachine;
    id v4 = objc_msgSendSuper2(&v11, sel_start);
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 192);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__VCAnsweringMachine_start__block_invoke_12;
    v10[3] = &unk_1E6DB3E40;
    v10[4] = v5;
    v10[5] = v4;
    dispatch_async(v6, v10);
  }
}

uint64_t __27__VCAnsweringMachine_start__block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "answeringMachine:didStart:error:");
}

- (id)stop
{
  v4[5] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__VCAnsweringMachine_stop__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
  return 0;
}

void __26__VCAnsweringMachine_stop__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 392) = 0;
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[393])
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __26__VCAnsweringMachine_stop__block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v3 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        objc_super v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        objc_super v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v9 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          uint64_t v13 = v7;
          __int16 v14 = 2080;
          __int16 v15 = "-[VCAnsweringMachine stop]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 302;
          __int16 v18 = 2112;
          uint64_t v19 = v3;
          __int16 v20 = 2048;
          uint64_t v21 = v9;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Stop called after invalidate!", buf, 0x30u);
        }
      }
    }
  }
  else
  {
    v11.receiver = v2;
    v11.super_class = (Class)VCAnsweringMachine;
    id v4 = objc_msgSendSuper2(&v11, sel_stop);
    if (v4 || !*(unsigned char *)(*(void *)(a1 + 32) + 392))
    {
      reportingGenericEvent();
      uint64_t v5 = *(void *)(a1 + 32);
      v6 = *(NSObject **)(v5 + 192);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __26__VCAnsweringMachine_stop__block_invoke_13;
      v10[3] = &unk_1E6DB3E40;
      v10[4] = v5;
      v10[5] = v4;
      dispatch_async(v6, v10);
    }
  }
}

uint64_t __26__VCAnsweringMachine_stop__block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "answeringMachine:didStop:recordingURL:error:");
}

- (void)setUpRealtimeDefaults
{
  if (VCDefaults_GetBoolValueForKey(@"answeringMachineShouldCaptionImmediately", 0)) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  p_realtimeContext = &self->_realtimeContext;
  p_realtimeContext->sourceCommonContext.flags |= v3;
  if (VCDefaults_GetBoolValueForKey(@"answeringMachineShouldRecordImmediately", 0)) {
    char v5 = 4;
  }
  else {
    char v5 = 0;
  }
  p_realtimeContext->sourceCommonContext.flags |= v5;
}

- (id)onStart
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(VCAnsweringMachine *)self setUpRealtimeDefaults];
  reportingGenericEvent();
  if (self->_realtimeContext.mediaRecorder
    && ![(AVCAnsweringMachineConfiguration *)self->_configuration announcementAsset])
  {
    self->_realtimeContext.sourceCommonContext.flags |= 1u;
  }
  [(VCAnsweringMachine *)self setupPeriodicReporting];
  [(VCAnsweringMachine *)self registerForThermalNotifications];
  id v3 = [(VCAudioIO *)self->_audioIO start];
  if (v3)
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAnsweringMachine onStart]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v4 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        id v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v8 = 136316418;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          objc_super v11 = "-[VCAnsweringMachine onStart]";
          __int16 v12 = 1024;
          int v13 = 339;
          __int16 v14 = 2112;
          __int16 v15 = v4;
          __int16 v16 = 2048;
          int v17 = self;
          __int16 v18 = 2112;
          id v19 = v3;
          _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) AudioIO start failed. error=%@", (uint8_t *)&v8, 0x3Au);
        }
      }
    }
    [(VCAnsweringMachine *)self cleanupPeriodicReporting];
    [(VCAnsweringMachine *)self unregisterForThermalNotifications];
  }
  return v3;
}

- (id)onStop
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(VCAudioIO *)self->_audioIO stop];
  if (v3)
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCAnsweringMachine onStop]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v8 = 136316418;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          objc_super v11 = "-[VCAnsweringMachine onStop]";
          __int16 v12 = 1024;
          int v13 = 348;
          __int16 v14 = 2112;
          __int16 v15 = v5;
          __int16 v16 = 2048;
          int v17 = self;
          __int16 v18 = 2112;
          id v19 = v3;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) AudioIO stop failed. error=%@", (uint8_t *)&v8, 0x3Au);
        }
      }
    }
  }
  else
  {
    if (self->_realtimeContext.mediaRecorder)
    {
      self->_stopIsAsync = 1;
      [(VCAnsweringMachine *)self stopMediaRecording];
    }
    [(VCAnsweringMachine *)self cleanupPeriodicReporting];
    [(VCAnsweringMachine *)self unregisterForThermalNotifications];
  }
  return v3;
}

- (BOOL)autoRunOnStart
{
  return 1;
}

- (void)setupPeriodicReporting
{
  if ([(VCObject *)self reportingAgent])
  {
    reportingRegisterPeriodicTaskWeak();
    reportingStartTimer();
  }
}

double __44__VCAnsweringMachine_setupPeriodicReporting__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a3 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double v7 = *(float *)(a2 + 248);
      double v8 = *(float *)(a2 + 224);
      int v9 = 136316418;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      __int16 v12 = "-[VCAnsweringMachine setupPeriodicReporting]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 375;
      __int16 v15 = 2048;
      uint64_t v16 = a2;
      __int16 v17 = 2048;
      double v18 = v7;
      __int16 v19 = 2048;
      double v20 = v8;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: AnsweringMachine [%p] averageSinkOutputPower=%f averageSourceOutputPower=%f", (uint8_t *)&v9, 0x3Au);
    }
  }
  return result;
}

- (void)cleanupPeriodicReporting
{
  [(VCObject *)self reportingAgent];
  reportingUnregisterPeriodicTask();

  reportingStopTimer();
}

- (__CFDictionary)reportingInitialConfiguration
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AMCS";
  v5[0] = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AVCAnsweringMachineConfiguration source](self->_configuration, "source"));
  v4[1] = @"AMCMR";
  v5[1] = objc_msgSend(NSNumber, "numberWithBool:", -[AVCAnsweringMachineConfiguration isMessageRecordingEnabled](self->_configuration, "isMessageRecordingEnabled"));
  v4[2] = @"AMCMC";
  v5[2] = objc_msgSend(NSNumber, "numberWithBool:", -[AVCAnsweringMachineConfiguration isMessageCaptioningEnabled](self->_configuration, "isMessageCaptioningEnabled"));
  v4[3] = @"AMCMP";
  v5[3] = objc_msgSend(NSNumber, "numberWithBool:", -[AVCAnsweringMachineConfiguration isMessagePlaybackEnabled](self->_configuration, "isMessagePlaybackEnabled"));
  v4[4] = @"AMCA";
  v5[4] = objc_msgSend(NSNumber, "numberWithInt:", -[AVCAnsweringMachineConfiguration announcementAsset](self->_configuration, "announcementAsset") != 0);
  v4[5] = @"AMCAD";
  v5[5] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[AVCAnsweringMachineConfiguration announcementAssetMilliSecondDelay](self->_configuration, "announcementAssetMilliSecondDelay"));
  return (__CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:6];
}

- (BOOL)setupReportingAgentWithCallID:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((VCAnsweringMachine *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    __int16 v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v16 = v11;
    LOWORD(v17) = 2080;
    *(void *)((char *)&v17 + 2) = "-[VCAnsweringMachine setupReportingAgentWithCallID:]";
    WORD5(v17) = 1024;
    HIDWORD(v17) = 399;
    *(_WORD *)double v18 = 2112;
    *(void *)&v18[2] = v5;
    *(_WORD *)&v18[10] = 2048;
    *(void *)&v18[12] = self;
    double v8 = " [%s] %s:%d %@(%p) Register Reporting Agent";
    int v9 = v12;
    uint32_t v10 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    double v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v6;
      LOWORD(v17) = 2080;
      *(void *)((char *)&v17 + 2) = "-[VCAnsweringMachine setupReportingAgentWithCallID:]";
      WORD5(v17) = 1024;
      HIDWORD(v17) = 399;
      double v8 = " [%s] %s:%d Register Reporting Agent";
      int v9 = v7;
      uint32_t v10 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
LABEL_12:
  *(_DWORD *)buf = a3;
  *(void *)&long long v17 = 0;
  uint64_t v16 = 0;
  *((void *)&v17 + 1) = 0xC00000000;
  memset(v18, 0, sizeof(v18));
  Agent = (const void *)reportingCreateAgent();
  if (Agent)
  {
    [(VCObject *)self setReportingAgent:Agent];
    CFRelease(Agent);
    [(VCObject *)self reportingAgent];
    self->_reportingModuleuint64_t ID = VCReporting_GetDynamicReportingModuleID();
    [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    [(VCObject *)self reportingAgent];
    [(VCAnsweringMachine *)self clientSpecificUserInfo];
    reportingSetUserInfo();
    [(VCObject *)self reportingAgent];
    reportingRecordingAndTranscriptionServiceUsage();
    [(VCAnsweringMachine *)self reportingInitialConfiguration];
    reportingGenericEvent();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCAnsweringMachine setupReportingAgentWithCallID:]();
    }
  }
  return Agent != 0;
}

void __52__VCAnsweringMachine_setupReportingAgentWithCallID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![a2 count])
  {
    [*(id *)(a1 + 32) strong];
    uint64_t v3 = objc_opt_class();
    if (v3 == [*(id *)(a1 + 32) strong])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __52__VCAnsweringMachine_setupReportingAgentWithCallID___block_invoke_cold_1();
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) strong];
      if (objc_opt_respondsToSelector()) {
        id v4 = (__CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
      }
      else {
        id v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = [*(id *)(a1 + 32) strong];
          int v8 = 136316162;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          uint64_t v11 = "-[VCAnsweringMachine setupReportingAgentWithCallID:]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 413;
          __int16 v14 = 2112;
          __int16 v15 = v4;
          __int16 v16 = 2048;
          uint64_t v17 = v7;
          _os_log_error_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Reporting not available (no backends)", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
}

- (__CFDictionary)clientSpecificUserInfo
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uuid = self->_uuid;
  id v4 = @"AMUUID";
  v5[0] = uuid;
  return (__CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

- (void)handleThermalPressureNotification:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"VCVideoCaptureServer_NotificationKeyThermalPressureLevel"), "intValue");
  id v4 = @"Thermal";
  v5[0] = [NSNumber numberWithUnsignedInt:v3];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  reportingGenericEvent();
}

- (void)registerForThermalNotifications
{
  self->_registeredForThermalNotifications = 1;
}

- (void)unregisterForThermalNotifications
{
  if (self->_registeredForThermalNotifications)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"VCVideoCaptureServer_NotificationNameThermalPressureLevel", 0);
    self->_registeredForThermalNotifications = 0;
  }
}

- (void)setupInternalFormat
{
  if (self)
  {
    [(VCAnsweringMachine *)self defaultAudioFormat];
  }
  else
  {
    uint64_t v5 = 0;
    long long v3 = 0u;
    long long v4 = 0u;
  }
  *(_OWORD *)&self->_internalFormat.format.mSampleRate = v3;
  *(_OWORD *)&self->_internalFormat.format.mBytesPerPacket = v4;
  *(void *)&self->_internalFormat.format.mBitsPerChannel = v5;
  self->_internalFormat.samplesPerFrame = 480;
}

- (BOOL)setupRealtimeContextWithToken:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(AVCAnsweringMachineConfiguration *)self->_configuration isMessageCaptioningEnabled]|| [(AVCAnsweringMachineConfiguration *)self->_configuration isMessageRecordingEnabled])
  {
    self->_realtimeContext.audioToken = a3;
  }
  if ([(AVCAnsweringMachineConfiguration *)self->_configuration isMessageCaptioningEnabled]&& ![(VCAnsweringMachine *)self setupCaptionsCoordinator])
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        -[VCAnsweringMachine setupRealtimeContextWithToken:]();
      }
      goto LABEL_41;
    }
    if (objc_opt_respondsToSelector()) {
      int v8 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      int v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      int v15 = 136316162;
      uint64_t v16 = v13;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCAnsweringMachine setupRealtimeContextWithToken:]";
      __int16 v19 = 1024;
      int v20 = 483;
      __int16 v21 = 2112;
      uint64_t v22 = v8;
      __int16 v23 = 2048;
      v24 = self;
      uint64_t v11 = " [%s] %s:%d %@(%p) Failed to setup the captions coordinator";
LABEL_40:
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, 0x30u);
    }
  }
  else if ([(VCAnsweringMachine *)self setupMediaRecorder])
  {
    if ([(VCAnsweringMachine *)self setUpAnnouncementAssetInjection])
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        -[VCAnsweringMachine setupRealtimeContextWithToken:]();
      }
      goto LABEL_41;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      int v15 = 136316162;
      uint64_t v16 = v12;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCAnsweringMachine setupRealtimeContextWithToken:]";
      __int16 v19 = 1024;
      int v20 = 489;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      __int16 v23 = 2048;
      v24 = self;
      uint64_t v11 = " [%s] %s:%d %@(%p) Failed to setup the announcementAssetInjection";
      goto LABEL_40;
    }
  }
  else
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        -[VCAnsweringMachine setupRealtimeContextWithToken:]();
      }
      goto LABEL_41;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      int v15 = 136316162;
      uint64_t v16 = v9;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCAnsweringMachine setupRealtimeContextWithToken:]";
      __int16 v19 = 1024;
      int v20 = 486;
      __int16 v21 = 2112;
      uint64_t v22 = v6;
      __int16 v23 = 2048;
      v24 = self;
      uint64_t v11 = " [%s] %s:%d %@(%p) Failed to setup the media recorder";
      goto LABEL_40;
    }
  }
LABEL_41:
  LOBYTE(v5) = 0;
  return v5;
}

- (void)cleanupRealtimeContext
{
  [(VCAnsweringMachine *)self cleanupCaptionsCoordinator];
  [(VCAnsweringMachine *)self cleanupMediaRecorder];

  [(VCAnsweringMachine *)self cleanupAnnouncementAssetInjection];
}

- (int)deviceRoleForCallSource:(unsigned __int8)a3
{
  if (a3 > 5u) {
    return 4;
  }
  else {
    return dword_1E259E608[(char)a3];
  }
}

- (AudioStreamBasicDescription)defaultAudioFormat
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  Format_Float((uint64_t)retstr, 1, 24000);
  return result;
}

- (tagVCAudioIOConfiguration)defaultAudioIOConfiguration
{
  retstr->var0 = VCUniqueIDGenerator_GenerateID();
  *(void *)&retstr->var1 = 0x100000000;
  retstr->var3 = [(VCAnsweringMachine *)self deviceRoleForCallSource:[(AVCAnsweringMachineConfiguration *)self->_configuration source]];
  retstr->var4 = 0;
  *(_WORD *)&retstr->var5 = 3;
  retstr->var7 = self;
  double result = (tagVCAudioIOConfiguration *)[(AVCAnsweringMachineConfiguration *)self->_configuration clientPid];
  double mSampleRate = self->_internalFormat.format.mSampleRate;
  retstr->var8 = (int)result;
  retstr->var9 = mSampleRate;
  retstr->var10 = self->_internalFormat.samplesPerFrame;
  retstr->var11 = 0;
  retstr->var12 = 0;
  retstr->var13 = self->_internalFormat.format.mChannelsPerFrame;
  retstr->var15 = 0;
  retstr->var16 = 0;
  retstr->var14 = 0;
  *(_WORD *)&retstr->var17 = 0;
  if (self->_realtimeContext.announcementAssetInjector) {
    uint64_t v7 = _VCAnsweringMachine_PullAudioSamples;
  }
  else {
    uint64_t v7 = 0;
  }
  retstr->var19.delegate = 0;
  retstr->var19.clientCallback = v7;
  retstr->var19.clientContext = self;
  retstr->var19.captionsToken = 0;
  retstr->var19.captionsCoordinator = 0;
  retstr->var19.captionsUseSecondaryThread = 0;
  retstr->var19.injector = 0;
  retstr->var20.delegate = 0;
  retstr->var20.clientCallback = _VCAnsweringMachine_PushAudioSamples;
  retstr->var20.clientContext = self;
  retstr->var20.captionsToken = 0;
  retstr->var20.captionsCoordinator = 0;
  retstr->var20.captionsUseSecondaryThread = 0;
  retstr->var20.injector = 0;
  retstr->var21 = 0;
  *(_WORD *)&retstr->var22 = 0;
  return result;
}

- (BOOL)configureAudioIO
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v21 = v3;
  long long v22 = v3;
  long long v19 = v3;
  long long v20 = v3;
  long long v17 = v3;
  long long v18 = v3;
  long long v15 = v3;
  long long v16 = v3;
  long long v13 = v3;
  long long v14 = v3;
  long long v11 = v3;
  long long v12 = v3;
  long long v9 = v3;
  long long v10 = v3;
  if (self)
  {
    [(VCAnsweringMachine *)self defaultAudioIOConfiguration];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
  }
  long long v4 = [[VCAudioIO alloc] initWithConfiguration:&v9];
  self->_audioIO = v4;
  if (v4)
  {
    v24[0] = 0;
    memset(v23, 0, sizeof(v23));
    AUIOGetAUNumber(v24);
    [(VCAudioIO *)self->_audioIO setFarEndVersionInfo:v23];
  }
  else if ((VCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAnsweringMachine configureAudioIO]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v26 = v7;
        __int16 v27 = 2080;
        v28 = "-[VCAnsweringMachine configureAudioIO]";
        __int16 v29 = 1024;
        int v30 = 552;
        __int16 v31 = 2112;
        objc_super v32 = v6;
        __int16 v33 = 2048;
        uint64_t v34 = self;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to init AudioIO", buf, 0x30u);
      }
    }
  }
  return v4 != 0;
}

- (int64_t)messageAudioToken
{
  return self->_realtimeContext.audioToken;
}

- (id)newInjectorConfigurationForAnnouncementAsset:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_alloc_init(VCCannedAudioInjectorConfig);
  if (v5)
  {
    -[VCCannedAudioInjectorConfig setPath:](v5, "setPath:", [a3 absoluteString]);
    [(VCCannedAudioInjectorConfig *)v5 setFromBeginning:1];
    if (self)
    {
      [(VCAnsweringMachine *)self defaultAudioFormat];
    }
    else
    {
      uint64_t v14 = 0;
      long long v12 = 0u;
      long long v13 = 0u;
    }
    v10[0] = v12;
    v10[1] = v13;
    uint64_t v11 = v14;
    [(VCCannedAudioInjectorConfig *)v5 setAudioFormat:v10];
    [(VCCannedAudioInjectorConfig *)v5 setLoopCount:1];
    [(VCCannedAudioInjectorConfig *)v5 setForceVoiceActive:1];
    [(VCCannedAudioInjectorConfig *)v5 setReportingAgent:self->super.super._reportingAgent];
  }
  else if ((VCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAnsweringMachine newInjectorConfigurationForAnnouncementAsset:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      long long v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        long long v18 = "-[VCAnsweringMachine newInjectorConfigurationForAnnouncementAsset:]";
        __int16 v19 = 1024;
        int v20 = 569;
        __int16 v21 = 2112;
        long long v22 = v7;
        __int16 v23 = 2048;
        v24 = self;
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate audio injector configuration", buf, 0x30u);
      }
    }
  }
  return v5;
}

- (BOOL)setUpAnnouncementAssetInjection
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v3 = [(AVCAnsweringMachineConfiguration *)self->_configuration announcementAsset];
  if (!v3) {
    goto LABEL_4;
  }
  id v4 = [(VCAnsweringMachine *)self newInjectorConfigurationForAnnouncementAsset:v3];
  if (v4)
  {
    BOOL v5 = v4;
    self->_realtimeContext.blocksToDelay = vcvtpd_u64_f64((double)[(AVCAnsweringMachineConfiguration *)self->_configuration announcementAssetMilliSecondDelay]/ 1000.0* 50.0);
    self->_realtimeContext.announcementAssetInjector = [[VCCannedAudioInjector alloc] initWithConfig:v5];

    if (self->_realtimeContext.announcementAssetInjector)
    {
LABEL_4:
      LOBYTE(v4) = 1;
      return (char)v4;
    }
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(v4) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v4) {
          return (char)v4;
        }
        -[VCAnsweringMachine setUpAnnouncementAssetInjection]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        LODWORD(v4) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v4) {
          return (char)v4;
        }
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        long long v13 = "-[VCAnsweringMachine setUpAnnouncementAssetInjection]";
        __int16 v14 = 1024;
        int v15 = 593;
        __int16 v16 = 2112;
        __int16 v17 = v6;
        __int16 v18 = 2048;
        __int16 v19 = self;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate audio injector", (uint8_t *)&v10, 0x30u);
      }
    }
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)cleanupAnnouncementAssetInjection
{
  self->_realtimeContext.announcementAssetInjector = 0;
}

- (BOOL)setupCaptionsCoordinator
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![(AVCAnsweringMachineConfiguration *)self->_configuration isMessageCaptioningEnabled])
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v21 = v6;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCAnsweringMachine setupCaptionsCoordinator]";
      __int16 v24 = 1024;
      int v25 = 632;
      uint64_t v8 = " [%s] %s:%d Captions disabled";
      long long v9 = v7;
      uint32_t v10 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v5 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = v11;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCAnsweringMachine setupCaptionsCoordinator]";
      __int16 v24 = 1024;
      int v25 = 632;
      __int16 v26 = 2112;
      __int16 v27 = v5;
      __int16 v28 = 2048;
      __int16 v29 = self;
      uint64_t v8 = " [%s] %s:%d %@(%p) Captions disabled";
      long long v9 = v12;
      uint32_t v10 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_15:
    LOBYTE(v13) = 1;
    return v13;
  }
  long long v3 = [[VCAudioCaptionsCoordinator alloc] initWithOneToOneEnabled:1 isLocal:0 taskIdentifier:@"callscreeningcaptions" reportingAgent:[(VCObject *)self reportingAgent]];
  self->_realtimeContext.captionsCoordinator = v3;
  if (v3)
  {
    memset(&v18[16], 170, 32);
    *(_OWORD *)__int16 v18 = xmmword_1E259E5D0;
    long long v4 = *(_OWORD *)&self->_internalFormat.format.mSampleRate;
    *(_OWORD *)&v18[24] = *(_OWORD *)&self->_internalFormat.format.mBytesPerPacket;
    *(void *)__int16 v18 = self->_realtimeContext.audioToken;
    *(void *)&v18[40] = *(void *)&self->_internalFormat.format.mBitsPerChannel;
    unint64_t v19 = 0xAAAAAAAAAAAAAA00;
    *(_OWORD *)&v18[8] = v4;
    [(VCAudioCaptionsCoordinator *)v3 registerStreamWithConfig:v18];
    goto LABEL_15;
  }
  if ((VCAnsweringMachine *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v13) {
        return v13;
      }
      -[VCAnsweringMachine setupCaptionsCoordinator]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v13) {
        return v13;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      __int16 v23 = "-[VCAnsweringMachine setupCaptionsCoordinator]";
      __int16 v24 = 1024;
      int v25 = 636;
      __int16 v26 = 2112;
      __int16 v27 = v14;
      __int16 v28 = 2048;
      __int16 v29 = self;
      _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create captions coordinator", buf, 0x30u);
    }
  }
  LOBYTE(v13) = 0;
  return v13;
}

- (void)cleanupCaptionsCoordinator
{
  p_realtimeContext = &self->_realtimeContext;

  p_realtimeContext->captionsCoordinator = 0;
}

- (BOOL)setupMediaRecorder
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (![(AVCAnsweringMachineConfiguration *)self->_configuration isMessageRecordingEnabled]
    || !+[VCHardwareSettings isMediaRecordingSupported])
  {
    if ((VCAnsweringMachine *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_27;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint32_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v27 = 136315650;
      uint64_t v28 = v9;
      __int16 v29 = 2080;
      uint64_t v30 = "-[VCAnsweringMachine setupMediaRecorder]";
      __int16 v31 = 1024;
      int v32 = 662;
      uint64_t v11 = " [%s] %s:%d Message recording disabled";
      __int16 v12 = v10;
      uint32_t v13 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_27;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      int v27 = 136316162;
      uint64_t v28 = v14;
      __int16 v29 = 2080;
      uint64_t v30 = "-[VCAnsweringMachine setupMediaRecorder]";
      __int16 v31 = 1024;
      int v32 = 662;
      __int16 v33 = 2112;
      uint64_t v34 = v8;
      __int16 v35 = 2048;
      v36 = self;
      uint64_t v11 = " [%s] %s:%d %@(%p) Message recording disabled";
      __int16 v12 = v15;
      uint32_t v13 = 48;
    }
    goto LABEL_26;
  }
  long long v3 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  p_realtimeContext = &self->_realtimeContext;
  self->_realtimeContext.mediaRecorderRequesteruint64_t ID = v3;
  if (v3)
  {
    BOOL v5 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    self->_realtimeContext.mediaRecorderTransactionuint64_t ID = v5;
    if (v5)
    {
      uint64_t v6 = [[VCMediaRecorder alloc] initWithStreamToken:LODWORD(self->_realtimeContext.audioToken) delegate:0 reportingAgent:[(VCObject *)self reportingAgent]];
      self->_realtimeContext.mediaRecorder = v6;
      if (v6)
      {
        [(VCMediaRecorder *)v6 setCapabilities:2];
        [(VCMediaRecorder *)self->_realtimeContext.mediaRecorder setMediaRecorderDelegate:self];
        [(VCMediaRecorder *)self->_realtimeContext.mediaRecorder registerClient];
        if ((VCAnsweringMachine *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_27;
          }
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          __int16 v17 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          mediaRecorder = p_realtimeContext->mediaRecorder;
          int v27 = 136315906;
          uint64_t v28 = v16;
          __int16 v29 = 2080;
          uint64_t v30 = "-[VCAnsweringMachine setupMediaRecorder]";
          __int16 v31 = 1024;
          int v32 = 676;
          __int16 v33 = 2112;
          uint64_t v34 = (__CFString *)mediaRecorder;
          uint64_t v11 = " [%s] %s:%d Successfully created mediaRecorder=%@";
          __int16 v12 = v17;
          uint32_t v13 = 38;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v7 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v7 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
            goto LABEL_27;
          }
          uint64_t v19 = VRTraceErrorLogLevelToCSTR();
          uint64_t v20 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_27;
          }
          uint64_t v21 = self->_realtimeContext.mediaRecorder;
          int v27 = 136316418;
          uint64_t v28 = v19;
          __int16 v29 = 2080;
          uint64_t v30 = "-[VCAnsweringMachine setupMediaRecorder]";
          __int16 v31 = 1024;
          int v32 = 676;
          __int16 v33 = 2112;
          uint64_t v34 = v7;
          __int16 v35 = 2048;
          v36 = self;
          __int16 v37 = 2112;
          int v38 = v21;
          uint64_t v11 = " [%s] %s:%d %@(%p) Successfully created mediaRecorder=%@";
          __int16 v12 = v20;
          uint32_t v13 = 58;
        }
LABEL_26:
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v27, v13);
LABEL_27:
        LOBYTE(v22) = 1;
        return v22;
      }
      if ((VCAnsweringMachine *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          BOOL v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v22) {
            return v22;
          }
          -[VCAnsweringMachine setupMediaRecorder]();
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v23 = (__CFString *)[(VCAnsweringMachine *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v23 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          int v25 = *MEMORY[0x1E4F47A50];
          BOOL v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v22) {
            return v22;
          }
          int v27 = 136316162;
          uint64_t v28 = v24;
          __int16 v29 = 2080;
          uint64_t v30 = "-[VCAnsweringMachine setupMediaRecorder]";
          __int16 v31 = 1024;
          int v32 = 671;
          __int16 v33 = 2112;
          uint64_t v34 = v23;
          __int16 v35 = 2048;
          v36 = self;
          _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create the media recorder", (uint8_t *)&v27, 0x30u);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v22) {
        return v22;
      }
      -[VCAnsweringMachine setupMediaRecorder]();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    BOOL v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v22) {
      return v22;
    }
    -[VCAnsweringMachine setupMediaRecorder]();
  }
  LOBYTE(v22) = 0;
  return v22;
}

- (void)cleanupMediaRecorder
{
  p_realtimeContext = &self->_realtimeContext;

  p_realtimeContext->mediaRecorderRequesteruint64_t ID = 0;
  p_realtimeContext->mediaRecorderTransactionuint64_t ID = 0;

  p_realtimeContext->mediaRecorder = 0;
}

- (void)stopMediaRecording
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  p_realtimeContext = &self->_realtimeContext;
  v4[0] = @"vcMomentsTransactionID";
  v4[1] = @"vcMomentsInitiatorID";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_realtimeContext.sinkCommonContext.latestTimestamp, @"vcMomentsTransactionID", @"vcMomentsInitiatorID", @"vcMomentsRequestMode", @"vcMomentsRequestState", @"vcMomentsMediaType", @"vcMomentsRequestTimestamp", vextq_s8(*(int8x16_t *)&self->_realtimeContext.mediaRecorderRequesterID, *(int8x16_t *)&self->_realtimeContext.mediaRecorderRequesterID, 8uLL), &unk_1F3DC3FF0, &unk_1F3DC4008, &unk_1F3DC4020);
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v5 forKeys:v4 count:6];
  reportingGenericEvent();
  [(VCMediaRecorder *)p_realtimeContext->mediaRecorder processRequest:v3];
  VCMediaRecorder_ClearHistoryBuffer((uint64_t)p_realtimeContext->mediaRecorder);
  VCMediaRecorder_StopProcessingAllRequests((uint64_t)p_realtimeContext->mediaRecorder);
  p_realtimeContext->sinkCommonContext.flags &= ~0x20u;
}

- (void)streamToken:(int64_t)a3 didEndProcessingRequest:(id)a4 urlContext:(const tagVCMediaRecorderDelegateURLContext *)a5 error:(id)a6
{
  v8[7] = *MEMORY[0x1E4F143B8];
  dispatchQueue = self->_dispatchQueue;
  id var1 = a5->var1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__VCAnsweringMachine_streamToken_didEndProcessingRequest_urlContext_error___block_invoke;
  v8[3] = &unk_1E6DB43D8;
  v8[4] = self;
  v8[5] = a6;
  v8[6] = var1;
  dispatch_async(dispatchQueue, v8);
}

void __75__VCAnsweringMachine_streamToken_didEndProcessingRequest_urlContext_error___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 393))
  {
    reportingGenericEvent();
    long long v2 = *(_OWORD *)(a1 + 32);
    uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 192);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __75__VCAnsweringMachine_streamToken_didEndProcessingRequest_urlContext_error___block_invoke_2;
    v4[3] = &unk_1E6DB43D8;
    long long v5 = v2;
    uint64_t v6 = *(void *)(a1 + 48);
    dispatch_async(v3, v4);
  }
}

uint64_t __75__VCAnsweringMachine_streamToken_didEndProcessingRequest_urlContext_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "answeringMachine:didStop:recordingURL:error:");
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
}

- (AVCAnsweringMachineConfiguration)configuration
{
  return self->_configuration;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSURL)recordingURL
{
  return self->_recordingURL;
}

void ___VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      long long v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = *(unsigned __int8 *)(a1 + 48);
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316162;
        uint64_t v28 = v3;
        __int16 v29 = 2080;
        uint64_t v30 = "_VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke";
        __int16 v31 = 1024;
        int v32 = 602;
        __int16 v33 = 1024;
        *(_DWORD *)uint64_t v34 = v5;
        *(_WORD *)&v34[4] = 2112;
        *(void *)&v34[6] = v6;
        uint64_t v7 = " [%s] %s:%d didFinishAnnouncement=%{BOOL}d, error=%@";
        uint64_t v8 = v4;
        uint32_t v9 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      long long v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *(unsigned __int8 *)(a1 + 48);
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136316674;
        uint64_t v28 = v10;
        __int16 v29 = 2080;
        uint64_t v30 = "_VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke";
        __int16 v31 = 1024;
        int v32 = 602;
        __int16 v33 = 2112;
        *(void *)uint64_t v34 = v2;
        *(_WORD *)&v34[8] = 2048;
        *(void *)&v34[10] = v13;
        __int16 v35 = 1024;
        int v36 = v12;
        __int16 v37 = 2112;
        uint64_t v38 = v14;
        uint64_t v7 = " [%s] %s:%d %@(%p) didFinishAnnouncement=%{BOOL}d, error=%@";
        uint64_t v8 = v11;
        uint32_t v9 = 64;
        goto LABEL_11;
      }
    }
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v15 + 393))
  {
    uint64_t v16 = *(NSObject **)(v15 + 192);
    uint64_t v17 = *(void *)(v15 + 184);
    if (v17) {
      BOOL v18 = v16 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18)
    {
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            ___VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke_cold_1();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v19 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          uint64_t v19 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          __int16 v23 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 136316162;
            uint64_t v28 = v22;
            __int16 v29 = 2080;
            uint64_t v30 = "_VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke";
            __int16 v31 = 1024;
            int v32 = 611;
            __int16 v33 = 2112;
            *(void *)uint64_t v34 = v19;
            *(_WORD *)&v34[8] = 2048;
            *(void *)&v34[10] = v24;
            _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) delegate or delegateQueue invalid, NOT sending didFinishAnnouncement notice to client", buf, 0x30u);
          }
        }
      }
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 40);
      reportingGenericEvent();
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = ___VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke_230;
      v25[3] = &unk_1E6DB5238;
      uint64_t v21 = *(void *)(a1 + 32);
      v25[4] = v17;
      v25[5] = v21;
      char v26 = *(unsigned char *)(a1 + 48);
      v25[6] = v20;
      dispatch_async(v16, v25);
    }
  }
}

uint64_t ___VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke_230(uint64_t a1)
{
  return [*(id *)(a1 + 32) answeringMachine:*(void *)(a1 + 40) didFinishAnnouncement:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

uint64_t ___VCAnsweringMachine_StartMediaRecording_block_invoke(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(*(void *)(result + 32) + 393))
  {
    uint64_t v1 = result;
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(result + 56), @"vcMomentsTransactionID", @"vcMomentsInitiatorID", @"vcMomentsRequestMode", @"vcMomentsRequestState", @"vcMomentsMediaType", @"vcMomentsRequestTimestamp", *(void *)(result + 40), *(void *)(result + 48), &unk_1F3DC3FF0, &unk_1F3DC3FF0, &unk_1F3DC4020);
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v4 forKeys:&v3 count:6];
    reportingGenericEvent();
    return [*(id *)(*(void *)(v1 + 32) + 256) processRequest:v2];
  }
  return result;
}

- (void)setUpConfigurationIndependentInternalState
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the dispatch queue", v2, v3, v4, v5, v6);
}

- (void)setUpInternalStateWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure AudioIO", v2, v3, v4, v5, v6);
}

- (void)setUpInternalStateWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the realtime context", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid configuration", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d The delegate is nil", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d The delegate queue is nil", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d super init Failed", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:delegate:delegateQueue:.cold.5()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = v0;
  uint64_t v4 = "-[VCAnsweringMachine initWithConfiguration:delegate:delegateQueue:]";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_8_1();
  __int16 v6 = 2048;
  uint64_t v7 = 0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) super init Failed", v2, 0x30u);
}

void __27__VCAnsweringMachine_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Start called after invalidate!", v2, v3, v4, v5, v6);
}

void __26__VCAnsweringMachine_stop__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Stop called after invalidate!", v2, v3, v4, v5, v6);
}

- (void)onStart
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AudioIO start failed. error=%@");
}

- (void)onStop
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d AudioIO stop failed. error=%@");
}

- (void)setupReportingAgentWithCallID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create reportingAgent", v2, v3, v4, v5, v6);
}

void __52__VCAnsweringMachine_setupReportingAgentWithCallID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Reporting not available (no backends)", v2, v3, v4, v5, v6);
}

- (void)setupRealtimeContextWithToken:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the announcementAssetInjection", v2, v3, v4, v5, v6);
}

- (void)setupRealtimeContextWithToken:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the media recorder", v2, v3, v4, v5, v6);
}

- (void)setupRealtimeContextWithToken:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to setup the captions coordinator", v2, v3, v4, v5, v6);
}

- (void)configureAudioIO
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init AudioIO", v2, v3, v4, v5, v6);
}

- (void)newInjectorConfigurationForAnnouncementAsset:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate audio injector configuration", v2, v3, v4, v5, v6);
}

- (void)setUpAnnouncementAssetInjection
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate audio injector", v2, v3, v4, v5, v6);
}

- (void)setupCaptionsCoordinator
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create captions coordinator", v2, v3, v4, v5, v6);
}

- (void)setupMediaRecorder
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create the media recorder", v2, v3, v4, v5, v6);
}

void ___VCAnsweringMachine_DispatchFinishAnnouncementNotice_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d delegate or delegateQueue invalid, NOT sending didFinishAnnouncement notice to client", v2, v3, v4, v5, v6);
}

@end