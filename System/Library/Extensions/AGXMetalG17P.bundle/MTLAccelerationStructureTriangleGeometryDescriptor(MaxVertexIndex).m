@interface MTLAccelerationStructureTriangleGeometryDescriptor(MaxVertexIndex)
- (uint64_t)maxVertexIndex;
@end

@implementation MTLAccelerationStructureTriangleGeometryDescriptor(MaxVertexIndex)

- (uint64_t)maxVertexIndex
{
  if (![a1 indexBuffer]) {
    return 3 * [a1 triangleCount] - 1;
  }
  if ([a1 indexType] == 1) {
    return 0xFFFFFFFFLL;
  }
  return 0xFFFFLL;
}

@end