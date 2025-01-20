@interface LCFProactivePredictionRanker
- (LCFProactivePredictionRanker)init;
- (id)proactiveRanking:(id)a3 predictions:(id)a4;
@end

@implementation LCFProactivePredictionRanker

- (LCFProactivePredictionRanker)init
{
  v4.receiver = self;
  v4.super_class = (Class)LCFProactivePredictionRanker;
  v2 = [(LCFProactivePredictionRanker *)&v4 init];
  if (v2) {
    LCFModelMonitoringLoggingUtilsInit();
  }
  return v2;
}

- (id)proactiveRanking:(id)a3 predictions:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  v38 = v6;
  if (v7 == [v6 count])
  {
    v8 = objc_opt_new();
    if ([v5 count])
    {
      unint64_t v9 = 0;
      do
      {
        v10 = [v5 objectAtIndexedSubscript:v9];
        v11 = [v38 featuresAtIndex:v9];
        id v12 = [[LCFProactivePredictionRankerHolder alloc] init:v10 prediction:v11];
        v13 = [v10 featureValues];
        v14 = [v13 objectForKeyedSubscript:@"_sharingEventUID"];
        v15 = [v14 stringValue];

        v16 = [v8 objectForKey:v15];

        if (!v16)
        {
          id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v8 setObject:v17 forKey:v15];
        }
        v18 = [v8 objectForKeyedSubscript:v15];
        [v18 addObject:v12];

        ++v9;
      }
      while (v9 < [v5 count]);
    }
    id v37 = v5;
    id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v19 = v8;
    uint64_t v42 = [v19 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v42)
    {
      uint64_t v41 = *(void *)v44;
      id v40 = v19;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v44 != v41) {
            objc_enumerationMutation(v19);
          }
          uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          v22 = [v19 objectForKeyedSubscript:v21];
          if ([v22 count])
          {
            v23 = [v22 sortedArrayUsingFunction:predictionSort context:0];
            if ([v23 count])
            {
              if ([v23 count])
              {
                unint64_t v24 = 1;
                while (1)
                {
                  v25 = [v23 objectAtIndexedSubscript:v24 - 1];
                  v26 = [v25 featureSet];
                  v27 = [v26 featureValues];
                  v28 = [v27 objectForKeyedSubscript:@"_isPositiveLabeled"];
                  v29 = [v28 BOOLValue];
                  int v30 = [v29 BOOLValue];

                  if (v30) {
                    break;
                  }
                  if (v24++ >= [v23 count]) {
                    goto LABEL_25;
                  }
                }
                v34 = [NSNumber numberWithUnsignedInteger:v24];
                [v39 addObject:v34];
              }
            }
            else
            {
              v33 = LCFMMLogProactivePredictionRanker;
              if (os_log_type_enabled((os_log_t)LCFMMLogProactivePredictionRanker, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v48 = v21;
                _os_log_error_impl(&dword_254EB7000, v33, OS_LOG_TYPE_ERROR, "empty sortedByPrediction for %@", buf, 0xCu);
              }
            }
LABEL_25:

            id v19 = v40;
          }
          else
          {
            v32 = LCFMMLogProactivePredictionRanker;
            if (os_log_type_enabled((os_log_t)LCFMMLogProactivePredictionRanker, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v48 = v21;
              _os_log_error_impl(&dword_254EB7000, v32, OS_LOG_TYPE_ERROR, "empty holder for %@", buf, 0xCu);
            }
          }
        }
        uint64_t v42 = [v19 countByEnumeratingWithState:&v43 objects:v49 count:16];
      }
      while (v42);
    }

    id v5 = v37;
  }
  else
  {
    v35 = (void *)LCFMMLogProactivePredictionRanker;
    if (os_log_type_enabled((os_log_t)LCFMMLogProactivePredictionRanker, OS_LOG_TYPE_ERROR)) {
      -[LCFProactivePredictionRanker proactiveRanking:predictions:](v35, v5, v6);
    }
    id v39 = 0;
  }

  return v39;
}

- (void)proactiveRanking:(void *)a3 predictions:.cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a1;
  int v6 = 134218240;
  uint64_t v7 = [a2 count];
  __int16 v8 = 2048;
  uint64_t v9 = [a3 count];
  _os_log_error_impl(&dword_254EB7000, v5, OS_LOG_TYPE_ERROR, "count of features and precistions don't match. feature count %ld predictions count %ld", (uint8_t *)&v6, 0x16u);
}

@end