@interface AXHealthMedicationsUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXHealthMedicationsUIGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXHealthMedicationsUIGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __58__AXHealthMedicationsUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __58__AXHealthMedicationsUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"HealthMedicationsUI AX"];
  [v2 setOverrideProcessName:@"HealthMedicationsUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __58__AXHealthMedicationsUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"ShapeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ColorCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MedicationListItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"InteractionFactorsCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"InteractionSummaryItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MedicationsCategoryRoomTipViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ScheduleHeaderCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"ScheduleDurationCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MedicationCategoryTipCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MedicationInfoItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MedicationMarkdownItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DayPickerDayAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"MedicationDoseLogMedicationViewAccessibility" canInteractWithTargetClass:1];
}

@end