@interface HUTriggerMediaItemModule
- (HFItem)mediaRowItem;
- (HFTriggerBuilder)triggerBuilder;
- (HUTriggerMediaItemModule)initWithTriggerBuilder:(id)a3 itemUpdater:(id)a4;
- (id)_itemsToHideInSet:(id)a3;
- (id)_staticItems;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)setMediaRowItem:(id)a3;
@end

@implementation HUTriggerMediaItemModule

- (HUTriggerMediaItemModule)initWithTriggerBuilder:(id)a3 itemUpdater:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerMediaItemModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);
  }

  return v9;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F695C8]);
    v5 = [(HUTriggerMediaItemModule *)self _staticItems];
    v6 = (void *)[v4 initWithItems:v5];

    id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    v8 = self->_itemProviders;
    self->_itemProviders = v7;

    itemProviders = self->_itemProviders;
  }

  return itemProviders;
}

- (id)_staticItems
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__HUTriggerMediaItemModule__staticItems__block_invoke;
  v8[3] = &unk_1E6385000;
  v8[4] = self;
  v5 = (void *)[v4 initWithResultsBlock:v8];
  [(HUTriggerMediaItemModule *)self setMediaRowItem:v5];

  v6 = [(HUTriggerMediaItemModule *)self mediaRowItem];
  objc_msgSend(v3, "na_safeAddObject:", v6);

  return v3;
}

id __40__HUTriggerMediaItemModule__staticItems__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [*(id *)(a1 + 32) triggerBuilder];
  id v4 = [v3 triggerActionSets];
  v5 = [v4 anonymousActionSetBuilder];
  v6 = [v5 mediaAction];

  id v7 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryMediaButtonTitle", @"HUTriggerSummaryMediaButtonTitle", 1);
  [v2 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v8 = [v6 localizedDescription];
  [v2 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  v9 = [NSNumber numberWithInt:v6 == 0];
  [v2 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v2];

  return v10;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithIdentifier:@"HUTriggerMediaItemModuleSection"];
  id v7 = [(HUTriggerMediaItemModule *)self mediaRowItem];
  v16[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v6 setItems:v8];

  v9 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryMediaInstructionsTitle", @"HUTriggerSummaryMediaInstructionsTitle", 1);
  [v6 setHeaderTitle:v9];

  v10 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryMediaInstructionsDescription", @"HUTriggerSummaryMediaInstructionsDescription", 1);
  [v6 setHeaderSecondaryText:v10];

  objc_super v11 = (void *)MEMORY[0x1E4F69220];
  v15 = v6;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v13 = [v11 filterSections:v12 toDisplayedItems:v5];

  return v13;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  v6 = [(HUTriggerMediaItemModule *)self triggerBuilder];
  id v7 = [v6 triggerActionSets];
  v8 = [v7 anonymousActionSetBuilder];
  v9 = [v8 mediaAction];

  if (!v9)
  {
    v10 = [(HUTriggerMediaItemModule *)self mediaRowItem];
    [v5 addObject:v10];
  }
  [v5 intersectSet:v4];

  return v5;
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFItem)mediaRowItem
{
  return self->_mediaRowItem;
}

- (void)setMediaRowItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRowItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end