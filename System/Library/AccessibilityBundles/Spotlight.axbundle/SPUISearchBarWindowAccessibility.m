@interface SPUISearchBarWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIgnoresStatusBarFrame;
- (BOOL)accessibilityElementsHidden;
- (SPUISearchBarWindowAccessibility)init;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)accessibilityElementsHidden;
- (void)dealloc;
@end

@implementation SPUISearchBarWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SPUISearchBarWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (SPUISearchBarWindowAccessibility)init
{
  v4.receiver = self;
  v4.super_class = (Class)SPUISearchBarWindowAccessibility;
  v2 = [(SPUISearchBarWindowAccessibility *)&v4 init];
  [(SPUISearchBarWindowAccessibility *)v2 _accessibilityLoadAccessibilityInformation];

  return v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)SPUISearchBarWindowAccessibility;
  [(SPUISearchBarWindowAccessibility *)&v6 _accessibilityLoadAccessibilityInformation];
  v3 = [MEMORY[0x263F22968] server];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__SPUISearchBarWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_265153020;
  v5[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__SPUISearchBarWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_282;
  v4[3] = &unk_265153048;
  v4[4] = self;
  [v3 registerSpringBoardActionHandler:v5 withIdentifierCallback:v4];

  AXPerformBlockAsynchronouslyOnMainThread();
}

void __78__SPUISearchBarWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2 == 14)
  {
    objc_super v6 = AXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_242559000, v6, OS_LOG_TYPE_INFO, "Spotlight visible change: %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    v8 = [v5 objectForKeyedSubscript:@"isVisible"];
    objc_msgSend(v7, "_accessibilitySetBoolValue:forKey:", objc_msgSend(v8, "BOOLValue"), @"isSpotlightVisible");
  }
}

void __78__SPUISearchBarWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_282(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_super v4 = AXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_242559000, v4, OS_LOG_TYPE_INFO, "Spotlight register: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _accessibilitySetRetainedValue:v3 forKey:@"actionHandlerIdentifier"];
}

void __78__SPUISearchBarWindowAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_287(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x263F22968] server];
  objc_msgSend(v1, "_accessibilitySetBoolValue:forKey:", objc_msgSend(v2, "isSpotlightVisible"), @"isSpotlightVisible");
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F22968] server];
  objc_super v4 = [(SPUISearchBarWindowAccessibility *)self _accessibilityValueForKey:@"actionHandlerIdentifier"];
  [v3 removeActionHandler:v4];

  v5.receiver = self;
  v5.super_class = (Class)SPUISearchBarWindowAccessibility;
  [(SPUISearchBarWindowAccessibility *)&v5 dealloc];
}

- (BOOL)_accessibilityIgnoresStatusBarFrame
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  char v3 = [(SPUISearchBarWindowAccessibility *)self _accessibilityBoolValueForKey:@"isSpotlightVisible"];
  objc_super v4 = AXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(SPUISearchBarWindowAccessibility *)v3 accessibilityElementsHidden];
  }

  if (v3) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SPUISearchBarWindowAccessibility;
  return [(SPUISearchBarWindowAccessibility *)&v6 accessibilityElementsHidden];
}

- (void)accessibilityElementsHidden
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_242559000, a2, OS_LOG_TYPE_DEBUG, "Spotlight visible status: %d", (uint8_t *)v2, 8u);
}

@end