@interface GKOctree
+ (GKOctree)octreeWithBoundingBox:(GKBox *)box minimumCellSize:(float)minCellSize;
- (BOOL)removeElement:(id)element;
- (BOOL)removeElement:(id)element withNode:(GKOctreeNode *)node;
- (GKOctree)init;
- (GKOctree)initWithBoundingBox:(GKBox *)box minimumCellSize:(float)minCellSize;
- (GKOctreeNode)addElement:(id)element withBox:(GKBox *)box;
- (GKOctreeNode)addElement:(id)element withPoint:(vector_float3)point;
- (NSArray)elementsAtPoint:(vector_float3)point;
- (NSArray)elementsInBox:(GKBox *)box;
- (void)dealloc;
@end

@implementation GKOctree

+ (GKOctree)octreeWithBoundingBox:(GKBox *)box minimumCellSize:(float)minCellSize
{
  int v6 = v5;
  double v11 = *(double *)&minCellSize;
  double v12 = v4;
  v7 = [GKOctree alloc];
  LODWORD(v8) = v6;
  v9 = -[GKOctree initWithBoundingBox:minimumCellSize:](v7, "initWithBoundingBox:minimumCellSize:", v11, v12, v8);

  return v9;
}

- (GKOctree)init
{
  return -[GKOctree initWithBoundingBox:minimumCellSize:](self, "initWithBoundingBox:minimumCellSize:", *(double *)&_PromotedConst, unk_235F1F340, 0.0);
}

- (GKOctree)initWithBoundingBox:(GKBox *)box minimumCellSize:(float)minCellSize
{
  v6.receiver = self;
  v6.super_class = (Class)GKOctree;
  if ([(GKOctree *)&v6 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  cOctree = self->_cOctree;
  if (cOctree) {
    (*(void (**)(void *, SEL))(*(void *)cOctree + 8))(cOctree, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKOctree;
  [(GKOctree *)&v4 dealloc];
}

- (GKOctreeNode)addElement:(id)element withPoint:(vector_float3)point
{
  int v5 = *(void **)(GKCOctreeNode<NSObject>::addPoint(*((void *)self->_cOctree + 1), element, v4) + 200);

  return (GKOctreeNode *)v5;
}

- (GKOctreeNode)addElement:(id)element withBox:(GKBox *)box
{
  objc_super v6 = *(void **)(GKCOctreeNode<NSObject>::addBox(*((void *)self->_cOctree + 1), element, v4, vsubq_f32(v5, v4)) + 200);

  return (GKOctreeNode *)v6;
}

- (NSArray)elementsAtPoint:(vector_float3)point
{
  int8x16_t v12 = v3;
  __p = 0;
  v14 = 0;
  uint64_t v15 = 0;
  float32x4_t v5 = objc_msgSend(MEMORY[0x263EFF980], "array", point.i64[0], point.i64[1]);
  GKCOctreeNode<NSObject>::queryPoint(*((id **)self->_cOctree + 1), (uint64_t)&__p, v12);
  objc_super v6 = __p;
  if (__p != v14)
  {
    do
      [v5 addObject:*v6++];
    while (v6 != v14);
  }
  v7 = __p;
  if (__p)
  {
    double v8 = v14;
    v9 = __p;
    if (v14 != __p)
    {
      do
      {
        v10 = (void *)*--v8;
      }
      while (v8 != v7);
      v9 = __p;
    }
    v14 = v7;
    operator delete(v9);
  }

  return (NSArray *)v5;
}

- (NSArray)elementsInBox:(GKBox *)box
{
  float32x4_t v14 = v3;
  float32x4_t v15 = v4;
  float32x4_t v20 = v3;
  float32x4_t v21 = v4;
  __p = 0;
  v18 = 0;
  uint64_t v19 = 0;
  objc_super v6 = objc_msgSend(MEMORY[0x263EFF980], "array", box);
  cOctree = (id **)self->_cOctree;
  float32x4_t v16 = vsubq_f32(v15, v14);
  GKCOctreeNode<NSObject>::queryBox(cOctree[1], &v20, &v16, (uint64_t)&__p);
  double v8 = __p;
  if (__p != v18)
  {
    do
      [v6 addObject:*v8++];
    while (v8 != v18);
  }
  v9 = __p;
  if (__p)
  {
    v10 = v18;
    double v11 = __p;
    if (v18 != __p)
    {
      do
      {
        int8x16_t v12 = (void *)*--v10;
      }
      while (v10 != v9);
      double v11 = __p;
    }
    v18 = v9;
    operator delete(v11);
  }

  return (NSArray *)v6;
}

- (BOOL)removeElement:(id)element
{
  return GKCOctreeNode<NSObject>::removeDataRecursive(*((void **)self->_cOctree + 1), element);
}

- (BOOL)removeElement:(id)element withNode:(GKOctreeNode *)node
{
  id v5 = element;
  objc_super v6 = node;
  uint64_t v7 = [(GKOctreeNode *)v6 cOctreeNode];
  id v8 = v5;
  v9 = v8;
  v10 = *(void **)(v7 + 176);
  double v11 = *(void **)(v7 + 184);
  if (v10 == v11)
  {
LABEL_4:
    BOOL v12 = 0;
  }
  else
  {
    while ((id)*v10 != v8)
    {
      if (++v10 == v11) {
        goto LABEL_4;
      }
    }
    v13 = v10 + 1;
    if (v10 + 1 != v11)
    {
      do
      {
        v10 = v13;
        float32x4_t v14 = (void *)*(v13 - 1);
        *(v13 - 1) = *v13;
        void *v13 = 0;

        v13 = v10 + 1;
      }
      while (v10 + 1 != v11);
      double v11 = *(void **)(v7 + 184);
    }
    while (v11 != v10)
    {
      float32x4_t v15 = (void *)*--v11;
    }
    *(void *)(v7 + 184) = v10;
    BOOL v12 = 1;
  }

  return v12;
}

- (void)initWithBoundingBox:(uint64_t)a1 minimumCellSize:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  id v5 = (void *)OUTLINED_FUNCTION_0(a1, a2);
  if (!v7)
  {
    id v8 = v6;
    do
    {
      v9 = *(void **)(v4 - 8);
      v4 -= 8;
    }
    while (v4 != v2);
    id v5 = *v8;
  }
  *(void *)(v3 + 184) = v2;
  operator delete(v5);
}

@end