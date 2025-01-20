@interface HKGraphZoomLevelConfiguration
+ (id)_axisSpanDateComponentsWithTimeScope:(int64_t)a3;
+ (id)_chartVisibleRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 alignment:(int64_t)a5 dataRange:(id)a6 calendar:(id)a7 firstWeekday:(int64_t)a8 cadence:(int64_t)a9 level:(int64_t)a10 anchorDateIsInclusive:(BOOL)a11;
+ (id)_dateOffsetByHalfCanonicalSizeOfDate:(id)a3 timeScope:(int64_t)a4;
+ (id)_findVisibleRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 alignment:(int64_t)a5 calendar:(id)a6 anchorDateIsInclusive:(BOOL)a7;
+ (id)_fitRange:(id)a3 toDateRange:(id)a4 timeScope:(int64_t)a5 alignment:(int64_t)a6 calendar:(id)a7 firstWeekday:(int64_t)a8 cadence:(int64_t)a9 level:(int64_t)a10;
+ (id)_generateConfigurationForZoomLevel:(int64_t)a3;
+ (id)_gregorianCalendarForCalendar:(id)a3;
+ (id)_snappingStartDateWithStartDate:(id)a3 velocity:(CGPoint)a4 calendar:(id)a5 timeScope:(int64_t)a6 options:(int64_t)a7 alignment:(int64_t)a8;
+ (id)_visibleRangeDateFromAnchor:(id)a3 timeScope:(int64_t)a4 calendar:(id)a5 offset:(int64_t)a6;
+ (id)_visibleRangeDateFromDate:(id)a3 timeScope:(int64_t)a4 calendar:(id)a5 offset:(int64_t)a6;
+ (id)activeRangeFromCadenceRange:(id)a3 timeScope:(int64_t)a4 axisRange:(id)a5 calendar:(id)a6;
+ (id)chartDataRangeForTimeScope:(int64_t)a3 dataRange:(id)a4 firstWeekday:(int64_t)a5 calendar:(id)a6 cadence:(int64_t)a7 alignment:(int64_t)a8;
+ (id)chartVisibleRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 alignment:(int64_t)a5 dataRange:(id)a6 calendar:(id)a7 firstWeekday:(int64_t)a8 cadence:(int64_t)a9 level:(int64_t)a10;
+ (id)configurationForZoomLevel:(int64_t)a3;
+ (id)defaultCalendar;
+ (id)seriesPointIntervalUnitForTimeScope:(int64_t)a3 pointCount:(int64_t)a4;
+ (id)snappingRangeForRange:(id)a3 axisRange:(id)a4 timeScope:(int64_t)a5 velocity:(CGPoint)a6 calendar:(id)a7 options:(int64_t)a8 alignment:(int64_t)a9;
+ (int64_t)timeScopeForDateRange:(id)a3;
+ (int64_t)visibleSeriesPointCountForTimeScope:(int64_t)a3 resolution:(int64_t)a4;
- (NSDateComponents)axisLabelIntervalComponents;
- (NSDateComponents)minorAxisIntervalComponents;
- (NSDateComponents)referencePointIntervalComponents;
- (NSDateComponents)seriesPointEnhancedIntervalComponents;
- (NSDateComponents)seriesPointStandardIntervalComponents;
- (double)approximateAxisLabelInterval;
- (double)approximateSeriesEnhancedPointInterval;
- (double)approximateSeriesPointIntervalAtResolution:(int64_t)a3;
- (double)approximateSeriesStandardPointInterval;
- (double)canonicalSize;
- (double)seriesBlockSize;
- (double)todayOffsetSize;
- (double)zoomLevelThreshold;
- (id)seriesPointIntervalComponentsAtResolution:(int64_t)a3;
- (int64_t)intendedTimeScope;
- (int64_t)visibleSeriesPointCountAtResolution:(int64_t)a3;
- (unint64_t)majorTickCalendarUnit;
@end

@implementation HKGraphZoomLevelConfiguration

+ (id)_generateConfigurationForZoomLevel:(int64_t)a3
{
  if ((unint64_t)a3 >= 8)
  {
    v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, a1, @"HKCoordinateTransform.m", 214, @"Invalid parameter not satisfying: %@", @"(zoom >= 0) && (zoom < HKTimeScopeCount)" object file lineNumber description];
  }
  v5 = (NSDateComponents *)objc_opt_new();
  v6 = (NSDateComponents *)objc_opt_new();
  v7 = (NSDateComponents *)objc_opt_new();
  v54 = objc_opt_new();
  v8 = (NSDateComponents *)objc_opt_new();
  v9 = (NSDateComponents *)objc_opt_new();
  v10 = objc_opt_new();
  v55 = objc_opt_new();
  v11 = objc_opt_new();
  v50 = v9;
  int64_t v51 = a3;
  switch(a3)
  {
    case 0:
      [(NSDateComponents *)v5 setYear:10];
      [(NSDateComponents *)v8 setYear:1];
      [(NSDateComponents *)v6 setYear:1];
      [(NSDateComponents *)v7 setYear:1];
      [(NSDateComponents *)v9 setYear:1];
      [v54 setYear:15];
      [v55 setYear:10];
      v12 = v10;
      uint64_t v13 = 8;
      goto LABEL_6;
    case 1:
      [(NSDateComponents *)v5 setYear:5];
      [(NSDateComponents *)v8 setYear:1];
      [(NSDateComponents *)v6 setYear:1];
      [(NSDateComponents *)v7 setYear:1];
      [(NSDateComponents *)v9 setYear:1];
      [v54 setYear:1];
      [v55 setYear:5];
      v12 = v10;
      uint64_t v13 = 3;
LABEL_6:
      [v12 setYear:v13];
      [v11 setYear:1];
      uint64_t v14 = 4;
      goto LABEL_15;
    case 2:
      [(NSDateComponents *)v5 setYear:1];
      [(NSDateComponents *)v8 setMonth:1];
      [(NSDateComponents *)v6 setMonth:1];
      [(NSDateComponents *)v7 setMonth:1];
      [(NSDateComponents *)v9 setMonth:1];
      [v54 setMonth:12];
      [v55 setYear:1];
      uint64_t v40 = 8;
      [v10 setMonth:8];
      [v11 setMonth:2];
      goto LABEL_16;
    case 3:
      [(NSDateComponents *)v5 setWeekOfYear:26];
      [(NSDateComponents *)v8 setMonth:1];
      [(NSDateComponents *)v6 setWeekOfYear:1];
      [(NSDateComponents *)v7 setWeekOfYear:1];
      [(NSDateComponents *)v9 setMonth:1];
      [v54 setWeekOfYear:39];
      [v55 setWeekOfYear:26];
      [v10 setWeekOfYear:20];
      [v11 setWeekOfYear:1];
      uint64_t v14 = 0x2000;
      goto LABEL_15;
    case 4:
      [(NSDateComponents *)v5 setMonth:1];
      [(NSDateComponents *)v8 setWeekOfYear:1];
      [(NSDateComponents *)v6 setDay:1];
      [(NSDateComponents *)v7 setDay:1];
      [(NSDateComponents *)v9 setWeekOfYear:1];
      [v54 setDay:45];
      [v55 setMonth:1];
      [v10 setDay:8];
      v15 = v11;
      uint64_t v16 = 4;
      goto LABEL_11;
    case 5:
      [(NSDateComponents *)v5 setWeekOfYear:1];
      [(NSDateComponents *)v8 setDay:1];
      [(NSDateComponents *)v6 setDay:1];
      [(NSDateComponents *)v7 setHour:6];
      [(NSDateComponents *)v9 setDay:1];
      [v54 setDay:14];
      [v55 setWeekOfYear:1];
      [v10 setHour:84];
      v15 = v11;
      uint64_t v16 = 1;
LABEL_11:
      [v15 setDay:v16];
      goto LABEL_12;
    case 6:
      [(NSDateComponents *)v5 setDay:1];
      [(NSDateComponents *)v8 setHour:6];
      [(NSDateComponents *)v9 setHour:6];
      [(NSDateComponents *)v6 setHour:1];
      [(NSDateComponents *)v7 setHour:1];
      [v54 setDay:4];
      [v55 setDay:1];
      [v10 setHour:12];
      [v11 setHour:2];
      uint64_t v14 = 32;
      goto LABEL_15;
    case 7:
      [(NSDateComponents *)v5 setHour:1];
      [(NSDateComponents *)v8 setMinute:15];
      [(NSDateComponents *)v9 setMinute:15];
      [(NSDateComponents *)v6 setMinute:2];
      [(NSDateComponents *)v7 setMinute:2];
      [v54 setHour:12];
      [v55 setHour:1];
      [v10 setMinute:30];
      [v11 setMinute:15];
      uint64_t v14 = 64;
      goto LABEL_15;
    case 8:
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      id v17 = a1;
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HKCoordinateTransform.m", 330, @"Invalid zoom level (%ld)", 8);

      uint64_t v40 = 16;
      goto LABEL_17;
    default:
LABEL_12:
      uint64_t v14 = 16;
LABEL_15:
      uint64_t v40 = v14;
LABEL_16:
      id v17 = a1;
LABEL_17:
      v18 = [v17 defaultCalendar];
      v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
      v49 = [v18 dateByAddingComponents:v54 toDate:v19 options:0];
      v47 = v10;
      v48 = [v18 dateByAddingComponents:v10 toDate:v19 options:0];
      v46 = [v18 dateByAddingComponents:v55 toDate:v19 options:0];
      v45 = [v18 dateByAddingComponents:v6 toDate:v19 options:0];
      v44 = [v18 dateByAddingComponents:v7 toDate:v19 options:0];
      [v18 dateByAddingComponents:v11 toDate:v19 options:0];
      v43 = v53 = v11;
      v42 = [v18 dateByAddingComponents:v8 toDate:v19 options:0];
      v20 = v8;
      v21 = objc_alloc_init(HKGraphZoomLevelConfiguration);
      referencePointIntervalComponents = v21->_referencePointIntervalComponents;
      v21->_referencePointIntervalComponents = v5;
      v23 = v5;

      seriesPointStandardIntervalComponents = v21->_seriesPointStandardIntervalComponents;
      v21->_seriesPointStandardIntervalComponents = v6;
      v41 = v6;

      seriesPointEnhancedIntervalComponents = v21->_seriesPointEnhancedIntervalComponents;
      v21->_seriesPointEnhancedIntervalComponents = v7;
      v26 = v7;

      axisLabelIntervalComponents = v21->_axisLabelIntervalComponents;
      v21->_axisLabelIntervalComponents = v20;
      v28 = v20;

      minorAxisIntervalComponents = v21->_minorAxisIntervalComponents;
      v21->_minorAxisIntervalComponents = v50;

      [v49 timeIntervalSinceReferenceDate];
      v21->_seriesBlockSize = v30;
      [v48 timeIntervalSinceReferenceDate];
      v21->_zoomLevelThreshold = v31;
      [v46 timeIntervalSinceReferenceDate];
      v21->_canonicalSize = v32;
      v21->_majorTickCalendarUnit = v40;
      [v45 timeIntervalSinceReferenceDate];
      v21->_approximateSeriesStandardPointInterval = v33;
      [v44 timeIntervalSinceReferenceDate];
      v21->_approximateSeriesEnhancedPointInterval = v34;
      [v43 timeIntervalSinceReferenceDate];
      v21->_todayOffsetSize = v35;
      [v42 timeIntervalSinceReferenceDate];
      v21->_approximateAxisLabelInterval = v36;
      v21->_intendedTimeScope = v51;

      return v21;
  }
}

+ (id)configurationForZoomLevel:(int64_t)a3
{
  if (configurationForZoomLevel__onceToken != -1) {
    dispatch_once(&configurationForZoomLevel__onceToken, &__block_literal_global_68);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&configurationForZoomLevel__configurationLock);
  v5 = [NSNumber numberWithInteger:a3];
  v6 = [(id)configurationForZoomLevel____configurations objectForKeyedSubscript:v5];
  if (!v6)
  {
    v6 = [a1 _generateConfigurationForZoomLevel:a3];
    [(id)configurationForZoomLevel____configurations setObject:v6 forKeyedSubscript:v5];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&configurationForZoomLevel__configurationLock);

  return v6;
}

uint64_t __59__HKGraphZoomLevelConfiguration_configurationForZoomLevel___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = configurationForZoomLevel____configurations;
  configurationForZoomLevel____configurations = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)defaultCalendar
{
  if (defaultCalendar_onceToken != -1) {
    dispatch_once(&defaultCalendar_onceToken, &__block_literal_global_393);
  }
  v2 = (void *)defaultCalendar___calendar;
  return v2;
}

uint64_t __48__HKGraphZoomLevelConfiguration_defaultCalendar__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  uint64_t v1 = defaultCalendar___calendar;
  defaultCalendar___calendar = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (int64_t)timeScopeForDateRange:(id)a3
{
  id v4 = a3;
  v5 = [v4 endDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  v8 = [v4 startDate];
  [v8 timeIntervalSinceReferenceDate];
  double v10 = v7 - v9;

  if (v10 <= 3600.0)
  {
    int64_t v16 = 7;
  }
  else if (v10 <= 86400.0)
  {
    int64_t v16 = 6;
  }
  else if (v10 <= 604800.0)
  {
    int64_t v16 = 5;
  }
  else
  {
    v11 = objc_opt_new();
    [v11 setMonth:-1];
    v12 = [a1 defaultCalendar];
    uint64_t v13 = [v4 endDate];
    uint64_t v14 = [v12 dateByAddingComponents:v11 toDate:v13 options:0];

    v15 = [v4 startDate];
    LOBYTE(v13) = objc_msgSend(v14, "hk_isBeforeOrEqualToDate:", v15);

    if (v13)
    {
      int64_t v16 = 4;
    }
    else
    {
      [v11 setMonth:-6];
      id v17 = [a1 defaultCalendar];
      v18 = [v4 endDate];
      v19 = [v17 dateByAddingComponents:v11 toDate:v18 options:0];

      v20 = [v4 startDate];
      int v21 = objc_msgSend(v19, "hk_isBeforeOrEqualToDate:", v20);

      if (v21) {
        int64_t v16 = 3;
      }
      else {
        int64_t v16 = 2;
      }
      uint64_t v14 = v19;
    }
  }
  return v16;
}

+ (id)_gregorianCalendarForCalendar:(id)a3
{
  id v4 = a3;
  v5 = [v4 calendarIdentifier];
  if ([v5 isEqualToString:*MEMORY[0x1E4F1C318]])
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [a1 defaultCalendar];
  }
  double v7 = v6;

  return v7;
}

+ (id)chartDataRangeForTimeScope:(int64_t)a3 dataRange:(id)a4 firstWeekday:(int64_t)a5 calendar:(id)a6 cadence:(int64_t)a7 alignment:(int64_t)a8
{
  id v34 = a6;
  id v15 = a4;
  int64_t v16 = [v15 minValue];
  id v17 = [v15 maxValue];

  id v18 = v16;
  id v19 = v17;
  v20 = v19;
  int v21 = v19;
  v22 = v18;
  switch(a3)
  {
    case 0:
      v23 = v34;
      v24 = v34;
      id v25 = v18;
      uint64_t v26 = -9;
      goto LABEL_5;
    case 1:
      v23 = v34;
      v24 = v34;
      id v25 = v18;
      uint64_t v26 = -4;
      goto LABEL_5;
    case 2:
      v23 = v34;
      v24 = v34;
      id v25 = v18;
      uint64_t v26 = 0;
LABEL_5:
      v22 = objc_msgSend(v24, "hk_startOfYearForDate:addingYears:", v25, v26);

      uint64_t v27 = objc_msgSend(v23, "hk_startOfYearForDate:addingYears:", v20, 1);
      goto LABEL_16;
    case 3:
      v22 = objc_msgSend(v34, "hk_sixMonthPeriodContaining:dateBefore:", v18, 1);

      uint64_t v27 = objc_msgSend(v34, "hk_sixMonthPeriodContaining:dateBefore:", v20, 0);
      goto LABEL_16;
    case 4:
      if (a7 == 1)
      {
        v22 = objc_msgSend(v34, "hk_startOfMonthForDate:addingMonths:", v18, 0);

        uint64_t v27 = objc_msgSend(v34, "hk_startOfMonthForDate:addingMonths:", v20, 1);
LABEL_16:
        int v21 = (void *)v27;
        id v29 = v20;
      }
      else
      {
        int v21 = v19;
        v22 = v18;
        if (a7) {
          goto LABEL_18;
        }
        v22 = objc_msgSend(v34, "hk_startOfMonthForDate:addingMonths:", v18, 0);

        v28 = objc_msgSend(v34, "hk_startOfMonthForDate:addingMonths:", v20, 0);

        id v29 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        [v29 setCalendar:v34];
        [v29 setDay:1];
        int v21 = objc_msgSend(v29, "hk_dateByAddingInterval:toDate:", 31, v28);
      }
LABEL_17:

LABEL_18:
      double v32 = +[HKValueRange valueRangeWithMinValue:v22 maxValue:v21];

      return v32;
    case 5:
      v22 = objc_msgSend(v34, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a5, v18, 0);

      uint64_t v27 = objc_msgSend(v34, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a5, v20, 1);
      goto LABEL_16;
    case 6:
      v22 = objc_msgSend(v34, "hk_startOfDateByAddingDays:toDate:", 0, v18);

      int v21 = objc_msgSend(v34, "hk_startOfDateByAddingDays:toDate:", 1, v20);

      if (a8 != 4) {
        goto LABEL_18;
      }
      id v29 = [a1 _gregorianCalendarForCalendar:v34];
      uint64_t v30 = objc_msgSend(v22, "hk_sleepDayStartWithCalendar:", v29);

      uint64_t v31 = objc_msgSend(v21, "hk_sleepDayStartWithCalendar:", v29);

      int v21 = (void *)v31;
      v22 = (void *)v30;
      goto LABEL_17;
    case 7:
      v22 = objc_msgSend(v34, "hk_startOfHourForDate:addingHours:", v18, 0);

      uint64_t v27 = objc_msgSend(v34, "hk_startOfHourForDate:addingHours:", v20, 1);
      goto LABEL_16;
    case 8:
      id v29 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HKCoordinateTransform.m", 523, @"Invalid zoom level (%ld)", 8);
      int v21 = v20;
      v22 = v18;
      goto LABEL_17;
    default:
      goto LABEL_18;
  }
}

+ (id)_findVisibleRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 alignment:(int64_t)a5 calendar:(id)a6 anchorDateIsInclusive:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a4;
  id v13 = a6;
  switch(a5)
  {
    case 0:
    case 3:
      uint64_t v14 = [a1 _visibleRangeDateFromAnchor:v12 timeScope:a3 calendar:v13 offset:0];
      goto LABEL_4;
    case 1:
      id v15 = [a1 _dateOffsetByHalfCanonicalSizeOfDate:v12 timeScope:a3];
      uint64_t v14 = [a1 _visibleRangeDateFromAnchor:v15 timeScope:a3 calendar:v13 offset:0];

LABEL_4:
      int64_t v16 = [a1 _visibleRangeDateFromDate:v14 timeScope:a3 calendar:v13 offset:1];
      break;
    case 2:
      int64_t v16 = [a1 _visibleRangeDateFromAnchor:v12 timeScope:a3 calendar:v13 offset:0];
      if ((objc_msgSend(v16, "hk_isBeforeDate:", v12) & 1) != 0
        || v7 && objc_msgSend(v16, "hk_isBeforeOrEqualToDate:", v12))
      {
        if (a3 == 3) {
          objc_msgSend(v13, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v13, "firstWeekday"), v12, 1);
        }
        else {
        uint64_t v20 = [a1 _visibleRangeDateFromAnchor:v12 timeScope:a3 calendar:v13 offset:1];
        }

        int64_t v16 = (void *)v20;
      }
      uint64_t v14 = [a1 _visibleRangeDateFromDate:v16 timeScope:a3 calendar:v13 offset:-1];
      break;
    case 4:
      id v17 = [a1 _visibleRangeDateFromAnchor:v12 timeScope:a3 calendar:v13 offset:0];
      id v18 = [a1 _visibleRangeDateFromDate:v17 timeScope:a3 calendar:v13 offset:1];
      id v19 = [a1 _gregorianCalendarForCalendar:v13];
      uint64_t v14 = objc_msgSend(v17, "hk_sleepDayStartWithCalendar:", v19);

      int64_t v16 = objc_msgSend(v18, "hk_sleepDayStartWithCalendar:", v19);

      break;
    default:
      int64_t v16 = 0;
      uint64_t v14 = 0;
      break;
  }
  int v21 = +[HKValueRange valueRangeWithMinValue:v14 maxValue:v16];

  return v21;
}

+ (id)_visibleRangeDateFromAnchor:(id)a3 timeScope:(int64_t)a4 calendar:(id)a5 offset:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = v12;
  switch(a4)
  {
    case 0:
    case 1:
      uint64_t v14 = objc_msgSend(v12, "hk_startOfYearForDate:addingYears:", v11, a6);
      goto LABEL_7;
    case 2:
      uint64_t v14 = objc_msgSend(v12, "hk_startOfMonthForDate:addingMonths:", v11, a6);
      goto LABEL_7;
    case 3:
      uint64_t v14 = objc_msgSend(v12, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v12, "firstWeekday"), v11, 26 * a6);
      goto LABEL_7;
    case 4:
    case 5:
      uint64_t v14 = objc_msgSend(v12, "hk_startOfDateByAddingDays:toDate:", a6, v11);
      goto LABEL_7;
    case 6:
      uint64_t v14 = objc_msgSend(v12, "hk_startOfHourForDate:addingHours:", v11, a6);
LABEL_7:
      id v15 = (void *)v14;
      goto LABEL_11;
    case 7:
      int64_t v16 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:7];
      id v17 = [v16 axisLabelIntervalComponents];
      uint64_t v18 = [v17 minute];

      id v15 = objc_msgSend(v13, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v11, v18, a6);

      goto LABEL_11;
    case 8:
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HKCoordinateTransform.m", 616, @"Invalid zoom level (%ld)", 8);

      goto LABEL_10;
    default:
LABEL_10:
      id v15 = 0;
LABEL_11:

      return v15;
  }
}

+ (id)_visibleRangeDateFromDate:(id)a3 timeScope:(int64_t)a4 calendar:(id)a5 offset:(int64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [a1 _axisSpanDateComponentsWithTimeScope:a4];
  [v12 setCalendar:v10];

  id v13 = objc_msgSend(v12, "hk_dateByAddingInterval:toDate:", a6, v11);

  return v13;
}

+ (id)_dateOffsetByHalfCanonicalSizeOfDate:(id)a3 timeScope:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:a4];
  [v6 canonicalSize];
  v8 = [v5 dateByAddingTimeInterval:v7 * -0.5];

  return v8;
}

+ (id)_fitRange:(id)a3 toDateRange:(id)a4 timeScope:(int64_t)a5 alignment:(int64_t)a6 calendar:(id)a7 firstWeekday:(int64_t)a8 cadence:(int64_t)a9 level:(int64_t)a10
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = [v14 startDate];
  uint64_t v18 = v14;
  id v19 = [v14 endDate];
  uint64_t v20 = [v15 startDate];
  v70 = v15;
  uint64_t v21 = [v15 endDate];
  BOOL v23 = a5 == 6 && a6 == 4;
  v72 = v17;
  os_log_t log = (os_log_t)v20;
  uint64_t v24 = v20;
  id v25 = v21;
  uint64_t v26 = [v17 compare:v24];
  v71 = v19;
  uint64_t v27 = [v19 compare:v25];
  if (v26 == -1)
  {
    if (v27 == 1)
    {
      v37 = HKStringForHKTimeScope(a5, 0);
      id v34 = v18;
      if ((unint64_t)(a6 - 1) > 3) {
        v38 = @"left";
      }
      else {
        v38 = off_1E6D552A8[a6 - 1];
      }
      id v29 = v16;
      double v36 = v70;
      os_log_t v32 = log;
      _HKInitializeLogging();
      v48 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT))
      {
        loga = v48;
        v52 = [v34 startDate];
        v53 = [v34 endDate];
        v54 = [v70 startDate];
        [v70 endDate];
        v55 = os_log_t v65 = v25;
        *(_DWORD *)buf = 138544642;
        os_log_t v76 = v52;
        __int16 v77 = 2114;
        v78 = v53;
        __int16 v79 = 2114;
        v80 = v54;
        __int16 v81 = 2114;
        uint64_t v82 = (uint64_t)v55;
        __int16 v83 = 2114;
        v84 = v37;
        __int16 v85 = 2114;
        v86 = v38;
        _os_log_fault_impl(&dword_1E0B26000, loga, OS_LOG_TYPE_FAULT, "charting: _fitRange span too large: fit range %{public}@ to %{public}@ into %{public}@ to %{public}@ time scope %{public}@ alignment %{public}@", buf, 0x3Eu);

        id v25 = v65;
      }
      id v35 = v70;
    }
    else
    {
      if (v23) {
        uint64_t v39 = 4;
      }
      else {
        uint64_t v39 = 0;
      }
      LOBYTE(v62) = 1;
      os_log_t v32 = log;
      id v29 = v16;
      uint64_t v40 = +[HKGraphZoomLevelConfiguration _chartVisibleRangeForTimeScope:a5 anchorDate:log alignment:v39 dataRange:0 calendar:v16 firstWeekday:a8 cadence:a9 level:a10 + 1 anchorDateIsInclusive:v62];
      v41 = [v40 endDate];
      v42 = v25;
      uint64_t v43 = [v41 compare:v25];

      id v34 = v18;
      if (v43 == 1)
      {
        v44 = HKStringForHKTimeScope(a5, 0);
        double v36 = v70;
        if ((unint64_t)(a6 - 1) > 3) {
          v45 = @"left";
        }
        else {
          v45 = off_1E6D552A8[a6 - 1];
        }
        id v25 = v42;
        _HKInitializeLogging();
        v50 = (void *)*MEMORY[0x1E4F29FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR))
        {
          v66 = v50;
          os_log_t v69 = [v34 startDate];
          v63 = [v34 endDate];
          v60 = [v70 startDate];
          [v70 endDate];
          *(_DWORD *)buf = 138544642;
          os_log_t v76 = v69;
          __int16 v77 = 2114;
          v78 = v63;
          __int16 v79 = 2114;
          v80 = v60;
          v82 = __int16 v81 = 2114;
          v61 = (void *)v82;
          __int16 v83 = 2114;
          v84 = v44;
          __int16 v85 = 2114;
          v86 = v45;
          _os_log_error_impl(&dword_1E0B26000, v66, OS_LOG_TYPE_ERROR, "charting: _fitRange jitter detected: fit range %{public}@ to %{public}@ into %{public}@ to %{public}@ time scope %{public}@ alignment %{public}@", buf, 0x3Eu);

          id v25 = v42;
        }
        id v35 = v70;
      }
      else
      {
        id v35 = v40;
        double v36 = v70;
        id v25 = v42;
      }
    }
  }
  else if (v27 == 1)
  {
    if (v23) {
      uint64_t v28 = 4;
    }
    else {
      uint64_t v28 = 2;
    }
    LOBYTE(v62) = 0;
    os_log_t v64 = v25;
    id v29 = v16;
    uint64_t v30 = +[HKGraphZoomLevelConfiguration _chartVisibleRangeForTimeScope:a5 anchorDate:v25 alignment:v28 dataRange:0 calendar:v16 firstWeekday:a8 cadence:a9 level:a10 + 1 anchorDateIsInclusive:v62];
    uint64_t v31 = [v30 startDate];
    os_log_t v32 = log;
    uint64_t v33 = [v31 compare:log];

    id v34 = v18;
    if (v33 == -1)
    {
      v46 = HKStringForHKTimeScope(a5, 0);
      double v36 = v70;
      if ((unint64_t)(a6 - 1) > 3) {
        v47 = @"left";
      }
      else {
        v47 = off_1E6D552A8[a6 - 1];
      }
      _HKInitializeLogging();
      v49 = (void *)*MEMORY[0x1E4F29FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR))
      {
        v68 = v49;
        v56 = [v34 startDate];
        v57 = [v34 endDate];
        v58 = [v70 startDate];
        v59 = [v70 endDate];
        *(_DWORD *)buf = 138544642;
        os_log_t v76 = v56;
        __int16 v77 = 2114;
        v78 = v57;
        __int16 v79 = 2114;
        v80 = v58;
        __int16 v81 = 2114;
        uint64_t v82 = (uint64_t)v59;
        __int16 v83 = 2114;
        v84 = v46;
        __int16 v85 = 2114;
        v86 = v47;
        _os_log_error_impl(&dword_1E0B26000, v68, OS_LOG_TYPE_ERROR, "charting: _fitRange jitter detected: fit range %{public}@ to %{public}@ into %{public}@ to %{public}@ time scope %{public}@ alignment %{public}@", buf, 0x3Eu);
      }
      id v35 = v70;

      os_log_t v32 = log;
    }
    else
    {
      id v35 = v30;
      double v36 = v70;
    }

    id v25 = v64;
  }
  else
  {
    id v34 = v18;
    id v35 = v18;
    id v29 = v16;
    double v36 = v70;
    os_log_t v32 = log;
  }

  return v35;
}

+ (id)chartVisibleRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 alignment:(int64_t)a5 dataRange:(id)a6 calendar:(id)a7 firstWeekday:(int64_t)a8 cadence:(int64_t)a9 level:(int64_t)a10
{
  LOBYTE(v11) = 1;
  return (id)[a1 _chartVisibleRangeForTimeScope:a3 anchorDate:a4 alignment:a5 dataRange:a6 calendar:a7 firstWeekday:a8 cadence:a9 level:a10 anchorDateIsInclusive:v11];
}

+ (id)_chartVisibleRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 alignment:(int64_t)a5 dataRange:(id)a6 calendar:(id)a7 firstWeekday:(int64_t)a8 cadence:(int64_t)a9 level:(int64_t)a10 anchorDateIsInclusive:(BOOL)a11
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  if (v16)
  {
    id v19 = v16;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F1C9C8] date];
  }
  uint64_t v20 = v19;
  if ((unint64_t)(a5 - 3) <= 1)
  {
    uint64_t v21 = +[HKValueRange valueRangeWithMinValue:v19 maxValue:v19];
    v22 = +[HKGraphZoomLevelConfiguration chartDataRangeForTimeScope:a3 dataRange:v21 firstWeekday:a8 calendar:v18 cadence:a9 alignment:a5];

    if (v17) {
      goto LABEL_6;
    }
LABEL_9:
    id v23 = v22;
    goto LABEL_10;
  }
  v22 = [a1 _findVisibleRangeForTimeScope:a3 anchorDate:v19 alignment:a5 calendar:v18 anchorDateIsInclusive:a11];
  if (!v17) {
    goto LABEL_9;
  }
LABEL_6:
  if (a10 <= 2)
  {
    id v23 = +[HKGraphZoomLevelConfiguration _fitRange:v22 toDateRange:v17 timeScope:a3 alignment:a5 calendar:v18 firstWeekday:a8 cadence:a9 level:a10];
LABEL_10:
    id v24 = v23;
    goto LABEL_17;
  }
  id v25 = HKStringForHKTimeScope(a3, 0);
  if ((unint64_t)(a5 - 1) > 3) {
    uint64_t v26 = @"left";
  }
  else {
    uint64_t v26 = off_1E6D552A8[a5 - 1];
  }
  _HKInitializeLogging();
  uint64_t v27 = (void *)*MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_FAULT))
  {
    id v29 = v27;
    uint64_t v30 = [v17 startDate];
    uint64_t v31 = [v17 endDate];
    *(_DWORD *)buf = 138544386;
    id v34 = v20;
    __int16 v35 = 2114;
    double v36 = v30;
    __int16 v37 = 2114;
    v38 = v31;
    __int16 v39 = 2114;
    uint64_t v40 = v25;
    __int16 v41 = 2114;
    v42 = v26;
    _os_log_fault_impl(&dword_1E0B26000, v29, OS_LOG_TYPE_FAULT, "chartVisibleRangeError: unable to fit anchor %{public}@ into data range %{public}@ to %{public}@ with time scope %{public}@ and alignment %{public}@", buf, 0x34u);
  }
  id v24 = v22;

LABEL_17:
  return v24;
}

+ (id)snappingRangeForRange:(id)a3 axisRange:(id)a4 timeScope:(int64_t)a5 velocity:(CGPoint)a6 calendar:(id)a7 options:(int64_t)a8 alignment:(int64_t)a9
{
  double y = a6.y;
  double x = a6.x;
  id v17 = a4;
  id v18 = a7;
  id v19 = [a3 startDate];
  uint64_t v20 = objc_msgSend(a1, "_snappingStartDateWithStartDate:velocity:calendar:timeScope:options:alignment:", v19, v18, a5, a8, a9, x, y);

  uint64_t v21 = [v17 startDate];
  LODWORD(v19) = HKUIObjectIsSmaller(v20, (uint64_t)v21);

  if (v19)
  {
    uint64_t v22 = [v17 startDate];

    uint64_t v20 = (void *)v22;
  }
  id v23 = [a1 _axisSpanDateComponentsWithTimeScope:a5];
  [v23 setCalendar:v18];
  id v24 = objc_msgSend(v23, "hk_dateByAddingInterval:toDate:", 1, v20);
  id v25 = [v17 endDate];
  BOOL IsSmaller = HKUIObjectIsSmaller(v25, (uint64_t)v24);

  if (IsSmaller)
  {
    uint64_t v27 = [v17 endDate];

    uint64_t v28 = objc_msgSend(v23, "hk_dateByAddingInterval:toDate:", -1, v27);
    id v29 = [v17 startDate];
    uint64_t v30 = HKUIObjectMax(v28, v29);

    uint64_t v20 = (void *)v30;
    id v24 = (void *)v27;
  }
  uint64_t v31 = +[HKValueRange valueRangeWithMinValue:v20 maxValue:v24];

  return v31;
}

+ (id)activeRangeFromCadenceRange:(id)a3 timeScope:(int64_t)a4 axisRange:(id)a5 calendar:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = [v9 startDate];
  id v13 = +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:](HKGraphZoomLevelConfiguration, "chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:", a4, v12, 3, v11, v10, [v10 firstWeekday], 1, 0);

  id v14 = [v9 startDate];
  id v15 = [v13 startDate];
  uint64_t v16 = [v14 compare:v15];

  if (v16) {
    id v17 = v9;
  }
  else {
    id v17 = v13;
  }
  id v18 = v17;

  return v18;
}

+ (id)_snappingStartDateWithStartDate:(id)a3 velocity:(CGPoint)a4 calendar:(id)a5 timeScope:(int64_t)a6 options:(int64_t)a7 alignment:(int64_t)a8
{
  unsigned __int8 v9 = a7;
  double x = a4.x;
  id v14 = a3;
  id v15 = a5;
  double v16 = fabs(x);
  BOOL v17 = x > 0.0;
  id v18 = v14;
  id v19 = v18;
  if (v16 >= 0.3)
  {
    if (v16 <= 3.2) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = -1;
    }
    if (v16 <= 3.2) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = 2;
    }
    uint64_t v20 = v18;
    uint64_t v21 = v18;
    switch(a6)
    {
      case 0:
        char v40 = v16 > 3.2;
        if (v16 <= 3.2) {
          uint64_t v41 = 0;
        }
        else {
          uint64_t v41 = -10;
        }
        uint64_t v21 = objc_msgSend(v15, "hk_startOfYearForDate:addingYears:", v18, v41);

        uint64_t v42 = 10;
        goto LABEL_27;
      case 1:
        char v40 = v16 > 3.2;
        if (v16 <= 3.2) {
          uint64_t v43 = 0;
        }
        else {
          uint64_t v43 = -5;
        }
        uint64_t v21 = objc_msgSend(v15, "hk_startOfYearForDate:addingYears:", v18, v43);

        uint64_t v42 = 5;
LABEL_27:
        uint64_t v24 = v42 << v40;
        uint64_t v22 = v15;
        id v23 = v19;
        goto LABEL_29;
      case 2:
        uint64_t v21 = objc_msgSend(v15, "hk_startOfYearForDate:addingYears:", v18, v25);

        uint64_t v22 = v15;
        id v23 = v19;
        uint64_t v24 = v26;
LABEL_29:
        uint64_t v31 = objc_msgSend(v22, "hk_startOfYearForDate:addingYears:", v23, v24);
        goto LABEL_38;
      case 3:
      case 5:
        uint64_t v21 = objc_msgSend(v15, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v15, "firstWeekday"), v18, v25);

        uint64_t v27 = [v15 firstWeekday];
        uint64_t v28 = v15;
        id v29 = v19;
        uint64_t v30 = v26;
LABEL_15:
        uint64_t v31 = objc_msgSend(v28, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v27, v29, v30);
        goto LABEL_38;
      case 4:
        uint64_t v21 = objc_msgSend(v15, "hk_startOfMonthForDate:addingMonths:", v18, v25);

        os_log_t v32 = v15;
        uint64_t v33 = v19;
        uint64_t v34 = v26;
LABEL_31:
        uint64_t v31 = objc_msgSend(v32, "hk_startOfMonthForDate:addingMonths:", v33, v34);
        goto LABEL_38;
      case 6:
        uint64_t v21 = objc_msgSend(v15, "hk_startOfDateByAddingDays:toDate:", v25, v18);

        __int16 v35 = v15;
        uint64_t v36 = v26;
LABEL_33:
        uint64_t v20 = objc_msgSend(v35, "hk_startOfDateByAddingDays:toDate:", v36, v19);

        if (a8 != 4) {
          goto LABEL_40;
        }
        __int16 v37 = [a1 _gregorianCalendarForCalendar:v15];
        uint64_t v44 = objc_msgSend(v21, "hk_sleepDayStartWithCalendar:", v37);

        uint64_t v45 = objc_msgSend(v20, "hk_sleepDayStartWithCalendar:", v37);

        uint64_t v20 = (void *)v45;
        uint64_t v21 = (void *)v44;
        break;
      case 7:
        uint64_t v21 = objc_msgSend(v15, "hk_startOfHourForDate:addingHours:", v18, v25);

        v46 = v15;
        v47 = v19;
        uint64_t v48 = v26;
        goto LABEL_37;
      default:
        goto LABEL_40;
    }
  }
  else
  {
    uint64_t v20 = v18;
    uint64_t v21 = v18;
    switch(a6)
    {
      case 0:
      case 1:
        uint64_t v21 = objc_msgSend(v15, "hk_startOfYearForDate:addingYears:", v18, 0);

        uint64_t v22 = v15;
        id v23 = v19;
        uint64_t v24 = 1;
        goto LABEL_29;
      case 2:
        uint64_t v21 = objc_msgSend(v15, "hk_startOfMonthForDate:addingMonths:", v18, 0);

        os_log_t v32 = v15;
        uint64_t v33 = v19;
        uint64_t v34 = 1;
        goto LABEL_31;
      case 3:
        uint64_t v21 = objc_msgSend(v15, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v15, "firstWeekday"), v18, 0);

        uint64_t v27 = [v15 firstWeekday];
        uint64_t v28 = v15;
        id v29 = v19;
        uint64_t v30 = 1;
        goto LABEL_15;
      case 4:
      case 5:
        uint64_t v21 = objc_msgSend(v15, "hk_startOfDateByAddingDays:toDate:", 0, v18);

        uint64_t v31 = objc_msgSend(v15, "hk_startOfDateByAddingDays:toDate:", 1, v19);
        goto LABEL_38;
      case 6:
        if (((a6 == 6) & v9) != 0)
        {
          uint64_t v21 = objc_msgSend(v15, "hk_startOfDateByAddingDays:toDate:", 0, v18);

          __int16 v35 = v15;
          uint64_t v36 = 1;
          goto LABEL_33;
        }
        uint64_t v21 = objc_msgSend(v15, "hk_startOfHourForDate:addingHours:", v18, 0);

        v46 = v15;
        v47 = v19;
        uint64_t v48 = 1;
        break;
      case 7:
        __int16 v37 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:7];
        v38 = [v37 axisLabelIntervalComponents];
        uint64_t v39 = [v38 minute];

        uint64_t v21 = objc_msgSend(v15, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v19, v39, 0);

        uint64_t v20 = objc_msgSend(v15, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v19, v39, 1);

        goto LABEL_39;
      default:
        goto LABEL_40;
    }
LABEL_37:
    uint64_t v31 = objc_msgSend(v46, "hk_startOfHourForDate:addingHours:", v47, v48);
LABEL_38:
    uint64_t v20 = (void *)v31;
    __int16 v37 = v19;
  }
LABEL_39:

LABEL_40:
  if (v16 < 2.22044605e-16)
  {
    [v19 timeIntervalSinceDate:v21];
    double v50 = v49;
    [v20 timeIntervalSinceDate:v19];
    BOOL v17 = v51 < v50;
  }
  if (v17) {
    v52 = v20;
  }
  else {
    v52 = v21;
  }
  id v53 = v52;

  return v53;
}

+ (id)_axisSpanDateComponentsWithTimeScope:(int64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  id v5 = v4;
  switch(a3)
  {
    case 0:
      uint64_t v6 = 10;
      goto LABEL_5;
    case 1:
      uint64_t v6 = 5;
      goto LABEL_5;
    case 2:
      uint64_t v6 = 1;
LABEL_5:
      [v4 setYear:v6];
      break;
    case 3:
      uint64_t v7 = 26;
      goto LABEL_9;
    case 4:
      uint64_t v8 = 31;
      goto LABEL_11;
    case 5:
      uint64_t v7 = 1;
LABEL_9:
      [v4 setWeekOfYear:v7];
      break;
    case 6:
      uint64_t v8 = 1;
LABEL_11:
      [v4 setDay:v8];
      break;
    case 7:
      [v4 setHour:1];
      break;
    default:
      break;
  }
  return v5;
}

+ (id)seriesPointIntervalUnitForTimeScope:(int64_t)a3 pointCount:(int64_t)a4
{
  id v5 = &stru_1F3B9CF20;
  switch(a3)
  {
    case 0:
    case 1:
      uint64_t v6 = @"YEARS_NUMBERED_UNIT";
      goto LABEL_9;
    case 2:
      uint64_t v6 = @"MONTHS_NUMBERED_UNIT";
      goto LABEL_9;
    case 3:
      uint64_t v6 = @"WEEKS_NUMBERED_UNIT";
      goto LABEL_9;
    case 4:
    case 5:
      uint64_t v6 = @"DAYS_NUMBERED_UNIT";
      goto LABEL_9;
    case 6:
      uint64_t v6 = @"HOURS_NUMBERED_UNIT";
      goto LABEL_9;
    case 7:
      uint64_t v6 = @"MINUTES_NUMBERED_UNIT";
      goto LABEL_9;
    case 8:
      goto LABEL_10;
    default:
      uint64_t v6 = 0;
LABEL_9:
      uint64_t v7 = NSString;
      uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      unsigned __int8 v9 = [v8 localizedStringForKey:v6 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      objc_msgSend(v7, "localizedStringWithFormat:", v9, a4);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
      return v5;
  }
}

+ (int64_t)visibleSeriesPointCountForTimeScope:(int64_t)a3 resolution:(int64_t)a4
{
  id v5 = [a1 configurationForZoomLevel:a3];
  int64_t v6 = [v5 visibleSeriesPointCountAtResolution:a4];

  return v6;
}

- (int64_t)visibleSeriesPointCountAtResolution:(int64_t)a3
{
  [(HKGraphZoomLevelConfiguration *)self canonicalSize];
  double v6 = v5;
  uint64_t v7 = [(HKGraphZoomLevelConfiguration *)self seriesPointIntervalComponentsAtResolution:a3];
  objc_msgSend(v7, "hk_approximateDuration");
  int64_t v9 = vcvtmd_s64_f64(v6 / fmax(v8, 1.0));

  return v9;
}

- (id)seriesPointIntervalComponentsAtResolution:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    a2 = (SEL)*(id *)((char *)&self->super.isa + qword_1E0F05DB0[a3]);
  }
  return (id)(id)a2;
}

- (double)approximateSeriesPointIntervalAtResolution:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    return *(double *)((char *)&self->super.isa + qword_1E0F05DC8[a3]);
  }
  return result;
}

- (NSDateComponents)axisLabelIntervalComponents
{
  return self->_axisLabelIntervalComponents;
}

- (NSDateComponents)minorAxisIntervalComponents
{
  return self->_minorAxisIntervalComponents;
}

- (NSDateComponents)referencePointIntervalComponents
{
  return self->_referencePointIntervalComponents;
}

- (int64_t)intendedTimeScope
{
  return self->_intendedTimeScope;
}

- (double)seriesBlockSize
{
  return self->_seriesBlockSize;
}

- (double)zoomLevelThreshold
{
  return self->_zoomLevelThreshold;
}

- (double)canonicalSize
{
  return self->_canonicalSize;
}

- (unint64_t)majorTickCalendarUnit
{
  return self->_majorTickCalendarUnit;
}

- (double)todayOffsetSize
{
  return self->_todayOffsetSize;
}

- (double)approximateAxisLabelInterval
{
  return self->_approximateAxisLabelInterval;
}

- (NSDateComponents)seriesPointStandardIntervalComponents
{
  return self->_seriesPointStandardIntervalComponents;
}

- (NSDateComponents)seriesPointEnhancedIntervalComponents
{
  return self->_seriesPointEnhancedIntervalComponents;
}

- (double)approximateSeriesStandardPointInterval
{
  return self->_approximateSeriesStandardPointInterval;
}

- (double)approximateSeriesEnhancedPointInterval
{
  return self->_approximateSeriesEnhancedPointInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesPointEnhancedIntervalComponents, 0);
  objc_storeStrong((id *)&self->_seriesPointStandardIntervalComponents, 0);
  objc_storeStrong((id *)&self->_referencePointIntervalComponents, 0);
  objc_storeStrong((id *)&self->_minorAxisIntervalComponents, 0);
  objc_storeStrong((id *)&self->_axisLabelIntervalComponents, 0);
}

@end