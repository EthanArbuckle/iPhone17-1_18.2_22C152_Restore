@interface ATXScoredActionWithReason
- (ATXScoredActionWithReason)initWithScoredAction:(id)a3 predictionReason:(id)a4;
- (ATXScoredPrediction)scoredAction;
- (NSString)reason;
@end

@implementation ATXScoredActionWithReason

- (ATXScoredActionWithReason)initWithScoredAction:(id)a3 predictionReason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXScoredActionWithReason;
  v9 = [(ATXScoredActionWithReason *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scoredAction, a3);
    uint64_t v11 = [v8 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;
  }
  return v10;
}

- (ATXScoredPrediction)scoredAction
{
  return self->_scoredAction;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_scoredAction, 0);
}

@end