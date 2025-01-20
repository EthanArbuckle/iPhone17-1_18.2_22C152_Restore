@interface SFUnifiedBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (SFUnifiedBarAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityElements;
- (id)preferredFocusEnvironments;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SFUnifiedBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFUnifiedBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFUnifiedBar" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SFUnifiedTabBar"];
  [v3 validateClass:@"SFUnifiedBar" hasInstanceVariable:@"_squishedBarButton" withType:"UIButton"];
  [v3 validateClass:@"SFUnifiedBar" hasInstanceVariable:@"_squishedContentView" withType:"UIView"];
  [v3 validateClass:@"SFUnifiedTabBar" hasInstanceVariable:@"_squishedTitleContainer" withType:"SFUnifiedTabBarItemTitleContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedBar", @"_showsSquishedContent", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedBar", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedTabBar", @"searchField", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedBarAccessibility;
  [(SFUnifiedBarAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  id v3 = [(SFUnifiedBarAccessibility *)self safeValueForKey:@"_squishedBarButton"];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__SFUnifiedBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v6[3] = &unk_265135F90;
  objc_copyWeak(&v7, &location);
  [v3 _setIsAccessibilityElementBlock:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__SFUnifiedBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v4[3] = &unk_265135F40;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityValueBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

uint64_t __71__SFUnifiedBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained safeBoolForKey:@"_showsSquishedContent"];

  return v2;
}

id __71__SFUnifiedBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = objc_msgSend(WeakRetained, "safeArrayForKey:", @"subviews", 0);

  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        MEMORY[0x245655C80](@"SFUnifiedTabBar");
        if (objc_opt_isKindOfClass())
        {
          objc_super v9 = [v7 safeValueForKey:@"_squishedTitleContainer"];
          v8 = [v9 accessibilityValue];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (SFUnifiedBarAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFUnifiedBarAccessibility;
  uint64_t v3 = -[SFUnifiedBarAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3) {
    [(SFUnifiedBarAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }

  return v4;
}

- (id)accessibilityElements
{
  if ([(SFUnifiedBarAccessibility *)self safeBoolForKey:@"_showsSquishedContent"])
  {
    uint64_t v3 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v4 = [(SFUnifiedBarAccessibility *)self safeValueForKey:@"_squishedContentView"];
    uint64_t v5 = objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = self;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(SFUnifiedBarAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    char v16 = 0;
    objc_opt_class();
    long long v14 = v2;
    uint64_t v3 = __UIAccessibilityCastAsClass();
    uint64_t v4 = [v3 subviews];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_super v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          MEMORY[0x245655C80](@"SFUnifiedTabBar");
          if (objc_opt_isKindOfClass())
          {
            char v16 = 0;
            objc_opt_class();
            v10 = [v9 safeValueForKey:@"searchField"];
            long long v11 = __UIAccessibilityCastAsClass();

            if ([v11 isFirstResponder])
            {
              v21 = v11;
              long long v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];

              goto LABEL_15;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    uint64_t v2 = v14;
  }
  v15.receiver = v2;
  v15.super_class = (Class)SFUnifiedBarAccessibility;
  long long v12 = [(SFUnifiedBarAccessibility *)&v15 preferredFocusEnvironments];
LABEL_15:

  return v12;
}

@end