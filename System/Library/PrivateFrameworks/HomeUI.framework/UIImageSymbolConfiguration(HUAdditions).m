@interface UIImageSymbolConfiguration(HUAdditions)
- (uint64_t)hu_hasTextStyle;
@end

@implementation UIImageSymbolConfiguration(HUAdditions)

- (uint64_t)hu_hasTextStyle
{
  v2 = [a1 configurationWithoutTextStyle];
  v3 = [v2 configurationWithoutPointSizeAndWeight];

  uint64_t v4 = [a1 isEqualToConfiguration:v3] ^ 1;
  return v4;
}

@end