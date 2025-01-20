@interface AKTSDPathIntersection
- (AKTSDPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 atPoint:(CGPoint)a5;
- (AKTSDPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 onSegmentB:(int64_t)a5 atT:(double)a6 atPoint:(CGPoint)a7;
- (CGPoint)point;
- (double)t;
- (double)tB;
- (id)description;
- (int64_t)compareSegmentAndT:(id)a3;
- (int64_t)compareT:(id)a3;
- (int64_t)segment;
- (int64_t)segmentB;
- (void)setPoint:(CGPoint)a3;
@end

@implementation AKTSDPathIntersection

- (AKTSDPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 atPoint:(CGPoint)a5
{
  return -[AKTSDPathIntersection initWithSegment:atT:onSegmentB:atT:atPoint:](self, "initWithSegment:atT:onSegmentB:atT:atPoint:", a3, 0, a4, 0.0, a5.x, a5.y);
}

- (AKTSDPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 onSegmentB:(int64_t)a5 atT:(double)a6 atPoint:(CGPoint)a7
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  v14.receiver = self;
  v14.super_class = (Class)AKTSDPathIntersection;
  result = [(AKTSDPathIntersection *)&v14 init];
  if (result)
  {
    result->mPoint.CGFloat x = x;
    result->mPoint.CGFloat y = y;
    result->mSegment = a3;
    result->mSegmentB = a5;
    result->mT = a4;
    result->mTB = a6;
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(A:(%ld, %.2f) B:(%ld, %.2f) @:(%.2f, %.2f))", self->mSegment, *(void *)&self->mT, self->mSegmentB, *(void *)&self->mTB, *(void *)&self->mPoint.x, *(void *)&self->mPoint.y];
}

- (int64_t)compareSegmentAndT:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(AKTSDPathIntersection *)self segment];
  uint64_t v6 = [v4 segment];
  if (v5 >= v6)
  {
    if (v5 <= v6) {
      int64_t v7 = [(AKTSDPathIntersection *)self compareT:v4];
    }
    else {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (int64_t)compareT:(id)a3
{
  id v4 = a3;
  [(AKTSDPathIntersection *)self t];
  double v6 = v5;
  [v4 t];
  double v8 = v7;

  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 > v8;
  }
}

- (int64_t)segment
{
  return self->mSegment;
}

- (double)t
{
  return self->mT;
}

- (CGPoint)point
{
  double x = self->mPoint.x;
  double y = self->mPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->mPoint = a3;
}

- (int64_t)segmentB
{
  return self->mSegmentB;
}

- (double)tB
{
  return self->mTB;
}

@end