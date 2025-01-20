@interface VCVirtualAVCaptureConnection
- (BOOL)active;
- (BOOL)isActive;
- (BOOL)isVideoRetainedBufferCountHintSupported;
- (VCVirtualAVCaptureConnection)initWithInputPorts:(id)a3 output:(id)a4;
- (id)inputPorts;
- (id)output;
- (int)videoRetainedBufferCountHint;
- (void)dealloc;
- (void)invalidate;
- (void)setActive:(BOOL)a3;
- (void)setVideoRetainedBufferCountHint:(int)a3;
- (void)setVideoRetainedBufferCountHintSupported:(BOOL)a3;
@end

@implementation VCVirtualAVCaptureConnection

- (VCVirtualAVCaptureConnection)initWithInputPorts:(id)a3 output:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v7 = (AVCaptureOutput *)a4;
  self->_output = v7;
  if (v7)
  {
    v8 = (NSArray *)[a3 copy];
    self->_ports = v8;
    if (v8)
    {
      self->_stateLock._os_unfair_lock_opaque = 0;
      v10.receiver = self;
      v10.super_class = (Class)VCVirtualAVCaptureConnection;
      result = [(AVCaptureConnection *)&v10 initWithInputPorts:a3 output:a4];
      if (result)
      {
        result->_videoRetainedBufferCountHintSupported = 1;
        result->_active = 1;
        return result;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVirtualAVCaptureConnection initWithInputPorts:output:]();
        }
      }
      self = 0;
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureConnection initWithInputPorts:output:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCVirtualAVCaptureConnection initWithInputPorts:output:]();
    }
  }

  return 0;
}

- (void)invalidate
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_active = 0;

  self->_output = 0;
  self->_ports = 0;

  os_unfair_lock_unlock(p_stateLock);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCVirtualAVCaptureConnection *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VCVirtualAVCaptureConnection;
  [(AVCaptureConnection *)&v3 dealloc];
}

- (id)inputPorts
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v4 = self->_ports;
  os_unfair_lock_unlock(p_stateLock);

  return v4;
}

- (id)output
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  uint64_t v4 = self->_output;
  os_unfair_lock_unlock(p_stateLock);

  return v4;
}

- (BOOL)active
{
  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_active;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isVideoRetainedBufferCountHintSupported
{
  return self->_videoRetainedBufferCountHintSupported;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)setVideoRetainedBufferCountHintSupported:(BOOL)a3
{
  self->_videoRetainedBufferCountHintSupported = a3;
}

- (int)videoRetainedBufferCountHint
{
  return self->_videoRetainedBufferCountHint;
}

- (void)setVideoRetainedBufferCountHint:(int)a3
{
  self->_videoRetainedBufferCountHint = a3;
}

- (void)initWithInputPorts:output:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Received nil capture output", v2, v3, v4, v5, v6);
}

- (void)initWithInputPorts:output:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Received nil input port", v2, v3, v4, v5, v6);
}

- (void)initWithInputPorts:output:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init superclass", v2, v3, v4, v5, v6);
}

@end