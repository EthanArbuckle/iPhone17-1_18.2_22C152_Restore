@interface HKWorkoutActivity(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (id)codableRepresentationForSync;
@end

@implementation HKWorkoutActivity(HDCodingSupport)

- (id)codableRepresentationForSync
{
  return +[HDCodableWorkoutActivity codableForWorkoutActivity:a1];
}

+ (id)createWithCodable:()HDCodingSupport
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = objc_alloc(MEMORY[0x1E4F29128]);
    v6 = [v4 uuid];
    v7 = (void *)[v5 initWithUUIDString:v6];

    v8 = (void *)MEMORY[0x1E4F2B768];
    v9 = [v4 configuration];
    v10 = [v8 createWithCodable:v9];

    [v4 startDate];
    v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    if ([v4 hasEndDate])
    {
      [v4 endDate];
      v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      v12 = 0;
    }
    [v4 duration];
    double v15 = v14;
    if ([v4 hasMetadata])
    {
      v16 = (void *)MEMORY[0x1E4F1C9E8];
      v17 = [v4 metadata];
      v18 = objc_msgSend(v16, "hk_dictionaryWithCodableMetadata:", v17);
    }
    else
    {
      v18 = 0;
    }
    id v19 = [v4 statistics];
    id v20 = v11;
    id v21 = v12;
    self;
    if ([v19 count])
    {
      id v52 = v21;
      v46 = v18;
      v47 = v10;
      v48 = v7;
      id v49 = v4;
      id v50 = v3;
      v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v19, "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v45 = v19;
      id v22 = v19;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v54 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v28 = [v27 quantityType];
            if (_HKValidDataTypeCode())
            {
              v29 = [MEMORY[0x1E4F2B3B8] _quantityTypeWithCode:v28];
              if (v29)
              {
                id v30 = v20;
                v31 = (void *)[objc_alloc(MEMORY[0x1E4F2B5B0]) initWithDataType:v29 startDate:v20 endDate:v52];
                v32 = [v29 canonicalUnit];
                if ([v27 hasSumQuantity])
                {
                  v33 = (void *)MEMORY[0x1E4F2B370];
                  [v27 sumQuantity];
                  v34 = objc_msgSend(v33, "quantityWithUnit:doubleValue:", v32);
                  [v31 setSumQuantity:v34];
                }
                if ([v27 hasMinQuantity])
                {
                  v35 = (void *)MEMORY[0x1E4F2B370];
                  [v27 minQuantity];
                  v36 = objc_msgSend(v35, "quantityWithUnit:doubleValue:", v32);
                  [v31 setMinimumQuantity:v36];
                }
                if ([v27 hasMaxQuantity])
                {
                  v37 = (void *)MEMORY[0x1E4F2B370];
                  [v27 maxQuantity];
                  v38 = objc_msgSend(v37, "quantityWithUnit:doubleValue:", v32);
                  [v31 setMaximumQuantity:v38];
                }
                if ([v27 hasAvgQuantity])
                {
                  v39 = (void *)MEMORY[0x1E4F2B370];
                  [v27 avgQuantity];
                  v40 = objc_msgSend(v39, "quantityWithUnit:doubleValue:", v32);
                  [v31 setAverageQuantity:v40];
                }
                [v51 setObject:v31 forKeyedSubscript:v29];

                id v20 = v30;
              }
            }
            else
            {
              _HKInitializeLogging();
              v41 = *MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v58 = v28;
                _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "Ignoring workout statistics for invalid data type code %ld", buf, 0xCu);
              }
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v59 count:16];
        }
        while (v24);
      }

      id v4 = v49;
      id v3 = v50;
      v10 = v47;
      v7 = v48;
      id v19 = v45;
      v18 = v46;
      v42 = v51;
      id v21 = v52;
    }
    else
    {
      v42 = 0;
    }

    [v10 activityType];
    if (_HKWorkoutActivityTypeIsValid())
    {
      id v43 = objc_alloc(MEMORY[0x1E4F2B720]);
      v13 = (void *)[v43 _initWithUUID:v7 workoutConfiguration:v10 startDate:v20 endDate:v21 workoutEvents:MEMORY[0x1E4F1CBF0] startsPaused:0 duration:v15 metadata:v18 statisticsPerType:v42];
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end