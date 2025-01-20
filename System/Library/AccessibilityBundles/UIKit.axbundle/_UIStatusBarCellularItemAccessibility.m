@interface _UIStatusBarCellularItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6;
- (_UIStatusBarCellularItemAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateDataNetworkViewWithEntry:(void *)a1;
@end

@implementation _UIStatusBarCellularItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarCellularItem";
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
  [location[0] validateClass:@"_UIStatusBarStringView" isKindOfClass:@"UILabel"];
  v3 = @"_UIStatusBarCellularItem";
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"signalView", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"callForwardingView", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"networkTypeView", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:", v4, v4, v4, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"entryForDisplayItemWithIdentifier:", v4, 0);
  objc_storeStrong(v6, v5);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v20 = self;
  SEL v19 = a2;
  v18.receiver = self;
  v18.super_class = (Class)_UIStatusBarCellularItemAccessibility;
  [(_UIStatusBarCellularItemAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  id v17 = (id)[(_UIStatusBarCellularItemAccessibility *)v20 safeUIViewForKey:@"signalView"];
  [v17 _accessibilitySetRetainedValue:@"status.signal.bars" forKey:@"AccessibilityStatusBarSignalViewLabelKey"];
  id v16 = (id)[(_UIStatusBarCellularItemAccessibility *)v20 safeValueForKey:@"callForwardingView"];
  [v16 setIsAccessibilityElement:1];
  id v2 = accessibilityLocalizedString(@"status.call.forward.icon");
  objc_msgSend(v16, "setAccessibilityLabel:");

  id v15 = (id)[(_UIStatusBarCellularItemAccessibility *)v20 safeValueForKey:@"networkTypeView"];
  [v15 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsDataNetwork"];
  id v14 = (id)[NSClassFromString(&cfstr_Uistatusbarcel_6.isa) safeValueForKey:@"typeDisplayIdentifier"];
  uint64_t v6 = 0;
  v7 = &v6;
  int v8 = 838860800;
  int v9 = 48;
  v10 = __Block_byref_object_copy__30;
  v11 = __Block_byref_object_dispose__30;
  id v12 = 0;
  v5[1] = &v6;
  v4 = v20;
  v5[0] = v14;
  AXPerformSafeBlock();
  id v3 = (id)v7[5];
  objc_storeStrong(v5, 0);
  objc_storeStrong((id *)&v4, 0);
  _Block_object_dispose(&v6, 8);
  objc_storeStrong(&v12, 0);
  id v13 = v3;
  -[_UIStatusBarCellularItemAccessibility _axAnnotateDataNetworkViewWithEntry:](v20, v3);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
}

- (void)_axAnnotateDataNetworkViewWithEntry:(void *)a1
{
  id v6 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v6)
  {
    id v3 = axAnnotateDataNetworkViewWithType((void *)[location type]);
    id v2 = (id)[v6 safeValueForKey:@"networkTypeView"];
    [v2 setAccessibilityLabel:v3];

    objc_storeStrong(&v3, 0);
    int v4 = 0;
  }
  else
  {
    int v4 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6
{
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  BOOL v19 = a6;
  char v18 = 0;
  v17.receiver = v23;
  v17.super_class = (Class)_UIStatusBarCellularItemAccessibility;
  char v18 = [(_UIStatusBarCellularItemAccessibility *)&v17 _updateSignalView:location[0] withUpdate:v21 entry:v20 forceShowingDisabledSignalBars:a6];
  char v15 = 0;
  objc_opt_class();
  id v14 = (id)__UIAccessibilityCastAsClass();
  id v13 = v14;
  objc_storeStrong(&v14, 0);
  id v16 = v13;
  id v7 = location[0];
  id v8 = (id)[v13 string];
  objc_msgSend(v7, "_accessibilitySetRetainedValue:forKey:");

  [location[0] _accessibilitySetRetainedValue:@"status.signal.bars" forKey:@"AccessibilityStatusBarSignalViewLabelKey"];
  -[_UIStatusBarCellularItemAccessibility _axAnnotateDataNetworkViewWithEntry:](v23, v16);
  char v9 = v18;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (_UIStatusBarCellularItemAccessibility)init
{
  SEL v5 = a2;
  id v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarCellularItemAccessibility;
  id v6 = [(_UIStatusBarCellularItemAccessibility *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(_UIStatusBarCellularItemAccessibility *)v6 _accessibilityLoadAccessibilityInformation];
  }
  id v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

@end