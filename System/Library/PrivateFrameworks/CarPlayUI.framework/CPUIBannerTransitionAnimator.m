@interface CPUIBannerTransitionAnimator
+ (double)defaultTransitionDuration;
+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5;
- (double)transitionDuration:(id)a3;
@end

@implementation CPUIBannerTransitionAnimator

+ (double)defaultTransitionDuration
{
  return 0.15;
}

+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (v7)
  {
    v10 = (void *)MEMORY[0x263F82E00];
    [a1 defaultTransitionDuration];
    double v12 = v11;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __73__CPUIBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke;
    v15[3] = &unk_26482D458;
    id v16 = v7;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __73__CPUIBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke_2;
    v13[3] = &unk_26482D480;
    id v14 = v9;
    [v10 animateWithDuration:v15 animations:v13 completion:v12];
  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
  }
}

uint64_t __73__CPUIBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__CPUIBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  v3 = objc_opt_class();
  [v3 defaultTransitionDuration];
  return result;
}

@end