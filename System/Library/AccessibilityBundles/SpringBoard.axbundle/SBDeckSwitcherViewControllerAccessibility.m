@interface SBDeckSwitcherViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityNonVisibleElements:(BOOL)a3;
- (id)_accessibilityNonVisibleElementsAfterVisible;
- (id)_accessibilityNonVisibleElementsBeforeVisible;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation SBDeckSwitcherViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBDeckSwitcherViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBDeckSwitcherViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"SBDeckSwitcherViewController" isKindOfClass:@"SBFluidSwitcherViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"appLayouts", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFluidSwitcherViewController", @"_scrollToAppLayout:animated:alignment:completion:", "v", "@", "B", "q", "@?", 0);
  [v3 validateClass:@"SBDeckSwitcherViewController" hasInstanceVariable:@"_scrollView" withType:"SBAppSwitcherScrollView"];
  [v3 validateClass:@"SBAppSwitcherScrollView" isKindOfClass:@"UIScrollView"];
  [v3 validateClass:@"SBDeckSwitcherViewController" hasInstanceVariable:@"_visibleItemContainers" withType:"NSMutableDictionary"];
  [v3 validateClass:@"SBDeckSwitcherViewController" isKindOfClass:@"SBFluidSwitcherViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconModel", @"expectedIconForDisplayIdentifier:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SBIconController", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconController", @"model", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBAppLayout", @"itemForLayoutRole:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBDisplayItem", @"bundleIdentifier", "@", 0);
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [(SBDeckSwitcherViewControllerAccessibility *)self safeValueForKey:@"_visibleItemContainers"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [v2 allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        char v17 = 0;
        v8 = __UIAccessibilitySafeClass();
        uint64_t v12 = MEMORY[0x263EF8330];
        uint64_t v13 = 3221225472;
        v14 = __52__SBDeckSwitcherViewControllerAccessibility_dealloc__block_invoke;
        v15 = &unk_265153D50;
        id v16 = v8;
        id v9 = v8;
        AXPerformSafeBlock();
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)SBDeckSwitcherViewControllerAccessibility;
  [(SBDeckSwitcherViewControllerAccessibility *)&v11 dealloc];
}

uint64_t __52__SBDeckSwitcherViewControllerAccessibility_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:0];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SBDeckSwitcherViewControllerAccessibility;
  [(SBDeckSwitcherViewControllerAccessibility *)&v3 viewDidLoad];
  [(SBDeckSwitcherViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_accessibilityNonVisibleElements:(BOOL)a3
{
  BOOL v38 = a3;
  uint64_t v54 = *MEMORY[0x263EF8340];
  v33 = [(SBDeckSwitcherViewControllerAccessibility *)self safeArrayForKey:@"appLayouts"];
  objc_opt_class();
  objc_super v3 = [(SBDeckSwitcherViewControllerAccessibility *)self safeValueForKey:@"_visibleItemContainers"];
  v40 = __UIAccessibilityCastAsClass();

  v37 = [MEMORY[0x263EFF980] array];
  v34 = objc_msgSend(NSString, "stringWithFormat:", @"AXFakeElements-%d", v38);
  v35 = [(SBDeckSwitcherViewControllerAccessibility *)self _accessibilityValueForKey:v34];
  LOBYTE(v43) = 0;
  uint64_t v4 = [NSClassFromString(&cfstr_Sbiconcontroll.isa) safeValueForKey:@"sharedInstance"];
  uint64_t v5 = [v4 safeValueForKey:@"model"];
  v36 = __UIAccessibilitySafeClass();

  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v6 = [v33 reverseObjectEnumerator];
  v7 = [v6 allObjects];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v50;
    char v10 = v38;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v50 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v13 = [v40 allKeys];
        int v14 = [v13 containsObject:v12];

        if (v14)
        {
          if (v38) {
            goto LABEL_15;
          }
          goto LABEL_11;
        }
        if (v10)
        {
          v15 = [[SBAXFakeAppSwitcherAccessibilityElement alloc] initWithAccessibilityContainer:self];
          uint64_t v43 = 0;
          v44 = &v43;
          uint64_t v45 = 0x3032000000;
          v46 = __Block_byref_object_copy__3;
          v47 = __Block_byref_object_dispose__3;
          id v48 = 0;
          AXPerformSafeBlock();
          id v16 = (id)v44[5];
          _Block_object_dispose(&v43, 8);

          char v17 = [v16 safeStringForKey:@"bundleIdentifier"];
          uint64_t v43 = 0;
          v44 = &v43;
          uint64_t v45 = 0x3032000000;
          v46 = __Block_byref_object_copy__3;
          v47 = __Block_byref_object_dispose__3;
          id v48 = 0;
          id v41 = v36;
          id v42 = v17;
          AXPerformSafeBlock();
          id v18 = (id)v44[5];

          _Block_object_dispose(&v43, 8);
          long long v19 = [v18 accessibilityLabel];
          [(SBAXFakeAppSwitcherAccessibilityElement *)v15 setAccessibilityLabel:v19];

          [(SBAXFakeAppSwitcherAccessibilityElement *)v15 setAppLayout:v12];
          [(SBAXFakeAppSwitcherAccessibilityElement *)v15 setDeckSwitcherDelegate:self];
          [v37 addObject:v15];

LABEL_11:
          char v10 = 1;
          continue;
        }
        char v10 = 0;
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v53 count:16];
    }
    while (v8);
  }
LABEL_15:

  uint64_t v20 = [v37 count];
  if (v20 == [v35 count])
  {
    uint64_t v21 = [v37 count];
    v22 = v37;
    if (v21 < 1)
    {
LABEL_20:
      id v29 = v35;

      v30 = v29;
      goto LABEL_23;
    }
    uint64_t v23 = 0;
    while (1)
    {
      v24 = [v22 objectAtIndexedSubscript:v23];
      v25 = [v24 appLayout];
      v26 = [v35 objectAtIndexedSubscript:v23];
      v27 = [v26 appLayout];
      BOOL v28 = v25 == v27;

      if (!v28) {
        break;
      }
      ++v23;
      v22 = v37;
      if (v21 == v23) {
        goto LABEL_20;
      }
    }
  }
  v30 = v37;
  if (v37 != v35)
  {
    [(SBDeckSwitcherViewControllerAccessibility *)self _accessibilitySetRetainedValue:v37 forKey:v34];
    v30 = v37;
  }
LABEL_23:
  id v31 = v30;

  return v31;
}

uint64_t __78__SBDeckSwitcherViewControllerAccessibility__accessibilityNonVisibleElements___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) itemForLayoutRole:1];

  return MEMORY[0x270F9A758]();
}

uint64_t __78__SBDeckSwitcherViewControllerAccessibility__accessibilityNonVisibleElements___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) expectedIconForDisplayIdentifier:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_accessibilityNonVisibleElementsBeforeVisible
{
  return [(SBDeckSwitcherViewControllerAccessibility *)self _accessibilityNonVisibleElements:1];
}

- (id)_accessibilityNonVisibleElementsAfterVisible
{
  return [(SBDeckSwitcherViewControllerAccessibility *)self _accessibilityNonVisibleElements:0];
}

@end