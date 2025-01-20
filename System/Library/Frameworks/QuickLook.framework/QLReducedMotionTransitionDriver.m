@interface QLReducedMotionTransitionDriver
- (void)animateTransition;
@end

@implementation QLReducedMotionTransitionDriver

- (void)animateTransition
{
  unsigned int v3 = [(QLTransitionDriver *)self presenting];
  double v4 = (double)(v3 ^ 1);
  double v5 = (double)v3;
  v6 = [(QLTransitionDriver *)self destinationView];
  [v6 setAlpha:v4];

  v7 = (void *)MEMORY[0x263F82E00];
  [(QLTransitionDriver *)self duration];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__QLReducedMotionTransitionDriver_animateTransition__block_invoke;
  v8[3] = &unk_2642F55B8;
  v8[4] = self;
  *(double *)&v8[5] = v5;
  objc_msgSend(v7, "animateWithDuration:animations:completion:", v8, 0);
}

void __52__QLReducedMotionTransitionDriver_animateTransition__block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) destinationView];
  [v2 setAlpha:v1];
}

@end