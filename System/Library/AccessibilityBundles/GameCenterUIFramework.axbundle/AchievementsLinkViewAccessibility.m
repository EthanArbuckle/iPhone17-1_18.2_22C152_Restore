@interface AchievementsLinkViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AchievementsLinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.AchievementsLinkView";
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
  return (id)[(AchievementsLinkViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTitleLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AchievementsLinkViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(AchievementsLinkViewAccessibility *)&v3 accessibilityTraits];
}

@end