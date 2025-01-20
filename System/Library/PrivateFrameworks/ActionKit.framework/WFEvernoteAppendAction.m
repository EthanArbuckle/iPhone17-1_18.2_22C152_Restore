@interface WFEvernoteAppendAction
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)titleSearch;
- (void)performSearch:(id)a3 inNotebook:(id)a4 maxResults:(unint64_t)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)uploadNoteWithContent:(id)a3 toNotebook:(id)a4;
@end

@implementation WFEvernoteAppendAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to append %2$@ to an Evernote note?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to append content to an Evernote note?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "evernoteLocation", a3);
}

- (id)titleSearch
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFEvernoteAppendAction *)self parameterValueForKey:@"WFEvernoteNotesTitleSearch" ofClass:v3];
}

- (void)uploadNoteWithContent:(id)a3 toNotebook:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__WFEvernoteAppendAction_uploadNoteWithContent_toNotebook___block_invoke;
  v8[3] = &unk_264E585C0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  +[WFEvernoteContentItem createNoteWithContent:a3 completionHandler:v8];
}

void __59__WFEvernoteAppendAction_uploadNoteWithContent_toNotebook___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) titleSearch];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) titleSearch];
    [v3 setTitle:v6];
  }
  id v7 = +[WFEvernoteAccessResource evernoteSession];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__WFEvernoteAppendAction_uploadNoteWithContent_toNotebook___block_invoke_2;
  v10[3] = &unk_264E5E100;
  uint64_t v8 = *(void *)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v3;
  id v9 = v3;
  [v7 uploadNote:v9 notebook:v8 completion:v10];
}

void __59__WFEvernoteAppendAction_uploadNoteWithContent_toNotebook___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  if (a2)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v7 = [v5 output];
    uint64_t v8 = +[WFEvernoteContentItem itemWithNoteRef:v6 note:*(void *)(a1 + 40)];

    [v7 addItem:v8];
  }
  [*(id *)(a1 + 32) finishRunningWithError:v9];
}

- (void)performSearch:(id)a3 inNotebook:(id)a4 maxResults:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[WFEvernoteAccessResource evernoteSession];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke;
  v12[3] = &unk_264E5DB20;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 findNotesWithSearch:v9 inNotebook:v11 orScope:1 sortOrder:2 maxResults:a5 completion:v12];
}

void __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
  else if ([v5 count])
  {
    id v7 = [v6 firstObject];
    id v8 = +[WFEvernoteAccessResource evernoteSession];
    id v9 = [v7 noteRef];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_2;
    v14[3] = &unk_264E58598;
    v10 = *(void **)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v10;
    id v16 = v7;
    id v11 = v7;
    [v8 downloadNote:v9 progress:0 completion:v14];
  }
  else
  {
    uint64_t v12 = *(void **)(a1 + 32);
    id v13 = [v12 input];
    [v12 uploadNoteWithContent:v13 toNotebook:*(void *)(a1 + 40)];
  }
}

void __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [a1[4] input];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_3;
    v7[3] = &unk_264E58570;
    v7[4] = a1[4];
    id v8 = v5;
    id v9 = a1[5];
    id v10 = a1[6];
    +[WFEvernoteContentItem createNoteWithContent:v6 completionHandler:v7];
  }
  else
  {
    [a1[4] finishRunningWithError:a3];
  }
}

void __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (v5)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = [v5 resources];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(a1 + 40) addResource:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v9);
    }

    uint64_t v12 = [*(id *)(a1 + 32) parameterValueForKey:@"WFEvernoteWriteMode" ofClass:objc_opt_class()];
    int v13 = [v12 isEqualToString:@"Prepend"];

    if (v13)
    {
      v14 = [v6 content];
      id v15 = [v14 enmlWithNote:v6];
      id v16 = (void *)[v15 mutableCopy];

      objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", @"<en-note/>", @"<en-note>", 0, 0, objc_msgSend(v16, "length"));
      objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", @"</en-note>", &stru_26F008428, 0, 0, objc_msgSend(v16, "length"));
      v17 = +[ENXMLDTD enml2dtd];
      v18 = [v17 docTypeDeclaration];

      v19 = [*(id *)(a1 + 40) content];
      v20 = v19;
      v21 = *(void **)(a1 + 40);
    }
    else
    {
      v22 = [*(id *)(a1 + 40) content];
      v23 = [v22 enmlWithNote:*(void *)(a1 + 40)];
      id v16 = (void *)[v23 mutableCopy];

      objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", @"<en-note/>", @"<en-note>", 0, 0, objc_msgSend(v16, "length"));
      objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", @"</en-note>", &stru_26F008428, 0, 0, objc_msgSend(v16, "length"));
      v24 = +[ENXMLDTD enml2dtd];
      v18 = [v24 docTypeDeclaration];

      v19 = [v6 content];
      v20 = v19;
      v21 = v6;
    }
    v25 = [v19 enmlWithNote:v21];
    v26 = (void *)[v25 mutableCopy];

    objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", @"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n", &stru_26F008428, 8, 0, objc_msgSend(v26, "length"));
    v27 = [v18 stringByAppendingString:@"\n"];
    objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", v27, &stru_26F008428, 8, 0, objc_msgSend(v26, "length"));

    objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", @"<en-note>", &stru_26F008428, 8, 0, objc_msgSend(v26, "length"));
    [v16 appendString:v26];
    v28 = +[ENNoteContent noteContentWithENML:v16];
    [*(id *)(a1 + 40) setContent:v28];

    v29 = +[WFEvernoteAccessResource evernoteSession];
    uint64_t v30 = *(void *)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 48);
    v32 = [*(id *)(a1 + 56) noteRef];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_4;
    v34[3] = &unk_264E5E100;
    v33 = *(void **)(a1 + 40);
    v34[4] = *(void *)(a1 + 32);
    id v35 = v33;
    [v29 uploadNote:v30 policy:1 toNotebook:v31 orReplaceNote:v32 progress:0 completion:v34];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

void __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v10 = v5;
  if (v5)
  {
    id v7 = [v6 output];
    uint64_t v8 = +[WFEvernoteContentItem itemWithNoteRef:v10 note:*(void *)(a1 + 40)];
    [v7 addItem:v8];

    id v6 = *(void **)(a1 + 32);
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = a3;
  }
  [v6 finishRunningWithError:v9];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = [(WFEvernoteAppendAction *)self parameterValueForKey:@"WFEvernoteNotesNotebookName" ofClass:objc_opt_class()];
  id v5 = NSString;
  id v6 = [(WFEvernoteAppendAction *)self titleSearch];
  id v7 = [v5 stringWithFormat:@"intitle:\"%@\"", v6];

  uint64_t v8 = [(WFEvernoteAppendAction *)self titleSearch];
  if ([v8 length])
  {
    uint64_t v9 = +[ENNoteSearch noteSearchWithSearchString:v7];
  }
  else
  {
    uint64_t v9 = 0;
  }

  if ([v4 length])
  {
    id v10 = +[WFEvernoteAccessResource evernoteSession];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__WFEvernoteAppendAction_runAsynchronouslyWithInput___block_invoke;
    v11[3] = &unk_264E5EBA0;
    id v12 = v4;
    int v13 = self;
    id v14 = v9;
    [v10 listNotebooksWithCompletion:v11];
  }
  else
  {
    [(WFEvernoteAppendAction *)self performSearch:v9 inNotebook:0 maxResults:1];
  }
}

void __53__WFEvernoteAppendAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
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
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
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

  [*(id *)(a1 + 40) performSearch:*(void *)(a1 + 48) inNotebook:v4 maxResults:1];
}

@end