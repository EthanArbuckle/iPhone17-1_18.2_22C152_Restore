@interface HKCountCurrentValueDataProvider
- (HKCountCurrentValueDataProvider)initWithHealthStore:(id)a3 updateController:(id)a4 dateCache:(id)a5 displayType:(id)a6 countStyle:(int64_t)a7;
- (id)_countAllSamplesQueryWithCompletion:(id)a3;
- (id)_dataProviderValueForCount:(id)a3 sampleDate:(id)a4;
- (id)_mostRecentValueQueryWithCompletion:(id)a3;
- (id)fetchOperationWithCompletion:(id)a3;
- (int64_t)countStyle;
- (void)_countFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
- (void)_dataProviderValueFromMostRecentSample:(id)a3 completion:(id)a4;
@end

@implementation HKCountCurrentValueDataProvider

- (HKCountCurrentValueDataProvider)initWithHealthStore:(id)a3 updateController:(id)a4 dateCache:(id)a5 displayType:(id)a6 countStyle:(int64_t)a7
{
  v9.receiver = self;
  v9.super_class = (Class)HKCountCurrentValueDataProvider;
  result = [(HKValueDataProvider *)&v9 initWithHealthStore:a3 updateController:a4 dateCache:a5 displayType:a6];
  if (result) {
    result->_countStyle = a7;
  }
  return result;
}

- (id)fetchOperationWithCompletion:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HKValueDataProvider *)self healthStore];
  v6 = NSString;
  v7 = [(HKValueDataProvider *)self displayType];
  v8 = [v7 localization];
  objc_super v9 = [v8 displayName];
  v10 = [v6 stringWithFormat:@"CurrentValueCount(%@)", v9];

  v11 = [[HKHealthQueryFetchOperation alloc] initWithHealthStore:v5 operationDescription:v10 completion:v4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HKCountCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6D534A8;
  id v23 = v4;
  v12 = v11;
  v22 = v12;
  id v13 = v4;
  v14 = _Block_copy(aBlock);
  int64_t v15 = [(HKCountCurrentValueDataProvider *)self countStyle];
  if (v15 == 1)
  {
    uint64_t v16 = [(HKCountCurrentValueDataProvider *)self _countAllSamplesQueryWithCompletion:v14];
  }
  else
  {
    if (v15)
    {
      v17 = 0;
      goto LABEL_7;
    }
    uint64_t v16 = [(HKCountCurrentValueDataProvider *)self _mostRecentValueQueryWithCompletion:v14];
  }
  v17 = (void *)v16;
LABEL_7:
  v24[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [(HKHealthQueryFetchOperation *)v12 setQueries:v18];

  v19 = v12;
  return v19;
}

void __64__HKCountCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7 = *(void (**)(uint64_t, uint64_t, id, id))(v5 + 16);
  id v8 = a3;
  id v9 = a2;
  v7(v5, v6, v9, v8);
  [*(id *)(a1 + 32) completedWithResults:v9 error:v8];
}

- (id)_mostRecentValueQueryWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HKValueDataProvider *)self displayType];
  uint64_t v6 = [v5 sampleType];

  v7 = (void *)MEMORY[0x1E4F2B0B8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__HKCountCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke;
  v11[3] = &unk_1E6D534D0;
  v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v7 queryForMostRecentSampleOfType:v6 predicate:0 completion:v11];

  return v9;
}

uint64_t __71__HKCountCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) _dataProviderValueFromMostRecentSample:a2 completion:*(void *)(a1 + 40)];
  }
}

- (void)_dataProviderValueFromMostRecentSample:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = [a3 endDate];
    id v8 = HKCalendarDateTransformNone();
    id v9 = HKStartOfRollingDayForDate(v7, v8);

    v10 = HKEndOfRollingDayWithStart(v9);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__HKCountCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke;
    v13[3] = &unk_1E6D534F8;
    id v14 = v7;
    id v15 = v6;
    v13[4] = self;
    id v11 = v7;
    [(HKCountCurrentValueDataProvider *)self _countFromDate:v9 toDate:v10 completion:v13];
  }
  else
  {
    id v12 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
    (*((void (**)(id, HKDataProviderNoDataCurrentValue *, void))v6 + 2))(v6, v12, 0);
  }
}

void __85__HKCountCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1[5];
  uint64_t v4 = a1[6];
  id v6 = (void *)a1[4];
  id v7 = a3;
  id v8 = [v6 _dataProviderValueForCount:a2 sampleDate:v5];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v7);
}

- (id)_dataProviderValueForCount:(id)a3 sampleDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [[HKGenericDataProviderCurrentValue alloc] initWithValue:v5];
    [(HKGenericDataProviderCurrentValue *)v7 setDate:v6];
  }
  else
  {
    id v7 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  }

  return v7;
}

- (void)_countFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HKValueDataProvider *)self displayType];
  id v12 = [v11 defaultValuePredicate];

  id v13 = [MEMORY[0x1E4F2B3C0] predicateForSamplesWithStartDate:v10 endDate:v9 options:0];

  id v14 = objc_alloc(MEMORY[0x1E4F2B440]);
  id v15 = [(HKValueDataProvider *)self displayType];
  uint64_t v16 = [v15 sampleType];
  v17 = HKUIPredicateMatchingPredicates(v12, v13);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__HKCountCurrentValueDataProvider__countFromDate_toDate_completion___block_invoke;
  v21[3] = &unk_1E6D53520;
  id v22 = v8;
  id v18 = v8;
  v19 = (void *)[v14 initWithSampleType:v16 predicate:v17 limit:0 sortDescriptors:0 resultsHandler:v21];

  v20 = [(HKValueDataProvider *)self healthStore];
  [v20 executeQuery:v19];
}

void __68__HKCountCurrentValueDataProvider__countFromDate_toDate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    id v6 = NSNumber;
    id v7 = a4;
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    id v8 = *(void (**)(uint64_t, void))(v4 + 16);
    id v9 = a4;
    v8(v4, 0);
  }
}

- (id)_countAllSamplesQueryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HKValueDataProvider *)self displayType];
  id v6 = [v5 defaultValuePredicate];

  id v7 = [(HKValueDataProvider *)self displayType];
  id v8 = [v7 sampleType];

  id v9 = objc_alloc(MEMORY[0x1E4F2B428]);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __71__HKCountCurrentValueDataProvider__countAllSamplesQueryWithCompletion___block_invoke;
  v14[3] = &unk_1E6D53548;
  id v15 = v8;
  uint64_t v16 = self;
  id v17 = v4;
  id v10 = v4;
  id v11 = v8;
  id v12 = (void *)[v9 initWithSampleType:v11 predicate:v6 resultsHandler:v14];

  return v12;
}

void __71__HKCountCurrentValueDataProvider__countAllSamplesQueryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = a4;
    id v11 = [a3 objectForKeyedSubscript:v6];
    id v8 = objc_msgSend(*(id *)(a1 + 40), "_dataProviderValueForCount:sampleDate:");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = *(void (**)(uint64_t, void))(v9 + 16);
    id v11 = a4;
    v10(v9, 0);
  }
}

- (int64_t)countStyle
{
  return self->_countStyle;
}

@end