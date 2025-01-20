@interface HFScheduleRuleItem
- (BOOL)isEqual:(id)a3;
- (HFScheduleRule)rule;
- (HFScheduleRuleItem)initWithScheduleRule:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setRule:(id)a3;
@end

@implementation HFScheduleRuleItem

- (HFScheduleRuleItem)initWithScheduleRule:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFScheduleRuleItem;
  v6 = [(HFScheduleRuleItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rule, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3);
  id v5 = [(HFScheduleRuleItem *)self rule];
  v6 = +[HFScheduleUtilities localizedStringForRule:v5];
  [v4 setObject:v6 forKeyedSubscript:@"title"];

  v7 = [[HFImageIconDescriptor alloc] initWithSystemImageNamed:@"calendar.badge.clock"];
  [v4 setObject:@"Home.Guest.Schedule.Rule" forKeyedSubscript:@"HFResultDisplayAccessibilityIDKey"];
  [v4 setObject:v7 forKeyedSubscript:@"icon"];
  [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"elementWithMaxWidth"];
  v8 = (void *)MEMORY[0x263F58190];
  objc_super v9 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v10 = [v8 futureWithResult:v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(HFScheduleRuleItem *)self rule];
  v6 = (void *)v4[7];
  v4[7] = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HFScheduleRuleItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(HFScheduleRuleItem *)v4 rule];
      v6 = [(HFScheduleRuleItem *)self rule];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HFScheduleRuleItem *)self rule];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HFScheduleRule)rule
{
  return self->_rule;
}

- (void)setRule:(id)a3
{
}

- (void).cxx_destruct
{
}

@end