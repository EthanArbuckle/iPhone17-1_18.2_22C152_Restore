@interface VCEmulatedNetworkElement
- (VCEmulatedNetworkElement)initWithPolicies:(id)a3;
- (id)processCompleteHandler;
- (int)write:(id)a3;
- (void)connectFrom:(id)a3;
- (void)connectTo:(id)a3;
- (void)dealloc;
- (void)drainAndReleasePackets;
- (void)runUntilTime:(double)a3;
- (void)setProcessCompleteHandler:(id)a3;
@end

@implementation VCEmulatedNetworkElement

- (VCEmulatedNetworkElement)initWithPolicies:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCEmulatedNetworkElement;
  v4 = [(VCEmulatedNetworkElement *)&v6 init];
  if (v4)
  {
    if (CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 4096, &v4->_networkElementQueue))
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCEmulatedNetworkElement initWithPolicies:]();
        }
      }
      return 0;
    }
    else
    {
      v4->_policies = (NSDictionary *)a3;
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(VCEmulatedNetworkElement *)self setProcessCompleteHandler:0];

  [(VCEmulatedNetworkElement *)self drainAndReleasePackets];
  networkElementQueue = self->_networkElementQueue;
  if (networkElementQueue) {
    CFRelease(networkElementQueue);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCEmulatedNetworkElement;
  [(VCEmulatedNetworkElement *)&v4 dealloc];
}

- (void)drainAndReleasePackets
{
  networkElementQueue = self->_networkElementQueue;
  if (networkElementQueue && CMSimpleQueueGetCount(networkElementQueue) >= 1)
  {
    do

    while (CMSimpleQueueGetCount(self->_networkElementQueue) > 0);
  }
}

- (int)write:(id)a3
{
  int result = CMSimpleQueueEnqueue(self->_networkElementQueue, a3);
  if (result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCEmulatedNetworkElement write:]();
      }
    }

    return -1;
  }
  return result;
}

- (void)runUntilTime:(double)a3
{
  if (CMSimpleQueueGetCount(self->_networkElementQueue) >= 1)
  {
    do
    {
      objc_super v4 = (void *)CMSimpleQueueDequeue(self->_networkElementQueue);
      processCompleteHandler = (void (**)(id, void *))self->_processCompleteHandler;
      if (processCompleteHandler) {
        processCompleteHandler[2](processCompleteHandler, v4);
      }
    }
    while (CMSimpleQueueGetCount(self->_networkElementQueue) > 0);
  }
}

- (void)connectTo:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  if (a3 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCEmulatedNetworkElement connectTo:]();
      }
    }
  }
  else
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __38__VCEmulatedNetworkElement_connectTo___block_invoke;
    v3[3] = &unk_1E6DB5F68;
    v3[4] = a3;
    [(VCEmulatedNetworkElement *)self setProcessCompleteHandler:v3];
  }
}

uint64_t __38__VCEmulatedNetworkElement_connectTo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) write:a2];
}

- (void)connectFrom:(id)a3
{
  v3[5] = *MEMORY[0x1E4F143B8];
  if (a3 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCEmulatedNetworkElement connectFrom:]();
      }
    }
  }
  else
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __40__VCEmulatedNetworkElement_connectFrom___block_invoke;
    v3[3] = &unk_1E6DB5F68;
    v3[4] = self;
    [a3 setProcessCompleteHandler:v3];
  }
}

uint64_t __40__VCEmulatedNetworkElement_connectFrom___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) write:a2];
}

- (id)processCompleteHandler
{
  return self->_processCompleteHandler;
}

- (void)setProcessCompleteHandler:(id)a3
{
}

- (void)initWithPolicies:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot create network element queue successfully!", v2, v3, v4, v5, v6);
}

- (void)write:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCEmulatedNetworkElement write:]";
  __int16 v6 = 1024;
  int v7 = 49;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to enqueue! status: %d", v3, 0x22u);
}

- (void)connectTo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d A network element cannot connect to itself!", v2, v3, v4, v5, v6);
}

- (void)connectFrom:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d A network element cannot connect to itself!", v2, v3, v4, v5, v6);
}

@end