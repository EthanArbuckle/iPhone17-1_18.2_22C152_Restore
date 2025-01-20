@interface HFTriggerAnonymousActionSetBuilder
- (BOOL)hasActions;
- (BOOL)useActionSetBuilder;
- (HFTriggerAnonymousActionSetBuilder)initWithExistingObject:(id)a3 inHome:(id)a4;
- (HMTrigger)containingTrigger;
- (id)commitItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createActionSetBuilder;
- (id)deleteActionSet;
- (id)getOrCreateActionSet;
- (id)shortcutsComponentActionSet;
- (unint64_t)actionSetType;
- (void)addAction:(id)a3 actionSetType:(unint64_t)a4;
- (void)setActionSetType:(unint64_t)a3;
- (void)setContainingTrigger:(id)a3;
- (void)updateAction:(id)a3;
- (void)updateActionBuildersDiff:(id)a3;
@end

@implementation HFTriggerAnonymousActionSetBuilder

- (HFTriggerAnonymousActionSetBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HFTriggerAnonymousActionSetBuilder;
  v4 = [(HFAbstractBaseActionSetBuilder *)&v7 initWithExistingObject:a3 inHome:a4];
  v5 = v4;
  if (v4) {
    [(HFTriggerAnonymousActionSetBuilder *)v4 setActionSetType:0];
  }
  return v5;
}

- (BOOL)hasActions
{
  v2 = [(HFAbstractBaseActionSetBuilder *)self actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)shortcutsComponentActionSet
{
  BOOL v3 = [(HFAbstractBaseActionSetBuilder *)self actions];
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_1);
  v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_3);

  v6 = [(HFItemBuilder *)self home];
  objc_super v7 = [MEMORY[0x263EFFA08] setWithArray:v5];
  v8 = objc_msgSend(v6, "hf_shortcutsComponentActionSetWithActions:", v7);

  if (!v8) {
    NSLog(&cfstr_FailedToCreate.isa, self);
  }

  return v8;
}

uint64_t __65__HFTriggerAnonymousActionSetBuilder_shortcutsComponentActionSet__block_invoke(uint64_t a1, void *a2)
{
  return [a2 createNewAction];
}

BOOL __65__HFTriggerAnonymousActionSetBuilder_shortcutsComponentActionSet__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (id)getOrCreateActionSet
{
  BOOL v3 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
  if (!v3)
  {
    BOOL v3 = [(HFTriggerAnonymousActionSetBuilder *)self shortcutsComponentActionSet];
  }
  return v3;
}

- (void)addAction:(id)a3 actionSetType:(unint64_t)a4
{
  id v6 = a3;
  if ([(HFTriggerAnonymousActionSetBuilder *)self actionSetType] != a4)
  {
    [(HFTriggerAnonymousActionSetBuilder *)self setActionSetType:a4];
    goto LABEL_5;
  }
  if ([(HFTriggerAnonymousActionSetBuilder *)self actionSetType] == 1) {
LABEL_5:
  }
    [(HFAbstractBaseActionSetBuilder *)self removeAllActions];
  [(HFAbstractBaseActionSetBuilder *)self addAction:v6];
}

- (void)updateActionBuildersDiff:(id)a3
{
  id v4 = a3;
  id v5 = (id)[v4 mutableCopyWithZone:MEMORY[0x21053E8E0]()];

  [(HFAbstractBaseActionSetBuilder *)self setActionBuilders:v5];
}

- (void)updateAction:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
  id v6 = [v5 fromSet];
  objc_super v7 = [(HFAbstractBaseActionSetBuilder *)self existingActionBuilder:v4 inSet:v6];

  if (v7) {
    goto LABEL_3;
  }
  [0 updateWithActionBuilder:v4];
  v8 = [(HFAbstractBaseActionSetBuilder *)self actionBuilders];
  v9 = [v8 toSet];
  objc_super v7 = [(HFAbstractBaseActionSetBuilder *)self existingActionBuilder:v4 inSet:v9];

  if (v7)
  {
LABEL_3:
    v10.receiver = self;
    v10.super_class = (Class)HFTriggerAnonymousActionSetBuilder;
    [(HFAbstractBaseActionSetBuilder *)&v10 updateAction:v4];
  }
}

- (id)deleteActionSet
{
  [(HFAbstractBaseActionSetBuilder *)self removeAllActions];
  v2 = (void *)MEMORY[0x263F58190];
  return (id)[v2 futureWithNoResult];
}

- (id)createActionSetBuilder
{
  objc_opt_class();
  BOOL v3 = [(HFTriggerAnonymousActionSetBuilder *)self containingTrigger];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [v5 triggerOwnedActionSet];
    [(HFAbstractBaseActionSetBuilder *)self updateActionsInBuilder:v6];
    objc_super v7 = [MEMORY[0x263F58190] futureWithResult:v6];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (BOOL)useActionSetBuilder
{
  objc_opt_class();
  BOOL v3 = [(HFTriggerAnonymousActionSetBuilder *)self containingTrigger];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  id v5 = [(HFItemBuilder *)self home];
  char v6 = [v5 areAutomationBuildersSupported];
  if (v4) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)commitItem
{
  v36[2] = *MEMORY[0x263EF8340];
  BOOL v3 = [(HFTriggerAnonymousActionSetBuilder *)self containingTrigger];

  if (!v3) {
    NSLog(&cfstr_CanTCommitAHft.isa);
  }
  id v4 = [(HFTriggerAnonymousActionSetBuilder *)self containingTrigger];

  if (!v4)
  {
    v23 = (void *)MEMORY[0x263F58190];
    v8 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    id v5 = [v23 futureWithError:v8];
LABEL_13:

    goto LABEL_18;
  }
  if (![(HFTriggerAnonymousActionSetBuilder *)self useActionSetBuilder]
    || ([(HFTriggerAnonymousActionSetBuilder *)self createActionSetBuilder],
        (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v6 = [(HFAbstractBaseActionSetBuilder *)self actions];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      v24 = [(HFAbstractBaseActionSetBuilder *)self actionSet];

      if (v24)
      {
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke;
        v35[3] = &unk_26408CD50;
        v35[4] = self;
        uint64_t v25 = [MEMORY[0x263F58190] futureWithErrorOnlyHandlerAdapterBlock:v35];
      }
      else
      {
        uint64_t v25 = [MEMORY[0x263F58190] futureWithNoResult];
      }
      id v5 = (void *)v25;
      goto LABEL_18;
    }
    v8 = [MEMORY[0x263F58190] futureWithNoResult];
    v9 = [(HFAbstractBaseActionSetBuilder *)self actionSet];
    objc_super v10 = HFOperationEditTrigger;
    if (!v9) {
      objc_super v10 = HFOperationAddTrigger;
    }
    v11 = *v10;

    v12 = [(HFAbstractBaseActionSetBuilder *)self actionSet];

    if (!v12)
    {
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_2;
      v34[3] = &unk_26408CD78;
      v34[4] = self;
      v13 = [MEMORY[0x263F58190] futureWithCompletionHandlerAdapterBlock:v34];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_3;
      v33[3] = &unk_26408CDC8;
      v33[4] = self;
      v14 = [v13 flatMap:v33];

      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_5;
      v32[3] = &unk_26408C8A0;
      v32[4] = self;
      id v15 = (id)[v14 addSuccessBlock:v32];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_21;
      v31[3] = &unk_26408CDF0;
      v31[4] = self;
      id v16 = (id)[v14 addFailureBlock:v31];
      v8 = v14;
    }
    v17 = (void *)MEMORY[0x263F58190];
    v36[0] = v8;
    v18 = [(HFAbstractBaseActionSetBuilder *)self lazilyUpdateActions];
    v36[1] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    v20 = [v17 chainFutures:v19];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_24;
    v28[3] = &unk_26408CE18;
    v29 = v11;
    v30 = self;
    v21 = v11;
    v22 = [v20 recover:v28];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_2_26;
    v27[3] = &unk_26408CDC8;
    v27[4] = self;
    id v5 = [v22 flatMap:v27];

    goto LABEL_13;
  }
LABEL_18:
  return v5;
}

void __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 containingTrigger];
  id v5 = [*(id *)(a1 + 32) actionSet];
  [v6 removeActionSet:v5 completionHandler:v4];
}

void __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 containingTrigger];
  [v4 addActionSetOfType:*MEMORY[0x263F0B948] completionHandler:v3];
}

id __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[HFHomeKitDispatcher sharedDispatcher];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_4;
  v7[3] = &unk_26408CDA0;
  v7[4] = *(void *)(a1 + 32);
  [v4 dispatchHomeObserverMessage:v7 sender:0];

  id v5 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v5;
}

void __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    id v4 = [*(id *)(a1 + 32) containingTrigger];
    [v5 home:v3 didUpdateTrigger:v4];
  }
}

void __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) containingTrigger];
    id v6 = objc_msgSend(v5, "hf_prettyDescription");
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Created anonoymous action set for trigger: %@.", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(a1 + 32) setActionSet:v3];
}

void __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = [*(id *)(a1 + 32) containingTrigger];
    id v6 = objc_msgSend(v5, "hf_prettyDescription");
    int v7 = 138412546;
    v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to create anonoymous action set for trigger: %@. Error: %@", (uint8_t *)&v7, 0x16u);
  }
}

id __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F58190];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  int v7 = [v5 containingTrigger];
  v8 = [*(id *)(a1 + 40) home];
  __int16 v9 = objc_msgSend(v7, "hf_naturalLanguageNameWithHome:type:", v8, 2);
  id v10 = objc_msgSend(v6, "hf_errorWithOperationType:failedItemName:", v4, v9);

  uint64_t v11 = [v3 futureWithError:v10];

  return v11;
}

id __48__HFTriggerAnonymousActionSetBuilder_commitItem__block_invoke_2_26(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F58190];
  v2 = [*(id *)(a1 + 32) actionSet];
  id v3 = [v1 futureWithResult:v2];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HFTriggerAnonymousActionSetBuilder;
  id v4 = [(HFAbstractBaseActionSetBuilder *)&v7 copyWithZone:a3];
  id v5 = [(HFTriggerAnonymousActionSetBuilder *)self containingTrigger];
  [v4 setContainingTrigger:v5];

  objc_msgSend(v4, "setActionSetType:", -[HFTriggerAnonymousActionSetBuilder actionSetType](self, "actionSetType"));
  return v4;
}

- (HMTrigger)containingTrigger
{
  return self->_containingTrigger;
}

- (void)setContainingTrigger:(id)a3
{
}

- (unint64_t)actionSetType
{
  return self->_actionSetType;
}

- (void)setActionSetType:(unint64_t)a3
{
  self->_actionSetType = a3;
}

- (void).cxx_destruct
{
}

@end