@interface DBAppSwitchReducedMotionAnimation
@end

@implementation DBAppSwitchReducedMotionAnimation

void __67___DBAppSwitchReducedMotionAnimation_startAnimationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) fromView];
  [v2 setAlpha:0.0];
}

uint64_t __67___DBAppSwitchReducedMotionAnimation_startAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end