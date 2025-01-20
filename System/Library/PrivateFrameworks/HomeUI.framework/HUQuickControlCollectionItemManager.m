@interface HUQuickControlCollectionItemManager
- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate;
- (BOOL)isGridItem:(id)a3;
- (HFItemProvider)gridItemProvider;
- (HFItemProvider)supplementaryItemProvider;
- (HUQuickControlCollectionItemManager)initWithDelegate:(id)a3 gridItemProviderCreator:(id)a4 supplementaryItemProviderCreator:(id)a5;
- (NSCopying)supplementaryItem;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_buildSectionsWithDisplayedItems:(id)a3;
- (id)gridItemProviderCreator;
- (id)supplementaryItemProviderCreator;
- (void)setGridItemProvider:(id)a3;
- (void)setSupplementaryItemProvider:(id)a3;
@end

@implementation HUQuickControlCollectionItemManager

- (HUQuickControlCollectionItemManager)initWithDelegate:(id)a3 gridItemProviderCreator:(id)a4 supplementaryItemProviderCreator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HUQuickControlCollectionItemManager.m", 24, @"Invalid parameter not satisfying: %@", @"gridItemProviderCreator" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)HUQuickControlCollectionItemManager;
  v12 = [(HFItemManager *)&v19 initWithDelegate:v9 sourceItem:0];
  if (v12)
  {
    v13 = _Block_copy(v10);
    id gridItemProviderCreator = v12->_gridItemProviderCreator;
    v12->_id gridItemProviderCreator = v13;

    v15 = _Block_copy(v11);
    id supplementaryItemProviderCreator = v12->_supplementaryItemProviderCreator;
    v12->_id supplementaryItemProviderCreator = v15;
  }
  return v12;
}

- (BOOL)isGridItem:(id)a3
{
  id v4 = a3;
  v5 = [(HUQuickControlCollectionItemManager *)self gridItemProvider];
  v6 = [v5 items];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  v5 = [(HUQuickControlCollectionItemManager *)self gridItemProviderCreator];
  v6 = ((void (**)(void, id))v5)[2](v5, v4);
  [(HUQuickControlCollectionItemManager *)self setGridItemProvider:v6];

  char v7 = (void *)MEMORY[0x1E4F1CA48];
  v8 = [(HUQuickControlCollectionItemManager *)self gridItemProvider];
  id v9 = [v7 arrayWithObject:v8];

  id v10 = [(HUQuickControlCollectionItemManager *)self supplementaryItemProviderCreator];

  if (v10)
  {
    id v11 = [(HUQuickControlCollectionItemManager *)self supplementaryItemProviderCreator];
    v12 = ((void (**)(void, id))v11)[2](v11, v4);
    [(HUQuickControlCollectionItemManager *)self setSupplementaryItemProvider:v12];

    v13 = [(HUQuickControlCollectionItemManager *)self supplementaryItemProvider];
    [v9 addObject:v13];
  }

  return v9;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"grid"];
  char v7 = [(HUQuickControlCollectionItemManager *)self gridItemProvider];
  v8 = [v7 items];
  id v9 = [v8 allObjects];
  id v10 = [MEMORY[0x1E4F69220] defaultItemComparator];
  id v11 = [v9 sortedArrayUsingComparator:v10];
  [v6 setItems:v11];

  [v5 addObject:v6];
  v12 = [(HUQuickControlCollectionItemManager *)self supplementaryItemProvider];

  if (v12)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:@"supplementary"];
    v14 = [(HUQuickControlCollectionItemManager *)self supplementaryItemProvider];
    v15 = [v14 items];
    v16 = [v15 allObjects];
    v17 = [MEMORY[0x1E4F69220] defaultItemComparator];
    v18 = [v16 sortedArrayUsingComparator:v17];
    [v13 setItems:v18];

    [v5 addObject:v13];
  }
  objc_super v19 = [MEMORY[0x1E4F69220] filterSections:v5 toDisplayedItems:v4];

  return v19;
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  return 0;
}

- (HFItemProvider)gridItemProvider
{
  return self->_gridItemProvider;
}

- (void)setGridItemProvider:(id)a3
{
}

- (NSCopying)supplementaryItem
{
  return self->_supplementaryItem;
}

- (id)gridItemProviderCreator
{
  return self->_gridItemProviderCreator;
}

- (id)supplementaryItemProviderCreator
{
  return self->_supplementaryItemProviderCreator;
}

- (HFItemProvider)supplementaryItemProvider
{
  return self->_supplementaryItemProvider;
}

- (void)setSupplementaryItemProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryItemProvider, 0);
  objc_storeStrong(&self->_supplementaryItemProviderCreator, 0);
  objc_storeStrong(&self->_gridItemProviderCreator, 0);
  objc_storeStrong((id *)&self->_supplementaryItem, 0);

  objc_storeStrong((id *)&self->_gridItemProvider, 0);
}

@end