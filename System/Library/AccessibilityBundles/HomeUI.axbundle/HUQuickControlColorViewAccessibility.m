@interface HUQuickControlColorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFirstQuickControlElementForFocus;
- (id)accessibilityElements;
- (void)_updateColorPicker;
@end

@implementation HUQuickControlColorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlColorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlColorView", @"mode", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlColorView", @"colorLinearPaletteView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlColorView", @"colorPickerView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUQuickControlColorView", @"_updateColorPicker", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUColorPickerView", @"colorWheelView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HUColorSwatchView", @"selectionState", "Q", 0);
}

- (id)accessibilityElements
{
  uint64_t v3 = [(HUQuickControlColorViewAccessibility *)self safeUnsignedIntegerForKey:@"mode"];
  v4 = [(HUQuickControlColorViewAccessibility *)self safeUIViewForKey:@"colorPickerModeSegmentedControl"];
  v5 = (void *)MEMORY[0x263EFF8C0];
  if (v3)
  {
    v6 = [(HUQuickControlColorViewAccessibility *)self safeValueForKey:@"colorPickerView"];
    if ([v4 isHidden]) {
      v7 = 0;
    }
    else {
      v7 = v4;
    }
    v8 = [(HUQuickControlColorViewAccessibility *)self safeValueForKey:@"colorLinearPaletteView"];
    v9 = objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 3, v6, v7, v8);
  }
  else
  {
    v6 = [(HUQuickControlColorViewAccessibility *)self safeValueForKey:@"colorLinearPaletteView"];
    if ([v4 isHidden]) {
      v10 = 0;
    }
    else {
      v10 = v4;
    }
    v9 = objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 2, v6, v10);
  }

  return v9;
}

- (void)_updateColorPicker
{
  v2.receiver = self;
  v2.super_class = (Class)HUQuickControlColorViewAccessibility;
  [(HUQuickControlColorViewAccessibility *)&v2 _updateColorPicker];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (id)_accessibilityFirstQuickControlElementForFocus
{
  objc_super v2 = [(HUQuickControlColorViewAccessibility *)self safeValueForKey:@"colorPickerView"];
  uint64_t v3 = [v2 safeValueForKey:@"colorWheelView"];

  return v3;
}

@end