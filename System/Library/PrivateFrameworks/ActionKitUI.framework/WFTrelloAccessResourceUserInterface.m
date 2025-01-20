@interface WFTrelloAccessResourceUserInterface
- (id)authorizationURLWithCallbackURL:(id)a3;
- (void)authorizeWithCompletionHandler:(id)a3;
@end

@implementation WFTrelloAccessResourceUserInterface

- (void)authorizeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [NSURL URLWithString:@"workflow://trello-auth-flow"];
  v6 = [(WFTrelloAccessResourceUserInterface *)self authorizationURLWithCallbackURL:v5];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__396;
  v22 = __Block_byref_object_dispose__397;
  id v23 = 0;
  id v7 = objc_alloc(MEMORY[0x263EFC480]);
  v8 = [v5 scheme];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke;
  v15 = &unk_2648FFE30;
  v17 = &v18;
  id v9 = v4;
  id v16 = v9;
  uint64_t v10 = [v7 initWithURL:v6 callbackURLScheme:v8 completionHandler:&v12];
  v11 = (void *)v19[5];
  v19[5] = v10;

  objc_msgSend((id)v19[5], "setPresentationContextProvider:", self, v12, v13, v14, v15);
  [(id)v19[5] start];

  _Block_object_dispose(&v18, 8);
}

void __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  if (!v5)
  {
LABEL_7:
    v15 = [v6 domain];
    if ([v15 isEqualToString:*MEMORY[0x263EFC360]])
    {
      uint64_t v16 = [v6 code];

      if (v16 != 1)
      {
LABEL_11:
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        goto LABEL_12;
      }
      v15 = v6;
      id v6 = 0;
    }

    goto LABEL_11;
  }
  id v9 = [MEMORY[0x263F08BA0] componentsWithURL:v5 resolvingAgainstBaseURL:0];
  uint64_t v10 = NSURL;
  v11 = [v9 fragment];
  uint64_t v12 = objc_msgSend(v10, "dc_dictionaryFromQueryString:", v11);
  uint64_t v13 = [v12 objectForKey:@"token"];

  if (![v13 length])
  {
LABEL_6:

    goto LABEL_7;
  }
  v14 = [MEMORY[0x263F23270] accountWithToken:v13];
  if (![MEMORY[0x263F23270] saveAccount:v14])
  {

    goto LABEL_6;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke_2;
  v17[3] = &unk_2648FFE08;
  id v18 = *(id *)(a1 + 32);
  [v14 refreshWithCompletionHandler:v17];

LABEL_12:
}

void __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_264900EB0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32));
}

- (id)authorizationURLWithCallbackURL:(id)a3
{
  v18[6] = *MEMORY[0x263EF8340];
  id v3 = NSURL;
  id v4 = a3;
  id v5 = [v3 URLWithString:@"https://trello.com/1/authorize"];
  id v6 = [MEMORY[0x263F08BD0] queryItemWithName:@"callback_method" value:@"fragment"];
  v18[0] = v6;
  id v7 = (void *)MEMORY[0x263F08BD0];
  id v8 = [v4 absoluteString];

  id v9 = [v7 queryItemWithName:@"return_url" value:v8];
  v18[1] = v9;
  uint64_t v10 = [MEMORY[0x263F08BD0] queryItemWithName:@"scope" value:@"read,write,account"];
  v18[2] = v10;
  v11 = [MEMORY[0x263F08BD0] queryItemWithName:@"expiration" value:@"never"];
  v18[3] = v11;
  uint64_t v12 = [MEMORY[0x263F08BD0] queryItemWithName:@"name" value:@"Shortcuts"];
  v18[4] = v12;
  uint64_t v13 = [MEMORY[0x263F08BD0] queryItemWithName:@"key" value:*MEMORY[0x263F23318]];
  v18[5] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:6];

  v15 = [MEMORY[0x263F08BA0] componentsWithURL:v5 resolvingAgainstBaseURL:0];
  [v15 setQueryItems:v14];
  uint64_t v16 = [v15 URL];

  return v16;
}

@end