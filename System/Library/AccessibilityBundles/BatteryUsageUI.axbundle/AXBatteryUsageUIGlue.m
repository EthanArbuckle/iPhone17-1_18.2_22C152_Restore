@interface AXBatteryUsageUIGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXBatteryUsageUIGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
  }
}

void __53__AXBatteryUsageUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F229D0] sharedInstance];
  [v0 performValidations:&__block_literal_global_276 withPreValidationHandler:&__block_literal_global_278 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_287];
}

uint64_t __53__AXBatteryUsageUIGlue_accessibilityInitializeBundle__block_invoke_2()
{
  return 1;
}

uint64_t __53__AXBatteryUsageUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Preferences Battery Usage UI Settings AX Bundle"];
  [v2 setOverrideProcessName:@"Preferences Battery Usage UI Settings"];

  return MEMORY[0x270F0A270]();
}

void __53__AXBatteryUsageUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UITableViewAccessibility__BatteryUsageUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLBatteryUIGraphLastChargeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLBatteryUIDisplayTableCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLBatteryUITimeUsageCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLBatteryUIBatteryBreakDownHeaderCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLHighlightableSegmentableSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLBatteryUISuggestionHeaderCellAccessibility" canInteractWithTargetClass:1];
}

@end