@interface HFAbstractGroupedStatusItem
+ (id)sortKey;
+ (id)statusItemClasses;
- (BOOL)_hasRequiredStatusItems;
- (BOOL)shouldEncapsulateItem:(id)a3;
- (NSMutableSet)allItems;
- (NSSet)displayedItems;
- (NSSet)items;
- (id)_statusItemOfClass:(Class)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addItem:(id)a3;
- (void)removeItem:(id)a3;
- (void)setAllItems:(id)a3;
- (void)setDisplayedItems:(id)a3;
@end

@implementation HFAbstractGroupedStatusItem

- (NSSet)items
{
  displayedItems = self->_displayedItems;
  if (displayedItems)
  {
    v3 = displayedItems;
  }
  else
  {
    v3 = [MEMORY[0x263EFFA08] set];
  }
  return v3;
}

- (BOOL)shouldEncapsulateItem:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() statusItemClasses];
  if ([v4 containsObject:objc_opt_class()])
  {
    v5 = [v3 latestResults];
    v6 = [v5 objectForKeyedSubscript:@"hidden"];
    int v7 = [v6 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)addItem:(id)a3
{
  id v7 = a3;
  if (!self->_allItems)
  {
    v4 = [MEMORY[0x263EFF9C0] set];
    allItems = self->_allItems;
    self->_allItems = v4;
  }
  v6 = [(HFAbstractGroupedStatusItem *)self allItems];
  [v6 addObject:v7];
}

- (void)removeItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HFAbstractGroupedStatusItem *)self allItems];
  [v5 removeObject:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HFAbstractGroupedStatusItem;
  id v5 = -[HFStatusItem copyWithZone:](&v9, sel_copyWithZone_);
  v6 = [(HFAbstractGroupedStatusItem *)self allItems];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setAllItems:v7];

  return v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HFAbstractGroupedStatusItem *)self _hasRequiredStatusItems];
  v6 = (void *)MEMORY[0x263F58190];
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F58190]);
    v8 = [(HFAbstractGroupedStatusItem *)self allItems];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke;
    v25[3] = &unk_26408E3D8;
    id v26 = v4;
    objc_super v9 = objc_msgSend(v8, "na_map:", v25);

    v10 = (void *)MEMORY[0x263F58190];
    v11 = [v9 allObjects];
    v12 = [MEMORY[0x263F581B8] mainThreadScheduler];
    v13 = [v10 combineAllFutures:v11 ignoringErrors:1 scheduler:v12];

    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke_2;
    v21[3] = &unk_26408E428;
    objc_copyWeak(&v23, &location);
    id v14 = v7;
    id v22 = v14;
    id v15 = (id)[v13 addCompletionBlock:v21];
    v16 = v22;
    id v17 = v14;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

    v18 = v26;
    v19 = v17;
  }
  else
  {
    v27 = @"hidden";
    v28[0] = MEMORY[0x263EFFA88];
    id v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v18 = +[HFItemUpdateOutcome outcomeWithResults:v17];
    v19 = [v6 futureWithResult:v18];
  }

  return v19;
}

uint64_t __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateWithOptions:*(void *)(a1 + 32)];
}

void __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v51[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__10;
    v48 = __Block_byref_object_dispose__10;
    id v49 = (id)objc_opt_new();
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    uint64_t v43 = -1;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    uint64_t v39 = 4;
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__10;
    v34 = __Block_byref_object_dispose__10;
    id v35 = [MEMORY[0x263EFF9C0] set];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__10;
    v28 = __Block_byref_object_dispose__10;
    id v29 = [MEMORY[0x263EFF9C0] set];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__10;
    id v22 = __Block_byref_object_dispose__10;
    id v23 = [MEMORY[0x263EFF9C0] set];
    objc_super v9 = [WeakRetained allItems];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke_7;
    v17[3] = &unk_264093910;
    v17[4] = WeakRetained;
    v17[5] = &v44;
    v17[6] = &v18;
    v17[7] = &v40;
    v17[8] = &v36;
    v17[9] = &v30;
    v17[10] = &v24;
    objc_msgSend(v9, "na_each:", v17);

    [WeakRetained setDisplayedItems:v45[5]];
    [v8 setObject:v25[5] forKeyedSubscript:@"dependentHomeKitObjects"];
    [v8 setObject:v31[5] forKeyedSubscript:@"dependentServiceTypes"];
    v10 = [NSNumber numberWithInteger:v41[3]];
    [v8 setObject:v10 forKeyedSubscript:@"priority"];

    v11 = [NSNumber numberWithUnsignedInteger:v37[3]];
    [v8 setObject:v11 forKeyedSubscript:@"statusItemCategory"];

    [v8 setObject:v19[5] forKeyedSubscript:@"representedHomeKitObjects"];
    v12 = [(id)objc_opt_class() sortKey];
    [v8 setObject:v12 forKeyedSubscript:@"sortKey"];

    v13 = *(void **)(a1 + 32);
    id v14 = +[HFItemUpdateOutcome outcomeWithResults:v8];
    [v13 finishWithResult:v14];

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    id v15 = *(void **)(a1 + 32);
    v50 = @"hidden";
    v51[0] = MEMORY[0x263EFFA88];
    v8 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
    v16 = +[HFItemUpdateOutcome outcomeWithResults:v8];
    [v15 finishWithResult:v16];
  }
}

void __59__HFAbstractGroupedStatusItem__subclass_updateWithOptions___block_invoke_7(uint64_t a1, void *a2)
{
  id v27 = a2;
  int v3 = [*(id *)(a1 + 32) shouldEncapsulateItem:v27];
  id v4 = v27;
  if (v3)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v27];
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v6 = [v27 latestResults];
    id v7 = [v6 objectForKeyedSubscript:@"representedHomeKitObjects"];
    if (v7)
    {
      [v5 unionSet:v7];
    }
    else
    {
      v8 = [MEMORY[0x263EFFA08] set];
      [v5 unionSet:v8];
    }
    objc_super v9 = [v27 latestResults];
    v10 = [v9 objectForKeyedSubscript:@"priority"];
    uint64_t v11 = [v10 integerValue];

    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void *)(v12 + 24);
    if (v13 <= v11) {
      uint64_t v13 = v11;
    }
    *(void *)(v12 + 24) = v13;
    id v14 = [v27 latestResults];
    id v15 = [v14 objectForKeyedSubscript:@"statusItemCategory"];
    unint64_t v16 = [v15 integerValue];

    id v4 = v27;
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v18 = *(void *)(v17 + 24);
    if (v18 >= v16) {
      unint64_t v18 = v16;
    }
    *(void *)(v17 + 24) = v18;
  }
  v19 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v20 = [v4 latestResults];
  v21 = [v20 objectForKeyedSubscript:@"dependentServiceTypes"];
  if (v21)
  {
    [v19 unionSet:v21];
  }
  else
  {
    id v22 = [MEMORY[0x263EFFA08] set];
    [v19 unionSet:v22];
  }
  id v23 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  uint64_t v24 = [v27 latestResults];
  v25 = [v24 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  if (v25)
  {
    [v23 unionSet:v25];
  }
  else
  {
    uint64_t v26 = [MEMORY[0x263EFFA08] set];
    [v23 unionSet:v26];
  }
}

- (BOOL)_hasRequiredStatusItems
{
  int v3 = [(id)objc_opt_class() statusItemClasses];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__HFAbstractGroupedStatusItem__hasRequiredStatusItems__block_invoke;
  v5[3] = &unk_264093938;
  v5[4] = self;
  LODWORD(self) = objc_msgSend(v3, "na_any:", v5) ^ 1;

  return (char)self;
}

BOOL __54__HFAbstractGroupedStatusItem__hasRequiredStatusItems__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _statusItemOfClass:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)_statusItemOfClass:(Class)a3
{
  id v4 = [(HFAbstractGroupedStatusItem *)self allItems];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__HFAbstractGroupedStatusItem__statusItemOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e22_B16__0__HFStatusItem_8lu32l8;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);

  return v5;
}

uint64_t __50__HFAbstractGroupedStatusItem__statusItemOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

+ (id)statusItemClasses
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractGroupedStatusItem.m", 148, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractGroupedStatusItem statusItemClasses]", objc_opt_class() object file lineNumber description];

  id v5 = (void *)MEMORY[0x263EFFA08];
  return (id)[v5 set];
}

+ (id)sortKey
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAbstractGroupedStatusItem.m", 154, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAbstractGroupedStatusItem sortKey]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
}

- (NSSet)displayedItems
{
  return self->_displayedItems;
}

- (void)setDisplayedItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedItems, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
}

@end