@interface HFTriggerDurationSummaryItem
- (HFTriggerBuilder)triggerBuilder;
- (HFTriggerDurationSummaryItem)initWithTriggerBuilder:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFTriggerDurationSummaryItem

- (HFTriggerDurationSummaryItem)initWithTriggerBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFTriggerDurationSummaryItem;
  v6 = [(HFTriggerDurationSummaryItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_triggerBuilder, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  id v5 = [(HFTriggerDurationSummaryItem *)self triggerBuilder];
  if (([v5 supportsEndEvents] & 1) == 0)
  {

    goto LABEL_6;
  }
  v6 = [(HFTriggerDurationSummaryItem *)self triggerBuilder];
  char v7 = [v6 areActionsAffectedByEndEvents];

  if ((v7 & 1) == 0)
  {
LABEL_6:
    [v4 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    goto LABEL_11;
  }
  v8 = _HFLocalizedStringWithDefaultValue(@"HFTriggerDurationSummaryTitle", @"HFTriggerDurationSummaryTitle", 1);
  [v4 setObject:v8 forKeyedSubscript:@"title"];

  objc_super v9 = NSNumber;
  v10 = [(HFTriggerDurationSummaryItem *)self triggerBuilder];
  v11 = [v10 home];
  v12 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v11, "hf_supportsSharedEventAutomation") ^ 1);
  [v4 setObject:v12 forKeyedSubscript:@"isDisabled"];

  v13 = [(HFTriggerDurationSummaryItem *)self triggerBuilder];
  v14 = [v13 designatedDurationEventBuilder];

  v15 = (void *)MEMORY[0x263F0E310];
  if (v14)
  {
    v16 = NSNumber;
    [v14 duration];
    v17 = objc_msgSend(v16, "numberWithDouble:");
  }
  else
  {
    v17 = 0;
  }
  v18 = objc_msgSend(v15, "hf_naturalLanguageTurnOffAfterDuration:style:", v17, 0);
  [v4 setObject:v18 forKeyedSubscript:@"description"];

  if (v14) {
LABEL_11:
  }
  v19 = (void *)MEMORY[0x263F58190];
  v20 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v21 = [v19 futureWithResult:v20];

  return v21;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void).cxx_destruct
{
}

@end