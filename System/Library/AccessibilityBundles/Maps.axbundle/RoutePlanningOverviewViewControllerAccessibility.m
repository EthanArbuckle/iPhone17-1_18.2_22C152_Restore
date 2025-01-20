@interface RoutePlanningOverviewViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didTapGoButtonForRouteOverviewCell:(id)a3;
@end

@implementation RoutePlanningOverviewViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RoutePlanningOverviewViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RoutePlanningOverviewViewController", @"didTapGoButtonForRouteOverviewCell:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RoutePlanningOverviewViewController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ContaineeViewController", @"contentView", "@", 0);
  [v3 validateClass:@"RoutePlanningOverviewViewController" isKindOfClass:@"ContaineeViewController"];
  [v3 validateClass:@"CardView"];
}

- (void)didTapGoButtonForRouteOverviewCell:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningOverviewViewControllerAccessibility;
  [(RoutePlanningOverviewViewControllerAccessibility *)&v3 didTapGoButtonForRouteOverviewCell:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __87__RoutePlanningOverviewViewControllerAccessibility_didTapGoButtonForRouteOverviewCell___block_invoke()
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningOverviewViewControllerAccessibility;
  [(RoutePlanningOverviewViewControllerAccessibility *)&v10 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(RoutePlanningOverviewViewControllerAccessibility *)self safeValueForKey:@"collectionView"];
  v4 = AXMapsLocString(@"collection.routes.label");
  [v3 setAccessibilityLabel:v4];

  v5 = [(RoutePlanningOverviewViewControllerAccessibility *)self safeValueForKey:@"contentView"];
  uint64_t v6 = MEMORY[0x245653010](@"CardView");
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __94__RoutePlanningOverviewViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &__block_descriptor_40_e12_B24__0_8_B16lu32l8;
  v9[4] = v6;
  v7 = [v5 _accessibilityFindViewAncestor:v9 startWithSelf:0];
  v8 = AXMapsLocString(@"group.routeplanner.label");
  [v7 setAccessibilityLabel:v8];
}

uint64_t __94__RoutePlanningOverviewViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end