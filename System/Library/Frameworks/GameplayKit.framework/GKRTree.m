@interface GKRTree
+ (GKRTree)treeWithMaxNumberOfChildren:(NSUInteger)maxNumberOfChildren;
- (GKRTree)init;
- (GKRTree)initWithMaxNumberOfChildren:(NSUInteger)maxNumberOfChildren;
- (NSArray)elementsInBoundingRectMin:(vector_float2)rectMin rectMax:(vector_float2)rectMax;
- (NSUInteger)queryReserve;
- (void)addElement:(id)element boundingRectMin:(vector_float2)boundingRectMin boundingRectMax:(vector_float2)boundingRectMax splitStrategy:(GKRTreeSplitStrategy)splitStrategy;
- (void)dealloc;
- (void)removeElement:(id)element boundingRectMin:(vector_float2)boundingRectMin boundingRectMax:(vector_float2)boundingRectMax;
- (void)setQueryReserve:(NSUInteger)queryReserve;
@end

@implementation GKRTree

- (void)dealloc
{
  cRTree = (id *)self->_cRTree;
  if (cRTree)
  {

    _ZNSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEED1B8ne180100Ev(cRTree + 3);
    MEMORY[0x237DF7CA0](cRTree, 0x10A0C40EBF3C9F8);
  }
  v4.receiver = self;
  v4.super_class = (Class)GKRTree;
  [(GKRTree *)&v4 dealloc];
}

- (GKRTree)init
{
  return [(GKRTree *)self initWithMaxNumberOfChildren:0];
}

+ (GKRTree)treeWithMaxNumberOfChildren:(NSUInteger)maxNumberOfChildren
{
  v3 = (void *)[objc_alloc((Class)a1) initWithMaxNumberOfChildren:maxNumberOfChildren];

  return (GKRTree *)v3;
}

- (GKRTree)initWithMaxNumberOfChildren:(NSUInteger)maxNumberOfChildren
{
  v4.receiver = self;
  v4.super_class = (Class)GKRTree;
  if ([(GKRTree *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)addElement:(id)element boundingRectMin:(vector_float2)boundingRectMin boundingRectMax:(vector_float2)boundingRectMax splitStrategy:(GKRTreeSplitStrategy)splitStrategy
{
}

- (void)removeElement:(id)element boundingRectMin:(vector_float2)boundingRectMin boundingRectMax:(vector_float2)boundingRectMax
{
  id v8 = element;
  cRTree = self->_cRTree;
  id v10 = v8;
  if (cRTree[4] != cRTree[3]) {
    _ZN12GKCRTreeNodeI8NSObjectDv2_fE12RemoveObjectEPS0_S1_S1_(cRTree, v10, *(double *)&boundingRectMin, *(double *)&boundingRectMax);
  }
}

- (NSArray)elementsInBoundingRectMin:(vector_float2)rectMin rectMax:(vector_float2)rectMax
{
  __p = 0;
  v18 = 0;
  uint64_t v19 = 0;
  std::vector<NSObject * {__strong}>::reserve((uint64_t)&__p, [(GKRTree *)self queryReserve]);
  cRTree = (float32x2_t *)self->_cRTree;
  float32x2_t v8 = cRTree[2];
  if ((vcgt_f32((float32x2_t)rectMin, v8).u32[0] & 1) == 0)
  {
    float32x2_t v9 = cRTree[1];
    if (vcge_f32((float32x2_t)rectMax, v9).u32[0])
    {
      int32x2_t v10 = vcge_f32((float32x2_t)vzip2_s32((int32x2_t)rectMax, (int32x2_t)v8), (float32x2_t)vzip2_s32((int32x2_t)v9, (int32x2_t)rectMin));
      if (v10.i8[4] & 1) != 0 && (v10.i8[0]) {
        _ZN12GKCRTreeNodeI8NSObjectDv2_fE5QueryES1_S1_RNSt3__16vectorIU8__strongPS0_NS3_9allocatorIS6_EEEE(cRTree, &__p, (float32x2_t)rectMin, (float32x2_t)rectMax);
      }
    }
  }
  v11 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:");
  v12 = (char *)__p;
  if (__p)
  {
    v13 = v18;
    v14 = __p;
    if (v18 != __p)
    {
      do
      {
        v15 = (void *)*((void *)v13 - 1);
        v13 -= 8;
      }
      while (v13 != v12);
      v14 = __p;
    }
    v18 = v12;
    operator delete(v14);
  }

  return (NSArray *)v11;
}

- (NSUInteger)queryReserve
{
  return self->_queryReserve;
}

- (void)setQueryReserve:(NSUInteger)queryReserve
{
  self->_queryReserve = queryReserve;
}

@end