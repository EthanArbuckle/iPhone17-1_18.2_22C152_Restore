@interface HFTimeConditionItem
- (HFTimeCondition)condition;
- (HFTimeConditionItem)init;
- (HFTimeConditionItem)initWithCondition:(id)a3;
- (HFTimeConditionItem)initWithConditionType:(unint64_t)a3;
- (HFTimeConditionItem)initWithConditionType:(unint64_t)a3 condition:(id)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)type;
- (void)setCondition:(id)a3;
@end

@implementation HFTimeConditionItem

- (HFTimeConditionItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithConditionType_condition_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTimeConditionItem.m", 21, @"%s is unavailable; use %@ instead",
    "-[HFTimeConditionItem init]",
    v5);

  return 0;
}

- (HFTimeConditionItem)initWithCondition:(id)a3
{
  id v4 = a3;
  v5 = -[HFTimeConditionItem initWithConditionType:condition:](self, "initWithConditionType:condition:", [v4 timeConditionType], v4);

  return v5;
}

- (HFTimeConditionItem)initWithConditionType:(unint64_t)a3
{
  return [(HFTimeConditionItem *)self initWithConditionType:a3 condition:0];
}

- (HFTimeConditionItem)initWithConditionType:(unint64_t)a3 condition:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HFTimeConditionItem;
  v7 = [(HFTimeConditionItem *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    [(HFTimeConditionItem *)v7 setCondition:v6];
  }

  return v8;
}

- (void)setCondition:(id)a3
{
  v5 = (HFTimeCondition *)a3;
  p_condition = &self->_condition;
  if (self->_condition != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_condition, a3);
    v5 = v8;
    if (v8)
    {
      uint64_t v7 = [(HFTimeCondition *)v8 timeConditionType];
      p_condition = [(HFTimeConditionItem *)self type];
      v5 = v8;
      if ((HFTimeCondition **)v7 != p_condition)
      {
        NSLog(&cfstr_ConditionHasEx.isa, v8, v7, [(HFTimeConditionItem *)self type]);
        v5 = v8;
      }
    }
  }
  MEMORY[0x270F9A758](p_condition, v5);
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = [v4 objectForKeyedSubscript:@"conditionDisplayContext"];
  uint64_t v7 = v6;
  if (!v6) {
    id v6 = &unk_26C0F7818;
  }
  uint64_t v8 = [v6 unsignedIntegerValue];

  v9 = [v4 objectForKeyedSubscript:@"conditionFomattingStyle"];
  objc_super v10 = v9;
  if (!v9) {
    v9 = &unk_26C0F7830;
  }
  uint64_t v11 = [v9 unsignedIntegerValue];

  v12 = [v4 objectForKeyedSubscript:@"conditionFomattingContext"];

  if (v12) {
    v13 = v12;
  }
  else {
    v13 = &unk_26C0F7848;
  }
  uint64_t v14 = [v13 unsignedIntegerValue];

  v15 = [[HFTimeConditionNaturalLanguageOptions alloc] initWithFormattingContext:v14 formattingStyle:v11 type:[(HFTimeConditionItem *)self type]];
  [(HFTimeConditionNaturalLanguageOptions *)v15 setTimeContext:v8 == 1];
  v16 = [(HFTimeConditionItem *)self condition];
  v17 = objc_msgSend(v16, "hf_naturalLanguageSummaryWithOptions:", v15);

  if (!v17)
  {
    v17 = +[HFTimeCondition hf_naturalLanguageSummaryForTypeOnlyWithOptions:v15];
  }
  v18 = [v17 conditionTitle];
  [v5 setObject:v18 forKeyedSubscript:@"title"];

  v19 = [v17 conditionDescription];
  [v5 setObject:v19 forKeyedSubscript:@"description"];

  v20 = (void *)MEMORY[0x263F58190];
  v21 = +[HFItemUpdateOutcome outcomeWithResults:v5];
  v22 = [v20 futureWithResult:v21];

  return v22;
}

- (HFTimeCondition)condition
{
  return self->_condition;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end