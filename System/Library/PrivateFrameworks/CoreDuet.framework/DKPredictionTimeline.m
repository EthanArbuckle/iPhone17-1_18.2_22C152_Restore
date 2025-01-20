@interface DKPredictionTimeline
@end

@implementation DKPredictionTimeline

void __46___DKPredictionTimeline_predictionUnavailable__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v3 = -[_DKPredictionTimeline initWithValues:forDurations:startingAt:](v1, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], v2);
  v4 = (void *)predictionUnavailable_prediction;
  predictionUnavailable_prediction = (uint64_t)v3;

  v5 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v7[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  -[_DKSyncWindow setStartDate:](predictionUnavailable_prediction, v6);
}

void __39___DKPredictionTimeline_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = objc_msgSend(v5, "dk_dedup");
  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = objc_msgSend(v8, "dk_dedup");
  }
  else
  {
    v7 = 0;
  }
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void __36___DKPredictionTimeline_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)description_formatter;
  description_formatter = (uint64_t)v0;

  v2 = (void *)MEMORY[0x1E4F28C10];
  id v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v2 dateFormatFromTemplate:@"HH:mm:ss MM/dd" options:0 locale:v4];
  [(id)description_formatter setDateFormat:v3];
}

@end