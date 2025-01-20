@interface WFEvernoteCreateAction
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFEvernoteCreateAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to add %2$@ to a new Evernote note?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to create a new Evernote note?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "evernoteLocation", a3);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5E150;
  v3[4] = self;
  +[WFEvernoteContentItem createNoteWithContent:a3 completionHandler:v3];
}

void __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) parameterValueForKey:@"WFEvernoteNoteTitle" ofClass:objc_opt_class()];
    v7 = [*(id *)(a1 + 32) parameterValueForKey:@"WFEvernoteTags" ofClass:objc_opt_class()];
    id v8 = [v7 componentsSeparatedByString:@","];

    v9 = [*(id *)(a1 + 32) parameterValueForKey:@"WFEvernoteNotebook" ofClass:objc_opt_class()];
    if ([v6 length]) {
      [v5 setTitle:v6];
    }
    v10 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_52900);
    [v5 setTagNames:v10];

    v11 = +[WFEvernoteAccessResource evernoteSession];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_3;
    aBlock[3] = &unk_264E5E128;
    id v12 = v11;
    uint64_t v13 = *(void *)(a1 + 32);
    id v20 = v12;
    uint64_t v21 = v13;
    v14 = _Block_copy(aBlock);
    if ([v9 length])
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_5;
      v15[3] = &unk_264E5E648;
      id v16 = v9;
      id v18 = v14;
      id v17 = v5;
      [v12 listNotebooksWithCompletion:v15];
    }
    else
    {
      (*((void (**)(void *, id, void))v14 + 2))(v14, v5, 0);
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

void __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_4;
  v8[3] = &unk_264E5E100;
  id v6 = *(void **)(a1 + 32);
  v8[4] = *(void *)(a1 + 40);
  id v9 = v5;
  id v7 = v5;
  [v6 uploadNote:v7 notebook:a3 completion:v8];
}

void __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  id v4 = (id)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "name", (void)v10);
        int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

        if (v9)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  if (a2)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = [v5 output];
    id v8 = +[WFEvernoteContentItem itemWithNoteRef:v6 note:*(void *)(a1 + 40)];

    [v7 addItem:v8];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v9];
}

id __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08708];
  id v3 = a2;
  id v4 = [v2 whitespaceAndNewlineCharacterSet];
  uint64_t v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if ([v5 length]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

@end