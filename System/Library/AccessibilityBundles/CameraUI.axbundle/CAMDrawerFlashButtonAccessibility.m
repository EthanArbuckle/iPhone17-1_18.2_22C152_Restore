@interface CAMDrawerFlashButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
@end

@implementation CAMDrawerFlashButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerFlashButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerFlashButton", @"flashMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_itemLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_cachedMenuItems", "@", 0);
  [v3 validateClass:@"CAMDrawerFlashButton" isKindOfClass:@"CAMControlDrawerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuItem", @"value", "@", 0);
  [v3 validateClass:@"CAMDrawerFlashButton" isKindOfClass:@"CAMControlDrawerMenuButton"];
}

- (BOOL)accessibilityActivate
{
  if (AXRequestingClient() == 3)
  {
    id v3 = [(CAMDrawerFlashButtonAccessibility *)self safeValueForKey:@"flashMode"];
    uint64_t v4 = [v3 integerValue];

    uint64_t v5 = 2 * (v4 != 1);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __58__CAMDrawerFlashButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_26509FBE8;
    if (v4 == 2) {
      uint64_t v5 = 1;
    }
    v12 = self;
    uint64_t v13 = v5;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMDrawerFlashButtonAccessibility;
    return [(CAMDrawerFlashButtonAccessibility *)&v7 accessibilityActivate];
  }
}

void __58__CAMDrawerFlashButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setFlashMode:*(void *)(a1 + 40)];
  v1 = __UIAccessibilitySafeClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityHint
{
  return accessibilityCameraKitLocalizedString(@"FLASH_MODE_BUTTON_HINT");
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
  v2 = [(CAMDrawerFlashButtonAccessibility *)self safeValueForKey:@"flashMode"];
  unint64_t v3 = [v2 integerValue];

  if (v3 > 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = accessibilityCameraKitLocalizedString(off_26509FF58[v3]);
  }

  return v4;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CAMDrawerFlashButtonAccessibility;
  [(CAMDrawerFlashButtonAccessibility *)&v9 layoutSubviews];
  unint64_t v3 = [(CAMDrawerFlashButtonAccessibility *)self safeArrayForKey:@"_itemLabels"];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__3;
  v7[4] = __Block_byref_object_dispose__3;
  id v8 = [(CAMDrawerFlashButtonAccessibility *)self safeArrayForKey:@"_cachedMenuItems"];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_26509FC60;
  v4[4] = v7;
  objc_copyWeak(&v5, &location);
  [v3 enumerateObjectsUsingBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  _Block_object_dispose(v7, 8);
}

void __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 setIsAccessibilityElement:1];
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] > a3)
  {
    v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndex:a3];
    unint64_t v7 = [v6 safeIntegerForKey:@"value"];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke_2;
    v12[3] = &unk_26509FC10;
    objc_copyWeak(v13, (id *)(a1 + 40));
    v13[1] = (id)v7;
    [v5 _setAccessibilityTraitsBlock:v12];
    if (v7 >= 3)
    {
      id v8 = 0;
    }
    else
    {
      id v8 = accessibilityCameraKitLocalizedString(off_26509FF58[v7]);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke_3;
    v10[3] = &unk_26509FC38;
    id v9 = v8;
    id v11 = v9;
    [v5 _setAccessibilityLabelBlock:v10];

    objc_destroyWeak(v13);
  }
}

uint64_t __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained safeIntegerForKey:@"flashMode"] == *(void *)(a1 + 40)) {
    uint64_t v3 = *MEMORY[0x263F1CF38];
  }
  else {
    uint64_t v3 = 1;
  }
  uint64_t v4 = v3 | *MEMORY[0x263F1CEE8];

  return v4;
}

id __51__CAMDrawerFlashButtonAccessibility_layoutSubviews__block_invoke_3()
{
  v0 = accessibilityCameraKitLocalizedString(@"FLASH_MODE_BUTTON_LABEL");
  v1 = __UIAXStringForVariables();

  return v1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerFlashButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMDrawerFlashButtonAccessibility *)&v3 accessibilityTraits];
}

@end