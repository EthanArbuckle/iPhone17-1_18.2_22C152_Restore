@interface AXPIFingerEventTouchInfo
- (CGPoint)normalizedLocation;
- (NSValue)location3D;
- (double)force;
- (void)setForce:(double)a3;
- (void)setLocation3D:(id)a3;
- (void)setNormalizedLocation:(CGPoint)a3;
@end

@implementation AXPIFingerEventTouchInfo

- (CGPoint)normalizedLocation
{
  double x = self->_normalizedLocation.x;
  double y = self->_normalizedLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setNormalizedLocation:(CGPoint)a3
{
  self->_normalizedLocation = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (NSValue)location3D
{
  return self->_location3D;
}

- (void)setLocation3D:(id)a3
{
}

- (void).cxx_destruct
{
}

@end