@interface AXHealthUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXHealthUIGlue

+ (void)accessibilityInitializeBundle
{
  id v2 = [MEMORY[0x263F229D0] sharedInstance];
  [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_297 postValidationHandler:&__block_literal_global_303 safeCategoryInstallationHandler:&__block_literal_global_306];
}

uint64_t __47__AXHealthUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __47__AXHealthUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"HealthUI"];
  [v2 setOverrideProcessName:@"HealthUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __47__AXHealthUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"HKExportPDFControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_HKMedicalIDMultilineStringCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKMedicalIDEditorNameAndPhotoCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKMedicalIDEditorMultilineStringCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKSwitchTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKMedicalIDEditorPickerCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKMedicalIDViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITextFieldAccessibility__HealthKit__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKMedicalIDEditorWeightCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKMedicalIDEditorHeightCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKUnitPreferenceControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKMedicalIDNoValueTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKMedicalIDEditorCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKGraphViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKElectrocardiogramChartTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKElectrocardiogramChartViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKElectrocardiogramAxisViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKElectrocardiogramCardViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKMonthWeekViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKMonthDayCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKWeekdayHeaderPaletteViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKCalendarScrollViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKInteractiveChartViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_HKTimeScopeControlBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKDisplayTypeContextVerticalCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKListItemLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKNumberedListItemViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKOnboardingBaseViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKAudiogramChartViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKOnboardingCompactDatePickerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKInteractiveChartAnnotationViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKPopulationNormsClassificationCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HKSingleAudiogramChartViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end