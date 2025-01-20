@interface WFToggleDoNotDisturbAction
- (id)appIdentifier;
- (id)appResource;
- (id)contentDestinationWithError:(id *)a3;
- (id)displayableAppDescriptor;
- (void)generatePopulatedIntentFromInput:(id)a3 processedParameters:(id)a4 completion:(id)a5;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
@end

@implementation WFToggleDoNotDisturbAction

- (void)generatePopulatedIntentFromInput:(id)a3 processedParameters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __94__WFToggleDoNotDisturbAction_generatePopulatedIntentFromInput_processedParameters_completion___block_invoke;
  v11[3] = &unk_264E59F90;
  id v12 = v8;
  v10.receiver = self;
  v10.super_class = (Class)WFToggleDoNotDisturbAction;
  id v9 = v8;
  [(WFHandleIntentAction *)&v10 generatePopulatedIntentFromInput:a3 processedParameters:a4 completion:v11];
}

void __94__WFToggleDoNotDisturbAction_generatePopulatedIntentFromInput_processedParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (v5)
  {
    a3;
    [v5 setValue:MEMORY[0x263EFFA88] forKey:@"userInteractive"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void, void, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, a3);
  }
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  v78[3] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v59 = a4;
  id v62 = a5;
  id v61 = a6;
  v13 = (void (**)(id, id, void))a7;
  v60 = [(WFToggleDoNotDisturbAction *)self parameterValueForKey:@"Operation" ofClass:objc_opt_class()];
  v14 = [(WFToggleDoNotDisturbAction *)self parameterValueForKey:@"Enabled" ofClass:objc_opt_class()];
  int v15 = [v14 BOOLValue];

  v16 = [(WFToggleDoNotDisturbAction *)self parameterValueForKey:@"AssertionType" ofClass:objc_opt_class()];
  v17 = [(WFToggleDoNotDisturbAction *)self parameterValueForKey:@"FocusModes" ofClass:objc_opt_class()];
  v77[0] = @"Time";
  v77[1] = @"I Leave";
  v78[0] = @"duration";
  v78[1] = @"location";
  v77[2] = @"Event Ends";
  v78[2] = @"event";
  v64 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:3];
  v18 = objc_msgSend(v12, "wf_slotName");
  LODWORD(a6) = [v18 isEqualToString:@"mode"];

  v63 = v12;
  if (a6)
  {
    v19 = [MEMORY[0x263F86B68] availableModes];
    v69[0] = MEMORY[0x263EF8330];
    v69[1] = 3221225472;
    v69[2] = __88__WFToggleDoNotDisturbAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v69[3] = &unk_264E59F40;
    v20 = v17;
    id v21 = v17;
    id v70 = v21;
    v22 = objc_msgSend(v19, "if_objectsPassingTest:", v69);
    uint64_t v23 = [v22 count];

    if (v23)
    {
      v13[2](v13, v21, 0);
    }
    else
    {
      v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v75 = *MEMORY[0x263F08320];
      v38 = NSString;
      v39 = WFLocalizedString(@"The action could not run because a Focus named “%@” does not exist on this device. You can create a new Focus in Settings.");
      v40 = [v21 displayString];
      v41 = objc_msgSend(v38, "localizedStringWithFormat:", v39, v40);
      v76 = v41;
      v42 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      v43 = [v37 errorWithDomain:@"WFToggleDoNotDisturbActionErrorDomain" code:0 userInfo:v42];
      ((void (**)(id, id, void *))v13)[2](v13, 0, v43);
    }
    v29 = v16;

    v35 = v59;
    v27 = v60;
    v36 = v61;
    v28 = v62;
    v24 = v20;
    goto LABEL_20;
  }
  v24 = v17;
  v25 = objc_msgSend(v12, "wf_slotName");
  int v26 = [v25 isEqualToString:@"state"];

  if (v26)
  {
    v27 = v60;
    v28 = v62;
    v29 = v16;
    if ([v60 isEqualToString:@"Toggle"])
    {
      v13[2](v13, &unk_26F075678, 0);
    }
    else
    {
      if (v15) {
        v44 = &unk_26F075690;
      }
      else {
        v44 = &unk_26F0756A8;
      }
      v13[2](v13, v44, 0);
    }
    v35 = v59;
    v36 = v61;
    goto LABEL_20;
  }
  v30 = v16;
  if (!v15
    || ([v64 objectForKeyedSubscript:v16],
        v31 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "wf_slotName"),
        v32 = objc_claimAutoreleasedReturnValue(),
        char v33 = [v31 isEqualToString:v32],
        v32,
        v31,
        (v33 & 1) == 0))
  {
    v68.receiver = self;
    v68.super_class = (Class)WFToggleDoNotDisturbAction;
    v35 = v59;
    v36 = v61;
    v28 = v62;
    [(WFHandleIntentAction *)&v68 resolveSlot:v12 withProcessedValue:v59 parameter:v62 input:v61 completion:v13];
    goto LABEL_14;
  }
  if ([v16 isEqualToString:@"I Leave"])
  {
    v34 = (void *)[objc_alloc(MEMORY[0x263F0FCB0]) initWithIdentifier:0 displayString:@"Current Location"];
    v13[2](v13, v34, 0);

    v35 = v59;
    v36 = v61;
    v28 = v62;
LABEL_14:
    v29 = v30;
    v27 = v60;
    goto LABEL_20;
  }
  int v45 = [v16 isEqualToString:@"Time"];
  v35 = v59;
  if (v45)
  {
    v58 = v30;
    id v46 = v59;
    v36 = v61;
    if (v46 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v47 = [MEMORY[0x263EFF910] date];
      uint64_t v48 = [v46 compare:v47];

      if (v48 == -1)
      {
        uint64_t v73 = *MEMORY[0x263F08320];
        v56 = WFLocalizedString(@"Please provide an end time that is later than the current time for Do Not Disturb.");
        v74 = v56;
        v50 = [NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];

        v57 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v50];
        ((void (**)(id, id, void *))v13)[2](v13, 0, v57);
      }
      else
      {
        v49 = NSNumber;
        [v46 timeIntervalSinceNow];
        v50 = objc_msgSend(v49, "numberWithDouble:");
        v13[2](v13, v50, 0);
      }
    }
    else
    {

      uint64_t v71 = *MEMORY[0x263F08320];
      v54 = WFLocalizedString(@"An invalid end time was provided. Please provide an end time for Do Not Disturb.");
      v72 = v54;
      id v46 = [NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];

      v50 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v46];
      ((void (**)(id, id, void *))v13)[2](v13, 0, v50);
    }

    v28 = v62;
    v27 = v60;
    v29 = v58;
  }
  else
  {
    v51 = v30;
    int v52 = [v30 isEqualToString:@"Event Ends"];
    v36 = v61;
    v28 = v62;
    v27 = v60;
    if (v52)
    {
      if (v59) {
        id v53 = v59;
      }
      else {
        id v53 = (id)objc_opt_new();
      }
      v55 = v53;
      v29 = v51;
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = __88__WFToggleDoNotDisturbAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_251;
      v66[3] = &unk_264E59F68;
      v67 = v13;
      [v55 getObjectRepresentation:v66 forClass:objc_opt_class()];
    }
    else
    {
      v65.receiver = self;
      v65.super_class = (Class)WFToggleDoNotDisturbAction;
      [(WFHandleIntentAction *)&v65 resolveSlot:v63 withProcessedValue:v59 parameter:v62 input:v61 completion:v13];
      v29 = v51;
    }
  }
LABEL_20:
}

uint64_t __88__WFToggleDoNotDisturbAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 activityDisplayName];
  v4 = [*(id *)(a1 + 32) displayString];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

void __88__WFToggleDoNotDisturbAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_251(uint64_t a1, void *a2, void *a3, void *a4)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = v9;
  if (!v7 || v9)
  {
    uint64_t v19 = *MEMORY[0x263F08320];
    int v15 = WFLocalizedString(@"No calendar event was provided. Please provide a calendar event to enable Do Not Disturb for that duration.");
    v20[0] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];

    uint64_t v17 = *(void *)(a1 + 32);
    if (v10)
    {
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v10);
    }
    else
    {
      v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v16];
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v18);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = objc_alloc(MEMORY[0x263F0FCB0]);
    v13 = [v7 uniqueId];
    v14 = (void *)[v12 initWithIdentifier:v13 displayString:v8];
    (*(void (**)(uint64_t, void *, void))(v11 + 16))(v11, v14, 0);
  }
}

- (id)displayableAppDescriptor
{
  return 0;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (id)appIdentifier
{
  return 0;
}

- (id)appResource
{
  return 0;
}

@end