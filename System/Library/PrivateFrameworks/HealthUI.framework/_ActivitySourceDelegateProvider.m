@interface _ActivitySourceDelegateProvider
- (HKActivitySummaryDataProvider)dataProvider;
- (HKDateRangeDataUpdateDelegate)dateRangeDataUpdateDelegate;
- (_ActivitySourceDelegateProvider)initWithDataProvider:(id)a3 activityValue:(int64_t)a4 displayTypeController:(id)a5 unitPreferenceController:(id)a6;
- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4;
- (void)activitySummaryDataProviderDidUpdateActivitySummaries:(id)a3;
- (void)setDateRangeDataUpdateDelegate:(id)a3;
@end

@implementation _ActivitySourceDelegateProvider

- (_ActivitySourceDelegateProvider)initWithDataProvider:(id)a3 activityValue:(int64_t)a4 displayTypeController:(id)a5 unitPreferenceController:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_ActivitySourceDelegateProvider;
  v12 = [(_ActivitySourceDelegate *)&v15 initWithActivityValue:a4 displayTypeController:a5 unitPreferenceController:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataProvider, a3);
    objc_storeWeak((id *)&v13->_dateRangeDataUpdateDelegate, 0);
    [(HKActivitySummaryDataProvider *)v13->_dataProvider addObserver:v13];
  }

  return v13;
}

- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = [(_ActivitySourceDelegateProvider *)self dataProvider];
  v8 = [v7 activitySummariesForDateRange:v6 timeScope:a4];

  return v8;
}

- (void)activitySummaryDataProviderDidUpdateActivitySummaries:(id)a3
{
  id v3 = [(_ActivitySourceDelegateProvider *)self dateRangeDataUpdateDelegate];
  [v3 dateRangeDataUpdated];
}

- (HKActivitySummaryDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (HKDateRangeDataUpdateDelegate)dateRangeDataUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateRangeDataUpdateDelegate);
  return (HKDateRangeDataUpdateDelegate *)WeakRetained;
}

- (void)setDateRangeDataUpdateDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dateRangeDataUpdateDelegate);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end