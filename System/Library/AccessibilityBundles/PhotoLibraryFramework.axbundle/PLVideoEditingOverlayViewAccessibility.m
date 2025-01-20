@interface PLVideoEditingOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PLVideoEditingOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLVideoEditingOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PLVideoEditingOverlayView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"PLVideoEditingOverlayView" hasInstanceVariable:@"_bodyLabel" withType:"UITextView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(PLVideoEditingOverlayViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(PLVideoEditingOverlayViewAccessibility *)self safeValueForKey:@"_bodyLabel"];
  v8 = [v5 accessibilityValue];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end