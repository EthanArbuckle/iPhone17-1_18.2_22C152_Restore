@interface HFPlaceholderTriggerBuilder
+ (id)createPlaceholderTriggerForHome:(id)a3 withTriggerActionSetBuilder:(id)a4 context:(id)a5;
- (BOOL)isEditing;
- (id)commitItem;
- (id)naturalLanguageNameOfType:(unint64_t)a3;
- (void)setIsEditing:(BOOL)a3;
@end

@implementation HFPlaceholderTriggerBuilder

+ (id)createPlaceholderTriggerForHome:(id)a3 withTriggerActionSetBuilder:(id)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(HFTriggerBuilder *)[HFPlaceholderTriggerBuilder alloc] initWithHome:v9 context:v7];

  [(HFTriggerBuilder *)v10 setName:@"Placeholder Trigger"];
  v11 = [(HFTriggerBuilder *)v10 triggerActionSets];
  [v11 setFromTriggerActionSetsBuilder:v8];

  v12 = [(HFTriggerBuilder *)v10 triggerActionSets];
  -[HFPlaceholderTriggerBuilder setIsEditing:](v10, "setIsEditing:", [v12 hasActions]);

  return v10;
}

- (id)naturalLanguageNameOfType:(unint64_t)a3
{
  return _HFLocalizedStringWithDefaultValue(@"HFPlaceholderTriggerName", @"HFPlaceholderTriggerName", 1);
}

- (id)commitItem
{
  v3 = [(HFTriggerBuilder *)self triggerActionSets];
  v4 = [v3 allActionBuilders];

  v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_197);
  v6 = [MEMORY[0x263F58190] combineAllFutures:v5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __41__HFPlaceholderTriggerBuilder_commitItem__block_invoke_2;
  v9[3] = &unk_26408F1C0;
  v9[4] = self;
  id v7 = [v6 recover:v9];

  return v7;
}

uint64_t __41__HFPlaceholderTriggerBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 performValidation];
}

id __41__HFPlaceholderTriggerBuilder_commitItem__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 isEditing];
  v5 = HFOperationEditTrigger;
  if (!v4) {
    v5 = HFOperationAddTrigger;
  }
  v6 = (void *)MEMORY[0x263F58190];
  id v7 = objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", *v5, 0);

  id v8 = [v6 futureWithError:v7];

  return v8;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

@end