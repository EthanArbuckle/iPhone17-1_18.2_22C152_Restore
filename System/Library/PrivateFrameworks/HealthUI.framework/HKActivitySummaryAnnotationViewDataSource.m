@interface HKActivitySummaryAnnotationViewDataSource
- (BOOL)_hasRingView;
- (BOOL)currentValueViewContext;
- (BOOL)isChartSharingContext;
- (BOOL)showSeparators;
- (BOOL)useStandardAnnotationDataSource;
- (HKActivityRingView)ringView;
- (HKActivitySummary)activitySummary;
- (HKActivitySummaryAnnotationViewDataSource)initWithDisplayTypeController:(id)a3 unitController:(id)a4 wheelchairUseCharacteristicCache:(id)a5 dateCache:(id)a6 currentValueViewContext:(BOOL)a7 activityOptions:(unint64_t)a8 firstWeekday:(int64_t)a9 isChartSharingContext:(BOOL)a10;
- (HKDateCache)dateCache;
- (HKDisplayTypeController)displayTypeController;
- (HKInteractiveChartAnnotationViewDataSource)standardAnnotationDataSource;
- (HKUnitPreferenceController)unitController;
- (NSArray)columnsForPosition;
- (UIView)ringContainer;
- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache;
- (id)_bodyColor;
- (id)_buildColumnPositionsFromOptions:(unint64_t)a3;
- (id)_columnViewWithTitle:(id)a3 titleColor:(id)a4 body:(id)a5 bodyColor:(id)a6 alignment:(int64_t)a7;
- (id)_dateColumnWithDateComponents:(id)a3 calendar:(id)a4 orientation:(int64_t)a5;
- (id)_dateTextForDateComponents:(id)a3 calendar:(id)a4 timeScope:(int64_t)a5;
- (id)_energyColumn;
- (id)_energyColumnAsNumber;
- (id)_energyColumnValueString;
- (id)_exerciseColumn;
- (id)_exerciseColumnAsNumber;
- (id)_exerciseColumnValueString;
- (id)_moveColumn;
- (id)_moveColumnAsNumber;
- (id)_moveColumnValueString;
- (id)_moveTimeColumn;
- (id)_moveTimeColumnAsNumber;
- (id)_moveTimeColumnValueString;
- (id)_pauseColumn;
- (id)_pauseTextColorForTimeScope:(int64_t)a3;
- (id)_pauseTextForTimeScope:(int64_t)a3;
- (id)_pausedActivityDayPeriod;
- (id)_pausedActivityLongPeriod;
- (id)_percentStringWithQuantity:(id)a3 goalQuantity:(id)a4;
- (id)_ringColumn;
- (id)_standColumn;
- (id)_standColumnAsNumber;
- (id)_standColumnValueString;
- (id)_valueUnitAttributedStringWithValueString:(id)a3 unitString:(id)a4;
- (id)_valueWithTitle:(id)a3 attributedValue:(id)a4 valueAsNumber:(id)a5;
- (id)_weekContainingDateComponents:(id)a3 calendar:(id)a4 timeScope:(int64_t)a5;
- (id)activityExerciseTitle;
- (id)activityMoveTitle;
- (id)activityStandTitle;
- (id)dateViewWithOrientation:(int64_t)a3;
- (id)descriptionsForActivitySummary;
- (id)leftMarginViewWithOrientation:(int64_t)a3;
- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4;
- (id)viewForColumnType:(unint64_t)a3;
- (int64_t)firstWeekday;
- (int64_t)numberOfValuesForAnnotationView:(id)a3;
- (int64_t)timeScope;
- (void)setActivitySummary:(id)a3;
- (void)setCurrentValueViewContext:(BOOL)a3;
- (void)setDateCache:(id)a3;
- (void)setDisplayTypeController:(id)a3;
- (void)setRingContainer:(id)a3;
- (void)setRingView:(id)a3;
- (void)setStandardAnnotationViewDataSource:(id)a3;
- (void)setTimeScope:(int64_t)a3;
- (void)setUnitController:(id)a3;
- (void)setWheelchairUseCharacteristicCache:(id)a3;
- (void)useActivityAnnotationViewDataSource;
- (void)useStandardAnnotationViewDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 healthStore:(id)a7 viewController:(id)a8;
@end

@implementation HKActivitySummaryAnnotationViewDataSource

- (HKActivitySummaryAnnotationViewDataSource)initWithDisplayTypeController:(id)a3 unitController:(id)a4 wheelchairUseCharacteristicCache:(id)a5 dateCache:(id)a6 currentValueViewContext:(BOOL)a7 activityOptions:(unint64_t)a8 firstWeekday:(int64_t)a9 isChartSharingContext:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HKActivitySummaryAnnotationViewDataSource;
  v20 = [(HKActivitySummaryAnnotationViewDataSource *)&v27 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_displayTypeController, a3);
    objc_storeStrong((id *)&v21->_unitController, a4);
    objc_storeStrong((id *)&v21->_wheelchairUseCharacteristicCache, a5);
    objc_storeStrong((id *)&v21->_dateCache, a6);
    v21->_currentValueViewContext = a7;
    v21->_firstWeekday = a9;
    uint64_t v22 = [(HKActivitySummaryAnnotationViewDataSource *)v21 _buildColumnPositionsFromOptions:a8];
    columnsForPosition = v21->_columnsForPosition;
    v21->_columnsForPosition = (NSArray *)v22;

    standardAnnotationDataSource = v21->_standardAnnotationDataSource;
    v21->_standardAnnotationDataSource = 0;

    v21->_useStandardAnnotationDataSource = 0;
    v21->_isChartSharingContext = a10;
  }

  return v21;
}

- (void)setStandardAnnotationViewDataSource:(id)a3
{
}

- (void)useActivityAnnotationViewDataSource
{
  self->_useStandardAnnotationDataSource = 0;
}

- (void)useStandardAnnotationViewDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 healthStore:(id)a7 viewController:(id)a8
{
  self->_useStandardAnnotationDataSource = 1;
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v18 = [(HKActivitySummaryAnnotationViewDataSource *)self standardAnnotationDataSource];
  [v18 updateWithSelectionContext:v17 displayType:v16 timeScope:a5 resolution:a6 healthStore:v15 viewController:v14];
}

- (id)_buildColumnPositionsFromOptions:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = v4;
  if (v3)
  {
    if ((v3 & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    [v4 addObject:&unk_1F3C21AD8];
    if ((v3 & 2) != 0)
    {
LABEL_3:
      if ((v3 & 4) != 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  [v5 addObject:&unk_1F3C21AF0];
  if ((v3 & 4) == 0) {
LABEL_4:
  }
    [v5 addObject:&unk_1F3C21B08];
LABEL_5:
  v6 = (void *)[v5 copy];

  return v6;
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  if ([(HKActivitySummaryAnnotationViewDataSource *)self useStandardAnnotationDataSource])
  {
    v5 = [(HKActivitySummaryAnnotationViewDataSource *)self standardAnnotationDataSource];
    v6 = [v5 dateViewWithOrientation:a3];
  }
  else
  {
    v5 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
    v7 = [v5 _gregorianDateComponents];
    v8 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
    v6 = [(HKActivitySummaryAnnotationViewDataSource *)self _dateColumnWithDateComponents:v7 calendar:v8 orientation:a3];
  }
  return v6;
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  if ([(HKActivitySummaryAnnotationViewDataSource *)self useStandardAnnotationDataSource])
  {
    v5 = [(HKActivitySummaryAnnotationViewDataSource *)self standardAnnotationDataSource];
    v6 = [v5 leftMarginViewWithOrientation:a3];
  }
  else if ([(HKActivitySummaryAnnotationViewDataSource *)self _hasRingView])
  {
    v6 = [(HKActivitySummaryAnnotationViewDataSource *)self _ringColumn];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  id v4 = a3;
  if ([(HKActivitySummaryAnnotationViewDataSource *)self useStandardAnnotationDataSource])
  {
    v5 = [(HKActivitySummaryAnnotationViewDataSource *)self standardAnnotationDataSource];
    uint64_t v6 = [v5 numberOfValuesForAnnotationView:v4];
LABEL_6:
    int64_t v9 = v6;

    goto LABEL_7;
  }
  v7 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  char v8 = [v7 isPaused];

  if ((v8 & 1) == 0)
  {
    v5 = [(HKActivitySummaryAnnotationViewDataSource *)self columnsForPosition];
    uint64_t v6 = [v5 count];
    goto LABEL_6;
  }
  int64_t v9 = 1;
LABEL_7:

  return v9;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  if ([(HKActivitySummaryAnnotationViewDataSource *)self useStandardAnnotationDataSource])
  {
    v7 = [(HKActivitySummaryAnnotationViewDataSource *)self standardAnnotationDataSource];
    char v8 = [v7 valueViewForColumnAtIndex:a3 orientation:a4];
  }
  else
  {
    int64_t v9 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
    int v10 = [v9 isPaused];

    if (v10)
    {
      uint64_t v11 = [(HKActivitySummaryAnnotationViewDataSource *)self _pauseColumn];
    }
    else if (a3 < 0 {
           || ([(HKActivitySummaryAnnotationViewDataSource *)self columnsForPosition],
    }
               v12 = objc_claimAutoreleasedReturnValue(),
               unint64_t v13 = [v12 count],
               v12,
               v13 <= a3))
    {
      id v17 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      uint64_t v11 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    else
    {
      id v14 = [(HKActivitySummaryAnnotationViewDataSource *)self columnsForPosition];
      id v15 = [v14 objectAtIndexedSubscript:a3];
      uint64_t v16 = (int)[v15 intValue];

      uint64_t v11 = [(HKActivitySummaryAnnotationViewDataSource *)self viewForColumnType:v16];
    }
    char v8 = (void *)v11;
  }
  return v8;
}

- (id)_pauseColumn
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [(HKActivitySummaryAnnotationViewDataSource *)self _pauseTextForTimeScope:[(HKActivitySummaryAnnotationViewDataSource *)self timeScope]];
  [v3 setText:v4];

  v5 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartActivityValueFont");
  [v3 setFont:v5];

  uint64_t v6 = [(HKActivitySummaryAnnotationViewDataSource *)self _pauseTextColorForTimeScope:[(HKActivitySummaryAnnotationViewDataSource *)self timeScope]];
  [v3 setTextColor:v6];

  [v3 setNumberOfLines:0];
  [v3 setAdjustsFontSizeToFitWidth:1];
  v7 = [v3 widthAnchor];
  char v8 = [v7 constraintLessThanOrEqualToConstant:175.0];
  [v8 setActive:1];

  int64_t v9 = [v3 heightAnchor];
  int v10 = [v9 constraintEqualToConstant:50.0];
  [v10 setActive:1];

  uint64_t v11 = objc_msgSend(NSString, "hk_chartLollipopAccessibilityIdentifier:", @"Paused");
  [v3 setAccessibilityIdentifier:v11];

  return v3;
}

- (id)_pauseTextForTimeScope:(int64_t)a3
{
  uint64_t v5 = [(HKActivitySummaryAnnotationViewDataSource *)self currentValueViewContext];
  if (v5)
  {
    if ((unint64_t)a3 >= 6)
    {
      if ((unint64_t)(a3 - 6) >= 3) {
        goto LABEL_9;
      }
LABEL_6:
      uint64_t v5 = [(HKActivitySummaryAnnotationViewDataSource *)self _pausedActivityDayPeriod];
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if ((unint64_t)(a3 - 4) < 5) {
    goto LABEL_6;
  }
  if ((unint64_t)a3 <= 3)
  {
LABEL_8:
    uint64_t v5 = [(HKActivitySummaryAnnotationViewDataSource *)self _pausedActivityLongPeriod];
  }
LABEL_9:
  return (id)v5;
}

- (id)_pausedActivityLongPeriod
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self isChartSharingContext];
  id v4 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  int v5 = [v4 _isStandalonePhoneSummary];

  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = v6;
  char v8 = @"ACTIVITY_PAUSED_SELECTION_SHARED_LONG";
  if (v5) {
    char v8 = @"ACTIVITY_PAUSED_SELECTION_SHARED_LONG_VEGA";
  }
  int64_t v9 = @"ACTIVITY_PAUSED_SELECTION_LONG_VEGA";
  if (!v5) {
    int64_t v9 = @"ACTIVITY_PAUSED_SELECTION_LONG";
  }
  if (v3) {
    int v10 = v8;
  }
  else {
    int v10 = v9;
  }
  uint64_t v11 = [v6 localizedStringForKey:v10 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v11;
}

- (id)_pausedActivityDayPeriod
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self isChartSharingContext];
  id v4 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  int v5 = [v4 _isStandalonePhoneSummary];

  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v7 = v6;
  char v8 = @"ACTIVITY_PAUSED_SELECTION_SHARED_DAY";
  if (v5) {
    char v8 = @"ACTIVITY_PAUSED_SELECTION_SHARED_DAY_VEGA";
  }
  int64_t v9 = @"ACTIVITY_PAUSED_SELECTION_DAY_VEGA";
  if (!v5) {
    int64_t v9 = @"ACTIVITY_PAUSED_SELECTION_DAY";
  }
  if (v3) {
    int v10 = v8;
  }
  else {
    int v10 = v9;
  }
  uint64_t v11 = [v6 localizedStringForKey:v10 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v11;
}

- (id)_pauseTextColorForTimeScope:(int64_t)a3
{
  if ((unint64_t)a3 >= 6)
  {
    if ((unint64_t)(a3 - 6) >= 3) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if ([(HKActivitySummaryAnnotationViewDataSource *)self currentValueViewContext])
  {
    id v3 = (id)[MEMORY[0x1E4FB1618] labelColor];
LABEL_5:
    self = [MEMORY[0x1E4FB1618] labelColor];
    goto LABEL_7;
  }
  self = [MEMORY[0x1E4FB1618] whiteColor];
LABEL_7:
  return self;
}

- (id)viewForColumnType:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [(HKActivitySummaryAnnotationViewDataSource *)self _standColumn];
  }
  else if (a3 == 1)
  {
    id v3 = [(HKActivitySummaryAnnotationViewDataSource *)self _exerciseColumn];
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    id v3 = [(HKActivitySummaryAnnotationViewDataSource *)self _moveColumn];
  }
  a2 = v3;
LABEL_8:
  return (id)(id)a2;
}

- (BOOL)showSeparators
{
  if ([(HKActivitySummaryAnnotationViewDataSource *)self useStandardAnnotationDataSource])
  {
    id v3 = [(HKActivitySummaryAnnotationViewDataSource *)self standardAnnotationDataSource];
    char v4 = [v3 showSeparators];
  }
  else
  {
    id v3 = [(HKActivitySummaryAnnotationViewDataSource *)self columnsForPosition];
    char v4 = (unint64_t)[v3 count] > 1;
  }

  return v4;
}

- (BOOL)_hasRingView
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self currentValueViewContext];
  int64_t v4 = [(HKActivitySummaryAnnotationViewDataSource *)self timeScope];
  if (!v3) {
    return v4 == 5 || [(HKActivitySummaryAnnotationViewDataSource *)self timeScope] == 4;
  }
  if (v4 == 6) {
    return objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4InchScreen") ^ 1;
  }
  else {
    return 0;
  }
}

- (id)activityStandTitle
{
  v2 = (void *)MEMORY[0x1E4F2B0B8];
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self wheelchairUseCharacteristicCache];
  int64_t v4 = objc_msgSend(v2, "localizationStringSuffixForWheelchairUser:", objc_msgSend(v3, "isWheelchairUser"));

  int v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v6 = [@"STAND_CHART_TITLE" stringByAppendingString:v4];
  v7 = [v5 localizedStringForKey:v6 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v7;
}

- (id)_standColumnValueString
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  int64_t v4 = [v3 appleStandHours];
  int v5 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  uint64_t v6 = [v5 standHoursGoal];
  v7 = HKLocalizedDisplayStringForAppleStandHours(v4, v6, 1, 1);

  char v8 = NSString;
  int64_t v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  int v10 = [v9 localizedStringForKey:@"HOURS_MEDIUM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v11 = [v8 localizedStringWithFormat:v10];

  v12 = [(HKActivitySummaryAnnotationViewDataSource *)self _valueUnitAttributedStringWithValueString:v7 unitString:v11];

  return v12;
}

- (id)_standColumnAsNumber
{
  v2 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  BOOL v3 = [v2 appleStandHours];
  int64_t v4 = [MEMORY[0x1E4F2B618] countUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  v7 = NSNumber;
  return (id)[v7 numberWithDouble:v6];
}

- (id)_standColumn
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self _standColumnValueString];
  int64_t v4 = [(HKActivitySummaryAnnotationViewDataSource *)self activityStandTitle];
  double v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityStandGoalLineColor");
  double v6 = [(HKActivitySummaryAnnotationViewDataSource *)self _bodyColor];
  v7 = [(HKActivitySummaryAnnotationViewDataSource *)self _columnViewWithTitle:v4 titleColor:v5 body:v3 bodyColor:v6 alignment:4];

  return v7;
}

- (id)activityExerciseTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v3 = [v2 localizedStringForKey:@"EXERCISE_CHART_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)_exerciseColumnValueString
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  int64_t v4 = [v3 appleExerciseTime];
  double v5 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  double v6 = [v5 exerciseTimeGoal];
  v7 = HKLocalizedDisplayStringForAppleExerciseTime(v4, v6, 1, 1);

  char v8 = NSString;
  int64_t v9 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  int v10 = [v9 localizedStringForKey:@"MINUTES_MEDIUM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v11 = [v8 localizedStringWithFormat:v10];

  v12 = [(HKActivitySummaryAnnotationViewDataSource *)self _valueUnitAttributedStringWithValueString:v7 unitString:v11];

  return v12;
}

- (id)_exerciseColumnAsNumber
{
  v2 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  BOOL v3 = [v2 appleExerciseTime];
  int64_t v4 = [MEMORY[0x1E4F2B618] minuteUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  v7 = NSNumber;
  return (id)[v7 numberWithDouble:v6];
}

- (id)_exerciseColumn
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self _exerciseColumnValueString];
  int64_t v4 = [(HKActivitySummaryAnnotationViewDataSource *)self activityExerciseTitle];
  double v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityExerciseGoalLineColor");
  double v6 = [(HKActivitySummaryAnnotationViewDataSource *)self _bodyColor];
  v7 = [(HKActivitySummaryAnnotationViewDataSource *)self _columnViewWithTitle:v4 titleColor:v5 body:v3 bodyColor:v6 alignment:4];

  return v7;
}

- (id)activityMoveTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v3 = [v2 localizedStringForKey:@"MOVE_CHART_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return v3;
}

- (id)_energyColumnValueString
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self displayTypeController];
  int64_t v4 = [v3 displayTypeWithIdentifier:&unk_1F3C21B20];

  double v5 = [(HKActivitySummaryAnnotationViewDataSource *)self unitController];
  double v6 = [v5 unitForDisplayType:v4];

  v7 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  char v8 = [v7 activeEnergyBurned];
  int64_t v9 = HKLocalizedStringWithEnergy();

  int v10 = [(HKActivitySummaryAnnotationViewDataSource *)self unitController];
  uint64_t v11 = NSNumber;
  v12 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  unint64_t v13 = [v12 activeEnergyBurned];
  [v13 doubleValueForUnit:v6];
  id v14 = objc_msgSend(v11, "numberWithDouble:");
  id v15 = [v10 localizedDisplayNameForDisplayType:v4 value:v14];

  uint64_t v16 = [(HKActivitySummaryAnnotationViewDataSource *)self _valueUnitAttributedStringWithValueString:v9 unitString:v15];

  return v16;
}

- (id)_energyColumnAsNumber
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self displayTypeController];
  int64_t v4 = [v3 displayTypeWithIdentifier:&unk_1F3C21B20];

  double v5 = [(HKActivitySummaryAnnotationViewDataSource *)self unitController];
  double v6 = [v5 unitForDisplayType:v4];

  v7 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  char v8 = [v7 activeEnergyBurned];
  [v8 doubleValueForUnit:v6];
  double v10 = v9;

  uint64_t v11 = [NSNumber numberWithDouble:v10];

  return v11;
}

- (id)_energyColumn
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self _energyColumnValueString];
  int64_t v4 = [(HKActivitySummaryAnnotationViewDataSource *)self activityMoveTitle];
  double v5 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_activityMoveGoalLineColor");
  double v6 = [(HKActivitySummaryAnnotationViewDataSource *)self _bodyColor];
  v7 = [(HKActivitySummaryAnnotationViewDataSource *)self _columnViewWithTitle:v4 titleColor:v5 body:v3 bodyColor:v6 alignment:4];

  return v7;
}

- (id)_moveTimeColumnValueString
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  int64_t v4 = [v3 appleMoveTime];
  double v5 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  double v6 = [v5 appleMoveTimeGoal];
  v7 = HKLocalizedDisplayStringForAppleMoveTime(v4, v6, 1, 1);

  char v8 = [(HKActivitySummaryAnnotationViewDataSource *)self displayTypeController];
  double v9 = [v8 displayTypeWithIdentifier:&unk_1F3C21B38];

  double v10 = [(HKActivitySummaryAnnotationViewDataSource *)self unitController];
  uint64_t v11 = [v10 unitForDisplayType:v9];

  v12 = [(HKActivitySummaryAnnotationViewDataSource *)self unitController];
  unint64_t v13 = NSNumber;
  id v14 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  id v15 = [v14 appleMoveTime];
  [v15 doubleValueForUnit:v11];
  uint64_t v16 = objc_msgSend(v13, "numberWithDouble:");
  id v17 = [v12 localizedDisplayNameForUnit:v11 value:v16];

  id v18 = [(HKActivitySummaryAnnotationViewDataSource *)self _valueUnitAttributedStringWithValueString:v7 unitString:v17];

  return v18;
}

- (id)_moveTimeColumnAsNumber
{
  v2 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  BOOL v3 = [v2 appleMoveTime];
  int64_t v4 = [MEMORY[0x1E4F2B618] minuteUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  v7 = NSNumber;
  return (id)[v7 numberWithDouble:v6];
}

- (id)_moveTimeColumn
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self _moveTimeColumnValueString];
  int64_t v4 = [(HKActivitySummaryAnnotationViewDataSource *)self activityMoveTitle];
  double v5 = [MEMORY[0x1E4F496A0] energyColors];
  double v6 = [v5 nonGradientTextColor];
  v7 = [(HKActivitySummaryAnnotationViewDataSource *)self _bodyColor];
  char v8 = [(HKActivitySummaryAnnotationViewDataSource *)self _columnViewWithTitle:v4 titleColor:v6 body:v3 bodyColor:v7 alignment:4];

  return v8;
}

- (id)_moveColumn
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  if ([v3 activityMoveMode] == 2) {
    [(HKActivitySummaryAnnotationViewDataSource *)self _moveTimeColumn];
  }
  else {
  int64_t v4 = [(HKActivitySummaryAnnotationViewDataSource *)self _energyColumn];
  }

  return v4;
}

- (id)_moveColumnValueString
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  if ([v3 activityMoveMode] == 2) {
    [(HKActivitySummaryAnnotationViewDataSource *)self _moveTimeColumnValueString];
  }
  else {
  int64_t v4 = [(HKActivitySummaryAnnotationViewDataSource *)self _energyColumnValueString];
  }

  return v4;
}

- (id)_moveColumnAsNumber
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  if ([v3 activityMoveMode] == 2) {
    [(HKActivitySummaryAnnotationViewDataSource *)self _moveTimeColumnAsNumber];
  }
  else {
  int64_t v4 = [(HKActivitySummaryAnnotationViewDataSource *)self _energyColumnAsNumber];
  }

  return v4;
}

- (id)_percentStringWithQuantity:(id)a3 goalQuantity:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 _unit];
  [v6 doubleValueForUnit:v7];
  double v9 = v8;

  [v5 doubleValueForUnit:v7];
  double v11 = v10;

  double v12 = v9 / v11;
  if (((*(void *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE)
  {
    unint64_t v13 = objc_msgSend(MEMORY[0x1E4F28EE0], "hk_percentNumberFormatter");
    id v15 = [NSNumber numberWithDouble:v12];
    id v14 = [v13 stringFromNumber:v15];
  }
  else
  {
    unint64_t v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v14 = [v13 localizedStringForKey:@"NO_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }

  return v14;
}

- (id)_valueUnitAttributedStringWithValueString:(id)a3 unitString:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4FB08E0];
  id v25 = a4;
  id v7 = a3;
  double v8 = objc_msgSend(v6, "hk_chartActivityValueFont");
  objc_super v27 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueUnitFont");
  double v9 = [MEMORY[0x1E4F1CA48] array];
  BOOL v10 = [(HKActivitySummaryAnnotationViewDataSource *)self currentValueViewContext];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  if (v10)
  {
    v33[0] = v8;
    uint64_t v12 = *MEMORY[0x1E4FB0700];
    v32[0] = v11;
    v32[1] = v12;
    unint64_t v13 = [MEMORY[0x1E4FB1618] labelColor];
    v33[1] = v13;
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = v33;
    uint64_t v16 = v32;
  }
  else
  {
    v31[0] = v8;
    uint64_t v12 = *MEMORY[0x1E4FB0700];
    v30[0] = v11;
    v30[1] = v12;
    unint64_t v13 = [MEMORY[0x1E4FB1618] whiteColor];
    v31[1] = v13;
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = v31;
    uint64_t v16 = v30;
  }
  id v17 = objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 2, v25);

  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v17];
  [v9 addObject:v18];
  if ([(HKActivitySummaryAnnotationViewDataSource *)self currentValueViewContext]) {
    [MEMORY[0x1E4FB1618] systemDarkMidGrayColor];
  }
  else {
  id v19 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
  }
  v28[0] = v11;
  v28[1] = v12;
  v29[0] = v27;
  v29[1] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v20];
  [v9 addObject:v21];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v26 attributes:v20];

  [v9 addObject:v22];
  v23 = HKUIJoinAttributedStringsForLocale(v9);

  return v23;
}

- (id)_ringColumn
{
  BOOL v3 = [(HKActivitySummaryAnnotationViewDataSource *)self ringContainer];

  if (!v3)
  {
    int64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F2BFE0]), "initWithFrame:", 0.0, 0.0, 48.0, 48.0);
    [(HKActivitySummaryAnnotationViewDataSource *)self setRingView:v4];

    id v5 = [(HKActivitySummaryAnnotationViewDataSource *)self ringView];
    [v5 setAutoresizingMask:40];

    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, 48.0, 48.0);
    [(HKActivitySummaryAnnotationViewDataSource *)self setRingContainer:v6];

    id v7 = [(HKActivitySummaryAnnotationViewDataSource *)self ringContainer];
    double v8 = [(HKActivitySummaryAnnotationViewDataSource *)self ringView];
    [v7 addSubview:v8];

    double v9 = [(HKActivitySummaryAnnotationViewDataSource *)self ringContainer];
    [v9 setAutoresizingMask:16];
  }
  BOOL v10 = [(HKActivitySummaryAnnotationViewDataSource *)self ringView];
  uint64_t v11 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  objc_msgSend(v10, "setActivitySummary:animated:", v11, -[HKActivitySummaryAnnotationViewDataSource currentValueViewContext](self, "currentValueViewContext"));

  uint64_t v12 = [(HKActivitySummaryAnnotationViewDataSource *)self activitySummary];
  if ([v12 isPaused]) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  unint64_t v13 = [MEMORY[0x1E4FB1618] blackColor];
  }

  id v14 = [(HKActivitySummaryAnnotationViewDataSource *)self ringView];
  [v14 _setActivityRingViewBackgroundColor:v13];

  id v15 = [(HKActivitySummaryAnnotationViewDataSource *)self ringContainer];

  return v15;
}

- (id)_dateColumnWithDateComponents:(id)a3 calendar:(id)a4 orientation:(int64_t)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4FB1930];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueDateFont");
  [v10 setFont:v11];

  uint64_t v12 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
  [v10 setTextColor:v12];

  unint64_t v13 = [(HKActivitySummaryAnnotationViewDataSource *)self _dateTextForDateComponents:v9 calendar:v8 timeScope:[(HKActivitySummaryAnnotationViewDataSource *)self timeScope]];

  [v10 setText:v13];
  [v10 setAdjustsFontSizeToFitWidth:1];
  [v10 setBaselineAdjustment:1];
  [v10 sizeToFit];
  return v10;
}

- (id)_dateTextForDateComponents:(id)a3 calendar:(id)a4 timeScope:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((unint64_t)a5 <= 8)
  {
    if (a5 == 3) {
      [(HKActivitySummaryAnnotationViewDataSource *)self _weekContainingDateComponents:v8 calendar:v9 timeScope:3];
    }
    else {
    a5 = HKCombinedStringForAnnotationDateWithTimeScope((uint64_t)v8, v9, a5, 0);
    }
  }

  return (id)a5;
}

- (id)_weekContainingDateComponents:(id)a3 calendar:(id)a4 timeScope:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(HKActivitySummaryAnnotationViewDataSource *)self dateCache];

  if (v10)
  {
    uint64_t v11 = [v8 dateFromComponents:v9];

    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalForDayFromDate:calendar:", v11, v8);
    unint64_t v13 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v14 = [v13 objectForKey:*MEMORY[0x1E4F1C3E0]];

    if ([(HKActivitySummaryAnnotationViewDataSource *)self firstWeekday] == -1) {
      id v15 = v14;
    }
    else {
      id v15 = self;
    }
    uint64_t v16 = objc_msgSend(v8, "hk_weeksContainingInterval:firstWeekday:", v12, -[HKActivitySummaryAnnotationViewDataSource firstWeekday](v15, "firstWeekday"));
    id v17 = [(HKActivitySummaryAnnotationViewDataSource *)self dateCache];
    id v18 = HKLastUpdatedIntervalText(v16, a5, v17, 1);

    id v9 = (id)v11;
  }
  else
  {
    id v18 = HKCombinedStringForAnnotationDateWithTimeScope((uint64_t)v9, v8, a5, 0);
  }

  return v18;
}

- (id)_columnViewWithTitle:(id)a3 titleColor:(id)a4 body:(id)a5 bodyColor:(id)a6 alignment:(int64_t)a7
{
  void v29[2] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (objc_class *)MEMORY[0x1E4FB1930];
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = objc_alloc_init(v11);
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setTextColor:v14];

  [v16 setText:v15];
  id v17 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartCurrentValueKindFont");
  [v16 setFont:v17];

  [v16 setTextAlignment:a7];
  [v16 setAdjustsFontSizeToFitWidth:1];
  id v18 = NSString;
  id v19 = [NSString stringWithFormat:@"%@.Title", v15];
  v20 = objc_msgSend(v18, "hk_chartLollipopAccessibilityIdentifier:", v19);
  [v16 setAccessibilityIdentifier:v20];

  id v21 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v21 setTextColor:v12];

  [v21 setTextAlignment:a7];
  [v21 setAttributedText:v13];

  [v21 setAdjustsFontSizeToFitWidth:1];
  uint64_t v22 = NSString;
  v23 = [NSString stringWithFormat:@"%@.Body", v15];

  v24 = objc_msgSend(v22, "hk_chartLollipopAccessibilityIdentifier:", v23);
  [v21 setAccessibilityIdentifier:v24];

  id v25 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v29[0] = v16;
  v29[1] = v21;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  objc_super v27 = (void *)[v25 initWithArrangedSubviews:v26];

  [v27 setAxis:1];
  return v27;
}

- (id)_bodyColor
{
  if ([(HKActivitySummaryAnnotationViewDataSource *)self currentValueViewContext]) {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  }
  else {
  v2 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
  }
  return v2;
}

- (id)descriptionsForActivitySummary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v4 = [(HKActivitySummaryAnnotationViewDataSource *)self activityMoveTitle];
  id v5 = [(HKActivitySummaryAnnotationViewDataSource *)self _moveColumnValueString];
  id v6 = [(HKActivitySummaryAnnotationViewDataSource *)self _moveColumnAsNumber];
  id v7 = [(HKActivitySummaryAnnotationViewDataSource *)self _valueWithTitle:v4 attributedValue:v5 valueAsNumber:v6];
  [v3 addObject:v7];

  id v8 = [(HKActivitySummaryAnnotationViewDataSource *)self activityExerciseTitle];
  id v9 = [(HKActivitySummaryAnnotationViewDataSource *)self _exerciseColumnValueString];
  id v10 = [(HKActivitySummaryAnnotationViewDataSource *)self _exerciseColumnAsNumber];
  uint64_t v11 = [(HKActivitySummaryAnnotationViewDataSource *)self _valueWithTitle:v8 attributedValue:v9 valueAsNumber:v10];
  [v3 addObject:v11];

  id v12 = [(HKActivitySummaryAnnotationViewDataSource *)self activityStandTitle];
  id v13 = [(HKActivitySummaryAnnotationViewDataSource *)self _standColumnValueString];
  id v14 = [(HKActivitySummaryAnnotationViewDataSource *)self _standColumnAsNumber];
  id v15 = [(HKActivitySummaryAnnotationViewDataSource *)self _valueWithTitle:v12 attributedValue:v13 valueAsNumber:v14];
  [v3 addObject:v15];

  return v3;
}

- (id)_valueWithTitle:(id)a3 attributedValue:(id)a4 valueAsNumber:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [HKAccessibilityValue alloc];
  uint64_t v11 = [v8 string];

  id v12 = [(HKAccessibilityValue *)v10 initWithValueTitle:v9 valueType:&stru_1F3B9CF20 valueDescription:v11 valueAsNumber:v7];
  return v12;
}

- (HKActivitySummary)activitySummary
{
  return self->_activitySummary;
}

- (void)setActivitySummary:(id)a3
{
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (BOOL)useStandardAnnotationDataSource
{
  return self->_useStandardAnnotationDataSource;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache
{
  return self->_wheelchairUseCharacteristicCache;
}

- (void)setWheelchairUseCharacteristicCache:(id)a3
{
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void)setDateCache:(id)a3
{
}

- (BOOL)currentValueViewContext
{
  return self->_currentValueViewContext;
}

- (void)setCurrentValueViewContext:(BOOL)a3
{
  self->_currentValueViewContext = a3;
}

- (UIView)ringContainer
{
  return self->_ringContainer;
}

- (void)setRingContainer:(id)a3
{
}

- (HKActivityRingView)ringView
{
  return self->_ringView;
}

- (void)setRingView:(id)a3
{
}

- (int64_t)firstWeekday
{
  return self->_firstWeekday;
}

- (NSArray)columnsForPosition
{
  return self->_columnsForPosition;
}

- (HKInteractiveChartAnnotationViewDataSource)standardAnnotationDataSource
{
  return self->_standardAnnotationDataSource;
}

- (BOOL)isChartSharingContext
{
  return self->_isChartSharingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardAnnotationDataSource, 0);
  objc_storeStrong((id *)&self->_columnsForPosition, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_ringContainer, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_activitySummary, 0);
}

@end