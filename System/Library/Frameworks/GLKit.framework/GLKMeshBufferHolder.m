@interface GLKMeshBufferHolder
- (GLKMeshBuffer)buffer;
- (void)setBuffer:(id)a3;
@end

@implementation GLKMeshBufferHolder

- (GLKMeshBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  self->_buffer = (GLKMeshBuffer *)a3;
}

@end