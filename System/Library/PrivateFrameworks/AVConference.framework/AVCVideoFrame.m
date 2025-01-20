@interface AVCVideoFrame
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (AVCVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 depthPixelBuffer:(__CVBuffer *)a4 time:(id *)a5 imageData:(id)a6 delegate:(id)a7;
- (AVCVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 time:(id *)a4 imageData:(id)a5;
- (NSData)effectsMetadata;
- (NSData)imageData;
- (__CVBuffer)depthPixelBuffer;
- (__CVBuffer)pixelBuffer;
- (float)renderProcessTime;
- (id)delegate;
- (void)dealloc;
- (void)setDepthPixelBuffer:(__CVBuffer *)a3;
- (void)setEffectsMetadata:(id)a3;
- (void)setImageData:(id)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setRenderProcessTime:(float)a3;
- (void)setTime:(id *)a3;
@end

@implementation AVCVideoFrame

- (AVCVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 time:(id *)a4 imageData:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)AVCVideoFrame;
  v8 = [(AVCVideoFrame *)&v11 init];
  if (v8)
  {
    *((void *)v8 + 1) = CVPixelBufferRetain(a3);
    int64_t var3 = a4->var3;
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&a4->var0;
    *((void *)v8 + 5) = var3;
    *((void *)v8 + 6) = a5;
    *((_DWORD *)v8 + 16) = 0;
  }
  return (AVCVideoFrame *)v8;
}

- (AVCVideoFrame)initWithPixelBuffer:(__CVBuffer *)a3 depthPixelBuffer:(__CVBuffer *)a4 time:(id *)a5 imageData:(id)a6 delegate:(id)a7
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a5;
  v9 = [(AVCVideoFrame *)self initWithPixelBuffer:a3 time:&v11 imageData:a6];
  if (v9)
  {
    v9->_depthPixelBuffer = CVPixelBufferRetain(a4);
    objc_storeWeak(&v9->_delegate, a7);
  }
  return v9;
}

- (void)setDepthPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    v7 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        uint64_t v12 = "-[AVCVideoFrame setDepthPixelBuffer:]";
        __int16 v13 = 1024;
        int v14 = 47;
        __int16 v15 = 2112;
        v16 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d depthPixelBuffer=%@", (uint8_t *)&v9, 0x26u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[AVCVideoFrame setDepthPixelBuffer:]();
    }
  }
  depthPixelBuffer = self->_depthPixelBuffer;
  if (depthPixelBuffer)
  {
    CVPixelBufferRelease(depthPixelBuffer);
    self->_depthPixelBuffer = 0;
  }
  if (a3) {
    self->_depthPixelBuffer = CVPixelBufferRetain(a3);
  }
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    v7 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        uint64_t v12 = "-[AVCVideoFrame setPixelBuffer:]";
        __int16 v13 = 1024;
        int v14 = 59;
        __int16 v15 = 2112;
        v16 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d pixelBuffer=%@", (uint8_t *)&v9, 0x26u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[AVCVideoFrame setPixelBuffer:]();
    }
  }
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  if (a3) {
    self->_pixelBuffer = CVPixelBufferRetain(a3);
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[AVCVideoFrame dealloc]";
  __int16 v6 = 1024;
  int v7 = 71;
  _os_log_debug_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d ", (uint8_t *)&v2, 0x1Cu);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (void)setTime:(id *)a3
{
}

- (NSData)imageData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setImageData:(id)a3
{
}

- (NSData)effectsMetadata
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEffectsMetadata:(id)a3
{
}

- (float)renderProcessTime
{
  return self->_renderProcessTime;
}

- (void)setRenderProcessTime:(float)a3
{
  self->_renderProcessTime = a3;
}

- (__CVBuffer)depthPixelBuffer
{
  return self->_depthPixelBuffer;
}

- (void)setDepthPixelBuffer:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d depthPixelBuffer=%@");
}

- (void)setPixelBuffer:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d pixelBuffer=%@");
}

@end