@interface DOCSourceListInterface
- (BOOL)overridesBackgroundColorUsingEffectiveAppearance;
- (UIColor)nonDynamicEnabledTextColor;
@end

@implementation DOCSourceListInterface

- (UIColor)nonDynamicEnabledTextColor
{
  return (UIColor *)0;
}

- (BOOL)overridesBackgroundColorUsingEffectiveAppearance
{
  return 0;
}

@end