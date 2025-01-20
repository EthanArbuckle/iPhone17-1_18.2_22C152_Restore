@interface AXFitnessGlue
+ (id)accessibilityBundles;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXFitnessGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_0);
  }
}

void __46__AXFitnessGlue_accessibilityInitializeBundle__block_invoke(id a1)
{
  id v1 = +[AXValidationManager sharedInstance];
  [v1 performValidations:&__block_literal_global_293 withPreValidationHandler:&__block_literal_global_316 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_322];
}

BOOL __46__AXFitnessGlue_accessibilityInitializeBundle__block_invoke_2(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 validateClass:@"NSCalendar", @"hk_gregorianCalendarWithUTCTimeZone", "@", 0 hasClassMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"ActivitySummaryCache", @"activitySummaryForCacheIndex:", "@", "q", 0 hasInstanceMethod withFullSignature];
  [(AXValidationManager *)v2 validateClass:@"HKActivitySummary", @"_exerciseTimeCompletionPercentage", "d", 0 hasInstanceMethod withFullSignature];

  return 1;
}

BOOL __46__AXFitnessGlue_accessibilityInitializeBundle__block_invoke_3(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 setValidationTargetName:@"AX Fitness"];
  [(AXValidationManager *)v2 setOverrideProcessName:@"AX Fitness"];
  [(AXValidationManager *)v2 setDebugBuild:0];

  return _AXPerformValidationChecks();
}

void __46__AXFitnessGlue_accessibilityInitializeBundle__block_invoke_4(id a1, AXValidationManager *a2)
{
  v2 = a2;
  [(AXValidationManager *)v2 installSafeCategory:@"TrophyCaseSectionCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TrophyCaseSectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"ActivityTileSectionHeaderAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHWorkoutDetailSummaryTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TodayActivityTileAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"DayViewTitleAndValueLabelPairAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TodayActivityTileAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TrophyCaseAwardDetailBadgeCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHWorkoutCellImageLabelViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CatalogTipActivityTileAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHWorkoutDetailAwardTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"WorkoutsListContentViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHFriendInboxAddTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHListSummaryTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHAchievementsCellContentViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TrendPairTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"DayViewActivityRingsTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TrendDetailDailyAverageViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TrendDetailChartViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TrendDetailSummaryViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TrendListHeaderViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TrendingDownTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"TrendListMetricViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"DayViewStandChartTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"ActivityStandChartViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"DayViewMoveAndExerciseChartTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"ActivityMoveAndExerciseChartViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHFriendListCompetitionTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHNoHeartRateDataViewControllerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHFriendListViewControllerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHWorkoutDetailHeartRateChartViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHFriendListTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHAchievementsSectionHeaderViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHFriendInboxBarButtonViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHFriendDetailCollectionViewControllerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHFriendDetailActionCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHFriendDetailGoalCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHAchievementCollectionViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHWorkoutDetailExpandingHeaderViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHListTableHeaderViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"_CHWorkoutSummaryTabbedLabelContainerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"PaletteViewControllerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHWorkoutDetailTwoValueTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHWorkoutDetailPaceTableViewCellAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHWorkoutFormattingManagerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"_FitnessMonthTitleLabelAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"FitnessUIScrollViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"MonthScrollViewControllerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHAchievementDetailViewControllerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"FitnessUIButtonAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"MonthViewControllerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"MonthDayCellLayerAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"MonthWeekViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"PaletteWeekdayHeaderViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"WeekPaletteTappableDayAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"AX_FitnessNSStringAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHASActivitySetupGoalViewAccessibility" canInteractWithTargetClass:1];
  [(AXValidationManager *)v2 installSafeCategory:@"CHASActivitySetupViewControllerAccessibility" canInteractWithTargetClass:1];
}

@end