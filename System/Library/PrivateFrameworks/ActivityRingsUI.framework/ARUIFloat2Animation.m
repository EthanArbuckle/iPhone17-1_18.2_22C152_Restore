@interface ARUIFloat2Animation
+ (id)animationWithDuration:(id)a1 startValue:(SEL)a2 endValue:(double)a3 timingFunction:(id)a4 applier:(id)a5;
- (ARUIFloat2Animation)initWithDuration:(ARUIFloat2Animation *)self startValue:(SEL)a2 endValue:(double)a3 timingFunction:(id)a4 applier:(id)a5;
- (ARUIRingGroupAnimationDelegate)delegate;
- (BOOL)isAnimating;
- (CAMediaTimingFunction)timingFunction;
- (double)currentValue;
- (double)duration;
- (double)endValue;
- (double)startValue;
- (void)completeAnimation;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)update:(double)a3;
@end

@implementation ARUIFloat2Animation

+ (id)animationWithDuration:(id)a1 startValue:(SEL)a2 endValue:(double)a3 timingFunction:(id)a4 applier:(id)a5
{
  double v8 = v6;
  double v9 = v5;
  id v11 = a5;
  id v12 = a4;
  v13 = [[ARUIFloat2Animation alloc] initWithDuration:v12 startValue:v11 endValue:a3 timingFunction:v9 applier:v8];

  return v13;
}

- (ARUIFloat2Animation)initWithDuration:(ARUIFloat2Animation *)self startValue:(SEL)a2 endValue:(double)a3 timingFunction:(id)a4 applier:(id)a5
{
  uint64_t v9 = v6;
  uint64_t v10 = v5;
  id v13 = a4;
  id v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ARUIFloat2Animation;
  v15 = [(ARUIFloat2Animation *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_completed = 0;
    v15->_percent = 0.0;
    v15->_duration = a3;
    *(void *)v15->_startValue = v10;
    *(void *)v15->_currentValue = v10;
    *(void *)v15->_endValue = v9;
    objc_storeStrong((id *)&v15->_timingFunction, a4);
    uint64_t v17 = MEMORY[0x223C21650](v14);
    id applier = v16->_applier;
    v16->_id applier = (id)v17;
  }
  return v16;
}

- (void)dealloc
{
  if (!self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should call -[ARUIFloat2Animation completeAnimation] before deallocating"];
  }
  v3.receiver = self;
  v3.super_class = (Class)ARUIFloat2Animation;
  [(ARUIFloat2Animation *)&v3 dealloc];
}

- (void)update:(double)a3
{
  if (self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should not call update on a ARUIFloat2Animation that has already completed"];
  }
  float v5 = self->_percent + a3 / self->_duration;
  self->_percent = ARUISaturate(v5);
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:");
  float v7 = v6;
  *(float *)&unint64_t v8 = ARUIMix(COERCE_FLOAT(*(void *)self->_startValue), COERCE_FLOAT(*(void *)self->_endValue), v6);
  v13.n128_u64[0] = v8;
  float v9 = ARUIMix(*(float *)&self->_startValue[4], *(float *)&self->_endValue[4], v7);
  __n128 v12 = v13;
  v12.n128_f32[1] = v9;
  *(void *)self->_currentValue = v12.n128_u64[0];
  __n128 v10 = v12;
  id v11 = (void (*)(__n128, __n128))*((void *)self->_applier + 2);
  v12.n128_f64[0] = a3;

  v11(v10, v12);
}

- (BOOL)isAnimating
{
  return !ARUIFloat2Equal(*(float32x2_t *)self->_currentValue, *(float32x2_t *)self->_endValue);
}

- (void)completeAnimation
{
  if (self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should not call completeAnimation on a ARUIFloat2Animation that has already completed"];
  }
  (*((void (**)(double, double))self->_applier + 2))(*(double *)self->_endValue, 0.0);
  self->_completed = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained animationDidComplete:self];
}

- (ARUIRingGroupAnimationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ARUIRingGroupAnimationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (double)startValue
{
  return *(double *)(a1 + 48);
}

- (double)currentValue
{
  return *(double *)(a1 + 56);
}

- (double)endValue
{
  return *(double *)(a1 + 64);
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