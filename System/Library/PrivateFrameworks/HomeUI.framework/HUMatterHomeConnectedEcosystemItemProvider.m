@interface HUMatterHomeConnectedEcosystemItemProvider
- (HMHome)home;
- (HUMatterHomeConnectedEcosystemItemProvider)initWithHome:(id)a3;
- (NAFuture)ecosystemAccessoryUUIDMapFuture;
- (NSMutableSet)connectedEcosystemItems;
- (id)reloadItems;
- (void)setConnectedEcosystemItems:(id)a3;
@end

@implementation HUMatterHomeConnectedEcosystemItemProvider

- (HUMatterHomeConnectedEcosystemItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMatterHomeConnectedEcosystemItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    connectedEcosystemItems = v7->_connectedEcosystemItems;
    v7->_connectedEcosystemItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (NAFuture)ecosystemAccessoryUUIDMapFuture
{
  ecosystemAccessoryUUIDMapFuture = self->_ecosystemAccessoryUUIDMapFuture;
  if (!ecosystemAccessoryUUIDMapFuture)
  {
    v4 = [(HUMatterHomeConnectedEcosystemItemProvider *)self home];
    objc_msgSend(v4, "hf_ecosystemAccessoryUUIDMapFuture");
    id v5 = (NAFuture *)objc_claimAutoreleasedReturnValue();
    v6 = self->_ecosystemAccessoryUUIDMapFuture;
    self->_ecosystemAccessoryUUIDMapFuture = v5;

    ecosystemAccessoryUUIDMapFuture = self->_ecosystemAccessoryUUIDMapFuture;
  }

  return ecosystemAccessoryUUIDMapFuture;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HUMatterHomeConnectedEcosystemItemProvider *)self ecosystemAccessoryUUIDMapFuture];
  v4 = [(HUMatterConnectedEcosystemItemProvider *)self futureFilteringOutSystemCommissionerEcosystem:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke;
  v7[3] = &unk_1E6389138;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

id __57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_1E638A780;
  id v13 = v3;
  id v5 = v3;
  v6 = _Block_copy(aBlock);
  v7 = [v5 allKeys];
  id v8 = [WeakRetained reloadItemsWithHomeKitObjects:v7 filter:0 itemMap:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_1E6385B10;
  v11[4] = WeakRetained;
  v9 = [v8 flatMap:v11];

  return v9;
}

HUMatterHomeConnectedEcosystemItem *__57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  id v8 = [[HUMatterHomeConnectedEcosystemItem alloc] initWithConnectedEcosystem:v6 accessoryUUIDs:v7];

  return v8;
}

id __57__HUMatterHomeConnectedEcosystemItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 connectedEcosystemItems];
  id v6 = [v4 addedItems];
  [v5 unionSet:v6];

  v7 = [*(id *)(a1 + 32) connectedEcosystemItems];
  id v8 = [v4 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v9;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)connectedEcosystemItems
{
  return self->_connectedEcosystemItems;
}

- (void)setConnectedEcosystemItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedEcosystemItems, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_ecosystemAccessoryUUIDMapFuture, 0);
}

@end