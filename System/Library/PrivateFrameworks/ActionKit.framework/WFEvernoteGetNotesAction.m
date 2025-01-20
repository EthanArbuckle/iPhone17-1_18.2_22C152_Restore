@interface WFEvernoteGetNotesAction
- (void)performSearch:(id)a3 inNotebook:(id)a4 maxResults:(unint64_t)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFEvernoteGetNotesAction

- (void)performSearch:(id)a3 inNotebook:(id)a4 maxResults:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[WFEvernoteAccessResource evernoteSession];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__WFEvernoteGetNotesAction_performSearch_inNotebook_maxResults___block_invoke;
  v11[3] = &unk_264E5EEE8;
  v11[4] = self;
  [v10 findNotesWithSearch:v9 inNotebook:v8 orScope:1 sortOrder:2 maxResults:a5 completion:v11];
}

void __64__WFEvernoteGetNotesAction_performSearch_inNotebook_maxResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        v12 = [*(id *)(a1 + 32) output];
        v13 = [v11 noteRef];
        v14 = [v11 title];
        [v12 addObject:v13 named:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v4 = [(WFEvernoteGetNotesAction *)self parameterValueForKey:@"WFEvernoteNotesTitleSearch" ofClass:objc_opt_class()];
  id v5 = [(WFEvernoteGetNotesAction *)self parameterValueForKey:@"WFEvernoteNotesTags" ofClass:objc_opt_class()];
  id v6 = [v5 componentsSeparatedByString:@","];

  uint64_t v7 = [(WFEvernoteGetNotesAction *)self parameterValueForKey:@"WFEvernoteNotesCount" ofClass:objc_opt_class()];
  uint64_t v19 = [v7 integerValue];

  uint64_t v20 = [(WFEvernoteGetNotesAction *)self parameterValueForKey:@"WFEvernoteNotesNotebookName" ofClass:objc_opt_class()];
  uint64_t v8 = objc_opt_new();
  if ([v4 length]) {
    [v8 appendFormat:@"intitle:\"%@\" ", v4];
  }
  v21 = v4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v15 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        long long v16 = [v14 stringByTrimmingCharactersInSet:v15];

        if ([v16 length]) {
          [v8 appendFormat:@"tag:\"%@\" ", v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);
  }

  if ([v8 length])
  {
    long long v17 = +[ENNoteSearch noteSearchWithSearchString:v8];
  }
  else
  {
    long long v17 = 0;
  }
  if ([v20 length])
  {
    long long v18 = +[WFEvernoteAccessResource evernoteSession];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __55__WFEvernoteGetNotesAction_runAsynchronouslyWithInput___block_invoke;
    v22[3] = &unk_264E55C00;
    id v23 = v20;
    v24 = self;
    id v25 = v17;
    uint64_t v26 = v19;
    [v18 listNotebooksWithCompletion:v22];
  }
  else
  {
    [(WFEvernoteGetNotesAction *)self performSearch:v17 inNotebook:0 maxResults:v19];
  }
}

void __55__WFEvernoteGetNotesAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
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
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = objc_msgSend(v7, "name", (void)v10);
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

  [*(id *)(a1 + 40) performSearch:*(void *)(a1 + 48) inNotebook:v4 maxResults:*(void *)(a1 + 56)];
}

@end