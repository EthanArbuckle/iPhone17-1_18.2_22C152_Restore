@interface QLSlideTransitionDriver
- (void)_animateTransition;
- (void)_animateTransitionUserSlideDismissal;
- (void)animateTransition;
@end

@implementation QLSlideTransitionDriver

- (void)animateTransition
{
  v3 = [(QLTransitionDriver *)self gestureTracker];
  v4 = v3;
  if (!v3
    || ([v3 trackedTransform], CGAffineTransformIsIdentity(&v5))
    || [(QLTransitionDriver *)self presenting])
  {
    [(QLSlideTransitionDriver *)self _animateTransition];
  }
  else
  {
    [(QLSlideTransitionDriver *)self _animateTransitionUserSlideDismissal];
  }
}

- (void)_animateTransition
{
  memset(&v20, 0, sizeof(v20));
  if ([(QLTransitionDriver *)self presenting])
  {
    long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v20.c = v3;
    *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  else
  {
    v4 = [(QLTransitionDriver *)self destinationView];
    CGAffineTransform v5 = v4;
    if (v4) {
      [v4 transform];
    }
    else {
      memset(&v20, 0, sizeof(v20));
    }
  }
  CGAffineTransform v19 = v20;
  if ([(QLTransitionDriver *)self presenting])
  {
    v6 = [(QLTransitionDriver *)self transitionContainer];
    [v6 frame];
    CGFloat Height = CGRectGetHeight(v21);
    CGAffineTransform v17 = v20;
    CGAffineTransformTranslate(&v18, &v17, 0.0, Height);
    CGAffineTransform v20 = v18;
  }
  else
  {
    v6 = [(QLTransitionDriver *)self transitionContainer];
    [v6 frame];
    double v8 = CGRectGetHeight(v22);
    v9 = [(QLTransitionDriver *)self destinationView];
    [v9 frame];
    CGAffineTransform v18 = v19;
    CGAffineTransformTranslate(&v19, &v18, 0.0, v8 - v10);
  }
  CGAffineTransform v16 = v20;
  v11 = [(QLTransitionDriver *)self destinationView];
  CGAffineTransform v15 = v16;
  [v11 setTransform:&v15];

  [(QLTransitionDriver *)self presenting];
  v12 = (void *)MEMORY[0x263F82E00];
  [(QLTransitionDriver *)self duration];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  CGAffineTransform v14 = v19;
  v13[2] = __45__QLSlideTransitionDriver__animateTransition__block_invoke;
  v13[3] = &unk_2642F7328;
  v13[4] = self;
  objc_msgSend(v12, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v13, 0);
}

uint64_t __45__QLSlideTransitionDriver__animateTransition__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F82E00];
  CAFrameRateRange v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__QLSlideTransitionDriver__animateTransition__block_invoke_2;
  v5[3] = &unk_2642F7328;
  v5[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2097155, v5, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
}

void __45__QLSlideTransitionDriver__animateTransition__block_invoke_2(uint64_t a1)
{
  v1 = objc_msgSend(*(id *)(a1 + 32), "destinationView", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v1 setTransform:&v2];
}

- (void)_animateTransitionUserSlideDismissal
{
  long long v3 = [(QLTransitionDriver *)self gestureTracker];
  [v3 trackedVelocity];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = [MEMORY[0x263F82B60] mainScreen];
  [v10 bounds];
  double v12 = v11;
  double v13 = v11 * 1.5;

  CGAffineTransform v14 = [MEMORY[0x263F82B60] mainScreen];
  [v14 bounds];
  double v16 = v15;
  double v17 = v15 * 1.5;

  if (v5 >= v13) {
    double v18 = v13;
  }
  else {
    double v18 = v5;
  }
  if (v18 >= -(v12 * 1.5)) {
    double v19 = v18;
  }
  else {
    double v19 = -(v12 * 1.5);
  }
  if (v7 >= v17) {
    double v20 = v17;
  }
  else {
    double v20 = v7;
  }
  memset(&v37.c, 0, 32);
  if (v20 >= -(v16 * 1.5)) {
    double v21 = v20;
  }
  else {
    double v21 = -(v16 * 1.5);
  }
  *(_OWORD *)&v37.a = 0uLL;
  CGRect v22 = [(QLTransitionDriver *)self destinationView];
  v23 = v22;
  if (v22) {
    [v22 transform];
  }
  else {
    memset(&v37, 0, sizeof(v37));
  }

  CGAffineTransform v36 = v37;
  [(QLTransitionDriver *)self duration];
  CGFloat v25 = v19 * v24;
  [(QLTransitionDriver *)self duration];
  CGAffineTransform v35 = v36;
  CGAffineTransformTranslate(&v36, &v35, v25, v21 * v26);
  CGAffineTransform v34 = v36;
  CGAffineTransformScale(&v35, &v34, 0.3, 0.3);
  CGAffineTransform v36 = v35;
  if (v9 != 0.0)
  {
    [(QLTransitionDriver *)self duration];
    CGAffineTransform v34 = v36;
    CGAffineTransformRotate(&v35, &v34, v9 * v27 + v9 * v27);
    CGAffineTransform v36 = v35;
  }
  CGAffineTransform v33 = v37;
  v28 = [(QLTransitionDriver *)self destinationView];
  CGAffineTransform v32 = v33;
  [v28 setTransform:&v32];

  v29 = (void *)MEMORY[0x263F82E00];
  [(QLTransitionDriver *)self duration];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  CGAffineTransform v31 = v36;
  v30[2] = __63__QLSlideTransitionDriver__animateTransitionUserSlideDismissal__block_invoke;
  v30[3] = &unk_2642F7328;
  v30[4] = self;
  objc_msgSend(v29, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0x20000, v30, 0);
}

uint64_t __63__QLSlideTransitionDriver__animateTransitionUserSlideDismissal__block_invoke(uint64_t a1)
{
  long long v2 = (void *)MEMORY[0x263F82E00];
  CAFrameRateRange v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__QLSlideTransitionDriver__animateTransitionUserSlideDismissal__block_invoke_2;
  v5[3] = &unk_2642F7328;
  v5[4] = *(void *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  long long v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2097155, v5, *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
}

void __63__QLSlideTransitionDriver__animateTransitionUserSlideDismissal__block_invoke_2(uint64_t a1)
{
  long long v2 = objc_msgSend(*(id *)(a1 + 32), "destinationView", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
  [v2 setTransform:&v4];

  long long v3 = [*(id *)(a1 + 32) destinationView];
  [v3 setAlpha:0.0];
}

@end