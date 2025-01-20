@interface WFGetParkedCarLocationAction
- (id)contentDestinationWithError:(id *)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetParkedCarLocationAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v5 = (void *)getRTRoutineManagerClass_softClass;
  uint64_t v13 = getRTRoutineManagerClass_softClass;
  if (!getRTRoutineManagerClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getRTRoutineManagerClass_block_invoke;
    v9[3] = &unk_264E5EC88;
    v9[4] = &v10;
    __getRTRoutineManagerClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  v7 = [v6 defaultManager];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__WFGetParkedCarLocationAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_264E5EEE8;
  v8[4] = self;
  [v7 fetchLastVehicleEventsWithHandler:v8];
}

void __59__WFGetParkedCarLocationAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a2 firstObject];
  if (v6)
  {
    v7 = (void *)MEMORY[0x263F337C8];
    v8 = (void *)MEMORY[0x263F33708];
    v9 = [*(id *)(a1 + 32) appDescriptor];
    uint64_t v10 = [v8 locationWithAppDescriptor:v9];
    v11 = [v7 itemWithObject:v6 origin:v10 disclosureLevel:1];

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 32) output];
      [v12 addItem:v11];
    }
    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
  else
  {
    uint64_t v13 = getWFActionsLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "-[WFGetParkedCarLocationAction runAsynchronouslyWithInput:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_23C364000, v13, OS_LOG_TYPE_ERROR, "%s No RTVehicleEvent found, error = %@", (uint8_t *)&v14, 0x16u);
    }

    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
}

@end