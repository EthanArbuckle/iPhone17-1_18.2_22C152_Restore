@interface _UIStatusBarBatteryItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_UIStatusBarBatteryItemAccessibility)init;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIStatusBarBatteryItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarBatteryItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIStatusBarBatteryItem";
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"percentView", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIStatusBarDisplayItem", @"isEnabled", "B", 0);
  v3 = @"_UIStatusBarItem";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  [location[0] validateClass:v4 isKindOfClass:v3];
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v4, @"percentDisplayIdentifier", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"applyUpdate:toDisplayItem:", v5, v5, 0);
  objc_storeStrong(v7, v6);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarBatteryItemAccessibility;
  [(_UIStatusBarBatteryItemAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  id v2 = (id)[(_UIStatusBarBatteryItemAccessibility *)v5 safeValueForKey:@"percentView"];
  [v2 setIsAccessibilityElement:0];
  objc_storeStrong(&v2, 0);
}

- (_UIStatusBarBatteryItemAccessibility)init
{
  SEL v5 = a2;
  id v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarBatteryItemAccessibility;
  id v6 = [(_UIStatusBarBatteryItemAccessibility *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(_UIStatusBarBatteryItemAccessibility *)v6 _accessibilityLoadAccessibilityInformation];
  }
  objc_super v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = 0;
  objc_storeStrong(&v30, a4);
  v28.receiver = v32;
  v28.super_class = (Class)_UIStatusBarBatteryItemAccessibility;
  id v29 = [(_UIStatusBarBatteryItemAccessibility *)&v28 applyUpdate:location[0] toDisplayItem:v30];
  id v27 = (id)[v30 safeValueForKey:@"identifier"];
  id v26 = (id)[(id)objc_opt_class() safeValueForKey:@"percentDisplayIdentifier"];
  if ([v27 isEqual:v26])
  {
    id v25 = (id)[(_UIStatusBarBatteryItemAccessibility *)v32 safeUIViewForKey:@"batteryView"];
    objc_initWeak(&from, v25);
    id v23 = (id)[(_UIStatusBarBatteryItemAccessibility *)v32 safeUIViewForKey:@"percentView"];
    objc_initWeak(&v22, v23);
    if ([v30 safeBoolForKey:@"isEnabled"])
    {
      id v7 = v25;
      uint64_t v15 = MEMORY[0x263EF8330];
      int v16 = -1073741824;
      int v17 = 0;
      v18 = __66___UIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke;
      v19 = &unk_2650AF6C8;
      objc_copyWeak(&v20, &from);
      objc_copyWeak(&v21, &v22);
      [v7 _setAccessibilityFrameBlock:&v15];
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v20);
    }
    else
    {
      id v6 = v25;
      uint64_t v9 = MEMORY[0x263EF8330];
      int v10 = -1073741824;
      int v11 = 0;
      v12 = __66___UIStatusBarBatteryItemAccessibility_applyUpdate_toDisplayItem___block_invoke_2;
      v13 = &unk_2650AE230;
      objc_copyWeak(&v14, &from);
      [v6 _setAccessibilityFrameBlock:&v9];
      objc_destroyWeak(&v14);
    }
    objc_destroyWeak(&v22);
    objc_storeStrong(&v23, 0);
    objc_destroyWeak(&from);
    objc_storeStrong(&v25, 0);
  }
  id v5 = v29;
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);

  return v5;
}

@end