@interface WFCombineTextIntentHandler
- (void)handleCombineText:(id)a3 completion:(id)a4;
- (void)resolveCustomSeparatorForCombineText:(id)a3 withCompletion:(id)a4;
- (void)resolveSeparatorForCombineText:(id)a3 withCompletion:(id)a4;
- (void)resolveTextForCombineText:(id)a3 withCompletion:(id)a4;
@end

@implementation WFCombineTextIntentHandler

- (void)handleCombineText:(id)a3 completion:(id)a4
{
  id v12 = a3;
  v5 = (void (**)(id, WFCombineTextIntentResponse *))a4;
  uint64_t v6 = [v12 separator];
  switch(v6)
  {
    case 3:
      v8 = [v12 customSeparator];
      break;
    case 2:
      v7 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      v8 = @" ";
      goto LABEL_9;
    case 1:
      v7 = [MEMORY[0x263F08708] newlineCharacterSet];
      v8 = @"\n";
      goto LABEL_9;
    default:
      v8 = 0;
      break;
  }
  v7 = 0;
LABEL_9:
  v9 = [v12 text];
  v10 = [[WFCombineTextIntentResponse alloc] initWithCode:4 userActivity:0];
  if ([v9 count])
  {
    v11 = [v9 componentsJoinedByString:v8];
    [(WFCombineTextIntentResponse *)v10 setText:v11];
  }
  v5[2](v5, v10);
}

- (void)resolveTextForCombineText:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v8 = [a3 text];
  v7 = objc_msgSend(v8, "if_map:", &__block_literal_global_24261);
  (*((void (**)(id, void *))a4 + 2))(v6, v7);
}

uint64_t __71__WFCombineTextIntentHandler_resolveTextForCombineText_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F10020] successWithResolvedString:a2];
}

- (void)resolveSeparatorForCombineText:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  v5 = (void (**)(id, void *))a4;
  if ([v7 separator]) {
    +[WFCombineTextSeparatorResolutionResult successWithResolvedCombineTextSeparator:](WFCombineTextSeparatorResolutionResult, "successWithResolvedCombineTextSeparator:", [v7 separator]);
  }
  else {
  id v6 = +[WFCombineTextSeparatorResolutionResult needsValue];
  }
  v5[2](v5, v6);
}

- (void)resolveCustomSeparatorForCombineText:(id)a3 withCompletion:(id)a4
{
  id v12 = a3;
  v5 = (void (**)(id, uint64_t))a4;
  uint64_t v6 = [v12 separator];
  id v7 = (void *)MEMORY[0x263F10020];
  if (v6 == 3)
  {
    uint64_t v8 = [v12 customSeparator];
    v9 = (void *)v8;
    if (v8) {
      v10 = (__CFString *)v8;
    }
    else {
      v10 = &stru_26F008428;
    }
    uint64_t v11 = [v7 successWithResolvedString:v10];
    v5[2](v5, v11);

    v5 = (void (**)(id, uint64_t))v11;
  }
  else
  {
    v9 = [MEMORY[0x263F10020] notRequired];
    v5[2](v5, (uint64_t)v9);
  }
}

@end