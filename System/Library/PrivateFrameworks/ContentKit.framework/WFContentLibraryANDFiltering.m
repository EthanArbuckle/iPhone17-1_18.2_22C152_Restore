@interface WFContentLibraryANDFiltering
+ (Class)objectClass;
+ (void)getItemsMatchingComparisonPredicates:(id)a3 resultHandler:(id)a4;
+ (void)getItemsMatchingPredicate:(id)a3 resultHandler:(id)a4;
+ (void)performCustomFilteringUsingComparisonPredicates:(id)a3 resultHandler:(id)a4;
+ (void)performCustomFilteringUsingORComparisonPredicates:(id)a3 resultHandler:(id)a4;
@end

@implementation WFContentLibraryANDFiltering

+ (void)performCustomFilteringUsingComparisonPredicates:(id)a3 resultHandler:(id)a4
{
}

+ (Class)objectClass
{
  return 0;
}

+ (void)getItemsMatchingComparisonPredicates:(id)a3 resultHandler:(id)a4
{
  id v7 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke;
  v9[3] = &unk_264288FA8;
  id v10 = v7;
  id v11 = a1;
  SEL v12 = a2;
  id v8 = v7;
  [a1 performCustomFilteringUsingComparisonPredicates:a3 resultHandler:v9];
}

void __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5)
  {
    v13 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_6:
    v13();
    goto LABEL_7;
  }
  if (![v6 count])
  {
    v13 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  id v8 = objc_msgSend(v5, "if_map:", &__block_literal_global_17119);
  v9 = [WFContentQuery alloc];
  id v10 = [v7 allObjects];
  id v11 = +[WFContentCompoundPredicate andPredicateWithSubpredicates:v10];
  SEL v12 = [(WFContentQuery *)v9 initWithPredicate:v11];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke_3;
  v14[3] = &unk_264288F80;
  id v15 = *(id *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 40);
  [(WFContentQuery *)v12 runWithObjects:v8 completionHandler:v14];

LABEL_7:
}

void __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke_4;
  v4[3] = &__block_descriptor_48_e26__24__0__WFContentItem_8Q16l;
  long long v5 = *(_OWORD *)(a1 + 40);
  v3 = objc_msgSend(a2, "if_map:", v4);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

id __83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  long long v5 = objc_msgSend(v4, "objectForClass:", objc_msgSend(v3, "objectClass"));

  if (!v5)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"WFContentLibraryFiltering.m" lineNumber:97 description:@"WFContentLibraryFiltering: item did not have an object of the expected class"];
  }
  return v5;
}

WFContentItem *__83__WFContentLibraryANDFiltering_getItemsMatchingComparisonPredicates_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:a2];
}

+ (void)performCustomFilteringUsingORComparisonPredicates:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__17134;
  v13[4] = __Block_byref_object_dispose__17135;
  id v14 = (id)objc_opt_new();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke;
  v12[3] = &unk_264288F10;
  v12[4] = v13;
  v12[5] = a1;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke_3;
  v9[3] = &unk_264288F38;
  id v8 = v7;
  id v10 = v8;
  id v11 = v13;
  objc_msgSend(v6, "if_enumerateAsynchronouslyInSequence:completionHandler:", v12, v9);

  _Block_object_dispose(v13, 8);
}

void __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke_2;
  v11[3] = &unk_264288EE8;
  v9 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = a5;
  id v12 = v8;
  id v10 = v8;
  [v9 getItemsMatchingPredicate:a2 resultHandler:v11];
}

void __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) array];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __96__WFContentLibraryANDFiltering_performCustomFilteringUsingORComparisonPredicates_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:a2];
  }
  else
  {
    **(unsigned char **)(a1 + 48) = 1;
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  long long v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v5();
}

+ (void)getItemsMatchingPredicate:(id)a3 resultHandler:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      v9 = [v8 subpredicates];
      if (![v9 count])
      {
        [a1 getItemsMatchingComparisonPredicates:MEMORY[0x263EFFA68] resultHandler:v7];
        goto LABEL_20;
      }
      if ([v8 compoundPredicateType] == 1)
      {
        if ([v9 count] == 1)
        {
          id v10 = [v9 firstObject];
          [a1 getItemsMatchingPredicate:v10 resultHandler:v7];

LABEL_20:
          goto LABEL_21;
        }
        if ((unint64_t)[v9 count] >= 2)
        {
          id v19 = v8;
          id v11 = v9;
          id v12 = objc_opt_new();
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v13 = v11;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v21;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v21 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = WFCollapseANDCompoundPredicatesInsidePredicate(*(void **)(*((void *)&v20 + 1) + 8 * v17));
                [v12 addObjectsFromArray:v18];

                ++v17;
              }
              while (v15 != v17);
              uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
            }
            while (v15);
          }

          [a1 getItemsMatchingComparisonPredicates:v12 resultHandler:v7];
          id v8 = v19;
          goto LABEL_20;
        }
      }
      else if ([v8 compoundPredicateType] == 2)
      {
        [a1 performCustomFilteringUsingORComparisonPredicates:v9 resultHandler:v7];
        goto LABEL_20;
      }
    }
    v7[2](v7, 0);
    goto LABEL_24;
  }
  id v24 = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  [a1 getItemsMatchingComparisonPredicates:v8 resultHandler:v7];
LABEL_21:

LABEL_24:
}

@end