@interface VNMPClusteringTreeNodeWrapper
- (BOOL)freeNodeOnDealloc;
- (VNMPClusteringTreeNodeWrapper)initWithNode:(void *)a3 freeNodeOnDealloc:(BOOL)a4;
- (float)avgDistance;
- (float)distance;
- (id)descriptor;
- (id)getLeafNodes;
- (id)left;
- (id)right;
- (int)leafsCount;
- (int)nodeId;
- (void)dealloc;
- (void)node;
- (void)setFreeNodeOnDealloc:(BOOL)a3;
- (void)setNode:(void *)a3;
@end

@implementation VNMPClusteringTreeNodeWrapper

- (void)setFreeNodeOnDealloc:(BOOL)a3
{
  self->_freeNodeOnDealloc = a3;
}

- (BOOL)freeNodeOnDealloc
{
  return self->_freeNodeOnDealloc;
}

- (void)setNode:(void *)a3
{
  self->_node = a3;
}

- (void)node
{
  return self->_node;
}

- (void)dealloc
{
  node = (MPClusteringTreeNode *)self->_node;
  if (node && self->_freeNodeOnDealloc)
  {
    MPClusteringTreeNode::freeNodeAndItsSubtree(node);
    self->_node = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VNMPClusteringTreeNodeWrapper;
  [(VNMPClusteringTreeNodeWrapper *)&v4 dealloc];
}

- (id)getLeafNodes
{
  MPClusteringTreeNode::getLeafNodes(&v8, (uint64_t)self->_node);
  v2 = [MEMORY[0x1E4F1CA48] array];
  id var0 = v8.var0;
  objc_super v4 = *(void **)&v8.var1;
  if (v8.var0 != *(id *)&v8.var1)
  {
    v5 = v8.var0;
    do
    {
      v6 = [[VNMPClusteringTreeNodeWrapper alloc] initWithNode:*v5 freeNodeOnDealloc:0];
      [v2 addObject:v6];

      ++v5;
    }
    while (v5 != v4);
  }
  if (var0) {
    operator delete(var0);
  }

  return v2;
}

- (int)leafsCount
{
  return *((_DWORD *)self->_node + 5);
}

- (float)avgDistance
{
  return *((float *)self->_node + 4);
}

- (float)distance
{
  return *((float *)self->_node + 3);
}

- (id)right
{
  uint64_t v2 = *((void *)self->_node + 4);
  if (v2) {
    v3 = [[VNMPClusteringTreeNodeWrapper alloc] initWithNode:v2 freeNodeOnDealloc:0];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)left
{
  uint64_t v2 = *((void *)self->_node + 3);
  if (v2) {
    v3 = [[VNMPClusteringTreeNodeWrapper alloc] initWithNode:v2 freeNodeOnDealloc:0];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (id)descriptor
{
  return *(id *)self->_node;
}

- (int)nodeId
{
  return *((_DWORD *)self->_node + 2);
}

- (VNMPClusteringTreeNodeWrapper)initWithNode:(void *)a3 freeNodeOnDealloc:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)VNMPClusteringTreeNodeWrapper;
  v6 = [(VNMPClusteringTreeNodeWrapper *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(VNMPClusteringTreeNodeWrapper *)v6 setNode:a3];
    [(VNMPClusteringTreeNodeWrapper *)v7 setFreeNodeOnDealloc:v4];
  }
  return v7;
}

@end