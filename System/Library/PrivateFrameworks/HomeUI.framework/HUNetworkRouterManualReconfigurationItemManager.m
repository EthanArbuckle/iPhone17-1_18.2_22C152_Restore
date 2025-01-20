@interface HUNetworkRouterManualReconfigurationItemManager
- (BOOL)isItemNetworkConfigurationItem:(id)a3;
- (HFNetworkConfigurationItemProvider)networkConfigurationItemProvider;
- (HMHome)overrideHome;
- (HUNetworkRouterManualReconfigurationItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUNetworkRouterManualReconfigurationItemManager)initWithHome:(id)a3 delegate:(id)a4;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)networkConfigurationItemForProfile:(id)a3;
- (void)setNetworkConfigurationItemProvider:(id)a3;
@end

@implementation HUNetworkRouterManualReconfigurationItemManager

- (HUNetworkRouterManualReconfigurationItemManager)initWithHome:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HUNetworkRouterManualReconfigurationItemManager.m", 27, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)HUNetworkRouterManualReconfigurationItemManager;
  v10 = [(HFItemManager *)&v14 initWithDelegate:v9 sourceItem:0];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_overrideHome, a3);
  }

  return v11;
}

- (HUNetworkRouterManualReconfigurationItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithHome_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkRouterManualReconfigurationItemManager.m", 36, @"%s is unavailable; use %@ instead",
    "-[HUNetworkRouterManualReconfigurationItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (BOOL)isItemNetworkConfigurationItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUNetworkRouterManualReconfigurationItemManager *)self networkConfigurationItemProvider];
  v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (id)networkConfigurationItemForProfile:(id)a3
{
  id v4 = a3;
  v5 = [(HUNetworkRouterManualReconfigurationItemManager *)self networkConfigurationItemProvider];
  v6 = [v5 items];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86__HUNetworkRouterManualReconfigurationItemManager_networkConfigurationItemForProfile___block_invoke;
  v10[3] = &unk_1E6386108;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __86__HUNetworkRouterManualReconfigurationItemManager_networkConfigurationItemForProfile___block_invoke(uint64_t a1, void *a2)
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

  id v7 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v8 = [v6 profile];
  id v9 = [v8 uniqueIdentifier];
  uint64_t v10 = [v7 isEqual:v9];

  return v10;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = (objc_class *)MEMORY[0x1E4F69330];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithHome:v5];

  [(HUNetworkRouterManualReconfigurationItemManager *)self setNetworkConfigurationItemProvider:v6];
  id v7 = [(HUNetworkRouterManualReconfigurationItemManager *)self networkConfigurationItemProvider];
  id v8 = [v7 filterOptions];
  [v8 setByFilter:&__block_literal_global_298];

  id v9 = [(HUNetworkRouterManualReconfigurationItemManager *)self networkConfigurationItemProvider];
  v12[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v10;
}

uint64_t __78__HUNetworkRouterManualReconfigurationItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_requiresManualWiFiReconfiguration");
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUNetworkRouterManualReconfigurationSectionIdentifier"];
  id v7 = [(HUNetworkRouterManualReconfigurationItemManager *)self networkConfigurationItemProvider];
  id v8 = [v7 items];
  id v9 = [v8 allObjects];
  uint64_t v10 = [MEMORY[0x1E4F69328] defaultItemComparator];
  id v11 = [v9 sortedArrayUsingComparator:v10];
  [v6 setItems:v11 filteringToDisplayedItems:v4];

  [v5 addObject:v6];
  v12 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v12;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HUNetworkRouterManualReconfigurationItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFNetworkConfigurationItemProvider)networkConfigurationItemProvider
{
  return self->_networkConfigurationItemProvider;
}

- (void)setNetworkConfigurationItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkConfigurationItemProvider, 0);

  objc_storeStrong((id *)&self->_overrideHome, 0);
}

@end