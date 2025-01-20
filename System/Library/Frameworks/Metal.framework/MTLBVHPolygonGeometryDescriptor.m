@interface MTLBVHPolygonGeometryDescriptor
- (MTLBuffer)indexBuffer;
- (MTLBuffer)transformationMatrixBuffer;
- (NSArray)vertexBuffers;
- (int64_t)transformationMatrixLayout;
- (unint64_t)indexBufferOffset;
- (unint64_t)indexType;
- (unint64_t)polygonType;
- (unint64_t)primitiveType;
- (unint64_t)transformationMatrixBufferOffset;
- (unint64_t)vertexFormat;
- (unint64_t)vertexStride;
- (void)setIndexBuffer:(id)a3;
- (void)setIndexBufferOffset:(unint64_t)a3;
- (void)setIndexType:(unint64_t)a3;
- (void)setPolygonType:(unint64_t)a3;
- (void)setTransformationMatrixBuffer:(id)a3;
- (void)setTransformationMatrixBufferOffset:(unint64_t)a3;
- (void)setTransformationMatrixLayout:(int64_t)a3;
- (void)setVertexBuffers:(id)a3;
- (void)setVertexFormat:(unint64_t)a3;
- (void)setVertexStride:(unint64_t)a3;
@end

@implementation MTLBVHPolygonGeometryDescriptor

- (unint64_t)primitiveType
{
  return 0;
}

- (unint64_t)polygonType
{
  return self->_polygonType;
}

- (void)setPolygonType:(unint64_t)a3
{
  self->_polygonType = a3;
}

- (NSArray)vertexBuffers
{
  return (NSArray *)objc_loadWeak((id *)&self->_vertexBuffers);
}

- (void)setVertexBuffers:(id)a3
{
}

- (unint64_t)vertexStride
{
  return self->_vertexStride;
}

- (void)setVertexStride:(unint64_t)a3
{
  self->_vertexStride = a3;
}

- (MTLBuffer)indexBuffer
{
  return (MTLBuffer *)objc_loadWeak((id *)&self->_indexBuffer);
}

- (void)setIndexBuffer:(id)a3
{
}

- (unint64_t)indexBufferOffset
{
  return self->_indexBufferOffset;
}

- (void)setIndexBufferOffset:(unint64_t)a3
{
  self->_indexBufferOffset = a3;
}

- (unint64_t)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(unint64_t)a3
{
  self->_indexType = a3;
}

- (unint64_t)vertexFormat
{
  return self->_vertexFormat;
}

- (void)setVertexFormat:(unint64_t)a3
{
  self->_vertexFormat = a3;
}

- (MTLBuffer)transformationMatrixBuffer
{
  return (MTLBuffer *)objc_loadWeak((id *)&self->_transformationMatrixBuffer);
}

- (void)setTransformationMatrixBuffer:(id)a3
{
}

- (unint64_t)transformationMatrixBufferOffset
{
  return self->_transformationMatrixOffsetBuffer;
}

- (void)setTransformationMatrixBufferOffset:(unint64_t)a3
{
  self->_transformationMatrixOffsetBuffer = a3;
}

- (int64_t)transformationMatrixLayout
{
  return self->_transformationMatrixLayout;
}

- (void)setTransformationMatrixLayout:(int64_t)a3
{
  self->_transformationMatrixLayout = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transformationMatrixBuffer);
  objc_destroyWeak((id *)&self->_indexBuffer);

  objc_destroyWeak((id *)&self->_vertexBuffers);
}

@end