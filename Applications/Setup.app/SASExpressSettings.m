@interface SASExpressSettings
- (int64_t)buddy_userInterfaceStyleModeValue;
@end

@implementation SASExpressSettings

- (int64_t)buddy_userInterfaceStyleModeValue
{
  if (([(SASExpressSettings *)self hasAppearanceMode] & 1) == 0) {
    return 0;
  }
  unsigned int v2 = [(SASExpressSettings *)self appearanceMode];
  switch(v2)
  {
    case 1u:
      return 1;
    case 2u:
      return 2;
    case 3u:
      return 100;
  }
  return v5;
}

@end