@interface CHAchievementsSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CHAchievementsSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHAchievementsSectionHeaderView";
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

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CHAchievementsSectionHeaderViewAccessibility;
  return UIAccessibilityTraitHeader | [(CHAchievementsSectionHeaderViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return [(CHAchievementsSectionHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"label"];
}

@end