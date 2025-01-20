@interface ATXClientModelShadowMetricsAppIntentDataSource
- (BOOL)isPrediction:(id)a3 equalToPrediction:(id)a4;
- (unint64_t)cacheHitIndexForShadowEvent:(id)a3 predictionCache:(id)a4;
- (unint64_t)numberOfPredictionsInCache:(id)a3;
- (void)enumeratePredictionsInCache:(id)a3 usingBlock:(id)a4;
- (void)replayHistoryBetweenStartDate:(id)a3 endDate:(id)a4 shadowEventHandler:(id)a5 predictionCacheHandler:(id)a6;
@end

@implementation ATXClientModelShadowMetricsAppIntentDataSource

- (void)replayHistoryBetweenStartDate:(id)a3 endDate:(id)a4 shadowEventHandler:(id)a5 predictionCacheHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = BiomeLibrary();
  v15 = [v14 App];
  v16 = [v15 Intent];
  objc_msgSend(v16, "atx_publisherFromStartDate:", v13);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  [(_ATXClientModelShadowMetricsDataSourceBase *)self replayHistoryWithShadowEventPublisher:v17 startDate:v13 endDate:v12 shadowEventHandler:v11 predictionCacheHandler:v10];
}

- (unint64_t)cacheHitIndexForShadowEvent:(id)a3 predictionCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = v5;
    v8 = [v7 atxAction];
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8)
    {
      id v10 = +[ATXProactiveSuggestionBuilder executableIdForAction:v8];
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2020000000;
      uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      id v11 = [v6 suggestions];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __94__ATXClientModelShadowMetricsAppIntentDataSource_cacheHitIndexForShadowEvent_predictionCache___block_invoke;
      v14[3] = &unk_1E68B2328;
      id v12 = v10;
      id v15 = v12;
      v16 = &v17;
      [v11 enumerateObjectsUsingBlock:v14];

      unint64_t v9 = v18[3];
      _Block_object_dispose(&v17, 8);
    }
  }
  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

void __94__ATXClientModelShadowMetricsAppIntentDataSource_cacheHitIndexForShadowEvent_predictionCache___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if ([v9 executableType] == 2)
  {
    id v7 = *(void **)(a1 + 32);
    v8 = [v9 executableIdentifier];
    LODWORD(v7) = [v7 isEqualToString:v8];

    if (v7)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
}

- (BOOL)isPrediction:(id)a3 equalToPrediction:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ATXClientModelShadowMetricsAppIntentDataSource;
  return [(_ATXClientModelShadowMetricsDataSourceBase *)&v5 isPrediction:a3 equalToPrediction:a4];
}

- (unint64_t)numberOfPredictionsInCache:(id)a3
{
  return [(_ATXClientModelShadowMetricsDataSourceBase *)self numberOfPredictionsInCache:a3 ofType:2];
}

- (void)enumeratePredictionsInCache:(id)a3 usingBlock:(id)a4
{
}

@end