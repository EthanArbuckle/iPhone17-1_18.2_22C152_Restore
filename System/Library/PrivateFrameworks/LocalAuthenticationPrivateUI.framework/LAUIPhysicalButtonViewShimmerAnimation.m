@interface LAUIPhysicalButtonViewShimmerAnimation
- (double)duration;
- (void)_beginReducedMotionAnimationWithDelay:(double)a3;
- (void)_beginRegularMotionAnimationWithDelay:(double)a3;
- (void)_endShimmerAnimation;
- (void)beginWithDelay:(double)a3;
- (void)endImmediately;
@end

@implementation LAUIPhysicalButtonViewShimmerAnimation

- (double)duration
{
  BOOL v2 = [(LAUIPhysicalButtonViewShimmerAnimation *)self _isReducedMotionEnabled];
  double result = 2.5;
  if (v2) {
    return 3.5;
  }
  return result;
}

- (void)beginWithDelay:(double)a3
{
  if (![(LAUIPhysicalButtonViewAnimation *)self isRunning])
  {
    if ([(LAUIPhysicalButtonViewShimmerAnimation *)self _isReducedMotionEnabled])
    {
      [(LAUIPhysicalButtonViewShimmerAnimation *)self _beginReducedMotionAnimationWithDelay:a3];
    }
    else
    {
      [(LAUIPhysicalButtonViewShimmerAnimation *)self _beginRegularMotionAnimationWithDelay:a3];
    }
  }
}

- (void)endImmediately
{
  if (![(LAUIPhysicalButtonViewShimmerAnimation *)self _isReducedMotionEnabled]) {
    [(LAUIPhysicalButtonViewShimmerAnimation *)self _endShimmerAnimation];
  }
  v3.receiver = self;
  v3.super_class = (Class)LAUIPhysicalButtonViewShimmerAnimation;
  [(LAUIPhysicalButtonViewAnimation *)&v3 endImmediately];
}

- (void)_beginReducedMotionAnimationWithDelay:(double)a3
{
  p_layer = &self->super._layer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._layer);
  LODWORD(v7) = *(_DWORD *)"ff&?";
  [WeakRetained setOpacity:v7];

  id v10 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
  [v10 setValues:&unk_26C534668];
  [v10 setBeginTime:a3];
  [v10 setBeginTimeMode:*MEMORY[0x263F15980]];
  [v10 setKeyTimes:&unk_26C534680];
  [(LAUIPhysicalButtonViewShimmerAnimation *)self duration];
  objc_msgSend(v10, "setDuration:");
  LODWORD(v8) = 2139095040;
  [v10 setRepeatCount:v8];
  id v9 = objc_loadWeakRetained((id *)p_layer);
  [(LAUIPhysicalButtonViewAnimation *)self addAdditiveAnimation:v10 to:v9 keyPath:0];
}

- (void)_beginRegularMotionAnimationWithDelay:(double)a3
{
  [(LAUIPhysicalButtonViewShimmerAnimation *)self _endShimmerAnimation];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke;
  v10[3] = &unk_26420C998;
  v10[4] = self;
  __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke((uint64_t)v10);
  v5 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
  shimmerGradient = self->_shimmerGradient;
  self->_shimmerGradient = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._layer);
  [WeakRetained setMask:self->_shimmerGradient];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke_26;
  v9[3] = &unk_26420C9C0;
  *(double *)&v9[5] = a3;
  v9[4] = self;
  double v8 = __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke_26((uint64_t)v9);
  [(LAUIPhysicalButtonViewAnimation *)self addAdditiveAnimation:v8 to:self->_shimmerGradient keyPath:0];
}

id __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke(uint64_t a1)
{
  v17[3] = *MEMORY[0x263EF8340];
  BOOL v2 = [MEMORY[0x263F157D0] layer];
  objc_super v3 = [MEMORY[0x263F1C550] whiteColor];
  id v4 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.65];
  v17[0] = [v4 CGColor];
  id v5 = v3;
  v17[1] = objc_msgSend(v5, "CGColor", v17[0]);
  id v6 = v4;
  v17[2] = [v6 CGColor];
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
  [v2 setColors:v7];

  objc_msgSend(v2, "setStartPoint:", 0.0, 0.5);
  objc_msgSend(v2, "setEndPoint:", 1.0, 0.5);
  [v2 setLocations:&unk_26C534698];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained bounds];
  double v10 = v9 * -2.0;
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v11 bounds];
  double v13 = v12 * 5.0;
  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v14 bounds];
  objc_msgSend(v2, "setFrame:", v10, 0.0, v13, v15 + v15);

  return v2;
}

id __80__LAUIPhysicalButtonViewShimmerAnimation__beginRegularMotionAnimationWithDelay___block_invoke_26(uint64_t a1)
{
  BOOL v2 = [MEMORY[0x263F157D8] animationWithKeyPath:@"locations"];
  [v2 setValues:&unk_26C5346F8];
  [v2 setBeginTime:*(double *)(a1 + 40)];
  [v2 setBeginTimeMode:*MEMORY[0x263F15980]];
  [v2 setKeyTimes:&unk_26C534710];
  [*(id *)(a1 + 32) duration];
  objc_msgSend(v2, "setDuration:");
  LODWORD(v3) = 2139095040;
  [v2 setRepeatCount:v3];
  return v2;
}

- (void)_endShimmerAnimation
{
  shimmerGradient = self->_shimmerGradient;
  if (shimmerGradient)
  {
    [(CAGradientLayer *)shimmerGradient removeFromSuperlayer];
    id v4 = self->_shimmerGradient;
    self->_shimmerGradient = 0;
  }
}

- (void).cxx_destruct
{
}

@end