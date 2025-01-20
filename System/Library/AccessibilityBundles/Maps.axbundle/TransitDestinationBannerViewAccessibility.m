@interface TransitDestinationBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TransitDestinationBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TransitDestinationBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TransitDestinationBannerView", @"leadingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TransitDestinationBannerView", @"minimalView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TransitDestinationBannerView", @"detachedMinimalView", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)TransitDestinationBannerViewAccessibility;
  [(TransitDestinationBannerViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TransitDestinationBannerViewAccessibility *)self safeValueForKey:@"leadingView"];
  v4 = AXMapsLocString(@"MAPS_TRANSIT");
  [v3 setAccessibilityLabel:v4];

  v5 = [(TransitDestinationBannerViewAccessibility *)self safeValueForKey:@"minimalView"];
  v6 = AXMapsLocString(@"MAPS_TRANSIT");
  [v5 setAccessibilityLabel:v6];

  v7 = [(TransitDestinationBannerViewAccessibility *)self safeValueForKey:@"detachedMinimalView"];
  v8 = AXMapsLocString(@"MAPS_TRANSIT");
  [v7 setAccessibilityLabel:v8];
}

@end