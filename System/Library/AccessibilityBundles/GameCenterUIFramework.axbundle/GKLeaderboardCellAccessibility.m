@interface GKLeaderboardCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation GKLeaderboardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKLeaderboardCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKLeaderboardCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKLeaderboardCell", @"countLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(GKLeaderboardCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"titleLabel, countLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)GKLeaderboardCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(GKLeaderboardCellAccessibility *)&v3 accessibilityTraits];
}

@end