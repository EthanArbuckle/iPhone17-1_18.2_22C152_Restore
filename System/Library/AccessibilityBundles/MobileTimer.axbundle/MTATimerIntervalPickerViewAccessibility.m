@interface MTATimerIntervalPickerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation MTATimerIntervalPickerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTATimerIntervalPickerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTATimerIntervalPickerCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerIntervalPickerView", @"pickerView:viewForRow:forComponent:reusingView:", "@", "@", "q", "q", "@", 0);
  [v3 validateClass:@"MTATimerIntervalPickerView" hasInstanceVariable:@"_timePicker" withType:"UIPickerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerIntervalPickerCell", @"textLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerIntervalPickerView", @"_hoursStringForHour:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerIntervalPickerView", @"_minutesStringForMinutes:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTATimerIntervalPickerView", @"_secondsStringForSeconds:", "@", "q", 0);
  [v3 validateClass:@"MTATimerIntervalPickerView" isKindOfClass:@"UIControl"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)MTATimerIntervalPickerViewAccessibility;
  [(MTATimerIntervalPickerViewAccessibility *)&v2 _accessibilityLoadAccessibilityInformation];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)accessibilityElements
{
  objc_super v2 = (void *)MEMORY[0x263EFF8C0];
  id v3 = [(MTATimerIntervalPickerViewAccessibility *)self safeValueForKey:@"_timePicker"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v32.receiver = self;
  v32.super_class = (Class)MTATimerIntervalPickerViewAccessibility;
  v12 = [(MTATimerIntervalPickerViewAccessibility *)&v32 pickerView:v10 viewForRow:a4 forComponent:a5 reusingView:v11];
  MEMORY[0x245657200](@"MTATimerIntervalPickerCell");
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v13 = [v12 safeValueForKeyPath:@"textLabel.attributedText"];
    v14 = __UIAccessibilityCastAsClass();

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__0;
    v30 = __Block_byref_object_dispose__0;
    id v31 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    id v25 = 0;
    AXPerformSafeBlock();
    v15 = NSString;
    v16 = [v14 string];
    v17 = [v15 stringWithFormat:@"%@ %@", v16, v27[5]];

    [v12 setAccessibilityLabel:v17];
    v18 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 2, v21[5], v17);
    [v12 setAccessibilityUserInputLabels:v18];

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }

  return v12;
}

uint64_t __90__MTATimerIntervalPickerViewAccessibility_pickerView_viewForRow_forComponent_reusingView___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 56);
  if (v2 == 2)
  {
    uint64_t v7 = [*(id *)(result + 32) _secondsStringForSeconds:*(void *)(result + 64)];
    uint64_t v8 = *(void *)(*(void *)(v1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v6 = @"timer.seconds";
  }
  else if (v2 == 1)
  {
    uint64_t v10 = [*(id *)(result + 32) _minutesStringForMinutes:*(void *)(result + 64)];
    uint64_t v11 = *(void *)(*(void *)(v1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    v6 = @"timer.minutes";
  }
  else
  {
    if (v2) {
      return result;
    }
    uint64_t v3 = [*(id *)(result + 32) _hoursStringForHour:*(void *)(result + 64)];
    uint64_t v4 = *(void *)(*(void *)(v1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v6 = @"timer.hours";
  }
  *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = accessibilityLocalizedString(v6);

  return MEMORY[0x270F9A758]();
}

@end