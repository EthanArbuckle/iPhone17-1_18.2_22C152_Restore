@interface HUMediaServiceDefaultAccountsItemManager
- (HFItem)defaultAccountsTitleItem;
- (HFItem)removeItem;
- (HMHome)homeForUser;
- (HUMediaServiceDefaultAccountsItemManager)initWithHome:(id)a3 sourceItem:(id)a4 delegate:(id)a5;
- (HUMediaServiceDefaultAccountsItemModule)defaultAccountsItemModule;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (void)_registerForExternalUpdates;
- (void)_unregisterForExternalUpdates;
- (void)setDefaultAccountsItemModule:(id)a3;
- (void)setDefaultAccountsTitleItem:(id)a3;
- (void)setHomeForUser:(id)a3;
- (void)setRemoveItem:(id)a3;
@end

@implementation HUMediaServiceDefaultAccountsItemManager

- (HUMediaServiceDefaultAccountsItemManager)initWithHome:(id)a3 sourceItem:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUMediaServiceDefaultAccountsItemManager;
  v9 = [(HFItemManager *)&v15 initWithDelegate:a5 sourceItem:a4];
  v10 = v9;
  if (v9)
  {
    [(HUMediaServiceDefaultAccountsItemManager *)v9 setHomeForUser:v8];
    v11 = [HUMediaServiceDefaultAccountsItemModule alloc];
    v12 = [(HUMediaServiceDefaultAccountsItemManager *)v10 homeForUser];
    v13 = [(HUMediaServiceDefaultAccountsItemModule *)v11 initWithItemUpdater:v10 home:v12];
    [(HUMediaServiceDefaultAccountsItemManager *)v10 setDefaultAccountsItemModule:v13];
  }
  return v10;
}

- (void)_registerForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUMediaServiceDefaultAccountsItemManager;
  [(HFItemManager *)&v4 _registerForExternalUpdates];
  v3 = [(HUMediaServiceDefaultAccountsItemManager *)self defaultAccountsItemModule];
  [v3 registerForExternalUpdates];
}

- (void)_unregisterForExternalUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)HUMediaServiceDefaultAccountsItemManager;
  [(HFItemManager *)&v4 _unregisterForExternalUpdates];
  v3 = [(HUMediaServiceDefaultAccountsItemManager *)self defaultAccountsItemModule];
  [v3 unregisterForExternalUpdates];
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F695C0]);
  uint64_t v20 = *MEMORY[0x1E4F68AB8];
  v5 = _HULocalizedStringWithDefaultValue(@"HUMediaServiceSettings_DefaultSectionFooterTitle", @"HUMediaServiceSettings_DefaultSectionFooterTitle", 1);
  v21[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v7 = (void *)[v4 initWithResults:v6];
  [(HUMediaServiceDefaultAccountsItemManager *)self setDefaultAccountsTitleItem:v7];

  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v9 = [(HUMediaServiceDefaultAccountsItemManager *)self defaultAccountsTitleItem];
  v19 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v11 = (void *)[v8 initWithArray:v10];

  v12 = (void *)MEMORY[0x1E4F1CA80];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F695C8]) initWithItems:v11];
  v14 = [v12 setWithObject:v13];

  objc_super v15 = [(HUMediaServiceDefaultAccountsItemManager *)self defaultAccountsItemModule];
  v16 = [v15 itemProviders];
  [v14 unionSet:v16];

  v17 = [v14 allObjects];

  return v17;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUMediaServiceDefaultAccountsTitleSectionIdentifier"];
  id v8 = [(HUMediaServiceDefaultAccountsItemManager *)self defaultAccountsTitleItem];
  v13[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v7 setItems:v9];

  v10 = [(HUMediaServiceDefaultAccountsItemManager *)self defaultAccountsItemModule];
  v11 = [v10 buildSectionsWithDisplayedItems:v5];

  [v6 addObject:v7];
  [v6 addObjectsFromArray:v11];

  return v6;
}

- (HUMediaServiceDefaultAccountsItemModule)defaultAccountsItemModule
{
  return self->_defaultAccountsItemModule;
}

- (void)setDefaultAccountsItemModule:(id)a3
{
}

- (HFItem)defaultAccountsTitleItem
{
  return self->_defaultAccountsTitleItem;
}

- (void)setDefaultAccountsTitleItem:(id)a3
{
}

- (HMHome)homeForUser
{
  return self->_homeForUser;
}

- (void)setHomeForUser:(id)a3
{
}

- (HFItem)removeItem
{
  return self->_removeItem;
}

- (void)setRemoveItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_homeForUser, 0);
  objc_storeStrong((id *)&self->_defaultAccountsTitleItem, 0);

  objc_storeStrong((id *)&self->_defaultAccountsItemModule, 0);
}

@end