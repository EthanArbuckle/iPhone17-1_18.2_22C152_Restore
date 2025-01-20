@interface HFMultipleTransformItemProvider
- (HFItemProvider)sourceProvider;
- (HFMultipleTransformItemProvider)initWithSourceProvider:(id)a3;
- (HFMultipleTransformItemProvider)initWithSourceProvider:(id)a3 multipleTransformationBlock:(id)a4;
- (NSMutableDictionary)transformedItems;
- (NSMutableSet)allItems;
- (id)_subclass_transformItem:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (id)transformationBlock;
- (void)setAllItems:(id)a3;
- (void)setTransformationBlock:(id)a3;
- (void)setTransformedItems:(id)a3;
@end

@implementation HFMultipleTransformItemProvider

- (HFMultipleTransformItemProvider)initWithSourceProvider:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFMultipleTransformItemProvider;
  v6 = [(HFItemProvider *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    transformedItems = v6->_transformedItems;
    v6->_transformedItems = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    allItems = v6->_allItems;
    v6->_allItems = (NSMutableSet *)v9;

    objc_storeStrong((id *)&v6->_sourceProvider, a3);
  }

  return v6;
}

- (HFMultipleTransformItemProvider)initWithSourceProvider:(id)a3 multipleTransformationBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(HFMultipleTransformItemProvider *)self initWithSourceProvider:a3];
  if (v7)
  {
    v8 = _Block_copy(v6);
    id transformationBlock = v7->_transformationBlock;
    v7->_id transformationBlock = v8;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HFMultipleTransformItemProvider *)self sourceProvider];
  id v6 = [(HFMultipleTransformItemProvider *)self transformationBlock];
  uint64_t v7 = (void *)[v4 initWithSourceProvider:v5 multipleTransformationBlock:v6];

  return v7;
}

- (id)reloadItems
{
  v3 = [(HFMultipleTransformItemProvider *)self sourceProvider];
  id v4 = [v3 reloadItems];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__HFMultipleTransformItemProvider_reloadItems__block_invoke;
  v7[3] = &unk_264090AC8;
  v7[4] = self;
  id v5 = [v4 flatMap:v7];

  return v5;
}

id __46__HFMultipleTransformItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 addedItems];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v7 = [v3 addedItems];
    v8 = objc_msgSend(v6, "setWithCapacity:", objc_msgSend(v7, "count"));

    uint64_t v9 = [v3 addedItems];
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_2;
    v48[3] = &unk_2640950D0;
    v48[4] = *(void *)(a1 + 32);
    id v49 = v8;
    id v10 = v8;
    objc_msgSend(v9, "na_each:", v48);

    [v3 setAddedItems:v10];
  }
  v11 = [v3 existingItems];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    v13 = (void *)MEMORY[0x263EFF9C0];
    v14 = [v3 existingItems];
    v15 = objc_msgSend(v13, "setWithCapacity:", objc_msgSend(v14, "count"));

    v16 = [v3 existingItems];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_3;
    v45[3] = &unk_2640950D0;
    uint64_t v17 = *(void *)(a1 + 32);
    id v46 = v15;
    uint64_t v47 = v17;
    id v18 = v15;
    objc_msgSend(v16, "na_each:", v45);

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
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_4;
    v42[3] = &unk_2640950D0;
    uint64_t v25 = *(void *)(a1 + 32);
    id v43 = v23;
    uint64_t v44 = v25;
    id v26 = v23;
    objc_msgSend(v24, "na_each:", v42);

    [v3 setRemovedItems:v26];
  }
  v27 = [*(id *)(a1 + 32) allItems];
  [v27 removeAllObjects];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v28 = objc_msgSend(*(id *)(a1 + 32), "transformedItems", 0);
  v29 = [v28 objectEnumerator];

  uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        v35 = [*(id *)(a1 + 32) allItems];
        [v35 unionSet:v34];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v31);
  }

  v36 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v36;
}

void __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "_subclass_transformItem:", v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [*(id *)(a1 + 32) transformedItems];
  id v6 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v4];

  [v5 setObject:v7 forKeyedSubscript:v6];
  [*(id *)(a1 + 40) unionSet:v7];
}

void __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v7 = [v3 transformedItems];
  uint64_t v5 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v4];

  id v6 = [v7 objectForKeyedSubscript:v5];
  [v2 unionSet:v6];
}

void __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v7 = [MEMORY[0x263F08D40] valueWithNonretainedObject:a2];
  id v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) transformedItems];
  uint64_t v5 = [v4 objectForKeyedSubscript:v7];
  [v3 unionSet:v5];

  id v6 = [*(id *)(a1 + 40) transformedItems];
  [v6 removeObjectForKey:v7];
}

- (id)_subclass_transformItem:(id)a3
{
  id v5 = a3;
  id v6 = [(HFMultipleTransformItemProvider *)self transformationBlock];

  if (!v6)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFMultipleTransformItemProvider.m", 98, @"Invalid parameter not satisfying: %@", @"self.transformationBlock" object file lineNumber description];
  }
  id v7 = [(HFMultipleTransformItemProvider *)self transformationBlock];
  v8 = ((void (**)(void, id))v7)[2](v7, v5);

  return v8;
}

- (id)invalidationReasons
{
  v8.receiver = self;
  v8.super_class = (Class)HFMultipleTransformItemProvider;
  id v3 = [(HFItemProvider *)&v8 invalidationReasons];
  id v4 = [(HFMultipleTransformItemProvider *)self sourceProvider];
  id v5 = [v4 invalidationReasons];
  id v6 = [v3 setByAddingObjectsFromSet:v5];

  return v6;
}

- (HFItemProvider)sourceProvider
{
  return self->_sourceProvider;
}

- (id)transformationBlock
{
  return self->_transformationBlock;
}

- (void)setTransformationBlock:(id)a3
{
}

- (NSMutableDictionary)transformedItems
{
  return self->_transformedItems;
}

- (void)setTransformedItems:(id)a3
{
}

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_transformedItems, 0);
  objc_storeStrong(&self->_transformationBlock, 0);
  objc_storeStrong((id *)&self->_sourceProvider, 0);
}

@end