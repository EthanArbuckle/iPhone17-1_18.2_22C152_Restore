@interface UIImage
@end

@implementation UIImage

uint64_t __45__UIImage_MPUAdditions__scaledImageWithSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end