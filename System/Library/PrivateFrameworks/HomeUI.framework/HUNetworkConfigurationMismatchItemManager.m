@interface HUNetworkConfigurationMismatchItemManager
- (BOOL)isItemNetworkConfigurationItem:(id)a3;
- (HFNetworkConfigurationItemProvider)networkConfigurationItemProvider;
- (HMHome)overrideHome;
- (HUNetworkConfigurationMismatchItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4;
- (HUNetworkConfigurationMismatchItemManager)initWithProfiles:(id)a3 delegate:(id)a4;
- (NSSet)profiles;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)_homeFuture;
- (id)networkConfigurationItemForProfile:(id)a3;
- (void)setNetworkConfigurationItemProvider:(id)a3;
@end

@implementation HUNetworkConfigurationMismatchItemManager

- (HUNetworkConfigurationMismatchItemManager)initWithProfiles:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 count])
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HUNetworkConfigurationMismatchItemManager.m", 27, @"Invalid parameter not satisfying: %@", @"profiles.count" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)HUNetworkConfigurationMismatchItemManager;
  v10 = [(HFItemManager *)&v17 initWithDelegate:v9 sourceItem:0];
  if (v10)
  {
    v11 = [v8 anyObject];
    v12 = [v11 accessory];
    uint64_t v13 = [v12 home];
    overrideHome = v10->_overrideHome;
    v10->_overrideHome = (HMHome *)v13;

    objc_storeStrong((id *)&v10->_profiles, a3);
  }

  return v10;
}

- (HUNetworkConfigurationMismatchItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  v7 = NSStringFromSelector(sel_initWithProfiles_delegate_);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUNetworkConfigurationMismatchItemManager.m", 37, @"%s is unavailable; use %@ instead",
    "-[HUNetworkConfigurationMismatchItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (BOOL)isItemNetworkConfigurationItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUNetworkConfigurationMismatchItemManager *)self networkConfigurationItemProvider];
  v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (id)networkConfigurationItemForProfile:(id)a3
{
  id v4 = a3;
  v5 = [(HUNetworkConfigurationMismatchItemManager *)self networkConfigurationItemProvider];
  v6 = [v5 items];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__HUNetworkConfigurationMismatchItemManager_networkConfigurationItemForProfile___block_invoke;
  v10[3] = &unk_1E6386108;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __80__HUNetworkConfigurationMismatchItemManager_networkConfigurationItemForProfile___block_invoke(uint64_t a1, void *a2)
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
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F69330]) initWithHome:v4];
  [(HUNetworkConfigurationMismatchItemManager *)self setNetworkConfigurationItemProvider:v5];

  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  objc_copyWeak(&v12, &location);
  id v6 = [(HUNetworkConfigurationMismatchItemManager *)self networkConfigurationItemProvider];
  id v7 = [v6 filterOptions];
  [v7 setByFilter:&v11];

  id v8 = [(HUNetworkConfigurationMismatchItemManager *)self networkConfigurationItemProvider];
  v14[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v9;
}

uint64_t __72__HUNetworkConfigurationMismatchItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained profiles];
  if ([v5 containsObject:v3]) {
    uint64_t v6 = objc_msgSend(v3, "hf_hasProtectionModeMismatch");
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"HUNetworkRouterMismatchSectionIdentifier"];
  id v7 = [(HUNetworkConfigurationMismatchItemManager *)self networkConfigurationItemProvider];
  id v8 = [v7 items];
  id v9 = [v8 allObjects];
  uint64_t v10 = [MEMORY[0x1E4F69328] defaultItemComparator];
  uint64_t v11 = [v9 sortedArrayUsingComparator:v10];
  [v6 setItems:v11 filteringToDisplayedItems:v4];

  [v5 addObject:v6];
  id v12 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v12;
}

- (id)_homeFuture
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  id v3 = [(HUNetworkConfigurationMismatchItemManager *)self overrideHome];
  id v4 = [v2 futureWithResult:v3];

  return v4;
}

- (NSSet)profiles
{
  return self->_profiles;
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

  objc_storeStrong((id *)&self->_profiles, 0);
}

@end