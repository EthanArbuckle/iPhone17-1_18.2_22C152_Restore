@interface CKMessageEntryRichTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHoverTypingShouldAdjustDockedMode;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axAttributedText;
- (id)_axConfirmedMentionElements;
- (id)_axMentionElements;
- (id)_axMentionRotor;
- (id)_axPossibleMentionElements;
- (id)_axTextEffectMentionElements;
- (id)_axTextEffectRotor;
- (id)accessibilityCustomContent;
- (id)accessibilityCustomRotors;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityUpdateMentionsIfNeeded;
- (void)_accessibilityUpdateTextEffectsIfNeeded;
- (void)_axSetAttributedText:(id)a3;
- (void)_axSetConfirmedMentionElements:(id)a3;
- (void)_axSetPossibleMentionElements:(id)a3;
- (void)_axSetTextEffectMentionElements:(id)a3;
- (void)_setAXMentionRotor:(id)a3;
- (void)_setAXTextEffectRotor:(id)a3;
- (void)paste:(id)a3;
- (void)setAttributedText:(id)a3;
@end

@implementation CKMessageEntryRichTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageEntryRichTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CKMessageEntryView"];
  [v3 validateClass:@"CKMessageEntryTextView" isKindOfClass:@"UITextView"];
  [v3 validateClass:@"CKMessageEntryRichTextView" isKindOfClass:@"CKMessageEntryTextView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryRichTextView", @"paste:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryTextView", @"hideCaret", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"collpasedPlaceholderLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKMessageEntryView", @"contentClipView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"attributedText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"setAttributedText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextView", @"selectedRange", "{_NSRange=QQ}", 0);
  [v3 validateClass:@"ChatKit.CKLinkPreviewTextAttachment"];
  [v3 validateClass:@"ChatKit.CKLinkPreviewTextAttachment" hasSwiftField:@"viewProvider" withSwiftType:"Optional<CKLinkPreviewTextAttachmentViewProvider>"];
  [v3 validateClass:@"ChatKit.CKLinkPreviewTextAttachmentViewProvider" hasSwiftField:@"providedView" withSwiftType:"CKEmbeddedRichLinkView"];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(CKMessageEntryRichTextViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Ckmessageentry.isa)];
  v4 = [v3 safeValueForKey:@"collpasedPlaceholderLabel"];
  if ([v4 _accessibilityViewIsVisible])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
    BOOL v5 = [(CKMessageEntryRichTextViewAccessibility *)&v7 isAccessibilityElement];
  }

  return v5;
}

- (id)accessibilityIdentifier
{
  return @"messageBodyField";
}

- (id)_axMentionRotor
{
}

- (void)_setAXMentionRotor:(id)a3
{
}

- (id)_axTextEffectRotor
{
}

- (void)_setAXTextEffectRotor:(id)a3
{
}

- (id)accessibilityCustomRotors
{
  id v3 = [MEMORY[0x263EFF980] array];
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  v4 = [(CKMessageEntryRichTextViewAccessibility *)&v18 accessibilityCustomRotors];
  [v3 axSafelyAddObjectsFromArray:v4];

  BOOL v5 = [(CKMessageEntryRichTextViewAccessibility *)self _axMentionRotor];
  uint64_t v6 = [(CKMessageEntryRichTextViewAccessibility *)self _axTextEffectRotor];
  objc_super v7 = (void *)v6;
  if (v5)
  {
    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x263F1C398]);
    v9 = accessibilityLocalizedString(@"mentions.rotor.name");
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__CKMessageEntryRichTextViewAccessibility_accessibilityCustomRotors__block_invoke;
    v15[3] = &unk_265113180;
    objc_copyWeak(&v16, &location);
    BOOL v5 = (void *)[v8 initWithName:v9 itemSearchBlock:v15];

    [(CKMessageEntryRichTextViewAccessibility *)self _setAXMentionRotor:v5];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    if (v7) {
      goto LABEL_6;
    }
  }
  objc_initWeak(&location, self);
  id v10 = objc_alloc(MEMORY[0x263F1C398]);
  v11 = accessibilityLocalizedString(@"texteffects.rotor.name");
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__CKMessageEntryRichTextViewAccessibility_accessibilityCustomRotors__block_invoke_2;
  v13[3] = &unk_265113180;
  objc_copyWeak(&v14, &location);
  objc_super v7 = (void *)[v10 initWithName:v11 itemSearchBlock:v13];

  [(CKMessageEntryRichTextViewAccessibility *)self _setAXTextEffectRotor:v7];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
LABEL_6:
  [v3 axSafelyAddObject:v5];
  [v3 axSafelyAddObject:v7];

  return v3;
}

id __68__CKMessageEntryRichTextViewAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityUpdateMentionsIfNeeded];
  BOOL v5 = [WeakRetained _axMentionElements];
  if ([v5 count])
  {
    uint64_t v6 = [v3 currentItem];
    objc_super v7 = [v6 targetElement];
    uint64_t v8 = [v5 indexOfObject:v7];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = 0;
    }
    else
    {
      if ([v3 searchDirection]) {
        unint64_t v9 = v8 + 1;
      }
      else {
        unint64_t v9 = v8 - 1;
      }
      if ((v9 & 0x8000000000000000) != 0) {
        goto LABEL_10;
      }
    }
    if (v9 < [v5 count])
    {
      id v10 = objc_alloc_init(MEMORY[0x263F1C3A0]);
      v11 = [v5 objectAtIndexedSubscript:v9];
      [v10 setTargetElement:v11];

      goto LABEL_11;
    }
  }
LABEL_10:
  id v10 = 0;
LABEL_11:

  return v10;
}

id __68__CKMessageEntryRichTextViewAccessibility_accessibilityCustomRotors__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityUpdateTextEffectsIfNeeded];
  BOOL v5 = [WeakRetained _axTextEffectMentionElements];
  if ([v5 count])
  {
    uint64_t v6 = [v3 currentItem];
    objc_super v7 = [v6 targetElement];
    uint64_t v8 = [v5 indexOfObject:v7];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = 0;
    }
    else
    {
      if ([v3 searchDirection]) {
        unint64_t v9 = v8 + 1;
      }
      else {
        unint64_t v9 = v8 - 1;
      }
      if ((v9 & 0x8000000000000000) != 0) {
        goto LABEL_10;
      }
    }
    if (v9 < [v5 count])
    {
      id v10 = objc_alloc_init(MEMORY[0x263F1C3A0]);
      v11 = [v5 objectAtIndexedSubscript:v9];
      [v10 setTargetElement:v11];

      goto LABEL_11;
    }
  }
LABEL_10:
  id v10 = 0;
LABEL_11:

  return v10;
}

- (id)accessibilityCustomContent
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(CKMessageEntryRichTextViewAccessibility *)self _accessibilityUpdateTextEffectsIfNeeded];
  id v3 = [(CKMessageEntryRichTextViewAccessibility *)self _axTextEffectMentionElements];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        unint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x263EFABD0];
        v11 = accessibilityLocalizedString(@"texteffects.rotor.name");
        v12 = [v9 accessibilityLabel];
        v13 = [v9 accessibilityValue];
        id v14 = __UIAXStringForVariables();
        v15 = objc_msgSend(v10, "customContentWithLabel:value:", v11, v14, v13, @"__AXStringForVariablesSentinel");
        [v4 axSafelyAddObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)accessibilityLabel
{
  v24.receiver = self;
  v24.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  id v3 = [(CKMessageEntryRichTextViewAccessibility *)&v24 accessibilityLabel];
  [(CKMessageEntryRichTextViewAccessibility *)self _accessibilityUpdateMentionsIfNeeded];
  [(CKMessageEntryRichTextViewAccessibility *)self _accessibilityUpdateTextEffectsIfNeeded];
  id v4 = [(CKMessageEntryRichTextViewAccessibility *)self _axConfirmedMentionElements];
  if ([v4 count])
  {
    uint64_t v5 = NSString;
    uint64_t v6 = accessibilityLocalizedString(@"mentions.count");
    uint64_t v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, objc_msgSend(v4, "count"));

    long long v20 = MEMORY[0x245646F50](v4);
    v22 = @"__AXStringForVariablesSentinel";
    uint64_t v8 = __UIAXStringForVariables();
  }
  else
  {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(CKMessageEntryRichTextViewAccessibility *)self _axPossibleMentionElements];
  if ([v9 count])
  {
    id v10 = NSString;
    v11 = accessibilityLocalizedString(@"possible.mentions.count");
    v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, objc_msgSend(v9, "count"));

    long long v21 = MEMORY[0x245646F50](v9);
    uint64_t v23 = @"__AXStringForVariablesSentinel";
    v13 = __UIAXStringForVariables();
  }
  else
  {
    v13 = 0;
  }
  id v14 = [(CKMessageEntryRichTextViewAccessibility *)self _axTextEffectMentionElements];
  if ([v14 count])
  {
    v15 = NSString;
    id v16 = accessibilityLocalizedString(@"texteffect.mentions.count");
    v17 = objc_msgSend(v15, "localizedStringWithFormat:", v16, objc_msgSend(v14, "count"));
  }
  else
  {
    v17 = 0;
  }
  long long v18 = __UIAXStringForVariables();

  return v18;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  unint64_t v3 = [(CKMessageEntryRichTextViewAccessibility *)&v6 accessibilityTraits];
  if ([(CKMessageEntryRichTextViewAccessibility *)self safeBoolForKey:@"hideCaret"])uint64_t v4 = ~*MEMORY[0x263F81398]; {
  else
  }
    uint64_t v4 = -1;
  return v4 & v3;
}

- (void)setAttributedText:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  -[CKMessageEntryRichTextViewAccessibility setAttributedText:](&v24, sel_setAttributedText_);
  [(CKMessageEntryRichTextViewAccessibility *)self _setAXMentionRotor:0];
  [(CKMessageEntryRichTextViewAccessibility *)self _setAXTextEffectRotor:0];
  uint64_t v5 = [(CKMessageEntryRichTextViewAccessibility *)self _axPossibleMentionElements];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [(CKMessageEntryRichTextViewAccessibility *)self _axConfirmedMentionElements];
  unint64_t v8 = [v7 count];

  unint64_t v9 = [(CKMessageEntryRichTextViewAccessibility *)self _axTextEffectMentionElements];
  uint64_t v10 = [v9 count];

  [(CKMessageEntryRichTextViewAccessibility *)self _axSetPossibleMentionElements:0];
  [(CKMessageEntryRichTextViewAccessibility *)self _axSetConfirmedMentionElements:0];
  [(CKMessageEntryRichTextViewAccessibility *)self _axSetTextEffectMentionElements:0];
  [(CKMessageEntryRichTextViewAccessibility *)self _accessibilityUpdateMentionsIfNeeded];
  v11 = [(CKMessageEntryRichTextViewAccessibility *)self _axPossibleMentionElements];
  uint64_t v12 = [v11 count];

  v13 = [(CKMessageEntryRichTextViewAccessibility *)self _axConfirmedMentionElements];
  unint64_t v14 = [v13 count];

  if (v6 != v12 || v8 != v14)
  {
    UIAccessibilityNotifications v15 = *MEMORY[0x263F81438];
    uint64_t v27 = *MEMORY[0x263F21C80];
    v28[0] = MEMORY[0x263EFFA88];
    id v16 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    UIAccessibilityPostNotification(v15, v16);

    if (a3)
    {
      if (v8 != v14)
      {
        if (v14 <= v8) {
          v17 = @"mentions.confirmed.removed";
        }
        else {
          v17 = @"mentions.confirmed.added";
        }
        long long v18 = accessibilityLocalizedString(v17);
        long long v19 = [MEMORY[0x263F21660] axAttributedStringWithString:v18];
        [v19 setAttribute:&unk_26F66E0A0 forKey:*MEMORY[0x263F216D8]];
        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v19);
      }
    }
  }
  if (v10)
  {
    [(CKMessageEntryRichTextViewAccessibility *)self _accessibilityUpdateTextEffectsIfNeeded];
    long long v20 = [(CKMessageEntryRichTextViewAccessibility *)self _axTextEffectMentionElements];
    uint64_t v21 = [v20 count];

    if (v10 != v21)
    {
      UIAccessibilityNotifications v22 = *MEMORY[0x263F81438];
      uint64_t v25 = *MEMORY[0x263F21C80];
      uint64_t v26 = MEMORY[0x263EFFA88];
      uint64_t v23 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      UIAccessibilityPostNotification(v22, v23);
    }
  }
}

- (void)paste:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  [(CKMessageEntryRichTextViewAccessibility *)&v4 paste:a3];
  [(CKMessageEntryRichTextViewAccessibility *)self _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21BC0]];
}

- (id)accessibilityPath
{
  v2 = [(CKMessageEntryRichTextViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_3 startWithSelf:0];
  unint64_t v3 = [v2 safeValueForKey:@"contentClipView"];
  objc_super v4 = [v3 accessibilityPath];

  return v4;
}

uint64_t __60__CKMessageEntryRichTextViewAccessibility_accessibilityPath__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Ckmessageentry.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axPossibleMentionElements
{
}

- (void)_axSetPossibleMentionElements:(id)a3
{
}

- (id)_axConfirmedMentionElements
{
}

- (void)_axSetConfirmedMentionElements:(id)a3
{
}

- (id)_axTextEffectMentionElements
{
}

- (void)_axSetTextEffectMentionElements:(id)a3
{
}

- (id)_axAttributedText
{
}

- (void)_axSetAttributedText:(id)a3
{
}

- (id)_axMentionElements
{
  unint64_t v3 = (void *)MEMORY[0x263EFF8C0];
  objc_super v4 = [(CKMessageEntryRichTextViewAccessibility *)self _axPossibleMentionElements];
  uint64_t v5 = [(CKMessageEntryRichTextViewAccessibility *)self _axConfirmedMentionElements];
  uint64_t v6 = objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 2, v4, v5);

  return v6;
}

- (void)_accessibilityUpdateMentionsIfNeeded
{
  objc_opt_class();
  unint64_t v3 = [(CKMessageEntryRichTextViewAccessibility *)self safeValueForKey:@"attributedText"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  uint64_t v5 = __UIAccessibilityCastAsClass();
  uint64_t v6 = [(CKMessageEntryRichTextViewAccessibility *)self _axPossibleMentionElements];

  if (!v6)
  {
    uint64_t v7 = _AXCKPossibleMentions(v5);
    [(CKMessageEntryRichTextViewAccessibility *)self _axSetPossibleMentionElements:v7];
  }
  unint64_t v8 = [(CKMessageEntryRichTextViewAccessibility *)self _axConfirmedMentionElements];

  if (!v8)
  {
    unint64_t v9 = _AXCKConfirmedMentions(v5, v4);
    [(CKMessageEntryRichTextViewAccessibility *)self _axSetConfirmedMentionElements:v9];
  }
}

- (void)_accessibilityUpdateTextEffectsIfNeeded
{
  objc_opt_class();
  unint64_t v3 = __UIAccessibilityCastAsClass();
  objc_super v4 = [v3 attributedText];
  uint64_t v5 = [(CKMessageEntryRichTextViewAccessibility *)self _axAttributedText];
  char v6 = [v4 isEqualToAttributedString:v5];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = _AXCKTextEffectMentions(v3);
    [(CKMessageEntryRichTextViewAccessibility *)self _axSetTextEffectMentionElements:v7];

    [(CKMessageEntryRichTextViewAccessibility *)self _axSetAttributedText:v4];
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  if ([v2 canBecomeFirstResponder]) {
    int v3 = [v2 isFirstResponder] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (BOOL)accessibilityActivate
{
  if ([(CKMessageEntryRichTextViewAccessibility *)self _accessibilitySupportsActivateAction])
  {
    objc_opt_class();
    int v3 = __UIAccessibilityCastAsClass();
    [v3 becomeFirstResponder];

    char v8 = 0;
    objc_opt_class();
    objc_super v4 = __UIAccessibilityCastAsClass();
    char v5 = [v4 isFirstResponder];

    if (v5) {
      return 1;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  return [(CKMessageEntryRichTextViewAccessibility *)&v7 accessibilityActivate];
}

- (id)_accessibilitySupplementaryFooterViews
{
  char v11 = 0;
  objc_opt_class();
  int v3 = [(CKMessageEntryRichTextViewAccessibility *)self safeValueForKey:@"attributedText"];
  objc_super v4 = __UIAccessibilityCastAsClass();

  char v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [v4 length];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__CKMessageEntryRichTextViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke;
  v9[3] = &unk_265113408;
  id v7 = v5;
  id v10 = v7;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v9);

  return v7;
}

void __81__CKMessageEntryRichTextViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 objectForKey:*MEMORY[0x263F1C208]];
  if (v5)
  {
    NSClassFromString(&cfstr_ChatkitCklinkp.isa);
    if (objc_opt_isKindOfClass())
    {
      int v3 = [v5 safeSwiftValueForKey:@"viewProvider"];
      objc_super v4 = [v3 safeSwiftValueForKey:@"providedView"];
      [*(id *)(a1 + 32) axSafelyAddObject:v4];
    }
  }
}

- (BOOL)_accessibilityHoverTypingShouldAdjustDockedMode
{
  return 1;
}

@end