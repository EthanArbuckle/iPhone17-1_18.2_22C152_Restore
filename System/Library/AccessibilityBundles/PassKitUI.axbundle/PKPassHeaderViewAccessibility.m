@interface PKPassHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation PKPassHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PKPassHeaderView" hasInstanceVariable:@"_title" withType:"UILabel"];
  [v3 validateClass:@"PKPassHeaderView" hasInstanceVariable:@"_subtitle" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  return (id)[(PKPassHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_title, _subtitle"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end