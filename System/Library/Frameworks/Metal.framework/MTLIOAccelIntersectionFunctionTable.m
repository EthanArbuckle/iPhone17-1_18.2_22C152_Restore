@interface MTLIOAccelIntersectionFunctionTable
- (MTLBuffer)globalBuffer;
- (MTLIOAccelIntersectionFunctionTable)initWithVisibleFunctionTable:(id)a3;
- (MTLVisibleFunctionTableSPI)visibleFunctionTable;
- (unint64_t)bufferAddressAtIndex:(unint64_t)a3;
- (unint64_t)globalBufferOffset;
- (unint64_t)gpuHandle;
- (unint64_t)resourceIndex;
- (unint64_t)uniqueIdentifier;
- (void)dealloc;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setFunction:(id)a3 atIndex:(unint64_t)a4;
- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4;
- (void)setGlobalBuffer:(id)a3;
- (void)setGlobalBufferOffset:(unint64_t)a3;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4;
- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
@end

@implementation MTLIOAccelIntersectionFunctionTable

- (MTLVisibleFunctionTableSPI)visibleFunctionTable
{
  return self->_visibleFunctionTable;
}

- (MTLBuffer)globalBuffer
{
  return (MTLBuffer *)[(MTLVisibleFunctionTableSPI *)self->_visibleFunctionTable globalBuffer];
}

- (void)setGlobalBuffer:(id)a3
{
}

- (unint64_t)globalBufferOffset
{
  return [(MTLVisibleFunctionTableSPI *)self->_visibleFunctionTable globalBufferOffset];
}

- (void)setGlobalBufferOffset:(unint64_t)a3
{
}

- (unint64_t)uniqueIdentifier
{
  return [(MTLVisibleFunctionTableSPI *)self->_visibleFunctionTable uniqueIdentifier];
}

- (unint64_t)resourceIndex
{
  return [(MTLVisibleFunctionTableSPI *)self->_visibleFunctionTable resourceIndex];
}

- (unint64_t)gpuHandle
{
  if ([(MTLDevice *)[(MTLIOAccelResource *)self device] requiresRaytracingEmulation])
  {
    return [(MTLIOAccelIntersectionFunctionTable *)self uniqueIdentifier];
  }
  else
  {
    return [(MTLIOAccelIntersectionFunctionTable *)self resourceIndex];
  }
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (MTLIOAccelIntersectionFunctionTable)initWithVisibleFunctionTable:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLIOAccelIntersectionFunctionTable;
  v4 = -[MTLIOAccelResource initWithResource:](&v6, sel_initWithResource_);
  if (v4) {
    v4->_visibleFunctionTable = (MTLVisibleFunctionTableSPI *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelIntersectionFunctionTable;
  [(MTLIOAccelResource *)&v3 dealloc];
}

- (void)setFunction:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setFunctions:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setOpaqueTriangleIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setOpaqueCurveIntersectionFunctionWithSignature:(unint64_t)a3 withRange:(_NSRange)a4
{
}

- (void)setVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (unint64_t)bufferAddressAtIndex:(unint64_t)a3
{
  return [(MTLVisibleFunctionTableSPI *)self->_visibleFunctionTable bufferAddressAtIndex:a3];
}

@end