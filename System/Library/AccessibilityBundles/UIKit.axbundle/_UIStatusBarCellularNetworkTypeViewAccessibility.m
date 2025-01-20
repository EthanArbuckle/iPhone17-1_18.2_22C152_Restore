@interface _UIStatusBarCellularNetworkTypeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIStatusBarCellularNetworkTypeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIStatusBarCellularNetworkTypeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  [location[0] validateClass:@"_UIStatusBarCellularNetworkTypeView" hasProperty:@"type" withType:"q"];
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  v7 = self;
  SEL v6 = a2;
  v5 = (void *)[(_UIStatusBarCellularNetworkTypeViewAccessibility *)self safeIntegerForKey:@"type"];
  id obj = axAnnotateDataNetworkViewWithType(v5);
  id v3 = accessibilityLocalizedString(obj);
  objc_storeStrong(&obj, 0);

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarCellularNetworkTypeViewAccessibility;
  return [(_UIStatusBarCellularNetworkTypeViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end