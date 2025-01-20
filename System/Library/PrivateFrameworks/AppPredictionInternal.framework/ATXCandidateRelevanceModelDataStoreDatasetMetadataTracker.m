@interface ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker
+ (id)yearMonthDayComponentsForDate:(id)a3;
- (ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker)init;
- (id)currentMetadata;
- (void)observeDataPoint:(id)a3;
@end

@implementation ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker

- (ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker)init
{
  v11.receiver = self;
  v11.super_class = (Class)ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker;
  v2 = [(ATXCandidateRelevanceModelDataStoreDatasetMetadataTracker *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_numberOfPositiveSamples = 0;
    uint64_t v4 = objc_opt_new();
    seenDatesWithPositiveSamples = v3->_seenDatesWithPositiveSamples;
    v3->_seenDatesWithPositiveSamples = (NSMutableSet *)v4;

    uint64_t v6 = objc_opt_new();
    seenDatesWithSamples = v3->_seenDatesWithSamples;
    v3->_seenDatesWithSamples = (NSMutableSet *)v6;

    startDate = v3->_startDate;
    v3->_numberOfSamples = 0;
    v3->_startDate = 0;

    endDate = v3->_endDate;
    v3->_endDate = 0;
  }
  return v3;
}

- (void)observeDataPoint:(id)a3
{
  id v4 = a3;
  v5 = [v4 context];
  uint64_t v6 = [v5 timeContext];
  id obj = [v6 date];

  v7 = [(id)objc_opt_class() yearMonthDayComponentsForDate:obj];
  LODWORD(v6) = [v4 engaged];

  if (v6)
  {
    seenDatesWithPositiveSamples = self->_seenDatesWithPositiveSamples;
    ++self->_numberOfPositiveSamples;
    [(NSMutableSet *)seenDatesWithPositiveSamples addObject:v7];
  }
  [(NSMutableSet *)self->_seenDatesWithSamples addObject:v7];
  startDate = self->_startDate;
  ++self->_numberOfSamples;
  v10 = obj;
  if (!startDate
    || ([(NSDate *)startDate earlierDate:obj],
        id v11 = (id)objc_claimAutoreleasedReturnValue(),
        v11,
        v10 = obj,
        v11 == obj))
  {
    objc_storeStrong((id *)&self->_startDate, v10);
    v10 = obj;
  }
  endDate = self->_endDate;
  p_endDate = &self->_endDate;
  v12 = endDate;
  if (!endDate
    || ([(NSDate *)v12 laterDate:obj],
        id v15 = (id)objc_claimAutoreleasedReturnValue(),
        v15,
        v10 = obj,
        v15 == obj))
  {
    objc_storeStrong((id *)p_endDate, v10);
  }
}

+ (id)yearMonthDayComponentsForDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  uint64_t v6 = [v5 components:28 fromDate:v4];

  return v6;
}

- (id)currentMetadata
{
  v2 = [[ATXCandidateRelevanceModelDataStoreDatasetMetadata alloc] initWithNumberOfPositiveSamples:self->_numberOfPositiveSamples numberOfSamples:self->_numberOfSamples numberOfDaysWithPositiveSamples:[(NSMutableSet *)self->_seenDatesWithPositiveSamples count] numberOfDaysWithSamples:[(NSMutableSet *)self->_seenDatesWithSamples count] startDate:self->_startDate endDate:self->_endDate];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_seenDatesWithSamples, 0);
  objc_storeStrong((id *)&self->_seenDatesWithPositiveSamples, 0);
}

@end