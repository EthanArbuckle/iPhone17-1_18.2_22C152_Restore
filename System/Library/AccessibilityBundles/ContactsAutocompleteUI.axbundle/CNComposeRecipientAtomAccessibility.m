@interface CNComposeRecipientAtomAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axMFAddressIsSafeDomain;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityElementHelp;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation CNComposeRecipientAtomAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNComposeRecipientAtom";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNComposeRecipientAtom" isKindOfClass:@"CNAtomView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAtomView", @"presentationOptions", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipient", @"displayString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipient", @"compositeName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipient", @"normalizedAddress", "@", 0);
  [v3 validateClass:@"CNComposeRecipientAtom" hasInstanceVariable:@"_recipient" withType:"CNComposeRecipient"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipient", @"address", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSString", @"mf_addressDomain", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNAtomView", @"isSelected", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeRecipientAtom", @"delegate", "@", 0);
  [v3 validateProtocol:@"CNComposeRecipientAtomDelegate" hasRequiredInstanceMethod:@"selectComposeRecipientAtom:"];
  [v3 validateClass:@"CNComposeRecipientTextView" hasProperty:@"delegate" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNComposeHeaderView", @"delegate", "@", 0);
  [v3 validateClass:@"CNComposeRecipientTextView" isKindOfClass:@"CNComposeHeaderView"];
  [v3 validateProtocol:@"CNComposeRecipientTextViewDelegate" hasOptionalInstanceMethod:@"composeRecipientView:disambiguateRecipientForAtom:"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  NSClassFromString(&cfstr_Cncomposerecip_2.isa);
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
  id v3 = [(CNComposeRecipientAtomAccessibility *)self safeValueForKey:@"recipient"];
  v4 = [v3 safeStringForKey:@"displayString"];

  if ([v4 isEqualToString:&stru_26F674198])
  {
    v5 = [(CNComposeRecipientAtomAccessibility *)self safeValueForKey:@"recipient"];
    uint64_t v6 = [v5 safeStringForKey:@"compositeName"];

    v4 = (void *)v6;
  }
  v7 = [(CNComposeRecipientAtomAccessibility *)self safeValueForKey:@"recipient"];
  v8 = [v7 safeStringForKey:@"normalizedAddress"];

  if ([v4 isEqualToString:v8])
  {

    v8 = 0;
  }
  v9 = __UIAXStringForVariables();

  v10 = [(CNComposeRecipientAtomAccessibility *)self safeValueForKey:@"presentationOptions", v8, @"__AXStringForVariablesSentinel"];
  uint64_t v11 = (int)[v10 intValue];

  v12 = @"address.madrid.failure";
  if (v11 <= 63)
  {
    if (v11 != 1)
    {
      if (v11 != 4) {
        goto LABEL_12;
      }
      v12 = @"address.madrid.loading";
    }
    goto LABEL_11;
  }
  if (v11 == 64 || v11 == 0x20000)
  {
LABEL_11:
    v16 = accessibilityLocalizedString(v12);
    v18 = @"__AXStringForVariablesSentinel";
    uint64_t v13 = __UIAXStringForVariables();

    v9 = (void *)v13;
  }
LABEL_12:
  if (![(CNComposeRecipientAtomAccessibility *)self _axMFAddressIsSafeDomain])
  {
    v17 = accessibilityLocalizedString(@"address.marked");
    uint64_t v14 = __UIAXStringForVariables();

    v9 = (void *)v14;
  }

  return v9;
}

- (id)_accessibilityElementHelp
{
  if ([(CNComposeRecipientAtomAccessibility *)self safeBoolForKey:@"isSelected"])
  {
    v2 = accessibilityLocalizedString(@"address.atom.macos.hint");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)accessibilityCustomActions
{
  v11[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x263F1C390]);
  v4 = accessibilityLocalizedString(@"show.alternate.addresses");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__CNComposeRecipientAtomAccessibility_accessibilityCustomActions__block_invoke;
  v8[3] = &unk_265117780;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  v5 = (void *)[v3 initWithName:v4 actionHandler:v8];

  v11[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

uint64_t __65__CNComposeRecipientAtomAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __65__CNComposeRecipientAtomAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained safeValueForKey:@"delegate"];

  id v3 = [v4 safeValueForKey:@"delegate"];
  [v4 selectComposeRecipientAtom:*(void *)(a1 + 32)];
  if (objc_opt_respondsToSelector()) {
    [v3 composeRecipientView:v4 disambiguateRecipientForAtom:*(void *)(a1 + 32)];
  }
}

- (BOOL)_axMFAddressIsSafeDomain
{
  v2 = [(CNComposeRecipientAtomAccessibility *)self safeValueForKey:@"_recipient"];
  id v3 = [v2 safeStringForKey:@"address"];
  id v4 = objc_msgSend(v3, "mf_addressDomain");

  id v5 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v6 = [v5 managedEmailDomains];

  if (v6) {
    char v7 = [v6 containsObject:v4];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

@end