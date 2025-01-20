@interface DRTouchWithVelocity
- ($ECA2C0FE52DC94AC48CFE84ED3E0A6C0)velocity;
- (UITouch)touch;
- (void)setTouch:(id)a3;
- (void)setVelocity:(id)a3;
@end

@implementation DRTouchWithVelocity

- (UITouch)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
}

- ($ECA2C0FE52DC94AC48CFE84ED3E0A6C0)velocity
{
  long long v3 = *(_OWORD *)&self->_velocity.var0.x;
  long long v4 = *(_OWORD *)&self->_velocity.var0.z;
  _OWORD *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (void)setVelocity:(id)a3
{
  long long v4 = v3[1];
  *(_OWORD *)&self->_velocity.var0.x = *v3;
  *(_OWORD *)&self->_velocity.var0.z = v4;
}

- (void).cxx_destruct
{
}

@end