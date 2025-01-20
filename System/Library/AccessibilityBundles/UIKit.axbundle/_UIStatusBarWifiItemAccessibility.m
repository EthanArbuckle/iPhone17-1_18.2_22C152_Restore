@interface _UIStatusBarWifiItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_UIStatusBarWifiItemAccessibility)init;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIStatusBarWifiItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarWifiItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = "@";
  v3 = @"_UIStatusBarWifiItem";
  [location[0] validateClass:"@" hasInstanceMethod:"@" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"signalView", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"networkIconView", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarItemUpdate", @"data", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarData", @"wifiEntry", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarDataWifiEntry", @"type", "q", 0);
  objc_storeStrong(v6, v5);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarWifiItemAccessibility;
  [(_UIStatusBarWifiItemAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v10 = (id)[(_UIStatusBarWifiItemAccessibility *)v13 _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
  id v6 = (id)[v10 safeValueForKeyPath:@"data.wifiEntry"];
  v7 = (void *)[v6 safeIntegerForKey:@"type"];

  v9[1] = v7;
  if (v7 == (void *)1)
  {
    v9[0] = (id)[(_UIStatusBarWifiItemAccessibility *)v13 safeValueForKey:@"networkIconView"];
    [v9[0] setIsAccessibilityElement:1];
    id v4 = v9[0];
    id v5 = accessibilityLocalizedString(@"status.hotspot.active");
    objc_msgSend(v4, "setAccessibilityValue:");

    [v9[0] setAccessibilityTraits:*MEMORY[0x263F813F0]];
    objc_storeStrong(v9, 0);
  }
  else
  {
    id v8 = (id)[(_UIStatusBarWifiItemAccessibility *)v13 safeUIViewForKey:@"signalView"];
    if (MGGetBoolAnswer()) {
      v2 = @"status.network.wlan.signal.bars";
    }
    else {
      v2 = @"status.network.wifi.signal.bars";
    }
    objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:", v2, @"AccessibilityStatusBarSignalViewLabelKey", &v8);
    objc_storeStrong(v3, 0);
  }
  objc_storeStrong(&v10, 0);
}

- (_UIStatusBarWifiItemAccessibility)init
{
  SEL v5 = a2;
  id v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarWifiItemAccessibility;
  id v6 = [(_UIStatusBarWifiItemAccessibility *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(_UIStatusBarWifiItemAccessibility *)v6 _accessibilityLoadAccessibilityInformation];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  objc_super v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v7.receiver = v11;
  v7.super_class = (Class)_UIStatusBarWifiItemAccessibility;
  id v8 = [(_UIStatusBarWifiItemAccessibility *)&v7 applyUpdate:location[0] toDisplayItem:v9];
  [(_UIStatusBarWifiItemAccessibility *)v11 _accessibilitySetRetainedValue:location[0] forKey:@"AccessibilityStatusBarUpdateData"];
  [(_UIStatusBarWifiItemAccessibility *)v11 _accessibilityLoadAccessibilityInformation];
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v6;
}

@end