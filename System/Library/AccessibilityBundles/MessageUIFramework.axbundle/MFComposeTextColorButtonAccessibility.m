@interface MFComposeTextColorButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MFComposeTextColorButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeTextColorButton";
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
  return accessibilityLocalizedString(@"text.color.button");
}

- (id)accessibilityValue
{
  objc_opt_class();
  v3 = [(MFComposeTextColorButtonAccessibility *)self safeValueForKey:@"color"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = AXColorStringForColor();

  return v5;
}

@end