@interface WFPinboardGetAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFPinboardGetAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = [(WFPinboardGetAction *)self parameterValueForKey:@"WFBookmarkCount" ofClass:objc_opt_class()];
  uint64_t v5 = [v4 unsignedIntegerValue];

  v6 = [(WFPinboardGetAction *)self parameterValueForKey:@"WFPinTags" ofClass:objc_opt_class()];
  v7 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" ,"];
  v8 = [v6 componentsSeparatedByCharactersInSet:v7];
  v9 = (void *)[v8 mutableCopy];

  [v9 removeObject:&stru_26F008428];
  v10 = objc_alloc_init(WFPinboardSessionManager);
  v11 = +[WFPinboardAccessResource pinboardUsername];
  [(WFPinboardSessionManager *)v10 setUsername:v11];

  v12 = +[WFPinboardAccessResource pinboardPassword];
  [(WFPinboardSessionManager *)v10 setPassword:v12];

  v13 = +[WFPinboardAccessResource pinboardToken];
  [(WFPinboardSessionManager *)v10 setApiToken:v13];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__WFPinboardGetAction_runAsynchronouslyWithInput___block_invoke;
  v15[3] = &unk_264E5DB20;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  [(WFPinboardSessionManager *)v14 getBookmarksWithTags:v9 limit:v5 completion:v15];
}

void __50__WFPinboardGetAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = a3;
  v6 = [v5 domain];
  if ([v6 isEqualToString:@"WFPinboardErrorDomain"])
  {
    uint64_t v7 = [v5 code];

    if (v7 != 1000) {
      goto LABEL_5;
    }
    v8 = [*(id *)(a1 + 32) resourceManager];
    v9 = [v8 resourceObjectsOfClass:objc_opt_class()];
    v6 = [v9 anyObject];

    [v6 logOut];
  }

LABEL_5:
  v10 = (void *)MEMORY[0x263F339C8];
  v11 = [*(id *)(a1 + 40) baseURL];
  v12 = [v10 attributionSetContentOfURL:v11];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v18 = [v17 objectForKey:@"href"];
        v19 = [NSURL URLWithString:v18];
        if (v19) {
          goto LABEL_12;
        }
        v20 = NSURL;
        v21 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"!$&'()*+,-./0123456789:=?@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"];;
        v22 = [v18 stringByAddingPercentEncodingWithAllowedCharacters:v21];
        v19 = [v20 URLWithString:v22];

        if (v19)
        {
LABEL_12:
          v23 = [*(id *)(a1 + 32) output];
          v24 = (void *)MEMORY[0x263F337C8];
          v25 = [v17 objectForKey:@"description"];
          v26 = [v24 itemWithObject:v19 named:v25 attributionSet:v12];
          [v23 addItem:v26];
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v14);
  }

  [*(id *)(a1 + 32) finishRunningWithError:v5];
}

@end