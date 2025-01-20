@interface GKOctreeNode
- (GKBox)box;
- (void)cOctreeNode;
- (void)setCOctreeNode:(void *)a3;
@end

@implementation GKOctreeNode

- (GKBox)box
{
  return self;
}

- (void)cOctreeNode
{
  return self->_cOctreeNode;
}

- (void)setCOctreeNode:(void *)a3
{
  self->_cOctreeNode = a3;
}

@end