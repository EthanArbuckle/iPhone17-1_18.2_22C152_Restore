@interface VCPPreAnalysisImageEntry
- (VCPPreAnalysisImageEntry)initWithPixelBuffer:(__CVBuffer *)a3;
- (__CVBuffer)pixelBuffer;
- (id).cxx_construct;
- (unint64_t)count;
- (void)dealloc;
- (void)setCount:(unint64_t)a3;
@end

@implementation VCPPreAnalysisImageEntry

- (VCPPreAnalysisImageEntry)initWithPixelBuffer:(__CVBuffer *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VCPPreAnalysisImageEntry;
  v4 = [(VCPPreAnalysisImageEntry *)&v7 init];
  if (v4)
  {
    CFTypeRef v6 = CFRetain(a3);
    CF<__CVBuffer *>::operator=((const void **)&v4->_pixelBuffer.value_, &v6);
    CF<opaqueCMSampleBuffer *>::~CF(&v6);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_count && (int)MediaAnalysisLogLevel() >= 4)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int Width = CVPixelBufferGetWidth(self->_pixelBuffer.value_);
      int Height = CVPixelBufferGetHeight(self->_pixelBuffer.value_);
      *(_DWORD *)buf = 67109376;
      int v8 = Width;
      __int16 v9 = 1024;
      int v10 = Height;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_DEFAULT, "[PreAnalysis] Pre-warmed image unused (%dx%d)", buf, 0xEu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)VCPPreAnalysisImageEntry;
  [(VCPPreAnalysisImageEntry *)&v6 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer.value_;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
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