@interface LeftThumbstickState
- (LeftThumbstickState)init;
- (float)down;
- (float)left;
- (float)right;
- (float)up;
- (void)setDown:(float)a3;
- (void)setLeft:(float)a3;
- (void)setRight:(float)a3;
- (void)setUp:(float)a3;
@end

@implementation LeftThumbstickState

- (LeftThumbstickState)init
{
  v5.receiver = self;
  v5.super_class = (Class)LeftThumbstickState;
  v2 = [(LeftThumbstickState *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(LeftThumbstickState *)v2 setRight:0.0];
    [(LeftThumbstickState *)v3 setLeft:0.0];
    [(LeftThumbstickState *)v3 setDown:0.0];
    [(LeftThumbstickState *)v3 setUp:0.0];
  }
  return v3;
}

- (float)up
{
  return self->_up;
}

- (void)setUp:(float)a3
{
  self->_up = a3;
}

- (float)down
{
  return self->_down;
}

- (void)setDown:(float)a3
{
  self->_down = a3;
}

- (float)left
{
  return self->_left;
}

- (void)setLeft:(float)a3
{
  self->_left = a3;
}

- (float)right
{
  return self->_right;
}

- (void)setRight:(float)a3
{
  self->_right = a3;
}

@end