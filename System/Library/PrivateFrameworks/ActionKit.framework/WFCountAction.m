@interface WFCountAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFCountAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFCountAction *)self parameterValueForKey:@"WFCountType" ofClass:objc_opt_class()];
  if ([v5 isEqualToString:@"Items"])
  {
    v6 = [(WFCountAction *)self output];
    v7 = objc_msgSend(MEMORY[0x263F087B0], "numberWithInteger:", objc_msgSend(v4, "numberOfItems"));
    [v6 addObject:v7];

    [(WFCountAction *)self finishRunningWithError:0];
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__WFCountAction_runAsynchronouslyWithInput___block_invoke;
    v8[3] = &unk_264E5DF30;
    v8[4] = self;
    id v9 = v5;
    [v4 getStringRepresentation:v8];
  }
}

void __44__WFCountAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
  else
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    if ([*(id *)(a1 + 40) isEqualToString:@"Characters"])
    {
      uint64_t v7 = 514;
    }
    else if ([*(id *)(a1 + 40) isEqualToString:@"Words"])
    {
      uint64_t v7 = 515;
    }
    else if ([*(id *)(a1 + 40) isEqualToString:@"Sentences"])
    {
      uint64_t v7 = 516;
    }
    else
    {
      [*(id *)(a1 + 40) isEqualToString:@"Lines"];
      uint64_t v7 = 512;
    }
    uint64_t v8 = [v5 length];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__WFCountAction_runAsynchronouslyWithInput___block_invoke_2;
    v11[3] = &unk_264E59A00;
    v11[4] = &v12;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, v7, v11);
    id v9 = [*(id *)(a1 + 32) output];
    v10 = [MEMORY[0x263F087B0] numberWithUnsignedInteger:v13[3]];
    [v9 addObject:v10];

    [*(id *)(a1 + 32) finishRunningWithError:0];
    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __44__WFCountAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t result)
{
  return result;
}

@end