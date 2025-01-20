@interface CHListTableHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CHListTableHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHListTableHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHListTableHeaderView" hasInstanceVariable:@"_dateLabel" withType:"UILabel"];
  [v3 validateClass:@"CHListTableHeaderView" hasInstanceVariable:@"_detailLabel" withType:"_UITableViewHeaderFooterViewLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(CHListTableHeaderViewAccessibility *)self safeValueForKey:@"_dateLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(CHListTableHeaderViewAccessibility *)self safeValueForKey:@"_detailLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CHListTableHeaderViewAccessibility;
  return UIAccessibilityTraitHeader | [(CHListTableHeaderViewAccessibility *)&v3 accessibilityTraits];
}

@end