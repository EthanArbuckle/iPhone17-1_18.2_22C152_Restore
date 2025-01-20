@interface _HKSleepComparisonFactorContext
- (BOOL)healthFactorContext;
- (HKInteractiveChartDataFormatter)sleepChartFormatter;
- (_HKSleepComparisonFactorContext)initWithStackedFactorDisplayType:(id)a3 currentCalendarOverride:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 contextChangeDelegate:(id)a7 primarySleepDisplayType:(id)a8 sleepChartFormatter:(id)a9;
- (id)stackedHeight;
- (void)_setContextItem:(id)a3 timeScope:(int64_t)a4 completion:(id)a5;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation _HKSleepComparisonFactorContext

- (_HKSleepComparisonFactorContext)initWithStackedFactorDisplayType:(id)a3 currentCalendarOverride:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 contextChangeDelegate:(id)a7 primarySleepDisplayType:(id)a8 sleepChartFormatter:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  v22 = [a3 objectType];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }
  v26.receiver = self;
  v26.super_class = (Class)_HKSleepComparisonFactorContext;
  v24 = [(_HKSleepComparisonContext *)&v26 initWithStackedSampleType:v23 currentCalendarOverride:v21 overlayChartController:v20 applicationItems:v19 contextChangeDelegate:v18 primarySleepDisplayType:v17];

  if (v24) {
    objc_storeStrong((id *)&v24->_sleepChartFormatter, a9);
  }

  return v24;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  objc_initWeak(&location, self);
  v26[0] = v12;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v19[3] = &unk_1E6D560D0;
  objc_copyWeak(v24, &location);
  id v16 = v13;
  id v20 = v16;
  id v17 = v12;
  v24[1] = (id)a5;
  v24[2] = (id)a6;
  id v21 = v17;
  v22 = self;
  id v18 = v14;
  id v23 = v18;
  [(HKOverlayRoomStackedContext *)self chartPointsForChartPointType:1 dateIntervals:v15 overlayChartController:v16 dateIntervalMustMatchView:1 timeScope:a5 resolution:a6 completion:v19];

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

- (void)_setContextItem:(id)a3 timeScope:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [HKOverlayPillValue alloc];
  v11 = [v9 string];

  id v12 = [(HKOverlayPillValue *)v10 initWithValueString:v11 unitString:&stru_1F3B9CF20];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72___HKSleepComparisonFactorContext__setContextItem_timeScope_completion___block_invoke;
  v14[3] = &unk_1E6D52FB8;
  id v15 = v8;
  id v13 = v8;
  [(HKOverlayRoomStackedContext *)self setLastUpdatedItemFromPillValue:v12 timeScope:a4 completion:v14];
}

- (id)stackedHeight
{
  return +[HKOverlayRoomFactorContext factorStackHeight];
}

- (BOOL)healthFactorContext
{
  return 1;
}

- (HKInteractiveChartDataFormatter)sleepChartFormatter
{
  return self->_sleepChartFormatter;
}

- (void).cxx_destruct
{
}

@end