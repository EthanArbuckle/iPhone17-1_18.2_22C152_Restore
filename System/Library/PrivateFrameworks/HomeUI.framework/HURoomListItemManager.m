@interface HURoomListItemManager
- (HFItem)addRoomItem;
- (HFReorderableHomeKitItemList)clientReorderableRoomList;
- (HFReorderableHomeKitItemList)reorderableRoomList;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_comparatorForSectionIdentifier:(id)a3;
- (int64_t)roomsSection;
- (void)setAddRoomItem:(id)a3;
- (void)setClientReorderableRoomList:(id)a3;
@end

@implementation HURoomListItemManager

- (int64_t)roomsSection
{
  return 0;
}

- (HFReorderableHomeKitItemList)reorderableRoomList
{
  v3 = [(HURoomListItemManager *)self clientReorderableRoomList];

  if (v3)
  {
    v4 = [(HURoomListItemManager *)self clientReorderableRoomList];
  }
  else
  {
    v5 = [(HFItemManager *)self sourceItem];
    v6 = [v5 latestResults];
    v4 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68A40]];
  }

  return (HFReorderableHomeKitItemList *)v4;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F69488];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithHome:v5];
  int v7 = objc_msgSend(v5, "hf_currentUserIsAdministrator");

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F695C0]);
    uint64_t v20 = *MEMORY[0x1E4F68AB8];
    v9 = _HULocalizedStringWithDefaultValue(@"HURoomListAddButtonTitle", @"HURoomListAddButtonTitle", 1);
    v21[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v11 = (void *)[v8 initWithResults:v10];
    [(HURoomListItemManager *)self setAddRoomItem:v11];
  }
  id v12 = objc_alloc(MEMORY[0x1E4F695C8]);
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  v14 = [(HURoomListItemManager *)self addRoomItem];
  v15 = objc_msgSend(v13, "na_setWithSafeObject:", v14);
  v16 = (void *)[v12 initWithItems:v15];

  v19[0] = v6;
  v19[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];

  return v17;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HURoomListItemManager;
  v4 = [(HFItemManager *)&v13 _comparatorForSectionIdentifier:a3];
  id v5 = [(HURoomListItemManager *)self reorderableRoomList];
  v6 = [v5 sortedHomeKitItemComparator];
  int v7 = v6;
  if (!v6) {
    v6 = v4;
  }
  id v8 = _Block_copy(v6);

  v9 = (void *)MEMORY[0x1E4F69758];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v11 = [v9 comparatorWithSortedClasses:v10 secondaryComparator:v8];

  return v11;
}

- (HFItem)addRoomItem
{
  return self->_addRoomItem;
}

- (void)setAddRoomItem:(id)a3
{
}

- (HFReorderableHomeKitItemList)clientReorderableRoomList
{
  return self->_clientReorderableRoomList;
}

- (void)setClientReorderableRoomList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReorderableRoomList, 0);

  objc_storeStrong((id *)&self->_addRoomItem, 0);
}

@end