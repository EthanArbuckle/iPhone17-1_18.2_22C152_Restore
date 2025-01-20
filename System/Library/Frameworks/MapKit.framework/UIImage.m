@interface UIImage
@end

@implementation UIImage

uint64_t __60__UIImage_MapKitExtras___mapkit_templateImageWithTintColor___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFill];
  UIRectFill(*(CGRect *)(a1 + 48));
  v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);

  return objc_msgSend(v2, "drawInRect:blendMode:alpha:", 22, v3, v4, v5, v6, 1.0);
}

@end