@interface AXMPixelBufferWrapper
+ (AXMPixelBufferWrapper)new;
+ (AXMPixelBufferWrapper)wrapperWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4;
- (AXMPixelBufferWrapper)init;
- (CGSize)orientedSize;
- (CGSize)unorientedSize;
- (__CVBuffer)pixelBuffer;
- (id)_initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4;
- (unsigned)orientation;
- (void)dealloc;
@end

@implementation AXMPixelBufferWrapper

+ (AXMPixelBufferWrapper)wrapperWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  id v4 = [[AXMPixelBufferWrapper alloc] _initWithPixelBuffer:a3 orientation:*(void *)&a4];

  return (AXMPixelBufferWrapper *)v4;
}

- (AXMPixelBufferWrapper)init
{
  return 0;
}

+ (AXMPixelBufferWrapper)new
{
  return 0;
}

- (id)_initWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AXMPixelBufferWrapper;
  v6 = [(AXMPixelBufferWrapper *)&v8 init];
  if (v6)
  {
    v6->_pixelBuffer = CVPixelBufferRetain(a3);
    v6->_orientation = a4;
  }
  return v6;
}

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer) {
    CVPixelBufferRelease(pixelBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)AXMPixelBufferWrapper;
  [(AXMPixelBufferWrapper *)&v4 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (CGSize)unorientedSize
{
  double Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
  double Height = (double)CVPixelBufferGetHeight(self->_pixelBuffer);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (CGSize)orientedSize
{
  unsigned int v3 = [(AXMPixelBufferWrapper *)self orientation] - 5;
  [(AXMPixelBufferWrapper *)self unorientedSize];
  if (v3 >= 4) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  if (v3 < 4) {
    double v4 = v5;
  }
  double v7 = v6;
  result.height = v7;
  result.width = v4;
  return result;
}

@end