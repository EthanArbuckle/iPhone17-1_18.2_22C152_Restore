@interface WFPrintAction
+ (id)userInterfaceProtocol;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFPrintAction

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2978;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to print %2$@?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to print?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F337E8], "printLocation", a3);
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)MEMORY[0x263F852B8];
  uint64_t v8 = *MEMORY[0x263F1DBF0];
  id v9 = a4;
  v10 = [v7 typeWithUTType:v8];
  v11 = (void *)MEMORY[0x263F33770];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __50__WFPrintAction_runWithRemoteUserInterface_input___block_invoke;
  v21 = &unk_264E5EBA0;
  v22 = self;
  id v23 = v10;
  id v24 = v6;
  id v12 = v6;
  id v13 = v10;
  v14 = [v11 requestForCoercingToFileType:v13 completionHandler:&v18];
  v15 = (void *)MEMORY[0x263F33768];
  uint64_t v25 = *MEMORY[0x263F33A50];
  v26[0] = MEMORY[0x263EFFA88];
  v16 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, &v25, 1, v18, v19, v20, v21, v22);
  v17 = [v15 optionsWithDictionary:v16];
  [v14 setOptions:v17];

  [v9 performCoercion:v14];
}

void __50__WFPrintAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    v26 = (void *)a1;
    id v27 = v6;
    v7 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_47984);
    id v8 = objc_alloc_init((Class)getPDFDocumentClass_47985());
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v15 = [v14 pageCount];
          if (v15)
          {
            uint64_t v16 = v15;
            for (uint64_t j = 0; j != v16; ++j)
            {
              uint64_t v18 = [v14 pageAtIndex:j];
              objc_msgSend(v8, "insertPage:atIndex:", v18, objc_msgSend(v8, "pageCount"));
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }

    uint64_t v19 = (void *)MEMORY[0x263F33870];
    v20 = [v5 firstObject];
    v21 = [v20 wfName];
    v22 = [v19 proposedFilenameForFile:v21 ofType:v26[5]];

    id v23 = [MEMORY[0x263F339A0] createTemporaryFileWithFilename:v22];
    [v8 writeToURL:v23];
    id v24 = [MEMORY[0x263F33870] fileWithURL:v23 options:1];
    uint64_t v25 = (void *)v26[6];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __50__WFPrintAction_runWithRemoteUserInterface_input___block_invoke_3;
    v28[3] = &unk_264E5EBC8;
    v28[4] = v26[4];
    [v25 showWithFile:v24 completionHandler:v28];

    id v6 = v27;
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
}

uint64_t __50__WFPrintAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

id __50__WFPrintAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (![v2 representationType])
  {
    id v6 = objc_alloc((Class)getPDFDocumentClass_47985());
    v4 = [v2 data];
    uint64_t v5 = [v6 initWithData:v4];
    goto LABEL_5;
  }
  if ([v2 representationType] == 1)
  {
    id v3 = objc_alloc((Class)getPDFDocumentClass_47985());
    v4 = [v2 fileURL];
    uint64_t v5 = [v3 initWithURL:v4];
LABEL_5:
    v7 = (void *)v5;

    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

@end