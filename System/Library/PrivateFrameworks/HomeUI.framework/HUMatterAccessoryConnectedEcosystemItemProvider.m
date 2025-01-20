@interface HUMatterAccessoryConnectedEcosystemItemProvider
- (HMAccessory)accessory;
- (HUMatterAccessoryConnectedEcosystemItemProvider)initWithAccessory:(id)a3;
- (HUMatterConnectedHomeItemProvider)connectedHomeItemProvider;
- (NAFuture)accessoryConnectedEcosystemToCHIPAccessoryPairingsFuture;
- (NAFuture)connectedEcosystemsFuture;
- (NSMutableSet)connectedEcosystemItems;
- (id)reloadItems;
- (void)setConnectedEcosystemItems:(id)a3;
- (void)setConnectedHomeItemProvider:(id)a3;
@end

@implementation HUMatterAccessoryConnectedEcosystemItemProvider

- (HUMatterAccessoryConnectedEcosystemItemProvider)initWithAccessory:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HUMatterAccessoryConnectedEcosystemItemProvider;
  v6 = [(HFItemProvider *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessory, a3);
    v8 = [[HUMatterConnectedHomeItemProvider alloc] initWithAccessory:v5];
    connectedHomeItemProvider = v7->_connectedHomeItemProvider;
    v7->_connectedHomeItemProvider = v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    connectedEcosystemItems = v7->_connectedEcosystemItems;
    v7->_connectedEcosystemItems = (NSMutableSet *)v10;
  }
  return v7;
}

- (NAFuture)connectedEcosystemsFuture
{
  v2 = [(HUMatterAccessoryConnectedEcosystemItemProvider *)self connectedHomeItemProvider];
  v3 = [v2 connectedCHIPAccessoryPairingsFuture];
  v4 = [v3 flatMap:&__block_literal_global_152];

  return (NAFuture *)v4;
}

id __76__HUMatterAccessoryConnectedEcosystemItemProvider_connectedEcosystemsFuture__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__HUMatterAccessoryConnectedEcosystemItemProvider_connectedEcosystemsFuture__block_invoke_2;
  v8[3] = &unk_1E638D398;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend(v3, "na_each:", v8);

  v6 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v6;
}

void __76__HUMatterAccessoryConnectedEcosystemItemProvider_connectedEcosystemsFuture__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 home];
  id v4 = [v3 ecosystem];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
    }
    [v5 addObject:v6];
  }
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  id v3 = [(HUMatterAccessoryConnectedEcosystemItemProvider *)self connectedEcosystemsFuture];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__HUMatterAccessoryConnectedEcosystemItemProvider_reloadItems__block_invoke;
  v6[3] = &unk_1E6389138;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);

  return v4;
}

id __62__HUMatterAccessoryConnectedEcosystemItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__HUMatterAccessoryConnectedEcosystemItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_1E638A780;
  id v13 = v3;
  id v5 = v3;
  id v6 = _Block_copy(aBlock);
  id v7 = [v5 allKeys];
  v8 = [WeakRetained reloadItemsWithHomeKitObjects:v7 filter:0 itemMap:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__HUMatterAccessoryConnectedEcosystemItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_1E6385B10;
  v11[4] = WeakRetained;
  id v9 = [v8 flatMap:v11];

  return v9;
}

HUMatterAccessoryConnectedEcosystemItem *__62__HUMatterAccessoryConnectedEcosystemItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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

  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  v8 = [[HUMatterAccessoryConnectedEcosystemItem alloc] initWithConnectedEcosystem:v6 chipAccessoryPairings:v7];

  return v8;
}

id __62__HUMatterAccessoryConnectedEcosystemItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 connectedEcosystemItems];
  id v6 = [v4 addedItems];
  [v5 unionSet:v6];

  id v7 = [*(id *)(a1 + 32) connectedEcosystemItems];
  v8 = [v4 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v9;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HUMatterConnectedHomeItemProvider)connectedHomeItemProvider
{
  return self->_connectedHomeItemProvider;
}

- (void)setConnectedHomeItemProvider:(id)a3
{
}

- (NSMutableSet)connectedEcosystemItems
{
  return self->_connectedEcosystemItems;
}

- (void)setConnectedEcosystemItems:(id)a3
{
}

- (NAFuture)accessoryConnectedEcosystemToCHIPAccessoryPairingsFuture
{
  return self->_accessoryConnectedEcosystemToCHIPAccessoryPairingsFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryConnectedEcosystemToCHIPAccessoryPairingsFuture, 0);
  objc_storeStrong((id *)&self->_connectedEcosystemItems, 0);
  objc_storeStrong((id *)&self->_connectedHomeItemProvider, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

@end