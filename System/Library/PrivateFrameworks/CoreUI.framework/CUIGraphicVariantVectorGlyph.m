@interface CUIGraphicVariantVectorGlyph
@end

@implementation CUIGraphicVariantVectorGlyph

BOOL __56___CUIGraphicVariantVectorGlyph__containsWideGamutColor__block_invoke(uint64_t a1, CGColorRef color, uint64_t a3, unsigned char *a4)
{
  ColorSpace = CGColorGetColorSpace(color);
  BOOL result = CGColorSpaceIsWideGamutRGB(ColorSpace);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

id __96___CUIGraphicVariantVectorGlyph_rasterizeImageUsingScaleFactor_forTargetSize_withPaletteColors___block_invoke(void *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = a1[5];
  if (v3 >= a1[6] + 1)
  {
    v4 = (void *)a1[4];
  }
  else
  {
    v4 = (void *)a1[4];
    if (v3 <= a3) {
      return [v4 lastObject];
    }
  }
  return objc_msgSend(v4, "objectAtIndex:");
}

@end