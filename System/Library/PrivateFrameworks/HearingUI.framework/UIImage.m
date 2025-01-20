@interface UIImage
@end

@implementation UIImage

uint64_t __52__UIImage__HearingUI___resizeHearingImageToNewSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 17, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *(double *)(a1 + 40), *(double *)(a1 + 48), 1.0);
}

@end