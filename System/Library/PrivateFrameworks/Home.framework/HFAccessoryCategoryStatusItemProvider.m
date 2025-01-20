@interface HFAccessoryCategoryStatusItemProvider
+ (id)_categoryStatusItemClasses;
- (HFAccessoryCategoryStatusItemProvider)initWithHome:(id)a3 room:(id)a4;
- (HFAccessoryCategoryStatusItemProvider)initWithHome:(id)a3 room:(id)a4 overrideValueSource:(id)a5;
- (HFAccessoryCategoryStatusItemProvider)initWithItems:(id)a3;
- (HFCharacteristicValueSource)valueSource;
- (HMHome)home;
- (HMRoom)room;
- (id)_buildStatusItemWithClass:(Class)a3 home:(id)a4 room:(id)a5 valueSource:(id)a6;
- (id)_createStatusItemsForHome:(id)a3 room:(id)a4 valueSource:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (void)_buildStatusItemsForGroupedStatusItem:(id)a3;
@end

@implementation HFAccessoryCategoryStatusItemProvider

+ (id)_categoryStatusItemClasses
{
  if (_MergedGlobals_2_5 != -1) {
    dispatch_once(&_MergedGlobals_2_5, &__block_literal_global_3_31);
  }
  id v2 = (id)qword_26AB2EA58;
  v3 = [v2 arrayByAddingObject:objc_opt_class()];

  return v3;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFAccessoryCategoryStatusItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  v3 = [v2 setByAddingObject:@"user"];

  return v3;
}

uint64_t __84__HFAccessoryCategoryStatusItemProvider__createStatusItemsForHome_room_valueSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _buildStatusItemWithClass:a2 home:*(void *)(a1 + 40) room:*(void *)(a1 + 48) valueSource:*(void *)(a1 + 56)];
}

- (id)_buildStatusItemWithClass:(Class)a3 home:(id)a4 room:(id)a5 valueSource:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = (void *)[[a3 alloc] initWithHome:v12 room:v11 valueSource:v10];

  objc_opt_class();
  id v14 = v13;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  if (v16) {
    [(HFAccessoryCategoryStatusItemProvider *)self _buildStatusItemsForGroupedStatusItem:v16];
  }

  return v14;
}

- (HFAccessoryCategoryStatusItemProvider)initWithHome:(id)a3 room:(id)a4
{
  return [(HFAccessoryCategoryStatusItemProvider *)self initWithHome:a3 room:a4 overrideValueSource:0];
}

- (HFAccessoryCategoryStatusItemProvider)initWithHome:(id)a3 room:(id)a4 overrideValueSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    objc_msgSend(v9, "hf_characteristicValueManager");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v14 = v13;
  v15 = [(HFAccessoryCategoryStatusItemProvider *)self _createStatusItemsForHome:v9 room:v10 valueSource:v13];
  id v16 = [MEMORY[0x263EFFA08] setWithArray:v15];
  v19.receiver = self;
  v19.super_class = (Class)HFAccessoryCategoryStatusItemProvider;
  v17 = [(HFStaticItemProvider *)&v19 initWithItems:v16];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_home, a3);
    objc_storeStrong((id *)&v17->_room, a4);
    objc_storeStrong((id *)&v17->_valueSource, v14);
  }

  return v17;
}

- (id)_createStatusItemsForHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(id)objc_opt_class() _categoryStatusItemClasses];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __84__HFAccessoryCategoryStatusItemProvider__createStatusItemsForHome_room_valueSource___block_invoke;
  v17[3] = &unk_26409A2E0;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  v15 = objc_msgSend(v11, "na_map:", v17);

  return v15;
}

void __67__HFAccessoryCategoryStatusItemProvider__categoryStatusItemClasses__block_invoke_2()
{
  v2[5] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:5];
  v1 = (void *)qword_26AB2EA58;
  qword_26AB2EA58 = v0;
}

- (HFAccessoryCategoryStatusItemProvider)initWithItems:(id)a3
{
  objc_super v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithHome_room_overrideValueSource_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryCategoryStatusItemProvider.m", 59, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryCategoryStatusItemProvider initWithItems:]",
    v6);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  objc_super v5 = [(HFAccessoryCategoryStatusItemProvider *)self home];
  v6 = [(HFAccessoryCategoryStatusItemProvider *)self room];
  v7 = [(HFAccessoryCategoryStatusItemProvider *)self valueSource];
  id v8 = (void *)[v4 initWithHome:v5 room:v6 valueSource:v7];

  return v8;
}

- (void)_buildStatusItemsForGroupedStatusItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(id)objc_opt_class() statusItemClasses];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __79__HFAccessoryCategoryStatusItemProvider__buildStatusItemsForGroupedStatusItem___block_invoke;
  v7[3] = &unk_264094040;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "na_each:", v7);
}

void __79__HFAccessoryCategoryStatusItemProvider__buildStatusItemsForGroupedStatusItem___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  objc_super v5 = [*(id *)(a1 + 40) home];
  id v6 = [*(id *)(a1 + 40) room];
  v7 = [*(id *)(a1 + 40) valueSource];
  id v8 = [v4 _buildStatusItemWithClass:a2 home:v5 room:v6 valueSource:v7];

  [*(id *)(a1 + 40) addItem:v8];
}

- (HMHome)home
{
  return self->_home;
}

- (HMRoom)room
{
  return self->_room;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end