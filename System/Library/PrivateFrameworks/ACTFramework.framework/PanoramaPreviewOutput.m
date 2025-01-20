@interface PanoramaPreviewOutput
- (PanoramaPreviewOutput)init;
- (__CVBuffer)pixelBuffer;
- (void)setPixelBuffer:(__CVBuffer *)a3;
@end

@implementation PanoramaPreviewOutput

- (PanoramaPreviewOutput)init
{
  v4.receiver = self;
  v4.super_class = (Class)PanoramaPreviewOutput;
  v2 = [(PanoramaPreviewOutput *)&v4 init];
  if (v2) {
    v2->_pixelBuffer = 0;
  }

  return 0;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
}

@end