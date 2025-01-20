@interface AVTColorSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AVTColorSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTColorSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVTColorSlider" isKindOfClass:@"UISlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISlider", @"minimumValue", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISlider", @"maximumValue", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISlider", @"value", "f", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"editor.color.slider");
}

- (id)accessibilityValue
{
  [(AVTColorSliderAccessibility *)self safeFloatForKey:@"minimumValue"];
  [(AVTColorSliderAccessibility *)self safeFloatForKey:@"maximumValue"];
  [(AVTColorSliderAccessibility *)self safeFloatForKey:@"value"];
  id v3 = [(AVTColorSliderAccessibility *)self _accessibilityValueForKey:@"AccessibilityMinColorNameKey"];
  v4 = [(AVTColorSliderAccessibility *)self _accessibilityValueForKey:@"AccessibilityMaxColorNameKey"];
  v5 = AXFormatFloatWithPercentage();
  v6 = __UIAXStringForVariables();

  v7 = AXFormatFloatWithPercentage();
  v8 = __UIAXStringForVariables();

  v9 = __UIAXStringForVariables();

  return v9;
}

@end