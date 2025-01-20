@interface MTKMeshBufferHolder
- (MTKMeshBuffer)buffer;
- (void)setBuffer:(id)a3;
@end

@implementation MTKMeshBufferHolder

- (MTKMeshBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  self->_buffer = (MTKMeshBuffer *)a3;
}

@end