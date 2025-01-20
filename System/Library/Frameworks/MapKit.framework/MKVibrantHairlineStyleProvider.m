@interface MKVibrantHairlineStyleProvider
- (UIColor)fillColor;
- (id)vibrancyEffectForTraitCollection:(id)a3;
@end

@implementation MKVibrantHairlineStyleProvider

- (UIColor)fillColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
}

- (id)vibrancyEffectForTraitCollection:(id)a3
{
  v3 = [MEMORY[0x1E4F427D8] effectWithStyle:1100];
  v4 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v3 style:7];

  return v4;
}

@end