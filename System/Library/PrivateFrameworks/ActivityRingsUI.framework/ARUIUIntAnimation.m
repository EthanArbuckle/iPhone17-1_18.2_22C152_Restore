@interface ARUIUIntAnimation
+ (id)animationWithDuration:(double)a3 startValue:(unint64_t)a4 endValue:(unint64_t)a5 timingFunction:(id)a6 applier:(id)a7;
- (ARUIRingGroupAnimationDelegate)delegate;
- (ARUIUIntAnimation)initWithDuration:(double)a3 startValue:(unint64_t)a4 endValue:(unint64_t)a5 timingFunction:(id)a6 applier:(id)a7;
- (BOOL)isAnimating;
- (CAMediaTimingFunction)timingFunction;
- (double)duration;
- (unint64_t)currentValue;
- (unint64_t)endValue;
- (unint64_t)startValue;
- (void)completeAnimation;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)update:(double)a3;
@end

@implementation ARUIUIntAnimation

- (void)update:(double)a3
{
  if (self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should not call update on a ARUIUIntAnimation that has already completed"];
  }
  float v5 = self->_percent + a3 / self->_duration;
  self->_percent = ARUISaturate(v5);
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:");
  self->_currentValue = (unint64_t)ARUIMix((float)self->_startValue, (float)self->_endValue, v6);
  v7 = (void (*)(__n128))*((void *)self->_applier + 2);
  v8.n128_f64[0] = a3;

  v7(v8);
}

- (BOOL)isAnimating
{
  return self->_currentValue != self->_endValue;
}

- (void)setDelegate:(id)a3
{
}

+ (id)animationWithDuration:(double)a3 startValue:(unint64_t)a4 endValue:(unint64_t)a5 timingFunction:(id)a6 applier:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  v13 = [[ARUIUIntAnimation alloc] initWithDuration:a4 startValue:a5 endValue:v12 timingFunction:v11 applier:a3];

  return v13;
}

- (ARUIUIntAnimation)initWithDuration:(double)a3 startValue:(unint64_t)a4 endValue:(unint64_t)a5 timingFunction:(id)a6 applier:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ARUIUIntAnimation;
  v15 = [(ARUIUIntAnimation *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_completed = 0;
    v15->_duration = a3;
    v15->_percent = 0.0;
    v15->_currentValue = a4;
    v15->_endValue = a5;
    v15->_startValue = a4;
    objc_storeStrong((id *)&v15->_timingFunction, a6);
    uint64_t v17 = MEMORY[0x223C21650](v14);
    id applier = v16->_applier;
    v16->_id applier = (id)v17;
  }
  return v16;
}

- (void)dealloc
{
  if (!self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should call -[ARUIUIntAnimation completeAnimation] before deallocating"];
  }
  v3.receiver = self;
  v3.super_class = (Class)ARUIUIntAnimation;
  [(ARUIUIntAnimation *)&v3 dealloc];
}

- (void)completeAnimation
{
  if (self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should not call completeAnimation on a ARUIUIntAnimation that has already completed"];
  }
  (*((void (**)(double))self->_applier + 2))(0.0);
  self->_completed = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained animationDidComplete:self];
}

- (ARUIRingGroupAnimationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ARUIRingGroupAnimationDelegate *)WeakRetained;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)startValue
{
  return self->_startValue;
}

- (unint64_t)currentValue
{
  return self->_currentValue;
}

- (unint64_t)endValue
{
  return self->_endValue;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_applier, 0);
}

@end