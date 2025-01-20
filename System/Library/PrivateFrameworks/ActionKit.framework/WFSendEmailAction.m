@interface WFSendEmailAction
+ (id)userInterfaceProtocol;
- (BOOL)checkManagementLevel:(id)a3 error:(id *)a4;
- (BOOL)isContentManaged;
- (BOOL)parameterCombinationForIntentSupportsBackgroundExecution:(id)a3;
- (BOOL)populatesInputFromInputParameter;
- (BOOL)requiresRemoteExecution;
- (id)contentDestinationWithError:(id *)a3;
- (id)prioritizedParameterKeysForRemoteExecution;
- (id)requiredResourcesForIntentAvailableResource;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)showsWhenRunIfApplicable;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)generateBodyFromCollection:(id)a3 completionHandler:(id)a4;
- (void)generateEmailFromInput:(id)a3 completionHandler:(id)a4;
- (void)generateFilesFromCollection:(id)a3 completion:(id)a4;
- (void)getRecipientsFromParameterValue:(id)a3 completion:(id)a4;
- (void)prepareEmailContentFromInput:(id)a3 completionHandler:(id)a4;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
- (void)setContentManaged:(BOOL)a3;
@end

@implementation WFSendEmailAction

- (void)setContentManaged:(BOOL)a3
{
  self->_contentManaged = a3;
}

- (BOOL)isContentManaged
{
  return self->_contentManaged;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  v7 = NSString;
  id v8 = a5;
  if (v6)
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to send %2$@ in an email?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    v9 = WFLocalizedString(@"Allow “%1$@” to send an email?");
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  v10 = };

  return v10;
}

- (id)contentDestinationWithError:(id *)a3
{
  v4 = [(WFSendEmailAction *)self parameterValueForKey:@"WFSendEmailActionShowComposeSheet" ofClass:objc_opt_class()];
  int v5 = [v4 BOOLValue];

  id v6 = [(WFSendEmailAction *)self parameterValueForKey:@"WFEmailAccountActionSelectedAccount" ofClass:objc_opt_class()];
  v7 = [v6 string];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  id v8 = (void *)getMFMailAccountProxyGeneratorClass_softClass;
  uint64_t v24 = getMFMailAccountProxyGeneratorClass_softClass;
  if (!getMFMailAccountProxyGeneratorClass_softClass)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __getMFMailAccountProxyGeneratorClass_block_invoke;
    v20[3] = &unk_264E5EC88;
    v20[4] = &v21;
    __getMFMailAccountProxyGeneratorClass_block_invoke((uint64_t)v20);
    id v8 = (void *)v22[3];
  }
  v9 = v8;
  _Block_object_dispose(&v21, 8);
  v10 = (void *)[[v9 alloc] initWithAllowsRestrictedAccounts:0];
  v11 = [v10 accountProxyContainingEmailAddress:v7 includingInactive:0];
  uint64_t v12 = [v11 uniqueID];
  uint64_t v13 = v5 ^ 1u;
  id v14 = objc_alloc(MEMORY[0x263F0F988]);
  v15 = (void *)[v14 initWithBundleIdentifier:*MEMORY[0x263F85510]];
  v16 = [MEMORY[0x263F0F9B0] sharedResolver];
  v17 = [v16 resolvedAppMatchingDescriptor:v15];

  if (v12) {
    [MEMORY[0x263F336E0] locationWithAccountIdentifier:v12 appDescriptor:v17 promptingBehaviour:v13];
  }
  else {
  v18 = [MEMORY[0x263F33708] locationWithAppDescriptor:v17 promptingBehaviour:v13];
  }

  return v18;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WFSendEmailAction;
  v4 = [(WFHandleCustomIntentAction *)&v7 serializedParametersForDonatedIntent:a3 allowDroppingUnconfigurableValues:a4];
  int v5 = (void *)[v4 mutableCopy];
  [v5 setObject:MEMORY[0x263EFFA80] forKey:@"WFSendEmailActionShowComposeSheet"];

  return v5;
}

- (void)generateEmailFromInput:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = (void (**)(void, void, void))v6;
  if (v6)
  {
    if (v5)
    {
      id v13 = 0;
      id v8 = [v5 collectionByFilteringItemsWithBlock:&__block_literal_global_629 excludedItems:&v13];
      id v9 = v13;
      if (![v9 numberOfItems])
      {
        v10 = [v8 collectionByFilteringToItemClass:objc_opt_class() excludedItems:0];
        if ([v10 numberOfItems])
        {
          v11 = [v10 items];
          uint64_t v12 = [v11 firstObject];

          [v9 addItem:v12];
          [v8 removeItem:v12];
        }
      }
      ((void (**)(void, id, void *))v7)[2](v7, v9, v8);
    }
    else
    {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
  }
}

uint64_t __62__WFSendEmailAction_generateEmailFromInput_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    char v3 = 0;
  }

  return v3 & 1;
}

- (void)generateFilesFromCollection:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 numberOfItems])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__WFSendEmailAction_generateFilesFromCollection_completion___block_invoke;
    v7[3] = &unk_264E5CE88;
    id v8 = v6;
    [v5 getFileRepresentations:v7 forType:0];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, MEMORY[0x263EFFA68]);
  }
}

void __60__WFSendEmailAction_generateFilesFromCollection_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 count])
  {
    char v3 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_625);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id __60__WFSendEmailAction_generateFilesFromCollection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 representationType] == 1)
  {
    char v3 = (void *)MEMORY[0x263F0FAF8];
    id v4 = [v2 fileURL];
    id v5 = [v2 filename];
    id v6 = [v2 wfType];
    objc_super v7 = [v6 string];
    uint64_t v8 = [v3 fileWithFileURL:v4 filename:v5 typeIdentifier:v7];
  }
  else
  {
    if ([v2 representationType])
    {
      id v9 = 0;
      goto LABEL_7;
    }
    v10 = (void *)MEMORY[0x263F0FAF8];
    id v4 = [v2 data];
    id v5 = [v2 filename];
    id v6 = [v2 wfType];
    objc_super v7 = [v6 string];
    uint64_t v8 = [v10 fileWithData:v4 filename:v5 typeIdentifier:v7];
  }
  id v9 = (void *)v8;

LABEL_7:
  return v9;
}

- (void)getRecipientsFromParameterValue:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __64__WFSendEmailAction_getRecipientsFromParameterValue_completion___block_invoke;
    v7[3] = &unk_264E5BC40;
    id v8 = v5;
    [a3 getRecipientsWithPermissionRequestor:0 completionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, MEMORY[0x263EFFA68], 0);
  }
}

uint64_t __64__WFSendEmailAction_getRecipientsFromParameterValue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void *, void))a7;
  v17 = objc_msgSend(v12, "wf_slotName");
  if ([v17 isEqualToString:@"to"]) {
    goto LABEL_4;
  }
  v18 = objc_msgSend(v12, "wf_slotName");
  if (![v18 isEqualToString:@"cc"])
  {
    v19 = objc_msgSend(v12, "wf_slotName");
    char v20 = [v19 isEqualToString:@"bcc"];

    if (v20) {
      goto LABEL_5;
    }
    uint64_t v21 = objc_msgSend(v12, "wf_slotName");
    int v22 = [v21 isEqualToString:@"body"];

    if (v22)
    {
      uint64_t v23 = [(WFSendEmailAction *)self parameterValueForKey:@"WFSendEmailActionBodyOverride" ofClass:objc_opt_class()];
      if (v23)
      {
        v16[2](v16, v23, 0);
      }
      else
      {
        v31 = [(WFSendEmailAction *)self input];
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
        v36[3] = &unk_264E5ACE0;
        v36[4] = self;
        v37 = v16;
        [(WFSendEmailAction *)self generateEmailFromInput:v31 completionHandler:v36];
      }
      goto LABEL_20;
    }
    uint64_t v24 = objc_msgSend(v12, "wf_slotName");
    int v25 = [v24 isEqualToString:@"attachments"];

    if (v25)
    {
      v26 = [(WFSendEmailAction *)self input];
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3;
      v34[3] = &unk_264E5ACE0;
      v34[4] = self;
      v35 = v16;
      [(WFSendEmailAction *)self generateEmailFromInput:v26 completionHandler:v34];

      goto LABEL_6;
    }
    v27 = objc_msgSend(v12, "wf_slotName");
    int v28 = [v27 isEqualToString:@"subject"];

    if (!v28)
    {
      -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v32, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16, self, WFSendEmailAction, v33.receiver, v33.super_class);
      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v29 = v13;
      uint64_t v23 = v29;
      if (!v29)
      {
        v16[2](v16, &stru_26F008428, 0);
        goto LABEL_20;
      }
      if (objc_msgSend(v29, "wf_stringContainsNewlineCharacters"))
      {
        v30 = objc_msgSend(v23, "wf_stringByReplacingNewlinesWithSpaces");
        v16[2](v16, v30, 0);

LABEL_20:
        goto LABEL_6;
      }
    }
    -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v33, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16, v32.receiver, v32.super_class, self, WFSendEmailAction);
    goto LABEL_6;
  }

LABEL_4:
LABEL_5:
  [(WFSendEmailAction *)self getRecipientsFromParameterValue:v13 completion:v16];
LABEL_6:
}

void __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2;
  v4[3] = &unk_264E5ACB8;
  char v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 generateBodyFromCollection:a2 completionHandler:v4];
}

void __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_4;
  v5[3] = &unk_264E5E5B8;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 generateFilesFromCollection:a3 completion:v5];
}

uint64_t __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  id v6 = v5;
  if ((a3 & 1) == 0)
  {
    id v9 = v5;
    objc_super v7 = objc_msgSend(v5, "gtm_stringByEscapingForHTML");
    uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:@"<br/>"];

    id v6 = (id)v8;
  }
  id v10 = v6;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)requiresRemoteExecution
{
  v3.receiver = self;
  v3.super_class = (Class)WFSendEmailAction;
  return [(WFHandleIntentAction *)&v3 requiresRemoteExecution];
}

- (id)prioritizedParameterKeysForRemoteExecution
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"WFSendEmailActionShowComposeSheet";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)showsWhenRunIfApplicable
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFSendEmailAction *)self parameterValueForKey:@"WFSendEmailActionShowComposeSheet" ofClass:v3];
}

- (BOOL)parameterCombinationForIntentSupportsBackgroundExecution:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSendEmailAction *)self userInterface];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(WFSendEmailAction *)self userInterface];
    char v7 = [v6 requestedFromAnotherDevice];
  }
  else
  {
    char v7 = 0;
  }

  uint64_t v8 = [(WFSendEmailAction *)self runningDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(WFSendEmailAction *)self runningDelegate];
    v11 = [v10 currentRunningContextForAction:self];

    id v12 = [v11 workflowIdentifier];

    if (v12) {
      char v13 = 1;
    }
    else {
      char v13 = v7;
    }
    if (v13) {
      goto LABEL_9;
    }
LABEL_11:
    v16.receiver = self;
    v16.super_class = (Class)WFSendEmailAction;
    BOOL v14 = [(WFHandleIntentAction *)&v16 parameterCombinationForIntentSupportsBackgroundExecution:v4];
    goto LABEL_12;
  }
  if ((v7 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFSendEmailAction *)self parameterValueForKey:@"WFSendEmailActionFrom" ofClass:objc_opt_class()];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__WFSendEmailAction_runWithRemoteUserInterface_input___block_invoke;
  v11[3] = &unk_264E5AC90;
  id v12 = v6;
  id v13 = v8;
  BOOL v14 = self;
  id v9 = v8;
  id v10 = v6;
  [(WFSendEmailAction *)self prepareEmailContentFromInput:v7 completionHandler:v11];
}

void __54__WFSendEmailAction_runWithRemoteUserInterface_input___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = (void *)a1[6];
  id v6 = a2;
  uint64_t v7 = [v5 isContentManaged];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__WFSendEmailAction_runWithRemoteUserInterface_input___block_invoke_2;
  v8[3] = &unk_264E5BCF8;
  v8[4] = a1[6];
  [v3 showWithEmailContent:v6 preferredSendingEmailAddress:v4 isManaged:v7 completionHandler:v8];
}

uint64_t __54__WFSendEmailAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSendEmailAction *)self parameterValueForKey:@"WFSendEmailActionShowComposeSheet" ofClass:objc_opt_class()];
  int v6 = [v5 BOOLValue];

  id v12 = 0;
  BOOL v7 = [(WFSendEmailAction *)self checkManagementLevel:v4 error:&v12];
  id v8 = v12;
  if (v7)
  {
    if (v6)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __48__WFSendEmailAction_runAsynchronouslyWithInput___block_invoke;
      v10[3] = &unk_264E5AC68;
      v10[4] = self;
      id v11 = v4;
      [(WFSendEmailAction *)self requestInterfacePresentationWithCompletionHandler:v10];
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)WFSendEmailAction;
      [(WFHandleIntentAction *)&v9 runAsynchronouslyWithInput:v4];
    }
  }
  else
  {
    [(WFHandleIntentAction *)self finishRunningWithError:v8];
  }
}

uint64_t __48__WFSendEmailAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v4, "finishRunningWithError:");
  }
  else {
    return [v4 runWithRemoteUserInterface:a2 input:*(void *)(a1 + 40)];
  }
}

- (void)generateBodyFromCollection:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if ([v5 numberOfItems] != 1) {
      goto LABEL_5;
    }
    BOOL v7 = [v5 items];
    id v8 = [v7 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __66__WFSendEmailAction_generateBodyFromCollection_completionHandler___block_invoke;
      v14[3] = &unk_264E5DBC8;
      id v15 = v6;
      id v10 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
      [v5 getFileRepresentation:v14 forType:v10];

      id v11 = v15;
    }
    else
    {
LABEL_5:
      if (![v5 numberOfItems])
      {
        (*((void (**)(id, __CFString *, void))v6 + 2))(v6, &stru_26F008428, 0);
        goto LABEL_9;
      }
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __66__WFSendEmailAction_generateBodyFromCollection_completionHandler___block_invoke_2;
      v12[3] = &unk_264E5CE88;
      id v13 = v6;
      [v5 getStringRepresentations:v12];
      id v11 = v13;
    }
  }
LABEL_9:
}

void __66__WFSendEmailAction_generateBodyFromCollection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a2;
  id v5 = [v3 alloc];
  id v7 = [v4 mappedData];

  id v6 = (void *)[v5 initWithData:v7 encoding:4];
  (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v6, 1);
}

void __66__WFSendEmailAction_generateBodyFromCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 componentsJoinedByString:@"\n"];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)checkManagementLevel:(id)a3 error:(id *)a4
{
  v46[5] = *MEMORY[0x263EF8340];
  id v37 = a3;
  uint64_t v40 = 0;
  v39 = [(WFSendEmailAction *)self parameterValueForKey:@"WFSendEmailActionToRecipients" ofClass:objc_opt_class()];
  v38 = [(WFSendEmailAction *)self parameterValueForKey:@"WFSendEmailActionCcRecipients" ofClass:objc_opt_class()];
  id v5 = [(WFSendEmailAction *)self parameterValueForKey:@"WFSendEmailActionBccRecipients" ofClass:objc_opt_class()];
  id v6 = [(WFSendEmailAction *)self parameterValueForKey:@"WFEmailAccountActionSelectedAccount" ofClass:objc_opt_class()];
  id v7 = [v39 attributionSet];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F337A0] attributionSetByMergingAttributionSets:MEMORY[0x263EFFA68]];
  }
  id v10 = v9;

  id v11 = [v38 attributionSet];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x263F337A0] attributionSetByMergingAttributionSets:MEMORY[0x263EFFA68]];
  }
  BOOL v14 = v13;

  id v15 = [v5 attributionSet];
  objc_super v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [MEMORY[0x263F337A0] attributionSetByMergingAttributionSets:MEMORY[0x263EFFA68]];
  }
  v18 = v17;

  v19 = [v6 attributionSet];
  char v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [MEMORY[0x263F337A0] attributionSetByMergingAttributionSets:MEMORY[0x263EFFA68]];
  }
  int v22 = v21;

  uint64_t v23 = (void *)MEMORY[0x263F337A0];
  uint64_t v24 = [v37 attributionSet];
  v46[0] = v24;
  v46[1] = v10;
  v46[2] = v14;
  v46[3] = v18;
  v46[4] = v22;
  int v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:5];
  v26 = [v23 attributionSetByMergingAttributionSets:v25];

  if ([v26 isEligibleToShareWithResultManagedLevel:&v40])
  {
    [(WFSendEmailAction *)self setContentManaged:v40 == 2];
    if ([(WFSendEmailAction *)self isContentManaged]) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = 1;
    }
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2050000000;
    int v28 = (void *)getMFMailComposeViewControllerClass_softClass;
    uint64_t v45 = getMFMailComposeViewControllerClass_softClass;
    if (!getMFMailComposeViewControllerClass_softClass)
    {
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __getMFMailComposeViewControllerClass_block_invoke;
      v41[3] = &unk_264E5EC88;
      v41[4] = &v42;
      __getMFMailComposeViewControllerClass_block_invoke((uint64_t)v41);
      int v28 = (void *)v43[3];
    }
    id v29 = v28;
    _Block_object_dispose(&v42, 8);
    char v30 = [v29 canSendMailSourceAccountManagement:v27];
    BOOL v31 = v30;
    if (a4) {
      char v32 = v30;
    }
    else {
      char v32 = 1;
    }
    if ((v32 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x263F087E8], "wf_mailComposerUnavailableError");
      BOOL v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (a4)
    {
      objc_super v33 = (void *)MEMORY[0x263F087E8];
      v34 = [(WFSendEmailAction *)self localizedName];
      *a4 = [v33 sharingMixedMDMContentErrorWithActionName:v34];
    }
    BOOL v31 = 0;
  }

  return v31;
}

- (void)prepareEmailContentFromInput:(id)a3 completionHandler:(id)a4
{
  v25[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    char v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFSendEmailAction.m", 87, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v25[0] = @"WFSendEmailActionToRecipients";
  v25[1] = @"WFSendEmailActionCcRecipients";
  v25[2] = @"WFSendEmailActionBccRecipients";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke;
  v24[3] = &unk_264E5ABC8;
  v24[4] = self;
  id v10 = objc_msgSend(v9, "if_map:", v24);

  id v11 = objc_alloc_init(WFSendEmailContent);
  id v12 = [v10 objectAtIndexedSubscript:0];
  [(WFSendEmailContent *)v11 setToRecipients:v12];

  id v13 = [v10 objectAtIndexedSubscript:1];
  [(WFSendEmailContent *)v11 setCcRecipients:v13];

  BOOL v14 = [v10 objectAtIndexedSubscript:2];
  [(WFSendEmailContent *)v11 setBccRecipients:v14];

  uint64_t v15 = [(WFSendEmailAction *)self parameterValueForKey:@"WFSendEmailActionSubject" ofClass:objc_opt_class()];
  objc_super v16 = (void *)v15;
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  else {
    id v17 = &stru_26F008428;
  }
  [(WFSendEmailContent *)v11 setSubject:v17];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_3;
  v21[3] = &unk_264E5AC40;
  v21[4] = self;
  int v22 = v11;
  id v23 = v8;
  id v18 = v8;
  v19 = v11;
  [(WFSendEmailAction *)self generateEmailFromInput:v7 completionHandler:v21];
}

id __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 parameterValueForKey:v3 ofClass:objc_opt_class()];

  if (v4)
  {
    id v5 = [v4 entries];
    id v6 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_37536);
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

void __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_4;
  v8[3] = &unk_264E5AC18;
  id v9 = v5;
  id v6 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v7 = v5;
  [v6 generateBodyFromCollection:a2 completionHandler:v8];
}

void __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_4(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_5;
  v8[3] = &unk_264E5ABF0;
  id v6 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  char v12 = a3;
  id v11 = *(id *)(a1 + 48);
  id v7 = v5;
  [v6 getFileRepresentations:v8 forType:0];
}

uint64_t __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a2;
  [v4 setBody:v3];
  [*(id *)(a1 + 32) setIsHTML:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(a1 + 32) setAttachments:v5];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v6();
}

WFSendRecipient *__68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 type];
  if (v3 == 2)
  {
    id v13 = [WFSendRecipient alloc];
    id v5 = [v2 emailAddress];
    id v6 = [v5 address];
    id v7 = [v2 emailAddress];
    id v8 = [v7 address];
    char v12 = [(WFSendRecipient *)v13 initWithName:v6 address:v8];
    goto LABEL_5;
  }
  if (!v3)
  {
    id v4 = [WFSendRecipient alloc];
    id v5 = [v2 contact];
    id v6 = [v5 formattedName];
    id v7 = [v2 contact];
    id v8 = [v7 emailAddresses];
    id v9 = [v8 firstObject];
    id v10 = [v9 value];
    id v11 = [v10 address];
    char v12 = [(WFSendRecipient *)v4 initWithName:v6 address:v11];

LABEL_5:
    goto LABEL_7;
  }
  char v12 = 0;
LABEL_7:

  return v12;
}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (id)requiredResourcesForIntentAvailableResource
{
  v10[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F86D78]);
  uint64_t v3 = *MEMORY[0x263F873A8];
  v8[0] = *MEMORY[0x263F873A0];
  v8[1] = v3;
  v9[0] = @"WFSendEmailActionShowComposeSheet";
  v9[1] = MEMORY[0x263EFFA80];
  id v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v5 = (void *)[v2 initWithDefinition:v4];
  v10[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

  return v6;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E2088;
}

@end