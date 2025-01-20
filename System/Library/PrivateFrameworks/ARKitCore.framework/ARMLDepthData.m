@interface ARMLDepthData
- (ARImageData)sourceImageData;
- (ARMLDepthData)initWithTimestamp:(double)a3 depthBuffer:(__CVBuffer *)a4 confidenceBuffer:(__CVBuffer *)a5 source:(int64_t)a6;
- (ARMLDepthData)initWithTimestamp:(double)a3 depthBuffer:(__CVBuffer *)a4 source:(int64_t)a5;
- (CGSize)depthBufferSize;
- (NSString)description;
- (__CVBuffer)confidenceBuffer;
- (__CVBuffer)confidenceMap;
- (__CVBuffer)depthBuffer;
- (__CVBuffer)normalsBuffer;
- (__CVBuffer)singleFrameConfidenceBuffer;
- (__CVBuffer)singleFrameDepthBuffer;
- (double)timestamp;
- (int64_t)source;
- (void)dealloc;
- (void)setConfidenceMap:(__CVBuffer *)a3;
- (void)setNormalsBuffer:(__CVBuffer *)a3;
- (void)setSingleFrameConfidenceBuffer:(__CVBuffer *)a3;
- (void)setSingleFrameDepthBuffer:(__CVBuffer *)a3;
- (void)setSourceImageData:(id)a3;
@end

@implementation ARMLDepthData

- (ARMLDepthData)initWithTimestamp:(double)a3 depthBuffer:(__CVBuffer *)a4 source:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)ARMLDepthData;
  v8 = [(ARMLDepthData *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a3;
    CVPixelBufferRef v10 = CVPixelBufferRetain(a4);
    v9->_singleFrameDepthBuffer = 0;
    v9->_singleFrameDepthBufferLock._os_unfair_lock_opaque = 0;
    v9->_depthBuffer = v10;
    v9->_source = a5;
  }
  return v9;
}

- (ARMLDepthData)initWithTimestamp:(double)a3 depthBuffer:(__CVBuffer *)a4 confidenceBuffer:(__CVBuffer *)a5 source:(int64_t)a6
{
  v7 = [(ARMLDepthData *)self initWithTimestamp:a4 depthBuffer:a6 source:a3];
  if (v7) {
    v7->_confidenceBuffer = CVPixelBufferRetain(a5);
  }
  return v7;
}

- (__CVBuffer)singleFrameDepthBuffer
{
  p_singleFrameDepthBufferLock = &self->_singleFrameDepthBufferLock;
  os_unfair_lock_lock(&self->_singleFrameDepthBufferLock);
  singleFrameDepthBuffer = self->_singleFrameDepthBuffer;
  if (!singleFrameDepthBuffer) {
    singleFrameDepthBuffer = self->_depthBuffer;
  }
  os_unfair_lock_unlock(p_singleFrameDepthBufferLock);
  return singleFrameDepthBuffer;
}

- (void)setSingleFrameDepthBuffer:(__CVBuffer *)a3
{
  if (a3)
  {
    p_singleFrameDepthBufferLock = &self->_singleFrameDepthBufferLock;
    os_unfair_lock_lock(&self->_singleFrameDepthBufferLock);
    singleFrameDepthBuffer = self->_singleFrameDepthBuffer;
    if (singleFrameDepthBuffer) {
      CVPixelBufferRelease(singleFrameDepthBuffer);
    }
    self->_singleFrameDepthBuffer = a3;
    CVPixelBufferRetain(a3);
    os_unfair_lock_unlock(p_singleFrameDepthBufferLock);
  }
}

- (__CVBuffer)singleFrameConfidenceBuffer
{
  result = self->_singleFrameConfidenceBuffer;
  if (!result) {
    return self->_confidenceBuffer;
  }
  return result;
}

- (void)setSingleFrameConfidenceBuffer:(__CVBuffer *)a3
{
  singleFrameConfidenceBuffer = self->_singleFrameConfidenceBuffer;
  if (singleFrameConfidenceBuffer != a3)
  {
    CVPixelBufferRelease(singleFrameConfidenceBuffer);
    self->_singleFrameConfidenceBuffer = CVPixelBufferRetain(a3);
  }
}

- (void)setNormalsBuffer:(__CVBuffer *)a3
{
  normalsBuffer = self->_normalsBuffer;
  if (normalsBuffer != a3)
  {
    CVPixelBufferRelease(normalsBuffer);
    self->_normalsBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setConfidenceMap:(__CVBuffer *)a3
{
  confidenceMap = self->_confidenceMap;
  if (confidenceMap != a3)
  {
    CVPixelBufferRelease(confidenceMap);
    self->_confidenceMap = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)dealloc
{
  singleFrameDepthBuffer = self->_singleFrameDepthBuffer;
  if (singleFrameDepthBuffer != self->_depthBuffer) {
    CVPixelBufferRelease(singleFrameDepthBuffer);
  }
  singleFrameConfidenceBuffer = self->_singleFrameConfidenceBuffer;
  if (singleFrameConfidenceBuffer != self->_confidenceBuffer) {
    CVPixelBufferRelease(singleFrameConfidenceBuffer);
  }
  normalsBuffer = self->_normalsBuffer;
  if (normalsBuffer) {
    CVPixelBufferRelease(normalsBuffer);
  }
  CVPixelBufferRelease(self->_depthBuffer);
  CVPixelBufferRelease(self->_confidenceBuffer);
  CVPixelBufferRelease(self->_confidenceMap);
  v6.receiver = self;
  v6.super_class = (Class)ARMLDepthData;
  [(ARMLDepthData *)&v6 dealloc];
}

- (CGSize)depthBufferSize
{
  v2 = [(ARMLDepthData *)self depthBuffer];
  if (v2)
  {
    v3 = v2;
    double Width = (double)CVPixelBufferGetWidth(v2);
    double Height = (double)CVPixelBufferGetHeight(v3);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v6 = Width;
  result.height = Height;
  result.width = v6;
  return result;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(ARMLDepthData *)self timestamp];
  v7 = [v3 stringWithFormat:@"%@(%p): %f", v5, self, v6];

  return (NSString *)v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__CVBuffer)depthBuffer
{
  return self->_depthBuffer;
}

- (int64_t)source
{
  return self->_source;
}

- (__CVBuffer)confidenceBuffer
{
  return self->_confidenceBuffer;
}

- (__CVBuffer)confidenceMap
{
  return self->_confidenceMap;
}

- (__CVBuffer)normalsBuffer
{
  return self->_normalsBuffer;
}

- (ARImageData)sourceImageData
{
  return self->_sourceImageData;
}

- (void)setSourceImageData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end