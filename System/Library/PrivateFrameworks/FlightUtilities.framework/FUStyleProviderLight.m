@interface FUStyleProviderLight
- (id)lightTextColor;
- (id)separatorColor;
@end

@implementation FUStyleProviderLight

- (id)separatorColor
{
  return (id)[MEMORY[0x263F1C550] tableSeparatorLightColor];
}

- (id)lightTextColor
{
  return (id)[MEMORY[0x263F1C550] systemGrayColor];
}

@end