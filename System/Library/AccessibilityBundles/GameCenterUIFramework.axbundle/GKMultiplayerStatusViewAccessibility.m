@interface GKMultiplayerStatusViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation GKMultiplayerStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.GKMultiplayerStatusView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(GKMultiplayerStatusViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityStatusLabel"];
}

@end