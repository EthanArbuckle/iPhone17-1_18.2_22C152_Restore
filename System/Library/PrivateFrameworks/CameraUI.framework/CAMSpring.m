@interface CAMSpring
- (BOOL)isConverged;
- (CAMSpring)initWithTension:(double)a3 friction:(double)a4 epsilon:(double)a5;
- (CAMSpring)initWithTension:(double)a3 friction:(double)a4 epsilon:(double)a5 boundedBetween:(double)a6 and:(double)a7;
- (double)_current;
- (double)_currentForce;
- (double)_lastTimestamp;
- (double)_lowerBound;
- (double)_upperBound;
- (double)epsilon;
- (double)friction;
- (double)maximumTimeDelta;
- (double)target;
- (double)tension;
- (double)value;
- (double)velocity;
- (void)_setConverged:(BOOL)a3;
- (void)_setCurrent:(double)a3;
- (void)_setLastTimestamp:(double)a3;
- (void)_updateConverged;
- (void)_updateWithForce:(double)a3 timestamp:(double)a4;
- (void)converge;
- (void)resetToValue:(double)a3;
- (void)setFriction:(double)a3;
- (void)setMaximumTimeDelta:(double)a3;
- (void)setTarget:(double)a3;
- (void)setTension:(double)a3;
- (void)setVelocity:(double)a3;
- (void)updateForTimestamp:(double)a3;
@end

@implementation CAMSpring

- (CAMSpring)initWithTension:(double)a3 friction:(double)a4 epsilon:(double)a5
{
  return [(CAMSpring *)self initWithTension:a3 friction:a4 epsilon:a5 boundedBetween:-1.79769313e308 and:1.79769313e308];
}

- (CAMSpring)initWithTension:(double)a3 friction:(double)a4 epsilon:(double)a5 boundedBetween:(double)a6 and:(double)a7
{
  v16.receiver = self;
  v16.super_class = (Class)CAMSpring;
  v12 = [(CAMSpring *)&v16 init];
  v13 = (CAMSpring *)v12;
  if (v12)
  {
    *((double *)v12 + 2) = a3;
    *((double *)v12 + 3) = a4;
    *((double *)v12 + 6) = a5;
    *((double *)v12 + 10) = fmin(a6, a7);
    *((double *)v12 + 11) = fmax(a6, a7);
    *(_OWORD *)(v12 + 56) = xmmword_209C79940;
    v12[8] = 1;
    v14 = v12;
  }

  return v13;
}

- (void)setTarget:(double)a3
{
  self->_target = a3;
  [(CAMSpring *)self _updateConverged];
}

- (void)_setCurrent:(double)a3
{
  self->__current = a3;
  [(CAMSpring *)self _updateConverged];
}

- (double)value
{
  [(CAMSpring *)self _upperBound];
  double v4 = v3;
  [(CAMSpring *)self _current];
  double v6 = fmin(v4, v5);
  [(CAMSpring *)self _lowerBound];
  return fmax(v6, v7);
}

- (void)resetToValue:(double)a3
{
  self->_target = a3;
  self->__current = a3;
  self->_velocity = 0.0;
  [(CAMSpring *)self _setConverged:1];
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMSpring *)self _setLastTimestamp:Current];
}

- (void)updateForTimestamp:(double)a3
{
  [(CAMSpring *)self _currentForce];
  -[CAMSpring _updateWithForce:timestamp:](self, "_updateWithForce:timestamp:");
}

- (void)converge
{
  [(CAMSpring *)self target];
  -[CAMSpring resetToValue:](self, "resetToValue:");
}

- (void)_updateConverged
{
  [(CAMSpring *)self target];
  double v4 = v3;
  [(CAMSpring *)self _current];
  double v6 = vabdd_f64(v4, v5);
  [(CAMSpring *)self epsilon];
  double v8 = v7;
  [(CAMSpring *)self velocity];
  BOOL v10 = fabs(v9) < v8 && v6 < v8;
  [(CAMSpring *)self _setConverged:v10];
}

- (double)_currentForce
{
  [(CAMSpring *)self tension];
  double v4 = v3;
  [(CAMSpring *)self target];
  double v6 = v5;
  [(CAMSpring *)self _current];
  double v8 = v6 - v7;
  [(CAMSpring *)self friction];
  double v10 = v9;
  [(CAMSpring *)self velocity];
  return v4 * v8 - v10 * v11;
}

- (void)_updateWithForce:(double)a3 timestamp:(double)a4
{
  [(CAMSpring *)self _lastTimestamp];
  double v8 = v7;
  [(CAMSpring *)self _setLastTimestamp:a4];
  if (v8 != 0.0 && ![(CAMSpring *)self isConverged])
  {
    [(CAMSpring *)self _updateConverged];
    if ([(CAMSpring *)self isConverged])
    {
      [(CAMSpring *)self target];
    }
    else
    {
      double v10 = vabdd_f64(a4, v8);
      [(CAMSpring *)self maximumTimeDelta];
      if (v10 >= v11) {
        double v10 = v11;
      }
      [(CAMSpring *)self velocity];
      [(CAMSpring *)self setVelocity:v12 + a3 * v10];
      [(CAMSpring *)self velocity];
      double v14 = v13;
      [(CAMSpring *)self _current];
      double v9 = v15 + v14 * v10;
    }
    [(CAMSpring *)self _setCurrent:v9];
  }
}

- (double)tension
{
  return self->_tension;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)target
{
  return self->_target;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (double)maximumTimeDelta
{
  return self->_maximumTimeDelta;
}

- (void)setMaximumTimeDelta:(double)a3
{
  self->_maximumTimeDelta = a3;
}

- (BOOL)isConverged
{
  return self->_converged;
}

- (void)_setConverged:(BOOL)a3
{
  self->_converged = a3;
}

- (double)_lastTimestamp
{
  return self->__lastTimestamp;
}

- (void)_setLastTimestamp:(double)a3
{
  self->__lastTimestamp = a3;
}

- (double)_current
{
  return self->__current;
}

- (double)_lowerBound
{
  return self->__lowerBound;
}

- (double)_upperBound
{
  return self->__upperBound;
}

@end