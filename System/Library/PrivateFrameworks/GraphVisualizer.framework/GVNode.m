@interface GVNode
- (BOOL)hasEdgeFrom:(id)a3;
- (BOOL)hasEdgeTo:(id)a3;
- (CGPoint)center;
- (CGPoint)origin;
- (CGRect)frame;
- (CGSize)size;
- (GVNode)init;
- (GVNode)next;
- (GVNode)prev;
- (NSMutableOrderedSet)inNodes;
- (NSMutableOrderedSet)outNodes;
- (double)cx;
- (double)cy;
- (double)h;
- (double)w;
- (double)x;
- (double)y;
- (id)description;
- (int64_t)index;
- (int64_t)rank;
- (unint64_t)inDegree;
- (unint64_t)inPriority;
- (unint64_t)outDegree;
- (unint64_t)outPriority;
- (void)addEdgeFrom:(id)a3;
- (void)addEdgeTo:(id)a3;
- (void)computePriority;
- (void)dealloc;
- (void)removeEdgeFrom:(id)a3;
- (void)removeEdgeTo:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setCx:(double)a3;
- (void)setCy:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setH:(double)a3;
- (void)setInNodes:(id)a3;
- (void)setInPriority:(unint64_t)a3;
- (void)setIndex:(int64_t)a3;
- (void)setNext:(id)a3;
- (void)setOrigin:(CGPoint)a3;
- (void)setOutNodes:(id)a3;
- (void)setOutPriority:(unint64_t)a3;
- (void)setPrev:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setSize:(CGSize)a3;
- (void)setW:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)traversePostorder:(int)a3 withCallback:(id)a4 stopper:(id)a5 randomize:(BOOL)a6;
- (void)traversePreorder:(int)a3 withCallback:(id)a4 randomize:(BOOL)a5;
@end

@implementation GVNode

- (GVNode)init
{
  v5.receiver = self;
  v5.super_class = (Class)GVNode;
  v2 = [(GVNode *)&v5 init];
  v3 = (GVNode *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    *((void *)v2 + 7) = 0;
    *((void *)v2 + 8) = 0;
    *((void *)v2 + 11) = 0;
    *((void *)v2 + 12) = 0;
    *((void *)v2 + 5) = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v3->outNodes = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GVNode;
  [(GVNode *)&v3 dealloc];
}

- (double)cx
{
  return self->x + self->w * 0.5;
}

- (void)setCx:(double)a3
{
  self->x = a3 + self->w * -0.5;
}

- (double)cy
{
  return self->y + self->h * 0.5;
}

- (void)setCy:(double)a3
{
  self->y = a3 + self->h * -0.5;
}

- (CGRect)frame
{
  double x = self->x;
  double y = self->y;
  double w = self->w;
  double h = self->h;
  result.size.height = h;
  result.size.widtdouble h = w;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  *(CGRect *)&self->double x = a3;
}

- (CGPoint)origin
{
  double x = self->x;
  double y = self->y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  *(CGPoint *)&self->double x = a3;
}

- (CGPoint)center
{
  __asm { FMOV            V2.2D, #0.5 }
  float64x2_t v7 = vaddq_f64(*(float64x2_t *)&self->x, vmulq_f64(*(float64x2_t *)&self->w, _Q2));
  double v8 = v7.f64[1];
  result.double x = v7.f64[0];
  result.double y = v8;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  __asm { FMOV            V3.2D, #-0.5 }
  CGFloat y = a3.y;
  *(float64x2_t *)&self->double x = vaddq_f64((float64x2_t)a3, vmulq_f64(*(float64x2_t *)&self->w, _Q3));
}

- (CGSize)size
{
  double w = self->w;
  double h = self->h;
  result.height = h;
  result.widtdouble h = w;
  return result;
}

- (void)setSize:(CGSize)a3
{
  *(CGSize *)&self->double w = a3;
}

- (unint64_t)inDegree
{
  v2 = [(GVNode *)self inNodes];

  return [(NSMutableOrderedSet *)v2 count];
}

- (unint64_t)outDegree
{
  v2 = [(GVNode *)self outNodes];

  return [(NSMutableOrderedSet *)v2 count];
}

- (BOOL)hasEdgeFrom:(id)a3
{
  return [(NSMutableOrderedSet *)self->inNodes containsObject:a3];
}

- (BOOL)hasEdgeTo:(id)a3
{
  return [(NSMutableOrderedSet *)self->outNodes containsObject:a3];
}

- (void)addEdgeFrom:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->inNodes, "addObject:");
  objc_super v5 = (void *)[a3 outNodes];

  [v5 addObject:self];
}

- (void)addEdgeTo:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->outNodes, "addObject:");
  objc_super v5 = (void *)[a3 inNodes];

  [v5 addObject:self];
}

- (void)removeEdgeFrom:(id)a3
{
  -[NSMutableOrderedSet removeObject:](self->inNodes, "removeObject:");
  objc_super v5 = (void *)[a3 outNodes];

  [v5 removeObject:self];
}

- (void)removeEdgeTo:(id)a3
{
  -[NSMutableOrderedSet removeObject:](self->outNodes, "removeObject:");
  objc_super v5 = (void *)[a3 inNodes];

  [v5 removeObject:self];
}

- (void)computePriority
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->inPrioritCGFloat y = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  inNodes = self->inNodes;
  uint64_t v4 = [(NSMutableOrderedSet *)inNodes countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(inNodes);
        }
        if ([*(id *)(*((void *)&v19 + 1) + 8 * i) isMemberOfClass:objc_opt_class()]) {
          uint64_t v8 = 2;
        }
        else {
          uint64_t v8 = 1;
        }
        self->inPriority += v8;
      }
      uint64_t v5 = [(NSMutableOrderedSet *)inNodes countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
  self->outPrioritCGFloat y = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  outNodes = self->outNodes;
  uint64_t v10 = [(NSMutableOrderedSet *)outNodes countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(outNodes);
        }
        if ([*(id *)(*((void *)&v15 + 1) + 8 * j) isMemberOfClass:objc_opt_class()]) {
          uint64_t v14 = 2;
        }
        else {
          uint64_t v14 = 1;
        }
        self->inPriority += v14;
      }
      uint64_t v11 = [(NSMutableOrderedSet *)outNodes countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v11);
  }
}

- (id)description
{
  objc_super v3 = NSString;
  ClassName = object_getClassName(self);
  [(GVNode *)self center];
  uint64_t v6 = v5;
  [(GVNode *)self center];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%p [%s center=<%f,%f>]", self, ClassName, v6, v7);
}

- (void)traversePostorder:(int)a3 withCallback:(id)a4 stopper:(id)a5 randomize:(BOOL)a6
{
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA80] set];
  if (a6)
  {
    _traverse_postorder_randomized((uint64_t)self, 0, 0, a3, (uint64_t)a5, (uint64_t)a4, v11);
  }
  else
  {
    _traverse_postorder((uint64_t)self, 0, 0, a3, (uint64_t)a5, (uint64_t)a4, v11);
  }
}

- (void)traversePreorder:(int)a3 withCallback:(id)a4 randomize:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v9 = (void *)[MEMORY[0x1E4F1CA80] set];
  uint64_t v10 = v9;
  if (a5)
  {
    if (self
      && ([v9 containsObject:self] & 1) == 0
      && ((*((uint64_t (**)(id, GVNode *, void, void))a4 + 2))(a4, self, 0, 0) & 1) == 0)
    {
      [v10 addObject:self];
      if (a3 == 2)
      {
        long long v16 = (void *)[MEMORY[0x1E4F1CA70] orderedSet];
        objc_msgSend(v16, "unionOrderedSet:", -[GVNode inNodes](self, "inNodes"));
        objc_msgSend(v16, "unionOrderedSet:", -[GVNode outNodes](self, "outNodes"));
        [v16 minusSet:v10];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v17 = fisherYates(v16);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v28 != v20) {
                objc_enumerationMutation(v17);
              }
              _traverse_preorder(*(void *)(*((void *)&v27 + 1) + 8 * i), (uint64_t)self, 1, 2, (uint64_t)a4, v10);
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v19);
        }
      }
      else if (a3 == 1)
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v22 = fisherYates([(GVNode *)self inNodes]);
        uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v28 != v25) {
                objc_enumerationMutation(v22);
              }
              _traverse_preorder(*(void *)(*((void *)&v27 + 1) + 8 * j), (uint64_t)self, 1, 1, (uint64_t)a4, v10);
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v24);
        }
      }
      else
      {
        if (a3) {
          -[GVNode traversePreorder:withCallback:randomize:]();
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v11 = fisherYates([(GVNode *)self outNodes]);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v28;
          do
          {
            for (uint64_t k = 0; k != v13; ++k)
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v11);
              }
              _traverse_preorder(*(void *)(*((void *)&v27 + 1) + 8 * k), (uint64_t)self, 1, 0, (uint64_t)a4, v10);
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
          }
          while (v13);
        }
      }
    }
  }
  else
  {
    _traverse_preorder((uint64_t)self, 0, 0, a3, (uint64_t)a4, v9);
  }
}

- (double)x
{
  return self->x;
}

- (void)setX:(double)a3
{
  self->double x = a3;
}

- (double)y
{
  return self->y;
}

- (void)setY:(double)a3
{
  self->CGFloat y = a3;
}

- (double)w
{
  return self->w;
}

- (void)setW:(double)a3
{
  self->double w = a3;
}

- (double)h
{
  return self->h;
}

- (void)setH:(double)a3
{
  self->double h = a3;
}

- (NSMutableOrderedSet)inNodes
{
  return self->inNodes;
}

- (void)setInNodes:(id)a3
{
}

- (NSMutableOrderedSet)outNodes
{
  return self->outNodes;
}

- (void)setOutNodes:(id)a3
{
}

- (int64_t)rank
{
  return self->rank;
}

- (void)setRank:(int64_t)a3
{
  self->ranuint64_t k = a3;
}

- (int64_t)index
{
  return self->index;
}

- (void)setIndex:(int64_t)a3
{
  self->indedouble x = a3;
}

- (GVNode)prev
{
  return self->prev;
}

- (void)setPrev:(id)a3
{
  self->prev = (GVNode *)a3;
}

- (GVNode)next
{
  return self->next;
}

- (void)setNext:(id)a3
{
  self->next = (GVNode *)a3;
}

- (unint64_t)inPriority
{
  return self->inPriority;
}

- (void)setInPriority:(unint64_t)a3
{
  self->inPrioritCGFloat y = a3;
}

- (unint64_t)outPriority
{
  return self->outPriority;
}

- (void)setOutPriority:(unint64_t)a3
{
  self->outPrioritCGFloat y = a3;
}

- (void)traversePreorder:withCallback:randomize:.cold.1()
{
}

@end