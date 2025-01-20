@interface HUDashboardAccessoryTransformItemProvider
- (BOOL)splitAccessoryGroupsByRoom;
- (BOOL)wantsRoomTransformForItem:(id)a3;
- (HFItemProvider)sourceItemProvider;
- (HMHome)home;
- (HUDashboardAccessoryTransformItemProvider)initWithSourceProvider:(id)a3 inHome:(id)a4;
- (NSMapTable)roomTransformedItems;
- (NSMutableSet)allItems;
- (id)_roomTransformedItemsForItem:(id)a3;
- (id)allTransformedItemsForItem:(id)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (id)roomTransformedItemsForItem:(id)a3;
- (id)transformSourceResults:(id)a3;
- (void)clearTransformedItemsForItem:(id)a3;
- (void)setAllItems:(id)a3;
- (void)setRoomTransformedItems:(id)a3;
- (void)setSplitAccessoryGroupsByRoom:(BOOL)a3;
@end

@implementation HUDashboardAccessoryTransformItemProvider

id __56__HUDashboardAccessoryTransformItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained transformSourceResults:v3];
  }
  else
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F69210]) initWithAddedItems:0 removedItems:0 existingItems:0];
  }
  v7 = (void *)v6;
  v8 = [v5 allItems];
  v9 = [v7 allItems];
  [v8 setSet:v9];

  v10 = [MEMORY[0x1E4F7A0D8] futureWithResult:v7];

  return v10;
}

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (BOOL)wantsRoomTransformForItem:(id)a3
{
  id v4 = a3;
  if ([(HUDashboardAccessoryTransformItemProvider *)self splitAccessoryGroupsByRoom])
  {
    v5 = [v4 accessoryRepresentableObject];
    char v6 = objc_msgSend(v5, "hf_canSpanMultipleRooms");
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)invalidationReasons
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardAccessoryTransformItemProvider;
  id v3 = [(HFItemProvider *)&v11 invalidationReasons];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HUDashboardAccessoryTransformItemProvider *)self sourceItemProvider];
  char v6 = [v5 invalidationReasons];
  [v4 unionSet:v6];

  if ([(HUDashboardAccessoryTransformItemProvider *)self splitAccessoryGroupsByRoom])
  {
    uint64_t v7 = *MEMORY[0x1E4F686E8];
    v12[0] = *MEMORY[0x1E4F686D8];
    v12[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [v4 addObjectsFromArray:v8];
  }
  v9 = (void *)[v4 copy];

  return v9;
}

- (BOOL)splitAccessoryGroupsByRoom
{
  return self->_splitAccessoryGroupsByRoom;
}

- (HFItemProvider)sourceItemProvider
{
  return self->_sourceItemProvider;
}

- (id)transformSourceResults:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HUDashboardAccessoryTransformItemProvider *)self needsTransform])
  {
    v5 = [MEMORY[0x1E4F1CA80] set];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__HUDashboardAccessoryTransformItemProvider_transformSourceResults___block_invoke;
    aBlock[3] = &unk_1E638CE98;
    aBlock[4] = self;
    id v6 = v5;
    id v40 = v6;
    uint64_t v7 = (void (**)(void *, void *, void))_Block_copy(aBlock);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v30 = v4;
    v8 = [v4 addedItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          if ([(HUDashboardAccessoryTransformItemProvider *)self wantsRoomTransformForItem:v13])
          {
            v14 = [(HUDashboardAccessoryTransformItemProvider *)self roomTransformedItemsForItem:v13];
            v7[2](v7, v14, v13);
          }
          else
          {
            [v6 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v10);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v15 = [v30 existingItems];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          if ([(HUDashboardAccessoryTransformItemProvider *)self wantsRoomTransformForItem:v20])
          {
            v21 = [(HUDashboardAccessoryTransformItemProvider *)self roomTransformedItemsForItem:v20];
            v7[2](v7, v21, v20);
          }
          else
          {
            [v6 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v17);
    }

    v22 = [(HUDashboardAccessoryTransformItemProvider *)self allItems];
    v23 = objc_msgSend(v6, "na_setByRemovingObjectsFromSet:", v22);

    v24 = [(HUDashboardAccessoryTransformItemProvider *)self allItems];
    v25 = objc_msgSend(v6, "na_setByIntersectingWithSet:", v24);

    v26 = [(HUDashboardAccessoryTransformItemProvider *)self allItems];
    v27 = objc_msgSend(v26, "na_setByRemovingObjectsFromSet:", v6);

    id v28 = (id)[objc_alloc(MEMORY[0x1E4F69210]) initWithAddedItems:v23 removedItems:v27 existingItems:v25];
    id v4 = v30;
  }
  else
  {
    id v28 = v4;
  }

  return v28;
}

- (void)setSplitAccessoryGroupsByRoom:(BOOL)a3
{
  self->_splitAccessoryGroupsByRoom = a3;
}

- (HUDashboardAccessoryTransformItemProvider)initWithSourceProvider:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUDashboardAccessoryTransformItemProvider;
  uint64_t v9 = [(HFItemProvider *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceItemProvider, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    allItems = v10->_allItems;
    v10->_allItems = (NSMutableSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    roomTransformedItems = v10->_roomTransformedItems;
    v10->_roomTransformedItems = (NSMapTable *)v13;

    objc_storeWeak((id *)&v10->_home, v8);
    v10->_splitAccessoryGroupsByRoom = 1;
  }

  return v10;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  id v3 = [(HUDashboardAccessoryTransformItemProvider *)self sourceItemProvider];
  id v4 = [v3 reloadItems];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HUDashboardAccessoryTransformItemProvider_reloadItems__block_invoke;
  v7[3] = &unk_1E6385B38;
  objc_copyWeak(&v8, &location);
  v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);

  return v5;
}

void __68__HUDashboardAccessoryTransformItemProvider_transformSourceResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 roomTransformedItems];
  uint64_t v9 = [v7 allItems];
  [v8 setObject:v9 forKey:v6];

  uint64_t v10 = *(void **)(a1 + 40);
  id v11 = [v7 allItems];

  [v10 unionSet:v11];
}

- (id)roomTransformedItemsForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUDashboardAccessoryTransformItemProvider *)self roomTransformedItems];
  id v6 = [v5 objectForKey:v4];

  id v7 = [(HUDashboardAccessoryTransformItemProvider *)self _roomTransformedItemsForItem:v4];

  id v8 = [MEMORY[0x1E4F69570] diffFromSet:v6 toSet:v7];
  uint64_t v9 = [v8 additions];
  uint64_t v10 = [v8 deletions];
  id v11 = [v8 toSet];
  v12 = objc_msgSend(v6, "na_setByIntersectingWithSet:", v11);

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F69210]) initWithAddedItems:v9 removedItems:v10 existingItems:v12];

  return v13;
}

- (id)_roomTransformedItemsForItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 accessoryRepresentableObject];
  id v6 = [MEMORY[0x1E4F1CA80] set];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(HUDashboardAccessoryTransformItemProvider *)self home];
  id v8 = objc_msgSend(v7, "hf_allRooms");

  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v5, "hf_isInRoom:", v13))
        {
          v14 = [[HUSplitRoomTransformedItem alloc] initWithSourceItem:v4 room:v13];
          [v6 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v15 = (void *)[v6 copy];

  return v15;
}

- (id)allTransformedItemsForItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUDashboardAccessoryTransformItemProvider *)self roomTransformedItems];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)clearTransformedItemsForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HUDashboardAccessoryTransformItemProvider *)self roomTransformedItems];
  [v5 removeObjectForKey:v4];
}

- (HMHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);

  return (HMHome *)WeakRetained;
}

- (void)setAllItems:(id)a3
{
}

- (NSMapTable)roomTransformedItems
{
  return self->_roomTransformedItems;
}

- (void)setRoomTransformedItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomTransformedItems, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_destroyWeak((id *)&self->_home);

  objc_storeStrong((id *)&self->_sourceItemProvider, 0);
}

@end