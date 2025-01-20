@interface MTLAccelerationStructureMotionTriangleGeometryDescriptor
+ (MTLAccelerationStructureMotionTriangleGeometryDescriptor)descriptor;
- (BOOL)isEqual:(id)a3;
- (MTLAccelerationStructureMotionTriangleGeometryDescriptor)init;
- (MTLAttributeFormat)vertexFormat;
- (MTLIndexType)indexType;
- (NSArray)vertexBuffers;
- (NSUInteger)indexBufferOffset;
- (NSUInteger)transformationMatrixBufferOffset;
- (NSUInteger)triangleCount;
- (NSUInteger)vertexStride;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexBuffer;
- (id)transformationMatrixBuffer;
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
- (void)setVertexBuffers:(NSArray *)vertexBuffers;
- (void)setVertexFormat:(MTLAttributeFormat)vertexFormat;
- (void)setVertexStride:(NSUInteger)vertexStride;
@end

@implementation MTLAccelerationStructureMotionTriangleGeometryDescriptor

+ (MTLAccelerationStructureMotionTriangleGeometryDescriptor)descriptor
{
  v2 = objc_alloc_init(MTLAccelerationStructureMotionTriangleGeometryDescriptor);

  return v2;
}

- (MTLAccelerationStructureMotionTriangleGeometryDescriptor)init
{
  v5.receiver = self;
  v5.super_class = (Class)MTLAccelerationStructureMotionTriangleGeometryDescriptor;
  v2 = [(MTLAccelerationStructureGeometryDescriptor *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_indexType = 1;
    v2->_vertexFormat = 30;
    v2->_vertexStride = 0;
    v2->_transformationMatrixLayout = 0;
    v2->_vertexBuffers = (NSArray *)objc_opt_new();
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureMotionTriangleGeometryDescriptor;
  [(MTLAccelerationStructureGeometryDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLAccelerationStructureMotionTriangleGeometryDescriptor;
  id v4 = [(MTLAccelerationStructureGeometryDescriptor *)&v6 copyWithZone:a3];
  [v4 setVertexBuffers:self->_vertexBuffers];
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
    uint64_t v24 = v3;
    uint64_t v25 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3)) {
      goto LABEL_3;
    }
    v23.receiver = self;
    v23.super_class = (Class)MTLAccelerationStructureMotionTriangleGeometryDescriptor;
    BOOL v8 = [(MTLAccelerationStructureGeometryDescriptor *)&v23 isEqual:a3];
    if (!v8) {
      return v8;
    }
    NSUInteger v9 = [(NSArray *)[(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self vertexBuffers] count];
    if (v9 != objc_msgSend((id)objc_msgSend(a3, "vertexBuffers"), "count")) {
      goto LABEL_3;
    }
    if ([(NSArray *)[(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self vertexBuffers] count])
    {
      uint64_t v10 = 0;
      do
      {
        uint64_t v11 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexBuffers](self, "vertexBuffers"), "objectAtIndexedSubscript:", v10), "buffer");
        if (v11 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "vertexBuffers"), "objectAtIndexedSubscript:", v10), "buffer"))goto LABEL_3; {
        uint64_t v12 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[MTLAccelerationStructureMotionTriangleGeometryDescriptor vertexBuffers](self, "vertexBuffers"), "objectAtIndexedSubscript:", v10), "offset");
        }
        if (v12 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "vertexBuffers"), "objectAtIndexedSubscript:", v10), "offset"))goto LABEL_3; {
      }
        }
      while ([(NSArray *)[(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self vertexBuffers] count] > ++v10);
    }
    NSUInteger v13 = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self vertexStride];
    if (v13 != [a3 vertexStride]
      || (id v14 = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self indexBuffer],
          v14 != (id)[a3 indexBuffer])
      || (NSUInteger v15 = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self indexBufferOffset],
          v15 != [a3 indexBufferOffset])
      || (MTLIndexType v16 = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self indexType],
          v16 != [a3 indexType])
      || (NSUInteger v17 = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self triangleCount],
          v17 != [a3 triangleCount])
      || (MTLAttributeFormat v18 = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self vertexFormat],
          v18 != [a3 vertexFormat])
      || (id v19 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixBuffer](self, "transformationMatrixBuffer"), v19 != (id)[a3 transformationMatrixBuffer])|| (v20 = -[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixBufferOffset](self, "transformationMatrixBufferOffset"), v20 != objc_msgSend(a3, "transformationMatrixBufferOffset")))
    {
LABEL_3:
      LOBYTE(v8) = 0;
      return v8;
    }
    int64_t v21 = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self transformationMatrixLayout];
    LOBYTE(v8) = v21 == [a3 transformationMatrixLayout];
  }
  return v8;
}

- (unint64_t)hash
{
  bzero(v5, 0x58uLL);
  v4.receiver = self;
  v4.super_class = (Class)MTLAccelerationStructureMotionTriangleGeometryDescriptor;
  v5[0] = [(MTLAccelerationStructureGeometryDescriptor *)&v4 hash];
  v5[1] = MTLHashArray([(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self vertexBuffers], 0, 1);
  v5[2] = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self vertexStride];
  v5[3] = objc_msgSend(-[MTLAccelerationStructureMotionTriangleGeometryDescriptor indexBuffer](self, "indexBuffer"), "hash");
  v5[4] = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self indexBufferOffset];
  v5[5] = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self indexType];
  v5[6] = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self triangleCount];
  v5[7] = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self vertexFormat];
  v5[8] = objc_msgSend(-[MTLAccelerationStructureMotionTriangleGeometryDescriptor transformationMatrixBuffer](self, "transformationMatrixBuffer"), "hash");
  v5[9] = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self transformationMatrixBufferOffset];
  v5[10] = [(MTLAccelerationStructureMotionTriangleGeometryDescriptor *)self transformationMatrixLayout];
  return _MTLHashState((int *)v5, 0x58uLL);
}

- (void)setVertexBuffers:(NSArray *)vertexBuffers
{
  uint64_t v3 = self->_vertexBuffers;
  if (v3 != vertexBuffers)
  {

    self->_vertexBuffers = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:vertexBuffers copyItems:1];
  }
}

- (NSArray)vertexBuffers
{
  return self->_vertexBuffers;
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

- (NSUInteger)vertexStride
{
  return self->_vertexStride;
}

- (void)setVertexStride:(NSUInteger)vertexStride
{
  self->_vertexStride = vertexStride;
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