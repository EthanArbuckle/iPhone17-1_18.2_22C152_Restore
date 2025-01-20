@interface CKConversationListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityRetainsCustomRotorActionSetting;
- (BOOL)_axIsVerified;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityCustomActionGroupIdentifier;
- (id)_axFromString;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)updateContentsForConversation:(id)a3;
@end

@implementation CKConversationListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKConversationListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKConversationListCell" hasInstanceVariable:@"_fromLabel" withType:"CKLabel"];
  [v3 validateClass:@"CKConversationListCell" hasInstanceVariable:@"_dateLabel" withType:"CKDateLabel"];
  [v3 validateClass:@"CKConversationListCell" hasInstanceVariable:@"_summaryLabel" withType:"UILabel"];
  [v3 validateClass:@"CKConversationListCell" hasInstanceVariable:@"_closeButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCell", @"avatarView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCell", @"conversation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversationListCell", @"conversation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"shouldShowVerifiedCheckmark", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UILabel", @"text", "@", 0);
  [v3 validateClass:@"CKConversation"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"hasUnreadMessages", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"isMuted", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"chat", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"wantsLabelForDSDS", "B", 0);
  [v3 validateClass:@"IMCTSubscriptionUtilities"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"IMCTSubscriptionUtilities", @"sharedInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMCTSubscriptionUtilities", @"ctSubscriptionInfo", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMCTXPCServiceSubscriptionInfo", @"subscriptions", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CTXPCServiceSubscriptionContext", @"labelID", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CTXPCServiceSubscriptionContext", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMChat", @"lastAddressedSIMID", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"chat", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMChat", @"chatSummary", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  id v3 = [(CKConversationListCellAccessibility *)self safeValueForKey:@"conversation"];
  v4 = [(CKConversationListCellAccessibility *)self _axFromString];
  if ([(CKConversationListCellAccessibility *)self _axIsVerified])
  {
    v5 = accessibilityLocalizedString(@"conversation.verified");
  }
  else
  {
    v5 = 0;
  }
  v6 = [(CKConversationListCellAccessibility *)self safeValueForKey:@"_dateLabel"];
  v7 = [v6 accessibilityLabel];

  v8 = [(CKConversationListCellAccessibility *)self safeValueForKey:@"_summaryLabel"];
  v9 = [v8 safeStringForKey:@"text"];

  if ([v3 safeBoolForKey:@"wantsLabelForDSDS"])
  {
    v27 = v4;
    v10 = [v3 safeValueForKeyPath:@"chat.lastAddressedSIMID"];
    char v30 = 0;
    objc_opt_class();
    v11 = [NSClassFromString(&cfstr_Imctsubscripti.isa) safeValueForKeyPath:@"sharedInstance.ctSubscriptionInfo.subscriptions"];
    v12 = __UIAccessibilityCastAsClass();

    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __57__CKConversationListCellAccessibility_accessibilityLabel__block_invoke;
    v28[3] = &unk_265113300;
    id v29 = v10;
    id v13 = v10;
    v14 = objc_msgSend(v12, "ax_firstObjectUsingBlock:", v28);
    v15 = NSString;
    v16 = accessibilityLocalizedString(@"sim.type");
    v17 = [v14 safeStringForKey:@"label"];
    v18 = objc_msgSend(v15, "stringWithFormat:", v16, v17);

    v4 = v27;
  }
  else
  {
    v18 = 0;
  }
  int v19 = [v3 safeBoolForKey:@"hasUnreadMessages"];
  int v20 = [v3 safeBoolForKey:@"isMuted"];
  v21 = [v3 safeValueForKeyPath:@"chat.chatSummary"];

  if (v21)
  {
    v22 = accessibilityLocalizedString(@"apple.intelligence.summary");
    if (v20) {
      goto LABEL_9;
    }
LABEL_12:
    v23 = 0;
    if (!v19) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  v22 = 0;
  if (!v20) {
    goto LABEL_12;
  }
LABEL_9:
  v23 = accessibilityLocalizedString(@"conversation.muted");
  if (!v19)
  {
LABEL_10:
    v24 = 0;
    goto LABEL_14;
  }
LABEL_13:
  v24 = accessibilityLocalizedString(@"unread.messages");
LABEL_14:
  v25 = __UIAXStringForVariables();

  return v25;
}

uint64_t __57__CKConversationListCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 safeStringForKey:@"labelID"];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 1;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKConversationListCellAccessibility;
  [(CKConversationListCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CKConversationListCellAccessibility *)self safeValueForKey:@"avatarView"];
  [v3 setAccessibilityElementsHidden:1];

  uint64_t v4 = [(CKConversationListCellAccessibility *)self safeValueForKey:@"_closeButton"];
  [v4 setIsAccessibilityElement:0];
}

- (id)accessibilityUserInputLabels
{
  v2 = [(CKConversationListCellAccessibility *)self _axFromString];
  id v3 = MEMORY[0x245646F40]();

  return v3;
}

- (void)updateContentsForConversation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCellAccessibility;
  [(CKConversationListCellAccessibility *)&v4 updateContentsForConversation:a3];
  [(CKConversationListCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (id)_axFromString
{
  v2 = [(CKConversationListCellAccessibility *)self safeValueForKey:@"_fromLabel"];
  id v3 = [v2 accessibilityLabel];

  objc_super v4 = UIAXApplyPhoneContextTokenToString();

  return v4;
}

- (BOOL)_axIsVerified
{
  v2 = [(CKConversationListCellAccessibility *)self safeValueForKey:@"conversation"];
  char v3 = [v2 safeBoolForKey:@"shouldShowVerifiedCheckmark"];

  return v3;
}

@end