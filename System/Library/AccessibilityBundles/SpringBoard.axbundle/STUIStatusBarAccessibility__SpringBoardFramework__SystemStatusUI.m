@interface STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axElementWithinFocused;
- (id)_accessibilityMultitaskingButtonContainer;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5;
@end

@implementation STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI;
  [(STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI *)&v7 _accessibilityLoadAccessibilityInformation];
  v3 = [(STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI *)self _accessibilityMultitaskingButtonContainer];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 _accessibilityViewController];
    v6 = [v5 safeValueForKey:@"dotsView"];

    [v6 setAccessibilityContainer:self];
  }
}

- (id)_accessibilityMultitaskingButtonContainer
{
  v2 = [(STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI *)self _accessibilityWindow];
  v3 = [v2 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_2];

  v4 = [v3 firstObject];

  return v4;
}

- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI;
  [(STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI *)&v13 _updateDisplayedItemsWithData:v8 styleAttributes:a4 extraAnimations:a5];
  if (!_updateDisplayedItemsWithData_styleAttributes_extraAnimations__entriesToMonitor)
  {
    uint64_t v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFFA08]), "initWithObjects:", @"backgroundActivityEntry", @"backNavigationEntry", @"forwardNavigationEntry", 0);
    v10 = (void *)_updateDisplayedItemsWithData_styleAttributes_extraAnimations__entriesToMonitor;
    _updateDisplayedItemsWithData_styleAttributes_extraAnimations__entriesToMonitor = v9;
  }
  if (v8)
  {
    v11 = [v8 safeSetForKey:@"existingEntryKeys"];
    int v12 = [v11 intersectsSet:_updateDisplayedItemsWithData_styleAttributes_extraAnimations__entriesToMonitor];

    if (v12) {
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"STUIStatusBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBWindowScene", @"recordingIndicatorManager", "@", 0);
  [v3 validateClass:@"SBRecordingIndicatorManager" hasInstanceVariable:@"_recordingIndicatorWindow" withType:"UIWindow"];
  if (NSClassFromString(&cfstr_Stuistatusbara_0.isa)) {
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBarAccessibility", @"_axElementWithinFocused", "B", 0);
  }
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBTopAffordanceViewController", @"dotsView", "@", 0);
  [v3 validateClass:@"STUIStatusBar" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SBTopAffordanceViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"STUIStatusBar", @"_updateDisplayedItemsWithData:styleAttributes:extraAnimations:", "v", "@", "@", "@", 0);
}

- (id)accessibilityElements
{
  if (AXProcessIsSpringBoard() && AXDeviceIsD7x() && UIAccessibilityIsVoiceOverRunning())
  {
    id v3 = [(id)*MEMORY[0x263F1D020] _accessibilityStatusBarElements:1 sorted:1];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    v14.receiver = self;
    v14.super_class = (Class)STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI;
    v5 = [(STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI *)&v14 accessibilityElements];
    [v4 axSafelyAddObjectsFromArray:v5];

    if (![v4 count])
    {
      objc_opt_class();
      v6 = __UIAccessibilityCastAsClass();
      objc_super v7 = [v6 subviews];
      [v4 axSafelyAddObjectsFromArray:v7];
    }
    if ([v4 count])
    {
      id v8 = AXWindowScene(@"activeDisplayWindowScene");
      uint64_t v9 = [v8 safeValueForKey:@"recordingIndicatorManager"];
      v10 = [v9 safeValueForKey:@"_recordingIndicatorWindow"];
      [v4 axSafelyAddObject:v10];

      v11 = [(STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI *)self _accessibilityMultitaskingButtonContainer];
      [v4 axSafelyAddObject:v11];
    }
    if ([v4 count]) {
      int v12 = v4;
    }
    else {
      int v12 = 0;
    }
    id v3 = v12;
  }

  return v3;
}

- (BOOL)_axElementWithinFocused
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI *)self _accessibilityMultitaskingButtonContainer];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 _accessibilityViewController];
    v6 = [v5 safeValueForKey:@"dotsView"];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    objc_super v7 = _UIAccessibilityFocusedElements();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          if (*(void **)(*((void *)&v15 + 1) + 8 * i) == v6)
          {

            BOOL v12 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI;
  BOOL v12 = [(STUIStatusBarAccessibility__SpringBoardFramework__SystemStatusUI *)&v14 _axElementWithinFocused];
LABEL_13:

  return v12;
}

@end