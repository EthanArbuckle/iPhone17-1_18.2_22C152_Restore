@interface VCEmulatedNetwork
- (VCEmulatedNetwork)initWithPolicies:(id)a3;
- (id)copyPacketFromPop;
- (id)popCompletionHandler;
- (id)pushCompletionHandler;
- (unsigned)numberOfPacketsWaitingInOutputQueue;
- (void)dealloc;
- (void)push:(id)a3;
- (void)setPopCompletionHandler:(id)a3;
- (void)setPushCompletionHandler:(id)a3;
@end

@implementation VCEmulatedNetwork

- (VCEmulatedNetwork)initWithPolicies:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCEmulatedNetwork;
  v4 = [(VCEmulatedNetwork *)&v9 init];
  if (v4)
  {
    v4->_policies = (NSDictionary *)a3;
    v5 = [(VCEmulatedNetworkElement *)[VCEmulatedOutputQueue alloc] initWithPolicies:0];
    v4->_outputQueue = v5;
    if (!v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCEmulatedNetwork initWithPolicies:](v6, v7);
        }
      }

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];

  id pushCompletionHandler = self->_pushCompletionHandler;
  if (pushCompletionHandler) {
    _Block_release(pushCompletionHandler);
  }
  id popCompletionHandler = self->_popCompletionHandler;
  if (popCompletionHandler) {
    _Block_release(popCompletionHandler);
  }

  v5.receiver = self;
  v5.super_class = (Class)VCEmulatedNetwork;
  [(VCEmulatedNetwork *)&v5 dealloc];
}

- (void)push:(id)a3
{
  -[VCEmulatedNetworkElement write:](self->_outputQueue, "write:");
  id pushCompletionHandler = self->_pushCompletionHandler;
  if (pushCompletionHandler)
  {
    objc_super v5 = (void (*)(void))*((void *)pushCompletionHandler + 2);
    v5();
  }
}

- (id)copyPacketFromPop
{
  if (![(VCEmulatedNetwork *)self numberOfPacketsWaitingInOutputQueue]) {
    return 0;
  }
  id v3 = [(VCEmulatedOutputQueue *)self->_outputQueue copyPacketFromPop];
  id popCompletionHandler = (void (**)(id, id))self->_popCompletionHandler;
  if (popCompletionHandler) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    popCompletionHandler[2](popCompletionHandler, v3);
  }
  return v3;
}

- (unsigned)numberOfPacketsWaitingInOutputQueue
{
  unsigned int result = [(VCEmulatedOutputQueue *)self->_outputQueue numberOfPacketsInOutputQueue];
  self->_numberOfPacketsWaitingInOutputQueue = result;
  return result;
}

- (id)pushCompletionHandler
{
  return self->_pushCompletionHandler;
}

- (void)setPushCompletionHandler:(id)a3
{
}

- (id)popCompletionHandler
{
  return self->_popCompletionHandler;
}

- (void)setPopCompletionHandler:(id)a3
{
}

- (void)initWithPolicies:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  BOOL v5 = "-[VCEmulatedNetwork initWithPolicies:]";
  __int16 v6 = 1024;
  int v7 = 22;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot create output queue successfully!", (uint8_t *)&v2, 0x1Cu);
}

@end