@interface ARPoseContext
- (id)cameraTransformCallback;
- (id)imageData;
- (id)resultDataOfClass:(Class)a3;
- (int64_t)cameraPosition;
- (void)setCameraPosition:(int64_t)a3;
- (void)setCameraTransformCallback:(id)a3;
@end

@implementation ARPoseContext

- (id)imageData
{
  return 0;
}

- (id)resultDataOfClass:(Class)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (id)cameraTransformCallback
{
  return self->_cameraTransformCallback;
}

- (void)setCameraTransformCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end