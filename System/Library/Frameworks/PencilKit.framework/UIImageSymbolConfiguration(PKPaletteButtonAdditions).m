@interface UIImageSymbolConfiguration(PKPaletteButtonAdditions)
+ (uint64_t)_pk_defaultImageSymbolScale;
+ (uint64_t)pk_defaultImageSymbolConfiguration;
@end

@implementation UIImageSymbolConfiguration(PKPaletteButtonAdditions)

+ (uint64_t)pk_defaultImageSymbolConfiguration
{
  v2 = (void *)MEMORY[0x1E4FB1830];
  if (qword_1EA3C6C60 != -1) {
    dispatch_once(&qword_1EA3C6C60, &__block_literal_global_78);
  }
  double v3 = *(double *)&_MergedGlobals_7;
  uint64_t v4 = objc_msgSend(a1, "_pk_defaultImageSymbolScale");

  return [v2 configurationWithPointSize:6 weight:v4 scale:v3];
}

+ (uint64_t)_pk_defaultImageSymbolScale
{
  if (PKIsVisionDevice()) {
    return 3;
  }
  else {
    return 2;
  }
}

@end