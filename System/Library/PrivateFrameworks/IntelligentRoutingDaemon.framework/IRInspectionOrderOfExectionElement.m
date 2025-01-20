@interface IRInspectionOrderOfExectionElement
- (IRInspectionOrderOfExectionElement)initWithRuleName:(id)a3 andRuleType:(id)a4;
- (NSString)ruleName;
- (NSString)ruleType;
- (void)setRuleName:(id)a3;
- (void)setRuleType:(id)a3;
@end

@implementation IRInspectionOrderOfExectionElement

- (IRInspectionOrderOfExectionElement)initWithRuleName:(id)a3 andRuleType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IRInspectionOrderOfExectionElement;
  v8 = [(IRInspectionOrderOfExectionElement *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(IRInspectionOrderOfExectionElement *)v8 setRuleName:v6];
    [(IRInspectionOrderOfExectionElement *)v9 setRuleType:v7];
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

- (NSString)ruleType
{
  return self->_ruleType;
}

- (void)setRuleType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleType, 0);

  objc_storeStrong((id *)&self->_ruleName, 0);
}

@end