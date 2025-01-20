@interface ATXAppPredictorPredictionChunks
- (ATXAppPredictorPredictionChunks)initWithPredictionSetChunk:(id)a3 feedbackStateChunk:(id)a4;
- (NSData)feedbackStateChunk;
- (NSData)predictionSetChunk;
- (id)chunkArray;
- (id)joinChunks;
- (void)setFeedbackStateChunk:(id)a3;
- (void)setPredictionSetChunk:(id)a3;
@end

@implementation ATXAppPredictorPredictionChunks

- (ATXAppPredictorPredictionChunks)initWithPredictionSetChunk:(id)a3 feedbackStateChunk:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)ATXAppPredictorPredictionChunks;
    v11 = [(ATXAppPredictorPredictionChunks *)&v14 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_predictionSetChunk, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (id)chunkArray
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithObject:self->_predictionSetChunk];
  v4 = v3;
  if (self->_feedbackStateChunk) {
    objc_msgSend(v3, "addObject:");
  }
  return v4;
}

- (id)joinChunks
{
  v2 = [(ATXAppPredictorPredictionChunks *)self chunkArray];
  v3 = ATXCacheFileJoinChunks();

  return v3;
}

- (NSData)predictionSetChunk
{
  return self->_predictionSetChunk;
}

- (void)setPredictionSetChunk:(id)a3
{
}

- (NSData)feedbackStateChunk
{
  return self->_feedbackStateChunk;
}

- (void)setFeedbackStateChunk:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackStateChunk, 0);
  objc_storeStrong((id *)&self->_predictionSetChunk, 0);
}

@end