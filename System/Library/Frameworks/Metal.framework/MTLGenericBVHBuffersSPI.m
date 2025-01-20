@interface MTLGenericBVHBuffersSPI
- (MTLBuffer)controlPointBuffer;
- (MTLBuffer)geometryBuffer;
- (MTLBuffer)headerBuffer;
- (MTLBuffer)innerNodeBuffer;
- (MTLBuffer)instanceTransformBuffer;
- (MTLBuffer)leafNodeBuffer;
- (MTLBuffer)perPrimitiveDataBuffer;
- (MTLBuffer)primitiveBuffer;
- (MTLGenericBVHBuffersSPI)init;
- (MTLGenericBVHBuffersSPI)initWithVersion:(unint64_t)a3;
- (unint64_t)controlPointBufferOffset;
- (unint64_t)geometryBufferOffset;
- (unint64_t)headerBufferOffset;
- (unint64_t)innerNodeBufferOffset;
- (unint64_t)instanceTransformBufferOffset;
- (unint64_t)leafNodeBufferOffset;
- (unint64_t)perPrimitiveDataBufferOffset;
- (unint64_t)primitiveBufferOffset;
- (unint64_t)version;
- (void)setControlPointBuffer:(id)a3;
- (void)setControlPointBufferOffset:(unint64_t)a3;
- (void)setGeometryBuffer:(id)a3;
- (void)setGeometryBufferOffset:(unint64_t)a3;
- (void)setHeaderBuffer:(id)a3;
- (void)setHeaderBufferOffset:(unint64_t)a3;
- (void)setInnerNodeBuffer:(id)a3;
- (void)setInnerNodeBufferOffset:(unint64_t)a3;
- (void)setInstanceTransformBuffer:(id)a3;
- (void)setInstanceTransformBufferOffset:(unint64_t)a3;
- (void)setLeafNodeBuffer:(id)a3;
- (void)setLeafNodeBufferOffset:(unint64_t)a3;
- (void)setPerPrimitiveDataBuffer:(id)a3;
- (void)setPerPrimitiveDataBufferOffset:(unint64_t)a3;
- (void)setPrimitiveBuffer:(id)a3;
- (void)setPrimitiveBufferOffset:(unint64_t)a3;
@end

@implementation MTLGenericBVHBuffersSPI

- (MTLGenericBVHBuffersSPI)init
{
  return [(MTLGenericBVHBuffersSPI *)self initWithVersion:256];
}

- (MTLGenericBVHBuffersSPI)initWithVersion:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLGenericBVHBuffersSPI;
  result = [(MTLGenericBVHBuffersSPI *)&v5 init];
  if (result)
  {
    result->_version = a3;
    *(_OWORD *)&result->_headerBuffer = 0u;
    *(_OWORD *)&result->_innerNodeBuffer = 0u;
    *(_OWORD *)&result->_leafNodeBuffer = 0u;
    *(_OWORD *)&result->_primitiveBuffer = 0u;
    *(_OWORD *)&result->_geometryBuffer = 0u;
    *(_OWORD *)&result->_instanceTransformBuffer = 0u;
    *(_OWORD *)&result->_perPrimitiveDataBuffer = 0u;
    *(_OWORD *)&result->_controlPointBuffer = 0u;
  }
  return result;
}

- (unint64_t)version
{
  return self->_version;
}

- (MTLBuffer)headerBuffer
{
  return self->_headerBuffer;
}

- (void)setHeaderBuffer:(id)a3
{
}

- (unint64_t)headerBufferOffset
{
  return self->_headerBufferOffset;
}

- (void)setHeaderBufferOffset:(unint64_t)a3
{
  self->_headerBufferOffset = a3;
}

- (MTLBuffer)innerNodeBuffer
{
  return self->_innerNodeBuffer;
}

- (void)setInnerNodeBuffer:(id)a3
{
}

- (unint64_t)innerNodeBufferOffset
{
  return self->_innerNodeBufferOffset;
}

- (void)setInnerNodeBufferOffset:(unint64_t)a3
{
  self->_innerNodeBufferOffset = a3;
}

- (MTLBuffer)leafNodeBuffer
{
  return self->_leafNodeBuffer;
}

- (void)setLeafNodeBuffer:(id)a3
{
}

- (unint64_t)leafNodeBufferOffset
{
  return self->_leafNodeBufferOffset;
}

- (void)setLeafNodeBufferOffset:(unint64_t)a3
{
  self->_leafNodeBufferOffset = a3;
}

- (MTLBuffer)primitiveBuffer
{
  return self->_primitiveBuffer;
}

- (void)setPrimitiveBuffer:(id)a3
{
}

- (unint64_t)primitiveBufferOffset
{
  return self->_primitiveBufferOffset;
}

- (void)setPrimitiveBufferOffset:(unint64_t)a3
{
  self->_primitiveBufferOffset = a3;
}

- (MTLBuffer)geometryBuffer
{
  return self->_geometryBuffer;
}

- (void)setGeometryBuffer:(id)a3
{
}

- (unint64_t)geometryBufferOffset
{
  return self->_geometryBufferOffset;
}

- (void)setGeometryBufferOffset:(unint64_t)a3
{
  self->_geometryBufferOffset = a3;
}

- (MTLBuffer)instanceTransformBuffer
{
  return self->_instanceTransformBuffer;
}

- (void)setInstanceTransformBuffer:(id)a3
{
}

- (unint64_t)instanceTransformBufferOffset
{
  return self->_instanceTransformBufferOffset;
}

- (void)setInstanceTransformBufferOffset:(unint64_t)a3
{
  self->_instanceTransformBufferOffset = a3;
}

- (MTLBuffer)perPrimitiveDataBuffer
{
  return self->_perPrimitiveDataBuffer;
}

- (void)setPerPrimitiveDataBuffer:(id)a3
{
}

- (unint64_t)perPrimitiveDataBufferOffset
{
  return self->_perPrimitiveDataBufferOffset;
}

- (void)setPerPrimitiveDataBufferOffset:(unint64_t)a3
{
  self->_perPrimitiveDataBufferOffset = a3;
}

- (MTLBuffer)controlPointBuffer
{
  return self->_controlPointBuffer;
}

- (void)setControlPointBuffer:(id)a3
{
}

- (unint64_t)controlPointBufferOffset
{
  return self->_controlPointBufferOffset;
}

- (void)setControlPointBufferOffset:(unint64_t)a3
{
  self->_controlPointBufferOffset = a3;
}

@end