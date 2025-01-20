@interface _MTLIndirectDrawIndexedArguments
- (unint64_t)baseInstance;
- (unint64_t)baseVertex;
- (unint64_t)indexBufferGPUVirtualAddress;
- (unint64_t)indexBufferOffset;
- (unint64_t)indexCount;
- (unint64_t)indexType;
- (unint64_t)instanceCount;
- (unint64_t)primitiveType;
- (void)indexBufferVirtualAddress;
- (void)setBaseInstance:(unint64_t)a3;
- (void)setBaseVertex:(unint64_t)a3;
- (void)setIndexBufferGPUVirtualAddress:(unint64_t)a3;
- (void)setIndexBufferOffset:(unint64_t)a3;
- (void)setIndexCount:(unint64_t)a3;
- (void)setIndexType:(unint64_t)a3;
- (void)setInstanceCount:(unint64_t)a3;
- (void)setPrimitiveType:(unint64_t)a3;
@end

@implementation _MTLIndirectDrawIndexedArguments

- (void)indexBufferVirtualAddress
{
  return (void *)self->_indexBufferGPUVirtualAddress;
}

- (unint64_t)primitiveType
{
  return self->_primitiveType;
}

- (void)setPrimitiveType:(unint64_t)a3
{
  self->_primitiveType = a3;
}

- (unint64_t)indexCount
{
  return self->_indexCount;
}

- (void)setIndexCount:(unint64_t)a3
{
  self->_indexCount = a3;
}

- (unint64_t)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(unint64_t)a3
{
  self->_indexType = a3;
}

- (unint64_t)indexBufferGPUVirtualAddress
{
  return self->_indexBufferGPUVirtualAddress;
}

- (void)setIndexBufferGPUVirtualAddress:(unint64_t)a3
{
  self->_indexBufferGPUVirtualAddress = a3;
}

- (unint64_t)indexBufferOffset
{
  return self->_indexBufferOffset;
}

- (void)setIndexBufferOffset:(unint64_t)a3
{
  self->_indexBufferOffset = a3;
}

- (unint64_t)instanceCount
{
  return self->_instanceCount;
}

- (void)setInstanceCount:(unint64_t)a3
{
  self->_instanceCount = a3;
}

- (unint64_t)baseVertex
{
  return self->_baseVertex;
}

- (void)setBaseVertex:(unint64_t)a3
{
  self->_baseVertex = a3;
}

- (unint64_t)baseInstance
{
  return self->_baseInstance;
}

- (void)setBaseInstance:(unint64_t)a3
{
  self->_baseInstance = a3;
}

@end