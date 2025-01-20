@interface WFTrelloCreateListAction
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)updateListCacheForBoard:(id)a3 onAccount:(id)a4;
@end

@implementation WFTrelloCreateListAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to create a new Trello list with %2$@?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to create a new Trello list?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "trelloLocation", a3);
}

- (void)updateListCacheForBoard:(id)a3 onAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 identifier];

  if (v8)
  {
    v9 = [v6 identifier];
    v17 = WFDiskCacheKey(v9, v10, v11, v12, v13, v14, v15, v16, @"WFTrelloLists");

    if ([v7 isValid])
    {
      v18 = [WFTrelloSessionManager alloc];
      v19 = [v7 token];
      v20 = [(WFTrelloSessionManager *)v18 initWithConfiguration:0 token:v19];

      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __62__WFTrelloCreateListAction_updateListCacheForBoard_onAccount___block_invoke;
      v22[3] = &unk_264E5DB20;
      v22[4] = self;
      id v23 = v17;
      [(WFTrelloSessionManager *)v20 getListsForBoard:v6 completionHandler:v22];
    }
    else
    {
      v21 = +[WFDiskCache workflowCache];
      [v21 removeObjectForKey:v17 completion:0];

      [(WFTrelloCreateListAction *)self finishRunningWithError:0];
    }
  }
  else
  {
    [(WFTrelloCreateListAction *)self finishRunningWithError:0];
  }
}

void __62__WFTrelloCreateListAction_updateListCacheForBoard_onAccount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = a3;
  }
  else
  {
    uint64_t v9 = [v5 count];
    uint64_t v10 = +[WFDiskCache workflowCache];
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)(a1 + 40);
    if (v9)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __62__WFTrelloCreateListAction_updateListCacheForBoard_onAccount___block_invoke_2;
      v13[3] = &unk_264E5EE70;
      v13[4] = *(void *)(a1 + 32);
      [v10 setObject:v6 forKey:v12 completion:v13];

      goto LABEL_6;
    }
    [v10 removeObjectForKey:*(void *)(a1 + 40) completion:0];

    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = 0;
  }
  [v7 finishRunningWithError:v8];
LABEL_6:
}

uint64_t __62__WFTrelloCreateListAction_updateListCacheForBoard_onAccount___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFTrelloListParameterNeedsUpdate" object:0];

  v3 = *(void **)(a1 + 32);
  return [v3 finishRunningWithError:0];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  v4 = [(WFTrelloCreateListAction *)self resourceManager];
  id v5 = [v4 resourceObjectsOfClass:objc_opt_class()];
  id v6 = [v5 anyObject];

  id v7 = [v6 accounts];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [(WFTrelloCreateListAction *)self parameterValueForKey:@"WFTrelloBoard" ofClass:objc_opt_class()];
  if (v9)
  {
    uint64_t v10 = [(WFTrelloCreateListAction *)self parameterValueForKey:@"WFTrelloName" ofClass:objc_opt_class()];
    uint64_t v11 = [(WFTrelloCreateListAction *)self parameterValueForKey:@"WFTrelloPosition" ofClass:objc_opt_class()];
    uint64_t v12 = [WFTrelloSessionManager alloc];
    uint64_t v13 = [v8 token];
    uint64_t v14 = [(WFTrelloSessionManager *)v12 initWithConfiguration:0 token:v13];

    uint64_t v15 = [v9 identifier];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __55__WFTrelloCreateListAction_runAsynchronouslyWithInput___block_invoke;
    v18[3] = &unk_264E56380;
    v18[4] = self;
    id v19 = v9;
    id v20 = v8;
    [(WFTrelloSessionManager *)v14 createListWithName:v10 onBoardWithIdentifier:v15 position:v11 completionHandler:v18];
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F870B8];
    uint64_t v21 = *MEMORY[0x263F08320];
    uint64_t v10 = WFLocalizedString(@"You must select a board to create the list on.");
    v22[0] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    uint64_t v14 = [v16 errorWithDomain:v17 code:5 userInfo:v11];
    [(WFTrelloCreateListAction *)self finishRunningWithError:v14];
  }
}

void __55__WFTrelloCreateListAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5)
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
  else
  {
    if (v7)
    {
      id v6 = [*(id *)(a1 + 32) output];
      [v6 addObject:v7];
    }
    [*(id *)(a1 + 32) updateListCacheForBoard:*(void *)(a1 + 40) onAccount:*(void *)(a1 + 48)];
  }
}

@end