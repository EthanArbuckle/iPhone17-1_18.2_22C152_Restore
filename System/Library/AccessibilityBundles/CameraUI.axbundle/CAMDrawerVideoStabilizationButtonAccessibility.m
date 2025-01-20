@interface CAMDrawerVideoStabilizationButtonAccessibility
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

@implementation CAMDrawerVideoStabilizationButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerVideoStabilizationButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerVideoStabilizationButton", @"videoStabilizationMode", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerVideoStabilizationButton", @"setVideoStabilizationMode:animated:", "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_itemLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_cachedMenuItems", "@", 0);
  [v3 validateClass:@"CAMDrawerVideoStabilizationButton" isKindOfClass:@"CAMControlDrawerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuItem", @"value", "@", 0);
  [v3 validateClass:@"CAMDrawerVideoStabilizationButton" isKindOfClass:@"CAMControlDrawerMenuButton"];
}

- (BOOL)accessibilityActivate
{
  if (AXRequestingClient() == 3)
  {
    id v3 = [(CAMDrawerVideoStabilizationButtonAccessibility *)self safeValueForKey:@"videoStabilizationMode"];
    uint64_t v4 = [v3 integerValue];

    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    v9 = __71__CAMDrawerVideoStabilizationButtonAccessibility_accessibilityActivate__block_invoke;
    v10 = &unk_26509FBE8;
    v11 = self;
    BOOL v12 = v4 == 0;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CAMDrawerVideoStabilizationButtonAccessibility;
    return [(CAMDrawerVideoStabilizationButtonAccessibility *)&v6 accessibilityActivate];
  }
}

void __71__CAMDrawerVideoStabilizationButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setVideoStabilizationMode:*(void *)(a1 + 40) animated:0];
  v1 = __UIAccessibilitySafeClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityHint
{
  return accessibilityCameraUI2LocalizedString(@"Action_Mode_Hint");
}

- (id)accessibilityIdentifier
{
  return @"ActionMode";
}

- (id)accessibilityLabel
{
  return accessibilityCameraUI2LocalizedString(@"Action_Mode");
}

- (id)accessibilityValue
{
  v2 = [(CAMDrawerVideoStabilizationButtonAccessibility *)self safeValueForKey:@"videoStabilizationMode"];
  uint64_t v3 = [v2 integerValue];

  if (!v3)
  {
    uint64_t v4 = @"Action_Mode_Off";
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    uint64_t v4 = @"Action_Mode_On";
LABEL_5:
    v5 = accessibilityCameraUI2LocalizedString(v4);
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerVideoStabilizationButtonAccessibility;
  [(CAMDrawerVideoStabilizationButtonAccessibility *)&v7 layoutSubviews];
  uint64_t v3 = [(CAMDrawerVideoStabilizationButtonAccessibility *)self safeArrayForKey:@"_itemLabels"];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__0;
  v5[4] = __Block_byref_object_dispose__0;
  id v6 = [(CAMDrawerVideoStabilizationButtonAccessibility *)self safeArrayForKey:@"_cachedMenuItems"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __64__CAMDrawerVideoStabilizationButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_26509FCE8;
  v4[4] = v5;
  [v3 enumerateObjectsUsingBlock:v4];
  _Block_object_dispose(v5, 8);
}

void __64__CAMDrawerVideoStabilizationButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
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
      uint64_t v8 = @"Action_Mode_On";
    }
    else
    {
      uint64_t v8 = @"Action_Mode_Off";
    }
    v9 = accessibilityCameraUI2LocalizedString(v8);
LABEL_8:
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __64__CAMDrawerVideoStabilizationButtonAccessibility_layoutSubviews__block_invoke_2;
    v11[3] = &unk_26509FC38;
    id v12 = v9;
    id v10 = v9;
    [v5 _setAccessibilityValueBlock:v11];
  }
}

id __64__CAMDrawerVideoStabilizationButtonAccessibility_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerVideoStabilizationButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMDrawerVideoStabilizationButtonAccessibility *)&v3 accessibilityTraits];
}

@end