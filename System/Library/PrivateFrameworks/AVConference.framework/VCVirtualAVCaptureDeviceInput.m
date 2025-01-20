@interface VCVirtualAVCaptureDeviceInput
- (VCVirtualAVCaptureDeviceInput)initWithDevice:(id)a3 error:(id *)a4;
- (id)device;
- (id)ports;
- (void)dealloc;
- (void)disconnect;
@end

@implementation VCVirtualAVCaptureDeviceInput

- (VCVirtualAVCaptureDeviceInput)initWithDevice:(id)a3 error:(id *)a4
{
  v6 = [VCVirtualAVCaptureInputPort alloc];
  uint64_t v7 = [(VCVirtualAVCaptureInputPort *)v6 initWithDevice:self mediaType:*MEMORY[0x1E4F15C18]];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureDeviceInput initWithDevice:error:]();
      }
    }
    goto LABEL_15;
  }
  v8 = (void *)v7;
  self->_ports = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, 0);

  if (!self->_ports)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureDeviceInput initWithDevice:error:]();
      }
    }
    goto LABEL_15;
  }
  v9 = (VCVirtualAVCaptureDevice *)a3;
  self->_device = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureDeviceInput initWithDevice:error:]();
      }
    }
LABEL_15:

    return 0;
  }
  [(VCVirtualAVCaptureDevice *)v9 addDeviceInput:self];
  self->_stateLock._os_unfair_lock_opaque = 0;
  return self;
}

- (void)disconnect
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  ports = self->_ports;
  uint64_t v5 = [(NSArray *)ports countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(ports);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) disconnect];
      }
      uint64_t v6 = [(NSArray *)ports countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
  [(VCVirtualAVCaptureDevice *)self->_device removeDeviceInput:self];

  self->_device = 0;
  os_unfair_lock_unlock(p_stateLock);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCVirtualAVCaptureDeviceInput *)self disconnect];

  v3.receiver = self;
  v3.super_class = (Class)VCVirtualAVCaptureDeviceInput;
  [(AVCaptureDeviceInput *)&v3 dealloc];
}

- (id)ports
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v4 = self->_ports;
  os_unfair_lock_unlock(p_stateLock);

  return v4;
}

- (id)device
{
  return self->_device;
}

- (void)initWithDevice:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate input port", v2, v3, v4, v5, v6);
}

- (void)initWithDevice:error:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate ports array", v2, v3, v4, v5, v6);
}

- (void)initWithDevice:error:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Received nil device", v2, v3, v4, v5, v6);
}

@end