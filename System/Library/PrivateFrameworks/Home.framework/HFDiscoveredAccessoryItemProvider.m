@interface HFDiscoveredAccessoryItemProvider
- (HFAccessoryBrowsingManager)accessoryBrowsingManager;
- (HFDiscoveredAccessoryItemProvider)init;
- (HFDiscoveredAccessoryItemProvider)initWithAccessoryBrowsingManager:(id)a3;
- (NSMutableSet)discoveredAccessoryItems;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setDiscoveredAccessoryItems:(id)a3;
- (void)setFilter:(id)a3;
@end

@implementation HFDiscoveredAccessoryItemProvider

- (HFDiscoveredAccessoryItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithAccessoryBrowsingManager_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDiscoveredAccessoryItemProvider.m", 25, @"%s is unavailable; use %@ instead",
    "-[HFDiscoveredAccessoryItemProvider init]",
    v5);

  return 0;
}

- (HFDiscoveredAccessoryItemProvider)initWithAccessoryBrowsingManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFDiscoveredAccessoryItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessoryBrowsingManager, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    discoveredAccessoryItems = v7->_discoveredAccessoryItems;
    v7->_discoveredAccessoryItems = (NSMutableSet *)v8;
  }
  return v7;
}

- (id)reloadItems
{
  v3 = [(HFDiscoveredAccessoryItemProvider *)self accessoryBrowsingManager];
  v4 = [v3 discoveredHMAccessories];
  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_12_10);

  v6 = [(HFDiscoveredAccessoryItemProvider *)self accessoryBrowsingManager];
  v7 = [v6 discoveredSharingDevices];
  uint64_t v8 = objc_msgSend(v7, "na_map:", &__block_literal_global_15_10);
  v9 = [v5 arrayByAddingObjectsFromArray:v8];

  objc_initWeak(&location, self);
  v10 = [(HFDiscoveredAccessoryItemProvider *)self filter];
  objc_super v11 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v9 filter:v10 itemMap:&__block_literal_global_209];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__HFDiscoveredAccessoryItemProvider_reloadItems__block_invoke_16;
  v14[3] = &unk_26408D198;
  objc_copyWeak(&v15, &location);
  v12 = [v11 flatMap:v14];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  return v12;
}

HFDiscoveredAccessoryItem *__48__HFDiscoveredAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [HFDiscoveredAccessoryItem alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = v2;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v5;
    if (v6) {
      goto LABEL_8;
    }
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v4, objc_opt_class() file lineNumber description];
  }
  v7 = 0;
LABEL_8:

  v10 = [(HFDiscoveredAccessoryItem *)v3 initWithDiscoveredAccessory:v7];
  return v10;
}

HFDiscoveredAccessory *__48__HFDiscoveredAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HFDiscoveredAccessory alloc] initWithAccessory:v2];

  return v3;
}

HFDiscoveredAccessory *__48__HFDiscoveredAccessoryItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  int v3 = [v2 deviceActionType];
  BOOL v4 = v3 == 33 || v3 == 11;
  if (v4 && ([v2 needsSetup] & 1) != 0)
  {
    id v5 = [[HFDiscoveredAccessory alloc] initWithSharingDevice:v2];
  }
  else
  {
    v6 = HFLogForCategory(0x3BuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v2;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "Not showing SFDevice because it doesn't have the right type, or it doesn't need setup: %@", (uint8_t *)&v8, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

id __48__HFDiscoveredAccessoryItemProvider_reloadItems__block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained discoveredAccessoryItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  v7 = [WeakRetained discoveredAccessoryItems];
  int v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFDiscoveredAccessoryItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"accessory"];

  return v3;
}

- (HFAccessoryBrowsingManager)accessoryBrowsingManager
{
  return self->_accessoryBrowsingManager;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (NSMutableSet)discoveredAccessoryItems
{
  return self->_discoveredAccessoryItems;
}

- (void)setDiscoveredAccessoryItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredAccessoryItems, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_accessoryBrowsingManager, 0);
}

@end