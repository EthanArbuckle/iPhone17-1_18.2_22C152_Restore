@interface TUISystemInputAssistantViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)_isPredictionOrCandidateView:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (id)_accessibilityScannerGroupElements;
- (unint64_t)_accessibilityScannerGroupTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAddCurrentGroup:(id)a3 toElements:(id)a4;
- (void)_didTapExpandButton:(id)a3;
- (void)setShowsExpandableButtonBarItems:(BOOL)a3;
@end

@implementation TUISystemInputAssistantViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUISystemInputAssistantView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUISystemInputAssistantView", @"_didTapExpandButton:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUISystemInputAssistantView", @"setShowsExpandableButtonBarItems:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUISystemInputAssistantView", @"centerPageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUISystemInputAssistantPageView", @"expandButton", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)TUISystemInputAssistantViewAccessibility;
  [(TUISystemInputAssistantViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TUISystemInputAssistantViewAccessibility *)self safeValueForKeyPath:@"centerPageView.expandButton"];
  v4 = accessibilityLocalizedString(@"expand.toolbar");
  [v3 setAccessibilityLabel:v4];
}

- (void)_axAddCurrentGroup:(id)a3 toElements:(id)a4
{
  v10[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ((unint64_t)[v5 count] >= 2)
  {
    v9[0] = @"GroupElements";
    v9[1] = @"GroupTraits";
    v10[0] = v5;
    v10[1] = &unk_26F813698;
    v9[2] = @"GroupScanBehaviorTraits";
    v10[2] = &unk_26F8136B0;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];
LABEL_5:
    v8 = (void *)v7;
    [v6 addObject:v7];

    goto LABEL_6;
  }
  if ([v5 count] == 1)
  {
    uint64_t v7 = [v5 firstObject];
    goto LABEL_5;
  }
LABEL_6:
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  return 160;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (BOOL)_isPredictionOrCandidateView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)_accessibilityScannerGroupElements
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263F81198] defaultSwitchControlOptions];
  [v4 setShouldReturnScannerGroups:0];
  id v5 = [v4 leafNodePredicate];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __78__TUISystemInputAssistantViewAccessibility__accessibilityScannerGroupElements__block_invoke;
  v25[3] = &unk_26515FB80;
  v25[4] = self;
  id v19 = v5;
  id v26 = v19;
  [v4 setLeafNodePredicate:v25];
  v20 = v4;
  id v6 = [(TUISystemInputAssistantViewAccessibility *)self _accessibilityLeafDescendantsWithOptions:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    v10 = 0;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([(TUISystemInputAssistantViewAccessibility *)self _isPredictionOrCandidateView:v13])
        {
          id v14 = v13;

          [(TUISystemInputAssistantViewAccessibility *)self _axAddCurrentGroup:v10 toElements:v3];
          v10 = 0;
          v9 = v14;
        }
        else
        {
          if (!v10)
          {
            v10 = [MEMORY[0x263EFF980] array];
          }
          [v10 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  [(TUISystemInputAssistantViewAccessibility *)self _axAddCurrentGroup:v10 toElements:v3];
  [v20 setLeafNodePredicate:v19];
  [v20 setShouldReturnScannerGroups:1];
  v15 = [v9 _accessibilityLeafDescendantsWithOptions:v20];
  if ([v15 count])
  {
    id v16 = [v15 arrayByAddingObjectsFromArray:v3];
  }
  else
  {
    id v16 = v3;
  }
  v17 = v16;

  return v17;
}

uint64_t __78__TUISystemInputAssistantViewAccessibility__accessibilityScannerGroupElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _isPredictionOrCandidateView:v3]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }

  return v4;
}

- (void)setShowsExpandableButtonBarItems:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TUISystemInputAssistantViewAccessibility;
  [(TUISystemInputAssistantViewAccessibility *)&v4 setShowsExpandableButtonBarItems:a3];
  [(TUISystemInputAssistantViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_didTapExpandButton:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TUISystemInputAssistantViewAccessibility;
  [(TUISystemInputAssistantViewAccessibility *)&v3 _didTapExpandButton:a3];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __64__TUISystemInputAssistantViewAccessibility__didTapExpandButton___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _accessibilityFirstDescendant];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v1);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end