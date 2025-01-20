@interface ETColorWheelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityChangeCrownOffset:(double)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation ETColorWheelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETColorWheelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ETColorWheelView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETColorWheelView", @"doneButtonTapped:", "v", "@", 0);
  [v3 validateClass:@"ETColorWheelView" hasInstanceVariable:@"_doneButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETColorWheelView", @"crownInputSequencer", "@", 0);
  [v3 validateClass:@"PUICCrownInputSequencer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUICCrownInputSequencer", @"offset", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUICCrownInputSequencer", @"setOffset:", "v", "d", 0);
  [v3 validateClass:@"ETColorWheelView" conformsToProtocol:@"PUICCrownInputSequencerDelegate"];
  [v3 validateProtocol:@"PUICCrownInputSequencerDelegate" hasOptionalInstanceMethod:@"crownInputSequencerOffsetDidChange:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ETColorWheelView", @"pickerViewHighlightedColor", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"color.wheel.hint");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8] | *MEMORY[0x263F1CF68];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"color.wheel.label");
}

- (id)accessibilityValue
{
  v2 = [(ETColorWheelViewAccessibility *)self safeValueForKey:@"pickerViewHighlightedColor"];
  id v3 = __UIAccessibilitySafeClass();

  v4 = [v3 axColorStringForSpeaking];

  return v4;
}

- (BOOL)accessibilityActivate
{
  id v3 = [(ETColorWheelViewAccessibility *)self safeValueForKey:@"_doneButton"];
  [(ETColorWheelViewAccessibility *)self doneButtonTapped:v3];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return 1;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)_accessibilityChangeCrownOffset:(double)a3
{
  id v3 = [(ETColorWheelViewAccessibility *)self safeValueForKey:@"crownInputSequencer"];
  [v3 safeDoubleForKey:@"offset"];
  id v4 = v3;
  AXPerformSafeBlock();
}

uint64_t __65__ETColorWheelViewAccessibility__accessibilityChangeCrownOffset___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOffset:*(double *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 crownInputSequencerOffsetDidChange:v3];
}

@end