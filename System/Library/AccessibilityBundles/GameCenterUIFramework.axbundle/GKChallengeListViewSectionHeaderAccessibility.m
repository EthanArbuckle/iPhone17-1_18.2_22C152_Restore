@interface GKChallengeListViewSectionHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation GKChallengeListViewSectionHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKChallengeListViewSectionHeader";
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
  return (id)[(GKChallengeListViewSectionHeaderAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)GKChallengeListViewSectionHeaderAccessibility;
  return *MEMORY[0x263F1CEF8] | [(GKChallengeListViewSectionHeaderAccessibility *)&v3 accessibilityTraits];
}

@end