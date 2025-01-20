@interface AXMTPointerMovement
- (AXMTPointerMovement)initWithMovementDelta:(CGPoint)a3;
- (AXMTPointerMovement)initWithPointerLocation:(CGPoint)a3;
- (CGPoint)delta;
- (CGPoint)location;
- (unint64_t)type;
@end

@implementation AXMTPointerMovement

- (AXMTPointerMovement)initWithPointerLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)AXMTPointerMovement;
  result = [(AXMTPointerMovement *)&v6 init];
  if (result)
  {
    result->_type = 0;
    result->_location.CGFloat x = x;
    result->_location.CGFloat y = y;
  }
  return result;
}

- (AXMTPointerMovement)initWithMovementDelta:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)AXMTPointerMovement;
  result = [(AXMTPointerMovement *)&v6 init];
  if (result)
  {
    result->_type = 1;
    result->_delta.CGFloat x = x;
    result->_delta.CGFloat y = y;
  }
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (CGPoint)location
{
  objc_copyStruct(v4, &self->_location, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (CGPoint)delta
{
  objc_copyStruct(v4, &self->_delta, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

@end