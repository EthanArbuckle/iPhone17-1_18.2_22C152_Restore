@interface ColorWheelPickerCircleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation ColorWheelPickerCircleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  v3 = [(ColorWheelPickerCircleViewAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"digital.touch.picker.circle.identifier"])
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
    BOOL v4 = [(ColorWheelPickerCircleViewAccessibility *)&v6 isAccessibilityElement];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
  unint64_t v3 = [(ColorWheelPickerCircleViewAccessibility *)&v8 accessibilityTraits];
  BOOL v4 = [(ColorWheelPickerCircleViewAccessibility *)self accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"digital.touch.picker.circle.identifier"];

  uint64_t v6 = *MEMORY[0x263F1CED8];
  if (!v5) {
    uint64_t v6 = 0;
  }
  return v6 | v3;
}

- (id)accessibilityValue
{
  unint64_t v3 = [(ColorWheelPickerCircleViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"digital.touch.picker.circle.identifier"];

  if (v4)
  {
    int v5 = [(ColorWheelPickerCircleViewAccessibility *)self safeValueForKey:@"backgroundColor"];
    uint64_t v6 = [v5 axColorStringForSpeaking];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
    uint64_t v6 = [(ColorWheelPickerCircleViewAccessibility *)&v8 accessibilityValue];
  }

  return v6;
}

- (id)accessibilityPath
{
  unint64_t v3 = [(ColorWheelPickerCircleViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"digital.touch.picker.circle.identifier"];

  if (v4)
  {
    int v5 = [(ColorWheelPickerCircleViewAccessibility *)self _accessibilityCirclePathBasedOnBoundsWidth];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
    int v5 = [(ColorWheelPickerCircleViewAccessibility *)&v7 accessibilityPath];
  }

  return v5;
}

- (void)accessibilityIncrement
{
  unint64_t v3 = [(ColorWheelPickerCircleViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"digital.touch.picker.circle.identifier"];

  if (v4)
  {
    id v5 = [(ColorWheelPickerCircleViewAccessibility *)self safeValueForKey:@"superview"];
    [v5 _accessibilityIncrementColorPicker];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
    [(ColorWheelPickerCircleViewAccessibility *)&v6 accessibilityIncrement];
  }
}

- (void)accessibilityDecrement
{
  unint64_t v3 = [(ColorWheelPickerCircleViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"digital.touch.picker.circle.identifier"];

  if (v4)
  {
    id v5 = [(ColorWheelPickerCircleViewAccessibility *)self safeValueForKey:@"superview"];
    [v5 _accessibilityDecrementColorPicker];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ColorWheelPickerCircleViewAccessibility;
    [(ColorWheelPickerCircleViewAccessibility *)&v6 accessibilityDecrement];
  }
}

@end