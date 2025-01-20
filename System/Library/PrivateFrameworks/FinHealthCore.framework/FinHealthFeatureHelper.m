@interface FinHealthFeatureHelper
+ (id)reconstructAggregateFeaturesWithProcessingWindow:(id)a3;
+ (id)reconstructCompoundFeatures:(id)a3;
@end

@implementation FinHealthFeatureHelper

+ (id)reconstructAggregateFeaturesWithProcessingWindow:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v10 = objc_opt_new();
        v11 = [v9 componentsSeparatedByString:@","];
        v12 = [v11 objectAtIndex:0];
        [v10 setName:v12];
        v13 = FHRepeatingAggregateFeatureSet();
        if (([v13 containsObject:v12] & 1) == 0)
        {
          unint64_t v14 = [v11 count];

          if (v14 < 2) {
            goto LABEL_10;
          }
          v15 = (void *)MEMORY[0x263EFF910];
          v16 = [v11 objectAtIndex:1];
          [v16 doubleValue];
          v17 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
          [v10 setProcessingWindowStartDate:v17];

          v18 = (void *)MEMORY[0x263EFF910];
          v13 = [v11 objectAtIndex:2];
          [v13 doubleValue];
          v19 = objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
          [v10 setProcessingWindowEndDate:v19];
        }
LABEL_10:
        [v4 addObject:v10];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  v20 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"processingWindowEndDate" ascending:0];
  v21 = [MEMORY[0x263EFF8C0] arrayWithObject:v20];
  v22 = [v4 sortedArrayUsingDescriptors:v21];

  return v22;
}

+ (id)reconstructCompoundFeatures:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v39 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F08900];
    uint64_t v5 = [v3 dataUsingEncoding:4];
    id v54 = 0;
    uint64_t v6 = [v4 JSONObjectWithData:v5 options:0 error:&v54];
    id v7 = v54;

    if (v6)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v8 = [v6 allKeys];
      uint64_t v40 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
      if (v40)
      {
        id v34 = v7;
        id v35 = v3;
        uint64_t v36 = *(void *)v51;
        v37 = v8;
        v38 = v6;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v51 != v36) {
              objc_enumerationMutation(v8);
            }
            uint64_t v42 = v9;
            uint64_t v10 = *(void *)(*((void *)&v50 + 1) + 8 * v9);
            v45 = objc_opt_new();
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            uint64_t v41 = v10;
            id obj = [v6 objectForKey:v10];
            uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v59 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v44 = *(void *)v47;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v47 != v44) {
                    objc_enumerationMutation(obj);
                  }
                  id v14 = *(id *)(*((void *)&v46 + 1) + 8 * i);
                  v15 = [v14 objectForKey:@"featureLabel"];
                  v16 = NSString;
                  v17 = [v14 objectForKey:@"featureRank"];
                  [v17 doubleValue];
                  v19 = objc_msgSend(v16, "stringWithFormat:", @"%f", v18);

                  v20 = [v14 objectForKey:@"featureEventIdentifiers"];
                  v21 = [FHSmartCompoundFeatureRankedValue alloc];
                  v22 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithString:v19];
                  v23 = [(FHSmartCompoundFeatureRankedValue *)v21 initWithLabelAndRank:v15 featureRank:v22];

                  if (v20)
                  {
                    [(FHSmartCompoundFeatureRankedValue *)v23 setEventIdentifiers:v20];
                    id v24 = objc_alloc(MEMORY[0x263EFF910]);
                    long long v25 = [v14 objectForKey:@"featureEventStartDate"];
                    [v25 doubleValue];
                    long long v26 = objc_msgSend(v24, "initWithTimeIntervalSinceReferenceDate:");
                    [(FHSmartCompoundFeatureRankedValue *)v23 setEventStartDate:v26];

                    id v27 = objc_alloc(MEMORY[0x263EFF910]);
                    long long v28 = [v14 objectForKey:@"featureEventEndDate"];
                    [v28 doubleValue];
                    v29 = objc_msgSend(v27, "initWithTimeIntervalSinceReferenceDate:");
                    [(FHSmartCompoundFeatureRankedValue *)v23 setEventEndDate:v29];
                  }
                  [v45 addObject:v23];
                }
                uint64_t v12 = [obj countByEnumeratingWithState:&v46 objects:v59 count:16];
              }
              while (v12);
            }

            uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithArray:v45];
            [v39 setValue:v30 forKey:v41];

            uint64_t v9 = v42 + 1;
            v8 = v37;
            uint64_t v6 = v38;
          }
          while (v42 + 1 != v40);
          uint64_t v40 = [v37 countByEnumeratingWithState:&v50 objects:v60 count:16];
        }
        while (v40);
        id v7 = v34;
        id v3 = v35;
      }
    }
    else
    {
      v8 = FinHealthLogObject(@"FinHealthCore");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v31 = [v7 localizedDescription];
        *(_DWORD *)buf = 138412546;
        id v56 = v3;
        __int16 v57 = 2112;
        v58 = v31;
        _os_log_impl(&dword_24E029000, v8, OS_LOG_TYPE_DEBUG, "Failed to parse {%@} with error: %@", buf, 0x16u);
      }
    }
  }
  v32 = (void *)[v39 copy];

  return v32;
}

@end