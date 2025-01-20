@interface WFConvertTimeZoneAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFConvertTimeZoneAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFConvertTimeZoneAction *)self parameterValueForKey:@"SourceTimeZone" ofClass:objc_opt_class()];
  v6 = [(WFConvertTimeZoneAction *)self parameterValueForKey:@"DestinationTimeZone" ofClass:objc_opt_class()];
  uint64_t v7 = objc_opt_class();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __54__WFConvertTimeZoneAction_runAsynchronouslyWithInput___block_invoke;
  v11[3] = &unk_264E5E818;
  id v12 = v5;
  id v13 = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__WFConvertTimeZoneAction_runAsynchronouslyWithInput___block_invoke_2;
  v10[3] = &unk_264E5E840;
  v10[4] = self;
  id v8 = v6;
  id v9 = v5;
  [v4 transformObjectRepresentationsForClass:v7 usingBlock:v11 completionHandler:v10];
}

void __54__WFConvertTimeZoneAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = (void *)MEMORY[0x263EFF8F0];
  id v9 = a5;
  v10 = [v8 currentCalendar];
  v11 = *(void **)(a1 + 32);
  id v16 = v7;
  id v12 = [v11 timeZone];
  [v16 setTimeZone:v12];

  id v13 = [v10 dateFromComponents:v16];

  v14 = [*(id *)(a1 + 40) timeZone];
  v15 = [v10 componentsInTimeZone:v14 fromDate:v13];

  v9[2](v9, v15, 0);
}

void __54__WFConvertTimeZoneAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

@end