@interface CAMTimerButtonAccessibility
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

@implementation CAMTimerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CAMTimerButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMTimerButton", @"duration", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMTimerButton", @"setDuration:animated:", "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMExpandableMenuButton", @"startExpansionWithProposedFrame:", "v", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"CAMTimerButton" isKindOfClass:@"CAMExpandableMenuButton"];
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  if (AXRequestingClient() == 3)
  {
    id v3 = [(CAMTimerButtonAccessibility *)self safeValueForKey:@"duration"];
    uint64_t v4 = [v3 integerValue];

    uint64_t v5 = 3;
    if (v4 != 1) {
      uint64_t v5 = 1;
    }
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __52__CAMTimerButtonAccessibility_accessibilityActivate__block_invoke;
    v11 = &unk_26509FBE8;
    if (v4 == 3) {
      uint64_t v5 = 0;
    }
    v12 = self;
    uint64_t v13 = v5;
    AXPerformSafeBlock();
    return 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CAMTimerButtonAccessibility;
    return [(CAMTimerButtonAccessibility *)&v7 accessibilityActivate];
  }
}

void __52__CAMTimerButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDuration:*(void *)(a1 + 40) animated:1];
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
  v2 = [(CAMTimerButtonAccessibility *)self safeValueForKey:@"duration"];
  uint64_t v3 = [v2 integerValue];

  return accessibilityStringForTimeDuration(v3, v4);
}

- (void)startExpansionWithProposedFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMTimerButtonAccessibility;
  -[CAMTimerButtonAccessibility startExpansionWithProposedFrame:](&v5, sel_startExpansionWithProposedFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  __n128 v4 = [(CAMTimerButtonAccessibility *)self safeArrayForKey:@"_menuItems"];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_16];
}

void __63__CAMTimerButtonAccessibility_startExpansionWithProposedFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  [v4 setIsAccessibilityElement:1];
  [v4 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__CAMTimerButtonAccessibility_startExpansionWithProposedFrame___block_invoke_2;
  v5[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v5[4] = a3;
  [v4 _setAccessibilityLabelBlock:v5];
}

id __63__CAMTimerButtonAccessibility_startExpansionWithProposedFrame___block_invoke_2(uint64_t a1, __n128 a2)
{
  return accessibilityStringForTimeDuration(*(void *)(a1 + 32), a2);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CAMTimerButtonAccessibility;
  return *MEMORY[0x263F1CEE8] | [(CAMTimerButtonAccessibility *)&v3 accessibilityTraits];
}

@end