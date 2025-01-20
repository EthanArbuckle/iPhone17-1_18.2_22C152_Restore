@interface CVACLMotionTypeVector3
- (CVACLMotionTypeVector3)initWithFastPathXYZDataV3:(_FastPathXYZDataV3 *)a3;
- (float)x;
- (float)y;
- (float)z;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)setZ:(float)a3;
@end

@implementation CVACLMotionTypeVector3

- (CVACLMotionTypeVector3)initWithFastPathXYZDataV3:(_FastPathXYZDataV3 *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  v16.receiver = self;
  v16.super_class = (Class)CVACLMotionTypeVector3;
  v10 = [(CVACLMotionTypeVector3 *)&v16 init];
  if (v10 == self)
  {
    float v12 = v8;
    float v13 = v7;
    self->_x = v12;
    self->_y = v13;
    float v14 = v6;
    self->_z = v14;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (float)x
{
  return self->_x;
}

- (void)setX:(float)a3
{
  self->_x = a3;
}

- (float)y
{
  return self->_y;
}

- (void)setY:(float)a3
{
  self->_y = a3;
}

- (float)z
{
  return self->_z;
}

- (void)setZ:(float)a3
{
  self->_z = a3;
}

@end