@interface CPZoneBorder
+ (CGRect)extendRect:(CGRect)a3;
+ (int)clockwiseWindingNumberOfShapeWithBorders:(id)a3;
+ (void)addIntersectionBetweenBorder:(id)a3 andBorder:(id)a4 atRect:(CGRect)a5;
+ (void)outerVertices:(CGPoint *)a3 fromBorders:(id)a4 swollenBy:(double)a5;
+ (void)removeIntersectionBetweenBorder:(id)a3 andBorder:(id)a4;
- (BOOL)continues:(id)a3;
- (BOOL)crosses:(id)a3;
- (BOOL)extractCycleTo:(id)a3 goingForward:(BOOL)a4 startingAtIndex:(unsigned int)a5;
- (BOOL)extractCycleTo:(id)a3 goingForward:(BOOL)a4 throughIntersectionIndex:(unsigned int)a5 returningTo:(id)a6 atRect:(CGRect *)a7;
- (BOOL)hasBackwardVector;
- (BOOL)hasClockwiseVectorAtIndex:(unsigned int)a3 startingForward:(BOOL)a4;
- (BOOL)hasCounterclockwiseVectorAtIndex:(unsigned int)a3 startingForward:(BOOL)a4;
- (BOOL)hasForwardVector;
- (BOOL)hasNeighborShape:(id)a3;
- (BOOL)hasNeighborShape:(id)a3 atSide:(int)a4;
- (BOOL)hasVectorGoingForward:(BOOL)a3 startingAtIndex:(unsigned int *)a4;
- (BOOL)intersectsWith:(id)a3 atRect:(CGRect *)a4;
- (BOOL)isHorizontal;
- (BOOL)isVertical;
- (BOOL)windsClockwiseOnto:(id)a3;
- (CGRect)bounds;
- (CPZoneBorder)init;
- (CPZoneBorder)initWithGraphicObject:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutIntersections;
- (id)getNextBorder:(unsigned int)a3;
- (id)graphicObjectAtIndex:(unsigned int)a3;
- (id)graphicObjects;
- (id)initSuper;
- (id)neighborAtIndex:(unsigned int)a3;
- (id)ownerArray;
- (id)page;
- (int64_t)compareXBounds:(id)a3;
- (int64_t)compareYBounds:(id)a3;
- (int64_t)zOrder;
- (unsigned)graphicObjectCount;
- (unsigned)indexOfIntersectionWith:(id)a3;
- (unsigned)intersectionCount;
- (unsigned)neighborCount;
- (void)addGraphicObject:(id)a3;
- (void)addNeighbor:(id)a3;
- (void)addToArray:(id)a3;
- (void)addToArray:(id)a3 atIndex:(unsigned int)a4;
- (void)combine:(id)a3;
- (void)dealloc;
- (void)instantiateVectors;
- (void)removeFromArray;
- (void)removeFromArrayAtIndex:(unsigned int)a3;
- (void)removeGraphicObjectAtIndex:(unsigned int)a3;
- (void)removeLooseThreadsStartingFrom:(id)a3;
- (void)removeNeighborAtIndex:(unsigned int)a3;
- (void)setBounds:(CGRect)a3;
- (void)setHasBackwardVector:(BOOL)a3;
- (void)setHasForwardVector:(BOOL)a3;
- (void)setSide:(int)a3 ofPage:(id)a4;
- (void)trimToLastIntersections;
@end

@implementation CPZoneBorder

- (int64_t)compareYBounds:(id)a3
{
  double y = self->bounds.origin.y;
  [a3 bounds];
  if (y < v4) {
    return -1;
  }
  else {
    return y != v4;
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

- (void)removeLooseThreadsStartingFrom:(id)a3
{
  if ([(CPZoneBorder *)self intersectionCount])
  {
    unsigned int v5 = 0;
    do
    {
      v6 = (void *)[(NSMutableArray *)self->intersections objectAtIndex:(int)v5];
      v7 = (id *)[v6 intersectingBorder];
      if (v7 != a3)
      {
        v8 = v7;
        [(NSMutableArray *)self->intersections removeObject:v6];
        unsigned int v9 = [v8 indexOfIntersectionWith:self];
        if (v9 < [v8 intersectionCount]) {
          [v8[9] removeObjectAtIndex:v9];
        }
        if ([v8 intersectionCount] <= 1)
        {
          if ([v8 intersectionCount] == 1) {
            [v8 removeLooseThreadsStartingFrom:self];
          }
          [v8 removeFromArray];
        }
        --v5;
      }
      ++v5;
    }
    while (v5 < [(CPZoneBorder *)self intersectionCount]);
  }
}

- (void)trimToLastIntersections
{
  unsigned int v3 = [(CPZoneBorder *)self intersectionCount];
  if (v3)
  {
    unsigned int v4 = v3;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", 0), "intersectionRect");
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v4 - 1), "intersectionRect");
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    if (self->isHorizontal)
    {
      CGFloat x = self->bounds.origin.x;
      double width = self->bounds.size.width;
      self->overhangMin = x;
      self->overhangMaCGFloat x = x + width;
      if (v10 < 0.0 || v12 < 0.0)
      {
        v37.origin.CGFloat x = v6;
        v37.origin.CGFloat y = v8;
        v37.size.double width = v10;
        v37.size.double height = v12;
        double v23 = v16;
        unint64_t v24 = (unint64_t)CGRectStandardize(v37);
        double v16 = v23;
        double v6 = *(double *)&v24;
      }
      self->bounds.origin.CGFloat x = v6;
      if (v18 < 0.0 || v20 < 0.0)
      {
        v38.origin.CGFloat x = v14;
        v38.origin.CGFloat y = v16;
        v38.size.double width = v18;
        v38.size.double height = v20;
        CGRect v39 = CGRectStandardize(v38);
        double v14 = v39.origin.x;
        double v18 = v39.size.width;
      }
      double height = self->bounds.size.height;
      if (width < 0.0 || height < 0.0)
      {
        CGFloat y = self->bounds.origin.y;
        double v27 = v6;
        double v28 = width;
        *(void *)&double v6 = (unint64_t)CGRectStandardize(*(CGRect *)(&height - 3));
      }
      self->bounds.size.double width = v14 + v18 - v6;
    }
    else
    {
      CGFloat v29 = self->bounds.origin.y;
      double v30 = self->bounds.size.height;
      self->overhangMin = v29;
      self->overhangMaCGFloat x = v29 + v30;
      if (v10 < 0.0 || v12 < 0.0)
      {
        v40.origin.CGFloat x = v6;
        v40.origin.CGFloat y = v8;
        v40.size.double width = v10;
        v40.size.double height = v12;
        double v31 = v16;
        CGRect v41 = CGRectStandardize(v40);
        double v16 = v31;
        double v8 = v41.origin.y;
      }
      self->bounds.origin.CGFloat y = v8;
      if (v18 < 0.0 || v20 < 0.0)
      {
        v42.origin.CGFloat x = v14;
        v42.origin.CGFloat y = v16;
        v42.size.double width = v18;
        v42.size.double height = v20;
        CGRect v43 = CGRectStandardize(v42);
        double v16 = v43.origin.y;
        double v20 = v43.size.height;
      }
      double v32 = v16 + v20;
      double v33 = self->bounds.size.width;
      if (v33 < 0.0 || v30 < 0.0)
      {
        CGFloat v34 = self->bounds.origin.x;
        double v35 = v8;
        double v36 = v30;
        CGRect v44 = CGRectStandardize(*(CGRect *)(&v33 - 2));
        double v8 = v44.origin.y;
      }
      self->bounds.size.double height = v32 - v8;
    }
  }
}

- (void)combine:(id)a3
{
  self->bounds = CGRectUnion(self->bounds, *(CGRect *)((char *)a3 + 8));
  int v5 = [a3 graphicObjectCount];
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = 0;
    do
    {
      -[CPZoneBorder addGraphicObject:](self, "addGraphicObject:", [a3 graphicObjectAtIndex:v7]);
      uint64_t v7 = (v7 + 1);
    }
    while (v6 != v7);
  }
  int v8 = [a3 neighborCount];
  if (v8)
  {
    int v9 = v8;
    uint64_t v10 = 0;
    do
    {
      -[CPZoneBorder addNeighbor:](self, "addNeighbor:", [a3 neighborAtIndex:v10]);
      uint64_t v10 = (v10 + 1);
    }
    while (v9 != v10);
  }
  BOOL hasForwardVector = self->hasForwardVector;
  if (hasForwardVector) {
    BOOL hasForwardVector = *((unsigned char *)a3 + 81) != 0;
  }
  self->BOOL hasForwardVector = hasForwardVector;
  BOOL hasBackwardVector = self->hasBackwardVector;
  if (hasBackwardVector) {
    BOOL hasBackwardVector = *((unsigned char *)a3 + 82) != 0;
  }
  self->BOOL hasBackwardVector = hasBackwardVector;

  [a3 removeFromArray];
}

- (BOOL)continues:(id)a3
{
  +[CPZoneBorder extendRect:](CPZoneBorder, "extendRect:", self->bounds.origin.x, self->bounds.origin.y, self->bounds.size.width, self->bounds.size.height);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  +[CPZoneBorder extendRect:](CPZoneBorder, "extendRect:", *((double *)a3 + 1), *((double *)a3 + 2), *((double *)a3 + 3), *((double *)a3 + 4));
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v20 = v5;
  uint64_t v21 = v7;
  uint64_t v22 = v9;
  uint64_t v23 = v11;

  return CGRectIntersectsRect(*(CGRect *)&v20, *(CGRect *)&v13);
}

- (BOOL)crosses:(id)a3
{
  [a3 bounds];
  double v8 = v5;
  BOOL v9 = v7 < 0.0 || v6 < 0.0;
  CGFloat v71 = v7;
  CGFloat v72 = v4;
  CGFloat v70 = v6;
  if (!self->isHorizontal)
  {
    double x = v4;
    double width = v6;
    if (v9)
    {
      CGRect v83 = CGRectStandardize(*(CGRect *)&v4);
      double x = v83.origin.x;
      double width = v83.size.width;
    }
    CGFloat recta = v8;
    CGFloat v42 = self->bounds.origin.x;
    double v43 = self->bounds.size.width;
    double height = self->bounds.size.height;
    BOOL v45 = height < 0.0 || v43 < 0.0;
    double v46 = self->bounds.origin.x;
    double v47 = self->bounds.size.width;
    if (v45)
    {
      CGRect v84 = CGRectStandardize(self->bounds);
      double v46 = v84.origin.x;
      double v47 = v84.size.width;
    }
    double v48 = v72;
    if (v9)
    {
      v85.size.double height = v71;
      v85.origin.double x = v72;
      v85.origin.double y = recta;
      v85.size.double width = v70;
      *(void *)&double v48 = (unint64_t)CGRectStandardize(v85);
    }
    double v49 = x + width;
    double v50 = v46 + v47;
    double v51 = v42;
    if (v45)
    {
      v86.origin.double y = self->bounds.origin.y;
      v86.origin.double x = v42;
      v86.size.double width = v43;
      v86.size.double height = height;
      *(void *)&double v51 = (unint64_t)CGRectStandardize(v86);
    }
    BOOL v52 = v48 >= v51 || v49 <= v50;
    CGFloat v53 = v71;
    if (!v52)
    {
      double v55 = recta;
      CGFloat v56 = recta;
      double v57 = v71;
      if (v9)
      {
        CGFloat v58 = v72;
        CGFloat v59 = recta;
        CGFloat v60 = v70;
        *(CGRect *)(&v56 - 1) = CGRectStandardize(*(CGRect *)(&v53 - 3));
        double v57 = v61;
      }
      double v67 = v56;
      double y = self->bounds.origin.y;
      double v63 = y;
      double v64 = height;
      if (v45)
      {
        v87.origin.double x = v42;
        v87.origin.double y = self->bounds.origin.y;
        v87.size.double width = v43;
        v87.size.double height = height;
        CGRect v88 = CGRectStandardize(v87);
        double v63 = v88.origin.y;
        double v64 = v88.size.height;
      }
      if (v9)
      {
        v89.size.double height = v71;
        v89.origin.double x = v72;
        v89.origin.double y = recta;
        v89.size.double width = v70;
        CGRect v90 = CGRectStandardize(v89);
        double v55 = v90.origin.y;
      }
      double v65 = v67 + v57;
      double v66 = v63 + v64;
      if (v45)
      {
        v91.origin.double x = v42;
        v91.origin.double y = y;
        v91.size.double width = v43;
        v91.size.double height = height;
        CGRect v92 = CGRectStandardize(v91);
        double y = v92.origin.y;
      }
      BOOL v38 = v55 > y;
      BOOL v39 = v65 < v66;
      return v39 && v38;
    }
    return 0;
  }
  double v10 = v5;
  double v11 = v7;
  if (v9)
  {
    CGRect v73 = CGRectStandardize(*(CGRect *)&v4);
    double v10 = v73.origin.y;
    double v11 = v73.size.height;
  }
  CGFloat v12 = self->bounds.origin.y;
  double v13 = self->bounds.size.height;
  double rect = self->bounds.size.width;
  BOOL v14 = v13 < 0.0 || rect < 0.0;
  double v15 = self->bounds.origin.y;
  double v16 = self->bounds.size.height;
  if (v14)
  {
    CGRect v74 = CGRectStandardize(self->bounds);
    double v15 = v74.origin.y;
    double v16 = v74.size.height;
  }
  double v17 = v8;
  if (v9)
  {
    v75.size.double height = v71;
    v75.origin.double x = v72;
    v75.origin.double y = v8;
    v75.size.double width = v70;
    CGRect v76 = CGRectStandardize(v75);
    double v8 = v76.origin.y;
  }
  double v18 = v10 + v11;
  double v19 = v15 + v16;
  double v20 = v12;
  if (v14)
  {
    v77.origin.double x = self->bounds.origin.x;
    v77.origin.double y = v12;
    v77.size.double width = rect;
    v77.size.double height = v13;
    *(CGRect *)(&v20 - 1) = CGRectStandardize(v77);
  }
  if (v8 >= v20 || v18 <= v19) {
    return 0;
  }
  double v22 = v72;
  CGFloat v23 = v70;
  double v24 = v70;
  CGFloat v25 = v17;
  double v26 = v72;
  if (v9)
  {
    CGFloat v27 = v72;
    CGFloat v28 = v25;
    CGFloat v29 = v71;
    CGRect v78 = CGRectStandardize(*(CGRect *)(&v23 - 2));
    double v22 = v78.origin.x;
    double v24 = v78.size.width;
  }
  double v30 = self->bounds.origin.x;
  double v31 = v30;
  double v32 = rect;
  if (v14)
  {
    v79.origin.double x = self->bounds.origin.x;
    double v33 = v22;
    v79.origin.double y = v12;
    v79.size.double width = rect;
    v79.size.double height = v13;
    CGRect v80 = CGRectStandardize(v79);
    double v22 = v33;
    double v31 = v80.origin.x;
    double v32 = v80.size.width;
  }
  if (v9)
  {
    v81.origin.double x = v72;
    double v34 = v22;
    v81.origin.double y = v25;
    v81.size.double width = v70;
    v81.size.double height = v71;
    unint64_t v35 = (unint64_t)CGRectStandardize(v81);
    double v22 = v34;
    double v26 = *(double *)&v35;
  }
  double v36 = v22 + v24;
  double v37 = v31 + v32;
  if (v14)
  {
    v82.origin.double x = v30;
    v82.origin.double y = v12;
    v82.size.double width = rect;
    v82.size.double height = v13;
    *(void *)&double v30 = (unint64_t)CGRectStandardize(v82);
  }
  BOOL v38 = v26 > v30;
  BOOL v39 = v36 < v37;
  return v39 && v38;
}

- (BOOL)extractCycleTo:(id)a3 goingForward:(BOOL)a4 throughIntersectionIndex:(unsigned int)a5 returningTo:(id)a6 atRect:(CGRect *)a7
{
  BOOL v9 = a4;
  double v11 = [(CPZoneBorder *)self copyWithoutIntersections];
  intersections = self->intersections;
  if (v9)
  {
    int v13 = [(NSMutableArray *)intersections count] - 1;
    uint64_t v38 = a5;
    BOOL v14 = (void *)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:");
    if (a6 == self)
    {
      int v15 = 1;
    }
    else
    {
      [v14 setForwardVector:0];
      int v15 = 0;
    }
    int v17 = 1;
  }
  else
  {
    uint64_t v38 = a5;
    double v16 = (void *)-[NSMutableArray objectAtIndex:](intersections, "objectAtIndex:");
    if (a6 == self)
    {
      int v13 = 0;
      int v17 = -1;
      int v15 = 1;
    }
    else
    {
      [v16 setBackwardVector:0];
      int v15 = 0;
      int v13 = 0;
      int v17 = -1;
    }
  }
  if (v13 == a5) {
    goto LABEL_26;
  }
  while (1)
  {
    unsigned int v18 = a5 + v17;
    double v19 = (void *)[(NSMutableArray *)self->intersections objectAtIndex:a5 + v17];
    if ([(CPZoneBorder *)self hasClockwiseVectorAtIndex:a5 + v17 startingForward:v9])
    {
      BOOL isHorizontal = self->isHorizontal;
      goto LABEL_21;
    }
    if (!v9) {
      break;
    }
    if (![v19 forwardVector]) {
      goto LABEL_19;
    }
    [v19 setForwardVector:0];
LABEL_16:
    a5 += v17;
    if (v13 == v18) {
      goto LABEL_26;
    }
  }
  if ([v19 backwardVector])
  {
    [v19 setBackwardVector:0];
    goto LABEL_16;
  }
LABEL_19:
  if (![(CPZoneBorder *)self hasCounterclockwiseVectorAtIndex:v17 + a5 startingForward:v9])goto LABEL_26; {
  BOOL isHorizontal = !self->isHorizontal;
  }
LABEL_21:
  id v21 = a3;
  if ((id)[v19 intersectingBorder] == a6)
  {
    [v19 intersectionRect];
    a7->origin.double x = v28;
    a7->origin.double y = v29;
    a7->size.double width = v30;
    a7->size.double height = v31;
    goto LABEL_32;
  }
  double v22 = (void *)[v19 intersectingBorder];
  if (!objc_msgSend(v22, "extractCycleTo:goingForward:throughIntersectionIndex:returningTo:atRect:", a3, isHorizontal ^ v9, objc_msgSend(v22, "indexOfIntersectionWith:", self), a6, a7))
  {
LABEL_26:
    BOOL v26 = 0;
    if (v15) {
      goto LABEL_27;
    }
    goto LABEL_38;
  }
  id v21 = a3;
  uint64_t v23 = [a3 lastObject];
  if (!v23) {
    __assert_rtn("-[CPZoneBorder extractCycleTo:goingForward:throughIntersectionIndex:returningTo:atRect:]", "CPZoneBorder.m", 683, "nextExtractedBorder");
  }
  uint64_t v24 = v23;
  [v19 intersectionRect];
  +[CPZoneBorder addIntersectionBetweenBorder:andBorder:atRect:](CPZoneBorder, "addIntersectionBetweenBorder:andBorder:atRect:", v24, v11);
  CGFloat v25 = *(void **)(v24 + 72);
  if (isHorizontal != v9) {
    objc_msgSend((id)objc_msgSend(v25, "objectAtIndex:", 0), "setForwardVector:", 1);
  }
  else {
    objc_msgSend((id)objc_msgSend(v25, "lastObject"), "setBackwardVector:", 1);
  }
LABEL_32:
  [v11 addToArray:v21];
  if (v15)
  {
    if ((unint64_t)[v21 count] >= 2)
    {
      +[CPZoneBorder addIntersectionBetweenBorder:andBorder:atRect:](CPZoneBorder, "addIntersectionBetweenBorder:andBorder:atRect:", v11, [v21 objectAtIndex:0], a7->origin.x, a7->origin.y, a7->size.width, a7->size.height);
      if (!v11) {
        __assert_rtn("-[CPZoneBorder extractCycleTo:goingForward:throughIntersectionIndex:returningTo:atRect:]", "CPZoneBorder.m", 712, "extractedBorder");
      }
      double v32 = (void *)v11[9];
      if (v9) {
        objc_msgSend((id)objc_msgSend(v32, "objectAtIndex:", 0), "setForwardVector:", 1);
      }
      else {
        objc_msgSend((id)objc_msgSend(v32, "lastObject"), "setBackwardVector:", 1);
      }
      uint64_t v34 = [v21 count];
      if (v34)
      {
        for (uint64_t i = 0; i != v34; ++i)
          objc_msgSend((id)objc_msgSend(v21, "objectAtIndex:", i), "trimToLastIntersections");
      }
    }
    BOOL v26 = 1;
LABEL_27:
    CGFloat v27 = (void *)[(NSMutableArray *)self->intersections objectAtIndex:v38];
    if (v9) {
      [v27 setForwardVector:0];
    }
    else {
      [v27 setBackwardVector:0];
    }
  }
  else
  {
    BOOL v26 = 1;
  }
LABEL_38:

  return v26;
}

- (BOOL)extractCycleTo:(id)a3 goingForward:(BOOL)a4 startingAtIndex:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  [a3 removeAllObjects];
  BOOL v9 = (void *)[(NSMutableArray *)self->intersections objectAtIndex:v5];
  if (!v6)
  {
    int v10 = [v9 backwardVector];
    if (!v10) {
      return v10;
    }
LABEL_5:
    CGRect v12 = CGRectNull;
    LOBYTE(v10) = [(CPZoneBorder *)self extractCycleTo:a3 goingForward:v6 throughIntersectionIndex:v5 returningTo:self atRect:&v12];
    return v10;
  }
  if ([v9 forwardVector]) {
    goto LABEL_5;
  }
  LOBYTE(v10) = 0;
  return v10;
}

- (BOOL)hasVectorGoingForward:(BOOL)a3 startingAtIndex:(unsigned int *)a4
{
  BOOL v5 = a3;
  unsigned int v7 = [(CPZoneBorder *)self intersectionCount];
  *a4 = v7;
  if (v7 < 2) {
    return 0;
  }
  unsigned int v9 = v7;
  BOOL result = 0;
  unsigned int v10 = v9 - 1;
  if (v5) {
    signed int v11 = 0;
  }
  else {
    signed int v11 = v9 - 1;
  }
  if (!v5) {
    unsigned int v10 = 0;
  }
  unsigned int v12 = v10 - v11;
  if (v10 != v11)
  {
    uint64_t v13 = 0;
    uint64_t v14 = v11;
    if (v5) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = -1;
    }
    while (1)
    {
      double v16 = (void *)[(NSMutableArray *)self->intersections objectAtIndex:v14 + v13];
      if (v5)
      {
        if ([v16 forwardVector]) {
          goto LABEL_18;
        }
      }
      else if ([v16 backwardVector])
      {
LABEL_18:
        *a4 = v14 + v13;
        return 1;
      }
      v13 += v15;
      if (v12 == v13) {
        return 0;
      }
    }
  }
  return result;
}

- (void)instantiateVectors
{
  unsigned int v3 = [(CPZoneBorder *)self intersectionCount];
  if (v3)
  {
    uint64_t v4 = 0;
    unint64_t v5 = v3;
    do
    {
      uint64_t v6 = v4 + 1;
      if (v4 + 1 < v5) {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v4), "setForwardVector:", self->hasForwardVector);
      }
      if (v4) {
        objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v4), "setBackwardVector:", self->hasBackwardVector);
      }
      ++v4;
    }
    while (v5 != v6);
  }
}

- (BOOL)hasCounterclockwiseVectorAtIndex:(unsigned int)a3 startingForward:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CPZoneBorder *)self getNextBorder:*(void *)&a3];
  if (self->isHorizontal == v4)
  {
    return [v6 forwardVector];
  }
  else
  {
    return [v6 backwardVector];
  }
}

- (BOOL)hasClockwiseVectorAtIndex:(unsigned int)a3 startingForward:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CPZoneBorder *)self getNextBorder:*(void *)&a3];
  if (self->isHorizontal == v4)
  {
    return [v6 backwardVector];
  }
  else
  {
    return [v6 forwardVector];
  }
}

- (id)getNextBorder:(unsigned int)a3
{
  BOOL v4 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", a3), "intersectingBorder");
  uint64_t v5 = [v4 indexOfIntersectionWith:self];
  id v6 = (void *)v4[9];

  return (id)[v6 objectAtIndex:v5];
}

- (BOOL)windsClockwiseOnto:(id)a3
{
  unsigned int v5 = -[CPZoneBorder indexOfIntersectionWith:](self, "indexOfIntersectionWith:");
  if ([a3 indexOfIntersectionWith:self]) {
    int v6 = -1;
  }
  else {
    int v6 = 1;
  }
  BOOL v7 = [(CPZoneBorder *)self isHorizontal];
  if (v5) {
    int v8 = -v6;
  }
  else {
    int v8 = v6;
  }
  if (!v7) {
    int v8 = -v8;
  }
  return v8 == 1;
}

- (unsigned)indexOfIntersectionWith:(id)a3
{
  unsigned int v5 = [(CPZoneBorder *)self intersectionCount];
  if (v5)
  {
    uint64_t v6 = 0;
    while ((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->intersections, "objectAtIndex:", v6), "intersectingBorder") != a3)
    {
      if (v5 == ++v6) {
        return v5;
      }
    }
    return v6;
  }
  return v5;
}

- (BOOL)intersectsWith:(id)a3 atRect:(CGRect *)a4
{
  BOOL result = -[CPZoneBorder continues:](self, "continues:");
  if (self->isHorizontal)
  {
    if (!*((unsigned char *)a3 + 80))
    {
      CGFloat width = *((double *)a3 + 3);
      CGFloat y = self->bounds.origin.y;
      a4->origin.double x = *((CGFloat *)a3 + 1);
      a4->origin.CGFloat y = y;
      CGFloat height = self->bounds.size.height;
LABEL_6:
      a4->size.CGFloat width = width;
      a4->size.CGFloat height = height;
      return result;
    }
  }
  else if (*((unsigned char *)a3 + 80))
  {
    CGFloat width = self->bounds.size.width;
    CGFloat v11 = *((double *)a3 + 2);
    a4->origin.double x = self->bounds.origin.x;
    a4->origin.CGFloat y = v11;
    CGFloat height = *((double *)a3 + 4);
    goto LABEL_6;
  }
  BOOL result = 0;
  *a4 = CGRectNull;
  return result;
}

- (unsigned)intersectionCount
{
  intersections = self->intersections;
  if (intersections) {
    LODWORD(intersections) = [(NSMutableArray *)intersections count];
  }
  return intersections;
}

- (BOOL)isVertical
{
  return !self->isHorizontal;
}

- (BOOL)isHorizontal
{
  return self->isHorizontal;
}

- (void)setSide:(int)a3 ofPage:(id)a4
{
  self->page = (CPPage *)a4;
  [a4 pageCropBox];
  CGFloat v10 = v8;
  double v11 = v9;
  switch(a3)
  {
    case 1:
      self->bounds.origin.double x = v6;
      goto LABEL_8;
    case 2:
      BOOL v12 = 0;
      goto LABEL_13;
    case 3:
      if (v8 < 0.0 || v9 < 0.0)
      {
        *(CGRect *)&CGFloat v6 = CGRectStandardize(*(CGRect *)&v6);
        double v11 = v13;
      }
      self->bounds.origin.double x = v6;
      double v7 = v7 + v11;
LABEL_8:
      BOOL v12 = 1;
      double v11 = 0.0;
      goto LABEL_14;
    case 4:
      if (v8 < 0.0 || v9 < 0.0)
      {
        *(CGRect *)(&v7 - 1) = CGRectStandardize(*(CGRect *)&v6);
        BOOL v12 = 0;
        CGFloat v6 = v14 + v15;
      }
      else
      {
        BOOL v12 = 0;
        CGFloat v6 = v6 + v8;
      }
LABEL_13:
      self->bounds.origin.double x = v6;
      CGFloat v10 = 0.0;
LABEL_14:
      self->bounds.origin.CGFloat y = v7;
      self->bounds.size.CGFloat width = v10;
      self->bounds.size.CGFloat height = v11;
      self->BOOL isHorizontal = v12;
      break;
    default:
      break;
  }
  *(_WORD *)&self->BOOL hasForwardVector = 257;
}

- (BOOL)hasBackwardVector
{
  return self->hasBackwardVector;
}

- (void)setHasBackwardVector:(BOOL)a3
{
  self->BOOL hasBackwardVector = a3;
}

- (BOOL)hasForwardVector
{
  return self->hasForwardVector;
}

- (void)setHasForwardVector:(BOOL)a3
{
  self->BOOL hasForwardVector = a3;
}

- (BOOL)hasNeighborShape:(id)a3 atSide:(int)a4
{
  neighbors = self->neighbors;
  if (neighbors)
  {
    neighbors = (NSMutableArray *)[(NSMutableArray *)neighbors count];
    if (neighbors)
    {
      unsigned int v8 = 1;
      while (1)
      {
        id v9 = [(CPZoneBorder *)self neighborAtIndex:v8 - 1];
        if ((id)[v9 neighborShape] == a3 && objc_msgSend(v9, "shapeSide") == a4) {
          break;
        }
        if ([(NSMutableArray *)self->neighbors count] <= (unint64_t)v8++)
        {
          LOBYTE(neighbors) = 0;
          return (char)neighbors;
        }
      }
      LOBYTE(neighbors) = 1;
    }
  }
  return (char)neighbors;
}

- (BOOL)hasNeighborShape:(id)a3
{
  neighbors = self->neighbors;
  if (neighbors)
  {
    neighbors = (NSMutableArray *)[(NSMutableArray *)neighbors count];
    if (neighbors)
    {
      unint64_t v6 = 0;
      while (1)
      {
        LOBYTE(neighbors) = objc_msgSend(-[CPZoneBorder neighborAtIndex:](self, "neighborAtIndex:", v6), "neighborShape") == (void)a3;
        if ((_BYTE)neighbors) {
          break;
        }
        unint64_t v6 = (v6 + 1);
        if ([(NSMutableArray *)self->neighbors count] <= v6)
        {
          LOBYTE(neighbors) = 0;
          return (char)neighbors;
        }
      }
    }
  }
  return (char)neighbors;
}

- (id)neighborAtIndex:(unsigned int)a3
{
  id result = self->neighbors;
  if (result) {
    return (id)[result objectAtIndex:a3];
  }
  return result;
}

- (void)removeNeighborAtIndex:(unsigned int)a3
{
  neighbors = self->neighbors;
  if (neighbors) {
    [(NSMutableArray *)neighbors removeObjectAtIndex:a3];
  }
}

- (void)addNeighbor:(id)a3
{
  if (self->neighbors)
  {
    if (-[CPZoneBorder hasNeighborShape:atSide:](self, "hasNeighborShape:atSide:", [a3 neighborShape], objc_msgSend(a3, "shapeSide")))
    {
      return;
    }
    neighbors = self->neighbors;
  }
  else
  {
    neighbors = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    self->neighbors = neighbors;
  }

  [(NSMutableArray *)neighbors addObject:a3];
}

- (unsigned)neighborCount
{
  neighbors = self->neighbors;
  if (neighbors) {
    LODWORD(neighbors) = [(NSMutableArray *)neighbors count];
  }
  return neighbors;
}

- (id)graphicObjects
{
  return self->graphicObjects;
}

- (id)graphicObjectAtIndex:(unsigned int)a3
{
  return (id)[(NSMutableArray *)self->graphicObjects objectAtIndex:a3];
}

- (void)removeGraphicObjectAtIndex:(unsigned int)a3
{
}

- (void)addGraphicObject:(id)a3
{
  double y = self->bounds.origin.y;
  double v6 = INFINITY;
  if (self->bounds.origin.x == INFINITY || y == INFINITY)
  {
    objc_msgSend(a3, "renderedBounds", INFINITY, y);
    self->bounds.origin.double x = v6;
    self->bounds.origin.double y = y;
    self->bounds.size.CGFloat width = v8;
    self->bounds.size.CGFloat height = v9;
    self->BOOL isHorizontal = v8 >= v9;
  }
  if ((-[NSMutableArray containsObject:](self->graphicObjects, "containsObject:", a3, v6, y) & 1) == 0)
  {
    graphicObjects = self->graphicObjects;
    [(NSMutableArray *)graphicObjects addObject:a3];
  }
}

- (unsigned)graphicObjectCount
{
  graphicObjects = self->graphicObjects;
  if (graphicObjects) {
    LODWORD(graphicObjects) = [(NSMutableArray *)graphicObjects count];
  }
  return graphicObjects;
}

- (int64_t)zOrder
{
  unsigned int v3 = [(CPZoneBorder *)self graphicObjectCount];
  if (!v3) {
    return 0;
  }
  unsigned int v4 = v3;
  uint64_t v5 = 0;
  int64_t v6 = 0;
  do
  {
    uint64_t v7 = objc_msgSend(-[CPZoneBorder graphicObjectAtIndex:](self, "graphicObjectAtIndex:", v5), "zOrder");
    if (v7 > v6) {
      int64_t v6 = v7;
    }
    uint64_t v5 = (v5 + 1);
  }
  while (v4 != v5);
  return v6;
}

- (void)setBounds:(CGRect)a3
{
  self->bounds = a3;
}

- (CGRect)bounds
{
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

- (id)ownerArray
{
  return self->ownerArray;
}

- (void)removeFromArrayAtIndex:(unsigned int)a3
{
  ownerArradouble y = self->ownerArray;
  uint64_t v4 = a3;
  *(void *)([(NSMutableArray *)ownerArray objectAtIndex:a3] + 48) = 0;

  [(NSMutableArray *)ownerArray removeObjectAtIndex:v4];
}

- (void)removeFromArray
{
  ownerArradouble y = self->ownerArray;
  self->ownerArradouble y = 0;
  -[NSMutableArray removeObject:](ownerArray, "removeObject:");
}

- (void)addToArray:(id)a3 atIndex:(unsigned int)a4
{
  self->ownerArradouble y = (NSMutableArray *)a3;
}

- (void)addToArray:(id)a3
{
  self->ownerArradouble y = (NSMutableArray *)a3;
}

- (id)page
{
  return self->page;
}

- (id)copyWithoutIntersections
{
  unsigned int v3 = (void *)CPCopyObject(self, 0);
  uint64_t v4 = v3;
  if (v3)
  {
    v3[6] = 0;
    v3[5] = self->page;
    v3[7] = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->graphicObjects];
    v4[8] = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->neighbors];
    v4[9] = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)CPCopyObject(self, a3);
  int64_t v6 = v5;
  if (v5)
  {
    v5[6] = 0;
    v5[5] = self->page;
    v5[7] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "initWithArray:", self->graphicObjects);
    v6[8] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "initWithArray:", self->neighbors);
    v6[9] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "initWithArray:", self->intersections);
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorder;
  [(CPZoneBorder *)&v3 dealloc];
}

- (id)initSuper
{
  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorder;
  return [(CPZoneBorder *)&v3 init];
}

- (CPZoneBorder)initWithGraphicObject:(id)a3
{
  uint64_t v4 = [(CPZoneBorder *)self init];
  if (v4)
  {
    v4->page = (CPPage *)[a3 page];
    [(CPZoneBorder *)v4 addGraphicObject:a3];
    *(_WORD *)&v4->BOOL hasForwardVector = 257;
  }
  return v4;
}

- (CPZoneBorder)init
{
  v5.receiver = self;
  v5.super_class = (Class)CPZoneBorder;
  v2 = [(CPZoneBorder *)&v5 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->bounds = CGRectNull;
    v2->graphicObjects = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    v3->BOOL isHorizontal = 1;
  }
  return v3;
}

+ (CGRect)extendRect:(CGRect)a3
{
  double v3 = fmax(a3.size.width, a3.size.height) * 0.0 + 2.0;
  double v4 = a3.origin.x - v3;
  double v5 = a3.origin.y - v3;
  double v6 = a3.size.width + v3 * 2.0;
  double v7 = a3.size.height + v3 * 2.0;
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

+ (int)clockwiseWindingNumberOfShapeWithBorders:(id)a3
{
  unsigned int v4 = [a3 count];
  unsigned int v5 = v4;
  if (!v4) {
    return 0;
  }
  uint64_t v6 = 0;
  int v7 = 0;
  int v8 = 0;
  uint64_t v9 = v4;
  do
  {
    if (v8 + 1 < v5) {
      ++v8;
    }
    else {
      int v8 = 0;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v6), "windsClockwiseOnto:", objc_msgSend(a3, "objectAtIndex:", v8)))++v7; {
    else
    }
      --v7;
    ++v6;
  }
  while (v9 != v6);
  return v7 / 4;
}

+ (void)outerVertices:(CGPoint *)a3 fromBorders:(id)a4 swollenBy:(double)a5
{
  int v8 = +[CPZoneBorder clockwiseWindingNumberOfShapeWithBorders:a4];
  unsigned int v9 = [a4 count];
  unsigned int v10 = v9;
  if (v9)
  {
    uint64_t v11 = 0;
    int v12 = 0;
    uint64_t v13 = v9;
    do
    {
      if (v12 + 1 < v10) {
        ++v12;
      }
      else {
        int v12 = 0;
      }
      double v14 = (id *)[a4 objectAtIndex:v11];
      double v15 = (void *)[a4 objectAtIndex:v12];
      unsigned int v16 = [v14 indexOfIntersectionWith:v15];
      int v17 = [v15 indexOfIntersectionWith:v14];
      objc_msgSend((id)objc_msgSend(v14[9], "objectAtIndex:", v16), "intersectionRect");
      CGFloat v19 = v18;
      double y = v20;
      double v23 = v22;
      double height = v24;
      int v26 = [v14 isHorizontal];
      if (!v26 || v16) {
        int v27 = (v17 != 0) & ~v26;
      }
      else {
        int v27 = 1;
      }
      if (v17) {
        char v28 = 0;
      }
      else {
        char v28 = v26;
      }
      if (v28)
      {
        if (v8 < 0)
        {
          LOBYTE(v27) = v27 ^ 1;
LABEL_21:
          if (v23 < 0.0 || (double v30 = v19, v31 = v23, height < 0.0))
          {
            v34.origin.double x = v19;
            v34.origin.double y = y;
            v34.size.double width = v23;
            v34.size.double height = height;
            *(CGRect *)&double v30 = CGRectStandardize(v34);
          }
          a3->double x = v30 + v31 + a5;
          if (v27) {
            goto LABEL_34;
          }
          goto LABEL_25;
        }
      }
      else
      {
        if (v16) {
          int v29 = v26;
        }
        else {
          int v29 = 1;
        }
        if (v8 < 0)
        {
          v27 ^= 1u;
          if ((v29 & 1) == 0) {
            goto LABEL_21;
          }
        }
        else if (v29)
        {
          goto LABEL_21;
        }
      }
      if (v23 < 0.0 || (double v33 = v19, height < 0.0))
      {
        v37.origin.double x = v19;
        v37.origin.double y = y;
        v37.size.double width = v23;
        v37.size.double height = height;
        *(void *)&double v33 = (unint64_t)CGRectStandardize(v37);
      }
      a3->double x = v33 - a5;
      if (v27)
      {
LABEL_34:
        if (v23 < 0.0 || height < 0.0)
        {
          v38.origin.double x = v19;
          v38.origin.double y = y;
          v38.size.double width = v23;
          v38.size.double height = height;
          CGRect v39 = CGRectStandardize(v38);
          double y = v39.origin.y;
        }
        double v32 = y - a5;
        goto LABEL_38;
      }
LABEL_25:
      if (v23 < 0.0 || height < 0.0)
      {
        v35.origin.double x = v19;
        v35.origin.double y = y;
        v35.size.double width = v23;
        v35.size.double height = height;
        CGRect v36 = CGRectStandardize(v35);
        double y = v36.origin.y;
        double height = v36.size.height;
      }
      double v32 = y + height + a5;
LABEL_38:
      a3->double y = v32;
      ++v11;
      ++a3;
    }
    while (v13 != v11);
  }
}

+ (void)removeIntersectionBetweenBorder:(id)a3 andBorder:(id)a4
{
  unsigned int v6 = [a3 intersectionCount];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v6;
    while ((id)objc_msgSend((id)objc_msgSend(*((id *)a3 + 9), "objectAtIndex:", v7), "intersectingBorder") != a4)
    {
      if (v8 == ++v7) {
        goto LABEL_7;
      }
    }
    [*((id *)a3 + 9) removeObjectAtIndex:v7];
  }
LABEL_7:
  unsigned int v9 = [a4 intersectionCount];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v9;
    while ((id)objc_msgSend((id)objc_msgSend(*((id *)a4 + 9), "objectAtIndex:", v10), "intersectingBorder") != a3)
    {
      if (v11 == ++v10) {
        return;
      }
    }
    int v12 = (void *)*((void *)a4 + 9);
    [v12 removeObjectAtIndex:v10];
  }
}

+ (void)addIntersectionBetweenBorder:(id)a3 andBorder:(id)a4 atRect:(CGRect)a5
{
  if (a3 && a4)
  {
    double height = a5.size.height;
    double width = a5.size.width;
    double y = a5.origin.y;
    double x = a5.origin.x;
    uint64_t v11 = objc_alloc_init(CPZoneBorderIntersection);
    -[CPZoneBorderIntersection setIntersectionRect:](v11, "setIntersectionRect:", x, y, width, height);
    [(CPZoneBorderIntersection *)v11 setIntersectingBorder:a4];
    int v12 = (void *)*((void *)a3 + 9);
    if (!v12)
    {
      int v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      *((void *)a3 + 9) = v12;
    }
    [v12 addObject:v11];
    [*((id *)a3 + 9) sortUsingSelector:sel_comparePositionLengthwise_];

    double v14 = objc_alloc_init(CPZoneBorderIntersection);
    -[CPZoneBorderIntersection setIntersectionRect:](v14, "setIntersectionRect:", x, y, width, height);
    [(CPZoneBorderIntersection *)v14 setIntersectingBorder:a3];
    uint64_t v13 = (void *)*((void *)a4 + 9);
    if (!v13)
    {
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      *((void *)a4 + 9) = v13;
    }
    [v13 addObject:v14];
    [*((id *)a4 + 9) sortUsingSelector:sel_comparePositionLengthwise_];
  }
}

@end