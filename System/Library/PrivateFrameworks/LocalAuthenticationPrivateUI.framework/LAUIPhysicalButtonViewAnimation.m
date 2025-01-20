@interface LAUIPhysicalButtonViewAnimation
- (BOOL)isRunning;
- (LAUIPhysicalButtonViewAnimation)initWith:(id)a3 layer:(id)a4;
- (double)duration;
- (void)addAdditiveAnimation:(id)a3 to:(id)a4 keyPath:(id)a5;
- (void)begin;
- (void)end;
- (void)endImmediately;
@end

@implementation LAUIPhysicalButtonViewAnimation

- (LAUIPhysicalButtonViewAnimation)initWith:(id)a3 layer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LAUIPhysicalButtonViewAnimation;
  v8 = [(LAUIPhysicalButtonViewAnimation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_physicalButtonView, v6);
    objc_storeWeak((id *)&v9->_layer, v7);
  }

  return v9;
}

- (BOOL)isRunning
{
  return self->_animationKey != 0;
}

- (void)begin
{
}

- (void)endImmediately
{
  if ([(LAUIPhysicalButtonViewAnimation *)self isRunning])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layer);
    [WeakRetained removeAnimationForKey:self->_animationKey];

    animationKey = self->_animationKey;
    self->_animationKey = 0;
  }
}

- (void)end
{
  if ([(LAUIPhysicalButtonViewAnimation *)self isRunning])
  {
    v3 = self->_animationKey;
    animationKey = self->_animationKey;
    self->_animationKey = 0;

    id WeakRetained = (CALayer *)objc_loadWeakRetained((id *)&self->_layer);
    long double v6 = LAUILayerAnimationElapsedDuration(WeakRetained, v3);

    if (v6 <= 0.0)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_layer);
      [v12 removeAnimationForKey:v3];
    }
    else
    {
      [(LAUIPhysicalButtonViewAnimation *)self duration];
      double v8 = v7;
      [(LAUIPhysicalButtonViewAnimation *)self duration];
      long double v10 = fmod(v6, v9);
      dispatch_time_t v11 = dispatch_time(0, (uint64_t)((v8 - v10) * 1000000000.0));
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __38__LAUIPhysicalButtonViewAnimation_end__block_invoke;
      v13[3] = &unk_26420CAE0;
      v13[4] = self;
      v14 = v3;
      dispatch_after(v11, MEMORY[0x263EF83A0], v13);
    }
  }
}

void __38__LAUIPhysicalButtonViewAnimation_end__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained removeAnimationForKey:*(void *)(a1 + 40)];
}

- (double)duration
{
  return 0.0;
}

- (void)addAdditiveAnimation:(id)a3 to:(id)a4 keyPath:(id)a5
{
  id v12 = (CAAnimation *)a3;
  double v8 = (CALayer *)a4;
  long double v9 = (NSString *)a5;
  LAUILayerAddAdditiveAnimation(v8, v9, v12);
  long double v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  animationKey = self->_animationKey;
  self->_animationKey = v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationKey, 0);
  objc_destroyWeak((id *)&self->_layer);
  objc_destroyWeak((id *)&self->_physicalButtonView);
}

@end