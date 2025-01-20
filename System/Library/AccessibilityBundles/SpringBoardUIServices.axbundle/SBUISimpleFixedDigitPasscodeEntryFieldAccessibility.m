@interface SBUISimpleFixedDigitPasscodeEntryFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHandwritingAttributeAcceptsContractedBraille;
- (BOOL)_accessibilitySupportsTextInsertionAndDeletion;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_deleteLastCharacter;
@end

@implementation SBUISimpleFixedDigitPasscodeEntryFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBUISimpleFixedDigitPasscodeEntryField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBUIPasscodeLockViewBase"];
  [v3 validateClass:@"SBUIPasscodeEntryField" hasInstanceVariable:@"_textField" withType:"SBUIPasscodeTextField"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUINumericPasscodeEntryFieldBase", @"maxNumbersAllowed", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBUISimpleFixedDigitPasscodeEntryField", @"_deleteLastCharacter", "v", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(SBUISimpleFixedDigitPasscodeEntryFieldAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbuipasscodelo_5.isa)];
  int v4 = [v3 _accessibilityViewIsVisible];

  if (!v4) {
    return 0;
  }

  return [(SBUISimpleFixedDigitPasscodeEntryFieldAccessibility *)self _accessibilityViewIsVisible];
}

- (id)accessibilityLabel
{
  v2 = [(SBUISimpleFixedDigitPasscodeEntryFieldAccessibility *)self safeValueForKey:@"_textField"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(SBUISimpleFixedDigitPasscodeEntryFieldAccessibility *)self safeValueForKey:@"maxNumbersAllowed"];
  uint64_t v4 = [v3 unsignedIntegerValue];

  objc_opt_class();
  v5 = [(SBUISimpleFixedDigitPasscodeEntryFieldAccessibility *)self safeValueForKey:@"_textField"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 text];
  uint64_t v8 = [v7 length];

  v9 = NSString;
  v10 = accessibilitySBLocalizedString(@"passcode.values.entered");
  v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v8, v4);

  return v11;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(SBUISimpleFixedDigitPasscodeEntryFieldAccessibility *)self safeValueForKey:@"_textField"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (void)_deleteLastCharacter
{
  v5.receiver = self;
  v5.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryFieldAccessibility;
  [(SBUISimpleFixedDigitPasscodeEntryFieldAccessibility *)&v5 _deleteLastCharacter];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  uint64_t v4 = [(SBUISimpleFixedDigitPasscodeEntryFieldAccessibility *)self accessibilityValue];
  UIAccessibilityPostNotification(v3, v4);
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  return 1;
}

- (BOOL)_accessibilityHandwritingAttributeAcceptsContractedBraille
{
  return 0;
}

@end