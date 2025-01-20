@interface BWSpringSimulation
+ (void)initialize;
- (BOOL)isCompleted;
- (BWSpringSimulation)init;
- (double)friction;
- (double)input;
- (double)output;
- (double)tension;
- (double)velocity;
- (int)updateCount;
- (void)resetWithInput:(double)a3 initialOutput:(double)a4 initialVelocity:(double)a5;
- (void)resetWithInput:(double)a3 initialOutput:(double)a4 initialVelocity:(double)a5 convergedSpeed:(double)a6;
- (void)setFriction:(double)a3;
- (void)setInput:(double)a3;
- (void)setTension:(double)a3;
- (void)update;
@end

@implementation BWSpringSimulation

- (int)updateCount
{
  return self->_updateCount;
}

- (double)output
{
  return self->_outputValue;
}

- (void)update
{
  if (!self->_completed)
  {
    double convergedSpeed = self->_convergedSpeed;
    double v3 = self->_outputValue + (self->_outputValue - self->_inputValue) * self->_tension * 0.02 * -0.02;
    double v4 = fmax(self->_friction * -0.02 + 1.0, 0.0) * (v3 - self->_previousForce) / 0.0166666667;
    self->_velocity = v4;
    if (fabs(v4) < convergedSpeed) {
      self->_completed = 1;
    }
    self->_previousForce = v3;
    self->_outputValue = v3 + v4 * 0.02;
    ++self->_updateCount;
  }
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)resetWithInput:(double)a3 initialOutput:(double)a4 initialVelocity:(double)a5 convergedSpeed:(double)a6
{
  self->_completed = 0;
  self->_updateCount = 0;
  double v6 = a4 - a3;
  self->_double convergedSpeed = a6;
  self->_inputValue = a3;
  double v7 = a6 * 1.1;
  if (a6 * 1.1 >= a5) {
    double v8 = a6 * 1.1;
  }
  else {
    double v8 = a5;
  }
  double v9 = -v7;
  if (v9 > a5) {
    double v9 = a5;
  }
  if (v6 >= 0.0) {
    double v9 = v8;
  }
  double v10 = a4 + v6 * self->_tension * 0.02 * -0.02 + v9 * 0.0166666667 / fmax(self->_friction * -0.02 + 1.0, 0.0);
  self->_velocity = v9;
  self->_previousForce = v10;
  self->_outputValue = a4;
}

- (void)resetWithInput:(double)a3 initialOutput:(double)a4 initialVelocity:(double)a5
{
}

- (BWSpringSimulation)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWSpringSimulation;
  result = [(BWSpringSimulation *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_tension = xmmword_1A5F0C140;
    result->_previousForce = 0.0;
    result->_inputValue = 0.0;
    result->_outputValue = 0.0;
  }
  return result;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

+ (void)initialize
{
}

- (double)input
{
  return self->_inputValue;
}

- (void)setInput:(double)a3
{
  self->_inputValue = a3;
}

- (double)tension
{
  return self->_tension;
}

- (double)friction
{
  return self->_friction;
}

- (double)velocity
{
  return self->_velocity;
}

@end