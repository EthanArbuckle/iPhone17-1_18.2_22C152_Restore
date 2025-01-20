@interface VCEmulatedNetworkSingleQueue
- (VCEmulatedNetworkSingleQueue)initWithPolicies:(id)a3;
- (void)dealloc;
- (void)push:(id)a3;
- (void)runUntilTime:(double)a3;
@end

@implementation VCEmulatedNetworkSingleQueue

- (VCEmulatedNetworkSingleQueue)initWithPolicies:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCEmulatedNetworkSingleQueue;
  v4 = -[VCEmulatedNetwork initWithPolicies:](&v8, sel_initWithPolicies_);
  if (v4)
  {
    v5 = -[VCEmulatedNetworkQueue initWithPolicies:]([VCEmulatedNetworkQueue alloc], "initWithPolicies:", [a3 objectForKeyedSubscript:@"SingleQueueImpairments"]);
    v4->_networkQueue = v5;
    if (v5)
    {
      [(VCEmulatedNetworkElement *)v5 connectTo:v4->super._outputQueue];
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCEmulatedNetworkSingleQueue initWithPolicies:](v6);
        }
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkSingleQueue;
  [(VCEmulatedNetwork *)&v3 dealloc];
}

- (void)push:(id)a3
{
  if (-[VCEmulatedNetworkQueue write:](self->_networkQueue, "write:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCEmulatedNetworkSingleQueue push:](v4);
      }
    }
  }
  else
  {
    id pushCompletionHandler = self->super._pushCompletionHandler;
    if (pushCompletionHandler)
    {
      uint64_t v6 = (void (*)(void))*((void *)pushCompletionHandler + 2);
      v6();
    }
  }
}

- (void)runUntilTime:(double)a3
{
}

- (void)initWithPolicies:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 19;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot create network queue successfully!", (uint8_t *)&v2, 0x1Cu);
}

- (void)push:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 42;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to write to network queue", (uint8_t *)&v2, 0x1Cu);
}

@end