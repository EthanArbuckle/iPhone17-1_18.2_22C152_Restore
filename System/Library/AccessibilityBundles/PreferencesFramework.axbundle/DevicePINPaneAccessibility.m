@interface DevicePINPaneAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHandwritingAttributeShouldEchoCharacter;
- (BOOL)_accessibilityHasDeletableText;
- (BOOL)_accessibilitySupportsHandwriting;
- (BOOL)_accessibilitySupportsTextInsertionAndDeletion;
- (DevicePINPaneAccessibility)initWithFrame:(CGRect)a3;
- (id)_accessibilityResponderElement;
- (unint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets;
- (unint64_t)_accessibilityHandwritingAttributePreferredCharacterSet;
- (void)_accessibilityInsertText:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4;
- (void)setPINPolicyString:(id)a3 visible:(BOOL)a4;
- (void)slideToNewPasscodeField:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 transition:(int)a6 showsOptionsButton:(BOOL)a7;
@end

@implementation DevicePINPaneAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DevicePINPane";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DevicePINPane", @"simplePIN", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DevicePINPane", @"insertText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DevicePINPane", @"hasText", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DevicePINPane", @"deleteBackward", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DevicePINPane", @"pinView", "@", 0);
  [v3 validateClass:@"DevicePINPane" isKindOfClass:@"PSEditingPane"];
  [v3 validateClass:@"PSEditingPane" isKindOfClass:@"UIView"];
  [v3 validateClass:@"DevicePINPane" hasInstanceVariable:@"_transitionView" withType:"UITransitionView"];
  [v3 validateClass:@"PSBulletedPINView" hasInstanceVariable:@"_passcodeField" withType:"PSPasscodeField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"DevicePINPane", @"slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:", "v", "B", "B", "B", "i", "B", 0);
}

- (DevicePINPaneAccessibility)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DevicePINPaneAccessibility;
  id v3 = -[DevicePINPaneAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(DevicePINPaneAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  }
  return v4;
}

- (void)setPINPolicyString:(id)a3 visible:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)DevicePINPaneAccessibility;
  id v5 = a3;
  [(DevicePINPaneAccessibility *)&v6 setPINPolicyString:v5 visible:v4];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v5);
}

- (void)slideToNewPasscodeField:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 transition:(int)a6 showsOptionsButton:(BOOL)a7
{
  v12.receiver = self;
  v12.super_class = (Class)DevicePINPaneAccessibility;
  [(DevicePINPaneAccessibility *)&v12 slideToNewPasscodeField:a3 requiresKeyboard:a4 numericOnly:a5 transition:*(void *)&a6 showsOptionsButton:a7];
  UIAccessibilityNotifications v8 = *MEMORY[0x263F1CDC8];
  v9 = [(DevicePINPaneAccessibility *)self safeValueForKey:@"_pinView"];
  v10 = [v9 safeValueForKey:@"_titleLabel"];
  v11 = [v10 accessibilityLabel];
  UIAccessibilityPostNotification(v8, v11);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)DevicePINPaneAccessibility;
  [(DevicePINPaneAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(DevicePINPaneAccessibility *)self safeValueForKey:@"_transitionView"];
  [v3 setAccessibilityViewIsModal:0];
}

- (id)_accessibilityResponderElement
{
  if (![(DevicePINPaneAccessibility *)self safeBoolForKey:@"simplePIN"]
    || ([(DevicePINPaneAccessibility *)self safeValueForKey:@"pinView"],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 safeValueForKey:@"_passcodeField"],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)DevicePINPaneAccessibility;
    objc_super v4 = [(DevicePINPaneAccessibility *)&v6 _accessibilityResponderElement];
  }

  return v4;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  return 1;
}

- (BOOL)_accessibilityHandwritingAttributeShouldEchoCharacter
{
  return 0;
}

- (unint64_t)_accessibilityHandwritingAttributePreferredCharacterSet
{
  v2 = [(DevicePINPaneAccessibility *)self safeValueForKey:@"simplePIN"];
  int v3 = [v2 BOOLValue];

  if (v3) {
    return 4;
  }
  else {
    return 1;
  }
}

- (unint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets
{
  v2 = [(DevicePINPaneAccessibility *)self safeValueForKey:@"simplePIN"];
  int v3 = [v2 BOOLValue];

  if (v3) {
    return 4;
  }
  else {
    return 15;
  }
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  return 1;
}

- (BOOL)_accessibilityHasDeletableText
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  AXPerformSafeBlock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __60__DevicePINPaneAccessibility__accessibilityHasDeletableText__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) hasText];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_accessibilityInsertText:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    AXPerformSafeBlock();
  }
}

uint64_t __55__DevicePINPaneAccessibility__accessibilityInsertText___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _accessibilityPlayKeyboardClickSound];
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 insertText:v3];
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AXPerformSafeBlock();
}

uint64_t __81__DevicePINPaneAccessibility__accessibilityReplaceCharactersAtCursor_withString___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 48))
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t result = [*(id *)(v1 + 32) deleteBackward];
      ++v2;
    }
    while (v2 < *(void *)(v1 + 48));
  }
  if (*(void *)(v1 + 40))
  {
    uint64_t v3 = *(void **)(v1 + 32);
    return objc_msgSend(v3, "_accessibilityInsertText:");
  }
  return result;
}

@end