@interface WFDeletePhotosAction
- (BOOL)inputPassthrough;
- (BOOL)populatesInputFromInputParameter;
- (id)contentDestinationWithError:(id *)a3;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
@end

@implementation WFDeletePhotosAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (BOOL)inputPassthrough
{
  return 0;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_msgSend(v12, "wf_slotName");
  int v18 = [v17 isEqualToString:@"assetIdentifiers"];

  if (v18)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __82__WFDeletePhotosAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v22[3] = &unk_264E5BDE0;
    id v23 = v16;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    v19 = (void *)getPHAssetClass_softClass_43029;
    uint64_t v28 = getPHAssetClass_softClass_43029;
    if (!getPHAssetClass_softClass_43029)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __getPHAssetClass_block_invoke_43030;
      v24[3] = &unk_264E5EC88;
      v24[4] = &v25;
      __getPHAssetClass_block_invoke_43030((uint64_t)v24);
      v19 = (void *)v26[3];
    }
    id v20 = v19;
    _Block_object_dispose(&v25, 8);
    [v15 getObjectRepresentations:v22 forClass:v20];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)WFDeletePhotosAction;
    [(WFHandleIntentAction *)&v21 resolveSlot:v12 withProcessedValue:v13 parameter:v14 input:v15 completion:v16];
  }
}

void __82__WFDeletePhotosAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "if_map:", &__block_literal_global_43051);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__WFDeletePhotosAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

@end