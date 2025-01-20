@interface UIImage
@end

@implementation UIImage

uint64_t __58__UIImage_ClipUIServicesExtras__cps_resizedImageWithSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __67__UIImage_ClipUIServicesExtras__cps_imageWithNormalizedOrientation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

@end