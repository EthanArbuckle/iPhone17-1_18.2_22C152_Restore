@interface STUIStatusBarCellularItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6;
- (STUIStatusBarCellularItemAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateDataNetworkViewWithEntry:(void *)a1;
@end

@implementation STUIStatusBarCellularItemAccessibility

- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6
{
  BOOL v6 = a6;
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarCellularItemAccessibility;
  id v10 = a5;
  id v11 = a3;
  LOBYTE(v6) = [(STUIStatusBarCellularItemAccessibility *)&v14 _updateSignalView:v11 withUpdate:a4 entry:v10 forceShowingDisabledSignalBars:v6];
  v12 = objc_msgSend(v10, "safeStringForKey:", @"string", v14.receiver, v14.super_class);
  [v11 _accessibilitySetRetainedValue:v12 forKey:@"AXStatusBarSignalViewServiceKey"];

  [v11 _accessibilitySetRetainedValue:@"status.signal.bars" forKey:@"AccessibilityStatusBarSignalViewLabelKey"];
  -[STUIStatusBarCellularItemAccessibility _axAnnotateDataNetworkViewWithEntry:](self, v10);

  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v16.receiver = self;
  v16.super_class = (Class)STUIStatusBarCellularItemAccessibility;
  [(STUIStatusBarCellularItemAccessibility *)&v16 _accessibilityLoadAccessibilityInformation];
  v3 = [(STUIStatusBarCellularItemAccessibility *)self safeUIViewForKey:@"signalView"];
  [v3 _accessibilitySetRetainedValue:@"status.signal.bars" forKey:@"AccessibilityStatusBarSignalViewLabelKey"];
  v4 = [(STUIStatusBarCellularItemAccessibility *)self safeValueForKey:@"callForwardingView"];
  [v4 setIsAccessibilityElement:1];
  v5 = accessibilityLocalizedString(@"status.call.forward.icon");
  [v4 setAccessibilityLabel:v5];

  BOOL v6 = [(STUIStatusBarCellularItemAccessibility *)self safeValueForKey:@"networkTypeView"];
  [v6 _accessibilitySetBoolValue:1 forKey:@"AccessibilityStatusBarStringIsDataNetwork"];
  v7 = [(id)MEMORY[0x245665C20](@"STUIStatusBarCellularItem") safeValueForKey:@"typeDisplayIdentifier"];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  objc_super v14 = __Block_byref_object_dispose_;
  id v15 = 0;
  id v9 = v7;
  AXPerformSafeBlock();
  id v8 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  -[STUIStatusBarCellularItemAccessibility _axAnnotateDataNetworkViewWithEntry:](self, v8);
}

- (void)_axAnnotateDataNetworkViewWithEntry:(void *)a1
{
  if (a1)
  {
    AXAnnotateDataNetworkViewWithType([a2 safeIntegerForKey:@"type"]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [a1 safeValueForKey:@"networkTypeView"];
    [v3 setAccessibilityLabel:v4];
  }
}

uint64_t __84__STUIStatusBarCellularItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) entryForDisplayItemWithIdentifier:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarCellularItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBarStringView" isKindOfClass:@"UILabel"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"STUIStatusBarCellularItem", @"typeDisplayIdentifier", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarCellularItem", @"signalView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarCellularItem", @"callForwardingView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarCellularItem", @"networkTypeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarCellularItem", @"_updateSignalView:withUpdate:entry:forceShowingDisabledSignalBars:", "@", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarCellularItem", @"entryForDisplayItemWithIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarDataCellularEntry", @"string", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STStatusBarDataCellularEntry", @"type", "q", 0);
}

- (STUIStatusBarCellularItemAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarCellularItemAccessibility;
  v2 = [(STUIStatusBarCellularItemAccessibility *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(STUIStatusBarCellularItemAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  }
  return v3;
}

@end