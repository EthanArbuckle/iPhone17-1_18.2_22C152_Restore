@interface SBUIPasscodeLockViewBaseAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityActivateKeyboardReturnKey;
- (BOOL)_accessibilityEntryFieldIsFirstResponder;
- (BOOL)_accessibilityHandwritingAttributeShouldEchoCharacter;
- (BOOL)_accessibilityHandwritingAttributeShouldPlayKeyboardSecureClickSound;
- (BOOL)_accessibilityHasDeletableText;
- (BOOL)_accessibilitySupportsHandwriting;
- (BOOL)_accessibilitySupportsTextInsertionAndDeletion;
- (BOOL)becomeFirstResponder;
- (unint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets;
- (unint64_t)_accessibilityHandwritingAttributePreferredCharacterSet;
- (void)_accessibilityInsertText:(id)a3;
- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4;
- (void)_resetForFailedPasscode:(BOOL)a3;
- (void)_setPasscodeLockViewState:(int64_t)a3 animated:(BOOL)a4;
- (void)_updateStatusTextForBioEvent:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation SBUIPasscodeLockViewBaseAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUIPasscodeLockViewBase";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeLockViewBase", @"style", "i", 0);
  [v3 validateClass:@"SBUIPasscodeLockViewWithKeypad" hasInstanceVariable:@"_entryField" withType:"SBUIPasscodeEntryField"];
  [v3 validateClass:@"SBUIPasscodeLockViewWithKeyboard" hasInstanceVariable:@"_alphaEntryField" withType:"SBUIAlphanumericPasscodeEntryField"];
  [v3 validateClass:@"SBUIPasscodeLockViewWithKeyboard" hasInstanceVariable:@"_entryField" withType:"SBUIPasscodeEntryField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeEntryField", @"stringValue", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeEntryField", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeEntryField", @"appendString:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeEntryField", @"deleteLastCharacter", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeLockViewBase", @"_resetForFailedPasscode:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeLockViewBase", @"_setPasscodeLockViewState:animated:", "v", "q", "B", 0);
  [v3 validateClass:@"SBUIPasscodeLockViewBase" hasInstanceVariable:@"_statusText" withType:"NSString"];
  [v3 validateClass:@"SBUIPasscodeLockViewBase" hasInstanceVariable:@"_statusState" withType:"Q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUIPasscodeLockViewBase", @"_updateStatusTextForBioEvent: animated:", "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSString", @"isNewline", "B", 0);
}

- (BOOL)_accessibilitySupportsHandwriting
{
  return 1;
}

- (unint64_t)_accessibilityHandwritingAttributePreferredCharacterSet
{
  v2 = [(SBUIPasscodeLockViewBaseAccessibility *)self safeValueForKey:@"style"];
  unsigned int v3 = [v2 intValue];

  if (v3 >= 3) {
    return 1;
  }
  else {
    return 4;
  }
}

- (unint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets
{
  unsigned int v3 = [(SBUIPasscodeLockViewBaseAccessibility *)self safeValueForKey:@"style"];
  unsigned int v4 = [v3 intValue];

  if (v4 < 2) {
    return 4;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility;
  return [(SBUIPasscodeLockViewBaseAccessibility *)&v6 _accessibilityHandwritingAttributeAllowedCharacterSets];
}

- (BOOL)_accessibilityHasDeletableText
{
  v2 = [(SBUIPasscodeLockViewBaseAccessibility *)self safeValueForKey:@"_entryField"];
  unsigned int v3 = [v2 safeValueForKey:@"stringValue"];

  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v6 = v3;
  AXPerformSafeBlock();
  uint64_t v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4 != 0;
}

uint64_t __71__SBUIPasscodeLockViewBaseAccessibility__accessibilityHasDeletableText__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) length];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_accessibilityHandwritingAttributeShouldEchoCharacter
{
  return 0;
}

- (BOOL)_accessibilityHandwritingAttributeShouldPlayKeyboardSecureClickSound
{
  return 1;
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  return 1;
}

- (void)_accessibilityInsertText:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(SBUIPasscodeLockViewBaseAccessibility *)self safeValueForKey:@"_entryField"];
    id v7 = v4;
    v8 = v5;
    id v6 = v5;
    AXPerformSafeBlock();
  }
}

void __66__SBUIPasscodeLockViewBaseAccessibility__accessibilityInsertText___block_invoke(uint64_t a1)
{
  for (unint64_t i = 0; i != 0x7FFFFFFFFFFFFFFFLL; unint64_t i = v5 + v6)
  {
    if (i >= [*(id *)(a1 + 32) length]) {
      break;
    }
    uint64_t v3 = [*(id *)(a1 + 32) rangeOfComposedCharacterSequenceAtIndex:i];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v5 = v3;
    uint64_t v6 = v4;
    id v7 = *(void **)(a1 + 40);
    v8 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v4);
    [v7 appendString:v8];
  }
}

- (BOOL)_accessibilityActivateKeyboardReturnKey
{
  uint64_t v3 = [(SBUIPasscodeLockViewBaseAccessibility *)self safeValueForKey:@"style"];
  int v4 = [v3 intValue];

  if (v4 != 3
    || (v6.receiver = self,
        v6.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility,
        ![(SBUIPasscodeLockViewBaseAccessibility *)&v6 _accessibilityActivateKeyboardReturnKey]))
  {
    [(SBUIPasscodeLockViewBaseAccessibility *)self _accessibilityInsertText:@"\n"];
  }
  return 1;
}

- (void)_resetForFailedPasscode:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility;
  [(SBUIPasscodeLockViewBaseAccessibility *)&v5 _resetForFailedPasscode:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21968]);
  int v4 = accessibilitySBLocalizedString(@"failed.passcode");
  UIAccessibilityPostNotification(v3, v4);
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(SBUIPasscodeLockViewBaseAccessibility *)self safeValueForKey:@"_entryField"];
  id v7 = v5;
  id v8 = v6;
  AXPerformSafeBlock();
}

uint64_t __92__SBUIPasscodeLockViewBaseAccessibility__accessibilityReplaceCharactersAtCursor_withString___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 56))
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t result = [*(id *)(v1 + 32) deleteLastCharacter];
      ++v2;
    }
    while (v2 < *(void *)(v1 + 56));
  }
  if (*(void *)(v1 + 40))
  {
    UIAccessibilityNotifications v3 = *(void **)(v1 + 48);
    return objc_msgSend(v3, "_accessibilityInsertText:");
  }
  return result;
}

- (BOOL)_accessibilityEntryFieldIsFirstResponder
{
  unint64_t v2 = [(SBUIPasscodeLockViewBaseAccessibility *)self safeValueForKey:@"_entryField"];
  objc_opt_class();
  UIAccessibilityNotifications v3 = __UIAccessibilityCastAsClass();
  char v4 = [v3 isFirstResponder];

  return v4;
}

- (void)_updateStatusTextForBioEvent:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = [(SBUIPasscodeLockViewBaseAccessibility *)self _accessibilityEntryFieldIsFirstResponder];
  id v8 = [(SBUIPasscodeLockViewBaseAccessibility *)self safeValueForKey:@"_statusText"];
  v11.receiver = self;
  v11.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility;
  [(SBUIPasscodeLockViewBaseAccessibility *)&v11 _updateStatusTextForBioEvent:a3 animated:v4];
  if (v7)
  {
    uint64_t v9 = [(SBUIPasscodeLockViewBaseAccessibility *)self safeValueForKey:@"_statusText"];
    if (([(SBUIPasscodeLockViewBaseAccessibility *)self safeIntegerForKey:@"_statusState"] & 0xFFFFFFFFFFFFFFFELL) == 8
      || ([v8 isEqualToString:v9] & 1) == 0)
    {
      if ([v9 length])
      {
        uint64_t v10 = [MEMORY[0x263F21660] axAttributedStringWithString:v9];
        [v10 setAttribute:&unk_26F7F59A0 forKey:*MEMORY[0x263F216D8]];
        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v10);
      }
    }
  }
}

- (BOOL)becomeFirstResponder
{
  v20.receiver = self;
  v20.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility;
  BOOL v3 = [(SBUIPasscodeLockViewBaseAccessibility *)&v20 becomeFirstResponder];
  if ([(SBUIPasscodeLockViewBaseAccessibility *)self safeIntegerForKey:@"_statusState"] == 1
    && v3)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    id v19 = 0;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    uint64_t v10 = __61__SBUIPasscodeLockViewBaseAccessibility_becomeFirstResponder__block_invoke;
    objc_super v11 = &unk_265159D88;
    v12 = self;
    v13 = &v14;
    AXPerformSafeBlock();
    id v5 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

    UIAccessibilitySpeakOrQueueIfNeeded();
  }
  objc_super v6 = objc_msgSend(MEMORY[0x263F1C920], "mainScreen", v8, v9, v10, v11, v12, v13);
  [v6 setNeedsFocusUpdate];

  return v3;
}

void __61__SBUIPasscodeLockViewBaseAccessibility_becomeFirstResponder__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"_statusSubtitleText"];
  uint64_t v2 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_setPasscodeLockViewState:(int64_t)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility;
  -[SBUIPasscodeLockViewBaseAccessibility _setPasscodeLockViewState:animated:](&v4, sel__setPasscodeLockViewState_animated_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __76__SBUIPasscodeLockViewBaseAccessibility__setPasscodeLockViewState_animated___block_invoke()
{
}

@end