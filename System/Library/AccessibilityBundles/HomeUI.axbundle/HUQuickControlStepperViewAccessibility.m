@interface HUQuickControlStepperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySelectedStepperSegment;
- (id)_accessibilitySummaryView;
- (void)_accessibilityAnnounceState;
- (void)_handleGesture:(id)a3;
@end

@implementation HUQuickControlStepperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlStepperView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlContainerView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlContainerView", @"summaryView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlStepperView", @"segmentViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlStepperView", @"_handleGesture:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlStepperView", @"selectedSegmentIndex", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlStepperSegmentView", @"isSegmentViewHighlighted", "B", 0);
}

- (id)_accessibilitySelectedStepperSegment
{
  objc_opt_class();
  id v3 = [(HUQuickControlStepperViewAccessibility *)self safeValueForKey:@"segmentViews"];
  v4 = __UIAccessibilityCastAsClass();

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __78__HUQuickControlStepperViewAccessibility__accessibilitySelectedStepperSegment__block_invoke;
  v7[3] = &unk_2651283F8;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __78__HUQuickControlStepperViewAccessibility__accessibilitySelectedStepperSegment__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 safeBoolForKey:@"isSegmentViewHighlighted"])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_handleGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlStepperViewAccessibility *)self safeValueForKey:@"selectedSegmentIndex"];
  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlStepperViewAccessibility;
  [(HUQuickControlStepperViewAccessibility *)&v7 _handleGesture:v4];

  v6 = [(HUQuickControlStepperViewAccessibility *)self safeValueForKey:@"selectedSegmentIndex"];
  if (v5 != v6) {
    AXPerformBlockOnMainThreadAfterDelay();
  }
}

uint64_t __57__HUQuickControlStepperViewAccessibility__handleGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityAnnounceState];
}

- (void)_accessibilityAnnounceState
{
  v2 = [(HUQuickControlStepperViewAccessibility *)self _accessibilitySummaryView];
  id v4 = [v2 accessibilityValue];

  if (v4)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x263F21660]) initWithString:v4];
    [v3 setAttribute:&unk_26F6D2A38 forKey:*MEMORY[0x263F216D8]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v3);
  }
}

- (id)_accessibilitySummaryView
{
  v2 = [(HUQuickControlStepperViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_10 startWithSelf:0];
  id v3 = [v2 safeValueForKey:@"summaryView"];

  return v3;
}

uint64_t __67__HUQuickControlStepperViewAccessibility__accessibilitySummaryView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456509F0](@"HUQuickControlContainerView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end