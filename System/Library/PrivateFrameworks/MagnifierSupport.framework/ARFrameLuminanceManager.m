@interface ARFrameLuminanceManager
- (ARFrameLuminanceManager)init;
- (double)computeLuminanceFromPixelBuffer:(__CVBuffer *)a3;
- (double)lastComputedLuminance;
- (unint64_t)currentFrameId;
- (void)setCurrentFrameId:(unint64_t)a3;
- (void)setLastComputedLuminance:(double)a3;
@end

@implementation ARFrameLuminanceManager

- (ARFrameLuminanceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARFrameLuminanceManager;
  v2 = [(ARFrameLuminanceManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastComputedLuminance = 0.0;
    v2->_currentFrameId = 0;
    v4 = v2;
  }

  return v3;
}

- (double)computeLuminanceFromPixelBuffer:(__CVBuffer *)a3
{
  unint64_t v4 = self->_currentFrameId + 1;
  self->_currentFrameId = v4;
  if ((v4 & 3) != 1) {
    return self->_lastComputedLuminance;
  }
  size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  CVPixelBufferLockBaseAddress(a3, 0);
  BaseAddressOfPlane = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  if (HeightOfPlane)
  {
    size_t v10 = 0;
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      if (WidthOfPlane)
      {
        for (size_t i = 0; i < WidthOfPlane; i += 4)
          v12 += BaseAddressOfPlane[i];
        v11 += ((WidthOfPlane - 1) >> 2) + 1;
      }
      v10 += 4;
      BaseAddressOfPlane += 4 * BytesPerRowOfPlane;
    }
    while (v10 < HeightOfPlane);
  }
  else
  {
    unint64_t v12 = 0;
    unint64_t v11 = 0;
  }
  CVPixelBufferUnlockBaseAddress(a3, 0);
  double result = (double)v12 / (double)v11;
  self->_lastComputedLuminance = result;
  return result;
}

- (double)lastComputedLuminance
{
  return self->_lastComputedLuminance;
}

- (void)setLastComputedLuminance:(double)a3
{
  self->_lastComputedLuminance = a3;
}

- (unint64_t)currentFrameId
{
  return self->_currentFrameId;
}

- (void)setCurrentFrameId:(unint64_t)a3
{
  self->_currentFrameId = a3;
}

@end