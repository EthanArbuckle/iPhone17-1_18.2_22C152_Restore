@interface _ATXClientModelShadowMetricsDataSourceBase
- (BOOL)isPrediction:(id)a3 equalToPrediction:(id)a4;
- (_ATXClientModelShadowMetricsDataSourceBase)initWithClientModelType:(int64_t)a3;
- (id)_eventBodyDateForEvent:(id)a3;
- (id)predictionCachePublisherFromStartDate:(id)a3;
- (unint64_t)numberOfPredictionsInCache:(id)a3 ofType:(int64_t)a4;
- (void)enumeratePredictionsInCache:(id)a3 ofType:(int64_t)a4 usingBlock:(id)a5;
- (void)replayHistoryWithShadowEventPublisher:(id)a3 startDate:(id)a4 endDate:(id)a5 shadowEventHandler:(id)a6 predictionCacheHandler:(id)a7;
@end

@implementation _ATXClientModelShadowMetricsDataSourceBase

- (_ATXClientModelShadowMetricsDataSourceBase)initWithClientModelType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_ATXClientModelShadowMetricsDataSourceBase;
  result = [(_ATXClientModelShadowMetricsDataSourceBase *)&v5 init];
  if (result) {
    result->_clientModelType = a3;
  }
  return result;
}

- (id)predictionCachePublisherFromStartDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F93940];
  int64_t clientModelType = self->_clientModelType;
  id v5 = a3;
  v6 = [v3 clientModelIdFromClientModelType:clientModelType];
  v7 = objc_opt_new();
  [v5 timeIntervalSinceReferenceDate];
  double v9 = v8;

  v10 = [v7 publisherFromStartTime:v9];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84___ATXClientModelShadowMetricsDataSourceBase_predictionCachePublisherFromStartDate___block_invoke;
  v14[3] = &unk_1E68AF140;
  id v15 = v6;
  id v11 = v6;
  v12 = [v10 filterWithIsIncluded:v14];

  return v12;
}

- (void)replayHistoryWithShadowEventPublisher:(id)a3 startDate:(id)a4 endDate:(id)a5 shadowEventHandler:(id)a6 predictionCacheHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  v16 = [(_ATXClientModelShadowMetricsDataSourceBase *)self predictionCachePublisherFromStartDate:a4];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke;
  v26[3] = &unk_1E68B22B0;
  v26[4] = self;
  v17 = [v16 orderedMergeWithOther:v15 comparator:v26];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_67;
  v22[3] = &unk_1E68B22D8;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  id v21 = (id)[v17 sinkWithCompletion:&__block_literal_global_122 shouldContinue:v22];
}

- (id)_eventBodyDateForEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 eventBody];
  int v5 = [v4 conformsToProtocol:&unk_1F2892128];

  v6 = [v3 eventBody];
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 absoluteTimestamp];
LABEL_5:
    v10 = (void *)v8;

    goto LABEL_7;
  }
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v3 eventBody];
    uint64_t v8 = [v7 date];
    goto LABEL_5;
  }
  id v11 = (void *)MEMORY[0x1E4F1C9C8];
  [v3 timestamp];
  v10 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
LABEL_7:

  return v10;
}

- (BOOL)isPrediction:(id)a3 equalToPrediction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = v5;
    id v8 = v6;
    uint64_t v9 = [v7 executableType];
    if (v9 != [v8 executableType]) {
      goto LABEL_8;
    }
    uint64_t v10 = [v7 predictionReasons];
    if (v10 != [v8 predictionReasons]) {
      goto LABEL_8;
    }
    id v11 = [v7 scoreSpecification];
    id v12 = [v8 scoreSpecification];
    int v13 = [v11 isEqual:v12];

    if (v13)
    {
      id v14 = [v7 executableIdentifier];
      id v15 = [v8 executableIdentifier];
      char v16 = [v14 isEqualToString:v15];
    }
    else
    {
LABEL_8:
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)numberOfPredictionsInCache:(id)a3 ofType:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = objc_msgSend(v5, "suggestions", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) executableType] == a4) {
            ++v9;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)enumeratePredictionsInCache:(id)a3 ofType:(int64_t)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v9 = [v7 suggestions];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __92___ATXClientModelShadowMetricsDataSourceBase_enumeratePredictionsInCache_ofType_usingBlock___block_invoke;
    v10[3] = &unk_1E68B2300;
    int64_t v12 = a4;
    id v11 = v8;
    [v9 enumerateObjectsUsingBlock:v10];
  }
}

@end