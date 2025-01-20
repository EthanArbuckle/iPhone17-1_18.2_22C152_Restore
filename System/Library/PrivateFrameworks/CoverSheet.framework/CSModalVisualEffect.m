@interface CSModalVisualEffect
- (id)copyWithZone:(_NSZone *)a3;
- (id)effectConfig;
@end

@implementation CSModalVisualEffect

- (id)effectConfig
{
  v2 = [MEMORY[0x1E4F428B8] _vibrantDarkFillDodgeColor];
  v3 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.3];
  v4 = [MEMORY[0x1E4F433C0] layerWithVibrantColor:v2 tintColor:v3 filterType:*MEMORY[0x1E4F3A360] filterAttributes:0];
  v5 = [MEMORY[0x1E4F433B0] configWithContentConfig:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_opt_new();
}

@end