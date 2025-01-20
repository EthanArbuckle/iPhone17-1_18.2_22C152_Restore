@interface BiometricKitEnrollProgressCoordinates
- (double)angle;
- (double)x;
- (double)y;
- (void)setAngle:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
@end

@implementation BiometricKitEnrollProgressCoordinates

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
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