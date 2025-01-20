@interface _MTLIndirectDrawArguments
- (unint64_t)baseInstance;
- (unint64_t)instanceCount;
- (unint64_t)primitiveType;
- (unint64_t)vertexCount;
- (unint64_t)vertexStart;
- (void)setBaseInstance:(unint64_t)a3;
- (void)setInstanceCount:(unint64_t)a3;
- (void)setPrimitiveType:(unint64_t)a3;
- (void)setVertexCount:(unint64_t)a3;
- (void)setVertexStart:(unint64_t)a3;
@end

@implementation _MTLIndirectDrawArguments

- (unint64_t)primitiveType
{
  return self->_primitiveType;
}

- (void)setPrimitiveType:(unint64_t)a3
{
  self->_primitiveType = a3;
}

- (unint64_t)vertexStart
{
  return self->_vertexStart;
}

- (void)setVertexStart:(unint64_t)a3
{
  self->_vertexStart = a3;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (void)setVertexCount:(unint64_t)a3
{
  self->_vertexCount = a3;
}

- (unint64_t)instanceCount
{
  return self->_instanceCount;
}

- (void)setInstanceCount:(unint64_t)a3
{
  self->_instanceCount = a3;
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