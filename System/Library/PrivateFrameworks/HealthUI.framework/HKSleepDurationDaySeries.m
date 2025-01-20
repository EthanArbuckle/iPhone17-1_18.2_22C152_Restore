@interface HKSleepDurationDaySeries
- (BOOL)hideAsleepData;
- (BOOL)hideInBedData;
- (HKSleepDurationDaySeries)init;
- (NSCalendar)currentCalendar;
- (NSLock)seriesMutableStateLock;
- (NSNumber)highlightedSleepValue;
- (NSNumber)highlightedSleepValueStorage;
- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (int64_t)visibleBarCountWithZoomLevelConfiguration:(id)a3;
- (void)_rebuildFillStyles;
- (void)addGoalLinePathsToCoordinate:(id)a3 goalLinePath:(id)a4 goalLineMarkerPoints:(id)a5 previousCoordinateGoal:(id)a6 axisRect:(CGRect)a7;
- (void)setCurrentCalendar:(id)a3;
- (void)setHighlightedSleepValue:(id)a3;
- (void)setHighlightedSleepValueStorage:(id)a3;
@end

@implementation HKSleepDurationDaySeries

- (HKSleepDurationDaySeries)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKSleepDurationDaySeries;
  v2 = [(HKSleepDurationSeries *)&v9 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKSleepDurationDaySeriesLock"];
    highlightedSleepValueStorage = v2->_highlightedSleepValueStorage;
    v2->_highlightedSleepValueStorage = 0;

    uint64_t v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    currentCalendar = v2->_currentCalendar;
    v2->_currentCalendar = (NSCalendar *)v6;
  }
  return v2;
}

- (NSNumber)highlightedSleepValue
{
  v3 = [(HKSleepDurationDaySeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_highlightedSleepValueStorage;
  v5 = [(HKSleepDurationDaySeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setHighlightedSleepValue:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = [(HKSleepDurationDaySeries *)self seriesMutableStateLock];
  [v5 lock];

  highlightedSleepValueStorage = self->_highlightedSleepValueStorage;
  self->_highlightedSleepValueStorage = v4;

  v7 = [(HKSleepDurationDaySeries *)self seriesMutableStateLock];
  [v7 unlock];

  [(HKSleepDurationDaySeries *)self _rebuildFillStyles];
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  v12 = [a3 chartPoints];
  if (!v12)
  {
    v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, self, @"HKSleepDurationDaySeries.m", 62, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  v51 = v10;
  v57 = [v10 transform];
  v65 = [v11 transform];
  v56 = [MEMORY[0x1E4F1CA48] array];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v12;
  uint64_t v58 = [obj countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v58)
  {
    uint64_t v53 = *(void *)v69;
    v54 = self;
    id v55 = v11;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v69 != v53) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v68 + 1) + 8 * v13);
        v15 = [(HKSleepDurationDaySeries *)self currentCalendar];
        v16 = [v14 xValue];
        v17 = [v15 startOfDayForDate:v16];

        [v65 coordinateForValue:&unk_1F3C20AD0];
        double v19 = v18;
        v20 = [v14 goalValue];

        uint64_t v61 = v13;
        if (v20)
        {
          v21 = NSNumber;
          v22 = [v14 goalValue];
          [v65 coordinateForValue:v22];
          v64 = objc_msgSend(v21, "numberWithDouble:");
        }
        else
        {
          v64 = 0;
        }
        v59 = [v14 userInfo];
        v23 = [(HKSleepDurationDaySeries *)self currentCalendar];
        v63 = +[HKCategoricalDateAxis datePositionForCategoryIndex:0 categoryCount:2 startDate:v17 calendar:v23];

        [v57 coordinateForValue:v63];
        double v25 = v24;
        v26 = [MEMORY[0x1E4F1CA48] array];
        v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v25, v19);
        [v26 addObject:v27];

        v28 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v25, v19);
        [v26 addObject:v28];

        v29 = NSNumber;
        [v14 inBedValue];
        v30 = objc_msgSend(v29, "numberWithDouble:");
        [v65 coordinateForValue:v30];
        double v32 = v31;

        v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v25, v32);
        [v26 addObject:v33];

        v62 = (void *)[v59 copyWithAnnotationOptions:1];
        v60 = -[HKSleepDurationCoordinate initWithStackPoints:goalLineYValue:highlighted:userInfo:]([HKSleepDurationCoordinate alloc], "initWithStackPoints:goalLineYValue:highlighted:userInfo:", v26, 0, [v14 highlighted], v62);
        v34 = [(HKSleepDurationDaySeries *)self currentCalendar];
        v35 = +[HKCategoricalDateAxis datePositionForCategoryIndex:1 categoryCount:2 startDate:v17 calendar:v34];

        [v57 coordinateForValue:v35];
        double v37 = v36;
        v38 = [MEMORY[0x1E4F1CA48] array];
        v39 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v37, v19);
        [v38 addObject:v39];

        v40 = NSNumber;
        [v14 asleepValue];
        v41 = objc_msgSend(v40, "numberWithDouble:");
        [v65 coordinateForValue:v41];
        double v43 = v42;

        v44 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v37, v43);
        [v38 addObject:v44];

        v45 = (void *)[v59 copyWithAnnotationOptions:2];
        v46 = -[HKSleepDurationCoordinate initWithStackPoints:goalLineYValue:highlighted:userInfo:]([HKSleepDurationCoordinate alloc], "initWithStackPoints:goalLineYValue:highlighted:userInfo:", v38, v64, [v14 highlighted], v45);
        [v56 addObject:v60];
        [v56 addObject:v46];

        self = v54;
        ++v13;
        id v11 = v55;
      }
      while (v58 != v61 + 1);
      uint64_t v58 = [obj countByEnumeratingWithState:&v68 objects:v72 count:16];
    }
    while (v58);
  }

  long long v66 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v47 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v56 blockPath:&v66];

  return v47;
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

- (void)addGoalLinePathsToCoordinate:(id)a3 goalLinePath:(id)a4 goalLineMarkerPoints:(id)a5 previousCoordinateGoal:(id)a6 axisRect:(CGRect)a7
{
  double width = a7.size.width;
  id v19 = a3;
  id v9 = a4;
  id v10 = [v19 goalLineYValue];

  if (v10)
  {
    [v19 startXValue];
    double v12 = v11 + width * -0.75;
    uint64_t v13 = [v19 goalLineYValue];
    [v13 doubleValue];
    objc_msgSend(v9, "moveToPoint:", v12, v14);

    [v19 startXValue];
    double v16 = v15 + width * 0.25;
    v17 = [v19 goalLineYValue];
    [v17 doubleValue];
    objc_msgSend(v9, "addLineToPoint:", v16, v18);
  }
}

- (BOOL)hideInBedData
{
  return 0;
}

- (BOOL)hideAsleepData
{
  return 0;
}

- (void)_rebuildFillStyles
{
  v10[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(HKSleepDurationDaySeries *)self highlightedSleepValue];
  uint64_t v4 = [v3 integerValue];
  if (v3)
  {
    BOOL v5 = v4 == 0;
    BOOL v6 = v4 == _HKCategoryValueSleepAnalysisDefaultAsleepValue();
  }
  else
  {
    BOOL v5 = 1;
    BOOL v6 = 1;
  }
  v7 = +[HKSleepUtilities fillStyleForSleepCategoryValue:_HKCategoryValueSleepAnalysisDefaultAsleepValue() isActive:v6];
  v10[0] = v7;
  v8 = +[HKSleepUtilities fillStyleForSleepCategoryValue:0 isActive:v5];
  v10[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  [(HKSleepDurationSeries *)self setInactiveFillStyles:v9];
  [(HKSleepDurationSeries *)self setHighlightedFillStyles:v9];
  [(HKSleepDurationSeries *)self setDefaultFillStyles:v9];
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void)setCurrentCalendar:(id)a3
{
}

- (NSNumber)highlightedSleepValueStorage
{
  return self->_highlightedSleepValueStorage;
}

- (void)setHighlightedSleepValueStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedSleepValueStorage, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end