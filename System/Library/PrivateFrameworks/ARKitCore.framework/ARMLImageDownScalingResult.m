@interface ARMLImageDownScalingResult
- (ARMLImageDownScalingResult)initWithPixelBuffer:(__CVBuffer *)a3 regionOfInterest:(CGSize)a4 cropRegion:(CGRect)a5;
- (CGRect)cropRegion;
- (CGSize)imageResolution;
- (CGSize)regionOfInterest;
- (__CVBuffer)pixelBuffer;
- (__CVBuffer)undistortedPixelBuffer;
- (void)dealloc;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setUndistortedPixelBuffer:(__CVBuffer *)a3;
@end

@implementation ARMLImageDownScalingResult

- (ARMLImageDownScalingResult)initWithPixelBuffer:(__CVBuffer *)a3 regionOfInterest:(CGSize)a4 cropRegion:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v9 = a4.height;
  CGFloat v10 = a4.width;
  v15.receiver = self;
  v15.super_class = (Class)ARMLImageDownScalingResult;
  v12 = [(ARMLImageDownScalingResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(ARMLImageDownScalingResult *)v12 setPixelBuffer:a3];
    v13->_regionOfInterest.CGFloat width = v10;
    v13->_regionOfInterest.CGFloat height = v9;
    v13->_cropRegion.origin.CGFloat x = x;
    v13->_cropRegion.origin.CGFloat y = y;
    v13->_cropRegion.size.CGFloat width = width;
    v13->_cropRegion.size.CGFloat height = height;
  }
  return v13;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  undistortedPixelBuffer = self->_undistortedPixelBuffer;
  if (undistortedPixelBuffer) {
    CVPixelBufferRelease(undistortedPixelBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)ARMLImageDownScalingResult;
  [(ARMLImageDownScalingResult *)&v4 dealloc];
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer != a3)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->_pixelBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (void)setUndistortedPixelBuffer:(__CVBuffer *)a3
{
  undistortedPixelBuffer = self->_undistortedPixelBuffer;
  if (undistortedPixelBuffer != a3)
  {
    CVPixelBufferRelease(undistortedPixelBuffer);
    self->_undistortedPixelBuffer = a3;
    CVPixelBufferRetain(a3);
  }
}

- (CGSize)imageResolution
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    double Width = (double)CVPixelBufferGetWidth(self->_pixelBuffer);
    double Height = (double)CVPixelBufferGetHeight(pixelBuffer);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v5 = Width;
  result.CGFloat height = Height;
  result.CGFloat width = v5;
  return result;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (CGSize)regionOfInterest
{
  double width = self->_regionOfInterest.width;
  double height = self->_regionOfInterest.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)cropRegion
{
  double x = self->_cropRegion.origin.x;
  double y = self->_cropRegion.origin.y;
  double width = self->_cropRegion.size.width;
  double height = self->_cropRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (__CVBuffer)undistortedPixelBuffer
{
  return self->_undistortedPixelBuffer;
}

@end