@interface CAMDrawerRAWButtonAccessibility
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

@implementation CAMDrawerRAWButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerRAWButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerRAWButton", @"rawMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_itemLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_cachedMenuItems", "@", 0);
  [v3 validateClass:@"CAMDrawerRAWButton" isKindOfClass:@"CAMControlDrawerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuItem", @"value", "@", 0);
  [v3 validateClass:@"CAMDrawerRAWButton" isKindOfClass:@"CAMControlDrawerMenuButton"];
}

- (BOOL)accessibilityActivate
{
  if (AXRequestingClient() == 3)
  {
    uint64_t v3 = [(CAMDrawerRAWButtonAccessibility *)self safeIntegerForKey:@"rawMode"];
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __56__CAMDrawerRAWButtonAccessibility_accessibilityActivate__block_invoke;
    v9 = &unk_26509FBE8;
    v10 = self;
    BOOL v11 = v3 == 0;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CAMDrawerRAWButtonAccessibility;
    return [(CAMDrawerRAWButtonAccessibility *)&v5 accessibilityActivate];
  }
}

void __56__CAMDrawerRAWButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRAWMode:*(void *)(a1 + 40)];
  v1 = __UIAccessibilitySafeClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityHint
{
  return accessibilityCameraUIAzulCLocalizedString(@"RAW_MODE_BUTTON_HINT");
}

- (id)accessibilityLabel
{
  return accessibilityCameraUIAzulCLocalizedString(@"RAW_MODE_BUTTON_LABEL");
}

- (id)accessibilityIdentifier
{
  return @"RAWMode";
}

- (id)accessibilityValue
{
  uint64_t v3 = [(CAMDrawerRAWButtonAccessibility *)self safeValueForKey:@"rawMode"];
  uint64_t v4 = [v3 integerValue];

  if (v4 == 1)
  {
    objc_super v5 = @"RAW_MODE_BUTTON_VALUE_ON";
    goto LABEL_5;
  }
  if (!v4)
  {
    objc_super v5 = @"RAW_MODE_BUTTON_VALUE_OFF";
LABEL_5:
    uint64_t v6 = accessibilityCameraUIAzulCLocalizedString(v5);
    goto LABEL_7;
  }
  v8.receiver = self;
  v8.super_class = (Class)CAMDrawerRAWButtonAccessibility;
  uint64_t v6 = [(CAMDrawerRAWButtonAccessibility *)&v8 accessibilityValue];
LABEL_7:

  return v6;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerRAWButtonAccessibility;
  [(CAMDrawerRAWButtonAccessibility *)&v7 layoutSubviews];
  uint64_t v3 = [(CAMDrawerRAWButtonAccessibility *)self safeArrayForKey:@"_itemLabels"];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__1;
  v5[4] = __Block_byref_object_dispose__1;
  id v6 = [(CAMDrawerRAWButtonAccessibility *)self safeArrayForKey:@"_cachedMenuItems"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__CAMDrawerRAWButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_26509FCE8;
  v4[4] = v5;
  [v3 enumerateObjectsUsingBlock:v4];
  _Block_object_dispose(v5, 8);
}

void __49__CAMDrawerRAWButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
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
      objc_super v8 = @"RAW_MODE_BUTTON_VALUE_ON";
    }
    else
    {
      objc_super v8 = @"RAW_MODE_BUTTON_VALUE_OFF";
    }
    v9 = accessibilityCameraUIAzulCLocalizedString(v8);
LABEL_8:
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__CAMDrawerRAWButtonAccessibility_layoutSubviews__block_invoke_2;
    v11[3] = &unk_26509FC38;
    id v12 = v9;
    id v10 = v9;
    [v5 _setAccessibilityLabelBlock:v11];
  }
}

id __49__CAMDrawerRAWButtonAccessibility_layoutSubviews__block_invoke_2()
{
  v0 = accessibilityCameraUIAzulCLocalizedString(@"RAW_MODE_BUTTON_LABEL");
  v1 = __UIAXStringForVariables();

  return v1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerRAWButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMDrawerRAWButtonAccessibility *)&v3 accessibilityTraits];
}

@end