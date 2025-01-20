@interface RootNavigationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axCurrentDayViewMode;
- (id)_compactMonthDividedListSwitchBarButtonItem;
- (id)_listViewSwitchBarButtonItem;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)todayPressed;
@end

@implementation RootNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RootNavigationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"RootNavigationController" isKindOfClass:@"UINavigationController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RootNavigationController", @"todayPressed", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RootNavigationController", @"_compactMonthDividedListSwitchBarButtonItem", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RootNavigationController", @"_listViewSwitchBarButtonItem", "@", 0);
  [v3 validateClass:@"RootNavigationController" hasInstanceVariable:@"_listToggleBarButtonItem" withType:"UIBarButtonItem"];
  [v3 validateClass:@"RootNavigationController" hasInstanceVariable:@"_dividedMonthToggleBarButtonItem" withType:"UIBarButtonItem"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)RootNavigationControllerAccessibility;
  [(RootNavigationControllerAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(RootNavigationControllerAccessibility *)self safeValueForKey:@"_listToggleBarButtonItem"];
  v4 = accessibilityLocalizedString(@"list.button");
  [v3 setAccessibilityLabel:v4];

  v5 = [(RootNavigationControllerAccessibility *)self safeValueForKey:@"_dividedMonthToggleBarButtonItem"];
  v6 = accessibilityLocalizedString(@"list.button");
  [v5 setAccessibilityLabel:v6];
}

- (void)todayPressed
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(RootNavigationControllerAccessibility *)self topViewController];
  [v3 _accessibilitySetBoolValue:1 forKey:@"_AXShouldFocusOnTodayStorageKey"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [v3 childViewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) _accessibilitySetBoolValue:1 forKey:@"_AXShouldFocusOnTodayStorageKey"];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v11.receiver = self;
  v11.super_class = (Class)RootNavigationControllerAccessibility;
  [(RootNavigationControllerAccessibility *)&v11 todayPressed];
  v10 = v3;
  id v9 = v3;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __53__RootNavigationControllerAccessibility_todayPressed__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) _accessibilityRemoveValueForKey:@"_AXShouldFocusOnTodayStorageKey"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "childViewControllers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _accessibilityRemoveValueForKey:@"_AXShouldFocusOnTodayStorageKey"];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_compactMonthDividedListSwitchBarButtonItem
{
  v5.receiver = self;
  v5.super_class = (Class)RootNavigationControllerAccessibility;
  v2 = [(RootNavigationControllerAccessibility *)&v5 _compactMonthDividedListSwitchBarButtonItem];
  uint64_t v3 = accessibilityLocalizedString(@"list.button");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

- (id)_axCurrentDayViewMode
{
  unint64_t v2 = [(RootNavigationControllerAccessibility *)self safeIntegerForKey:@"currentDayViewMode"];
  if (v2 <= 2)
  {
    uint64_t v3 = accessibilityLocalizedString(off_265132010[v2]);
  }

  return v3;
}

- (id)_listViewSwitchBarButtonItem
{
  v8.receiver = self;
  v8.super_class = (Class)RootNavigationControllerAccessibility;
  uint64_t v3 = [(RootNavigationControllerAccessibility *)&v8 _listViewSwitchBarButtonItem];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__RootNavigationControllerAccessibility__listViewSwitchBarButtonItem__block_invoke;
  v5[3] = &unk_265131FF0;
  objc_copyWeak(&v6, &location);
  [v3 _setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

id __69__RootNavigationControllerAccessibility__listViewSwitchBarButtonItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = [WeakRetained _axCurrentDayViewMode];

  return v2;
}

@end