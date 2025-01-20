@interface HDMobilityAnalyticsUtilities
+ (id)ageWithProfile:(id)a3 date:(id)a4 error:(id *)a5;
+ (id)biologicalSexWithProfile:(id)a3 error:(id *)a4;
@end

@implementation HDMobilityAnalyticsUtilities

+ (id)ageWithProfile:(id)a3 date:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = (void *)MEMORY[0x263F0A598];
  uint64_t v10 = *MEMORY[0x263F09468];
  id v11 = a3;
  v12 = [v9 characteristicTypeForIdentifier:v10];
  v13 = [v11 userCharacteristicsManager];

  id v21 = 0;
  v14 = [v13 userCharacteristicForType:v12 error:&v21];
  id v15 = v21;

  if (v14)
  {
    v16 = [MEMORY[0x263F452B0] yearsBetweenStartDateComponents:v14 endDate:v8];
    if (!v16)
    {
      _HKInitializeLogging();
      v17 = *MEMORY[0x263F09940];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
        +[HDMobilityAnalyticsUtilities ageWithProfile:date:error:]((uint64_t)a1, v17);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_ERROR)) {
      +[HDMobilityAnalyticsUtilities ageWithProfile:date:error:]((uint64_t)a1, (uint64_t)v15, v18);
    }
    id v19 = v15;
    if (v19)
    {
      if (a5) {
        *a5 = v19;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v16 = 0;
  }

  return v16;
}

+ (id)biologicalSexWithProfile:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v6 = (void *)MEMORY[0x263F0A168];
  uint64_t v7 = *MEMORY[0x263F09458];
  id v8 = a3;
  v9 = [v6 characteristicTypeForIdentifier:v7];
  uint64_t v10 = [v8 userCharacteristicsManager];

  id v17 = 0;
  id v11 = [v10 userCharacteristicForType:v9 error:&v17];
  id v12 = v17;

  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x263F09940];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09940], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = a1;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl(&dword_221A40000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Unable to retrieve biological sex, returning not set: %{public}@", buf, 0x16u);
    }
    id v15 = v12;
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v13 = &unk_26D3F9750;
  }

  return v13;
}

+ (void)ageWithProfile:(uint64_t)a1 date:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_221A40000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to read date of birth with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

+ (void)ageWithProfile:(uint64_t)a1 date:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221A40000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to convert date of birth to a date", (uint8_t *)&v2, 0xCu);
}

@end