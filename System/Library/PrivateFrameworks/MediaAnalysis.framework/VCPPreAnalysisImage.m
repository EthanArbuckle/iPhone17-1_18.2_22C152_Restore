@interface VCPPreAnalysisImage
- (VCPPreAnalysisImage)initWithPixelBuffer:(__CVBuffer *)a3;
- (__CVBuffer)sourcePixelBuffer;
- (id).cxx_construct;
- (int)pixelBuffer:(__CVBuffer *)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (int)preWarmWidth:(unint64_t)a3 andHeight:(unint64_t)a4;
@end

@implementation VCPPreAnalysisImage

- (VCPPreAnalysisImage)initWithPixelBuffer:(__CVBuffer *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VCPPreAnalysisImage;
  v4 = [(VCPPreAnalysisImage *)&v13 init];
  if (v4)
  {
    CFTypeRef v12 = CFRetain(a3);
    CF<__CVBuffer *>::operator=((const void **)&v4->_sourcePixelBuffer.value_, &v12);
    CF<opaqueCMSampleBuffer *>::~CF(&v12);
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    scaledPixelBuffers = v4->_scaledPixelBuffers;
    v4->_scaledPixelBuffers = (NSMutableDictionary *)v5;

    v7 = (void *)MEMORY[0x1E4F29238];
    size_t Width = CVPixelBufferGetWidth(a3);
    v9 = objc_msgSend(v7, "valueWithSize:", (double)Width, (double)CVPixelBufferGetHeight(a3));
    v10 = [[VCPPreAnalysisImageEntry alloc] initWithPixelBuffer:v4->_sourcePixelBuffer.value_];
    [(VCPPreAnalysisImageEntry *)v10 setCount:1];
    [(NSMutableDictionary *)v4->_scaledPixelBuffers setObject:v10 forKeyedSubscript:v9];
  }
  return v4;
}

- (__CVBuffer)sourcePixelBuffer
{
  return self->_sourcePixelBuffer.value_;
}

- (int)preWarmWidth:(unint64_t)a3 andHeight:(unint64_t)a4
{
  v6 = self;
  objc_sync_enter(v6);
  v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", (double)a3, (double)a4);
  v8 = [(NSMutableDictionary *)v6->_scaledPixelBuffers objectForKeyedSubscript:v7];
  if (!v8)
  {
    CFTypeRef cf = 0;
    v10 = +[VCPSceneProcessingImageManager imageManager];
    int v9 = [v10 scalePixelBuffer:v6->_sourcePixelBuffer.value_ toPixelBuffer:&cf width:a3 height:a4];

    if (v9)
    {
      CF<opaqueCMSampleBuffer *>::~CF(&cf);
      goto LABEL_5;
    }
    CFTypeRef v12 = [VCPPreAnalysisImageEntry alloc];
    objc_super v13 = [(VCPPreAnalysisImageEntry *)v12 initWithPixelBuffer:cf];
    [(NSMutableDictionary *)v6->_scaledPixelBuffers setObject:v13 forKeyedSubscript:v7];

    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
  int v9 = 0;
LABEL_5:

  objc_sync_exit(v6);
  return v9;
}

- (int)pixelBuffer:(__CVBuffer *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v8 = self;
  objc_sync_enter(v8);
  int v9 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithSize:", (double)a4, (double)a5);
  v10 = [(NSMutableDictionary *)v8->_scaledPixelBuffers objectForKeyedSubscript:v9];
  if (!v10)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      CFTypeRef v12 = VCPLogInstance();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LODWORD(cf) = 67109376;
        HIDWORD(cf) = a4;
        __int16 v19 = 1024;
        int v20 = a5;
        _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_INFO, "[PreAnalysis] Image not pre-warmed; creating on-demand (%dx%d)",
          (uint8_t *)&cf,
          0xEu);
      }
    }
    objc_super v13 = +[VCPSceneProcessingImageManager imageManager];
    value = v8->_sourcePixelBuffer.value_;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    int v11 = [v13 scalePixelBuffer:value toPixelBuffer:&cf width:a4 height:a5];

    if (v11)
    {
      CF<opaqueCMSampleBuffer *>::~CF(&cf);
      goto LABEL_11;
    }
    scaledPixelBuffers = v8->_scaledPixelBuffers;
    v17 = [VCPPreAnalysisImageEntry alloc];
    v10 = [(VCPPreAnalysisImageEntry *)v17 initWithPixelBuffer:cf];
    [(NSMutableDictionary *)scaledPixelBuffers setObject:v10 forKeyedSubscript:v9];
    CF<opaqueCMSampleBuffer *>::~CF(&cf);
  }
  [(VCPPreAnalysisImageEntry *)v10 setCount:[(VCPPreAnalysisImageEntry *)v10 count] + 1];
  *a3 = (__CVBuffer *)CFRetain([(VCPPreAnalysisImageEntry *)v10 pixelBuffer]);

  int v11 = 0;
LABEL_11:

  objc_sync_exit(v8);
  return v11;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_sourcePixelBuffer.value_);
  objc_storeStrong((id *)&self->_scaledPixelBuffers, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end