@interface MLProgramEvaluationResult
- (MLBatchProvider)evaluationMetrics;
- (MLProgramEvaluationResult)init;
- (double)loss;
- (void)setEvaluationMetrics:(id)a3;
- (void)setLoss:(double)a3;
@end

@implementation MLProgramEvaluationResult

- (void).cxx_destruct
{
}

- (void)setEvaluationMetrics:(id)a3
{
}

- (MLBatchProvider)evaluationMetrics
{
  return (MLBatchProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLoss:(double)a3
{
  self->_loss = a3;
}

- (double)loss
{
  return self->_loss;
}

- (MLProgramEvaluationResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)MLProgramEvaluationResult;
  result = [(MLProgramEvaluationResult *)&v3 init];
  if (result) {
    result->_loss = 0.0;
  }
  return result;
}

@end