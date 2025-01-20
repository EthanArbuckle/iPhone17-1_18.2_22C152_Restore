@interface WFFormatNumberAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFFormatNumberAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFFormatNumberAction *)self parameterValueForKey:@"WFNumberFormatDecimalPlaces" ofClass:objc_opt_class()];
  uint64_t v6 = [v5 integerValue];

  v7 = objc_opt_new();
  [v7 setNumberStyle:1];
  [v7 setMinimumFractionDigits:v6];
  [v7 setMaximumFractionDigits:v6];
  v8 = [MEMORY[0x263EFF960] currentLocale];
  [v7 setLocale:v8];

  uint64_t v9 = objc_opt_class();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__WFFormatNumberAction_runAsynchronouslyWithInput___block_invoke;
  v12[3] = &unk_264E56D30;
  id v13 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__WFFormatNumberAction_runAsynchronouslyWithInput___block_invoke_2;
  v11[3] = &unk_264E5E840;
  v11[4] = self;
  id v10 = v7;
  [v4 transformObjectRepresentationsForClass:v9 usingBlock:v12 completionHandler:v11];
}

void __51__WFFormatNumberAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  v8 = (void *)MEMORY[0x263F337C8];
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 stringFromNumber:a2];
  id v14 = [v8 itemWithObject:v13 named:v12];

  v10[2](v10, v14, v11);
}

void __51__WFFormatNumberAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end