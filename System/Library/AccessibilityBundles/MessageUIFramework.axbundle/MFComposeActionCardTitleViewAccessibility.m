@interface MFComposeActionCardTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)didMoveToWindow;
@end

@implementation MFComposeActionCardTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFComposeActionCardTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFComposeActionCardTitleView", @"titleLabel", "@", 0);
  [v3 validateClass:@"MFComposeActionCardTitleView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"UIDimmingView"];
  [v3 validateClass:@"UITransitionView"];
  [v3 validateClass:@"UIDropShadowView"];
  [v3 validateClass:@"MFMailComposeView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)MFComposeActionCardTitleViewAccessibility;
  [(MFComposeActionCardTitleViewAccessibility *)&v29 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MFComposeActionCardTitleViewAccessibility *)self safeValueForKey:@"titleLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  v4 = [(MFComposeActionCardTitleViewAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Uitransitionvi.isa)];
  v5 = [MEMORY[0x263EFF980] array];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __87__MFComposeActionCardTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v27[3] = &unk_2650A3F28;
  id v6 = v5;
  id v28 = v6;
  id v7 = (id)[v4 _accessibilityFindSubviewDescendant:v27];
  char v26 = 0;
  objc_opt_class();
  v8 = __UIAccessibilityCastAsClass();
  v9 = [v8 window];
  v10 = [v9 _accessibilityFindSubviewDescendant:&__block_literal_global_0];

  v11 = [v10 _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Uidropshadowvi.isa)];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __87__MFComposeActionCardTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v24[3] = &unk_2650A3F28;
  id v12 = v6;
  id v25 = v12;
  id v13 = (id)[v11 _accessibilityFindSubviewDescendant:v24];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_msgSend(v19, "setAccessibilityViewIsModal:", 0, (void)v20);
        [v19 setAccessibilityContainerType:0];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v16);
  }
}

uint64_t __87__MFComposeActionCardTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSClassFromString(&cfstr_Uidimmingview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return isKindOfClass & 1;
}

uint64_t __87__MFComposeActionCardTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mfmailcomposev.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __87__MFComposeActionCardTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSClassFromString(&cfstr_Uidimmingview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MFComposeActionCardTitleViewAccessibility;
  [(MFComposeActionCardTitleViewAccessibility *)&v3 didMoveToWindow];
  [(MFComposeActionCardTitleViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end