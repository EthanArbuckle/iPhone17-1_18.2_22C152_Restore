@interface UIView(BaseBoardUI)
- (uint64_t)bs_isHitTestingDisabled;
- (uint64_t)bs_setHitTestingDisabled:()BaseBoardUI;
@end

@implementation UIView(BaseBoardUI)

- (uint64_t)bs_setHitTestingDisabled:()BaseBoardUI
{
  uint64_t v4 = a3 ^ 1u;
  v5 = [a1 layer];
  [v5 setAllowsHitTesting:v4];

  return [a1 setUserInteractionEnabled:v4];
}

- (uint64_t)bs_isHitTestingDisabled
{
  v2 = [a1 layer];
  if ([v2 allowsHitTesting]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [a1 isUserInteractionEnabled] ^ 1;
  }

  return v3;
}

@end