@interface VCPMotionFlowObservation
- (__CVBuffer)pixelBuffer;
- (int)revision;
- (void)dealloc;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setRevision:(int)a3;
@end

@implementation VCPMotionFlowObservation

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer) {
    CFRelease(pixelBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPMotionFlowObservation;
  [(VCPMotionFlowObservation *)&v4 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (int)revision
{
  return self->_revision;
}

- (void)setRevision:(int)a3
{
  self->_revision = a3;
}

@end