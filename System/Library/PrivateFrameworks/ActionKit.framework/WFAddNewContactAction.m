@interface WFAddNewContactAction
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
+ (void)contactFromParameters:(id)a3 completionHandler:(id)a4;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithoutUI;
@end

@implementation WFAddNewContactAction

+ (id)userInterfaceXPCInterface
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFAddNewContactAction;
  v2 = objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_showWithContactParameters_completionHandler_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)userInterfaceProtocol
{
  return &unk_26F0E1550;
}

+ (void)contactFromParameters:(id)a3 completionHandler:(id)a4
{
  v54[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v40 = a4;
  uint64_t v6 = [v5 objectForKey:@"WFContactFirstName"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  v9 = [v5 objectForKey:@"WFContactLastName"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v10 = v9;
    }
    else {
      objc_super v10 = 0;
    }
  }
  else
  {
    objc_super v10 = 0;
  }
  id v43 = v10;

  v11 = [v5 objectForKey:@"WFContactCompany"];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v42 = v12;

  v13 = [v5 objectForKey:@"WFContactNotes"];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  id v41 = v14;

  v15 = [v5 objectForKey:@"WFContactPhoneNumbers"];
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  id v17 = v16;

  v39 = v17;
  v18 = [v17 contentCollection];
  v19 = [v5 objectForKey:@"WFContactEmails"];
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }
  id v21 = v20;

  v22 = [v21 contentCollection];
  v23 = [v5 objectForKey:@"WFContactPhoto"];
  if (v23)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v24 = v23;
    }
    else {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }
  id v25 = v24;

  if (v8 && !objc_msgSend(v8, "wf_isEmpty")
    || v43 && !objc_msgSend(v43, "wf_isEmpty")
    || v42 && !objc_msgSend(v42, "wf_isEmpty"))
  {
    v29 = 0;
  }
  else
  {
    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v53 = *MEMORY[0x263F08320];
    v27 = WFLocalizedString(@"No first name, last name, or company was provided. Please provide at least one for this contact.");
    v54[0] = v27;
    v28 = [NSDictionary dictionaryWithObjects:v54 forKeys:&v53 count:1];
    v29 = [v26 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v28];
  }
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2050000000;
  v30 = (void *)getCNMutableContactClass_softClass;
  uint64_t v52 = getCNMutableContactClass_softClass;
  if (!getCNMutableContactClass_softClass)
  {
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __getCNMutableContactClass_block_invoke;
    v48[3] = &unk_264E5EC88;
    v48[4] = &v49;
    __getCNMutableContactClass_block_invoke((uint64_t)v48);
    v30 = (void *)v50[3];
  }
  v31 = v30;
  _Block_object_dispose(&v49, 8);
  id v32 = objc_alloc_init(v31);
  [v32 setGivenName:v8];
  [v32 setFamilyName:v43];
  [v32 setOrganizationName:v42];
  [v32 setNote:v41];
  if (v18)
  {
    v33 = [v18 items];
    v34 = objc_msgSend(v33, "if_compactMap:", &__block_literal_global_7178);
    [v32 setPhoneNumbers:v34];
  }
  if (v22)
  {
    v35 = [v22 items];
    v36 = objc_msgSend(v35, "if_compactMap:", &__block_literal_global_208);
    [v32 setEmailAddresses:v36];
  }
  if (v25)
  {
    v37 = [v25 items];
    v38 = [v37 firstObject];

    if (v38)
    {
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __65__WFAddNewContactAction_contactFromParameters_completionHandler___block_invoke_3;
      v44[3] = &unk_264E56B38;
      id v47 = v40;
      id v45 = v32;
      id v46 = v29;
      [v38 getObjectRepresentation:v44 forClass:objc_opt_class()];
    }
    else
    {
      (*((void (**)(id, id, void *))v40 + 2))(v40, v32, v29);
    }
  }
  else
  {
    (*((void (**)(id, id, void *))v40 + 2))(v40, v32, v29);
  }
}

void __65__WFAddNewContactAction_contactFromParameters_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = [v10 PNGRepresentation];
    [*(id *)(a1 + 32) setImageData:v9];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __65__WFAddNewContactAction_contactFromParameters_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc((Class)getCNLabeledValueClass());
    uint64_t v4 = [v2 emailAddress];
    id v5 = [v4 label];
    uint64_t v6 = [v2 emailAddress];
    id v7 = [v6 address];
    id v8 = (void *)[v3 initWithLabel:v5 value:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __65__WFAddNewContactAction_contactFromParameters_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc((Class)getCNLabeledValueClass());
    uint64_t v4 = [v2 phoneNumber];
    id v5 = [v4 label];
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    uint64_t v6 = (void *)getCNPhoneNumberClass_softClass;
    uint64_t v17 = getCNPhoneNumberClass_softClass;
    if (!getCNPhoneNumberClass_softClass)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __getCNPhoneNumberClass_block_invoke;
      v13[3] = &unk_264E5EC88;
      v13[4] = &v14;
      __getCNPhoneNumberClass_block_invoke((uint64_t)v13);
      uint64_t v6 = (void *)v15[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v14, 8);
    id v8 = [v2 phoneNumber];
    v9 = [v8 string];
    id v10 = [v7 phoneNumberWithStringValue:v9];
    v11 = (void *)[v3 initWithLabel:v5 value:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  uint64_t v6 = NSString;
  id v7 = a5;
  id v8 = a3;
  v9 = WFLocalizedString(@"Allow “%1$@” to use %2$@ in a new contact?");
  id v10 = objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);

  return v10;
}

- (void)runWithoutUI
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(WFAddNewContactAction *)self processedParameters];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__WFAddNewContactAction_runWithoutUI__block_invoke;
  v5[3] = &unk_264E56B60;
  v5[4] = self;
  [v3 contactFromParameters:v4 completionHandler:v5];
}

void __37__WFAddNewContactAction_runWithoutUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v5 || a3)
  {
    [v6 finishRunningWithError:a3];
  }
  else
  {
    id v7 = [v6 contactStore];
    id v15 = 0;
    char v8 = [v7 addContact:v5 error:&v15];
    id v9 = v15;

    id v10 = *(void **)(a1 + 32);
    if (v8)
    {
      v11 = [v10 contactStore];
      v12 = [v5 identifier];
      v13 = [v11 contactWithIdentifier:v12];

      if (v13)
      {
        uint64_t v14 = [*(id *)(a1 + 32) output];
        [v14 addObject:v13];
      }
      [*(id *)(a1 + 32) finishRunningWithError:0];
    }
    else
    {
      [v10 finishRunningWithError:v9];
    }
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v4 = [(WFAddNewContactAction *)self resourceManager];
  id v5 = [v4 resourceObjectsOfClass:objc_opt_class()];
  uint64_t v6 = [v5 anyObject];

  if ([v6 status] != 4)
  {
    uint64_t v11 = [v6 availabilityError];
    goto LABEL_6;
  }
  id v7 = [(WFAddNewContactAction *)self parameterValueForKey:@"ShowWhenRun" ofClass:objc_opt_class()];
  int v8 = [v7 BOOLValue];

  id v9 = [(WFAddNewContactAction *)self userInterface];
  int v10 = [v9 isRunningWithSiriUI];

  if (v10 && v8)
  {
    uint64_t v11 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
LABEL_6:
    v12 = (void *)v11;
    [(WFAddNewContactAction *)self finishRunningWithError:v11];

    goto LABEL_7;
  }
  if (v8)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52__WFAddNewContactAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_264E56AD0;
    v13[4] = self;
    [(WFAddNewContactAction *)self requestInterfacePresentationWithCompletionHandler:v13];
  }
  else
  {
    [(WFAddNewContactAction *)self runWithoutUI];
  }
LABEL_7:
}

void __52__WFAddNewContactAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 processedParameters];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__WFAddNewContactAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_264E5EF80;
    v8[4] = *(void *)(a1 + 32);
    [v5 showWithContactParameters:v7 completionHandler:v8];
  }
  else
  {
    [v6 finishRunningWithError:a3];
  }
}

void __52__WFAddNewContactAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 32);
  id v10 = v5;
  if (v5)
  {
    id v7 = [v6 contactStore];
    int v8 = [v7 contactWithIdentifier:v10];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) output];
      [v9 addObject:v8];
    }
    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
  else
  {
    [v6 finishRunningWithError:a3];
  }
}

@end