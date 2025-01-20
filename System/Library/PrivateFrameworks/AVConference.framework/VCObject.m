@interface VCObject
+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5;
- (NSString)logPrefix;
- (VCObject)init;
- (opaqueRTCReporting)reportingAgent;
- (void)dealloc;
- (void)lock;
- (void)setLogPrefix:(id)a3;
- (void)setReportingAgent:(opaqueRTCReporting *)a3;
- (void)startDeallocTimer;
- (void)startDeallocTimerWithTimeout:(unsigned int)a3;
- (void)startTerminationTimer:(unsigned int)a3 terminationType:(int)a4;
- (void)startTimeoutTimer;
- (void)stopTerminationTimer;
- (void)unlock;
@end

@implementation VCObject

- (VCObject)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCObject;
  v2 = [(VCObject *)&v5 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->_mutex, 0);
    pthread_mutex_init(&v3->_timeoutMutex, 0);
    v3->_logPrefix = (NSString *)objc_alloc_init(NSString);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCObject *)self stopTerminationTimer];

  FigCFWeakReferenceStore();
  pthread_mutex_destroy(&self->_mutex);
  pthread_mutex_destroy(&self->_timeoutMutex);
  v3.receiver = self;
  v3.super_class = (Class)VCObject;
  [(VCObject *)&v3 dealloc];
}

- (void)lock
{
}

- (void)unlock
{
}

- (opaqueRTCReporting)reportingAgent
{
  return (opaqueRTCReporting *)self->_reportingAgent;
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  self->_reportingAgent = a3;

  uint64_t v4 = a3;
}

- (void)startDeallocTimer
{
}

- (void)startDeallocTimerWithTimeout:(unsigned int)a3
{
}

- (void)startTimeoutTimer
{
}

- (void)startTerminationTimer:(unsigned int)a3 terminationType:(int)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!VCDefaults_GetBoolValueForKey(@"skipTerminationTimer", 0))
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v9 = [NSString stringWithFormat:@"%@(%p) Timeout=%d", v8, self, v5];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        v24 = "-[VCObject startTerminationTimer:terminationType:]";
        __int16 v25 = 1024;
        int v26 = 112;
        __int16 v27 = 2112;
        uint64_t v28 = v9;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@. Starting timer", buf, 0x26u);
      }
    }
    p_timeoutMutex = &self->_timeoutMutex;
    pthread_mutex_lock(&self->_timeoutMutex);
    if (self->_timeoutTimer)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCObject startTerminationTimer:terminationType:](v13, v9, v14);
        }
      }
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self->_reportingAgent];
      uint64_t v16 = objc_opt_class();
      v17 = [VCDispatchTimer alloc];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __50__VCObject_startTerminationTimer_terminationType___block_invoke;
      v19[3] = &unk_1E6DB9CA0;
      int v20 = a4;
      v19[4] = v9;
      v19[5] = v15;
      v19[6] = v16;
      v19[7] = v8;
      v18 = [(VCDispatchTimer *)v17 initWithIntervalSeconds:v5 callbackBlock:v19];
      self->_timeoutTimer = v18;
      [(VCDispatchTimer *)v18 start];
    }
    pthread_mutex_unlock(p_timeoutMutex);
  }
}

uint64_t __50__VCObject_startTerminationTimer_terminationType___block_invoke(uint64_t a1)
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if (VRTraceIsOSFaultDisabled())
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __50__VCObject_startTerminationTimer_terminationType___block_invoke_cold_1();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_FAULT))
    {
      __50__VCObject_startTerminationTimer_terminationType___block_invoke_cold_2();
    }
  }
  return [*(id *)(a1 + 48) terminateProcess:objc_msgSend(NSString, "stringWithFormat:", @"Termination Timeout - %@ type=%d", *(void *)(a1 + 32), *(unsigned int *)(a1 + 64)), *(void *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "strong") terminateSource agent];
}

- (void)stopTerminationTimer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_timeoutMutex = &self->_timeoutMutex;
  pthread_mutex_lock(&self->_timeoutMutex);
  if (self->_timeoutTimer)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = (objc_class *)objc_opt_class();
        int v7 = 136316162;
        uint64_t v8 = v4;
        __int16 v9 = 2080;
        uint64_t v10 = "-[VCObject stopTerminationTimer]";
        __int16 v11 = 1024;
        int v12 = 136;
        __int16 v13 = 2112;
        v14 = NSStringFromClass(v6);
        __int16 v15 = 2048;
        uint64_t v16 = self;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@(%p). Stopping timer", (uint8_t *)&v7, 0x30u);
      }
    }
    [(VCDispatchTimer *)self->_timeoutTimer stop];

    self->_timeoutTimer = 0;
    pthread_mutex_unlock(p_timeoutMutex);
  }
  else
  {
    pthread_mutex_unlock(p_timeoutMutex);
  }
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
}

- (NSString)logPrefix
{
  return self->_logPrefix;
}

- (void)setLogPrefix:(id)a3
{
}

- (void)startTerminationTimer:(NSObject *)a3 terminationType:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)objc_super v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCObject startTerminationTimer:terminationType:]";
  *(_WORD *)&v3[22] = 1024;
  LODWORD(v4) = 115;
  WORD2(v4) = 2112;
  *(void *)((char *)&v4 + 6) = a2;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, a2, a3, " [%s] %s:%d %@. VCDispatchTimer is already active", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], v4, *MEMORY[0x1E4F143B8]);
}

void __50__VCObject_startTerminationTimer_terminationType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d %@. Timeout triggered. Terminating process ...");
}

void __50__VCObject_startTerminationTimer_terminationType___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_6();
  _os_log_fault_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@. Timeout triggered. Terminating process ...", v1, 0x26u);
}

@end