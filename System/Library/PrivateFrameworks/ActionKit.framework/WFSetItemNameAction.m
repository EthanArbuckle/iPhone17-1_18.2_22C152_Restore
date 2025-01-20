@interface WFSetItemNameAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFSetItemNameAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  if ([v4 numberOfItems])
  {
    v5 = [(WFSetItemNameAction *)self parameterValueForKey:@"WFName" ofClass:objc_opt_class()];
    if (![v5 length])
    {

      v5 = 0;
    }
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_264E593E8;
    aBlock[4] = self;
    v6 = _Block_copy(aBlock);
    v7 = [(WFSetItemNameAction *)self parameterValueForKey:@"WFDontIncludeFileExtension" ofClass:objc_opt_class()];
    int v8 = [v7 BOOLValue];

    if (v8)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke_3;
      v12[3] = &unk_264E5DB78;
      id v13 = v5;
      v14 = self;
      id v15 = v6;
      [v4 getFileRepresentation:v12 forType:0];

      v9 = v13;
    }
    else
    {
      v10 = [v4 items];
      v11 = [v10 firstObject];
      v9 = (void *)[v11 copyWithName:v5];

      (*((void (**)(void *, void *))v6 + 2))(v6, v9);
      [(WFSetItemNameAction *)self finishRunningWithError:0];
    }
  }
  else
  {
    [(WFSetItemNameAction *)self finishRunningWithError:0];
  }
}

void __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) parameterStateForKey:@"WFName"];
  v5 = [v4 containedVariables];

  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke_2;
  v11 = &unk_264E593C0;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:&v8];
  v7 = objc_msgSend(*(id *)(a1 + 32), "output", v8, v9, v10, v11, v12);
  [v7 addItem:v6];
}

void __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  if (a2)
  {
    v5 = (void *)MEMORY[0x263F337C8];
    id v6 = (void *)[a2 copyWithName:*(void *)(a1 + 32) addingExtensionIfNecessary:0 zone:0];
    v7 = [v5 itemWithFile:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  [*(id *)(a1 + 40) finishRunningWithError:v8];
}

void __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 variableSource];
  id v6 = [v4 name];
  v7 = [v5 contentForVariableWithName:v6];

  id v8 = [*(id *)(a1 + 40) attributionSet];
  id v11 = [v7 collectionByMergingAttributionSet:v8];

  uint64_t v9 = [*(id *)(a1 + 32) variableSource];
  v10 = [v4 name];

  [v9 setContent:v11 forVariableWithName:v10];
}

@end