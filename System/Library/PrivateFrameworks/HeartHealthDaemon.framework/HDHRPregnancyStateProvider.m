@interface HDHRPregnancyStateProvider
- (HDHRPregnancyStateProvider)initWithPregnancySampleProvider:(id)a3;
- (id)latestWashoutEndDateWithError:(id *)a3;
@end

@implementation HDHRPregnancyStateProvider

- (HDHRPregnancyStateProvider)initWithPregnancySampleProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHRPregnancyStateProvider;
  v6 = [(HDHRPregnancyStateProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pregnancySampleProvider, a3);
  }

  return v7;
}

- (id)latestWashoutEndDateWithError:(id *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  pregnancySampleProvider = self->_pregnancySampleProvider;
  id v24 = 0;
  v6 = [(HDHRPregnancySampleProviding *)pregnancySampleProvider getSamplesWithError:&v24];
  id v7 = v24;
  if (!v7)
  {
    v8 = [v6 firstObject];
    objc_super v9 = v8;
    if (!v8)
    {
      _HKInitializeLogging();
      v18 = *MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v26 = self;
        _os_log_impl(&dword_1D3AC6000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] No samples found.", buf, 0xCu);
      }
      goto LABEL_17;
    }
    v10 = [v8 endDate];
    v11 = [MEMORY[0x1E4F1C9C8] distantFuture];

    if (v10 == v11)
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:
        v19 = v16;
        v20 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543618;
        v26 = self;
        __int16 v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_1D3AC6000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] %@", buf, 0x16u);
      }
    }
    else
    {
      v12 = [v9 endDate];
      v13 = [v9 startDate];
      [v12 timeIntervalSinceDate:v13];
      double v15 = v14;

      if (v15 >= 12096000.0)
      {
        v22 = (void *)MEMORY[0x1E4F1C9C8];
        v23 = [v9 endDate];
        v17 = [v22 dateWithTimeInterval:v23 sinceDate:7257600.0];

        goto LABEL_18;
      }
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x1E4F29F50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
    }
LABEL_17:
    v17 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (a3) {
    *a3 = v7;
  }
  else {
    _HKLogDroppedError();
  }
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F50], OS_LOG_TYPE_ERROR)) {
    -[HDHRPregnancyStateProvider latestWashoutEndDateWithError:]();
  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (void).cxx_destruct
{
}

- (void)latestWashoutEndDateWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_1D3AC6000, v0, v1, "[%{public}@] Failed to get samples with error: %{public}@");
}

@end