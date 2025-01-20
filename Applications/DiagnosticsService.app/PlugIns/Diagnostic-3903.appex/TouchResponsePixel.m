@interface TouchResponsePixel
- (double)height;
- (double)width;
- (double)x;
- (double)y;
- (void)setHeight:(double)a3;
- (void)setWidth:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
@end

@implementation TouchResponsePixel

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

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

@end