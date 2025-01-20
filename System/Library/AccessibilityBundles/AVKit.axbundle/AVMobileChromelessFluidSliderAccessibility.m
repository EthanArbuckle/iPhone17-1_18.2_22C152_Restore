@interface AVMobileChromelessFluidSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityAnnounceNewValue;
- (void)_accessibilityBumpValue:(BOOL)a3;
- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4;
- (void)_sliderFluidInteractionWillEnd:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation AVMobileChromelessFluidSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVMobileChromelessFluidSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVMobileChromelessFluidSlider" isKindOfClass:@"UISlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessFluidSlider", @"_sliderFluidInteractionWillContinue:withLocation:", "v", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessTimelineView", @"leadingTimeText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessTimelineView", @"trailingTimeText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessFluidSlider", @"_sliderFluidInteractionWillEnd:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMobileChromelessFluidSlider", @"usesVolumeStyle", "B", 0);
  [v3 validateClass:@"AVMediaTimelineControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVMediaTimelineControl", @"delegate", "@", 0);
  if (AXProcessIsPhotos())
  {
    [v3 validateProtocol:@"AVMediaTimelineControlDelegate" hasRequiredInstanceMethod:@"mediaTimelineControl:didChangeValue:"];
    [v3 validateProtocol:@"AVMediaTimelineControlDelegate" hasRequiredInstanceMethod:@"mediaTimelineControlWillBeginChanging:"];
    [v3 validateProtocol:@"AVMediaTimelineControlDelegate" hasRequiredInstanceMethod:@"mediaTimelineControlDidEndChanging:"];
  }
}

- (BOOL)isAccessibilityElement
{
  return [(AVMobileChromelessFluidSliderAccessibility *)self safeBoolForKey:@"usesVolumeStyle"] ^ 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessFluidSliderAccessibility;
  return *MEMORY[0x263F1CED8] | [(AVMobileChromelessFluidSliderAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"time.position.scrubber");
}

- (id)accessibilityValue
{
  objc_super v3 = [(AVMobileChromelessFluidSliderAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Avmobilechrome_2.isa)];
  uint64_t v4 = [v3 safeStringForKey:@"leadingTimeText"];
  uint64_t v5 = [v3 safeStringForKey:@"trailingTimeText"];
  v6 = (void *)v5;
  if (!(v4 | v5))
  {
    char v41 = 0;
    objc_opt_class();
    v12 = __UIAccessibilityCastAsClass();
    [v12 maximumValue];
    double v14 = v13;
    [v12 value];
    v16 = MEMORY[0x24563F2C0](1, v15);
    v17 = MEMORY[0x24563F2C0](1, v14);
    v18 = NSString;
    v19 = accessibilityLocalizedString(@"track.position.value");
    objc_msgSend(v18, "stringWithFormat:", v19, v16, v17);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (!v4)
  {
    v11 = &stru_26F5F79D0;
    if (!v5) {
      goto LABEL_10;
    }
LABEL_7:
    if (objc_msgSend(v6, "containsString:", @"−", v38, v39))
    {
      v20 = [v6 componentsSeparatedByString:@"−"];
      v21 = [v20 lastObject];
      v22 = AXLocalizeDurationTime();

      v23 = NSString;
      v24 = accessibilityLocalizedString(@"media.time.remaining");
      v25 = objc_msgSend(v23, "localizedStringWithFormat:", v24, v22);

      v38 = v25;
      v39 = @"__AXStringForVariablesSentinel";
      uint64_t v26 = __UIAXStringForVariables();

      v11 = (__CFString *)v26;
    }
    else
    {
      v27 = AXLocalizeDurationTime();
      v28 = NSString;
      v29 = accessibilityLocalizedString(@"media.time.total");
      v30 = objc_msgSend(v28, "localizedStringWithFormat:", v29, v27);

      v38 = v30;
      v39 = @"__AXStringForVariablesSentinel";
      uint64_t v31 = __UIAXStringForVariables();

      v11 = (__CFString *)v31;
    }
    goto LABEL_10;
  }
  v7 = AXLocalizeDurationTime();
  v8 = NSString;
  v9 = accessibilityLocalizedString(@"media.time.elapsed");
  v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);

  v38 = v10;
  v39 = @"__AXStringForVariablesSentinel";
  __UIAXStringForVariables();
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    goto LABEL_7;
  }
LABEL_10:
  v32 = objc_msgSend(MEMORY[0x263F08708], "whitespaceCharacterSet", v38, v39);
  v33 = [(__CFString *)v11 stringByTrimmingCharactersInSet:v32];
  uint64_t v34 = [v33 length];

  if (v34)
  {
    v35 = v11;
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)AVMobileChromelessFluidSliderAccessibility;
    v35 = [(AVMobileChromelessFluidSliderAccessibility *)&v40 accessibilityValue];
  }
  v36 = v35;

  return v36;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)_accessibilityBumpValue:(BOOL)a3
{
  NSClassFromString(&cfstr_Uislider.isa);
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    uint64_t v4 = __UIAccessibilityCastAsClass();
    [v4 minimumValue];
    [v4 maximumValue];
    [v4 value];
    uint64_t v5 = [(AVMobileChromelessFluidSliderAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_4 startWithSelf:0];
    v6 = [v5 safeValueForKey:@"delegate"];
    v10 = v4;
    v11 = v5;
    id v7 = v5;
    id v8 = v6;
    id v9 = v4;
    AXPerformSafeBlock();
  }
}

uint64_t __70__AVMobileChromelessFluidSliderAccessibility__accessibilityBumpValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Avmediatimelin.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__AVMobileChromelessFluidSliderAccessibility__accessibilityBumpValue___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 64);
  *(float *)&double v2 = v2;
  [*(id *)(a1 + 32) setValue:v2];
  if (!*(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) sendActionsForControlEvents:4096];
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 40) mediaTimelineControlWillBeginChanging:*(void *)(a1 + 48)];
  }
  if (objc_opt_respondsToSelector())
  {
    double v3 = *(double *)(a1 + 64);
    *(float *)&double v3 = v3;
    [*(id *)(a1 + 40) mediaTimelineControl:*(void *)(a1 + 56) didChangeValue:v3];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v5 mediaTimelineControlDidEndChanging:v6];
  }
  return result;
}

- (void)_accessibilityAnnounceNewValue
{
  UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
  id v3 = [(AVMobileChromelessFluidSliderAccessibility *)self _accessibilityAXAttributedValue];
  UIAccessibilityPostNotification(v2, v3);
}

- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromelessFluidSliderAccessibility;
  -[AVMobileChromelessFluidSliderAccessibility _sliderFluidInteractionWillContinue:withLocation:](&v4, sel__sliderFluidInteractionWillContinue_withLocation_, a3, a4.x, a4.y);
  AXPerformSafeBlock();
}

uint64_t __95__AVMobileChromelessFluidSliderAccessibility__sliderFluidInteractionWillContinue_withLocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityAnnounceNewValue];
}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AVMobileChromelessFluidSliderAccessibility;
  [(AVMobileChromelessFluidSliderAccessibility *)&v3 _sliderFluidInteractionWillEnd:a3];
  AXPerformSafeBlock();
}

uint64_t __77__AVMobileChromelessFluidSliderAccessibility__sliderFluidInteractionWillEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityAnnounceNewValue];
}

@end