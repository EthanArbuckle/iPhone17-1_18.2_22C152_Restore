@interface HFActionSetSuggestionItem
- (BOOL)hasEverHadValidSuggestion;
- (BOOL)includeExistingActionSets;
- (BOOL)persistAddedSuggestions;
- (HFActionSetSuggestionItem)init;
- (HFActionSetSuggestionItem)initWithHome:(id)a3 actionSet:(id)a4;
- (HFServiceLikeItem)serviceLikeItem;
- (HMActionSet)actionSet;
- (HMHome)home;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setHasEverHadValidSuggestion:(BOOL)a3;
- (void)setIncludeExistingActionSets:(BOOL)a3;
- (void)setPersistAddedSuggestions:(BOOL)a3;
- (void)setServiceLikeItem:(id)a3;
@end

@implementation HFActionSetSuggestionItem

- (HFActionSetSuggestionItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HFActionSetSuggestionItem.m" lineNumber:32 description:@"Use -initWithHome:builtInActionSetType:"];

  return 0;
}

- (HFActionSetSuggestionItem)initWithHome:(id)a3 actionSet:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFActionSetSuggestionItem;
  v9 = [(HFActionSetSuggestionItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_actionSet, a4);
  }

  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HFMutableItemUpdateOutcome);
  v6 = [MEMORY[0x263F58190] futureWithResult:v5];
  id v7 = [(HFActionSetSuggestionItem *)self actionSet];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x263EFFA08];
    v9 = [(HFActionSetSuggestionItem *)self actionSet];
    v10 = [v8 setWithObject:v9];
    [(HFMutableItemUpdateOutcome *)v5 setObject:v10 forKeyedSubscript:@"dependentHomeKitObjects"];

    v11 = [(HFActionSetSuggestionItem *)self serviceLikeItem];

    if (v11)
    {
      objc_super v12 = [(HFActionSetSuggestionItem *)self serviceLikeItem];
      v13 = [v12 services];
      v14 = [v13 allObjects];
      v11 = +[HFActionSetSuggestionFilter filterWithServices:v14];
    }
    v15 = [HFActionSetSuggestionVendor alloc];
    v16 = [(HFActionSetSuggestionItem *)self home];
    v17 = [(HFActionSetSuggestionItem *)self actionSet];
    v51 = v11;
    v18 = [(HFActionSetSuggestionVendor *)v15 initWithHome:v16 actionSet:v17 filter:v11];

    id v54 = 0;
    v19 = [(HFActionSetSuggestionVendor *)v18 buildWithOutDependentServiceTypes:&v54];
    id v20 = v54;
    [(HFMutableItemUpdateOutcome *)v5 setObject:v20 forKeyedSubscript:@"dependentServiceTypes"];
    [(HFMutableItemUpdateOutcome *)v5 setObject:v19 forKeyedSubscript:@"actionSetBuilder"];
    v21 = [v19 name];
    [(HFMutableItemUpdateOutcome *)v5 setObject:v21 forKeyedSubscript:@"title"];

    v22 = [(HFActionSetSuggestionItem *)self actionSet];
    v23 = objc_msgSend(v22, "hf_iconDescriptor");
    [(HFMutableItemUpdateOutcome *)v5 setObject:v23 forKeyedSubscript:@"icon"];

    v24 = [v19 actions];
    int v25 = objc_msgSend(v24, "na_any:", &__block_literal_global_47);

    if ([(HFActionSetSuggestionItem *)self includeExistingActionSets])
    {
      int v26 = 0;
    }
    else
    {
      v28 = [(HFActionSetSuggestionItem *)self actionSet];
      [v28 actions];
      v50 = v5;
      v29 = v19;
      id v30 = v20;
      v31 = v6;
      v32 = v18;
      v34 = id v33 = v4;
      int v26 = [v34 count] != 0;

      id v4 = v33;
      v18 = v32;
      v6 = v31;
      id v20 = v30;
      v19 = v29;
      v5 = v50;
    }
    if ([(HFActionSetSuggestionItem *)self persistAddedSuggestions])
    {
      if (v25) {
        [(HFActionSetSuggestionItem *)self setHasEverHadValidSuggestion:1];
      }
      int v35 = [(HFActionSetSuggestionItem *)self hasEverHadValidSuggestion];
      v25 |= v35;
      v26 &= ~v35;
    }
    if (!v25 || v26)
    {
      [(HFMutableItemUpdateOutcome *)v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    }
    else
    {
      id v36 = v4;
      v37 = [(HFActionSetSuggestionItem *)self serviceLikeItem];

      if (v37)
      {
        v38 = [(HFActionSetSuggestionItem *)self serviceLikeItem];
        v39 = [[HFActionSetValueSource alloc] initWithActionSetBuilder:v19];
        v40 = (void *)[v38 copyWithValueSource:v39];

        v41 = [HFServiceActionItem alloc];
        v42 = [(HFActionSetSuggestionItem *)self home];
        v43 = [(HFServiceActionItem *)v41 initWithHome:v42 containingItem:v40];

        v44 = (void *)MEMORY[0x263EFFA08];
        v45 = [v19 actions];
        v46 = [v44 setWithArray:v45];
        [(HFServiceActionItem *)v43 setActionBuilders:v46];

        v47 = [(HFItem *)v43 updateWithOptions:v36];
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __57__HFActionSetSuggestionItem__subclass_updateWithOptions___block_invoke_2;
        v52[3] = &unk_26408E470;
        v53 = v5;
        uint64_t v48 = [v47 flatMap:v52];

        id v4 = v36;
        v6 = (void *)v48;
      }
      else
      {
        id v4 = v36;
      }
    }
    id v27 = v6;
  }
  else
  {
    [(HFMutableItemUpdateOutcome *)v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"hidden"];
    id v27 = v6;
  }

  return v27;
}

BOOL __57__HFActionSetSuggestionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 action];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __57__HFActionSetSuggestionItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 objectForKeyedSubscript:@"description"];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"description"];

  id v4 = (void *)MEMORY[0x263F58190];
  uint64_t v5 = *(void *)(a1 + 32);
  return [v4 futureWithResult:v5];
}

- (HMHome)home
{
  return self->_home;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (HFServiceLikeItem)serviceLikeItem
{
  return self->_serviceLikeItem;
}

- (void)setServiceLikeItem:(id)a3
{
}

- (BOOL)includeExistingActionSets
{
  return self->_includeExistingActionSets;
}

- (void)setIncludeExistingActionSets:(BOOL)a3
{
  self->_includeExistingActionSets = a3;
}

- (BOOL)persistAddedSuggestions
{
  return self->_persistAddedSuggestions;
}

- (void)setPersistAddedSuggestions:(BOOL)a3
{
  self->_persistAddedSuggestions = a3;
}

- (BOOL)hasEverHadValidSuggestion
{
  return self->_hasEverHadValidSuggestion;
}

- (void)setHasEverHadValidSuggestion:(BOOL)a3
{
  self->_hasEverHadValidSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLikeItem, 0);
  objc_storeStrong((id *)&self->_actionSet, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end