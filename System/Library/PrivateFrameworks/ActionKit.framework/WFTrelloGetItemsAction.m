@interface WFTrelloGetItemsAction
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)updateBoards:(id)a3 onAccount:(id)a4;
- (void)updateListCache:(id)a3 board:(id)a4 account:(id)a5;
@end

@implementation WFTrelloGetItemsAction

- (void)updateListCache:(id)a3 board:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v9 identifier];

  if (v11)
  {
    v12 = [v9 identifier];
    v20 = WFDiskCacheKey(v12, v13, v14, v15, v16, v17, v18, v19, @"WFTrelloLists");

    if ([v10 isValid] && objc_msgSend(v8, "count"))
    {
      v21 = +[WFDiskCache workflowCache];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __56__WFTrelloGetItemsAction_updateListCache_board_account___block_invoke;
      v23[3] = &unk_264E5EE70;
      v23[4] = self;
      [v21 setObject:v8 forKey:v20 completion:v23];
    }
    else
    {
      v22 = +[WFDiskCache workflowCache];
      [v22 removeObjectForKey:v20 completion:0];

      [(WFTrelloGetItemsAction *)self finishRunningWithError:0];
    }
  }
  else
  {
    [(WFTrelloGetItemsAction *)self finishRunningWithError:0];
  }
}

uint64_t __56__WFTrelloGetItemsAction_updateListCache_board_account___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_215);
  v2 = *(void **)(a1 + 32);
  return [v2 finishRunningWithError:0];
}

void __56__WFTrelloGetItemsAction_updateListCache_board_account___block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"WFTrelloListParameterNeedsUpdate" object:0];
}

- (void)updateBoards:(id)a3 onAccount:(id)a4
{
  id v6 = a3;
  if ([a4 isValid] && objc_msgSend(v6, "count"))
  {
    v7 = +[WFDiskCache workflowCache];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__WFTrelloGetItemsAction_updateBoards_onAccount___block_invoke;
    v9[3] = &unk_264E5EE70;
    v9[4] = self;
    [v7 setObject:v6 forKey:@"WFTrelloBoards" completion:v9];
  }
  else
  {
    id v8 = +[WFDiskCache workflowCache];
    [v8 removeObjectForKey:@"WFTrelloBoards" completion:0];

    [(WFTrelloGetItemsAction *)self finishRunningWithError:0];
  }
}

uint64_t __49__WFTrelloGetItemsAction_updateBoards_onAccount___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_15522);
  v2 = *(void **)(a1 + 32);
  return [v2 finishRunningWithError:0];
}

void __49__WFTrelloGetItemsAction_updateBoards_onAccount___block_invoke_2()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:@"WFTrelloBoardParameterNeedsUpdateNotification" object:0];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v54[1] = *MEMORY[0x263EF8340];
  v4 = [(WFTrelloGetItemsAction *)self resourceManager];
  v5 = [v4 resourceObjectsOfClass:objc_opt_class()];
  id v6 = [v5 anyObject];

  v7 = [v6 accounts];
  id v8 = [v7 firstObject];

  if ([v8 isValid])
  {
    id v9 = [WFTrelloSessionManager alloc];
    id v10 = [v8 token];
    v11 = [(WFTrelloSessionManager *)v9 initWithConfiguration:0 token:v10];

    id v12 = [(WFTrelloGetItemsAction *)self parameterValueForKey:@"WFTrelloBoard" ofClass:objc_opt_class()];
    uint64_t v13 = [(WFTrelloGetItemsAction *)self parameterValueForKey:@"WFTrelloItemType" ofClass:objc_opt_class()];
    if ([v13 isEqualToString:@"Boards"])
    {
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke;
      v44[3] = &unk_264E5DB20;
      v44[4] = self;
      id v45 = v8;
      [(WFTrelloSessionManager *)v11 getOpenBoardsWithCompletionHandler:v44];
      uint64_t v14 = v45;
LABEL_8:

      goto LABEL_9;
    }
    if ([v13 isEqualToString:@"Lists"])
    {
      if (v12)
      {
        v41[0] = MEMORY[0x263EF8330];
        v41[1] = 3221225472;
        v41[2] = __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke_2;
        v41[3] = &unk_264E5EBA0;
        v41[4] = self;
        id v12 = v12;
        id v42 = v12;
        id v43 = v8;
        [(WFTrelloSessionManager *)v11 getListsForBoard:v12 completionHandler:v41];

        uint64_t v14 = v42;
        goto LABEL_8;
      }
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F870B8];
      uint64_t v51 = *MEMORY[0x263F08320];
      v26 = WFLocalizedString(@"You must select a board to retrieve lists from.");
      v52 = v26;
      v27 = NSDictionary;
      v28 = &v52;
      v29 = &v51;
LABEL_18:
      v30 = [v27 dictionaryWithObjects:v28 forKeys:v29 count:1];
      v31 = [v24 errorWithDomain:v25 code:5 userInfo:v30];
      [(WFTrelloGetItemsAction *)self finishRunningWithError:v31];

      id v12 = 0;
      goto LABEL_9;
    }
    if (![v13 isEqualToString:@"Cards"]) {
      goto LABEL_9;
    }
    if (!v12)
    {
      v24 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F870B8];
      uint64_t v49 = *MEMORY[0x263F08320];
      v26 = WFLocalizedString(@"You must select a board to retrieve cards from.");
      v50 = v26;
      v27 = NSDictionary;
      v28 = &v50;
      v29 = &v49;
      goto LABEL_18;
    }
    uint64_t v17 = [(WFTrelloGetItemsAction *)self parameterValueForKey:@"WFTrelloList" ofClass:objc_opt_class()];
    uint64_t v18 = [v17 identifier];

    if (!v18)
    {
      v38 = +[WFDiskCache workflowCache];
      uint64_t v19 = (void *)MEMORY[0x263EFFA08];
      v48[0] = objc_opt_class();
      v48[1] = objc_opt_class();
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
      v20 = [v19 setWithArray:v37];
      v21 = [v12 identifier];
      v36 = objc_msgSend(v38, "objectOfClasses:forKeyComponents:", v20, v21, @"WFTrelloLists", 0);

      v22 = [v17 name];
      uint64_t v23 = [v36 objectMatchingKey:@"name" value:v22];

      uint64_t v17 = (void *)v23;
    }
    if (v17)
    {
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke_3;
      v40[3] = &unk_264E5EEE8;
      v40[4] = self;
      [(WFTrelloSessionManager *)v11 getCardsForList:v17 completionHandler:v40];
    }
    else
    {
      v32 = (void *)MEMORY[0x263F087E8];
      uint64_t v39 = *MEMORY[0x263F870B8];
      uint64_t v46 = *MEMORY[0x263F08320];
      v33 = WFLocalizedString(@"You must select a list to retrieve cards from.");
      v47 = v33;
      v34 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      v35 = [v32 errorWithDomain:v39 code:5 userInfo:v34];
      [(WFTrelloGetItemsAction *)self finishRunningWithError:v35];
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F870B8];
    uint64_t v53 = *MEMORY[0x263F08320];
    WFLocalizedString(@"Your Trello account couldn’t be verified. Please sign out and try again!");
    v11 = (WFTrelloSessionManager *)objc_claimAutoreleasedReturnValue();
    v54[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v54 forKeys:&v53 count:1];
    uint64_t v13 = [v15 errorWithDomain:v16 code:-1 userInfo:v12];
    [(WFTrelloGetItemsAction *)self finishRunningWithError:v13];
  }
LABEL_9:
}

void __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          id v12 = [*(id *)(a1 + 32) output];
          [v12 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [*(id *)(a1 + 32) updateBoards:v6 onAccount:*(void *)(a1 + 40)];
  }
}

void __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
          id v12 = [*(id *)(a1 + 32) output];
          [v12 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    [*(id *)(a1 + 32) updateListCache:v6 board:*(void *)(a1 + 40) account:*(void *)(a1 + 48)];
  }
}

void __53__WFTrelloGetItemsAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = a3;
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
          long long v14 = [*(id *)(a1 + 32) output];
          [v14 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = 0;
  }
  [v7 finishRunningWithError:v8];
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFTrelloGetItemsAction;
  [(WFTrelloGetItemsAction *)&v4 initializeParameters];
  v3 = [(WFTrelloGetItemsAction *)self parameterForKey:@"WFTrelloList"];
  [v3 setAction:self];
}

@end