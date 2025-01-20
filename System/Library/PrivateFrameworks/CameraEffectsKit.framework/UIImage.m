@interface UIImage
@end

@implementation UIImage

void __45__UIImage_Additions__imageWithColor_andSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGContextSetFillColorWithColor((CGContextRef)[v3 CGContext], (CGColorRef)objc_msgSend(*(id *)(a1 + 32), "CGColor"));
  v4 = (CGContext *)[v3 CGContext];

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  CGContextFillRect(v4, *(CGRect *)&v5);
}

uint64_t __63__UIImage_Additions__extendedRangeSafeDrawInRect_opaque_scale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __63__UIImage_Additions__extendedRangeSafeDrawInRect_opaque_scale___block_invoke_2()
{
  v0 = objc_msgSend(@"Falling back to UIGraphicsBeginImageContextWithOptions, which is not extended range safe! ", "stringByAppendingString:", @"UIGraphicsImageRenderer is #included, so you must be on a old whitetail build");
}

CGColorSpaceRef __29__UIImage_Additions___isSRGB__block_invoke()
{
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x263F002D8]);
  _isSRGB_s_sRGB = (uint64_t)result;
  return result;
}

@end