@interface HFTimerTriggerSignificantTimeEventAdapter
- (id)createTriggerWithName:(id)a3 timeZone:(id)a4 recurrences:(id)a5;
- (id)updateTrigger:(id)a3;
- (void)updateTriggerBuilder:(id)a3 recurrences:(id)a4 inHome:(id)a5;
@end

@implementation HFTimerTriggerSignificantTimeEventAdapter

- (id)createTriggerWithName:(id)a3 timeZone:(id)a4 recurrences:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [(HFTimerTriggerTimeEventAdapter *)self eventBuilder];
  v10 = [v9 performValidation];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke;
  v29[3] = &unk_264093450;
  id v11 = v7;
  id v30 = v11;
  v31 = self;
  id v12 = v8;
  id v32 = v12;
  v13 = [v10 flatMap:v29];

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_2;
  v25[3] = &unk_264091178;
  id v14 = v11;
  id v26 = v14;
  v27 = self;
  id v15 = v12;
  id v28 = v15;
  id v16 = (id)[v13 addSuccessBlock:v25];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_36;
  v21[3] = &unk_264091150;
  id v22 = v14;
  v23 = self;
  id v24 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = (id)[v13 addFailureBlock:v21];

  return v13;
}

id __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F0E860]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = [*(id *)(a1 + 40) eventBuilder];
  v5 = [v4 significantEvent];
  v6 = [*(id *)(a1 + 40) eventBuilder];
  id v7 = [v6 significantEventOffset];
  id v8 = (void *)[v2 initWithName:v3 significantEvent:v5 significantEventOffset:v7 recurrences:*(void *)(a1 + 48)];

  v9 = [MEMORY[0x263F58190] futureWithResult:v8];

  return v9;
}

void __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [*(id *)(a1 + 40) eventBuilder];
    v5 = [v4 significantEvent];
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 138412802;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Created significant event trigger with name:%@ significant eventBuilder:%@ recurrence:%@", (uint8_t *)&v7, 0x20u);
  }
}

void __88__HFTimerTriggerSignificantTimeEventAdapter_createTriggerWithName_timeZone_recurrences___block_invoke_36(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(a1 + 40) eventBuilder];
    int v7 = [v6 significantEvent];
    uint64_t v8 = *(void *)(a1 + 48);
    int v9 = 138413058;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to create significant event trigger with name:%@ significant eventBuilder:%@ recurrence:%@. Error: %@", (uint8_t *)&v9, 0x2Au);
  }
}

- (void)updateTriggerBuilder:(id)a3 recurrences:(id)a4 inHome:(id)a5
{
  id v7 = a4;
  id v12 = a3;
  uint64_t v8 = [(HFTimerTriggerTimeEventAdapter *)self eventBuilder];
  int v9 = [v8 significantEvent];
  [v12 setSignificantEvent:v9];

  uint64_t v10 = [(HFTimerTriggerTimeEventAdapter *)self eventBuilder];
  __int16 v11 = [v10 significantEventOffset];
  [v12 setSignificantEventOffset:v11];

  [v12 setRecurrences:v7];
}

- (id)updateTrigger:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F58190];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke;
  v22[3] = &unk_26408E218;
  id v6 = v4;
  id v23 = v6;
  id v24 = self;
  id v7 = [v5 futureWithErrorOnlyHandlerAdapterBlock:v22];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_2;
  v19[3] = &unk_2640945A0;
  id v8 = v6;
  id v20 = v8;
  v21 = self;
  int v9 = [v7 flatMap:v19];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_4;
  v17[3] = &unk_2640911C8;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = (id)[v9 addSuccessBlock:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_39;
  v15[3] = &unk_26408C8C8;
  v15[4] = self;
  id v16 = v10;
  id v12 = v10;
  id v13 = (id)[v9 addFailureBlock:v15];

  return v9;
}

void __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v6 = [v3 eventBuilder];
  uint64_t v5 = [v6 significantEvent];
  [v2 updateSignificantEvent:v5 completionHandler:v4];
}

id __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x263F58190];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_3;
  v7[3] = &unk_26408E218;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  uint64_t v5 = [v2 futureWithErrorOnlyHandlerAdapterBlock:v7];

  return v5;
}

void __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v6 = [v3 eventBuilder];
  uint64_t v5 = [v6 significantEventOffset];
  [v2 updateSignificantEventOffset:v5 completionHandler:v4];
}

void __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_4(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) eventBuilder];
    id v4 = [v3 significantEvent];
    uint64_t v5 = [*(id *)(a1 + 40) name];
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Updated significant event: %@ for trigger with name: %@", (uint8_t *)&v6, 0x16u);
  }
}

void __59__HFTimerTriggerSignificantTimeEventAdapter_updateTrigger___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = HFLogForCategory(0x29uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = [*(id *)(a1 + 32) eventBuilder];
    int v6 = [v5 significantEvent];
    id v7 = [*(id *)(a1 + 40) name];
    int v8 = 138412802;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to update significant event: %@ for trigger with name: %@. Error: %@", (uint8_t *)&v8, 0x20u);
  }
}

@end