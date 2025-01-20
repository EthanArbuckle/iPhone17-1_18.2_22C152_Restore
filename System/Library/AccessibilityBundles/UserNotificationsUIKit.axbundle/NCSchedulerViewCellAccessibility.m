@interface NCSchedulerViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityDatePickerView;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityExpandedStatus;
- (unint64_t)accessibilityTraits;
@end

@implementation NCSchedulerViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NCSchedulerViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCSchedulerViewCell", @"_buttonPressed:", "v", "@", 0);
  [v3 validateClass:@"_UIDatePickerCompactTimeLabel" isKindOfClass:@"_UIDatePickerCalendarTimeLabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerCalendarTimeLabel", @"didTapInputLabelAtLocation:", "v", "{CGPoint=dd}", 0);
  [v3 validateClass:@"NCSchedulerViewCell" hasInstanceVariable:@"_label" withType:"UILabel"];
  [v3 validateClass:@"NCSchedulerViewCell" hasInstanceVariable:@"_datePicker" withType:"UIDatePicker"];
  [v3 validateClass:@"UIDatePicker" hasInstanceVariable:@"_pickerView" withType:"UIView<_UIDatePickerViewComponent>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_UIDatePickerIOSCompactView", @"timeView", "@", 0);
  [v3 validateClass:@"NCSchedulerViewCell" hasInstanceVariable:@"_button" withType:"NCSymbolButton"];
  [v3 validateClass:@"NCSymbolButton" hasInstanceVariable:@"_symbolImageView" withType:"UIImageView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(NCSchedulerViewCellAccessibility *)self safeValueForKey:@"_label"];
  v6 = [(NCSchedulerViewCellAccessibility *)self _accessibilityDatePickerView];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(NCSchedulerViewCellAccessibility *)self _accessibilityDatePickerView];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (int64_t)_accessibilityExpandedStatus
{
  v2 = [(NCSchedulerViewCellAccessibility *)self _accessibilityDatePickerView];
  int64_t v3 = [v2 _accessibilityExpandedStatus];

  return v3;
}

- (id)accessibilityCustomActions
{
  int64_t v3 = [MEMORY[0x263EFF980] array];
  v20.receiver = self;
  v20.super_class = (Class)NCSchedulerViewCellAccessibility;
  v4 = [(NCSchedulerViewCellAccessibility *)&v20 accessibilityCustomActions];
  [v3 axSafelyAddObjectsFromArray:v4];

  v5 = [(NCSchedulerViewCellAccessibility *)self safeValueForKey:@"_button"];
  if (v5)
  {
    v6 = [(NCSchedulerViewCellAccessibility *)self _accessibilityDatePickerView];

    if (v6)
    {
      objc_initWeak(&location, self);
      objc_initWeak(&from, v5);
      id v7 = objc_alloc(MEMORY[0x263F1C390]);
      v8 = [v5 safeValueForKey:@"_symbolImageView"];
      v9 = [v8 accessibilityLabel];
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      v14 = __62__NCSchedulerViewCellAccessibility_accessibilityCustomActions__block_invoke;
      v15 = &unk_265161720;
      objc_copyWeak(&v16, &location);
      objc_copyWeak(&v17, &from);
      v10 = (void *)[v7 initWithName:v9 actionHandler:&v12];

      objc_msgSend(v3, "axSafelyAddObject:", v10, v12, v13, v14, v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }

  return v3;
}

uint64_t __62__NCSchedulerViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _buttonPressed:v3];

  return 1;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(NCSchedulerViewCellAccessibility *)self _accessibilityDatePickerView];
  uint64_t v3 = [v2 accessibilityTraits];
  unint64_t v4 = *MEMORY[0x263F1CEE8] | v3;

  return v4;
}

- (BOOL)accessibilityActivate
{
  uint64_t v3 = [(NCSchedulerViewCellAccessibility *)self _accessibilityDatePickerView];

  if (v3)
  {
    unint64_t v4 = [(NCSchedulerViewCellAccessibility *)self _accessibilityDatePickerView];
    v5 = [v4 safeValueForKey:@"timeView"];

    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __57__NCSchedulerViewCellAccessibility_accessibilityActivate__block_invoke;
    uint64_t v12 = &unk_2651615D8;
    uint64_t v13 = v5;
    id v6 = v5;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);

    return 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NCSchedulerViewCellAccessibility;
    return [(NCSchedulerViewCellAccessibility *)&v8 accessibilityActivate];
  }
}

uint64_t __57__NCSchedulerViewCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 bounds];
  AX_CGRectGetCenter();

  return objc_msgSend(v1, "didTapInputLabelAtLocation:");
}

- (id)_accessibilityDatePickerView
{
  uint64_t v3 = [(NCSchedulerViewCellAccessibility *)self safeValueForKey:@"_datePicker"];
  if ([v3 _accessibilityViewIsVisible])
  {
    unint64_t v4 = [(NCSchedulerViewCellAccessibility *)self safeValueForKeyPath:@"_datePicker._pickerView"];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

@end