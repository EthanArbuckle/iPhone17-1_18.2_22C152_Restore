@interface CCUIBaseSliderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAbsoluteValue;
- (id)accessibilityCustomActions;
- (unint64_t)accessibilityTraits;
@end

@implementation CCUIBaseSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CCUIBaseSliderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityAbsoluteValue
{
  v2 = NSNumber;
  [(CCUIBaseSliderViewAccessibility *)self safeCGFloatForKey:@"value"];

  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (BOOL)isAccessibilityElement
{
  [(CCUIBaseSliderViewAccessibility *)self safeCGFloatForKey:@"alpha"];
  return v2 > 0.1;
}

- (unint64_t)accessibilityTraits
{
  double v2 = [(CCUIBaseSliderViewAccessibility *)self accessibilityUserDefinedTraits];
  uint64_t v3 = [v2 unsignedIntegerValue];

  objc_opt_class();
  v4 = __UIAccessibilityCastAsClass();
  v5 = v4;
  unint64_t v6 = *MEMORY[0x263F1CED8] | v3;
  if (v4)
  {
    int v7 = [v4 isEnabled];
    uint64_t v8 = *MEMORY[0x263F1CF20];
    if (v7) {
      uint64_t v8 = 0;
    }
    v6 |= v8;
    if ([v5 isSelected]) {
      v6 |= *MEMORY[0x263F1CF38];
    }
  }

  return v6;
}

- (id)accessibilityCustomActions
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIBaseSliderViewAccessibility;
  double v2 = [(CCUIBaseSliderViewAccessibility *)&v5 accessibilityCustomActions];
  uint64_t v3 = AXGuaranteedMutableArray();

  UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();

  return v3;
}

@end