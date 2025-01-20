@interface WFAddNewCalendarAction
- (id)preferredSourceWithStore:(id)a3;
- (void)finishWithCalendar:(id)a3 error:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFAddNewCalendarAction

- (id)preferredSourceWithStore:(id)a3
{
  v3 = [a3 sources];
  v4 = objc_msgSend(v3, "if_firstObjectPassingTest:", &__block_literal_global_191_52972);

  return v4;
}

BOOL __51__WFAddNewCalendarAction_preferredSourceWithStore___block_invoke(uint64_t a1, void *a2)
{
  return [a2 sourceType] < 4;
}

- (void)finishWithCalendar:(id)a3 error:(id)a4
{
  id v9 = a4;
  if (a3)
  {
    id v6 = a3;
    v7 = [(WFAddNewCalendarAction *)self output];
    v8 = [v6 title];

    [v7 addObject:v8];
  }
  [(WFAddNewCalendarAction *)self finishRunningWithError:v9];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v23[1] = *MEMORY[0x263EF8340];
  v4 = [(WFAddNewCalendarAction *)self parameterValueForKey:@"CalendarName" ofClass:objc_opt_class()];
  if ([v4 length])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F04B98]);
    id v6 = [v5 calendarsForEntityType:0];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __53__WFAddNewCalendarAction_runAsynchronouslyWithInput___block_invoke;
    v20[3] = &unk_264E5E198;
    id v7 = v4;
    id v21 = v7;
    v8 = objc_msgSend(v6, "if_firstObjectPassingTest:", v20);

    if (v8)
    {
      [(WFAddNewCalendarAction *)self finishWithCalendar:v8 error:0];
    }
    else
    {
      v13 = [MEMORY[0x263F04B38] calendarForEntityType:0 eventStore:v5];
      [v13 setTitle:v7];
      v14 = [v5 defaultCalendarForNewEvents];
      v15 = [v14 source];
      if (v15)
      {
        [v13 setSource:v15];
      }
      else
      {
        v16 = [v5 sources];
        v17 = objc_msgSend(v16, "if_firstObjectPassingTest:", &__block_literal_global_52983);
        [v13 setSource:v17];
      }
      id v19 = 0;
      [v5 saveCalendar:v13 commit:1 error:&v19];
      id v18 = v19;
      [(WFAddNewCalendarAction *)self finishWithCalendar:v13 error:v18];
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F870B8];
    uint64_t v22 = *MEMORY[0x263F08320];
    v11 = WFLocalizedString(@"No calendar name was provided. Please provide a name for this calendar.");
    v23[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v5 = [v9 errorWithDomain:v10 code:5 userInfo:v12];

    [(WFAddNewCalendarAction *)self finishRunningWithError:v5];
  }
}

BOOL __53__WFAddNewCalendarAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 title];
  BOOL v4 = [v3 localizedStandardCompare:*(void *)(a1 + 32)] == 0;

  return v4;
}

BOOL __53__WFAddNewCalendarAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 allowsCalendarAddDeleteModify]) {
    BOOL v3 = [v2 sourceType] < 4;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end