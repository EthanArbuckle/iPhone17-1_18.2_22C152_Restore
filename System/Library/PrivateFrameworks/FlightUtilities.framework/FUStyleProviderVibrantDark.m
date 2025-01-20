@interface FUStyleProviderVibrantDark
- (id)compositingFilter;
- (int64_t)blendMode;
@end

@implementation FUStyleProviderVibrantDark

- (int64_t)blendMode
{
  return 2;
}

- (id)compositingFilter
{
  return (id)*MEMORY[0x263F15CD8];
}

@end