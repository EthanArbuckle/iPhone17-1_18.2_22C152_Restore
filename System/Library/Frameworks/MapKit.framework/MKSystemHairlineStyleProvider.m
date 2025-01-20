@interface MKSystemHairlineStyleProvider
- (UIColor)fillColor;
- (id)vibrancyEffectForTraitCollection:(id)a3;
@end

@implementation MKSystemHairlineStyleProvider

- (UIColor)fillColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] separatorColor];
}

- (id)vibrancyEffectForTraitCollection:(id)a3
{
  return 0;
}

@end