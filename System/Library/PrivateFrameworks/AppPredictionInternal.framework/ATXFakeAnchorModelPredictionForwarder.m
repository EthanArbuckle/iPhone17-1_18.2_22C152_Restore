@interface ATXFakeAnchorModelPredictionForwarder
- (ATXFakeAnchorModelPredictionForwarder)init;
- (NSArray)forwardedPredictions;
- (void)forwardPredictions:(id)a3;
@end

@implementation ATXFakeAnchorModelPredictionForwarder

- (ATXFakeAnchorModelPredictionForwarder)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXFakeAnchorModelPredictionForwarder;
  v2 = [(ATXFakeAnchorModelPredictionForwarder *)&v6 init];
  v3 = v2;
  if (v2)
  {
    forwardedPredictions = v2->_forwardedPredictions;
    v2->_forwardedPredictions = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (void)forwardPredictions:(id)a3
{
}

- (NSArray)forwardedPredictions
{
  return self->_forwardedPredictions;
}

- (void).cxx_destruct
{
}

@end