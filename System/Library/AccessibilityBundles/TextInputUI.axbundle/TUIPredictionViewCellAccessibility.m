@interface TUIPredictionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (BOOL)_accessibilityIncludeRoleDescription;
- (BOOL)_axHideCell;
- (BOOL)_axIsAutoFillKey;
- (BOOL)_axIsSmartReply;
- (BOOL)_axIsTextEffectButton;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityRoleDescription;
- (id)_axTextSuggestionWithAction;
- (id)_childFocusViews;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilitySlotID;
- (void)_axActivateSpeaking:(id)a3;
@end

@implementation TUIPredictionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TUIPredictionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"UITextSuggestionWithAction"];
  [v3 validateClass:@"TUIPredictionViewCell" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_childFocusViews", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionViewCell", @"currentTextSuggestion", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextSuggestionWithAction", @"action", ":", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIResponder", @"showWritingTools:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TUIPredictionViewCell", @"_isSmartReplyCandidate:", "B", "@", 0);
}

- (unsigned)_accessibilitySlotID
{
  v2 = [(TUIPredictionViewCellAccessibility *)self _axCandidate];
  unsigned int v3 = [v2 slotID];

  return v3;
}

- (BOOL)_axHideCell
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    unsigned int v3 = [(TUIPredictionViewCellAccessibility *)self accessibilityLabel];
    if ([v3 length]
      || [(TUIPredictionViewCellAccessibility *)self _accessibilitySlotID])
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      BOOL v4 = ![(TUIPredictionViewCellAccessibility *)self _axIsTextEffectButton];
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return ![(TUIPredictionViewCellAccessibility *)self _axHideCell];
}

- (id)accessibilityLabel
{
  if ([(TUIPredictionViewCellAccessibility *)self _accessibilitySlotID])
  {
    id v3 = objc_alloc(MEMORY[0x263F21660]);
    BOOL v4 = accessibilityLocalizedString(@"proactive.suggestion");
    v5 = (void *)[v3 initWithString:v4];

    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[TUIPredictionViewCellAccessibility _accessibilitySlotID](self, "_accessibilitySlotID"));
    [v5 setAttribute:v6 forKey:*MEMORY[0x263F21830]];
  }
  else
  {
    if ([(TUIPredictionViewCellAccessibility *)self _axIsTextEffectButton])
    {
      v5 = accessibilityLocalizedString(@"open.text.effects");
      goto LABEL_16;
    }
    v6 = [(TUIPredictionViewCellAccessibility *)self safeUIViewForKey:@"normalLabel"];
    v7 = [(TUIPredictionViewCellAccessibility *)self safeUIViewForKey:@"morphingLabel"];
    v8 = [v6 safeValueForKey:@"text"];
    if ((![v8 length] || (objc_msgSend(v6, "_accessibilityViewIsVisible") & 1) == 0)
      && [v7 _accessibilityViewIsVisible])
    {
      uint64_t v9 = [v7 safeStringForKey:@"text"];

      v8 = (void *)v9;
    }
    if (![v8 length] && -[TUIPredictionViewCellAccessibility _axIsAutoFillKey](self, "_axIsAutoFillKey"))
    {
      uint64_t v10 = accessibilityLocalizedString(@"autofill.keyboard.button");

      v8 = (void *)v10;
    }
    if (![v8 length])
    {
      v11 = [(TUIPredictionViewCellAccessibility *)self _axTextSuggestionWithAction];
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__0;
      v24 = __Block_byref_object_dispose__0;
      id v25 = 0;
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __56__TUIPredictionViewCellAccessibility_accessibilityLabel__block_invoke;
      v18 = &unk_26515FAD0;
      id v19 = v11;
      AXPerformSafeBlock();
      id v12 = (id)v21[5];

      _Block_object_dispose(&v20, 8);
      v8 = v12;
    }
    v13 = objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet", v15, v16, v17, v18);
    v5 = [v8 stringByTrimmingCharactersInSet:v13];
  }
LABEL_16:

  return v5;
}

char *__56__TUIPredictionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  result = (char *)[*(id *)(a1 + 32) action];
  if (result == sel_showWritingTools_)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = accessibilityLocalizedString(@"text.assistant.keyboard.button");
    return (char *)MEMORY[0x270F9A758]();
  }
  return result;
}

- (unint64_t)accessibilityTraits
{
  if ([(TUIPredictionViewCellAccessibility *)self _axIsAutoFillKey]) {
    return *MEMORY[0x263F1CEE8];
  }
  id v3 = [(TUIPredictionViewCellAccessibility *)self _axTextSuggestionWithAction];
  if (v3)
  {

    return *MEMORY[0x263F1CEE8];
  }
  if ([(TUIPredictionViewCellAccessibility *)self _axIsTextEffectButton]) {
    return *MEMORY[0x263F1CEE8];
  }
  uint64_t v5 = *MEMORY[0x263F811F8];
  BOOL v6 = [(TUIPredictionViewCellAccessibility *)self _axIsAutocorrection];
  uint64_t v7 = *MEMORY[0x263F1CF38];
  if (!v6) {
    uint64_t v7 = 0;
  }
  return v7 | v5;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (BOOL)_accessibilityIncludeRoleDescription
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  if ([(TUIPredictionViewCellAccessibility *)self _axIsSmartReply])
  {
    v2 = accessibilityLocalizedString(@"smart.reply");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)_axIsTextEffectButton
{
  v2 = [(TUIPredictionViewCellAccessibility *)self _axCandidate];
  BOOL v3 = [v2 customInfoType] == 0x8000;

  return v3;
}

- (BOOL)_axIsAutoFillKey
{
  v2 = [(TUIPredictionViewCellAccessibility *)self _axCandidate];
  BOOL v3 = [v2 customInfoType] == 32;

  return v3;
}

- (BOOL)_axIsSmartReply
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void __53__TUIPredictionViewCellAccessibility__axIsSmartReply__block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = [v2 _axCandidate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 _isSmartReplyCandidate:v3];
}

- (id)_axTextSuggestionWithAction
{
  char v2 = [(TUIPredictionViewCellAccessibility *)self safeValueForKey:@"currentTextSuggestion"];
  MEMORY[0x245666FF0](@"UITextSuggestionWithAction");
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)_axActivateSpeaking:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F1C748] sharedInputModeController];
  uint64_t v6 = [v5 currentInputMode];
  char v7 = [v6 primaryLanguage];

  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2050000000;
  v8 = (void *)getSpeakTypingServicesClass_softClass;
  uint64_t v16 = getSpeakTypingServicesClass_softClass;
  if (!getSpeakTypingServicesClass_softClass)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __getSpeakTypingServicesClass_block_invoke;
    v12[3] = &unk_26515FB20;
    v12[4] = &v13;
    __getSpeakTypingServicesClass_block_invoke((uint64_t)v12);
    v8 = (void *)v14[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v13, 8);
  uint64_t v10 = [v9 sharedInstance];
  v11 = [(TUIPredictionViewCellAccessibility *)self accessibilityLabel];
  [v10 notifySpeakServicesToFeedbackQuickTypePrediction:v11 forCurrentInputMode:v7];
}

- (id)accessibilityCustomActions
{
  v9[1] = *MEMORY[0x263EF8340];
  if (_AXSQuickTypePredictionFeedbackEnabled() && UIAccessibilityIsSwitchControlRunning())
  {
    id v3 = objc_alloc(MEMORY[0x263F1C390]);
    id v4 = accessibilityLocalizedString(@"speak.prediction");
    uint64_t v5 = (void *)[v3 initWithName:v4 target:self selector:sel__axActivateSpeaking_];

    v9[0] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TUIPredictionViewCellAccessibility;
    uint64_t v6 = [(TUIPredictionViewCellAccessibility *)&v8 accessibilityCustomActions];
  }

  return v6;
}

- (id)_childFocusViews
{
  v7.receiver = self;
  v7.super_class = (Class)TUIPredictionViewCellAccessibility;
  id v3 = [(TUIPredictionViewCellAccessibility *)&v7 _childFocusViews];
  id v4 = (void *)[v3 mutableCopy];

  if ([(TUIPredictionViewCellAccessibility *)self _accessibilityIsFKARunningForFocusItem])id v5 = (id)MEMORY[0x263EFFA68]; {
  else
  }
    id v5 = v4;

  return v5;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

@end