@interface HKPropertyAnimation
- (BOOL)_isCompleted;
- (CAMediaTimingFunction)timingFunction;
- (HKPropertyAnimation)init;
- (NSDate)appliedDate;
- (NSString)property;
- (double)duration;
- (id)completion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fromValue;
- (id)propertyApplicationFunction;
- (id)toValue;
- (int64_t)secondaryAnimationCurve;
- (void)_applyWithCurrentDate:(id)a3;
- (void)_finishCancelled:(BOOL)a3;
- (void)_validate;
- (void)setAppliedDate:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFromValue:(id)a3;
- (void)setProperty:(id)a3;
- (void)setPropertyApplicationFunction:(id)a3;
- (void)setSecondaryAnimationCurve:(int64_t)a3;
- (void)setTimingFunction:(id)a3;
- (void)setToValue:(id)a3;
@end

@implementation HKPropertyAnimation

- (HKPropertyAnimation)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKPropertyAnimation;
  v2 = [(HKPropertyAnimation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    timingFunction = v2->_timingFunction;
    v2->_timingFunction = (CAMediaTimingFunction *)v3;

    v2->_secondaryAnimationCurve = 0;
  }
  return v2;
}

- (void)_applyWithCurrentDate:(id)a3
{
  [a3 timeIntervalSinceDate:self->_appliedDate];
  double v5 = v4 / self->_duration;
  *(float *)&double v5 = v5;
  if (*(float *)&v5 > 1.0) {
    *(float *)&double v5 = 1.0;
  }
  [(CAMediaTimingFunction *)self->_timingFunction _solveForInput:v5];
  double v7 = v6;
  int64_t secondaryAnimationCurve = self->_secondaryAnimationCurve;
  double v9 = 1.0 - (v7 + -1.0) * (v7 + -1.0);
  if (secondaryAnimationCurve == 1) {
    double v7 = v7 * v7;
  }
  if (secondaryAnimationCurve == 2) {
    double v7 = v9;
  }
  objc_msgSend(self->_fromValue, "hk_midPointToValue:percentage:", self->_toValue, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void))self->_propertyApplicationFunction + 2))();
}

- (BOOL)_isCompleted
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_appliedDate];
  LOBYTE(self) = v4 >= self->_duration;

  return (char)self;
}

- (void)_validate
{
  if (self->_duration < 0.0)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"HKPropertyAnimation.m" lineNumber:75 description:@"Property animations must have a duration >= 0"];
  }
  if (!self->_fromValue)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"HKPropertyAnimation.m" lineNumber:76 description:@"Property animations cannot have a nil fromValue"];
  }
  if (!self->_toValue)
  {
    float v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"HKPropertyAnimation.m" lineNumber:77 description:@"Property animations cannot have a nil toValue"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"HKPropertyAnimation.m" lineNumber:78 description:@"Property animations must have a fromValue that is the same class as toValue"];
  }
  if (!self->_property)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"HKPropertyAnimation.m" lineNumber:79 description:@"Property animations cannot have a nil property"];
  }
  if (!self->_propertyApplicationFunction)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"HKPropertyAnimation.m" lineNumber:80 description:@"Property animations cannot have a nil property animation function"];
  }
}

- (void)_finishCancelled:(BOOL)a3
{
  completion = (void (**)(id, BOOL))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    id v5 = self->_completion;
  }
  else
  {
    id v5 = 0;
  }
  self->_completion = 0;

  id propertyApplicationFunction = self->_propertyApplicationFunction;
  self->_id propertyApplicationFunction = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_property);
  *(double *)(v4 + 32) = self->_duration;
  objc_storeStrong((id *)(v4 + 16), self->_fromValue);
  objc_storeStrong((id *)(v4 + 24), self->_toValue);
  objc_storeStrong((id *)(v4 + 72), self->_appliedDate);
  objc_storeStrong((id *)(v4 + 40), self->_timingFunction);
  id v5 = _Block_copy(self->_completion);
  float v6 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v5;

  double v7 = _Block_copy(self->_propertyApplicationFunction);
  v8 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v7;

  *(void *)(v4 + 48) = self->_secondaryAnimationCurve;
  return (id)v4;
}

- (NSString)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
}

- (id)fromValue
{
  return self->_fromValue;
}

- (void)setFromValue:(id)a3
{
}

- (id)toValue
{
  return self->_toValue;
}

- (void)setToValue:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (int64_t)secondaryAnimationCurve
{
  return self->_secondaryAnimationCurve;
}

- (void)setSecondaryAnimationCurve:(int64_t)a3
{
  self->_int64_t secondaryAnimationCurve = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)propertyApplicationFunction
{
  return self->_propertyApplicationFunction;
}

- (void)setPropertyApplicationFunction:(id)a3
{
}

- (NSDate)appliedDate
{
  return self->_appliedDate;
}

- (void)setAppliedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedDate, 0);
  objc_storeStrong(&self->_propertyApplicationFunction, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong(&self->_toValue, 0);
  objc_storeStrong(&self->_fromValue, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end