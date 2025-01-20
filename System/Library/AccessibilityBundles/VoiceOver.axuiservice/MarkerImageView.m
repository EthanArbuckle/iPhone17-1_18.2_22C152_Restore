@interface MarkerImageView
- (double)rotationRadian;
- (void)setRotationRadian:(double)a3;
@end

@implementation MarkerImageView

- (double)rotationRadian
{
  return self->_rotationRadian;
}

- (void)setRotationRadian:(double)a3
{
  self->_rotationRadian = a3;
}

@end