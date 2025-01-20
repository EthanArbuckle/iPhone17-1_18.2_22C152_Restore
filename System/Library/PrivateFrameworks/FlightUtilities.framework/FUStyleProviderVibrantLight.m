@interface FUStyleProviderVibrantLight
- (id)lightTextColor;
- (id)primaryTextColor;
- (id)separatorColor;
@end

@implementation FUStyleProviderVibrantLight

- (id)separatorColor
{
  return (id)[MEMORY[0x263F1C550] systemWhiteColor];
}

- (id)primaryTextColor
{
  return (id)[MEMORY[0x263F1C550] blackColor];
}

- (id)lightTextColor
{
  return (id)[MEMORY[0x263F1C550] systemWhiteColor];
}

@end