@interface HUMediaServiceDefaultAccountsItemModule
- (BOOL)containsItem:(id)a3;
- (HMHome)home;
- (HUMediaServiceDefaultAccountsItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (HUMediaServiceItemProvider)mediaServiceItemProvider;
- (NSSet)itemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)updateDefaultAccount:(id)a3;
- (void)mediaServiceItemProviderDidUpdateServices:(id)a3;
- (void)registerForExternalUpdates;
- (void)unregisterForExternalUpdates;
@end

@implementation HUMediaServiceDefaultAccountsItemModule

- (HUMediaServiceDefaultAccountsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUMediaServiceDefaultAccountsItemModule;
  v8 = [(HFItemModule *)&v13 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v10 = [[HUMediaServiceItemProvider alloc] initWithHome:v7 delegate:v9];
    mediaServiceItemProvider = v9->_mediaServiceItemProvider;
    v9->_mediaServiceItemProvider = v10;
  }
  return v9;
}

- (NSSet)itemProviders
{
  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    v5 = (NSSet *)objc_opt_new();
    v6 = [(HUMediaServiceDefaultAccountsItemModule *)self mediaServiceItemProvider];
    [(NSSet *)v5 na_safeAddObject:v6];

    id v7 = self->_itemProviders;
    self->_itemProviders = v5;
    v8 = v5;

    v3 = self->_itemProviders;
  }

  return v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(HUMediaServiceDefaultAccountsItemModule *)self mediaServiceItemProvider];
  id v7 = [v6 items];

  if ([v7 intersectsSet:v4])
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HomeMediaServicesDefaultAccountsSection"];
    v9 = [(HUMediaServiceDefaultAccountsItemModule *)self mediaServiceItemProvider];
    v10 = [v9 items];
    v11 = [v10 allObjects];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __75__HUMediaServiceDefaultAccountsItemModule_buildSectionsWithDisplayedItems___block_invoke;
    v17[3] = &unk_1E6386108;
    id v18 = v4;
    v12 = objc_msgSend(v11, "na_filter:", v17);
    [v8 setItems:v12];

    objc_super v13 = [v8 items];
    v14 = +[HUMediaServiceItemProvider itemComparator];
    v15 = [v13 sortedArrayUsingComparator:v14];
    [v8 setItems:v15];

    [v5 addObject:v8];
  }

  return v5;
}

uint64_t __75__HUMediaServiceDefaultAccountsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (BOOL)containsItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUMediaServiceDefaultAccountsItemModule *)self itemProviders];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__HUMediaServiceDefaultAccountsItemModule_containsItem___block_invoke;
  v9[3] = &unk_1E638A2C8;
  id v10 = v4;
  id v6 = v4;
  char v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __56__HUMediaServiceDefaultAccountsItemModule_containsItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 items];
  uint64_t v4 = [v3 containsObject:*(void *)(a1 + 32)];

  return v4;
}

- (id)updateDefaultAccount:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F692B8];
  id v5 = a3;
  id v6 = [v4 sharedManager];
  char v7 = [(HUMediaServiceDefaultAccountsItemModule *)self home];
  v8 = [v6 updateDefaultMediaService:v5 forHome:v7];

  return v8;
}

- (void)registerForExternalUpdates
{
  id v2 = [(HUMediaServiceDefaultAccountsItemModule *)self mediaServiceItemProvider];
  [v2 registerForExternalUpdates];
}

- (void)unregisterForExternalUpdates
{
  id v2 = [(HUMediaServiceDefaultAccountsItemModule *)self mediaServiceItemProvider];
  [v2 unregisterForExternalUpdates];
}

- (void)mediaServiceItemProviderDidUpdateServices:(id)a3
{
  id v9 = [(HFItemModule *)self itemUpdater];
  id v5 = (void *)MEMORY[0x1E4F69230];
  id v6 = [(HUMediaServiceDefaultAccountsItemModule *)self itemProviders];
  char v7 = [v5 requestToReloadItemProviders:v6 senderSelector:a2];
  id v8 = (id)[v9 performItemUpdateRequest:v7];
}

- (HMHome)home
{
  return self->_home;
}

- (HUMediaServiceItemProvider)mediaServiceItemProvider
{
  return self->_mediaServiceItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end