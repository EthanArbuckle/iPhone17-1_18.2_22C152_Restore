@interface ColorSwatchAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation ColorSwatchAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PaperKit.ColorSwatch";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"color.swatch");
}

- (id)accessibilityValue
{
  objc_opt_class();
  v3 = [(ColorSwatchAccessibility *)self safeSwiftValueForKey:@"selectedColor"];
  v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    v5 = AXColorStringForColor();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end