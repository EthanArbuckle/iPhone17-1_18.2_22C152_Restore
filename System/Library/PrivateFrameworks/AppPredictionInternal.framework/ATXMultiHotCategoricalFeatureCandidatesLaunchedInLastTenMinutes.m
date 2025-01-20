@interface ATXMultiHotCategoricalFeatureCandidatesLaunchedInLastTenMinutes
- (id)categoricalFeatureValuesForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXMultiHotCategoricalFeatureCandidatesLaunchedInLastTenMinutes

- (id)categoricalFeatureValuesForContext:(id)a3 candidate:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 timeContext];
  v6 = [v5 date];

  if (v6)
  {
    v7 = objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v8 = objc_msgSend(v4, "candidateIdentifiersLaunchAge", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v14 = [v4 candidateIdentifiersLaunchAge];
          v15 = [v14 objectForKeyedSubscript:v13];

          if (v15)
          {
            v16 = [v4 timeContext];
            v17 = [v16 date];
            [v17 timeIntervalSinceDate:v15];
            double v19 = v18;

            if (v19 > 0.0 && v19 <= 600.0) {
              [v7 addObject:v13];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v7 = objc_opt_new();
  }

  return v7;
}

@end