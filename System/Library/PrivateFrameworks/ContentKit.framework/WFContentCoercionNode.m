@interface WFContentCoercionNode
+ (WFContentCoercionNode)coercionNodeWithItem:(id)a3 parent:(id)a4;
+ (WFContentCoercionNode)coercionNodeWithItemClass:(Class)a3 parent:(id)a4;
+ (WFContentCoercionNode)coercionNodeWithItemOrItemClass:(id)a3 parent:(id)a4;
- (NSOrderedSet)coercionPath;
- (NSOrderedSet)itemOrItemClassPath;
- (WFContentCoercionNode)initWithItemOrItemClass:(id)a3 parent:(id)a4;
- (WFContentCoercionNode)parent;
- (id)continueCoercionUsingPathEnumerator:(id)a3 contentItems:(id)a4 options:(id)a5 error:(id *)a6;
- (id)description;
- (id)itemOrItemClass;
- (id)runCoercionSynchronouslyWithOptions:(id)a3 error:(id *)a4;
- (id)successorsWithOptions:(id)a3;
- (id)successorsWithOptions:(id)a3 goalType:(id)a4;
- (void)continueCoercionUsingPathEnumerator:(id)a3 contentItems:(id)a4 options:(id)a5 error:(id)a6 completionHandler:(id)a7;
- (void)runCoercionWithOptions:(id)a3 completionHandler:(id)a4;
@end

@implementation WFContentCoercionNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong(&self->_itemOrItemClass, 0);
}

- (WFContentCoercionNode)parent
{
  return self->_parent;
}

- (id)itemOrItemClass
{
  return self->_itemOrItemClass;
}

- (id)continueCoercionUsingPathEnumerator:(id)a3 contentItems:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [v10 nextObject];
  v14 = (void *)v13;
  if (v11 && v13)
  {
    v24 = self;
    id v25 = v10;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v11, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v26 + 1) + 8 * i) itemsByCoercingToItemClass:objc_opt_class() options:v12 error:a6];
          [v15 addObjectsFromArray:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v18);
    }

    id v10 = v25;
    id v22 = [(WFContentCoercionNode *)v24 continueCoercionUsingPathEnumerator:v25 contentItems:v15 options:v12 error:a6];
  }
  else
  {
    id v22 = v11;
  }

  return v22;
}

- (id)runCoercionSynchronouslyWithOptions:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(WFContentCoercionNode *)self itemOrItemClassPath];
  v8 = [v7 objectEnumerator];

  v9 = [v8 nextObject];
  v13[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  id v11 = [(WFContentCoercionNode *)self continueCoercionUsingPathEnumerator:v8 contentItems:v10 options:v6 error:a4];

  return v11;
}

- (void)continueCoercionUsingPathEnumerator:(id)a3 contentItems:(id)a4 options:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = [v12 nextObject];
  uint64_t v18 = (void *)v17;
  if (v13 && v17 && ((uint64_t v19 = [v13 count], !v15) || v19))
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke;
    v24[3] = &unk_26428AF40;
    id v25 = v18;
    id v26 = v14;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke_3;
    v20[3] = &unk_26428AF68;
    v20[4] = self;
    id v21 = v12;
    id v22 = v26;
    id v23 = v16;
    objc_msgSend(v13, "if_flatMapAsynchronously:completionHandler:", v24, v20);
  }
  else
  {
    (*((void (**)(id, id, id))v16 + 2))(v16, v13, v15);
  }
}

void __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a2;
  v13[0] = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  uint64_t v9 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke_2;
  v11[3] = &unk_26428AF18;
  id v12 = v6;
  id v10 = v6;
  [v7 forceCoerceToItemClasses:v8 options:v9 completionHandler:v11];
}

void __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [v8 count];
  if (!v5 || v6)
  {
    id v7 = v8;
  }
  else
  {

    id v7 = 0;
  }
  id v9 = v7;
  [*(id *)(a1 + 32) continueCoercionUsingPathEnumerator:*(void *)(a1 + 40) contentItems:v7 options:*(void *)(a1 + 48) error:v5 completionHandler:*(void *)(a1 + 56)];
}

uint64_t __106__WFContentCoercionNode_continueCoercionUsingPathEnumerator_contentItems_options_error_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runCoercionWithOptions:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFContentCoercionNode *)self itemOrItemClassPath];
  id v9 = [v8 objectEnumerator];

  id v10 = [v9 nextObject];
  v12[0] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  [(WFContentCoercionNode *)self continueCoercionUsingPathEnumerator:v9 contentItems:v11 options:v7 error:0 completionHandler:v6];
}

- (NSOrderedSet)coercionPath
{
  v3 = [(WFContentCoercionNode *)self parent];

  if (v3)
  {
    v4 = [(WFContentCoercionNode *)self parent];
    id v5 = [v4 itemOrItemClassPath];
    id v6 = [(WFContentCoercionNode *)self itemOrItemClass];
    id v7 = [v5 orderedSetByAddingObject:objc_opt_class()];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFF9D8];
    v4 = [(WFContentCoercionNode *)self itemOrItemClass];
    id v7 = [v8 orderedSetWithObject:objc_opt_class()];
  }

  return (NSOrderedSet *)v7;
}

- (NSOrderedSet)itemOrItemClassPath
{
  v3 = [(WFContentCoercionNode *)self parent];

  if (v3)
  {
    v4 = [(WFContentCoercionNode *)self parent];
    id v5 = [v4 itemOrItemClassPath];
    id v6 = [(WFContentCoercionNode *)self itemOrItemClass];
    id v7 = [v5 orderedSetByAddingObject:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFF9D8];
    v4 = [(WFContentCoercionNode *)self itemOrItemClass];
    id v7 = [v8 orderedSetWithObject:v4];
  }

  return (NSOrderedSet *)v7;
}

- (id)successorsWithOptions:(id)a3 goalType:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [(WFContentCoercionNode *)self itemOrItemClass];
  id v10 = [v9 supportedItemClasses];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __56__WFContentCoercionNode_successorsWithOptions_goalType___block_invoke;
  v26[3] = &unk_26428AEF0;
  id v11 = v7;
  id v27 = v11;
  id v12 = [v10 sortedArrayUsingComparator:v26];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * v17);
        if (objc_msgSend((id)objc_opt_class(), "supportedItemClassMustBeDeterminedByInstance:", v18, (void)v22))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && [v9 canGenerateIntermediaryRepresentationForItemClass:v18])
          {
            uint64_t v19 = [v9 itemsByCoercingToItemClass:v18 options:v6 error:0];
            if ([v19 count]) {
              [v8 addObjectsFromArray:v19];
            }
            else {
              [v8 addObject:v18];
            }
          }
        }
        else
        {
          [v8 addObject:v18];
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v20 = [v13 countByEnumeratingWithState:&v22 objects:v28 count:16];
      uint64_t v15 = v20;
    }
    while (v20);
  }

  return v8;
}

uint64_t __56__WFContentCoercionNode_successorsWithOptions_goalType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a2 ownedTypes];
  int v6 = [v5 containsObject:*(void *)(a1 + 32)];

  id v7 = [a3 ownedTypes];
  unsigned int v8 = [v7 containsObject:*(void *)(a1 + 32)];

  if (v6 ^ 1 | v8) {
    return (v6 ^ 1) & v8;
  }
  else {
    return -1;
  }
}

- (id)successorsWithOptions:(id)a3
{
  return [(WFContentCoercionNode *)self successorsWithOptions:a3 goalType:0];
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFContentCoercionNode;
  v4 = [(WFContentCoercionNode *)&v8 description];
  id v5 = [(WFContentCoercionNode *)self itemOrItemClass];
  int v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (WFContentCoercionNode)initWithItemOrItemClass:(id)a3 parent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(WFContentCoercionNode *)self init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_itemOrItemClass, a3);
    objc_storeStrong((id *)&v10->_parent, a4);
    id v11 = v10;
  }

  return v10;
}

+ (WFContentCoercionNode)coercionNodeWithItemOrItemClass:(id)a3 parent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithItemOrItemClass:v7 parent:v6];

  return (WFContentCoercionNode *)v8;
}

+ (WFContentCoercionNode)coercionNodeWithItemClass:(Class)a3 parent:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initWithItemOrItemClass:a3 parent:v6];

  return (WFContentCoercionNode *)v7;
}

+ (WFContentCoercionNode)coercionNodeWithItem:(id)a3 parent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithItemOrItemClass:v7 parent:v6];

  return (WFContentCoercionNode *)v8;
}

@end