@interface OSDCameraFrame
- (NSDictionary)metadata;
- (__CVBuffer)buffer;
- (void)dealloc;
- (void)setBuffer:(__CVBuffer *)a3;
- (void)setMetadata:(id)a3;
@end

@implementation OSDCameraFrame

- (void)setBuffer:(__CVBuffer *)a3
{
  buffer = self->_buffer;
  if (buffer)
  {
    CVPixelBufferRelease(buffer);
    self->_buffer = 0;
  }
  if (a3)
  {
    CVPixelBufferRetain(a3);
    self->_buffer = a3;
  }
}

- (void)dealloc
{
  buffer = self->_buffer;
  if (buffer) {
    CVPixelBufferRelease(buffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)OSDCameraFrame;
  [(OSDCameraFrame *)&v4 dealloc];
}

- (__CVBuffer)buffer
{
  return self->_buffer;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end