@interface CAMDrawerLivePhotoButtonAccessibility
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

@implementation CAMDrawerLivePhotoButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerLivePhotoButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerLivePhotoButton", @"livePhotoMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_itemLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_cachedMenuItems", "@", 0);
  [v3 validateClass:@"CAMDrawerLivePhotoButton" isKindOfClass:@"CAMControlDrawerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuItem", @"value", "@", 0);
  [v3 validateClass:@"CAMDrawerLivePhotoButton" isKindOfClass:@"CAMControlDrawerMenuButton"];
}

- (BOOL)accessibilityActivate
{
  if (AXRequestingClient() == 3)
  {
    id v3 = [(CAMDrawerLivePhotoButtonAccessibility *)self safeValueForKey:@"livePhotoMode"];
    uint64_t v4 = [v3 integerValue];

    uint64_t v5 = 2 * (v4 != 1);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __62__CAMDrawerLivePhotoButtonAccessibility_accessibilityActivate__block_invoke;
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
    v7.super_class = (Class)CAMDrawerLivePhotoButtonAccessibility;
    return [(CAMDrawerLivePhotoButtonAccessibility *)&v7 accessibilityActivate];
  }
}

void __62__CAMDrawerLivePhotoButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLivePhotoMode:*(void *)(a1 + 40)];
  v1 = __UIAccessibilitySafeClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityHint
{
  return accessibilityCameraUILocalizedString(@"LIVEPHOTO_MODE_BUTTON_HINT");
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(@"LIVEPHOTO_MODE_BUTTON_LABEL");
}

- (id)accessibilityIdentifier
{
  return @"LivePhotoButton";
}

- (id)accessibilityValue
{
  v2 = [(CAMDrawerLivePhotoButtonAccessibility *)self safeValueForKey:@"livePhotoMode"];
  unint64_t v3 = [v2 integerValue];

  if (v3 > 2)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = accessibilityCameraUILocalizedString(off_26509FF88[v3]);
  }

  return v4;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerLivePhotoButtonAccessibility;
  [(CAMDrawerLivePhotoButtonAccessibility *)&v7 layoutSubviews];
  unint64_t v3 = [(CAMDrawerLivePhotoButtonAccessibility *)self safeArrayForKey:@"_itemLabels"];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__5;
  v5[4] = __Block_byref_object_dispose__5;
  id v6 = [(CAMDrawerLivePhotoButtonAccessibility *)self safeArrayForKey:@"_cachedMenuItems"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__CAMDrawerLivePhotoButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_26509FCE8;
  v4[4] = v5;
  [v3 enumerateObjectsUsingBlock:v4];
  _Block_object_dispose(v5, 8);
}

void __55__CAMDrawerLivePhotoButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 setIsAccessibilityElement:1];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] > a3)
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndex:a3];
    unint64_t v7 = [v6 safeIntegerForKey:@"value"];

    if (v7 > 2)
    {
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = accessibilityCameraUILocalizedString(off_26509FF88[v7]);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__CAMDrawerLivePhotoButtonAccessibility_layoutSubviews__block_invoke_2;
    v10[3] = &unk_26509FC38;
    id v11 = v8;
    id v9 = v8;
    [v5 _setAccessibilityLabelBlock:v10];
  }
}

id __55__CAMDrawerLivePhotoButtonAccessibility_layoutSubviews__block_invoke_2()
{
  v0 = accessibilityCameraUILocalizedString(@"LIVEPHOTO_MODE_BUTTON_LABEL");
  v1 = __UIAXStringForVariables();

  return v1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerLivePhotoButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMDrawerLivePhotoButtonAccessibility *)&v3 accessibilityTraits];
}

@end