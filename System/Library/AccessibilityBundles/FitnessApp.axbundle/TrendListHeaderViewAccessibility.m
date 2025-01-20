@interface TrendListHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TrendListHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.TrendListHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return [(TrendListHeaderViewAccessibility *)self _accessibilityTextForSubhierarchyIncludingHeaders:1 focusableItems:0 exclusions:0];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TrendListHeaderViewAccessibility;
  return UIAccessibilityTraitHeader | [(TrendListHeaderViewAccessibility *)&v3 accessibilityTraits];
}

@end