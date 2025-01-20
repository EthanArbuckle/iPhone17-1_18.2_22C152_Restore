@interface UGCPOIEnrichmentModalHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation UGCPOIEnrichmentModalHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UGCPOIEnrichmentModalHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UGCPOIEnrichmentModalHeaderView" hasInstanceVariable:@"_leadingButton" withType:"MapsThemeButton"];
  [v3 validateClass:@"UGCPOIEnrichmentModalHeaderView" hasInstanceVariable:@"_poiIconView" withType:"UGCPOIEnrichmentHeaderView"];
  [v3 validateClass:@"UGCPOIEnrichmentModalHeaderView" hasInstanceVariable:@"_trailingButton" withType:"MapsThemeButton"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)UGCPOIEnrichmentModalHeaderViewAccessibility;
  [(UGCPOIEnrichmentModalHeaderViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  id location = 0;
  [0 _setAccessibilityElementsBlock:&__block_literal_global_4];
  objc_destroyWeak(&location);
}

id __90__UGCPOIEnrichmentModalHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF8C0];
  v1 = [0 safeValueForKey:@"_leadingButton"];
  v2 = [0 safeValueForKey:@"_poiIconView"];
  objc_super v3 = [0 safeValueForKey:@"_trailingButton"];
  v4 = objc_msgSend(v0, "axArrayWithPossiblyNilArrays:", 3, v1, v2, v3);

  return v4;
}

@end