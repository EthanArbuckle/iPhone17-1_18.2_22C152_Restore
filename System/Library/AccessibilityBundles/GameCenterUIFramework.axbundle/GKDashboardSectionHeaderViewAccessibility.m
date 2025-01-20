@interface GKDashboardSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)awakeFromNib;
@end

@implementation GKDashboardSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKDashboardSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKDashboardSectionHeaderView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GKDashboardSectionHeaderView", @"awakeFromNib", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)GKDashboardSectionHeaderViewAccessibility;
  [(GKDashboardSectionHeaderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(GKDashboardSectionHeaderViewAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 _setAccessibilityTraitsBlock:&__block_literal_global_6];
}

uint64_t __87__GKDashboardSectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)GKDashboardSectionHeaderViewAccessibility;
  [(GKDashboardSectionHeaderViewAccessibility *)&v3 awakeFromNib];
  [(GKDashboardSectionHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end