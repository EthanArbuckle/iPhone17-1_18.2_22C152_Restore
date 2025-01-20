@interface CKTUConversationBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (id)_axConversationItem;
- (id)_axMessageTime;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)automationElements;
- (unint64_t)_axState;
- (unint64_t)accessibilityTraits;
@end

@implementation CKTUConversationBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTUConversationBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTUConversationBalloonView", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTUConversationBalloonView", @"subtitleLabel1", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTUConversationBalloonView", @"_currentCall", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTUConversationBalloonView", @"joinButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTUConversationBalloonView", @"_joinButtonTapped:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTUConversationBalloonView", @"state", "Q", 0);
  [v3 validateClass:@"TUCall"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUCall", @"callDuration", "d", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(CKTUConversationBalloonViewAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];

  if ([(CKTUConversationBalloonViewAccessibility *)self _axState] != 2)
  {
    v8 = [(CKTUConversationBalloonViewAccessibility *)self safeValueForKey:@"subtitleLabel1"];
    v10 = @"__AXStringForVariablesSentinel";
    uint64_t v5 = __UIAXStringForVariables();

    v4 = (void *)v5;
  }
  v9 = [(CKTUConversationBalloonViewAccessibility *)self _axMessageTime];
  v6 = __UIAXStringForVariables();

  return v6;
}

- (id)accessibilityValue
{
  if ([(CKTUConversationBalloonViewAccessibility *)self _axState] == 2
    && ([(CKTUConversationBalloonViewAccessibility *)self safeValueForKey:@"_currentCall"],
        (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    [v3 safeCGFloatForKey:@"callDuration"];
    uint64_t v5 = NSString;
    v6 = accessibilityLocalizedString(@"balloon.message.facetime.elapsed.time");
    v7 = AXDurationStringForDuration();
    v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)CKTUConversationBalloonViewAccessibility;
  unint64_t v3 = [(CKTUConversationBalloonViewAccessibility *)&v8 accessibilityTraits];
  v4 = [(CKTUConversationBalloonViewAccessibility *)self safeValueForKey:@"_currentCall"];
  uint64_t v5 = *MEMORY[0x263F1CF68];
  if (!v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 | v3;

  return v6;
}

- (id)accessibilityHint
{
  if ([(CKTUConversationBalloonViewAccessibility *)self _axState] == 1)
  {
    v2 = accessibilityLocalizedString(@"call.balloon.joinable.hint");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)accessibilityActivate
{
  if ([(CKTUConversationBalloonViewAccessibility *)self _axState] == 1)
  {
    unint64_t v3 = [(CKTUConversationBalloonViewAccessibility *)self safeValueForKey:@"joinButton"];
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __65__CKTUConversationBalloonViewAccessibility_accessibilityActivate__block_invoke;
    v10 = &unk_265112EA8;
    v11 = self;
    id v12 = v3;
    id v4 = v3;
    AXPerformSafeBlock();

    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CKTUConversationBalloonViewAccessibility;
    return [(CKTUConversationBalloonViewAccessibility *)&v6 accessibilityActivate];
  }
}

uint64_t __65__CKTUConversationBalloonViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _joinButtonTapped:*(void *)(a1 + 40)];
}

- (id)accessibilityCustomActions
{
  return 0;
}

- (id)automationElements
{
  char v9 = 0;
  objc_opt_class();
  unint64_t v3 = __UIAccessibilityCastAsClass();
  id v4 = [v3 subviews];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKTUConversationBalloonViewAccessibility;
    id v5 = [(CKTUConversationBalloonViewAccessibility *)&v8 automationElements];
  }
  objc_super v6 = v5;

  return v6;
}

- (id)_axMessageTime
{
  v2 = [(CKTUConversationBalloonViewAccessibility *)self _axConversationItem];
  objc_opt_class();
  unint64_t v3 = [v2 safeValueForKey:@"time"];
  id v4 = __UIAccessibilityCastAsClass();

  id v5 = AXDateStringForFormat();

  return v5;
}

- (id)_axConversationItem
{
  return (id)[(CKTUConversationBalloonViewAccessibility *)self safeValueForKeyPath:@"_axChatItemForBalloon.IMChatItem._item"];
}

- (unint64_t)_axState
{
  return [(CKTUConversationBalloonViewAccessibility *)self safeUnsignedIntegerForKey:@"state"];
}

@end