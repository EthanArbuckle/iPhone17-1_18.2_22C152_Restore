@interface _MKJunctionElement
- (CGPoint)leftBasePoint;
- (CGPoint)leftEdgePointAtDistanceFromBase:(double)a3;
- (CGPoint)rightBasePoint;
- (CGPoint)rightEdgePointAtDistanceFromBase:(double)a3;
- (double)angle;
- (id)description;
- (void)setAngle:(double)a3;
- (void)setLeftBasePoint:(CGPoint)a3;
- (void)setRightBasePoint:(CGPoint)a3;
@end

@implementation _MKJunctionElement

- (CGPoint)leftEdgePointAtDistanceFromBase:(double)a3
{
  [(_MKJunctionElement *)self leftBasePoint];
  double v6 = v5;
  double v8 = v7;
  [(_MKJunctionElement *)self angle];
  __double2 v10 = __sincos_stret(v9);
  double v11 = v8 + a3 * v10.__sinval;
  double v12 = v6 + a3 * v10.__cosval;
  result.y = v11;
  result.x = v12;
  return result;
}

- (CGPoint)rightEdgePointAtDistanceFromBase:(double)a3
{
  [(_MKJunctionElement *)self rightBasePoint];
  double v6 = v5;
  double v8 = v7;
  [(_MKJunctionElement *)self angle];
  __double2 v10 = __sincos_stret(v9);
  double v11 = v8 + a3 * v10.__sinval;
  double v12 = v6 + a3 * v10.__cosval;
  result.y = v11;
  result.x = v12;
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = [NSString stringWithFormat:@"{%.1f, %.1f}", *(void *)&self->_leftBasePoint.x, *(void *)&self->_leftBasePoint.y];
  double v7 = NSStringFromCGPoint(self->_rightBasePoint);
  double v8 = [v3 stringWithFormat:@"<%@: %p, leftBase: %@, rightBase: %@, angle: %f>", v5, self, v6, v7, *(void *)&self->_angle];

  return v8;
}

- (CGPoint)leftBasePoint
{
  double x = self->_leftBasePoint.x;
  double y = self->_leftBasePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLeftBasePoint:(CGPoint)a3
{
  self->_leftBasePoint = a3;
}

- (CGPoint)rightBasePoint
{
  double x = self->_rightBasePoint.x;
  double y = self->_rightBasePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRightBasePoint:(CGPoint)a3
{
  self->_rightBasePoint = a3;
}

- (double)angle
{
  return self->_angle;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

@end