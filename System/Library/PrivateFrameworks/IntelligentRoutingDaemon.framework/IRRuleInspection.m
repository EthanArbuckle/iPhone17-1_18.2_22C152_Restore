@interface IRRuleInspection
- (IRRuleInspection)initWithRuleName:(id)a3 evaluation:(id)a4;
- (IRRuleOutputEvaluation)evaluation;
- (NSString)ruleName;
- (void)setEvaluation:(id)a3;
- (void)setRuleName:(id)a3;
@end

@implementation IRRuleInspection

- (IRRuleInspection)initWithRuleName:(id)a3 evaluation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRRuleInspection;
  v8 = [(IRRuleInspection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(IRRuleInspection *)v8 setRuleName:v6];
    [(IRRuleInspection *)v9 setEvaluation:v7];
  }

  return v9;
}

- (NSString)ruleName
{
  return self->_ruleName;
}

- (void)setRuleName:(id)a3
{
}

- (IRRuleOutputEvaluation)evaluation
{
  return self->_evaluation;
}

- (void)setEvaluation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluation, 0);

  objc_storeStrong((id *)&self->_ruleName, 0);
}

@end