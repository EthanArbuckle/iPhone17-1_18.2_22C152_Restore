@interface DKCalendarMonitor
@end

@implementation DKCalendarMonitor

void __26___DKCalendarMonitor_init__block_invoke(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  v5 = [MEMORY[0x263F34FB8] knowledgeChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __26___DKCalendarMonitor_init__block_invoke_cold_1(a3, a2, v5);
  }
}

void __28___DKCalendarMonitor_update__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) lastUpdate];
  if (!v2)
  {
    v2 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-21600.0];
  }
  v3 = [MEMORY[0x263EFF910] date];
  id v4 = objc_alloc_init(MEMORY[0x263F04B98]);
  v5 = [v4 predicateForEventsWithStartDate:v2 endDate:v3 calendars:0];
  v6 = [v4 eventsMatchingPredicate:v5];

  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "startDate", (void)v16);
        [v13 compare:v2];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = [*(id *)(a1 + 32) historicalHandler];

  if (v14)
  {
    v15 = [*(id *)(a1 + 32) historicalHandler];
    ((void (**)(void, void *))v15)[2](v15, v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "setLastUpdate:", v3, (void)v16);
}

void __26___DKCalendarMonitor_init__block_invoke_cold_1(uint64_t a1, unsigned __int8 a2, os_log_t log)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = (a1 == 0) & a2;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "Calendar access granted? %d.", (uint8_t *)v3, 8u);
}

@end