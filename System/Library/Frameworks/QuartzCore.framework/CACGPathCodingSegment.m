@interface CACGPathCodingSegment
+ (BOOL)supportsSecureCoding;
- (CACGPathCodingSegment)initWithCGPathElement:(const CGPathElement *)a3;
- (CACGPathCodingSegment)initWithCoder:(id)a3;
- (void)addToCGPath:(CGPath *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CACGPathCodingSegment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)addToCGPath:(CGPath *)a3
{
  switch(self->_type)
  {
    case 0:
      CGPathMoveToPoint(a3, 0, self->_points[0].x, self->_points[0].y);
      break;
    case 1:
      CGPathAddLineToPoint(a3, 0, self->_points[0].x, self->_points[0].y);
      break;
    case 2:
      CGPathAddQuadCurveToPoint(a3, 0, self->_points[0].x, self->_points[0].y, self->_points[1].x, self->_points[1].y);
      break;
    case 3:
      CGPathAddCurveToPoint(a3, 0, self->_points[0].x, self->_points[0].y, self->_points[1].x, self->_points[1].y, self->_points[2].x, self->_points[2].y);
      break;
    case 4:
      CGPathCloseSubpath(a3);
      break;
    default:
      return;
  }
}

- (CACGPathCodingSegment)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)CACGPathCodingSegment;
  v4 = [(CACGPathCodingSegment *)&v15 init];
  if (v4)
  {
    unsigned int v5 = [a3 decodeIntForKey:@"LKCGPathType"];
    v4->_type = v5;
    if (v5 <= 3)
    {
      unsigned int v6 = 0xCu >> (v5 & 0xF);
      int v7 = v5 & 0xF;
      [a3 decodeDoubleForKey:@"LKCGPathPoint0_x"];
      v4->_points[0].x = v8;
      [a3 decodeDoubleForKey:@"LKCGPathPoint0_y"];
      v4->_points[0].y = v9;
      if (v6)
      {
        [a3 decodeDoubleForKey:@"LKCGPathPoint1_x"];
        v4->_points[1].x = v10;
        [a3 decodeDoubleForKey:@"LKCGPathPoint1_y"];
        v4->_points[1].y = v11;
      }
      if (v7 == 3)
      {
        [a3 decodeDoubleForKey:@"LKCGPathPoint2_x"];
        v4->_points[2].x = v12;
        [a3 decodeDoubleForKey:@"LKCGPathPoint2_y"];
        v4->_points[2].y = v13;
      }
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:self->_type forKey:@"LKCGPathType"];
  unsigned int type = self->_type;
  if (type <= 3)
  {
    unsigned int v6 = 0xCu >> (type & 0xF);
    int v7 = self->_type & 0xF;
    [a3 encodeDouble:@"LKCGPathPoint0_x" forKey:self->_points[0].x];
    [a3 encodeDouble:@"LKCGPathPoint0_y" forKey:self->_points[0].y];
    if (v6)
    {
      [a3 encodeDouble:@"LKCGPathPoint1_x" forKey:self->_points[1].x];
      [a3 encodeDouble:@"LKCGPathPoint1_y" forKey:self->_points[1].y];
    }
    if (v7 == 3)
    {
      [a3 encodeDouble:@"LKCGPathPoint2_x" forKey:self->_points[2].x];
      double y = self->_points[2].y;
      [a3 encodeDouble:@"LKCGPathPoint2_y" forKey:y];
    }
  }
}

- (CACGPathCodingSegment)initWithCGPathElement:(const CGPathElement *)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CACGPathCodingSegment;
  result = [(CACGPathCodingSegment *)&v6 init];
  if (result)
  {
    result->_CGPathElementType type = a3->type;
    CGPathElementType type = a3->type;
    if (a3->type >= kCGPathElementAddQuadCurveToPoint)
    {
      if (type != kCGPathElementAddQuadCurveToPoint)
      {
        if (type != kCGPathElementAddCurveToPoint) {
          return result;
        }
        result->_points[2] = a3->points[2];
      }
      result->_points[1] = a3->points[1];
    }
    result->_points[0] = *a3->points;
  }
  return result;
}

@end