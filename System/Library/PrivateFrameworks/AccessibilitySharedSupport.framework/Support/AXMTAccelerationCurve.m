@interface AXMTAccelerationCurve
- (AXMTAccelerationCurve)initWithAccelerationFactor:(double)a3 inflectionPoint:(double)a4;
- (CGPoint)mapVector:(CGPoint)a3;
- (double)accelerationFactor;
- (double)inflectionPoint;
- (double)mapScalar:(double)a3;
- (void)setAccelerationFactor:(double)a3;
- (void)setInflectionPoint:(double)a3;
@end

@implementation AXMTAccelerationCurve

- (AXMTAccelerationCurve)initWithAccelerationFactor:(double)a3 inflectionPoint:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AXMTAccelerationCurve;
  result = [(AXMTAccelerationCurve *)&v7 init];
  if (result)
  {
    result->_accelerationFactor = a3;
    result->_inflectionPoint = a4;
  }
  return result;
}

- (double)mapScalar:(double)a3
{
  [(AXMTAccelerationCurve *)self inflectionPoint];
  double v6 = a3 / v5;
  [(AXMTAccelerationCurve *)self accelerationFactor];

  return pow(v6, v7);
}

- (CGPoint)mapVector:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = sqrt(a3.y * a3.y + x * x);
  [(AXMTAccelerationCurve *)self mapScalar:v5];
  double v7 = v6 / v5;
  double v8 = 0.0;
  if (v5 != 0.0) {
    double v8 = v7;
  }
  double v9 = x * v8;
  double v10 = y * v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (double)accelerationFactor
{
  return self->_accelerationFactor;
}

- (void)setAccelerationFactor:(double)a3
{
  self->_accelerationFactor = a3;
}

- (double)inflectionPoint
{
  return self->_inflectionPoint;
}

- (void)setInflectionPoint:(double)a3
{
  self->_inflectionPoint = a3;
}

@end