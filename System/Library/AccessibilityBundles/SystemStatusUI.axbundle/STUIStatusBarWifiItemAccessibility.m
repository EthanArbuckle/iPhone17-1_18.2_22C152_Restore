@interface STUIStatusBarWifiItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (STUIStatusBarWifiItemAccessibility)init;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation STUIStatusBarWifiItemAccessibility

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarWifiItemAccessibility;
  id v6 = a3;
  v7 = [(STUIStatusBarWifiItemAccessibility *)&v9 applyUpdate:v6 toDisplayItem:a4];
  [(STUIStatusBarWifiItemAccessibility *)self _accessibilitySetRetainedValue:v6, @"AccessibilityStatusBarUpdateData", v9.receiver, v9.super_class forKey];

  [(STUIStatusBarWifiItemAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarWifiItemAccessibility;
  [(STUIStatusBarWifiItemAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  v3 = [(STUIStatusBarWifiItemAccessibility *)self _accessibilityValueForKey:@"AccessibilityStatusBarUpdateData"];
  v4 = [v3 safeValueForKeyPath:@"data.wifiEntry"];
  uint64_t v5 = [v4 safeIntegerForKey:@"type"];

  if (v5 == 1)
  {
    id v6 = [(STUIStatusBarWifiItemAccessibility *)self safeValueForKey:@"networkIconView"];
    [v6 setIsAccessibilityElement:1];
    v7 = accessibilityLocalizedString(@"status.hotspot.active");
    [v6 setAccessibilityValue:v7];

    [v6 setAccessibilityTraits:*MEMORY[0x263F813F0]];
  }
  else
  {
    id v6 = [(STUIStatusBarWifiItemAccessibility *)self safeUIViewForKey:@"signalView"];
    if (MGGetBoolAnswer()) {
      v8 = @"status.network.wlan.signal.bars";
    }
    else {
      v8 = @"status.network.wifi.signal.bars";
    }
    [v6 _accessibilitySetRetainedValue:v8 forKey:@"AccessibilityStatusBarSignalViewLabelKey"];
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarWifiItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarWifiItem", @"applyUpdate:toDisplayItem:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarWifiItem", @"signalView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarWifiItem", @"networkIconView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarItemUpdate", @"data", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarData", @"wifiEntry", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarDataWifiEntry", @"type", "q", 0);
}

- (STUIStatusBarWifiItemAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarWifiItemAccessibility;
  v2 = [(STUIStatusBarWifiItemAccessibility *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(STUIStatusBarWifiItemAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  }
  return v3;
}

@end