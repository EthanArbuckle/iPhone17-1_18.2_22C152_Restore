@interface HUMatterConnectedHomeItemProvider
- (HMAccessory)accessory;
- (HUMatterConnectedHomeItemProvider)initWithAccessory:(id)a3;
- (NAFuture)accessoryConnectedHomeToCHIPAccessoryPairingFuture;
- (NAFuture)connectedCHIPAccessoryPairingsFuture;
- (NAFuture)connectedHomesFuture;
- (NSMutableSet)connectedHomeItems;
- (id)reloadItems;
- (void)setConnectedHomeItems:(id)a3;
@end

@implementation HUMatterConnectedHomeItemProvider

- (HUMatterConnectedHomeItemProvider)initWithAccessory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMatterConnectedHomeItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessory, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    connectedHomeItems = v7->_connectedHomeItems;
    v7->_connectedHomeItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (NAFuture)accessoryConnectedHomeToCHIPAccessoryPairingFuture
{
  accessoryConnectedHomeToCHIPAccessoryPairingFuture = self->_accessoryConnectedHomeToCHIPAccessoryPairingFuture;
  if (!accessoryConnectedHomeToCHIPAccessoryPairingFuture)
  {
    v4 = [(HUMatterConnectedHomeItemProvider *)self accessory];
    objc_msgSend(v4, "hf_allConnectedHomeToCHIPAccessoryPairingFuture");
    id v5 = (NAFuture *)objc_claimAutoreleasedReturnValue();
    v6 = self->_accessoryConnectedHomeToCHIPAccessoryPairingFuture;
    self->_accessoryConnectedHomeToCHIPAccessoryPairingFuture = v5;

    accessoryConnectedHomeToCHIPAccessoryPairingFuture = self->_accessoryConnectedHomeToCHIPAccessoryPairingFuture;
  }

  return accessoryConnectedHomeToCHIPAccessoryPairingFuture;
}

- (NAFuture)connectedHomesFuture
{
  v2 = [(HUMatterConnectedHomeItemProvider *)self accessoryConnectedHomeToCHIPAccessoryPairingFuture];
  v3 = [v2 flatMap:&__block_literal_global_299];

  return (NAFuture *)v3;
}

id __57__HUMatterConnectedHomeItemProvider_connectedHomesFuture__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [a2 allKeys];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (NAFuture)connectedCHIPAccessoryPairingsFuture
{
  v2 = [(HUMatterConnectedHomeItemProvider *)self accessoryConnectedHomeToCHIPAccessoryPairingFuture];
  v3 = [v2 flatMap:&__block_literal_global_3_6];

  return (NAFuture *)v3;
}

id __73__HUMatterConnectedHomeItemProvider_connectedCHIPAccessoryPairingsFuture__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F7A0D8];
  v3 = [a2 allValues];
  v4 = [v2 futureWithResult:v3];

  return v4;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HUMatterConnectedHomeItemProvider *)self accessoryConnectedHomeToCHIPAccessoryPairingFuture];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke;
  v6[3] = &unk_1E6389138;
  objc_copyWeak(&v7, &location);
  v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);

  return v4;
}

id __48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_1E638A780;
  id v13 = v3;
  id v5 = v3;
  v6 = _Block_copy(aBlock);
  id v7 = [v5 allKeys];
  uint64_t v8 = [WeakRetained reloadItemsWithHomeKitObjects:v7 filter:0 itemMap:v6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_1E6385B10;
  v11[4] = WeakRetained;
  v9 = [v8 flatMap:v11];

  return v9;
}

HUMatterConnectedHomeItem *__48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v8 = [[HUMatterConnectedHomeItem alloc] initWithConnectedHome:v6 accessoryPairing:v7];

  return v8;
}

id __48__HUMatterConnectedHomeItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 connectedHomeItems];
  id v6 = [v4 addedItems];
  [v5 unionSet:v6];

  id v7 = [*(id *)(a1 + 32) connectedHomeItems];
  uint64_t v8 = [v4 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v9;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (NSMutableSet)connectedHomeItems
{
  return self->_connectedHomeItems;
}

- (void)setConnectedHomeItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedHomeItems, 0);
  objc_storeStrong((id *)&self->_accessory, 0);

  objc_storeStrong((id *)&self->_accessoryConnectedHomeToCHIPAccessoryPairingFuture, 0);
}

@end