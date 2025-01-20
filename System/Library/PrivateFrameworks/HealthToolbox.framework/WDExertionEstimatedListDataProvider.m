@interface WDExertionEstimatedListDataProvider
- (BOOL)shouldDisplayAllSamples;
- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7;
- (void)setShouldDisplayAllSamples:(BOOL)a3;
@end

@implementation WDExertionEstimatedListDataProvider

- (id)createDataFetcherForSampleType:(id)a3 predicate:(id)a4 limit:(int64_t)a5 sortDescriptors:(id)a6 resultsHandler:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  if ([(WDExertionEstimatedListDataProvider *)self shouldDisplayAllSamples])
  {
    v14 = 0;
  }
  else
  {
    v15 = [WDExertionDataFetcher alloc];
    v16 = [(WDSampleListDataProvider *)self healthStore];
    v14 = [(WDExertionDataFetcher *)v15 initWithHealthStore:v16 predicate:v11 exertionTypeCode:298 limit:a5 sortDescriptors:v12 resultsHandler:v13];
  }

  return v14;
}

- (BOOL)shouldDisplayAllSamples
{
  return self->_shouldDisplayAllSamples;
}

- (void)setShouldDisplayAllSamples:(BOOL)a3
{
  self->_shouldDisplayAllSamples = a3;
}

@end