@interface HUShortcutItem
- (BOOL)selectable;
- (HFTriggerBuilder)triggerBuilder;
- (HUShortcutItem)init;
- (HUShortcutItem)initWithTriggerBuilder:(id)a3 selectable:(BOOL)a4;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUShortcutItem

- (HUShortcutItem)initWithTriggerBuilder:(id)a3 selectable:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUShortcutItem;
  v8 = [(HUShortcutItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);
    v9->_selectable = a4;
  }

  return v9;
}

- (HUShortcutItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithTriggerBuilder_selectable_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUShortcutItem.m", 31, @"%s is unavailable; use %@ instead",
    "-[HUShortcutItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HUShortcutItem *)self triggerBuilder];
  v6 = (void *)[v4 initWithTriggerBuilder:v5];

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = [(HUShortcutItem *)self triggerBuilder];

  if (!v4) {
    NSLog(&cfstr_Triggerbuilder_0.isa);
  }
  v5 = [(HUShortcutItem *)self triggerBuilder];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = [(HUShortcutItem *)self triggerBuilder];
    v8 = [v7 triggerActionSets];
    v9 = [v8 actionSetsSummary];

    v10 = [v9 summaryText];
    objc_super v11 = [v9 summaryIconDescriptors];
    v12 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryShortcutsItemTitle", @"HUTriggerSummaryShortcutsItemTitle", 1);
    [v6 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

    [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F68980]];
    [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F689F0]];
    if (![(HUShortcutItem *)self selectable]) {
      [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A20]];
    }
    v13 = (void *)MEMORY[0x1E4F7A0D8];
    v14 = [MEMORY[0x1E4F69228] outcomeWithResults:v6];
    v15 = [v13 futureWithResult:v14];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F7A0D8];
    v6 = objc_msgSend(MEMORY[0x1E4F28C58], "hf_errorWithCode:", 30);
    v15 = [v16 futureWithError:v6];
  }

  return v15;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (void).cxx_destruct
{
}

@end