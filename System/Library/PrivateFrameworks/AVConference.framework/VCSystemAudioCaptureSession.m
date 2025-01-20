@interface VCSystemAudioCaptureSession
- (BOOL)createAudioBufferPool;
- (BOOL)setupAudioIOWithConfig:(id *)a3;
- (BOOL)start;
- (BOOL)stop;
- (VCSystemAudioCaptureSession)initWithConfiguration:(id *)a3;
- (void)cleanupQueue:(opaqueCMSimpleQueue *)a3;
- (void)createAudioBufferPool;
- (void)dealloc;
- (void)resetAudioBufferPool;
@end

@implementation VCSystemAudioCaptureSession

- (VCSystemAudioCaptureSession)initWithConfiguration:(id *)a3
{
  v3 = (char *)self;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCaptureSession initWithConfiguration:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCaptureSession initWithConfiguration:]();
      }
    }
    goto LABEL_40;
  }
  v11.receiver = self;
  v11.super_class = (Class)VCSystemAudioCaptureSession;
  v3 = [(VCSystemAudioCaptureSession *)&v11 init];
  if (!v3)
  {
LABEL_40:

    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v5;
      __int16 v14 = 2080;
      v15 = "-[VCSystemAudioCaptureSession initWithConfiguration:]";
      __int16 v16 = 1024;
      int v17 = 42;
      __int16 v18 = 2048;
      v19 = v3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p", buf, 0x26u);
    }
  }
  pthread_mutex_init((pthread_mutex_t *)(v3 + 8), 0);
  long long v7 = *(_OWORD *)&a3->var1.format.mSampleRate;
  uint64_t v8 = *(void *)&a3->var1.format.mBitsPerChannel;
  *(_OWORD *)(v3 + 88) = *(_OWORD *)&a3->var1.format.mBytesPerPacket;
  *((void *)v3 + 13) = v8;
  *(_OWORD *)(v3 + 72) = v7;
  *((_DWORD *)v3 + 25) = 1;
  *((_DWORD *)v3 + 28) = a3->var1.samplesPerFrame;
  if (([v3 setupAudioIOWithConfig:a3] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCaptureSession initWithConfiguration:].cold.9();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCaptureSession initWithConfiguration:]0();
      }
    }
    goto LABEL_40;
  }
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 10, (CMSimpleQueueRef *)v3 + 15))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCaptureSession initWithConfiguration:].cold.7();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCaptureSession initWithConfiguration:].cold.8();
      }
    }
    goto LABEL_40;
  }
  if (CMSimpleQueueCreate(v9, 11, (CMSimpleQueueRef *)v3 + 16))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCaptureSession initWithConfiguration:].cold.5();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCaptureSession initWithConfiguration:].cold.6();
      }
    }
    goto LABEL_40;
  }
  if (([v3 createAudioBufferPool] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if (VRTraceIsOSFaultDisabled())
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSystemAudioCaptureSession initWithConfiguration:]();
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
      {
        -[VCSystemAudioCaptureSession initWithConfiguration:].cold.4();
      }
    }
    goto LABEL_40;
  }
  return (VCSystemAudioCaptureSession *)v3;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      CFAllocatorRef v9 = "-[VCSystemAudioCaptureSession dealloc]";
      __int16 v10 = 1024;
      int v11 = 66;
      __int16 v12 = 2048;
      uint64_t v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p", buf, 0x26u);
    }
  }
  pthread_mutex_destroy(&self->_stateLock);

  [(VCSystemAudioCaptureSession *)self cleanupQueue:&self->_poolQueue];
  [(VCSystemAudioCaptureSession *)self cleanupQueue:&self->_outputQueue];
  v5.receiver = self;
  v5.super_class = (Class)VCSystemAudioCaptureSession;
  [(VCSystemAudioCaptureSession *)&v5 dealloc];
}

- (BOOL)setupAudioIOWithConfig:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int mSampleRate = a3->var1.format.mSampleRate;
  unsigned int samplesPerFrame = a3->var1.samplesPerFrame;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v25 = v6;
  long long v24 = v6;
  long long v23 = v6;
  int32x2_t v11 = vrev64_s32(*(int32x2_t *)&a3->var2);
  long long v17 = v6;
  long long v18 = v6;
  long long v19 = v6;
  long long v20 = v6;
  long long v16 = v6;
  long long v15 = v6;
  long long v14 = v6;
  long long v12 = v6;
  long long v13 = v6;
  int var5 = a3->var5;
  v10[0] = a3->var4;
  v10[1] = 0;
  LODWORD(v12) = 1;
  WORD2(v12) = 2;
  *((void *)&v12 + 1) = 0;
  *(void *)&long long v13 = __PAIR64__(mSampleRate, var5);
  DWORD2(v13) = samplesPerFrame;
  BYTE12(v13) = 0;
  *(void *)&long long v14 = 0;
  DWORD2(v14) = 2;
  long long v15 = 0uLL;
  WORD4(v16) = 0;
  *(void *)&long long v16 = 0;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  v21 = _VCSystemAudioCaptureSession_audioSink;
  v22 = self;
  long long v23 = 0uLL;
  LOBYTE(v24) = 0;
  *((void *)&v24 + 1) = 0;
  *(void *)&long long v25 = 0;
  WORD4(v25) = 0;
  __int16 v8 = [[VCAudioIO alloc] initWithConfiguration:v10];
  self->_audioIO = v8;
  return v8 != 0;
}

- (BOOL)start
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    objc_super v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      int32x2_t v11 = "-[VCSystemAudioCaptureSession start]";
      __int16 v12 = 1024;
      int v13 = 100;
      __int16 v14 = 2048;
      long long v15 = self;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p", (uint8_t *)&v8, 0x26u);
    }
  }
  id v6 = [(VCAudioIO *)self->_audioIO start];
  pthread_mutex_unlock(p_stateLock);
  return v6 == 0;
}

- (BOOL)stop
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  pthread_mutex_lock(&self->_stateLock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    objc_super v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      int32x2_t v11 = "-[VCSystemAudioCaptureSession stop]";
      __int16 v12 = 1024;
      int v13 = 109;
      __int16 v14 = 2048;
      long long v15 = self;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p", (uint8_t *)&v8, 0x26u);
    }
  }
  id v6 = [(VCAudioIO *)self->_audioIO stop];
  [(VCSystemAudioCaptureSession *)self resetAudioBufferPool];
  pthread_mutex_unlock(p_stateLock);
  return v6 == 0;
}

- (BOOL)createAudioBufferPool
{
  BOOL v3 = 0;
  unint64_t v4 = 0;
  element[1] = *(void **)MEMORY[0x1E4F143B8];
  p_audioBasicDescription = &self->_audioBasicDescription;
  while (1)
  {
    element[0] = (void *)0xAAAAAAAAAAAAAAAALL;
    unsigned int samplesPerFrame = self->_samplesPerFrame;
    long long v7 = *(_OWORD *)&p_audioBasicDescription->mBytesPerPacket;
    v9[0] = *(_OWORD *)&p_audioBasicDescription->mSampleRate;
    v9[1] = v7;
    uint64_t v10 = *(void *)&p_audioBasicDescription->mBitsPerChannel;
    if ((VCAudioBufferList_Allocate(v9, samplesPerFrame, element) & 1) == 0) {
      break;
    }
    VCAudioBufferList_Reset((uint64_t)element[0]);
    if (CMSimpleQueueEnqueue(self->_poolQueue, element[0]))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if (VRTraceIsOSFaultDisabled())
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSystemAudioCaptureSession createAudioBufferPool]();
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
        {
          -[VCSystemAudioCaptureSession createAudioBufferPool]();
        }
      }
      return v3;
    }
    BOOL v3 = v4++ > 8;
    if (v4 == 10) {
      return 1;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSystemAudioCaptureSession createAudioBufferPool]();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      -[VCSystemAudioCaptureSession createAudioBufferPool].cold.4();
    }
  }
  return v3;
}

- (void)cleanupQueue:(opaqueCMSimpleQueue *)a3
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    while (1)
    {
      v4[0] = (uint64_t)CMSimpleQueueDequeue(*a3);
      if (!v4[0]) {
        break;
      }
      VCAudioBufferList_Destroy(v4);
    }
    if (*a3) {
      CFRelease(*a3);
    }
    *a3 = 0;
  }
}

- (void)resetAudioBufferPool
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = CMSimpleQueueDequeue(self->_outputQueue);
  if (v3)
  {
    unint64_t v4 = v3;
    objc_super v5 = (os_log_t *)MEMORY[0x1E4F47A50];
    do
    {
      if (CMSimpleQueueEnqueue(self->_poolQueue, v4) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        long long v7 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v9 = v6;
          __int16 v10 = 2080;
          int32x2_t v11 = "-[VCSystemAudioCaptureSession resetAudioBufferPool]";
          __int16 v12 = 1024;
          int v13 = 147;
          __int16 v14 = 2048;
          long long v15 = self;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p Error returning output to audio buffer pool", buf, 0x26u);
        }
      }
      unint64_t v4 = CMSimpleQueueDequeue(self->_outputQueue);
    }
    while (v4);
  }
}

- (void)initWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_13();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_13();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d null configuration", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_9();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not audio buffers", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_9();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not audio buffers", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not create queue", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_6();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not create queue", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_13();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not create queue", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_13();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not create queue", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure the audio IO", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to configure the audio IO", v2, v3, v4, v5, v6);
}

- (void)createAudioBufferPool
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_14();
  OUTLINED_FUNCTION_12_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d could not create audio buffer list", v2, v3, v4, v5, v6);
}

@end