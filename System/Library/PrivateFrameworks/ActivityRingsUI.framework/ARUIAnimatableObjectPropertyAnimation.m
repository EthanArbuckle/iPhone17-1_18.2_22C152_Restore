@interface ARUIAnimatableObjectPropertyAnimation
+ (id)animationWithDuration:(double)a3 timingFunction:(id)a4 completion:(id)a5;
+ (id)linearTimingFunction;
+ (id)timingFunctionForMediaTimingFunction:(id)a3;
- (BOOL)isFinishedAnimating;
- (double)duration;
- (id)_currentValue;
- (id)_endValue;
- (id)_startValue;
- (id)completionHandler;
- (id)valueByAddingCurrentValueToValue:(id)a3;
- (void)_setCurrentValue:(id)a3;
- (void)_setEndValue:(id)a3;
- (void)_setStartValue:(id)a3;
- (void)_updateWithProgress:(float)a3;
- (void)callAndReleaseCompletionHandler;
- (void)update:(double)a3;
@end

@implementation ARUIAnimatableObjectPropertyAnimation

+ (id)timingFunctionForMediaTimingFunction:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__ARUIAnimatableObjectPropertyAnimation_timingFunctionForMediaTimingFunction___block_invoke;
  v7[3] = &unk_264498EB8;
  id v8 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x223C21650](v7);

  return v5;
}

double __78__ARUIAnimatableObjectPropertyAnimation_timingFunctionForMediaTimingFunction___block_invoke(uint64_t a1, double a2)
{
  *(float *)&a2 = a2;
  [*(id *)(a1 + 32) _solveForInput:a2];
  return v2;
}

+ (id)linearTimingFunction
{
  return &__block_literal_global_1;
}

+ (id)animationWithDuration:(double)a3 timingFunction:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = objc_alloc_init((Class)a1);
  v11 = v10;
  if (v10)
  {
    *((double *)v10 + 3) = a3;
    uint64_t v12 = MEMORY[0x223C21650](v8);
    v13 = (void *)v11[1];
    v11[1] = v12;

    uint64_t v14 = MEMORY[0x223C21650](v9);
    v15 = (void *)v11[4];
    v11[4] = v14;
  }

  return v11;
}

- (void)update:(double)a3
{
  double currentAnimationTime = self->_currentAnimationTime;
  double duration = self->_duration;
  if (currentAnimationTime < duration)
  {
    double v6 = currentAnimationTime + a3;
    if (v6 >= duration) {
      double v6 = self->_duration;
    }
    self->_double currentAnimationTime = v6;
    double v7 = (*((double (**)(double))self->_animationTimingFunction + 2))(v6 / duration);
    *(float *)&double v7 = v7;
    [(ARUIAnimatableObjectPropertyAnimation *)self _updateWithProgress:v7];
  }
}

- (BOOL)isFinishedAnimating
{
  if (self->_currentAnimationTime >= self->_duration) {
    return 1;
  }
  id v3 = [(ARUIAnimatableObjectPropertyAnimation *)self _currentValue];
  id v4 = [(ARUIAnimatableObjectPropertyAnimation *)self _endValue];
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (void)callAndReleaseCompletionHandler
{
  id completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    char v5 = (void (**)(void))MEMORY[0x223C21650](completionHandler, a2);
    id v4 = self->_completionHandler;
    self->_id completionHandler = 0;

    v5[2]();
  }
}

- (double)duration
{
  return self->_duration;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong(&self->_animationTimingFunction, 0);
}

- (id)_startValue
{
  return 0;
}

- (id)_endValue
{
  return 0;
}

- (id)_currentValue
{
  return 0;
}

- (void)_setStartValue:(id)a3
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();

  NSRequestConcreteImplementation();
}

- (void)_setEndValue:(id)a3
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();

  NSRequestConcreteImplementation();
}

- (void)_setCurrentValue:(id)a3
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();

  NSRequestConcreteImplementation();
}

- (void)_updateWithProgress:(float)a3
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0();

  NSRequestConcreteImplementation();
}

- (id)valueByAddingCurrentValueToValue:(id)a3
{
  return 0;
}

@end