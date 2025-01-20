@interface CPChunk
+ (float)chooseReferenceFontSizeFrom:(float)a3 and:(float)a4;
- (BOOL)boundsEqualsRect:(CGRect)a3 accuracy:(double)a4;
- (BOOL)geometricallyContains:(id)a3;
- (BOOL)intersectsChild:(CGRect)a3;
- (BOOL)overlapsHorizontallyWith:(id)a3;
- (BOOL)overlapsVerticallyWith:(id)a3;
- (BOOL)shrinksWithChildren;
- (CGPoint)anchor;
- (CGRect)adjustToPointBoundary:(CGRect)a3;
- (CGRect)bounds;
- (CGRect)renderedBounds;
- (CGSize)advance;
- (CPChunk)init;
- (double)bottom;
- (double)center;
- (double)left;
- (double)right;
- (double)rotationAngle;
- (double)top;
- (float)absoluteGapTo:(id)a3;
- (float)advanceDeltaAfterSpace;
- (float)clusterGapTo:(id)a3;
- (float)fontSize;
- (float)opticalLeading;
- (float)referenceAdvanceWidth;
- (id)copyAndSplitChildrenAtIndex:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)describeBounds;
- (id)newTakeChildren;
- (id)newTakeChildrenAmong:(id)a3;
- (int)clusterLevelHint;
- (int64_t)compareAnchorY:(id)a3;
- (int64_t)compareAnchorYDescending:(id)a3;
- (int64_t)compareChunkPosition:(id)a3;
- (int64_t)compareCommonAnchorX:(id)a3;
- (int64_t)compareInsertionOrder:(id)a3;
- (int64_t)compareLinearBounds:(id)a3;
- (int64_t)compareTopDescending:(id)a3;
- (int64_t)compareXBounds:(id)a3;
- (int64_t)compareY:(id)a3;
- (int64_t)compareYBounds:(id)a3;
- (int64_t)compareYDescending:(id)a3;
- (int64_t)compareYDescendingX:(id)a3;
- (int64_t)compareZ:(id)a3;
- (int64_t)compareZDescending:(id)a3;
- (int64_t)insertionOrder;
- (unsigned)chunkPosition;
- (void)accept:(id)a3;
- (void)add:(id)a3;
- (void)add:(id)a3 atIndex:(unsigned int)a4;
- (void)addChildrenOf:(id)a3;
- (void)fitBoundsToChildren;
- (void)orderedInsert:(id)a3 usingSelector:(SEL)a4;
- (void)remove:(id)a3;
- (void)removeAll;
- (void)resizeWith:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setChildren:(id)a3;
- (void)setChunkPosition:(unsigned int)a3;
- (void)setInsertionOrder:(int64_t)a3;
- (void)setShrinksWithChildren:(BOOL)a3;
- (void)sortUsingSelector:(SEL)a3;
- (void)translateObjectYBy:(double)a3;
@end

@implementation CPChunk

- (double)rotationAngle
{
  if (!self->super.parent) {
    return 0.0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0.0;
  }
  parent = self->super.parent;

  [(CPObject *)parent rotationAngle];
  return result;
}

- (void)setChunkPosition:(unsigned int)a3
{
  self->position = a3;
}

- (unsigned)chunkPosition
{
  return self->position;
}

- (void)translateObjectYBy:(double)a3
{
  self->bounds.origin.y = self->bounds.origin.y + a3;
}

- (BOOL)intersectsChild:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v8 = [(CPObject *)self count];
  if (v8 < 1)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    int v9 = v8;
    int v10 = 1;
    do
    {
      objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", (v10 - 1)), "bounds");
      v14.origin.CGFloat x = x;
      v14.origin.CGFloat y = y;
      v14.size.CGFloat width = width;
      v14.size.CGFloat height = height;
      BOOL v11 = CGRectIntersectsRect(v13, v14);
      if (v10 >= v9) {
        break;
      }
      ++v10;
    }
    while (!v11);
  }
  return v11;
}

- (void)setShrinksWithChildren:(BOOL)a3
{
  self->shrinksWithChildren = a3;
}

- (BOOL)shrinksWithChildren
{
  return self->shrinksWithChildren;
}

- (BOOL)boundsEqualsRect:(CGRect)a3 accuracy:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(CPChunk *)self bounds];
  double v13 = vabdd_f64(v12, y);
  if (vabdd_f64(v11, x) > a4 || v13 > a4) {
    return 0;
  }
  BOOL v16 = vabdd_f64(v9, width) <= a4;
  return vabdd_f64(v10, height) <= a4 && v16;
}

- (BOOL)geometricallyContains:(id)a3
{
  [a3 bounds];
  double v8 = v7;
  if (v7 == INFINITY || v4 == INFINITY) {
    return 0;
  }
  double v11 = v4;
  uint64_t v12 = v5;
  uint64_t v13 = v6;
  CGFloat x = self->bounds.origin.x;
  CGFloat y = self->bounds.origin.y;
  CGFloat width = self->bounds.size.width;
  CGFloat height = self->bounds.size.height;

  return CGRectContainsRect(*(CGRect *)&x, *(CGRect *)&v8);
}

- (BOOL)overlapsVerticallyWith:(id)a3
{
  [(CPChunk *)self bounds];
  double x = v4;
  CGFloat v7 = v6;
  double width = v8;
  double v11 = v10;
  [a3 bounds];
  double v13 = v12;
  CGFloat v24 = v14;
  double v16 = v15;
  double v18 = v17;
  if (width < 0.0 || v11 < 0.0)
  {
    v25.origin.double x = x;
    v25.origin.CGFloat y = v7;
    v25.size.double width = width;
    v25.size.CGFloat height = v11;
    *(void *)&double v19 = (unint64_t)CGRectStandardize(v25);
    v26.origin.double x = x;
    v26.origin.CGFloat y = v7;
    v26.size.double width = width;
    v26.size.CGFloat height = v11;
    CGRect v27 = CGRectStandardize(v26);
    double x = v27.origin.x;
    double width = v27.size.width;
  }
  else
  {
    double v19 = x;
  }
  if (v16 < 0.0 || v18 < 0.0)
  {
    v28.origin.double x = v13;
    v28.origin.CGFloat y = v24;
    v28.size.double width = v16;
    v28.size.CGFloat height = v18;
    unint64_t v21 = (unint64_t)CGRectStandardize(v28);
    v29.origin.double x = v13;
    v29.origin.CGFloat y = v24;
    v29.size.double width = v16;
    v29.size.CGFloat height = v18;
    *(CGRect *)&double v20 = CGRectStandardize(v29);
    double v16 = v22;
    double v13 = *(double *)&v21;
  }
  else
  {
    double v20 = v13;
  }
  return v13 < x + width && v20 + v16 > v19;
}

- (BOOL)overlapsHorizontallyWith:(id)a3
{
  [(CPChunk *)self top];
  double v6 = v5;
  [(CPChunk *)self bottom];
  double v8 = v7;
  [a3 top];
  double v10 = v9;
  [a3 bottom];
  return v10 > v8 && v11 < v6;
}

- (void)orderedInsert:(id)a3 usingSelector:(SEL)a4
{
  uint64_t v7 = [(CPObject *)self count];
  if ((int)v7 < 1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    while (objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", v9), "performSelector:withObject:", a4, a3) != 1)
    {
      uint64_t v9 = (v9 + 1);
      if (v8 == v9)
      {
        uint64_t v9 = v8;
        break;
      }
    }
  }

  [(CPChunk *)self add:a3 atIndex:v9];
}

- (int)clusterLevelHint
{
  return 0;
}

- (CGSize)advance
{
  double width = self->bounds.size.width;
  double height = self->bounds.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (float)fontSize
{
  return 0.0;
}

- (double)bottom
{
  [(CPChunk *)self bounds];
  if (v4 < 0.0 || v5 < 0.0) {
    *(CGRect *)(&v3 - 1) = CGRectStandardize(*(CGRect *)&v2);
  }
  return v3;
}

- (double)top
{
  [(CPChunk *)self bounds];
  if (v4 < 0.0 || v5 < 0.0) {
    *(CGRect *)(&v3 - 1) = CGRectStandardize(*(CGRect *)&v2);
  }
  return v3 + v5;
}

- (double)center
{
  [(CPChunk *)self bounds];
  return v3 + v2 * 0.5;
}

- (double)right
{
  [(CPChunk *)self bounds];
  if (v4 < 0.0 || v5 < 0.0) {
    *(CGRect *)&double v2 = CGRectStandardize(*(CGRect *)&v2);
  }
  return v2 + v4;
}

- (double)left
{
  [(CPChunk *)self bounds];
  if (v4 < 0.0 || v5 < 0.0) {
    *(void *)&double result = (unint64_t)CGRectStandardize(*(CGRect *)&result);
  }
  return result;
}

- (int64_t)compareChunkPosition:(id)a3
{
  unsigned int v4 = [(CPChunk *)self chunkPosition];
  unsigned int v5 = [a3 chunkPosition];
  if (v4 < v5) {
    return -1;
  }
  else {
    return v4 != v5;
  }
}

- (int64_t)compareYDescendingX:(id)a3
{
  [(CPChunk *)self anchor];
  double v6 = v5;
  [a3 anchor];
  if (v6 < v7) {
    return 1;
  }
  if (v6 > v7) {
    return -1;
  }
  [(CPChunk *)self anchor];
  double v10 = v9;
  [a3 anchor];
  if (v10 >= v11) {
    return v10 > v11;
  }
  else {
    return -1;
  }
}

- (int64_t)compareYDescending:(id)a3
{
  [(CPChunk *)self anchor];
  double v5 = v4;
  [a3 anchor];
  if (v5 <= v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 < v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (int64_t)compareTopDescending:(id)a3
{
  [(CPChunk *)self top];
  double v5 = v4;
  [a3 top];
  if (v5 <= v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 < v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (int64_t)compareYBounds:(id)a3
{
  [(CPChunk *)self bounds];
  double v5 = v4;
  [a3 bounds];
  double v7 = vabdd_f64(v5, v6);
  int64_t v8 = -1;
  if (v5 >= v6) {
    int64_t v8 = 1;
  }
  if (v7 >= 0.0001) {
    return v8;
  }
  else {
    return 0;
  }
}

- (int64_t)compareY:(id)a3
{
  [(CPChunk *)self anchor];
  double v5 = v4;
  [a3 anchor];
  double v7 = vabdd_f64(v5, v6);
  int64_t v8 = -1;
  if (v5 >= v6) {
    int64_t v8 = 1;
  }
  if (v7 >= 0.0001) {
    return v8;
  }
  else {
    return 0;
  }
}

- (int64_t)compareLinearBounds:(id)a3
{
  double v4 = fmax(self->bounds.size.height, self->bounds.size.width);
  [a3 bounds];
  double v6 = v5;
  [a3 bounds];
  double v8 = fmax(v6, v7);
  if (v4 <= v8) {
    return v4 < v8;
  }
  else {
    return -1;
  }
}

- (int64_t)compareXBounds:(id)a3
{
  double x = self->bounds.origin.x;
  [a3 bounds];
  if (x < v4) {
    return -1;
  }
  else {
    return x != v4;
  }
}

- (int64_t)compareZDescending:(id)a3
{
  int64_t v4 = [(CPObject *)self zOrder];
  uint64_t v5 = [a3 zOrder];
  if (v4 == v5) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = -1;
  }
  if (v4 < v5) {
    return 1;
  }
  else {
    return v6;
  }
}

- (int64_t)compareZ:(id)a3
{
  int64_t v4 = [(CPObject *)self zOrder];
  uint64_t v5 = [a3 zOrder];
  if (v4 < v5) {
    return -1;
  }
  else {
    return v4 != v5;
  }
}

- (int64_t)compareInsertionOrder:(id)a3
{
  int64_t v4 = [(CPChunk *)self insertionOrder];
  uint64_t v5 = [a3 insertionOrder];
  if (v4 < v5) {
    return -1;
  }
  else {
    return v4 != v5;
  }
}

- (int64_t)compareAnchorYDescending:(id)a3
{
  [(CPChunk *)self anchor];
  double v5 = v4;
  [a3 anchor];
  if (v5 <= v6) {
    int64_t v7 = 0;
  }
  else {
    int64_t v7 = -1;
  }
  if (v5 < v6) {
    return 1;
  }
  else {
    return v7;
  }
}

- (int64_t)compareCommonAnchorX:(id)a3
{
  [(CPChunk *)self anchor];
  double v5 = v4;
  [a3 anchor];
  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 != v6;
  }
}

- (int64_t)compareAnchorY:(id)a3
{
  [(CPChunk *)self anchor];
  double v5 = v4;
  [a3 anchor];
  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 != v6;
  }
}

- (void)sortUsingSelector:(SEL)a3
{
}

- (int64_t)insertionOrder
{
  return self->insertionOrder;
}

- (void)setInsertionOrder:(int64_t)a3
{
  self->insertionOrder = a3;
  if (self->super.zOrder < a3) {
    self->super.zOrder = a3;
  }
}

- (void)resizeWith:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CPChunk *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [a3 bounds];
    v20.origin.double x = v13;
    v20.origin.CGFloat y = v14;
    v20.size.double width = v15;
    v20.size.double height = v16;
    v19.origin.double x = v6;
    v19.origin.CGFloat y = v8;
    v19.size.double width = v10;
    v19.size.double height = v12;
    self->bounds = CGRectUnion(v19, v20);
  }
  if (self->super.parent)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      parent = self->super.parent;
      [(CPObject *)parent resizeWith:self];
    }
  }
}

- (void)fitBoundsToChildren
{
  uint64_t v3 = [(NSMutableArray *)self->super.children count];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      double v5 = (void *)[(NSMutableArray *)self->super.children objectAtIndex:i];
      if (i || !self->shrinksWithChildren)
      {
        p_bounds = &self->bounds;
        [v5 bounds];
        v13.origin.double x = v7;
        v13.origin.CGFloat y = v8;
        v13.size.double width = v9;
        v13.size.double height = v10;
        CGRect v12 = CGRectUnion(self->bounds, v13);
      }
      else
      {
        p_bounds = &self->bounds;
        [v5 bounds];
      }
      CGRect *p_bounds = v12;
    }
    p_dirtyBounds = &self->dirtyBounds;
  }
  else
  {
    p_dirtyBounds = &self->dirtyBounds;
    if (!self->dirtyBounds) {
      return;
    }
    self->bounds = CGRectNull;
  }
  BOOL *p_dirtyBounds = 0;
}

- (float)referenceAdvanceWidth
{
  [(CPChunk *)self bounds];
  return v2;
}

- (float)absoluteGapTo:(id)a3
{
  [a3 advanceDeltaAfterSpace];
  float v6 = v5;
  [(CPChunk *)self advance];
  float v8 = v7 + (float)(v6 * 0.5);
  [a3 anchor];
  double v10 = v9;
  [(CPChunk *)self anchor];
  return v10 - v11 - v8;
}

- (float)advanceDeltaAfterSpace
{
  return 0.0;
}

- (float)clusterGapTo:(id)a3
{
  [(CPChunk *)self fontSize];
  int v6 = v5;
  [a3 fontSize];
  LODWORD(v8) = v7;
  LODWORD(v9) = v6;
  +[CPChunk chooseReferenceFontSizeFrom:v9 and:v8];
  float v11 = v10;
  [(CPChunk *)self absoluteGapTo:a3];
  return v12 / v11;
}

- (CGPoint)anchor
{
  double x = self->bounds.origin.x;
  double y = self->bounds.origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)describeBounds
{
  return (id)[NSString stringWithFormat:@"CGRect{{%f, %f}, {%f, %f}}", *(void *)&self->bounds.origin.x, *(void *)&self->bounds.origin.y, *(void *)&self->bounds.size.width, *(void *)&self->bounds.size.height];
}

- (CGRect)renderedBounds
{
  if ([(NSMutableArray *)self->super.children count])
  {
    if ([(NSMutableArray *)self->super.children count])
    {
      uint64_t v3 = 0;
      CGFloat width = 0.0;
      unsigned int v5 = 1;
      CGFloat x = INFINITY;
      CGFloat y = INFINITY;
      CGFloat height = 0.0;
      do
      {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->super.children, "objectAtIndex:", v3), "renderedBounds");
        v25.origin.CGFloat x = v9;
        v25.origin.CGFloat y = v10;
        v25.size.CGFloat width = v11;
        v25.size.CGFloat height = v12;
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        CGRect v23 = CGRectUnion(v22, v25);
        CGFloat x = v23.origin.x;
        CGFloat y = v23.origin.y;
        CGFloat width = v23.size.width;
        CGFloat height = v23.size.height;
        uint64_t v3 = v5;
      }
      while ([(NSMutableArray *)self->super.children count] > (unint64_t)v5++);
    }
    else
    {
      CGFloat height = 0.0;
      CGFloat y = INFINITY;
      CGFloat width = 0.0;
      CGFloat x = INFINITY;
    }
  }
  else
  {
    [(CPChunk *)self bounds];
    CGFloat x = v14;
    CGFloat y = v15;
    CGFloat width = v16;
    CGFloat height = v17;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)adjustToPointBoundary:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a3.size.width < 0.0 || a3.size.height < 0.0)
  {
    CGRect v15 = CGRectStandardize(a3);
    double v8 = v15.origin.x;
    CGFloat v10 = v15.size.width;
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.double width = width;
    v15.size.CGFloat height = height;
    double v7 = trunc(COERCE_DOUBLE(CGRectStandardize(v15)));
    v16.origin.CGFloat x = v7;
    v16.origin.CGFloat y = y;
    v16.size.double width = width;
    v16.size.CGFloat height = height;
    *(void *)&double v9 = (unint64_t)CGRectStandardize(v16);
    double width = v10;
  }
  else
  {
    double v7 = trunc(a3.origin.x);
    double v8 = a3.origin.x;
    double v9 = v7;
  }
  double v11 = ceil(v8 + width) - v9;
  double v12 = v7;
  double v13 = y;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.double width = v11;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)bounds
{
  if (self->dirtyBounds) {
    [(CPChunk *)self fitBoundsToChildren];
  }
  double x = self->bounds.origin.x;
  double y = self->bounds.origin.y;
  double width = self->bounds.size.width;
  double height = self->bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->bounds = a3;
  self->dirtyBounds = 0;
}

- (void)setChildren:(id)a3
{
  children = self->super.children;
  if (children != a3)
  {

    int v6 = (NSMutableArray *)a3;
    self->super.children = v6;
    uint64_t v7 = [(NSMutableArray *)v6 count];
    if (v7)
    {
      uint64_t v8 = 0;
      do
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->super.children, "objectAtIndex:", v8++), "setParent:", self);
      while (v7 != v8);
    }
    self->dirtyBounds = 1;
    self->super.zOrder = 0;
  }
}

- (id)newTakeChildrenAmong:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPChunk;
  id v4 = [(CPObject *)&v7 newTakeChildrenAmong:a3];
  unsigned int v5 = v4;
  if (self->shrinksWithChildren && [v4 count]) {
    self->dirtyBounds = 1;
  }
  return v5;
}

- (id)newTakeChildren
{
  if (self->shrinksWithChildren && [(NSMutableArray *)self->super.children count]) {
    self->dirtyBounds = 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CPChunk;
  return [(CPObject *)&v4 newTakeChildren];
}

- (void)removeAll
{
  if (self->shrinksWithChildren && [(NSMutableArray *)self->super.children count]) {
    self->dirtyBounds = 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)CPChunk;
  [(CPObject *)&v3 removeAll];
}

- (void)remove:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPChunk;
  [(CPObject *)&v4 remove:a3];
  if (self->shrinksWithChildren) {
    self->dirtyBounds = 1;
  }
}

- (void)addChildrenOf:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPChunk;
  [(CPObject *)&v4 addChildrenOf:a3];
  [(CPChunk *)self fitBoundsToChildren];
}

- (void)add:(id)a3 atIndex:(unsigned int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CPChunk;
  [(CPObject *)&v6 add:a3 atIndex:*(void *)&a4];
  [(CPChunk *)self resizeWith:a3];
  -[CPObject updateZOrder:](self, "updateZOrder:", [a3 zOrder]);
}

- (void)add:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPChunk;
  -[CPObject add:](&v5, sel_add_);
  [(CPChunk *)self resizeWith:a3];
  -[CPObject updateZOrder:](self, "updateZOrder:", (int)[a3 zOrder]);
}

- (float)opticalLeading
{
  return 0.0;
}

- (void)accept:(id)a3
{
}

- (id)copyAndSplitChildrenAtIndex:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CPChunk;
  id v4 = [(CPObject *)&v6 copyAndSplitChildrenAtIndex:*(void *)&a3];
  self->dirtyBounds = 1;
  *((unsigned char *)v4 + 81) = 1;
  if ([(NSMutableArray *)self->super.children count]) {
    [(CPObject *)self recomputeZOrder];
  }
  if ([*((id *)v4 + 2) count]) {
    [v4 recomputeZOrder];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPChunk;
  return [(CPObject *)&v4 copyWithZone:a3];
}

- (CPChunk)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPChunk;
  CGRect result = [(CPObject *)&v3 init];
  if (result)
  {
    result->shrinksWithChildren = 1;
    result->bounds = CGRectNull;
  }
  return result;
}

+ (float)chooseReferenceFontSizeFrom:(float)a3 and:(float)a4
{
  if (a3 > 0.0 && (a4 >= a3 || a4 == 0.0)) {
    return a3;
  }
  float v4 = 12.0;
  if (a4 > 0.0)
  {
    if (a3 > a4 || a3 == 0.0) {
      return a4;
    }
    else {
      return 12.0;
    }
  }
  return v4;
}

@end