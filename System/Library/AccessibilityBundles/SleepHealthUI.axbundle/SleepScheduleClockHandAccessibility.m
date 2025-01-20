@interface SleepScheduleClockHandAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsValidSleepDurationIncrement:(BOOL)a3 clock:(id)a4 isAdjustingBedtime:(BOOL)a5;
- (BOOL)isAccessibilityElement;
- (id)_axEditCell;
- (id)_axLastSpokenMessage;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)decrementComponents:(id)a3;
- (id)incrementComponents:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_axSetLastSpokenMessage:(id)a3;
- (void)_axSpeakClockAlertIfNeeded;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)adjustClockHandIncrement:(BOOL)a3;
@end

@implementation SleepScheduleClockHandAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SleepHealthUI.SleepScheduleClockHand";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axLastSpokenMessage
{
}

- (void)_axSetLastSpokenMessage:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClockHand", @"accessibilityHandIsBedtime", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.ScheduleOccurrenceComponentsEditTableViewCell", @"accessibilityComponentsEditView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsEditView", @"accessibilityComponentsHeader", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsHeader", @"accessibilityBedtimeTimeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsHeader", @"accessibilityWakeUpTimeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsEditView", @"accessibilityClock", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"accessibilityRoundedBedtimeComponents", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"accessibilityRoundedWakeUpComponents", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"accessibilitySetModel:wakeUpComponents:timeInBedGoal:alarmEnabled:isForSingleDayOverride:", "v", "@", "@", "d", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"accessibilityAlarmEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsEditView", @"clockDidChange:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleComponentsEditView", @"accessibilityClockCaption", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClockCaption", @"accessibilityClockCaptionMessage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"accessibilityTimeInBed", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SleepHealthUI.SleepScheduleClock", @"accessibilityTimeInBedGoal", "d", 0);
  [v3 validateClass:@"UITableViewCellAccessibilityElement"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCellAccessibilityElement", @"realTableViewCell", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (id)accessibilityLabel
{
  int v3 = [(SleepScheduleClockHandAccessibility *)self safeBoolForKey:@"accessibilityHandIsBedtime"];
  v4 = [(SleepScheduleClockHandAccessibility *)self _axEditCell];
  v5 = [v4 safeValueForKey:@"accessibilityComponentsEditView"];
  v6 = [v5 safeValueForKey:@"accessibilityClock"];
  int v7 = [v6 safeBoolForKey:@"accessibilityAlarmEnabled"];

  v8 = @"wakeup.alarm.off";
  if (v7) {
    v8 = @"wakeup.alarm.on";
  }
  if (v3) {
    v9 = @"bedtime";
  }
  else {
    v9 = v8;
  }

  return accessibilityLocalizedString(v9);
}

- (id)accessibilityValue
{
  v2 = self;
  int v3 = [(SleepScheduleClockHandAccessibility *)self _axEditCell];
  v4 = [v3 safeValueForKey:@"accessibilityComponentsEditView"];
  v5 = [v4 safeValueForKey:@"accessibilityComponentsHeader"];

  LODWORD(v2) = [(SleepScheduleClockHandAccessibility *)v2 safeBoolForKey:@"accessibilityHandIsBedtime"];
  objc_opt_class();
  if (v2) {
    v6 = @"accessibilityBedtimeTimeLabel";
  }
  else {
    v6 = @"accessibilityWakeUpTimeLabel";
  }
  int v7 = [v5 safeValueForKey:v6];
  v8 = __UIAccessibilityCastAsClass();

  v9 = [v8 text];

  return v9;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (void)adjustClockHandIncrement:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SleepScheduleClockHandAccessibility *)self _axEditCell];
  v6 = [v5 safeValueForKey:@"accessibilityComponentsEditView"];
  int v7 = [v6 safeValueForKey:@"accessibilityClock"];

  if ([(SleepScheduleClockHandAccessibility *)self _axIsValidSleepDurationIncrement:v3 clock:v7 isAdjustingBedtime:[(SleepScheduleClockHandAccessibility *)self safeBoolForKey:@"accessibilityHandIsBedtime"]])
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    id v26 = 0;
    LOBYTE(v15) = 0;
    objc_opt_class();
    v8 = [v7 safeValueForKey:@"accessibilityRoundedBedtimeComponents"];
    uint64_t v9 = __UIAccessibilityCastAsClass();

    v10 = (void *)v22[5];
    v22[5] = v9;

    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    objc_opt_class();
    v11 = [v7 safeValueForKey:@"accessibilityRoundedWakeUpComponents"];
    uint64_t v12 = __UIAccessibilityCastAsClass();

    v13 = (void *)v16[5];
    v16[5] = v12;

    id v14 = v7;
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    [(SleepScheduleClockHandAccessibility *)self _axSpeakClockAlertIfNeeded];

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
  }
}

void __64__SleepScheduleClockHandAccessibility_adjustClockHandIncrement___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  int v3 = *(unsigned __int8 *)(a1 + 65);
  v4 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v3) {
      [v4 incrementComponents:v5];
    }
    else {
    v6 = [v4 decrementComponents:v5];
    }
    uint64_t v8 = *(void *)(a1 + 48);
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v3) {
      [v4 incrementComponents:v7];
    }
    else {
    v6 = [v4 decrementComponents:v7];
    }
    uint64_t v8 = *(void *)(a1 + 56);
  }
  uint64_t v9 = *(void *)(v8 + 8);
  id v10 = v6;
  v11 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v10;

  uint64_t v12 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  [v12 safeDoubleForKey:@"accessibilityTimeInBedGoal"];
  objc_msgSend(v12, "accessibilitySetModel:wakeUpComponents:timeInBedGoal:alarmEnabled:isForSingleDayOverride:", v13, v14, objc_msgSend(*(id *)(a1 + 40), "safeBoolForKey:", @"accessibilityAlarmEnabled"), 0, v15);
  id v17 = [*(id *)(a1 + 32) _axEditCell];
  v16 = [v17 safeValueForKey:@"accessibilityComponentsEditView"];
  [v16 clockDidChange:*(void *)(a1 + 40)];
}

- (BOOL)_axIsValidSleepDurationIncrement:(BOOL)a3 clock:(id)a4 isAdjustingBedtime:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v5 || v6)
  {
    [v7 safeDoubleForKey:@"accessibilityTimeInBed"];
    if (v5 || !v6)
    {
      if (v9 > 3600.0) {
        goto LABEL_6;
      }
LABEL_8:
      BOOL v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    [v7 safeDoubleForKey:@"accessibilityTimeInBed"];
  }
  if (v9 >= 72000.0) {
    goto LABEL_8;
  }
LABEL_6:
  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (id)incrementComponents:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 minute];
  uint64_t v5 = [v3 hour];
  if (v4 < 55)
  {
    [v3 setMinute:v4 + 5];
  }
  else
  {
    uint64_t v6 = v5;
    [v3 setMinute:0];
    if (v6 < 23)
    {
      uint64_t v8 = v6 + 1;
      id v7 = v3;
    }
    else
    {
      id v7 = v3;
      uint64_t v8 = 0;
    }
    [v7 setHour:v8];
  }

  return v3;
}

- (id)decrementComponents:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 minute];
  uint64_t v5 = [v3 hour];
  if (v4 <= 0)
  {
    uint64_t v6 = v5;
    [v3 setMinute:55];
    if (v6 <= 0)
    {
      uint64_t v8 = v3;
      uint64_t v7 = 23;
    }
    else
    {
      uint64_t v7 = v6 - 1;
      uint64_t v8 = v3;
    }
    [v8 setHour:v7];
  }
  else
  {
    [v3 setMinute:v4 - 5];
  }

  return v3;
}

- (void)_axSpeakClockAlertIfNeeded
{
  id v3 = [(SleepScheduleClockHandAccessibility *)self _axEditCell];
  uint64_t v4 = [v3 safeValueForKey:@"accessibilityComponentsEditView"];
  uint64_t v5 = [(id)v4 safeValueForKey:@"accessibilityClockCaption"];
  id v7 = [v5 safeStringForKey:@"accessibilityClockCaptionMessage"];

  uint64_t v6 = [(SleepScheduleClockHandAccessibility *)self _axLastSpokenMessage];
  LOBYTE(v4) = [v7 isEqualToString:v6];

  if ((v4 & 1) == 0)
  {
    UIAccessibilitySpeakOrQueueIfNeeded();
    [(SleepScheduleClockHandAccessibility *)self _axSetLastSpokenMessage:v7];
  }
}

- (id)_axEditCell
{
  int v2 = [(SleepScheduleClockHandAccessibility *)self accessibilityContainer];
  MEMORY[0x245661BC0](@"SleepHealthUI.ScheduleOccurrenceComponentsEditTableViewCell");
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    uint64_t v4 = v3;
    goto LABEL_7;
  }
  MEMORY[0x245661BC0](@"UITableViewCellAccessibilityElement");
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 safeValueForKey:@"realTableViewCell"];
    goto LABEL_5;
  }
  uint64_t v4 = 0;
LABEL_7:

  return v4;
}

@end