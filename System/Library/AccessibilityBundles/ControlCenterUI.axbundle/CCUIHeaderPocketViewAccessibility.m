@interface CCUIHeaderPocketViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (int64_t)_accessibilitySortPriority;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CCUIHeaderPocketViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIHeaderPocketView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIHeaderPocketView", @"editButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIHeaderPocketView", @"powerButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIHeaderPocketView", @"statusBar", "@", 0);
  [v3 validateClass:@"CCUIHeaderPocketView" hasInstanceVariable:@"_compactSensorAttributionControl" withType:"CCUISensorAttributionCompactControl"];
  [v3 validateClass:@"CCUIHeaderPocketView" hasInstanceVariable:@"_sensorAttributionExpandedWrapperView" withType:"UIView"];
  [v3 validateClass:@"CCUIHeaderPocketView" hasInstanceVariable:@"_sensorAttributionExpandedViewController" withType:"CCUISensorAttributionExpandedViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUISensorAttributionExpandedViewController", @"isExpanded", "B", 0);
  [v3 validateClass:@"CCUIPowerButton" isKindOfClass:@"UIControl"];
}

- (id)accessibilityElements
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(CCUIHeaderPocketViewAccessibility *)self safeValueForKey:@"editButton"];
  v5 = [(CCUIHeaderPocketViewAccessibility *)self safeValueForKey:@"powerButton"];
  v6 = [(CCUIHeaderPocketViewAccessibility *)self safeValueForKey:@"_compactSensorAttributionControl"];
  [v3 axSafelyAddObject:v4];
  [v3 axSafelyAddObject:v5];
  [v3 axSafelyAddObject:v6];
  if (AXDoesRequestingClientDeserveAutomation())
  {
    v7 = [(CCUIHeaderPocketViewAccessibility *)self safeValueForKey:@"statusBar"];
    [v3 axSafelyAddObject:v7];
  }
  else
  {
    v7 = [(id)*MEMORY[0x263F1D020] _accessibilityStatusBarElements:1 sorted:1];
    [v3 axSafelyAddObjectsFromArray:v7];
  }

  return v3;
}

- (int64_t)_accessibilitySortPriority
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v15.receiver = self;
  v15.super_class = (Class)CCUIHeaderPocketViewAccessibility;
  [(CCUIHeaderPocketViewAccessibility *)&v15 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CCUIHeaderPocketViewAccessibility *)self safeValueForKey:@"editButton"];
  v4 = accessibilityLocalizedString(@"control.center.add.controls");
  [v3 setAccessibilityLabel:v4];

  [v3 _setAccessibilityServesAsFirstElement:1];
  v5 = [(CCUIHeaderPocketViewAccessibility *)self safeValueForKey:@"powerButton"];
  v6 = accessibilityLocalizedString(@"control.center.power");
  [v5 setAccessibilityLabel:v6];

  [v5 setIsAccessibilityElement:1];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  objc_initWeak(&location, v5);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __79__CCUIHeaderPocketViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v12[3] = &unk_265119130;
  objc_copyWeak(&v13, &location);
  [v5 setAccessibilityActivateBlock:v12];
  v7 = [(CCUIHeaderPocketViewAccessibility *)self safeUIViewForKey:@"_sensorAttributionExpandedWrapperView"];
  v8 = [(CCUIHeaderPocketViewAccessibility *)self safeValueForKey:@"_sensorAttributionExpandedViewController"];
  objc_initWeak(&from, v8);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __79__CCUIHeaderPocketViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v9[3] = &unk_265119130;
  objc_copyWeak(&v10, &from);
  [v7 setAccessibilityViewIsModalBlock:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __79__CCUIHeaderPocketViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  objc_opt_class();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = __UIAccessibilityCastAsClass();

  [v3 performPrimaryAction];
  return 1;
}

uint64_t __79__CCUIHeaderPocketViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"isExpanded"];

  return v2;
}

@end