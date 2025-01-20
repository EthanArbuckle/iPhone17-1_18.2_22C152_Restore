@interface PKSqueezePaletteMulticolorSwatchButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PKSqueezePaletteMulticolorSwatchButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKSqueezePaletteMulticolorSwatchButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = [(PKSqueezePaletteMulticolorSwatchButtonAccessibility *)self safeValueForKey:@"swatch"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(PKSqueezePaletteMulticolorSwatchButtonAccessibility *)self safeValueForKey:@"swatch"];
  v3 = [v2 accessibilityValue];

  return v3;
}

@end