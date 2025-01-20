@interface VCStreamIOAudioController
- (BOOL)_packetThreadStartWithClientFormat:(const tagVCAudioFrameFormat *)a3;
- (BOOL)canSetDirection:(unsigned __int8)a3;
- (BOOL)dispatchedStartClient:(id)a3 error:(id *)a4;
- (BOOL)setupAndStartOutputClientThread;
- (BOOL)startInputForClient:(id)a3 error:(id *)a4;
- (BOOL)startOutputForClient:(id)a3 error:(id *)a4;
- (BOOL)supportsVoiceActivityDetection;
- (NSDictionary)reportingStats;
- (VCAudioIOControllerClient)runningClient;
- (VCStreamIOAudioController)initWithStreamInputID:(int64_t)a3 streamToken:(int64_t)a4 networkClockID:(unint64_t)a5;
- (VCStreamOutput)streamOutput;
- (uint64_t)setupAndStartOutputClientThread;
- (void)_packetThreadStop;
- (void)cleanupOutputThread;
- (void)cleanupStreamOutput;
- (void)dealloc;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)dispatchedStopClient;
- (void)dispatchedUpdateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4;
- (void)invalidate;
- (void)setRunningClient:(id)a3;
- (void)setStreamOutput:(id)a3;
- (void)setupAndStartOutputClientThread;
- (void)startClient:(id)a3;
- (void)stopClient:(id)a3;
- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4;
@end

@implementation VCStreamIOAudioController

- (VCStreamIOAudioController)initWithStreamInputID:(int64_t)a3 streamToken:(int64_t)a4 networkClockID:(unint64_t)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)VCStreamIOAudioController;
  v8 = [(VCObject *)&v34 init];
  if (v8)
  {
    -[VCObject setLogPrefix:](v8, "setLogPrefix:", objc_msgSend(NSString, "stringWithFormat:", @"streamInputID=%ld", a3));
    if ((VCStreamIOAudioController *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v36 = v10;
          __int16 v37 = 2080;
          v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
          __int16 v39 = 1024;
          int v40 = 82;
          v12 = "VCStreamIOAudioController [%s] %s:%d ";
          v13 = v11;
          uint32_t v14 = 28;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v9 = (__CFString *)[(VCStreamIOAudioController *)v8 performSelector:sel_logPrefix];
      }
      else {
        v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v36 = v15;
          __int16 v37 = 2080;
          v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
          __int16 v39 = 1024;
          int v40 = 82;
          __int16 v41 = 2112;
          v42 = v9;
          __int16 v43 = 2048;
          v44 = v8;
          v12 = "VCStreamIOAudioController [%s] %s:%d %@(%p) ";
          v13 = v16;
          uint32_t v14 = 48;
          goto LABEL_12;
        }
      }
    }
    if (a4)
    {
      v17 = (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.AVConference.streamIOAudioController_%ld", a3), "UTF8String");
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
      dispatch_queue_t v19 = dispatch_queue_create_with_target_V2(v17, 0, CustomRootQueue);
      v8->_stateQueue = (OS_dispatch_queue *)v19;
      if (v19)
      {
        if (a3
          && ((id v20 = [+[VCStreamInputManager sharedInstance] streamInputWithID:a3], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)? (streamInput = v8->_streamInput): (streamInput = (VCStreamInputAudio *)v20, v8->_streamInput = streamInput), !streamInput))
        {
          if ((VCStreamIOAudioController *)objc_opt_class() == v8)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:].cold.4();
              }
            }
            goto LABEL_64;
          }
          if (objc_opt_respondsToSelector()) {
            v27 = (__CFString *)[(VCStreamIOAudioController *)v8 performSelector:sel_logPrefix];
          }
          else {
            v27 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v33 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v36 = v33;
              __int16 v37 = 2080;
              v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
              __int16 v39 = 1024;
              int v40 = 93;
              __int16 v41 = 2112;
              v42 = v27;
              __int16 v43 = 2048;
              v44 = v8;
              v30 = "VCStreamIOAudioController [%s] %s:%d %@(%p) StreamInputID not found in VCStreamInputManager";
              goto LABEL_63;
            }
          }
        }
        else
        {
          v8->_streamToken = a4;
          CFAllocatorRef SampleBufferAllocator = VCAudioBufferList_CreateSampleBufferAllocator();
          v8->_audioCFAllocatorRef SampleBufferAllocator = SampleBufferAllocator;
          if (SampleBufferAllocator)
          {
            [+[VCStreamOutputManager sharedInstance] registerStreamOutputSource:v8 forStreamToken:a4];
            v8->_networkClockID = a5;
            return v8;
          }
          if ((VCStreamIOAudioController *)objc_opt_class() == v8)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]();
              }
            }
            goto LABEL_64;
          }
          if (objc_opt_respondsToSelector()) {
            v26 = (__CFString *)[(VCStreamIOAudioController *)v8 performSelector:sel_logPrefix];
          }
          else {
            v26 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v32 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v36 = v32;
              __int16 v37 = 2080;
              v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
              __int16 v39 = 1024;
              int v40 = 97;
              __int16 v41 = 2112;
              v42 = v26;
              __int16 v43 = 2048;
              v44 = v8;
              v30 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to create the sample buffer allocator";
              goto LABEL_63;
            }
          }
        }
LABEL_64:

        return 0;
      }
      if ((VCStreamIOAudioController *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]();
          }
        }
        goto LABEL_64;
      }
      if (objc_opt_respondsToSelector()) {
        v25 = (__CFString *)[(VCStreamIOAudioController *)v8 performSelector:sel_logPrefix];
      }
      else {
        v25 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_64;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v36 = v31;
      __int16 v37 = 2080;
      v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
      __int16 v39 = 1024;
      int v40 = 86;
      __int16 v41 = 2112;
      v42 = v25;
      __int16 v43 = 2048;
      v44 = v8;
      v30 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to allocate the dipatch queue";
    }
    else
    {
      if ((VCStreamIOAudioController *)objc_opt_class() == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]();
          }
        }
        goto LABEL_64;
      }
      if (objc_opt_respondsToSelector()) {
        v24 = (__CFString *)[(VCStreamIOAudioController *)v8 performSelector:sel_logPrefix];
      }
      else {
        v24 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_64;
      }
      uint64_t v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v36 = v28;
      __int16 v37 = 2080;
      v38 = "-[VCStreamIOAudioController initWithStreamInputID:streamToken:networkClockID:]";
      __int16 v39 = 1024;
      int v40 = 83;
      __int16 v41 = 2112;
      v42 = v24;
      __int16 v43 = 2048;
      v44 = v8;
      v30 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Invalid streamToken";
    }
LABEL_63:
    _os_log_error_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_ERROR, v30, buf, 0x30u);
    goto LABEL_64;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v16 = v4;
        __int16 v17 = 2080;
        v18 = "-[VCStreamIOAudioController dealloc]";
        __int16 v19 = 1024;
        int v20 = 113;
        v6 = "VCStreamIOAudioController [%s] %s:%d ";
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
      v3 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v16 = v9;
        __int16 v17 = 2080;
        v18 = "-[VCStreamIOAudioController dealloc]";
        __int16 v19 = 1024;
        int v20 = 113;
        __int16 v21 = 2112;
        v22 = v3;
        __int16 v23 = 2048;
        v24 = self;
        v6 = "VCStreamIOAudioController [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  if (self->_isRunning) {
    [(VCStreamIOAudioController *)self dispatchedStopClient];
  }
  stateQueue = self->_stateQueue;
  if (stateQueue) {
    dispatch_release(stateQueue);
  }
  [(VCStreamIOAudioController *)self cleanupStreamOutput];

  self->_streamInput = 0;
  audioCFAllocatorRef SampleBufferAllocator = self->_audioSampleBufferAllocator;
  if (audioSampleBufferAllocator) {
    CFRelease(audioSampleBufferAllocator);
  }
  backingBufferAllocator = self->_backingBufferAllocator;
  if (backingBufferAllocator) {
    CFRelease(backingBufferAllocator);
  }

  self->_runningClient = 0;
  v14.receiver = self;
  v14.super_class = (Class)VCStreamIOAudioController;
  [(VCObject *)&v14 dealloc];
}

- (BOOL)_packetThreadStartWithClientFormat:(const tagVCAudioFrameFormat *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_packetThread)
  {
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v11) {
          return v11;
        }
        -[VCStreamIOAudioController _packetThreadStartWithClientFormat:]();
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v13 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
      }
      else {
        v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v11) {
          return v11;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v17;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCStreamIOAudioController _packetThreadStartWithClientFormat:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 135;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v13;
        *(_WORD *)&buf[38] = 2048;
        v24 = self;
        _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) Packet thread is already running", buf, 0x30u);
      }
    }
    goto LABEL_40;
  }
  unsigned int samplesPerFrame = a3->samplesPerFrame;
  p_inputSamples = (unsigned int **)&self->_inputSamples;
  long long v6 = *(_OWORD *)&a3->format.mBytesPerPacket;
  *(_OWORD *)buf = *(_OWORD *)&a3->format.mSampleRate;
  *(_OWORD *)&buf[16] = v6;
  *(void *)&buf[32] = *(void *)&a3->format.mBitsPerChannel;
  int v7 = VCAudioBufferList_Allocate((long long *)buf, samplesPerFrame, &self->_inputSamples);
  if (v7 && *p_inputSamples)
  {
    int SerializedSize = VCAudioBufferList_GetSerializedSize(*p_inputSamples);
    uint64_t v9 = objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"com.apple.AVConference.streamIOAudioController_%ld", -[NSNumber longValue](-[VCStreamInput streamInputID](self->_streamInput, "streamInputID"), "longValue")), "UTF8String");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __64__VCStreamIOAudioController__packetThreadStartWithClientFormat___block_invoke;
    v22[3] = &unk_1E6DB5998;
    v22[4] = self;
    uint64_t v10 = (PacketThread_s *)PacketThread_Create(SerializedSize, 0, 0x10u, 19, v9, v22);
    self->_packetThread = v10;
    if (v10)
    {
      LOBYTE(v11) = 1;
      return v11;
    }
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamIOAudioController _packetThreadStartWithClientFormat:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v14 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        int v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v19;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCStreamIOAudioController _packetThreadStartWithClientFormat:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 148;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v14;
          *(_WORD *)&buf[38] = 2048;
          v24 = self;
          _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to create the packet thread", buf, 0x30u);
        }
      }
    }
  }
  else
  {
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamIOAudioController _packetThreadStartWithClientFormat:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v12 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
      }
      else {
        v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCStreamIOAudioController _packetThreadStartWithClientFormat:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 138;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v12;
          *(_WORD *)&buf[38] = 2048;
          v24 = self;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) Error allocating buffer list for stream IO", buf, 0x30u);
        }
      }
    }
    if (!v7) {
      goto LABEL_40;
    }
  }
  VCAudioBufferList_Destroy((uint64_t *)p_inputSamples);
LABEL_40:
  LOBYTE(v11) = 0;
  return v11;
}

double *__64__VCStreamIOAudioController__packetThreadStartWithClientFormat___block_invoke(uint64_t a1, uint64_t a2)
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 232) sinkIO];
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  result = (double *)VCAudioBufferList_GetSampleFormat(a2);
  if (result)
  {
    LODWORD(v5[0]) = *result;
    v5[1] = VCAudioBufferList_GetTimestamp(a2);
    return (double *)(*(uint64_t (**)(void, void *, uint64_t))(v3 + 8))(*(void *)v3, v5, a2);
  }
  return result;
}

- (void)_packetThreadStop
{
  packetThread = (int *)self->_packetThread;
  if (packetThread)
  {
    PacketThread_Destroy(packetThread);
    self->_packetThread = 0;
    VCAudioBufferList_Destroy((uint64_t *)&self->_inputSamples);
  }
}

- (void)startClient:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = v6;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCStreamIOAudioController startClient:]";
        __int16 v22 = 1024;
        int v23 = 170;
        uint32_t v8 = "VCStreamIOAudioController [%s] %s:%d ";
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
      v5 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
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
        uint64_t v19 = v11;
        __int16 v20 = 2080;
        __int16 v21 = "-[VCStreamIOAudioController startClient:]";
        __int16 v22 = 1024;
        int v23 = 170;
        __int16 v24 = 2112;
        uint64_t v25 = v5;
        __int16 v26 = 2048;
        v27 = self;
        uint32_t v8 = "VCStreamIOAudioController [%s] %s:%d %@(%p) ";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_11;
      }
    }
  }
  if (a3)
  {
    stateQueue = self->_stateQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__VCStreamIOAudioController_startClient___block_invoke;
    v17[3] = &unk_1E6DB3E40;
    v17[4] = self;
    v17[5] = a3;
    dispatch_async(stateQueue, v17);
  }
  else if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamIOAudioController startClient:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      objc_super v14 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
    }
    else {
      objc_super v14 = &stru_1F3D3E450;
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
        __int16 v21 = "-[VCStreamIOAudioController startClient:]";
        __int16 v22 = 1024;
        int v23 = 173;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        __int16 v26 = 2048;
        v27 = self;
        _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) nil client", buf, 0x30u);
      }
    }
  }
}

uint64_t __41__VCStreamIOAudioController_startClient___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  uint64_t v2 = [*(id *)(a1 + 32) dispatchedStartClient:*(void *)(a1 + 40) error:v5];
  uint64_t v3 = (void *)[*(id *)(a1 + 40) delegate];
  return [v3 didStart:v2 error:v5[0]];
}

- (BOOL)startInputForClient:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v40 = v7;
  long long v41 = v7;
  *(_OWORD *)__str = v7;
  long long v39 = v7;
  long long v36 = v7;
  long long v37 = v7;
  *(_OWORD *)objc_super v34 = v7;
  long long v35 = v7;
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription([(VCStreamInput *)self->_streamInput streamFormat]);
  if (!StreamBasicDescription || ![a3 clientFormat])
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"AudioStreamBasicDescription is nil for client or stream. Client asbd=%s Stream asbd=%p for client (%p)", FormatToCStr(objc_msgSend(a3, "clientFormat"), __str, 0x40uLL), StreamBasicDescription, a3);
    uint64_t v12 = 32000;
    goto LABEL_14;
  }
  if (memcmp(StreamBasicDescription, (const void *)[a3 clientFormat], 0x28uLL))
  {
    v13 = NSString;
    objc_super v14 = FormatToCStr([a3 clientFormat], __str, 0x40uLL);
    uint64_t v15 = objc_msgSend(v13, "stringWithFormat:", @"Client (%p) format=%s does not match stream input format=%s for StreamInputID=%ld", a3, v14, FormatToCStr((uint64_t)StreamBasicDescription, v34, 0x40uLL), -[NSNumber longValue](-[VCStreamInput streamInputID](self->_streamInput, "streamInputID"), "longValue"));
LABEL_12:
    uint64_t v10 = v15;
    uint64_t v12 = 32016;
    goto LABEL_14;
  }
  if (!*(void *)([a3 sinkIO] + 8))
  {
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Client (%p) sinkIO is nil for StreamInputID=%ld", a3, -[NSNumber longValue](-[VCStreamInput streamInputID](self->_streamInput, "streamInputID"), "longValue"), v20, v21);
    goto LABEL_12;
  }
  uint64_t v9 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)&self->_lastHostTime.value = *MEMORY[0x1E4F1FA48];
  self->_lastHostTime.epoch = *(void *)(v9 + 16);
  self->_lastSampleCount = 0;
  self->_nextExpectedSampleTime = 0;
  self->_timestampInitialized = 0;
  if (!-[VCStreamIOAudioController _packetThreadStartWithClientFormat:](self, "_packetThreadStartWithClientFormat:", [a3 clientFormat]))
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to start the packet thread for Client=%p for StreamInputID=%ld", a3, -[NSNumber longValue](-[VCStreamInput streamInputID](self->_streamInput, "streamInputID"), "longValue"));
    uint64_t v12 = 32015;
LABEL_14:
    if (!v10) {
      goto LABEL_7;
    }
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          -[VCStreamIOAudioController startInputForClient:error:]();
          if (a4)
          {
LABEL_26:
            uint64_t v19 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:v12 detailCode:0 description:v10];
            LOBYTE(v10) = 0;
            *a4 = v19;
            return v10;
          }
LABEL_28:
          LOBYTE(v10) = 0;
          return v10;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v16 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v23 = v17;
          __int16 v24 = 2080;
          uint64_t v25 = "-[VCStreamIOAudioController startInputForClient:error:]";
          __int16 v26 = 1024;
          int v27 = 214;
          __int16 v28 = 2112;
          v29 = v16;
          __int16 v30 = 2048;
          uint64_t v31 = self;
          __int16 v32 = 2112;
          uint64_t v33 = v10;
          _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) error=%@", buf, 0x3Au);
          if (a4) {
            goto LABEL_26;
          }
          goto LABEL_28;
        }
      }
    }
    if (a4) {
      goto LABEL_26;
    }
    goto LABEL_28;
  }
  PacketThread_ReceiverIsReady((uint64_t)self->_packetThread);
  [(VCStreamInputAudio *)self->_streamInput registerSampleBufferCallback:_VCStreamIOAudioController_SampleBufferCallback context:self];
  LOBYTE(v10) = 1;
LABEL_7:
  [(VCStreamInput *)self->_streamInput didStartStreamInputCaptureSource];
  return v10;
}

- (BOOL)startOutputForClient:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (*(void *)([a3 sourceIO] + 8))
  {
    self->_sourceIO = (_VCAudioIOControllerClientIO *)[a3 sourceIO];
    if ([(VCStreamIOAudioController *)self setupAndStartOutputClientThread]) {
      return 1;
    }
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Client (%p) Failed to create the outputClientThread", a3);
    uint64_t v9 = 32025;
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Client (%p) sourceIO is nil for StreamToken=%ld", a3, self->_streamToken);
    uint64_t v9 = 32016;
  }
  self->_sourceIO = 0;
  if (!v8) {
    return 0;
  }
  if ((VCStreamIOAudioController *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCStreamIOAudioController startOutputForClient:error:]";
        __int16 v18 = 1024;
        int v19 = 240;
        __int16 v20 = 2112;
        uint64_t v21 = v10;
        __int16 v22 = 2048;
        uint64_t v23 = self;
        __int16 v24 = 2112;
        uint64_t v25 = v8;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) error=%@", buf, 0x3Au);
        if (a4) {
          goto LABEL_18;
        }
        return 0;
      }
    }
    goto LABEL_17;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3
    || (VRTraceErrorLogLevelToCSTR(), !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
  {
LABEL_17:
    if (a4) {
      goto LABEL_18;
    }
    return 0;
  }
  -[VCStreamIOAudioController startOutputForClient:error:]();
  if (a4)
  {
LABEL_18:
    v13 = (void *)[MEMORY[0x1E4F28C58] AVConferenceServiceError:v9 detailCode:0 description:v8];
    BOOL result = 0;
    *a4 = v13;
    return result;
  }
  return 0;
}

- (BOOL)setupAndStartOutputClientThread
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  uint64_t v3 = objc_alloc_init(VCAudioRelay);
  self->_outputThread = v3;
  if (v3)
  {
    unint64_t networkClockID = self->_networkClockID;
    uint64_t v5 = *MEMORY[0x1E4FAF2F0];
    if (networkClockID == *MEMORY[0x1E4FAF2F0]
      || [(VCAudioRelay *)v3 setNetworkClockID:self->_networkClockID withError:&v26])
    {
      uint64_t v6 = objc_alloc_init(VCAudioRelayIO);
      self->_outputThreadClient = v6;
      if (!v6)
      {
        if ((VCStreamIOAudioController *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v13 = VRTraceErrorLogLevelToCSTR();
            uint64_t v14 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              if (([(VCStreamIOAudioController *)v13 setupAndStartOutputClientThread] & 1) == 0) {
                return 1;
              }
              goto LABEL_64;
            }
          }
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v9 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
          }
          else {
            uint64_t v9 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v18 = VRTraceErrorLogLevelToCSTR();
            int v19 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v28 = v18;
              __int16 v29 = 2080;
              __int16 v30 = "-[VCStreamIOAudioController setupAndStartOutputClientThread]";
              __int16 v31 = 1024;
              int v32 = 262;
              __int16 v33 = 2112;
              objc_super v34 = v9;
              __int16 v35 = 2048;
              long long v36 = self;
              _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to allocate output thread client", buf, 0x30u);
            }
          }
        }
        if (networkClockID != v5) {
          return 1;
        }
        goto LABEL_64;
      }
      [(VCAudioRelayIO *)v6 setSpeakerCallback:_VCStreamIOAudioController_PullAudioSamples];
      [(VCAudioRelayIO *)self->_outputThreadClient setSpeakerCallbackContext:self];
      [(VCAudioRelayIO *)self->_outputThreadClient setClientFormat:[(VCAudioIOControllerClient *)self->_runningClient clientFormat]];
      if ([(VCAudioRelay *)self->_outputThread setClientIO:self->_outputThreadClient withError:&v26])
      {
        if ([(VCAudioRelay *)self->_outputThread startClientIO]) {
          return 1;
        }
        if ((VCStreamIOAudioController *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCStreamIOAudioController setupAndStartOutputClientThread]();
            }
          }
          goto LABEL_64;
        }
        if (objc_opt_respondsToSelector()) {
          uint64_t v11 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v11 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          __int16 v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v28 = v22;
            __int16 v29 = 2080;
            __int16 v30 = "-[VCStreamIOAudioController setupAndStartOutputClientThread]";
            __int16 v31 = 1024;
            int v32 = 272;
            __int16 v33 = 2112;
            objc_super v34 = v11;
            __int16 v35 = 2048;
            long long v36 = self;
            uint64_t v17 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to start streamOutput thread";
            goto LABEL_54;
          }
        }
        goto LABEL_64;
      }
      if ((VCStreamIOAudioController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCStreamIOAudioController setupAndStartOutputClientThread].cold.4();
          }
        }
        goto LABEL_64;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v10 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_64;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v28 = v20;
      __int16 v29 = 2080;
      __int16 v30 = "-[VCStreamIOAudioController setupAndStartOutputClientThread]";
      __int16 v31 = 1024;
      int v32 = 269;
      __int16 v33 = 2112;
      objc_super v34 = v10;
      __int16 v35 = 2048;
      long long v36 = self;
      __int16 v37 = 2112;
      uint64_t v38 = v26;
      uint64_t v17 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to set client error=%@";
    }
    else
    {
      if ((VCStreamIOAudioController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCStreamIOAudioController setupAndStartOutputClientThread].cold.5();
          }
        }
        goto LABEL_64;
      }
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_64;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v28 = v25;
      __int16 v29 = 2080;
      __int16 v30 = "-[VCStreamIOAudioController setupAndStartOutputClientThread]";
      __int16 v31 = 1024;
      int v32 = 257;
      __int16 v33 = 2112;
      objc_super v34 = v12;
      __int16 v35 = 2048;
      long long v36 = self;
      __int16 v37 = 2112;
      uint64_t v38 = v26;
      uint64_t v17 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to create network clock for output thread with error=%@";
    }
    uint64_t v23 = v21;
    uint32_t v24 = 58;
    goto LABEL_63;
  }
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamIOAudioController setupAndStartOutputClientThread]();
      }
    }
    goto LABEL_64;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v8 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v8 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    __int16 v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v28 = v15;
      __int16 v29 = 2080;
      __int16 v30 = "-[VCStreamIOAudioController setupAndStartOutputClientThread]";
      __int16 v31 = 1024;
      int v32 = 252;
      __int16 v33 = 2112;
      objc_super v34 = v8;
      __int16 v35 = 2048;
      long long v36 = self;
      uint64_t v17 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Failed to allocate output thread";
LABEL_54:
      uint64_t v23 = v16;
      uint32_t v24 = 48;
LABEL_63:
      _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v17, buf, v24);
    }
  }
LABEL_64:
  [(VCStreamIOAudioController *)self cleanupOutputThread];
  return 0;
}

- (void)cleanupOutputThread
{
  self->_outputThreadClient = 0;
  self->_outputThread = 0;
}

- (void)cleanupStreamOutput
{
  streamOutput = self->_streamOutput;
  if (streamOutput)
  {

    self->_streamOutput = 0;
  }
}

- (void)stopClient:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      long long v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = v6;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCStreamIOAudioController stopClient:]";
        __int16 v22 = 1024;
        int v23 = 296;
        uint64_t v8 = "VCStreamIOAudioController [%s] %s:%d ";
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
      uint64_t v5 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
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
        uint64_t v21 = "-[VCStreamIOAudioController stopClient:]";
        __int16 v22 = 1024;
        int v23 = 296;
        __int16 v24 = 2112;
        uint64_t v25 = v5;
        __int16 v26 = 2048;
        int v27 = self;
        uint64_t v8 = "VCStreamIOAudioController [%s] %s:%d %@(%p) ";
        uint64_t v9 = v12;
        uint32_t v10 = 48;
        goto LABEL_11;
      }
    }
  }
  if (a3)
  {
    stateQueue = self->_stateQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40__VCStreamIOAudioController_stopClient___block_invoke;
    v17[3] = &unk_1E6DB3E40;
    v17[4] = self;
    v17[5] = a3;
    dispatch_async(stateQueue, v17);
  }
  else if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamIOAudioController stopClient:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
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
        uint64_t v21 = "-[VCStreamIOAudioController stopClient:]";
        __int16 v22 = 1024;
        int v23 = 299;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        __int16 v26 = 2048;
        int v27 = self;
        _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) nil client", buf, 0x30u);
      }
    }
  }
}

uint64_t __40__VCStreamIOAudioController_stopClient___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 176))
  {
    uint64_t v3 = *(void *)(v2 + 232);
    if (*(void *)(a1 + 40) == v3)
    {
      [(id)v2 dispatchedStopClient];
      uint64_t v4 = 0;
      uint64_t v5 = 1;
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", v5, v4);
    }
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Client (%p) does not match running client=%p. Cannot stop stream IO Audio", *(void *)(a1 + 40), v3);
  }
  else
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Client (%p) cannot stop stream IO Audio when not running", *(void *)(a1 + 40), v12);
  }
  uint64_t v4 = v7;
  if (v7)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __40__VCStreamIOAudioController_stopClient___block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v8 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint32_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136316418;
          uint64_t v14 = v9;
          __int16 v15 = 2080;
          __int16 v16 = "-[VCStreamIOAudioController stopClient:]_block_invoke";
          __int16 v17 = 1024;
          int v18 = 315;
          __int16 v19 = 2112;
          __int16 v20 = v8;
          __int16 v21 = 2048;
          uint64_t v22 = v11;
          __int16 v23 = 2112;
          uint64_t v24 = v4;
          _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) error=%@", buf, 0x3Au);
        }
      }
    }
    uint64_t v4 = [MEMORY[0x1E4F28C58] AVConferenceServiceError:32005 detailCode:0 description:v4];
  }
  uint64_t v5 = 0;
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "delegate"), "didStop:error:", v5, v4);
}

- (BOOL)supportsVoiceActivityDetection
{
  return 0;
}

- (BOOL)dispatchedStartClient:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_isRunning)
  {
    BOOL v9 = 0;
    uint64_t v12 = @"Client (%p) cannot start stream IO Audio when already running";
    uint64_t v13 = 32025;
    goto LABEL_17;
  }
  if (![a3 direction])
  {
    BOOL v9 = 0;
    uint64_t v12 = @"Client (%p) direction is invalid";
    uint64_t v13 = 32026;
    goto LABEL_17;
  }
  objc_msgSend((id)objc_msgSend(a3, "delegate"), "controllerFormatChanged:", objc_msgSend(a3, "clientFormat"));
  [(VCStreamIOAudioController *)self setRunningClient:a3];
  char v7 = [a3 direction];
  if (v7)
  {
    BOOL v8 = [(VCStreamIOAudioController *)self startOutputForClient:a3 error:a4];
    self->_sourceStarted = v8;
    if (!v8)
    {
      BOOL v9 = 0;
      uint64_t v12 = @"Client (%p) Starting output for client failed";
LABEL_16:
      uint64_t v13 = 32005;
LABEL_17:
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", v12, a3);
      if (!v14) {
        return v9;
      }
      uint64_t v15 = v14;
      if ((VCStreamIOAudioController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            -[VCStreamIOAudioController dispatchedStartClient:error:]();
            if (!a4) {
              goto LABEL_30;
            }
            goto LABEL_29;
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v16 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v16 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          int v18 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v20 = v17;
            __int16 v21 = 2080;
            uint64_t v22 = "-[VCStreamIOAudioController dispatchedStartClient:error:]";
            __int16 v23 = 1024;
            int v24 = 354;
            __int16 v25 = 2112;
            __int16 v26 = v16;
            __int16 v27 = 2048;
            uint64_t v28 = self;
            __int16 v29 = 2112;
            uint64_t v30 = v15;
            _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, "VCStreamIOAudioController [%s] %s:%d %@(%p) error=%@", buf, 0x3Au);
            if (!a4) {
              goto LABEL_30;
            }
            goto LABEL_29;
          }
        }
      }
      if (!a4)
      {
LABEL_30:
        [(VCStreamIOAudioController *)self dispatchedStopClient];
        return 0;
      }
LABEL_29:
      *a4 = (id)[MEMORY[0x1E4F28C58] AVConferenceServiceError:v13 detailCode:0 description:v15];
      goto LABEL_30;
    }
  }
  BOOL v9 = v7 & 1;
  if (([a3 direction] & 2) != 0)
  {
    BOOL v10 = [(VCStreamIOAudioController *)self startInputForClient:a3 error:a4];
    self->_sinkStarted = v10;
    if (v10)
    {
      BOOL v9 = 1;
      goto LABEL_8;
    }
    uint64_t v12 = @"Client (%p) Stop the output for client";
    goto LABEL_16;
  }
LABEL_8:
  if (self->_sourceStarted || self->_sinkStarted)
  {
    self->_clientDirection = [a3 direction];
    self->_isRunning = 1;
  }
  return v9;
}

- (void)dispatchedStopClient
{
  self->_isRunning = 0;
  if (self->_sourceStarted)
  {
    [(VCAudioRelay *)self->_outputThread stopClientIO];
    [(VCStreamIOAudioController *)self cleanupOutputThread];
    self->_sourceIO = 0;
    self->_sourceStarted = 0;
  }
  if (self->_sinkStarted)
  {
    [(VCStreamInputAudio *)self->_streamInput registerSampleBufferCallback:0 context:0];
    [(VCStreamIOAudioController *)self _packetThreadStop];
    [(VCStreamInput *)self->_streamInput didStopStreamInputCaptureSource];
    self->_sinkStarted = 0;
  }

  [(VCStreamIOAudioController *)self setRunningClient:0];
}

- (void)dispatchedUpdateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  int v7 = [a3 direction];
  int var0 = a4->var0;
  [a3 setDirection:a4->var0];
  [a3 setSpatialAudioDisabled:a4->var1];
  [a3 setIsVoiceActivityEnabled:a4->var2];
  [a3 setIsMediaPriorityEnabled:a4->var3];
  if (self->_runningClient != a3)
  {
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      runningClient = self->_runningClient;
      v23[0] = 136316162;
      *(void *)&v23[1] = v12;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCStreamIOAudioController dispatchedUpdateClient:settings:]";
      __int16 v26 = 1024;
      int v27 = 388;
      __int16 v28 = 2048;
      id v29 = a3;
      __int16 v30 = 2048;
      uint64_t v31 = (VCStreamIOAudioController *)runningClient;
      uint64_t v15 = "VCStreamIOAudioController [%s] %s:%d client=%p != runningClient=%p";
      __int16 v16 = v13;
      uint32_t v17 = 48;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v10 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      __int16 v19 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      uint64_t v20 = self->_runningClient;
      v23[0] = 136316674;
      *(void *)&v23[1] = v18;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCStreamIOAudioController dispatchedUpdateClient:settings:]";
      __int16 v26 = 1024;
      int v27 = 388;
      __int16 v28 = 2112;
      id v29 = v10;
      __int16 v30 = 2048;
      uint64_t v31 = self;
      __int16 v32 = 2048;
      id v33 = a3;
      __int16 v34 = 2048;
      __int16 v35 = v20;
      uint64_t v15 = "VCStreamIOAudioController [%s] %s:%d %@(%p) client=%p != runningClient=%p";
      __int16 v16 = v19;
      uint32_t v17 = 68;
    }
LABEL_29:
    _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)v23, v17);
    return;
  }
  if ([(VCStreamIOAudioController *)self canSetDirection:a4->var0])
  {
    if (self->_isRunning && v7 != var0)
    {
      [(VCStreamIOAudioController *)self dispatchedStopClient];
      [(VCStreamIOAudioController *)self dispatchedStartClient:a3 error:v23];
    }
    return;
  }
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamIOAudioController dispatchedUpdateClient:settings:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v11 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint64_t v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        v23[0] = 136316418;
        *(void *)&v23[1] = v21;
        __int16 v24 = 2080;
        __int16 v25 = "-[VCStreamIOAudioController dispatchedUpdateClient:settings:]";
        __int16 v26 = 1024;
        int v27 = 391;
        __int16 v28 = 2112;
        id v29 = v11;
        __int16 v30 = 2048;
        uint64_t v31 = self;
        __int16 v32 = 2048;
        id v33 = a3;
        uint64_t v15 = "VCStreamIOAudioController [%s] %s:%d %@(%p) Could not update the direction for client=%p";
        __int16 v16 = v22;
        uint32_t v17 = 58;
        goto LABEL_29;
      }
    }
  }
}

- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      stateQueue = self->_stateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__VCStreamIOAudioController_updateClient_settings___block_invoke;
      block[3] = &unk_1E6DB3EE0;
      block[4] = self;
      block[5] = a3;
      tagVCAudioIOControllerClientSettings v13 = *a4;
      dispatch_async(stateQueue, block);
      return;
    }
    if ((VCStreamIOAudioController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCStreamIOAudioController updateClient:settings:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v7 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
      }
      else {
        int v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        BOOL v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          uint32_t v17 = "-[VCStreamIOAudioController updateClient:settings:]";
          __int16 v18 = 1024;
          int v19 = 403;
          __int16 v20 = 2112;
          uint64_t v21 = v7;
          __int16 v22 = 2048;
          __int16 v23 = self;
          BOOL v10 = "VCStreamIOAudioController [%s] %s:%d %@(%p) settings is NULL";
          goto LABEL_25;
        }
      }
    }
  }
  else if ((VCStreamIOAudioController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCStreamIOAudioController updateClient:settings:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      BOOL v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v15 = v8;
        __int16 v16 = 2080;
        uint32_t v17 = "-[VCStreamIOAudioController updateClient:settings:]";
        __int16 v18 = 1024;
        int v19 = 402;
        __int16 v20 = 2112;
        uint64_t v21 = v6;
        __int16 v22 = 2048;
        __int16 v23 = self;
        BOOL v10 = "VCStreamIOAudioController [%s] %s:%d %@(%p) client is nil";
LABEL_25:
        _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x30u);
      }
    }
  }
}

uint64_t __51__VCStreamIOAudioController_updateClient_settings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedUpdateClient:*(void *)(a1 + 40) settings:a1 + 48];
}

- (BOOL)canSetDirection:(unsigned __int8)a3
{
  return [(VCAudioIOControllerClient *)self->_runningClient direction] == a3
      || (a3 & 2) == 0
      || self->_streamInput;
}

- (void)invalidate
{
  uint64_t v3 = +[VCStreamOutputManager sharedInstance];
  int64_t streamToken = self->_streamToken;

  [(VCStreamOutputManager *)v3 deregisterStreamOutputSourceForStreamToken:streamToken];
}

- (NSDictionary)reportingStats
{
  BOOL result = (NSDictionary *)self->_streamInput;
  if (result) {
    return (NSDictionary *)[(NSDictionary *)result reportingStats];
  }
  return result;
}

- (VCStreamOutput)streamOutput
{
  p_streamOutputLock = &self->_streamOutputLock;
  os_unfair_lock_lock(&self->_streamOutputLock);
  uint64_t v4 = self->_streamOutput;
  os_unfair_lock_unlock(p_streamOutputLock);
  return v4;
}

- (void)setStreamOutput:(id)a3
{
  p_streamOutputLock = &self->_streamOutputLock;
  os_unfair_lock_lock(&self->_streamOutputLock);

  streamOutput = (VCStreamOutput *)a3;
  self->_streamOutput = streamOutput;
  if (self->_backingBufferAllocator)
  {
    CFRelease(self->_backingBufferAllocator);
    streamOutput = self->_streamOutput;
  }
  int v7 = [(VCStreamOutput *)streamOutput backingBufferAllocator];
  self->_backingBufferAllocator = v7;
  if (v7) {
    CFRetain(v7);
  }

  os_unfair_lock_unlock(p_streamOutputLock);
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCStreamIOAudioController *)objc_opt_class() == self)
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
        uint64_t v15 = "-[VCStreamIOAudioController didUpdateBasebandCodec:]";
        __int16 v16 = 1024;
        int v17 = 457;
        int v7 = "VCStreamIOAudioController [%s] %s:%d not handled";
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
      uint64_t v4 = (__CFString *)[(VCStreamIOAudioController *)self performSelector:sel_logPrefix];
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
        uint64_t v15 = "-[VCStreamIOAudioController didUpdateBasebandCodec:]";
        __int16 v16 = 1024;
        int v17 = 457;
        __int16 v18 = 2112;
        int v19 = v4;
        __int16 v20 = 2048;
        uint64_t v21 = self;
        int v7 = "VCStreamIOAudioController [%s] %s:%d %@(%p) not handled";
        uint64_t v8 = v11;
        uint32_t v9 = 48;
        goto LABEL_11;
      }
    }
  }
}

- (VCAudioIOControllerClient)runningClient
{
  return (VCAudioIOControllerClient *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRunningClient:(id)a3
{
}

- (void)initWithStreamInputID:streamToken:networkClockID:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Invalid streamToken", v2, v3, v4, v5, v6);
}

- (void)initWithStreamInputID:streamToken:networkClockID:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Failed to allocate the dipatch queue", v2, v3, v4, v5, v6);
}

- (void)initWithStreamInputID:streamToken:networkClockID:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Failed to create the sample buffer allocator", v2, v3, v4, v5, v6);
}

- (void)initWithStreamInputID:streamToken:networkClockID:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d StreamInputID not found in VCStreamInputManager", v2, v3, v4, v5, v6);
}

- (void)_packetThreadStartWithClientFormat:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Error allocating buffer list for stream IO", v2, v3, v4, v5, v6);
}

- (void)_packetThreadStartWithClientFormat:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Failed to create the packet thread", v2, v3, v4, v5, v6);
}

- (void)_packetThreadStartWithClientFormat:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Packet thread is already running", v2, v3, v4, v5, v6);
}

- (void)startClient:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d nil client", v2, v3, v4, v5, v6);
}

- (void)startInputForClient:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d error=%@");
}

- (void)startOutputForClient:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d error=%@");
}

- (void)setupAndStartOutputClientThread
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Failed to create network clock for output thread with error=%@");
}

- (uint64_t)setupAndStartOutputClientThread
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v4, v5, "VCStreamIOAudioController [%s] %s:%d Failed to allocate output thread client", v6, v7, v8, v9, v11);
  return a3 & 1;
}

- (void)stopClient:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d nil client", v2, v3, v4, v5, v6);
}

void __40__VCStreamIOAudioController_stopClient___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d error=%@");
}

- (void)dispatchedStartClient:error:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d error=%@");
}

- (void)dispatchedUpdateClient:settings:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCStreamIOAudioController dispatchedUpdateClient:settings:]";
  OUTLINED_FUNCTION_3();
  LODWORD(v4) = 391;
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d Could not update the direction for client=%p", v2, *(const char **)v3, (unint64_t)"-[VCStreamIOAudioController dispatchedUpdateClient:settings:]" >> 16, v4);
}

- (void)updateClient:settings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d client is nil", v2, v3, v4, v5, v6);
}

- (void)updateClient:settings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCStreamIOAudioController [%s] %s:%d settings is NULL", v2, v3, v4, v5, v6);
}

@end