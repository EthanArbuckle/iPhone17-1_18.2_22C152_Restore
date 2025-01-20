@interface HUNetworkConfigurationItemListModule
- (BOOL)isItemNetworkConfigurationGroupItem:(id)a3;
- (HFNetworkConfigurationGroupItemProvider)networkConfigurationGroupItemProvider;
- (HMHome)home;
- (HUNetworkConfigurationItemListModule)initWithItemUpdater:(id)a3;
- (HUNetworkConfigurationItemListModule)initWithItemUpdater:(id)a3 home:(id)a4;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (id)itemProviders;
- (id)networkConfigurationGroupItemForProfile:(id)a3;
- (void)setNetworkConfigurationGroupItemProvider:(id)a3;
@end

@implementation HUNetworkConfigurationItemListModule

- (HUNetworkConfigurationItemListModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUNetworkConfigurationItemListModule;
  v8 = [(HFItemModule *)&v13 initWithItemUpdater:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F69320]) initWithHome:v7];
    networkConfigurationGroupItemProvider = v9->_networkConfigurationGroupItemProvider;
    v9->_networkConfigurationGroupItemProvider = (HFNetworkConfigurationGroupItemProvider *)v10;
  }
  return v9;
}

- (HUNetworkConfigurationItemListModule)initWithItemUpdater:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithItemUpdater_home_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkConfigurationItemListModule.m", 33, @"%s is unavailable; use %@ instead",
    "-[HUNetworkConfigurationItemListModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemNetworkConfigurationGroupItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUNetworkConfigurationItemListModule *)self networkConfigurationGroupItemProvider];
  v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (id)networkConfigurationGroupItemForProfile:(id)a3
{
  id v4 = a3;
  v5 = [(HUNetworkConfigurationItemListModule *)self networkConfigurationGroupItemProvider];
  v6 = [v5 items];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__HUNetworkConfigurationItemListModule_networkConfigurationGroupItemForProfile___block_invoke;
  v10[3] = &unk_1E6386108;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __80__HUNetworkConfigurationItemListModule_networkConfigurationGroupItemForProfile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 profiles];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__HUNetworkConfigurationItemListModule_networkConfigurationGroupItemForProfile___block_invoke_2;
  v10[3] = &unk_1E638A538;
  id v11 = *(id *)(a1 + 32);
  uint64_t v8 = objc_msgSend(v7, "na_any:", v10);

  return v8;
}

uint64_t __80__HUNetworkConfigurationItemListModule_networkConfigurationGroupItemForProfile___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 uniqueIdentifier];
  v5 = [v3 uniqueIdentifier];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

- (id)itemProviders
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(HUNetworkConfigurationItemListModule *)self networkConfigurationGroupItemProvider];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUNetworkConfigurationItemListModuleSectionIdentifier"];
  uint64_t v6 = _HULocalizedStringWithDefaultValue(@"HUNetworkConfigurationItemListModuleSectionTitle", @"HUNetworkConfigurationItemListModuleSectionTitle", 1);
  [v5 setHeaderTitle:v6];

  id v7 = [(HUNetworkConfigurationItemListModule *)self networkConfigurationGroupItemProvider];
  uint64_t v8 = [v7 items];

  v9 = [(HUNetworkConfigurationItemListModule *)self home];
  int v10 = objc_msgSend(v9, "hf_isNetworkProtectionEnabled");

  if (v10)
  {
    id v11 = [v8 allObjects];
    v12 = [MEMORY[0x1E4F69220] defaultItemComparator];
    objc_super v13 = [v11 sortedArrayUsingComparator:v12];
    [v5 setItems:v13];
  }
  objc_initWeak(&location, self);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __72__HUNetworkConfigurationItemListModule_buildSectionsWithDisplayedItems___block_invoke;
  v22 = &unk_1E6391780;
  objc_copyWeak(&v23, &location);
  if (objc_msgSend(v8, "na_any:", &v19))
  {
    v14 = _HULocalizedStringWithDefaultValue(@"HUNetworkConfigurationItemListModuleSectionFooterIncompatibleVersion", @"HUNetworkConfigurationItemListModuleSectionFooterIncompatibleVersion", 1);
    objc_msgSend(v5, "setFooterTitle:", v14, v19, v20, v21, v22);
  }
  v15 = (void *)MEMORY[0x1E4F69220];
  v25[0] = v5;
  v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 1, v19, v20, v21, v22);
  v17 = [v15 filterSections:v16 toDisplayedItems:v4];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v17;
}

unint64_t __72__HUNetworkConfigurationItemListModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [v3 latestResults];
  uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68B90]];
  if ([v6 BOOLValue])
  {
    unint64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [v3 latestResults];
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F68BA8]];
    if ([v9 BOOLValue])
    {
      int v10 = [WeakRetained home];
      unint64_t v7 = ((unint64_t)[v10 networkRouterSupportDisableReason] >> 4) & 1;
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  return v7;
}

- (HMHome)home
{
  return self->_home;
}

- (HFNetworkConfigurationGroupItemProvider)networkConfigurationGroupItemProvider
{
  return self->_networkConfigurationGroupItemProvider;
}

- (void)setNetworkConfigurationGroupItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfigurationGroupItemProvider, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end