@interface NCClickInteractionPresentedControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation NCClickInteractionPresentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCClickInteractionPresentedControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCClickInteractionPresentedControl", @"_presentedView", "@", 0);
  [v3 validateClass:@"NCClickInteractionPresentedView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  if (AXProcessIsSpringBoard()) {
    [v3 validateClass:@"CSCombinedListViewController" hasInstanceVariable:@"_structuredListViewController" withType:"NCNotificationStructuredListViewController"];
  }
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NCClickInteractionPresentedControlAccessibility;
  return *MEMORY[0x263F1CEE8] | [(NCClickInteractionPresentedControlAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  objc_super v3 = [(NCClickInteractionPresentedControlAccessibility *)self safeValueForKey:@"_presentedView"];
  v4 = [v3 safeValueForKey:@"_titleLabel"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 text];

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [(NCClickInteractionPresentedControlAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_3 startWithSelf:1];
  objc_super v3 = [v2 _accessibilityViewController];
  v4 = [v3 safeValueForKey:@"_structuredListViewController"];
  char v5 = [v4 accessibilityPerformEscape];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return v5;
}

uint64_t __77__NCClickInteractionPresentedControlAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 _accessibilityViewController];
  MEMORY[0x2456680B0](@"CSCombinedListViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end