@interface VCCellularAudioTap
+ (BOOL)validateAsynchronousActionContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4;
+ (id)stringFromTapType:(unsigned int)a3;
+ (unsigned)audioIOTypeFromTapType:(unsigned int)a3;
- (BOOL)actionDidFinishForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4;
- (BOOL)actionWillBeginForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4;
- (BOOL)addAudioTapForStreamToken:(int64_t)a3 tapType:(unsigned int)a4 enableAsyncTapStart:(BOOL)a5 error:(id *)a6;
- (BOOL)removeAudioTapForStreamToken:(int64_t)a3 error:(id *)a4;
- (BOOL)setUpCallRecordingComponents;
- (BOOL)setUpCaptionsCoordinator;
- (BOOL)setUpDelegateQueue:(id)a3;
- (BOOL)setUpMediaRecorder;
- (BOOL)setUpReportingAgent;
- (OS_dispatch_queue)delegateQueue;
- (VCCellularAudioTap)initWithProcessId:(int)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (VCServerDelegate)delegate;
- (__CFDictionary)clientSpecificUserInfo;
- (id)initializeAudioTapIOForStreamToken:(int64_t)a3 enableAsyncTapStart:(BOOL)a4;
- (id)startAudioForStreamToken:(id)a3 isInitialization:(BOOL)a4;
- (id)stopAudioForStreamToken:(id)a3 isDeinitialization:(BOOL)a4;
- (int)makeAudioIOForAudioTapIO:(id)a3;
- (int)registerAudioTapForStreamToken:(int64_t)a3 tapType:(unsigned int)a4;
- (int)validateAddAudioTapForStreamToken:(int64_t)a3;
- (int64_t)tapToken;
- (tagVCAudioIOConfiguration)audioIOConfigWithAudioType:(SEL)a3 sinkDelegateContext:(unsigned int)a4;
- (tagVCAudioIODelegateContext)sinkDelegateContextWithTapType:(SEL)a3 realtimeContext:(unsigned int)a4;
- (void)cleanUpCaptionsCoordinator;
- (void)cleanUpMediaRecorder;
- (void)cleanUpPeriodicReporting;
- (void)dealloc;
- (void)handleThermalPressureNotification:(id)a3;
- (void)invalidate;
- (void)printAudioTapHealth;
- (void)registerForThermalNotifications;
- (void)serverDidDie;
- (void)setAudioTapIO:(id)a3 forStreamToken:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setUpCaptionsCoordinator;
- (void)setUpMediaRecorder;
- (void)setUpPeriodicReporting;
- (void)setUpReportingAgent;
- (void)terminateProcessFromAssertionOverflow:(BOOL)a3 onAudioTapIO:(id)a4;
- (void)unregisterAudioTapForStreamToken:(int64_t)a3;
- (void)unregisterForThermalNotifications;
@end

@implementation VCCellularAudioTap

- (BOOL)setUpReportingAgent
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((VCCellularAudioTap *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_12;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v14 = v9;
    LOWORD(v15) = 2080;
    *(void *)((char *)&v15 + 2) = "-[VCCellularAudioTap setUpReportingAgent]";
    WORD5(v15) = 1024;
    HIDWORD(v15) = 71;
    *(_WORD *)v16 = 2112;
    *(void *)&v16[2] = v3;
    *(_WORD *)&v16[10] = 2048;
    *(void *)&v16[12] = self;
    v6 = " [%s] %s:%d %@(%p) Register Reporting Agent";
    v7 = v10;
    uint32_t v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = v4;
      LOWORD(v15) = 2080;
      *(void *)((char *)&v15 + 2) = "-[VCCellularAudioTap setUpReportingAgent]";
      WORD5(v15) = 1024;
      HIDWORD(v15) = 71;
      v6 = " [%s] %s:%d Register Reporting Agent";
      v7 = v5;
      uint32_t v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  *(_DWORD *)buf = self->_tapToken;
  *(void *)&long long v15 = 0;
  uint64_t v14 = 0;
  *((void *)&v15 + 1) = 0x1500000000;
  memset(v16, 0, sizeof(v16));
  Agent = (const void *)reportingCreateAgent();
  if (Agent)
  {
    [(VCObject *)self setReportingAgent:Agent];
    CFRelease(Agent);
    [(VCObject *)self reportingAgent];
    self->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    [(VCObject *)self reportingAgent];
    [(VCCellularAudioTap *)self clientSpecificUserInfo];
    reportingSetUserInfo();
    [(VCObject *)self reportingAgent];
    reportingRecordingAndTranscriptionServiceUsage();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCCellularAudioTap setUpReportingAgent]();
    }
  }
  return Agent != 0;
}

void __41__VCCellularAudioTap_setUpReportingAgent__block_invoke(uint64_t a1, void *a2)
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
          __41__VCCellularAudioTap_setUpReportingAgent__block_invoke_cold_1();
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) strong];
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v7 = [*(id *)(a1 + 32) strong];
          int v8 = 136316162;
          uint64_t v9 = v5;
          __int16 v10 = 2080;
          v11 = "-[VCCellularAudioTap setUpReportingAgent]_block_invoke";
          __int16 v12 = 1024;
          int v13 = 85;
          __int16 v14 = 2112;
          long long v15 = v4;
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
  uint64_t v4 = @"AMUUID";
  v5[0] = uuid;
  return (__CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
}

+ (id)stringFromTapType:(unsigned int)a3
{
  uint64_t v3 = "Unknown";
  if (a3 == 1) {
    uint64_t v3 = "Downlink";
  }
  if (!a3) {
    uint64_t v3 = "Uplink";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s(%u)", v3, *(void *)&a3);
}

- (void)printAudioTapHealth
{
  v3[5] = *MEMORY[0x1E4F143B8];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__VCCellularAudioTap_printAudioTapHealth__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __41__VCCellularAudioTap_printAudioTapHealth__block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F28E78] string];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 168);
  uint64_t v3 = [obj countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "objectForKeyedSubscript:", v7), "realtimeContext");
        if (v8)
        {
          uint64_t v9 = v8;
          id v10 = +[VCCellularAudioTap stringFromTapType:*(unsigned int *)(v8 + 8)];
          float v11 = *(float *)(v9 + 32);
        }
        else
        {
          id v10 = +[VCCellularAudioTap stringFromTapType:0xFFFFFFFFLL];
          float v11 = NAN;
        }
        [v2 appendFormat:@"streamToken=%@ tapType=%@ averagePower=%f ", v7, v10, v11];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v26 count:16];
    }
    while (v4);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    int v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = v12;
      __int16 v18 = 2080;
      v19 = "-[VCCellularAudioTap printAudioTapHealth]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 122;
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      v25 = v2;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: BasebandAudioTap [%p] %@", buf, 0x30u);
    }
  }
}

- (void)setUpPeriodicReporting
{
  if ([(VCObject *)self reportingAgent])
  {
    reportingRegisterPeriodicTaskWeak();
    reportingStartTimer();
  }
}

uint64_t __44__VCCellularAudioTap_setUpPeriodicReporting__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    return [a2 printAudioTapHealth];
  }
  return result;
}

- (void)cleanUpPeriodicReporting
{
  [(VCObject *)self reportingAgent];
  reportingUnregisterPeriodicTask();

  reportingStopTimer();
}

- (void)handleThermalPressureNotification:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", @"VCVideoCaptureServer_NotificationKeyThermalPressureLevel"), "intValue");
  uint64_t v5 = @"Thermal";
  v6[0] = [NSNumber numberWithUnsignedInt:v4];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(VCObject *)self reportingAgent];
  reportingGenericEvent();
}

- (void)registerForThermalNotifications
{
  if ([(VCObject *)self reportingAgent])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", self, sel_handleThermalPressureNotification_, @"VCVideoCaptureServer_NotificationNameThermalPressureLevel", 0);
    self->_registeredForThermalNotifications = 1;
  }
}

- (void)unregisterForThermalNotifications
{
  if (self->_registeredForThermalNotifications)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, @"VCVideoCaptureServer_NotificationNameThermalPressureLevel", 0);
    self->_registeredForThermalNotifications = 0;
  }
}

- (BOOL)setUpMediaRecorder
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [[VCMediaRecorder alloc] initWithStreamToken:LODWORD(self->_tapToken) delegate:self reportingAgent:[(VCObject *)self reportingAgent]];
  uint64_t v4 = v3;
  self->_mediaRecorder = v3;
  if (v3)
  {
    [(VCMediaRecorder *)v3 setCapabilities:2];
    [+[VCMediaRecorderManager sharedInstance] registerMediaRecorder:self->_mediaRecorder withStreamToken:self->_tapToken];
  }
  else if ((VCCellularAudioTap *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCellularAudioTap setUpMediaRecorder]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v6 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
    }
    else {
      v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v9 = 136316162;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCCellularAudioTap setUpMediaRecorder]";
        __int16 v13 = 1024;
        int v14 = 194;
        __int16 v15 = 2112;
        __int16 v16 = v6;
        __int16 v17 = 2048;
        __int16 v18 = self;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate media recorder", (uint8_t *)&v9, 0x30u);
      }
    }
  }
  return v4 != 0;
}

- (void)cleanUpMediaRecorder
{
  mediaRecorder = self->_mediaRecorder;
  if (mediaRecorder)
  {

    self->_mediaRecorder = 0;
  }
}

- (BOOL)setUpCaptionsCoordinator
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [[VCAudioCaptionsCoordinator alloc] initWithOneToOneEnabled:1 isLocal:0 taskIdentifier:@"callrecordingcaptions" reportingAgent:[(VCObject *)self reportingAgent]];
  self->_captionsCoordinator = v3;
  if (!v3)
  {
    if ((VCCellularAudioTap *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCellularAudioTap setUpCaptionsCoordinator]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
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
          int v8 = 136316162;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          __int16 v11 = "-[VCCellularAudioTap setUpCaptionsCoordinator]";
          __int16 v12 = 1024;
          int v13 = 221;
          __int16 v14 = 2112;
          __int16 v15 = v5;
          __int16 v16 = 2048;
          __int16 v17 = self;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate downlink captions coordinator", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
  return v3 != 0;
}

- (void)cleanUpCaptionsCoordinator
{
  self->_captionsCoordinator = 0;
}

- (BOOL)setUpDelegateQueue:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
    self->_delegateQueue = (OS_dispatch_queue *)a3;
LABEL_4:
    LOBYTE(v7) = 1;
    return v7;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  uint64_t v6 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCCellularAudioTap.delegateQueue", 0, CustomRootQueue);
  self->_delegateQueue = v6;
  if (v6) {
    goto LABEL_4;
  }
  if ((VCCellularAudioTap *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      -[VCCellularAudioTap setUpDelegateQueue:]();
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v8 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
    }
    else {
      int v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      __int16 v10 = *MEMORY[0x1E4F47A50];
      BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      int v12 = 136316418;
      uint64_t v13 = v9;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCCellularAudioTap setUpDelegateQueue:]";
      __int16 v16 = 1024;
      int v17 = 247;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      __int16 v20 = 2048;
      int v21 = self;
      __int16 v22 = 2112;
      uint64_t v23 = 0;
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the delegateQueue=%@", (uint8_t *)&v12, 0x3Au);
    }
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)setUpCallRecordingComponents
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!VCFeatureFlagManager_CallRecordingEnabled())
  {
    if ((VCCellularAudioTap *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_17;
      }
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v13 = 136315650;
      uint64_t v14 = v5;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCCellularAudioTap setUpCallRecordingComponents]";
      __int16 v17 = 1024;
      int v18 = 263;
      BOOL v7 = " [%s] %s:%d Skipping set up for media recorder and captions coordinator because CallRecording is NOT enabled.";
      int v8 = v6;
      uint32_t v9 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v4 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v4 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_17;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      __int16 v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      int v13 = 136316162;
      uint64_t v14 = v10;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCCellularAudioTap setUpCallRecordingComponents]";
      __int16 v17 = 1024;
      int v18 = 263;
      __int16 v19 = 2112;
      __int16 v20 = v4;
      __int16 v21 = 2048;
      __int16 v22 = self;
      BOOL v7 = " [%s] %s:%d %@(%p) Skipping set up for media recorder and captions coordinator because CallRecording is NOT enabled.";
      int v8 = v11;
      uint32_t v9 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
LABEL_17:
    LOBYTE(v3) = 1;
    return v3;
  }
  self->_uuid = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  BOOL v3 = [(VCCellularAudioTap *)self setUpReportingAgent];
  if (v3)
  {
    BOOL v3 = [(VCCellularAudioTap *)self setUpMediaRecorder];
    if (v3)
    {
      if (![(VCCellularAudioTap *)self setUpCaptionsCoordinator])
      {
        LOBYTE(v3) = 0;
        return v3;
      }
      goto LABEL_17;
    }
  }
  return v3;
}

- (VCCellularAudioTap)initWithProcessId:(int)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VCCellularAudioTap;
  int v8 = [(VCObject *)&v19 init];
  if (!v8) {
    return v8;
  }
  uint32_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8->_audioTapIOMap = v9;
  if (!v9)
  {
    if ((VCCellularAudioTap *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCellularAudioTap initWithProcessId:delegate:delegateQueue:]();
        }
      }
      goto LABEL_6;
    }
    if (objc_opt_respondsToSelector()) {
      int v13 = (__CFString *)[(VCCellularAudioTap *)v8 performSelector:sel_logPrefix];
    }
    else {
      int v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v15;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCCellularAudioTap initWithProcessId:delegate:delegateQueue:]";
        __int16 v24 = 1024;
        int v25 = 276;
        __int16 v26 = 2112;
        long long v27 = v13;
        __int16 v28 = 2048;
        long long v29 = v8;
        __int16 v17 = " [%s] %s:%d %@(%p) Failed to allocate the audio tap I/O map";
LABEL_28:
        _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x30u);
      }
    }
LABEL_6:

    return 0;
  }
  if (![(VCCellularAudioTap *)v8 setUpDelegateQueue:a5]) {
    goto LABEL_6;
  }
  [(VCCellularAudioTap *)v8 setDelegate:a4];
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  dispatch_queue_t v11 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCCellularAudioTap.stateQueue", 0, CustomRootQueue);
  v8->_stateQueue = (OS_dispatch_queue *)v11;
  if (!v11)
  {
    if ((VCCellularAudioTap *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCellularAudioTap initWithProcessId:delegate:delegateQueue:]();
        }
      }
      goto LABEL_6;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCCellularAudioTap *)v8 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v21 = v18;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCCellularAudioTap initWithProcessId:delegate:delegateQueue:]";
        __int16 v24 = 1024;
        int v25 = 281;
        __int16 v26 = 2112;
        long long v27 = v14;
        __int16 v28 = 2048;
        long long v29 = v8;
        __int16 v17 = " [%s] %s:%d %@(%p) Failed to allocate the state queue";
        goto LABEL_28;
      }
    }
    goto LABEL_6;
  }
  v8->_processId = a3;
  v8->_tapToken = VCUniqueIDGenerator_GenerateID();
  if (![(VCCellularAudioTap *)v8 setUpCallRecordingComponents]) {
    goto LABEL_6;
  }
  return v8;
}

- (void)invalidate
{
  [(VCCellularAudioTap *)self setDelegate:0];
  [(VCMediaRecorder *)self->_mediaRecorder invalidate];
  [(VCObject *)self reportingAgent];

  VCReporting_finalizeAggregation();
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(VCCellularAudioTap *)self setDelegate:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_audioTapIOMap allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        -[VCCellularAudioTap removeAudioTapForStreamToken:error:](self, "removeAudioTapForStreamToken:error:", [*(id *)(*((void *)&v12 + 1) + 8 * v7++) unsignedIntValue], 0);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v5);
  }

  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_stateQueue = 0;
  }
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  [(VCCellularAudioTap *)self cleanUpCaptionsCoordinator];
  [(VCCellularAudioTap *)self cleanUpMediaRecorder];

  v10.receiver = self;
  v10.super_class = (Class)VCCellularAudioTap;
  [(VCObject *)&v10 dealloc];
}

- (void)terminateProcessFromAssertionOverflow:(BOOL)a3 onAudioTapIO:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a4 realtimeContext];
  if (v4) {
    uint64_t v7 = "overflow";
  }
  else {
    uint64_t v7 = "underflow";
  }
  if ((VCCellularAudioTap *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCellularAudioTap terminateProcessFromAssertionOverflow:onAudioTapIO:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCCellularAudioTap terminateProcessFromAssertionOverflow:onAudioTapIO:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v8 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
    }
    else {
      int v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      dispatch_queue_t v11 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v18 = v9;
          __int16 v19 = 2080;
          __int16 v20 = "-[VCCellularAudioTap terminateProcessFromAssertionOverflow:onAudioTapIO:]";
          __int16 v21 = 1024;
          int v22 = 335;
          __int16 v23 = 2112;
          __int16 v24 = v8;
          __int16 v25 = 2048;
          __int16 v26 = self;
          __int16 v27 = 2080;
          __int16 v28 = v7;
          _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Assertion counter %s! We've leaked the audio assertions. Terminating...", buf, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v18 = v9;
        __int16 v19 = 2080;
        __int16 v20 = "-[VCCellularAudioTap terminateProcessFromAssertionOverflow:onAudioTapIO:]";
        __int16 v21 = 1024;
        int v22 = 335;
        __int16 v23 = 2112;
        __int16 v24 = v8;
        __int16 v25 = 2048;
        __int16 v26 = self;
        __int16 v27 = 2080;
        __int16 v28 = v7;
        _os_log_fault_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) Assertion counter %s! We've leaked the audio assertions. Terminating...", buf, 0x3Au);
      }
    }
  }
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Audio assertion counter %sed", v7);
  long long v13 = NSString;
  long long v14 = (objc_class *)objc_opt_class();
  Name = class_getName(v14);
  if (v6) {
    uint64_t v16 = *(unsigned int *)(v6 + 8);
  }
  else {
    uint64_t v16 = 0xFFFFFFFFLL;
  }
  VCTerminateProcess(v12, (const void *)objc_msgSend(v13, "stringWithFormat:", @"%s tapType=%u", Name, v16), (uint64_t)-[VCObject reportingAgent](self, "reportingAgent"));
}

- (id)startAudioForStreamToken:(id)a3 isInitialization:(BOOL)a4
{
  *(void *)&v52[3] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_audioTapIOMap objectForKeyedSubscript:a3];
  if (v7)
  {
    int v8 = v7;
    int v9 = [v7 enableAsyncTapStart];
    int v10 = v9;
    if (!a4 && (v9 & 1) == 0)
    {
      if ((VCCellularAudioTap *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return 0;
        }
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        __int16 v28 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 0;
        }
        int v40 = 136316418;
        uint64_t v41 = v27;
        __int16 v42 = 2080;
        v43 = "-[VCCellularAudioTap startAudioForStreamToken:isInitialization:]";
        __int16 v44 = 1024;
        int v45 = 369;
        __int16 v46 = 2112;
        id v47 = a3;
        __int16 v48 = 1024;
        *(_DWORD *)v49 = 0;
        *(_WORD *)&v49[4] = 1024;
        *(_DWORD *)&v49[6] = 0;
        uint64_t v18 = " [%s] %s:%d Ignoring call to start audio for token=%@ because isInitialization=%{BOOL}d tapPrefersAsyncStart=%{BOOL}d";
        __int16 v19 = v28;
        uint32_t v20 = 50;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v25 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v25 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return 0;
        }
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 0;
        }
        int v40 = 136316930;
        uint64_t v41 = v31;
        __int16 v42 = 2080;
        v43 = "-[VCCellularAudioTap startAudioForStreamToken:isInitialization:]";
        __int16 v44 = 1024;
        int v45 = 369;
        __int16 v46 = 2112;
        id v47 = v25;
        __int16 v48 = 2048;
        *(void *)v49 = self;
        *(_WORD *)&v49[8] = 2112;
        id v50 = a3;
        __int16 v51 = 1024;
        v52[0] = 0;
        LOWORD(v52[1]) = 1024;
        *(_DWORD *)((char *)&v52[1] + 2) = 0;
        uint64_t v18 = " [%s] %s:%d %@(%p) Ignoring call to start audio for token=%@ because isInitialization=%{BOOL}d tapPrefersA"
              "syncStart=%{BOOL}d";
        __int16 v19 = v32;
        uint32_t v20 = 70;
      }
LABEL_20:
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v40, v20);
      return 0;
    }
    uint64_t v11 = [v8 audioAssertionCounter];
    uint64_t v12 = v11;
    if (a4 || !v11)
    {
      uint64_t v13 = objc_msgSend((id)objc_msgSend(v8, "audioIO"), "start");
      if (v13)
      {
        long long v14 = (void *)v13;
        if ((VCCellularAudioTap *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            return v14;
          }
          uint64_t v33 = VRTraceErrorLogLevelToCSTR();
          v34 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            return v14;
          }
          int v40 = 136316162;
          uint64_t v41 = v33;
          __int16 v42 = 2080;
          v43 = "-[VCCellularAudioTap startAudioForStreamToken:isInitialization:]";
          __int16 v44 = 1024;
          int v45 = 374;
          __int16 v46 = 2112;
          id v47 = a3;
          __int16 v48 = 2112;
          *(void *)v49 = v14;
          v35 = " [%s] %s:%d Failed to register start the audioIO for streamToken=%@. error=%@";
          v36 = v34;
          uint32_t v37 = 48;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            __int16 v26 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
          }
          else {
            __int16 v26 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
            return v14;
          }
          uint64_t v38 = VRTraceErrorLogLevelToCSTR();
          v39 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            return v14;
          }
          int v40 = 136316674;
          uint64_t v41 = v38;
          __int16 v42 = 2080;
          v43 = "-[VCCellularAudioTap startAudioForStreamToken:isInitialization:]";
          __int16 v44 = 1024;
          int v45 = 374;
          __int16 v46 = 2112;
          id v47 = v26;
          __int16 v48 = 2048;
          *(void *)v49 = self;
          *(_WORD *)&v49[8] = 2112;
          id v50 = a3;
          __int16 v51 = 2112;
          *(void *)v52 = v14;
          v35 = " [%s] %s:%d %@(%p) Failed to register start the audioIO for streamToken=%@. error=%@";
          v36 = v39;
          uint32_t v37 = 68;
        }
        _os_log_error_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_ERROR, v35, (uint8_t *)&v40, v37);
        return v14;
      }
    }
    if (!v10) {
      return 0;
    }
    [v8 setAudioAssertionCounter:v12 + 1];
    long long v14 = (void *)[v8 audioAssertionCounter];
    if (v14)
    {
      if ((VCCellularAudioTap *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return 0;
        }
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        __int16 v17 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 0;
        }
        int v40 = 136316162;
        uint64_t v41 = v16;
        __int16 v42 = 2080;
        v43 = "-[VCCellularAudioTap startAudioForStreamToken:isInitialization:]";
        __int16 v44 = 1024;
        int v45 = 383;
        __int16 v46 = 2112;
        id v47 = a3;
        __int16 v48 = 2048;
        *(void *)v49 = v14;
        uint64_t v18 = " [%s] %s:%d Adding new assertion for token=%@, audioAssertionCounter=%llu";
        __int16 v19 = v17;
        uint32_t v20 = 48;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          long long v15 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
        }
        else {
          long long v15 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          return 0;
        }
        uint64_t v21 = VRTraceErrorLogLevelToCSTR();
        int v22 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return 0;
        }
        int v40 = 136316674;
        uint64_t v41 = v21;
        __int16 v42 = 2080;
        v43 = "-[VCCellularAudioTap startAudioForStreamToken:isInitialization:]";
        __int16 v44 = 1024;
        int v45 = 383;
        __int16 v46 = 2112;
        id v47 = v15;
        __int16 v48 = 2048;
        *(void *)v49 = self;
        *(_WORD *)&v49[8] = 2112;
        id v50 = a3;
        __int16 v51 = 2048;
        *(void *)v52 = v14;
        uint64_t v18 = " [%s] %s:%d %@(%p) Adding new assertion for token=%@, audioAssertionCounter=%llu";
        __int16 v19 = v22;
        uint32_t v20 = 68;
      }
      goto LABEL_20;
    }
    [(VCCellularAudioTap *)self terminateProcessFromAssertionOverflow:1 onAudioTapIO:v8];
  }
  else
  {
    if ((VCCellularAudioTap *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCellularAudioTap startAudioForStreamToken:isInitialization:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v24 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        uint64_t v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v40 = 136316418;
          uint64_t v41 = v29;
          __int16 v42 = 2080;
          v43 = "-[VCCellularAudioTap startAudioForStreamToken:isInitialization:]";
          __int16 v44 = 1024;
          int v45 = 366;
          __int16 v46 = 2112;
          id v47 = v24;
          __int16 v48 = 2048;
          *(void *)v49 = self;
          *(_WORD *)&v49[8] = 2112;
          id v50 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Audio tap not found. streamToken=%@", (uint8_t *)&v40, 0x3Au);
        }
      }
    }
    return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCCellularAudioTap" code:-2142830570 userInfo:0];
  }
  return v14;
}

- (id)stopAudioForStreamToken:(id)a3 isDeinitialization:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_audioTapIOMap objectForKeyedSubscript:a3];
  int v8 = [v7 enableAsyncTapStart];
  int v9 = (void *)[v7 audioIO];
  int v10 = [v9 state];
  uint64_t v11 = [v7 audioAssertionCounter];
  uint64_t v12 = v11;
  if (v7)
  {
    unsigned int v13 = v10 - 1;
    if ((v4 | v8) != 1 || v13 >= 2)
    {
      if ((VCCellularAudioTap *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_18;
        }
        os_log_t log = (os_log_t)VRTraceErrorLogLevelToCSTR();
        uint64_t v38 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136317186;
        uint64_t v49 = (uint64_t)log;
        __int16 v50 = 2080;
        __int16 v51 = "-[VCCellularAudioTap stopAudioForStreamToken:isDeinitialization:]";
        __int16 v52 = 1024;
        int v53 = 424;
        __int16 v54 = 2112;
        id v55 = v9;
        __int16 v56 = 2112;
        uint64_t v57 = (uint64_t)a3;
        __int16 v58 = 1024;
        *(_DWORD *)v59 = v4;
        *(_WORD *)&v59[4] = 1024;
        *(_DWORD *)&v59[6] = v8;
        LOWORD(v60) = 1024;
        *(_DWORD *)((char *)&v60 + 2) = v13 < 2;
        HIWORD(v60) = 1024;
        *(_DWORD *)v61 = v10;
        v39 = " [%s] %s:%d Ignoring call to stop audioIO=%@ for token=%@ because isDeinitialization=%{BOOL}d tapStateMana"
              "gementIsAsync=%{BOOL}d audioIOIsRunning=%{BOOL}d audioIOState=%u";
        int v40 = v38;
        uint32_t v41 = 72;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v36 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
        }
        else {
          v36 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_18;
        }
        int v45 = v36;
        uint64_t v42 = VRTraceErrorLogLevelToCSTR();
        os_log_t loga = (os_log_t)*MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136317698;
        uint64_t v49 = v42;
        __int16 v50 = 2080;
        __int16 v51 = "-[VCCellularAudioTap stopAudioForStreamToken:isDeinitialization:]";
        __int16 v52 = 1024;
        int v53 = 424;
        __int16 v54 = 2112;
        id v55 = v45;
        __int16 v56 = 2048;
        uint64_t v57 = (uint64_t)self;
        __int16 v58 = 2112;
        *(void *)v59 = v9;
        *(_WORD *)&v59[8] = 2112;
        uint64_t v60 = (uint64_t)a3;
        *(_WORD *)v61 = 1024;
        *(_DWORD *)&v61[2] = v4;
        __int16 v62 = 1024;
        int v63 = v8;
        __int16 v64 = 1024;
        BOOL v65 = v13 < 2;
        __int16 v66 = 1024;
        int v67 = v10;
        v39 = " [%s] %s:%d %@(%p) Ignoring call to stop audioIO=%@ for token=%@ because isDeinitialization=%{BOOL}d tapSt"
              "ateManagementIsAsync=%{BOOL}d audioIOIsRunning=%{BOOL}d audioIOState=%u";
        int v40 = loga;
        uint32_t v41 = 92;
      }
      _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
    }
    else
    {
      if (!v4 && v11 != 1) {
        goto LABEL_18;
      }
      uint64_t v15 = [v9 stop];
      if (!v15) {
        goto LABEL_19;
      }
      if ((VCCellularAudioTap *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_18;
        }
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint64_t v18 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v49 = v17;
        __int16 v50 = 2080;
        __int16 v51 = "-[VCCellularAudioTap stopAudioForStreamToken:isDeinitialization:]";
        __int16 v52 = 1024;
        int v53 = 430;
        __int16 v54 = 2112;
        id v55 = a3;
        __int16 v56 = 2112;
        uint64_t v57 = v15;
        __int16 v19 = " [%s] %s:%d Failed to stop the audioIO for streamToken=%@. error=%@";
        uint32_t v20 = v18;
        uint32_t v21 = 48;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v16 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v16 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_18;
        }
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        __int16 v23 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v49 = v22;
        __int16 v50 = 2080;
        __int16 v51 = "-[VCCellularAudioTap stopAudioForStreamToken:isDeinitialization:]";
        __int16 v52 = 1024;
        int v53 = 430;
        __int16 v54 = 2112;
        id v55 = v16;
        __int16 v56 = 2048;
        uint64_t v57 = (uint64_t)self;
        __int16 v58 = 2112;
        *(void *)v59 = a3;
        *(_WORD *)&v59[8] = 2112;
        uint64_t v60 = v15;
        __int16 v19 = " [%s] %s:%d %@(%p) Failed to stop the audioIO for streamToken=%@. error=%@";
        uint32_t v20 = v23;
        uint32_t v21 = 68;
      }
      _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    }
LABEL_18:
    uint64_t v15 = 0;
    goto LABEL_19;
  }
  uint64_t v15 = -2142830570;
  if ((VCCellularAudioTap *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCellularAudioTap stopAudioForStreamToken:isDeinitialization:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v37 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v37 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v43 = VRTraceErrorLogLevelToCSTR();
      __int16 v44 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v49 = v43;
        __int16 v50 = 2080;
        __int16 v51 = "-[VCCellularAudioTap stopAudioForStreamToken:isDeinitialization:]";
        __int16 v52 = 1024;
        int v53 = 423;
        __int16 v54 = 2112;
        id v55 = v37;
        __int16 v56 = 2048;
        uint64_t v57 = (uint64_t)self;
        __int16 v58 = 2112;
        *(void *)v59 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v44, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Audio tap not found. streamToken=%@", buf, 0x3Au);
      }
    }
  }
LABEL_19:
  if (v4) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = [v7 enableAsyncTapStart];
  }
  objc_msgSend(v7, "setEnableAsyncTapStart:", v24, v45);
  if ([v7 enableAsyncTapStart])
  {
    [v7 setAudioAssertionCounter:v12 - 1];
    if (!v12)
    {
      [(VCCellularAudioTap *)self terminateProcessFromAssertionOverflow:0 onAudioTapIO:v7];
      goto LABEL_36;
    }
    if ((VCCellularAudioTap *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_36;
      }
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v27 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      uint64_t v28 = [v7 audioAssertionCounter];
      *(_DWORD *)buf = 136316162;
      uint64_t v49 = v26;
      __int16 v50 = 2080;
      __int16 v51 = "-[VCCellularAudioTap stopAudioForStreamToken:isDeinitialization:]";
      __int16 v52 = 1024;
      int v53 = 440;
      __int16 v54 = 2112;
      id v55 = a3;
      __int16 v56 = 2048;
      uint64_t v57 = v28;
      uint64_t v29 = " [%s] %s:%d Removing assertion for token=%@, audioAssertionCounter=%llu";
      uint64_t v30 = v27;
      uint32_t v31 = 48;
      goto LABEL_35;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v25 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v25 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v32 = VRTraceErrorLogLevelToCSTR();
      uint64_t v33 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [v7 audioAssertionCounter];
        *(_DWORD *)buf = 136316674;
        uint64_t v49 = v32;
        __int16 v50 = 2080;
        __int16 v51 = "-[VCCellularAudioTap stopAudioForStreamToken:isDeinitialization:]";
        __int16 v52 = 1024;
        int v53 = 440;
        __int16 v54 = 2112;
        id v55 = v25;
        __int16 v56 = 2048;
        uint64_t v57 = (uint64_t)self;
        __int16 v58 = 2112;
        *(void *)v59 = a3;
        *(_WORD *)&v59[8] = 2048;
        uint64_t v60 = v34;
        uint64_t v29 = " [%s] %s:%d %@(%p) Removing assertion for token=%@, audioAssertionCounter=%llu";
        uint64_t v30 = v33;
        uint32_t v31 = 68;
LABEL_35:
        _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
      }
    }
  }
LABEL_36:
  if (v7) {
    return 0;
  }
  else {
    return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCCellularAudioTap" code:v15 userInfo:0];
  }
}

- (int)validateAddAudioTapForStreamToken:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    int v4 = a3;
    if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_audioTapIOMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:")))return 0; {
    if ((VCCellularAudioTap *)objc_opt_class() == self)
    }
    {
      int v5 = -2142830551;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCCellularAudioTap validateAddAudioTapForStreamToken:]();
          return -2142830551;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v8 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
      }
      else {
        int v8 = &stru_1F3D3E450;
      }
      int v5 = -2142830551;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v13 = 136316418;
          uint64_t v14 = v11;
          __int16 v15 = 2080;
          uint64_t v16 = "-[VCCellularAudioTap validateAddAudioTapForStreamToken:]";
          __int16 v17 = 1024;
          int v18 = 457;
          __int16 v19 = 2112;
          uint32_t v20 = v8;
          __int16 v21 = 2048;
          uint64_t v22 = self;
          __int16 v23 = 1024;
          int v24 = v4;
          _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Audio tap already registered for streamToken=%u", (uint8_t *)&v13, 0x36u);
          return -2142830551;
        }
      }
    }
  }
  else
  {
    int v5 = -2142830591;
    if ((VCCellularAudioTap *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCellularAudioTap validateAddAudioTapForStreamToken:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCCellularAudioTap *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        int v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v13 = 136316162;
          uint64_t v14 = v9;
          __int16 v15 = 2080;
          uint64_t v16 = "-[VCCellularAudioTap validateAddAudioTapForStreamToken:]";
          __int16 v17 = 1024;
          int v18 = 456;
          __int16 v19 = 2112;
          uint32_t v20 = v7;
          __int16 v21 = 2048;
          uint64_t v22 = self;
          _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid stream token", (uint8_t *)&v13, 0x30u);
        }
      }
    }
  }
  return v5;
}

- (id)initializeAudioTapIOForStreamToken:(int64_t)a3 enableAsyncTapStart:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_audioTapIOMap, "objectForKeyedSubscript:", v6), "setEnableAsyncTapStart:", v4);
  if (v4) {
    return 0;
  }

  return [(VCCellularAudioTap *)self startAudioForStreamToken:v6 isInitialization:1];
}

- (BOOL)addAudioTapForStreamToken:(int64_t)a3 tapType:(unsigned int)a4 enableAsyncTapStart:(BOOL)a5 error:(id *)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  stateQueue = self->_stateQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__VCCellularAudioTap_addAudioTapForStreamToken_tapType_enableAsyncTapStart_error___block_invoke;
  v9[3] = &unk_1E6DB8210;
  unsigned int v10 = a4;
  BOOL v11 = a5;
  v9[4] = self;
  v9[5] = &v12;
  v9[6] = a3;
  v9[7] = a6;
  dispatch_sync(stateQueue, v9);
  char v7 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __82__VCCellularAudioTap_addAudioTapForStreamToken_tapType_enableAsyncTapStart_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) validateAddAudioTapForStreamToken:*(void *)(a1 + 48)];
  if (v2 < 0)
  {
    int v3 = v2;
    goto LABEL_24;
  }
  int v3 = [*(id *)(a1 + 32) registerAudioTapForStreamToken:*(void *)(a1 + 48) tapType:*(unsigned int *)(a1 + 64)];
  if (v3 < 0)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_24;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)int v18 = 136316162;
      *(void *)&v18[4] = v8;
      *(_WORD *)&v18[12] = 2080;
      *(void *)&v18[14] = "-[VCCellularAudioTap addAudioTapForStreamToken:tapType:enableAsyncTapStart:error:]_block_invoke";
      *(_WORD *)&v18[22] = 1024;
      LODWORD(v19) = 496;
      WORD2(v19) = 1024;
      *(_DWORD *)((char *)&v19 + 6) = v10;
      WORD5(v19) = 1024;
      HIDWORD(v19) = v3;
      BOOL v11 = " [%s] %s:%d Failed to register audio tap for streamToken=%u result=0x%x";
      uint64_t v12 = v9;
      uint32_t v13 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        char v7 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        char v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_24;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      char v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 48);
      *(_DWORD *)int v18 = 136316674;
      *(void *)&v18[4] = v14;
      *(_WORD *)&v18[12] = 2080;
      *(void *)&v18[14] = "-[VCCellularAudioTap addAudioTapForStreamToken:tapType:enableAsyncTapStart:error:]_block_invoke";
      *(_WORD *)&v18[22] = 1024;
      LODWORD(v19) = 496;
      WORD2(v19) = 2112;
      *(void *)((char *)&v19 + 6) = v7;
      HIWORD(v19) = 2048;
      uint64_t v20 = v16;
      LOWORD(v21) = 1024;
      *(_DWORD *)((char *)&v21 + 2) = v17;
      HIWORD(v21) = 1024;
      LODWORD(v22) = v3;
      BOOL v11 = " [%s] %s:%d %@(%p) Failed to register audio tap for streamToken=%u result=0x%x";
      uint64_t v12 = v15;
      uint32_t v13 = 60;
    }
    _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, v11, v18, v13);
LABEL_24:
    int v5 = 0;
    uint64_t v4 = 0;
    goto LABEL_5;
  }
  uint64_t v4 = [*(id *)(a1 + 32) initializeAudioTapIOForStreamToken:*(void *)(a1 + 48) enableAsyncTapStart:*(unsigned __int8 *)(a1 + 68)];
  int v5 = 1;
  if (!v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
LABEL_5:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (v5) {
      [*(id *)(a1 + 32) unregisterAudioTapForStreamToken:*(void *)(a1 + 48)];
    }
    uint64_t v6 = *(uint64_t **)(a1 + 56);
    if (v6)
    {
      if (!v4)
      {
        uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCCellularAudioTap" code:v3 userInfo:0];
        uint64_t v6 = *(uint64_t **)(a1 + 56);
      }
      uint64_t *v6 = v4;
    }
    objc_msgSend(*(id *)(a1 + 32), "cleanUpPeriodicReporting", *(_OWORD *)v18, *(void *)&v18[16], v19, v20, v21, v22);
    [*(id *)(a1 + 32) unregisterForThermalNotifications];
  }
}

- (BOOL)removeAudioTapForStreamToken:(int64_t)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCCellularAudioTap_removeAudioTapForStreamToken_error___block_invoke;
  block[3] = &unk_1E6DB8238;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  block[7] = a4;
  dispatch_sync(stateQueue, block);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __57__VCCellularAudioTap_removeAudioTapForStreamToken_error___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "stopAudioForStreamToken:isDeinitialization:", objc_msgSend(NSNumber, "numberWithInteger:"), 1);
    if (result)
    {
      uint64_t v3 = 0;
    }
    else
    {
      [*(id *)(a1 + 32) unregisterAudioTapForStreamToken:*(void *)(a1 + 48)];
      if (![*(id *)(*(void *)(a1 + 32) + 168) count])
      {
        [*(id *)(a1 + 32) cleanUpPeriodicReporting];
        [*(id *)(a1 + 32) unregisterForThermalNotifications];
      }
      uint64_t v3 = 0;
      uint64_t result = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    uint64_t v3 = -2142830591;
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __57__VCCellularAudioTap_removeAudioTapForStreamToken_error___block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        char v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        char v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        char v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v8 = *(void *)(a1 + 32);
          int v9 = 136316162;
          uint64_t v10 = v6;
          __int16 v11 = 2080;
          uint64_t v12 = "-[VCCellularAudioTap removeAudioTapForStreamToken:error:]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 527;
          __int16 v15 = 2112;
          uint64_t v16 = v5;
          __int16 v17 = 2048;
          uint64_t v18 = v8;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid stream token", (uint8_t *)&v9, 0x30u);
        }
      }
    }
    uint64_t result = 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v4 = *(uint64_t **)(a1 + 56);
    if (v4)
    {
      if (!result)
      {
        uint64_t result = [MEMORY[0x1E4F28C58] errorWithDomain:@"VCCellularAudioTap" code:v3 userInfo:0];
        uint64_t v4 = *(uint64_t **)(a1 + 56);
      }
      *uint64_t v4 = result;
    }
  }
  return result;
}

- (void)serverDidDie
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__VCCellularAudioTap_serverDidDie__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __34__VCCellularAudioTap_serverDidDie__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 240) serverDidDie];
}

+ (unsigned)audioIOTypeFromTapType:(unsigned int)a3
{
  if (a3 == 1) {
    unsigned int v3 = 4;
  }
  else {
    unsigned int v3 = -1;
  }
  if (a3) {
    return v3;
  }
  else {
    return 3;
  }
}

- (tagVCAudioIODelegateContext)sinkDelegateContextWithTapType:(SEL)a3 realtimeContext:(unsigned int)a4
{
  retstr->delegate = 0;
  retstr->clientCallback = VCCellularAudioTap_ProcessAudioCallback;
  retstr->clientContext = a5;
  clientContext = (VCAudioCaptionsCoordinator *)self[3].clientContext;
  if (clientContext) {
    int64_t streamToken = a5->streamToken;
  }
  else {
    int64_t streamToken = 0;
  }
  retstr->captionsToken = streamToken;
  retstr->captionsCoordinator = clientContext;
  retstr->captionsUseSecondaryThread = a4 == 0;
  retstr->injector = 0;
  return self;
}

- (int)makeAudioIOForAudioTapIO:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 realtimeContext];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
      uint64_t v12 = 0;
      int v13 = -2142830570;
      goto LABEL_7;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    int v13 = -2142830570;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCCellularAudioTap *)v15 makeAudioIOForAudioTapIO:v16];
    }
    goto LABEL_14;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(unsigned int *)(v5 + 8);
  uint64_t v8 = +[VCCellularAudioTap audioIOTypeFromTapType:v7];
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v18 = v9;
  long long v19 = v9;
  long long v20 = v9;
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  if (self)
  {
    uint64_t v10 = v8;
    [(VCCellularAudioTap *)self sinkDelegateContextWithTapType:v7 realtimeContext:v6];
    -[VCCellularAudioTap audioIOConfigWithAudioType:sinkDelegateContext:](self, "audioIOConfigWithAudioType:sinkDelegateContext:", v10, &v18, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL);
  }
  else
  {
    unint64_t v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
    memset(v17, 0, sizeof(v17));
  }
  __int16 v11 = [[VCAudioIO alloc] initWithConfiguration:v17];
  if (!v11)
  {
    int v13 = -2142830590;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCellularAudioTap makeAudioIOForAudioTapIO:]();
      }
    }
LABEL_14:
    uint64_t v12 = 0;
    goto LABEL_7;
  }
  uint64_t v12 = v11;
  [a3 setAudioIO:v11];
  int v13 = 0;
LABEL_7:

  return v13;
}

- (void)setAudioTapIO:(id)a3 forStreamToken:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (![(NSMutableDictionary *)self->_audioTapIOMap count])
  {
    [(VCCellularAudioTap *)self setUpPeriodicReporting];
    [(VCCellularAudioTap *)self registerForThermalNotifications];
  }
  audioTapIOMap = self->_audioTapIOMap;
  uint64_t v8 = [NSNumber numberWithInteger:a4];

  [(NSMutableDictionary *)audioTapIOMap setObject:a3 forKeyedSubscript:v8];
}

- (int)registerAudioTapForStreamToken:(int64_t)a3 tapType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (+[VCCellularAudioTap audioIOTypeFromTapType:*(void *)&a4] == -1)
  {
    int v11 = -2142830591;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCellularAudioTap registerAudioTapForStreamToken:tapType:]();
      }
    }
    goto LABEL_13;
  }
  uint64_t v7 = [[VCAudioPowerSpectrumSource alloc] initWithStreamToken:a3 delegate:self];
  if (!v7)
  {
    int v11 = -2142830590;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCellularAudioTap registerAudioTapForStreamToken:tapType:]();
      }
    }
LABEL_13:
    uint64_t v10 = 0;
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  uint64_t v8 = v7;
  long long v9 = [[VCCellularAudioTapIO alloc] initWithStreamToken:a3 powerSpectrumSource:v7 tapType:v4];
  if (v9)
  {
    uint64_t v10 = v9;
    [(VCCellularAudioTapIO *)v9 setMediaRecorder:self->_mediaRecorder];
    int v11 = [(VCCellularAudioTap *)self makeAudioIOForAudioTapIO:v10];
    if ((v11 & 0x80000000) == 0)
    {
      [(VCCellularAudioTap *)self setAudioTapIO:v10 forStreamToken:a3];
      [+[VCAudioPowerSpectrumManager sharedInstance] registerAudioPowerMeterSource:v8];
    }
  }
  else
  {
    int v11 = -2142830590;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCellularAudioTap registerAudioTapForStreamToken:tapType:]();
      }
    }
    uint64_t v10 = 0;
  }
LABEL_6:

  return v11;
}

- (void)unregisterAudioTapForStreamToken:(int64_t)a3
{
  uint64_t v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_audioTapIOMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:"));
  uint64_t v6 = +[VCAudioPowerSpectrumManager sharedInstance];
  -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v6, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "streamToken")));
  audioTapIOMap = self->_audioTapIOMap;
  uint64_t v8 = [NSNumber numberWithInteger:a3];

  [(NSMutableDictionary *)audioTapIOMap setObject:0 forKeyedSubscript:v8];
}

- (tagVCAudioIOConfiguration)audioIOConfigWithAudioType:(SEL)a3 sinkDelegateContext:(unsigned int)a4
{
  *(void *)&retstr->var1 = 0x200000000;
  *(void *)&retstr->var9 = 0x1E000005DC0;
  *(_OWORD *)&retstr->var19.delegate = 0u;
  *(_OWORD *)&retstr->var19.clientContext = 0u;
  *(_OWORD *)&retstr->var19.captionsCoordinator = 0u;
  long long v5 = *(_OWORD *)&a5->clientContext;
  *(_OWORD *)&retstr->var20.delegate = *(_OWORD *)&a5->delegate;
  retstr->var0 = *(void *)&self->var22;
  retstr->var3 = 0;
  retstr->var4 = a4;
  *(_WORD *)&retstr->var5 = 2;
  int injector = (int)self->var20.injector;
  retstr->var7 = self;
  retstr->var8 = injector;
  retstr->var11 = 0;
  retstr->var12 = 0;
  retstr->var13 = 1;
  retstr->var19.int injector = 0;
  retstr->var14 = 0;
  retstr->var15 = 0;
  *(_WORD *)&retstr->var17 = 0;
  retstr->var16 = 0;
  *(_OWORD *)&retstr->var20.clientContext = v5;
  *(_OWORD *)&retstr->var20.captionsCoordinator = *(_OWORD *)&a5->captionsCoordinator;
  retstr->var20.int injector = a5->injector;
  retstr->var21 = 0;
  *(_WORD *)&retstr->var22 = 0;
  return self;
}

+ (BOOL)validateAsynchronousActionContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (a3 && a3->var0 == 1 && a3->var1) {
    return 1;
  }
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_15;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    if (a3)
    {
      int var0 = a3->var0;
      var1 = a3->var1;
    }
    else
    {
      int var0 = 0;
      var1 = 0;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v27 = v9;
    __int16 v28 = 2080;
    uint64_t v29 = "+[VCCellularAudioTap validateAsynchronousActionContext:withError:]";
    __int16 v30 = 1024;
    int v31 = 733;
    __int16 v32 = 2048;
    uint64_t v33 = a3;
    __int16 v34 = 1024;
    *(_DWORD *)v35 = var0;
    *(_WORD *)&v35[4] = 2048;
    *(void *)&v35[6] = var1;
    unint64_t v21 = " [%s] %s:%d Invalid context=%p passed. Type=%d callerContext=%p";
    uint64_t v22 = v10;
    uint32_t v23 = 54;
LABEL_24:
    _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
    if (a4) {
      goto LABEL_16;
    }
    return 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = (__CFString *)[a1 performSelector:sel_logPrefix];
  }
  else {
    uint64_t v8 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    int v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      if (a3)
      {
        int v19 = a3->var0;
        long long v20 = a3->var1;
      }
      else
      {
        int v19 = 0;
        long long v20 = 0;
      }
      *(_DWORD *)buf = 136316930;
      uint64_t v27 = v13;
      __int16 v28 = 2080;
      uint64_t v29 = "+[VCCellularAudioTap validateAsynchronousActionContext:withError:]";
      __int16 v30 = 1024;
      int v31 = 733;
      __int16 v32 = 2112;
      uint64_t v33 = (const tagVCAsynchronousActionContext *)v8;
      __int16 v34 = 2048;
      *(void *)v35 = a1;
      *(_WORD *)&v35[8] = 2048;
      *(void *)&v35[10] = a3;
      __int16 v36 = 1024;
      int v37 = v19;
      __int16 v38 = 2048;
      v39 = v20;
      unint64_t v21 = " [%s] %s:%d %@(%p) Invalid context=%p passed. Type=%d callerContext=%p";
      uint64_t v22 = v14;
      uint32_t v23 = 74;
      goto LABEL_24;
    }
  }
LABEL_15:
  if (!a4) {
    return 0;
  }
LABEL_16:
  uint64_t v24 = *MEMORY[0x1E4F28568];
  uint64_t v15 = NSString;
  uint64_t v16 = (objc_class *)objc_opt_class();
  uint64_t v25 = objc_msgSend(v15, "stringWithFormat:", @"Invalid deferred action context provided to class=%s", class_getName(v16));
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  long long v18 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"VCCellularAudioTap" code:-2142830591 userInfo:v17];
  BOOL result = 0;
  *a4 = v18;
  return result;
}

- (BOOL)actionWillBeginForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!+[VCCellularAudioTap validateAsynchronousActionContext:withError:](VCCellularAudioTap, "validateAsynchronousActionContext:withError:"))return 0; {
  uint64_t v7 = *(void *)a3->var1;
  }
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__22;
  stateQueue = self->_stateQueue;
  uint64_t v17 = __Block_byref_object_dispose__22;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__VCCellularAudioTap_actionWillBeginForContext_withError___block_invoke;
  v12[3] = &unk_1E6DB7008;
  v12[5] = &v13;
  v12[6] = v7;
  v12[4] = self;
  dispatch_sync(stateQueue, v12);
  uint64_t v9 = v14;
  if (a4) {
    *a4 = (id)v14[5];
  }
  BOOL v10 = v9[5] == 0;
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __58__VCCellularAudioTap_actionWillBeginForContext_withError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 48) == v2[27])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    unsigned int v3 = (void *)v2[21];
    uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v10;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t result = [*(id *)(a1 + 32) startAudioForStreamToken:*(void *)(*((void *)&v9 + 1) + 8 * v7) isInitialization:0];
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
        if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t result = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
          uint64_t v5 = result;
          if (result) {
            goto LABEL_4;
          }
          return result;
        }
      }
    }
  }
  else
  {
    uint64_t result = objc_msgSend(v2, "startAudioForStreamToken:isInitialization:", objc_msgSend(NSNumber, "numberWithInteger:"), 0);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)actionDidFinishForContext:(const tagVCAsynchronousActionContext *)a3 withError:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!+[VCCellularAudioTap validateAsynchronousActionContext:withError:](VCCellularAudioTap, "validateAsynchronousActionContext:withError:"))return 0; {
  uint64_t v7 = *(void *)a3->var1;
  }
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy__22;
  stateQueue = self->_stateQueue;
  uint64_t v17 = __Block_byref_object_dispose__22;
  uint64_t v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__VCCellularAudioTap_actionDidFinishForContext_withError___block_invoke;
  v12[3] = &unk_1E6DB7008;
  v12[5] = &v13;
  v12[6] = v7;
  v12[4] = self;
  dispatch_sync(stateQueue, v12);
  long long v9 = v14;
  if (a4) {
    *a4 = (id)v14[5];
  }
  BOOL v10 = v9[5] == 0;
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __58__VCCellularAudioTap_actionDidFinishForContext_withError___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 48) == v2[27])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unsigned int v3 = (void *)v2[21];
    uint64_t result = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(a1 + 32) stopAudioForStreamToken:*(void *)(*((void *)&v12 + 1) + 8 * v7) isDeinitialization:0];
          uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
          if (*(void *)(v9 + 40)) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = v8 == 0;
          }
          if (!v10) {
            *(void *)(v9 + 40) = v8;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t result = [v3 countByEnumeratingWithState:&v12 objects:v11 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  else
  {
    uint64_t result = objc_msgSend(v2, "stopAudioForStreamToken:isDeinitialization:", objc_msgSend(NSNumber, "numberWithInteger:"), 0);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (int64_t)tapToken
{
  return self->_tapToken;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (VCServerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void)setUpReportingAgent
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create reportingAgent", v2, v3, v4, v5, v6);
}

void __41__VCCellularAudioTap_setUpReportingAgent__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Reporting not available (no backends)", v2, v3, v4, v5, v6);
}

- (void)setUpMediaRecorder
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media recorder", v2, v3, v4, v5, v6);
}

- (void)setUpCaptionsCoordinator
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate downlink captions coordinator", v2, v3, v4, v5, v6);
}

- (void)setUpDelegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the delegateQueue=%@");
}

- (void)initWithProcessId:delegate:delegateQueue:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the audio tap I/O map", v2, v3, v4, v5, v6);
}

- (void)initWithProcessId:delegate:delegateQueue:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the state queue", v2, v3, v4, v5, v6);
}

- (void)terminateProcessFromAssertionOverflow:onAudioTapIO:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Assertion counter %s! We've leaked the audio assertions. Terminating...", v2, v3, v4, v5);
}

- (void)terminateProcessFromAssertionOverflow:onAudioTapIO:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_13();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Assertion counter %s! We've leaked the audio assertions. Terminating...", v1, 0x26u);
}

- (void)startAudioForStreamToken:isInitialization:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Audio tap not found. streamToken=%@");
}

- (void)stopAudioForStreamToken:isDeinitialization:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Audio tap not found. streamToken=%@");
}

- (void)validateAddAudioTapForStreamToken:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid stream token", v2, v3, v4, v5, v6);
}

- (void)validateAddAudioTapForStreamToken:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Audio tap already registered for streamToken=%u", v2, v3, v4, 457);
}

void __57__VCCellularAudioTap_removeAudioTapForStreamToken_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid stream token", v2, v3, v4, v5, v6);
}

- (void)makeAudioIOForAudioTapIO:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [a2 streamToken];
  int v6 = 136315906;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  OUTLINED_FUNCTION_3_0();
  int v9 = 640;
  __int16 v10 = 2048;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to fetch realtime context for streamToken=%ld", (uint8_t *)&v6, 0x26u);
}

- (void)makeAudioIOForAudioTapIO:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the audio IO for tapType=%d", v2, v3, v4, v5);
}

- (void)registerAudioTapForStreamToken:tapType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported tapType=%d", v2, v3, v4, v5);
}

- (void)registerAudioTapForStreamToken:tapType:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate power spectrum source for tapType=%d", v2, v3, v4, v5);
}

- (void)registerAudioTapForStreamToken:tapType:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the audio tap settings for tapType=%d", v2, v3, v4, v5);
}

@end