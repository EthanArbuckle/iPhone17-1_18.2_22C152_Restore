@interface CSLUIPointAnimator
+ (id)animateFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 withApplier:(id)a5 completion:(id)a6;
- (BOOL)animating;
- (void)_cleanupAfterAnimation;
- (void)_displayLinkFired:(id)a3;
@end

@implementation CSLUIPointAnimator

+ (id)animateFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 withApplier:(id)a5 completion:(id)a6
{
  CGFloat x = a4.x;
  CGFloat y = a4.y;
  CGFloat v22 = a3.x;
  CGFloat v23 = a3.y;
  id v7 = a5;
  id v8 = a6;
  uint64_t v9 = objc_opt_new();
  v10.f64[0] = v22;
  v10.f64[1] = v23;
  v11.f64[0] = x;
  v11.f64[1] = y;
  *(float32x2_t *)(v9 + 8) = vcvt_f32_f64(v10);
  *(float32x2_t *)(v9 + 16) = vcvt_f32_f64(v11);
  *(CFTimeInterval *)(v9 + 24) = CACurrentMediaTime();
  v12 = +[CASpringAnimation animation];
  [v12 setStiffness:500.0];
  [v12 setDamping:500.0];
  [v12 setMass:3.0];
  objc_storeStrong((id *)(v9 + 40), v12);
  [v12 durationForEpsilon:0.005];
  uint64_t v14 = v13;
  objc_msgSend(v12, "setDuration:");
  *(void *)(v9 + 48) = v14;
  id v15 = [v7 copy];
  v16 = *(void **)(v9 + 56);
  *(void *)(v9 + 56) = v15;

  id v17 = [v8 copy];
  v18 = *(void **)(v9 + 64);
  *(void *)(v9 + 64) = v17;

  v19 = +[CADisplayLink displayLinkWithTarget:v9 selector:"_displayLinkFired:"];
  objc_storeStrong((id *)(v9 + 32), v19);
  v20 = +[NSRunLoop currentRunLoop];
  [v19 addToRunLoop:v20 forMode:NSRunLoopCommonModes];

  return (id)v9;
}

- (void)_displayLinkFired:(id)a3
{
  id v13 = a3;
  if (self->_applier)
  {
    double v4 = CACurrentMediaTime() - self->_startTime;
    double springDuration = self->_springDuration;
    if (v4 <= springDuration)
    {
      double v7 = v4 / springDuration;
      [(CASpringAnimation *)self->_spring _timeFunction:v4 / springDuration];
      double v9 = v8;
      double v10 = 1.0;
      if (v9 < 1.0) {
        [(CASpringAnimation *)self->_spring _timeFunction:v7];
      }
      float v11 = v10;
      __n128 v12 = (__n128)vcvtq_f64_f32(vmla_n_f32(*(float32x2_t *)self->_beginPoint, vsub_f32(*(float32x2_t *)self->_endPoint, *(float32x2_t *)self->_beginPoint), v11));
      (*((void (**)(__n128, double))self->_applier + 2))(v12, v12.n128_f64[1]);
    }
    else
    {
      __n128 v6 = (__n128)vcvtq_f64_f32(*(float32x2_t *)self->_endPoint);
      (*((void (**)(__n128, double))self->_applier + 2))(v6, v6.n128_f64[1]);
      [(CSLUIPointAnimator *)self _cleanupAfterAnimation];
    }
  }
}

- (void)_cleanupAfterAnimation
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  double v7 = self;
  completion = (void (**)(void))v7->_completion;
  if (completion) {
    completion[2]();
  }
  id applier = v7->_applier;
  v7->_id applier = 0;

  id v6 = v7->_completion;
  v7->_completion = 0;
}

- (BOOL)animating
{
  return self->_displayLink != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_applier, 0);
  objc_storeStrong((id *)&self->_spring, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end