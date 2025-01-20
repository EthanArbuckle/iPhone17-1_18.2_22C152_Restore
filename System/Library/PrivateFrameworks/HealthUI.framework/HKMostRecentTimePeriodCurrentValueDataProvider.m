@interface HKMostRecentTimePeriodCurrentValueDataProvider
- (id)_mostRecentValueQueryWithCompletion:(id)a3;
- (id)_queryDateRangeFromSampleDate:(id)a3;
- (id)fetchOperationWithCompletion:(id)a3;
- (void)_dataProviderValueFromMostRecentSample:(id)a3 completion:(id)a4;
- (void)_totalDurationFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
@end

@implementation HKMostRecentTimePeriodCurrentValueDataProvider

- (id)fetchOperationWithCompletion:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HKValueDataProvider *)self healthStore];
  v6 = NSString;
  v7 = [(HKValueDataProvider *)self displayType];
  v8 = [v7 localization];
  v9 = [v8 displayName];
  v10 = [v6 stringWithFormat:@"MostRecentTimePeriod(%@)", v9];

  v11 = [[HKHealthQueryFetchOperation alloc] initWithHealthStore:v5 operationDescription:v10 completion:v4];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__HKMostRecentTimePeriodCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke;
  v17[3] = &unk_1E6D53728;
  v12 = v11;
  v18 = v12;
  v13 = [(HKMostRecentTimePeriodCurrentValueDataProvider *)self _mostRecentValueQueryWithCompletion:v17];
  v19[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [(HKHealthQueryFetchOperation *)v12 setQueries:v14];

  v15 = v12;
  return v15;
}

uint64_t __79__HKMostRecentTimePeriodCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completedWithResults:a2 error:a3];
}

- (id)_mostRecentValueQueryWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HKValueDataProvider *)self displayType];
  v6 = [v5 sampleType];

  v7 = [(HKValueDataProvider *)self displayType];
  v8 = [v7 defaultValuePredicate];

  v9 = (void *)MEMORY[0x1E4F2B0B8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__HKMostRecentTimePeriodCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke;
  v13[3] = &unk_1E6D534D0;
  v13[4] = self;
  id v14 = v4;
  id v10 = v4;
  v11 = [v9 queryForMostRecentSampleOfType:v6 predicate:v8 completion:v13];

  return v11;
}

uint64_t __86__HKMostRecentTimePeriodCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _dataProviderValueFromMostRecentSample:a2 completion:*(void *)(a1 + 40)];
  }
}

- (id)_queryDateRangeFromSampleDate:(id)a3
{
  id v4 = a3;
  v5 = [(HKValueDataProvider *)self displayType];
  v6 = objc_msgSend(v5, "hk_startOfDayTransform");

  v7 = HKStartOfRollingDayForDate(v4, v6);

  v8 = HKEndOfRollingDayWithStart(v7);
  v9 = [(HKValueDataProvider *)self dateCache];
  id v10 = [v9 startOfRollingDay:v6];

  v11 = [(HKValueDataProvider *)self dateCache];
  v12 = [v11 endOfRollingDay:v6];

  v13 = HKUIObjectMin(v10, v7);

  id v14 = HKUIObjectMin(v12, v8);

  v15 = +[HKValueRange valueRangeWithMinValue:v13 maxValue:v14];

  return v15;
}

- (void)_dataProviderValueFromMostRecentSample:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = [a3 endDate];
    v8 = [(HKMostRecentTimePeriodCurrentValueDataProvider *)self _queryDateRangeFromSampleDate:v7];
    v9 = [(HKDataProviderNoDataCurrentValue *)v8 minValue];
    id v10 = [(HKDataProviderNoDataCurrentValue *)v8 maxValue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __100__HKMostRecentTimePeriodCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke;
    v12[3] = &unk_1E6D53750;
    id v13 = v7;
    id v14 = v6;
    id v11 = v7;
    [(HKMostRecentTimePeriodCurrentValueDataProvider *)self _totalDurationFromDate:v9 toDate:v10 completion:v12];
  }
  else
  {
    v8 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
    (*((void (**)(id, HKDataProviderNoDataCurrentValue *, void))v6 + 2))(v6, v8, 0);
  }
}

void __100__HKMostRecentTimePeriodCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  if (v8)
  {
    v7 = [[HKGenericDataProviderCurrentValue alloc] initWithValue:v8];
    [(HKGenericDataProviderCurrentValue *)v7 setDate:*(void *)(a1 + 32)];
  }
  else
  {
    v7 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_totalDurationFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A9B8] ascending:1];
  id v11 = [(HKValueDataProvider *)self displayType];
  v25 = [v11 defaultValuePredicate];

  v12 = [MEMORY[0x1E4F2B3C0] predicateForSamplesWithStartDate:v8 endDate:v9 options:0];
  id v13 = objc_alloc(MEMORY[0x1E4F2B440]);
  id v14 = [(HKValueDataProvider *)self displayType];
  v15 = [v14 sampleType];
  v16 = v12;
  v17 = HKUIPredicateMatchingPredicates(v25, v12);
  v30[0] = v24;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __91__HKMostRecentTimePeriodCurrentValueDataProvider__totalDurationFromDate_toDate_completion___block_invoke;
  v26[3] = &unk_1E6D51368;
  id v27 = v8;
  id v28 = v9;
  id v29 = v10;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  v22 = (void *)[v13 initWithSampleType:v15 predicate:v17 limit:0 sortDescriptors:v18 resultsHandler:v26];

  v23 = [(HKValueDataProvider *)self healthStore];
  [v23 executeQuery:v22];
}

void __91__HKMostRecentTimePeriodCurrentValueDataProvider__totalDurationFromDate_toDate_completion___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id v6 = [MEMORY[0x1E4F2B958] coalesceTimePeriodsFromSamples:a3 strictStartDate:a1[4] strictEndDate:a1[5]];
  [MEMORY[0x1E4F2B958] totalDurationFromCoalescedDateIntervals:v6];
  uint64_t v7 = a1[6];
  if (v8 <= 0.0)
  {
    (*(void (**)(uint64_t, void, void, id))(v7 + 16))(v7, 0, 0, v10);
  }
  else
  {
    id v9 = objc_msgSend(NSNumber, "numberWithDouble:");
    (*(void (**)(uint64_t, void *, void, id))(v7 + 16))(v7, v9, 0, v10);
  }
}

@end