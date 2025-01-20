@interface ColorPickerButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation ColorPickerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ColorPickerButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ColorPickerButton" hasInstanceVariable:@"_color" withType:"UIColor"];
  [v3 validateClass:@"ColorPickerButton" hasInstanceVariable:@"_isOverflowColorsButton" withType:"BOOL"];
}

- (id)accessibilityLabel
{
  if ([(ColorPickerButtonAccessibility *)self safeBoolForKey:@"_isOverflowColorsButton"])
  {
    id v3 = accessibilityLocalizedString(@"more.colors.button");
  }
  else
  {
    v4 = [(ColorPickerButtonAccessibility *)self safeValueForKey:@"_color"];
    id v3 = AXColorStringForColor();
  }

  return v3;
}

@end