@interface IKCSSRuleList
- (IKCSSRuleList)init;
- (id)description;
- (id)firstRule;
- (id)lastRule;
- (id)ruleAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addRule:(id)a3;
@end

@implementation IKCSSRuleList

- (IKCSSRuleList)init
{
  v6.receiver = self;
  v6.super_class = (Class)IKCSSRuleList;
  v2 = [(IKCSSRuleList *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    rules = v2->rules;
    v2->rules = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)addRule:(id)a3
{
}

- (id)firstRule
{
  return (id)[(NSMutableArray *)self->rules firstObject];
}

- (id)lastRule
{
  return (id)[(NSMutableArray *)self->rules lastObject];
}

- (id)ruleAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->rules objectAtIndex:a3];
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->rules count];
}

- (id)description
{
  int64_t v3 = [(IKCSSRuleList *)self count] - 1;
  if (v3 < 1)
  {
    v8 = &stru_1F3E09950;
  }
  else
  {
    uint64_t v4 = 0;
    v5 = &stru_1F3E09950;
    do
    {
      objc_super v6 = [(IKCSSRuleList *)self ruleAtIndex:v4];
      v7 = [v6 description];
      v8 = [(__CFString *)v5 stringByAppendingFormat:@"%@, ", v7];

      ++v4;
      v5 = v8;
    }
    while (v3 != v4);
  }
  if ([(IKCSSRuleList *)self count])
  {
    v9 = [(IKCSSRuleList *)self ruleAtIndex:v3];
    v10 = [v9 description];
    uint64_t v11 = [(__CFString *)v8 stringByAppendingString:v10];

    v8 = (__CFString *)v11;
  }
  v12 = [NSString stringWithFormat:@"[%@]", v8];

  return v12;
}

- (void).cxx_destruct
{
}

@end