@interface ManeuverBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateFromBannerItem;
@end

@implementation ManeuverBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ManeuverBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ManeuverBannerView", @"leadingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ManeuverBannerView", @"leadingManeuverView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ManeuverAccessoryView", @"maneuverView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ManeuverBannerView", @"minimalView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ManeuverBannerView", @"minimalManeuverView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ManeuverBannerView", @"detachedMinimalView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ManeuverBannerView", @"detachedMinimalManeuverView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ManeuverBannerView", @"trailingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ManeuverBannerView", @"apertureDistanceLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DistanceAccessoryView", @"displayState", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DistanceAccessoryView", @"previousDistanceString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ManeuverBannerView", @"updateFromBannerItem", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWindowScene", @"systemApertureElementContext", "@", 0);
  [v3 validateProtocol:@"SBUISystemApertureElementContext" hasRequiredInstanceMethod:@"setElementNeedsUpdate"];
  [v3 validateClass:@"ManeuverBannerView" isKindOfClass:@"UIView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v20.receiver = self;
  v20.super_class = (Class)ManeuverBannerViewAccessibility;
  [(ManeuverBannerViewAccessibility *)&v20 _accessibilityLoadAccessibilityInformation];
  id v3 = [(ManeuverBannerViewAccessibility *)self safeValueForKey:@"leadingManeuverView"];
  v4 = [(ManeuverBannerViewAccessibility *)self safeValueForKey:@"leadingView"];
  v5 = [v3 safeValueForKey:@"maneuverView"];
  v6 = [v5 accessibilityLabel];
  [v4 setAccessibilityLabel:v6];

  v7 = [(ManeuverBannerViewAccessibility *)self safeValueForKey:@"minimalManeuverView"];
  v8 = [(ManeuverBannerViewAccessibility *)self safeValueForKey:@"minimalView"];
  v9 = [v7 safeValueForKey:@"maneuverView"];
  v10 = [v9 accessibilityLabel];
  [v8 setAccessibilityLabel:v10];

  v11 = [(ManeuverBannerViewAccessibility *)self safeValueForKey:@"detachedMinimalManeuverView"];
  v12 = [(ManeuverBannerViewAccessibility *)self safeValueForKey:@"detachedMinimalView"];
  v13 = [v11 safeValueForKey:@"maneuverView"];
  v14 = [v13 accessibilityLabel];
  [v12 setAccessibilityLabel:v14];

  v15 = [(ManeuverBannerViewAccessibility *)self safeValueForKey:@"apertureDistanceLabel"];
  uint64_t v16 = [v15 safeIntegerForKey:@"displayState"];
  if (v16 == 3)
  {
    v17 = [(ManeuverBannerViewAccessibility *)self safeValueForKey:@"trailingView"];
    uint64_t v18 = AXMapsLocString(@"REROUTING_CELL");
  }
  else
  {
    if (v16 != 2)
    {
      v17 = [(ManeuverBannerViewAccessibility *)self safeValueForKey:@"trailingView"];
      [v17 setAccessibilityLabel:0];
      goto LABEL_7;
    }
    v17 = [(ManeuverBannerViewAccessibility *)self safeValueForKey:@"trailingView"];
    uint64_t v18 = [v15 safeValueForKey:@"previousDistanceString"];
  }
  v19 = (void *)v18;
  [v17 setAccessibilityLabel:v18];

LABEL_7:
}

- (void)updateFromBannerItem
{
  v6.receiver = self;
  v6.super_class = (Class)ManeuverBannerViewAccessibility;
  [(ManeuverBannerViewAccessibility *)&v6 updateFromBannerItem];
  [(ManeuverBannerViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
  id v3 = [(ManeuverBannerViewAccessibility *)self window];
  v4 = [v3 windowScene];

  v5 = [v4 safeValueForKey:@"systemApertureElementContext"];
  [v5 setElementNeedsUpdate];
}

@end