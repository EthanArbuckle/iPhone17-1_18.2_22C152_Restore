@interface CAMDrawerTimerButtonAccessibility
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

@implementation CAMDrawerTimerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMDrawerTimerButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMDrawerTimerButton", @"timerDuration", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_itemLabels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"_cachedMenuItems", "@", 0);
  [v3 validateClass:@"CAMDrawerTimerButton" isKindOfClass:@"CAMControlDrawerButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuButton", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMControlDrawerMenuItem", @"value", "@", 0);
  [v3 validateClass:@"CAMDrawerTimerButton" isKindOfClass:@"CAMControlDrawerMenuButton"];
}

- (BOOL)accessibilityActivate
{
  if (AXRequestingClient() == 3)
  {
    uint64_t v3 = [(CAMDrawerTimerButtonAccessibility *)self safeIntegerForKey:@"timerDuration"];
    uint64_t v4 = 3;
    uint64_t v5 = 1;
    if (v3) {
      uint64_t v5 = v3;
    }
    if (v3 != 1) {
      uint64_t v4 = v5;
    }
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __58__CAMDrawerTimerButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_26509FBE8;
    if (v3 == 3) {
      uint64_t v4 = 0;
    }
    v12 = self;
    uint64_t v13 = v4;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMDrawerTimerButtonAccessibility;
    return [(CAMDrawerTimerButtonAccessibility *)&v7 accessibilityActivate];
  }
}

void __58__CAMDrawerTimerButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTimerDuration:*(void *)(a1 + 40)];
  v1 = __UIAccessibilitySafeClass();
  [v1 sendActionsForControlEvents:4096];
}

- (id)accessibilityHint
{
  return accessibilityCameraKitLocalizedString(@"timer.button.hint");
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(@"timer.button");
}

- (id)accessibilityIdentifier
{
  return @"TimerButton";
}

- (id)accessibilityValue
{
  v2 = [(CAMDrawerTimerButtonAccessibility *)self safeValueForKey:@"timerDuration"];
  uint64_t v3 = [v2 integerValue];

  return accessibilityStringForTimeDuration(v3, v4);
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CAMDrawerTimerButtonAccessibility;
  [(CAMDrawerTimerButtonAccessibility *)&v7 layoutSubviews];
  uint64_t v3 = [(CAMDrawerTimerButtonAccessibility *)self safeArrayForKey:@"_itemLabels"];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__6;
  v5[4] = __Block_byref_object_dispose__6;
  id v6 = [(CAMDrawerTimerButtonAccessibility *)self safeArrayForKey:@"_cachedMenuItems"];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__CAMDrawerTimerButtonAccessibility_layoutSubviews__block_invoke;
  v4[3] = &unk_26509FCE8;
  v4[4] = v5;
  [v3 enumerateObjectsUsingBlock:v4];
  _Block_object_dispose(v5, 8);
}

void __51__CAMDrawerTimerButtonAccessibility_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  [v5 setIsAccessibilityElement:1];
  [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) count] > a3)
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectAtIndex:a3];
    uint64_t v7 = [v6 safeIntegerForKey:@"value"];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__CAMDrawerTimerButtonAccessibility_layoutSubviews__block_invoke_2;
    v8[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v8[4] = v7;
    [v5 _setAccessibilityLabelBlock:v8];
  }
}

id __51__CAMDrawerTimerButtonAccessibility_layoutSubviews__block_invoke_2(uint64_t a1, __n128 a2)
{
  return accessibilityStringForTimeDuration(*(void *)(a1 + 32), a2);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMDrawerTimerButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMDrawerTimerButtonAccessibility *)&v3 accessibilityTraits];
}

@end