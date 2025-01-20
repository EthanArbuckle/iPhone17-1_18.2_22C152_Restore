@interface CKPinnedConversationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityRetainsCustomRotorActionSetting;
- (id)_accessibilityCustomActionGroupIdentifier;
- (id)_axFromString;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
@end

@implementation CKPinnedConversationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKPinnedConversationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKPinnedConversationView", @"titleLabel", "@", 0);
  [v3 validateClass:@"CKPinnedConversationSummaryBubble"];
  [v3 validateClass:@"CKConversation"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"hasUnreadMessages", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"isMuted", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKPinnedConversationView", @"activityView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKPinnedConversationActivityView", @"activityItemViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKPinnedConversationSummaryBubble", @"summaryLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(CKPinnedConversationViewAccessibility *)self _axFromString];
  v4 = [(CKPinnedConversationViewAccessibility *)self safeValueForKey:@"conversation"];
  int v5 = [v4 safeBoolForKey:@"hasUnreadMessages"];
  if ([v4 safeBoolForKey:@"isMuted"])
  {
    v6 = accessibilityLocalizedString(@"conversation.muted");
  }
  else
  {
    v6 = 0;
  }
  if (v5)
  {
    v7 = [(CKPinnedConversationViewAccessibility *)self safeValueForKey:@"activityView"];
    v8 = [v7 safeValueForKey:@"activityItemViews"];
    v9 = objc_msgSend(v8, "ax_filteredArrayUsingBlock:", &__block_literal_global_5);
    v10 = [v9 firstObject];

    v11 = [v10 safeValueForKey:@"summaryLabel"];
    v12 = [v11 accessibilityLabel];

    v13 = accessibilityLocalizedString(@"unread.messages");
    v14 = __UIAXStringForVariables();
  }
  else
  {
    v14 = 0;
  }
  v17 = accessibilityLocalizedString(@"pinned.label");
  v15 = __UIAXStringForVariables();

  return v15;
}

uint64_t __59__CKPinnedConversationViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Ckpinnedconver_3.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 1;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)accessibilityUserInputLabels
{
  id v2 = [(CKPinnedConversationViewAccessibility *)self _axFromString];
  id v3 = MEMORY[0x245646F40]();

  return v3;
}

- (id)_axFromString
{
  id v2 = [(CKPinnedConversationViewAccessibility *)self safeValueForKey:@"titleLabel"];
  id v3 = [v2 accessibilityLabel];

  v4 = UIAXApplyPhoneContextTokenToString();

  return v4;
}

@end