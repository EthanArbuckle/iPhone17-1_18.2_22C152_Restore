@interface HFServiceItemProvider
- (HFCharacteristicValueSource)overrideValueSource;
- (HFCharacteristicValueSource)valueSource;
- (HFServiceItemProvider)initWithHome:(id)a3;
- (HFServiceItemProvider)initWithHome:(id)a3 serviceTypes:(id)a4;
- (HMHome)home;
- (NSArray)serviceTypes;
- (NSMutableSet)serviceItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filter;
- (id)invalidationReasons;
- (id)reloadItems;
- (id)sourceServiceGenerator;
- (void)setFilter:(id)a3;
- (void)setOverrideValueSource:(id)a3;
- (void)setServiceItems:(id)a3;
- (void)setServiceTypes:(id)a3;
- (void)setSourceServiceGenerator:(id)a3;
@end

@implementation HFServiceItemProvider

- (HFServiceItemProvider)initWithHome:(id)a3
{
  return [(HFServiceItemProvider *)self initWithHome:a3 serviceTypes:0];
}

- (HFServiceItemProvider)initWithHome:(id)a3 serviceTypes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HFServiceItemProvider;
  v9 = [(HFItemProvider *)&v17 init];
  v10 = v9;
  if (v9)
  {
    v11 = &OBJC_IVAR___HFServiceItemProvider__home;
    objc_storeStrong((id *)&v9->_home, a3);
    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    serviceItems = v10->_serviceItems;
    v10->_serviceItems = (NSMutableSet *)v12;

    v14 = (void *)[v8 copy];
    v15 = v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x263F0E708], "hf_standardServiceTypes");
      v11 = (int *)objc_claimAutoreleasedReturnValue();
      v15 = [v11 allObjects];
    }
    objc_storeStrong((id *)&v10->_serviceTypes, v15);
    if (!v14)
    {
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFServiceItemProvider *)self home];
  v6 = [(HFServiceItemProvider *)self serviceTypes];
  id v7 = (void *)[v4 initWithHome:v5 serviceTypes:v6];

  return v7;
}

- (id)reloadItems
{
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __36__HFServiceItemProvider_reloadItems__block_invoke;
  v14[3] = &unk_264091E30;
  v14[4] = self;
  v3 = __36__HFServiceItemProvider_reloadItems__block_invoke((uint64_t)v14);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__HFServiceItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_26408F3B0;
  objc_copyWeak(&v12, &location);
  id v4 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__HFServiceItemProvider_reloadItems__block_invoke_4;
  v8[3] = &unk_2640935F0;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  objc_copyWeak(&v10, &location);
  v6 = [v3 flatMap:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

id __36__HFServiceItemProvider_reloadItems__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) sourceServiceGenerator];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) sourceServiceGenerator];
    id v4 = [*(id *)(a1 + 32) home];
    ((void (**)(void, void *))v3)[2](v3, v4);
  }
  else
  {
    id v5 = (void *)MEMORY[0x263F58190];
    v3 = [*(id *)(a1 + 32) home];
    id v4 = objc_msgSend(v3, "hf_allVisibleServices");
    [v5 futureWithResult:v4];
  v6 = };

  return v6;
}

id __36__HFServiceItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = v3;
  v6 = +[HFServiceItem itemClassForService:v5];
  id v7 = [WeakRetained serviceTypes];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  objc_super v17 = __36__HFServiceItemProvider_reloadItems__block_invoke_3;
  v18 = &unk_26408D210;
  id v8 = v5;
  id v19 = v8;
  int v9 = objc_msgSend(v7, "na_any:", &v15);

  if (v6)
  {
    if (v9)
    {
LABEL_3:
      id v10 = [v6 alloc];
      v11 = [WeakRetained valueSource];
      id v12 = (void *)[v10 initWithValueSource:v11 service:v8];

      goto LABEL_6;
    }
  }
  else
  {
    v13 = [v8 serviceType];
    NSLog(&cfstr_NoHfserviceite.isa, v13, v15, v16, v17, v18);

    if (v9) {
      goto LABEL_3;
    }
  }
  id v12 = 0;
LABEL_6:

  return v12;
}

uint64_t __36__HFServiceItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 serviceType];
  uint64_t v5 = [v4 isEqualToString:v3];

  return v5;
}

id __36__HFServiceItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 allObjects];
  v6 = [*(id *)(a1 + 32) filter];
  id v7 = [v4 reloadItemsWithHomeKitObjects:v5 filter:v6 itemMap:*(void *)(a1 + 40)];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__HFServiceItemProvider_reloadItems__block_invoke_5;
  v10[3] = &unk_26408D198;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v8 = [v7 flatMap:v10];
  objc_destroyWeak(&v11);

  return v8;
}

id __36__HFServiceItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained serviceItems];
  v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained serviceItems];
  id v8 = [v3 removedItems];
  [v7 minusSet:v8];

  int v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v7[2] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFServiceItemProvider;
  v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"service";
  v7[1] = @"accessory";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  id v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (HFCharacteristicValueSource)valueSource
{
  id v3 = [(HFServiceItemProvider *)self overrideValueSource];

  if (v3)
  {
    id v4 = [(HFServiceItemProvider *)self overrideValueSource];
  }
  else
  {
    uint64_t v5 = [(HFServiceItemProvider *)self home];
    id v4 = objc_msgSend(v5, "hf_characteristicValueManager");
  }
  return (HFCharacteristicValueSource *)v4;
}

- (HMHome)home
{
  return self->_home;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (id)sourceServiceGenerator
{
  return self->_sourceServiceGenerator;
}

- (void)setSourceServiceGenerator:(id)a3
{
}

- (NSMutableSet)serviceItems
{
  return self->_serviceItems;
}

- (void)setServiceItems:(id)a3
{
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (void)setServiceTypes:(id)a3
{
}

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

- (void)setOverrideValueSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_serviceItems, 0);
  objc_storeStrong(&self->_sourceServiceGenerator, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end