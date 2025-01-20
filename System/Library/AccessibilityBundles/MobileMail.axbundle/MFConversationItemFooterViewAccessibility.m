@interface MFConversationItemFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (id)_accessibilityConversationViewControllerForCell:(id)a3;
- (id)_accessibilityParentCell;
- (int64_t)accessibilityNavigationStyle;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityPerformLeadingAction;
- (void)_accessibilityUpdateLeadingActionTitle:(id)a3;
- (void)layoutSubviews;
@end

@implementation MFConversationItemFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFConversationItemFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFConversationItemFooterView", @"seeMoreButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFConversationItemFooterView", @"revealActionsButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFConversationItemFooterView", @"layoutSubviews", "v", 0);
  [v3 validateClass:@"MFConversationViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFExpandedMessageCell", @"messageViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessageViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFConversationItemFooterViewAccessibility", @"_accessibilityConversationViewControllerForCell:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFConversationItemFooterViewAccessibility", @"_accessibilityUpdateLeadingActionTitle:", "v", "@", 0);
  [v3 validateClass:@"ConversationViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v18.receiver = self;
  v18.super_class = (Class)MFConversationItemFooterViewAccessibility;
  [(MFConversationItemFooterViewAccessibility *)&v18 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFConversationItemFooterViewAccessibility *)self safeValueForKey:@"revealActionsButton"];
  v4 = accessibilityLocalizedString(@"reveal.more.button");
  [v3 setAccessibilityLabel:v4];

  objc_initWeak(&location, v3);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __87__MFConversationItemFooterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v15[3] = &unk_2651333F8;
  objc_copyWeak(&v16, &location);
  [v3 setAccessibilityActivateBlock:v15];
  v5 = [(MFConversationItemFooterViewAccessibility *)self safeValueForKey:@"seeMoreButton"];
  v6 = __UIAccessibilitySafeClass();

  if (_AXSAutomationEnabled())
  {
    v7 = [v6 titleLabel];
    [v7 bounds];
    double v9 = v8;

    [v6 bounds];
    objc_msgSend(v6, "_accessibilitySetFrameExpansion:", 0.0, (v10 - v9) * -0.5);
    [v6 accessibilitySetIdentification:@"AXAccessibilityUseAccessibilityFrameForHittest"];
  }
  v11 = [(MFConversationItemFooterViewAccessibility *)self _accessibilityParentCell];
  v12 = [(MFConversationItemFooterViewAccessibility *)self _accessibilityConversationViewControllerForCell:v11];
  v13 = [v12 _accessibilityTitleForLeadingActionWithCell:v11];
  v14 = accessibilitySubstituteReadPhonemeInString((uint64_t)v13);

  [(MFConversationItemFooterViewAccessibility *)self _accessibilityUpdateLeadingActionTitle:v14];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

uint64_t __87__MFConversationItemFooterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendActionsForControlEvents:64];

  return 1;
}

- (void)_accessibilityPerformLeadingAction
{
  id v3 = [(MFConversationItemFooterViewAccessibility *)self _accessibilityParentCell];
  v4 = [(MFConversationItemFooterViewAccessibility *)self _accessibilityConversationViewControllerForCell:v3];
  [v4 _accessibilityPerformLeadingActionWithCell:v3];
  v7 = v3;
  id v5 = v3;
  id v6 = v4;
  AXPerformBlockOnMainThreadAfterDelay();
}

void __79__MFConversationItemFooterViewAccessibility__accessibilityPerformLeadingAction__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityTitleForLeadingActionWithCell:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) _accessibilityUpdateLeadingActionTitle:v2];
}

- (void)_accessibilityUpdateLeadingActionTitle:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(MFConversationItemFooterViewAccessibility *)self safeValueForKey:@"revealActionsButton"];
  if ([v4 length])
  {
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    v7 = accessibilitySubstituteReadPhonemeInString((uint64_t)v4);
    double v8 = (void *)[v6 initWithName:v7 target:self selector:sel__accessibilityPerformLeadingAction];

    v10[0] = v8;
    double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [v5 setAccessibilityCustomActions:v9];
  }
}

- (id)_accessibilityConversationViewControllerForCell:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_Mfexpandedmess_0.isa);
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 safeValueForKey:@"messageViewController"];
    id v5 = [v4 safeValueForKey:@"delegate"];
  }
  else
  {
    id v5 = 0;
  }
  NSClassFromString(&cfstr_Conversationvi_0.isa);
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)_accessibilityParentCell
{
  return (id)[(MFConversationItemFooterViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_2 startWithSelf:1];
}

uint64_t __69__MFConversationItemFooterViewAccessibility__accessibilityParentCell__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mfconversation_4.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (int64_t)accessibilityNavigationStyle
{
  return 2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MFConversationItemFooterViewAccessibility;
  [(MFConversationItemFooterViewAccessibility *)&v3 layoutSubviews];
  [(MFConversationItemFooterViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end