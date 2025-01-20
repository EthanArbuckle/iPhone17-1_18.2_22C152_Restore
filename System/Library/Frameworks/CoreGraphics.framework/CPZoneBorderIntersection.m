@interface CPZoneBorderIntersection
- (BOOL)backwardVector;
- (BOOL)forwardVector;
- (CGRect)intersectionRect;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initSuper;
- (id)intersectingBorder;
- (int64_t)comparePositionLengthwise:(id)a3;
- (void)setBackwardVector:(BOOL)a3;
- (void)setForwardVector:(BOOL)a3;
- (void)setIntersectingBorder:(id)a3;
- (void)setIntersectionRect:(CGRect)a3;
@end

@implementation CPZoneBorderIntersection

- (int64_t)comparePositionLengthwise:(id)a3
{
  double x = self->intersectionRect.origin.x;
  [a3 intersectionRect];
  double v7 = v6;
  double y = self->intersectionRect.origin.y;
  [a3 intersectionRect];
  if (vabdd_f64(v7, x) < vabdd_f64(v9, y))
  {
    BOOL v10 = y == v9;
    if (y >= v9) {
      return !v10;
    }
    return -1;
  }
  BOOL v10 = x == v7;
  if (x < v7) {
    return -1;
  }
  return !v10;
}

- (BOOL)backwardVector
{
  return self->backwardVector;
}

- (void)setBackwardVector:(BOOL)a3
{
  self->backwardVector = a3;
}

- (BOOL)forwardVector
{
  return self->forwardVector;
}

- (void)setForwardVector:(BOOL)a3
{
  self->forwardVector = a3;
}

- (id)intersectingBorder
{
  return self->intersectingBorder;
}

- (void)setIntersectingBorder:(id)a3
{
  self->intersectingBorder = (CPZoneBorder *)a3;
}

- (CGRect)intersectionRect
{
  double x = self->intersectionRect.origin.x;
  double y = self->intersectionRect.origin.y;
  double width = self->intersectionRect.size.width;
  double height = self->intersectionRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setIntersectionRect:(CGRect)a3
{
  self->intersectionRect = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)CPCopyObject(self, a3);
}

- (id)initSuper
{
  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorderIntersection;
  return [(CPZoneBorderIntersection *)&v3 init];
}

@end