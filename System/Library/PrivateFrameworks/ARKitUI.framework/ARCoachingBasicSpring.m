@interface ARCoachingBasicSpring
- (ARCoachingBasicSpring)initWithTension:(float)a3 friction:(float)a4;
- (float)friction;
- (float)input;
- (float)output;
- (float)tension;
- (void)setFriction:(float)a3;
- (void)setInput:(float)a3;
- (void)setInput:(float)a3 velocity:(float)a4;
- (void)setTension:(float)a3;
- (void)stepWithDeltaTime:(double)a3;
@end

@implementation ARCoachingBasicSpring

- (float)output
{
  return self->_position;
}

- (float)input
{
  return self->_target;
}

- (void)setInput:(float)a3
{
  self->_target = a3;
}

- (ARCoachingBasicSpring)initWithTension:(float)a3 friction:(float)a4
{
  v11.receiver = self;
  v11.super_class = (Class)ARCoachingBasicSpring;
  v6 = [(ARCoachingBasicSpring *)&v11 init];
  v8 = v6;
  if (v6)
  {
    *(float *)&double v7 = a3;
    [(ARCoachingBasicSpring *)v6 setTension:v7];
    *(float *)&double v9 = a4;
    [(ARCoachingBasicSpring *)v8 setFriction:v9];
    *(void *)&v8->_target = 0;
    v8->_position = 0.0;
  }
  return v8;
}

- (void)stepWithDeltaTime:(double)a3
{
  [(ARCoachingBasicSpring *)self tension];
  float v6 = v5;
  float v7 = self->_position - self->_target;
  [(ARCoachingBasicSpring *)self friction];
  float v9 = self->_velocity + (float)((float)-(float)(v8 * self->_velocity) - (float)(v6 * v7)) * a3;
  float v10 = self->_position + v9 * a3;
  self->_velocity = v9;
  self->_position = v10;
}

- (void)setInput:(float)a3 velocity:(float)a4
{
  self->_velocity = a4;
  self->_position = a3;
  self->_target = a3;
}

- (float)tension
{
  return self->_tension;
}

- (void)setTension:(float)a3
{
  self->_tension = a3;
}

- (float)friction
{
  return self->_friction;
}

- (void)setFriction:(float)a3
{
  self->_friction = a3;
}

@end