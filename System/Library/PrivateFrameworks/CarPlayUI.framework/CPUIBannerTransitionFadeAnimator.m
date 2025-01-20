@interface CPUIBannerTransitionFadeAnimator
+ (double)defaultTransitionDuration;
- (void)actionsForTransition:(id)a3;
@end

@implementation CPUIBannerTransitionFadeAnimator

+ (double)defaultTransitionDuration
{
  return 0.2;
}

- (void)actionsForTransition:(id)a3
{
  id v4 = a3;
  if ([(BNBannerTransitionAnimator *)self isPresenting])
  {
    v5 = [v4 viewControllerForKey:*MEMORY[0x263F83C10]];
    v6 = [v5 view];
    v7 = (void *)MEMORY[0x263F82E00];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__CPUIBannerTransitionFadeAnimator_actionsForTransition___block_invoke;
    v10[3] = &unk_26482D6F8;
    id v11 = v4;
    v12 = self;
    id v8 = v6;
    id v13 = v8;
    [v7 performWithoutAnimation:v10];

    double v9 = 1.0;
  }
  else
  {
    v5 = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];
    id v8 = [v5 view];
    double v9 = 0.0;
  }
  [v8 setAlpha:v9];
}

uint64_t __57__CPUIBannerTransitionFadeAnimator_actionsForTransition___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)CPUIBannerTransitionFadeAnimator;
  objc_msgSendSuper2(&v4, sel_actionsForTransition_, v2);
  return [*(id *)(a1 + 48) setAlpha:0.0];
}

@end