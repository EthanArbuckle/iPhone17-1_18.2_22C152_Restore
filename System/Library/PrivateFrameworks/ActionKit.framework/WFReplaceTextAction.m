@interface WFReplaceTextAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFReplaceTextAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFReplaceTextAction *)self parameterValueForKey:@"WFReplaceTextRegularExpression" ofClass:objc_opt_class()];
  int v6 = [v5 BOOLValue];

  v7 = [(WFReplaceTextAction *)self parameterValueForKey:@"WFReplaceTextCaseSensitive" ofClass:objc_opt_class()];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [(WFReplaceTextAction *)self parameterValueForKey:@"WFReplaceTextFind" ofClass:objc_opt_class()];
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_26F008428;
  }
  v12 = v11;

  uint64_t v13 = [(WFReplaceTextAction *)self parameterValueForKey:@"WFReplaceTextReplace" ofClass:objc_opt_class()];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = &stru_26F008428;
  }
  v16 = v15;

  if (v6) {
    uint64_t v17 = v8 ^ 1u | 0x400;
  }
  else {
    uint64_t v17 = v8 ^ 1u;
  }
  uint64_t v18 = objc_opt_class();
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __50__WFReplaceTextAction_runAsynchronouslyWithInput___block_invoke;
  v22[3] = &unk_264E57900;
  v23 = v12;
  v24 = v16;
  uint64_t v25 = v17;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __50__WFReplaceTextAction_runAsynchronouslyWithInput___block_invoke_2;
  v21[3] = &unk_264E5E840;
  v21[4] = self;
  v19 = v16;
  v20 = v12;
  [v4 transformObjectRepresentationsForClass:v18 usingBlock:v22 completionHandler:v21];
}

void __50__WFReplaceTextAction_runAsynchronouslyWithInput___block_invoke(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v9 = a1[6];
  v10 = a5;
  id v11 = a4;
  id v12 = a2;
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, v8, v9, 0, objc_msgSend(v12, "length"));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  v10[2](v10, v13, v11);
}

uint64_t __50__WFReplaceTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setOutput:a2];
  v3 = *(void **)(a1 + 32);
  return [v3 finishRunningWithError:0];
}

@end