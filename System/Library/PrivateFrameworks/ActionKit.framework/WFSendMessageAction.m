@interface WFSendMessageAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
- (BOOL)canSendAttachmentsWithIntentHandler:(id)a3 runningInSiri:(BOOL)a4 showWhenRun:(BOOL)a5;
- (BOOL)isMessagesAppSelected;
- (BOOL)isPhotoOrVideo:(id)a3;
- (BOOL)opensInApp;
- (BOOL)requiresPrivateOutputLogging;
- (BOOL)shouldForceHandleInSiri:(id)a3;
- (BOOL)skipsProcessingHiddenParameters;
- (id)actionForAppIdentifier:(id)a3;
- (id)contentDestinationWithError:(id *)a3;
- (id)generatedResourceNodes;
- (id)localizedKeyParameterDisplayName;
- (id)minimumSupportedClientVersion;
- (id)recipientsParameter;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)getContentFromInput:(id)a3 completionHandler:(id)a4;
- (void)getINMessageAttachmentsFromInput:(id)a3 completionHandler:(id)a4;
- (void)getRecipients:(id)a3;
- (void)initializeParameters;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
- (void)selectedAppDidChange;
@end

@implementation WFSendMessageAction

+ (id)userInterfaceXPCInterface
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WFSendMessageAction;
  v2 = objc_msgSendSuper2(&v8, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_showWithRecipients_content_attachments_completionHandler_ argumentIndex:0 ofReply:0];

  v6 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v2 setClasses:v6 forSelector:sel_showWithRecipients_content_attachments_completionHandler_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E25B8;
}

- (BOOL)requiresPrivateOutputLogging
{
  return 1;
}

- (BOOL)isPhotoOrVideo:(id)a3
{
  v3 = [a3 preferredFileType];
  if ([v3 conformsToUTType:*MEMORY[0x263F1DB18]])
  {
    char v4 = 1;
  }
  else
  {
    v5 = [MEMORY[0x263F336D8] ownedTypes];
    char v4 = [v3 conformsToTypes:v5];
  }
  return v4;
}

- (BOOL)shouldForceHandleInSiri:(id)a3
{
  id v4 = a3;
  v5 = [v4 recipients];
  if ([v5 count])
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [v4 speakableGroupName];
    if (v7)
    {
      BOOL v6 = 1;
    }
    else
    {
      objc_super v8 = [v4 conversationIdentifier];
      BOOL v6 = v8 != 0;
    }
  }

  v9 = [v4 content];
  if ([v9 length])
  {
    BOOL v10 = 0;
  }
  else
  {
    v11 = [v4 attachments];
    BOOL v10 = [v11 count] == 0;
  }
  BOOL v12 = [(WFHandleIntentAction *)self showsWhenRun] || v10 || !v6;

  return v12;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(WFSendMessageAction *)self isMessagesAppSelected];
  if (v8)
  {
    if (!v11)
    {
      BOOL v12 = [(WFHandleSystemIntentAction *)self localizedAppName];

      if (v12)
      {
        v13 = NSString;
        v14 = WFLocalizedString(@"Allow “%1$@” to send %2$@ in a %3$@ message?");
        v15 = [(WFHandleSystemIntentAction *)self localizedAppName];
        objc_msgSend(v13, "localizedStringWithFormat:", v14, v10, v8, v15);
        v19 = LABEL_9:;

        goto LABEL_12;
      }
    }
    v16 = NSString;
    v14 = WFLocalizedString(@"Allow “%1$@” to send %2$@ in a message?");
    objc_msgSend(v16, "localizedStringWithFormat:", v14, v10, v8);
  }
  else
  {
    if (!v11)
    {
      v17 = [(WFHandleSystemIntentAction *)self localizedAppName];

      if (v17)
      {
        v18 = NSString;
        v14 = WFLocalizedString(@"Allow “%1$@” to send a %2$@ message?");
        v15 = [(WFHandleSystemIntentAction *)self localizedAppName];
        objc_msgSend(v18, "localizedStringWithFormat:", v14, v10, v15, v23);
        goto LABEL_9;
      }
    }
    v20 = NSString;
    v14 = WFLocalizedString(@"Allow “%1$@” to send a message?");
    objc_msgSend(v20, "localizedStringWithFormat:", v14, v10, v22);
  v19 = };
LABEL_12:

  return v19;
}

- (id)contentDestinationWithError:(id *)a3
{
  uint64_t v4 = [(WFHandleIntentAction *)self showsWhenRun] ^ 1;
  v5 = (void *)MEMORY[0x263F33708];
  BOOL v6 = [(WFHandleSystemIntentAction *)self intentDescriptor];
  v7 = [v6 appDescriptor];
  id v8 = [v5 locationWithAppDescriptor:v7 promptingBehaviour:v4];

  return v8;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    goto LABEL_24;
  }
  id v6 = v5;
  v7 = (void *)[objc_alloc(MEMORY[0x263F0FBB8]) initWithIntent:v6];
  id v8 = [MEMORY[0x263F0F9B0] sharedResolver];
  id v9 = [v8 resolvedIntentMatchingDescriptor:v7];

  id v10 = [v9 displayableBundleIdentifier];
  BOOL v11 = (void *)*MEMORY[0x263F85520];
  id v12 = v10;
  id v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_12;
  }
  v14 = v13;
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {

LABEL_14:
    goto LABEL_15;
  }
  char v17 = [v12 isEqualToString:v13];

  if ((v17 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  v18 = [v6 speakableGroupName];

  if (!v18)
  {
LABEL_15:
    v45 = v7;
    v19 = [v6 _codableDescription];
    v20 = [v19 attributeByName:@"recipients"];
    v21 = [(WFSendMessageAction *)self parameterForKey:@"WFSendMessageActionRecipients"];
    uint64_t v22 = [v6 recipients];
    v42 = v21;
    uint64_t v23 = [v21 definition];
    v43 = v20;
    v24 = objc_msgSend(v20, "wf_parameterStateForIntentValue:parameterDefinition:", v22, v23);
    v25 = [v24 serializedRepresentation];

    v44 = v19;
    v26 = [v19 attributeByName:@"content"];
    v27 = [(WFSendMessageAction *)self parameterForKey:@"WFSendMessageContent"];
    v28 = [v6 content];
    v29 = [v27 definition];
    v41 = v26;
    v30 = objc_msgSend(v26, "wf_parameterStateForIntentValue:parameterDefinition:", v28, v29);
    v31 = [v30 serializedRepresentation];

    id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v16 = v32;
    if (v25) {
      [v32 setObject:v25 forKeyedSubscript:@"WFSendMessageActionRecipients"];
    }
    if (v31) {
      [v16 setObject:v31 forKeyedSubscript:@"WFSendMessageContent"];
    }
    v33 = [v9 bundleIdentifier];

    if (v33)
    {
      v34 = [v9 serializedRepresentation];
      [v16 setObject:v34 forKeyedSubscript:*MEMORY[0x263F87200]];
    }
    else
    {
      v35 = [(WFHandleSystemIntentAction *)self supportedIdentifiers];
      v36 = [v35 allObjects];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __94__WFSendMessageAction_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues___block_invoke;
      v46[3] = &unk_264E5BD70;
      id v47 = v6;
      id v48 = v9;
      v37 = objc_msgSend(v36, "if_compactMap:", v46);

      v38 = [v37 firstObject];
      v39 = [v38 serializedRepresentation];
      [v16 setObject:v39 forKeyedSubscript:*MEMORY[0x263F87200]];
    }
    v7 = v45;
    goto LABEL_23;
  }
  v16 = 0;
LABEL_23:

LABEL_24:
  return v16;
}

id __94__WFSendMessageAction_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F0FBB8];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  id v8 = (void *)[v5 initWithIntentClassName:v7 launchableAppBundleId:v4];

  id v9 = [MEMORY[0x263F0F9B0] sharedResolver];
  id v10 = [v9 resolvedIntentMatchingDescriptor:v8];

  BOOL v11 = [v10 displayableBundleIdentifier];
  id v12 = [*(id *)(a1 + 40) displayableBundleIdentifier];
  LODWORD(v7) = [v11 isEqualToString:v12];

  if (v7) {
    id v13 = v10;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (id)actionForAppIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v18 = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v18];
  id v6 = v18;
  if (v5)
  {
    v7 = [MEMORY[0x263F0F998] appInfoWithApplicationRecord:v5];
    id v8 = [MEMORY[0x263EFF9C0] set];
    id v9 = [v7 supportedIntentsByApp];
    [v8 unionSet:v9];

    if (objc_opt_respondsToSelector())
    {
      id v10 = [v7 supportedIntentsGroupedByExtensionPoints];
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __WFIntentsSupportedExcludingShareExtensions_block_invoke;
      v20 = &unk_264E5BD98;
      id v21 = v8;
      [v10 enumerateKeysAndObjectsUsingBlock:buf];

      BOOL v11 = v21;
    }
    else
    {
      BOOL v11 = [v7 supportedActionsByExtensions];
      [v8 unionSet:v11];
    }

    v14 = (void *)[v8 copy];
    if ([v14 containsObject:@"INSendMessageIntent"])
    {
      v16.receiver = self;
      v16.super_class = (Class)WFSendMessageAction;
      id v13 = [(WFHandleSystemIntentAction *)&v16 actionForAppIdentifier:v4];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v12 = getWFActionsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[WFSendMessageAction actionForAppIdentifier:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2112;
      v20 = v6;
      _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_FAULT, "%s Trying to determine if %@ supports INSendMessageIntent, but couldn't find application record: %@", buf, 0x20u);
    }

    v17.receiver = self;
    v17.super_class = (Class)WFSendMessageAction;
    id v13 = [(WFHandleSystemIntentAction *)&v17 actionForAppIdentifier:v4];
  }

  return v13;
}

- (void)selectedAppDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)WFSendMessageAction;
  [(WFHandleSystemIntentAction *)&v5 selectedAppDidChange];
  uint64_t v3 = [(WFSendMessageAction *)self isMessagesAppSelected] ^ 1;
  id v4 = [(WFSendMessageAction *)self recipientsParameter];
  [v4 setAllowsCustomHandles:v3];
}

- (void)initializeParameters
{
  v5.receiver = self;
  v5.super_class = (Class)WFSendMessageAction;
  [(WFHandleSystemIntentAction *)&v5 initializeParameters];
  uint64_t v3 = [(WFSendMessageAction *)self isMessagesAppSelected] ^ 1;
  id v4 = [(WFSendMessageAction *)self recipientsParameter];
  [v4 setAllowsCustomHandles:v3];
}

- (id)recipientsParameter
{
  return (id)[(WFSendMessageAction *)self parameterForKey:@"WFSendMessageActionRecipients"];
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke;
  v10[3] = &unk_264E5C1F0;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(WFSendMessageAction *)self getRecipients:v10];
}

void __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_2;
  v7[3] = &unk_264E5BD48;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v6 = v3;
  [v4 getContentFromInput:v5 completionHandler:v7];
}

void __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x263F33770];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_3;
  v20 = &unk_264E5BD20;
  id v8 = *(void **)(a1 + 40);
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = v8;
  id v23 = *(id *)(a1 + 48);
  id v9 = v5;
  id v24 = v9;
  id v10 = [v7 requestForCoercingToFileType:0 completionHandler:&v17];
  id v11 = WFLivePhotoFileType();
  if (v11)
  {
    id v12 = objc_msgSend(MEMORY[0x263F852B8], "typeWithUTType:", v11, v17, v18, v19, v20, v21, v22, v23);
    v27[0] = v12;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];

    v14 = (void *)MEMORY[0x263F33768];
    uint64_t v25 = *MEMORY[0x263F33A68];
    v26 = v13;
    BOOL v15 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    objc_super v16 = [v14 optionsWithDictionary:v15];
    [v10 setOptions:v16];
  }
  objc_msgSend(v6, "performCoercion:", v10, v17, v18, v19, v20, v21);
}

void __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6) {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
  if ([v5 count])
  {
    id v7 = objc_msgSend(MEMORY[0x263F08910], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v5, 1);
  }
  else
  {
    id v7 = 0;
  }
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_4;
  v11[3] = &unk_264E5BCF8;
  v11[4] = *(void *)(a1 + 32);
  [v8 showWithRecipients:v9 content:v10 attachments:v7 completionHandler:v11];
}

uint64_t __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  if ([(WFSendMessageAction *)self isMessagesAppSelected])
  {
    BOOL v5 = [(WFHandleIntentAction *)self showsWhenRun];
    id v6 = [(WFSendMessageAction *)self userInterface];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke;
    v8[3] = &unk_264E5BCD0;
    BOOL v12 = v5;
    id v9 = v6;
    uint64_t v10 = self;
    id v11 = v4;
    id v7 = v6;
    [(WFSendMessageAction *)self getContentFromInput:v11 completionHandler:v8];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFSendMessageAction;
    [(WFHandleIntentAction *)&v13 runAsynchronouslyWithInput:v4];
  }
}

void __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  uint64_t v6 = [v4 isRunningWithSiriUI];
  LODWORD(v4) = *(unsigned __int8 *)(a1 + 56);
  int v7 = [*(id *)(a1 + 40) canSendAttachmentsWithIntentHandler:v5 runningInSiri:v6 showWhenRun:*(unsigned __int8 *)(a1 + 56)];

  char v8 = v6 ^ 1;
  if (!v4) {
    char v8 = 0;
  }
  id v9 = *(void **)(a1 + 40);
  if ((v8 & 1) != 0 || !v7)
  {
    if (v6)
    {
      id v11 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
      [v9 finishRunningWithError:v11];
    }
    else
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke_2;
      v12[3] = &unk_264E5C218;
      v12[4] = v9;
      id v13 = *(id *)(a1 + 48);
      [v9 requestUnlock:v12];
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 48);
    v14.receiver = *(id *)(a1 + 40);
    v14.super_class = (Class)WFSendMessageAction;
    objc_msgSendSuper2(&v14, sel_runAsynchronouslyWithInput_, v10);
  }
}

void __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke_3;
    v4[3] = &unk_264E5BCA8;
    v4[4] = v2;
    id v5 = *(id *)(a1 + 40);
    [v2 requestInterfacePresentationWithCompletionHandler:v4];
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) deviceLockedError];
    [v2 finishRunningWithError:v3];
  }
}

uint64_t __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 runWithRemoteUserInterface:a2 input:*(void *)(a1 + 40)];
  }
  else {
    return objc_msgSend(v3, "finishRunningWithError:");
  }
}

- (BOOL)canSendAttachmentsWithIntentHandler:(id)a3 runningInSiri:(BOOL)a4 showWhenRun:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 numberOfItems];
  if (!v9) {
    goto LABEL_6;
  }
  if (v9 != 1)
  {
    LOBYTE(v12) = 0;
    goto LABEL_8;
  }
  if (!v6
    || !v5
    || ([v8 items],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [v10 firstObject],
        id v11 = objc_claimAutoreleasedReturnValue(),
        BOOL v12 = [(WFSendMessageAction *)self isPhotoOrVideo:v11],
        v11,
        v10,
        v12))
  {
LABEL_6:
    LOBYTE(v12) = 1;
  }
LABEL_8:

  return v12;
}

- (void)getContentFromInput:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, id, id))a4;
  uint64_t v8 = [(WFSendMessageAction *)self parameterValueForKey:@"WFSendMessagePrefix" ofClass:objc_opt_class()];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = &stru_26F008428;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  id v11 = v10;

  BOOL v12 = [(WFSendMessageAction *)self parameterValueForKey:@"WFSendMessageContent" ofClass:objc_opt_class()];
  if ([v12 length])
  {
    id v13 = [(__CFString *)v11 stringByAppendingString:v12];
    v7[2](v7, v13, v6);
  }
  else
  {
    id v20 = 0;
    objc_super v14 = [v6 collectionByFilteringItemsWithBlock:&__block_literal_global_279 excludedItems:&v20];
    id v13 = v20;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __61__WFSendMessageAction_getContentFromInput_completionHandler___block_invoke_2;
    v16[3] = &unk_264E5E648;
    uint64_t v17 = v11;
    id v18 = v14;
    v19 = v7;
    id v15 = v14;
    [v13 getStringRepresentations:v16];
  }
}

void __61__WFSendMessageAction_getContentFromInput_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = [a2 componentsJoinedByString:@"\n"];
  id v5 = [v3 stringByAppendingString:v4];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __61__WFSendMessageAction_getContentFromInput_completionHandler___block_invoke(uint64_t a1, void *a2)
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

- (void)getINMessageAttachmentsFromInput:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __74__WFSendMessageAction_getINMessageAttachmentsFromInput_completionHandler___block_invoke;
  v8[3] = &unk_264E5BBF8;
  id v9 = v6;
  id v7 = v6;
  [(WFSendMessageAction *)self getContentFromInput:a3 completionHandler:v8];
}

void __74__WFSendMessageAction_getINMessageAttachmentsFromInput_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__WFSendMessageAction_getINMessageAttachmentsFromInput_completionHandler___block_invoke_2;
  v4[3] = &unk_264E5CE88;
  id v5 = *(id *)(a1 + 32);
  [a3 getFileRepresentations:v4 forType:0];
}

void __74__WFSendMessageAction_getINMessageAttachmentsFromInput_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 count])
  {
    id v6 = objc_msgSend(v7, "if_map:", &__block_literal_global_269_42899);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

id __74__WFSendMessageAction_getINMessageAttachmentsFromInput_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F0FAF8];
  id v3 = a2;
  id v4 = [v3 wfName];
  id v5 = objc_msgSend(v2, "wf_fileWithFileRepresentation:displayName:", v3, v4);

  id v6 = [MEMORY[0x263F0FEA0] attachmentWithFile:v5];

  return v6;
}

- (void)getRecipients:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSendMessageAction *)self parameterValueForKey:@"WFSendMessageActionRecipients" ofClass:objc_opt_class()];
  if (v5)
  {
    if ([(WFSendMessageAction *)self isMessagesAppSelected])
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [(WFSendMessageAction *)self contentPermissionRequestor];
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__WFSendMessageAction_getRecipients___block_invoke;
    v7[3] = &unk_264E5BC40;
    id v8 = v4;
    [v5 getRecipientsWithPermissionRequestor:v6 completionHandler:v7];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, MEMORY[0x263EFFA68]);
  }
}

void __37__WFSendMessageAction_getRecipients___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "if_compactMap:", &__block_literal_global_42905);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

WFSendRecipient *__37__WFSendMessageAction_getRecipients___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [WFSendRecipient alloc];
  id v4 = [v2 displayName];
  id v5 = v2;
  id v6 = objc_alloc(MEMORY[0x263EFF980]);
  id v7 = [v5 personHandle];
  id v8 = objc_msgSend(v6, "initWithObjects:", v7, 0);

  id v9 = [v5 aliases];

  if (v9)
  {
    uint64_t v10 = [v5 aliases];
    [v8 addObjectsFromArray:v10];
  }
  id v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"value != nil"];
  v37 = v8;
  BOOL v12 = [v8 filteredArrayUsingPredicate:v11];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    uint64_t v17 = *MEMORY[0x263F0F7F0];
    uint64_t v18 = *MEMORY[0x263F0F7C0];
    id v35 = v5;
    v36 = v4;
    v34 = v3;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        id v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v21 = [v20 label];
        if ([v21 isEqualToString:v17])
        {

LABEL_15:
          v26 = [v20 value];
          uint64_t v25 = v13;
          id v5 = v35;
          id v4 = v36;
          id v3 = v34;
          goto LABEL_16;
        }
        id v22 = [v20 label];
        char v23 = [v22 isEqualToString:v18];

        if (v23) {
          goto LABEL_15;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
      id v5 = v35;
      id v4 = v36;
      id v3 = v34;
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v24 = [v13 objectMatchingKey:@"type" intValue:2];
  if (v24)
  {
    uint64_t v25 = v24;
    v26 = [v24 value];
LABEL_16:
    v27 = v37;
  }
  else
  {
    v30 = [v13 objectMatchingKey:@"type" intValue:1];
    v31 = v30;
    if (v30)
    {
      v26 = [v30 value];
    }
    else
    {
      [v13 firstObject];
      v33 = id v32 = v3;
      v26 = [v33 value];

      id v3 = v32;
    }
    v27 = v37;

    uint64_t v25 = 0;
  }

  v28 = [(WFSendRecipient *)v3 initWithName:v4 address:v26];
  return v28;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = objc_msgSend(v12, "wf_slotName");
  int v18 = [v17 isEqualToString:@"content"];

  if (v18)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __81__WFSendMessageAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v24[3] = &unk_264E5BBF8;
    id v25 = v16;
    [(WFSendMessageAction *)self getContentFromInput:v15 completionHandler:v24];
  }
  else
  {
    v19 = objc_msgSend(v12, "wf_slotName");
    int v20 = [v19 isEqualToString:@"outgoingMessageType"];

    if (v20)
    {
      (*((void (**)(id, void *, void))v16 + 2))(v16, &unk_26F0764A0, 0);
    }
    else
    {
      uint64_t v21 = objc_msgSend(v12, "wf_slotName");
      int v22 = [v21 isEqualToString:@"attachments"];

      if (v22)
      {
        [(WFSendMessageAction *)self getINMessageAttachmentsFromInput:v15 completionHandler:v16];
      }
      else
      {
        v23.receiver = self;
        v23.super_class = (Class)WFSendMessageAction;
        [(WFHandleIntentAction *)&v23 resolveSlot:v12 withProcessedValue:v13 parameter:v14 input:v15 completion:v16];
      }
    }
  }
}

uint64_t __81__WFSendMessageAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(@"Contact");
}

- (id)minimumSupportedClientVersion
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(WFSendMessageAction *)self parameterStateForKey:@"WFSendMessageActionRecipients"];
  [v3 parameterStates];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * v8) contact];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v14.receiver = self;
  v14.super_class = (Class)WFSendMessageAction;
  id v11 = [(WFSendMessageAction *)&v14 minimumSupportedClientVersion];
  id v12 = WFMaximumBundleVersion();

  return v12;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 0;
}

- (BOOL)opensInApp
{
  if ([(WFSendMessageAction *)self isMessagesAppSelected])
  {
    id v3 = [(WFSendMessageAction *)self userInterface];
    char v4 = [v3 isRunningWithSiriUI];

    if (v4)
    {
      return 0;
    }
    else
    {
      return [(WFHandleIntentAction *)self showsWhenRun];
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFSendMessageAction;
    return [(WFHandleIntentAction *)&v6 opensInApp];
  }
}

- (BOOL)isMessagesAppSelected
{
  id v2 = [(WFHandleSystemIntentAction *)self intentDescriptor];
  id v3 = [v2 displayableBundleIdentifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x263F85520]];

  return v4;
}

- (id)generatedResourceNodes
{
  v20[1] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)WFSendMessageAction;
  id v3 = [(WFSendMessageAction *)&v17 generatedResourceNodes];
  char v4 = (void *)[v3 mutableCopy];

  if ([(WFSendMessageAction *)self isMessagesAppSelected])
  {
    uint64_t v5 = [WFMessagesAccessResource alloc];
    uint64_t v19 = *MEMORY[0x263F873F8];
    objc_super v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    v20[0] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v9 = [(WFAccessResource *)v5 initWithDefinition:v8];

    id v10 = objc_alloc(MEMORY[0x263F86D78]);
    id v11 = (void *)[v10 initWithParameterKey:*MEMORY[0x263F87210] parameterValues:&unk_26F076968 relation:*MEMORY[0x263F873B0]];
    id v12 = objc_alloc(MEMORY[0x263F86E30]);
    id v13 = (void *)[objc_alloc(MEMORY[0x263F86E30]) initWithResource:v11];
    long long v18 = v13;
    objc_super v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    long long v15 = (void *)[v12 initWithResource:v9 subnodes:v14];
    [v4 addObject:v15];
  }
  return v4;
}

@end