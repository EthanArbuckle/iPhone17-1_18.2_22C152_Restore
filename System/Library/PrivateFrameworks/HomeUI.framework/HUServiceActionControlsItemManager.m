@interface HUServiceActionControlsItemManager
- (HFControlPanelItemProvider)controlPanelItemProvider;
- (HFServiceActionItem)serviceActionItem;
- (HUServiceActionControlsItemManager)initWithServiceActionItem:(id)a3 mode:(unint64_t)a4 delegate:(id)a5;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_identifierForSection:(unint64_t)a3;
- (id)_itemsToHideInSet:(id)a3;
- (id)_sectionIdentifierForControlPanelItem:(id)a3;
- (id)_sectionIdentifiers;
- (id)_titleForSectionWithIdentifier:(id)a3;
- (unint64_t)_numberOfSections;
- (unint64_t)mode;
- (void)setControlPanelItemProvider:(id)a3;
- (void)setServiceActionItem:(id)a3;
@end

@implementation HUServiceActionControlsItemManager

- (HUServiceActionControlsItemManager)initWithServiceActionItem:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 containingItem];
  v11 = (void *)[v10 copy];
  v14.receiver = self;
  v14.super_class = (Class)HUServiceActionControlsItemManager;
  v12 = [(HFItemManager *)&v14 initWithDelegate:v9 sourceItem:v11];

  if (v12)
  {
    [(HUServiceActionControlsItemManager *)v12 setServiceActionItem:v8];
    v12->_mode = a4;
  }

  return v12;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F690A8]);
  v6 = [(HUServiceActionControlsItemManager *)self serviceActionItem];
  v7 = [(HUServiceActionControlsItemManager *)self serviceActionItem];
  id v8 = [v7 valueSource];
  id v9 = (void *)[v5 initWithItem:v6 valueSource:v8];
  [(HUServiceActionControlsItemManager *)self setControlPanelItemProvider:v9];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v15, &location);
  v10 = [(HUServiceActionControlsItemManager *)self controlPanelItemProvider];
  [v10 setFilter:&v14];

  v11 = [(HUServiceActionControlsItemManager *)self controlPanelItemProvider];
  v17[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

uint64_t __65__HUServiceActionControlsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained serviceActionItem];
  v6 = [v5 services];
  if ((unint64_t)[v6 count] > 1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    v7 = [WeakRetained _actionControlsDelegate];
    uint64_t v8 = [v7 itemManager:WeakRetained shouldShowControlPanelItem:v3];
  }
  return v8;
}

- (id)_itemsToHideInSet:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUServiceActionControlsItemManager;
  id v3 = [(HFItemManager *)&v6 _itemsToHideInSet:a3];
  id v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (unint64_t)_numberOfSections
{
  v2 = [(HUServiceActionControlsItemManager *)self _sectionIdentifiers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  id v4 = [(HUServiceActionControlsItemManager *)self _sectionIdentifiers];
  if ([v4 count] <= a3) {
    NSLog(&cfstr_ReceivedIdenti.isa, a3, [v4 count]);
  }
  if ([v4 count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"HUServiceActionControlsRemoveFromTriggerSectionIdentifier"])
  {
    id v5 = 0;
  }
  else
  {
    objc_super v6 = [(HUServiceActionControlsItemManager *)self controlPanelItemProvider];
    v7 = [v6 items];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__HUServiceActionControlsItemManager__titleForSectionWithIdentifier___block_invoke;
    v13[3] = &unk_1E6386108;
    id v14 = v4;
    uint64_t v8 = objc_msgSend(v7, "na_firstObjectPassingTest:", v13);

    id v9 = [(HUServiceActionControlsItemManager *)self _actionControlsDelegate];
    int v10 = [v9 itemManager:self shouldShowSectionTitleForControlPanelItem:v8];

    if (v10)
    {
      v11 = [v8 latestResults];
      id v5 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

uint64_t __69__HUServiceActionControlsItemManager__titleForSectionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 uniqueIdentifier];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_sectionIdentifiers
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(HUServiceActionControlsItemManager *)self controlPanelItemProvider];
  uint64_t v5 = [v4 items];
  objc_super v6 = [v5 allObjects];

  v7 = [(HUServiceActionControlsItemManager *)self controlPanelItemProvider];
  uint64_t v8 = [v7 controlPanelItemComparator];
  id v9 = [v6 sortedArrayUsingComparator:v8];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "latestResults", (void)v19);

        if (v16)
        {
          v17 = [(HUServiceActionControlsItemManager *)self _sectionIdentifierForControlPanelItem:v15];
          [v3 addObject:v17];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  [v3 addObject:@"HUServiceActionControlsRemoveFromTriggerSectionIdentifier"];

  return v3;
}

- (id)_sectionIdentifierForControlPanelItem:(id)a3
{
  return (id)[a3 uniqueIdentifier];
}

- (HFServiceActionItem)serviceActionItem
{
  return self->_serviceActionItem;
}

- (void)setServiceActionItem:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (HFControlPanelItemProvider)controlPanelItemProvider
{
  return self->_controlPanelItemProvider;
}

- (void)setControlPanelItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPanelItemProvider, 0);

  objc_storeStrong((id *)&self->_serviceActionItem, 0);
}

@end