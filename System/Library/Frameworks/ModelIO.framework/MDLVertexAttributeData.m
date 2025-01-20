@interface MDLVertexAttributeData
- (MDLMeshBufferMap)map;
- (MDLVertexAttributeData)init;
- (MDLVertexFormat)format;
- (NSUInteger)bufferSize;
- (NSUInteger)stride;
- (void)dataStart;
- (void)setBufferSize:(NSUInteger)bufferSize;
@end

@implementation MDLVertexAttributeData

- (MDLMeshBufferMap)map
{
  return self->_map;
}

- (void)dataStart
{
  return self->_dataStart;
}

- (NSUInteger)stride
{
  return self->_stride;
}

- (MDLVertexFormat)format
{
  return self->_format;
}

- (NSUInteger)bufferSize
{
  return self->_bufferSize;
}

- (MDLVertexAttributeData)init
{
  v6.receiver = self;
  v6.super_class = (Class)MDLVertexAttributeData;
  v2 = [(MDLVertexAttributeData *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)setBufferSize:(NSUInteger)bufferSize
{
  self->_bufferSize = bufferSize;
}

- (void).cxx_destruct
{
}

@end