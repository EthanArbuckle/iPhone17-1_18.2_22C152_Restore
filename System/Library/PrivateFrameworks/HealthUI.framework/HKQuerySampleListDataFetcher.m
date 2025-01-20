@interface HKQuerySampleListDataFetcher
- (HKQuerySampleListDataFetcher)initWithHealthStore:(id)a3 query:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation HKQuerySampleListDataFetcher

- (HKQuerySampleListDataFetcher)initWithHealthStore:(id)a3 query:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKQuerySampleListDataFetcher;
  v9 = [(HKQuerySampleListDataFetcher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    objc_storeStrong((id *)&v10->_query, a4);
  }

  return v10;
}

- (void)start
{
}

- (void)stop
{
  [(HKHealthStore *)self->_healthStore stopQuery:self->_query];
  healthStore = self->_healthStore;
  self->_healthStore = 0;

  query = self->_query;
  self->_query = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end