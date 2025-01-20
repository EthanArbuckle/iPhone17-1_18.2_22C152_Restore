@interface HUTriggerListItemManager
- (HFStaticItemProvider)staticItemProvider;
- (HUAddTriggerItem)addTriggerItem;
- (HUTriggerItemProvider)triggerItemProvider;
- (HUTriggerListSubheadlineItem)subheadlineItem;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_currentSectionIdentifiers;
- (id)_identifierForSection:(unint64_t)a3;
- (id)_sectionIdentifierForItem:(id)a3;
- (unint64_t)_numberOfSections;
- (void)setAddTriggerItem:(id)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setSubheadlineItem:(id)a3;
- (void)setTriggerItemProvider:(id)a3;
@end

@implementation HUTriggerListItemManager

- (id)_buildItemProvidersForHome:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  v6 = [v4 set];
  +[HUTriggerUtilities preloadShortcuts];
  v7 = [HUTriggerListSubheadlineItem alloc];
  v8 = [(HFItemManager *)self home];
  v9 = [(HUTriggerListSubheadlineItem *)v7 initWithRemoteAccessInfo:v8];
  [(HUTriggerListItemManager *)self setSubheadlineItem:v9];

  v10 = [(HUTriggerListItemManager *)self subheadlineItem];
  [v6 addObject:v10];

  v11 = [HUAddTriggerItem alloc];
  v12 = [(HFItemManager *)self home];
  v13 = [(HUAddTriggerItem *)v11 initWithHome:v12 mode:0];
  [(HUTriggerListItemManager *)self setAddTriggerItem:v13];

  v14 = [(HUTriggerListItemManager *)self addTriggerItem];
  [v6 addObject:v14];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v6];
  v16 = [[HUTriggerItemProvider alloc] initWithHome:v5];

  [(HUTriggerItemProvider *)v16 setUsesRichIconDescriptors:1];
  [(HUTriggerItemProvider *)v16 setFilter:&__block_literal_global_246];
  v19[0] = v15;
  v19[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  return v17;
}

uint64_t __55__HUTriggerListItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = objc_msgSend(v5, "hf_shouldDisplayTrigger");
  return v6;
}

- (unint64_t)_numberOfSections
{
  id v2 = [(HUTriggerListItemManager *)self _currentSectionIdentifiers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  if (a3 < 4) {
    return off_1E6390B88[a3];
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUTriggerListItemManager.m", 78, @"Couldn't find an identifier for section: %lu", a3);

  return 0;
}

- (id)_sectionIdentifierForItem:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(HUTriggerListItemManager *)self subheadlineItem];
  char v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8 = @"HOTriggerListSectionIdentifierSubheadline";
  }
  else
  {
    v9 = [(HUTriggerListItemManager *)self addTriggerItem];
    char v10 = [v5 isEqual:v9];

    if (v10)
    {
      v8 = @"HOTriggerListSectionIdentifierAddTrigger";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = @"HOTriggerListSectionIdentifierTriggers";
      }
      else
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, self, @"HUTriggerListItemManager.m", 90, @"Couldn't find a section for item: %@", v5 object file lineNumber description];

        v8 = 0;
      }
    }
  }

  return v8;
}

- (id)_currentSectionIdentifiers
{
  v5[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5[0] = @"HOTriggerListSectionIdentifierHeadline";
  v5[1] = @"HOTriggerListSectionIdentifierSubheadline";
  v5[2] = @"HOTriggerListSectionIdentifierTriggers";
  v5[3] = @"HOTriggerListSectionIdentifierAddTrigger";
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  [v2 addObjectsFromArray:v3];

  return v2;
}

- (HUTriggerListSubheadlineItem)subheadlineItem
{
  return self->_subheadlineItem;
}

- (void)setSubheadlineItem:(id)a3
{
}

- (HUAddTriggerItem)addTriggerItem
{
  return self->_addTriggerItem;
}

- (void)setAddTriggerItem:(id)a3
{
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (HUTriggerItemProvider)triggerItemProvider
{
  return self->_triggerItemProvider;
}

- (void)setTriggerItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_addTriggerItem, 0);

  objc_storeStrong((id *)&self->_subheadlineItem, 0);
}

@end