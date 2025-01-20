@interface CNPropertyIntentActionableCell
- (BOOL)shouldPerformDefaultAction;
- (NSArray)actions;
- (id)defaultContext;
- (id)transportsMapping;
- (void)performDefaultAction;
- (void)setActions:(id)a3;
- (void)transportButton1Clicked:(id)a3;
- (void)transportButton2Clicked:(id)a3;
- (void)transportButton3Clicked:(id)a3;
- (void)updateTransportButtons;
@end

@implementation CNPropertyIntentActionableCell

- (void).cxx_destruct
{
}

- (void)setActions:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)transportButton3Clicked:(id)a3
{
  id v7 = [(CNPropertyIntentActionableCell *)self actions];
  v4 = [v7 objectAtIndexedSubscript:2];
  v5 = [(CNPropertyIntentActionableCell *)self defaultContext];
  id v6 = (id)[v4 performActionWithContext:v5];
}

- (void)transportButton2Clicked:(id)a3
{
  id v7 = [(CNPropertyIntentActionableCell *)self actions];
  v4 = [v7 objectAtIndexedSubscript:1];
  v5 = [(CNPropertyIntentActionableCell *)self defaultContext];
  id v6 = (id)[v4 performActionWithContext:v5];
}

- (void)transportButton1Clicked:(id)a3
{
  id v7 = [(CNPropertyIntentActionableCell *)self actions];
  v4 = [v7 objectAtIndexedSubscript:0];
  v5 = [(CNPropertyIntentActionableCell *)self defaultContext];
  id v6 = (id)[v4 performActionWithContext:v5];
}

- (id)transportsMapping
{
  if (transportsMapping_cn_once_token_1 != -1) {
    dispatch_once(&transportsMapping_cn_once_token_1, &__block_literal_global_30396);
  }
  v2 = (void *)transportsMapping_cn_once_object_1;

  return v2;
}

void __51__CNPropertyIntentActionableCell_transportsMapping__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1AD78];
  v4[0] = *MEMORY[0x1E4F1AD20];
  v4[1] = v0;
  v5[0] = &unk_1ED9157A0;
  v5[1] = &unk_1ED9157B8;
  v4[2] = *MEMORY[0x1E4F1AD48];
  v5[2] = &unk_1ED9157D0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  uint64_t v2 = [v1 copy];
  v3 = (void *)transportsMapping_cn_once_object_1;
  transportsMapping_cn_once_object_1 = v2;
}

- (void)updateTransportButtons
{
  v3 = [(CNPropertySimpleTransportCell *)self transportIcon1];
  [v3 setTransportType:0];

  v4 = [(CNPropertySimpleTransportCell *)self transportIcon2];
  [v4 setTransportType:0];

  v5 = [(CNPropertySimpleTransportCell *)self transportIcon3];
  [v5 setTransportType:0];

  if ([(CNPropertySimpleTransportCell *)self allowsActions]
    && ![(CNPropertyCell *)self isSuggested])
  {
    id v6 = [(CNPropertyCell *)self delegate];
    id v7 = [v6 sharedActionsDataSource];
    v8 = [(CNPropertyCell *)self propertyItem];
    v9 = [v8 contactProperty];
    v10 = [v7 thirdPartyActionsForContactProperty:v9];
    id v17 = 0;
    v11 = [v10 result:&v17];
    id v12 = v17;
    [(CNPropertyIntentActionableCell *)self setActions:v11];

    v13 = [(CNPropertyIntentActionableCell *)self actions];
    if ([v13 count])
    {
      BOOL v14 = [(CNPropertySimpleTransportCell *)self shouldShowTransportButtons];

      if (!v14)
      {
LABEL_7:

        goto LABEL_8;
      }
      v13 = [(CNPropertyIntentActionableCell *)self actions];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __56__CNPropertyIntentActionableCell_updateTransportButtons__block_invoke;
      v16[3] = &unk_1E5498CF8;
      v16[4] = self;
      [v13 enumerateObjectsUsingBlock:v16];
    }

    goto LABEL_7;
  }
LABEL_8:
  v15.receiver = self;
  v15.super_class = (Class)CNPropertyIntentActionableCell;
  [(CNPropertySimpleTransportCell *)&v15 updateTransportButtons];
}

void __56__CNPropertyIntentActionableCell_updateTransportButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 transportsMapping];
  v8 = [v6 type];

  v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 integerValue];

  if (a3 == 2)
  {
    objc_super v15 = [*(id *)(a1 + 32) transportIcon3];
    [v15 setTransportType:v10];

    v16 = [*(id *)(a1 + 32) transportIcon3];
    [v16 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

    v13 = [*(id *)(a1 + 32) transportIcon3];
    BOOL v14 = &selRef_transportButton3Clicked_;
  }
  else if (a3 == 1)
  {
    id v17 = [*(id *)(a1 + 32) transportIcon2];
    [v17 setTransportType:v10];

    v18 = [*(id *)(a1 + 32) transportIcon2];
    [v18 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

    v13 = [*(id *)(a1 + 32) transportIcon2];
    BOOL v14 = &selRef_transportButton2Clicked_;
  }
  else
  {
    if (a3) {
      return;
    }
    v11 = [*(id *)(a1 + 32) transportIcon1];
    [v11 setTransportType:v10];

    id v12 = [*(id *)(a1 + 32) transportIcon1];
    [v12 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];

    v13 = [*(id *)(a1 + 32) transportIcon1];
    BOOL v14 = &selRef_transportButton1Clicked_;
  }
  id v19 = v13;
  [v13 addTarget:*(void *)(a1 + 32) action:*v14 forControlEvents:64];
}

- (void)performDefaultAction
{
  if ([(CNPropertyCell *)self isSuggested])
  {
    v11.receiver = self;
    v11.super_class = (Class)CNPropertyIntentActionableCell;
    [(CNPropertyCell *)&v11 performDefaultAction];
    return;
  }
  v3 = [(CNPropertyIntentActionableCell *)self actions];
  uint64_t v4 = [v3 count];

  v5 = [(CNPropertyIntentActionableCell *)self actions];
  id v10 = v5;
  if (v4 == 1)
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [(CNPropertyIntentActionableCell *)self defaultContext];
    id v8 = (id)[v6 performActionWithContext:v7];
  }
  else
  {
    uint64_t v9 = [v5 count];

    if (v9) {
      return;
    }
    id v10 = [(CNPropertyCell *)self propertyItem];
    +[CNPropertyAction performDefaultActionForItem:v10 sender:self];
  }
}

- (BOOL)shouldPerformDefaultAction
{
  v3 = [(CNPropertyIntentActionableCell *)self actions];
  BOOL v4 = [v3 count] == 1 || -[CNPropertyCell isSuggested](self, "isSuggested");

  return v4;
}

- (id)defaultContext
{
  uint64_t v2 = [(CNPropertyCell *)self delegate];
  v3 = [v2 contactViewCache];
  BOOL v4 = [v3 contactStore];

  id v5 = objc_alloc(MEMORY[0x1E4F5A708]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F5A608]);
  id v7 = (void *)[v5 initWithContactStore:v4 applicationWorkspace:v6];

  return v7;
}

@end