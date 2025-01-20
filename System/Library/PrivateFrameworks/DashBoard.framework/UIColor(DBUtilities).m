@interface UIColor(DBUtilities)
- (uint64_t)undynamicColor;
@end

@implementation UIColor(DBUtilities)

- (uint64_t)undynamicColor
{
  v1 = (void *)MEMORY[0x263F825C8];
  uint64_t v2 = [a1 CGColor];
  return [v1 colorWithCGColor:v2];
}

@end