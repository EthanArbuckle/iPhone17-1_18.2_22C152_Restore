@interface CAMFlashButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)startExpansionWithProposedFrame:(CGRect)a3;
@end

@implementation CAMFlashButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMFlashButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFlashButton", @"setFlashMode:", "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFlashButton", @"flashMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandableMenuButton", @"startExpansionWithProposedFrame:", "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"CAMFlashButton" isKindOfClass:@"CAMExpandableMenuButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFlashButton", @"modeForIndex:", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFlashButton", @"isUnavailable", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMFlashButton", @"titleForMenuItemAtIndex:", "@", "q", 0);
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  if (AXRequestingClient() == 3)
  {
    id v3 = [(CAMFlashButtonAccessibility *)self safeValueForKey:@"flashMode"];
    uint64_t v4 = [v3 integerValue];

    uint64_t v5 = v4 != 1;
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __52__CAMFlashButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_26509FBE8;
    if (!v4) {
      uint64_t v5 = 2;
    }
    v12 = self;
    uint64_t v13 = v5;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMFlashButtonAccessibility;
    return [(CAMFlashButtonAccessibility *)&v7 accessibilityActivate];
  }
}

void __52__CAMFlashButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFlashMode:*(void *)(a1 + 40)];
  v1 = __UIAccessibilitySafeClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityHint
{
  if ([(CAMFlashButtonAccessibility *)self safeBoolForKey:@"isUnavailable"])
  {
    v2 = 0;
  }
  else
  {
    v2 = accessibilityCameraKitLocalizedString(@"FLASH_MODE_BUTTON_HINT");
  }

  return v2;
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"FLASH_MODE_BUTTON_LABEL");
}

- (id)accessibilityIdentifier
{
  return @"FlashButton";
}

- (id)accessibilityValue
{
  if ([(CAMFlashButtonAccessibility *)self safeBoolForKey:@"isUnavailable"])
  {
    id v3 = @"FLASH_MODE_BUTTON_UNAVAILABLE";
  }
  else
  {
    uint64_t v4 = [(CAMFlashButtonAccessibility *)self safeValueForKey:@"flashMode"];
    uint64_t v5 = [v4 integerValue];

    v6 = @"FLASH_MODE_BUTTON_VALUE_AUTO";
    if (v5 == 1) {
      v6 = @"FLASH_MODE_BUTTON_VALUE_ON";
    }
    if (v5) {
      id v3 = v6;
    }
    else {
      id v3 = @"FLASH_MODE_BUTTON_VALUE_OFF";
    }
  }
  objc_super v7 = accessibilityCameraKitLocalizedString(v3);

  return v7;
}

- (void)startExpansionWithProposedFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMFlashButtonAccessibility;
  -[CAMFlashButtonAccessibility startExpansionWithProposedFrame:](&v6, sel_startExpansionWithProposedFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  uint64_t v4 = [(CAMFlashButtonAccessibility *)self safeArrayForKey:@"_menuItems"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke;
  v5[3] = &unk_2650A0120;
  v5[4] = self;
  [v4 enumerateObjectsUsingBlock:v5];
}

void __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 setIsAccessibilityElement:1];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  v18 = 0;
  uint64_t v21 = MEMORY[0x263EF8330];
  uint64_t v22 = 3221225472;
  v23 = __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_2;
  v24 = &unk_2650A00D0;
  uint64_t v25 = *(void *)(a1 + 32);
  v26 = &v15;
  uint64_t v27 = a3;
  AXPerformSafeBlock();
  uint64_t v6 = v16[3];
  _Block_object_dispose(&v15, 8);
  objc_super v7 = &__block_literal_global_10;
  if (v6 == 1) {
    objc_super v7 = &__block_literal_global_360;
  }
  if (v6 == 2) {
    uint64_t v8 = &__block_literal_global_362;
  }
  else {
    uint64_t v8 = v7;
  }
  [v5 _setAccessibilityLabelBlock:v8];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  id v20 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = a3;
  AXPerformSafeBlock();
  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  if (objc_msgSend(v9, "length", v12, 3221225472, __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_363, &unk_2650A00D0, v13, &v15, v14))
  {
    v10 = [MEMORY[0x263EFF980] array];
    [v10 axSafelyAddObject:v9];
    v11 = [v5 accessibilityLabel];
    [v10 axSafelyAddObject:v11];

    [v5 setAccessibilityUserInputLabels:v10];
  }
}

uint64_t __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) modeForIndex:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_3()
{
  return accessibilityCameraKitLocalizedString(@"FLASH_MODE_BUTTON_VALUE_OFF");
}

id __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_4()
{
  return accessibilityCameraKitLocalizedString(@"FLASH_MODE_BUTTON_VALUE_ON");
}

id __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_5()
{
  return accessibilityCameraKitLocalizedString(@"FLASH_MODE_BUTTON_VALUE_AUTO");
}

uint64_t __63__CAMFlashButtonAccessibility_startExpansionWithProposedFrame___block_invoke_363(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) titleForMenuItemAtIndex:*(void *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMFlashButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMFlashButtonAccessibility *)&v3 accessibilityTraits];
}

@end