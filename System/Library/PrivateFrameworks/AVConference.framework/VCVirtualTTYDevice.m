@interface VCVirtualTTYDevice
- (BOOL)isValid;
- (BOOL)setStreamConfig:(id)a3 withError:(id *)a4;
- (VCMediaStreamDelegate)delegate;
- (VCVirtualTTYDevice)initWithMode:(int64_t)a3 clientPid:(int)a4;
- (id)setPause:(BOOL)a3;
- (id)start;
- (id)stop;
- (id)stopWithError:(id)a3;
- (int)deviceRole;
- (void)dealloc;
- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3;
- (void)lock;
- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3;
- (void)sendCharacter:(unsigned __int16)a3;
- (void)sendText:(id)a3;
- (void)serverDidDie;
- (void)setDelegate:(id)a3;
- (void)setDeviceRole:(int)a3;
- (void)setIsValid:(BOOL)a3;
- (void)start;
- (void)unlock;
@end

@implementation VCVirtualTTYDevice

- (BOOL)setStreamConfig:(id)a3 withError:(id *)a4
{
  return 1;
}

- (VCVirtualTTYDevice)initWithMode:(int64_t)a3 clientPid:(int)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)VCVirtualTTYDevice;
  v6 = [(VCVirtualTTYDevice *)&v25 init];
  v7 = v6;
  if (v6)
  {
    v6->_clientPid = a4;
    v6->_audioSessionId = VCUniqueIDGenerator_GenerateID();
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v7->delegateNotificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVirtualTTYDevice.delegateNotificationQueue", 0, CustomRootQueue);
    if (a3)
    {
      if (a3 == 1)
      {
        v9 = v7;
        uint64_t v10 = 2;
      }
      else
      {
        if (a3 != 2)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCVirtualTTYDevice initWithMode:clientPid:]();
            }
          }
          goto LABEL_9;
        }
        v9 = v7;
        uint64_t v10 = 0;
      }
    }
    else
    {
      v9 = v7;
      uint64_t v10 = 4;
    }
    [(VCVirtualTTYDevice *)v9 setDeviceRole:v10];
LABEL_9:
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:&unk_1F3DC6000 forKeyedSubscript:@"vcAudioPayloadConfigKeyPayloadType"];
    v12 = [[VCAudioPayloadConfig alloc] initWithConfigDict:v11];

    v13 = [[VCAudioPayload alloc] initWithConfig:v12];
    v7->_currentAudioPayload = v13;
    unsigned int v14 = [(VCAudioPayloadConfig *)[(VCAudioPayload *)v13 config] codecSampleRate];
    v7->_vpioFormat.format.mSampleRate = (double)v14;
    *(_OWORD *)&v7->_vpioFormat.format.mFormatID = xmmword_1E259BB10;
    *(void *)&v7->_vpioFormat.format.mBytesPerFrame = 0x100000004;
    v7->_vpioFormat.format.mBitsPerChannel = 32;
    v7->_vpioFormat.samplesPerFrame = ((double)v14 / 50.0);
    [(VCAudioPayload *)v7->_currentAudioPayload createEncoderWithInputFormat:&v7->_vpioFormat];

    pthread_mutex_init(&v7->sessionLock, 0);
    *(void *)v24 = -1;
    *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v24[8] = v15;
    *(_OWORD *)&v24[24] = v15;
    LODWORD(v15) = v7->_vpioFormat.samplesPerFrame;
    SoundDec_FormatASBD(16785216, (uint64_t)v24, +[VCPayloadUtils codecSamplesPerFrameForPayload:99 blockSize:(double)(unint64_t)v15 / v7->_vpioFormat.format.mSampleRate], 1u, 0, 0.02);
    v16 = (SoundDec_t *)malloc_type_calloc(1uLL, 0x110uLL, 0x1030040C827E633uLL);
    long long v17 = *(_OWORD *)&v24[16];
    long long v18 = *(_OWORD *)v24;
    *(void *)v27 = unk_1E25A2368;
    memset(&v27[8], 170, 32);
    v7->_decoder = v16;
    unint64_t v28 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&buf[32] = *(void *)&v24[32];
    *(_OWORD *)buf = v18;
    *(_OWORD *)&buf[16] = v17;
    long long v19 = *(_OWORD *)&v7->_vpioFormat.format.mBytesPerPacket;
    uint64_t v20 = *(void *)&v7->_vpioFormat.format.mBitsPerChannel;
    *(_OWORD *)v27 = *(_OWORD *)&v7->_vpioFormat.format.mSampleRate;
    *(void *)&v27[32] = v20;
    *(_OWORD *)&v27[16] = v19;
    LOWORD(v28) = 0;
    SoundDec_Create(&v7->_decoder, (uint64_t)buf);
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 100, &v7->_charQueue);
    v7->_characterPool = (tagVCMemoryPool *)VCMemoryPool_Create(2uLL);
    v7->_state = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      *(void *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCVirtualTTYDevice initWithMode:clientPid:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 134;
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = v7;
      *(_WORD *)&buf[38] = 2080;
      *(void *)v27 = "-[VCVirtualTTYDevice initWithMode:clientPid:]";
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCVirtualTTYDevice [%s] %s:%d VCVirtualTTYDevice[%p] %s", buf, 0x30u);
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  objc_storeWeak((id *)&self->delegate, 0);
  dispatch_release((dispatch_object_t)self->delegateNotificationQueue);
  pthread_mutex_destroy(&self->sessionLock);

  SoundDec_Destroy((uint64_t)self->_decoder);
  charQueue = self->_charQueue;
  if (charQueue) {
    CFRelease(charQueue);
  }
  VCMemoryPool_Destroy((OSQueueHead *)self->_characterPool);

  v4.receiver = self;
  v4.super_class = (Class)VCVirtualTTYDevice;
  [(VCVirtualTTYDevice *)&v4 dealloc];
}

- (id)start
{
  v38[1] = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    objc_super v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCVirtualTTYDevice start]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 151;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCVirtualTTYDevice [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  [(VCVirtualTTYDevice *)self lock];
  if (self->_state)
  {
    if ((VCVirtualTTYDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          [(VCVirtualTTYDevice *)v9 start];
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v5 = (__CFString *)[(VCVirtualTTYDevice *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int state = self->_state;
          *(_DWORD *)buf = 136316418;
          *(void *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCVirtualTTYDevice start]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 155;
          *(_WORD *)&buf[28] = 2112;
          *(void *)&buf[30] = v5;
          *(_WORD *)&buf[38] = 2048;
          *(void *)&unsigned char buf[40] = self;
          LOWORD(v26) = 1024;
          *(_DWORD *)((char *)&v26 + 2) = state;
          _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, "VCVirtualTTYDevice [%s] %s:%d %@(%p) Unable to start because of unexpected state:%d ", buf, 0x36u);
        }
      }
    }
    [(VCVirtualTTYDevice *)self unlock];
    v13 = (void *)MEMORY[0x1E4F28C58];
    v37 = @"state";
    v38[0] = [NSNumber numberWithUnsignedInt:self->_state];
    return (id)objc_msgSend(v13, "errorWithDomain:code:userInfo:", @"VirtualTTYDevice", -1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1));
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
    memset(buf, 0, sizeof(buf));
    *(_DWORD *)buf = VCUniqueIDGenerator_GenerateID();
    int deviceRole = self->deviceRole;
    *(_DWORD *)&buf[8] = 3;
    *(_DWORD *)&buf[12] = deviceRole;
    *(_DWORD *)&buf[16] = 0;
    buf[20] = 3;
    DWORD2(v26) = 1;
    long long v27 = 0uLL;
    *(void *)&long long v29 = self;
    *((void *)&v32 + 1) = self;
    v7 = [[VCAudioIO alloc] initWithConfiguration:buf];
    self->_audioIO = v7;
    [(VCAudioIO *)v7 setClientFormat:&self->_vpioFormat];
    v24[0] = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    AUIOGetAUNumber(v24);
    [(VCAudioIO *)self->_audioIO setFarEndVersionInfo:&v16];
    id v8 = [(VCAudioIO *)self->_audioIO start];
    if (v8)
    {

      self->_audioIO = 0;
    }
    else
    {
      self->_int state = 1;
    }
    [(VCVirtualTTYDevice *)self unlock];
  }
  return v8;
}

- (void)sendCharacter:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = VCMemoryPool_Alloc((OSQueueHead *)self->_characterPool);
  *uint64_t v5 = v3;
  if (CMSimpleQueueEnqueue(self->_charQueue, v5))
  {
    if ((VCVirtualTTYDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVirtualTTYDevice sendCharacter:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v6 = (__CFString *)[(VCVirtualTTYDevice *)self performSelector:sel_logPrefix];
      }
      else {
        v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        id v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v12 = 136316162;
          uint64_t v13 = v7;
          __int16 v14 = 2080;
          long long v15 = "-[VCVirtualTTYDevice sendCharacter:]";
          __int16 v16 = 1024;
          int v17 = 199;
          __int16 v18 = 2112;
          long long v19 = v6;
          __int16 v20 = 2048;
          long long v21 = self;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, "VCVirtualTTYDevice [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", (uint8_t *)&v12, 0x30u);
        }
      }
    }
    VCMemoryPool_Free((OSQueueHead *)self->_characterPool, v5);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        long long v15 = "-[VCVirtualTTYDevice sendCharacter:]";
        __int16 v16 = 1024;
        int v17 = 202;
        __int16 v18 = 1024;
        LODWORD(v19) = v3;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCVirtualTTYDevice [%s] %s:%d Sending character:'%C'", (uint8_t *)&v12, 0x22u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      [(VCVirtualTTYDevice *)v9 sendCharacter:v10];
    }
  }
}

- (void)sendText:(id)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVirtualTTYDevice sendText:]();
    }
  }
}

- (id)stop
{
  return [(VCVirtualTTYDevice *)self stopWithError:0];
}

- (id)stopWithError:(id)a3
{
  [(VCVirtualTTYDevice *)self lock];
  if (self->_state == 1)
  {
    id v4 = [(VCAudioIO *)self->_audioIO stop];

    self->_audioIO = 0;
    self->_int state = 0;
  }
  else
  {
    id v4 = 0;
  }
  [(VCVirtualTTYDevice *)self unlock];
  return v4;
}

- (id)setPause:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCVirtualTTYDevice setPause:]";
      __int16 v12 = 1024;
      int v13 = 235;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCVirtualTTYDevice [%s] %s:%d ", (uint8_t *)&v8, 0x1Cu);
    }
  }
  if (v3) {
    return [(VCVirtualTTYDevice *)self stop];
  }
  else {
    return [(VCVirtualTTYDevice *)self start];
  }
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t SampleFormat = VCAudioBufferList_GetSampleFormat((uint64_t)a3);
  int v10 = -1431655766;
  BufferAtIndex = (char *)VCAudioBufferList_GetBufferAtIndex((uint64_t)a3, 0, &v10);
  signed int v7 = *(_DWORD *)(SampleFormat + 16) * v10;
  int v9 = v7;
  if (CMSimpleQueueGetCount(self->_charQueue) < 1)
  {
    SoundDec_Decode((uint64_t)self->_decoder, 0, 0, BufferAtIndex, v7, &v9, 0);
  }
  else
  {
    int v8 = (void *)CMSimpleQueueDequeue(self->_charQueue);
    SoundDec_Decode((uint64_t)self->_decoder, v8, 1u, BufferAtIndex, v9, &v9, 0);
    VCMemoryPool_Free((OSQueueHead *)self->_characterPool, v8);
  }
  VCAudioBufferList_InvalidateAveragePower((uint64_t)a3);
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  memset(v23, 0, sizeof(v23));
  int v4 = [(VCAudioPayload *)self->_currentAudioPayload encodeAudio:a3 numInputSamples:VCAudioBufferList_GetSampleCount((uint64_t)a3) outputBytes:v23 numOutputBytes:32 shortREDBytes:0];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    v6 = (char *)v23;
    do
    {
      int v8 = *v6++;
      int v7 = v8;
      if (v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          int v10 = *MEMORY[0x1E4F47A50];
          uint64_t v11 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              uint64_t v16 = v9;
              __int16 v17 = 2080;
              __int16 v18 = "-[VCVirtualTTYDevice pushAudioSamples:]";
              __int16 v19 = 1024;
              int v20 = 283;
              __int16 v21 = 1024;
              int v22 = v7;
              _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCVirtualTTYDevice [%s] %s:%d Received character:%c", buf, 0x22u);
            }
          }
          else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v16 = v9;
            __int16 v17 = 2080;
            __int16 v18 = "-[VCVirtualTTYDevice pushAudioSamples:]";
            __int16 v19 = 1024;
            int v20 = 283;
            __int16 v21 = 1024;
            int v22 = v7;
            _os_log_debug_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEBUG, "VCVirtualTTYDevice [%s] %s:%d Received character:%c", buf, 0x22u);
          }
        }
        delegateNotificationQueue = self->delegateNotificationQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __39__VCVirtualTTYDevice_pushAudioSamples___block_invoke;
        block[3] = &unk_1E6DB3DF0;
        block[4] = self;
        char v14 = v7;
        dispatch_async(delegateNotificationQueue, block);
      }
      --v5;
    }
    while (v5);
  }
}

uint64_t __39__VCVirtualTTYDevice_pushAudioSamples___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(char *)(a1 + 40) & 0xFFFF;

  return [v2 vcMediaStream:v3 didReceiveTTYCharacter:v4];
}

- (void)serverDidDie
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__VCVirtualTTYDevice_serverDidDie__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateNotificationQueue, v3);
}

uint64_t __34__VCVirtualTTYDevice_serverDidDie__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "vcMediaStreamServerDidDie:");
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVirtualTTYDevice didUpdateBasebandCodec:]();
    }
  }
}

- (BOOL)isValid
{
  return self->isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->isValid = a3;
}

- (int)deviceRole
{
  return self->deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->int deviceRole = a3;
}

- (VCMediaStreamDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  self->delegate = (VCMediaStreamDelegate *)a3;
}

- (void)initWithMode:clientPid:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCVirtualTTYDevice initWithMode:clientPid:]";
  __int16 v6 = 1024;
  int v7 = 92;
  __int16 v8 = 2048;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, "VCVirtualTTYDevice [%s] %s:%d Virtual TTY Device mode(%ld) not supported", v3, 0x26u);
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int v7 = "-[VCVirtualTTYDevice start]";
  __int16 v8 = 1024;
  int v9 = 155;
  __int16 v10 = 1024;
  int v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, "VCVirtualTTYDevice [%s] %s:%d Unable to start because of unexpected state:%d ", (uint8_t *)&v4, 0x22u);
}

- (void)sendCharacter:(os_log_t)log .cold.1(uint64_t a1, unsigned __int16 a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  __int16 v6 = "-[VCVirtualTTYDevice sendCharacter:]";
  __int16 v7 = 1024;
  int v8 = 202;
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_debug_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEBUG, "VCVirtualTTYDevice [%s] %s:%d Sending character:'%C'", (uint8_t *)&v3, 0x22u);
}

- (void)sendCharacter:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVirtualTTYDevice [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, v6);
}

- (void)sendText:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVirtualTTYDevice [%s] %s:%d Not supported", v2, v3, v4, v5, v6);
}

- (void)didUpdateBasebandCodec:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCVirtualTTYDevice [%s] %s:%d Unexpected SPI call", v2, v3, v4, v5, v6);
}

@end