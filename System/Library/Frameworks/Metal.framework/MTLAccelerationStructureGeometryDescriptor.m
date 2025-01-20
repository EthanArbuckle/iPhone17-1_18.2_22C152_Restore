@interface MTLAccelerationStructureGeometryDescriptor
- (BOOL)allowDuplicateIntersectionFunctionInvocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)opaque;
- (MTLAccelerationStructureGeometryDescriptor)init;
- (NSString)label;
- (NSUInteger)intersectionFunctionTableOffset;
- (NSUInteger)primitiveDataBufferOffset;
- (NSUInteger)primitiveDataElementSize;
- (NSUInteger)primitiveDataStride;
- (id)copyWithZone:(_NSZone *)a3;
- (id)primitiveDataBuffer;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAllowDuplicateIntersectionFunctionInvocation:(BOOL)allowDuplicateIntersectionFunctionInvocation;
- (void)setIntersectionFunctionTableOffset:(NSUInteger)intersectionFunctionTableOffset;
- (void)setLabel:(NSString *)label;
- (void)setOpaque:(BOOL)opaque;
- (void)setPrimitiveDataBuffer:(id)primitiveDataBuffer;
- (void)setPrimitiveDataBufferOffset:(NSUInteger)primitiveDataBufferOffset;
- (void)setPrimitiveDataElementSize:(NSUInteger)primitiveDataElementSize;
- (void)setPrimitiveDataStride:(NSUInteger)primitiveDataStride;
@end

@implementation MTLAccelerationStructureGeometryDescriptor

- (MTLAccelerationStructureGeometryDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureGeometryDescriptor;
  result = [(MTLAccelerationStructureGeometryDescriptor *)&v3 init];
  if (result) {
    result->_allowDuplicateIntersectionFunctionInvocation = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setIntersectionFunctionTableOffset:self->_intersectionFunctionTableOffset];
  [v4 setOpaque:self->_opaque];
  [v4 setAllowDuplicateIntersectionFunctionInvocation:self->_allowDuplicateIntersectionFunctionInvocation];
  [v4 setLabel:self->_label];
  [v4 setPrimitiveDataBuffer:self->_primitiveDataBuffer];
  [v4 setPrimitiveDataBufferOffset:self->_primitiveDataBufferOffset];
  [v4 setPrimitiveDataStride:self->_primitiveDataStride];
  [v4 setPrimitiveDataElementSize:self->_primitiveDataElementSize];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v16) = 1;
    return v16;
  }
  uint64_t v22 = v5;
  uint64_t v23 = v4;
  uint64_t v24 = v3;
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    goto LABEL_12;
  }
  NSUInteger v12 = [(MTLAccelerationStructureGeometryDescriptor *)self intersectionFunctionTableOffset];
  if (v12 != [a3 intersectionFunctionTableOffset]) {
    goto LABEL_12;
  }
  int v13 = [(MTLAccelerationStructureGeometryDescriptor *)self opaque];
  if (v13 != [a3 opaque]) {
    goto LABEL_12;
  }
  int v14 = [(MTLAccelerationStructureGeometryDescriptor *)self allowDuplicateIntersectionFunctionInvocation];
  if (v14 != [a3 allowDuplicateIntersectionFunctionInvocation]) {
    goto LABEL_12;
  }
  v15 = [(MTLAccelerationStructureGeometryDescriptor *)self label];
  if (v15 == (NSString *)[a3 label]
    || (BOOL v16 = -[NSString isEqualToString:](-[MTLAccelerationStructureGeometryDescriptor label](self, "label"), "isEqualToString:", [a3 label])))
  {
    id v17 = [(MTLAccelerationStructureGeometryDescriptor *)self primitiveDataBuffer];
    if (v17 == (id)[a3 primitiveDataBuffer])
    {
      NSUInteger v18 = [(MTLAccelerationStructureGeometryDescriptor *)self primitiveDataBufferOffset];
      if (v18 == [a3 primitiveDataBufferOffset])
      {
        NSUInteger v19 = [(MTLAccelerationStructureGeometryDescriptor *)self primitiveDataStride];
        if (v19 == [a3 primitiveDataStride])
        {
          NSUInteger v20 = [(MTLAccelerationStructureGeometryDescriptor *)self primitiveDataElementSize];
          LOBYTE(v16) = v20 == [a3 primitiveDataElementSize];
          return v16;
        }
      }
    }
LABEL_12:
    LOBYTE(v16) = 0;
  }
  return v16;
}

- (unint64_t)hash
{
  bzero(&v4, 0x38uLL);
  NSUInteger v4 = [(MTLAccelerationStructureGeometryDescriptor *)self intersectionFunctionTableOffset];
  BOOL v5 = [(MTLAccelerationStructureGeometryDescriptor *)self opaque];
  BOOL v6 = [(MTLAccelerationStructureGeometryDescriptor *)self allowDuplicateIntersectionFunctionInvocation];
  NSUInteger v7 = [(NSString *)[(MTLAccelerationStructureGeometryDescriptor *)self label] hash];
  uint64_t v8 = objc_msgSend(-[MTLAccelerationStructureGeometryDescriptor primitiveDataBuffer](self, "primitiveDataBuffer"), "hash");
  NSUInteger v9 = [(MTLAccelerationStructureGeometryDescriptor *)self primitiveDataBufferOffset];
  NSUInteger v10 = [(MTLAccelerationStructureGeometryDescriptor *)self primitiveDataStride];
  NSUInteger v11 = [(MTLAccelerationStructureGeometryDescriptor *)self primitiveDataElementSize];
  return _MTLHashState((int *)&v4, 0x38uLL);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureGeometryDescriptor;
  [(MTLAccelerationStructureGeometryDescriptor *)&v3 dealloc];
}

- (NSUInteger)intersectionFunctionTableOffset
{
  return self->_intersectionFunctionTableOffset;
}

- (void)setIntersectionFunctionTableOffset:(NSUInteger)intersectionFunctionTableOffset
{
  self->_intersectionFunctionTableOffset = intersectionFunctionTableOffset;
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)opaque
{
  self->_opaque = opaque;
}

- (BOOL)allowDuplicateIntersectionFunctionInvocation
{
  return self->_allowDuplicateIntersectionFunctionInvocation;
}

- (void)setAllowDuplicateIntersectionFunctionInvocation:(BOOL)allowDuplicateIntersectionFunctionInvocation
{
  self->_allowDuplicateIntersectionFunctionInvocation = allowDuplicateIntersectionFunctionInvocation;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
}

- (id)primitiveDataBuffer
{
  return self->_primitiveDataBuffer;
}

- (void)setPrimitiveDataBuffer:(id)primitiveDataBuffer
{
}

- (NSUInteger)primitiveDataBufferOffset
{
  return self->_primitiveDataBufferOffset;
}

- (void)setPrimitiveDataBufferOffset:(NSUInteger)primitiveDataBufferOffset
{
  self->_primitiveDataBufferOffset = primitiveDataBufferOffset;
}

- (NSUInteger)primitiveDataStride
{
  return self->_primitiveDataStride;
}

- (void)setPrimitiveDataStride:(NSUInteger)primitiveDataStride
{
  self->_primitiveDataStride = primitiveDataStride;
}

- (NSUInteger)primitiveDataElementSize
{
  return self->_primitiveDataElementSize;
}

- (void)setPrimitiveDataElementSize:(NSUInteger)primitiveDataElementSize
{
  self->_primitiveDataElementSize = primitiveDataElementSize;
}

@end