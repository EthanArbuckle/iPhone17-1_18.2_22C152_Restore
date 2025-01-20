@interface UIDatePickerCalendarTimeLabelAccessibility
@end

@implementation UIDatePickerCalendarTimeLabelAccessibility

uint64_t __77___UIDatePickerCalendarTimeLabelAccessibility__accessibilityResponderElement__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = (id)[location[0] accessibilityIdentifier];
  if ([a1[4] _axIsHoursEditing]) {
    v2 = @"Hours";
  }
  else {
    v2 = @"Minutes";
  }
  char v6 = [v5 isEqualToString:v2];

  objc_storeStrong(location, 0);
  return v6 & 1;
}

uint64_t __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263F1CED8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v7 = 0;
  char v6 = 0;
  if ([WeakRetained _axSelfIsFirstResponder])
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 32));
    char v7 = 1;
    char v6 = [v8 _axIsHoursEditing];
  }
  if (v7) {

  }
  if (v6) {
    v9 |= *MEMORY[0x263F81408] | *MEMORY[0x263F81398];
  }
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [v2 safeIntegerForKey:@"inputScope"] != 0;

  if (!v3) {
    return v9 | *MEMORY[0x263F1CF20];
  }
  return v9;
}

void __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_2(id *a1)
{
  v5[6] = a1;
  v5[5] = a1;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v1 = (id)[WeakRetained safeStringForKey:@"hourText"];
  BOOL v3 = (void *)[v1 integerValue];

  v5[4] = v3;
  v5[1] = a1[5];
  v5[2] = a1[6];
  v5[3] = v3;
  objc_copyWeak(v5, a1 + 4);
  AXPerformSafeBlock();
  objc_destroyWeak(v5);
}

void __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 48) >= *(void *)(a1 + 56) + 1) {
    uint64_t v4 = *(void *)(a1 + 56) + 1;
  }
  else {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  if (*(void *)(a1 + 40) >= v4) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = v4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", v3);
  objc_msgSend(WeakRetained, "setHourText:");
}

void __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_4(uint64_t a1)
{
  uint64_t v15 = a1;
  uint64_t v14 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained safeStringForKey:@"hourText"];
  uint64_t v5 = [v3 integerValue];

  uint64_t v13 = v5;
  v12 = 0;
  v11 = 0;
  v11 = *(void **)(a1 + 40);
  v10 = 0;
  uint64_t v9 = 0;
  uint64_t v9 = *(void **)(a1 + 48);
  id v8 = (void *)(v5 - 1);
  if ((uint64_t)v9 >= v5 - 1) {
    id v2 = v8;
  }
  else {
    id v2 = v9;
  }
  v7[3] = v2;
  v10 = v2;
  if ((uint64_t)v11 >= (uint64_t)v2) {
    id v1 = v11;
  }
  else {
    id v1 = v10;
  }
  v7[2] = v1;
  v12 = v1;
  objc_copyWeak(v7, (id *)(a1 + 32));
  v7[1] = v12;
  AXPerformSafeBlock();
  objc_destroyWeak(v7);
}

void __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)(a1 + 40));
  objc_msgSend(WeakRetained, "setHourText:");
}

id __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)[WeakRetained safeStringForKey:@"hourText"];
  uint64_t v4 = [v2 integerValue];

  uint64_t v5 = NSString;
  id v7 = (id)UIKitAccessibilityLocalizedString();
  id v6 = (id)[NSNumber numberWithInteger:v4];
  id v8 = (id)objc_msgSend(v5, "stringWithFormat:", v7, v6);

  return v8;
}

uint64_t __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_7(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  objc_copyWeak(v2, a1 + 4);
  AXPerformSafeBlock();
  objc_destroyWeak(v2);
  return 1;
}

void __72___UIDatePickerCalendarTimeLabelAccessibility__accessibilityHourElement__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = (id)[WeakRetained safeValueForKey:@"stateContext"];
  uint64_t v8 = [v6 safeIntegerForKey:@"currentState"];

  if (v8 != 3)
  {
    if (v8 == 1 || v8 == 6)
    {
      id v4 = objc_loadWeakRetained((id *)(a1 + 32));
      [v4 _stateMachineSendEvent:2];
    }
    id v1 = objc_loadWeakRetained((id *)(a1 + 32));
    [v1 _stateMachineSendEvent:2];

    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    id v3 = (id)UIKitAccessibilityLocalizedString();
    UIAccessibilityPostNotification(notification, v3);
  }
}

uint64_t __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263F1CED8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v7 = 0;
  char v6 = 0;
  if ([WeakRetained _axSelfIsFirstResponder])
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 32));
    char v7 = 1;
    char v6 = [v8 _axIsMinutesEditing];
  }
  if (v7) {

  }
  if (v6) {
    v9 |= *MEMORY[0x263F81408] | *MEMORY[0x263F81398];
  }
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [v2 safeIntegerForKey:@"inputScope"] != 0;

  if (!v3) {
    return v9 | *MEMORY[0x263F1CF20];
  }
  return v9;
}

void __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = a1;
  uint64_t v14 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained safeStringForKey:@"minuteText"];
  uint64_t v5 = [v3 integerValue];

  uint64_t v13 = v5;
  v12 = 0;
  v11 = 0;
  v11 = *(void **)(a1 + 40);
  v10 = 0;
  uint64_t v9 = 0;
  uint64_t v9 = *(void **)(a1 + 48);
  id v8 = (void *)(v5 + 1);
  if ((uint64_t)v9 >= v5 + 1) {
    id v2 = v8;
  }
  else {
    id v2 = v9;
  }
  v7[3] = v2;
  v10 = v2;
  if ((uint64_t)v11 >= (uint64_t)v2) {
    id v1 = v11;
  }
  else {
    id v1 = v10;
  }
  v7[2] = v1;
  v12 = v1;
  objc_copyWeak(v7, (id *)(a1 + 32));
  v7[1] = v12;
  AXPerformSafeBlock();
  objc_destroyWeak(v7);
}

void __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)(a1 + 40));
  objc_msgSend(WeakRetained, "setMinuteText:");
}

void __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_4(uint64_t a1)
{
  uint64_t v15 = a1;
  uint64_t v14 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id)[WeakRetained safeStringForKey:@"minuteText"];
  uint64_t v5 = [v3 integerValue];

  uint64_t v13 = v5;
  v12 = 0;
  v11 = 0;
  v11 = *(void **)(a1 + 40);
  v10 = 0;
  uint64_t v9 = 0;
  uint64_t v9 = *(void **)(a1 + 40);
  id v8 = (void *)(v5 - 1);
  if ((uint64_t)v9 >= v5 - 1) {
    id v2 = v8;
  }
  else {
    id v2 = v9;
  }
  v7[3] = v2;
  v10 = v2;
  if ((uint64_t)v11 >= (uint64_t)v2) {
    id v1 = v11;
  }
  else {
    id v1 = v10;
  }
  v7[2] = v1;
  v12 = v1;
  objc_copyWeak(v7, (id *)(a1 + 32));
  v7[1] = v12;
  AXPerformSafeBlock();
  objc_destroyWeak(v7);
}

void __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)(a1 + 40));
  objc_msgSend(WeakRetained, "setMinuteText:");
}

id __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)[WeakRetained safeStringForKey:@"minuteText"];
  uint64_t v4 = [v2 integerValue];

  uint64_t v5 = NSString;
  id v6 = (id)UIKitAccessibilityLocalizedString();
  id v7 = (id)[v5 stringWithFormat:v4];

  return v7;
}

uint64_t __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_7(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  objc_copyWeak(v2, a1 + 4);
  AXPerformSafeBlock();
  objc_destroyWeak(v2);
  return 1;
}

void __74___UIDatePickerCalendarTimeLabelAccessibility__accessibilityMinuteElement__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = (id)[WeakRetained safeValueForKey:@"stateContext"];
  uint64_t v8 = [v6 safeIntegerForKey:@"currentState"];

  if (v8 != 4)
  {
    if (v8 == 1 || v8 == 6)
    {
      id v4 = objc_loadWeakRetained((id *)(a1 + 32));
      [v4 _stateMachineSendEvent:3];
    }
    id v1 = objc_loadWeakRetained((id *)(a1 + 32));
    [v1 _stateMachineSendEvent:3];

    UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
    id v3 = (id)UIKitAccessibilityLocalizedString();
    UIAccessibilityPostNotification(notification, v3);
  }
}

@end