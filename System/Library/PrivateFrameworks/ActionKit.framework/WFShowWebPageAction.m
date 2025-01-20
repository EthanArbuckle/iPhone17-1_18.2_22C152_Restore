@interface WFShowWebPageAction
+ (id)userInterfaceProtocol;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
@end

@implementation WFShowWebPageAction

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2430;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [v7 length];
  v11 = NSString;
  if (v10)
  {
    v12 = WFLocalizedString(@"Allow “%1$@” to open “%2$@” with %3$@?");
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v7);
  }
  else
  {
    v12 = WFLocalizedString(@"Allow “%1$@” to open “%2$@”?");
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v15);
  v13 = };

  return v13;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(WFShowWebPageAction *)self input];
  id v7 = v4;
  id v6 = v4;
  WFGetContentLocationFromURLActionInput();
}

void __66__WFShowWebPageAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F33708] webpagesLocation];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  v12[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke;
  v10[3] = &unk_264E5B908;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 generateCollectionByCoercingToItemClasses:v8 completionHandler:v10];
}

void __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v28[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [a2 items];
  id v8 = [v7 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 URL];
    uint64_t v10 = [v9 scheme];
    id v11 = [v10 lowercaseString];

    if (([v11 isEqualToString:@"http"] & 1) != 0
      || ([v11 isEqualToString:@"https"] & 1) != 0)
    {
      v12 = [*(id *)(a1 + 32) parameterValueForKey:@"WFEnterSafariReader" ofClass:objc_opt_class()];
      uint64_t v13 = [v12 BOOLValue];

      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_2;
      v26[3] = &unk_264E5EBC8;
      v14 = *(void **)(a1 + 40);
      v26[4] = *(void *)(a1 + 32);
      [v14 showURL:v9 readerView:v13 completion:v26];
    }
    else
    {
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = *MEMORY[0x263F07F70];
      v27[0] = *MEMORY[0x263F08338];
      v17 = WFLocalizedString(@"Unsupported URL");
      v28[0] = v17;
      v27[1] = *MEMORY[0x263F08320];
      v18 = NSString;
      v19 = WFLocalizedString(@"Show Web Page supports http:// and https:// URLs, but you tried to show a %@:// URL.");
      v20 = objc_msgSend(v18, "stringWithFormat:", v19, v11);
      v28[1] = v20;
      v21 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      v22 = [v16 errorWithDomain:v23 code:-1002 userInfo:v21];

      [*(id *)(a1 + 32) finishRunningWithError:v22];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_3;
      v24[3] = &unk_264E5D368;
      uint64_t v15 = *(void **)(a1 + 40);
      v24[4] = *(void *)(a1 + 32);
      id v25 = v15;
      [v8 getFileRepresentation:v24 forType:0];
    }
    else
    {
      [*(id *)(a1 + 32) finishRunningWithError:v6];
    }
  }
}

uint64_t __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

uint64_t __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_4;
    v5[3] = &unk_264E5EBC8;
    uint64_t v2 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    return [v2 showRichText:a2 completion:v5];
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "finishRunningWithError:");
  }
}

uint64_t __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

@end