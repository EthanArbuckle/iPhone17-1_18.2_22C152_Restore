@interface WFImportToLightroomAction
- (BOOL)populatesInputFromInputParameter;
- (id)contentDestinationWithError:(id *)a3;
- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6;
- (void)initializeParameters;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
@end

@implementation WFImportToLightroomAction

- (id)contentDestinationWithError:(id *)a3
{
  v3 = (void *)MEMORY[0x263F33708];
  v4 = [(WFHandleIntentAction *)self appDescriptor];
  v5 = [v3 locationWithAppDescriptor:v4];

  return v5;
}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  v32[3] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_msgSend(v12, "wf_slotName");
  int v18 = [v17 isEqualToString:@"fileURLs"];

  if (v18)
  {
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v32[2] = objc_opt_class();
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:3];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __87__WFImportToLightroomAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v30[3] = &unk_264E5B8E0;
    id v31 = v16;
    [v15 generateCollectionByCoercingToItemClasses:v19 completionHandler:v30];
  }
  else
  {
    v20 = objc_msgSend(v12, "wf_slotName");
    int v21 = [v20 isEqualToString:@"preset"];

    if (v21)
    {
      id v22 = v13;
      v23 = [v22 identifier];

      if (!v23)
      {
        v28 = +[WFLightroomPresetPickerParameter presetsByGroup];
        v24 = [(WFImportToLightroomAction *)self parameterValueForKey:@"presetGroup" ofClass:objc_opt_class()];
        v25 = [v28 objectForKeyedSubscript:v24];
        v26 = [v22 displayString];
        uint64_t v27 = [v25 objectMatchingKey:@"displayString" value:v26];

        id v22 = (id)v27;
      }
      (*((void (**)(id, id, void))v16 + 2))(v16, v22, 0);
    }
    else
    {
      v29.receiver = self;
      v29.super_class = (Class)WFImportToLightroomAction;
      [(WFHandleIntentAction *)&v29 resolveSlot:v12 withProcessedValue:v13 parameter:v14 input:v15 completion:v16];
    }
  }
}

void __87__WFImportToLightroomAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  if ([v8 numberOfItems])
  {
    v7 = [v8 items];
    objc_msgSend(v7, "if_mapAsynchronously:completionHandler:", &__block_literal_global_17372, *(void *)(a1 + 32));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __87__WFImportToLightroomAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v7 = [v5 supportedTypes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v18 = v6;
    uint64_t v10 = *(void *)v22;
    uint64_t v11 = *MEMORY[0x263F1DC60];
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = objc_msgSend(MEMORY[0x263F852B8], "typeWithUTType:", v11, v18);
        int v15 = [v13 conformsToType:v14];

        if (v15)
        {
          id v16 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    id v16 = 0;
LABEL_11:
    id v6 = v18;
  }
  else
  {
    id v16 = 0;
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __87__WFImportToLightroomAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3;
  v19[3] = &unk_264E5DBC8;
  id v20 = v6;
  id v17 = v6;
  [v5 getFileRepresentation:v19 forType:v16];
}

void __87__WFImportToLightroomAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 fileURL];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFImportToLightroomAction;
  [(WFHandleCustomIntentAction *)&v4 initializeParameters];
  v3 = [(WFImportToLightroomAction *)self parameterForKey:@"preset"];
  [v3 setAction:self];
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  v8.receiver = self;
  v8.super_class = (Class)WFImportToLightroomAction;
  id v6 = [(WFHandleCustomIntentAction *)&v8 generatedIntentWithIdentifier:a3 input:a4 processedParameters:a5 error:a6];
  [v6 _setShouldForwardToAppOnSuccess:1];
  return v6;
}

@end