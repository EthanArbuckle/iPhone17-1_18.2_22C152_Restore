@interface PRAddWidgetDetailSheetWidgetDescriptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PRAddWidgetDetailSheetWidgetDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PRAddWidgetDetailSheetWidgetDescriptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PRAddWidgetDetailSheetWidgetDescriptionView" hasProperty:@"titleLabel" withType:"@"];
  [v3 validateClass:@"PRAddWidgetDetailSheetWidgetDescriptionView" hasProperty:@"descriptionLabel" withType:"@"];
}

- (id)accessibilityLabel
{
  id v3 = [(PRAddWidgetDetailSheetWidgetDescriptionViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(PRAddWidgetDetailSheetWidgetDescriptionViewAccessibility *)self safeValueForKey:@"descriptionLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end