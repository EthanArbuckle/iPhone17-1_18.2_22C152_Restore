@interface HUMatterConnectedEcosystemDetailItemProvider
- (HMCHIPEcosystem)connectedEcosystem;
- (HMHome)home;
- (HUMatterConnectedEcosystemDetailItemProvider)initWithConnectedEcosystem:(id)a3 connectedEcosystemItemProvider:(id)a4 home:(id)a5;
- (HUMatterHomeConnectedEcosystemItemProvider)connectedEcosystemItemProvider;
- (NSMutableSet)allItems;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setAllItems:(id)a3;
- (void)setConnectedEcosystem:(id)a3;
- (void)setConnectedEcosystemItemProvider:(id)a3;
@end

@implementation HUMatterConnectedEcosystemDetailItemProvider

- (HUMatterConnectedEcosystemDetailItemProvider)initWithConnectedEcosystem:(id)a3 connectedEcosystemItemProvider:(id)a4 home:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HUMatterConnectedEcosystemDetailItemProvider;
  v12 = [(HFItemProvider *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_home, a5);
    objc_storeStrong((id *)&v13->_connectedEcosystem, a3);
    objc_storeStrong((id *)&v13->_connectedEcosystemItemProvider, a4);
    uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
    allItems = v13->_allItems;
    v13->_allItems = (NSMutableSet *)v14;
  }
  return v13;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1E6385A98;
  objc_copyWeak(&v15, &location);
  v3 = _Block_copy(aBlock);
  v4 = [(HUMatterConnectedEcosystemDetailItemProvider *)self connectedEcosystemItemProvider];
  v5 = [v4 reloadItems];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_2;
  v13[3] = &unk_1E6385B10;
  v13[4] = self;
  v6 = [v5 flatMap:v13];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_5;
  v10[3] = &unk_1E6385B60;
  v10[4] = self;
  id v7 = v3;
  id v11 = v7;
  objc_copyWeak(&v12, &location);
  v8 = [v6 flatMap:v10];
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v8;
}

id __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained home];
  v6 = objc_msgSend(v5, "hf_characteristicValueManager");

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F68E18]) initWithAccessory:v3 valueSource:v6];

  return v7;
}

id __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 allItems];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_3;
  v10[3] = &unk_1E6385AC0;
  v10[4] = *(void *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", v10);

  v5 = [v4 accessoryUUIDs];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_4;
  v9[3] = &unk_1E6385AE8;
  v9[4] = *(void *)(a1 + 32);
  v6 = objc_msgSend(v5, "na_map:", v9);

  id v7 = [MEMORY[0x1E4F7A0D8] futureWithResult:v6];

  return v7;
}

BOOL __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 connectedEcosystem];
  v5 = [v3 connectedEcosystem];

  return v4 == v5;
}

id __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 home];
  v5 = objc_msgSend(v4, "hf_accessoryWithIdentifier:", v3);

  return v5;
}

id __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 allObjects];
  v6 = [v4 reloadItemsWithHomeKitObjects:v5 filter:0 itemMap:*(void *)(a1 + 40)];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_6;
  v9[3] = &unk_1E6385B38;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  id v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  return v7;
}

id __59__HUMatterConnectedEcosystemDetailItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained allItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained allItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUMatterConnectedEcosystemDetailItemProvider;
  v2 = [(HFItemProvider *)&v7 invalidationReasons];
  uint64_t v3 = *MEMORY[0x1E4F686C0];
  v8[0] = *MEMORY[0x1E4F686B0];
  v8[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v5 = [v2 setByAddingObjectsFromArray:v4];

  return v5;
}

- (HMHome)home
{
  return self->_home;
}

- (HMCHIPEcosystem)connectedEcosystem
{
  return self->_connectedEcosystem;
}

- (void)setConnectedEcosystem:(id)a3
{
}

- (HUMatterHomeConnectedEcosystemItemProvider)connectedEcosystemItemProvider
{
  return self->_connectedEcosystemItemProvider;
}

- (void)setConnectedEcosystemItemProvider:(id)a3
{
}

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_connectedEcosystemItemProvider, 0);
  objc_storeStrong((id *)&self->_connectedEcosystem, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end