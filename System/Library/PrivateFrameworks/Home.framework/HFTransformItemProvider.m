@interface HFTransformItemProvider
- (HFItemProvider)sourceProvider;
- (HFTransformItemProvider)init;
- (HFTransformItemProvider)initWithSourceProvider:(id)a3 transformationBlock:(id)a4;
- (NSMutableDictionary)transformedItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)items;
- (id)reloadItems;
- (id)transformationBlock;
- (void)setSourceProvider:(id)a3;
- (void)setTransformationBlock:(id)a3;
- (void)setTransformedItems:(id)a3;
@end

@implementation HFTransformItemProvider

- (id)items
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HFTransformItemProvider *)self transformedItems];
  v4 = [v3 allValues];
  v5 = [v2 setWithArray:v4];

  return v5;
}

- (NSMutableDictionary)transformedItems
{
  return self->_transformedItems;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HFTransformItemProvider *)self sourceProvider];
  v4 = [v3 reloadItems];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__HFTransformItemProvider_reloadItems__block_invoke;
  v7[3] = &unk_26408D198;
  objc_copyWeak(&v8, &location);
  v5 = [v4 flatMap:v7];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

- (id)invalidationReasons
{
  v8.receiver = self;
  v8.super_class = (Class)HFTransformItemProvider;
  v3 = [(HFItemProvider *)&v8 invalidationReasons];
  v4 = [(HFTransformItemProvider *)self sourceProvider];
  v5 = [v4 invalidationReasons];
  v6 = [v3 setByAddingObjectsFromSet:v5];

  return v6;
}

- (HFItemProvider)sourceProvider
{
  return self->_sourceProvider;
}

id __38__HFTransformItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [v3 addedItems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = (void *)MEMORY[0x263EFF9C0];
    objc_super v8 = [v3 addedItems];
    v9 = objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v8, "count"));

    v10 = [v3 addedItems];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __38__HFTransformItemProvider_reloadItems__block_invoke_2;
    v37[3] = &unk_2640950D0;
    v37[4] = WeakRetained;
    id v38 = v9;
    id v11 = v9;
    objc_msgSend(v10, "na_each:", v37);

    [v3 setAddedItems:v11];
  }
  v12 = [v3 existingItems];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v14 = (void *)MEMORY[0x263EFF9C0];
    v15 = [v3 existingItems];
    v16 = objc_msgSend(v14, "setWithCapacity:", objc_msgSend(v15, "count"));

    v17 = [v3 existingItems];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __38__HFTransformItemProvider_reloadItems__block_invoke_3;
    v34[3] = &unk_2640950D0;
    id v35 = v16;
    id v36 = WeakRetained;
    id v18 = v16;
    objc_msgSend(v17, "na_each:", v34);

    [v3 setExistingItems:v18];
  }
  v19 = [v3 removedItems];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    v21 = (void *)MEMORY[0x263EFF9C0];
    v22 = [v3 removedItems];
    v23 = objc_msgSend(v21, "setWithCapacity:", objc_msgSend(v22, "count"));

    v24 = [v3 removedItems];
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    v30 = __38__HFTransformItemProvider_reloadItems__block_invoke_4;
    v31 = &unk_2640950D0;
    id v32 = v23;
    id v33 = WeakRetained;
    id v25 = v23;
    objc_msgSend(v24, "na_each:", &v28);

    objc_msgSend(v3, "setRemovedItems:", v25, v28, v29, v30, v31);
  }
  v26 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v26;
}

void __38__HFTransformItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 transformationBlock];
  ((void (**)(void, id))v5)[2](v5, v4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [*(id *)(a1 + 32) transformedItems];
  v7 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v4];

  [v6 setObject:v8 forKeyedSubscript:v7];
  objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v8);
}

- (id)transformationBlock
{
  return self->_transformationBlock;
}

- (HFTransformItemProvider)initWithSourceProvider:(id)a3 transformationBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFTransformItemProvider;
  v9 = [(HFItemProvider *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceProvider, a3);
    id v11 = _Block_copy(v8);
    id transformationBlock = v10->_transformationBlock;
    v10->_id transformationBlock = v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    transformedItems = v10->_transformedItems;
    v10->_transformedItems = (NSMutableDictionary *)v13;
  }
  return v10;
}

- (HFTransformItemProvider)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithSourceProvider_transformationBlock_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFTransformItemProvider.m", 24, @"%s is unavailable; use %@ instead",
    "-[HFTransformItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFTransformItemProvider *)self sourceProvider];
  uint64_t v6 = [(HFTransformItemProvider *)self transformationBlock];
  id v7 = (void *)[v4 initWithSourceProvider:v5 transformationBlock:v6];

  return v7;
}

void __38__HFTransformItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v7 = [v3 transformedItems];
  v5 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v4];

  uint64_t v6 = [v7 objectForKeyedSubscript:v5];
  objc_msgSend(v2, "na_safeAddObject:", v6);
}

void __38__HFTransformItemProvider_reloadItems__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v7 = [MEMORY[0x263F08D40] valueWithNonretainedObject:a2];
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) transformedItems];
  v5 = [v4 objectForKeyedSubscript:v7];
  objc_msgSend(v3, "na_safeAddObject:", v5);

  uint64_t v6 = [*(id *)(a1 + 40) transformedItems];
  [v6 removeObjectForKey:v7];
}

- (void)setSourceProvider:(id)a3
{
}

- (void)setTransformationBlock:(id)a3
{
}

- (void)setTransformedItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformedItems, 0);
  objc_storeStrong(&self->_transformationBlock, 0);
  objc_storeStrong((id *)&self->_sourceProvider, 0);
}

@end