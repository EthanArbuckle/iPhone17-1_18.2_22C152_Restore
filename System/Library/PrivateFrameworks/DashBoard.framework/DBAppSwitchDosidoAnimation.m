@interface DBAppSwitchDosidoAnimation
@end

@implementation DBAppSwitchDosidoAnimation

void __60___DBAppSwitchDosidoAnimation_startAnimationWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 48);
  CGAffineTransformMakeScale(&v6, 1.0, 1.0);
  [v2 setTransform:&v6];
  [*(id *)(a1 + 56) setAlpha:0.0];
  v3 = *(void **)(a1 + 56);
  CGAffineTransformMakeScale(&v5, 1.05, 1.05);
  [v3 setTransform:&v5];
  v4 = [*(id *)(a1 + 56) layer];
  [v4 setValue:&unk_26E17F0F0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

uint64_t __60___DBAppSwitchDosidoAnimation_startAnimationWithCompletion___block_invoke_94(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

@end