@interface CKTextBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_allowCustomActionHintSpeakOverride;
- (BOOL)_axIsInvisibleInk;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityElementHelp;
- (id)_accessibilitySpeakThisString;
- (id)_axAttributedText;
- (id)_axInvisibleInkDescription;
- (id)_axMainContentStringForSpeakThis:(BOOL)a3;
- (id)_axMentionsDescription;
- (id)_axMessageProvenanceDescription;
- (id)_axTextEffectMentionElements;
- (id)_axTextEffectRotor;
- (id)accessibilityCustomContent;
- (id)accessibilityCustomRotors;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityVisibleText;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityUpdateTextEffectsIfNeeded;
- (void)_axSetAttributedText:(id)a3;
- (void)_axSetTextEffectMentionElements:(id)a3;
- (void)_setAXInvisibleInkDescription:(id)a3;
- (void)_setAXTextEffectRotor:(id)a3;
- (void)invisibleInkEffectViewWasUncovered;
- (void)prepareForDisplay;
- (void)setAttributedText:(id)a3;
@end

@implementation CKTextBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKTextBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTextBalloonView", @"textView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTextBalloonView", @"setAttributedText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTextBalloonView", @"prepareForDisplay", "v", 0);
}

- (id)_axMainContentStringForSpeakThis:(BOOL)a3
{
  if (a3)
  {
    id v3 = &stru_26F654EE0;
  }
  else
  {
    id v3 = [(CKTextBalloonViewAccessibility *)self accessibilityVisibleText];
  }
  objc_opt_class();
  v4 = __UIAccessibilityCastAsSafeCategory();
  v5 = [v4 _axMessageSender];
  v6 = [0 string];
  v7 = __UIAXStringForVariables();

  v14 = objc_msgSend(v4, "_axReplyDescription", v3, @"__AXStringForVariablesSentinel");
  v8 = __UIAXStringForVariables();

  if (objc_msgSend(v7, "isAXAttributedString", v14, v7, @"__AXStringForVariablesSentinel"))
  {
    uint64_t v9 = [v8 rangeOfString:v7];
    v10 = [MEMORY[0x263F21660] axAttributedStringWithString:v8];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__CKTextBalloonViewAccessibility__axMainContentStringForSpeakThis___block_invoke;
    v15[3] = &unk_265113158;
    id v11 = v10;
    id v16 = v11;
    uint64_t v17 = v9;
    [v7 enumerateAttributesUsingBlock:v15];
    id v12 = v11;

    v8 = v12;
  }

  return v8;
}

uint64_t __67__CKTextBalloonViewAccessibility__axMainContentStringForSpeakThis___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:withRange:", a2, *(void *)(a1 + 40) + a3, a4);
}

- (id)_axInvisibleInkDescription
{
}

- (void)_setAXInvisibleInkDescription:(id)a3
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

- (id)_axTextEffectRotor
{
}

- (void)_setAXTextEffectRotor:(id)a3
{
}

- (id)accessibilityVisibleText
{
  v2 = [(CKTextBalloonViewAccessibility *)self safeValueForKey:@"textView"];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 accessibilityAttributedValue];
  if ([v3 safeBoolForKey:@"accessibilityContainsOneLink"])
  {
    v5 = [v3 accessibilityLabel];
    if (v5)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:v5];

      v4 = (void *)v6;
    }
  }
  v7 = UIAccessibilityConvertAttachmentsInAttributedStringToAX();
  if ([v7 length] == 1)
  {
    v8 = [MEMORY[0x263F21660] axAttributedStringWithString:v7];

    [v8 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F217C8]];
    v7 = v8;
  }

  return v7;
}

- (void)invisibleInkEffectViewWasUncovered
{
  v5.receiver = self;
  v5.super_class = (Class)CKTextBalloonViewAccessibility;
  [(CKTextBalloonViewAccessibility *)&v5 invisibleInkEffectViewWasUncovered];
  id v3 = [(CKTextBalloonViewAccessibility *)self _axMainContentStringForSpeakThis:0];
  [(CKTextBalloonViewAccessibility *)self _setAXInvisibleInkDescription:v3];

  v4 = accessibilityLocalizedString(@"balloon.effect.invisibleink.description");
  [(CKTextBalloonViewAccessibility *)self performSelector:sel__setAXInvisibleInkDescription_ withObject:v4 afterDelay:5.0];
}

- (BOOL)_axIsInvisibleInk
{
  v2 = [(CKTextBalloonViewAccessibility *)self safeValueForKey:@"invisibleInkEffectController"];
  if ([v2 safeBoolForKey:@"isEnabled"]) {
    int v3 = [v2 safeBoolForKey:@"isSuspended"] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (id)_axMentionsDescription
{
  objc_opt_class();
  int v3 = __UIAccessibilityCastAsSafeCategory();
  v4 = [v3 _axMessageForBalloon];
  if ([v4 safeBoolForKey:@"hasMention"])
  {
    objc_opt_class();
    objc_super v5 = [v4 safeValueForKey:@"text"];
    uint64_t v6 = __UIAccessibilityCastAsClass();

    objc_opt_class();
    v7 = [(CKTextBalloonViewAccessibility *)self safeValueForKey:@"textView"];
    v8 = __UIAccessibilityCastAsClass();

    uint64_t v9 = _AXCKConfirmedMentions(v8, v6);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x263EFFA68];
  }
  if ([v9 count])
  {
    v10 = NSString;
    id v11 = accessibilityLocalizedString(@"mentions.count");
    id v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, objc_msgSend(v9, "count"));

    v15 = MEMORY[0x245646F50](v9);
    v13 = __UIAXStringForVariables();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_axMessageProvenanceDescription
{
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  int v3 = [v2 color];

  if (v3 == 5)
  {
    v4 = accessibilityLocalizedString(@"apple.pay.message.provenance");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  int v3 = __UIAccessibilityCastAsSafeCategory();
  if ([(CKTextBalloonViewAccessibility *)self _axIsInvisibleInk])
  {
    v4 = [(CKTextBalloonViewAccessibility *)self _axInvisibleInkDescription];
    if (!v4)
    {
      objc_super v5 = accessibilityLocalizedString(@"balloon.effect.invisibleink.description");
      uint64_t v6 = [v3 _axMessageSender];
      id v16 = v5;
      v18 = @"__AXStringForVariablesSentinel";
      v4 = __UIAXStringForVariables();
    }
  }
  else
  {
    v4 = [(CKTextBalloonViewAccessibility *)self _axMainContentStringForSpeakThis:0];
  }
  [(CKTextBalloonViewAccessibility *)self _accessibilityUpdateTextEffectsIfNeeded];
  v7 = [(CKTextBalloonViewAccessibility *)self _axTextEffectMentionElements];
  if ([v7 count])
  {
    v8 = accessibilityLocalizedString(@"texteffect.mentions.count");
    uint64_t v17 = [v7 count];
    uint64_t v9 = AXCFormattedString();
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = [(CKTextBalloonViewAccessibility *)self _axMentionsDescription];
  id v11 = [v3 _axStickerDescription];
  id v12 = [v3 _axAcknowledgmentDescription];
  v13 = [v3 _axMessageTime];
  v19 = [(CKTextBalloonViewAccessibility *)self _axMessageProvenanceDescription];
  v14 = __UIAXStringForVariables();

  return v14;
}

- (id)accessibilityHint
{
  if ([(CKTextBalloonViewAccessibility *)self _axIsInvisibleInk])
  {
    v2 = accessibilityLocalizedString(@"balloon.effect.invisibleink.hint");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)_accessibilityElementHelp
{
  if ([(CKTextBalloonViewAccessibility *)self _axIsInvisibleInk])
  {
    v2 = accessibilityLocalizedString(@"balloon.effect.invisibleink.hint.macos");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)isAccessibilityElement
{
  if ([(CKTextBalloonViewAccessibility *)self _axIsVisibleInTapbackView])
  {
    int v3 = [(CKTextBalloonViewAccessibility *)self _axIsVisibleInTapbackView];
    if (v3)
    {
      LOBYTE(v3) = [(CKTextBalloonViewAccessibility *)self _axIsTapbackBalloonView];
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)CKTextBalloonViewAccessibility;
  unint64_t v3 = [(CKTextBalloonViewAccessibility *)&v10 accessibilityTraits];
  v4 = [(CKTextBalloonViewAccessibility *)self safeValueForKey:@"textView"];
  objc_super v5 = __UIAccessibilitySafeClass();

  int v6 = [v5 safeBoolForKey:@"accessibilityContainsOneLink"];
  uint64_t v7 = *MEMORY[0x263F1CF10];
  if (!v6) {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v7 | v3;

  return v8;
}

- (id)_accessibilitySpeakThisString
{
  return [(CKTextBalloonViewAccessibility *)self _axMainContentStringForSpeakThis:1];
}

- (id)accessibilityUserInputLabels
{
  v2 = [(CKTextBalloonViewAccessibility *)self safeValueForKey:@"textView"];
  unint64_t v3 = [v2 accessibilityValue];
  v4 = MEMORY[0x245646F40]();

  return v4;
}

- (id)accessibilityCustomRotors
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  v4 = [(CKTextBalloonViewAccessibility *)self safeValueForKey:@"textView"];
  objc_super v5 = [v4 accessibilityCustomRotors];
  [v3 axSafelyAddObjectsFromArray:v5];

  int v6 = [(CKTextBalloonViewAccessibility *)self _axTextEffectRotor];
  if (!v6)
  {
    objc_initWeak(&location, self);
    id v7 = objc_alloc(MEMORY[0x263F1C398]);
    unint64_t v8 = accessibilityLocalizedString(@"texteffects.rotor.name");
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __59__CKTextBalloonViewAccessibility_accessibilityCustomRotors__block_invoke;
    uint64_t v17 = &unk_265113180;
    objc_copyWeak(&v18, &location);
    int v6 = (void *)[v7 initWithName:v8 itemSearchBlock:&v14];

    -[CKTextBalloonViewAccessibility _setAXTextEffectRotor:](self, "_setAXTextEffectRotor:", v6, v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  [(CKTextBalloonViewAccessibility *)self _accessibilityUpdateTextEffectsIfNeeded];
  uint64_t v9 = [(CKTextBalloonViewAccessibility *)self _axTextEffectMentionElements];
  uint64_t v10 = [v9 count];

  if (v10) {
    [v3 axSafelyAddObject:v6];
  }
  if ([v3 count]) {
    id v11 = v3;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

id __59__CKTextBalloonViewAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _accessibilityUpdateTextEffectsIfNeeded];
  objc_super v5 = [WeakRetained _axTextEffectMentionElements];
  if (![v5 count])
  {
    id v10 = 0;
    goto LABEL_14;
  }
  int v6 = [v3 currentItem];
  id v7 = [v6 targetElement];

  if (!v7) {
    goto LABEL_12;
  }
  uint64_t v8 = [v5 indexOfObject:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = 0;
  }
  else
  {
    uint64_t v11 = v8;
    if ([v3 searchDirection]) {
      unint64_t v9 = v11 + 1;
    }
    else {
      unint64_t v9 = v11 - 1;
    }
    if ((v9 & 0x8000000000000000) != 0) {
      goto LABEL_12;
    }
  }
  if (v9 >= [v5 count])
  {
LABEL_12:
    id v10 = 0;
    goto LABEL_13;
  }
  id v10 = objc_alloc_init(MEMORY[0x263F1C3A0]);
  id v12 = [v5 objectAtIndexedSubscript:v9];
  [v10 setTargetElement:v12];

LABEL_13:
LABEL_14:

  return v10;
}

- (id)accessibilityCustomContent
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(CKTextBalloonViewAccessibility *)self _accessibilityUpdateTextEffectsIfNeeded];
  id v3 = [(CKTextBalloonViewAccessibility *)self _axTextEffectMentionElements];
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
        uint64_t v11 = accessibilityLocalizedString(@"texteffects.rotor.name");
        id v12 = [v9 accessibilityLabel];
        v13 = [v9 accessibilityValue];
        uint64_t v14 = __UIAXStringForVariables();
        uint64_t v15 = objc_msgSend(v10, "customContentWithLabel:value:", v11, v14, v13, @"__AXStringForVariablesSentinel");
        [v4 axSafelyAddObject:v15];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)_allowCustomActionHintSpeakOverride
{
  v2 = [(CKTextBalloonViewAccessibility *)self safeValueForKey:@"textView"];
  char v3 = [v2 safeBoolForKey:@"_allowCustomActionHintSpeakOverride"];

  return v3;
}

- (void)_accessibilityUpdateTextEffectsIfNeeded
{
  objc_opt_class();
  char v3 = [(CKTextBalloonViewAccessibility *)self safeValueForKey:@"textView"];
  id v4 = __UIAccessibilityCastAsClass();

  if (v4)
  {
    uint64_t v5 = [v4 attributedText];
    uint64_t v6 = [(CKTextBalloonViewAccessibility *)self _axAttributedText];
    char v7 = [v5 isEqualToAttributedString:v6];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = _AXCKTextEffectMentions(v4);
      [(CKTextBalloonViewAccessibility *)self _axSetTextEffectMentionElements:v8];

      unint64_t v9 = [v4 attributedText];
      [(CKTextBalloonViewAccessibility *)self _axSetAttributedText:v9];
    }
  }
}

- (void)setAttributedText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKTextBalloonViewAccessibility;
  [(CKTextBalloonViewAccessibility *)&v4 setAttributedText:a3];
  [(CKTextBalloonViewAccessibility *)self _accessibilityUpdateTextEffectsIfNeeded];
}

- (void)prepareForDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)CKTextBalloonViewAccessibility;
  [(CKTextBalloonViewAccessibility *)&v3 prepareForDisplay];
  [(CKTextBalloonViewAccessibility *)self _accessibilityUpdateTextEffectsIfNeeded];
}

@end