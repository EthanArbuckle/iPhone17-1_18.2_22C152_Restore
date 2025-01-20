@interface HULinkedApplicationItemProvider
+ (BOOL)prefersNonBlockingReloads;
- (HMHome)home;
- (HULinkedApplicationItemProvider)init;
- (HULinkedApplicationItemProvider)initWithHome:(id)a3;
- (NSSet)linkedApplicationItems;
- (id)_generateItemsFromSoftwareLookupResult:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setFilter:(id)a3;
- (void)setLinkedApplicationItems:(id)a3;
@end

@implementation HULinkedApplicationItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 1;
}

- (HULinkedApplicationItemProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HULinkedApplicationItemProvider.m", 32, @"%s is unavailable; use %@ instead",
    "-[HULinkedApplicationItemProvider init]",
    v5);

  return 0;
}

- (HULinkedApplicationItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HULinkedApplicationItemProvider;
  v6 = [(HFItemProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    linkedApplicationItems = v7->_linkedApplicationItems;
    v7->_linkedApplicationItems = v8;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HULinkedApplicationItemProvider *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HULinkedApplicationItemProvider;
  v2 = [(HFItemProvider *)&v5 invalidationReasons];
  v3 = [v2 setByAddingObject:*MEMORY[0x1E4F686B0]];

  return v3;
}

- (id)reloadItems
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(HULinkedApplicationItemProvider *)self home];
  objc_super v5 = [v4 accessories];
  v6 = [v3 setWithArray:v5];

  v7 = [(HULinkedApplicationItemProvider *)self filter];

  if (v7)
  {
    v8 = [(HULinkedApplicationItemProvider *)self filter];
    uint64_t v9 = objc_msgSend(v6, "na_filter:", v8);

    v6 = (void *)v9;
  }
  v10 = +[HUSoftwareLibraryLookupResult resultForAccessories:v6];
  objc_initWeak(&location, self);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __46__HULinkedApplicationItemProvider_reloadItems__block_invoke;
  v17 = &unk_1E638C498;
  objc_copyWeak(&v18, &location);
  objc_super v11 = [v10 flatMap:&v14];
  v12 = objc_msgSend(v11, "recover:", &__block_literal_global_138, v14, v15, v16, v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

id __46__HULinkedApplicationItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_super v5 = [WeakRetained _generateItemsFromSoftwareLookupResult:v3];

  v6 = [WeakRetained linkedApplicationItems];
  v7 = objc_msgSend(v6, "na_setByDiffingWithSet:", v5);

  v8 = (void *)MEMORY[0x1E4F69570];
  uint64_t v9 = [WeakRetained linkedApplicationItems];
  v10 = [v8 diffFromSet:v9 toSet:v7];

  [WeakRetained setLinkedApplicationItems:v7];
  id v11 = objc_alloc(MEMORY[0x1E4F69210]);
  v12 = [v10 additions];
  v13 = [v10 deletions];
  uint64_t v14 = [v10 updates];
  uint64_t v15 = (void *)[v11 initWithAddedItems:v12 removedItems:v13 existingItems:v14];

  v16 = [MEMORY[0x1E4F7A0D8] futureWithResult:v15];

  return v16;
}

id __46__HULinkedApplicationItemProvider_reloadItems__block_invoke_2()
{
  id v0 = objc_alloc(MEMORY[0x1E4F69210]);
  v1 = [MEMORY[0x1E4F1CAD0] set];
  v2 = [MEMORY[0x1E4F1CAD0] set];
  id v3 = [MEMORY[0x1E4F1CAD0] set];
  id v4 = (void *)[v0 initWithAddedItems:v1 removedItems:v2 existingItems:v3];

  objc_super v5 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v5;
}

- (id)_generateItemsFromSoftwareLookupResult:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  objc_super v5 = [v3 matchedLibraryItems];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__HULinkedApplicationItemProvider__generateItemsFromSoftwareLookupResult___block_invoke;
  v17[3] = &unk_1E638C4C0;
  id v6 = v3;
  id v18 = v6;
  id v7 = v4;
  id v19 = v7;
  objc_msgSend(v5, "na_each:", v17);

  v8 = [v6 matchedStoreItems];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__HULinkedApplicationItemProvider__generateItemsFromSoftwareLookupResult___block_invoke_2;
  v14[3] = &unk_1E638C4E8;
  id v15 = v6;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  objc_msgSend(v8, "na_each:", v14);

  id v11 = v16;
  id v12 = v9;

  return v12;
}

void __74__HULinkedApplicationItemProvider__generateItemsFromSoftwareLookupResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_super v5 = [v3 accessoriesByBundleIDs];
  id v6 = [v4 bundleIdentifier];
  id v9 = [v5 objectForKeyedSubscript:v6];

  id v7 = *(void **)(a1 + 40);
  v8 = [[HULinkedApplicationLibraryItem alloc] initWithApplicationProxy:v4 associatedAccessories:v9];

  [v7 addObject:v8];
}

void __74__HULinkedApplicationItemProvider__generateItemsFromSoftwareLookupResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_super v5 = [v3 accessoriesByStoreIDs];
  id v6 = [v4 iTunesStoreIdentifier];
  id v7 = [v6 stringValue];
  id v10 = [v5 objectForKeyedSubscript:v7];

  v8 = *(void **)(a1 + 40);
  id v9 = [[HULinkedApplicationStoreItem alloc] initWithStoreItem:v4 associatedAccessories:v10];

  [v8 addObject:v9];
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (NSSet)linkedApplicationItems
{
  return self->_linkedApplicationItems;
}

- (void)setLinkedApplicationItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApplicationItems, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong(&self->_filter, 0);
}

@end