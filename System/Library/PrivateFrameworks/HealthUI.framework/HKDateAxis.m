@interface HKDateAxis
- (BOOL)canAddLabelForAxisLabelType:(int64_t)a3;
- (HKDateAxis)initWithCurrentCalendar:(id)a3 axisStyle:(id)a4;
- (NSCalendar)currentCalendar;
- (id)_axisLabelsWithModelRange:(id)a3 zoom:(int64_t)a4;
- (id)_dateRangeForChartRange:(HKRange)a3 zoomScale:(double)a4;
- (id)_firstDateAfter:(id)a3 matchingComponents:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6;
- (id)_formattedStringForDate:(id)a3 zoom:(int64_t)a4;
- (id)axisLabelIntervalComponentsForZoomLevelConfiguration:(id)a3;
- (id)baseDateForDate:(id)a3 components:(id)a4 calendar:(id)a5;
- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4;
- (id)extendModelRangeWithRange:(id)a3 zoomScale:(double)a4;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
- (id)minorAxisIntervalComponentsForZoomLevelConfiguration:(id)a3;
- (id)nextDateForDate:(id)a3 components:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6;
- (id)rangeForChartRect:(CGRect)a3 zoomScale:(double)a4 contentOffset:(CGPoint)a5;
- (id)stringForDate:(id)a3 zoom:(int64_t)a4 labelType:(int64_t)a5;
- (int64_t)dateZoomForZoomScale:(double)a3;
- (unint64_t)_anchorUnitForZoom:(int64_t)a3;
- (void)_enumerateCoordinatesInModelRange:(id)a3 timeScope:(int64_t)a4 withHandler:(id)a5;
- (void)offsetForValueRange:(id)a3 chartRect:(CGRect)a4 zoomScaleOut:(double *)a5 contentOffsetOut:(CGPoint *)a6;
- (void)setCurrentCalendar:(id)a3;
@end

@implementation HKDateAxis

- (HKDateAxis)initWithCurrentCalendar:(id)a3 axisStyle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_alloc_init(HKAxisConfiguration);
  v10 = [[HKDateZoomScale alloc] initWithCurrentCalendar:v7];
  [(HKAxisConfiguration *)v9 setZoomScaleEngine:v10];

  v11 = [[HKDateCoordinateTransform alloc] initWithCurrentCalendar:v7];
  [(HKAxisConfiguration *)v9 setTransform:v11];

  [(HKAxisConfiguration *)v9 setPreferredStyle:v8];
  v15.receiver = self;
  v15.super_class = (Class)HKDateAxis;
  v12 = [(HKAxis *)&v15 initWithConfiguration:v9];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_currentCalendar, a3);
  }

  return v13;
}

- (id)_formattedStringForDate:(id)a3 zoom:(int64_t)a4
{
  id v7 = a3;
  id v8 = v7;
  switch(a4)
  {
    case 0:
      uint64_t v9 = 0;
      goto LABEL_9;
    case 1:
      uint64_t v9 = 1;
      goto LABEL_9;
    case 2:
      uint64_t v9 = 4;
      goto LABEL_9;
    case 3:
      uint64_t v9 = 3;
      goto LABEL_9;
    case 4:
      uint64_t v9 = 16;
      goto LABEL_9;
    case 5:
      uint64_t v9 = 18;
      goto LABEL_9;
    case 6:
      v11 = [(HKDateAxis *)self currentCalendar];
      v12 = [v11 startOfDayForDate:v8];

      v13 = [(HKDateAxis *)self currentCalendar];
      v14 = [v13 dateBySettingUnit:32 value:12 ofDate:v12 options:0];

      if (!HKTimeFormatIsIn24HourMode()
        && (([v8 isEqual:v12] & 1) != 0 || objc_msgSend(v8, "isEqual:", v14)))
      {
        v10 = HKLocalizedStringForDateAndTemplate(v8, 24);
      }
      else
      {
        v16 = HKLocalizedStringForDateAndTemplate(v8, 25);
        v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v10 = [v16 stringByTrimmingCharactersInSet:v17];
      }
      goto LABEL_18;
    case 7:
      uint64_t v9 = 27;
LABEL_9:
      v10 = HKLocalizedStringForDateAndTemplate(v7, v9);
      goto LABEL_18;
    case 8:
      objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKDateAxis.m", 91, @"Invalid zoom specified (%ld)", 8);

      goto LABEL_15;
    default:
LABEL_15:
      v10 = 0;
LABEL_18:

      return v10;
  }
}

- (id)stringForDate:(id)a3 zoom:(int64_t)a4 labelType:(int64_t)a5
{
  if (a5 == 2)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = -[HKDateAxis _formattedStringForDate:zoom:](self, "_formattedStringForDate:zoom:", a3, a4, v5);
  }
  return v7;
}

- (id)minorAxisIntervalComponentsForZoomLevelConfiguration:(id)a3
{
  return (id)[a3 minorAxisIntervalComponents];
}

- (id)axisLabelIntervalComponentsForZoomLevelConfiguration:(id)a3
{
  return (id)[a3 axisLabelIntervalComponents];
}

- (BOOL)canAddLabelForAxisLabelType:(int64_t)a3
{
  return a3 != 2;
}

- (unint64_t)_anchorUnitForZoom:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      unint64_t result = 4;
      break;
    case 3:
      unint64_t result = 8;
      break;
    case 4:
      unint64_t result = 0x2000;
      break;
    case 5:
    case 6:
      unint64_t result = 16;
      break;
    case 7:
      unint64_t result = 32;
      break;
    case 8:
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKDateAxis.m", 142, @"Invalid zoom level (%ld)", 8);

      unint64_t result = 0;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

- (int64_t)dateZoomForZoomScale:(double)a3
{
  v4 = [(HKAxis *)self zoomScaleEngine];
  int64_t v5 = [v4 zoomForZoomScale:a3];

  return v5;
}

- (id)_axisLabelsWithModelRange:(id)a3 zoom:(int64_t)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v8 = [v6 array];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __45__HKDateAxis__axisLabelsWithModelRange_zoom___block_invoke;
  v13[3] = &unk_1E6D555B8;
  int64_t v15 = a4;
  v13[4] = self;
  id v9 = v8;
  id v14 = v9;
  [(HKDateAxis *)self _enumerateCoordinatesInModelRange:v7 timeScope:a4 withHandler:v13];

  v10 = v14;
  id v11 = v9;

  return v11;
}

void __45__HKDateAxis__axisLabelsWithModelRange_zoom___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v12 = a2;
  int64_t v5 = objc_opt_new();
  uint64_t v6 = 1;
  uint64_t v7 = 2;
  if ((a3 & 4) == 0) {
    uint64_t v7 = -1;
  }
  if ((a3 & 2) == 0) {
    uint64_t v6 = v7;
  }
  if (a3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v6;
  }
  if (*(void *)(a1 + 48) == 4)
  {
    if ((a3 & 2) == 0) {
      goto LABEL_16;
    }
    uint64_t v9 = 4;
  }
  else
  {
    if (![*(id *)(a1 + 32) canAddLabelForAxisLabelType:v8]) {
      goto LABEL_16;
    }
    uint64_t v9 = *(void *)(a1 + 48);
  }
  v10 = [*(id *)(a1 + 32) stringForDate:v12 zoom:v9 labelType:v8];
  if ([v10 length]) {
    [v5 setText:v10];
  }

LABEL_16:
  [v5 setLocation:v12];
  if (*(void *)(a1 + 48) == 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v8;
  }
  [v5 setLabelType:v11];
  if (*(void *)(a1 + 48) == 3)
  {
    if ((a3 & 2) == 0) {
      goto LABEL_23;
    }
    [v5 setLabelType:1];
  }
  [*(id *)(a1 + 40) addObject:v5];
LABEL_23:
}

- (id)rangeForChartRect:(CGRect)a3 zoomScale:(double)a4 contentOffset:(CGPoint)a5
{
  -[HKAxis _chartRangeForChartRect:zoomScale:contentOffset:](self, "_chartRangeForChartRect:zoomScale:contentOffset:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a5.x, a5.y);
  return -[HKDateAxis _dateRangeForChartRange:zoomScale:](self, "_dateRangeForChartRange:zoomScale:");
}

- (void)offsetForValueRange:(id)a3 chartRect:(CGRect)a4 zoomScaleOut:(double *)a5 contentOffsetOut:(CGPoint *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = [(HKAxis *)self transform];
  int64_t v15 = [v13 minValue];
  [v14 coordinateForValue:v15];
  double v17 = v16;

  v18 = [(HKAxis *)self transform];
  v19 = [v13 maxValue];

  [v18 coordinateForValue:v19];
  [(HKAxis *)self pointTransform];
  double v22 = HKLinearTransformRange(v20, v21, v17);
  if (v23 > 0.0)
  {
    -[HKAxis _offsetForChartRect:chartRange:zoomScaleOut:contentOffsetOut:](self, "_offsetForChartRect:chartRange:zoomScaleOut:contentOffsetOut:", a5, a6, x, y, width, height, v22, v23);
  }
}

- (id)_dateRangeForChartRange:(HKRange)a3 zoomScale:(double)a4
{
  double var0 = a3.var0;
  [(HKAxis *)self pointTransform];
  double v8 = HKLinearTransformInvert(v6, v7);
  double v10 = HKLinearTransformRange(v8, v9, var0);
  double v12 = v11;
  id v13 = [(HKAxis *)self transform];
  id v14 = objc_msgSend(v13, "valueForCoordinate:", HKRangeMin(v10, v12));

  int64_t v15 = [(HKAxis *)self transform];
  double v16 = objc_msgSend(v15, "valueForCoordinate:", HKRangeMax(v10, v12));

  double v17 = +[HKValueRange valueRangeWithMinValue:v14 maxValue:v16];

  return v17;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  id v6 = a3;
  double v7 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:[(HKDateAxis *)self dateZoomForZoomScale:a4]];
  [v7 canonicalSize];
  double v9 = v8 * 3.0;
  double v10 = [v6 startDate];
  [v10 timeIntervalSinceReferenceDate];
  uint64_t v12 = vcvtmd_s64_f64(v11 / v9);

  id v13 = [v6 endDate];
  [v13 timeIntervalSinceReferenceDate];
  double v15 = v14 / v9;
  double v16 = floor(v15);
  unint64_t v17 = vcvtmd_s64_f64(v15);

  v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9 * (double)(uint64_t)v16];
  v19 = [v6 endDate];
  int v20 = [v18 isEqualToDate:v19];

  uint64_t v21 = v20 ^ 1u;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ((uint64_t)(v21 + v17) >= v12)
  {
    v28 = v7;
    double v23 = 0;
    uint64_t v24 = v17 + v21 + 1;
    do
    {
      v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9 * (double)v12];
      if (v23)
      {
        v26 = +[HKValueRange valueRangeWithMinValue:v23 maxValue:v25];
        [v22 addObject:v26];
      }
      ++v12;
      double v23 = v25;
    }
    while (v24 != v12);

    double v7 = v28;
  }

  return v22;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v6 = a3;
  double v7 = [(HKDateAxis *)self _axisLabelsWithModelRange:v6 zoom:[(HKDateAxis *)self dateZoomForZoomScale:a4]];

  if ([v7 count]) {
    double v8 = v7;
  }
  else {
    double v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)extendModelRangeWithRange:(id)a3 zoomScale:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 startDate];
  if (v7
    && (double v8 = (void *)v7,
        [v6 endDate],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    unint64_t v10 = [(HKDateAxis *)self _anchorUnitForZoom:[(HKDateAxis *)self dateZoomForZoomScale:a4]];
    double v11 = [(HKDateAxis *)self currentCalendar];
    id v23 = 0;
    uint64_t v12 = [v6 startDate];
    [v11 rangeOfUnit:v10 startDate:&v23 interval:0 forDate:v12];
    id v13 = v23;

    double v14 = [(HKDateAxis *)self currentCalendar];
    id v22 = 0;
    double v15 = [v6 endDate];
    [v14 rangeOfUnit:v10 startDate:&v22 interval:0 forDate:v15];
    id v16 = v22;

    unint64_t v17 = [v6 endDate];
    LODWORD(v15) = objc_msgSend(v16, "hk_isBeforeDate:", v17);

    if (v15)
    {
      v18 = [(HKDateAxis *)self currentCalendar];
      uint64_t v19 = [v18 dateByAddingUnit:v10 value:1 toDate:v16 options:0];

      id v16 = (id)v19;
    }
    id v20 = +[HKValueRange valueRangeWithMinValue:v13 maxValue:v16];
  }
  else
  {
    id v20 = v6;
  }

  return v20;
}

- (void)_enumerateCoordinatesInModelRange:(id)a3 timeScope:(int64_t)a4 withHandler:(id)a5
{
  id v9 = a3;
  v47 = (void (**)(id, id, uint64_t, unsigned char *, double))a5;
  unint64_t v10 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:a4];
  uint64_t v11 = [(HKDateAxis *)self axisLabelIntervalComponentsForZoomLevelConfiguration:v10];
  uint64_t v12 = [(HKDateAxis *)self minorAxisIntervalComponentsForZoomLevelConfiguration:v10];
  v43 = v10;
  uint64_t v13 = [v10 referencePointIntervalComponents];
  v46 = (void *)v11;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_38:
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"HKDateAxis.m" lineNumber:288 description:@"HKDateAxis: minor components cannot be nil"];

    if (v13) {
      goto LABEL_4;
    }
LABEL_39:
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"HKDateAxis.m" lineNumber:289 description:@"HKDateAxis: reference components cannot be nil"];

    goto LABEL_4;
  }
  v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2 object:self file:@"HKDateAxis.m" lineNumber:287 description:@"HKDateAxis: step components cannot be nil"];

  if (!v12) {
    goto LABEL_38;
  }
LABEL_3:
  if (!v13) {
    goto LABEL_39;
  }
LABEL_4:
  double v14 = [(HKDateAxis *)self currentCalendar];
  double v15 = [v9 minValue];
  v45 = (void *)v13;
  id v16 = [(HKDateAxis *)self _firstDateAfter:v15 matchingComponents:v13 timeScope:a4 calendar:v14];

  unint64_t v17 = [v9 minValue];
  v18 = [(HKDateAxis *)self _firstDateAfter:v17 matchingComponents:v11 timeScope:a4 calendar:v14];

  uint64_t v19 = [v9 minValue];
  v50 = (void *)v12;
  id v20 = [(HKDateAxis *)self _firstDateAfter:v19 matchingComponents:v12 timeScope:a4 calendar:v14];

  if (!v20)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"HKDateAxis.m" lineNumber:296 description:@"HKDateAxis: next minor date is nil"];
  }
  id v21 = v20;
  v44 = v9;
  v49 = [v9 maxValue];
  if (HKUIObjectIsLarger(v21, (uint64_t)v49))
  {
    id v22 = v21;
    goto LABEL_36;
  }
  v48 = 0;
  id v23 = v21;
  while (1)
  {
    if (v16 && [v23 isEqualToDate:v16])
    {
      id v24 = v23;
      uint64_t v25 = [(HKDateAxis *)self nextDateForDate:v16 components:v45 timeScope:a4 calendar:v14];

      uint64_t v26 = 1;
      id v16 = (void *)v25;
      if (!v18) {
        goto LABEL_18;
      }
    }
    else
    {
      id v24 = 0;
      uint64_t v26 = 0;
      if (!v18) {
        goto LABEL_18;
      }
    }
    if ([v23 isEqualToDate:v18])
    {
      if (!v24) {
        id v24 = v23;
      }
      v26 |= 2uLL;
      uint64_t v27 = [(HKDateAxis *)self nextDateForDate:v18 components:v46 timeScope:a4 calendar:v14];

      v18 = (void *)v27;
    }
LABEL_18:
    if (v21 && [v23 isEqualToDate:v21])
    {
      if (!v24) {
        id v24 = v23;
      }
      v26 |= 4uLL;
      uint64_t v28 = [(HKDateAxis *)self nextDateForDate:v21 components:v50 timeScope:a4 calendar:v14];

      id v21 = (id)v28;
    }
    if (v24)
    {
      char v51 = 0;
      [(HKAxis *)self pointTransform];
      double v30 = v29;
      double v32 = v31;
      v33 = [(HKAxis *)self transform];
      [v33 coordinateForValue:v23];
      double v35 = HKLinearTransformValue(v30, v32, v34);

      v47[2](v47, v24, v26, &v51, v35);
      if (v51) {
        break;
      }
    }
    id v22 = [(HKDateAxis *)self nextDateForDate:v23 components:v50 timeScope:a4 calendar:v14];

    if (a4 == 4)
    {
      if (v16 && objc_msgSend(v22, "hk_isAfterDate:", v16))
      {
        id v36 = v22;

        id v37 = v16;
      }
      else
      {
        id v36 = 0;
        id v37 = v48;
        if (!v48)
        {
LABEL_31:
          v48 = v36;
          goto LABEL_32;
        }
      }
      id v38 = v37;

      id v22 = v38;
      goto LABEL_31;
    }
LABEL_32:

    id v23 = v22;
    if (HKUIObjectIsLarger(v22, (uint64_t)v49)) {
      goto LABEL_35;
    }
  }

  id v22 = v23;
LABEL_35:

LABEL_36:
}

- (id)_firstDateAfter:(id)a3 matchingComponents:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11)
  {
    uint64_t v13 = [(HKDateAxis *)self baseDateForDate:v10 components:v11 calendar:v12];
    if (objc_msgSend(v13, "hk_isBeforeDate:", v10))
    {
      do
      {
        double v14 = [(HKDateAxis *)self nextDateForDate:v13 components:v11 timeScope:a5 calendar:v12];

        uint64_t v13 = v14;
      }
      while ((objc_msgSend(v14, "hk_isBeforeDate:", v10) & 1) != 0);
    }
    else
    {
      double v14 = v13;
    }
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (id)baseDateForDate:(id)a3 components:(id)a4 calendar:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 minute] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v10 minute] < 2)
    {
      uint64_t v14 = objc_msgSend(v11, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v9, 0, 0);
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if ([v10 hour] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v10 hour] >= 2)
    {
LABEL_14:
      uint64_t v14 = objc_msgSend(v11, "hk_startOfDateByAddingDays:toDate:", 0, v9);
      goto LABEL_15;
    }
LABEL_11:
    uint64_t v14 = objc_msgSend(v11, "hk_startOfHourForDate:addingHours:", v9, 0);
    goto LABEL_15;
  }
  if ([v10 day] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v10 day] != 1)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"HKDateAxis.m" lineNumber:376 description:@"_baseDateForDate: no support for specifying .day that is not one"];
    }
    goto LABEL_14;
  }
  if ([v10 weekOfYear] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v10 weekOfYear] < 2) {
      objc_msgSend(v11, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v11, "firstWeekday"), v9, 0);
    }
    else {
    uint64_t v14 = objc_msgSend(v11, "hk_sixMonthPeriodContaining:dateBefore:", v9, 1);
    }
    goto LABEL_15;
  }
  if ([v10 month] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v10 year] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"HKDateAxis.m", 397, @"_baseDateForDate: No support for datecomponents: %@", v10 object file lineNumber description];

      uint64_t v13 = 0;
      goto LABEL_16;
    }
  }
  else if ([v10 month] < 2)
  {
    uint64_t v14 = objc_msgSend(v11, "hk_startOfMonthForDate:", v9);
    goto LABEL_15;
  }
  uint64_t v14 = objc_msgSend(v11, "hk_startOfYearForDate:addingYears:", v9, 0);
LABEL_15:
  uint64_t v13 = (void *)v14;
LABEL_16:

  return v13;
}

- (id)nextDateForDate:(id)a3 components:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v12 dateByAddingComponents:v11 toDate:v10 options:0];
  if (-[HKDateAxis _anchorUnitForZoom:](self, "_anchorUnitForZoom:", a5) == 16 && [v11 hour] >= 2)
  {
    uint64_t v14 = [v12 components:62 fromDate:v13];
    uint64_t v15 = [v14 hour];
    if (v15 % [v11 hour])
    {
      objc_msgSend(v14, "setHour:", objc_msgSend(v11, "hour") * (objc_msgSend(v14, "hour") / objc_msgSend(v11, "hour")));
      id v16 = [v12 dateFromComponents:v14];

      if (objc_msgSend(v16, "hk_isBeforeOrEqualToDate:", v10))
      {
        objc_msgSend(v14, "setHour:", objc_msgSend(v14, "hour") + objc_msgSend(v11, "hour"));
        uint64_t v13 = [v12 dateFromComponents:v14];
      }
      else
      {
        uint64_t v13 = v16;
      }
    }
  }
  return v13;
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