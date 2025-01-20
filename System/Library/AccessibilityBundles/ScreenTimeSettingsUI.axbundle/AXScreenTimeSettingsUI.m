@interface AXScreenTimeSettingsUI
+ (void)accessibilityInitializeBundle;
@end

@implementation AXScreenTimeSettingsUI

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global_0 withPreValidationHandler:&__block_literal_global_270 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_279];

    _Failover = [objc_allocWithZone((Class)AXScreenTimeSettingsUI) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __55__AXScreenTimeSettingsUI_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __55__AXScreenTimeSettingsUI_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"ScreenTimeUI Settings AX"];
  [v2 setOverrideProcessName:@"ScreenTimeUI Settings"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __55__AXScreenTimeSettingsUI_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"STOverallUsageSummaryCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STUsageCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STMostUsedCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STTimeTitleDetailCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STAlwaysAllowListControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSTableCellAccessibility__ScreenTimeUI__Preferences" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STUsageGraphViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STNotificationUsageCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STBarViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STSingleLineHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STSingleLineDetailTextHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STSetupAssistantPosedDeviceViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PSSpecifierAccessibility__ScreenTimeUI__Preferences" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STAllowanceDetailListControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STCustomizeDaysListControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STSingleLineButtonHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STUsageReportAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STHorizontallySegmentedViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STUsageSummaryTitleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STHistoricalPickupsCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STSegmentItemAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STHistoricalUsageViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STHistoricalScreenTimeCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STSegmentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STHistoricalNotificationsCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STDatePickerBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITableViewAccessibility__ScreenTimeUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"STSimpleScheduleListControllerAccessibility" canInteractWithTargetClass:1];
}

@end