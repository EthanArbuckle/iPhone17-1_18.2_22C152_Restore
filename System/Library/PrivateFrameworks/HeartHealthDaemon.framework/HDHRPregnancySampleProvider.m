@interface HDHRPregnancySampleProvider
- (HDHRPregnancySampleProvider)initWithProfile:(id)a3;
- (id)getSamplesWithError:(id *)a3;
@end

@implementation HDHRPregnancySampleProvider

- (HDHRPregnancySampleProvider)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDHRPregnancySampleProvider;
  v5 = [(HDHRPregnancySampleProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (id)getSamplesWithError:(id *)a3
{
  v5 = [MEMORY[0x1E4F2B2C0] pregnancyType];
  v6 = (void *)MEMORY[0x1E4F65BE8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v13 = 0;
  id v8 = [v6 samplesWithType:v5 profile:WeakRetained encodingOptions:0 predicate:0 limit:0 anchor:0 error:&v13];
  id v9 = v13;

  if (v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_ERROR)) {
      -[HDHRPregnancySampleProvider getSamplesWithError:]();
    }
    if (a3)
    {
      v10 = 0;
      *a3 = v9;
    }
    else
    {
      _HKLogDroppedError();
      v10 = 0;
    }
  }
  else
  {
    v11 = [v8 sortedArrayUsingComparator:&__block_literal_global_8];

    id v8 = v11;
    v10 = v8;
  }

  return v10;
}

BOOL __51__HDHRPregnancySampleProvider_getSamplesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 startDate];
  v6 = [v4 startDate];

  return v5 > v6;
}

- (void).cxx_destruct
{
}

- (void)getSamplesWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Could not fetch pregnancy samples with error: %{public}@");
}

@end