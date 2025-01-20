@interface STUIStatusBarDualCellularSignalViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_commonInit;
@end

@implementation STUIStatusBarDualCellularSignalViewAccessibility

- (void)_commonInit
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarDualCellularSignalViewAccessibility;
  [(STUIStatusBarDualCellularSignalViewAccessibility *)&v3 _commonInit];
  [(STUIStatusBarDualCellularSignalViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarDualCellularSignalViewAccessibility;
  [(STUIStatusBarDualCellularSignalViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  objc_super v3 = [(STUIStatusBarDualCellularSignalViewAccessibility *)self safeValueForKey:@"_topSignalView"];
  [v3 _accessibilitySetBoolValue:1 forKey:@"PrimaryCellular"];

  v4 = [(STUIStatusBarDualCellularSignalViewAccessibility *)self safeValueForKey:@"_bottomSignalView"];
  [v4 _accessibilitySetBoolValue:1 forKey:@"SecondaryCellular"];
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarDualCellularSignalView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarDualCellularSignalView", @"_commonInit", "v", 0);
  [v3 validateClass:@"STUIStatusBarDualCellularSignalView" hasInstanceVariable:@"_topSignalView" withType:"STUIStatusBarCellularSignalView"];
  [v3 validateClass:@"STUIStatusBarDualCellularSignalView" hasInstanceVariable:@"_bottomSignalView" withType:"STUIStatusBarCellularSignalView"];
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end