@interface VCVideoCaptureConverter
- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5;
- (BOOL)processFrame:(opaqueCMSampleBuffer *)a3;
- (VCVideoCaptureConverter)initWithConvertedFrameHandler:(void *)a3 context:(id)a4;
- (id)clientCaptureRule;
- (unsigned)destinationFramerate;
- (unsigned)sourceFramerate;
- (void)avConferencePreviewError:(id)a3;
- (void)dealloc;
- (void)setDestinationFramerate:(unsigned int)a3;
- (void)setSourceFramerate:(unsigned int)a3;
- (void)updateThrottleRate;
@end

@implementation VCVideoCaptureConverter

- (VCVideoCaptureConverter)initWithConvertedFrameHandler:(void *)a3 context:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)VCVideoCaptureConverter;
  v6 = [(VCVideoCaptureConverter *)&v20 init];
  v7 = v6;
  if (!v6) {
    return v7;
  }
  if (!a3)
  {
    if ((VCVideoCaptureConverter *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoCaptureConverter initWithConvertedFrameHandler:context:](v14);
        }
      }
      goto LABEL_27;
    }
    if (objc_opt_respondsToSelector()) {
      v12 = (__CFString *)[(VCVideoCaptureConverter *)v7 performSelector:sel_logPrefix];
    }
    else {
      v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_27;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v22 = v16;
    __int16 v23 = 2080;
    v24 = "-[VCVideoCaptureConverter initWithConvertedFrameHandler:context:]";
    __int16 v25 = 1024;
    int v26 = 33;
    __int16 v27 = 2112;
    v28 = v12;
    __int16 v29 = 2048;
    v30 = v7;
    v18 = " [%s] %s:%d %@(%p) Provided handler is NULL";
    goto LABEL_29;
  }
  if (!a4)
  {
    if ((VCVideoCaptureConverter *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCVideoCaptureConverter initWithConvertedFrameHandler:context:](v15);
        }
      }
      goto LABEL_27;
    }
    if (objc_opt_respondsToSelector()) {
      v13 = (__CFString *)[(VCVideoCaptureConverter *)v7 performSelector:sel_logPrefix];
    }
    else {
      v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v19 = VRTraceErrorLogLevelToCSTR(),
          v17 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_27:

      return 0;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v22 = v19;
    __int16 v23 = 2080;
    v24 = "-[VCVideoCaptureConverter initWithConvertedFrameHandler:context:]";
    __int16 v25 = 1024;
    int v26 = 34;
    __int16 v27 = 2112;
    v28 = v13;
    __int16 v29 = 2048;
    v30 = v7;
    v18 = " [%s] %s:%d %@(%p) Provided context is NULL";
LABEL_29:
    _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x30u);
    goto LABEL_27;
  }
  v6->_convertedFrameHandler = a3;
  objc_storeWeak(&v6->_convertedFrameHandlerContext, a4);
  v7->_lastDestinationFrameCount = -1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      convertedFrameHandlerContext = (VCVideoCaptureConverter *)v7->_convertedFrameHandlerContext;
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v8;
      __int16 v23 = 2080;
      v24 = "-[VCVideoCaptureConverter initWithConvertedFrameHandler:context:]";
      __int16 v25 = 1024;
      int v26 = 38;
      __int16 v27 = 2048;
      v28 = v7;
      __int16 v29 = 2048;
      v30 = convertedFrameHandlerContext;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p], convertedFrameHandlerContext=%p", buf, 0x30u);
    }
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_convertedFrameHandlerContext, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoCaptureConverter;
  [(VCVideoCaptureConverter *)&v3 dealloc];
}

- (void)setSourceFramerate:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_sourceFramerate == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int sourceFramerate = self->_sourceFramerate;
        int v10 = 136316162;
        uint64_t v11 = v4;
        __int16 v12 = 2080;
        v13 = "-[VCVideoCaptureConverter setSourceFramerate:]";
        __int16 v14 = 1024;
        int v15 = 56;
        __int16 v16 = 2048;
        v17 = self;
        __int16 v18 = 1024;
        unsigned int v19 = sourceFramerate;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p], Source frame rate is already at %u", (uint8_t *)&v10, 0x2Cu);
      }
    }
  }
  else
  {
    self->_unsigned int sourceFramerate = a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v9 = self->_sourceFramerate;
        int v10 = 136316162;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        v13 = "-[VCVideoCaptureConverter setSourceFramerate:]";
        __int16 v14 = 1024;
        int v15 = 59;
        __int16 v16 = 2048;
        v17 = self;
        __int16 v18 = 1024;
        unsigned int v19 = v9;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p], Source frame rate set to %u", (uint8_t *)&v10, 0x2Cu);
      }
    }
    [(VCVideoCaptureConverter *)self updateThrottleRate];
  }
}

- (void)setDestinationFramerate:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      int v10 = "-[VCVideoCaptureConverter setDestinationFramerate:]";
      __int16 v11 = 1024;
      int v12 = 65;
      __int16 v13 = 2048;
      __int16 v14 = self;
      __int16 v15 = 1024;
      unsigned int v16 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p], setting destination frame rate to %d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  self->_destinationFramerate = a3;
  [(VCVideoCaptureConverter *)self updateThrottleRate];
}

- (BOOL)processFrame:(opaqueCMSampleBuffer *)a3
{
  if (!self->_isThrottling) {
    return 1;
  }
  unsigned int sourceFrameCount = self->_sourceFrameCount;
  unsigned int v4 = sourceFrameCount + 1;
  unsigned int v5 = ((double)sourceFrameCount / self->_throttleRate);
  BOOL v6 = self->_lastDestinationFrameCount != v5;
  self->_unsigned int sourceFrameCount = v4;
  self->_lastDestinationFrameCount = v5;
  return v6;
}

- (void)updateThrottleRate
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unsigned int destinationFramerate = self->_destinationFramerate;
  unsigned int sourceFramerate = self->_sourceFramerate;
  if (sourceFramerate <= destinationFramerate)
  {
    BOOL v5 = 0;
  }
  else
  {
    self->_double throttleRate = (double)sourceFramerate / (double)destinationFramerate;
    BOOL v5 = 1;
  }
  self->_BOOL isThrottling = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = self->_destinationFramerate;
      unsigned int v8 = self->_sourceFramerate;
      double throttleRate = self->_throttleRate;
      BOOL isThrottling = self->_isThrottling;
      int v12 = 136316930;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCVideoCaptureConverter updateThrottleRate]";
      __int16 v16 = 1024;
      int v17 = 87;
      __int16 v18 = 2048;
      unsigned int v19 = self;
      __int16 v20 = 1024;
      unsigned int v21 = v8;
      __int16 v22 = 1024;
      unsigned int v23 = v9;
      __int16 v24 = 2048;
      double v25 = throttleRate;
      __int16 v26 = 1024;
      BOOL v27 = isThrottling;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%p], _sourceFramerate=%u, _destinationFramerate=%u, _throttleRate=%f, _isThrottling=%d", (uint8_t *)&v12, 0x42u);
    }
  }
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  return 0;
}

- (void)avConferencePreviewError:(id)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    BOOL v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCVideoCaptureConverter *)v4 avConferencePreviewError:v5];
    }
  }
}

- (id)clientCaptureRule
{
  return 0;
}

- (unsigned)sourceFramerate
{
  return self->_sourceFramerate;
}

- (unsigned)destinationFramerate
{
  return self->_destinationFramerate;
}

- (void)initWithConvertedFrameHandler:(uint64_t)a1 context:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 33;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Provided handler is NULL", (uint8_t *)&v2, 0x1Cu);
}

- (void)initWithConvertedFrameHandler:(uint64_t)a1 context:.cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 34;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Provided context is NULL", (uint8_t *)&v2, 0x1Cu);
}

- (void)avConferencePreviewError:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int v7 = "-[VCVideoCaptureConverter avConferencePreviewError:]";
  __int16 v8 = 1024;
  int v9 = 104;
  __int16 v10 = 2080;
  uint64_t v11 = [a2 UTF8String];
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d received an error %s", (uint8_t *)&v4, 0x26u);
}

@end