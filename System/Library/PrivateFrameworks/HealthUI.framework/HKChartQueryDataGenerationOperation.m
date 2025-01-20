@interface HKChartQueryDataGenerationOperation
- (HKChartQueryDataGenerationOperation)initWithHealthStore:(id)a3 dataSource:(id)a4 startDate:(id)a5 endDate:(id)a6 statisticsInterval:(id)a7 operationDescription:(id)a8 completion:(id)a9;
- (void)completedWithResults:(id)a3 error:(id)a4;
- (void)startOperationWithCompletion:(id)a3;
- (void)stopOperation;
@end

@implementation HKChartQueryDataGenerationOperation

- (HKChartQueryDataGenerationOperation)initWithHealthStore:(id)a3 dataSource:(id)a4 startDate:(id)a5 endDate:(id)a6 statisticsInterval:(id)a7 operationDescription:(id)a8 completion:(id)a9
{
  id v26 = a3;
  id v25 = a4;
  id v24 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)HKChartQueryDataGenerationOperation;
  v19 = [(HKFetchOperation *)&v27 initWithOperationDescription:a8];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_healthStore, a3);
    objc_storeStrong((id *)&v20->_dataSource, a4);
    objc_storeStrong((id *)&v20->_startDate, a5);
    objc_storeStrong((id *)&v20->_endDate, a6);
    objc_storeStrong((id *)&v20->_statisticsInterval, a7);
    v21 = _Block_copy(v18);
    id clientCompletion = v20->_clientCompletion;
    v20->_id clientCompletion = v21;
  }
  return v20;
}

- (void)startOperationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _Block_copy(v4);
  id fetchOperationManager = self->_fetchOperationManager;
  self->_id fetchOperationManager = v5;

  objc_initWeak(&location, self);
  objc_initWeak(&from, self->_dataSource);
  v7 = [[HKHealthQueryChartCacheQueryRequest alloc] initWithStartDate:self->_startDate endDate:self->_endDate statisticsInterval:self->_statisticsInterval];
  dataSource = self->_dataSource;
  healthStore = self->_healthStore;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__HKChartQueryDataGenerationOperation_startOperationWithCompletion___block_invoke;
  v12[3] = &unk_1E6D53DF8;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  v10 = [(HKHealthQueryChartCacheDataSource *)dataSource generateSharableQueryDataForRequest:v7 healthStore:healthStore completionHandler:v12];
  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = v10;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __68__HKChartQueryDataGenerationOperation_startOperationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__HKChartQueryDataGenerationOperation_startOperationWithCompletion___block_invoke_2;
  v9[3] = &unk_1E6D53DD0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v7 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = v6;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
}

void __68__HKChartQueryDataGenerationOperation_startOperationWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 56));
    v3 = [v2 chartPointsFromQueryData:*(void *)(a1 + 32) dataIsFromRemoteSource:0];
    [WeakRetained completedWithResults:v3 error:*(void *)(a1 + 40)];
  }
  else
  {
    [WeakRetained completedWithResults:0 error:*(void *)(a1 + 40)];
  }
}

- (void)stopOperation
{
  id cancelHandler = (void (**)(id, SEL))self->_cancelHandler;
  if (cancelHandler)
  {
    cancelHandler[2](cancelHandler, a2);
    id v4 = self->_cancelHandler;
    self->_id cancelHandler = 0;
  }
  id clientCompletion = self->_clientCompletion;
  self->_id clientCompletion = 0;

  id fetchOperationManager = self->_fetchOperationManager;
  self->_id fetchOperationManager = 0;
}

- (void)completedWithResults:(id)a3 error:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id clientCompletion = (void (**)(id, HKChartQueryDataGenerationOperation *, id, id))self->_clientCompletion;
  if (clientCompletion)
  {
    clientCompletion[2](clientCompletion, self, v12, v6);
    id v8 = self->_clientCompletion;
    self->_id clientCompletion = 0;
  }
  id fetchOperationManager = (void (**)(id, BOOL, id))self->_fetchOperationManager;
  if (fetchOperationManager)
  {
    fetchOperationManager[2](fetchOperationManager, v6 == 0, v6);
    id v10 = self->_fetchOperationManager;
    self->_id fetchOperationManager = 0;
  }
  id cancelHandler = self->_cancelHandler;
  self->_id cancelHandler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_fetchOperationManager, 0);
  objc_storeStrong(&self->_clientCompletion, 0);
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end