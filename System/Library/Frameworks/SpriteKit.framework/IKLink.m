@interface IKLink
- (IKLink)initWithNode:(id)a3;
- (SKNode)node;
- (_GLKVector2)position;
- (_GLKVector2)size;
- (double)normalizeAngle:(double)result;
- (float)angle;
- (float)angleInitial;
- (float)length;
- (void)rotateByAngle:(float)a3;
- (void)setAngleInitial:(float)a3;
- (void)setLength:(float)a3;
- (void)setNode:(id)a3;
- (void)setPosition:(_GLKVector2)a3;
- (void)setSize:(_GLKVector2)a3;
@end

@implementation IKLink

- (IKLink)initWithNode:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IKLink;
  v6 = [(IKLink *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_node, a3);
    v7->_position = 0;
    [v5 zRotation];
    *(float *)&double v8 = v8;
    v7->_angleInitial = *(float *)&v8;
    [v5 zRotation];
    *(float *)&double v9 = v9;
    v7->_angle = *(float *)&v9;
    v7->_length = 0.0;
  }

  return v7;
}

- (double)normalizeAngle:(double)result
{
  if (result < 0.0 || result > 6.28318531)
  {
    float v3 = result / 6.28318531;
    return result - (double)(int)vcvtms_s32_f32(v3) * 6.28318531;
  }
  return result;
}

- (void)rotateByAngle:(float)a3
{
  id v5 = [(SKNode *)self->_node reachConstraints];

  if (v5)
  {
    v6 = [(SKNode *)self->_node reachConstraints];
    [v6 lowerAngleLimit];
    float v8 = v7;
    if (v8 < 0.0 || v8 > 6.2832) {
      float v8 = v8 - (float)((float)(int)floorf(v8 / 6.2832) * 6.2832);
    }

    double v9 = [(SKNode *)self->_node reachConstraints];
    [v9 upperAngleLimit];
    *(float *)&double v10 = v10;
    float v11 = *(float *)&v10 - v8;
    if ((float)(*(float *)&v10 - v8) < 0.0 || v11 > 6.2832) {
      float v11 = v11 - (float)((float)(int)floorf(v11 / 6.2832) * 6.2832);
    }
  }
  else
  {
    float v8 = 0.0;
    float v11 = 6.2832;
  }
  float angleInitial = self->_angleInitial;
  float v13 = angleInitial - v8;
  if ((float)(angleInitial - v8) < 0.0 || v13 > 6.2832) {
    float v13 = v13 - (float)((float)(int)floorf(v13 / 6.2832) * 6.2832);
  }
  float v14 = (float)(self->_angle + a3) - v8;
  if (v14 < 0.0 || v14 > 6.2832) {
    float v14 = v14 - (float)((float)(int)floorf(v14 / 6.2832) * 6.2832);
  }
  float v15 = 0.0;
  if ((float)(v14 - v11) < (float)(6.2832 - v14)) {
    float v15 = v11;
  }
  if (v14 > v11) {
    float v14 = v15;
  }
  float v16 = v14 - v13;
  if (v11 >= 6.2832)
  {
    if (v16 <= 3.14159265)
    {
      if (v16 <= -3.14159265) {
        float v16 = v16 + 6.2832;
      }
    }
    else
    {
      float v16 = v16 + -6.2832;
    }
  }
  self->_angle = angleInitial + v16;
}

- (SKNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (_GLKVector2)position
{
  return (_GLKVector2)self;
}

- (void)setPosition:(_GLKVector2)a3
{
  self->_position.x = v3;
  self->_position.y = v4;
}

- (float)angleInitial
{
  return self->_angleInitial;
}

- (void)setAngleInitial:(float)a3
{
  self->_float angleInitial = a3;
}

- (float)angle
{
  return self->_angle;
}

- (float)length
{
  return self->_length;
}

- (void)setLength:(float)a3
{
  self->_length = a3;
}

- (_GLKVector2)size
{
  return (_GLKVector2)self;
}

- (void)setSize:(_GLKVector2)a3
{
  self->_size.x = v3;
  self->_size.y = v4;
}

- (void).cxx_destruct
{
}

@end