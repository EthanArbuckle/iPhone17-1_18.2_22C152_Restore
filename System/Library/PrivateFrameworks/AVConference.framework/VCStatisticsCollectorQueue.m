@interface VCStatisticsCollectorQueue
- (BOOL)isThreadRunning;
- (VCStatisticsCollectorQueue)initWithQueueSize:(int)a3 shouldBlockWhenFull:(BOOL)a4 queueWaitTimeMs:(unsigned int)a5 useExternalThread:(BOOL)a6;
- (id)messageHandler;
- (void)dealloc;
- (void)setMessageHandler:(id)a3;
- (void)start;
- (void)stop;
- (void)stopThread;
@end

@implementation VCStatisticsCollectorQueue

- (VCStatisticsCollectorQueue)initWithQueueSize:(int)a3 shouldBlockWhenFull:(BOOL)a4 queueWaitTimeMs:(unsigned int)a5 useExternalThread:(BOOL)a6
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCStatisticsCollectorQueue;
  v10 = [(VCStatisticsCollectorQueue *)&v14 init];
  v11 = v10;
  if (!v10) {
    return v11;
  }
  v10->_maxQueueSize = a3;
  if (a3 > 300)
  {
    a3 = 300;
LABEL_6:
    v10->_maxQueueSize = a3;
    goto LABEL_7;
  }
  if (a3 <= 1)
  {
    a3 = 2;
    goto LABEL_6;
  }
LABEL_7:
  v10->_queueProcessWaitTimeMs = a5;
  v10->_shouldProcessMessageImmediately = a5 == 0;
  v10->_shouldProcessMessageOnExternalThread = a6;
  int v12 = (int)((double)a3 * 0.75);
  if (!v12) {
    int v12 = a3;
  }
  v10->_almostFullQueueSize = v12;
  v10->_shouldBlockWhenFull = a4 & ~a6;
  v10->_isThreadRunning = 0;
  *(void *)&v10->_firstMessageIndex = 0;
  pthread_mutex_init(&v10->_queueMutex, 0);
  pthread_cond_init(&v11->_queueNotFullCondition, 0);
  pthread_cond_init(&v11->_queueNotEmptyCondition, 0);
  pthread_mutex_init(&v11->_waitMutex, 0);
  pthread_cond_init(&v11->_waitCondition, 0);
  return v11;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "-[VCStatisticsCollectorQueue dealloc]";
      __int16 v10 = 1024;
      int v11 = 87;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d dealloc called", buf, 0x1Cu);
    }
  }
  _Block_release(self->_messageHandler);
  pthread_mutex_destroy(&self->_queueMutex);
  pthread_cond_destroy(&self->_queueNotFullCondition);
  pthread_cond_destroy(&self->_queueNotEmptyCondition);
  pthread_mutex_destroy(&self->_waitMutex);
  pthread_cond_destroy(&self->_waitCondition);
  v5.receiver = self;
  v5.super_class = (Class)VCStatisticsCollectorQueue;
  [(VCStatisticsCollectorQueue *)&v5 dealloc];
}

- (void)start
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  objc_super v5 = "-[VCStatisticsCollectorQueue start]";
  __int16 v6 = 1024;
  int v7 = 113;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, "VCRC [%s] %s:%d VCRateControlStatisticsProc thread create failed (%d)", v3, 0x22u);
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_thread)
  {
    [(VCStatisticsCollectorQueue *)self stopThread];
    FigThreadJoin();
    self->_thread = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      __int16 v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        uint64_t v10 = "-[VCStatisticsCollectorQueue stop]";
        __int16 v11 = 1024;
        int v12 = 128;
        objc_super v5 = "VCRC [%s] %s:%d VCRateControlStatisticsProc thread ended";
LABEL_8:
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    __int16 v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v8 = v6;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCStatisticsCollectorQueue stop]";
      __int16 v11 = 1024;
      int v12 = 121;
      objc_super v5 = "VCRC [%s] %s:%d Stop VCStatisticsCollectorQueue without VCRateControlStatisticsProc thread";
      goto LABEL_8;
    }
  }
}

- (void)stopThread
{
  p_firstMessageIndex = &self->_firstMessageIndex;
  p_queueMutex = &self->_queueMutex;
  pthread_mutex_lock(&self->_queueMutex);
  self->_isThreadRunning = 0;
  *(void *)p_firstMessageIndex = 0;
  if (self->_shouldBlockWhenFull || *((unsigned char *)p_firstMessageIndex + 297))
  {
    pthread_cond_signal(&self->_queueNotEmptyCondition);
  }
  else
  {
    pthread_mutex_lock(&self->_waitMutex);
    pthread_cond_signal(&self->_waitCondition);
    pthread_mutex_unlock(&self->_waitMutex);
  }

  pthread_mutex_unlock(p_queueMutex);
}

- (BOOL)isThreadRunning
{
  return self->_isThreadRunning;
}

- (id)messageHandler
{
  return objc_getProperty(self, a2, 60040, 1);
}

- (void)setMessageHandler:(id)a3
{
}

@end