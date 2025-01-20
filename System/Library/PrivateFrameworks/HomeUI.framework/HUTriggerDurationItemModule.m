@interface HUTriggerDurationItemModule
- (BOOL)_shouldShowDurationItems;
- (BOOL)durationPickerShown;
- (HFItem)durationPickerItem;
- (HFItemManager)itemManager;
- (HFTriggerBuilder)triggerBuilder;
- (HFTriggerDurationSummaryItem)durationSummaryItem;
- (HUTriggerDurationItemModule)initWithTriggerBuilder:(id)a3 itemUpdater:(id)a4;
- (id)_buildItemProviders;
- (id)_itemsToHideInSet:(id)a3;
- (id)_staticItems;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)setDurationPickerItem:(id)a3;
- (void)setDurationPickerShown:(BOOL)a3;
- (void)setDurationSummaryItem:(id)a3;
- (void)setItemManager:(id)a3;
- (void)setTriggerBuilder:(id)a3;
@end

@implementation HUTriggerDurationItemModule

- (HUTriggerDurationItemModule)initWithTriggerBuilder:(id)a3 itemUpdater:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerDurationItemModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);
  }

  return v9;
}

- (id)_staticItems
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = objc_alloc(MEMORY[0x1E4F696C8]);
  v5 = [(HUTriggerDurationItemModule *)self triggerBuilder];
  v6 = (void *)[v4 initWithTriggerBuilder:v5];
  [(HUTriggerDurationItemModule *)self setDurationSummaryItem:v6];

  id v7 = [(HUTriggerDurationItemModule *)self durationSummaryItem];
  objc_msgSend(v3, "na_safeAddObject:", v7);

  objc_initWeak(&location, self);
  id v8 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __43__HUTriggerDurationItemModule__staticItems__block_invoke;
  v15 = &unk_1E6384FD0;
  objc_copyWeak(&v16, &location);
  v9 = (void *)[v8 initWithResultsBlock:&v12];
  -[HUTriggerDurationItemModule setDurationPickerItem:](self, "setDurationPickerItem:", v9, v12, v13, v14, v15);

  v10 = [(HUTriggerDurationItemModule *)self durationPickerItem];
  objc_msgSend(v3, "na_safeAddObject:", v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v3;
}

id __43__HUTriggerDurationItemModule__staticItems__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  uint64_t v9 = *MEMORY[0x1E4F68B10];
  v3 = NSNumber;
  if ([WeakRetained _shouldShowDurationItems]) {
    uint64_t v4 = [WeakRetained durationPickerShown] ^ 1;
  }
  else {
    uint64_t v4 = 1;
  }
  v5 = [v3 numberWithInt:v4];
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v2 futureWithResult:v6];

  return v7;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    uint64_t v4 = [(HUTriggerDurationItemModule *)self _buildItemProviders];
    v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }

  return itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUTriggerDurationItemModuleSection"];
  id v8 = [(HUTriggerDurationItemModule *)self durationSummaryItem];
  v15[0] = v8;
  uint64_t v9 = [(HUTriggerDurationItemModule *)self durationPickerItem];
  v15[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v7 setItems:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__HUTriggerDurationItemModule_buildSectionsWithDisplayedItems___block_invoke;
  v14[3] = &unk_1E6387F48;
  v14[4] = self;
  objc_super v11 = __63__HUTriggerDurationItemModule_buildSectionsWithDisplayedItems___block_invoke((uint64_t)v14);
  [v7 setFooterTitle:v11];

  [v6 addObject:v7];
  uint64_t v12 = [MEMORY[0x1E4F69220] filterSections:v6 toDisplayedItems:v5];

  return v12;
}

id __63__HUTriggerDurationItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) triggerBuilder];
  v3 = [v2 home];
  char v4 = objc_msgSend(v3, "hf_supportsSharedEventAutomation");

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) triggerBuilder];
    v6 = [v5 designatedDurationEventBuilder];

    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E4F2E7A8];
      id v8 = NSNumber;
      uint64_t v9 = [*(id *)(a1 + 32) triggerBuilder];
      v10 = [v9 designatedDurationEventBuilder];
      [v10 duration];
      objc_super v11 = objc_msgSend(v8, "numberWithDouble:");
      uint64_t v12 = objc_msgSend(v7, "hf_naturalLanguageTurnOffAfterDuration:style:", v11, 2);

      v19 = HULocalizedStringWithFormat(@"HUTriggerSummaryDurationSetFooterFormat", @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v12);

      goto LABEL_7;
    }
    v20 = @"HUTriggerSummaryDurationNotSetFooter";
  }
  else
  {
    v20 = @"HUTriggerSummaryDurationUpdateHomeHubFooter";
  }
  v19 = _HULocalizedStringWithDefaultValue(v20, v20, 1);
LABEL_7:

  return v19;
}

- (void)setDurationPickerShown:(BOOL)a3
{
  if (self->_durationPickerShown != a3)
  {
    self->_durationPickerShown = a3;
    id v5 = [(HFItemModule *)self allItems];
    v6 = [(HUTriggerDurationItemModule *)self durationPickerItem];
    int v7 = [v5 containsObject:v6];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1E4F69230];
      uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
      v10 = [(HUTriggerDurationItemModule *)self durationPickerItem];
      objc_super v11 = [v9 setWithObject:v10];
      id v14 = [v8 requestToUpdateItems:v11 senderSelector:a2];

      uint64_t v12 = [(HFItemModule *)self itemUpdater];
      id v13 = (id)[v12 performItemUpdateRequest:v14];
    }
  }
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  if (![(HUTriggerDurationItemModule *)self durationPickerShown]
    || ![(HUTriggerDurationItemModule *)self _shouldShowDurationItems])
  {
    uint64_t v6 = [(HUTriggerDurationItemModule *)self durationPickerItem];
    if (v6)
    {
      int v7 = (void *)v6;
      id v8 = [(HUTriggerDurationItemModule *)self durationPickerItem];
      int v9 = [v4 containsObject:v8];

      if (v9)
      {
        v10 = [(HUTriggerDurationItemModule *)self durationPickerItem];
        [v5 addObject:v10];
      }
    }
  }

  return v5;
}

- (BOOL)_shouldShowDurationItems
{
  v3 = [(HUTriggerDurationItemModule *)self triggerBuilder];
  id v4 = [v3 context];
  if ([v4 allowDurationEditing])
  {
    id v5 = [(HUTriggerDurationItemModule *)self triggerBuilder];
    int v6 = [v5 supportsEndEvents];

    if (!v6) {
      return 0;
    }
    v3 = [(HUTriggerDurationItemModule *)self triggerBuilder];
    char v7 = [v3 areActionsAffectedByEndEvents];
  }
  else
  {

    char v7 = 0;
  }

  return v7;
}

- (id)_buildItemProviders
{
  id v3 = objc_alloc(MEMORY[0x1E4F695C8]);
  id v4 = [(HUTriggerDurationItemModule *)self _staticItems];
  id v5 = (void *)[v3 initWithItems:v4];

  int v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];

  return v6;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (void)setTriggerBuilder:(id)a3
{
}

- (HFItemManager)itemManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemManager);

  return (HFItemManager *)WeakRetained;
}

- (void)setItemManager:(id)a3
{
}

- (HFTriggerDurationSummaryItem)durationSummaryItem
{
  return self->_durationSummaryItem;
}

- (void)setDurationSummaryItem:(id)a3
{
}

- (HFItem)durationPickerItem
{
  return self->_durationPickerItem;
}

- (void)setDurationPickerItem:(id)a3
{
}

- (BOOL)durationPickerShown
{
  return self->_durationPickerShown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationPickerItem, 0);
  objc_storeStrong((id *)&self->_durationSummaryItem, 0);
  objc_destroyWeak((id *)&self->_itemManager);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end