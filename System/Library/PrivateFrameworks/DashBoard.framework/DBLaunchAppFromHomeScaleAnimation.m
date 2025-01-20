@interface DBLaunchAppFromHomeScaleAnimation
@end

@implementation DBLaunchAppFromHomeScaleAnimation

uint64_t __67___DBLaunchAppFromHomeScaleAnimation_startAnimationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  CGAffineTransformMakeScale(&v7, 0.9, 0.9);
  [v2 setTransform:&v7];
  v3 = [*(id *)(a1 + 48) layer];
  [v3 setValue:&unk_26E17F170 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  [*(id *)(a1 + 56) setAlpha:1.0];
  v4 = *(void **)(a1 + 56);
  CGAffineTransformMakeScale(&v6, 1.0, 1.0);
  return [v4 setTransform:&v6];
}

void __67___DBLaunchAppFromHomeScaleAnimation_startAnimationWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    if (v5 == *(void **)(a1 + 40))
    {
      long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v8[0] = *MEMORY[0x263F000D0];
      v8[1] = v6;
      v8[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      [v5 setTransform:v8];
      CGAffineTransform v7 = [*(id *)(a1 + 32) layer];
      [v7 setValue:&unk_26E17EC60 forKeyPath:@"filters.gaussianBlur.inputRadius"];
    }
  }
}

@end