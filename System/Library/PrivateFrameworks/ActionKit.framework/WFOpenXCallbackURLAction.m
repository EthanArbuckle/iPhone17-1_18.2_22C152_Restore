@interface WFOpenXCallbackURLAction
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFOpenXCallbackURLAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to send %2$@ to “%3$@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    v11 = WFLocalizedString(@"Allow “%1$@” to open “%2$@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  v12 = };

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOpenXCallbackURLAction *)self input];
  WFGetContentLocationFromURLActionInput();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_264E5C0A8;
  v4[4] = self;
  id v3 = a3;
  [v3 getObjectRepresentation:v4 forClass:objc_opt_class()];
}

void __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = v6;
  if (!v6)
  {
    [*(id *)(a1 + 32) finishRunningWithError:a4];
    goto LABEL_17;
  }
  v8 = [v6 scheme];
  id v9 = [v8 lowercaseString];

  id v10 = [MEMORY[0x263F86828] sharedRegistry];
  v11 = [v10 appWithURLScheme:v9];

  v12 = [v11 schemes];
  v13 = [v12 objectMatchingKey:@"scheme" value:v9];

  uint64_t v14 = [*(id *)(a1 + 32) parameterValueForKey:@"WFXCallbackCustomCallbackEnabled" ofClass:objc_opt_class()];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
    v16 = objc_opt_new();
    [v16 setObject:v9 forKey:*MEMORY[0x263F86818]];
    v41[0] = *MEMORY[0x263F86808];
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
    [v16 setObject:v17 forKey:*MEMORY[0x263F86800]];

    v18 = [*(id *)(a1 + 32) parameterValueForKey:@"WFXCallbackCustomSuccessKey" ofClass:objc_opt_class()];
    v19 = [*(id *)(a1 + 32) parameterValueForKey:@"WFXCallbackCustomCancelKey" ofClass:objc_opt_class()];
    v20 = [*(id *)(a1 + 32) parameterValueForKey:@"WFXCallbackCustomErrorKey" ofClass:objc_opt_class()];
    if ([v18 length]) {
      [v16 setObject:v18 forKey:*MEMORY[0x263F867F8]];
    }
    if ([v19 length]) {
      [v16 setObject:v19 forKey:*MEMORY[0x263F867E8]];
    }
    if ([v20 length]) {
      [v16 setObject:v20 forKey:*MEMORY[0x263F867F0]];
    }
    uint64_t v21 = [objc_alloc(MEMORY[0x263F86838]) initWithDefinition:v16 app:v11];

    goto LABEL_13;
  }
  if (([v13 isCallbackScheme] & 1) == 0)
  {
    uint64_t v22 = *MEMORY[0x263F86818];
    v40[0] = v9;
    uint64_t v23 = *MEMORY[0x263F86800];
    v39[0] = v22;
    v39[1] = v23;
    uint64_t v38 = *MEMORY[0x263F86810];
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
    v40[1] = v24;
    v16 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];

    uint64_t v21 = [objc_alloc(MEMORY[0x263F86838]) initWithDefinition:v16 app:v11];
    v18 = v13;
LABEL_13:

    v13 = (void *)v21;
  }
  v25 = (void *)MEMORY[0x263F87080];
  v26 = [*(id *)(a1 + 32) userInterface];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke_2;
  v36[3] = &unk_264E5DF98;
  uint64_t v37 = *(void *)(a1 + 32);
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke_3;
  v35[3] = &unk_264E5EBC8;
  v35[4] = v37;
  v27 = [v25 requestWithURL:v7 scheme:v13 userInterface:v26 bundleIdentifier:0 successHandler:v36 failureHandler:v35];

  v28 = [*(id *)(a1 + 32) parameterValueForKey:@"WFXCallbackCustomSuccessURLEnabled" ofClass:objc_opt_class()];
  int v29 = [v28 BOOLValue];

  if (v29)
  {
    v30 = NSURL;
    v31 = [*(id *)(a1 + 32) parameterValueForKey:@"WFXCallbackCustomSuccessURL" ofClass:objc_opt_class()];
    v32 = [v30 URLWithString:v31];

    v33 = [v32 query];
    [v27 setSuccessURLQueryString:v33];
  }
  v34 = [MEMORY[0x263F86830] sharedManager];
  [v34 performRequest:v27];

LABEL_17:
}

void __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v11 = v5;
  if (a3)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [MEMORY[0x263F087E8] userCancelledError];
    [v6 finishRunningWithError:v7];

    goto LABEL_9;
  }
  if ((unint64_t)[v5 count] >= 2)
  {
    v8 = [*(id *)(a1 + 32) output];
    [v8 addObject:v11];
LABEL_7:

    goto LABEL_8;
  }
  if ([v11 count] == 1)
  {
    v8 = [*(id *)(a1 + 32) output];
    id v9 = [v11 allValues];
    id v10 = [v9 lastObject];
    [v8 addObject:v10];

    goto LABEL_7;
  }
LABEL_8:
  [*(id *)(a1 + 32) finishRunningWithError:0];
LABEL_9:
}

uint64_t __55__WFOpenXCallbackURLAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

@end