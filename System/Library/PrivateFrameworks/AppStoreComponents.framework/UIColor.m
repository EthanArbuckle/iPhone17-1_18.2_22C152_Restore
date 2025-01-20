@interface UIColor
@end

@implementation UIColor

void __55__UIColor_AppStoreComponents___asc_highlightBlendColor__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v0 = [v2 colorWithAlphaComponent:0.4];
  v1 = (void *)_asc_highlightBlendColor_highlightBlendColor;
  _asc_highlightBlendColor_highlightBlendColor = v0;
}

id __65__UIColor_AppStoreComponents__asc_colorWithLightColor_darkColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == 2) {
    uint64_t v4 = 32;
  }
  v5 = *(void **)(a1 + v4);

  return v5;
}

@end