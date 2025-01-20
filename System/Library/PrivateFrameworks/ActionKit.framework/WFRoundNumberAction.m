@interface WFRoundNumberAction
- (id)scaleValueFromParameterValue:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFRoundNumberAction

- (id)scaleValueFromParameterValue:(id)a3
{
  v10[16] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9[0] = @"Ones Place";
  v9[1] = @"Tens Place";
  v10[0] = &unk_26F075EE8;
  v10[1] = &unk_26F075F00;
  v9[2] = @"Tenths";
  v9[3] = @"Hundreds Place";
  v10[2] = &unk_26F075F18;
  v10[3] = &unk_26F075F30;
  v9[4] = @"Hundredths";
  v9[5] = @"Thousands";
  v10[4] = &unk_26F075F48;
  v10[5] = &unk_26F075F60;
  v9[6] = @"Thousandths";
  v9[7] = @"Ten Thousands";
  v10[6] = &unk_26F075F78;
  v10[7] = &unk_26F075F90;
  v9[8] = @"Ten Thousandths";
  v9[9] = @"Hundred Thousands";
  v10[8] = &unk_26F075FA8;
  v10[9] = &unk_26F075FC0;
  v9[10] = @"Hundred Thousandths";
  v9[11] = @"Millions";
  v10[10] = &unk_26F075FD8;
  v10[11] = &unk_26F075FF0;
  v9[12] = @"Millionths";
  v9[13] = @"Ten Millionths";
  v10[12] = &unk_26F076008;
  v10[13] = &unk_26F076020;
  v9[14] = @"Hundred Millionths";
  v9[15] = @"Billionths";
  v10[14] = &unk_26F076038;
  v10[15] = &unk_26F076050;
  v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:16];
  if ([v4 isEqualToString:@"10 ^"])
  {
    v6 = [(WFRoundNumberAction *)self parameterValueForKey:@"TenToThePowerOf" ofClass:objc_opt_class()];
    v7 = objc_msgSend(NSNumber, "numberWithInteger:", -objc_msgSend(v6, "integerValue"));
  }
  else
  {
    v7 = [v5 objectForKey:v4];
  }

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__WFRoundNumberAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_264E5A1F0;
  v4[4] = self;
  id v3 = a3;
  [v3 getObjectRepresentations:v4 forClass:objc_opt_class()];
}

void __50__WFRoundNumberAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v22 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    v21 = [*(id *)(a1 + 32) parameterValueForKey:@"WFRoundTo" ofClass:objc_opt_class()];
    v20 = [*(id *)(a1 + 32) parameterValueForKey:@"WFRoundMode" ofClass:objc_opt_class()];
    if ([v20 isEqualToString:@"Always Round Up"]) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = [v20 isEqualToString:@"Always Round Down"];
    }
    v10 = objc_msgSend(*(id *)(a1 + 32), "scaleValueFromParameterValue:", v21, v8);
    v11 = objc_msgSend(MEMORY[0x263F087B8], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", v9, objc_msgSend(v10, "shortValue"), 0, 0, 0, 0);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v17 = [*(id *)(a1 + 32) output];
          v18 = [v16 decimalNumberByRoundingAccordingToBehavior:v11];
          [v17 addObject:v18];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v13);
    }

    [*(id *)(a1 + 32) finishRunningWithError:0];
    id v8 = v19;
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:v8];
  }
}

@end