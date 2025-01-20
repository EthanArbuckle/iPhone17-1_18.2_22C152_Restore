@interface CAMAdditiveAnimation
+ (id)animationToValue:(double)a3 fromAnimation:(id)a4 duration:(double)a5 curve:(id)a6;
+ (id)animationToValue:(double)a3 fromValue:(double)a4 duration:(double)a5 curve:(id)a6;
- (BOOL)isFinished;
- (CAMAdditiveAnimation)_fromAnimation;
- (CAMediaTimingFunction)_curve;
- (double)_duration;
- (double)_fromValue;
- (double)_lastTime;
- (double)_startTime;
- (double)_toValue;
- (double)value;
- (id)description;
- (void)_setLastTime:(double)a3;
- (void)_setStartTime:(double)a3;
- (void)set_fromAnimation:(id)a3;
- (void)set_fromValue:(double)a3;
- (void)updateWithTimestamp:(double)a3;
@end

@implementation CAMAdditiveAnimation

+ (id)animationToValue:(double)a3 fromValue:(double)a4 duration:(double)a5 curve:(id)a6
{
  id v10 = a6;
  v11 = (double *)objc_alloc_init((Class)a1);
  v11[1] = a3;
  v11[2] = a4;
  v11[3] = a5;
  v12 = (void *)*((void *)v11 + 4);
  *((void *)v11 + 4) = v10;

  v11[6] = CACurrentMediaTime();
  return v11;
}

+ (id)animationToValue:(double)a3 fromAnimation:(id)a4 duration:(double)a5 curve:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v12 = (double *)objc_alloc_init((Class)a1);
  v12[1] = a3;
  v13 = (void *)*((void *)v12 + 5);
  *((void *)v12 + 5) = v10;
  id v14 = v10;

  v12[3] = a5;
  v15 = (void *)*((void *)v12 + 4);
  *((void *)v12 + 4) = v11;

  v12[6] = CACurrentMediaTime();
  return v12;
}

- (BOOL)isFinished
{
  [(CAMAdditiveAnimation *)self _lastTime];
  double v4 = v3;
  [(CAMAdditiveAnimation *)self _startTime];
  double v6 = v4 - v5;
  [(CAMAdditiveAnimation *)self _duration];
  return v6 > v7;
}

- (void)updateWithTimestamp:(double)a3
{
  -[CAMAdditiveAnimation _setLastTime:](self, "_setLastTime:");
  id v5 = [(CAMAdditiveAnimation *)self _fromAnimation];
  [v5 updateWithTimestamp:a3];
  if ([v5 isFinished])
  {
    [v5 _toValue];
    -[CAMAdditiveAnimation set_fromValue:](self, "set_fromValue:");
    [(CAMAdditiveAnimation *)self set_fromAnimation:0];
  }
}

- (double)value
{
  if ([(CAMAdditiveAnimation *)self isFinished])
  {
    [(CAMAdditiveAnimation *)self _toValue];
  }
  else
  {
    double v4 = [(CAMAdditiveAnimation *)self _fromAnimation];
    id v5 = v4;
    if (v4) {
      [v4 value];
    }
    else {
      [(CAMAdditiveAnimation *)self _fromValue];
    }
    double v7 = v6;
    [(CAMAdditiveAnimation *)self _toValue];
    double v9 = v8;
    [(CAMAdditiveAnimation *)self _lastTime];
    double v11 = v10;
    [(CAMAdditiveAnimation *)self _startTime];
    double v13 = v11 - v12;
    [(CAMAdditiveAnimation *)self _duration];
    double v15 = v13 / v14;
    v16 = [(CAMAdditiveAnimation *)self _curve];
    if (v16)
    {
      v17 = [(CAMAdditiveAnimation *)self _curve];
      *(float *)&double v18 = v15;
      [v17 _solveForInput:v18];
      double v15 = v19;
    }
    double v20 = CEKInterpolate(v7, v9, v15);

    return v20;
  }
  return result;
}

- (id)description
{
  double v3 = [(CAMAdditiveAnimation *)self _fromAnimation];

  double v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  [(CAMAdditiveAnimation *)self value];
  uint64_t v8 = v7;
  if (v3)
  {
    [(CAMAdditiveAnimation *)self _toValue];
    uint64_t v10 = v9;
    [(CAMAdditiveAnimation *)self _duration];
    uint64_t v12 = v11;
    [(CAMAdditiveAnimation *)self _startTime];
    uint64_t v14 = v13;
    [(CAMAdditiveAnimation *)self _lastTime];
    uint64_t v16 = v15;
    v17 = [(CAMAdditiveAnimation *)self _fromAnimation];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; value = %.2f; toValue = %.2f; duration = %.2f; startTime = %.2f; lastTime = %.2f> base animation:\n%@",
      v6,
      self,
      v8,
      v10,
      v12,
      v14,
      v16,
    double v18 = v17);
  }
  else
  {
    [(CAMAdditiveAnimation *)self _fromValue];
    uint64_t v20 = v19;
    [(CAMAdditiveAnimation *)self _toValue];
    uint64_t v22 = v21;
    [(CAMAdditiveAnimation *)self _duration];
    uint64_t v24 = v23;
    [(CAMAdditiveAnimation *)self _startTime];
    uint64_t v26 = v25;
    [(CAMAdditiveAnimation *)self _lastTime];
    objc_msgSend(v4, "stringWithFormat:", @"<%@: %p; value = %.2f; fromValue = %.2f; toValue = %.2f; duration = %.2f; startTime = %.2f; lastTime = %.2f>",
      v6,
      self,
      v8,
      v20,
      v22,
      v24,
      v26,
    double v18 = v27);
  }

  return v18;
}

- (double)_toValue
{
  return self->__toValue;
}

- (double)_fromValue
{
  return self->__fromValue;
}

- (void)set_fromValue:(double)a3
{
  self->__fromValue = a3;
}

- (double)_duration
{
  return self->__duration;
}

- (CAMediaTimingFunction)_curve
{
  return self->__curve;
}

- (CAMAdditiveAnimation)_fromAnimation
{
  return self->__fromAnimation;
}

- (void)set_fromAnimation:(id)a3
{
}

- (double)_startTime
{
  return self->__startTime;
}

- (void)_setStartTime:(double)a3
{
  self->__startTime = a3;
}

- (double)_lastTime
{
  return self->__lastTime;
}

- (void)_setLastTime:(double)a3
{
  self->__lastTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__fromAnimation, 0);
  objc_storeStrong((id *)&self->__curve, 0);
}

@end