@interface VMPlayerTimelineSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axUpdateSliderValue;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation VMPlayerTimelineSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VMPlayerTimelineSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_axUpdateSliderValue
{
  v3 = [(VMPlayerTimelineSliderAccessibility *)self safeValueForKey:@"_slider"];
  v4 = __UIAccessibilitySafeClass();

  [v4 safeTimeIntervalForKey:@"maximumTime"];
  [v4 safeFloatForKey:@"value"];
  v5 = [(VMPlayerTimelineSliderAccessibility *)self safeValueForKey:@"delegate"];
  v6 = __UIAccessibilityCastAsProtocol();

  v9 = v6;
  v10 = v4;
  id v7 = v4;
  id v8 = v6;
  AXPerformSafeBlock();
}

uint64_t __59__VMPlayerTimelineSliderAccessibility__axUpdateSliderValue__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) playerTimelineSlider:*(void *)(a1 + 40) didChangeElapsedTime:*(double *)(a1 + 48)];
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VMPlayerTimelineSlider" hasInstanceVariable:@"_slider" withType:"VMDetailSlider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMDetailSlider", @"maximumTime", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMDetailSlider", @"elapsedTime", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VMPlayerTimelineSlider", @"delegate", "@", 0);
  [v3 validateProtocol:@"VMPlayerTimelineSliderDelegate" hasOptionalInstanceMethod:@"playerTimelineSlider:didChangeElapsedTime:"];
}

- (id)accessibilityLabel
{
  id v3 = accessibilityLocalizedString(@"voicemail.playback.slider");
  v4 = [(VMPlayerTimelineSliderAccessibility *)self accessibilityIdentification];
  int v5 = [v4 isEqualToString:@"GreetingSlider"];

  if (v5)
  {
    uint64_t v6 = accessibilityLocalizedString(@"greeting.playback.slider");

    id v3 = (void *)v6;
  }

  return v3;
}

- (id)accessibilityValue
{
  id v3 = [(VMPlayerTimelineSliderAccessibility *)self safeValueForKey:@"_slider"];
  v4 = __UIAccessibilitySafeClass();

  [v4 safeTimeIntervalForKey:@"maximumTime"];
  int v5 = MEMORY[0x2456555B0](1);
  uint64_t v6 = [(VMPlayerTimelineSliderAccessibility *)self safeValueForKey:@"elapsedTimeLabel"];
  id v7 = __UIAccessibilitySafeClass();

  id v8 = [v7 text];
  AXDurationForDurationString();
  double v10 = v9;

  v11 = MEMORY[0x2456555B0](1, v10);
  v12 = NSString;
  v13 = accessibilityLocalizedString(@"voicemail.progress");
  v14 = objc_msgSend(v12, "stringWithFormat:", v13, v11, v5);

  return v14;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  id v3 = [(VMPlayerTimelineSliderAccessibility *)self safeValueForKey:@"_slider"];
  char v9 = 0;
  v4 = __UIAccessibilitySafeClass();

  v8.receiver = self;
  v8.super_class = (Class)VMPlayerTimelineSliderAccessibility;
  unint64_t v5 = [(VMPlayerTimelineSliderAccessibility *)&v8 accessibilityTraits];
  unint64_t v6 = [v4 accessibilityTraits] | v5;

  return v6;
}

- (void)accessibilityIncrement
{
  id v3 = [(VMPlayerTimelineSliderAccessibility *)self safeValueForKey:@"_slider"];
  v4 = __UIAccessibilitySafeClass();

  [v4 accessibilityIncrement];
  [(VMPlayerTimelineSliderAccessibility *)self _axUpdateSliderValue];
}

- (void)accessibilityDecrement
{
  id v3 = [(VMPlayerTimelineSliderAccessibility *)self safeValueForKey:@"_slider"];
  v4 = __UIAccessibilitySafeClass();

  [v4 accessibilityDecrement];
  [(VMPlayerTimelineSliderAccessibility *)self _axUpdateSliderValue];
}

@end