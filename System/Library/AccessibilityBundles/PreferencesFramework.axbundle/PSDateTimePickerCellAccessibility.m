@interface PSDateTimePickerCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPickerTimeView;
- (id)accessibilityPickerView;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PSDateTimePickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSDateTimePickerCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PSDateTimePickerCell", @"datePicker", "@", 0);
  [v3 validateClass:@"PSDateTimePickerCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"UIDatePicker" hasInstanceVariable:@"_pickerView" withType:"UIView<_UIDatePickerViewComponent>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerIOSCompactView", @"timeView", "@", 0);
  [v3 validateClass:@"_UIDatePickerCompactTimeLabel" isKindOfClass:@"_UIDatePickerCalendarTimeLabel"];
}

- (BOOL)isAccessibilityElement
{
  v2 = [(PSDateTimePickerCellAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  char v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

- (id)accessibilityLabel
{
  v8.receiver = self;
  v8.super_class = (Class)PSDateTimePickerCellAccessibility;
  char v3 = [(PSDateTimePickerCellAccessibility *)&v8 accessibilityLabel];
  v4 = [(PSDateTimePickerCellAccessibility *)self accessibilityPickerView];
  v7 = [v4 accessibilityLabel];
  v5 = __UIAXStringForVariables();

  return v5;
}

- (id)accessibilityValue
{
  v2 = [(PSDateTimePickerCellAccessibility *)self accessibilityPickerTimeView];
  char v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityHint
{
  v2 = [(PSDateTimePickerCellAccessibility *)self accessibilityPickerView];
  char v3 = [v2 accessibilityHint];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = [(PSDateTimePickerCellAccessibility *)self accessibilityPickerTimeView];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(PSDateTimePickerCellAccessibility *)self accessibilityPickerView];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (id)accessibilityPickerView
{
  return (id)[(PSDateTimePickerCellAccessibility *)self safeValueForKeyPath:@"datePicker._pickerView"];
}

- (id)accessibilityPickerTimeView
{
  v2 = [(PSDateTimePickerCellAccessibility *)self accessibilityPickerView];
  unint64_t v3 = [v2 safeUIViewForKey:@"timeView"];

  return v3;
}

@end