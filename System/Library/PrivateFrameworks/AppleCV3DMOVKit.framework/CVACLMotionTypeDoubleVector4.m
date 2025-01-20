@interface CVACLMotionTypeDoubleVector4
- (CVACLMotionTypeDoubleVector4)initWithFastPathXYZWDataV3:(_FastPathXYZWDataV3 *)a3;
- (double)w;
- (double)x;
- (double)y;
- (double)z;
- (void)setW:(double)a3;
- (void)setX:(double)a3;
- (void)setY:(double)a3;
- (void)setZ:(double)a3;
@end

@implementation CVACLMotionTypeDoubleVector4

- (CVACLMotionTypeDoubleVector4)initWithFastPathXYZWDataV3:(_FastPathXYZWDataV3 *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  v15.receiver = self;
  v15.super_class = (Class)CVACLMotionTypeDoubleVector4;
  v12 = [(CVACLMotionTypeDoubleVector4 *)&v15 init];
  if (v12 == self)
  {
    self->_y = v9;
    self->_z = v8;
    self->_w = v7;
    self->_x = v10;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (double)w
{
  return self->_w;
}

- (void)setW:(double)a3
{
  self->_w = a3;
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