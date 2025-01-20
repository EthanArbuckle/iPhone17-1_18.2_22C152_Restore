@interface DBSuspendAppToHomeZoomAnimation
@end

@implementation DBSuspendAppToHomeZoomAnimation

uint64_t __65___DBSuspendAppToHomeZoomAnimation_startAnimationWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __65___DBSuspendAppToHomeZoomAnimation_startAnimationWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  v2 = *(void **)(a1 + 56);
  [*(id *)(a1 + 48) bounds];
  UIRectGetCenter();
  objc_msgSend(v2, "setCenter:");
  v3 = *(void **)(a1 + 56);
  CGAffineTransformMakeScale(&v12, *(CGFloat *)(a1 + 120), *(CGFloat *)(a1 + 128));
  [v3 setTransform:&v12];
  v4 = *(void **)(a1 + 64);
  CGAffineTransformMakeScale(&v11, 1.0, 1.0);
  [v4 setTransform:&v11];
  v5 = [*(id *)(a1 + 64) layer];
  [v5 setValue:&unk_26E17F110 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  v6 = *(void **)(a1 + 72);
  CGAffineTransformMakeScale(&v10, 1.0, 1.0);
  [v6 setTransform:&v10];
  v7 = *(void **)(a1 + 48);
  v8 = *(void **)(a1 + 72);
  [*(id *)(a1 + 80) iconImageFrame];
  objc_msgSend(v7, "convertRect:fromView:", *(void *)(a1 + 80));
  UIRectGetCenter();
  return objc_msgSend(v8, "setCenter:");
}

uint64_t __65___DBSuspendAppToHomeZoomAnimation_startAnimationWithCompletion___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) removeFromSuperview];
    [*(id *)(v2 + 40) setHidden:0];
    v3 = *(void **)(v2 + 48);
    if (v3 != *(void **)(v2 + 40)) {
      [v3 removeFromSuperview];
    }
    result = *(void *)(v2 + 56);
    if (result)
    {
      v4 = *(uint64_t (**)(void))(result + 16);
      return v4();
    }
  }
  return result;
}

@end