@interface HFPresenceConditionItem
- (HFPresenceCondition)condition;
- (HFPresenceConditionItem)init;
- (HFPresenceConditionItem)initWithCondition:(id)a3 home:(id)a4;
- (HMHome)home;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setCondition:(id)a3;
@end

@implementation HFPresenceConditionItem

- (HFPresenceConditionItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithCondition_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFPresenceConditionItem.m", 20, @"%s is unavailable; use %@ instead",
    "-[HFPresenceConditionItem init]",
    v5);

  return 0;
}

- (HFPresenceConditionItem)initWithCondition:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFPresenceConditionItem;
  v9 = [(HFPresenceConditionItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_storeStrong((id *)&v10->_condition, a3);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v4 objectForKeyedSubscript:@"conditionFomattingContext"];
  id v7 = v6;
  if (!v6) {
    v6 = &unk_26C0F6B40;
  }
  uint64_t v8 = [v6 unsignedIntegerValue];

  v9 = [v4 objectForKeyedSubscript:@"conditionFomattingStyle"];

  if (v9) {
    v10 = v9;
  }
  else {
    v10 = &unk_26C0F6B58;
  }
  uint64_t v11 = [v10 unsignedIntegerValue];

  objc_super v12 = [HFPresenceConditionNaturalLanguageOptions alloc];
  v13 = [(HFPresenceConditionItem *)self home];
  v14 = [(HFPresenceConditionNaturalLanguageOptions *)v12 initWithHome:v13 formattingContext:v8 formattingStyle:v11];

  v15 = [(HFPresenceConditionItem *)self condition];
  v16 = objc_msgSend(v15, "hf_naturalLanguageSummaryWithOptions:", v14);

  v17 = [v16 conditionTitle];
  [v5 setObject:v17 forKeyedSubscript:@"title"];

  v18 = (void *)MEMORY[0x263F58190];
  v19 = +[HFItemUpdateOutcome outcomeWithResults:v5];
  v20 = [v18 futureWithResult:v19];

  return v20;
}

- (HFPresenceCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_condition, 0);
}

@end