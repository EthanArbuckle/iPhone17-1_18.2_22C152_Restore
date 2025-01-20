@interface WFCalculateExpressionAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFCalculateExpressionAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__WFCalculateExpressionAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_264E5EF80;
  v3[4] = self;
  [a3 getStringRepresentation:v3];
}

void __58__WFCalculateExpressionAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void *)MEMORY[0x263F08708];
  id v7 = a2;
  v8 = [v6 whitespaceAndNewlineCharacterSet];
  v9 = [v7 stringByTrimmingCharactersInSet:v8];

  if ([v9 length])
  {
    v10 = objc_opt_new();
    v11 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US"];
    v24[0] = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    double Helper_x8__CalculateKeyLocales = gotLoadHelper_x8__CalculateKeyLocales(v13);
    objc_msgSend(v10, "setValue:forKey:", v12, **(void **)(v15 + 3296), Helper_x8__CalculateKeyLocales);

    double Helper_x8__CalculateKeyAllowUnits = gotLoadHelper_x8__CalculateKeyAllowUnits(v16);
    objc_msgSend(v10, "setValue:forKey:", MEMORY[0x263EFFA80], **(void **)(v18 + 3256), Helper_x8__CalculateKeyAllowUnits);
    gotLoadHelper_x8__OBJC_CLASS___Calculate(v19);
    v21 = *(void **)(v20 + 3336);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __58__WFCalculateExpressionAction_runAsynchronouslyWithInput___block_invoke_2;
    v23[3] = &unk_264E566B0;
    v23[4] = *(void *)(a1 + 32);
    id v22 = (id)[v21 evaluate:v9 options:v10 resultHandler:v23];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v5];
  }
}

void __58__WFCalculateExpressionAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  if (a2)
  {
    id v5 = [a2 terms];
    v6 = [v5 firstObject];
    id v7 = [v6 value];

    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      v9 = [v8 output];
      [v9 addObject:v7];

      v8 = *(void **)(a1 + 32);
      id v10 = 0;
    }
    else
    {
      id v10 = v11;
    }
    [v8 finishRunningWithError:v10];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v11];
  }
}

@end