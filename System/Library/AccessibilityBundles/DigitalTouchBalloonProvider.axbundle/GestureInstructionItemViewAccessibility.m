@interface GestureInstructionItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation GestureInstructionItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GestureInstructionItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"GestureInstructionItemView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"GestureInstructionItemView" hasInstanceVariable:@"_descriptionLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(GestureInstructionItemViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(GestureInstructionItemViewAccessibility *)self safeValueForKey:@"_descriptionLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = __UIAXStringForVariables();

  return v7;
}

@end