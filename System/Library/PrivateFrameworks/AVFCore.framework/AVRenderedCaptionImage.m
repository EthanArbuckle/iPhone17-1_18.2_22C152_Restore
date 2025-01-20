@interface AVRenderedCaptionImage
- (AVRenderedCaptionImage)initWithPixelBuffer:(__CVBuffer *)a3 atPosition:(CGPoint)a4;
- (CGPoint)position;
- (__CVBuffer)pixelBuffer;
- (void)dealloc;
@end

@implementation AVRenderedCaptionImage

- (AVRenderedCaptionImage)initWithPixelBuffer:(__CVBuffer *)a3 atPosition:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)AVRenderedCaptionImage;
  v7 = [(AVRenderedCaptionImage *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_position.CGFloat x = x;
    v7->_position.CGFloat y = y;
    v7->_pixelBuffer = CVPixelBufferRetain(a3);
  }
  return v8;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)AVRenderedCaptionImage;
  [(AVRenderedCaptionImage *)&v3 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end