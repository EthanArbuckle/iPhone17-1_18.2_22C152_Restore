@interface CBALSHotspotLocation
- (float)x;
- (float)y;
- (id)description;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
@end

@implementation CBALSHotspotLocation

- (void)setY:(float)a3
{
  self->_y = a3;
}

- (void)setX:(float)a3
{
  self->_x = a3;
}

- (id)description
{
  v8 = self;
  SEL v7 = a2;
  id v6 = (id)NSString;
  [(CBALSHotspotLocation *)self x];
  double v5 = v2;
  [(CBALSHotspotLocation *)v8 y];
  return (id)objc_msgSend(v6, "stringWithFormat:", @"x:%f y:%f", *(void *)&v5, v3);
}

- (float)x
{
  return self->_x;
}

- (float)y
{
  return self->_y;
}

@end