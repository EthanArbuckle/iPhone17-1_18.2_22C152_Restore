@interface CNUIUserActionRanking
+ (id)advisorSettingsForIdentifyingMostRecentAction:(id)a3 actionType:(id)a4;
+ (id)advisorSettingsForSortingAddresses:(id)a3 actionType:(id)a4;
+ (id)constrainMechanismsForActionType:(id)a3;
+ (id)sortKeyWithUsername:(id)a3 bundleIdentifier:(id)a4;
- (CNUIInteractionAdvisor)interactionAdvisor;
- (CNUIUserActionRanking)init;
- (CNUIUserActionRanking)initWithInteractionAdvisor:(id)a3;
- (id)selectMostRecentActionFromItems:(id)a3;
- (id)selectRecentActionItems:(id)a3 schedulerProvider:(id)a4;
- (id)sortActionItems:(id)a3 schedulerProvider:(id)a4 defaultAppsScorer:(id)a5;
- (id)sortKeysByRankingAddresses:(id)a3 actionType:(id)a4 scheduler:(id)a5;
@end

@implementation CNUIUserActionRanking

- (CNUIUserActionRanking)init
{
  v3 = [MEMORY[0x263F34FA0] sharedInteractionAdvisor];
  v4 = [(CNUIUserActionRanking *)self initWithInteractionAdvisor:v3];

  return v4;
}

- (CNUIUserActionRanking)initWithInteractionAdvisor:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIUserActionRanking;
  v6 = [(CNUIUserActionRanking *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_interactionAdvisor, a3);
    v8 = v7;
  }

  return v7;
}

- (id)sortActionItems:(id)a3 schedulerProvider:(id)a4 defaultAppsScorer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v8 count] > 1)
  {
    v12 = objc_msgSend(v8, "_cn_map:", &__block_literal_global_77);
    v13 = [v8 firstObject];
    v14 = [v13 type];
    v15 = [v9 backgroundScheduler];
    v16 = [(CNUIUserActionRanking *)self sortKeysByRankingAddresses:v12 actionType:v14 scheduler:v15];

    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __77__CNUIUserActionRanking_sortActionItems_schedulerProvider_defaultAppsScorer___block_invoke;
    v27[3] = &unk_264018EA8;
    id v17 = v8;
    id v28 = v17;
    v18 = [v16 recover:v27];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __77__CNUIUserActionRanking_sortActionItems_schedulerProvider_defaultAppsScorer___block_invoke_2;
    v24[3] = &unk_264019678;
    id v25 = v10;
    id v19 = v17;
    id v26 = v19;
    v20 = [v18 flatMap:v24];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __77__CNUIUserActionRanking_sortActionItems_schedulerProvider_defaultAppsScorer___block_invoke_3;
    v22[3] = &unk_264018EA8;
    id v23 = v19;
    v11 = [v20 recover:v22];
  }
  else
  {
    v11 = [MEMORY[0x263F335E0] futureWithResult:v8];
  }

  return v11;
}

id __77__CNUIUserActionRanking_sortActionItems_schedulerProvider_defaultAppsScorer___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_cn_map:", &__block_literal_global_77);
  v3 = [v1 futureWithResult:v2];

  return v3;
}

id __77__CNUIUserActionRanking_sortActionItems_schedulerProvider_defaultAppsScorer___block_invoke_2(uint64_t a1, void *a2)
{
  v15[6] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = +[CNUIUserActionItemComparator comparatorWithActionItemGrouping];
  v15[0] = v4;
  id v5 = +[CNUIUserActionItemComparator comparatorWithDefaultAppsScorer:*(void *)(a1 + 32)];
  v15[1] = v5;
  v6 = CNComparatorForSortingByAuxiliaryValues();

  v15[2] = v6;
  v7 = +[CNUIUserActionItemComparator comparatorWithPreferredLabelsFirst];
  v15[3] = v7;
  id v8 = +[CNUIUserActionItemComparator comparatorWithAlphabeticalOrderByLabel];
  v15[4] = v8;
  id v9 = +[CNUIUserActionItemComparator comparatorWithAlphabeticalOrderByTargetHandle];
  v15[5] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:6];
  v11 = CNAggregateComparator();

  v12 = [*(id *)(a1 + 40) sortedArrayUsingComparator:v11];
  v13 = [MEMORY[0x263F335E0] futureWithResult:v12];

  return v13;
}

uint64_t __77__CNUIUserActionRanking_sortActionItems_schedulerProvider_defaultAppsScorer___block_invoke_3(uint64_t a1)
{
  return [MEMORY[0x263F335E0] futureWithResult:*(void *)(a1 + 32)];
}

- (id)sortKeysByRankingAddresses:(id)a3 actionType:(id)a4 scheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x263F335E0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__CNUIUserActionRanking_sortKeysByRankingAddresses_actionType_scheduler___block_invoke;
  v15[3] = &unk_2640196C0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  v13 = [v10 futureWithBlock:v15 scheduler:a5];
  [v13 addFailureBlock:&__block_literal_global_10_1];

  return v13;
}

id __73__CNUIUserActionRanking_sortKeysByRankingAddresses_actionType_scheduler___block_invoke(uint64_t a1, void *a2)
{
  v4 = [(id)objc_opt_class() advisorSettingsForSortingAddresses:*(void *)(a1 + 40) actionType:*(void *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 32) interactionAdvisor];
  v6 = [v5 adviseInteractionsUsingSettings:v4];

  if (v6)
  {
    v7 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_48_0);
  }
  else
  {
    id v8 = +[CNContactsUIError errorWithCode:301];
    id v9 = v8;
    if (a2) {
      *a2 = v8;
    }

    v7 = 0;
  }

  return v7;
}

void __73__CNUIUserActionRanking_sortKeysByRankingAddresses_actionType_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
}

+ (id)advisorSettingsForSortingAddresses:(id)a3 actionType:(id)a4
{
  id v5 = (void *)MEMORY[0x263F34FA8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 interactionAdvisorSettingsDefault];
  id v9 = [MEMORY[0x263EFF910] date];
  [v8 setInteractionDate:v9];

  id v10 = [(id)objc_opt_class() constrainMechanismsForActionType:v6];

  [v8 setConstrainMechanisms:v10];
  id v11 = [MEMORY[0x263EFFA08] setWithArray:v7];

  [v8 setConstrainIdentifiers:v11];
  [v8 setResultLimit:10];
  return v8;
}

+ (id)advisorSettingsForIdentifyingMostRecentAction:(id)a3 actionType:(id)a4
{
  id v5 = (void *)MEMORY[0x263F34FA8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 interactionAdvisorSettingsDefault];
  id v9 = [MEMORY[0x263EFF910] date];
  [v8 setInteractionDate:v9];

  id v10 = [(id)objc_opt_class() constrainMechanismsForActionType:v6];

  [v8 setConstrainMechanisms:v10];
  id v11 = [MEMORY[0x263EFFA08] setWithArray:v7];

  [v8 setConstrainIdentifiers:v11];
  [v8 setConsumerIdentifier:@"recency"];
  [v8 setResultLimit:1];
  return v8;
}

+ (id)constrainMechanismsForActionType:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9C0] set];
  if (([v3 isEqualToString:*MEMORY[0x263EFDF10]] & 1) == 0)
  {
    if ([v3 isEqualToString:*MEMORY[0x263EFDF18]])
    {
      id v5 = &unk_26BFD9C70;
      id v6 = &unk_26BFD9C58;
      id v7 = &unk_26BFD9C40;
    }
    else
    {
      if ([v3 isEqualToString:*MEMORY[0x263EFDF38]])
      {
        id v5 = &unk_26BFD9CA0;
        id v6 = &unk_26BFD9C88;
LABEL_10:
        [v4 addObject:v6];
        goto LABEL_11;
      }
      if (![v3 isEqualToString:*MEMORY[0x263EFDEF8]]) {
        goto LABEL_12;
      }
      [v4 addObject:&unk_26BFD9CB8];
      id v5 = &unk_26BFD9D00;
      id v6 = &unk_26BFD9CE8;
      id v7 = &unk_26BFD9CD0;
    }
    [v4 addObject:v7];
    goto LABEL_10;
  }
  id v5 = &unk_26BFD9C28;
LABEL_11:
  [v4 addObject:v5];
LABEL_12:

  return v4;
}

+ (id)sortKeyWithUsername:(id)a3 bundleIdentifier:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@-%@", a3, a4];
}

- (id)selectRecentActionItems:(id)a3 schedulerProvider:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke;
  id v16 = &unk_2640188C8;
  id v17 = v6;
  v18 = self;
  id v7 = v6;
  id v8 = [a3 switchMap:&v13 schedulerProvider:v7];
  id v9 = objc_msgSend(MEMORY[0x263EFF8C0], "array", v13, v14, v15, v16);
  v19[0] = v9;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  id v11 = [v8 startWith:v10];

  return v11;
}

id __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x263F33608];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke_2;
  v10[3] = &unk_2640191A8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v3;
  id v7 = v3;
  id v8 = [v4 observableWithBlock:v10];

  return v8;
}

id __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) backgroundScheduler];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke_3;
  v9[3] = &unk_264019180;
  id v5 = *(void **)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v5;
  id v11 = v3;
  id v6 = v3;
  id v7 = [v4 performCancelableBlock:v9];

  return v7;
}

void __67__CNUIUserActionRanking_selectRecentActionItems_schedulerProvider___block_invoke_3(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 selectMostRecentActionFromItems:v4];
  LOBYTE(v4) = [v5 isCanceled];

  if ((v4 & 1) == 0)
  {
    if (v6)
    {
      id v7 = *(void **)(a1 + 48);
      v9[0] = v6;
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      [v7 observerDidReceiveResult:v8];
    }
    [*(id *)(a1 + 48) observerDidComplete];
  }
}

- (id)selectMostRecentActionFromItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_54);
  id v6 = objc_msgSend(v5, "_cn_distinctObjects");
  id v7 = [v4 firstObject];
  id v8 = [v7 type];

  id v9 = [(id)objc_opt_class() advisorSettingsForIdentifyingMostRecentAction:v6 actionType:v8];
  id v10 = [(CNUIUserActionRanking *)self interactionAdvisor];
  id v11 = [v10 adviseInteractionsUsingSettings:v9];

  uint64_t v12 = [v11 firstObject];
  id v13 = sSortKeyForAdvisedInteraction_block_invoke_3((uint64_t)v12, v12);

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __57__CNUIUserActionRanking_selectMostRecentActionFromItems___block_invoke_2;
  v17[3] = &unk_264017AE8;
  id v18 = v13;
  id v14 = v13;
  v15 = objc_msgSend(v4, "_cn_firstObjectPassingTest:", v17);

  return v15;
}

uint64_t __57__CNUIUserActionRanking_selectMostRecentActionFromItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 targetHandle];
}

uint64_t __57__CNUIUserActionRanking_selectMostRecentActionFromItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = sSortKeyForUserActionItem_block_invoke_2(a1, a2);
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (CNUIInteractionAdvisor)interactionAdvisor
{
  return self->_interactionAdvisor;
}

- (void).cxx_destruct
{
}

@end