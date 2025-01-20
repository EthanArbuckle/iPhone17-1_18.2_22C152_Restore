@interface AXMPoint
- (double)x;
- (double)y;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
@end

@implementation AXMPoint

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

@end