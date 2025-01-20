@interface HKSleepPeriodDaySeries
- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3;
- (void)addGoalLinePathsToCoordinate:(id)a3 upperGoalLinePath:(id)a4 upperGoalMarkerPoints:(id)a5 previousUpperGoalLinePoint:(id)a6 lowerGoalLinePath:(id)a7 lowerGoalMarkerPoints:(id)a8 previousLowerGoalLinePoint:(id)a9 axisRect:(CGRect)a10;
@end

@implementation HKSleepPeriodDaySeries

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v13 = [a3 chartPoints];
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKSleepPeriodDaySeries.m", 31, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  v14 = [v11 transform];
  v15 = [v12 transform];

  v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__HKSleepPeriodDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D55D08;
  id v26 = v15;
  id v27 = v14;
  id v28 = v16;
  id v17 = v16;
  id v18 = v14;
  id v19 = v15;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v17 blockPath:&v23];

  return v20;
}

void __68__HKSleepPeriodDaySeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  id v35 = a2;
  v3 = [v35 yValue];

  if (v3)
  {
    v4 = [v35 upperGoal];

    if (v4)
    {
      v5 = NSNumber;
      v6 = *(void **)(a1 + 32);
      v7 = [v35 upperGoal];
      [v6 coordinateForValue:v7];
      v4 = objc_msgSend(v5, "numberWithDouble:");
    }
    v8 = [v35 lowerGoal];

    if (v8)
    {
      v9 = NSNumber;
      v10 = *(void **)(a1 + 32);
      id v11 = [v35 lowerGoal];
      [v10 coordinateForValue:v11];
      v8 = objc_msgSend(v9, "numberWithDouble:");
    }
    id v12 = [v35 userInfo];
    v13 = (void *)[v12 copyWithAnnotationOptions:2];
    v14 = *(void **)(a1 + 40);
    v15 = [v35 xValue];
    v16 = [v15 dateByAddingTimeInterval:21600.0];
    [v14 coordinateForValue:v16];
    double v18 = v17;

    id v19 = [HKSleepPeriodCoordinate alloc];
    v20 = [v35 asleepOffsets];
    v21 = [v35 allYValues];
    uint64_t v22 = [v35 highlighted];
    long long v23 = [(HKSleepPeriodCoordinate *)v19 initWithXValue:v20 asleepYValues:MEMORY[0x1E4F1CBF0] inBedYValues:v21 yValues:v4 upperGoalYValue:v8 lowerGoalYValue:v22 highlighted:v18 userInfo:v13];

    v24 = (void *)[v12 copyWithAnnotationOptions:1];
    v25 = *(void **)(a1 + 40);
    id v26 = [v35 xValue];
    id v27 = [v26 dateByAddingTimeInterval:-21600.0];
    [v25 coordinateForValue:v27];
    double v29 = v28;

    v30 = [HKSleepPeriodCoordinate alloc];
    v31 = [v35 inBedOffsets];
    v32 = [v35 allYValues];
    uint64_t v33 = [v35 highlighted];
    v34 = [(HKSleepPeriodCoordinate *)v30 initWithXValue:MEMORY[0x1E4F1CBF0] asleepYValues:v31 inBedYValues:v32 yValues:v4 upperGoalYValue:v8 lowerGoalYValue:v33 highlighted:v29 userInfo:v24];

    [*(id *)(a1 + 48) addObject:v23];
    [*(id *)(a1 + 48) addObject:v34];
  }
}

- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3
{
  [a3 canonicalSize];
  return vcvtmd_s64_f64(v3 / fmax(v3 * 0.25, 1.0));
}

- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5
{
  double v5 = a4.size.width / (double)a3;
  double v6 = v5 * 0.5;
  if (v5 * 0.5 <= a5) {
    double v6 = a5;
  }
  return round(v5 - v6);
}

- (void)addGoalLinePathsToCoordinate:(id)a3 upperGoalLinePath:(id)a4 upperGoalMarkerPoints:(id)a5 previousUpperGoalLinePoint:(id)a6 lowerGoalLinePath:(id)a7 lowerGoalMarkerPoints:(id)a8 previousLowerGoalLinePoint:(id)a9 axisRect:(CGRect)a10
{
  double width = a10.size.width;
  id v50 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  double v19 = width * 0.25;
  v20 = [v50 upperGoalYValue];

  if (v20)
  {
    [v50 startXValue];
    double v22 = v21 - v19;
    long long v23 = [v50 upperGoalYValue];
    [v23 doubleValue];
    objc_msgSend(v15, "moveToPoint:", v22, v24);

    [v50 startXValue];
    double v26 = v19 + v25;
    id v27 = [v50 upperGoalYValue];
    [v27 doubleValue];
    objc_msgSend(v15, "addLineToPoint:", v26, v28);

    double v29 = (void *)MEMORY[0x1E4F29238];
    [v50 startXValue];
    double v31 = v30;
    v32 = [v50 upperGoalYValue];
    [v32 doubleValue];
    v34 = objc_msgSend(v29, "valueWithCGPoint:", v31, v33);
    [v16 addObject:v34];
  }
  id v35 = [v50 lowerGoalYValue];

  if (v35)
  {
    [v50 startXValue];
    double v37 = v36 - v19;
    v38 = [v50 lowerGoalYValue];
    [v38 doubleValue];
    objc_msgSend(v17, "moveToPoint:", v37, v39);

    [v50 startXValue];
    double v41 = v19 + v40;
    v42 = [v50 lowerGoalYValue];
    [v42 doubleValue];
    objc_msgSend(v17, "addLineToPoint:", v41, v43);

    v44 = (void *)MEMORY[0x1E4F29238];
    [v50 startXValue];
    double v46 = v45;
    v47 = [v50 lowerGoalYValue];
    [v47 doubleValue];
    v49 = objc_msgSend(v44, "valueWithCGPoint:", v46, v48);
    [v18 addObject:v49];
  }
}

@end