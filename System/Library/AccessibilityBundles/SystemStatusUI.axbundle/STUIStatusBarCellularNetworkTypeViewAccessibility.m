@interface STUIStatusBarCellularNetworkTypeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation STUIStatusBarCellularNetworkTypeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarCellularNetworkTypeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBarCellularNetworkTypeView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"STUIStatusBarCellularNetworkTypeView" hasProperty:@"type" withType:"q"];
}

- (id)accessibilityLabel
{
  v2 = AXAnnotateDataNetworkViewWithType([(STUIStatusBarCellularNetworkTypeViewAccessibility *)self safeIntegerForKey:@"type"]);
  id v3 = accessibilityLocalizedString(v2);

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarCellularNetworkTypeViewAccessibility;
  return *MEMORY[0x263F813F0] | [(STUIStatusBarCellularNetworkTypeViewAccessibility *)&v3 accessibilityTraits];
}

@end