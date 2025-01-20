@interface AXMenstrualCyclesAppPluginGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXMenstrualCyclesAppPluginGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F229D0] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_267 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_276];

    _Failover = [objc_allocWithZone((Class)AXMenstrualCyclesAppPluginGlue) init];
    MEMORY[0x270F9A758]();
  }
}

uint64_t __63__AXMenstrualCyclesAppPluginGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __63__AXMenstrualCyclesAppPluginGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"MenstrualCyclesAppPlugin AX"];
  [v2 setOverrideProcessName:@"MenstrualCyclesAppPlugin"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F0A270]();
}

void __63__AXMenstrualCyclesAppPluginGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"TimelineDayCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CycleTimelineCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CalendarDayCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CalendarViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CycleHistoryFilterCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LoggingCardCarouselViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"LoggingCardCarouselCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"Health_UICollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DataTypeLoggingCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"TextItemCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"InteractiveTimelineLegendLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"InteractiveTimelineDateIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CycleHistoryFilterSectionHeaderReusableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CycleHistoryTableViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CycleFactorsShowAllFactorsCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CycleFactorsNoneCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"HistoricalSampleCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"OnboardingCycleTimelineInfoViewAccessibility" canInteractWithTargetClass:1];
}

@end