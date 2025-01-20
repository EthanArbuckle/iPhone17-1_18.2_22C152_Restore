@interface MTKTextureIOBufferMap
- (MTKTextureIOBufferMap)initWithContents:(void *)a3;
- (void)bytes;
@end

@implementation MTKTextureIOBufferMap

- (MTKTextureIOBufferMap)initWithContents:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTKTextureIOBufferMap;
  result = [(MTKTextureIOBufferMap *)&v5 init];
  if (result) {
    result->_bytes = a3;
  }
  return result;
}

- (void)bytes
{
  return self->_bytes;
}

@end