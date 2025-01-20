@interface HFCameraItemProvider
- (BOOL)onlyShowsFavorites;
- (HFCameraItemProvider)init;
- (HFCameraItemProvider)initWithHome:(id)a3;
- (HMHome)home;
- (HMRoom)room;
- (NSMutableSet)cameraItems;
- (id)_favoriteFilter;
- (id)_roomFilter;
- (id)_showInHomeDashboardFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setCameraItems:(id)a3;
- (void)setFilter:(id)a3;
- (void)setOnlyShowsFavorites:(BOOL)a3;
- (void)setRoom:(id)a3;
@end

@implementation HFCameraItemProvider

- (NSMutableSet)cameraItems
{
  return self->_cameraItems;
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFCameraItemProvider;
  v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"service";
  v7[1] = @"accessory";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

HFCameraItem *__35__HFCameraItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [HFCameraItem alloc];
  objc_super v6 = [WeakRetained home];
  v7 = objc_msgSend(v6, "hf_characteristicValueManager");
  v8 = [(HFAccessoryProfileItem *)v5 initWithProfile:v3 valueSource:v7];

  return v8;
}

uint64_t __35__HFCameraItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) _roomFilter];
  if (((unsigned int (**)(void, id))v4)[2](v4, v3))
  {
    v5 = [*(id *)(a1 + 32) _showInHomeDashboardFilter];
    uint64_t v6 = ((uint64_t (**)(void, id))v5)[2](v5, v3);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __50__HFCameraItemProvider__showInHomeDashboardFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) onlyShowsFavorites]) {
    uint64_t v4 = objc_msgSend(v3, "hf_effectiveShowInHomeDashboard");
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

uint64_t __35__HFCameraItemProvider__roomFilter__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  if (!v2) {
    return 1;
  }
  id v3 = [a2 accessory];
  uint64_t v4 = [v3 room];
  v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v2 isEqual:v5];

  return v6;
}

- (BOOL)onlyShowsFavorites
{
  return self->_onlyShowsFavorites;
}

- (id)_showInHomeDashboardFilter
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__HFCameraItemProvider__showInHomeDashboardFilter__block_invoke;
  aBlock[3] = &unk_26408FD50;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  id v3 = (void *)[v2 copy];

  return v3;
}

- (id)_roomFilter
{
  v2 = [(HFCameraItemProvider *)self room];
  id v3 = [v2 uniqueIdentifier];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HFCameraItemProvider__roomFilter__block_invoke;
  aBlock[3] = &unk_264092120;
  id v9 = v3;
  id v4 = v3;
  v5 = _Block_copy(aBlock);
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

- (HMRoom)room
{
  return self->_room;
}

- (HFCameraItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFCameraItemProvider;
  uint64_t v6 = [(HFItemProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = [MEMORY[0x263EFF9C0] set];
    [(HFCameraItemProvider *)v7 setCameraItems:v8];
  }
  return v7;
}

- (void)setCameraItems:(id)a3
{
}

- (void)setFilter:(id)a3
{
}

- (id)reloadItems
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HFCameraItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_26408F3B0;
  objc_copyWeak(&v24, &location);
  id v3 = _Block_copy(aBlock);
  id v4 = [MEMORY[0x263EFF980] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(HFCameraItemProvider *)self home];
  uint64_t v6 = [v5 accessories];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_super v10 = [*(id *)(*((void *)&v19 + 1) + 8 * i) cameraProfiles];
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v26 count:16];
    }
    while (v7);
  }

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __35__HFCameraItemProvider_reloadItems__block_invoke_2;
  v18[3] = &unk_264092120;
  v18[4] = self;
  v11 = objc_msgSend(v4, "na_filter:", v18);
  v12 = [(HFCameraItemProvider *)self filter];
  v13 = [(HFItemProvider *)self reloadItemsWithHomeKitObjects:v11 filter:v12 itemMap:v3];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __35__HFCameraItemProvider_reloadItems__block_invoke_3;
  v16[3] = &unk_26408D198;
  objc_copyWeak(&v17, &location);
  v14 = [v13 flatMap:v16];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
  return v14;
}

- (HMHome)home
{
  return self->_home;
}

- (id)filter
{
  return self->_filter;
}

- (void)setRoom:(id)a3
{
}

id __35__HFCameraItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained cameraItems];
  uint64_t v6 = [v3 addedItems];
  [v5 unionSet:v6];

  uint64_t v7 = [WeakRetained cameraItems];
  uint64_t v8 = [v3 removedItems];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (HFCameraItemProvider)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCameraItemProvider.m", 26, @"%s is unavailable; use %@ instead",
    "-[HFCameraItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFCameraItemProvider *)self home];
  uint64_t v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (id)_favoriteFilter
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__HFCameraItemProvider__favoriteFilter__block_invoke;
  aBlock[3] = &unk_26408FD28;
  void aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  id v3 = (void *)[v2 copy];

  return v3;
}

uint64_t __39__HFCameraItemProvider__favoriteFilter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) onlyShowsFavorites]) {
    uint64_t v4 = objc_msgSend(v3, "hf_effectiveIsFavorite");
  }
  else {
    uint64_t v4 = 1;
  }

  return v4;
}

- (void)setOnlyShowsFavorites:(BOOL)a3
{
  self->_onlyShowsFavorites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraItems, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end