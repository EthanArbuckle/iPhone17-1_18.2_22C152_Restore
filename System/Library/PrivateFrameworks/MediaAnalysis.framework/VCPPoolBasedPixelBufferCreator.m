@interface VCPPoolBasedPixelBufferCreator
- (VCPPoolBasedPixelBufferCreator)initWithBufferWidth:(int64_t)a3 bufferHeight:(int64_t)a4 andPixelFormat:(unsigned int)a5;
- (id).cxx_construct;
- (int)_createPixelBufferPool:(__CVPixelBufferPool *)a3 withBufferWidth:(int64_t)a4 bufferHeight:(int64_t)a5 andPixelFormat:(unsigned int)a6;
- (int)createPixelBuffer:(__CVBuffer *)a3;
@end

@implementation VCPPoolBasedPixelBufferCreator

- (VCPPoolBasedPixelBufferCreator)initWithBufferWidth:(int64_t)a3 bufferHeight:(int64_t)a4 andPixelFormat:(unsigned int)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)VCPPoolBasedPixelBufferCreator;
  v8 = [(VCPPoolBasedPixelBufferCreator *)&v16 init];
  v9 = v8;
  if (!v8 || (v8->_int64_t bufferWidth = a3, v8->_bufferHeight = a4, v8->_pixelFormat = a5, a3) && a4 && a5)
  {
    v10 = v8;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int64_t bufferWidth = v9->_bufferWidth;
        int64_t bufferHeight = v9->_bufferHeight;
        unsigned int pixelFormat = v9->_pixelFormat;
        *(_DWORD *)buf = 67109632;
        int v18 = bufferWidth;
        __int16 v19 = 1024;
        int v20 = bufferHeight;
        __int16 v21 = 1024;
        unsigned int v22 = pixelFormat;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "invalid buffer size %dx%d or pixel format %u", buf, 0x14u);
      }
    }
    v10 = 0;
  }

  return v10;
}

- (int)_createPixelBufferPool:(__CVPixelBufferPool *)a3 withBufferWidth:(int64_t)a4 bufferHeight:(int64_t)a5 andPixelFormat:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  v15[4] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F24E10];
  v9 = [NSNumber numberWithInteger:a4];
  v15[0] = v9;
  v14[1] = *MEMORY[0x1E4F24D08];
  v10 = [NSNumber numberWithInteger:a5];
  v15[1] = v10;
  v14[2] = *MEMORY[0x1E4F24D70];
  v11 = [NSNumber numberWithUnsignedInt:v6];
  v14[3] = *MEMORY[0x1E4F24D20];
  v15[2] = v11;
  v15[3] = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];

  LODWORD(v9) = CVPixelBufferPoolCreate(0, 0, v12, a3);
  return (int)v9;
}

- (int)createPixelBuffer:(__CVBuffer *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  value = v4->_pool.value_;
  if (!value)
  {
    CVReturn PixelBuffer = [(VCPPoolBasedPixelBufferCreator *)v4 _createPixelBufferPool:&v4->_pool withBufferWidth:v4->_bufferWidth bufferHeight:v4->_bufferHeight andPixelFormat:v4->_pixelFormat];
    if (PixelBuffer) {
      goto LABEL_4;
    }
    value = v4->_pool.value_;
  }
  CVReturn PixelBuffer = CVPixelBufferPoolCreatePixelBuffer(0, value, a3);
LABEL_4:
  objc_sync_exit(v4);

  return PixelBuffer;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end