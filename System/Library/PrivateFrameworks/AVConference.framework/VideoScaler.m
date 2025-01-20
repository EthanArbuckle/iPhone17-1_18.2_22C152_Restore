@interface VideoScaler
- (VideoScaler)init;
- (int)convertAndScalePixelBuffer:(__CVBuffer *)a3 toWidth:(int)a4 toHeight:(int)a5 withPixelFormat:(unsigned int)a6 usingPixelBufferPool:(__CVPixelBufferPool *)a7 andStoreTo:(__CVBuffer *)a8;
- (void)dealloc;
@end

@implementation VideoScaler

- (VideoScaler)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VideoScaler;
  v2 = [(VideoScaler *)&v4 init];
  if (v2) {
    v2->_pixelTransferSession = objc_alloc_init(VCPixelTransferSession);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VideoScaler;
  [(VideoScaler *)&v3 dealloc];
}

- (int)convertAndScalePixelBuffer:(__CVBuffer *)a3 toWidth:(int)a4 toHeight:(int)a5 withPixelFormat:(unsigned int)a6 usingPixelBufferPool:(__CVPixelBufferPool *)a7 andStoreTo:(__CVBuffer *)a8
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a7, &pixelBufferOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VideoScaler convertAndScalePixelBuffer:toWidth:toHeight:withPixelFormat:usingPixelBufferPool:andStoreTo:](v13, v14);
      }
    }
    return 51;
  }
  else
  {
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24A90], (CFTypeRef)*MEMORY[0x1E4F24AB0], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE0], kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24C18], (CFTypeRef)*MEMORY[0x1E4F24C48], kCVAttachmentMode_ShouldPropagate);
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    int v15 = VCPixelTransferSession_TransferPixelBuffer((uint64_t)self->_pixelTransferSession, a3, pixelBufferOut);
    if (v15)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316930;
          uint64_t v23 = v19;
          __int16 v24 = 2080;
          v25 = "-[VideoScaler convertAndScalePixelBuffer:toWidth:toHeight:withPixelFormat:usingPixelBufferPool:andStoreTo:]";
          __int16 v26 = 1024;
          int v27 = 81;
          __int16 v28 = 1024;
          int v29 = v15;
          __int16 v30 = 2048;
          size_t v31 = Width;
          __int16 v32 = 2048;
          size_t v33 = Height;
          __int16 v34 = 1024;
          int v35 = a4;
          __int16 v36 = 1024;
          int v37 = a5;
          _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d VTPixelTransferSessionTransferImage failed %d input widthxheight(%zux%zu) new widthxheight(%dx%d)", buf, 0x42u);
        }
      }
    }
    else
    {
      *a8 = pixelBufferOut;
    }
  }
  return v15;
}

- (void)convertAndScalePixelBuffer:(uint64_t)a1 toWidth:(NSObject *)a2 toHeight:withPixelFormat:usingPixelBufferPool:andStoreTo:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VideoScaler convertAndScalePixelBuffer:toWidth:toHeight:withPixelFormat:usingPixelBufferPool:andStoreTo:]";
  __int16 v6 = 1024;
  int v7 = 54;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d CVPixelBufferPoolCreatePixelBuffer failed", (uint8_t *)&v2, 0x1Cu);
}

@end