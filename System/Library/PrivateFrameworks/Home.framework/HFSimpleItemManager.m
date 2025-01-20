@interface HFSimpleItemManager
- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate;
- (BOOL)shouldDisableOptionalDataDuringFastInitialUpdate;
- (HFSimpleItemManager)initWithDelegate:(id)a3 itemProvidersCreator:(id)a4;
- (HFSimpleItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 itemProvidersCreator:(id)a5;
- (id)_buildItemModulesForHome:(id)a3;
- (id)_buildItemProvidersForHome:(id)a3;
- (id)_comparatorForSectionIdentifier:(id)a3;
- (id)_homeFuture;
- (id)homeCreator;
- (id)itemComparator;
- (id)itemModuleCreator;
- (id)itemProviderCreator;
- (void)setHomeCreator:(id)a3;
- (void)setItemComparator:(id)a3;
- (void)setItemModuleCreator:(id)a3;
- (void)setItemProviderCreator:(id)a3;
- (void)setShouldDisableOptionalDataDuringFastInitialUpdate:(BOOL)a3;
@end

@implementation HFSimpleItemManager

- (HFSimpleItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 itemProvidersCreator:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HFSimpleItemManager;
  v9 = [(HFItemManager *)&v13 initWithDelegate:a3 sourceItem:a4];
  if (v9)
  {
    v10 = _Block_copy(v8);
    id itemProviderCreator = v9->_itemProviderCreator;
    v9->_id itemProviderCreator = v10;

    [(HFSimpleItemManager *)v9 setShouldDisableOptionalDataDuringFastInitialUpdate:1];
  }

  return v9;
}

- (HFSimpleItemManager)initWithDelegate:(id)a3 itemProvidersCreator:(id)a4
{
  return [(HFSimpleItemManager *)self initWithDelegate:a3 sourceItem:0 itemProvidersCreator:a4];
}

- (BOOL)_shouldDisableOptionalDataDuringFastInitialUpdate
{
  BOOL v3 = [(HFSimpleItemManager *)self shouldDisableOptionalDataDuringFastInitialUpdate];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)HFSimpleItemManager;
    LOBYTE(v3) = [(HFItemManager *)&v5 _shouldDisableOptionalDataDuringFastInitialUpdate];
  }
  return v3;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HFSimpleItemManager *)self itemModuleCreator];
  if (v5)
  {
    v6 = [(HFSimpleItemManager *)self itemModuleCreator];
    v7 = ((void (**)(void, id, HFSimpleItemManager *))v6)[2](v6, v4, self);
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HFSimpleItemManager *)self itemProviderCreator];
  if (v5)
  {
    v6 = [(HFSimpleItemManager *)self itemProviderCreator];
    v7 = ((void (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(HFSimpleItemManager *)self itemComparator];
  v6 = v5;
  if (v5)
  {
    v7 = _Block_copy(v5);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HFSimpleItemManager;
    id v8 = [(HFItemManager *)&v10 _comparatorForSectionIdentifier:v4];
    v7 = _Block_copy(v8);
  }
  return v7;
}

- (id)_homeFuture
{
  BOOL v3 = [(HFSimpleItemManager *)self homeCreator];
  if (v3)
  {
    id v4 = [(HFSimpleItemManager *)self homeCreator];
    objc_super v5 = v4[2]();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HFSimpleItemManager;
    objc_super v5 = [(HFItemManager *)&v7 _homeFuture];
  }

  return v5;
}

- (id)homeCreator
{
  return self->_homeCreator;
}

- (void)setHomeCreator:(id)a3
{
}

- (id)itemModuleCreator
{
  return self->_itemModuleCreator;
}

- (void)setItemModuleCreator:(id)a3
{
}

- (id)itemProviderCreator
{
  return self->_itemProviderCreator;
}

- (void)setItemProviderCreator:(id)a3
{
}

- (id)itemComparator
{
  return self->_itemComparator;
}

- (void)setItemComparator:(id)a3
{
}

- (BOOL)shouldDisableOptionalDataDuringFastInitialUpdate
{
  return self->_shouldDisableOptionalDataDuringFastInitialUpdate;
}

- (void)setShouldDisableOptionalDataDuringFastInitialUpdate:(BOOL)a3
{
  self->_shouldDisableOptionalDataDuringFastInitialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemComparator, 0);
  objc_storeStrong(&self->_itemProviderCreator, 0);
  objc_storeStrong(&self->_itemModuleCreator, 0);
  objc_storeStrong(&self->_homeCreator, 0);
}

@end