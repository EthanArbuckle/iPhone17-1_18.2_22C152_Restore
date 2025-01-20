@interface CVABackgroundRequestImplSourceImage
- (__CVBuffer)sourceColorPixelBuffer;
- (void)setSourceColorPixelBuffer:(__CVBuffer *)a3;
@end

@implementation CVABackgroundRequestImplSourceImage

- (void)setSourceColorPixelBuffer:(__CVBuffer *)a3
{
  self->_sourceColorPixelBuffer = a3;
}

- (__CVBuffer)sourceColorPixelBuffer
{
  return self->_sourceColorPixelBuffer;
}

@end