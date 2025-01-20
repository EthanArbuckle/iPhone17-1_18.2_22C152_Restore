@interface HFTimerTriggerCalendarEventAdapter
+ (BOOL)hasWeekdayRecurrenceInRecurrences:(id)a3;
- (id)createTriggerWithName:(id)a3 timeZone:(id)a4 recurrences:(id)a5;
- (id)updateTrigger:(id)a3;
- (void)updateTriggerBuilder:(id)a3 recurrences:(id)a4 inHome:(id)a5;
@end

@implementation HFTimerTriggerCalendarEventAdapter

+ (BOOL)hasWeekdayRecurrenceInRecurrences:(id)a3
{
  return objc_msgSend(a3, "na_any:", &__block_literal_global_90);
}

BOOL __72__HFTimerTriggerCalendarEventAdapter_hasWeekdayRecurrenceInRecurrences___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 weekday] >= 1 && objc_msgSend(v2, "weekday") != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (id)createTriggerWithName:(id)a3 timeZone:(id)a4 recurrences:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(HFTimerTriggerTimeEventAdapter *)self eventBuilder];
  v12 = [v11 performValidation];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke;
  v32[3] = &unk_2640945C8;
  v32[4] = self;
  id v13 = v10;
  id v33 = v13;
  id v14 = v8;
  id v34 = v14;
  id v35 = v9;
  id v15 = v9;
  v16 = [v12 flatMap:v32];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_2;
  v28[3] = &unk_264091178;
  id v17 = v14;
  id v29 = v17;
  v30 = self;
  id v18 = v13;
  id v31 = v18;
  id v19 = (id)[v16 addSuccessBlock:v28];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_44;
  v24[3] = &unk_264091150;
  id v25 = v17;
  v26 = self;
  id v27 = v18;
  id v20 = v18;
  id v21 = v17;
  id v22 = (id)[v16 addFailureBlock:v24];

  return v16;
}

id __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke(uint64_t a1)
{
  int v2 = [(id)objc_opt_class() hasWeekdayRecurrenceInRecurrences:*(void *)(a1 + 40)];
  id v3 = objc_alloc(MEMORY[0x263F0E860]);
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = [*(id *)(a1 + 32) eventBuilder];
  v6 = [v5 effectiveFireDate];
  uint64_t v7 = *(void *)(a1 + 56);
  if (v2)
  {
    id v8 = (void *)[v3 initWithName:v4 fireDate:v6 timeZone:*(void *)(a1 + 56) recurrences:*(void *)(a1 + 40)];
  }
  else
  {
    id v9 = [*(id *)(a1 + 40) firstObject];
    id v8 = (void *)[v3 initWithName:v4 fireDate:v6 timeZone:v7 recurrence:v9 recurrenceCalendar:0];
  }
  id v10 = [MEMORY[0x263F58190] futureWithResult:v8];

  return v10;
}

void __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) eventBuilder];
    v5 = [v4 fireDate];
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Created timer trigger with name:%@ fireDate:%@ recurrence:%@", (uint8_t *)&v7, 0x20u);
  }
}

void __81__HFTimerTriggerCalendarEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_44(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) eventBuilder];
    int v7 = [v6 fireDate];
    uint64_t v8 = *(void *)(a1 + 48);
    int v9 = 138413058;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to create timer trigger with name:%@ fireDate:%@ recurrence:%@. Error: %@", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)updateTriggerBuilder:(id)a3 recurrences:(id)a4 inHome:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  uint64_t v8 = [(HFTimerTriggerTimeEventAdapter *)self eventBuilder];
  int v9 = [v8 effectiveFireDate];
  [v11 setFireDate:v9];

  if ([(id)objc_opt_class() hasWeekdayRecurrenceInRecurrences:v7])
  {
    [v11 setRecurrences:v7];
  }
  else
  {
    uint64_t v10 = [v7 firstObject];

    [v11 setRecurrence:v10];
    id v7 = (id)v10;
  }
}

- (id)updateTrigger:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F58190];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke;
  v21[3] = &unk_26408E218;
  v21[4] = self;
  id v6 = v4;
  id v22 = v6;
  id v7 = [v5 futureWithErrorOnlyHandlerAdapterBlock:v21];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_2;
  v19[3] = &unk_2640945F0;
  v19[4] = self;
  id v8 = v6;
  id v20 = v8;
  int v9 = [v7 flatMap:v19];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_3;
  v17[3] = &unk_2640911C8;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = (id)[v9 addSuccessBlock:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_46;
  v15[3] = &unk_26408C8C8;
  v15[4] = self;
  id v16 = v10;
  id v12 = v10;
  id v13 = (id)[v9 addFailureBlock:v15];

  return v9;
}

void __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 eventBuilder];
  [v5 updateBaseFireDateForTrigger];

  id v6 = [*(id *)(a1 + 32) eventBuilder];
  id v7 = [v6 effectiveFireDate];

  [*(id *)(a1 + 40) updateFireDate:v7 completionHandler:v4];
}

id __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  uint64_t v5 = [v3 fireDate];
  id v6 = [*(id *)(a1 + 32) eventBuilder];
  [v6 setFireDate:v5];

  id v7 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v7;
}

void __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) eventBuilder];
    id v4 = [v3 effectiveFireDate];
    uint64_t v5 = [*(id *)(a1 + 40) name];
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    int v9 = v5;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Updated execution time: %@ for trigger with name: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __52__HFTimerTriggerCalendarEventAdapter_updateTrigger___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = [*(id *)(a1 + 32) eventBuilder];
    int v6 = [v5 effectiveFireDate];
    id v7 = [*(id *)(a1 + 40) name];
    int v8 = 138412802;
    int v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to update execution time: %@ for trigger with name: %@. Error: %@", (uint8_t *)&v8, 0x20u);
  }
}

@end