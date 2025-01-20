@interface WFTimeUntilDateAction
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)wasAddedToWorkflowByUser:(id)a3;
@end

@implementation WFTimeUntilDateAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke;
  v7[3] = &unk_264E5CDF8;
  v7[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke_3;
  v6[3] = &unk_264E5E840;
  v6[4] = self;
  [v4 transformFirstObjectRepresentationForClass:v5 usingBlock:v7 completionHandler:v6];
}

void __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v32[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a5;
  if (v7)
  {
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    v24 = __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke_2;
    v25 = &unk_264E5CDD0;
    uint64_t v26 = *(void *)(a1 + 32);
    id v27 = v7;
    id v9 = v8;
    id v28 = v9;
    v10 = (void (**)(void *, void *))_Block_copy(&v22);
    v11 = objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", @"WFTimeUntilFromDate", objc_opt_class(), v22, v23, v24, v25, v26);
    if (v11)
    {
      v10[2](v10, v11);
    }
    else
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F870B8];
      uint64_t v29 = *MEMORY[0x263F08320];
      v19 = WFLocalizedString(@"The first date provided was invalid.");
      v30 = v19;
      v20 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      v21 = [v17 errorWithDomain:v18 code:5 userInfo:v20];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v21);
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F870B8];
    uint64_t v31 = *MEMORY[0x263F08320];
    v14 = WFLocalizedString(@"The second date provided was invalid.");
    v32[0] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v16 = [v12 errorWithDomain:v13 code:5 userInfo:v15];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v16);
  }
}

void __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

void __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) parameterValueForKey:@"WFTimeUntilUnit" ofClass:objc_opt_class()];
  if ([v4 isEqualToString:@"Total Time"])
  {
    [*(id *)(a1 + 40) timeIntervalSinceDate:v3];
    if (fabs(v5) >= 60.0) {
      uint64_t v6 = 124;
    }
    else {
      uint64_t v6 = 128;
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x263F339A8]) initWithTimeInterval:v6 allowedUnits:3 unitsStyle:1 zeroFormattingBehavior:v5];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if ([v4 isEqualToString:@"Seconds"])
    {
      uint64_t v8 = 128;
    }
    else if ([v4 isEqualToString:@"Minutes"])
    {
      uint64_t v8 = 64;
    }
    else if ([v4 isEqualToString:@"Hours"])
    {
      uint64_t v8 = 32;
    }
    else if ([v4 isEqualToString:@"Days"])
    {
      uint64_t v8 = 16;
    }
    else if ([v4 isEqualToString:@"Weeks"])
    {
      uint64_t v8 = 0x2000;
    }
    else if ([v4 isEqualToString:@"Months"])
    {
      uint64_t v8 = 8;
    }
    else if ([v4 isEqualToString:@"Years"])
    {
      uint64_t v8 = 4;
    }
    else
    {
      uint64_t v8 = 64;
    }
    id v9 = NSNumber;
    v10 = [MEMORY[0x263EFF8F0] currentCalendar];
    v11 = [v10 components:v8 fromDate:v3 toDate:*(void *)(a1 + 40) options:0];
    id v7 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v11, "valueForComponent:", v8));

    uint64_t v12 = *(void *)(a1 + 48);
    v14[0] = v7;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);
  }
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFTimeUntilDateAction;
  [(WFTimeUntilDateAction *)&v7 wasAddedToWorkflowByUser:a3];
  id v4 = [(WFTimeUntilDateAction *)self parameterStateForKey:@"WFTimeUntilFromDate"];

  if (!v4)
  {
    double v5 = (void *)[objc_alloc(MEMORY[0x263F86A28]) initWithAggrandizements:0];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F86A68]) initWithVariable:v5];
    [(WFTimeUntilDateAction *)self setParameterState:v6 forKey:@"WFTimeUntilFromDate"];
  }
}

@end