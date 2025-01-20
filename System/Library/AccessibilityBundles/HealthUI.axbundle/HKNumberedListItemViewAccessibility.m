@interface HKNumberedListItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation HKNumberedListItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKNumberedListItemView";
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
  return (id)[(HKNumberedListItemViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"numberLabel"];
}

@end