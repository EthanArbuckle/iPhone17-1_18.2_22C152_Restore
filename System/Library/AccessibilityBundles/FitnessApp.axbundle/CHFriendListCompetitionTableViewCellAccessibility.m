@interface CHFriendListCompetitionTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CHFriendListCompetitionTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHFriendListCompetitionTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHFriendListCompetitionTableViewCell" hasInstanceVariable:@"_daysRemainingLabel" withType:"UILabel"];
  [v3 validateClass:@"CHFriendListCompetitionTableViewCell" hasInstanceVariable:@"_scoreView" withType:"ASCompetitionScoreView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return [(CHFriendListCompetitionTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_scoreView, _daysRemainingLabel"];
}

@end