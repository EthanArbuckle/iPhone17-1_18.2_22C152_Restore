@interface HDStatisticsCollectionCalculatorRelativeDataSource
- (BOOL)_shouldContinueWithError:(id *)a3;
- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7;
- (HDProfile)profile;
- (HKRollingBaselineConfiguration)configuration;
- (double)_queryPrefetchWindowForQuantityTypeIdentifier:(id)a3;
- (id)initForProfile:(id)a3 quantityType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6 configuration:(id)a7 currentDate:(id)a8;
- (id)maxRowID;
- (id)restrictedSourceEntities;
- (id)shouldContinueHandler;
- (void)setRestrictedSourceEntities:(id)a3;
- (void)setShouldContinueHandler:(id)a3;
@end

@implementation HDStatisticsCollectionCalculatorRelativeDataSource

- (id)initForProfile:(id)a3 quantityType:(id)a4 predicate:(id)a5 restrictedSourceEntities:(id)a6 configuration:(id)a7 currentDate:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HDStatisticsCollectionCalculatorRelativeDataSource;
  v20 = [(HDStatisticsCollectionCalculatorRelativeDataSource *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_profile, v14);
    objc_storeStrong((id *)&v21->_configuration, a7);
    objc_storeStrong((id *)&v21->_currentDate, a8);
    v22 = [[HDStatisticsCollectionCalculatorDefaultDataSource alloc] initForProfile:v14 quantityType:v15 predicate:v16 restrictedSourceEntities:v17];
    defaultDataSource = v21->_defaultDataSource;
    v21->_defaultDataSource = v22;
  }
  return v21;
}

- (id)restrictedSourceEntities
{
  return [(HDStatisticsCollectionCalculatorDefaultDataSource *)self->_defaultDataSource restrictedSourceEntities];
}

- (void)setRestrictedSourceEntities:(id)a3
{
}

- (id)maxRowID
{
  return [(HDStatisticsCollectionCalculatorDefaultDataSource *)self->_defaultDataSource maxRowID];
}

- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)self->_defaultDataSource quantityType];
  id v17 = [v16 identifier];
  [(HDStatisticsCollectionCalculatorRelativeDataSource *)self _queryPrefetchWindowForQuantityTypeIdentifier:v17];
  double v19 = v18;

  v20 = [HDRollingBaselineRelativeDataSource alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v22 = [(HDStatisticsCollectionCalculatorDefaultDataSource *)self->_defaultDataSource quantityType];
  v23 = [(HDRollingBaselineRelativeDataSource *)v20 initWithProfile:WeakRetained quantityType:v22 configuration:self->_configuration queryPrefetchWindow:self->_currentDate currentDate:v19];

  [(HDRollingBaselineRelativeDataSource *)v23 setShouldContinueHandler:self->_shouldContinueHandler];
  defaultDataSource = self->_defaultDataSource;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __125__HDStatisticsCollectionCalculatorRelativeDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke;
  v31[3] = &unk_1E63033A8;
  objc_super v25 = v23;
  v32 = v25;
  id v26 = v14;
  v33 = self;
  id v34 = v26;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __125__HDStatisticsCollectionCalculatorRelativeDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2;
  v29[3] = &unk_1E63033D0;
  id v27 = v15;
  id v30 = v27;
  LOBYTE(a5) = [(HDStatisticsCollectionCalculatorDefaultDataSource *)defaultDataSource collectionCalculator:v12 queryForInterval:v13 error:a5 sampleHandler:v31 mergeHandler:v29];

  return (char)a5;
}

uint64_t __125__HDStatisticsCollectionCalculatorRelativeDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7)
{
  v11 = *(void **)(a1 + 32);
  *(double *)id v17 = a5;
  *(double *)&v17[1] = a6;
  *(double *)&v17[2] = a7;
  v17[3] = a2;
  __int16 v18 = 1;
  id v12 = objc_msgSend(v11, "computeRelativeValueForSample:error:", v17);
  id v13 = v12;
  if (v12
    && (uint64_t v14 = *(void *)(a1 + 48),
        [v12 doubleValue],
        (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 16))(v14, a2, a3, a4)))
  {
    uint64_t v15 = [*(id *)(a1 + 40) _shouldContinueWithError:a4];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __125__HDStatisticsCollectionCalculatorRelativeDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)_queryPrefetchWindowForQuantityTypeIdentifier:(id)a3
{
  return 2592000.0;
}

- (BOOL)_shouldContinueWithError:(id *)a3
{
  shouldContinueHandler = (uint64_t (**)(id, id *))self->_shouldContinueHandler;
  if (shouldContinueHandler) {
    return shouldContinueHandler[2](shouldContinueHandler, a3);
  }
  else {
    return 1;
  }
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HKRollingBaselineConfiguration)configuration
{
  return self->_configuration;
}

- (id)shouldContinueHandler
{
  return self->_shouldContinueHandler;
}

- (void)setShouldContinueHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_shouldContinueHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_currentDate, 0);

  objc_storeStrong((id *)&self->_defaultDataSource, 0);
}

@end