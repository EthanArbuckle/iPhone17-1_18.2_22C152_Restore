@interface WFTrelloAddCardAction
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFTrelloAddCardAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to create a new Trello card with %2$@?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to create a new Trello card?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "trelloLocation", a3);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v53[1] = *MEMORY[0x263EF8340];
  v4 = [(WFTrelloAddCardAction *)self resourceManager];
  v5 = [v4 resourceObjectsOfClass:objc_opt_class()];
  id v6 = [v5 anyObject];

  v7 = [v6 accounts];
  id v8 = [v7 firstObject];

  v9 = [(WFTrelloAddCardAction *)self parameterValueForKey:@"WFTrelloBoard" ofClass:objc_opt_class()];
  if (v9)
  {
    v10 = [(WFTrelloAddCardAction *)self parameterValueForKey:@"WFTrelloList" ofClass:objc_opt_class()];
    v11 = [v10 identifier];

    if (v11)
    {
      if (v10)
      {
LABEL_4:
        uint64_t v12 = [(WFTrelloAddCardAction *)self parameterValueForKey:@"WFTrelloName" ofClass:objc_opt_class()];
        v13 = [(WFTrelloAddCardAction *)self parameterValueForKey:@"WFTrelloCardPosition" ofClass:objc_opt_class()];
        v14 = [(WFTrelloAddCardAction *)self parameterValueForKey:@"WFTrelloDescription" ofClass:objc_opt_class()];
        v41 = [(WFTrelloAddCardAction *)self parameterValueForKey:@"WFTrelloDueDate" ofClass:objc_opt_class()];
        v15 = objc_msgSend(MEMORY[0x263F33840], "datesInString:error:");
        uint64_t v40 = [v15 firstObject];

        v16 = [(WFTrelloAddCardAction *)self parameterValueForKey:@"WFTrelloAttachments" ofClass:objc_opt_class()];
        if (!v16) {
          v16 = objc_opt_new();
        }
        v42 = v8;
        v43 = v6;
        if (v12)
        {
          v17 = [WFTrelloSessionManager alloc];
          v18 = [v8 token];
          v19 = [(WFTrelloSessionManager *)v17 initWithConfiguration:0 token:v18];

          v20 = [v10 identifier];
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke;
          v44[3] = &unk_264E5BA60;
          v44[4] = self;
          id v45 = v16;
          v46 = v19;
          v21 = v19;
          v22 = (void *)v40;
          [(WFTrelloSessionManager *)v21 createCardWithName:v12 listIdentifier:v20 dueDate:v40 cardPosition:v13 cardDescription:v14 completionHandler:v44];
        }
        else
        {
          v36 = (void *)MEMORY[0x263F087E8];
          uint64_t v39 = *MEMORY[0x263F870B8];
          uint64_t v47 = *MEMORY[0x263F08320];
          WFLocalizedString(@"You must provide a name to use for the new Trello Card.");
          v21 = (WFTrelloSessionManager *)objc_claimAutoreleasedReturnValue();
          v48 = v21;
          v37 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          v38 = [v36 errorWithDomain:v39 code:5 userInfo:v37];
          [(WFTrelloAddCardAction *)self finishRunningWithError:v38];

          v22 = (void *)v40;
        }

        id v8 = v42;
        id v6 = v43;
        goto LABEL_13;
      }
    }
    else
    {
      v25 = +[WFDiskCache workflowCache];
      v26 = (void *)MEMORY[0x263EFFA08];
      v51[0] = objc_opt_class();
      v51[1] = objc_opt_class();
      v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
      v28 = [v26 setWithArray:v27];
      v29 = [v9 identifier];
      objc_msgSend(v25, "objectOfClasses:forKeyComponents:", v28, v29, @"WFTrelloLists", 0);
      v31 = v30 = v8;

      v32 = [v10 name];
      uint64_t v33 = [v31 objectMatchingKey:@"name" value:v32];

      id v8 = v30;
      v10 = (void *)v33;
      if (v33) {
        goto LABEL_4;
      }
    }
    v34 = (void *)MEMORY[0x263F087E8];
    uint64_t v35 = *MEMORY[0x263F870B8];
    uint64_t v49 = *MEMORY[0x263F08320];
    uint64_t v12 = WFLocalizedString(@"You must select a list to create the card on.");
    v50 = v12;
    v13 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    v14 = [v34 errorWithDomain:v35 code:5 userInfo:v13];
    [(WFTrelloAddCardAction *)self finishRunningWithError:v14];
LABEL_13:

    goto LABEL_14;
  }
  v23 = (void *)MEMORY[0x263F087E8];
  uint64_t v24 = *MEMORY[0x263F870B8];
  uint64_t v52 = *MEMORY[0x263F08320];
  v10 = WFLocalizedString(@"You must select a board to create the card on.");
  v53[0] = v10;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
  v13 = [v23 errorWithDomain:v24 code:5 userInfo:v12];
  [(WFTrelloAddCardAction *)self finishRunningWithError:v13];
LABEL_14:
}

void __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) output];
    [v4 addObject:v3];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_264E5BA38;
  v5 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = v3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_4;
  v7[3] = &unk_264E5E8E8;
  v7[4] = *(void *)(a1 + 32);
  id v6 = v3;
  [v5 enumerateFileRepresentations:v8 forType:0 completionHandler:v7];
}

void __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_3;
  v11[3] = &unk_264E5CD58;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v7 uploadFile:v10 onCard:v8 completionHandler:v11];
}

uint64_t __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __52__WFTrelloAddCardAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5 && (a2 & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F870B8];
    uint64_t v13 = *MEMORY[0x263F08320];
    uint64_t v8 = NSString;
    id v9 = WFLocalizedString(@"Uploading %@ as an attachment failed.");
    id v10 = [*(id *)(a1 + 32) filename];
    v11 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v10, v13);
    v14[0] = v11;
    id v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v5 = [v6 errorWithDomain:v7 code:-1 userInfo:v12];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFTrelloAddCardAction;
  [(WFTrelloAddCardAction *)&v4 initializeParameters];
  id v3 = [(WFTrelloAddCardAction *)self parameterForKey:@"WFTrelloList"];
  [v3 setAction:self];
}

@end