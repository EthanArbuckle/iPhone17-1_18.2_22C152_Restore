@interface HKAnalyticsDataSource
- (HKAnalyticsDataSource)initWithHealthDataSource:(id)a3;
- (HKAnalyticsEnvironmentDataSource)environmentDataSource;
- (HKAnalyticsHealthDataSource)healthDataSource;
- (HKAnalyticsHealthDataSource)strongHealthDataSource;
- (HKAnalyticsHealthDataSource)weakHealthDataSource;
- (void)healthDataSource;
@end

@implementation HKAnalyticsDataSource

- (HKAnalyticsDataSource)initWithHealthDataSource:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKAnalyticsDataSource;
  v5 = [(HKAnalyticsDataSource *)&v13 init];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    p_weakHealthDataSource = (id *)&v5->_weakHealthDataSource;
    if (isKindOfClass)
    {
      objc_storeWeak(p_weakHealthDataSource, 0);
      v8 = (HKAnalyticsHealthDataSource *)v4;
    }
    else
    {
      objc_storeWeak(p_weakHealthDataSource, v4);
      v8 = 0;
    }
    strongHealthDataSource = v5->_strongHealthDataSource;
    v5->_strongHealthDataSource = v8;

    v10 = objc_alloc_init(HKAnalyticsEnvironmentDataSource);
    environmentDataSource = v5->_environmentDataSource;
    v5->_environmentDataSource = v10;
  }
  return v5;
}

- (HKAnalyticsHealthDataSource)healthDataSource
{
  WeakRetained = (HKAnalyticsHealthDataSource *)objc_loadWeakRetained((id *)&self->_weakHealthDataSource);
  strongHealthDataSource = WeakRetained;
  if (WeakRetained || (strongHealthDataSource = self->_strongHealthDataSource) != 0)
  {
    v5 = strongHealthDataSource;
  }
  else
  {
    _HKInitializeLogging();
    v7 = HKLogInfrastructure();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(HKAnalyticsDataSource *)(uint64_t)self healthDataSource];
    }

    v5 = 0;
  }

  return v5;
}

- (HKAnalyticsEnvironmentDataSource)environmentDataSource
{
  return self->_environmentDataSource;
}

- (HKAnalyticsHealthDataSource)weakHealthDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakHealthDataSource);

  return (HKAnalyticsHealthDataSource *)WeakRetained;
}

- (HKAnalyticsHealthDataSource)strongHealthDataSource
{
  return self->_strongHealthDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongHealthDataSource, 0);
  objc_destroyWeak((id *)&self->_weakHealthDataSource);

  objc_storeStrong((id *)&self->_environmentDataSource, 0);
}

- (void)healthDataSource
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "[%{public}@]: Health data source is nil", (uint8_t *)&v4, 0xCu);
}

@end