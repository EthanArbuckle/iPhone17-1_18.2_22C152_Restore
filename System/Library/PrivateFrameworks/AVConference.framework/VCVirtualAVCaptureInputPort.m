@interface VCVirtualAVCaptureInputPort
- (AVCaptureInput)input;
- (BOOL)isEqual:(id)a3;
- (NSString)mediaType;
- (OpaqueCMClock)clock;
- (VCVirtualAVCaptureInputPort)initWithDevice:(id)a3 mediaType:(id)a4;
- (id)connections;
- (void)addConnection:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)setClock:(OpaqueCMClock *)a3;
- (void)setInput:(id)a3;
- (void)setMediaType:(id)a3;
@end

@implementation VCVirtualAVCaptureInputPort

- (VCVirtualAVCaptureInputPort)initWithDevice:(id)a3 mediaType:(id)a4
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:]();
      }
    }
    goto LABEL_23;
  }
  v6 = (NSString *)[a4 copy];
  self->_mediaType = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:]();
      }
    }
    goto LABEL_23;
  }
  v7 = (VCWeakObjectHolder *)[objc_alloc(MEMORY[0x1E4F47A30]) initWithObject:a3];
  self->_input = v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:]();
      }
    }
    goto LABEL_23;
  }
  HostTimeClock = CMClockGetHostTimeClock();
  self->_clock = HostTimeClock;
  if (!HostTimeClock)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:].cold.4();
      }
    }
    goto LABEL_23;
  }
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_connections = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureInputPort initWithDevice:mediaType:].cold.5();
      }
    }
LABEL_23:

    return 0;
  }
  self->_stateLock._os_unfair_lock_opaque = 0;
  return self;
}

- (void)disconnect
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  connections = self->_connections;
  uint64_t v5 = [(NSMutableArray *)connections countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(connections);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 invalidate];
        }
      }
      uint64_t v6 = [(NSMutableArray *)connections countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  [(NSMutableArray *)self->_connections removeAllObjects];
  os_unfair_lock_unlock(p_stateLock);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCVirtualAVCaptureInputPort *)self disconnect];

  v3.receiver = self;
  v3.super_class = (Class)VCVirtualAVCaptureInputPort;
  [(AVCaptureInputPort *)&v3 dealloc];
}

- (void)addConnection:(id)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  [(NSMutableArray *)self->_connections addObject:a3];

  os_unfair_lock_unlock(p_stateLock);
}

- (id)connections
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v4 = self->_connections;
  os_unfair_lock_unlock(p_stateLock);

  return v4;
}

- (AVCaptureInput)input
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v4 = (AVCaptureInput *)[(VCWeakObjectHolder *)self->_input strong];
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (void)setInput:(id)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);

  self->_input = (VCWeakObjectHolder *)[objc_alloc(MEMORY[0x1E4F47A30]) initWithObject:a3];

  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [(NSString *)self->_mediaType isEqual:*((void *)a3 + 3)];
    if (v5) {
      LOBYTE(v5) = self->_input == (VCWeakObjectHolder *)*((void *)a3 + 2);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (OpaqueCMClock)clock
{
  return self->_clock;
}

- (void)setClock:(OpaqueCMClock *)a3
{
  self->_clock = a3;
}

- (void)initWithDevice:mediaType:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Received nil inputDevice", v2, v3, v4, v5, v6);
}

- (void)initWithDevice:mediaType:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Received nil media type", v2, v3, v4, v5, v6);
}

- (void)initWithDevice:mediaType:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate weak input device", v2, v3, v4, v5, v6);
}

- (void)initWithDevice:mediaType:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to get host time clock", v2, v3, v4, v5, v6);
}

- (void)initWithDevice:mediaType:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate connections array", v2, v3, v4, v5, v6);
}

@end