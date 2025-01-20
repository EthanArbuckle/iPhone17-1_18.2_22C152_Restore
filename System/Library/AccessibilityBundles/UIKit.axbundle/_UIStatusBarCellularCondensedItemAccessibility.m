@interface _UIStatusBarCellularCondensedItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_UIStatusBarCellularCondensedItemAccessibility)init;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _UIStatusBarCellularCondensedItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarCellularCondensedItem";
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
  v5 = "@";
  v3 = @"_UIStatusBarCellularCondensedItem";
  [location[0] validateClass:"@" hasInstanceMethod:"@" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, @"dualSignalView", v5, 0);
  v4 = @"_UIStatusBarDualCellularSignalView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"bottomSignalView", v5, 0);
  objc_storeStrong(v7, v6);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarCellularCondensedItemAccessibility;
  [(_UIStatusBarCellularCondensedItemAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v4 = (id)[(_UIStatusBarCellularCondensedItemAccessibility *)v7 safeValueForKey:@"dualSignalView"];
  id v3 = (id)[v4 safeUIViewForKey:@"topSignalView"];
  id v2 = (id)[v4 safeUIViewForKey:@"bottomSignalView"];
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:");
  [v2 _accessibilitySetRetainedValue:@"status.signal.bars" forKey:@"AccessibilityStatusBarSignalViewLabelKey"];
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v4, 0);
}

- (_UIStatusBarCellularCondensedItemAccessibility)init
{
  SEL v5 = a2;
  SEL v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarCellularCondensedItemAccessibility;
  SEL v6 = [(_UIStatusBarCellularCondensedItemAccessibility *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(_UIStatusBarCellularCondensedItemAccessibility *)v6 _accessibilityLoadAccessibilityInformation];
  }
  id v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  v7.receiver = v11;
  v7.super_class = (Class)_UIStatusBarCellularCondensedItemAccessibility;
  id v8 = [(_UIStatusBarCellularCondensedItemAccessibility *)&v7 applyUpdate:location[0] toDisplayItem:v9];
  [(_UIStatusBarCellularCondensedItemAccessibility *)v11 _accessibilityLoadAccessibilityInformation];
  id v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);

  return v6;
}

@end