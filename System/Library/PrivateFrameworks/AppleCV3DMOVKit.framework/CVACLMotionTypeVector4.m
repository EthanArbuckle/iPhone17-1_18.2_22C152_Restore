@interface CVACLMotionTypeVector4
- (CVACLMotionTypeVector4)initWithFastPathXYZWDataV3:(_FastPathXYZWDataV3 *)a3;
- (float)w;
- (float)x;
- (float)y;
- (float)z;
- (void)setW:(float)a3;
- (void)setX:(float)a3;
- (void)setY:(float)a3;
- (void)setZ:(float)a3;
@end

@implementation CVACLMotionTypeVector4

- (CVACLMotionTypeVector4)initWithFastPathXYZWDataV3:(_FastPathXYZWDataV3 *)a3
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  double v10 = v3;
  v19.receiver = self;
  v19.super_class = (Class)CVACLMotionTypeVector4;
  v12 = [(CVACLMotionTypeVector4 *)&v19 init];
  if (v12 == self)
  {
    float v14 = v10;
    float v15 = v9;
    float v16 = v8;
    self->_y = v15;
    self->_z = v16;
    float v17 = v7;
    self->_w = v17;
    self->_x = v14;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (float)w
{
  return self->_w;
}

- (void)setW:(float)a3
{
  self->_w = a3;
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