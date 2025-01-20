@interface IRMiLoProviderLslPredictionResults
- (IRMiLoProviderLslPredictionResults)initWithMiloPrediction:(id)a3 withMiLoServiceQuality:(int64_t)a4 withMiLoServiceQualityReasonBitmap:(int64_t)a5;
- (NSArray)predictedEvents;
- (NSDate)predictionTime;
- (NSUUID)predictionId;
- (int64_t)_bitmapFromConfidenceReasonArray:(id)a3;
- (int64_t)confidence;
- (int64_t)confidenceReasonBitmap;
- (int64_t)miLoServiceQuality;
- (int64_t)miLoServiceQualityReasonBitmap;
- (void)setConfidence:(int64_t)a3;
- (void)setConfidenceReasonBitmap:(int64_t)a3;
- (void)setMiLoServiceQuality:(int64_t)a3;
- (void)setMiLoServiceQualityReasonBitmap:(int64_t)a3;
- (void)setPredictedEvents:(id)a3;
- (void)setPredictionId:(id)a3;
- (void)setPredictionTime:(id)a3;
@end

@implementation IRMiLoProviderLslPredictionResults

- (IRMiLoProviderLslPredictionResults)initWithMiloPrediction:(id)a3 withMiLoServiceQuality:(int64_t)a4 withMiLoServiceQualityReasonBitmap:(int64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IRMiLoProviderLslPredictionResults;
  v9 = [(IRMiLoProviderLslPredictionResults *)&v16 init];
  if (v9)
  {
    v10 = [v8 requestIdentifier];
    [(IRMiLoProviderLslPredictionResults *)v9 setPredictionId:v10];

    v11 = [v8 places];
    v12 = [v11 compactMap:&__block_literal_global_12];
    [(IRMiLoProviderLslPredictionResults *)v9 setPredictedEvents:v12];

    [(IRMiLoProviderLslPredictionResults *)v9 setMiLoServiceQuality:a4];
    [(IRMiLoProviderLslPredictionResults *)v9 setMiLoServiceQualityReasonBitmap:a5];
    v13 = [v8 time];
    [(IRMiLoProviderLslPredictionResults *)v9 setPredictionTime:v13];

    -[IRMiLoProviderLslPredictionResults setConfidence:](v9, "setConfidence:", [v8 confidence]);
    v14 = [v8 confidenceReasons];
    [(IRMiLoProviderLslPredictionResults *)v9 setConfidenceReasonBitmap:[(IRMiLoProviderLslPredictionResults *)v9 _bitmapFromConfidenceReasonArray:v14]];
  }
  return v9;
}

IRMiLoProviderLslSingleEventScore *__119__IRMiLoProviderLslPredictionResults_initWithMiloPrediction_withMiLoServiceQuality_withMiLoServiceQualityReasonBitmap___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_alloc_init(IRMiLoProviderLslSingleEventScore);
  v4 = [v2 identifier];
  [(IRMiLoProviderLslSingleEventScore *)v3 setEventId:v4];

  v5 = [v2 score];

  [(IRMiLoProviderLslSingleEventScore *)v3 setScore:v5];

  return v3;
}

- (int64_t)_bitmapFromConfidenceReasonArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= 1 << [*(id *)(*((void *)&v10 + 1) + 8 * i) confidenceReasonEnum];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (NSUUID)predictionId
{
  return self->_predictionId;
}

- (void)setPredictionId:(id)a3
{
}

- (int64_t)miLoServiceQuality
{
  return self->_miLoServiceQuality;
}

- (void)setMiLoServiceQuality:(int64_t)a3
{
  self->_miLoServiceQuality = a3;
}

- (int64_t)miLoServiceQualityReasonBitmap
{
  return self->_miLoServiceQualityReasonBitmap;
}

- (void)setMiLoServiceQualityReasonBitmap:(int64_t)a3
{
  self->_miLoServiceQualityReasonBitmap = a3;
}

- (NSArray)predictedEvents
{
  return self->_predictedEvents;
}

- (void)setPredictedEvents:(id)a3
{
}

- (NSDate)predictionTime
{
  return self->_predictionTime;
}

- (void)setPredictionTime:(id)a3
{
}

- (int64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int64_t)a3
{
  self->_confidence = a3;
}

- (int64_t)confidenceReasonBitmap
{
  return self->_confidenceReasonBitmap;
}

- (void)setConfidenceReasonBitmap:(int64_t)a3
{
  self->_confidenceReasonBitmap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionTime, 0);
  objc_storeStrong((id *)&self->_predictedEvents, 0);

  objc_storeStrong((id *)&self->_predictionId, 0);
}

@end