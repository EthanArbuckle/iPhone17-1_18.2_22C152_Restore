@interface CAMDrawerAspectRatioButtonAccessibility
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

@implementation CAMDrawerAspectRatioButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerAspectRatioButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerAspectRatioButton", @"aspectRatio", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_itemLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_cachedMenuItems", "@", 0);
  [v3 validateClass:@"CAMDrawerAspectRatioButton" isKindOfClass:@"CAMControlDrawerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuItem", @"value", "@", 0);
  [v3 validateClass:@"CAMDrawerAspectRatioButton" isKindOfClass:@"CAMControlDrawerMenuButton"];
}

- (BOOL)accessibilityActivate
{
  if (AXRequestingClient() == 3)
  {
    id v3 = [(CAMDrawerAspectRatioButtonAccessibility *)self safeValueForKey:@"aspectRatio"];
    uint64_t v4 = [v3 integerValue];

    uint64_t v5 = 2 * (v4 == 1);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __64__CAMDrawerAspectRatioButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_26509FBE8;
    if (!v4) {
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
    v7.super_class = (Class)CAMDrawerAspectRatioButtonAccessibility;
    return [(CAMDrawerAspectRatioButtonAccessibility *)&v7 accessibilityActivate];
  }
}

void __64__CAMDrawerAspectRatioButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAspectRatio:*(void *)(a1 + 40)];
  v1 = __UIAccessibilitySafeClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(@"ASPECT_RATIO_BUTTON_HINT");
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"ASPECT_RATIO_BUTTON_LABEL");
}

- (id)accessibilityIdentifier
{
  return @"AspectRatioButton";
}

- (id)accessibilityValue
{
  v2 = [(CAMDrawerAspectRatioButtonAccessibility *)self safeValueForKey:@"aspectRatio"];
  unint64_t v3 = [v2 integerValue];

  if (v3 > 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = accessibilityCameraUILocalizedString(off_26509FF28[v3]);
  }

  return v4;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerAspectRatioButtonAccessibility;
  [(CAMDrawerAspectRatioButtonAccessibility *)&v7 layoutSubviews];
  unint64_t v3 = [(CAMDrawerAspectRatioButtonAccessibility *)self safeArrayForKey:@"_itemLabels"];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__2;
  v5[4] = __Block_byref_object_dispose__2;
  id v6 = [(CAMDrawerAspectRatioButtonAccessibility *)self safeArrayForKey:@"_cachedMenuItems"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__CAMDrawerAspectRatioButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_26509FCE8;
  v4[4] = v5;
  [v3 enumerateObjectsUsingBlock:v4];
  _Block_object_dispose(v5, 8);
}

void __57__CAMDrawerAspectRatioButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v7 = a2;
  [v7 setIsAccessibilityElement:1];
  [v7 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] > a3)
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndex:a3];
    unint64_t v6 = [v5 safeIntegerForKey:@"value"];

    if (v6 <= 2) {
      [v7 _setAccessibilityLabelBlock:*(&off_26509FF40 + v6)];
    }
  }
}

id __57__CAMDrawerAspectRatioButtonAccessibility_layoutSubviews__block_invoke_2()
{
  return accessibilityCameraUILocalizedString(@"ASPECT_RATIO_BUTTON_VALUE_4_3");
}

id __57__CAMDrawerAspectRatioButtonAccessibility_layoutSubviews__block_invoke_3()
{
  return accessibilityCameraUILocalizedString(@"ASPECT_RATIO_BUTTON_VALUE_SQUARE");
}

id __57__CAMDrawerAspectRatioButtonAccessibility_layoutSubviews__block_invoke_4()
{
  return accessibilityCameraUILocalizedString(@"ASPECT_RATIO_BUTTON_VALUE_16_9");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerAspectRatioButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMDrawerAspectRatioButtonAccessibility *)&v3 accessibilityTraits];
}

@end