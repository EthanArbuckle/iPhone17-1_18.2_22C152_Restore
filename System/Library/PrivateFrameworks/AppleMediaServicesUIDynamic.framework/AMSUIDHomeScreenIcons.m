@interface AMSUIDHomeScreenIcons
+ (CGSize)size;
+ (double)cornerRadius;
+ (double)scaledCornerRadiusForSize:(CGSize)a3;
+ (int)variant;
@end

@implementation AMSUIDHomeScreenIcons

+ (double)cornerRadius
{
  uint64_t v2 = [a1 variant];

  MEMORY[0x1F412F8D0](v2);
  return result;
}

+ (CGSize)size
{
  uint64_t v2 = [a1 variant];

  MEMORY[0x1F412F8E0](v2);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)scaledCornerRadiusForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [a1 size];
  double v7 = v6;
  double v9 = v8;
  [a1 cornerRadius];
  double v11 = height / v9;
  if (width > height) {
    double v11 = width / v7;
  }
  return v10 * v11;
}

+ (int)variant
{
  if (qword_1EA150BC8 != -1) {
    dispatch_once(&qword_1EA150BC8, &__block_literal_global);
  }
  return _MergedGlobals;
}

uint64_t __32__AMSUIDHomeScreenIcons_variant__block_invoke()
{
  v0 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v0 scale];
  uint64_t v2 = v1;

  uint64_t v4 = v2;
  uint64_t result = [MEMORY[0x1E4FB1818] _iconVariantForUIApplicationIconFormat:2 scale:&v4];
  _MergedGlobals = result;
  return result;
}

@end