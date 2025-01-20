@interface ATXAnchorModelClassificationResult
- (ATXAnchorModelClassificationResult)initWithShouldPredictCandidate:(BOOL)a3 score:(double)a4;
- (BOOL)shouldPredictCandidate;
- (double)score;
@end

@implementation ATXAnchorModelClassificationResult

- (ATXAnchorModelClassificationResult)initWithShouldPredictCandidate:(BOOL)a3 score:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ATXAnchorModelClassificationResult;
  result = [(ATXAnchorModelClassificationResult *)&v7 init];
  if (result)
  {
    result->_shouldPredictCandidate = a3;
    result->_score = a4;
  }
  return result;
}

- (BOOL)shouldPredictCandidate
{
  return self->_shouldPredictCandidate;
}

- (double)score
{
  return self->_score;
}

@end