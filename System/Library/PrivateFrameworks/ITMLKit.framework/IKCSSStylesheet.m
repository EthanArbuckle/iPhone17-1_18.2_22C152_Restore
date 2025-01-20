@interface IKCSSStylesheet
- (IKCSSRuleList)ruleList;
- (id)description;
- (void)setRuleList:(id)a3;
@end

@implementation IKCSSStylesheet

- (id)description
{
  v2 = NSString;
  v3 = [(IKCSSStylesheet *)self ruleList];
  v4 = [v3 description];
  v5 = [v2 stringWithFormat:@"{ruleList: %@}", v4];

  return v5;
}

- (IKCSSRuleList)ruleList
{
  return self->_ruleList;
}

- (void)setRuleList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end