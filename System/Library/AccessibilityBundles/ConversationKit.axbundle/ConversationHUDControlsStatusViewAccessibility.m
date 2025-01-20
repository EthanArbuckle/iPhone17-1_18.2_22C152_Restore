@interface ConversationHUDControlsStatusViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityConversationDetailsView;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilitySetupVStack;
- (void)setupRootView;
@end

@implementation ConversationHUDControlsStatusViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ConversationKit.ConversationHUDControlsStatusView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ConversationHUDControlsStatusView", @"conversationDetailsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ConversationDetailsView", @"conversationTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ConversationDetailsView", @"conversationSubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationKit.ConversationHUDControlsStatusView", @"setupRootView", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)ConversationHUDControlsStatusViewAccessibility;
  [(ConversationHUDControlsStatusViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(ConversationHUDControlsStatusViewAccessibility *)self _accessibilitySetupVStack];
}

- (void)setupRootView
{
  v3.receiver = self;
  v3.super_class = (Class)ConversationHUDControlsStatusViewAccessibility;
  [(ConversationHUDControlsStatusViewAccessibility *)&v3 setupRootView];
  [(ConversationHUDControlsStatusViewAccessibility *)self _accessibilitySetupVStack];
  AXPerformBlockOnMainThreadAfterDelay();
}

void __63__ConversationHUDControlsStatusViewAccessibility_setupRootView__block_invoke(uint64_t a1)
{
  id argument = [*(id *)(a1 + 32) safeUIViewForKey:@"conversationDetailsView"];
  if ([argument _accessibilityViewIsVisible]) {
    UIAccessibilityPostNotification(*MEMORY[0x263F812F8], argument);
  }
}

- (void)_accessibilitySetupVStack
{
  objc_super v3 = [(ConversationHUDControlsStatusViewAccessibility *)self _accessibilityConversationDetailsView];
  uint64_t v4 = [v3 accessibilityTraits];
  uint64_t v5 = *MEMORY[0x263F1CEE8] | v4;
  v6 = accessibilityLocalizedString(@"show.call.details.hint");
  [v3 setAccessibilityHint:v6];

  [v3 setAccessibilityTraits:v5];
  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  v9 = __75__ConversationHUDControlsStatusViewAccessibility__accessibilitySetupVStack__block_invoke;
  v10 = &unk_265119FC8;
  objc_copyWeak(&v11, &location);
  [v3 _setAccessibilityLabelBlock:&v7];
  objc_msgSend(v3, "setIsAccessibilityElement:", 1, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __75__ConversationHUDControlsStatusViewAccessibility__accessibilitySetupVStack__block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained _accessibilityConversationDetailsView];
  uint64_t v5 = [v4 safeValueForKey:@"conversationTitleLabel"];
  v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  id v7 = objc_loadWeakRetained(v2);
  uint64_t v8 = [v7 _accessibilityConversationDetailsView];
  v9 = [v8 safeValueForKey:@"conversationSubtitleLabel"];
  v10 = __UIAccessibilityCastAsClass();

  id v11 = [v6 text];
  v14 = [v10 text];
  v12 = __UIAXStringForVariables();

  return v12;
}

- (id)_accessibilityConversationDetailsView
{
  return (id)[(ConversationHUDControlsStatusViewAccessibility *)self safeValueForKey:@"conversationDetailsView"];
}

@end