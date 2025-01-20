@interface WFNotificationAction
- (id)actionAlert;
- (id)contentDestinationWithError:(id *)a3;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getNotificationAttachmentsWithInput:(id)a3 completionHandler:(id)a4;
- (void)runWithUserNotificationCenterInput:(id)a3;
@end

@implementation WFNotificationAction

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to display %2$@ in a notification?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to display notifications?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x263F337E8], "notificationLocation", a3);
}

- (id)actionAlert
{
  v3 = [(WFNotificationAction *)self parameterValueForKey:@"WFNotificationActionTitle" ofClass:objc_opt_class()];
  v4 = [(WFNotificationAction *)self parameterValueForKey:@"WFNotificationActionBody" ofClass:objc_opt_class()];
  v5 = [[WFNotificationActionAlert alloc] initWithTitle:v3 body:v4];

  return v5;
}

- (void)runWithUserNotificationCenterInput:(id)a3
{
  id v5 = a3;
  if (!objc_opt_class())
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"WFNotificationAction.m" lineNumber:87 description:@"UNUserNotificationCenter is not available"];

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WFNotificationAction.m", 88, @"Invalid parameter not satisfying: %@", @"input" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__WFNotificationAction_runWithUserNotificationCenterInput___block_invoke;
  v8[3] = &unk_264E583F8;
  v8[4] = self;
  [(WFNotificationAction *)self getNotificationAttachmentsWithInput:v5 completionHandler:v8];
}

void __59__WFNotificationAction_runWithUserNotificationCenterInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  [v4 setAttachments:v3];

  id v5 = [*(id *)(a1 + 32) actionAlert];
  [v4 setShouldIgnoreDoNotDisturb:1];
  id v6 = [v5 title];
  [v4 setSubtitle:v6];

  v7 = [v5 body];
  [v4 setBody:v7];

  id v8 = [*(id *)(a1 + 32) parameterValueForKey:@"WFNotificationActionSound" ofClass:objc_opt_class()];
  if ([v8 BOOLValue])
  {
    v9 = [MEMORY[0x263F1DF68] defaultSound];
    [v4 setSound:v9];
  }
  else
  {
    [v4 setSound:0];
  }

  v10 = [*(id *)(a1 + 32) workflow];
  if (v10)
  {
    v11 = [MEMORY[0x263F08C38] UUID];
    uint64_t v12 = [v11 UUIDString];

    v13 = [MEMORY[0x263F339A0] proposedTemporaryFileURLForFilename:v12];
    v14 = [v10 reference];
    v15 = [MEMORY[0x263F85258] currentDevice];
    [v15 screenScale];
    v17 = objc_msgSend(v14, "attributionIconWithSize:scale:rounded:", 0, 38.0, 38.0, v16);

    v18 = [v17 PNGRepresentation];
    [v18 writeToURL:v13 atomically:0];

    v19 = [v10 reference];
    v20 = [v19 attributionTitle];
    [v4 setTitle:v20];

    v21 = (void *)MEMORY[0x263F1DF40];
    v22 = [v13 path];
    v23 = [v21 iconAtPath:v22];
    [v4 setIcon:v23];

    v24 = NSString;
    v25 = [v10 workflowID];
    v26 = [v24 stringWithFormat:@"workflow-identifier:%@", v25];
    [v4 setThreadIdentifier:v26];
  }
  v27 = (void *)MEMORY[0x263F1DF48];
  v28 = [MEMORY[0x263F08C38] UUID];
  v29 = [v28 UUIDString];
  v30 = [v27 requestWithIdentifier:v29 content:v4 trigger:0];

  v31 = [MEMORY[0x263F1DFB0] workflowNotificationCenter];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __59__WFNotificationAction_runWithUserNotificationCenterInput___block_invoke_2;
  v32[3] = &unk_264E5EBC8;
  v32[4] = *(void *)(a1 + 32);
  [v31 addNotificationRequest:v30 withCompletionHandler:v32];
}

uint64_t __59__WFNotificationAction_runWithUserNotificationCenterInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (void)getNotificationAttachmentsWithInput:(id)a3 completionHandler:(id)a4
{
  v25[3] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  id v8 = (void *)MEMORY[0x263F33770];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke;
  v20[3] = &unk_264E5B8E0;
  id v21 = v5;
  id v9 = v5;
  v10 = [v8 requestForCoercingToContentClasses:v7 completionHandler:v20];
  v11 = (void *)MEMORY[0x263EFF9D8];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v11, "orderedSetWithObjects:", v12, v13, objc_opt_class(), 0);
  v15 = (void *)MEMORY[0x263F33768];
  uint64_t v16 = *MEMORY[0x263F33A48];
  v22 = v14;
  uint64_t v23 = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
  v24 = v17;
  v18 = [NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v19 = [v15 optionsWithDictionary:v18];
  [v10 setOptions:v19];

  [v6 performCoercion:v10];
}

void __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 numberOfItems])
  {
    v4 = [v3 items];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke_3;
    v5[3] = &unk_264E5CE88;
    id v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "if_flatMapAsynchronously:completionHandler:", &__block_literal_global_17764, v5);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  if (a2) {
    id v3 = a2;
  }
  else {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = a2;
  v4 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_183);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v13[3] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a4;
  v7 = [v5 preferredFileType];
  if ([v7 conformsToUTType:*MEMORY[0x263F1DB18]])
  {
    uint64_t v8 = *MEMORY[0x263F1DAD0];
    v13[0] = *MEMORY[0x263F1DB40];
    v13[1] = v8;
    v13[2] = *MEMORY[0x263F1DC08];
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
    if (([v7 conformsToUTTypes:v9] & 1) == 0)
    {
      v10 = (void *)MEMORY[0x263F852B8];
      v11 = [v9 firstObject];
      uint64_t v12 = [v10 typeWithUTType:v11];

      v7 = (void *)v12;
    }
  }
  [v5 getFileRepresentations:v6 forType:v7];
}

id __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x263F339A0];
  v4 = [v2 filename];
  id v5 = [v3 proposedTemporaryFileURLForFilename:v4];

  [v2 writeToFileURL:v5 overwriting:0 error:0];
  id v6 = (void *)MEMORY[0x263F1DF20];
  v7 = [MEMORY[0x263F08C38] UUID];
  uint64_t v8 = [v7 UUIDString];
  id v13 = 0;
  id v9 = [v6 attachmentWithIdentifier:v8 URL:v5 options:0 error:&v13];
  id v10 = v13;

  if (!v9)
  {
    NSLog(&cfstr_Wfnotification_2.isa, v2, v10);
    v11 = [MEMORY[0x263F08850] defaultManager];
    [v11 removeItemAtURL:v5 error:0];
  }
  return v9;
}

@end