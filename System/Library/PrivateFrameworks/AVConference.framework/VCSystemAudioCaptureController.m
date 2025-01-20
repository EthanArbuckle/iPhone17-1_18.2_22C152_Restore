@interface VCSystemAudioCaptureController
+ (BOOL)isValidConfiguration:(const tagVCSystemAudioCaptureControllerConfig *)a3;
+ (id)captureServerConfigForAudioConfig:(tagVCSystemAudioCaptureControllerConfig *)a3 forClient:(id)a4;
+ (int)captureSourceForSystemAudioCaptureControllerConfig:(tagVCSystemAudioCaptureControllerConfig *)a3;
+ (int)captureSourceForTypePreSpatialSessionType:(unsigned int)a3;
+ (int)captureSourceForTypeProcessID:(int)a3;
- (BOOL)supportsVoiceActivityDetection;
- (VCSystemAudioCaptureController)init;
- (VCSystemAudioCaptureController)initWithConfig:(const tagVCSystemAudioCaptureControllerConfig *)a3;
- (id)dispatchQueueNameWithConfig:(const tagVCSystemAudioCaptureControllerConfig *)a3;
- (void)dealloc;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)handleAudioSessionMediaServicesWereResetNotification:(id)a3;
- (void)setupLogPrefixWithConfig:(const tagVCSystemAudioCaptureControllerConfig *)a3;
- (void)startClient:(id)a3;
- (void)stopClient:(id)a3;
- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4;
@end

@implementation VCSystemAudioCaptureController

- (VCSystemAudioCaptureController)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  memset(v3, 0, sizeof(v3));
  DWORD1(v3[0]) = -1;
  return [(VCSystemAudioCaptureController *)self initWithConfig:v3];
}

- (VCSystemAudioCaptureController)initWithConfig:(const tagVCSystemAudioCaptureControllerConfig *)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)VCSystemAudioCaptureController;
  uint64_t v4 = [(VCObject *)&v33 init];
  if (!v4) {
    return (VCSystemAudioCaptureController *)v4;
  }
  if (!+[VCSystemAudioCaptureController isValidConfiguration:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCaptureController initWithConfig:]();
      }
    }
    goto LABEL_45;
  }
  [v4 setupLogPrefixWithConfig:a3];
  if ((char *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v35 = v6;
        __int16 v36 = 2080;
        v37 = "-[VCSystemAudioCaptureController initWithConfig:]";
        __int16 v38 = 1024;
        int v39 = 53;
        v8 = " [%s] %s:%d ";
        v9 = v7;
        uint32_t v10 = 28;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[v4 performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v35 = v11;
        __int16 v36 = 2080;
        v37 = "-[VCSystemAudioCaptureController initWithConfig:]";
        __int16 v38 = 1024;
        int v39 = 53;
        __int16 v40 = 2112;
        v41 = v5;
        __int16 v42 = 2048;
        v43 = v4;
        v8 = " [%s] %s:%d %@(%p) ";
        v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_13;
      }
    }
  }
  v13 = (void *)[v4 dispatchQueueNameWithConfig:a3];
  if (!v13)
  {
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCaptureController initWithConfig:]();
        }
      }
      goto LABEL_45;
    }
    if (objc_opt_respondsToSelector()) {
      v22 = (__CFString *)[v4 performSelector:sel_logPrefix];
    }
    else {
      v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_45;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v35 = v26;
    __int16 v36 = 2080;
    v37 = "-[VCSystemAudioCaptureController initWithConfig:]";
    __int16 v38 = 1024;
    int v39 = 55;
    __int16 v40 = 2112;
    v41 = v22;
    __int16 v42 = 2048;
    v43 = v4;
    v28 = " [%s] %s:%d %@(%p) Failed to generate dispatch queue name";
    v29 = v27;
    uint32_t v30 = 48;
    goto LABEL_47;
  }
  v14 = v13;
  v15 = (const char *)[v13 UTF8String];
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  dispatch_queue_t v17 = dispatch_queue_create_with_target_V2(v15, 0, CustomRootQueue);
  *((void *)v4 + 21) = v17;
  if (!v17)
  {
    if ((char *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCaptureController initWithConfig:]();
        }
      }
      goto LABEL_45;
    }
    if (objc_opt_respondsToSelector()) {
      v23 = (__CFString *)[v4 performSelector:sel_logPrefix];
    }
    else {
      v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v31 = VRTraceErrorLogLevelToCSTR(),
          v32 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_45:

      return 0;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v35 = v31;
    __int16 v36 = 2080;
    v37 = "-[VCSystemAudioCaptureController initWithConfig:]";
    __int16 v38 = 1024;
    int v39 = 57;
    __int16 v40 = 2112;
    v41 = v23;
    __int16 v42 = 2048;
    v43 = v4;
    __int16 v44 = 2112;
    v45 = v14;
    v28 = " [%s] %s:%d %@(%p) Failed to generate dispatch queue. queueName=%@";
    v29 = v32;
    uint32_t v30 = 58;
LABEL_47:
    _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    goto LABEL_45;
  }
  captureContext = a3->tapSettings.captureContext;
  if (captureContext) {
    CFRetain(captureContext);
  }
  long long v19 = *(_OWORD *)&a3->tapSettings.source;
  *(_OWORD *)(v4 + 200) = *(_OWORD *)&a3->tapSettings.tapType;
  *(_OWORD *)(v4 + 216) = v19;
  uint64_t v20 = [objc_alloc(MEMORY[0x1E4F153E0]) initAuxiliarySession];
  *((void *)v4 + 24) = v20;
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v35 = v24;
        __int16 v36 = 2080;
        v37 = "-[VCSystemAudioCaptureController initWithConfig:]";
        __int16 v38 = 1024;
        int v39 = 62;
        _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d initAuxiliarySession failed", buf, 0x1Cu);
      }
    }
    goto LABEL_45;
  }
  return (VCSystemAudioCaptureController *)v4;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v15 = v4;
        __int16 v16 = 2080;
        dispatch_queue_t v17 = "-[VCSystemAudioCaptureController dealloc]";
        __int16 v18 = 1024;
        int v19 = 80;
        uint64_t v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCSystemAudioCaptureController *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint32_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        dispatch_queue_t v17 = "-[VCSystemAudioCaptureController dealloc]";
        __int16 v18 = 1024;
        int v19 = 80;
        __int16 v20 = 2112;
        v21 = v3;
        __int16 v22 = 2048;
        v23 = self;
        uint64_t v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }
  captureContext = self->_configuration.tapSettings.captureContext;
  if (captureContext) {
    CFRelease(captureContext);
  }
  v13.receiver = self;
  v13.super_class = (Class)VCSystemAudioCaptureController;
  [(VCObject *)&v13 dealloc];
}

+ (BOOL)isValidConfiguration:(const tagVCSystemAudioCaptureControllerConfig *)a3
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        +[VCSystemAudioCaptureController isValidConfiguration:]();
      }
      else
      {
        BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
        if (!v6) {
          return v6;
        }
        +[VCSystemAudioCaptureController isValidConfiguration:]();
      }
    }
    goto LABEL_33;
  }
  unsigned int tapType = a3->tapSettings.tapType;
  if (a3->tapSettings.tapType >= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      char IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      uint32_t v8 = *MEMORY[0x1E4F47A50];
      if (IsOSFaultDisabled)
      {
        BOOL v6 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        +[VCSystemAudioCaptureController isValidConfiguration:]();
      }
      else
      {
        BOOL v6 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);
        if (!v6) {
          return v6;
        }
        +[VCSystemAudioCaptureController isValidConfiguration:].cold.4();
      }
    }
    goto LABEL_33;
  }
  if (tapType == 2)
  {
    if (a3->tapSettings.captureContext)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (!v6) {
            return v6;
          }
          +[VCSystemAudioCaptureController isValidConfiguration:].cold.7();
        }
        else
        {
          BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
          if (!v6) {
            return v6;
          }
          +[VCSystemAudioCaptureController isValidConfiguration:].cold.8();
        }
      }
      goto LABEL_33;
    }
LABEL_11:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (tapType != 1 || !a3->tapSettings.var0.audioProcessIdToTap) {
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    char v4 = VRTraceIsOSFaultDisabled();
    v5 = *MEMORY[0x1E4F47A50];
    if (v4)
    {
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      +[VCSystemAudioCaptureController isValidConfiguration:].cold.5();
    }
    else
    {
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);
      if (!v6) {
        return v6;
      }
      +[VCSystemAudioCaptureController isValidConfiguration:].cold.6();
    }
  }
LABEL_33:
  LOBYTE(v6) = 0;
  return v6;
}

- (void)setupLogPrefixWithConfig:(const tagVCSystemAudioCaptureControllerConfig *)a3
{
  unsigned int tapType = a3->tapSettings.tapType;
  if (a3->tapSettings.tapType == 2)
  {
    uint64_t v5 = [NSString stringWithFormat:@"CaptureContext=%@ ", a3->tapSettings.captureContext];
  }
  else if (tapType == 1)
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"SessionType(pre-spatial)=%d ", a3->tapSettings.var0.sessionTypeToTap);
  }
  else
  {
    if (tapType) {
      return;
    }
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"PID=%d ", a3->tapSettings.var0.sessionTypeToTap);
  }

  [(VCObject *)self setLogPrefix:v5];
}

- (id)dispatchQueueNameWithConfig:(const tagVCSystemAudioCaptureControllerConfig *)a3
{
  char v4 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"com.apple.AVConference.systemAudioCaptureController"];
  uint64_t v5 = v4;
  unsigned int tapType = a3->tapSettings.tapType;
  if (a3->tapSettings.tapType == 2)
  {
    [v4 appendFormat:@".scene_id%@", a3->tapSettings.captureContext];
  }
  else if (tapType == 1)
  {
    objc_msgSend(v4, "appendFormat:", @".session_type_%d", 1);
  }
  else if (!tapType)
  {
    objc_msgSend(v4, "appendFormat:", @".pid_%d", a3->tapSettings.var0.sessionTypeToTap);
  }
  return v5;
}

+ (id)captureServerConfigForAudioConfig:(tagVCSystemAudioCaptureControllerConfig *)a3 forClient:(id)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  long long v17 = *(_OWORD *)&a3->tapSettings.tapType;
  uint64_t v18 = *(void *)&a3->tapSettings.source;
  uint64_t v19 = 0;
  BOOL v6 = (void *)[a4 clientFormat];
  uint64_t v15 = objc_msgSend(a4, "sinkIO", *v6, v6[1], v6[2], v6[3], v6[4], v6[5]);
  __int16 v16 = VCSystemAudioCaptureController_PushAudioSamples;
  uint64_t v7 = [MEMORY[0x1E4F29238] valueWithBytes:&v14 objCType:"{?={tagVCAudioFrameFormat={AudioStreamBasicDescription=dIIIIIIII}I}^v^?{tagVCSystemAudioCaptureTapSettings=I(?=iI)^{__CFString}I}@}"];
  remoteDeviceInfo = a3->remoteDeviceInfo;
  if (remoteDeviceInfo)
  {
    v22[0] = @"SystemAudioCaptureConfig";
    v22[1] = @"SystemAudioCaptureClient";
    v23[0] = v7;
    v23[1] = a4;
    v22[2] = @"SystemAudioRemoteDeviceInfo";
    v23[2] = remoteDeviceInfo;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    uint32_t v10 = v23;
    uint64_t v11 = v22;
    uint64_t v12 = 3;
  }
  else
  {
    v20[0] = @"SystemAudioCaptureConfig";
    v20[1] = @"SystemAudioCaptureClient";
    v21[0] = v7;
    v21[1] = a4;
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    uint32_t v10 = v21;
    uint64_t v11 = v20;
    uint64_t v12 = 2;
  }
  return (id)[v9 dictionaryWithObjects:v10 forKeys:v11 count:v12];
}

+ (int)captureSourceForTypePreSpatialSessionType:(unsigned int)a3
{
  if (a3) {
    return 0;
  }
  else {
    return 7;
  }
}

+ (int)captureSourceForTypeProcessID:(int)a3
{
  if (a3 < 0xFFFFFFFD) {
    return 0;
  }
  else {
    return dword_1E259ECC8[a3 + 3];
  }
}

+ (int)captureSourceForSystemAudioCaptureControllerConfig:(tagVCSystemAudioCaptureControllerConfig *)a3
{
  if (a3->tapSettings.tapType == 1) {
    return +[VCSystemAudioCaptureController captureSourceForTypePreSpatialSessionType:a3->tapSettings.var0.sessionTypeToTap];
  }
  if (a3->tapSettings.tapType) {
    return 0;
  }
  return +[VCSystemAudioCaptureController captureSourceForTypeProcessID:a3->tapSettings.var0.sessionTypeToTap];
}

- (void)handleAudioSessionMediaServicesWereResetNotification:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        client = self->_client;
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = v6;
        __int16 v19 = 2080;
        __int16 v20 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]";
        __int16 v21 = 1024;
        int v22 = 200;
        __int16 v23 = 2112;
        id v24 = a3;
        __int16 v25 = 2112;
        uint64_t v26 = (VCSystemAudioCaptureController *)client;
        uint64_t v9 = " [%s] %s:%d notification=%@, _client=%@";
        uint32_t v10 = v7;
        uint32_t v11 = 48;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSystemAudioCaptureController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      objc_super v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        long long v14 = self->_client;
        *(_DWORD *)buf = 136316674;
        uint64_t v18 = v12;
        __int16 v19 = 2080;
        __int16 v20 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]";
        __int16 v21 = 1024;
        int v22 = 200;
        __int16 v23 = 2112;
        id v24 = v5;
        __int16 v25 = 2048;
        uint64_t v26 = self;
        __int16 v27 = 2112;
        id v28 = a3;
        __int16 v29 = 2112;
        uint32_t v30 = v14;
        uint64_t v9 = " [%s] %s:%d %@(%p) notification=%@, _client=%@";
        uint32_t v10 = v13;
        uint32_t v11 = 68;
        goto LABEL_11;
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__VCSystemAudioCaptureController_handleAudioSessionMediaServicesWereResetNotification___block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __87__VCSystemAudioCaptureController_handleAudioSessionMediaServicesWereResetNotification___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 184) || !*(unsigned char *)(v2 + 176)) {
    goto LABEL_16;
  }
  id v3 = +[VCSystemAudioCaptureController captureServerConfigForAudioConfig:forClient:](VCSystemAudioCaptureController, "captureServerConfigForAudioConfig:forClient:", v2 + 200);
  uint64_t v4 = +[VCSystemAudioCaptureController captureSourceForSystemAudioCaptureControllerConfig:*(void *)(a1 + 32) + 200];
  if (objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterCaptureConfig:forSource:", v3, v4))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 176) = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerCaptureConfig:forSource:", v3, v4);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 176)) {
      goto LABEL_5;
    }
    if (objc_opt_class() != *(void *)(a1 + 32))
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v18 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        id v28 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v32 = *(void *)(a1 + 32);
          uint64_t v33 = *(void *)(v32 + 184);
          int v34 = 136316418;
          uint64_t v35 = v31;
          __int16 v36 = 2080;
          v37 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
          __int16 v38 = 1024;
          int v39 = 210;
          __int16 v40 = 2112;
          v41 = v18;
          __int16 v42 = 2048;
          uint64_t v43 = v32;
          __int16 v44 = 1024;
          int v45 = v33;
          int v22 = " [%s] %s:%d %@(%p) Failed to restart _client=%d";
          goto LABEL_40;
        }
      }
      goto LABEL_5;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_5;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    uint64_t v24 = *(void *)(*(void *)(a1 + 32) + 184);
    int v34 = 136315906;
    uint64_t v35 = v23;
    __int16 v36 = 2080;
    v37 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
    __int16 v38 = 1024;
    int v39 = 210;
    __int16 v40 = 1024;
    LODWORD(v41) = v24;
    int v22 = " [%s] %s:%d Failed to restart _client=%d";
LABEL_31:
    __int16 v25 = v20;
    uint32_t v26 = 34;
LABEL_41:
    _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v34, v26);
    goto LABEL_5;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_5;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    __int16 v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 184);
    int v34 = 136315906;
    uint64_t v35 = v19;
    __int16 v36 = 2080;
    v37 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
    __int16 v38 = 1024;
    int v39 = 208;
    __int16 v40 = 1024;
    LODWORD(v41) = v21;
    int v22 = " [%s] %s:%d Failed to stop _client=%d";
    goto LABEL_31;
  }
  if (objc_opt_respondsToSelector()) {
    long long v17 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    long long v17 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    id v28 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)(a1 + 32);
      uint64_t v30 = *(void *)(v29 + 184);
      int v34 = 136316418;
      uint64_t v35 = v27;
      __int16 v36 = 2080;
      v37 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
      __int16 v38 = 1024;
      int v39 = 208;
      __int16 v40 = 2112;
      v41 = v17;
      __int16 v42 = 2048;
      uint64_t v43 = v29;
      __int16 v44 = 1024;
      int v45 = v30;
      int v22 = " [%s] %s:%d %@(%p) Failed to stop _client=%d";
LABEL_40:
      __int16 v25 = v28;
      uint32_t v26 = 54;
      goto LABEL_41;
    }
  }
LABEL_5:
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_16;
    }
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 176);
    int v34 = 136315906;
    uint64_t v35 = v6;
    __int16 v36 = 2080;
    v37 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
    __int16 v38 = 1024;
    int v39 = 212;
    __int16 v40 = 1024;
    LODWORD(v41) = v8;
    uint64_t v9 = " [%s] %s:%d _running=%d";
    uint32_t v10 = v7;
    uint32_t v11 = 34;
    goto LABEL_15;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
  }
  else {
    uint64_t v5 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    objc_super v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = *(unsigned __int8 *)(v14 + 176);
      int v34 = 136316418;
      uint64_t v35 = v12;
      __int16 v36 = 2080;
      v37 = "-[VCSystemAudioCaptureController handleAudioSessionMediaServicesWereResetNotification:]_block_invoke";
      __int16 v38 = 1024;
      int v39 = 212;
      __int16 v40 = 2112;
      v41 = v5;
      __int16 v42 = 2048;
      uint64_t v43 = v14;
      __int16 v44 = 1024;
      int v45 = v15;
      uint64_t v9 = " [%s] %s:%d %@(%p) _running=%d";
      uint32_t v10 = v13;
      uint32_t v11 = 54;
LABEL_15:
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v34, v11);
    }
  }
LABEL_16:
  uint64_t result = VCDefaults_GetBoolValueForKey(@"notifyClientOnMediaServerDisconnection", 0);
  if (result) {
    return objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "delegate"), "serverDidDie");
  }
  return result;
}

- (void)startClient:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = v6;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCSystemAudioCaptureController startClient:]";
        __int16 v22 = 1024;
        int v23 = 225;
        int v8 = " [%s] %s:%d ";
        uint64_t v9 = v7;
        uint32_t v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSystemAudioCaptureController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v11;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCSystemAudioCaptureController startClient:]";
        __int16 v22 = 1024;
        int v23 = 225;
        __int16 v24 = 2112;
        __int16 v25 = v5;
        __int16 v26 = 2048;
        uint64_t v27 = self;
        int v8 = " [%s] %s:%d %@(%p) ";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_11;
      }
    }
  }
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__VCSystemAudioCaptureController_startClient___block_invoke;
    v17[3] = &unk_1E6DB3E40;
    v17[4] = self;
    v17[5] = a3;
    dispatch_async(dispatchQueue, v17);
  }
  else if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCaptureController startClient:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCSystemAudioCaptureController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v15;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCSystemAudioCaptureController startClient:]";
        __int16 v22 = 1024;
        int v23 = 228;
        __int16 v24 = 2112;
        __int16 v25 = v14;
        __int16 v26 = 2048;
        uint64_t v27 = self;
        _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) nil client", buf, 0x30u);
      }
    }
  }
}

uint64_t __46__VCSystemAudioCaptureController_startClient___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[VCSystemAudioCaptureController captureSourceForSystemAudioCaptureControllerConfig:*(void *)(a1 + 32) + 200];
  uint64_t v3 = v2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 232)) {
    BOOL v4 = v2 == 5;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    long long v20 = xmmword_1E259ECA0;
    long long v21 = unk_1E259ECB0;
    *(void *)&long long v22 = 32;
    DWORD2(v22) = 960;
    uint64_t v5 = &v20;
  }
  else
  {
    uint64_t v5 = (long long *)[*(id *)(a1 + 40) clientFormat];
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "controllerFormatChanged:", v5);
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 176))
  {
    uint64_t v12 = @"Client (%p) can not start system audio capture when already running";
    uint64_t v13 = 32025;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 176) = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerCaptureConfig:forSource:", +[VCSystemAudioCaptureController captureServerConfigForAudioConfig:forClient:](VCSystemAudioCaptureController, "captureServerConfigForAudioConfig:forClient:", v6 + 200, *(void *)(a1 + 40)), v3);
    uint64_t v7 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v7 + 176))
    {
      *(void *)(v7 + 184) = *(void *)(a1 + 40);
      int v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:*(void *)(a1 + 32) selector:sel_handleAudioSessionMediaServicesWereResetNotification_ name:*MEMORY[0x1E4F15048] object:*(void *)(*(void *)(a1 + 32) + 192)];
      uint64_t v9 = 0;
      uint64_t v10 = 1;
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStart:error:", v10, v9);
    }
    uint64_t v12 = @"Client (%p) failed to start system audio capture";
    uint64_t v13 = 32005;
  }
  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v12, *(void *)(a1 + 40));
  if (v10)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __46__VCSystemAudioCaptureController_startClient___block_invoke_cold_1(v15, (void *)v10);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        long long v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = *(void *)(a1 + 32);
          uint64_t v19 = [(id)v10 UTF8String];
          *(_DWORD *)buf = 136316418;
          uint64_t v24 = v16;
          __int16 v25 = 2080;
          __int16 v26 = "-[VCSystemAudioCaptureController startClient:]_block_invoke";
          __int16 v27 = 1024;
          int v28 = 266;
          __int16 v29 = 2112;
          uint64_t v30 = v14;
          __int16 v31 = 2048;
          uint64_t v32 = v18;
          __int16 v33 = 2080;
          uint64_t v34 = v19;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) %s", buf, 0x3Au);
        }
      }
    }
    uint64_t v9 = [MEMORY[0x1E4F28C58] AVConferenceServiceError:v13 detailCode:0 description:v10];
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v9 = 0;
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStart:error:", v10, v9);
}

- (void)stopClient:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = v6;
        __int16 v20 = 2080;
        long long v21 = "-[VCSystemAudioCaptureController stopClient:]";
        __int16 v22 = 1024;
        int v23 = 274;
        int v8 = " [%s] %s:%d ";
        uint64_t v9 = v7;
        uint32_t v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCSystemAudioCaptureController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v11;
        __int16 v20 = 2080;
        long long v21 = "-[VCSystemAudioCaptureController stopClient:]";
        __int16 v22 = 1024;
        int v23 = 274;
        __int16 v24 = 2112;
        __int16 v25 = v5;
        __int16 v26 = 2048;
        __int16 v27 = self;
        int v8 = " [%s] %s:%d %@(%p) ";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_11;
      }
    }
  }
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__VCSystemAudioCaptureController_stopClient___block_invoke;
    v17[3] = &unk_1E6DB3E40;
    v17[4] = self;
    v17[5] = a3;
    dispatch_async(dispatchQueue, v17);
  }
  else if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCaptureController stopClient:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCSystemAudioCaptureController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v15;
        __int16 v20 = 2080;
        long long v21 = "-[VCSystemAudioCaptureController stopClient:]";
        __int16 v22 = 1024;
        int v23 = 277;
        __int16 v24 = 2112;
        __int16 v25 = v14;
        __int16 v26 = 2048;
        __int16 v27 = self;
        _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) nil client", buf, 0x30u);
      }
    }
  }
}

uint64_t __45__VCSystemAudioCaptureController_stopClient___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 176))
  {
    uint64_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x1E4F15048] object:*(void *)(*(void *)(a1 + 32) + 192)];
    *(void *)(*(void *)(a1 + 32) + 184) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 176) = 0;
    if (objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterCaptureConfig:forSource:", +[VCSystemAudioCaptureController captureServerConfigForAudioConfig:forClient:](VCSystemAudioCaptureController, "captureServerConfigForAudioConfig:forClient:", *(void *)(a1 + 32) + 200, *(void *)(a1 + 40)), +[VCSystemAudioCaptureController captureSourceForSystemAudioCaptureControllerConfig:](VCSystemAudioCaptureController, "captureSourceForSystemAudioCaptureControllerConfig:", *(void *)(a1 + 32) + 200)))
    {
      uint64_t v3 = 0;
      uint64_t v4 = 1;
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", v4, v3);
    }
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Client (%p) error stopping system audio capture", *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Client (%p) can not stop system audio capture when not running", *(void *)(a1 + 40));
  }
  uint64_t v3 = (void *)v5;
  if (v5)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __45__VCSystemAudioCaptureController_stopClient___block_invoke_cold_1(v7, v3);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136316418;
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          uint64_t v15 = "-[VCSystemAudioCaptureController stopClient:]_block_invoke";
          __int16 v16 = 1024;
          int v17 = 302;
          __int16 v18 = 2112;
          uint64_t v19 = v6;
          __int16 v20 = 2048;
          uint64_t v21 = v11;
          __int16 v22 = 2080;
          uint64_t v23 = [v3 UTF8String];
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) %s", buf, 0x3Au);
        }
      }
    }
    uint64_t v3 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:32005 detailCode:0 description:v3];
  }
  uint64_t v4 = 0;
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", v4, v3);
}

- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v15 = 136315650;
        *(void *)&v15[4] = v8;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[VCSystemAudioCaptureController updateClient:settings:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 310;
        uint32_t v10 = " [%s] %s:%d not handled";
        uint64_t v11 = v9;
        uint32_t v12 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, v15, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v7 = (__CFString *)[(VCSystemAudioCaptureController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v15 = 136316162;
        *(void *)&v15[4] = v13;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[VCSystemAudioCaptureController updateClient:settings:]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 310;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v7;
        HIWORD(v16) = 2048;
        int v17 = self;
        uint32_t v10 = " [%s] %s:%d %@(%p) not handled";
        uint64_t v11 = v14;
        uint32_t v12 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(a3, "setDirection:", a4->var0, *(_OWORD *)v15, *(void *)&v15[16], v16, v17);
  [a3 setSpatialAudioDisabled:a4->var1];
  [a3 setIsVoiceActivityEnabled:a4->var2];
  [a3 setIsMediaPriorityEnabled:a4->var3];
}

- (BOOL)supportsVoiceActivityDetection
{
  return 0;
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCaptureController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315650;
        uint64_t v13 = v5;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCSystemAudioCaptureController didUpdateBasebandCodec:]";
        __int16 v16 = 1024;
        int v17 = 324;
        uint64_t v7 = " [%s] %s:%d not handled";
        uint64_t v8 = v6;
        uint32_t v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(VCSystemAudioCaptureController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136316162;
        uint64_t v13 = v10;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCSystemAudioCaptureController didUpdateBasebandCodec:]";
        __int16 v16 = 1024;
        int v17 = 324;
        __int16 v18 = 2112;
        uint64_t v19 = v4;
        __int16 v20 = 2048;
        uint64_t v21 = self;
        uint64_t v7 = " [%s] %s:%d %@(%p) not handled";
        uint64_t v8 = v11;
        uint32_t v9 = 48;
        goto LABEL_11;
      }
    }
  }
}

- (void)initWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to generate dispatch queue name", v2, v3, v4, v5, v6);
}

- (void)initWithConfig:.cold.2()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCSystemAudioCaptureController initWithConfig:]";
  __int16 v6 = 1024;
  int v7 = 57;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to generate dispatch queue. queueName=%@", v3, 0x26u);
}

- (void)initWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid configuration", v2, v3, v4, v5, v6);
}

+ (void)isValidConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
}

+ (void)isValidConfiguration:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_9();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d null configuration", v1, 0x1Cu);
}

+ (void)isValidConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "+[VCSystemAudioCaptureController isValidConfiguration:]";
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid tapType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCaptureController isValidConfiguration:]" >> 16, v4);
}

+ (void)isValidConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "+[VCSystemAudioCaptureController isValidConfiguration:]";
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid tapType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCaptureController isValidConfiguration:]" >> 16, v4);
}

+ (void)isValidConfiguration:.cold.5()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "+[VCSystemAudioCaptureController isValidConfiguration:]";
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid sessionType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCaptureController isValidConfiguration:]" >> 16, v4);
}

+ (void)isValidConfiguration:.cold.6()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "+[VCSystemAudioCaptureController isValidConfiguration:]";
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid sessionType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCaptureController isValidConfiguration:]" >> 16, v4);
}

+ (void)isValidConfiguration:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_9();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d capture context is NULL", v2, v3, v4, v5, v6);
}

+ (void)isValidConfiguration:.cold.8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_9();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d capture context is NULL", v1, 0x1Cu);
}

- (void)startClient:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nil client", v2, v3, v4, v5, v6);
}

void __46__VCSystemAudioCaptureController_startClient___block_invoke_cold_1(uint64_t a1, void *a2)
{
  [a2 UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d %s", v4, v5, v6, v7, v8);
}

- (void)stopClient:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d nil client", v2, v3, v4, v5, v6);
}

void __45__VCSystemAudioCaptureController_stopClient___block_invoke_cold_1(uint64_t a1, void *a2)
{
  [a2 UTF8String];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d %s", v4, v5, v6, v7, v8);
}

@end