@interface MFModernAddressAtomAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MFModernAddressAtomAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFModernAddressAtom";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFModernAddressAtom" hasInstanceVariable:@"_atomView" withType:"CNAtomView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFModernLabelledAtomList", @"label", "@", 0);
  [v3 validateClass:@"MFModernLabelledAtomList"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MFModernAddressAtomAccessibility *)self safeValueForKey:@"_atomView"];
  v4 = [v3 accessibilityLabel];

  v5 = accessibilityLocalizedString(@"address.atom.type");
  v6 = [(MFModernAddressAtomAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_3 startWithSelf:0];
  if (v6)
  {
    objc_opt_class();
    v7 = [v6 safeValueForKey:@"label"];
    v8 = __UIAccessibilityCastAsClass();

    v9 = accessibilityLocalizedString(@"from.text");
    v10 = [v8 text];
    v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v12 = [v9 stringByTrimmingCharactersInSet:v11];
    int v13 = [v10 containsString:v12];

    if (v13)
    {
      v14 = __UIAXStringForVariables();

      goto LABEL_6;
    }
  }
  v14 = __UIAXStringForVariables();
LABEL_6:

  return v14;
}

uint64_t __54__MFModernAddressAtomAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mfmodernlabell.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"address.atom.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end