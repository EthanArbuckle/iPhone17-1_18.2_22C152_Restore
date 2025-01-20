@interface MTLAccelerationStructureTriangleGeometryDescriptor
+ (MTLAccelerationStructureTriangleGeometryDescriptor)descriptor;
- (BOOL)isEqual:(id)a3;
- (MTLAccelerationStructureTriangleGeometryDescriptor)init;
- (MTLAttributeFormat)vertexFormat;
- (MTLIndexType)indexType;
- (NSUInteger)indexBufferOffset;
- (NSUInteger)transformationMatrixBufferOffset;
- (NSUInteger)triangleCount;
- (NSUInteger)vertexBufferOffset;
- (NSUInteger)vertexStride;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexBuffer;
- (id)transformationMatrixBuffer;
- (id)vertexBuffer;
- (int64_t)transformationMatrixLayout;
- (unint64_t)hash;
- (void)dealloc;
- (void)setIndexBuffer:(id)indexBuffer;
- (void)setIndexBufferOffset:(NSUInteger)indexBufferOffset;
- (void)setIndexType:(MTLIndexType)indexType;
- (void)setTransformationMatrixBuffer:(id)transformationMatrixBuffer;
- (void)setTransformationMatrixBufferOffset:(NSUInteger)transformationMatrixBufferOffset;
- (void)setTransformationMatrixLayout:(int64_t)a3;
- (void)setTriangleCount:(NSUInteger)triangleCount;
- (void)setVertexBuffer:(id)vertexBuffer;
- (void)setVertexBufferOffset:(NSUInteger)vertexBufferOffset;
- (void)setVertexFormat:(MTLAttributeFormat)vertexFormat;
- (void)setVertexStride:(NSUInteger)vertexStride;
@end

@implementation MTLAccelerationStructureTriangleGeometryDescriptor

+ (MTLAccelerationStructureTriangleGeometryDescriptor)descriptor
{
  v2 = objc_alloc_init(MTLAccelerationStructureTriangleGeometryDescriptor);

  return v2;
}

- (MTLAccelerationStructureTriangleGeometryDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureTriangleGeometryDescriptor;
  result = [(MTLAccelerationStructureGeometryDescriptor *)&v3 init];
  if (result)
  {
    result->_indexType = 1;
    result->_vertexFormat = 30;
    result->_vertexStride = 0;
    result->_transformationMatrixLayout = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureTriangleGeometryDescriptor;
  [(MTLAccelerationStructureGeometryDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLAccelerationStructureTriangleGeometryDescriptor;
  id v4 = [(MTLAccelerationStructureGeometryDescriptor *)&v6 copyWithZone:a3];
  [v4 setVertexBuffer:self->_vertexBuffer];
  [v4 setVertexBufferOffset:self->_vertexBufferOffset];
  [v4 setVertexStride:self->_vertexStride];
  [v4 setIndexBuffer:self->_indexBuffer];
  [v4 setIndexBufferOffset:self->_indexBufferOffset];
  [v4 setIndexType:self->_indexType];
  [v4 setTriangleCount:self->_triangleCount];
  [v4 setVertexFormat:self->_vertexFormat];
  [v4 setTransformationMatrixBuffer:self->_transformationMatrixBuffer];
  [v4 setTransformationMatrixBufferOffset:self->_transformationMatrixBufferOffset];
  [v4 setTransformationMatrixLayout:self->_transformationMatrixLayout];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v22 = v3;
    uint64_t v23 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3)) {
      goto LABEL_3;
    }
    v21.receiver = self;
    v21.super_class = (Class)MTLAccelerationStructureTriangleGeometryDescriptor;
    BOOL v8 = [(MTLAccelerationStructureGeometryDescriptor *)&v21 isEqual:a3];
    if (!v8) {
      return v8;
    }
    id v9 = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self vertexBuffer];
    if (v9 != (id)[a3 vertexBuffer]) {
      goto LABEL_3;
    }
    NSUInteger v10 = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self vertexBufferOffset];
    if (v10 != [a3 vertexBufferOffset]) {
      goto LABEL_3;
    }
    NSUInteger v11 = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self vertexStride];
    if (v11 != [a3 vertexStride]) {
      goto LABEL_3;
    }
    id v12 = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self indexBuffer];
    if (v12 == (id)[a3 indexBuffer]
      && (NSUInteger v13 = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self indexBufferOffset],
          v13 == [a3 indexBufferOffset])
      && (MTLIndexType v14 = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self indexType],
          v14 == [a3 indexType])
      && (NSUInteger v15 = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self triangleCount],
          v15 == [a3 triangleCount])
      && (MTLAttributeFormat v16 = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self vertexFormat],
          v16 == [a3 vertexFormat])
      && (id v17 = -[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixBuffer](self, "transformationMatrixBuffer"), v17 == (id)[a3 transformationMatrixBuffer])&& (v18 = -[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixBufferOffset](self, "transformationMatrixBufferOffset"), v18 == objc_msgSend(a3, "transformationMatrixBufferOffset")))
    {
      int64_t v19 = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self transformationMatrixLayout];
      LOBYTE(v8) = v19 == [a3 transformationMatrixLayout];
    }
    else
    {
LABEL_3:
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  bzero(v5, 0x60uLL);
  v4.receiver = self;
  v4.super_class = (Class)MTLAccelerationStructureTriangleGeometryDescriptor;
  v5[0] = [(MTLAccelerationStructureGeometryDescriptor *)&v4 hash];
  v5[1] = objc_msgSend(-[MTLAccelerationStructureTriangleGeometryDescriptor vertexBuffer](self, "vertexBuffer"), "hash");
  v5[2] = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self vertexBufferOffset];
  v5[3] = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self vertexStride];
  v5[4] = objc_msgSend(-[MTLAccelerationStructureTriangleGeometryDescriptor indexBuffer](self, "indexBuffer"), "hash");
  v5[5] = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self indexBufferOffset];
  v5[6] = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self indexType];
  v5[7] = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self triangleCount];
  v5[8] = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self vertexFormat];
  v5[9] = objc_msgSend(-[MTLAccelerationStructureTriangleGeometryDescriptor transformationMatrixBuffer](self, "transformationMatrixBuffer"), "hash");
  v5[10] = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self transformationMatrixBufferOffset];
  v5[11] = [(MTLAccelerationStructureTriangleGeometryDescriptor *)self transformationMatrixLayout];
  return _MTLHashState((int *)v5, 0x60uLL);
}

- (id)vertexBuffer
{
  return self->_vertexBuffer;
}

- (void)setVertexBuffer:(id)vertexBuffer
{
}

- (NSUInteger)vertexBufferOffset
{
  return self->_vertexBufferOffset;
}

- (void)setVertexBufferOffset:(NSUInteger)vertexBufferOffset
{
  self->_vertexBufferOffset = vertexBufferOffset;
}

- (NSUInteger)vertexStride
{
  return self->_vertexStride;
}

- (void)setVertexStride:(NSUInteger)vertexStride
{
  self->_vertexStride = vertexStride;
}

- (id)indexBuffer
{
  return self->_indexBuffer;
}

- (void)setIndexBuffer:(id)indexBuffer
{
}

- (NSUInteger)indexBufferOffset
{
  return self->_indexBufferOffset;
}

- (void)setIndexBufferOffset:(NSUInteger)indexBufferOffset
{
  self->_indexBufferOffset = indexBufferOffset;
}

- (MTLIndexType)indexType
{
  return self->_indexType;
}

- (void)setIndexType:(MTLIndexType)indexType
{
  self->_indexType = indexType;
}

- (NSUInteger)triangleCount
{
  return self->_triangleCount;
}

- (void)setTriangleCount:(NSUInteger)triangleCount
{
  self->_triangleCount = triangleCount;
}

- (MTLAttributeFormat)vertexFormat
{
  return self->_vertexFormat;
}

- (void)setVertexFormat:(MTLAttributeFormat)vertexFormat
{
  self->_vertexFormat = vertexFormat;
}

- (id)transformationMatrixBuffer
{
  return self->_transformationMatrixBuffer;
}

- (void)setTransformationMatrixBuffer:(id)transformationMatrixBuffer
{
}

- (NSUInteger)transformationMatrixBufferOffset
{
  return self->_transformationMatrixBufferOffset;
}

- (void)setTransformationMatrixBufferOffset:(NSUInteger)transformationMatrixBufferOffset
{
  self->_transformationMatrixBufferOffset = transformationMatrixBufferOffset;
}

- (int64_t)transformationMatrixLayout
{
  return self->_transformationMatrixLayout;
}

- (void)setTransformationMatrixLayout:(int64_t)a3
{
  self->_transformationMatrixLayout = a3;
}

@end