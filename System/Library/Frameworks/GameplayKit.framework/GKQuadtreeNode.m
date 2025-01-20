@interface GKQuadtreeNode
- (GKQuad)quad;
- (double)max;
- (double)min;
- (void)cQuadTreeNode;
- (void)setCQuadTreeNode:(void *)a3;
@end

@implementation GKQuadtreeNode

- (double)min
{
  return *(double *)(*(void *)(a1 + 8) + 8);
}

- (double)max
{
  return *(double *)(*(void *)(a1 + 8) + 16);
}

- (void)cQuadTreeNode
{
  return self->_cQuadTreeNode;
}

- (void)setCQuadTreeNode:(void *)a3
{
  self->_cQuadTreeNode = a3;
}

- (GKQuad)quad
{
  vector_float2 quadMin = self->_quad.quadMin;
  vector_float2 quadMax = self->_quad.quadMax;
  result.vector_float2 quadMax = quadMax;
  result.vector_float2 quadMin = quadMin;
  return result;
}

@end