@interface HFCharacteristicConditionItem
- (HFCharacteristicCondition)condition;
- (HFCharacteristicConditionItem)init;
- (HFCharacteristicConditionItem)initWithCondition:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFCharacteristicConditionItem

- (HFCharacteristicConditionItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithCondition_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCharacteristicConditionItem.m", 22, @"%s is unavailable; use %@ instead",
    "-[HFCharacteristicConditionItem init]",
    v5);

  return 0;
}

- (HFCharacteristicConditionItem)initWithCondition:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFCharacteristicConditionItem.m", 27, @"Invalid parameter not satisfying: %@", @"condition != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HFCharacteristicConditionItem;
  v7 = [(HFCharacteristicConditionItem *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_condition, a3);
  }

  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 dictionary];
  v7 = [v5 objectForKeyedSubscript:@"conditionFomattingContext"];

  if (v7) {
    v8 = v7;
  }
  else {
    v8 = &unk_26C0F7A58;
  }
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [[HFCharacteristicConditionNaturalLanguageOptions alloc] initWithFormattingContext:v9];
  objc_super v11 = [(HFCharacteristicConditionItem *)self condition];
  v12 = objc_msgSend(v11, "hf_naturalLanguageSummaryWithOptions:", v10);

  v13 = [v12 conditionTitle];
  [v6 setObject:v13 forKeyedSubscript:@"title"];

  v14 = (void *)MEMORY[0x263F58190];
  v15 = +[HFItemUpdateOutcome outcomeWithResults:v6];
  v16 = [v14 futureWithResult:v15];

  return v16;
}

- (HFCharacteristicCondition)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
}

@end