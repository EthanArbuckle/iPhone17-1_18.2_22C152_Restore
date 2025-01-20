@interface CCUIConnectivityModuleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axCreateMockElement;
- (id)_axElements;
- (id)_axMockElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setAXMockElement:(id)a3;
- (void)setGridSizeClass:(int64_t)a3;
- (void)setResizing:(BOOL)a3;
@end

@implementation CCUIConnectivityModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIConnectivityModuleViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axMockElement
{
}

- (void)_setAXMockElement:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CCUIConnectivityModuleViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIConnectivityModuleViewController", @"orderedButtonViewControllers", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIConnectivityModuleViewController", @"_isExpanded", "B", 0);
  [v3 validateClass:@"CCUIConnectivityButtonViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"CCUILabeledRoundButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUILabeledRoundButton", @"buttonView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIConnectivityModuleViewController", @"setResizing:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CCUIConnectivityModuleViewController", @"setGridSizeClass:", "v", "q", 0);
}

- (void)setResizing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIConnectivityModuleViewControllerAccessibility;
  [(CCUIConnectivityModuleViewControllerAccessibility *)&v4 setResizing:a3];
  [(CCUIConnectivityModuleViewControllerAccessibility *)self _setAXMockElement:0];
}

- (void)setGridSizeClass:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CCUIConnectivityModuleViewControllerAccessibility;
  [(CCUIConnectivityModuleViewControllerAccessibility *)&v4 setGridSizeClass:a3];
  [(CCUIConnectivityModuleViewControllerAccessibility *)self _setAXMockElement:0];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIConnectivityModuleViewControllerAccessibility;
  [(CCUIConnectivityModuleViewControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CCUIConnectivityModuleViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __95__CCUIConnectivityModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2651173A8;
  objc_copyWeak(&v5, &location);
  [v3 setAccessibilityElementsBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __95__CCUIConnectivityModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (([WeakRetained safeBoolForKey:@"_isExpanded"] & 1) != 0
    || AXDoesRequestingClientDeserveAutomation())
  {
    v2 = 0;
  }
  else
  {
    v2 = [WeakRetained _axElements];
  }

  return v2;
}

- (id)_axElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  objc_super v4 = [(CCUIConnectivityModuleViewControllerAccessibility *)self safeArrayForKey:@"orderedButtonViewControllers"];
  if ((unint64_t)[v4 count] < 5)
  {
    id v11 = 0;
    goto LABEL_16;
  }
  v16 = self;
  for (uint64_t i = 0; i != 3; ++i)
  {
    v6 = [v4 objectAtIndexedSubscript:i];
    objc_super v7 = [v6 safeValueForKey:@"view"];
    MEMORY[0x245648230](@"CCUILabeledRoundButton");
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      v9 = @"buttonView";
LABEL_8:
      v10 = [v8 safeValueForKey:v9];
      goto LABEL_9;
    }
    MEMORY[0x245648230](@"CCUIAirDropModuleViewController");
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (MEMORY[0x245648230](@"CCUIWiFiModuleViewController"), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = v6;
      v9 = @"buttonViewForCollapsedConnectivityModule";
      goto LABEL_8;
    }
    v10 = 0;
LABEL_9:
    [v3 axSafelyAddObject:v10];
  }
  v12 = [(CCUIConnectivityModuleViewControllerAccessibility *)v16 _axMockElement];

  if (!v12)
  {
    v13 = [(CCUIConnectivityModuleViewControllerAccessibility *)v16 _axCreateMockElement];
    [(CCUIConnectivityModuleViewControllerAccessibility *)v16 _setAXMockElement:v13];
  }
  v14 = [(CCUIConnectivityModuleViewControllerAccessibility *)v16 _axMockElement];
  [v3 addObject:v14];

  id v11 = v3;
LABEL_16:

  return v11;
}

- (id)_axCreateMockElement
{
  id v3 = [(CCUIConnectivityModuleViewControllerAccessibility *)self safeUIViewForKey:@"view"];
  objc_super v4 = [(CCUIConnectivityModuleViewControllerAccessibility *)self safeArrayForKey:@"orderedButtonViewControllers"];
  id v5 = (void *)[objc_alloc(MEMORY[0x263F1C3A8]) initWithAccessibilityContainer:v3];
  v6 = [v4 objectAtIndexedSubscript:3];
  objc_super v7 = [v6 safeValueForKeyPath:@"view"];

  v8 = [v4 objectAtIndexedSubscript:2];
  MEMORY[0x245648230](@"CCUIWiFiModuleViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([v4 objectAtIndexedSubscript:2],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 safeValueForKey:@"buttonViewForCollapsedConnectivityModule"],
        id v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    [v11 accessibilityFrame];
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    [v7 accessibilityFrame];
    double v13 = v16 + v16;
    [v7 accessibilityFrame];
    double v15 = v17 + v17;
  }
  [v7 accessibilityFrame];
  double v19 = v18;
  double v21 = v20;
  v22 = accessibilityLocalizedString(@"control.center.module.more.controls");
  [v5 setAccessibilityLabel:v22];

  v23 = accessibilityLocalizedString(@"control.center.module.expand.hint");
  [v5 setAccessibilityHint:v23];

  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  [v5 setIsAccessibilityElement:1];
  [v5 _accessibilitySetAdditionalElementOrderedLast:1];
  objc_msgSend(v5, "setAccessibilityFrame:", v19, v21, v13, v15);

  return v5;
}

@end