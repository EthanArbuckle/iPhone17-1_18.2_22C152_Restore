@interface HDStatisticsCollectionCalculatorDefaultDataSource(HealthHearingDaemon)
- (id)hearing_addQuantitySamples:()HealthHearingDaemon calculator:error:;
@end

@implementation HDStatisticsCollectionCalculatorDefaultDataSource(HealthHearingDaemon)

- (id)hearing_addQuantitySamples:()HealthHearingDaemon calculator:error:
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 count])
  {
    v18 = +[HDHeadphoneExposureStatisticUpdateResult resultForEmptySamplesAdded];
    goto LABEL_19;
  }
  id v26 = 0;
  uint64_t v10 = 1;
  char v11 = [a1 addValuesForQuantitySamples:v8 calculator:v9 includeSeries:1 error:&v26];
  id v12 = v26;
  id v13 = v12;
  if (v11) {
    goto LABEL_17;
  }
  int v14 = objc_msgSend(v12, "hearing_isExpectedError");
  _HKInitializeLogging();
  v15 = (os_log_t *)MEMORY[0x263F09910];
  v16 = (void *)*MEMORY[0x263F09910];
  v17 = *MEMORY[0x263F09910];
  if (v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[HDStatisticsCollectionCalculatorDefaultDataSource(HealthHearingDaemon) hearing_addQuantitySamples:calculator:error:](v16, v8);
    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    -[HDStatisticsCollectionCalculatorDefaultDataSource(HealthHearingDaemon) hearing_addQuantitySamples:calculator:error:](v16, v8);
  }
  if ((objc_msgSend(v13, "hearing_isExpectedError") & 1) == 0)
  {
    v19 = [v9 dateInterval];
    [v9 setDateInterval:v19];

    _HKInitializeLogging();
    v20 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22615C000, v20, OS_LOG_TYPE_DEFAULT, "Attempted recovery by reseting calculator.", buf, 2u);
    }

    id v24 = 0;
    uint64_t v10 = 1;
    char v21 = [a1 addValuesForQuantitySamples:v8 calculator:v9 includeSeries:1 error:&v24];
    id v13 = v24;
    if (v21) {
      goto LABEL_17;
    }
    _HKInitializeLogging();
    v22 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR)) {
      -[HDStatisticsCollectionCalculatorDefaultDataSource(HealthHearingDaemon) hearing_addQuantitySamples:calculator:error:]((uint64_t)v13, v22);
    }
  }
  if (![a1 addValuesForQuantitySamples:v8 calculator:v9 includeSeries:0 error:a5])
  {
    v18 = 0;
    goto LABEL_18;
  }
  uint64_t v10 = 0;
LABEL_17:
  v18 = +[HDHeadphoneExposureStatisticUpdateResult resultForSamplesAdded:v8 includedSeries:v10];
LABEL_18:

LABEL_19:
  return v18;
}

- (void)hearing_addQuantitySamples:()HealthHearingDaemon calculator:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22615C000, a2, OS_LOG_TYPE_ERROR, "Still unable to update calculator including series: %{public}@.", (uint8_t *)&v2, 0xCu);
}

- (void)hearing_addQuantitySamples:()HealthHearingDaemon calculator:error:.cold.2(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_22615C000, v3, OS_LOG_TYPE_ERROR, "Unable to append samples (%ld) to calculator due to error: %{public}@.", v4, 0x16u);
}

- (void)hearing_addQuantitySamples:()HealthHearingDaemon calculator:error:.cold.3(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_22615C000, v3, OS_LOG_TYPE_FAULT, "Unable to append samples (%ld) to calculator due to error: %{public}@.", v4, 0x16u);
}

@end