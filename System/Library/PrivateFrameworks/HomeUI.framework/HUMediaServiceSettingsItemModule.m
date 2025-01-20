@interface HUMediaServiceSettingsItemModule
- (HFStaticItem)defaultAccountsItem;
- (HMHome)home;
- (HUMediaServiceItemProvider)mediaServiceItemProvider;
- (HUMediaServiceSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (NSSet)itemProviders;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)_createItemProviders;
- (void)mediaServiceItemProviderDidUpdateServices:(id)a3;
- (void)registerForExternalUpdates;
- (void)setDefaultAccountsItem:(id)a3;
- (void)setHome:(id)a3;
- (void)setMediaServiceItemProvider:(id)a3;
- (void)unregisterForExternalUpdates;
@end

@implementation HUMediaServiceSettingsItemModule

- (HUMediaServiceSettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUMediaServiceSettingsItemModule.m", 34, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)HUMediaServiceSettingsItemModule;
  v9 = [(HFItemModule *)&v13 initWithItemUpdater:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    [(HUMediaServiceSettingsItemModule *)v10 _createItemProviders];
  }

  return v10;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(HUMediaServiceSettingsItemModule *)self mediaServiceItemProvider];
  id v7 = [v6 items];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUMediaServiceSettingsItemModule_MediaServicesSectionIdentifier"];
    v10 = _HULocalizedStringWithDefaultValue(@"HUMediaServiceSettingsHeaderTitle_Updated", @"HUMediaServiceSettingsHeaderTitle_Updated", 1);
    [v9 setHeaderTitle:v10];

    v11 = _HULocalizedStringWithDefaultValue(@"HUMediaServiceSettingsFooterTitle", @"HUMediaServiceSettingsFooterTitle", 1);
    [v9 setFooterTitle:v11];

    v12 = [(HFItemModule *)self allItems];
    objc_super v13 = (void *)MEMORY[0x1E4F1CAD0];
    v14 = [(HUMediaServiceSettingsItemModule *)self defaultAccountsItem];
    v24[0] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v16 = [v13 setWithArray:v15];
    v17 = objc_msgSend(v12, "na_setByRemovingObjectsFromSet:", v16);
    v18 = [v17 allObjects];
    [v9 setItems:v18];

    v19 = [v9 items];
    v20 = +[HUMediaServiceItemProvider itemComparator];
    v21 = [v19 sortedArrayUsingComparator:v20];
    [v9 setItems:v21];

    [v5 addObject:v9];
  }
  v22 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v22;
}

- (void)registerForExternalUpdates
{
  id v2 = [(HUMediaServiceSettingsItemModule *)self mediaServiceItemProvider];
  [v2 registerForExternalUpdates];
}

- (void)unregisterForExternalUpdates
{
  id v2 = [(HUMediaServiceSettingsItemModule *)self mediaServiceItemProvider];
  [v2 unregisterForExternalUpdates];
}

- (void)_createItemProviders
{
  if (self->_itemProviders)
  {
    NSLog(&cfstr_Createitemprov_0.isa, a2);
  }
  else
  {
    v3 = [HUMediaServiceItemProvider alloc];
    id v4 = [(HUMediaServiceSettingsItemModule *)self home];
    v5 = [(HUMediaServiceItemProvider *)v3 initWithHome:v4 delegate:self];
    mediaServiceItemProvider = self->_mediaServiceItemProvider;
    self->_mediaServiceItemProvider = v5;

    id v7 = [MEMORY[0x1E4F1CA70] orderedSet];
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __56__HUMediaServiceSettingsItemModule__createItemProviders__block_invoke;
    v22 = &unk_1E6384FD0;
    objc_copyWeak(&v23, &location);
    v9 = (HFStaticItem *)[v8 initWithResultsBlock:&v19];
    defaultAccountsItem = self->_defaultAccountsItem;
    self->_defaultAccountsItem = v9;

    v11 = [(HUMediaServiceSettingsItemModule *)self defaultAccountsItem];
    [v7 addObject:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F695C8]);
    objc_super v13 = [v7 set];
    v14 = (void *)[v12 initWithItems:v13];

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v16 = [(HUMediaServiceSettingsItemModule *)self mediaServiceItemProvider];
    objc_msgSend(v15, "setWithObjects:", v16, v14, 0, v19, v20, v21, v22);
    v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
    itemProviders = self->_itemProviders;
    self->_itemProviders = v17;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

id __56__HUMediaServiceSettingsItemModule__createItemProviders__block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x1E4F7A0D8];
  v13[0] = *MEMORY[0x1E4F68AB8];
  v3 = _HULocalizedStringWithDefaultValue(@"HUMediaServiceDefaultAccounts", @"HUMediaServiceDefaultAccounts", 1);
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F68980];
  id v4 = [MEMORY[0x1E4F692B8] sharedManager];
  v5 = [WeakRetained home];
  v6 = [v4 defaultMediaServiceForHome:v5];
  uint64_t v7 = [v6 serviceName];
  id v8 = (void *)v7;
  v9 = &stru_1F18F92B8;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  v13[2] = *MEMORY[0x1E4F68A70];
  v14[1] = v9;
  v14[2] = MEMORY[0x1E4F1CC28];
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v11 = [v2 futureWithResult:v10];

  return v11;
}

- (void)mediaServiceItemProviderDidUpdateServices:(id)a3
{
  id v9 = [(HFItemModule *)self itemUpdater];
  v5 = (void *)MEMORY[0x1E4F69230];
  v6 = [(HUMediaServiceSettingsItemModule *)self itemProviders];
  uint64_t v7 = [v5 requestToReloadItemProviders:v6 senderSelector:a2];
  id v8 = (id)[v9 performItemUpdateRequest:v7];
}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HFStaticItem)defaultAccountsItem
{
  return self->_defaultAccountsItem;
}

- (void)setDefaultAccountsItem:(id)a3
{
}

- (HUMediaServiceItemProvider)mediaServiceItemProvider
{
  return self->_mediaServiceItemProvider;
}

- (void)setMediaServiceItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_defaultAccountsItem, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end