@interface _ActivitySourceDelegateSharing
- (NSCalendar)calendar;
- (NSDictionary)timescopeToSummariesTable;
- (_ActivitySourceDelegateSharing)initWithTimescopeToSummariesTable:(id)a3 activityValue:(int64_t)a4 displayTypeController:(id)a5 unitPreferenceController:(id)a6 calendar:(id)a7;
- (id)_filterSummaries:(id)a3 dateRange:(id)a4;
- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4;
- (void)setCalendar:(id)a3;
- (void)setTimescopeToSummariesTable:(id)a3;
@end

@implementation _ActivitySourceDelegateSharing

- (_ActivitySourceDelegateSharing)initWithTimescopeToSummariesTable:(id)a3 activityValue:(int64_t)a4 displayTypeController:(id)a5 unitPreferenceController:(id)a6 calendar:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)_ActivitySourceDelegateSharing;
  v15 = [(_ActivitySourceDelegate *)&v18 initWithActivityValue:a4 displayTypeController:a5 unitPreferenceController:a6];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_timescopeToSummariesTable, a3);
    objc_storeStrong((id *)&v16->_calendar, a7);
  }

  return v16;
}

- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  v7 = [(_ActivitySourceDelegateSharing *)self timescopeToSummariesTable];
  v8 = [NSNumber numberWithInteger:a4];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    v10 = [(_ActivitySourceDelegateSharing *)self _filterSummaries:v9 dateRange:v6];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (id)_filterSummaries:(id)a3 dateRange:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61___ActivitySourceDelegateSharing__filterSummaries_dateRange___block_invoke;
  v10[3] = &unk_1E6D55AA0;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  v8 = objc_msgSend(a3, "hk_filter:", v10);

  return v8;
}

- (NSDictionary)timescopeToSummariesTable
{
  return self->_timescopeToSummariesTable;
}

- (void)setTimescopeToSummariesTable:(id)a3
{
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_timescopeToSummariesTable, 0);
}

@end