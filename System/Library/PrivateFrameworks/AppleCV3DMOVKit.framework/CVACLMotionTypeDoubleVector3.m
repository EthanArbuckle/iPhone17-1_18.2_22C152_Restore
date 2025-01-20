@interface CVACLMotionTypeDoubleVector3
- (CVACLMotionTypeDoubleVector3)initWithFastPathXYZDataV3:(_FastPathXYZDataV3 *)a3;
- (double)x;
- (double)y;
- (double)z;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)setZ:(double)a3;
@end

@implementation CVACLMotionTypeDoubleVector3

- (CVACLMotionTypeDoubleVector3)initWithFastPathXYZDataV3:(_FastPathXYZDataV3 *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  v13.receiver = self;
  v13.super_class = (Class)CVACLMotionTypeDoubleVector3;
  v10 = [(CVACLMotionTypeDoubleVector3 *)&v13 init];
  if (v10 == self)
  {
    self->_x = v8;
    self->_y = v7;
    self->_z = v6;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

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

- (double)z
{
  return self->_z;
}

- (void)setZ:(double)a3
{
  self->_z = a3;
}

@end