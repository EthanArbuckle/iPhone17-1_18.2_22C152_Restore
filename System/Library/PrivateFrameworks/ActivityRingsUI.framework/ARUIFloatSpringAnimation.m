@interface ARUIFloatSpringAnimation
+ (id)animationWithTension:(double)a3 friction:(double)a4 startValue:(float)a5 endValue:(float)a6 applier:(id)a7;
- (ARUIFloatSpringAnimation)initWithTension:(double)a3 friction:(double)a4 startValue:(float)a5 endValue:(float)a6 applier:(id)a7;
- (ARUIRingGroupAnimationDelegate)delegate;
- (BOOL)isAnimating;
- (float)currentValue;
- (float)endValue;
- (void)completeAnimation;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)update:(double)a3;
@end

@implementation ARUIFloatSpringAnimation

+ (id)animationWithTension:(double)a3 friction:(double)a4 startValue:(float)a5 endValue:(float)a6 applier:(id)a7
{
  id v11 = a7;
  v12 = [ARUIFloatSpringAnimation alloc];
  *(float *)&double v13 = a5;
  *(float *)&double v14 = a6;
  v15 = [(ARUIFloatSpringAnimation *)v12 initWithTension:v11 friction:a3 startValue:a4 endValue:v13 applier:v14];

  return v15;
}

- (ARUIFloatSpringAnimation)initWithTension:(double)a3 friction:(double)a4 startValue:(float)a5 endValue:(float)a6 applier:(id)a7
{
  id v12 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ARUIFloatSpringAnimation;
  double v13 = [(ARUIFloatSpringAnimation *)&v20 init];
  double v14 = v13;
  if (v13)
  {
    v13->_completed = 0;
    uint64_t v15 = MEMORY[0x223C21650](v12);
    id applier = v14->_applier;
    v14->_id applier = (id)v15;

    v17 = [[_TtC15ActivityRingsUI15SpringAnimation alloc] initWithInitialValue:a5 delay:0.0];
    springAnimation = v14->_springAnimation;
    v14->_springAnimation = v17;

    [(SpringAnimation *)v14->_springAnimation configureWithTension:a3 friction:a4 target:a6];
  }

  return v14;
}

- (void)dealloc
{
  if (!self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should call -[ARUIFloatSpringAnimation completeAnimation] before deallocating"];
  }
  v3.receiver = self;
  v3.super_class = (Class)ARUIFloatSpringAnimation;
  [(ARUIFloatSpringAnimation *)&v3 dealloc];
}

- (void)update:(double)a3
{
  if (self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should not call update on a ARUIFloatSpringAnimation that has already completed"];
  }
  if ([(SpringAnimation *)self->_springAnimation advanceWithDeltaTime:a3])
  {
    id applier = self->_applier;
    [(ARUIFloatSpringAnimation *)self currentValue];
    v6 = (void (*)(void *))applier[2];
    v6(applier);
  }
}

- (float)currentValue
{
  [(SpringAnimation *)self->_springAnimation value];
  return v2;
}

- (float)endValue
{
  [(SpringAnimation *)self->_springAnimation target];
  return v2;
}

- (BOOL)isAnimating
{
  [(SpringAnimation *)self->_springAnimation value];
  float v4 = v3;
  [(SpringAnimation *)self->_springAnimation target];
  float v6 = v5;
  return !ARUIFloatEqual(v4, v6);
}

- (void)completeAnimation
{
  if (self->_completed) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Should not call completeAnimation on a ARUIFloatSpringAnimation that has already completed"];
  }
  [(SpringAnimation *)self->_springAnimation completeWithSnap];
  id applier = (void (**)(id))self->_applier;
  [(ARUIFloatSpringAnimation *)self endValue];
  applier[2](applier);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_springAnimation, 0);

  objc_storeStrong(&self->_applier, 0);
}

@end