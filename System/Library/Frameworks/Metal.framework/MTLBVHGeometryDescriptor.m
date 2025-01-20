@interface MTLBVHGeometryDescriptor
- (MTLBuffer)maskBuffer;
- (MTLBuffer)primitiveDataBuffer;
- (unint64_t)maskBufferOffset;
- (unint64_t)primitiveCount;
- (unint64_t)primitiveDataBufferOffset;
- (unint64_t)primitiveDataElementSize;
- (unint64_t)primitiveDataStride;
- (unint64_t)primitiveType;
- (void)setMaskBuffer:(id)a3;
- (void)setMaskBufferOffset:(unint64_t)a3;
- (void)setPrimitiveCount:(unint64_t)a3;
- (void)setPrimitiveDataBuffer:(id)a3;
- (void)setPrimitiveDataBufferOffset:(unint64_t)a3;
- (void)setPrimitiveDataElementSize:(unint64_t)a3;
- (void)setPrimitiveDataStride:(unint64_t)a3;
@end

@implementation MTLBVHGeometryDescriptor

- (unint64_t)primitiveType
{
  MTLReportFailure(0, "-[MTLBVHGeometryDescriptor primitiveType]", 27, @"This method must be implemented by a derived class", v2, v3, v4, v5, vars0);
  return 0;
}

- (unint64_t)primitiveCount
{
  return self->_primitiveCount;
}

- (void)setPrimitiveCount:(unint64_t)a3
{
  self->_primitiveCount = a3;
}

- (MTLBuffer)maskBuffer
{
  return (MTLBuffer *)objc_loadWeak((id *)&self->_maskBuffer);
}

- (void)setMaskBuffer:(id)a3
{
}

- (unint64_t)maskBufferOffset
{
  return self->_maskBufferOffset;
}

- (void)setMaskBufferOffset:(unint64_t)a3
{
  self->_maskBufferOffset = a3;
}

- (MTLBuffer)primitiveDataBuffer
{
  return (MTLBuffer *)objc_loadWeak((id *)&self->_primitiveDataBuffer);
}

- (void)setPrimitiveDataBuffer:(id)a3
{
}

- (unint64_t)primitiveDataBufferOffset
{
  return self->_primitiveDataBufferOffset;
}

- (void)setPrimitiveDataBufferOffset:(unint64_t)a3
{
  self->_primitiveDataBufferOffset = a3;
}

- (unint64_t)primitiveDataStride
{
  return self->_primitiveDataStride;
}

- (void)setPrimitiveDataStride:(unint64_t)a3
{
  self->_primitiveDataStride = a3;
}

- (unint64_t)primitiveDataElementSize
{
  return self->_primitiveDataElementSize;
}

- (void)setPrimitiveDataElementSize:(unint64_t)a3
{
  self->_primitiveDataElementSize = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_primitiveDataBuffer);

  objc_destroyWeak((id *)&self->_maskBuffer);
}

@end