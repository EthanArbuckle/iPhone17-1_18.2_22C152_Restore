@interface WFGetTypeAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetTypeAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFGetTypeAction *)self parameterValueForKey:@"WFFileType" ofClass:objc_opt_class()];
  if ([v5 length])
  {
    v6 = [MEMORY[0x263F852B8] typeWithString:v5];
  }
  else
  {
    v6 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__WFGetTypeAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_264E5E8C0;
  v8[4] = self;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__WFGetTypeAction_runAsynchronouslyWithInput___block_invoke_2;
  v7[3] = &unk_264E5E8E8;
  v7[4] = self;
  [v4 enumerateFileRepresentations:v8 forType:v6 completionHandler:v7];
}

void __46__WFGetTypeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  v7 = a3;
  id v5 = a2;
  v6 = [v4 output];
  [v6 addFile:v5];

  v7[2](v7, 0);
}

uint64_t __46__WFGetTypeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

@end