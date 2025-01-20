@interface DBSuspendAppToHomeReducedMotionAnimation
@end

@implementation DBSuspendAppToHomeReducedMotionAnimation

uint64_t __74___DBSuspendAppToHomeReducedMotionAnimation_startAnimationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) setAlpha:1.0];
  v2 = *(void **)(a1 + 56);
  return [v2 setAlpha:0.0];
}

uint64_t __74___DBSuspendAppToHomeReducedMotionAnimation_startAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end