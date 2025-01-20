@interface IRRuleOutput
- (IRRule)rule;
- (IRRuleOutput)initWithRule:(id)a3;
- (id)evaluateRuleOutputWithCandidateIdentifier:(id)a3;
@end

@implementation IRRuleOutput

- (IRRuleOutput)initWithRule:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRRuleOutput;
  v6 = [(IRRuleOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rule, a3);
  }

  return v7;
}

- (id)evaluateRuleOutputWithCandidateIdentifier:(id)a3
{
  return 0;
}

- (IRRule)rule
{
  return self->_rule;
}

- (void).cxx_destruct
{
}

@end