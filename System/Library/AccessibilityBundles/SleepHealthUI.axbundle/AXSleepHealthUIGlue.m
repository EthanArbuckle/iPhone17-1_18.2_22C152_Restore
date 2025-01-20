@interface AXSleepHealthUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXSleepHealthUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXSleepHealthUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __52__AXSleepHealthUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __52__AXSleepHealthUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"SleepHealthUI AX"];
  [v2 setOverrideProcessName:@"SleepHealthUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __52__AXSleepHealthUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"SleepScheduleClockHandAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ScheduleOccurrenceComponentsEditTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SleepScheduleClockCaptionAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SleepScheduleClockAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SleepScheduleComponentsHeaderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ScheduleOccurrenceAlarmVolumeTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TimeDurationPickerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"SleepScheduleDayPickerDayAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ScheduleOccurrenceDayPickerTableViewCellAccessibility" canInteractWithTargetClass:1];
}

@end