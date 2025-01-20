@interface CATOperationTargetSelectorObserver
@end

@implementation CATOperationTargetSelectorObserver

void __65___CATOperationTargetSelectorObserver_invokeActionWithOperation___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) target];
  v3 = objc_msgSend(v2, "methodSignatureForSelector:", objc_msgSend(*(id *)(a1 + 32), "selector"));

  v4 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v3];
  v5 = [*(id *)(a1 + 32) target];
  [v4 setTarget:v5];

  objc_msgSend(v4, "setSelector:", objc_msgSend(*(id *)(a1 + 32), "selector"));
  if ((unint64_t)[v3 numberOfArguments] >= 3) {
    [v4 setArgument:a1 + 40 atIndex:2];
  }
  if ((unint64_t)[v3 numberOfArguments] >= 4)
  {
    id v6 = [*(id *)(a1 + 32) userInfo];
    [v4 setArgument:&v6 atIndex:3];
  }
  [v4 invoke];
}

@end