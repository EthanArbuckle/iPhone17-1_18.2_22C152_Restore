@interface HUTriggerEventsItemModule
- (BOOL)hideAddEventButton;
- (HFEventBuilderItemProvider)triggerEventsItemProvider;
- (HFItem)addEventButtonItem;
- (HFStaticItemProvider)staticItemProvider;
- (HFTriggerBuilder)triggerBuilder;
- (HUTriggerBuilderItem)triggerBuilderItem;
- (HUTriggerEventsItemModule)initWithTriggerBuilder:(id)a3 itemUpdater:(id)a4;
- (id)_buildItemProviders;
- (id)_itemsToHideInSet:(id)a3;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (void)setAddEventButtonItem:(id)a3;
- (void)setHideAddEventButton:(BOOL)a3;
- (void)setStaticItemProvider:(id)a3;
- (void)setTriggerBuilderItem:(id)a3;
- (void)setTriggerEventsItemProvider:(id)a3;
@end

@implementation HUTriggerEventsItemModule

- (HUTriggerEventsItemModule)initWithTriggerBuilder:(id)a3 itemUpdater:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUTriggerEventsItemModule;
  v8 = [(HFItemModule *)&v11 initWithItemUpdater:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_triggerBuilder, a3);
    v9->_hideAddEventButton = 0;
  }

  return v9;
}

- (id)_buildItemProviders
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  objc_opt_class();
  v4 = [(HUTriggerEventsItemModule *)self triggerBuilder];
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (_os_feature_enabled_impl() && v6)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F69128]) initWithTriggerBuilder:v6];
    [(HUTriggerEventsItemModule *)self setTriggerEventsItemProvider:v7];

    v8 = [(HUTriggerEventsItemModule *)self triggerEventsItemProvider];
    [v8 setNameType:1];
  }
  else
  {
    v9 = [HUTriggerBuilderItem alloc];
    v10 = [(HUTriggerEventsItemModule *)self triggerBuilder];
    objc_super v11 = [(HUTriggerBuilderItem *)v9 initWithTriggerBuilder:v10 nameType:1];
    triggerBuilderItem = self->_triggerBuilderItem;
    self->_triggerBuilderItem = v11;

    v8 = [(HUTriggerEventsItemModule *)self triggerBuilderItem];
    [v3 addObject:v8];
  }

  id v13 = objc_alloc(MEMORY[0x1E4F695C0]);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __48__HUTriggerEventsItemModule__buildItemProviders__block_invoke;
  v22[3] = &unk_1E6385000;
  v22[4] = self;
  v14 = (void *)[v13 initWithResultsBlock:v22];
  [(HUTriggerEventsItemModule *)self setAddEventButtonItem:v14];

  v15 = [(HUTriggerEventsItemModule *)self addEventButtonItem];
  [v3 addObject:v15];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v3];
  [(HUTriggerEventsItemModule *)self setStaticItemProvider:v16];

  v17 = (void *)MEMORY[0x1E4F1CAD0];
  v18 = [(HUTriggerEventsItemModule *)self staticItemProvider];
  v19 = [(HUTriggerEventsItemModule *)self triggerEventsItemProvider];
  v20 = objc_msgSend(v17, "setWithObjects:", v18, v19, 0);

  return v20;
}

id __48__HUTriggerEventsItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v10[0] = *MEMORY[0x1E4F68AB8];
  uint64_t v3 = 1;
  v4 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryTriggerNewEventButtonTitle", @"HUTriggerSummaryTriggerNewEventButtonTitle", 1);
  v10[1] = *MEMORY[0x1E4F68B10];
  v11[0] = v4;
  v5 = NSNumber;
  if (([*(id *)(a1 + 32) hideAddEventButton] & 1) == 0) {
    uint64_t v3 = _os_feature_enabled_impl() ^ 1;
  }
  id v6 = [v5 numberWithInt:v3];
  v11[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v8 = [v2 futureWithResult:v7];

  return v8;
}

- (id)itemProviders
{
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    v4 = [(HUTriggerEventsItemModule *)self _buildItemProviders];
    v5 = self->_itemProviders;
    self->_itemProviders = v4;

    itemProviders = self->_itemProviders;
  }

  return itemProviders;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F692E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithIdentifier:@"triggerEventsSection"];
  id v7 = [(HUTriggerEventsItemModule *)self triggerEventsItemProvider];

  if (v7)
  {
    v8 = [(HUTriggerEventsItemModule *)self triggerEventsItemProvider];
    v9 = [v8 items];
    v10 = [v9 allObjects];
    [v6 setItems:v10];
  }
  else
  {
    objc_super v11 = (void *)MEMORY[0x1E4F1C978];
    v8 = [(HUTriggerEventsItemModule *)self triggerBuilderItem];
    v9 = objc_msgSend(v11, "na_arrayWithSafeObject:", v8);
    [v6 setItems:v9];
  }

  v12 = [v6 items];
  id v13 = [(HUTriggerEventsItemModule *)self addEventButtonItem];
  v14 = [v12 arrayByAddingObject:v13];
  [v6 setItems:v14];

  v15 = _HULocalizedStringWithDefaultValue(@"HUTriggerSummaryTriggersInstructionTitle", @"HUTriggerSummaryTriggersInstructionTitle", 1);
  [v6 setHeaderTitle:v15];

  v16 = (void *)MEMORY[0x1E4F69220];
  v20[0] = v6;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v18 = [v16 filterSections:v17 toDisplayedItems:v5];

  return v18;
}

- (id)_itemsToHideInSet:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "set", a3);
}

- (HFTriggerBuilder)triggerBuilder
{
  return self->_triggerBuilder;
}

- (HFItem)addEventButtonItem
{
  return self->_addEventButtonItem;
}

- (void)setAddEventButtonItem:(id)a3
{
}

- (BOOL)hideAddEventButton
{
  return self->_hideAddEventButton;
}

- (void)setHideAddEventButton:(BOOL)a3
{
  self->_hideAddEventButton = a3;
}

- (HFEventBuilderItemProvider)triggerEventsItemProvider
{
  return self->_triggerEventsItemProvider;
}

- (void)setTriggerEventsItemProvider:(id)a3
{
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
}

- (HUTriggerBuilderItem)triggerBuilderItem
{
  return self->_triggerBuilderItem;
}

- (void)setTriggerBuilderItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerBuilderItem, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_triggerEventsItemProvider, 0);
  objc_storeStrong((id *)&self->_addEventButtonItem, 0);
  objc_storeStrong((id *)&self->_triggerBuilder, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end