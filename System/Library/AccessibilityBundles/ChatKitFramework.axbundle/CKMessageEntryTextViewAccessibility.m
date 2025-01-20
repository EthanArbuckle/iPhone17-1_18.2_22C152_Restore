@interface CKMessageEntryTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsSMSPlaceholderVisible;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityGetValue;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_accessibleNonSupplementarySubviews;
- (id)_axCreateEmojiRotor;
- (id)_axEmojiCandidates;
- (id)_axEmojiCandidatesFromEmojiKit;
- (id)_axEmojiRotor;
- (id)_axTextRangeForRange:(_NSRange)a3;
- (id)accessibilityCustomRotors;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPlaceholderValue;
- (id)accessibilityTextualContext;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axRemoveElementFromEmojiCandidates:(id)a3;
- (void)_axReplaceEmojiWithElement:(id)a3;
- (void)_axSetEmojiCandidates:(id)a3;
- (void)_axSetEmojiRotor:(id)a3;
- (void)_axShowOverlayWithEmojiElement:(id)a3;
- (void)_axUpdateEmojiCandidates;
- (void)_startTextKit1EmojiDisplayUpdateTimer:(id)a3;
- (void)_stopTextKit1EmojiDisplayUpdateTimer:(id)a3;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)updateTextView;
@end

@implementation CKMessageEntryTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageEntryTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axEmojiRotor
{
}

- (void)_axSetEmojiRotor:(id)a3
{
}

- (id)_axEmojiCandidates
{
}

- (void)_axSetEmojiCandidates:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKMessageEntryTextView" isKindOfClass:@"EMKTextView"];
  [v3 validateClass:@"EMKTextView" isKindOfClass:@"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"text", "@", 0);
  [v3 validateClass:@"EMKTextView" hasInstanceVariable:@"_emojiConversionActive" withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMKTextView", @"personalizedEmojiTokenListForList:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMKTextView", @"_startTextKit1EmojiDisplayUpdateTimer:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMKTextView", @"_stopTextKit1EmojiDisplayUpdateTimer:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMKOverlayView", @"initWithView:anchorRect:emojiTokenList:selectionHandler:", "@", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "@?", 0);
  [v3 validateClass:@"EMKLayoutManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMKLayoutManager", @"attributes", "@", 0);
  [v3 validateClass:@"EMFEmojiToken"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMFEmojiToken", @"string", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMKEmojiTokenList", @"emojiTokenArray", "@", 0);
  [v3 validateClass:@"EMKTextView" hasInstanceVariable:@"_textKit2Controller" withType:"_EMKTextKit2Controller"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_EMKTextKit2Controller", @"replaceRange:withEmojiToken:language:", "v", "{_NSRange=QQ}", "@", "@", 0);
  [v3 validateClass:@"CKMessageEntryTextView" isKindOfClass:@"UITextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"_placeholderLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryContentView", @"conversation", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"sendingService", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMessage", @"__ck_isSMS", "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKConversation", @"displayName", "@", 0);
  [v3 validateClass:@"CKMessageEntryTextView" hasInstanceVariable:@"_placeholderLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryTextView", @"placeholderText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryTextView", @"updateTextView", "v", 0);
  [v3 validateClass:@"CKActionMenuWindow"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CKActionMenuWindow", @"sharedInstance", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(CKMessageEntryTextViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"messageBodyField"];

  if (v4)
  {
    v5 = accessibilityLocalizedString(@"text.message.content.view");
    if ([(CKMessageEntryTextViewAccessibility *)self _axIsSMSPlaceholderVisible])
    {
      v6 = accessibilityLocalizedString(@"sms.placeholder.label");
    }
    else
    {
      v8 = [(CKMessageEntryTextViewAccessibility *)self _axEmojiRotor];
      if (v8)
      {
        v6 = accessibilityLocalizedString(@"emoji.replacements.available");
      }
      else
      {
        v6 = 0;
      }
    }
    v7 = __UIAXStringForVariables();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_accessibilityGetValue
{
  if ([(CKMessageEntryTextViewAccessibility *)self _axIsSMSPlaceholderVisible])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKMessageEntryTextViewAccessibility;
    id v3 = [(CKMessageEntryTextViewAccessibility *)&v5 _accessibilityGetValue];
  }

  return v3;
}

- (id)accessibilityTextualContext
{
  return (id)*MEMORY[0x263F1CED0];
}

- (id)accessibilityHint
{
  v2 = [(CKMessageEntryTextViewAccessibility *)self _axEmojiCandidates];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    int v4 = accessibilityLocalizedString(@"emoji.replacements.hint");
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  v2 = [NSClassFromString(&cfstr_Ckactionmenuwi.isa) sharedInstance];
  uint64_t v3 = __UIAccessibilityCastAsClass();

  LODWORD(v2) = [v3 _accessibilityViewIsVisible] ^ 1;
  return (char)v2;
}

- (id)accessibilityCustomRotors
{
  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryTextViewAccessibility;
  uint64_t v3 = [(CKMessageEntryTextViewAccessibility *)&v7 accessibilityCustomRotors];
  int v4 = (void *)[v3 mutableCopy];

  if (!v4)
  {
    int v4 = [MEMORY[0x263EFF980] array];
  }
  objc_super v5 = [(CKMessageEntryTextViewAccessibility *)self _axEmojiRotor];
  [v4 axSafelyAddObject:v5];

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryTextViewAccessibility;
  [(CKMessageEntryTextViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  [(CKMessageEntryTextViewAccessibility *)self _axUpdateEmojiCandidates];
  uint64_t v3 = [(CKMessageEntryTextViewAccessibility *)self safeValueForKey:@"_placeholderLabel"];
  [v3 setIsAccessibilityElement:0];
}

- (id)accessibilityPlaceholderValue
{
  v2 = [(CKMessageEntryTextViewAccessibility *)self safeValueForKey:@"placeholderText"];
  uint64_t v3 = [MEMORY[0x263F21660] axAttributedStringWithString:v2];

  [v3 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21820]];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryTextViewAccessibility;
  return [(CKMessageEntryTextViewAccessibility *)&v3 accessibilityTraits] & ~*MEMORY[0x263F21B60];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryTextViewAccessibility;
  [(CKMessageEntryTextViewAccessibility *)&v3 layoutSubviews];
  [(CKMessageEntryTextViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)updateTextView
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryTextViewAccessibility;
  [(CKMessageEntryTextViewAccessibility *)&v3 updateTextView];
  [(CKMessageEntryTextViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axUpdateEmojiCandidates
{
  id v4 = [(CKMessageEntryTextViewAccessibility *)self _axEmojiCandidatesFromEmojiKit];
  if ([v4 count])
  {
    [(CKMessageEntryTextViewAccessibility *)self _axSetEmojiCandidates:v4];
    objc_super v3 = [(CKMessageEntryTextViewAccessibility *)self _axCreateEmojiRotor];
    [(CKMessageEntryTextViewAccessibility *)self _axSetEmojiRotor:v3];

    if (UIAccessibilityIsSwitchControlRunning()) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    }
  }
  else
  {
    [(CKMessageEntryTextViewAccessibility *)self _axSetEmojiCandidates:0];
    [(CKMessageEntryTextViewAccessibility *)self _axSetEmojiRotor:0];
  }
}

- (void)_startTextKit1EmojiDisplayUpdateTimer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryTextViewAccessibility;
  [(CKMessageEntryTextViewAccessibility *)&v4 _startTextKit1EmojiDisplayUpdateTimer:a3];
  [(CKMessageEntryTextViewAccessibility *)self _axUpdateEmojiCandidates];
}

- (void)_stopTextKit1EmojiDisplayUpdateTimer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryTextViewAccessibility;
  [(CKMessageEntryTextViewAccessibility *)&v4 _stopTextKit1EmojiDisplayUpdateTimer:a3];
  [(CKMessageEntryTextViewAccessibility *)self _axSetEmojiCandidates:0];
  [(CKMessageEntryTextViewAccessibility *)self _axSetEmojiRotor:0];
  if (UIAccessibilityIsSwitchControlRunning()) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (void)setAttributedText:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryTextViewAccessibility;
  -[CKMessageEntryTextViewAccessibility setAttributedText:](&v5, sel_setAttributedText_);
  if (!a3)
  {
    [(CKMessageEntryTextViewAccessibility *)self _axSetEmojiCandidates:0];
    [(CKMessageEntryTextViewAccessibility *)self _axSetEmojiRotor:0];
    if (UIAccessibilityIsSwitchControlRunning()) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    }
  }
}

- (id)_axCreateEmojiRotor
{
  objc_super v3 = accessibilityLocalizedString(@"emoji.rotor.name");
  id v4 = objc_alloc(MEMORY[0x263F1C398]);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__CKMessageEntryTextViewAccessibility__axCreateEmojiRotor__block_invoke;
  v7[3] = &unk_265113430;
  v7[4] = self;
  objc_super v5 = (void *)[v4 initWithName:v3 itemSearchBlock:v7];

  return v5;
}

id __58__CKMessageEntryTextViewAccessibility__axCreateEmojiRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _axEmojiCandidates];
  if (![v4 count])
  {
    v10 = 0;
    goto LABEL_14;
  }
  objc_super v5 = [v3 currentItem];
  v6 = [v5 targetElement];

  uint64_t v7 = [v4 indexOfObject:v6];
  uint64_t v8 = [v3 searchDirection];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8 == 1) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [v4 count] - 1;
    }
    goto LABEL_11;
  }
  if (!v8)
  {
    uint64_t v9 = v7 - 1;
    if (v7 >= 1) {
      goto LABEL_11;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  if (v7 >= (unint64_t)([v4 count] - 1)) {
    goto LABEL_12;
  }
  uint64_t v9 = v7 + 1;
LABEL_11:
  v11 = [v4 objectAtIndex:v9];
  v10 = (void *)[objc_alloc(MEMORY[0x263F1C3A0]) initWithTargetElement:v11 targetRange:0];

LABEL_13:
LABEL_14:

  return v10;
}

- (id)_axTextRangeForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  objc_opt_class();
  objc_super v5 = __UIAccessibilityCastAsClass();
  v6 = [v5 beginningOfDocument];
  uint64_t v7 = [v5 positionFromPosition:v6 offset:location];
  uint64_t v8 = [v5 positionFromPosition:v6 offset:location + length];
  uint64_t v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v11 = [v5 textRangeFromPosition:v7 toPosition:v8];
  }

  return v11;
}

- (BOOL)_axIsSMSPlaceholderVisible
{
  id v3 = [(CKMessageEntryTextViewAccessibility *)self safeValueForKeyPath:@"delegate.conversation.sendingService"];
  if ([v3 safeBoolForKey:@"__ck_isSMS"])
  {
    id v4 = [(CKMessageEntryTextViewAccessibility *)self safeValueForKey:@"_placeholderLabel"];
    char v5 = [v4 _accessibilityViewIsVisible];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)_axEmojiCandidatesFromEmojiKit
{
  if ([(CKMessageEntryTextViewAccessibility *)self safeBoolForKey:@"_emojiConversionActive"])
  {
    char v15 = 0;
    objc_opt_class();
    id v3 = __UIAccessibilityCastAsClass();
    id v4 = [MEMORY[0x263EFF980] array];
    char v5 = [v3 textLayoutManager];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __69__CKMessageEntryTextViewAccessibility__axEmojiCandidatesFromEmojiKit__block_invoke;
    v12[3] = &unk_265113480;
    v12[4] = self;
    id v13 = v3;
    id v6 = v4;
    id v14 = v6;
    id v7 = v3;
    id v8 = (id)[v5 enumerateTextLayoutFragmentsFromLocation:0 options:0 usingBlock:v12];
    uint64_t v9 = v14;
    id v10 = v6;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __69__CKMessageEntryTextViewAccessibility__axEmojiCandidatesFromEmojiKit__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 textElement];
  id v4 = [v3 attributedString];
  uint64_t v5 = [v4 length];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__CKMessageEntryTextViewAccessibility__axEmojiCandidatesFromEmojiKit__block_invoke_2;
  v8[3] = &unk_265113458;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v10 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v8);

  return 1;
}

void __69__CKMessageEntryTextViewAccessibility__axEmojiCandidatesFromEmojiKit__block_invoke_2(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = [v7 objectForKey:@"EMKEmojiTokenList"];
  id v9 = [v7 objectForKey:@"EMKEmojiConversionLanguage"];
  if (v8)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__9;
    v22 = __Block_byref_object_dispose__9;
    id v23 = 0;
    id v17 = v8;
    AXPerformSafeBlock();
    id v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    if (v10)
    {
      v11 = [[AXEmojiConversionCandidateElement alloc] initWithAccessibilityContainer:a1[5]];
      v16 = objc_msgSend(a1[4], "_axTextRangeForRange:", a3, a4);
      objc_msgSend(a1[5], "firstRectForRange:");
      CGRect v25 = UIAccessibilityConvertFrameToScreenCoordinates(v24, (UIView *)a1[5]);
      -[AXEmojiConversionCandidateElement setAccessibilityFrame:](v11, "setAccessibilityFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
      [(AXEmojiConversionCandidateElement *)v11 setTextView:a1[4]];
      v12 = [a1[4] safeStringForKey:@"text"];
      id v13 = objc_msgSend(v12, "substringWithRange:", a3, a4);
      [(AXEmojiConversionCandidateElement *)v11 setCandidateString:v13];

      -[AXEmojiConversionCandidateElement setCandidateRange:](v11, "setCandidateRange:", a3, a4);
      [(AXEmojiConversionCandidateElement *)v11 setCandidateEmojiList:v10];
      LOBYTE(v18) = 0;
      objc_opt_class();
      uint64_t v14 = __UIAccessibilityCastAsClass();
      if ((_BYTE)v18) {
        abort();
      }
      char v15 = (void *)v14;
      [(AXEmojiConversionCandidateElement *)v11 setConversionLanguage:v14];

      [a1[6] axSafelyAddObject:v11];
    }
  }
}

uint64_t __69__CKMessageEntryTextViewAccessibility__axEmojiCandidatesFromEmojiKit__block_invoke_460(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) personalizedEmojiTokenListForList:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (void)_axShowOverlayWithEmojiElement:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = __UIAccessibilityCastAsClass();
  id v6 = [(CKMessageEntryTextViewAccessibility *)self safeValueForKey:@"anchorRect"];
  [v6 rectValue];

  NSClassFromString(&cfstr_Emkoverlayview.isa);
  id v9 = v4;
  id v7 = v4;
  id v8 = v5;
  AXPerformSafeBlock();
  [v8 setNeedsLayout];
}

void __70__CKMessageEntryTextViewAccessibility__axShowOverlayWithEmojiElement___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(*(Class *)(a1 + 56));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) candidateEmojiList];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__CKMessageEntryTextViewAccessibility__axShowOverlayWithEmojiElement___block_invoke_2;
  v8[3] = &unk_2651134A8;
  id v9 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = objc_msgSend(v2, "initWithView:anchorRect:emojiTokenList:selectionHandler:", v3, v4, v8, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));

  [*(id *)(a1 + 32) setValue:v7 forKey:@"_overlayView"];
}

void __70__CKMessageEntryTextViewAccessibility__axShowOverlayWithEmojiElement___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] setValue:0 forKey:@"_overlayView"];
  [a1[4] setValue:&unk_26F66E0B8 forKey:@"_tappedGlyphIndex"];
  if (v3)
  {
    [a1[5] selectEmoji:v3];
    [a1[6] _axReplaceEmojiWithElement:a1[5]];
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], a1[6]);
}

- (void)_axReplaceEmojiWithElement:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 candidateRange];
  uint64_t v7 = v6;
  id v8 = [v4 currentEmoji];
  id v9 = [v4 conversionLanguage];
  id v10 = [(CKMessageEntryTextViewAccessibility *)self safeValueForKey:@"_textKit2Controller"];
  uint64_t v40 = MEMORY[0x263EF8330];
  uint64_t v41 = 3221225472;
  v42 = __66__CKMessageEntryTextViewAccessibility__axReplaceEmojiWithElement___block_invoke;
  v43 = &unk_2651134F8;
  id v30 = v10;
  id v44 = v30;
  uint64_t v47 = v5;
  uint64_t v48 = v7;
  id v33 = v8;
  id v45 = v33;
  id v29 = v9;
  id v46 = v29;
  AXPerformSafeBlock();
  char v39 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  uint64_t v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  [(CKMessageEntryTextViewAccessibility *)self _axRemoveElementFromEmojiCandidates:v4];
  v28 = v4;
  unint64_t v12 = [v4 candidateRange];
  uint64_t v32 = v13;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [(CKMessageEntryTextViewAccessibility *)self _axEmojiCandidates];
  uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v36;
    v31 = v11;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        unint64_t v19 = [v18 candidateRange];
        uint64_t v21 = v20;
        if (v19 > v12)
        {
          uint64_t v22 = v15;
          unint64_t v23 = v12;
          CGRect v24 = self;
          char v39 = 0;
          objc_opt_class();
          CGRect v25 = [v33 safeValueForKey:@"string"];
          v26 = __UIAccessibilityCastAsClass();

          if (v39) {
            abort();
          }
          unint64_t v19 = v19 - v32 + [v26 length];

          self = v24;
          unint64_t v12 = v23;
          uint64_t v15 = v22;
          uint64_t v11 = v31;
        }
        objc_msgSend(v18, "setCandidateRange:", v19, v21);
        v27 = -[CKMessageEntryTextViewAccessibility _axTextRangeForRange:](self, "_axTextRangeForRange:", v19, v21);
        [(UIView *)v11 firstRectForRange:v27];
        CGRect v52 = UIAccessibilityConvertFrameToScreenCoordinates(v51, v11);
        -[UIView convertRect:toView:](v11, "convertRect:toView:", 0, v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
        objc_msgSend(v18, "setAccessibilityFrame:");
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v15);
  }
}

uint64_t __66__CKMessageEntryTextViewAccessibility__axReplaceEmojiWithElement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceRange:withEmojiToken:language:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_axRemoveElementFromEmojiCandidates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKMessageEntryTextViewAccessibility *)self _axEmojiCandidates];
  id v6 = (id)[v5 mutableCopy];

  [v6 removeObject:v4];
  [(CKMessageEntryTextViewAccessibility *)self _axSetEmojiCandidates:v6];
}

- (id)_accessibleNonSupplementarySubviews
{
  return 0;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v19[1] = *MEMORY[0x263EF8340];
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEntryTextViewAccessibility;
  id v3 = [(CKMessageEntryTextViewAccessibility *)&v18 _accessibilitySupplementaryHeaderViews];
  id v4 = [(CKMessageEntryTextViewAccessibility *)self _accessibilityValueForKey:@"AXPlaceholderEmojiView"];
  if ((UIAccessibilityIsSwitchControlRunning() || _AXSAutomationEnabled())
    && ([(CKMessageEntryTextViewAccessibility *)self _axEmojiCandidates],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    uint64_t v7 = [(CKMessageEntryTextViewAccessibility *)self _axEmojiCandidates];
    if (!v4 || ([v4 window], id v8 = objc_claimAutoreleasedReturnValue(), v8, !v8))
    {
      [v4 removeFromSuperview];
      [(CKMessageEntryTextViewAccessibility *)self bounds];
      uint64_t v13 = -[AXEmojiPlaceholderView initWithFrame:]([AXEmojiPlaceholderView alloc], "initWithFrame:", v9 + 10.0, v11, v10 + -30.0, v12);

      [(CKMessageEntryTextViewAccessibility *)self addSubview:v13];
      [(CKMessageEntryTextViewAccessibility *)self _accessibilitySetRetainedValue:v13 forKey:@"AXPlaceholderEmojiView"];
      id v4 = v13;
    }
    [v4 setAccessibilityElements:v7];
    if (([v3 containsObject:v4] & 1) == 0)
    {
      uint64_t v14 = (void *)MEMORY[0x263EFF8C0];
      v19[0] = v4;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      uint64_t v16 = objc_msgSend(v14, "axArrayWithPossiblyNilArrays:", 2, v3, v15);

      id v3 = (void *)v16;
    }
  }
  else
  {
    [v4 removeFromSuperview];
    [(CKMessageEntryTextViewAccessibility *)self _accessibilityRemoveValueForKey:@"AXPlaceholderEmojiView"];
  }

  return v3;
}

@end