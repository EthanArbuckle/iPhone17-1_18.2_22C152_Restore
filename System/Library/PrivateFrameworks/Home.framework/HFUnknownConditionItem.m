@interface HFUnknownConditionItem
- (HFCondition)condition;
- (HFUnknownConditionItem)init;
- (HFUnknownConditionItem)initWithCondition:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFUnknownConditionItem

- (HFUnknownConditionItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithCondition_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFUnknownConditionItem.m", 19, @"%s is unavailable; use %@ instead",
    "-[HFUnknownConditionItem init]",
    v5);

  return 0;
}

- (HFUnknownConditionItem)initWithCondition:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFUnknownConditionItem;
  v6 = [(HFUnknownConditionItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_condition, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  v6 = [v4 dictionary];
  v7 = [v5 objectForKeyedSubscript:@"conditionFomattingContext"];

  if (v7) {
    v8 = v7;
  }
  else {
    v8 = &unk_26C0F7B90;
  }
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [(HFSubstringNaturalLanguageOptions *)[HFConditionNaturalLanguageOptions alloc] initWithFormattingContext:v9 formattingStyle:2];
  v11 = [(HFUnknownConditionItem *)self condition];
  v12 = objc_msgSend(v11, "hf_naturalLanguageSummaryWithOptions:", v10);

  v13 = [v12 conditionTitle];
  [v6 setObject:v13 forKeyedSubscript:@"title"];

  v14 = (void *)MEMORY[0x263F58190];
  v15 = +[HFItemUpdateOutcome outcomeWithResults:v6];
  v16 = [v14 futureWithResult:v15];

  return v16;
}

- (HFCondition)condition
{
  return self->_condition;
}

- (void).cxx_destruct
{
}

@end