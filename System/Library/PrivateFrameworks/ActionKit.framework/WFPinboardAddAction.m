@interface WFPinboardAddAction
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFPinboardAddAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to add %2$@ to Pinboard?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to add content to Pinboard?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F339D0], "pinboardLocation", a3);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__WFPinboardAddAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_264E5C0A8;
  v4[4] = self;
  id v3 = a3;
  [v3 getObjectRepresentation:v4 forClass:objc_opt_class()];
}

void __50__WFPinboardAddAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7)
  {
    v9 = objc_alloc_init(WFPinboardSessionManager);
    v10 = +[WFPinboardAccessResource pinboardUsername];
    [(WFPinboardSessionManager *)v9 setUsername:v10];

    v11 = +[WFPinboardAccessResource pinboardPassword];
    [(WFPinboardSessionManager *)v9 setPassword:v11];

    uint64_t v12 = +[WFPinboardAccessResource pinboardToken];
    [(WFPinboardSessionManager *)v9 setApiToken:v12];

    v13 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPinTitle" ofClass:objc_opt_class()];
    if (![v13 length])
    {
      if (v8)
      {
        id v14 = v8;
      }
      else
      {
        id v14 = [v7 absoluteString];
      }
      id v15 = v14;

      v13 = v15;
    }
    v16 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPinTags" ofClass:objc_opt_class()];
    v17 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@" ,"];
    v18 = [v16 componentsSeparatedByCharactersInSet:v17];
    v19 = (void *)[v18 mutableCopy];

    [v19 removeObject:&stru_26F008428];
    v20 = objc_opt_new();
    v21 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPinDescription" ofClass:objc_opt_class()];
    [v20 setValue:v21 forKey:@"extended"];

    v22 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPinPublic" ofClass:objc_opt_class()];
    [v20 setValue:v22 forKey:@"shared"];

    v23 = [*(id *)(a1 + 32) parameterValueForKey:@"WFPinUnread" ofClass:objc_opt_class()];
    [v20 setValue:v23 forKey:@"toread"];

    [v20 setValue:v19 forKey:@"tags"];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __50__WFPinboardAddAction_runAsynchronouslyWithInput___block_invoke_2;
    v24[3] = &unk_264E5BF28;
    v24[4] = *(void *)(a1 + 32);
    [(WFPinboardSessionManager *)v9 addBookmark:v7 withTitle:v13 parameters:v20 completion:v24];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
  }
}

void __50__WFPinboardAddAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  v4 = [v8 domain];
  if ([v4 isEqualToString:@"WFPinboardErrorDomain"])
  {
    uint64_t v5 = [v8 code];

    if (v5 != 1000) {
      goto LABEL_5;
    }
    id v6 = [*(id *)(a1 + 32) resourceManager];
    id v7 = [v6 resourceObjectsOfClass:objc_opt_class()];
    v4 = [v7 anyObject];

    [v4 logOut];
  }

LABEL_5:
  [*(id *)(a1 + 32) finishRunningWithError:v8];
}

@end