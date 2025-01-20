@interface _UIStatusBarDualCellularSignalViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_commonInit;
@end

@implementation _UIStatusBarDualCellularSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarDualCellularSignalView";
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
  v3 = @"_UIStatusBarDualCellularSignalView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v4 = "_UIStatusBarCellularSignalView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, @"_topSignalView");
  [location[0] validateClass:v3 hasInstanceVariable:@"_bottomSignalView" withType:v4];
  objc_storeStrong(v6, obj);
}

- (void)_commonInit
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIStatusBarDualCellularSignalViewAccessibility;
  [(_UIStatusBarDualCellularSignalViewAccessibility *)&v2 _commonInit];
  [(_UIStatusBarDualCellularSignalViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarDualCellularSignalViewAccessibility;
  [(_UIStatusBarDualCellularSignalViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v2 = (id)[(_UIStatusBarDualCellularSignalViewAccessibility *)v6 safeValueForKey:@"_topSignalView"];
  [v2 _accessibilitySetBoolValue:1 forKey:@"PrimaryCellular"];

  id v3 = (id)[(_UIStatusBarDualCellularSignalViewAccessibility *)v6 safeValueForKey:@"_bottomSignalView"];
  [v3 _accessibilitySetBoolValue:1 forKey:@"SecondaryCellular"];
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end