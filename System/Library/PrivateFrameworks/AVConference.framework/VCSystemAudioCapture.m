@interface VCSystemAudioCapture
+ (BOOL)isValidConfiguration:(id *)a3;
+ (id)newAudioTapWithCaptureContext:(__CFString *)a3 audioFormat:(id)a4;
+ (id)newAudioTapWithProcessID:(int)a3 audioFormat:(id)a4;
+ (id)newAudioTapWithSessionType:(unsigned int)a3 audioFormat:(id)a4;
+ (unsigned)audioTapSessionTypeForInternalSessionType:(unsigned int)a3;
- (BOOL)start;
- (BOOL)startAudioHALPlugInSource:(unsigned int)a3;
- (BOOL)startAudioQueue;
- (BOOL)stop;
- (BOOL)stopAudioHALPlugInSource:(unsigned int)a3;
- (BOOL)stopAudioQueue;
- (VCSystemAudioCapture)initWithConfiguration:(id *)a3;
- (id)newAudioTapWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3;
- (int)getQueueState;
- (void)dealloc;
- (void)setQueueState:(int)a3;
- (void)setupCannedAudioInjection;
- (void)start;
- (void)startAudioQueue;
- (void)stop;
- (void)stopAudioQueue;
@end

@implementation VCSystemAudioCapture

- (VCSystemAudioCapture)initWithConfiguration:(id *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (!+[VCSystemAudioCapture isValidConfiguration:](VCSystemAudioCapture, "isValidConfiguration:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCapture initWithConfiguration:].cold.9();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCapture initWithConfiguration:]0();
      }
    }
    goto LABEL_64;
  }
  v38.receiver = self;
  v38.super_class = (Class)VCSystemAudioCapture;
  self = [(VCObject *)&v38 init];
  if (!self)
  {
LABEL_64:

    return 0;
  }
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSystemAudioCapture initWithConfiguration:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 77;
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
      v5 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
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
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSystemAudioCapture initWithConfiguration:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 77;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v5;
        *(_WORD *)&buf[38] = 2048;
        v40 = self;
        v8 = " [%s] %s:%d %@(%p) ";
        v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_13;
      }
    }
  }
  pthread_mutex_init(&self->_stateLock, 0);
  v13 = ($E6593782B41B2E8D4452B38DD0207817 *)malloc_type_calloc(1uLL, 0x88uLL, 0x1020040BC270CF7uLL);
  self->_audioRecorderQueue = v13;
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCapture initWithConfiguration:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCapture initWithConfiguration:]();
      }
    }
    goto LABEL_64;
  }
  uint64_t v14 = *(void *)&a3->var3.source;
  *(_OWORD *)&self->_tapSettings.tapType = *(_OWORD *)&a3->var3.tapType;
  *(void *)&self->_tapSettings.source = v14;
  captureContext = self->_tapSettings.captureContext;
  if (captureContext) {
    CFRetain(captureContext);
  }
  uint64_t v16 = *(void *)&a3->var0.format.mBitsPerChannel;
  long long v17 = *(_OWORD *)&a3->var0.format.mBytesPerPacket;
  *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mSampleRate = *(_OWORD *)&a3->var0.format.mSampleRate;
  *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mBytesPerPacket = v17;
  *(void *)&self->_audioBasicDescriptionAudioQueue.mBitsPerChannel = v16;
  long long v18 = *(_OWORD *)&a3->var0.format.mSampleRate;
  long long v19 = *(_OWORD *)&a3->var0.format.mBytesPerPacket;
  *(void *)&self->_audioBasicDescriptionAudioCapture.mBitsPerChannel = *(void *)&a3->var0.format.mBitsPerChannel;
  *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mSampleRate = v18;
  *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mBytesPerPacket = v19;
  self->_unsigned int samplesPerFrame = a3->var0.samplesPerFrame;
  self->_sinkContext = a3->var1;
  self->_sinkProc = a3->var2;
  self->_firstAudioBufferReceived = 0;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v21 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSystemAudioCapture.systemAudioQueue", 0, CustomRootQueue);
  self->_callbackQueue = v21;
  if (!v21)
  {
    if ((VCSystemAudioCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCapture initWithConfiguration:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v34 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
      }
      else {
        v34 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v35 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = v35;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCSystemAudioCapture initWithConfiguration:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 90;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v34;
          *(_WORD *)&buf[38] = 2048;
          v40 = self;
          _os_log_error_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate system audio callback queue", buf, 0x30u);
        }
      }
    }
    goto LABEL_64;
  }
  if ((self->_audioBasicDescriptionAudioCapture.mFormatFlags & 0x20) != 0
    && self->_audioBasicDescriptionAudioCapture.mChannelsPerFrame == 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E4F47A50];
      v24 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = v22;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCSystemAudioCapture initWithConfiguration:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 93;
          _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d System Audio Capture Format is Non-Interleaved, updating AudioQueue Format", buf, 0x1Cu);
        }
      }
      else if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        -[VCSystemAudioCapture initWithConfiguration:].cold.8();
      }
    }
    self->_audioBasicDescriptionAudioQueue.mFormatFlags &= ~0x20u;
    UInt32 mChannelsPerFrame = self->_audioBasicDescriptionAudioCapture.mChannelsPerFrame;
    self->_audioBasicDescriptionAudioQueue.mBytesPerFrame = mChannelsPerFrame
                                                          * self->_audioBasicDescriptionAudioCapture.mBytesPerFrame;
    self->_audioBasicDescriptionAudioQueue.mBytesPerPacket = self->_audioBasicDescriptionAudioCapture.mBytesPerPacket
                                                           * mChannelsPerFrame;
  }
  int v26 = 2 * self->_samplesPerFrame;
  long long v27 = *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mSampleRate;
  long long v28 = *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mBytesPerPacket;
  *(void *)&buf[32] = *(void *)&self->_audioBasicDescriptionAudioQueue.mBitsPerChannel;
  *(_OWORD *)buf = v27;
  *(_OWORD *)&buf[16] = v28;
  if ((VCAudioBufferList_Allocate((long long *)buf, v26, &self->_audioBufferAppendList) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCapture initWithConfiguration:].cold.6();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCapture initWithConfiguration:].cold.7();
      }
    }
    goto LABEL_64;
  }
  unsigned int samplesPerFrame = self->_samplesPerFrame;
  long long v30 = *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mSampleRate;
  long long v31 = *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mBytesPerPacket;
  *(void *)&buf[32] = *(void *)&self->_audioBasicDescriptionAudioCapture.mBitsPerChannel;
  *(_OWORD *)buf = v30;
  *(_OWORD *)&buf[16] = v31;
  if ((VCAudioBufferList_Allocate((long long *)buf, samplesPerFrame, &self->_audioBufferOutputList) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCapture initWithConfiguration:].cold.4();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCapture initWithConfiguration:].cold.5();
      }
    }
    goto LABEL_64;
  }
  [(VCSystemAudioCapture *)self setupCannedAudioInjection];
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info((mach_timebase_info_t)buf);
  LODWORD(v33) = *(_DWORD *)&buf[4];
  LODWORD(v32) = *(_DWORD *)buf;
  self->_conversionRatio = (double)v32 * 0.000000001 / (double)v33;
  self->_timestamp = 0;
  self->_hostTime = 0.0;
  self->_startHostTime = 0.0;
  self->_remoteDeviceInfo = (VCAudioHALPluginRemoteDeviceInfo *)a3->var4;
  return self;
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
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
        long long v17 = "-[VCSystemAudioCapture dealloc]";
        __int16 v18 = 1024;
        int v19 = 125;
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
      v3 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
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
        long long v17 = "-[VCSystemAudioCapture dealloc]";
        __int16 v18 = 1024;
        int v19 = 125;
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
  pthread_mutex_destroy(&self->_stateLock);
  VCAudioBufferList_Destroy((uint64_t *)&self->_audioBufferAppendList);
  self->_audioBufferAppendList = 0;
  VCAudioBufferList_Destroy((uint64_t *)&self->_audioBufferOutputList);
  self->_audioBufferOutputList = 0;
  free(self->_audioRecorderQueue);
  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
  {
    dispatch_release(callbackQueue);
    self->_callbackQueue = 0;
  }
  self->_audioRecorderQueue = 0;

  captureContext = self->_tapSettings.captureContext;
  if (captureContext) {
    CFRelease(captureContext);
  }

  v13.receiver = self;
  v13.super_class = (Class)VCSystemAudioCapture;
  [(VCObject *)&v13 dealloc];
}

+ (BOOL)isValidConfiguration:(id *)a3
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
        +[VCSystemAudioCapture isValidConfiguration:]();
      }
      else
      {
        BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
        if (!v6) {
          return v6;
        }
        +[VCSystemAudioCapture isValidConfiguration:]();
      }
    }
    goto LABEL_40;
  }
  if (!a3->var2)
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
        +[VCSystemAudioCapture isValidConfiguration:]();
      }
      else
      {
        BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
        if (!v6) {
          return v6;
        }
        +[VCSystemAudioCapture isValidConfiguration:].cold.4();
      }
    }
    goto LABEL_40;
  }
  unsigned int tapType = a3->var3.tapType;
  if (tapType >= 3)
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
        +[VCSystemAudioCapture isValidConfiguration:].cold.5();
      }
      else
      {
        BOOL v6 = os_log_type_enabled(v8, OS_LOG_TYPE_FAULT);
        if (!v6) {
          return v6;
        }
        +[VCSystemAudioCapture isValidConfiguration:].cold.6();
      }
    }
    goto LABEL_40;
  }
  if (tapType == 2)
  {
    if (!a3->var3.captureContext)
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
          +[VCSystemAudioCapture isValidConfiguration:].cold.9();
        }
        else
        {
          BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT);
          if (!v6) {
            return v6;
          }
          +[VCSystemAudioCapture isValidConfiguration:]0();
        }
      }
      goto LABEL_40;
    }
LABEL_12:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (tapType != 1 || !a3->var3.var0.audioProcessIdToTap) {
    goto LABEL_12;
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
      +[VCSystemAudioCapture isValidConfiguration:].cold.7();
    }
    else
    {
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);
      if (!v6) {
        return v6;
      }
      +[VCSystemAudioCapture isValidConfiguration:].cold.8();
    }
  }
LABEL_40:
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)start
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v15 = 136315650;
        *(void *)&v15[4] = v4;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[VCSystemAudioCapture start]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 160;
        BOOL v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v15, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
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
        *(_DWORD *)uint64_t v15 = 136316162;
        *(void *)&v15[4] = v9;
        *(_WORD *)&v15[12] = 2080;
        *(void *)&v15[14] = "-[VCSystemAudioCapture start]";
        *(_WORD *)&v15[22] = 1024;
        LODWORD(v16) = 160;
        WORD2(v16) = 2112;
        *(void *)((char *)&v16 + 6) = v3;
        HIWORD(v16) = 2048;
        long long v17 = self;
        BOOL v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  if (self->_audioRecorderQueue->var4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture start]();
      }
    }
    goto LABEL_22;
  }
  [(VCSystemAudioCapture *)self setQueueState:1];
  unsigned int source = self->_tapSettings.source;
  if (source >= 2)
  {
    if (source - 2 <= 1 && -[VCSystemAudioCapture startAudioHALPlugInSource:](self, "startAudioHALPlugInSource:")) {
      goto LABEL_19;
    }
LABEL_21:
    -[VCSystemAudioCapture setQueueState:](self, "setQueueState:", 0, *(_OWORD *)v15, *(void *)&v15[16], v16, v17);
LABEL_22:
    BOOL v13 = 0;
    goto LABEL_23;
  }
  if (![(VCSystemAudioCapture *)self startAudioQueue]) {
    goto LABEL_21;
  }
LABEL_19:
  BOOL v13 = 1;
LABEL_23:
  pthread_mutex_unlock(p_stateLock);
  return v13;
}

- (BOOL)startAudioQueue
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v43 = v4;
        __int16 v44 = 2080;
        v45 = "-[VCSystemAudioCapture startAudioQueue]";
        __int16 v46 = 1024;
        int v47 = 191;
        BOOL v6 = " [%s] %s:%d ";
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
      v3 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
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
        uint64_t v43 = v9;
        __int16 v44 = 2080;
        v45 = "-[VCSystemAudioCapture startAudioQueue]";
        __int16 v46 = 1024;
        int v47 = 191;
        __int16 v48 = 2112;
        v49 = v3;
        __int16 v50 = 2048;
        v51 = self;
        BOOL v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  audioRecorderQueue = self->_audioRecorderQueue;
  uint64_t v12 = *(void *)&self->_audioBasicDescriptionAudioQueue.mBitsPerChannel;
  long long v13 = *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mBytesPerPacket;
  *(_OWORD *)&audioRecorderQueue->var1.mSampleRate = *(_OWORD *)&self->_audioBasicDescriptionAudioQueue.mSampleRate;
  *(_OWORD *)&audioRecorderQueue->var1.mBytesPerPacket = v13;
  *(void *)&audioRecorderQueue->var1.mBitsPerChannel = v12;
  VCAudioBufferList_Reset((uint64_t)self->_audioBufferAppendList);
  VCAudioBufferList_Reset((uint64_t)self->_audioBufferOutputList);
  id v14 = [(VCSystemAudioCapture *)self newAudioTapWithAudioStreamBasicDescription:&self->_audioBasicDescriptionAudioQueue];
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture startAudioQueue]();
      }
    }
    goto LABEL_51;
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F189F0]) initWithTapDescription:v14];
  if (!v15)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture startAudioQueue]();
      }
    }
LABEL_51:
    long long v16 = 0;
LABEL_29:
    _VCSystemAudioCapture_destroyAudioQueueBuffers(&self->_audioRecorderQueue->var0);
    AudioQueueDispose(self->_audioRecorderQueue->var0, 1u);
    BOOL v30 = 0;
    goto LABEL_35;
  }
  long long v16 = v15;
  [v15 setScreenSharingHost:(self->_tapSettings.var0.audioProcessIdToTap + 1) < 0xFFFFFFFE];
  long long v17 = self->_audioRecorderQueue;
  uint64_t v18 = (const AudioStreamBasicDescription *)objc_msgSend((id)objc_msgSend(v14, "format"), "streamDescription");
  callbackQueue = self->_callbackQueue;
  inCallbackBlock[0] = MEMORY[0x1E4F143A8];
  inCallbackBlock[1] = 3221225472;
  inCallbackBlock[2] = __39__VCSystemAudioCapture_startAudioQueue__block_invoke;
  inCallbackBlock[3] = &unk_1E6DB9380;
  inCallbackBlock[4] = self;
  if (AudioQueueNewInputWithDispatchQueue(&v17->var0, v18, 0x800u, callbackQueue, inCallbackBlock))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture startAudioQueue].cold.8();
      }
    }
    goto LABEL_29;
  }
  if (AudioQueueSetProperty(self->_audioRecorderQueue->var0, 0x71746F62u, v16, 8u))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture startAudioQueue].cold.7();
      }
    }
    goto LABEL_29;
  }
  UInt32 ioDataSize = 40;
  if (AudioQueueGetProperty(self->_audioRecorderQueue->var0, 0x61716674u, &self->_audioRecorderQueue->var1, &ioDataSize))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture startAudioQueue].cold.6();
      }
    }
    goto LABEL_29;
  }
  BOOL v20 = 0;
  v21 = self->_audioRecorderQueue;
  unsigned int samplesPerFrame = self->_samplesPerFrame;
  *(_OWORD *)&v21->var2[2] = 0u;
  *(_OWORD *)&v21->var2[4] = 0u;
  *(_OWORD *)&v21->var2[6] = 0u;
  *(_OWORD *)&v21->var2[8] = 0u;
  int v23 = v21->var1.mBytesPerFrame * samplesPerFrame;
  *(_OWORD *)v21->var2 = 0u;
  var2 = v21->var2;
  v21->var3 = v23;
  uint64_t v25 = -10;
  while (1)
  {
    OSStatus Buffer = AudioQueueAllocateBuffer(v21->var0, v21->var3, var2);
    if (Buffer)
    {
      OSStatus v34 = Buffer;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v35 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v43 = v35;
          __int16 v44 = 2080;
          v45 = "_VCSystemAudioCapture_allocateAudioQueueBuffers";
          __int16 v46 = 1024;
          int v47 = 564;
          __int16 v48 = 1024;
          LODWORD(v49) = v34;
          v37 = " [%s] %s:%d allocate error: %i";
          goto LABEL_62;
        }
      }
LABEL_41:
      if (v20) {
        goto LABEL_22;
      }
LABEL_42:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCapture startAudioQueue].cold.5();
        }
      }
      goto LABEL_29;
    }
    OSStatus v27 = AudioQueueEnqueueBuffer(v21->var0, *var2, 0, 0);
    if (v27) {
      break;
    }
    BOOL v20 = (unint64_t)(v25 + 10) > 8;
    ++var2;
    if (__CFADD__(v25++, 1)) {
      goto LABEL_22;
    }
  }
  OSStatus v38 = v27;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_41;
  }
  uint64_t v39 = VRTraceErrorLogLevelToCSTR();
  v36 = *MEMORY[0x1E4F47A50];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
    goto LABEL_41;
  }
  *(_DWORD *)buf = 136315906;
  uint64_t v43 = v39;
  __int16 v44 = 2080;
  v45 = "_VCSystemAudioCapture_allocateAudioQueueBuffers";
  __int16 v46 = 1024;
  int v47 = 566;
  __int16 v48 = 1024;
  LODWORD(v49) = v38;
  v37 = " [%s] %s:%d enqueue error: %i";
LABEL_62:
  _os_log_error_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0x22u);
  if (!v20) {
    goto LABEL_42;
  }
LABEL_22:
  OSStatus v29 = AudioQueueStart(self->_audioRecorderQueue->var0, 0);
  if (v29 == -66665)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture startAudioQueue].cold.4();
      }
    }
    goto LABEL_26;
  }
  if (v29)
  {
LABEL_26:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture startAudioQueue]();
      }
    }
    goto LABEL_29;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v31 = VRTraceErrorLogLevelToCSTR();
    unint64_t v32 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v43 = v31;
      __int16 v44 = 2080;
      v45 = "-[VCSystemAudioCapture startAudioQueue]";
      __int16 v46 = 1024;
      int v47 = 239;
      _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully started", buf, 0x1Cu);
    }
  }
  BOOL v30 = 1;
LABEL_35:

  return v30;
}

void __39__VCSystemAudioCapture_startAudioQueue__block_invoke(uint64_t a1, OpaqueAudioQueue *a2, AudioQueueBuffer *a3, uint64_t a4, unsigned int a5)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  mAudioData = a3->mAudioData;
  unint64_t v7 = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(v7) = a3->mAudioDataByteSize;
  _VCSystemAudioCapture_handleInputBuffer(v5, a2, a3, (uint64_t)&mAudioData, a4, a5);
}

- (BOOL)stop
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315650;
        uint64_t v17 = v4;
        __int16 v18 = 2080;
        int v19 = "-[VCSystemAudioCapture stop]";
        __int16 v20 = 1024;
        int v21 = 252;
        BOOL v6 = " [%s] %s:%d ";
        unint64_t v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v16, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
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
        int v16 = 136316162;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        int v19 = "-[VCSystemAudioCapture stop]";
        __int16 v20 = 1024;
        int v21 = 252;
        __int16 v22 = 2112;
        int v23 = v3;
        __int16 v24 = 2048;
        uint64_t v25 = self;
        BOOL v6 = " [%s] %s:%d %@(%p) ";
        unint64_t v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  if (self->_audioRecorderQueue->var4)
  {
    [(VCSystemAudioCapture *)self setQueueState:0];
    unsigned int source = self->_tapSettings.source;
    if (source - 2 < 2)
    {
      BOOL v13 = -[VCSystemAudioCapture stopAudioHALPlugInSource:](self, "stopAudioHALPlugInSource:");
      goto LABEL_21;
    }
    if (source <= 1)
    {
      BOOL v13 = [(VCSystemAudioCapture *)self stopAudioQueue];
LABEL_21:
      BOOL v14 = v13;
      goto LABEL_22;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSystemAudioCapture stop]();
    }
  }
  BOOL v14 = 0;
LABEL_22:
  pthread_mutex_unlock(p_stateLock);
  return v14;
}

- (BOOL)stopAudioQueue
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136315650;
        uint64_t v15 = v4;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCSystemAudioCapture stopAudioQueue]";
        __int16 v18 = 1024;
        int v19 = 278;
        BOOL v6 = " [%s] %s:%d ";
        unint64_t v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
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
        int v14 = 136316162;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCSystemAudioCapture stopAudioQueue]";
        __int16 v18 = 1024;
        int v19 = 278;
        __int16 v20 = 2112;
        int v21 = v3;
        __int16 v22 = 2048;
        int v23 = self;
        BOOL v6 = " [%s] %s:%d %@(%p) ";
        unint64_t v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  if (AudioQueueStop(self->_audioRecorderQueue->var0, 1u))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture stopAudioQueue]();
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCSystemAudioCapture stopAudioQueue]";
      __int16 v18 = 1024;
      int v19 = 284;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio queue stopped", (uint8_t *)&v14, 0x1Cu);
    }
  }
  _VCSystemAudioCapture_destroyAudioQueueBuffers(&self->_audioRecorderQueue->var0);
  if (AudioQueueDispose(self->_audioRecorderQueue->var0, 1u))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture stopAudioQueue]();
      }
    }
  }
  self->_firstAudioBufferReceived = 0;
  return 1;
}

- (void)setQueueState:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__VCSystemAudioCapture_setQueueState___block_invoke;
  block[3] = &unk_1E6DB3F08;
  block[4] = self;
  int v5 = a3;
  dispatch_sync(callbackQueue, block);
}

uint64_t __38__VCSystemAudioCapture_setQueueState___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 232) + 132) = *(_DWORD *)(result + 40);
  return result;
}

- (int)getQueueState
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VCSystemAudioCapture_getQueueState__block_invoke;
  block[3] = &unk_1E6DB4540;
  block[4] = self;
  void block[5] = &v6;
  dispatch_sync(callbackQueue, block);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__VCSystemAudioCapture_getQueueState__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(*(void *)(result + 32)
                                                                                          + 232)
                                                                              + 132);
  return result;
}

+ (id)newAudioTapWithProcessID:(int)a3 audioFormat:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3 == -1)
  {
    if (VCFeatureFlagManager_UseAvconferenced())
    {
      v9[0] = [NSNumber numberWithInt:getpid()];
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F189F8]) initSystemTapWithFormat:a4 excludePIDs:v6];
    }
    else
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F189F8]) initSystemTapWithFormat:a4];
    }
  }
  else
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F189F8]) initProcessTapWithFormat:a4 PID:*(void *)&a3];
  }
  unint64_t v7 = (void *)v5;
  if (!v5 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCSystemAudioCapture newAudioTapWithProcessID:audioFormat:]();
    }
  }
  return v7;
}

+ (unsigned)audioTapSessionTypeForInternalSessionType:(unsigned int)a3
{
  return a3 == 0;
}

+ (id)newAudioTapWithSessionType:(unsigned int)a3 audioFormat:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      unint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315906;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "+[VCSystemAudioCapture newAudioTapWithSessionType:audioFormat:]";
        __int16 v12 = 1024;
        int v13 = 352;
        __int16 v14 = 1024;
        unsigned int v15 = a3;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid sessionType=%d", (uint8_t *)&v8, 0x22u);
      }
    }
    return 0;
  }
  id result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F189F8]), "initPreSpatialSessionTypeTapWithFormat:sessionType:", a4, +[VCSystemAudioCapture audioTapSessionTypeForInternalSessionType:](VCSystemAudioCapture, "audioTapSessionTypeForInternalSessionType:", 0));
  if (!result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCSystemAudioCapture newAudioTapWithSessionType:audioFormat:]();
      }
    }
    return 0;
  }
  return result;
}

+ (id)newAudioTapWithCaptureContext:(__CFString *)a3 audioFormat:(id)a4
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F189F8]) initPreSpatialSceneIdentifierTapWithFormat:a4 sceneIdentifier:a3];
  if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCSystemAudioCapture newAudioTapWithCaptureContext:audioFormat:]();
    }
  }
  return v4;
}

- (id)newAudioTapWithAudioStreamBasicDescription:(AudioStreamBasicDescription *)a3
{
  p_tapSettings = &self->_tapSettings;
  if (self->_tapSettings.tapType >= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture newAudioTapWithAudioStreamBasicDescription:]();
      }
    }
    goto LABEL_21;
  }
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F153A0]) initWithStreamDescription:a3];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCapture newAudioTapWithAudioStreamBasicDescription:]();
      }
    }
LABEL_21:
    int v8 = 0;
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = (void *)v4;
  unsigned int tapType = p_tapSettings->tapType;
  if (p_tapSettings->tapType == 2)
  {
    id v7 = +[VCSystemAudioCapture newAudioTapWithCaptureContext:p_tapSettings->captureContext audioFormat:v4];
    goto LABEL_9;
  }
  if (tapType == 1)
  {
    id v7 = +[VCSystemAudioCapture newAudioTapWithSessionType:p_tapSettings->var0.sessionTypeToTap audioFormat:v4];
LABEL_9:
    int v8 = v7;
    if (v7) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (!tapType)
  {
    id v7 = +[VCSystemAudioCapture newAudioTapWithProcessID:p_tapSettings->var0.sessionTypeToTap audioFormat:v4];
    goto LABEL_9;
  }
LABEL_10:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSystemAudioCapture newAudioTapWithAudioStreamBasicDescription:]();
    }
  }
  int v8 = 0;
LABEL_14:

  return v8;
}

- (void)setupCannedAudioInjection
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate the canned audio injector", v2, v3, v4, v5, v6);
}

- (BOOL)startAudioHALPlugInSource:(unsigned int)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      id v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSystemAudioCapture startAudioHALPlugInSource:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 701;
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
      uint64_t v5 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      __int16 v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCSystemAudioCapture startAudioHALPlugInSource:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 701;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v5;
        *(_WORD *)&buf[38] = 2048;
        unint64_t v36 = (unint64_t)self;
        int v8 = " [%s] %s:%d %@(%p) ";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_11;
      }
    }
  }
  objc_msgSend(+[VCAudioHALPluginDevice sharedAudioHALPluginNullDevice](VCAudioHALPluginDevice, "sharedAudioHALPluginNullDevice"), "stop");
  unsigned int samplesPerFrame = self->_samplesPerFrame;
  long long v14 = *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&self->_audioBasicDescriptionAudioCapture.mSampleRate;
  *(_OWORD *)&buf[16] = v14;
  *(void *)&buf[32] = *(void *)&self->_audioBasicDescriptionAudioCapture.mBitsPerChannel;
  unint64_t v36 = samplesPerFrame | 0xAAAAAAAA00000000;
  remoteDeviceInfo = self->_remoteDeviceInfo;
  v37 = self;
  OSStatus v38 = _VCSystemAudioCapture_handleInputBufferFromAudioHALPlugin;
  uint64_t v39 = remoteDeviceInfo;
  uint64_t v16 = off_1E6DB2FB8;
  if (a3 == 2) {
    uint64_t v16 = off_1E6DB2FC0;
  }
  uint64_t v17 = (VCAudioHALPluginCaptureSource *)[objc_alloc(*v16) initWithConfig:buf];
  self->_audioHALPlugin = v17;
  if (!v17)
  {
    if ((VCSystemAudioCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCapture startAudioHALPlugInSource:]();
        }
      }
      goto LABEL_37;
    }
    if (objc_opt_respondsToSelector()) {
      int v19 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
    }
    else {
      int v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_37;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    __int16 v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_37;
    }
    int v25 = 136316162;
    uint64_t v26 = v21;
    __int16 v27 = 2080;
    long long v28 = "-[VCSystemAudioCapture startAudioHALPlugInSource:]";
    __int16 v29 = 1024;
    int v30 = 722;
    __int16 v31 = 2112;
    unint64_t v32 = v19;
    __int16 v33 = 2048;
    OSStatus v34 = self;
    int v23 = " [%s] %s:%d %@(%p) can not create plug in device for audio server driver plug in";
    goto LABEL_39;
  }
  if (([(VCAudioHALPluginCaptureSource *)v17 start] & 1) == 0)
  {
    if ((VCSystemAudioCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCapture startAudioHALPlugInSource:]();
        }
      }
      goto LABEL_37;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v20 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v24 = VRTraceErrorLogLevelToCSTR(),
          __int16 v22 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_37:

      BOOL result = 0;
      self->_audioHALPlugin = 0;
      return result;
    }
    int v25 = 136316162;
    uint64_t v26 = v24;
    __int16 v27 = 2080;
    long long v28 = "-[VCSystemAudioCapture startAudioHALPlugInSource:]";
    __int16 v29 = 1024;
    int v30 = 724;
    __int16 v31 = 2112;
    unint64_t v32 = v20;
    __int16 v33 = 2048;
    OSStatus v34 = self;
    int v23 = " [%s] %s:%d %@(%p) can not start plug in device for audio server driver plug in";
LABEL_39:
    _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v25, 0x30u);
    goto LABEL_37;
  }
  return 1;
}

- (BOOL)stopAudioHALPlugInSource:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((VCSystemAudioCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v14 = 136315650;
        *(void *)&v14[4] = v5;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCSystemAudioCapture stopAudioHALPlugInSource:]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 735;
        id v7 = " [%s] %s:%d ";
        int v8 = v6;
        uint32_t v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, v7, v14, v9);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(VCSystemAudioCapture *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v14 = 136316162;
        *(void *)&v14[4] = v10;
        *(_WORD *)&v14[12] = 2080;
        *(void *)&v14[14] = "-[VCSystemAudioCapture stopAudioHALPlugInSource:]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 735;
        WORD2(v15) = 2112;
        *(void *)((char *)&v15 + 6) = v4;
        HIWORD(v15) = 2048;
        uint64_t v16 = self;
        id v7 = " [%s] %s:%d %@(%p) ";
        int v8 = v11;
        uint32_t v9 = 48;
        goto LABEL_11;
      }
    }
  }
  char v12 = [(VCAudioHALPluginCaptureSource *)self->_audioHALPlugin stop];
  [(VCAudioHALPluginCaptureSource *)self->_audioHALPlugin invalidate];

  self->_audioHALPlugin = 0;
  return v12;
}

- (void)initWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate audio queue recorder", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_16_4();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate audio queue recorder", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate system audio callback queue", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate audio buffer list", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate audio buffer list", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate audio buffer list", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not allocate audio buffer list", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.8()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 93;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d System Audio Capture Format is Non-Interleaved, updating AudioQueue Format", v1, 0x1Cu);
}

- (void)initWithConfiguration:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid config", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_12_9();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid config", v2, v3, v4, v5, v6);
}

+ (void)isValidConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
}

+ (void)isValidConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
}

+ (void)isValidConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d null sinkProc", v2, v3, v4, v5, v6);
}

+ (void)isValidConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d null sinkProc", v2, v3, v4, v5, v6);
}

+ (void)isValidConfiguration:.cold.5()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "+[VCSystemAudioCapture isValidConfiguration:]";
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid tapType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCapture isValidConfiguration:]" >> 16, v4);
}

+ (void)isValidConfiguration:.cold.6()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "+[VCSystemAudioCapture isValidConfiguration:]";
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid tapType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCapture isValidConfiguration:]" >> 16, v4);
}

+ (void)isValidConfiguration:.cold.7()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "+[VCSystemAudioCapture isValidConfiguration:]";
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid sessionType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCapture isValidConfiguration:]" >> 16, v4);
}

+ (void)isValidConfiguration:.cold.8()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  *(void *)&v3[6] = "+[VCSystemAudioCapture isValidConfiguration:]";
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_5(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid sessionType=%d", v2, *(const char **)v3, (unint64_t)"+[VCSystemAudioCapture isValidConfiguration:]" >> 16, v4);
}

+ (void)isValidConfiguration:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NULL captureContext", v2, v3, v4, v5, v6);
}

+ (void)isValidConfiguration:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NULL captureContext", v2, v3, v4, v5, v6);
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d start called but already started", v2, v3, v4, v5, v6);
}

- (void)startAudioQueue
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCSystemAudioCapture startAudioQueue]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d start error: %i", v2, *(const char **)v3, (unint64_t)"-[VCSystemAudioCapture startAudioQueue]" >> 16, v4);
}

- (void)stop
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stop called but not never start", v2, v3, v4, v5, v6);
}

- (void)stopAudioQueue
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCSystemAudioCapture stopAudioQueue]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d stop error: %i", v2, *(const char **)v3, (unint64_t)"-[VCSystemAudioCapture stopAudioQueue]" >> 16, v4);
}

+ (void)newAudioTapWithProcessID:audioFormat:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio tap", v2, v3, v4, v5, v6);
}

+ (void)newAudioTapWithSessionType:audioFormat:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "+[VCSystemAudioCapture newAudioTapWithSessionType:audioFormat:]";
  OUTLINED_FUNCTION_3();
  int v4 = 359;
  __int16 v5 = v0;
  int v6 = 0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create audio tap for sessionType=%d", v2, 0x22u);
}

+ (void)newAudioTapWithCaptureContext:audioFormat:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "+[VCSystemAudioCapture newAudioTapWithCaptureContext:audioFormat:]";
  OUTLINED_FUNCTION_3();
  int v4 = 371;
  __int16 v5 = 2112;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create audio tap for captureContext=%@", v2, 0x26u);
}

- (void)newAudioTapWithAudioStreamBasicDescription:.cold.1()
{
  OUTLINED_FUNCTION_7_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unsupported tapType=%d", v2, v3, v4, v5);
}

- (void)newAudioTapWithAudioStreamBasicDescription:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d allocate audioFormat error", v2, v3, v4, v5, v6);
}

- (void)newAudioTapWithAudioStreamBasicDescription:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create audio tap", v2, v3, v4, v5, v6);
}

- (void)startAudioHALPlugInSource:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d can not create plug in device for audio server driver plug in", v2, v3, v4, v5, v6);
}

- (void)startAudioHALPlugInSource:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d can not start plug in device for audio server driver plug in", v2, v3, v4, v5, v6);
}

@end