@interface HFItemGroupItem
- (HFItemGroupItem)init;
- (HFItemGroupItem)initWithItems:(id)a3;
- (NSSet)items;
- (id)_subclass_updateWithOptions:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation HFItemGroupItem

- (HFItemGroupItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFItemGroupItem;
  v2 = [(HFItemGroupItem *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFFA08] set];
    items = v2->_items;
    v2->_items = (NSSet *)v3;
  }
  return v2;
}

- (HFItemGroupItem)initWithItems:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(HFItemGroupItem *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_items, a3);
  }

  return v7;
}

- (void)setItems:(id)a3
{
  id v5 = (NSSet *)a3;
  p_items = &self->_items;
  if (self->_items != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_items, a3);
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_items, v5);
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  objc_super v6 = [(HFItemGroupItem *)self items];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke;
  v20[3] = &unk_26409C490;
  id v21 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "na_map:", v20);

  v9 = (void *)MEMORY[0x263F58190];
  v10 = [v8 allObjects];
  v11 = [MEMORY[0x263F581B8] mainThreadScheduler];
  v12 = [v9 combineAllFutures:v10 ignoringErrors:1 scheduler:v11];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke_2;
  v18[3] = &unk_26408F238;
  v18[4] = self;
  id v13 = v5;
  id v19 = v13;
  id v14 = (id)[v12 addCompletionBlock:v18];
  v15 = v19;
  id v16 = v13;

  return v16;
}

uint64_t __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateWithOptions:*(void *)(a1 + 32)];
}

void __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v32[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__27;
  v25 = __Block_byref_object_dispose__27;
  id v26 = [MEMORY[0x263EFF9C0] set];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__27;
  id v19 = __Block_byref_object_dispose__27;
  id v20 = [MEMORY[0x263EFF9C0] set];
  id v7 = [*(id *)(a1 + 32) items];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke_4;
  v14[3] = &unk_26409C4B8;
  v14[4] = &v15;
  v14[5] = &v21;
  v14[6] = &v27;
  objc_msgSend(v7, "na_each:", v14);

  uint64_t v8 = v16[5];
  v31[0] = @"dependentHomeKitClasses";
  v31[1] = @"dependentHomeKitObjects";
  uint64_t v9 = v22[5];
  v32[0] = v8;
  v32[1] = v9;
  v31[2] = @"hidden";
  v10 = [NSNumber numberWithBool:*((unsigned __int8 *)v28 + 24)];
  v32[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

  v12 = *(void **)(a1 + 40);
  id v13 = +[HFItemUpdateOutcome outcomeWithResults:v11];
  [v12 finishWithResult:v13];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

void __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke_4(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1[4] + 8) + 40);
  id v15 = v3;
  id v5 = [v3 latestResults];
  id v6 = [v5 objectForKeyedSubscript:@"dependentHomeKitClasses"];
  if (v6)
  {
    [v4 unionSet:v6];
  }
  else
  {
    id v7 = [MEMORY[0x263EFFA08] set];
    [v4 unionSet:v7];
  }
  uint64_t v8 = *(void **)(*(void *)(a1[5] + 8) + 40);
  uint64_t v9 = [v15 latestResults];
  v10 = [v9 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  if (v10)
  {
    [v8 unionSet:v10];
  }
  else
  {
    v11 = [MEMORY[0x263EFFA08] set];
    [v8 unionSet:v11];
  }
  v12 = [v15 latestResults];
  id v13 = [v12 objectForKeyedSubscript:@"hidden"];
  char v14 = [v13 BOOLValue];

  if ((v14 & 1) == 0) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

- (NSSet)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end