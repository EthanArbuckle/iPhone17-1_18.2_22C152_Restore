@interface RoutePlanningOverviewRouteCreationCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation RoutePlanningOverviewRouteCreationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RoutePlanningOverviewRouteCreationCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"RoutePlanningOverviewRouteCreationCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"RoutePlanningOverviewRouteCreationCell" hasInstanceVariable:@"_bodyLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  return (id)[(RoutePlanningOverviewRouteCreationCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _bodyLabel"];
}

@end