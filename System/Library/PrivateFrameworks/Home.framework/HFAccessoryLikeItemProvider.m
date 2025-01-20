@interface HFAccessoryLikeItemProvider
- (HFAccessoryLikeItemProvider)initWithAccessoryContainer:(id)a3 inHome:(id)a4;
- (HFAccessoryLikeItemProvider)initWithHome:(id)a3;
- (HFAccessoryLikeItemProvider)initWithRoom:(id)a3;
- (HFAccessoryLikeObjectContainer)accessoryContainer;
- (HFAccessoryRepresentableObjectFiltering)accessoryContainerFilter;
- (HFCharacteristicValueSource)valueSource;
- (HMHome)home;
- (NSArray)accessoryTypeGroups;
- (NSMutableSet)accessoryLikeItems;
- (id)buildItemForAccessoryRepresentable:(id)a3;
- (id)filterBlock;
- (id)invalidationReasons;
- (id)reloadItems;
- (unint64_t)objectLevel;
- (void)setAccessoryContainerFilter:(id)a3;
- (void)setAccessoryLikeItems:(id)a3;
- (void)setAccessoryTypeGroups:(id)a3;
- (void)setFilterBlock:(id)a3;
- (void)setObjectLevel:(unint64_t)a3;
- (void)setValueSource:(id)a3;
@end

@implementation HFAccessoryLikeItemProvider

- (NSMutableSet)accessoryLikeItems
{
  return self->_accessoryLikeItems;
}

- (id)invalidationReasons
{
  v6.receiver = self;
  v6.super_class = (Class)HFAccessoryLikeItemProvider;
  v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v3 = (void *)[v2 mutableCopy];

  [v3 addObject:@"accessory"];
  [v3 addObject:@"service"];
  [v3 addObject:@"serviceGroup"];
  [v3 addObject:@"mediaSystem"];
  v4 = (void *)[v3 copy];

  return v4;
}

id __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 accessoryLikeItems];
  objc_super v6 = [v4 removedItems];
  [v5 minusSet:v6];

  v7 = [*(id *)(a1 + 32) accessoryLikeItems];
  v8 = [v4 addedItems];
  [v7 unionSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v9;
}

uint64_t __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) filterBlock];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) filterBlock];
    uint64_t v6 = ((uint64_t (**)(void, id))v5)[2](v5, v3);
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

- (id)filterBlock
{
  return self->_filterBlock;
}

id __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "hf_homeKitObject");
  id v3 = [v2 uniqueIdentifier];

  return v3;
}

uint64_t __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) buildItemForAccessoryRepresentable:a2];
}

- (id)buildItemForAccessoryRepresentable:(id)a3
{
  id v4 = a3;
  v5 = [(HFAccessoryLikeItemProvider *)self valueSource];
  uint64_t v6 = +[HFAccessoryListUtilities accessoryRepresentableItemForAccessoryRepresentable:v4 valueSource:v5];

  return v6;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setFilterBlock:(id)a3
{
}

- (HFAccessoryLikeItemProvider)initWithAccessoryContainer:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HFAccessoryLikeItemProvider;
  v9 = [(HFItemProvider *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    accessoryLikeItems = v9->_accessoryLikeItems;
    v9->_accessoryLikeItems = (NSMutableSet *)v10;

    objc_storeStrong((id *)&v9->_accessoryContainer, a3);
    objc_storeStrong((id *)&v9->_home, a4);
    uint64_t v12 = objc_msgSend(v8, "hf_characteristicValueManager");
    valueSource = v9->_valueSource;
    v9->_valueSource = (HFCharacteristicValueSource *)v12;
  }
  return v9;
}

- (id)reloadItems
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = [(HFAccessoryLikeItemProvider *)self accessoryContainer];
  id v4 = objc_msgSend(v3, "hf_accessoryLikeObjects");

  unint64_t v5 = [(HFAccessoryLikeItemProvider *)self objectLevel];
  uint64_t v6 = [(HFAccessoryLikeItemProvider *)self accessoryTypeGroups];
  id v7 = +[HFAccessoryListUtilities accessoryRepresentableObjectsFromAccessoryLikeObjects:v4 objectLevel:v5 accessoryTypeGroups:v6];

  if (+[HFUtilities isPressDemoModeEnabled])
  {
    id v8 = [(HFAccessoryLikeItemProvider *)self accessoryContainer];
    if ([v8 conformsToProtocol:&unk_26C150998]) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
    v11 = objc_msgSend(v10, "hf_demoModeAccessories");

    uint64_t v12 = HFLogForCategory(0x21uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = self;
      __int16 v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "%@: including demo mode accessories: %@", buf, 0x16u);
    }

    uint64_t v13 = [v7 arrayByAddingObjectsFromArray:v11];

    id v7 = (void *)v13;
  }
  v14 = [(HFAccessoryLikeItemProvider *)self accessoryContainerFilter];

  if (v14)
  {
    objc_super v15 = [(HFAccessoryLikeItemProvider *)self accessoryContainerFilter];
    v16 = [MEMORY[0x263EFFA08] setWithArray:v7];
    v17 = [v15 filterAccessoryRepresentableObjects:v16];
    uint64_t v18 = [v17 allObjects];

    id v7 = (void *)v18;
  }
  v23[4] = self;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_3;
  v24[3] = &unk_26408FD78;
  v24[4] = self;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_4;
  v23[3] = &unk_26409BCC0;
  v19 = [(HFItemProvider *)self reloadItemsWithObjects:v7 keyAdaptor:&__block_literal_global_226 itemAdaptor:&__block_literal_global_51_6 filter:v24 itemMap:v23];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_5;
  v22[3] = &unk_264090AC8;
  v22[4] = self;
  v20 = [v19 flatMap:v22];

  return v20;
}

- (unint64_t)objectLevel
{
  return self->_objectLevel;
}

- (NSArray)accessoryTypeGroups
{
  return self->_accessoryTypeGroups;
}

- (HFAccessoryLikeObjectContainer)accessoryContainer
{
  return self->_accessoryContainer;
}

- (HFAccessoryRepresentableObjectFiltering)accessoryContainerFilter
{
  return self->_accessoryContainerFilter;
}

- (void)setObjectLevel:(unint64_t)a3
{
  self->_objectLevel = a3;
}

- (void)setAccessoryTypeGroups:(id)a3
{
}

- (HFAccessoryLikeItemProvider)initWithHome:(id)a3
{
  return [(HFAccessoryLikeItemProvider *)self initWithAccessoryContainer:a3 inHome:a3];
}

- (HFAccessoryLikeItemProvider)initWithRoom:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 home];
  uint64_t v6 = [(HFAccessoryLikeItemProvider *)self initWithAccessoryContainer:v4 inHome:v5];

  return v6;
}

id __42__HFAccessoryLikeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 accessoryRepresentableObject];
  id v3 = objc_msgSend(v2, "hf_homeKitObject");
  id v4 = [v3 uniqueIdentifier];

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setAccessoryContainerFilter:(id)a3
{
}

- (void)setValueSource:(id)a3
{
}

- (void)setAccessoryLikeItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryLikeItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_accessoryTypeGroups, 0);
  objc_storeStrong(&self->_filterBlock, 0);
  objc_storeStrong((id *)&self->_accessoryContainerFilter, 0);
  objc_storeStrong((id *)&self->_accessoryContainer, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end