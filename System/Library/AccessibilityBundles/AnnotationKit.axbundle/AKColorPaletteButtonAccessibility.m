@interface AKColorPaletteButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AKColorPaletteButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKColorPaletteButton";
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
  return accessibilityLocalizedString(@"color.picker.label");
}

- (id)accessibilityValue
{
  v2 = [(AKColorPaletteButtonAccessibility *)self safeValueForKey:@"color"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

@end