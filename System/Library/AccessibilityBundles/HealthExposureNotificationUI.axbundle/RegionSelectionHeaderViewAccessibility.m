@interface RegionSelectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation RegionSelectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExposureNotificationUI.RegionSelectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)RegionSelectionHeaderViewAccessibility;
  [(RegionSelectionHeaderViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(RegionSelectionHeaderViewAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 _setAccessibilityTraitsBlock:&__block_literal_global_2];
}

uint64_t __84__RegionSelectionHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return *MEMORY[0x263F1CEF8];
}

@end