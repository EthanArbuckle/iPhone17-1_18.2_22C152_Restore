@interface STUIStatusBarIndicatorItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (STUIStatusBarIndicatorItemAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation STUIStatusBarIndicatorItemAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)STUIStatusBarIndicatorItemAccessibility;
  [(STUIStatusBarIndicatorItemAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  v3 = [(STUIStatusBarIndicatorItemAccessibility *)self safeValueForKey:@"displayItems"];
  v9 = __UIAccessibilityCastAsClass();

  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [v9 allValues];
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    uint64_t v6 = MEMORY[0x263EF8330];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "safeValueForKey:", @"view", v9);
        [v8 setIsAccessibilityElement:1];
        objc_initWeak(&location, self);
        v11[0] = v6;
        v11[1] = 3221225472;
        v11[2] = __85__STUIStatusBarIndicatorItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v11[3] = &unk_26515C9C8;
        objc_copyWeak(&v12, &location);
        [v8 _setAccessibilityLabelBlock:v11];
        objc_destroyWeak(&v12);
        objc_destroyWeak(&location);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v4);
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBarIndicatorItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"STUIStatusBarIndicatorQuietModeItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorStudentItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorRotationLockItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorAirplaneModeItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorTTYItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorAssistantItem"];
  [v3 validateClass:@"STUIStatusBarVPNItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorLiquidDetectionItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorAirPlayItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorCarPlayItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorAlarmItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorLocationItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorSatelliteItem"];
  [v3 validateClass:@"STUIStatusBarIndicatorItem" isKindOfClass:@"STUIStatusBarItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarItem", @"displayItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarDisplayItem", @"view", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarIndicatorQuietModeItem", @"focusName", "@", 0);
}

id __85__STUIStatusBarIndicatorItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  MEMORY[0x245665C20](@"STUIStatusBarIndicatorQuietModeItem");
  char isKindOfClass = objc_opt_isKindOfClass();

  id v4 = objc_loadWeakRetained(v1);
  uint64_t v5 = v4;
  if (isKindOfClass)
  {
    uint64_t v6 = [v4 safeStringForKey:@"focusName"];
    v7 = v5;
  }
  else
  {
    v8 = &unk_26F801C50;
    if (!v4) {
      v8 = 0;
    }
    id v9 = v8;
    id v10 = objc_loadWeakRetained(v1);
    v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    v7 = [v9 objectForKey:v12];

    id v13 = objc_loadWeakRetained(v1);
    long long v14 = [v13 accessibilityLabel];
    long long v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      accessibilityLocalizedString(v7);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v6 = v16;
  }

  return v6;
}

- (STUIStatusBarIndicatorItemAccessibility)init
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarIndicatorItemAccessibility;
  v2 = [(STUIStatusBarIndicatorItemAccessibility *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(STUIStatusBarIndicatorItemAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  }
  return v3;
}

@end