@interface MFModernComposeRecipientAtomAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axMFAddressIsSafeDomain;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MFModernComposeRecipientAtomAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFModernComposeRecipientAtom";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MFModernComposeRecipientAtom" isKindOfClass:@"MFModernAtomView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFModernAtomView", @"presentationOptions", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipient", @"normalizedAddress", "@", 0);
  [v3 validateClass:@"MFModernComposeRecipientAtom" hasInstanceVariable:@"_recipient" withType:"MFComposeRecipient"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeRecipient", @"address", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSString", @"mf_addressDomain", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  NSClassFromString(&cfstr_Mfmoderncompos.isa);
  if (objc_opt_isKindOfClass())
  {
    v2 = accessibilityLocalizedString(@"address.atom.hint");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  id v3 = [(MFModernComposeRecipientAtomAccessibility *)self safeValueForKey:@"recipient"];
  v4 = [v3 accessibilityLabel];

  v5 = [(MFModernComposeRecipientAtomAccessibility *)self safeValueForKey:@"recipient"];
  v6 = [v5 safeValueForKey:@"normalizedAddress"];

  if ([v4 isEqualToString:v6])
  {

    v6 = 0;
  }
  v7 = __UIAXStringForVariables();

  v8 = [(MFModernComposeRecipientAtomAccessibility *)self safeValueForKey:@"presentationOptions", v6, @"__AXStringForVariablesSentinel"];
  uint64_t v9 = (int)[v8 intValue];

  v10 = @"address.madrid.failure";
  if (v9 != 1 && v9 != 64)
  {
    if (v9 != 4) {
      goto LABEL_8;
    }
    v10 = @"address.madrid.loading";
  }
  v14 = accessibilityLocalizedString(v10);
  v16 = @"__AXStringForVariablesSentinel";
  uint64_t v11 = __UIAXStringForVariables();

  v7 = (void *)v11;
LABEL_8:
  if (![(MFModernComposeRecipientAtomAccessibility *)self _axMFAddressIsSafeDomain])
  {
    v15 = accessibilityLocalizedString(@"address.marked");
    uint64_t v12 = __UIAXStringForVariables();

    v7 = (void *)v12;
  }

  return v7;
}

- (BOOL)_axMFAddressIsSafeDomain
{
  v2 = [(MFModernComposeRecipientAtomAccessibility *)self safeValueForKey:@"_recipient"];
  id v3 = [v2 safeValueForKey:@"address"];
  v4 = [v3 safeValueForKey:@"mf_addressDomain"];

  v5 = [MEMORY[0x263F53C50] sharedConnection];
  v6 = [v5 managedEmailDomains];

  if (v6) {
    char v7 = [v6 containsObject:v4];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

@end