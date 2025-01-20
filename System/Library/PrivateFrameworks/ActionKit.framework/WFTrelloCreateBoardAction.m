@interface WFTrelloCreateBoardAction
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)updateBoardCacheOnAccount:(id)a3;
@end

@implementation WFTrelloCreateBoardAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to create a new Trello board with %2$@?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to create a new Trello board?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "trelloLocation", a3);
}

- (void)updateBoardCacheOnAccount:(id)a3
{
  id v4 = a3;
  if ([v4 isValid])
  {
    v5 = [WFTrelloSessionManager alloc];
    id v6 = [v4 token];
    v7 = [(WFTrelloSessionManager *)v5 initWithConfiguration:0 token:v6];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__WFTrelloCreateBoardAction_updateBoardCacheOnAccount___block_invoke;
    v9[3] = &unk_264E5EEE8;
    v9[4] = self;
    [(WFTrelloSessionManager *)v7 getOpenBoardsWithCompletionHandler:v9];
  }
  else
  {
    id v8 = +[WFDiskCache workflowCache];
    [v8 removeObjectForKey:@"WFTrelloBoards" completion:0];

    [(WFTrelloCreateBoardAction *)self finishRunningWithError:0];
  }
}

void __55__WFTrelloCreateBoardAction_updateBoardCacheOnAccount___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = a3;
  }
  else
  {
    uint64_t v9 = [v5 count];
    v10 = +[WFDiskCache workflowCache];
    v11 = v10;
    if (v9)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __55__WFTrelloCreateBoardAction_updateBoardCacheOnAccount___block_invoke_2;
      v12[3] = &unk_264E5EE70;
      v12[4] = *(void *)(a1 + 32);
      [v10 setObject:v6 forKey:@"WFTrelloBoards" completion:v12];

      goto LABEL_6;
    }
    [v10 removeObjectForKey:@"WFTrelloBoards" completion:0];

    v7 = *(void **)(a1 + 32);
    uint64_t v8 = 0;
  }
  [v7 finishRunningWithError:v8];
LABEL_6:
}

uint64_t __55__WFTrelloCreateBoardAction_updateBoardCacheOnAccount___block_invoke_2(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:@"WFTrelloBoardParameterNeedsUpdateNotification" object:0];

  v3 = *(void **)(a1 + 32);
  return [v3 finishRunningWithError:0];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = [(WFTrelloCreateBoardAction *)self resourceManager];
  id v5 = [v4 resourceObjectsOfClass:objc_opt_class()];
  id v6 = [v5 anyObject];

  v7 = [v6 accounts];
  uint64_t v8 = [v7 firstObject];

  uint64_t v9 = [(WFTrelloCreateBoardAction *)self parameterValueForKey:@"WFTrelloName" ofClass:objc_opt_class()];
  v10 = [(WFTrelloCreateBoardAction *)self parameterValueForKey:@"WFTrelloDescription" ofClass:objc_opt_class()];
  v11 = [WFTrelloSessionManager alloc];
  uint64_t v12 = [v8 token];
  v13 = [(WFTrelloSessionManager *)v11 initWithConfiguration:0 token:v12];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__WFTrelloCreateBoardAction_runAsynchronouslyWithInput___block_invoke;
  v15[3] = &unk_264E5AB00;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [(WFTrelloSessionManager *)v13 createBoardWithName:v9 boardDescription:v10 completionHandler:v15];
}

void __56__WFTrelloCreateBoardAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
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
    [*(id *)(a1 + 32) updateBoardCacheOnAccount:*(void *)(a1 + 40)];
  }
}

@end