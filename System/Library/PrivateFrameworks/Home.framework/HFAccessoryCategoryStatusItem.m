@interface HFAccessoryCategoryStatusItem
+ (id)statusItemClasses;
- (BOOL)hidesWithNoAccessories;
- (HFAccessoryCategoryStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5;
- (HFAccessoryTypeGroup)accessoryTypeGroup;
- (NSArray)statusItems;
- (NSString)uuidString;
- (id)_statusItemOfClass:(Class)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)accessoryTypeGroupFilter;
- (id)sortedActionSetItemsWithProvider:(id)a3;
- (void)applyInflectionToDescriptions:(id)a3;
@end

@implementation HFAccessoryCategoryStatusItem

- (NSString)uuidString
{
  return self->_uuidString;
}

uint64_t __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isVisibleInHomeStatus"))
  {
    v4 = [*(id *)(a1 + 32) accessoryTypeGroup];
    v5 = objc_msgSend(v3, "hf_accessoryType");
    uint64_t v6 = [v4 containsType:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 updateWithOptions:*(void *)(a1 + 32)];
}

uint64_t __52__HFAccessoryCategoryStatusItem__statusItemOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_31(void *a1, void *a2)
{
  id v21 = a2;
  id v3 = [v21 latestResults];
  v4 = [v3 objectForKeyedSubscript:@"state"];
  uint64_t v5 = [v4 integerValue];

  uint64_t v6 = v21;
  uint64_t v7 = *(void *)(a1[4] + 8);
  uint64_t v8 = *(void *)(v7 + 24);
  if (v8 <= v5) {
    uint64_t v8 = v5;
  }
  *(void *)(v7 + 24) = v8;
  if (v5 == 2)
  {
    v9 = *(void **)(*(void *)(a1[5] + 8) + 40);
    v10 = [v21 latestResults];
    v11 = [v10 objectForKeyedSubscript:@"representedHomeKitObjects"];
    if (v11)
    {
      [v9 unionSet:v11];
    }
    else
    {
      v12 = [MEMORY[0x263EFFA08] set];
      [v9 unionSet:v12];
    }
    uint64_t v6 = v21;
  }
  v13 = *(void **)(*(void *)(a1[6] + 8) + 40);
  v14 = [v6 latestResults];
  v15 = [v14 objectForKeyedSubscript:@"dependentServiceTypes"];
  if (v15)
  {
    [v13 unionSet:v15];
  }
  else
  {
    v16 = [MEMORY[0x263EFFA08] set];
    [v13 unionSet:v16];
  }
  v17 = *(void **)(*(void *)(a1[7] + 8) + 40);
  v18 = [v21 latestResults];
  v19 = [v18 objectForKeyedSubscript:@"dependentHomeKitObjects"];
  if (v19)
  {
    [v17 unionSet:v19];
  }
  else
  {
    v20 = [MEMORY[0x263EFFA08] set];
    [v17 unionSet:v20];
  }
}

- (void)applyInflectionToDescriptions:(id)a3
{
  id v19 = a3;
  id v3 = [v19 objectForKeyedSubscript:@"title"];
  v4 = [v19 objectForKeyedSubscript:@"description"];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F086A0];
    uint64_t v6 = [v19 objectForKeyedSubscript:@"description"];
    uint64_t v7 = objc_msgSend(v5, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:", v6, v3, 1);
    uint64_t v8 = [v7 string];
    [v19 setObject:v8 forKeyedSubscript:@"description"];
  }
  v9 = [v19 objectForKeyedSubscript:@"controlDescription"];

  if (v9)
  {
    v10 = (void *)MEMORY[0x263F086A0];
    v11 = [v19 objectForKeyedSubscript:@"controlDescription"];
    v12 = objc_msgSend(v10, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:", v11, v3, 1);
    v13 = [v12 string];
    [v19 setObject:v13 forKeyedSubscript:@"controlDescription"];
  }
  v14 = [v19 objectForKeyedSubscript:@"detailedControlDescription"];

  if (v14)
  {
    v15 = (void *)MEMORY[0x263F086A0];
    v16 = [v19 objectForKeyedSubscript:@"detailedControlDescription"];
    v17 = objc_msgSend(v15, "hf_attributedStringWithInflectableAccessoryStatus:accessoryName:forcePluralAgreement:", v16, v3, 1);
    v18 = [v17 string];
    [v19 setObject:v18 forKeyedSubscript:@"detailedControlDescription"];
  }
}

void __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v40[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__2;
    v37 = __Block_byref_object_dispose__2;
    id v38 = [MEMORY[0x263EFF9C0] set];
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__2;
    v31 = __Block_byref_object_dispose__2;
    id v32 = [MEMORY[0x263EFF9C0] set];
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__2;
    v25 = __Block_byref_object_dispose__2;
    id v26 = [MEMORY[0x263EFF9C0] set];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    uint64_t v8 = [WeakRetained statusItems];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_31;
    v16[3] = &unk_26408E400;
    v16[4] = &v17;
    v16[5] = &v21;
    v16[6] = &v33;
    v16[7] = &v27;
    objc_msgSend(v8, "na_each:", v16);

    v9 = [MEMORY[0x263EFF9A0] dictionary];
    [v9 setObject:v28[5] forKeyedSubscript:@"dependentHomeKitObjects"];
    [v9 setObject:v34[5] forKeyedSubscript:@"dependentServiceTypes"];
    [v9 setObject:v22[5] forKeyedSubscript:@"representedHomeKitObjects"];
    v10 = [NSNumber numberWithInteger:v18[3]];
    [v9 setObject:v10 forKeyedSubscript:@"state"];

    v11 = *(void **)(a1 + 32);
    v12 = +[HFItemUpdateOutcome outcomeWithResults:v9];
    [v11 finishWithResult:v12];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    v39 = @"hidden";
    v40[0] = MEMORY[0x263EFFA88];
    v14 = [NSDictionary dictionaryWithObjects:v40 forKeys:&v39 count:1];
    v15 = +[HFItemUpdateOutcome outcomeWithResults:v14];
    [v13 finishWithResult:v15];
  }
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v46[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(HFStatusItem *)self room];
  uint64_t v7 = [v6 accessories];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v3 = [(HFStatusItem *)self home];
    id v9 = [v3 accessories];
  }
  if (+[HFUtilities isPressDemoModeEnabled])
  {
    v10 = [(HFStatusItem *)self room];
    v11 = objc_msgSend(v10, "hf_demoModeAccessories");
    v12 = v11;
    if (!v11)
    {
      id v3 = [(HFStatusItem *)self home];
      v12 = objc_msgSend(v3, "hf_demoModeAccessories");
    }
    uint64_t v13 = [v9 arrayByAddingObjectsFromArray:v12];

    if (!v11)
    {
    }
    id v9 = (id)v13;
  }
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke;
  v44[3] = &unk_26408D968;
  v44[4] = self;
  v14 = objc_msgSend(v9, "na_firstObjectPassingTest:", v44);
  BOOL v15 = v14 == 0;

  if (v15 && [(HFAccessoryCategoryStatusItem *)self hidesWithNoAccessories])
  {
    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = [(id)objc_opt_class() statusItemClasses];
    v18 = [v16 setWithArray:v17];
    objc_msgSend(v18, "na_flatMap:", &__block_literal_global_16);
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v20 = (void *)MEMORY[0x263F58190];
    v45[0] = @"hidden";
    v45[1] = @"dependentServiceTypes";
    v46[0] = MEMORY[0x263EFFA88];
    v46[1] = v19;
    v45[2] = @"dependentHomeKitClasses";
    uint64_t v21 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    v46[2] = v21;
    v22 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:3];
    uint64_t v23 = +[HFItemUpdateOutcome outcomeWithResults:v22];
    v24 = [v20 futureWithResult:v23];
  }
  else
  {
    v25 = [v5 objectForKeyedSubscript:HFItemUpdateOptionFastInitialUpdate];
    int v26 = [v25 BOOLValue];

    uint64_t v27 = (void *)MEMORY[0x263F58190];
    if (v26)
    {
      id v19 = +[HFItemUpdateOutcome outcomeWithResults:MEMORY[0x263EFFA78]];
      v24 = [v27 futureWithResult:v19];
    }
    else
    {
      id v28 = objc_alloc_init(MEMORY[0x263F58190]);
      uint64_t v29 = [(HFAccessoryCategoryStatusItem *)self statusItems];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_4;
      v42[3] = &unk_26408E3D8;
      id v43 = v5;
      v30 = objc_msgSend(v29, "na_map:", v42);

      v31 = (void *)MEMORY[0x263F58190];
      id v32 = [MEMORY[0x263F581B8] mainThreadScheduler];
      uint64_t v33 = [v31 combineAllFutures:v30 ignoringErrors:1 scheduler:v32];

      objc_initWeak(&location, self);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_5;
      v38[3] = &unk_26408E428;
      objc_copyWeak(&v40, &location);
      id v34 = v28;
      id v39 = v34;
      id v35 = (id)[v33 addCompletionBlock:v38];
      v36 = v39;
      id v19 = v34;

      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);

      v24 = v19;
    }
  }

  return v24;
}

- (id)_statusItemOfClass:(Class)a3
{
  v4 = [(HFAccessoryCategoryStatusItem *)self statusItems];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__HFAccessoryCategoryStatusItem__statusItemOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e22_B16__0__HFStatusItem_8lu32l8;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);

  return v5;
}

- (NSArray)statusItems
{
  return self->_statusItems;
}

- (BOOL)hidesWithNoAccessories
{
  return 1;
}

BOOL __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "hf_isNonServiceBasedAccessory"))
  {
    if (objc_msgSend(v3, "hf_isVisibleInHomeStatus"))
    {
      v4 = [*(id *)(a1 + 32) accessoryTypeGroup];
      id v5 = objc_msgSend(v3, "hf_accessoryType");
      char v6 = [v4 containsType:v5];

      if (v6) {
        goto LABEL_7;
      }
    }
  }
  if (!objc_msgSend(v3, "hf_isMatterOnlyAccessory")) {
    goto LABEL_9;
  }
  uint64_t v7 = [[HFMatterAccessoryRepresentable alloc] initWithAccessory:v3];
  if (![(HFMatterAccessoryRepresentable *)v7 hf_isVisibleInHomeStatus])
  {

    goto LABEL_9;
  }
  uint64_t v8 = [*(id *)(a1 + 32) accessoryTypeGroup];
  id v9 = [(HFMatterAccessoryRepresentable *)v7 hf_accessoryType];
  char v10 = [v8 containsType:v9];

  if ((v10 & 1) == 0)
  {
LABEL_9:
    v12 = objc_msgSend(v3, "hf_visibleServices");
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_2;
    v15[3] = &unk_26408E0E8;
    v15[4] = *(void *)(a1 + 32);
    uint64_t v13 = objc_msgSend(v12, "na_firstObjectPassingTest:", v15);
    BOOL v11 = v13 != 0;

    goto LABEL_10;
  }
LABEL_7:
  BOOL v11 = 1;
LABEL_10:

  return v11;
}

id __63__HFAccessoryCategoryStatusItem_initWithHome_room_valueSource___block_invoke(void *a1, Class a2)
{
  v2 = (void *)[[a2 alloc] initWithHome:a1[4] room:a1[5] valueSource:a1[6]];
  return v2;
}

- (HFAccessoryCategoryStatusItem)initWithHome:(id)a3 room:(id)a4 valueSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HFAccessoryCategoryStatusItem;
  BOOL v11 = [(HFStatusItem *)&v24 initWithHome:v8 room:v9 valueSource:v10];
  if (v11)
  {
    v12 = [(id)objc_opt_class() statusItemClasses];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __63__HFAccessoryCategoryStatusItem_initWithHome_room_valueSource___block_invoke;
    v20[3] = &unk_26408E320;
    id v21 = v8;
    id v22 = v9;
    id v23 = v10;
    uint64_t v13 = objc_msgSend(v12, "na_map:", v20);
    statusItems = v11->_statusItems;
    v11->_statusItems = (NSArray *)v13;

    BOOL v15 = [(HFAccessoryCategoryStatusItem *)v11 accessoryTypeGroup];
    v16 = [v15 uniqueIdentifier];
    uint64_t v17 = [v16 UUIDString];
    uuidString = v11->_uuidString;
    v11->_uuidString = (NSString *)v17;
  }
  return v11;
}

uint64_t __61__HFAccessoryCategoryStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26C0FCD28]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return [v4 serviceTypes];
}

- (id)accessoryTypeGroupFilter
{
  id v2 = [(HFAccessoryCategoryStatusItem *)self accessoryTypeGroup];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HFAccessoryCategoryStatusItem_accessoryTypeGroupFilter__block_invoke;
  aBlock[3] = &unk_26408E348;
  id v8 = v2;
  id v3 = v2;
  id v4 = _Block_copy(aBlock);
  id v5 = (void *)[v4 copy];

  return v5;
}

uint64_t __57__HFAccessoryCategoryStatusItem_accessoryTypeGroupFilter__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v5 = [v3 actions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v50 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v45;
      id v34 = v4;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v45 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v11 = [v10 characteristic];
            v12 = [v11 service];

            uint64_t v13 = *(void **)(a1 + 32);
            v14 = objc_msgSend(v12, "hf_accessoryType");
            LOBYTE(v13) = [v13 containsType:v14];

            if (v13)
            {
              uint64_t v28 = 1;
              id v4 = v34;
              goto LABEL_33;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v15 = v10;
              long long v40 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              v16 = [v15 mediaProfiles];
              uint64_t v33 = [v16 countByEnumeratingWithState:&v40 objects:v49 count:16];
              if (v33)
              {
                uint64_t v17 = *(void *)v41;
                id v35 = v5;
                uint64_t v30 = v7;
                uint64_t v31 = v8;
                id v32 = v15;
                uint64_t v29 = *(void *)v41;
                do
                {
                  uint64_t v18 = 0;
                  do
                  {
                    if (*(void *)v41 != v17) {
                      objc_enumerationMutation(v16);
                    }
                    id v19 = *(void **)(*((void *)&v40 + 1) + 8 * v18);
                    long long v36 = 0u;
                    long long v37 = 0u;
                    long long v38 = 0u;
                    long long v39 = 0u;
                    uint64_t v20 = [v19 accessories];
                    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v48 count:16];
                    if (v21)
                    {
                      uint64_t v22 = v21;
                      uint64_t v23 = *(void *)v37;
                      while (2)
                      {
                        for (uint64_t j = 0; j != v22; ++j)
                        {
                          if (*(void *)v37 != v23) {
                            objc_enumerationMutation(v20);
                          }
                          v25 = *(void **)(a1 + 32);
                          int v26 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * j), "hf_accessoryType");
                          LOBYTE(v25) = [v25 containsType:v26];

                          if (v25)
                          {

                            uint64_t v28 = 1;
                            id v4 = v34;
                            id v5 = v35;
                            goto LABEL_33;
                          }
                        }
                        uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v48 count:16];
                        if (v22) {
                          continue;
                        }
                        break;
                      }
                    }

                    ++v18;
                    id v5 = v35;
                    uint64_t v7 = v30;
                    uint64_t v8 = v31;
                    uint64_t v17 = v29;
                  }
                  while (v18 != v33);
                  id v15 = v32;
                  uint64_t v33 = [v16 countByEnumeratingWithState:&v40 objects:v49 count:16];
                }
                while (v33);
              }
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v44 objects:v50 count:16];
        uint64_t v28 = 0;
        id v4 = v34;
      }
      while (v7);
    }
    else
    {
      uint64_t v28 = 0;
    }
LABEL_33:
  }
  else
  {
    uint64_t v28 = 1;
  }

  return v28;
}

- (id)sortedActionSetItemsWithProvider:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F58190]);
  uint64_t v6 = [(HFStatusItem *)self room];
  [v4 setRoom:v6];

  uint64_t v7 = [(HFAccessoryCategoryStatusItem *)self accessoryTypeGroupFilter];
  [v4 setFilter:v7];

  objc_initWeak(&location, self);
  uint64_t v8 = [v4 reloadItems];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__HFAccessoryCategoryStatusItem_sortedActionSetItemsWithProvider___block_invoke;
  v12[3] = &unk_26408E370;
  objc_copyWeak(&v14, &location);
  id v9 = v5;
  id v13 = v9;
  id v10 = (id)[v8 addCompletionBlock:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __66__HFAccessoryCategoryStatusItem_sortedActionSetItemsWithProvider___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [v14 allItems];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [HFReorderableHomeKitItemList alloc];
    uint64_t v7 = [WeakRetained room];
    if (v7)
    {
      uint64_t v8 = [(HFReorderableHomeKitItemList *)v6 initWithApplicationDataContainer:v7 category:@"categoryActionSets"];
    }
    else
    {
      id v10 = [WeakRetained home];
      uint64_t v8 = [(HFReorderableHomeKitItemList *)v6 initWithApplicationDataContainer:v10 category:@"categoryActionSets"];
    }
    BOOL v11 = [v14 allItems];
    v12 = [v11 allObjects];
    id v13 = [(HFReorderableHomeKitItemList *)v8 sortedHomeKitItemComparator];
    id v9 = [v12 sortedArrayUsingComparator:v13];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFFA68];
  }
  [*(id *)(a1 + 32) finishWithResult:v9];
}

- (HFAccessoryTypeGroup)accessoryTypeGroup
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"HFAccessoryCategoryStatusItem.m", 100, @"%s is an abstract method that must be overriden by subclass %@", "-[HFAccessoryCategoryStatusItem accessoryTypeGroup]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)statusItemClasses
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, a1, @"HFAccessoryCategoryStatusItem.m", 106, @"%s is an abstract method that must be overriden by subclass %@", "+[HFAccessoryCategoryStatusItem statusItemClasses]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusItems, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end