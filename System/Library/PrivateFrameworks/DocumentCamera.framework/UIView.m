@interface UIView
@end

@implementation UIView

void __39__UIView_DC__dc_imageRenderedFromLayer__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  uint64_t v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

uint64_t __47__UIView_DC__dc_imageRenderedFromViewHierarchy__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 bounds];

  return objc_msgSend(v1, "drawViewHierarchyInRect:afterScreenUpdates:", 0);
}

void __28__UIView_DC__dc_renderImage__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 layer];
  uint64_t v4 = [v3 CGContext];

  [v5 renderInContext:v4];
}

uint64_t __74__UIView_DC__dc_animateWithDuration_timingFunction_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end