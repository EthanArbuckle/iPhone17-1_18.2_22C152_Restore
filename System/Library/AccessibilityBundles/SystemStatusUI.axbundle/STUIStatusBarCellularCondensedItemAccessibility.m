@interface STUIStatusBarCellularCondensedItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (STUIStatusBarCellularCondensedItemAccessibility)init;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation STUIStatusBarCellularCondensedItemAccessibility

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarCellularCondensedItemAccessibility;
  v5 = [(STUIStatusBarCellularCondensedItemAccessibility *)&v7 applyUpdate:a3 toDisplayItem:a4];
  [(STUIStatusBarCellularCondensedItemAccessibility *)self _accessibilityLoadAccessibilityInformation];

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarCellularCondensedItemAccessibility;
  [(STUIStatusBarCellularCondensedItemAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v3 = [(STUIStatusBarCellularCondensedItemAccessibility *)self safeValueForKey:@"dualSignalView"];
  v4 = [v3 safeUIViewForKey:@"topSignalView"];
  v5 = [v3 safeUIViewForKey:@"bottomSignalView"];
  [v4 _accessibilitySetRetainedValue:@"status.signal.bars" forKey:@"AccessibilityStatusBarSignalViewLabelKey"];
  [v5 _accessibilitySetRetainedValue:@"status.signal.bars" forKey:@"AccessibilityStatusBarSignalViewLabelKey"];
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarCellularCondensedItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarCellularCondensedItem", @"applyUpdate:toDisplayItem:", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarCellularCondensedItem", @"dualSignalView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarDualCellularSignalView", @"topSignalView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarDualCellularSignalView", @"bottomSignalView", "@", 0);
}

- (STUIStatusBarCellularCondensedItemAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarCellularCondensedItemAccessibility;
  v2 = [(STUIStatusBarCellularCondensedItemAccessibility *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(STUIStatusBarCellularCondensedItemAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  }
  return v3;
}

@end