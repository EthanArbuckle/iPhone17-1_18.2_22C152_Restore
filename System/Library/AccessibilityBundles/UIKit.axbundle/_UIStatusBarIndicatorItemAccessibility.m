@interface _UIStatusBarIndicatorItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_UIStatusBarIndicatorItemAccessibility)init;
- (id)_axLabelKeyForClassNameDict;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIStatusBarIndicatorItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarIndicatorItem";
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
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UIStatusBarIndicatorQuietModeItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorStudentItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorRotationLockItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorAirplaneModeItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorTTYItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorAssistantItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorVPNItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorLiquidDetectionItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorAirPlayItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorCarPlayItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorAlarmItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorLocationItem"];
  [location[0] validateClass:@"_UIStatusBarIndicatorSatelliteItem"];
  v3 = @"_UIStatusBarItem";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UIStatusBarIndicatorItem");
  v4 = "@";
  [location[0] validateClass:@"_UIStatusBarItem" hasInstanceMethod:@"displayItems" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarDisplayItem", @"view", v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)_axLabelKeyForClassNameDict
{
  if (a1) {
    id v2 = &unk_26F48ECD0;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v26 = self;
  SEL v25 = a2;
  v24.receiver = self;
  v24.super_class = (Class)_UIStatusBarIndicatorItemAccessibility;
  [(_UIStatusBarIndicatorItemAccessibility *)&v24 _accessibilityLoadAccessibilityInformation];
  char v22 = 0;
  objc_opt_class();
  id v9 = (id)[(_UIStatusBarIndicatorItemAccessibility *)v26 safeValueForKey:@"displayItems"];
  id v21 = (id)__UIAccessibilityCastAsClass();

  id v20 = v21;
  objc_storeStrong(&v21, 0);
  id v23 = v20;
  memset(__b, 0, sizeof(__b));
  id obj = (id)[v20 allValues];
  uint64_t v8 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
  if (v8)
  {
    uint64_t v4 = *(void *)__b[2];
    uint64_t v5 = 0;
    unint64_t v6 = v8;
    while (1)
    {
      uint64_t v3 = v5;
      if (*(void *)__b[2] != v4) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(id *)(__b[1] + 8 * v5);
      id v17 = (id)[v19 safeValueForKey:@"view"];
      [v17 setIsAccessibilityElement:1];
      objc_initWeak(&from, v26);
      id v2 = v17;
      uint64_t v10 = MEMORY[0x263EF8330];
      int v11 = -1073741824;
      int v12 = 0;
      v13 = __84___UIStatusBarIndicatorItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
      v14 = &unk_2650AE108;
      objc_copyWeak(&v15, &from);
      [v2 _setAccessibilityLabelBlock:&v10];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&from);
      objc_storeStrong(&v17, 0);
      ++v5;
      if (v3 + 1 >= v6)
      {
        uint64_t v5 = 0;
        unint64_t v6 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v23, 0);
}

- (_UIStatusBarIndicatorItemAccessibility)init
{
  SEL v5 = a2;
  unint64_t v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarIndicatorItemAccessibility;
  unint64_t v6 = [(_UIStatusBarIndicatorItemAccessibility *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(_UIStatusBarIndicatorItemAccessibility *)v6 _accessibilityLoadAccessibilityInformation];
  }
  uint64_t v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

@end