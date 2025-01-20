@interface EKConflictDetails
+ (double)_maxRangeLengthForRule:(id)a3;
+ (id)_dateRangeToScanForConflictsForEvent:(id)a3 dateForNow:(id)a4;
+ (id)dateRangeToScanForConflictsForEvent:(id)a3;
+ (id)infoWithConflicts:(int64_t)a3 needsAction:(int64_t)a4 event:(id)a5;
+ (id)infoWithConflictsInSeries:(int64_t)a3 outOf:(int64_t)a4 withPeriod:(id)a5 conflictingDates:(id)a6;
- (CalDateRange)conflictPeriodForSeries;
- (EKConflictDetails)initWithConflictingDates:(id)a3 conflictingEvents:(id)a4 needsActionEvents:(id)a5 totalOccurrencesInSeries:(unint64_t)a6 conflictPeriodForSeries:(id)a7;
- (NSArray)conflictingDates;
- (NSArray)conflictingEvents;
- (NSArray)needsActionEvents;
- (id)description;
- (unint64_t)totalConflictingEvents;
- (unint64_t)totalConflictsInSeries;
- (unint64_t)totalNeedsActionEvents;
- (unint64_t)totalOccurrencesInSeries;
- (void)setConflictPeriodForSeries:(id)a3;
- (void)setConflictingDates:(id)a3;
- (void)setConflictingEvents:(id)a3;
- (void)setNeedsActionEvents:(id)a3;
- (void)setTotalConflictingEvents:(unint64_t)a3;
- (void)setTotalConflictsInSeries:(unint64_t)a3;
- (void)setTotalNeedsActionEvents:(unint64_t)a3;
- (void)setTotalOccurrencesInSeries:(unint64_t)a3;
@end

@implementation EKConflictDetails

+ (id)infoWithConflictsInSeries:(int64_t)a3 outOf:(int64_t)a4 withPeriod:(id)a5 conflictingDates:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  v11 = objc_opt_new();
  [v11 setTotalOccurrencesInSeries:a4];
  [v11 setTotalConflictsInSeries:a3];
  [v11 setConflictPeriodForSeries:v10];

  [v11 setConflictingDates:v9];

  return v11;
}

+ (id)infoWithConflicts:(int64_t)a3 needsAction:(int64_t)a4 event:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = objc_opt_new();
  if (v7)
  {
    v16[0] = v7;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v8 setConflictingEvents:v9];

    id v15 = v7;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v8 setNeedsActionEvents:v10];

    v11 = [v7 startDate];
    v14 = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v8 setConflictingDates:v12];
  }
  [v8 setTotalConflictingEvents:a3];
  [v8 setTotalNeedsActionEvents:a4];
  [v8 setTotalOccurrencesInSeries:1];
  [v8 setTotalConflictsInSeries:1];

  return v8;
}

- (EKConflictDetails)initWithConflictingDates:(id)a3 conflictingEvents:(id)a4 needsActionEvents:(id)a5 totalOccurrencesInSeries:(unint64_t)a6 conflictPeriodForSeries:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)EKConflictDetails;
  v17 = [(EKConflictDetails *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_conflictingDates, a3);
    objc_storeStrong((id *)&v18->_conflictingEvents, a4);
    objc_storeStrong((id *)&v18->_needsActionEvents, a5);
    v18->_totalOccurrencesInSeries = a6;
    objc_storeStrong((id *)&v18->_conflictPeriodForSeries, a7);
    v18->_totalConflictsInSeries = [v13 count];
    v18->_totalConflictingEvents = [v14 count];
    v18->_totalNeedsActionEvents = [v15 count];
  }

  return v18;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; Conflicts: %lu Out of total: %lu>",
               objc_opt_class(),
               self,
               [(EKConflictDetails *)self totalConflictsInSeries],
               [(EKConflictDetails *)self totalOccurrencesInSeries]);
}

+ (id)dateRangeToScanForConflictsForEvent:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v6 = [v4 date];
  id v7 = [a1 _dateRangeToScanForConflictsForEvent:v5 dateForNow:v6];

  return v7;
}

+ (id)_dateRangeToScanForConflictsForEvent:(id)a3 dateForNow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 recurrenceRules];
  id v9 = [v8 firstObject];

  id v10 = v7;
  v11 = [v6 endDateUnadjustedForLegacyClients];
  if ([v11 CalIsBeforeDate:v10])
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v6 startDate];
  }
  id v13 = v12;

  [a1 _maxRangeLengthForRule:v9];
  id v14 = objc_msgSend(MEMORY[0x1E4F576D0], "rangeWithStartDate:duration:", v13);

  return v14;
}

+ (double)_maxRangeLengthForRule:(id)a3
{
  id v3 = a3;
  v4 = v3;
  double v5 = 31536000.0;
  if (v3)
  {
    unint64_t v6 = [v3 frequency];
    if (v6 <= 2) {
      double v5 = dbl_1A4F90188[v6];
    }
  }

  return v5;
}

- (NSArray)conflictingDates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConflictingDates:(id)a3
{
}

- (NSArray)conflictingEvents
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConflictingEvents:(id)a3
{
}

- (NSArray)needsActionEvents
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNeedsActionEvents:(id)a3
{
}

- (unint64_t)totalOccurrencesInSeries
{
  return self->_totalOccurrencesInSeries;
}

- (void)setTotalOccurrencesInSeries:(unint64_t)a3
{
  self->_totalOccurrencesInSeries = a3;
}

- (unint64_t)totalConflictsInSeries
{
  return self->_totalConflictsInSeries;
}

- (void)setTotalConflictsInSeries:(unint64_t)a3
{
  self->_totalConflictsInSeries = a3;
}

- (unint64_t)totalConflictingEvents
{
  return self->_totalConflictingEvents;
}

- (void)setTotalConflictingEvents:(unint64_t)a3
{
  self->_totalConflictingEvents = a3;
}

- (unint64_t)totalNeedsActionEvents
{
  return self->_totalNeedsActionEvents;
}

- (void)setTotalNeedsActionEvents:(unint64_t)a3
{
  self->_totalNeedsActionEvents = a3;
}

- (CalDateRange)conflictPeriodForSeries
{
  return (CalDateRange *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConflictPeriodForSeries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictPeriodForSeries, 0);
  objc_storeStrong((id *)&self->_needsActionEvents, 0);
  objc_storeStrong((id *)&self->_conflictingEvents, 0);

  objc_storeStrong((id *)&self->_conflictingDates, 0);
}

@end