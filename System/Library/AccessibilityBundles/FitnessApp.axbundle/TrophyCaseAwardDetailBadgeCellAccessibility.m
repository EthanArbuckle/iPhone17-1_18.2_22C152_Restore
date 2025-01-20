@interface TrophyCaseAwardDetailBadgeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation TrophyCaseAwardDetailBadgeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.TrophyCaseAwardDetailBadgeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"FitnessApp.TrophyCaseAwardDetailBadgeCell" hasSwiftField:@"badgeViewContainer" withSwiftType:"UIView"];
  [v3 validateClass:@"FitnessApp.TrophyCaseAwardDetailBadgeCell" hasSwiftField:@"achievementTitleLabel" withSwiftType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)TrophyCaseAwardDetailBadgeCellAccessibility;
  [(TrophyCaseAwardDetailBadgeCellAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TrophyCaseAwardDetailBadgeCellAccessibility *)self safeSwiftValueForKey:@"badgeViewContainer"];
  v4 = [(TrophyCaseAwardDetailBadgeCellAccessibility *)self safeSwiftValueForKey:@"achievementTitleLabel"];
  [v3 setIsAccessibilityElement:1];
  v5 = accessibilityLocalizedString(@"achievement.badge.format");
  v6 = [v4 accessibilityLabel];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);
  [v3 setAccessibilityLabel:v7];

  unint64_t v8 = (unint64_t)[v3 accessibilityTraits];
  [v3 setAccessibilityTraits:UIAccessibilityTraitImage | v8];
  unint64_t v9 = (unint64_t)[v4 accessibilityTraits];
  [v4 setAccessibilityTraits:UIAccessibilityTraitHeader | v9];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TrophyCaseAwardDetailBadgeCellAccessibility;
  [(TrophyCaseAwardDetailBadgeCellAccessibility *)&v3 layoutSubviews];
  [(TrophyCaseAwardDetailBadgeCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end