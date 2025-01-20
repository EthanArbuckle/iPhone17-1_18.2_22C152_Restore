@interface DBSuspendAppToHomeScaleAnimation
@end

@implementation DBSuspendAppToHomeScaleAnimation

uint64_t __66___DBSuspendAppToHomeScaleAnimation_startAnimationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  CGAffineTransformMakeScale(&v7, 1.0, 1.0);
  [v2 setTransform:&v7];
  v3 = [*(id *)(a1 + 48) layer];
  [v3 setValue:&unk_26E17F110 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  [*(id *)(a1 + 56) setAlpha:0.0];
  v4 = *(void **)(a1 + 56);
  CGAffineTransformMakeScale(&v6, 0.95, 0.95);
  return [v4 setTransform:&v6];
}

uint64_t __66___DBSuspendAppToHomeScaleAnimation_startAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end