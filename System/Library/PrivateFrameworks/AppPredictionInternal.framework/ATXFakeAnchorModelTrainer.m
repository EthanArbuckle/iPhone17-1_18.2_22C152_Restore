@interface ATXFakeAnchorModelTrainer
- (ATXFakeAnchorModelTrainer)init;
- (BOOL)trained;
- (NSMutableArray)trainedAnchors;
- (id)trainAnchorModel:(id)a3;
- (void)setTrainingResultsForAnchor:(id)a3 results:(id)a4;
- (void)train;
@end

@implementation ATXFakeAnchorModelTrainer

- (ATXFakeAnchorModelTrainer)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXFakeAnchorModelTrainer;
  v2 = [(ATXFakeAnchorModelTrainer *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_trained = 0;
    uint64_t v4 = objc_opt_new();
    trainedAnchors = v3->_trainedAnchors;
    v3->_trainedAnchors = (NSMutableArray *)v4;

    uint64_t v6 = objc_opt_new();
    trainingResultsForAnchor = v3->_trainingResultsForAnchor;
    v3->_trainingResultsForAnchor = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (void)train
{
  self->_trained = 1;
}

- (id)trainAnchorModel:(id)a3
{
  self->_trained = 1;
  trainedAnchors = self->_trainedAnchors;
  id v5 = a3;
  uint64_t v6 = [v5 anchorTypeString];
  [(NSMutableArray *)trainedAnchors addObject:v6];

  trainingResultsForAnchor = self->_trainingResultsForAnchor;
  v8 = [v5 anchorTypeString];

  objc_super v9 = [(NSMutableDictionary *)trainingResultsForAnchor objectForKey:v8];

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v10;

  return v11;
}

- (void)setTrainingResultsForAnchor:(id)a3 results:(id)a4
{
  trainingResultsForAnchor = self->_trainingResultsForAnchor;
  id v6 = a4;
  id v7 = [a3 anchorTypeString];
  [(NSMutableDictionary *)trainingResultsForAnchor setObject:v6 forKey:v7];
}

- (BOOL)trained
{
  return self->_trained;
}

- (NSMutableArray)trainedAnchors
{
  return self->_trainedAnchors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainedAnchors, 0);
  objc_storeStrong((id *)&self->_trainingResultsForAnchor, 0);
}

@end