@interface VerticalToggleSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityAnnounceNewValue;
- (void)_accessibilityIncreaseSlider:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)dragged:(id)a3;
@end

@implementation VerticalToggleSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicCoreUI.VerticalToggleSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.VerticalToggleSlider", @"accessibilitySliderValue", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.VerticalToggleSlider", @"accessibilityMinValue", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.VerticalToggleSlider", @"accessibilityMaxValue", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.VerticalToggleSlider", @"accessibilityToggleIsOn", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.VerticalToggleSlider", @"accessibilityAutomaticallyDisablesOnMaxValue", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.VerticalToggleSlider", @"accessibilitySetSliderValue:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.VerticalToggleSlider", @"dragged:", "v", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(VerticalToggleSliderAccessibility *)self safeBoolForKey:@"accessibilityToggleIsOn"];
  uint64_t v4 = *MEMORY[0x263F1CED8];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (id)accessibilityValue
{
  char v3 = [(VerticalToggleSliderAccessibility *)self safeBoolForKey:@"accessibilityToggleIsOn"];
  [(VerticalToggleSliderAccessibility *)self safeFloatForKey:@"accessibilitySliderValue"];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithFloat:");
  if (v3) {
    AXFormatNumberWithOptions();
  }
  else {
  v5 = accessibilityMusicLocalizedString(@"vertical.toggle.slider.off");
  }

  return v5;
}

- (void)accessibilityIncrement
{
  if ([(VerticalToggleSliderAccessibility *)self safeBoolForKey:@"accessibilityToggleIsOn"])
  {
    [(VerticalToggleSliderAccessibility *)self _accessibilityIncreaseSlider:1];
  }
}

- (void)accessibilityDecrement
{
  if ([(VerticalToggleSliderAccessibility *)self safeBoolForKey:@"accessibilityToggleIsOn"])
  {
    [(VerticalToggleSliderAccessibility *)self _accessibilityIncreaseSlider:0];
  }
}

- (void)_accessibilityIncreaseSlider:(BOOL)a3
{
}

void __66__VerticalToggleSliderAccessibility__accessibilityIncreaseSlider___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) accessibilitySetSliderValue:*(float *)(a1 + 40)];
  if (*(float *)(a1 + 40) == *(float *)(a1 + 44)
    && [*(id *)(a1 + 32) safeBoolForKey:@"accessibilityAutomaticallyDisablesOnMaxValue"])
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], *(id *)(a1 + 32));
    UIAccessibilityNotifications v2 = *MEMORY[0x263F1CDC8];
    id v6 = [*(id *)(a1 + 32) accessibilityLabel];
    char v3 = accessibilityMusicLocalizedString(@"vertical.toggle.slider.off");
    v5 = accessibilityMusicLocalizedString(@"vertical.toggle.button");
    uint64_t v4 = __UIAXStringForVariables();
    UIAccessibilityPostNotification(v2, v4);
  }
}

- (void)_accessibilityAnnounceNewValue
{
  if (CFAbsoluteTimeGetCurrent() - *(double *)&_accessibilityAnnounceNewValue_LastOutput > 1.0)
  {
    UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
    uint64_t v4 = [(VerticalToggleSliderAccessibility *)self _accessibilityAXAttributedValue];
    UIAccessibilityPostNotification(v3, v4);

    _accessibilityAnnounceNewValue_LastOutput = CFAbsoluteTimeGetCurrent();
  }
}

- (void)dragged:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VerticalToggleSliderAccessibility;
  [(VerticalToggleSliderAccessibility *)&v4 dragged:a3];
  [(VerticalToggleSliderAccessibility *)self _accessibilityAnnounceNewValue];
}

@end