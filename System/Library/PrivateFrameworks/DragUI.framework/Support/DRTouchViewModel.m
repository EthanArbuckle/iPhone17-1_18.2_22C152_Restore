@interface DRTouchViewModel
- (BOOL)hasLocation;
- (CAPoint3D)location;
- (void)setLocation:(CAPoint3D)a3;
@end

@implementation DRTouchViewModel

- (void)setLocation:(CAPoint3D)a3
{
  self->_hasLocation = 1;
  self->_location = a3;
}

- (CAPoint3D)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  double z = self->_location.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

@end