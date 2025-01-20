@interface HKHandwashingDateRangeDataSourceDelegate
- (HKHandwashingDateRangeDataSourceDelegate)initWithGoal:(double)a3;
- (double)goal;
- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4;
- (void)setGoal:(double)a3;
@end

@implementation HKHandwashingDateRangeDataSourceDelegate

- (HKHandwashingDateRangeDataSourceDelegate)initWithGoal:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKHandwashingDateRangeDataSourceDelegate;
  v4 = [(HKHandwashingDateRangeDataSourceDelegate *)&v7 init];
  v5 = v4;
  if (v4) {
    [(HKHandwashingDateRangeDataSourceDelegate *)v4 setGoal:a3];
  }
  return v5;
}

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = +[HKGraphZoomLevelConfiguration configurationForZoomLevel:a4];
  v8 = [v7 seriesPointIntervalComponentsAtResolution:0];
  v9 = +[HKGraphZoomLevelConfiguration defaultCalendar];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
  v12 = [v6 startDate];
  v13 = [v6 endDate];

  v14 = (void *)[v11 initWithStartDate:v12 endDate:v13];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__HKHandwashingDateRangeDataSourceDelegate_dataForDateRange_timeScope___block_invoke;
  v19[3] = &unk_1E6D55A28;
  v19[4] = self;
  id v15 = v10;
  id v20 = v15;
  objc_msgSend(v9, "hk_enumerateDateInterval:byDateComponents:block:", v14, v8, v19);

  v16 = v20;
  id v17 = v15;

  return v17;
}

void __71__HKHandwashingDateRangeDataSourceDelegate_dataForDateRange_timeScope___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HKHandwashingEventChartPoint alloc];
  v5 = [v3 startDate];
  id v6 = [v3 endDate];

  v9 = [(HKHandwashingEventChartPoint *)v4 initWithStartDate:v5 endDate:v6];
  objc_super v7 = NSNumber;
  [*(id *)(a1 + 32) goal];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [(HKHandwashingEventChartPoint *)v9 setAverageDuration:v8];

  [*(id *)(a1 + 40) addObject:v9];
}

- (double)goal
{
  return self->_goal;
}

- (void)setGoal:(double)a3
{
  self->_goal = a3;
}

@end