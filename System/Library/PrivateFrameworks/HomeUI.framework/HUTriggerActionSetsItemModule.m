@interface HUTriggerActionSetsItemModule
- (BOOL)prioritizedAccessoriesContainsMediaProfiles:(id)a3;
- (BOOL)prioritizedAccessoriesContainsServices:(id)a3;
- (BOOL)shouldShowPrioritizedActions;
- (HFStaticItem)actionSetsGridItem;
- (HFStaticItem)prioritizedServiceActionsGridItem;
- (HFStaticItem)serviceActionsGridItem;
- (HFTriggerBuilder)triggerBuilder;
- (HUShortcutItem)shortcutItem;
- (HUTriggerActionFlow)flow;
- (HUTriggerActionSetsItemModule)initWithTriggerBuilder:(id)a3 flow:(id)a4 itemUpdater:(id)a5;
- (NSSet)prioritizedAccessories;
- (id)_buildItemProviders;
- (id)_itemsToHideForStandardTriggerInSet:(id)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)_staticItems;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)setActionSetsGridItem:(id)a3;
- (void)setPrioritizedAccessories:(id)a3;
- (void)setPrioritizedServiceActionsGridItem:(id)a3;
- (void)setServiceActionsGridItem:(id)a3;
- (void)setShortcutItem:(id)a3;
- (void)setTriggerBuilder:(id)a3;
@end

@implementation HUTriggerActionSetsItemModule

- (HUTriggerActionSetsItemModule)initWithTriggerBuilder:(id)a3 flow:(id)a4 itemUpdater:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HUTriggerActionSetsItemModule;
  v11 = [(HFItemModule *)&v14 initWithItemUpdater:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_triggerBuilder, a3);
    objc_storeStrong((id *)&v12->_flow, a4);
  }

  return v12;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    v4 = [(HUTriggerActionSetsItemModule *)self _buildItemProviders];
    v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }

  return itemProviders;
}

- (id)_buildItemProviders
{
  id v3 = objc_alloc(MEMORY[0x1E4F695C8]);
  v4 = [(HUTriggerActionSetsItemModule *)self _staticItems];
  v5 = (void *)[v3 initWithItems:v4];

  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];

  return v6;
}

- (id)_staticItems
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v5 = MEMORY[0x1E4F1CC08];
  v6 = (void *)[v4 initWithResults:MEMORY[0x1E4F1CC08]];
  [(HUTriggerActionSetsItemModule *)self setActionSetsGridItem:v6];

  v7 = [(HUTriggerActionSetsItemModule *)self actionSetsGridItem];
  objc_msgSend(v3, "na_safeAddObject:", v7);

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F695C0]) initWithResults:v5];
  [(HUTriggerActionSetsItemModule *)self setServiceActionsGridItem:v8];

  id v9 = [(HUTriggerActionSetsItemModule *)self serviceActionsGridItem];
  objc_msgSend(v3, "na_safeAddObject:", v9);

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F695C0]) initWithResults:v5];
  [(HUTriggerActionSetsItemModule *)self setPrioritizedServiceActionsGridItem:v10];

  v11 = [(HUTriggerActionSetsItemModule *)self prioritizedServiceActionsGridItem];
  objc_msgSend(v3, "na_safeAddObject:", v11);

  v12 = [(HUTriggerActionSetsItemModule *)self triggerBuilder];
  LODWORD(v9) = [v12 isShortcutOwned];

  if (v9)
  {
    v13 = [(HUTriggerActionSetsItemModule *)self flow];
    BOOL v14 = [v13 flowState] == 3;

    v15 = [HUShortcutItem alloc];
    v16 = [(HUTriggerActionSetsItemModule *)self triggerBuilder];
    v17 = [(HUShortcutItem *)v15 initWithTriggerBuilder:v16 selectable:v14];
    [(HUTriggerActionSetsItemModule *)self setShortcutItem:v17];

    v18 = [(HUTriggerActionSetsItemModule *)self shortcutItem];
    [v3 addObject:v18];
  }

  return v3;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  v6 = [(HUTriggerActionSetsItemModule *)self triggerBuilder];
  char v7 = [v6 isShortcutOwned];

  if (v7)
  {
    v8 = [(HUTriggerActionSetsItemModule *)self actionSetsGridItem];
    [v5 addObject:v8];

    id v9 = [(HUTriggerActionSetsItemModule *)self serviceActionsGridItem];
    [v5 addObject:v9];

    id v10 = [(HUTriggerActionSetsItemModule *)self prioritizedServiceActionsGridItem];
    [v5 addObject:v10];
  }
  else
  {
    v11 = [(HUTriggerActionSetsItemModule *)self _itemsToHideForStandardTriggerInSet:v4];
    [v5 unionSet:v11];

    id v10 = [(HUTriggerActionSetsItemModule *)self shortcutItem];
    objc_msgSend(v5, "na_safeAddObject:", v10);
  }

  if (![(HUTriggerActionSetsItemModule *)self shouldShowPrioritizedActions])
  {
    v12 = [(HUTriggerActionSetsItemModule *)self prioritizedServiceActionsGridItem];
    [v5 addObject:v12];
  }

  return v5;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithIdentifier:@"HUTriggerActionSetsItemModuleSectionIdentifierActionSets"];
  char v7 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerActionSetsItemModuleSectionIdentifierPrioritizedServiceActions"];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerActionSetsItemModuleSectionIdentifierServiceActions"];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerActionSetsItemModuleSectionIdentifierShortcuts"];
  id v10 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryActionSetsInstructionTitle", @"HUTriggerSummaryActionSetsInstructionTitle", 1);
  [v6 setHeaderTitle:v10];

  v11 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryActionSetsInstructionDescription", @"HUTriggerSummaryActionSetsInstructionDescription", 1);
  [v6 setHeaderSecondaryText:v11];

  v12 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryPrioritizedServiceActionsInstructionTitle_Single", @"HUTriggerSummaryPrioritizedServiceActionsInstructionTitle_Single", 1);
  [v7 setHeaderTitle:v12];

  if ([(HUTriggerActionSetsItemModule *)self shouldShowPrioritizedActions]) {
    v13 = @"HUTriggerSummaryOtherServiceActionsInstructionTitle";
  }
  else {
    v13 = @"HUTriggerSummaryServiceActionsInstructionTitle";
  }
  BOOL v14 = _HULocalizedStringWithDefaultValue(v13, v13, 1);
  [v8 setHeaderTitle:v14];

  v15 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryShortcutsInstructionTitle", @"HUTriggerSummaryShortcutsInstructionTitle", 1);
  [v9 setHeaderTitle:v15];

  v16 = [(HUTriggerActionSetsItemModule *)self actionSetsGridItem];
  v32[0] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v6 setItems:v17];

  v18 = [(HUTriggerActionSetsItemModule *)self prioritizedServiceActionsGridItem];
  v31 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [v7 setItems:v19];

  v20 = [(HUTriggerActionSetsItemModule *)self serviceActionsGridItem];
  v30 = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  [v8 setItems:v21];

  v22 = (void *)MEMORY[0x1E4F1C978];
  v23 = [(HUTriggerActionSetsItemModule *)self shortcutItem];
  v24 = objc_msgSend(v22, "na_arrayWithSafeObject:", v23);
  [v9 setItems:v24];

  v25 = (void *)MEMORY[0x1E4F69220];
  v29[0] = v6;
  v29[1] = v7;
  v29[2] = v8;
  v29[3] = v9;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  v27 = [v25 filterSections:v26 toDisplayedItems:v5];

  return v27;
}

- (id)_itemsToHideForStandardTriggerInSet:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  v6 = [(HUTriggerActionSetsItemModule *)self triggerBuilder];
  char v7 = [v6 triggerActionSets];
  v8 = [v7 namedActionSets];

  id v9 = objc_msgSend(v8, "na_filter:", &__block_literal_global_36);

  if (![v9 count])
  {
    id v10 = [(HUTriggerActionSetsItemModule *)self actionSetsGridItem];
    int v11 = [v4 containsObject:v10];

    if (v11)
    {
      v12 = [(HUTriggerActionSetsItemModule *)self actionSetsGridItem];
      [v5 addObject:v12];
    }
  }
  v13 = [(HUTriggerActionSetsItemModule *)self triggerBuilder];
  BOOL v14 = [v13 triggerActionSets];
  v15 = [v14 anonymousActionSetBuilder];
  v16 = [v15 actions];
  if ([v16 count])
  {
  }
  else
  {
    v17 = [(HUTriggerActionSetsItemModule *)self serviceActionsGridItem];
    int v18 = [v4 containsObject:v17];

    if (!v18) {
      goto LABEL_9;
    }
    v13 = [(HUTriggerActionSetsItemModule *)self serviceActionsGridItem];
    [v5 addObject:v13];
  }

LABEL_9:
  if ([(HUTriggerActionSetsItemModule *)self shouldShowPrioritizedActions])
  {
    v19 = [(HUTriggerActionSetsItemModule *)self triggerBuilder];
    v20 = [v19 triggerActionSets];
    v21 = [v20 anonymousActionSetBuilder];
    v22 = [v21 actions];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __69__HUTriggerActionSetsItemModule__itemsToHideForStandardTriggerInSet___block_invoke_2;
    v29[3] = &unk_1E6387188;
    void v29[4] = self;
    char v23 = objc_msgSend(v22, "na_any:", v29);

    if (v23) {
      goto LABEL_15;
    }
    uint64_t v24 = [(HUTriggerActionSetsItemModule *)self serviceActionsGridItem];
  }
  else
  {
    v25 = [(HUTriggerActionSetsItemModule *)self prioritizedServiceActionsGridItem];
    int v26 = [v4 containsObject:v25];

    if (!v26) {
      goto LABEL_15;
    }
    uint64_t v24 = [(HUTriggerActionSetsItemModule *)self prioritizedServiceActionsGridItem];
  }
  v27 = (void *)v24;
  [v5 addObject:v24];

LABEL_15:

  return v5;
}

BOOL __69__HUTriggerActionSetsItemModule__itemsToHideForStandardTriggerInSet___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

uint64_t __69__HUTriggerActionSetsItemModule__itemsToHideForStandardTriggerInSet___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    char v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v9 = [v6 characteristic];
    id v10 = [v9 service];
    int v11 = [v8 setWithObject:v10];
    int v12 = [v7 prioritizedAccessoriesContainsServices:v11];
  }
  else
  {
    objc_opt_class();
    id v9 = v4;
    if (objc_opt_isKindOfClass()) {
      v13 = v9;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (!v14)
    {
      id v9 = 0;
      uint64_t v16 = 1;
      goto LABEL_12;
    }
    v15 = *(void **)(a1 + 32);
    id v10 = [v14 mediaProfiles];
    int v12 = [v15 prioritizedAccessoriesContainsMediaProfiles:v10];
  }
  uint64_t v16 = v12 ^ 1u;

LABEL_12:
  return v16;
}

- (BOOL)prioritizedAccessoriesContainsServices:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerActionSetsItemModule *)self prioritizedAccessories];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsServices___block_invoke;
  v9[3] = &unk_1E63871B0;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __72__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsServices___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "hf_containedServices");
  uint64_t v4 = [v3 intersectsSet:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)prioritizedAccessoriesContainsMediaProfiles:(id)a3
{
  id v4 = a3;
  id v5 = [(HUTriggerActionSetsItemModule *)self prioritizedAccessories];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsMediaProfiles___block_invoke;
  v9[3] = &unk_1E63871B0;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __77__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsMediaProfiles___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsMediaProfiles___block_invoke_2;
  v8[3] = &unk_1E63870E0;
  id v9 = v3;
  id v5 = v3;
  uint64_t v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __77__HUTriggerActionSetsItemModule_prioritizedAccessoriesContainsMediaProfiles___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = objc_msgSend(v2, "hf_containedProfiles");
  id v5 = [v3 mediaProfiles];

  uint64_t v6 = [v4 intersectsSet:v5];
  return v6;
}

- (BOOL)shouldShowPrioritizedActions
{
  id v3 = [(HUTriggerActionSetsItemModule *)self prioritizedAccessories];
  if ([v3 count])
  {
    id v4 = [(HUTriggerActionSetsItemModule *)self triggerBuilder];
    id v5 = [v4 triggerActionSets];
    uint64_t v6 = [v5 anonymousActionSetBuilder];
    char v7 = [v6 actions];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__HUTriggerActionSetsItemModule_shouldShowPrioritizedActions__block_invoke;
    v10[3] = &unk_1E6387188;
    v10[4] = self;
    char v8 = objc_msgSend(v7, "na_any:", v10);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

uint64_t __61__HUTriggerActionSetsItemModule_shouldShowPrioritizedActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    char v7 = *(void **)(a1 + 32);
    char v8 = (void *)MEMORY[0x1E4F1CAD0];
    id v9 = [v6 characteristic];
    id v10 = [v9 service];
    int v11 = [v8 setWithObject:v10];
    uint64_t v12 = [v7 prioritizedAccessoriesContainsServices:v11];
  }
  else
  {
    objc_opt_class();
    id v9 = v4;
    if (objc_opt_isKindOfClass()) {
      v13 = v9;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    if (!v14)
    {
      id v9 = 0;
      uint64_t v12 = 0;
      goto LABEL_12;
    }
    v15 = *(void **)(a1 + 32);
    id v10 = [v14 mediaProfiles];
    uint64_t v12 = [v15 prioritizedAccessoriesContainsMediaProfiles:v10];
  }

LABEL_12:
  return v12;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
}

- (HUTriggerActionFlow)flow
{
  return self->_flow;
}

- (HFStaticItem)actionSetsGridItem
{
  return self->_actionSetsGridItem;
}

- (void)setActionSetsGridItem:(id)a3
{
}

- (HFStaticItem)serviceActionsGridItem
{
  return self->_serviceActionsGridItem;
}

- (void)setServiceActionsGridItem:(id)a3
{
}

- (HFStaticItem)prioritizedServiceActionsGridItem
{
  return self->_prioritizedServiceActionsGridItem;
}

- (void)setPrioritizedServiceActionsGridItem:(id)a3
{
}

- (HUShortcutItem)shortcutItem
{
  return self->_shortcutItem;
}

- (void)setShortcutItem:(id)a3
{
}

- (NSSet)prioritizedAccessories
{
  return self->_prioritizedAccessories;
}

- (void)setPrioritizedAccessories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritizedAccessories, 0);
  objc_storeStrong((id *)&self->_shortcutItem, 0);
  objc_storeStrong((id *)&self->_prioritizedServiceActionsGridItem, 0);
  objc_storeStrong((id *)&self->_serviceActionsGridItem, 0);
  objc_storeStrong((id *)&self->_actionSetsGridItem, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end