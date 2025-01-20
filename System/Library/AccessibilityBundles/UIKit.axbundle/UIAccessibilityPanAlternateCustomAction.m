@interface UIAccessibilityPanAlternateCustomAction
- (uint64_t)isSecondAlternate;
- (uint64_t)setIsSecondAlternate:(uint64_t)result;
@end

@implementation UIAccessibilityPanAlternateCustomAction

- (uint64_t)isSecondAlternate
{
  if (a1) {
    char v2 = *(unsigned char *)(a1 + 56) & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)setIsSecondAlternate:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 56) = a2 & 1;
  }
  return result;
}

@end