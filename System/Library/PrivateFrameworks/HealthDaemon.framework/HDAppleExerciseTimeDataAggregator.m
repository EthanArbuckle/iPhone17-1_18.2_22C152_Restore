@interface HDAppleExerciseTimeDataAggregator
- (Class)sensorDatumClass;
- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4;
- (id)objectType;
@end

@implementation HDAppleExerciseTimeDataAggregator

- (id)objectType
{
  return (id)[MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C8]];
}

- (Class)sensorDatumClass
{
  return (Class)objc_opt_class();
}

- (id)dataObjectsFromSensorDatum:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = [v7 quantity];
  if (!v8)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:self file:@"HDAppleExerciseTimeDataAggregator.m" lineNumber:37 description:@"Expected a quantity"];
  }
  v9 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A5C8]];
  v10 = [v9 canonicalUnit];
  char v11 = [v8 isCompatibleWithUnit:v10];

  if (v11)
  {
    v38 = v8;
    v12 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
    v13 = [v7 dateInterval];
    v14 = [v13 startDate];
    v15 = objc_msgSend(v12, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v14, 0, 0);

    v16 = [v7 dateInterval];
    v17 = [v16 startDate];
    id v39 = v7;
    v18 = [v7 dateInterval];
    v19 = [v18 endDate];
    v20 = [v12 components:64 fromDate:v17 toDate:v19 options:0];

    v37 = v20;
    uint64_t v21 = [v20 minute];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v23 = (void *)MEMORY[0x1E4F2B370];
    v24 = [MEMORY[0x1E4F2B618] minuteUnit];
    v25 = [v23 quantityWithUnit:v24 doubleValue:1.0];

    if (v21 >= 1)
    {
      uint64_t v26 = 0;
      do
      {
        v27 = [v12 dateByAddingUnit:64 value:v26 toDate:v15 options:0];
        v28 = [v12 dateByAddingUnit:64 value:++v26 toDate:v15 options:0];
        v29 = [MEMORY[0x1E4F2B388] quantitySampleWithType:v9 quantity:v25 startDate:v27 endDate:v28];
        [v22 addObject:v29];
      }
      while (v21 != v26);
    }

    v8 = v38;
    id v7 = v39;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E4F28C58];
    v31 = [v9 canonicalUnit];
    objc_msgSend(v30, "hk_assignError:code:format:", a4, 3, @"Invalid quantity type %@ (expected compatibility with %@)", v8, v31);

    _HKInitializeLogging();
    v32 = (void *)*MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_ERROR))
    {
      v34 = v32;
      v35 = [v9 canonicalUnit];
      *(_DWORD *)buf = 138478083;
      v41 = v8;
      __int16 v42 = 2114;
      v43 = v35;
      _os_log_error_impl(&dword_1BCB7D000, v34, OS_LOG_TYPE_ERROR, "Rejecting datum of unexpected quantity type %{private}@ (expected compatibility with %{public}@)", buf, 0x16u);
    }
    id v22 = 0;
  }

  return v22;
}

@end