@interface SummaryContentSummaryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)bookmarkButtonTapped;
@end

@implementation SummaryContentSummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.SummaryContentSummaryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SeymourUI.SummaryContentSummaryView" hasSwiftField:@"bookmarkButton" withSwiftType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.SummaryContentSummaryView", @"bookmarkButtonTapped", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)SummaryContentSummaryViewAccessibility;
  [(SummaryContentSummaryViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SummaryContentSummaryViewAccessibility *)self safeSwiftValueForKey:@"bookmarkButton"];
  uint64_t v4 = [v3 accessibilityTraits];
  if ((*MEMORY[0x263F1CF20] & ~v4) != 0) {
    v5 = @"add.button";
  }
  else {
    v5 = @"added.button";
  }
  v6 = accessibilityLocalizedString(v5);
  [v3 setAccessibilityLabel:v6];
}

- (void)bookmarkButtonTapped
{
  v2.receiver = self;
  v2.super_class = (Class)SummaryContentSummaryViewAccessibility;
  [(SummaryContentSummaryViewAccessibility *)&v2 bookmarkButtonTapped];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __62__SummaryContentSummaryViewAccessibility_bookmarkButtonTapped__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _accessibilityLoadAccessibilityInformation];
  id v2 = [*(id *)(a1 + 32) safeSwiftValueForKey:@"bookmarkButton"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v2);
}

@end