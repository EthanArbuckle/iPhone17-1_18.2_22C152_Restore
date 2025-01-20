@interface LookAroundPuckViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation LookAroundPuckViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LookAroundPuckViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"LookAroundModeController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"UIApplication", @"sharedMapsDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MapsAppDelegate", @"chromeViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ChromeViewController", @"topContext", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LookAroundModeController", @"actionCoordinator", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LookAroundActionCoordinator", @"dataCoordinator", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LookAroundPIPDataCoordinatorImpl", @"lookAroundViewHeading", "d", 0);
  [v3 validateClass:@"LookAroundPuckViewController" hasInstanceVariable:@"_puckView" withType:"LookAroundPuckView"];
  [v3 validateClass:@"IOSBasedChromeViewController" isKindOfClass:@"ChromeViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)LookAroundPuckViewControllerAccessibility;
  [(LookAroundPuckViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(LookAroundPuckViewControllerAccessibility *)self safeUIViewForKey:@"_puckView"];
  [v3 setIsAccessibilityElement:1];
  v4 = AXMapsLocString(@"LOOK_AROUND_PUCK");
  [v3 setAccessibilityLabel:v4];

  objc_msgSend(v3, "setAccessibilityTraits:", objc_msgSend(v3, "accessibilityTraits") & ~*MEMORY[0x263F1CF00]);
  [v3 _setAccessibilityValueBlock:&__block_literal_global_7];
}

id __87__LookAroundPuckViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  v0 = [MEMORY[0x263F1C408] safeValueForKey:@"sharedMapsDelegate"];
  v1 = [v0 safeValueForKey:@"chromeViewController"];
  v2 = [v1 safeValueForKey:@"topContext"];

  MEMORY[0x245653010](@"LookAroundModeController");
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 safeValueForKey:@"actionCoordinator"];
    v4 = [v3 safeValueForKey:@"dataCoordinator"];
    [v4 safeDoubleForKey:@"lookAroundViewHeading"];

    objc_super v5 = NSString;
    v6 = AXMapKitLocString(@"HEADING_FORMAT");
    v7 = AXDescriptionForHeadingInDegrees();
    v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end