@interface HUServiceGroupEditorGridItemManager
- (BOOL)_shouldHideServiceItem:(id)a3 containedInServiceGroupItem:(id)a4;
- (HFServiceGroupBuilder)serviceGroupBuilder;
- (HUServiceGroupEditorGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5;
- (HUServiceGroupEditorGridItemManager)initWithServiceGroupBuilder:(id)a3 delegate:(id)a4;
- (NSSet)prioritizedRooms;
- (id)_itemsToHideInSet:(id)a3;
- (id)_roomComparator;
- (void)setPrioritizedRooms:(id)a3;
@end

@implementation HUServiceGroupEditorGridItemManager

- (HUServiceGroupEditorGridItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  v8 = NSStringFromSelector(sel_initWithServiceGroupBuilder_delegate_);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUServiceGroupEditorGridItemManager.m", 29, @"%s is unavailable; use %@ instead",
    "-[HUServiceGroupEditorGridItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:]",
    v8);

  return 0;
}

- (HUServiceGroupEditorGridItemManager)initWithServiceGroupBuilder:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[HUSelectableServiceGridViewController defaultItemProviderCreatorWithOptions:9];
  v17.receiver = self;
  v17.super_class = (Class)HUServiceGroupEditorGridItemManager;
  v10 = [(HUServiceGridItemManager *)&v17 initWithDelegate:v8 shouldGroupByRoom:1 itemProvidersCreator:v9];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_serviceGroupBuilder, a3);
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v12 = [(HUServiceGroupEditorGridItemManager *)v10 serviceGroupBuilder];
    v13 = [v12 services];
    v14 = objc_msgSend(v13, "na_map:", &__block_literal_global_107);
    v15 = [v11 setWithArray:v14];
    [(HUServiceGroupEditorGridItemManager *)v10 setPrioritizedRooms:v15];
  }
  return v10;
}

uint64_t __76__HUServiceGroupEditorGridItemManager_initWithServiceGroupBuilder_delegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_parentRoom");
}

- (id)_itemsToHideInSet:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HUServiceGroupEditorGridItemManager;
  v5 = [(HUServiceGridItemManager *)&v30 _itemsToHideInSet:v4];
  id v24 = (id)[v5 mutableCopy];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v10 conformsToProtocol:&unk_1F1A3D460] & 1) == 0) {
          NSLog(&cfstr_ItemDoesnTConf.isa, v10);
        }
        if ([v10 conformsToProtocol:&unk_1F1A3D460])
        {
          id v11 = v10;
          v12 = [v11 services];
          uint64_t v13 = [v12 count];

          v14 = [v11 services];
          v15 = [v14 anyObject];

          if (v13 != 1) {
            goto LABEL_12;
          }
          v16 = [(HUServiceGroupEditorGridItemManager *)self serviceGroupBuilder];
          objc_super v17 = [v16 services];
          char v18 = [v17 containsObject:v15];

          if ((v18 & 1) == 0)
          {
            v19 = [(HUServiceGroupEditorGridItemManager *)self serviceGroupBuilder];
            v20 = [v11 services];
            v21 = [v20 anyObject];
            char v22 = [v19 shouldAllowAddingService:v21];

            if ((v22 & 1) == 0) {
LABEL_12:
            }
              [v24 addObject:v11];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  return v24;
}

- (BOOL)_shouldHideServiceItem:(id)a3 containedInServiceGroupItem:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUServiceGroupEditorGridItemManager;
  unsigned int v7 = [(HFItemManager *)&v15 _shouldHideServiceItem:v6 containedInServiceGroupItem:a4];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [(HUServiceGroupEditorGridItemManager *)self serviceGroupBuilder];
  v10 = [v9 services];
  id v11 = [v8 setWithArray:v10];

  v12 = [MEMORY[0x1E4F1CAD0] set];
  if ([v6 conformsToProtocol:&unk_1F1A3D460])
  {
    uint64_t v13 = [v6 services];

    v12 = (void *)v13;
  }
  if (v7) {
    unsigned int v7 = [v11 intersectsSet:v12] ^ 1;
  }

  return v7;
}

- (id)_roomComparator
{
  v3 = [(HUServiceGroupEditorGridItemManager *)self prioritizedRooms];
  v12.receiver = self;
  v12.super_class = (Class)HUServiceGroupEditorGridItemManager;
  id v4 = [(HUServiceGridItemManager *)&v12 _roomComparator];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__HUServiceGroupEditorGridItemManager__roomComparator__block_invoke;
  v9[3] = &unk_1E638A928;
  id v10 = v3;
  id v11 = v4;
  id v5 = v4;
  id v6 = v3;
  unsigned int v7 = _Block_copy(v9);

  return v7;
}

uint64_t __54__HUServiceGroupEditorGridItemManager__roomComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) containsObject:v5];
  if (v7 == [*(id *)(a1 + 32) containsObject:v6])
  {
    uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v7)
  {
    uint64_t v8 = -1;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (HFServiceGroupBuilder)serviceGroupBuilder
{
  return self->_serviceGroupBuilder;
}

- (NSSet)prioritizedRooms
{
  return self->_prioritizedRooms;
}

- (void)setPrioritizedRooms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prioritizedRooms, 0);

  objc_storeStrong((id *)&self->_serviceGroupBuilder, 0);
}

@end