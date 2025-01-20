@interface ARUIFloatAnimation
+ (id)animationWithDuration:(double)a3 startValue:(float)a4 endValue:(float)a5 timingFunction:(id)a6 applier:(id)a7;
- (ARUIFloatAnimation)initWithDuration:(double)a3 startValue:(float)a4 endValue:(float)a5 timingFunction:(id)a6 applier:(id)a7;
- (ARUIRingGroupAnimationDelegate)delegate;
- (BOOL)isAnimating;
- (CAMediaTimingFunction)timingFunction;
- (double)duration;
- (float)currentValue;
- (float)endValue;
- (float)startValue;
- (void)completeAnimation;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)update:(double)a3;
@end

@implementation ARUIFloatAnimation

- (void)update:(double)a3
{
  if (self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should not call update on a ARUIFloatAnimation that has already completed"];
  }
  float v5 = self->_percent + a3 / self->_duration;
  self->_percent = ARUISaturate(v5);
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:");
  self->_currentValue = ARUIMix(self->_startValue, self->_endValue, v6);
  v7 = (void (*)(void))*((void *)self->_applier + 2);

  v7();
}

- (BOOL)isAnimating
{
  return !ARUIFloatEqual(self->_currentValue, self->_endValue);
}

- (void)setDelegate:(id)a3
{
}

+ (id)animationWithDuration:(double)a3 startValue:(float)a4 endValue:(float)a5 timingFunction:(id)a6 applier:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  v13 = [ARUIFloatAnimation alloc];
  *(float *)&double v14 = a4;
  *(float *)&double v15 = a5;
  v16 = [(ARUIFloatAnimation *)v13 initWithDuration:v12 startValue:v11 endValue:a3 timingFunction:v14 applier:v15];

  return v16;
}

- (ARUIFloatAnimation)initWithDuration:(double)a3 startValue:(float)a4 endValue:(float)a5 timingFunction:(id)a6 applier:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ARUIFloatAnimation;
  double v15 = [(ARUIFloatAnimation *)&v20 init];
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

- (void)completeAnimation
{
  if (self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should not call completeAnimation on a ARUIFloatAnimation that has already completed"];
  }
  (*((void (**)(float, double))self->_applier + 2))(self->_endValue, 0.0);
  self->_completed = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained animationDidComplete:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_applier, 0);
}

- (void)dealloc
{
  if (!self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should call -[ARUIFloatAnimation completeAnimation] before deallocating"];
  }
  v3.receiver = self;
  v3.super_class = (Class)ARUIFloatAnimation;
  [(ARUIFloatAnimation *)&v3 dealloc];
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

- (float)startValue
{
  return self->_startValue;
}

- (float)currentValue
{
  return self->_currentValue;
}

- (float)endValue
{
  return self->_endValue;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

@end