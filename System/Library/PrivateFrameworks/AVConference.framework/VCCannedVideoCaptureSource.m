@interface VCCannedVideoCaptureSource
- (VCCannedVideoCaptureSource)initWithVideo:(id)a3 callbackContext:(id)a4 frameCallback:(void *)a5;
- (int)frameRate;
- (int)start;
- (int)stop;
- (void)dealloc;
- (void)setFrameRate:(int)a3;
- (void)setWidth:(int)a3 height:(int)a4;
- (void)start;
@end

@implementation VCCannedVideoCaptureSource

- (VCCannedVideoCaptureSource)initWithVideo:(id)a3 callbackContext:(id)a4 frameCallback:(void *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VCCannedVideoCaptureSource;
  v8 = [(VCObject *)&v18 init];
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:]();
      }
    }
    goto LABEL_19;
  }
  int v9 = +[CannedVideoCapture cannedVideoTypeForPath:a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v20 = v10;
      __int16 v21 = 2080;
      v22 = "-[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:]";
      __int16 v23 = 1024;
      int v24 = 83;
      __int16 v25 = 1024;
      int v26 = v9;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d cannedVideoType = %d", buf, 0x22u);
    }
  }
  if (v9 == 1)
  {
    v12 = &off_1E6DB2DA8;
  }
  else
  {
    if (v9 != 2)
    {
      v8->_frameFeeder = 0;
      goto LABEL_16;
    }
    v12 = off_1E6DB2DA0;
  }
  uint64_t v13 = [objc_alloc(*v12) initWithPath:a3];
  v8->_frameFeeder = (VCCannedVideoFrameFeeder *)v13;
  if (!v13)
  {
LABEL_16:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:]();
      }
    }
    goto LABEL_19;
  }
  v8->_context.frameRate = 0;
  v8->_context.hostClock = CMClockGetHostTimeClock();
  pthread_mutex_init(&v8->_context.attributeMutex, 0);
  pthread_mutex_init(&v8->_context.frameRingBufferMutex, 0);
  pthread_mutex_init(&v8->_context.producerMutex, 0);
  pthread_cond_init(&v8->_context.producerConditional, 0);
  pthread_mutex_init(&v8->_context.consumerMutex, 0);
  pthread_cond_init(&v8->_context.consumerConditional, 0);
  v14 = (Frame *)malloc_type_calloc(0x10uLL, 0x10uLL, 0x1020040D5A9D86FuLL);
  v8->_context.frameRingBuffer = v14;
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:]();
      }
    }
    goto LABEL_19;
  }
  for (uint64_t i = 0; i != 256; i += 16)
    *(_DWORD *)((char *)v14 + i) = -1;
  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F47A30]) initWithObject:a4];
  v8->_weakCallbackContext = (VCWeakObjectHolder *)v16;
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoCaptureSource initWithVideo:callbackContext:frameCallback:].cold.4();
      }
    }
LABEL_19:

    return 0;
  }
  v8->_frameCallback = a5;
  v8->_stateLock._os_unfair_lock_opaque = 0;
  return v8;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(VCCannedVideoCaptureSource *)self stop];
  if (self->_context.frameRingBuffer)
  {
    for (uint64_t i = 8; i != 264; i += 16)
    {
      v4 = *(__CVBuffer **)((char *)self->_context.frameRingBuffer + i);
      if (v4) {
        CVPixelBufferRelease(v4);
      }
    }
    free(self->_context.frameRingBuffer);
  }
  pthread_mutex_destroy(&self->_context.attributeMutex);
  pthread_mutex_destroy(&self->_context.frameRingBufferMutex);
  pthread_mutex_destroy(&self->_context.producerMutex);
  pthread_cond_destroy(&self->_context.producerConditional);
  pthread_mutex_destroy(&self->_context.consumerMutex);
  pthread_cond_destroy(&self->_context.consumerConditional);

  v5.receiver = self;
  v5.super_class = (Class)VCCannedVideoCaptureSource;
  [(VCObject *)&v5 dealloc];
}

- (int)start
{
  v12[1] = *(const void **)MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_context.producerThreadCanceled = 0;
  if (!self->_context.producerThread)
  {
    v12[0] = @"com.apple.VideoConference.cannedvideocapture.producer";
    CFDictionaryRef v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F21EA8], v12, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    int v5 = FigThreadCreate();
    if (v4) {
      CFRelease(v4);
    }
    if (v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedVideoCaptureSource start]();
        }
      }
      goto LABEL_23;
    }
  }
  unsigned int v6 = 0;
  consumerThread = self->_context.consumerThread;
  self->_context.consumerThreadCanceled = 0;
  if (!consumerThread)
  {
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    int v9 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("ConsumerThreadHelperQueue", 0, CustomRootQueue);
    if (!v9)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCannedVideoCaptureSource start]();
        }
      }
      unsigned int v6 = 4;
      goto LABEL_11;
    }
    self->_context.helperQueue = v9;
    v12[0] = @"com.apple.VideoConference.cannedvideocapture.consumer";
    CFDictionaryRef v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], MEMORY[0x1E4F21EA8], v12, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    int v5 = FigThreadCreate();
    if (v10) {
      CFRelease(v10);
    }
    if (!v5)
    {
      unsigned int v6 = 0;
      goto LABEL_11;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCannedVideoCaptureSource start]();
      }
    }
LABEL_23:
    unsigned int v6 = v5 | 0xA01D0000;
    os_unfair_lock_unlock(p_stateLock);
    [(VCCannedVideoCaptureSource *)self stop];
    return v6;
  }
LABEL_11:
  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

- (int)stop
{
  v2 = self;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  p_context = &v2->_context;
  v2 = (VCCannedVideoCaptureSource *)((char *)v2 + 264);
  pthread_mutex_lock((pthread_mutex_t *)v2);
  p_context->producerThreadCanceled = 1;
  pthread_cond_signal(&p_context->producerConditional);
  pthread_mutex_unlock((pthread_mutex_t *)v2);
  pthread_mutex_lock(&p_context->consumerMutex);
  p_context->consumerThreadCanceled = 1;
  pthread_cond_signal(&p_context->consumerConditional);
  pthread_mutex_unlock(&p_context->consumerMutex);
  if (p_context->producerThread)
  {
    FigThreadJoin();
    p_context->producerThread = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      unsigned int v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315650;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCCannedVideoCaptureSource stop]";
        __int16 v14 = 1024;
        int v15 = 228;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Producer thread stopped!", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
  if (p_context->consumerThread)
  {
    FigThreadJoin();
    p_context->consumerThread = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315650;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        uint64_t v13 = "-[VCCannedVideoCaptureSource stop]";
        __int16 v14 = 1024;
        int v15 = 234;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Consumer thread stopped!", (uint8_t *)&v10, 0x1Cu);
      }
    }
  }
  os_unfair_lock_unlock(p_stateLock);
  return 0;
}

- (void)setFrameRate:(int)a3
{
}

- (int)frameRate
{
  return atomic_load((unsigned int *)&self->_context.frameRate);
}

- (void)setWidth:(int)a3 height:(int)a4
{
}

void ___VCCannedVideoCaptureSource_ConsumerThread_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 608) strong];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    CFDictionaryRef v4 = *(void (**)(uint64_t, uint64_t, CMTime *))(*(void *)(a1 + 32) + 616);
    CMTime v9 = *(CMTime *)(a1 + 48);
    v4(v2, v3, &v9);
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
  if (*(unsigned char *)(*(void *)(a1 + 32) + 624) && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unsigned int v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      CMTime v9 = *(CMTime *)(a1 + 48);
      Float64 Seconds = CMTimeGetSeconds(&v9);
      int v8 = *(_DWORD *)(a1 + 72);
      LODWORD(v9.value) = 136316162;
      *(CMTimeValue *)((char *)&v9.value + 4) = v5;
      LOWORD(v9.flags) = 2080;
      *(void *)((char *)&v9.flags + 2) = "_VCCannedVideoCaptureSource_ConsumerThread_block_invoke";
      HIWORD(v9.epoch) = 1024;
      int v10 = 450;
      __int16 v11 = 2048;
      Float64 v12 = Seconds;
      __int16 v13 = 1024;
      int v14 = v8;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Timestamp Alignment: Canned Replay Host Time = %f, Frame Index = %d", (uint8_t *)&v9, 0x2Cu);
    }
  }
}

- (void)initWithVideo:callbackContext:frameCallback:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize self", v2, v3, v4, v5, v6);
}

- (void)initWithVideo:callbackContext:frameCallback:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize frame feeder", v2, v3, v4, v5, v6);
}

- (void)initWithVideo:callbackContext:frameCallback:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Memory allocation for frameRingBuffer failed.", v2, v3, v4, v5, v6);
}

- (void)initWithVideo:callbackContext:frameCallback:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize weak callback context", v2, v3, v4, v5, v6);
}

- (void)start
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCCannedVideoCaptureSource start]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Producer Thread creation failed(%d)", v2, *(const char **)v3, (unint64_t)"-[VCCannedVideoCaptureSource start]" >> 16, 178);
}

@end