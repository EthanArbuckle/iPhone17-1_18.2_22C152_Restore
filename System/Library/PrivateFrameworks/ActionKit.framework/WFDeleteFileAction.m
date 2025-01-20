@interface WFDeleteFileAction
- (id)contentDestinationWithError:(id *)a3;
- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4;
@end

@implementation WFDeleteFileAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 numberOfItems])
  {
    v8 = [(WFDeleteFileAction *)self parameterValueForKey:@"WFDeleteImmediatelyDelete" ofClass:objc_opt_class()];
    uint64_t v9 = [v8 BOOLValue];

    uint64_t v10 = [(id)objc_opt_class() resultItemClass];
    if (v10 == objc_opt_class())
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
      v14[3] = &unk_264E5EBC8;
      v14[4] = self;
      [v7 deleteFiles:v6 deleteImmediately:v9 completionHandler:v14];
    }
    else
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
      v11[3] = &unk_264E599A8;
      v11[4] = self;
      id v12 = v7;
      char v13 = v9;
      [v6 getFileRepresentations:v11 forType:0];
    }
  }
  else
  {
    [(WFDeleteFileAction *)self finishRunningWithError:0];
  }
}

uint64_t __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

void __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  v8 = objc_opt_new();
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3;
  v31[3] = &unk_264E59958;
  id v9 = v7;
  id v32 = v9;
  id v10 = v8;
  id v33 = v10;
  [v5 enumerateObjectsUsingBlock:v31];
  if ([v9 count]
    || ([v10 items],
        v11 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = [v11 count],
        v11,
        v12))
  {
    char v13 = dispatch_group_create();
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__27169;
    v29[4] = __Block_byref_object_dispose__27170;
    id v30 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = __Block_byref_object_copy__27169;
    v27[4] = __Block_byref_object_dispose__27170;
    id v28 = 0;
    if ([v9 count])
    {
      dispatch_group_enter(v13);
      v14 = *(void **)(a1 + 40);
      uint64_t v15 = *(unsigned __int8 *)(a1 + 48);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_174;
      v24[3] = &unk_264E59980;
      v26 = v29;
      v25 = v13;
      [v14 deleteItems:v9 deleteImmediately:v15 completionHandler:v24];
    }
    v16 = [v10 items];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      dispatch_group_enter(v13);
      v18 = *(void **)(a1 + 40);
      uint64_t v19 = *(unsigned __int8 *)(a1 + 48);
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2_175;
      v21[3] = &unk_264E59980;
      v23 = v27;
      v22 = v13;
      [v18 deleteFiles:v10 deleteImmediately:v19 completionHandler:v21];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3_176;
    block[3] = &unk_264E5A588;
    block[4] = *(void *)(a1 + 32);
    block[5] = v29;
    block[6] = v27;
    dispatch_group_notify(v13, MEMORY[0x263EF83A0], block);
    _Block_object_dispose(v27, 8);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:0];
  }
}

void __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 fileURL];
  v4 = objc_msgSend(v3, "wf_fileProviderItem");

  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else {
    [*(id *)(a1 + 40) addFile:v5];
  }
}

void __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_174(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2_175(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __64__WFDeleteFileAction_runAsynchronouslyWithInput_storageService___block_invoke_3_176(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[5] + 8) + 40);
  if (!v3) {
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  }
  return [v2 finishRunningWithError:v3];
}

@end