@interface HDWorkoutBuilderStatisticsDataSource
- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7;
- (BOOL)enabled;
- (HDProfile)profile;
- (HDWorkoutBuilderEntity)builderEntity;
- (HDWorkoutBuilderStatisticsDataSource)init;
- (HDWorkoutBuilderStatisticsDataSource)initWithProfile:(id)a3 quantityType:(id)a4 builderEntity:(id)a5;
- (HKQuantityType)quantityType;
- (void)setEnabled:(BOOL)a3;
@end

@implementation HDWorkoutBuilderStatisticsDataSource

- (HDWorkoutBuilderStatisticsDataSource)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDWorkoutBuilderStatisticsDataSource)initWithProfile:(id)a3 quantityType:(id)a4 builderEntity:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDWorkoutBuilderStatisticsDataSource;
  v11 = [(HDWorkoutBuilderStatisticsDataSource *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    uint64_t v13 = [v9 copy];
    quantityType = v12->_quantityType;
    v12->_quantityType = (HKQuantityType *)v13;

    objc_storeStrong((id *)&v12->_builderEntity, a5);
    v12->_enabled = 1;
  }

  return v12;
}

- (BOOL)collectionCalculator:(id)a3 queryForInterval:(id)a4 error:(id *)a5 sampleHandler:(id)a6 mergeHandler:(id)a7
{
  id v10 = a4;
  id v11 = a6;
  if (self->_enabled)
  {
    quantityType = self->_quantityType;
    builderEntity = self->_builderEntity;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __111__HDWorkoutBuilderStatisticsDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke;
    v17[3] = &unk_1E62F9180;
    id v18 = v11;
    BOOL v15 = [(HDWorkoutBuilderEntity *)builderEntity enumerateAssociatedSampleValuesOfType:quantityType interval:v10 profile:WeakRetained error:a5 sampleHandler:v17];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 100, @"Data source is disabled.");
    BOOL v15 = 0;
  }

  return v15;
}

uint64_t __111__HDWorkoutBuilderStatisticsDataSource_collectionCalculator_queryForInterval_error_sampleHandler_mergeHandler___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  return (*(uint64_t (**)(double, double, double))(*(void *)(a1 + 32) + 16))(a4, a5, a6);
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (HDWorkoutBuilderEntity)builderEntity
{
  return self->_builderEntity;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builderEntity, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end