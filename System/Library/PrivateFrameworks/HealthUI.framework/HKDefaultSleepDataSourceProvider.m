@interface HKDefaultSleepDataSourceProvider
- (HKDefaultSleepDataSourceProvider)initWithCalendar:(id)a3 queryIdentifier:(id)a4;
- (NSCalendar)calendar;
- (NSString)queryIdentifier;
- (id)makeSleepDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4;
- (id)makeSleepStagesDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4;
@end

@implementation HKDefaultSleepDataSourceProvider

- (HKDefaultSleepDataSourceProvider)initWithCalendar:(id)a3 queryIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKDefaultSleepDataSourceProvider;
  v9 = [(HKDefaultSleepDataSourceProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    objc_storeStrong((id *)&v10->_queryIdentifier, a4);
  }

  return v10;
}

- (id)makeSleepDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [HKSleepChartDataSource alloc];
  v9 = [(HKDefaultSleepDataSourceProvider *)self queryIdentifier];
  v10 = [(HKDefaultSleepDataSourceProvider *)self calendar];
  v11 = [(HKSleepChartDataSource *)v8 initWithHealthStore:v7 representativeDisplayType:v6 queryOptions:2 cacheIdentifier:@"HKSleepChartCacheIdentifierSleepConsistency" queryIdentifier:v9 calendar:v10];

  return v11;
}

- (id)makeSleepStagesDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [HKSleepChartDataSource alloc];
  v9 = [(HKDefaultSleepDataSourceProvider *)self queryIdentifier];
  v10 = [(HKDefaultSleepDataSourceProvider *)self calendar];
  v11 = [(HKSleepChartDataSource *)v8 initWithHealthStore:v7 representativeDisplayType:v6 queryOptions:6 cacheIdentifier:@"HKSleepChartCacheIdentifierSleepStages" queryIdentifier:v9 calendar:v10];

  return v11;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end