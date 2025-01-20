@interface UIImage
@end

@implementation UIImage

void __45__UIImage_MessageUI__mf_imageWithColor_size___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setFill];
  objc_msgSend(v3, "fillRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end