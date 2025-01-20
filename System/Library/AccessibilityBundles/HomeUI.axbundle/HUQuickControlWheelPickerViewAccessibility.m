@interface HUQuickControlWheelPickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)pickerView:(id)a3 accessibilityAttributedLabelForComponent:(int64_t)a4;
@end

@implementation HUQuickControlWheelPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUQuickControlWheelPickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)pickerView:(id)a3 accessibilityAttributedLabelForComponent:(int64_t)a4
{
  v4 = (void *)MEMORY[0x263F086A0];
  v5 = accessibilityHomeUILocalizedString(@"picker.current.mode");
  v6 = [v4 attributedStringWithFormatAndAttributes:v5];

  return v6;
}

@end