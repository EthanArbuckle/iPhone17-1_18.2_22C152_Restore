@interface SGMockRTLocation
- (double)horizontalUncertainty;
- (double)latitude;
- (double)longitude;
- (void)setHorizontalUncertainty:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
@end

@implementation SGMockRTLocation

- (void)setHorizontalUncertainty:(double)a3
{
  self->_horizontalUncertainty = a3;
}

- (double)horizontalUncertainty
{
  return self->_horizontalUncertainty;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)latitude
{
  return self->_latitude;
}

@end