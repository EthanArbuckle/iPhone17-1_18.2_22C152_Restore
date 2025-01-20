@interface DBLaunchAppFromHomeZoomAnimation
@end

@implementation DBLaunchAppFromHomeZoomAnimation

void __66___DBLaunchAppFromHomeZoomAnimation_startAnimationWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.9, 0.9);
  [v2 setTransform:&v4];
  v3 = [*(id *)(a1 + 32) layer];
  [v3 setValue:&unk_26E17F170 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void __66___DBLaunchAppFromHomeZoomAnimation_startAnimationWithCompletion___block_invoke_109(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setHidden:0];
    v3 = *(void **)(a1 + 40);
    if (v3 == *(void **)(a1 + 32))
    {
      long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v6[0] = *MEMORY[0x263F000D0];
      v6[1] = v4;
      v6[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      [v3 setTransform:v6];
      v5 = [*(id *)(a1 + 40) layer];
      [v5 setValue:&unk_26E17EC60 forKeyPath:@"filters.gaussianBlur.inputRadius"];
    }
    else
    {
      [v3 removeFromSuperview];
    }
  }
}

uint64_t __66___DBLaunchAppFromHomeZoomAnimation_startAnimationWithCompletion___block_invoke_112(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __66___DBLaunchAppFromHomeZoomAnimation_startAnimationWithCompletion___block_invoke_125(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounds];
  UIRectGetCenter();
  objc_msgSend(v2, "setCenter:");
  v3 = *(void **)(a1 + 48);
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(v3, "setFrame:");
  long long v4 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v9, 1.0, 1.0);
  [v4 setTransform:&v9];
  v5 = *(void **)(a1 + 56);
  CGAffineTransformMakeScale(&v8, *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
  [v5 setTransform:&v8];
  v6 = *(void **)(a1 + 56);
  [*(id *)(a1 + 40) bounds];
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:");
  return [*(id *)(a1 + 64) setBackgroundColor:*(void *)(a1 + 72)];
}

uint64_t __66___DBLaunchAppFromHomeZoomAnimation_startAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) removeFromSuperview];
  v3 = *(void **)(a1 + 40);
  return [v3 removeFromSuperview];
}

@end