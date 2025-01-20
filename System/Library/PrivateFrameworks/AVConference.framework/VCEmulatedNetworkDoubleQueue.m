@interface VCEmulatedNetworkDoubleQueue
- (VCEmulatedNetworkDoubleQueue)initWithPolicies:(id)a3;
- (void)dealloc;
- (void)push:(id)a3;
- (void)runUntilTime:(double)a3;
@end

@implementation VCEmulatedNetworkDoubleQueue

- (VCEmulatedNetworkDoubleQueue)initWithPolicies:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)VCEmulatedNetworkDoubleQueue;
  v4 = -[VCEmulatedNetwork initWithPolicies:](&v14, sel_initWithPolicies_);
  if (v4)
  {
    v5 = (void *)[a3 objectForKeyedSubscript:@"DoubleQueueImpairments"];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"QueueAImpairments"];
    uint64_t v7 = [v5 objectForKeyedSubscript:@"QueueBImpairments"];
    v4->_networkQueueA = [[VCEmulatedNetworkQueue alloc] initWithPolicies:v6];
    v8 = [[VCEmulatedNetworkQueue alloc] initWithPolicies:v7];
    v4->_networkQueueB = v8;
    networkQueueA = v4->_networkQueueA;
    if (networkQueueA) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCEmulatedNetworkDoubleQueue initWithPolicies:](v11, v12);
        }
      }

      return 0;
    }
    else
    {
      [(VCEmulatedNetworkElement *)networkQueueA connectTo:v4->super._outputQueue];
      [(VCEmulatedNetworkElement *)v4->_networkQueueB connectTo:v4->super._outputQueue];
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCEmulatedNetworkDoubleQueue;
  [(VCEmulatedNetwork *)&v3 dealloc];
}

- (void)push:(id)a3
{
  char v5 = [a3 packetID];
  uint64_t v6 = &OBJC_IVAR___VCEmulatedNetworkDoubleQueue__networkQueueA;
  if ((v5 & 1) == 0) {
    uint64_t v6 = &OBJC_IVAR___VCEmulatedNetworkDoubleQueue__networkQueueB;
  }
  if ([*(id *)((char *)&self->super.super.isa + *v6) write:a3])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        [(VCEmulatedNetworkDoubleQueue *)v7 push:v8];
      }
    }
  }
  else
  {
    id pushCompletionHandler = self->super._pushCompletionHandler;
    if (pushCompletionHandler)
    {
      BOOL v10 = (void (*)(void))*((void *)pushCompletionHandler + 2);
      v10();
    }
  }
}

- (void)runUntilTime:(double)a3
{
  -[VCEmulatedNetworkQueue runUntilTime:](self->_networkQueueA, "runUntilTime:");
  networkQueueB = self->_networkQueueB;

  [(VCEmulatedNetworkQueue *)networkQueueB runUntilTime:a3];
}

- (void)initWithPolicies:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  char v5 = "-[VCEmulatedNetworkDoubleQueue initWithPolicies:]";
  __int16 v6 = 1024;
  int v7 = 21;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot create network queue(s) successfully!", (uint8_t *)&v2, 0x1Cu);
}

- (void)push:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = 136315906;
  if ([a2 packetID]) {
    int v5 = 65;
  }
  else {
    int v5 = 66;
  }
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  v9 = "-[VCEmulatedNetworkDoubleQueue push:]";
  __int16 v10 = 1024;
  int v11 = 50;
  __int16 v12 = 1024;
  int v13 = v5;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to write to network queue %c", (uint8_t *)&v6, 0x22u);
}

@end