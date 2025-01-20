@interface CAMDrawerHDRButtonAccessibility
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

@implementation CAMDrawerHDRButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerHDRButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerHDRButton", @"hdrMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_itemLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_cachedMenuItems", "@", 0);
  [v3 validateClass:@"CAMDrawerHDRButton" isKindOfClass:@"CAMControlDrawerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuItem", @"value", "@", 0);
  [v3 validateClass:@"CAMDrawerHDRButton" isKindOfClass:@"CAMControlDrawerMenuButton"];
}

- (BOOL)accessibilityActivate
{
  if (AXRequestingClient() == 3)
  {
    uint64_t v3 = [(CAMDrawerHDRButtonAccessibility *)self safeIntegerForKey:@"hdrMode"];
    uint64_t v4 = 2 * (v3 != 1);
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __56__CAMDrawerHDRButtonAccessibility_accessibilityActivate__block_invoke;
    v10 = &unk_26509FBE8;
    if (v3 == 2) {
      uint64_t v4 = 1;
    }
    v11 = self;
    uint64_t v12 = v4;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CAMDrawerHDRButtonAccessibility;
    return [(CAMDrawerHDRButtonAccessibility *)&v6 accessibilityActivate];
  }
}

void __56__CAMDrawerHDRButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHDRMode:*(void *)(a1 + 40)];
  v1 = __UIAccessibilitySafeClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(@"HDR_MODE_BUTTON_HINT");
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"HDR_MODE_BUTTON_LABEL");
}

- (id)accessibilityIdentifier
{
  return @"HDRButton";
}

- (id)accessibilityValue
{
  v2 = [(CAMDrawerHDRButtonAccessibility *)self safeValueForKey:@"hdrMode"];
  unint64_t v3 = [v2 integerValue];

  if (v3 > 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = accessibilityCameraUILocalizedString(off_26509FF70[v3]);
  }

  return v4;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerHDRButtonAccessibility;
  [(CAMDrawerHDRButtonAccessibility *)&v7 layoutSubviews];
  unint64_t v3 = [(CAMDrawerHDRButtonAccessibility *)self safeArrayForKey:@"_itemLabels"];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__4;
  v5[4] = __Block_byref_object_dispose__4;
  id v6 = [(CAMDrawerHDRButtonAccessibility *)self safeArrayForKey:@"_cachedMenuItems"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__CAMDrawerHDRButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_26509FCE8;
  v4[4] = v5;
  [v3 enumerateObjectsUsingBlock:v4];
  _Block_object_dispose(v5, 8);
}

void __49__CAMDrawerHDRButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 setIsAccessibilityElement:1];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] > a3)
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndex:a3];
    uint64_t v7 = [v6 safeIntegerForKey:@"value"];

    if (v7)
    {
      if (v7 != 1)
      {
        v9 = 0;
        goto LABEL_8;
      }
      uint64_t v8 = @"HDR_MODE_BUTTON_VALUE_ON";
    }
    else
    {
      uint64_t v8 = @"HDR_MODE_BUTTON_VALUE_OFF";
    }
    v9 = accessibilityCameraUILocalizedString(v8);
LABEL_8:
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__CAMDrawerHDRButtonAccessibility_layoutSubviews__block_invoke_2;
    v11[3] = &unk_26509FC38;
    id v12 = v9;
    id v10 = v9;
    [v5 _setAccessibilityLabelBlock:v11];
  }
}

id __49__CAMDrawerHDRButtonAccessibility_layoutSubviews__block_invoke_2()
{
  v0 = accessibilityCameraUILocalizedString(@"HDR_MODE_BUTTON_LABEL");
  v1 = __UIAXStringForVariables();

  return v1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerHDRButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMDrawerHDRButtonAccessibility *)&v3 accessibilityTraits];
}

@end