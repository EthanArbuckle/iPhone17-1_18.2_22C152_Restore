@interface HUQuickControlStepperSegmentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityContainerView;
- (id)_accessibilitySummaryView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation HUQuickControlStepperSegmentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlStepperSegmentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlStepperSegmentView", @"isSegmentViewHighlighted", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlStepperSegmentView", @"titleLabel", "@", 0);
  [v3 validateClass:@"HUQuickControlContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlContainerView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlContainerView", @"summaryView", "@", 0);
}

- (unint64_t)accessibilityTraits
{
  int v2 = [(HUQuickControlStepperSegmentViewAccessibility *)self safeBoolForKey:@"isSegmentViewHighlighted"];
  uint64_t v3 = *MEMORY[0x263F1CF38];
  if (!v2) {
    uint64_t v3 = 0;
  }
  return *MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8] | v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  int v2 = [(HUQuickControlStepperSegmentViewAccessibility *)self safeValueForKey:@"titleLabel"];
  uint64_t v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  if ([(HUQuickControlStepperSegmentViewAccessibility *)self safeBoolForKey:@"isHighlighted"])
  {
    uint64_t v3 = [(HUQuickControlStepperSegmentViewAccessibility *)self _accessibilitySummaryView];
    v4 = [v3 accessibilityValue];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)HUQuickControlStepperSegmentViewAccessibility;
    v4 = [(HUQuickControlStepperSegmentViewAccessibility *)&v6 accessibilityValue];
  }

  return v4;
}

- (id)_accessibilityContainerView
{
  return (id)[(HUQuickControlStepperSegmentViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_9 startWithSelf:0];
}

uint64_t __76__HUQuickControlStepperSegmentViewAccessibility__accessibilityContainerView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2456509F0](@"HUQuickControlContainerView");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilitySummaryView
{
  id v2 = [(HUQuickControlStepperSegmentViewAccessibility *)self _accessibilityContainerView];
  uint64_t v3 = [v2 safeValueForKey:@"summaryView"];

  return v3;
}

@end