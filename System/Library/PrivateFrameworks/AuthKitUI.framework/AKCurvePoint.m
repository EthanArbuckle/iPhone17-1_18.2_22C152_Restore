@interface AKCurvePoint
+ (id)pointWithX:(double)a3 y:(double)a4;
- (AKCurvePoint)initWithX:(double)a3 y:(double)a4;
- (CGPoint)CGPoint;
- (CGPoint)leftTangentPoint;
- (CGPoint)rightTangentPoint;
- (double)roundness;
- (double)smoothness;
- (double)x;
- (double)y;
- (void)setCGPoint:(CGPoint)a3;
- (void)setLeftTangentPoint:(CGPoint)a3;
- (void)setRightTangentPoint:(CGPoint)a3;
- (void)setRoundness:(double)a3;
- (void)setSmoothness:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
@end

@implementation AKCurvePoint

+ (id)pointWithX:(double)a3 y:(double)a4
{
  v4 = [[AKCurvePoint alloc] initWithX:a3 y:a4];

  return v4;
}

- (AKCurvePoint)initWithX:(double)a3 y:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AKCurvePoint;
  result = [(AKCurvePoint *)&v7 init];
  if (result)
  {
    result->_x = a3;
    result->_y = a4;
  }
  return result;
}

- (void)setCGPoint:(CGPoint)a3
{
  *(CGPoint *)&self->_x = a3;
}

- (CGPoint)CGPoint
{
  double x = self->_x;
  double y = self->_y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_double x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_double y = a3;
}

- (CGPoint)leftTangentPoint
{
  double x = self->_leftTangentPoint.x;
  double y = self->_leftTangentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLeftTangentPoint:(CGPoint)a3
{
  self->_leftTangentPoint = a3;
}

- (CGPoint)rightTangentPoint
{
  double x = self->_rightTangentPoint.x;
  double y = self->_rightTangentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRightTangentPoint:(CGPoint)a3
{
  self->_rightTangentPoint = a3;
}

- (double)roundness
{
  return self->_roundness;
}

- (void)setRoundness:(double)a3
{
  self->_roundness = a3;
}

- (double)smoothness
{
  return self->_smoothness;
}

- (void)setSmoothness:(double)a3
{
  self->_smoothness = a3;
}

@end