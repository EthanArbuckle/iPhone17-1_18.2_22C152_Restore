@interface _WDSampleListDataProviderPagingContext
- (BOOL)isFetchingData;
- (BOOL)requiresPaging;
- (HKSampleListDataFetcher)currentDataFetcher;
- (NSDate)earliestProcessedSampleDate;
- (NSDate)fetchUntilDate;
- (void)setCurrentDataFetcher:(id)a3;
- (void)setEarliestProcessedSampleDate:(id)a3;
- (void)setFetchUntilDate:(id)a3;
- (void)setFetchingData:(BOOL)a3;
- (void)setRequiresPaging:(BOOL)a3;
@end

@implementation _WDSampleListDataProviderPagingContext

- (BOOL)requiresPaging
{
  return self->_requiresPaging;
}

- (void)setRequiresPaging:(BOOL)a3
{
  self->_requiresPaging = a3;
}

- (BOOL)isFetchingData
{
  return self->_fetchingData;
}

- (void)setFetchingData:(BOOL)a3
{
  self->_fetchingData = a3;
}

- (NSDate)earliestProcessedSampleDate
{
  return self->_earliestProcessedSampleDate;
}

- (void)setEarliestProcessedSampleDate:(id)a3
{
}

- (HKSampleListDataFetcher)currentDataFetcher
{
  return self->_currentDataFetcher;
}

- (void)setCurrentDataFetcher:(id)a3
{
}

- (NSDate)fetchUntilDate
{
  return self->_fetchUntilDate;
}

- (void)setFetchUntilDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchUntilDate, 0);
  objc_storeStrong((id *)&self->_currentDataFetcher, 0);

  objc_storeStrong((id *)&self->_earliestProcessedSampleDate, 0);
}

@end