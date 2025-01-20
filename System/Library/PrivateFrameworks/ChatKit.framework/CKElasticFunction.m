@interface CKElasticFunction
+ (id)functionWithTension:(double)a3 friction:(double)a4 initialValue:(double)a5;
- (CKElasticFunction)init;
- (double)friction;
- (double)input;
- (double)output;
- (double)tension;
- (double)velocity;
- (void)setFriction:(double)a3;
- (void)setInput:(double)a3;
- (void)setTension:(double)a3;
- (void)step;
@end

@implementation CKElasticFunction

+ (id)functionWithTension:(double)a3 friction:(double)a4 initialValue:(double)a5
{
  v8 = (double *)objc_alloc_init((Class)objc_opt_class());
  [v8 setTension:a3];
  [v8 setFriction:a4];
  v8[2] = a5;
  v8[3] = a5;

  return v8;
}

- (CKElasticFunction)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKElasticFunction;
  result = [(CKElasticFunction *)&v3 init];
  if (result) {
    *(_OWORD *)&result->_friction = xmmword_18F81C7A0;
  }
  return result;
}

- (void)setInput:(double)a3
{
  self->_currentValue = a3;
}

- (double)output
{
  return self->_elastic;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)step
{
  double v2 = self->_elastic + (self->_elastic - self->_currentValue) * self->_tension * 0.001 * -0.001;
  double v3 = fmax(self->_friction * -0.001 + 1.0, 0.0) * (v2 - self->_oldForce) / 0.001;
  self->_elastic = v2 + v3 * 0.001;
  self->_oldForce = v2;
  self->_velocity = v3;
}

- (double)input
{
  return self->_currentValue;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)tension
{
  return self->_tension;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

@end