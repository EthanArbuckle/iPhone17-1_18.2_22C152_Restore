@interface WFAdjustDateAction
- (id)transformDate:(id)a3 operation:(unint64_t)a4;
- (void)finishWithInput:(id)a3 dateTransform:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFAdjustDateAction

- (void)finishWithInput:(id)a3 dateTransform:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__WFAdjustDateAction_finishWithInput_dateTransform___block_invoke;
  v11[3] = &unk_264E59EB0;
  id v12 = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__WFAdjustDateAction_finishWithInput_dateTransform___block_invoke_2;
  v10[3] = &unk_264E5E840;
  v10[4] = self;
  id v9 = v6;
  [v7 transformObjectRepresentationsForClass:v8 usingBlock:v11 completionHandler:v10];
}

void __52__WFAdjustDateAction_finishWithInput_dateTransform___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (**a5)(void, void, void))
{
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void (**)(uint64_t, uint64_t))(v8 + 16);
  v10 = a5;
  id v11 = a4;
  v9(v8, a2);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(void, id, id))a5)[2](v10, v12, v11);
}

void __52__WFAdjustDateAction_finishWithInput_dateTransform___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (id)transformDate:(id)a3 operation:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v7 = v6;
  switch(a4)
  {
    case 2uLL:
      uint64_t v8 = objc_msgSend(v6, "wf_startOfYearForDate:", v5);
      goto LABEL_9;
    case 3uLL:
      uint64_t v8 = objc_msgSend(v6, "wf_startOfMonthForDate:", v5);
      goto LABEL_9;
    case 4uLL:
      uint64_t v8 = objc_msgSend(v6, "wf_startOfWeekForDate:", v5);
      goto LABEL_9;
    case 5uLL:
      uint64_t v8 = [v6 startOfDayForDate:v5];
      goto LABEL_9;
    case 6uLL:
      uint64_t v8 = objc_msgSend(v6, "wf_startOfHourForDate:", v5);
      goto LABEL_9;
    case 7uLL:
      uint64_t v8 = objc_msgSend(v6, "wf_startOfMinuteForDate:", v5);
LABEL_9:
      id v9 = (void *)v8;
      break;
    default:
      id v9 = 0;
      break;
  }

  return v9;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAdjustDateAction *)self parameterValueForKey:@"WFAdjustOperation" ofClass:objc_opt_class()];
  if ([v5 isEqualToString:@"Add"]) {
    goto LABEL_2;
  }
  if ([v5 isEqualToString:@"Subtract"])
  {
    int v6 = 1;
    goto LABEL_5;
  }
  if ([v5 isEqualToString:@"Get Start of Year"])
  {
    uint64_t v16 = 2;
LABEL_20:

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __49__WFAdjustDateAction_runAsynchronouslyWithInput___block_invoke_2;
    v17[3] = &unk_264E59E88;
    v17[4] = self;
    v17[5] = v16;
    [(WFAdjustDateAction *)self finishWithInput:v4 dateTransform:v17];
    goto LABEL_21;
  }
  if ([v5 isEqualToString:@"Get Start of Month"])
  {
    uint64_t v16 = 3;
    goto LABEL_20;
  }
  if ([v5 isEqualToString:@"Get Start of Week"])
  {
    uint64_t v16 = 4;
    goto LABEL_20;
  }
  if ([v5 isEqualToString:@"Get Start of Day"])
  {
    uint64_t v16 = 5;
    goto LABEL_20;
  }
  if ([v5 isEqualToString:@"Get Start of Hour"])
  {
    uint64_t v16 = 6;
    goto LABEL_20;
  }
  if ([v5 isEqualToString:@"Get Start of Minute"])
  {
    uint64_t v16 = 7;
    goto LABEL_20;
  }
LABEL_2:
  int v6 = 0;
LABEL_5:

  id v7 = [(WFAdjustDateAction *)self parameterValueForKey:@"WFDuration" ofClass:objc_opt_class()];
  uint64_t v8 = (void *)MEMORY[0x263F86AD8];
  id v9 = [v7 unitString];
  uint64_t v10 = [v8 calendarUnitFromUnitString:v9];

  id v11 = [v7 magnitude];
  [v11 doubleValue];
  double v13 = v12;

  if (v6) {
    double v13 = -v13;
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF918]);
  [v14 setValue:(uint64_t)v13 forComponent:v10];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __49__WFAdjustDateAction_runAsynchronouslyWithInput___block_invoke;
  v18[3] = &unk_264E59E60;
  id v19 = v14;
  id v15 = v14;
  [(WFAdjustDateAction *)self finishWithInput:v4 dateTransform:v18];

LABEL_21:
}

id __49__WFAdjustDateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a2;
  id v5 = [v3 currentCalendar];
  int v6 = [v5 dateByAddingComponents:*(void *)(a1 + 32) toDate:v4 options:0];

  return v6;
}

uint64_t __49__WFAdjustDateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transformDate:a2 operation:*(void *)(a1 + 40)];
}

@end