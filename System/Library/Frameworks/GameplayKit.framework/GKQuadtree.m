@interface GKQuadtree
+ (GKQuadtree)quadtreeWithBoundingQuad:(GKQuad)quad minimumCellSize:(float)minCellSize;
- (BOOL)removeElement:(id)data withNode:(GKQuadtreeNode *)node;
- (BOOL)removeElement:(id)element;
- (GKQuadtree)initWithBoundingQuad:(GKQuad)quad minimumCellSize:(float)minCellSize;
- (GKQuadtreeNode)addElement:(id)element withPoint:(vector_float2)point;
- (GKQuadtreeNode)addElement:(id)element withQuad:(GKQuad)quad;
- (NSArray)elementsAtPoint:(vector_float2)point;
- (NSArray)elementsInQuad:(GKQuad)quad;
- (void)dealloc;
@end

@implementation GKQuadtree

+ (GKQuadtree)quadtreeWithBoundingQuad:(GKQuad)quad minimumCellSize:(float)minCellSize
{
  double v5 = *(double *)&quad.quadMax;
  double v6 = *(double *)&quad.quadMin;
  v7 = [GKQuadtree alloc];
  *(float *)&double v8 = minCellSize;
  v9 = -[GKQuadtree initWithBoundingQuad:minimumCellSize:](v7, "initWithBoundingQuad:minimumCellSize:", v6, v5, v8);

  return v9;
}

- (GKQuadtree)initWithBoundingQuad:(GKQuad)quad minimumCellSize:(float)minCellSize
{
  v5.receiver = self;
  v5.super_class = (Class)GKQuadtree;
  if ([(GKQuadtree *)&v5 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  cQuadTree = self->_cQuadTree;
  if (cQuadTree) {
    (*(void (**)(void *, SEL))(*(void *)cQuadTree + 8))(cQuadTree, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKQuadtree;
  [(GKQuadtree *)&v4 dealloc];
}

- (GKQuadtreeNode)addElement:(id)element withPoint:(vector_float2)point
{
  objc_super v4 = (void *)GKCQuadTreeNode<NSObject>::addPoint(*((float32x2_t **)self->_cQuadTree + 1), element, *(double *)&point)[14];

  return (GKQuadtreeNode *)v4;
}

- (GKQuadtreeNode)addElement:(id)element withQuad:(GKQuad)quad
{
  objc_super v4 = (void *)GKCQuadTreeNode<NSObject>::addQuad(*((float32x2_t **)self->_cQuadTree + 1), element, (__n128)quad, 0.0)[14];

  return (GKQuadtreeNode *)v4;
}

- (NSArray)elementsAtPoint:(vector_float2)point
{
  __p = 0;
  v22 = 0;
  uint64_t v23 = 0;
  objc_super v5 = [MEMORY[0x263EFF980] array];
  double v6 = (float32x2_t *)*((void *)self->_cQuadTree + 1);
  double v7 = 0.0000305175853;
  while (1)
  {
    v9 = (const float *)&v6[5];
    float32x2_t v10 = vld1_dup_f32(v9);
    int32x2_t v11 = vcgt_f32(vmul_f32(v6[3], (float32x2_t)0x3F0000003F000000), v10);
    if ((v11.i32[0] & v11.i32[1] & 1) == 0) {
      break;
    }
    int32x2_t v12 = vcgt_f32(v6[4], (float32x2_t)point);
    if (v12.i8[0])
    {
      if (v12.i8[4]) {
        double v8 = v6 + 9;
      }
      else {
        double v8 = v6 + 7;
      }
    }
    else if (v12.i8[4])
    {
      double v8 = v6 + 10;
    }
    else
    {
      double v8 = v6 + 8;
    }
    double v6 = (float32x2_t *)*v8;
    if (!v6) {
      goto LABEL_13;
    }
  }
  v13 = (void **)v6[11];
  v14 = (void **)v6[12];
  if (v14 != v13) {
    std::vector<NSObject * {__strong}>::__insert_with_size[abi:ne180100]<std::__wrap_iter<NSObject * const {__strong}*>,NSObject * const {__strong}*>((id **)&__p, (uint64_t)v22, v13, v14, v14 - v13);
  }
LABEL_13:
  v15 = (char *)__p;
  if (__p != v22)
  {
    do
    {
      objc_msgSend(v5, "addObject:", *(void *)v15, v7);
      v15 += 8;
    }
    while (v15 != v22);
  }
  v16 = (char *)__p;
  if (__p)
  {
    v17 = v22;
    v18 = __p;
    if (v22 != __p)
    {
      do
      {
        v19 = (void *)*((void *)v17 - 1);
        v17 -= 8;
      }
      while (v17 != v16);
      v18 = __p;
    }
    v22 = v16;
    operator delete(v18);
  }

  return (NSArray *)v5;
}

- (NSArray)elementsInQuad:(GKQuad)quad
{
  vector_float2 quadMax = quad.quadMax;
  vector_float2 quadMin = quad.quadMin;
  v18[0] = (float32x2_t)quad.quadMin;
  v18[1] = (float32x2_t)quad.quadMax;
  __p = 0;
  v16 = 0;
  uint64_t v17 = 0;
  double v6 = [MEMORY[0x263EFF980] array];
  cQuadTree = (id **)self->_cQuadTree;
  float32x2_t v14 = vsub_f32((float32x2_t)quadMax, (float32x2_t)quadMin);
  GKCQuadTreeNode<NSObject>::queryQuad(cQuadTree[1], v18, &v14, (uint64_t)&__p);
  double v8 = __p;
  if (__p != v16)
  {
    do
      [v6 addObject:*v8++];
    while (v8 != v16);
  }
  v9 = __p;
  if (__p)
  {
    float32x2_t v10 = v16;
    int32x2_t v11 = __p;
    if (v16 != __p)
    {
      do
      {
        int32x2_t v12 = (void *)*--v10;
      }
      while (v10 != v9);
      int32x2_t v11 = __p;
    }
    v16 = v9;
    operator delete(v11);
  }

  return (NSArray *)v6;
}

- (BOOL)removeElement:(id)element
{
  return GKCQuadTreeNode<NSObject>::removeDataRecursive(*((void **)self->_cQuadTree + 1), element);
}

- (BOOL)removeElement:(id)data withNode:(GKQuadtreeNode *)node
{
  id v6 = data;
  double v7 = node;
  LOBYTE(self) = GKCQuadTree<NSObject>::removeDataWithNode((uint64_t)self->_cQuadTree, v6, (uint64_t)[(GKQuadtreeNode *)v7 cQuadTreeNode]);

  return (char)self;
}

@end