@interface CNUIUserActionDisambiguationModelFinalizer
+ (id)modelWithDefaultAction:(id)a3 actions:(id)a4 recentActions:(id)a5 directoryServiceActions:(id)a6 foundOnDeviceActions:(id)a7 hasDefaultApp:(BOOL)a8;
- (BOOL)hasDefaultApp;
- (CNUIUserActionDisambiguationModelFinalizer)initWithDefaultAction:(id)a3 actions:(id)a4 recentActions:(id)a5 directoryServiceActions:(id)a6 foundOnDeviceActions:(id)a7 hasDefaultApp:(BOOL)a8;
- (CNUIUserActionItem)defaultAction;
- (NSArray)directoryServiceActions;
- (NSArray)foundOnDeviceActions;
- (NSArray)recentActions;
- (NSMutableArray)actions;
- (id)model;
- (void)promoteLoneActionToBeDefault;
- (void)promoteLoneManagedCallProviderActionToBeDefault;
- (void)removeCallProviderOverlappingIntentActions;
- (void)removeDefaultActionFromListOfActions;
- (void)removeDiscoveredActionsAlreadyCurated;
- (void)removeDuplicateIntentActionsFromSameProvider;
- (void)removeUninterestingItentActions;
- (void)setActions:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setDirectoryServiceActions:(id)a3;
- (void)setFoundOnDeviceActions:(id)a3;
- (void)setHasDefaultApp:(BOOL)a3;
- (void)setRecentActions:(id)a3;
@end

@implementation CNUIUserActionDisambiguationModelFinalizer

+ (id)modelWithDefaultAction:(id)a3 actions:(id)a4 recentActions:(id)a5 directoryServiceActions:(id)a6 foundOnDeviceActions:(id)a7 hasDefaultApp:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [[CNUIUserActionDisambiguationModelFinalizer alloc] initWithDefaultAction:v17 actions:v16 recentActions:v15 directoryServiceActions:v14 foundOnDeviceActions:v13 hasDefaultApp:v8];

  v19 = [(CNUIUserActionDisambiguationModelFinalizer *)v18 model];

  return v19;
}

- (CNUIUserActionDisambiguationModelFinalizer)initWithDefaultAction:(id)a3 actions:(id)a4 recentActions:(id)a5 directoryServiceActions:(id)a6 foundOnDeviceActions:(id)a7 hasDefaultApp:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CNUIUserActionDisambiguationModelFinalizer;
  v19 = [(CNUIUserActionDisambiguationModelFinalizer *)&v26 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_defaultAction, a3);
    uint64_t v21 = [v15 mutableCopy];
    actions = v20->_actions;
    v20->_actions = (NSMutableArray *)v21;

    objc_storeStrong((id *)&v20->_recentActions, a5);
    objc_storeStrong((id *)&v20->_directoryServiceActions, a6);
    objc_storeStrong((id *)&v20->_foundOnDeviceActions, a7);
    v20->_hasDefaultApp = a8;
    v23 = v20;
  }

  return v20;
}

- (id)model
{
  [(CNUIUserActionDisambiguationModelFinalizer *)self removeCallProviderOverlappingIntentActions];
  [(CNUIUserActionDisambiguationModelFinalizer *)self removeUninterestingItentActions];
  [(CNUIUserActionDisambiguationModelFinalizer *)self removeDiscoveredActionsAlreadyCurated];
  [(CNUIUserActionDisambiguationModelFinalizer *)self removeDuplicateIntentActionsFromSameProvider];
  [(CNUIUserActionDisambiguationModelFinalizer *)self promoteLoneManagedCallProviderActionToBeDefault];
  [(CNUIUserActionDisambiguationModelFinalizer *)self promoteLoneActionToBeDefault];
  [(CNUIUserActionDisambiguationModelFinalizer *)self removeDefaultActionFromListOfActions];
  v3 = [CNUIUserActionListModel alloc];
  v4 = [(CNUIUserActionDisambiguationModelFinalizer *)self defaultAction];
  v5 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
  v6 = [(CNUIUserActionDisambiguationModelFinalizer *)self directoryServiceActions];
  v7 = [(CNUIUserActionDisambiguationModelFinalizer *)self foundOnDeviceActions];
  BOOL v8 = [(CNUIUserActionListModel *)v3 initWithDefaultAction:v4 actions:v5 directoryServiceActions:v6 foundOnDeviceActions:v7 hasDefaultApp:[(CNUIUserActionDisambiguationModelFinalizer *)self hasDefaultApp]];

  return v8;
}

- (void)removeCallProviderOverlappingIntentActions
{
  v3 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
  v4 = objc_msgSend(v3, "_cn_filter:", &__block_literal_global_14);

  if ([v4 count])
  {
    v5 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __88__CNUIUserActionDisambiguationModelFinalizer_removeCallProviderOverlappingIntentActions__block_invoke_2;
    v6[3] = &unk_264017AE8;
    id v7 = v4;
    objc_msgSend(v5, "_cn_removeObjectsPassingTest:", v6);
  }
}

BOOL __88__CNUIUserActionDisambiguationModelFinalizer_removeCallProviderOverlappingIntentActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 group] == 2 || objc_msgSend(v2, "group") == 6 || objc_msgSend(v2, "group") == 1;

  return v3;
}

uint64_t __88__CNUIUserActionDisambiguationModelFinalizer_removeCallProviderOverlappingIntentActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 group] == 7 || objc_msgSend(v3, "group") == 5)
  {
    v4 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __88__CNUIUserActionDisambiguationModelFinalizer_removeCallProviderOverlappingIntentActions__block_invoke_3;
    v7[3] = &unk_264017AE8;
    id v8 = v3;
    uint64_t v5 = objc_msgSend(v4, "_cn_any:", v7);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __88__CNUIUserActionDisambiguationModelFinalizer_removeCallProviderOverlappingIntentActions__block_invoke_3(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (a2 | v2) {
    return [(id)v2 isEqual:a2];
  }
  else {
    return 1;
  }
}

- (void)removeUninterestingItentActions
{
  id v3 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__CNUIUserActionDisambiguationModelFinalizer_removeUninterestingItentActions__block_invoke;
  v4[3] = &unk_264017AE8;
  v4[4] = self;
  objc_msgSend(v3, "_cn_removeObjectsPassingTest:", v4);
}

uint64_t __77__CNUIUserActionDisambiguationModelFinalizer_removeUninterestingItentActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 options])
  {
    uint64_t v5 = [*(id *)(a1 + 32) recentActions];
    uint64_t v4 = [v5 containsObject:v3] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)removeDiscoveredActionsAlreadyCurated
{
  id v3 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
  uint64_t v4 = objc_msgSend(v3, "_cn_filter:", &__block_literal_global_3_0);

  if ([v4 count])
  {
    uint64_t v5 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __83__CNUIUserActionDisambiguationModelFinalizer_removeDiscoveredActionsAlreadyCurated__block_invoke_2;
    v6[3] = &unk_264017AE8;
    id v7 = v4;
    objc_msgSend(v5, "_cn_removeObjectsPassingTest:", v6);
  }
}

BOOL __83__CNUIUserActionDisambiguationModelFinalizer_removeDiscoveredActionsAlreadyCurated__block_invoke(uint64_t a1, void *a2)
{
  return [a2 group] == 5;
}

uint64_t __83__CNUIUserActionDisambiguationModelFinalizer_removeDiscoveredActionsAlreadyCurated__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 group] == 7)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __83__CNUIUserActionDisambiguationModelFinalizer_removeDiscoveredActionsAlreadyCurated__block_invoke_3;
    v7[3] = &unk_264017AE8;
    id v8 = v3;
    uint64_t v5 = objc_msgSend(v4, "_cn_any:", v7);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __83__CNUIUserActionDisambiguationModelFinalizer_removeDiscoveredActionsAlreadyCurated__block_invoke_3(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (a2 | v2) {
    return [(id)v2 isEqual:a2];
  }
  else {
    return 1;
  }
}

- (void)removeDuplicateIntentActionsFromSameProvider
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
  uint64_t v4 = objc_msgSend(v3, "_cn_groupBy:", &__block_literal_global_6);

  uint64_t v5 = [v4 allValues];
  char v6 = objc_msgSend(v5, "_cn_all:", &__block_literal_global_10);

  if ((v6 & 1) == 0)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9B0]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "hash"));
          [v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    id v14 = [v7 array];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __90__CNUIUserActionDisambiguationModelFinalizer_removeDuplicateIntentActionsFromSameProvider__block_invoke_3;
    v17[3] = &unk_264017B50;
    id v18 = v4;
    id v15 = objc_msgSend(v14, "_cn_flatMap:", v17);

    id v16 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
    [v16 setArray:v15];
  }
}

uint64_t __90__CNUIUserActionDisambiguationModelFinalizer_removeDuplicateIntentActionsFromSameProvider__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = NSNumber;
  uint64_t v3 = [a2 hash];
  return [v2 numberWithUnsignedInteger:v3];
}

BOOL __90__CNUIUserActionDisambiguationModelFinalizer_removeDuplicateIntentActionsFromSameProvider__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 count] == 1;
}

id __90__CNUIUserActionDisambiguationModelFinalizer_removeDuplicateIntentActionsFromSameProvider__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  unint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v3 = objc_msgSend(v2, "_cn_filter:", &__block_literal_global_13);
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334B0] + 16))())
  {
    uint64_t v4 = [v2 firstObject];
    v9[0] = v4;
    uint64_t v5 = (void **)v9;
  }
  else
  {
    uint64_t v4 = [v3 firstObject];
    id v8 = v4;
    uint64_t v5 = &v8;
  }
  char v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v6;
}

BOOL __90__CNUIUserActionDisambiguationModelFinalizer_removeDuplicateIntentActionsFromSameProvider__block_invoke_4(uint64_t a1, void *a2)
{
  return ([a2 options] & 8) == 0;
}

- (void)promoteLoneManagedCallProviderActionToBeDefault
{
  uint64_t v3 = [(CNUIUserActionDisambiguationModelFinalizer *)self defaultAction];

  if (!v3)
  {
    uint64_t v4 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
    objc_msgSend(v4, "_cn_filter:", &__block_literal_global_17_0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if ([v6 count] == 1)
    {
      uint64_t v5 = [v6 firstObject];
      [(CNUIUserActionDisambiguationModelFinalizer *)self setDefaultAction:v5];
    }
  }
}

BOOL __93__CNUIUserActionDisambiguationModelFinalizer_promoteLoneManagedCallProviderActionToBeDefault__block_invoke(uint64_t a1, void *a2)
{
  return [a2 group] == 1;
}

- (void)promoteLoneActionToBeDefault
{
  uint64_t v3 = [(CNUIUserActionDisambiguationModelFinalizer *)self defaultAction];

  if (!v3)
  {
    uint64_t v4 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
    uint64_t v5 = [v4 count];

    if (v5 == 1)
    {
      uint64_t v6 = *MEMORY[0x263F334B0];
      id v7 = [(CNUIUserActionDisambiguationModelFinalizer *)self directoryServiceActions];
      int v8 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

      if (v8)
      {
        uint64_t v9 = [(CNUIUserActionDisambiguationModelFinalizer *)self foundOnDeviceActions];
        int v10 = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v9);

        if (v10)
        {
          uint64_t v11 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
          uint64_t v12 = [v11 firstObject];
          int v13 = [v12 shouldPromoteLoneActionToBeDefault];

          if (v13)
          {
            id v15 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
            id v14 = [v15 firstObject];
            [(CNUIUserActionDisambiguationModelFinalizer *)self setDefaultAction:v14];
          }
        }
      }
    }
  }
}

- (void)removeDefaultActionFromListOfActions
{
  uint64_t v3 = [(CNUIUserActionDisambiguationModelFinalizer *)self defaultAction];

  if (v3)
  {
    uint64_t v4 = [(CNUIUserActionDisambiguationModelFinalizer *)self actions];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __82__CNUIUserActionDisambiguationModelFinalizer_removeDefaultActionFromListOfActions__block_invoke;
    v5[3] = &unk_264017AE8;
    v5[4] = self;
    objc_msgSend(v4, "_cn_removeObjectsPassingTest:", v5);
  }
}

uint64_t __82__CNUIUserActionDisambiguationModelFinalizer_removeDefaultActionFromListOfActions__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 defaultAction];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (CNUIUserActionItem)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSArray)recentActions
{
  return self->_recentActions;
}

- (void)setRecentActions:(id)a3
{
}

- (NSArray)directoryServiceActions
{
  return self->_directoryServiceActions;
}

- (void)setDirectoryServiceActions:(id)a3
{
}

- (NSArray)foundOnDeviceActions
{
  return self->_foundOnDeviceActions;
}

- (void)setFoundOnDeviceActions:(id)a3
{
}

- (BOOL)hasDefaultApp
{
  return self->_hasDefaultApp;
}

- (void)setHasDefaultApp:(BOOL)a3
{
  self->_hasDefaultApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundOnDeviceActions, 0);
  objc_storeStrong((id *)&self->_directoryServiceActions, 0);
  objc_storeStrong((id *)&self->_recentActions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
}

@end