@interface HKSleepStageDurationDaySeries
- (HKSleepStageDurationDaySeries)init;
- (NSCalendar)currentCalendar;
- (id)_buildSleepDurationCoordinateWithDurationValue:(double)a3 sleepValue:(int64_t)a4 barLocationIndex:(int64_t)a5 startOfCalendarDay:(id)a6 xAxisTransform:(id)a7 yAxisTransform:(id)a8 userInfo:(id)a9;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3;
- (void)setCurrentCalendar:(id)a3;
@end

@implementation HKSleepStageDurationDaySeries

- (HKSleepStageDurationDaySeries)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKSleepStageDurationDaySeries;
  v2 = [(HKSleepStageDurationSeries *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    currentCalendar = v2->_currentCalendar;
    v2->_currentCalendar = (NSCalendar *)v3;
  }
  return v2;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  v11 = [a3 chartPoints];
  if (!v11)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HKSleepStageDurationDaySeries.m", 53, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  v25 = v9;
  v31 = [v9 transform];
  v30 = [v10 transform];
  v29 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v11;
  uint64_t v32 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v32)
  {
    uint64_t v27 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v14 = [(HKSleepStageDurationDaySeries *)self currentCalendar];
        v15 = [v13 xValue];
        v16 = [v14 startOfDayForDate:v15];

        v17 = [v13 userInfo];
        [v13 awakeValue];
        v33 = -[HKSleepStageDurationDaySeries _buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:](self, "_buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:", 2, 0, v16, v31, v30, v17);
        [v29 addObject:v33];
        [v13 asleepRemValue];
        v18 = -[HKSleepStageDurationDaySeries _buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:](self, "_buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:", 5, 1, v16, v31, v30, v17);
        [v29 addObject:v18];
        [v13 asleepCoreValue];
        v19 = -[HKSleepStageDurationDaySeries _buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:](self, "_buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:", 3, 2, v16, v31, v30, v17);
        [v29 addObject:v19];
        [v13 asleepDeepValue];
        v20 = -[HKSleepStageDurationDaySeries _buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:](self, "_buildSleepDurationCoordinateWithDurationValue:sleepValue:barLocationIndex:startOfCalendarDay:xAxisTransform:yAxisTransform:userInfo:", 4, 3, v16, v31, v30, v17);
        [v29 addObject:v20];
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v32);
  }

  long long v34 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v21 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v29 blockPath:&v34];

  return v21;
}

- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3
{
  [a3 canonicalSize];
  return vcvtmd_s64_f64(v3 / fmax(v3 * 0.125, 1.0));
}

- (id)_buildSleepDurationCoordinateWithDurationValue:(double)a3 sleepValue:(int64_t)a4 barLocationIndex:(int64_t)a5 startOfCalendarDay:(id)a6 xAxisTransform:(id)a7 yAxisTransform:(id)a8 userInfo:(id)a9
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  v20 = [(HKSleepStageDurationDaySeries *)self currentCalendar];
  v21 = +[HKCategoricalDateAxis datePositionForCategoryIndex:a5 categoryCount:4 startDate:v19 calendar:v20];

  [v18 coordinateForValue:v21];
  double v23 = v22;

  [v17 coordinateForValue:&unk_1F3C22468];
  double v25 = v24;
  v26 = [NSNumber numberWithDouble:a3];
  [v17 coordinateForValue:v26];
  double v28 = v27;

  v29 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v23, v25);
  v40[0] = v29;
  v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v23, v28);
  v40[1] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  uint64_t v32 = (void *)[v31 mutableCopy];

  v33 = [(HKSleepStageDurationSeries *)self highlightedSleepStage];
  uint64_t v34 = (int)[v33 intValue];

  if (v34 != a4)
  {
    v35 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v23, v25);
    [v32 insertObject:v35 atIndex:1];
  }
  long long v36 = [NSNumber numberWithInteger:a4];
  long long v37 = (void *)[v16 copyWithAnnotationOptions:HKSleepChartPointFormatterOptionsForSleepAnalysis(v36)];

  long long v38 = [[HKSleepDurationCoordinate alloc] initWithStackPoints:v32 goalLineYValue:0 highlighted:0 userInfo:v37];
  return v38;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end