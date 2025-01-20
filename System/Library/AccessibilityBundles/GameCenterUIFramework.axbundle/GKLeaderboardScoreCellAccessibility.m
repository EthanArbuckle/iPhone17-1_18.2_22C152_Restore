@interface GKLeaderboardScoreCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation GKLeaderboardScoreCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKLeaderboardScoreCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKLeaderboardScoreCell", @"rankLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKLeaderboardScoreCell", @"nameLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKLeaderboardScoreCell", @"scoreLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(GKLeaderboardScoreCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"rankLabel, nameLabel, scoreLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardScoreCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(GKLeaderboardScoreCellAccessibility *)&v3 accessibilityTraits];
}

@end