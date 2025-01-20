@interface MPCWhiskyControllerDisabledState
- (MPCWhiskyControllerDisabledState)initWithPolicyEvaluation:(id)a3;
- (NSString)explanation;
- (int64_t)reason;
- (void)setExplanation:(id)a3;
- (void)setReason:(int64_t)a3;
@end

@implementation MPCWhiskyControllerDisabledState

- (void).cxx_destruct
{
}

- (void)setExplanation:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (MPCWhiskyControllerDisabledState)initWithPolicyEvaluation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)MPCWhiskyControllerDisabledState;
    v5 = [(MPCWhiskyControllerDisabledState *)&v12 init];
    if (v5)
    {
      uint64_t v6 = [v4 explanation];
      explanation = v5->_explanation;
      v5->_explanation = (NSString *)v6;

      unint64_t v8 = [v4 policyType];
      if (v8 < 3) {
        int64_t v9 = v8 + 1;
      }
      else {
        int64_t v9 = 0;
      }
      v5->_reason = v9;
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end