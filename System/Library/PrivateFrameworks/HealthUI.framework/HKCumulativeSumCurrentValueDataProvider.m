@interface HKCumulativeSumCurrentValueDataProvider
- (id)_mostRecentValueQueryWithCompletion:(id)a3;
- (id)fetchOperationWithCompletion:(id)a3;
- (void)_dataProviderValueFromMostRecentSample:(id)a3 completion:(id)a4;
- (void)_sumFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
@end

@implementation HKCumulativeSumCurrentValueDataProvider

- (id)fetchOperationWithCompletion:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HKValueDataProvider *)self healthStore];
  v6 = NSString;
  v7 = [(HKValueDataProvider *)self displayType];
  v8 = [v7 localization];
  v9 = [v8 displayName];
  v10 = [v6 stringWithFormat:@"MostRecentSum(%@)", v9];

  v11 = [[HKHealthQueryFetchOperation alloc] initWithHealthStore:v5 operationDescription:v10 completion:v4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__HKCumulativeSumCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke;
  v18[3] = &unk_1E6D534A8;
  id v20 = v4;
  v12 = v11;
  v19 = v12;
  id v13 = v4;
  v14 = [(HKCumulativeSumCurrentValueDataProvider *)self _mostRecentValueQueryWithCompletion:v18];
  v21[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [(HKHealthQueryFetchOperation *)v12 setQueries:v15];

  v16 = v12;
  return v16;
}

void __72__HKCumulativeSumCurrentValueDataProvider_fetchOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  v11[2] = __79__HKCumulativeSumCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke;
  v11[3] = &unk_1E6D534D0;
  v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  id v9 = [v7 queryForMostRecentSampleOfType:v6 predicate:0 completion:v11];

  return v9;
}

uint64_t __79__HKCumulativeSumCurrentValueDataProvider__mostRecentValueQueryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v13[2] = __93__HKCumulativeSumCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke;
    v13[3] = &unk_1E6D539D0;
    id v14 = v7;
    id v15 = v6;
    id v11 = v7;
    [(HKCumulativeSumCurrentValueDataProvider *)self _sumFromDate:v9 toDate:v10 completion:v13];
  }
  else
  {
    id v12 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
    (*((void (**)(id, HKDataProviderNoDataCurrentValue *, void))v6 + 2))(v6, v12, 0);
  }
}

void __93__HKCumulativeSumCurrentValueDataProvider__dataProviderValueFromMostRecentSample_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [a2 sumQuantity];
  if (v5)
  {
    id v6 = [[HKGenericQuantityDataProviderCurrentValue alloc] initWithQuantity:v5];
    [(HKGenericQuantityDataProviderCurrentValue *)v6 setDate:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_sumFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(HKValueDataProvider *)self displayType];
  id v12 = [v11 sampleType];
  id v13 = objc_alloc(MEMORY[0x1E4F2B5D0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__HKCumulativeSumCurrentValueDataProvider__sumFromDate_toDate_completion___block_invoke;
  v20[3] = &unk_1E6D539F8;
  id v21 = v8;
  id v14 = v8;
  id v15 = (void *)[v13 initWithQuantityType:v12 quantitySamplePredicate:0 options:16 completionHandler:v20];
  v16 = [(HKValueDataProvider *)self displayType];
  v17 = [v16 behavior];
  objc_msgSend(v15, "setMergeStrategy:", objc_msgSend(v17, "statisticsMergeStrategy"));

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 endDate:v9];
  [v15 _setDateInterval:v18];

  v19 = [(HKValueDataProvider *)self healthStore];
  [v19 executeQuery:v15];
}

uint64_t __74__HKCumulativeSumCurrentValueDataProvider__sumFromDate_toDate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end