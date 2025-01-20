@interface CPZone
- (BOOL)bordersWindClockwise;
- (BOOL)canContain:(CGRect)a3;
- (BOOL)contains:(id)a3;
- (BOOL)hasBorders;
- (BOOL)hasNeighborShape:(id)a3;
- (BOOL)hasRotatedCharacters;
- (BOOL)isRectangular;
- (BOOL)isStraddleZone;
- (BOOL)isZone;
- (BOOL)mapToWordPairs:(void *)a3 passing:(void *)a4;
- (BOOL)mapToWordPairsWithIndex:(void *)a3 passing:(void *)a4;
- (BOOL)mapToWords:(void *)a3 passing:(void *)a4;
- (BOOL)mapToWordsWithIndex:(void *)a3 passing:(void *)a4;
- (BOOL)rectangleBordersAtLeft:(id *)a3 top:(id *)a4 right:(id *)a5 bottom:(id *)a6;
- (CGColor)newBackgroundColor;
- (CGPoint)outerVertices;
- (CGPoint)swollenOuterVertices;
- (CGRect)swollenZoneBounds;
- (CGRect)zoneBounds;
- (CGRect)zoneBoundsFromVertices:(CGPoint *)a3 ofCount:(unsigned int)a4;
- (CPZone)init;
- (double)area;
- (double)rotationAngle;
- (id)backgroundGraphics;
- (id)charactersInZone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)graphicsInZone;
- (id)gutters;
- (id)leftGuides;
- (id)rightGuides;
- (id)spacers;
- (id)textLinesInZone;
- (id)zoneBorders;
- (id)zoneProfile;
- (int64_t)borderZOrder;
- (int64_t)compareArea:(id)a3;
- (int64_t)neighborZOrder;
- (unsigned)usedGraphicCount;
- (unsigned)vertexCount;
- (unsigned)wordCount;
- (void)accept:(id)a3;
- (void)addContentFrom:(id)a3;
- (void)addPDFChar:(void *)a3;
- (void)dealloc;
- (void)incrementUsedGraphicCount;
- (void)removeUnfilledNeighborShapes;
- (void)setCharactersInZone:(id)a3;
- (void)setGutters:(id)a3;
- (void)setIsStraddleZone:(BOOL)a3;
- (void)setLeftGuides:(id)a3;
- (void)setRightGuides:(id)a3;
- (void)setRotationAngle:(double)a3;
- (void)setSpacers:(id)a3;
- (void)setZoneBorders:(id)a3;
- (void)setZoneProfile:(id)a3;
- (void)updatedCharSequenceFrom:(unsigned int)a3 length:(unsigned int)a4;
@end

@implementation CPZone

- (double)rotationAngle
{
  return self->rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->rotationAngle = a3;
}

- (unsigned)usedGraphicCount
{
  return self->usedGraphicCount;
}

- (void)incrementUsedGraphicCount
{
}

- (id)spacers
{
  return self->spacers;
}

- (void)setSpacers:(id)a3
{
  spacers = self->spacers;
  if (spacers != a3)
  {

    self->spacers = (NSArray *)a3;
  }
}

- (id)gutters
{
  return self->gutters;
}

- (void)setGutters:(id)a3
{
  gutters = self->gutters;
  if (gutters != a3)
  {

    self->gutters = (NSArray *)a3;
  }
}

- (id)rightGuides
{
  return self->rightGuides;
}

- (void)setRightGuides:(id)a3
{
  rightGuides = self->rightGuides;
  if (rightGuides != a3)
  {

    self->rightGuides = (NSArray *)a3;
  }
}

- (id)leftGuides
{
  return self->leftGuides;
}

- (void)setLeftGuides:(id)a3
{
  leftGuides = self->leftGuides;
  if (leftGuides != a3)
  {

    self->leftGuides = (NSArray *)a3;
  }
}

- (void)setZoneProfile:(id)a3
{
  zoneProfile = self->zoneProfile;
  if (zoneProfile != a3)
  {

    self->zoneProfile = (CPZoneProfile *)a3;
  }
}

- (id)zoneProfile
{
  return self->zoneProfile;
}

- (void)setIsStraddleZone:(BOOL)a3
{
  self->isStraddleZone = a3;
}

- (BOOL)isStraddleZone
{
  return self->isStraddleZone;
}

- (int64_t)compareArea:(id)a3
{
  [(CPZone *)self area];
  double v6 = v5;
  [a3 area];
  double v8 = v7;
  unsigned int v9 = [(CPZone *)self vertexCount];
  double v10 = (float)((float)([a3 vertexCount] + v9) * 0.00000011921);
  if (v6 < v8 && v8 - v6 > v8 * v10) {
    return -1;
  }
  if (v6 > v8 && v6 - v8 > v6 * v10) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return -1;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    return 1;
  }
  else {
    return 0;
  }
}

- (void)addContentFrom:(id)a3
{
  uint64_t v5 = [a3 count];
  if (v5)
  {
    unsigned int v6 = v5 - 1;
    do
    {
      uint64_t v7 = v6;
      uint64_t v8 = [a3 objectAtIndex:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ([(CPZone *)self contains:v8])
          {
            [(CPChunk *)self add:v8];
            [a3 removeObjectAtIndex:v6];
          }
        }
      }
      --v6;
    }
    while (v7);
  }
}

- (void)updatedCharSequenceFrom:(unsigned int)a3 length:(unsigned int)a4
{
  if (!self->hasRotatedCharacters && a4 + a3 > a3)
  {
    unsigned int v5 = a4;
    uint64_t v6 = *(void *)&a3;
    while ((double)[(CPCharSequence *)self->charactersInZone charAtIndex:v6][168] == 0.0)
    {
      uint64_t v6 = (v6 + 1);
      if (!--v5) {
        return;
      }
    }
    self->hasRotatedCharacters = 1;
  }
}

- (BOOL)hasRotatedCharacters
{
  return self->hasRotatedCharacters;
}

- (id)charactersInZone
{
  return self->charactersInZone;
}

- (void)setCharactersInZone:(id)a3
{
  charactersInZone = self->charactersInZone;
  if (charactersInZone != a3)
  {

    uint64_t v6 = (CPCharSequence *)a3;
    self->charactersInZone = v6;
    uint64_t v7 = [(CPCharSequence *)v6 length];
    [(CPZone *)self updatedCharSequenceFrom:0 length:v7];
  }
}

- (void)addPDFChar:(void *)a3
{
  charactersInZone = self->charactersInZone;
  if (!charactersInZone)
  {
    charactersInZone = [[CPCharSequence alloc] initWithSizeFor:10];
    self->charactersInZone = charactersInZone;
  }
  [(CPCharSequence *)charactersInZone addChar:a3];
  if (*((double *)a3 + 21) != 0.0) {
    self->hasRotatedCharacters = 1;
  }
}

- (BOOL)canContain:(CGRect)a3
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(CPZone *)self swollenOuterVertices];
  unsigned int v9 = [(CPZone *)self vertexCount];

  return CPUprightRectilinearShapeWithVerticesContainingRect(&v8->x, v9, x, y, width, height);
}

- (BOOL)contains:(id)a3
{
  unsigned int v5 = [(CPZone *)self swollenOuterVertices];
  if (v5)
  {
    p_double x = &v5->x;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 hasBorders])
    {
      unsigned int v7 = [a3 vertexCount];
      uint64_t v8 = [a3 zoneBorders];
      if (v7)
      {
        unsigned int v9 = (void *)v8;
        uint64_t v10 = 0;
        uint64_t v11 = v7 - 1;
        do
        {
          objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v10), "bounds");
          LODWORD(v5) = CPUprightRectilinearShapeWithVerticesContainingRect(p_x, [(CPZone *)self vertexCount], v12, v13, v14, v15);
          if (!v5) {
            break;
          }
        }
        while (v11 != v10++);
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
    else
    {
      unsigned int v17 = [(CPZone *)self vertexCount];
      [a3 renderedBounds];
      LOBYTE(v5) = CPUprightRectilinearShapeWithVerticesContainingRect(p_x, v17, v18, v19, v20, v21);
    }
  }
  return (char)v5;
}

- (BOOL)rectangleBordersAtLeft:(id *)a3 top:(id *)a4 right:(id *)a5 bottom:(id *)a6
{
  BOOL v36 = [(CPZone *)self isRectangular];
  if (v36)
  {
    uint64_t v11 = 0;
    double v12 = 0;
    CGFloat v13 = 0;
    do
    {
      double v14 = (void *)[(NSMutableArray *)self->zoneBorders objectAtIndex:v11];
      if ([v14 isHorizontal])
      {
        if (v13)
        {
          [v13 bounds];
          double v16 = v15;
          double v18 = v17;
          [v14 bounds];
          double v19 = v16 + v18 * 0.5;
          double v22 = v21 + v20 * 0.5;
          if (v19 <= v22) {
            v23 = v14;
          }
          else {
            v23 = v13;
          }
          if (v19 <= v22) {
            v24 = v13;
          }
          else {
            v24 = v14;
          }
          *a4 = v23;
          *a6 = v24;
        }
        else
        {
          CGFloat v13 = v14;
        }
      }
      else if (v12)
      {
        [v12 bounds];
        double v26 = v25;
        double v28 = v27;
        [v14 bounds];
        double v29 = v26 + v28 * 0.5;
        double v32 = v31 + v30 * 0.5;
        if (v29 <= v32) {
          v33 = v14;
        }
        else {
          v33 = v12;
        }
        if (v29 <= v32) {
          v34 = v12;
        }
        else {
          v34 = v14;
        }
        *a5 = v33;
        *a3 = v34;
      }
      else
      {
        double v12 = v14;
      }
      ++v11;
    }
    while (v11 != 4);
  }
  return v36;
}

- (BOOL)isRectangular
{
  return [(CPZone *)self vertexCount] == 4;
}

- (CGRect)swollenZoneBounds
{
  uint64_t v3 = [(CPZone *)self vertexCount];
  if (v3)
  {
    [(CPZone *)self zoneBoundsFromVertices:[(CPZone *)self swollenOuterVertices] ofCount:v3];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CPZone;
    [(CPChunk *)&v9 renderedBounds];
    if (v4 != INFINITY && v5 != INFINITY) {
      *(CGRect *)&CGFloat v4 = CGRectInset(*(CGRect *)&v4, -1.0, -1.0);
    }
  }
  result.size.CGFloat height = v7;
  result.size.double width = v6;
  result.origin.CGFloat y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)zoneBounds
{
  uint64_t v3 = [(CPZone *)self vertexCount];
  if (v3)
  {
    [(CPZone *)self zoneBoundsFromVertices:[(CPZone *)self outerVertices] ofCount:v3];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CPZone;
    [(CPChunk *)&v8 renderedBounds];
  }
  result.size.CGFloat height = v7;
  result.size.double width = v6;
  result.origin.CGFloat y = v5;
  result.origin.double x = v4;
  return result;
}

- (CGRect)zoneBoundsFromVertices:(CGPoint *)a3 ofCount:(unsigned int)a4
{
  double x = a3->x;
  double y = a3->y;
  if (a4 < 2)
  {
    double v9 = a3->y;
    double v8 = a3->x;
  }
  else
  {
    uint64_t v6 = a4 - 1;
    p_double y = &a3[1].y;
    double v8 = a3->x;
    double v9 = a3->y;
    do
    {
      double v10 = *(p_y - 1);
      double v11 = *p_y;
      if (v10 < v8) {
        double v8 = *(p_y - 1);
      }
      if (v10 > x) {
        double x = *(p_y - 1);
      }
      if (v11 < v9) {
        double v9 = *p_y;
      }
      if (v11 > y) {
        double y = *p_y;
      }
      p_y += 2;
      --v6;
    }
    while (v6);
  }
  double v12 = x - v8;
  double v13 = y - v9;
  result.size.CGFloat height = v13;
  result.size.double width = v12;
  result.origin.double y = v9;
  result.origin.double x = v8;
  return result;
}

- (double)area
{
  double result = self->area;
  if (result < 0.0)
  {
    double v4 = [(CPZone *)self outerVertices];
    if (v4)
    {
      double v5 = v4;
      unsigned int v6 = [(CPZone *)self vertexCount];
      if (v6)
      {
        double v7 = 0.0;
        int v8 = 1;
        do
        {
          if (v8 == v6) {
            int v9 = 0;
          }
          else {
            int v9 = v8;
          }
          double v7 = v7 + v5[v8 - 1].x * v5[v9].y - v5[v8 - 1].y * v5[v9].x;
          ++v8;
        }
        while (v8 - v6 != 1);
        double v10 = v7 * 0.5;
      }
      else
      {
        double v10 = 0.0;
      }
      double result = fabs(v10);
      self->area = result;
    }
    else
    {
      return 0.0;
    }
  }
  return result;
}

- (CGPoint)swollenOuterVertices
{
  double result = self->swollenOuterVertices;
  if (!result)
  {
    if (self->zoneBorders)
    {
      double v4 = (CGPoint *)NSZoneMalloc(0, 16 * [(CPZone *)self vertexCount]);
      self->swollenOuterVertices = v4;
      +[CPZoneBorder outerVertices:v4 fromBorders:self->zoneBorders swollenBy:1.0];
      return self->swollenOuterVertices;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)accept:(id)a3
{
}

- (CGPoint)outerVertices
{
  double result = self->outerVertices;
  if (!result)
  {
    if (self->zoneBorders)
    {
      double v4 = (CGPoint *)NSZoneMalloc(0, 16 * [(CPZone *)self vertexCount]);
      self->outerVertices = v4;
      +[CPZoneBorder outerVertices:v4 fromBorders:self->zoneBorders swollenBy:0.0];
      return self->outerVertices;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (int64_t)neighborZOrder
{
  unsigned int v3 = [(CPZone *)self vertexCount];
  if (v3)
  {
    uint64_t v4 = 0;
    int64_t v5 = 0;
    uint64_t v6 = v3;
    do
    {
      double v7 = (void *)[(NSMutableArray *)self->zoneBorders objectAtIndex:v4];
      int v8 = [v7 neighborCount];
      if (v8)
      {
        int v9 = v8;
        uint64_t v10 = 0;
        do
        {
          double v11 = objc_msgSend((id)objc_msgSend(v7, "neighborAtIndex:", v10), "neighborShape");
          if (v11)
          {
            uint64_t v12 = [v11 zOrder];
            if (v12 > v5) {
              int64_t v5 = v12;
            }
          }
          uint64_t v10 = (v10 + 1);
        }
        while (v9 != v10);
      }
      ++v4;
    }
    while (v4 != v6);
  }
  else
  {
    int64_t v5 = 0;
  }
  uint64_t v13 = [(NSMutableArray *)self->super.super.super.children count];
  if (v13)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      double v15 = (void *)[(NSMutableArray *)self->super.super.super.children objectAtIndex:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v16 = [v15 neighborZOrder];
          if (v16 > v5) {
            int64_t v5 = v16;
          }
        }
      }
    }
  }
  return v5;
}

- (int64_t)borderZOrder
{
  unsigned int v3 = [(CPZone *)self vertexCount];
  if (v3)
  {
    uint64_t v4 = 0;
    int64_t v5 = 0;
    uint64_t v6 = v3;
    do
    {
      uint64_t v7 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", v4), "zOrder");
      if (v7 > v5) {
        int64_t v5 = v7;
      }
      ++v4;
    }
    while (v6 != v4);
  }
  else
  {
    int64_t v5 = 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->super.super.super.children count];
  if (v8)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      uint64_t v10 = (void *)[(NSMutableArray *)self->super.super.super.children objectAtIndex:i];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v11 = [v10 borderZOrder];
          if (v11 > v5) {
            int64_t v5 = v11;
          }
        }
      }
    }
  }
  return v5;
}

- (unsigned)vertexCount
{
  zoneBorders = self->zoneBorders;
  if (zoneBorders) {
    LODWORD(zoneBorders) = [(NSMutableArray *)zoneBorders count];
  }
  return zoneBorders;
}

- (void)removeUnfilledNeighborShapes
{
  unsigned int v3 = [(CPZone *)self vertexCount];
  if (v3)
  {
    uint64_t v4 = 0;
    uint64_t v5 = v3;
    do
    {
      uint64_t v6 = (void *)[(NSMutableArray *)self->zoneBorders objectAtIndex:v4];
      int v7 = [v6 neighborCount];
      if (v7)
      {
        int v8 = v7;
        uint64_t v9 = 0;
        do
        {
          uint64_t v10 = objc_msgSend((id)objc_msgSend(v6, "neighborAtIndex:", v9), "neighborShape");
          if (([v10 hasFill] & 1) == 0) {
            [v10 remove];
          }
          uint64_t v9 = (v9 + 1);
        }
        while (v8 != v9);
      }
      ++v4;
    }
    while (v4 != v5);
  }
}

- (id)backgroundGraphics
{
  if (!self->backgroundGraphics)
  {
    self->backgroundGraphics = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unsigned int v3 = [(CPZone *)self vertexCount];
    if (v3)
    {
      unsigned int v4 = v3;
      BOOL v5 = [(CPZone *)self bordersWindClockwise];
      uint64_t v6 = (void *)[(NSMutableArray *)self->zoneBorders objectAtIndex:v4 - 1];
      uint64_t v7 = 0;
      if (v5) {
        int v8 = 4;
      }
      else {
        int v8 = 2;
      }
      if (v5) {
        int v9 = 2;
      }
      else {
        int v9 = 4;
      }
      int v38 = v9;
      int v39 = v8;
      if (v5) {
        int v10 = 1;
      }
      else {
        int v10 = 3;
      }
      if (v5) {
        int v11 = 3;
      }
      else {
        int v11 = 1;
      }
      int v36 = v11;
      int v37 = v10;
      uint64_t v12 = v4;
      do
      {
        uint64_t v13 = v6;
        uint64_t v6 = (void *)[(NSMutableArray *)self->zoneBorders objectAtIndex:v7];
        int v14 = [v6 indexOfIntersectionWith:v13];
        int v15 = [v6 isHorizontal];
        if (v14) {
          unsigned int v16 = v37;
        }
        else {
          unsigned int v16 = v36;
        }
        unsigned int v17 = v39;
        if (!v14) {
          unsigned int v17 = v38;
        }
        if (v15) {
          uint64_t v18 = v16;
        }
        else {
          uint64_t v18 = v17;
        }
        if (v7)
        {
          if ([(NSMutableArray *)self->backgroundGraphics count])
          {
            uint64_t v19 = 0;
            int v20 = 0;
            do
            {
              if ((objc_msgSend(v6, "hasNeighborShape:atSide:", -[NSMutableArray objectAtIndex:](self->backgroundGraphics, "objectAtIndex:", v19), v18) & 1) == 0)
              {
                [(NSMutableArray *)self->backgroundGraphics removeObjectAtIndex:v19];
                --v20;
              }
              uint64_t v19 = ++v20;
            }
            while ([(NSMutableArray *)self->backgroundGraphics count] > (unint64_t)v20);
          }
        }
        else
        {
          int v21 = [v6 neighborCount];
          if (v21)
          {
            int v22 = v21;
            uint64_t v23 = 0;
            do
            {
              v24 = (void *)[v6 neighborAtIndex:v23];
              double v25 = (void *)[v24 neighborShape];
              unint64_t v26 = [v25 fillColor];
              if (v26)
              {
                double v34 = (v26 & 0x8000000000000000) != 0
                    ? CGTaggedColorGetAlpha(v26, v27, v28, v29, v30, v31, v32, v33)
                    : *(double *)(v26 + 8 * *(void *)(v26 + 56) + 56);
                if (v34 > 0.0 && [v24 shapeSide] == v18) {
                  [(NSMutableArray *)self->backgroundGraphics addObject:v25];
                }
              }
              uint64_t v23 = (v23 + 1);
            }
            while (v22 != v23);
          }
        }
        ++v7;
      }
      while (v7 != v12);
      [(NSMutableArray *)self->backgroundGraphics sortUsingSelector:sel_compareZ_];
    }
  }
  return self->backgroundGraphics;
}

- (CGColor)newBackgroundColor
{
  [(CPZone *)self backgroundGraphics];
  unsigned int v3 = [(NSMutableArray *)self->backgroundGraphics count];
  unsigned int v4 = v3;
  if (!v3) {
    return 0;
  }
  if (v3 == 1
    && ([(NSMutableArray *)self->backgroundGraphics objectAtIndex:0],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v5 = (CGColor *)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->backgroundGraphics, "objectAtIndex:", 0), "fillColor");
    CopyWithdouble Alpha = v5;
    if (v5) {
      CFRetain(v5);
    }
  }
  else
  {
    uint64_t v7 = malloc_type_malloc(8 * v4, 0x80040B8603338uLL);
    [(NSMutableArray *)self->backgroundGraphics getObjects:v7];
    [(CPZone *)self zoneBounds];
    double v9 = v8;
    double v11 = v10;
    unint64_t SRGB = (unint64_t)CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
    free(v7);
    if ([(CPZone *)self isRectangular]) {
      return (CGColor *)SRGB;
    }
    [(CPZone *)self area];
    if (v20 <= 0.0)
    {
      return (CGColor *)SRGB;
    }
    else
    {
      double v21 = v20;
      if (SRGB)
      {
        if ((SRGB & 0x8000000000000000) != 0) {
          double Alpha = CGTaggedColorGetAlpha(SRGB, v13, v14, v15, v16, v17, v18, v19);
        }
        else {
          double Alpha = *(double *)(SRGB + 8 * *(void *)(SRGB + 56) + 56);
        }
      }
      else
      {
        double Alpha = 0.0;
      }
      double v24 = v11 * (v9 * Alpha) / v21;
      if (v24 > 1.0) {
        double v24 = 1.0;
      }
      CopyWithdouble Alpha = CGColorCreateCopyWithAlpha((CGColorRef)SRGB, v24);
      if (SRGB) {
        CFRelease((CFTypeRef)SRGB);
      }
    }
  }
  return CopyWithAlpha;
}

- (BOOL)hasNeighborShape:(id)a3
{
  unsigned int v5 = [(CPZone *)self vertexCount];
  if (v5)
  {
    unsigned int v6 = v5;
    if (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", 0), "hasNeighborShape:", a3))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      unint64_t v7 = v6;
      uint64_t v8 = 1;
      while (v7 != v8)
      {
        if (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->zoneBorders, "objectAtIndex:", v8++), "hasNeighborShape:", a3))
        {
          unint64_t v10 = v8 - 1;
          goto LABEL_9;
        }
      }
      unint64_t v10 = v7;
LABEL_9:
      LOBYTE(v5) = v10 < v7;
    }
  }
  return v5;
}

- (BOOL)bordersWindClockwise
{
  return 0;
}

- (void)setZoneBorders:(id)a3
{
  zoneBorders = self->zoneBorders;
  if (zoneBorders != a3)
  {

    unsigned int v6 = (NSMutableArray *)a3;
    self->zoneBorders = v6;
    int v7 = [(NSMutableArray *)v6 count];
    if (v7 >= 1)
    {
      uint64_t v8 = 0;
      uint64_t v9 = v7;
      do
      {
        unint64_t v10 = (void *)[(NSMutableArray *)self->zoneBorders objectAtIndex:v8];
        int v11 = [v10 graphicObjectCount];
        if (v11 >= 1)
        {
          int v12 = v11;
          uint64_t v13 = 0;
          do
          {
            objc_msgSend((id)objc_msgSend(v10, "graphicObjectAtIndex:", v13), "setIsInZoneBorder:", 1);
            uint64_t v13 = (v13 + 1);
          }
          while (v12 != v13);
        }
        ++v8;
      }
      while (v8 != v9);
    }
  }
}

- (id)zoneBorders
{
  return self->zoneBorders;
}

- (BOOL)hasBorders
{
  return [(CPZone *)self vertexCount] != 0;
}

- (BOOL)isZone
{
  return 1;
}

- (BOOL)mapToWordPairsWithIndex:(void *)a3 passing:(void *)a4
{
  unsigned int v6 = self;
  unint64_t v20 = [(NSMutableArray *)self->textLinesInZone count];
  if (!v20) {
    return 1;
  }
  uint64_t v7 = 0;
  BOOL v8 = 0;
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v19 = v6;
  while (1)
  {
    int v12 = (void *)[(NSMutableArray *)v6->textLinesInZone objectAtIndex:v7];
    int v13 = [v12 wordCount];
    if (v13) {
      break;
    }
LABEL_11:
    BOOL v8 = ++v7 >= v20;
    if (v7 == v20) {
      return v8;
    }
  }
  int v14 = v13;
  uint64_t v15 = [v12 charSequence];
  uint64_t v16 = [v12 wordArray];
  if (v10)
  {
    if (!((unsigned int (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, void *))a3)(v11, v10, v16, v9, v15, a4))return v8; {
    uint64_t v11 = (v11 + 1);
    }
  }
  unint64_t v10 = v16 + 48 * (v14 - 1);
  if (v14 == 1)
  {
LABEL_10:
    uint64_t v9 = v15;
    unsigned int v6 = v19;
    goto LABEL_11;
  }
  while (((unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))a3)(v11, v16, v16 + 48, v15, v15, a4))
  {
    uint64_t v11 = (v11 + 1);
    unint64_t v17 = v16 + 96;
    v16 += 48;
    if (v17 > v10) {
      goto LABEL_10;
    }
  }
  return v8;
}

- (BOOL)mapToWordPairs:(void *)a3 passing:(void *)a4
{
  unsigned int v6 = self;
  uint64_t v7 = 224;
  unint64_t v21 = [(NSMutableArray *)self->textLinesInZone count];
  if (!v21) {
    return 1;
  }
  uint64_t v8 = 0;
  BOOL v9 = 0;
  uint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v20 = 224;
  while (1)
  {
    int v12 = objc_msgSend(*(id *)((char *)&v6->super.super.super.super.isa + v7), "objectAtIndex:", v8, v20);
    int v13 = [v12 wordCount];
    if (v13) {
      break;
    }
LABEL_10:
    BOOL v9 = ++v8 >= v21;
    if (v8 == v21) {
      return v9;
    }
  }
  int v14 = v13;
  uint64_t v15 = v6;
  uint64_t v16 = [v12 charSequence];
  uint64_t v17 = [v12 wordArray];
  if (v11
    && !((unsigned int (*)(unint64_t, uint64_t, uint64_t, uint64_t, void *))a3)(v11, v17, v10, v16, a4))
  {
    return v9;
  }
  unint64_t v11 = v17 + 48 * (v14 - 1);
  if (v14 == 1)
  {
LABEL_9:
    uint64_t v10 = v16;
    unsigned int v6 = v15;
    uint64_t v7 = v20;
    goto LABEL_10;
  }
  while ((((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *))a3)(v17, v17 + 48, v16, v16, a4) & 1) != 0)
  {
    unint64_t v18 = v17 + 96;
    v17 += 48;
    if (v18 > v11) {
      goto LABEL_9;
    }
  }
  return v9;
}

- (BOOL)mapToWordsWithIndex:(void *)a3 passing:(void *)a4
{
  unint64_t v16 = [(NSMutableArray *)self->textLinesInZone count];
  if (v16)
  {
    uint64_t v6 = 0;
    BOOL v7 = 0;
    uint64_t v8 = 0;
    while (1)
    {
      BOOL v9 = (void *)-[NSMutableArray objectAtIndex:](self->textLinesInZone, "objectAtIndex:", v6, v16);
      uint64_t v10 = [v9 charSequence];
      int v11 = [v9 wordCount];
      uint64_t v12 = (v11 + v8);
      uint64_t v13 = [v9 wordArray];
      if (v8 < v12) {
        break;
      }
LABEL_8:
      BOOL v7 = ++v6 >= v16;
      if (v6 == v16) {
        return 1;
      }
    }
    uint64_t v14 = v13;
    while (((unsigned int (*)(uint64_t, uint64_t, uint64_t, void *))a3)(v8, v14, v10, a4))
    {
      v14 += 48;
      uint64_t v8 = (v8 + 1);
      if (!--v11)
      {
        uint64_t v8 = v12;
        goto LABEL_8;
      }
    }
  }
  else
  {
    return 1;
  }
  return v7;
}

- (BOOL)mapToWords:(void *)a3 passing:(void *)a4
{
  unint64_t v7 = [(NSMutableArray *)self->textLinesInZone count];
  if (v7)
  {
    int v8 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->textLinesInZone, "objectAtIndex:", 0), "mapToWords:passing:", a3, a4);
    if (v8)
    {
      uint64_t v9 = 1;
      while (v7 != v9)
      {
        char v10 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->textLinesInZone, "objectAtIndex:", v9++), "mapToWords:passing:", a3, a4);
        if ((v10 & 1) == 0)
        {
          unint64_t v11 = v9 - 1;
          goto LABEL_9;
        }
      }
      unint64_t v11 = v7;
LABEL_9:
      LOBYTE(v8) = v11 >= v7;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (unsigned)wordCount
{
  uint64_t v3 = [(NSMutableArray *)self->textLinesInZone count];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = 0;
  unsigned int v5 = 0;
  do
    v5 += objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->textLinesInZone, "objectAtIndex:", v4++), "wordCount");
  while (v3 != v4);
  return v5;
}

- (id)graphicsInZone
{
  id result = self->graphicsInZone;
  if (!result)
  {
    id result = [(CPObject *)self shallowDescendantsOfClass:objc_opt_class()];
    self->graphicsInZone = (NSArray *)result;
  }
  return result;
}

- (id)textLinesInZone
{
  return self->textLinesInZone;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CPZone;
  unsigned int v5 = -[CPRegion copyWithZone:](&v15, sel_copyWithZone_);
  if (v5)
  {
    v5[16] = [(NSMutableArray *)self->zoneBorders copyWithZone:a3];
    v5[21] = self->zoneProfile;
    if (self->outerVertices)
    {
      unsigned int v6 = [(CPZone *)self vertexCount];
      v5[17] = NSZoneMalloc(0, 16 * v6);
      if (v6)
      {
        for (uint64_t i = 0; i != v6; ++i)
          *(CGPoint *)(v5[17] + i * 16) = self->outerVertices[i];
      }
    }
    if (self->swollenOuterVertices)
    {
      unsigned int v8 = [(CPZone *)self vertexCount];
      v5[18] = NSZoneMalloc(0, 16 * v8);
      if (v8)
      {
        for (uint64_t j = 0; j != v8; ++j)
          *(CGPoint *)(v5[18] + j * 16) = self->swollenOuterVertices[j];
      }
    }
    leftGuides = self->leftGuides;
    if (leftGuides) {
      v5[22] = leftGuides;
    }
    rightGuides = self->rightGuides;
    if (rightGuides) {
      v5[23] = rightGuides;
    }
    gutters = self->gutters;
    if (gutters) {
      v5[24] = gutters;
    }
    spacers = self->spacers;
    if (spacers) {
      v5[25] = spacers;
    }
    v5[26] = [(CPCharSequence *)self->charactersInZone copyWithZone:a3];
    *((unsigned char *)v5 + 216) = self->hasRotatedCharacters;
    v5[28] = [(NSMutableArray *)self->textLinesInZone mutableCopy];
    v5[29] = [(NSArray *)self->graphicsInZone copy];
  }
  return v5;
}

- (void)dealloc
{
  swollenOuterVertices = self->swollenOuterVertices;
  if (swollenOuterVertices)
  {
    uint64_t v4 = (NSZone *)MEMORY[0x185329D10](swollenOuterVertices, a2);
    NSZoneFree(v4, self->swollenOuterVertices);
  }
  outerVertices = self->outerVertices;
  if (outerVertices)
  {
    unsigned int v6 = (NSZone *)MEMORY[0x185329D10](outerVertices, a2);
    NSZoneFree(v6, self->outerVertices);
  }

  v7.receiver = self;
  v7.super_class = (Class)CPZone;
  [(CPRegion *)&v7 dealloc];
}

- (CPZone)init
{
  v5.receiver = self;
  v5.super_class = (Class)CPZone;
  v2 = [(CPChunk *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->outerVertices = 0;
    v2->swollenOuterVertices = 0;
    v2->area = -1.0;
    v2->isStraddleZone = 0;
    v2->zoneProfile = 0;
    v2->leftGuides = 0;
    v2->rightGuides = 0;
    v2->gutters = 0;
    v2->spacers = 0;
    v2->textLinesInZone = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3->charactersInZone = 0;
    v3->hasRotatedCharacters = 0;
  }
  return v3;
}

@end