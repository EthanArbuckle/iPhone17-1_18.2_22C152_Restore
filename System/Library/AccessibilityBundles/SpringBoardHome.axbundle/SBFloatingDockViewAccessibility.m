@interface SBFloatingDockViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)accessibilityElementsHidden;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityRespondsToUserInteraction;
- (id)_accessibilityScannerGroupElements;
@end

@implementation SBFloatingDockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFloatingDockView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockView", @"userIconListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockView", @"recentIconListView", "@", 0);
}

- (BOOL)accessibilityPerformEscape
{
  v2 = AXSBFloatingDockControllerFromActiveDisplayWindowScene();
  int v3 = [v2 safeBoolForKey:@"_allowGestureRecognizers"];
  if (v3)
  {
    id v5 = v2;
    AXPerformSafeBlock();
  }
  return v3;
}

uint64_t __61__SBFloatingDockViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissFloatingDockIfPresentedAnimated:1 completionHandler:0];
}

- (BOOL)accessibilityElementsHidden
{
  v2 = [MEMORY[0x263F22968] server];
  char v3 = [v2 isScreenLockedWithPasscode:0];

  return v3;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)_accessibilityScannerGroupElements
{
  v31[2] = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263EFF980] array];
  v30[0] = @"GroupTraits";
  v30[1] = @"GroupElements";
  v31[0] = &unk_26F7F1EE8;
  v31[1] = v4;
  id v5 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
  id v22 = v3;
  [v3 addObject:v5];

  v6 = (void *)MEMORY[0x263EFF8C0];
  v7 = [(SBFloatingDockViewAccessibility *)self safeValueForKey:@"userIconListView"];
  v8 = [(SBFloatingDockViewAccessibility *)self safeValueForKey:@"recentIconListView"];
  v9 = objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 2, v7, v8);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v24;
    v14 = (void *)MEMORY[0x263EFFA68];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) _accessibilityScannerGroupElements];
        v17 = (void *)v16;
        if (v16) {
          v18 = (void *)v16;
        }
        else {
          v18 = v14;
        }
        id v19 = v18;

        v27[0] = @"GroupTraits";
        v27[1] = @"GroupElements";
        v28[0] = &unk_26F7F1EE8;
        v28[1] = v19;
        v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

        [v4 addObject:v20];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v12);
  }

  return v22;
}

@end