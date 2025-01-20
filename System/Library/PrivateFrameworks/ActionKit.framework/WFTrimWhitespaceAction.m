@interface WFTrimWhitespaceAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFTrimWhitespaceAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__WFTrimWhitespaceAction_runAsynchronouslyWithInput___block_invoke_2;
  v6[3] = &unk_264E5E840;
  v6[4] = self;
  [v4 transformObjectRepresentationsForClass:v5 usingBlock:&__block_literal_global_42519 completionHandler:v6];
}

uint64_t __53__WFTrimWhitespaceAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setOutput:a2];
  v3 = *(void **)(a1 + 32);
  return [v3 finishRunningWithError:0];
}

void __53__WFTrimWhitespaceAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  v7 = (void *)MEMORY[0x263F08708];
  v8 = a5;
  id v9 = a4;
  id v10 = a2;
  v11 = [v7 whitespaceAndNewlineCharacterSet];
  id v12 = [v10 stringByTrimmingCharactersInSet:v11];

  v8[2](v8, v12, v9);
}

@end