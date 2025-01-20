@interface HKInteractiveChartOverlaySleepViewController
- (BOOL)_isSleepSeries:(id)a3;
- (id)_customDateAxisForTimeScope:(int64_t)a3 segmentIndex:(int64_t)a4 sectionIndex:(int64_t)a5 currentCalendar:(id)a6;
- (id)_dayTimeScopeDateAxisStyleWithTextAlignment:(int64_t)a3 hyphenationFactor:(id)a4;
- (id)_sleepAnalysisDayAxisWithCalendar:(id)a3;
- (id)_sleepComparisonDayAxisWithCalendar:(id)a3;
- (id)_sleepStageDayAxisWithCalendar:(id)a3;
- (id)_sleepStageDurationDayAxisWithCalendar:(id)a3;
- (id)addNoDataEntries:(id)a3 timeScope:(int64_t)a4 targetSeries:(id)a5;
- (id)dateRangeFromSelectionContext:(id)a3 timeScope:(int64_t)a4;
- (id)descriptionForStartX:(double)a3 endX:(double)a4 chartData:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 graphView:(id)a8;
- (id)makePrimaryGraphViewControllerWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6;
- (id)sleepDaySummaryForDate:(id)a3;
- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4;
- (int64_t)defaultAlignmentForTimeScope:(int64_t)a3;
- (int64_t)effectiveAnnotationTimeScopeForTimeScope:(int64_t)a3 displayType:(id)a4 segmentIndex:(int64_t)a5 sectionIndex:(int64_t)a6;
- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5;
- (void)graphView:(id)a3 didUpdateSeries:(id)a4 newDataArrived:(BOOL)a5 changeContext:(int64_t)a6;
- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6;
@end

@implementation HKInteractiveChartOverlaySleepViewController

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
  [(HKInteractiveChartOverlayViewController *)&v8 configureDisplayTypes:a3 timeScope:a4 stackOffset:a5];
  v6 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  v7 = [v6 graphView];

  [v7 setScrollingOptions:1];
}

- (int64_t)defaultAlignmentForTimeScope:(int64_t)a3
{
  if (a3 == 6)
  {
    v5 = [(HKInteractiveChartViewController *)self currentOverlayLocationProvider];
    uint64_t v6 = [v5 segmentedControlSelectedIndex];
    uint64_t v7 = HKIndexForOverlaySleepRoomSegment(2);

    if (v6 == v7) {
      return 4;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
  return [(HKInteractiveChartViewController *)&v9 defaultAlignmentForTimeScope:a3];
}

- (id)makePrimaryGraphViewControllerWithDateZoom:(int64_t)a3 previousDateZoom:(int64_t)a4 previousXAxisSpace:(double)a5 currentCalendar:(id)a6
{
  id v10 = a6;
  v11 = [(HKInteractiveChartViewController *)self currentOverlayLocationProvider];
  uint64_t v12 = [v11 segmentedControlSelectedIndex];
  v13 = [(HKInteractiveChartViewController *)self currentOverlayLocationProvider];
  v14 = [v13 selectedContextLocation];
  v15 = -[HKInteractiveChartOverlaySleepViewController _customDateAxisForTimeScope:segmentIndex:sectionIndex:currentCalendar:](self, "_customDateAxisForTimeScope:segmentIndex:sectionIndex:currentCalendar:", a3, v12, [v14 sectionIndex], v10);

  v16 = [[HKDateGraphViewController alloc] initWithDateZoom:a3 previousDateZoom:a4 previousXAxisSpace:v10 currentCalendar:v15 customDateAxis:a5];
  return v16;
}

- (id)_dayTimeScopeDateAxisStyleWithTextAlignment:(int64_t)a3 hyphenationFactor:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisLabelColor");
  objc_super v8 = +[HKStrokeStyle strokeStyleWithColor:v7 lineWidth:1.0];
  [v6 setAxisLineStyle:v8];

  objc_super v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_chartAxisLabelFont");
  id v10 = +[HKAxisLabelStyle labelStyleWithColor:v7 font:v9 horizontalAlignment:a3 verticalAlignment:3 hyphenationFactor:v5];

  [v6 setLabelStyle:v10];
  [v6 setTickPositions:0];
  [v6 setAxisLabelPosition:1];
  [v6 setShowGridLines:1];
  [v6 setLocation:2];
  [v6 setFillInnerPadding:3.0];
  v11 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartGrayGraphColor");
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartAxisMajorGridColor");
  v13 = +[HKStrokeStyle strokeStyleWithColor:v12 lineWidth:0.5];
  [v13 setDashStyle:1];
  [v6 setGridLineStyle:v13];
  v14 = +[HKStrokeStyle strokeStyleWithColor:v11 lineWidth:0.5];
  [v14 setDashStyle:0];
  [v6 setReferenceGridLineStyle:v14];

  return v6;
}

- (id)addNoDataEntries:(id)a3 timeScope:(int64_t)a4 targetSeries:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (![(HKInteractiveChartOverlaySleepViewController *)self _isSleepSeries:v9]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v35.receiver = self;
    v35.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
    id v10 = [(HKInteractiveChartViewController *)&v35 addNoDataEntries:v8 timeScope:a4 targetSeries:v9];
LABEL_7:
    v11 = v10;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v8 count])
  {
    id v10 = v8;
    goto LABEL_7;
  }
  v13 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  v14 = [v13 graphView];
  v15 = [v14 xAxis];

  v16 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  v17 = [v16 graphView];
  v18 = [v17 effectiveVisibleRangeActive];
  v19 = [v18 startDate];

  v20 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
  v21 = [v20 graphView];
  v22 = [v21 effectiveVisibleRangeActive];
  v23 = [v22 endDate];

  v24 = [v15 transform];
  [v24 coordinateForValue:v19];
  double v26 = v25;

  [v15 pointTransform];
  double v29 = HKLinearTransformValue(v27, v28, v26);
  v30 = +[HKValueRange valueRangeWithMinValue:v19 maxValue:v23];
  v31 = [(HKInteractiveChartOverlaySleepViewController *)self stringForValueRange:v30 timeScope:5];

  v32 = [HKAccessibilityPointData alloc];
  v33 = HKUIMidDate(v19, v23);
  v34 = [(HKAccessibilityPointData *)v32 initWithHorizontalScreenCoordinate:v31 horizontalTimeCoordinate:v33 horizontalDate:0 values:v29];

  v36[0] = v34;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];

LABEL_8:
  return v11;
}

- (id)descriptionForStartX:(double)a3 endX:(double)a4 chartData:(id)a5 timeScope:(int64_t)a6 resolution:(int64_t)a7 graphView:(id)a8
{
  id v14 = a5;
  id v15 = a8;
  if (a6 == 6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v16 = v14;
    uint64_t v17 = [v16 seriesType];
    if (v17 == 4)
    {
      v19 = [v16 annotationOverrideDateRange];
      if (v19)
      {
        v20 = [(HKInteractiveChartOverlaySleepViewController *)self stringForValueRange:v19 timeScope:6];
        v22.receiver = self;
        v22.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
        v18 = [(HKInteractiveChartViewController *)&v22 replaceRangeClause:v20];
      }
      else
      {
        v18 = &stru_1F3B9CF20;
      }
    }
    else if (v17 == 6)
    {
      v23.receiver = self;
      v23.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
      v18 = [(HKInteractiveChartViewController *)&v23 descriptionForStartX:v16 endX:6 chartData:a7 timeScope:v15 resolution:a3 graphView:a4];
    }
    else
    {
      v18 = &stru_1F3B9CF20;
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
    v18 = [(HKInteractiveChartViewController *)&v24 descriptionForStartX:v14 endX:a6 chartData:a7 timeScope:v15 resolution:a3 graphView:a4];
  }

  return v18;
}

- (BOOL)_isSleepSeries:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  v10[2] = objc_opt_class();
  v10[3] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__HKInteractiveChartOverlaySleepViewController__isSleepSeries___block_invoke;
  v8[3] = &unk_1E6D542D8;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "hk_filter:", v8);
  LOBYTE(v3) = v6 != 0;

  return (char)v3;
}

uint64_t __63__HKInteractiveChartOverlaySleepViewController__isSleepSeries___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)graphView:(id)a3 didUpdateSeries:(id)a4 newDataArrived:(BOOL)a5 changeContext:(int64_t)a6
{
  BOOL v7 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
  [(HKInteractiveChartViewController *)&v18 graphView:a3 didUpdateSeries:v10 newDataArrived:v7 changeContext:a6];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E4F29FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v11;
        v13 = objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v20 = v13;
        id v14 = v13;
        _os_log_impl(&dword_1E0B26000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Invalidating x axis labels for the stage day series", buf, 0xCu);
      }
      id v15 = [(HKInteractiveChartViewController *)self primaryGraphViewController];
      id v16 = [v15 graphView];
      uint64_t v17 = [v16 xAxis];
      [v17 invalidateAxisLabelCache];
    }
  }
}

- (id)dateRangeFromSelectionContext:(id)a3 timeScope:(int64_t)a4
{
  v4 = [a3 userInfo];
  id v5 = [v4 lastObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 annotationOverrideDateRange];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  id v19 = a3;
  id v10 = a4;
  v11 = [(HKInteractiveChartViewController *)self currentOverlayLocationProvider];
  uint64_t v12 = [v11 segmentedControlSelectedIndex];
  v13 = [(HKInteractiveChartViewController *)self currentOverlayLocationProvider];
  id v14 = [v13 selectedContextLocation];
  int64_t v15 = -[HKInteractiveChartOverlaySleepViewController effectiveAnnotationTimeScopeForTimeScope:displayType:segmentIndex:sectionIndex:](self, "effectiveAnnotationTimeScopeForTimeScope:displayType:segmentIndex:sectionIndex:", a5, v10, v12, [v14 sectionIndex]);

  id v16 = [(HKInteractiveChartViewController *)self annotationDataSource];
  objc_opt_class();
  LOBYTE(v12) = objc_opt_isKindOfClass();

  if (v12)
  {
    uint64_t v17 = [(HKInteractiveChartViewController *)self annotationDataSource];
    objc_super v18 = [(HKInteractiveChartViewController *)self healthStore];
    [v17 updateWithSelectionContext:v19 displayType:v10 timeScope:v15 resolution:a6 healthStore:v18 viewController:self];
  }
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [v6 endDate];
  id v8 = [v6 startDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 >= 86400.0 && a4 == 6) {
    int64_t v12 = 5;
  }
  else {
    int64_t v12 = a4;
  }
  v15.receiver = self;
  v15.super_class = (Class)HKInteractiveChartOverlaySleepViewController;
  v13 = [(HKInteractiveChartViewController *)&v15 stringForValueRange:v6 timeScope:v12];

  return v13;
}

- (int64_t)effectiveAnnotationTimeScopeForTimeScope:(int64_t)a3 displayType:(id)a4 segmentIndex:(int64_t)a5 sectionIndex:(int64_t)a6
{
  id v9 = a4;
  double v10 = v9;
  if (v9)
  {
    v11 = [v9 sampleType];
    if ([v11 code] == 5)
    {

      goto LABEL_11;
    }
    int64_t v12 = [v10 sampleType];
    uint64_t v13 = [v12 code];

    if (v13 == 61) {
      goto LABEL_11;
    }
  }
  if (a3 == 6
    && (HKIndexForOverlaySleepRoomSegment(0) == a5
     || HKIndexForOverlaySleepRoomSegment(2) == a5
     || a6 == 1 && HKIndexForOverlaySleepRoomSegment(1) == a5))
  {
    a3 = 5;
  }
LABEL_11:

  return a3;
}

- (id)_customDateAxisForTimeScope:(int64_t)a3 segmentIndex:(int64_t)a4 sectionIndex:(int64_t)a5 currentCalendar:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEFAULT))
  {
    int64_t v12 = v11;
    int v17 = 138544130;
    id v18 = (id)objc_opt_class();
    __int16 v19 = 2048;
    int64_t v20 = a3;
    __int16 v21 = 2048;
    int64_t v22 = a4;
    __int16 v23 = 2048;
    int64_t v24 = a5;
    id v13 = v18;
    _os_log_impl(&dword_1E0B26000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating date axis for timeScope: %ld segmentIndex: %ld sectionIndex: %ld", (uint8_t *)&v17, 0x2Au);
  }
  if (a3 == 6)
  {
    if (HKIndexForOverlaySleepRoomSegment(0) == a4)
    {
      uint64_t v14 = [(HKInteractiveChartOverlaySleepViewController *)self _sleepAnalysisDayAxisWithCalendar:v10];
LABEL_13:
      objc_super v15 = (void *)v14;
      goto LABEL_15;
    }
    if (HKIndexForOverlaySleepRoomSegment(2) == a4)
    {
      uint64_t v14 = [(HKInteractiveChartOverlaySleepViewController *)self _sleepComparisonDayAxisWithCalendar:v10];
      goto LABEL_13;
    }
    if (a5 == 1 && HKIndexForOverlaySleepRoomSegment(1) == a4)
    {
      uint64_t v14 = [(HKInteractiveChartOverlaySleepViewController *)self _sleepStageDurationDayAxisWithCalendar:v10];
      goto LABEL_13;
    }
    if (HKIndexForOverlaySleepRoomSegment(1) == a4)
    {
      uint64_t v14 = [(HKInteractiveChartOverlaySleepViewController *)self _sleepStageDayAxisWithCalendar:v10];
      goto LABEL_13;
    }
  }
  objc_super v15 = 0;
LABEL_15:

  return v15;
}

- (id)_sleepAnalysisDayAxisWithCalendar:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  id v6 = [v4 bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v7 = [v6 localizedStringForKey:@"TIME_IN_BED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v14[0] = v7;
  id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v9 = [v8 localizedStringForKey:@"TIME_ASLEEP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v14[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];

  v11 = [(HKInteractiveChartOverlaySleepViewController *)self _dayTimeScopeDateAxisStyleWithTextAlignment:1 hyphenationFactor:&unk_1F3C22A50];
  int64_t v12 = [[HKCategoricalDateAxis alloc] initWithCurrentCalendar:v5 axisStyle:v11 categoryTitles:v10];

  return v12;
}

- (id)_sleepComparisonDayAxisWithCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [(HKInteractiveChartOverlaySleepViewController *)self _dayTimeScopeDateAxisStyleWithTextAlignment:0 hyphenationFactor:0];
  id v6 = [(HKDateAxis *)[_HKSleepComparisonDayAxis alloc] initWithCurrentCalendar:v4 axisStyle:v5];

  return v6;
}

- (id)_sleepStageDurationDayAxisWithCalendar:(id)a3
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28B50];
  id v17 = a3;
  id v4 = [v3 bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"STAGES_DURATION_DAY_AXIS_LABEL_AWAKE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  v18[0] = v5;
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  BOOL v7 = [v6 localizedStringForKey:@"STAGES_DURATION_DAY_AXIS_LABEL_REM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  v18[1] = v7;
  id v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v9 = [v8 localizedStringForKey:@"STAGES_DURATION_DAY_AXIS_LABEL_CORE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  v18[2] = v9;
  id v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v11 = [v10 localizedStringForKey:@"STAGES_DURATION_DAY_AXIS_LABEL_DEEP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Acacia"];
  v18[3] = v11;
  int64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

  id v13 = [(HKInteractiveChartOverlaySleepViewController *)self _dayTimeScopeDateAxisStyleWithTextAlignment:1 hyphenationFactor:&unk_1F3C22A50];
  uint64_t v14 = [[HKCategoricalDateAxis alloc] initWithCurrentCalendar:v17 axisStyle:v13 categoryTitles:v12];

  return v14;
}

- (id)_sleepStageDayAxisWithCalendar:(id)a3
{
  id v4 = a3;
  id v5 = [(HKInteractiveChartOverlaySleepViewController *)self _dayTimeScopeDateAxisStyleWithTextAlignment:0 hyphenationFactor:0];
  id v6 = [(HKDateAxis *)[HKSleepStageDayAxis alloc] initWithCurrentCalendar:v4 axisStyle:v5];

  [(HKSleepStageDayAxis *)v6 setDelegate:self];
  return v6;
}

- (id)sleepDaySummaryForDate:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (os_log_t *)MEMORY[0x1E4F29FA0];
  id v6 = (void *)*MEMORY[0x1E4F29FA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_DEBUG)) {
    [(HKInteractiveChartOverlaySleepViewController(HKSleepStageDayAxisDelegate) *)v6 sleepDaySummaryForDate:v4];
  }
  BOOL v7 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v9 = [(HKInteractiveChartOverlayViewController *)self primaryDisplayType];
    id v10 = [v9 graphSeriesForTimeScope:6];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      int64_t v12 = [(HKInteractiveChartViewController *)self currentCalendar];
      double v26 = [v12 startOfDayForDate:v4];

      double v27 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v26 duration:86400.0];
      uint64_t v31 = 0;
      v32 = &v31;
      uint64_t v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__12;
      objc_super v35 = __Block_byref_object_dispose__12;
      id v36 = 0;
      dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
      uint64_t v14 = [v27 startDate];
      objc_super v15 = [v27 endDate];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke;
      v28[3] = &unk_1E6D54300;
      v30 = &v31;
      v28[4] = self;
      id v16 = v13;
      double v29 = v16;
      [(HKInteractiveChartOverlayViewController *)self cachedDataForCustomGraphSeries:v11 timeScope:6 resolution:0 startDate:v14 endDate:v15 queryIfNeeded:0 completion:v28];

      dispatch_time_t v17 = dispatch_time(0, 250000000);
      dispatch_semaphore_wait(v16, v17);
      _HKInitializeLogging();
      os_log_t v18 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      {
        __int16 v19 = v18;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          id v20 = (id)objc_opt_class();
          __int16 v21 = [v4 description];
          -[HKInteractiveChartOverlaySleepViewController(HKSleepStageDayAxisDelegate) sleepDaySummaryForDate:](v20, v21, buf, v19);
        }
      }
      id v22 = (id)v32[5];

      _Block_object_dispose(&v31, 8);
    }
    else
    {
      _HKInitializeLogging();
      int64_t v24 = *v5;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        [(HKInteractiveChartOverlaySleepViewController(HKSleepStageDayAxisDelegate) *)v24 sleepDaySummaryForDate:v10];
      }
      id v22 = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v23 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      -[HKInteractiveChartOverlaySleepViewController(HKSleepStageDayAxisDelegate) sleepDaySummaryForDate:](v23);
    }
    id v22 = 0;
  }

  return v22;
}

void __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a4;
  if (a3)
  {
    id v8 = [a2 firstObject];
    id v9 = [v8 userInfo];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 sleepDaySummary];
      uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
      int64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    else if (v9)
    {
      _HKInitializeLogging();
      uint64_t v14 = (void *)*MEMORY[0x1E4F29FA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_ERROR)) {
        __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke_cold_1(a1, v14);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    dispatch_semaphore_t v13 = (void *)*MEMORY[0x1E4F29FA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA0], OS_LOG_TYPE_ERROR)) {
      __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke_cold_2(a1, v13, (uint64_t)v7);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_1E0B26000, v2, OS_LOG_TYPE_ERROR, "[%{public}@] Fetched user info was of wrong type, expected HKSleepChartPointUserInfo", (uint8_t *)&v4, 0xCu);
}

void __100__HKInteractiveChartOverlaySleepViewController_HKSleepStageDayAxisDelegate__sleepDaySummaryForDate___block_invoke_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = a2;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error fetching cached data for sleep stage day axis %{public}@", (uint8_t *)&v6, 0x16u);
}

@end