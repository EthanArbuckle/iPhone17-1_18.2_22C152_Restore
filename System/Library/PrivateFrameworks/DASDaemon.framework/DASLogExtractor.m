@interface DASLogExtractor
@end

@implementation DASLogExtractor

uint64_t __36___DASLogExtractor_initWithArchive___block_invoke()
{
  return 1;
}

void __45___DASLogExtractor_getDefaultFilterPredicate__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF980]);
  v1 = (void *)getDefaultFilterPredicate_subpredicates;
  getDefaultFilterPredicate_subpredicates = (uint64_t)v0;

  v2 = (void *)getDefaultFilterPredicate_subpredicates;
  objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"type = %d", 1024);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6) {
    NSLog(&cfstr_ErrorWhenPrepa.isa, v6);
  }
  if (v5 && *(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2020000000;
    int v27 = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x263F52750]) initWithSource:v5];
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(void *)(v9 + 24) = v8;

    [*(id *)(*(void *)(a1 + 32) + 24) setFlags:391];
    v11 = [*(id *)(a1 + 32) getDefaultFilterPredicate];
    [v11 addObjectsFromArray:*(void *)(a1 + 40)];
    v12 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v11];
    [*(id *)(*(void *)(a1 + 32) + 24) setFilterPredicate:v12];

    dispatch_semaphore_t v13 = dispatch_semaphore_create(0);
    v14 = *(void **)(*(void *)(a1 + 32) + 24);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke_2;
    v21[3] = &unk_26486D538;
    uint64_t v23 = *(void *)(a1 + 72);
    id v22 = *(id *)(a1 + 56);
    [v14 setEventHandler:v21];
    v15 = *(void **)(*(void *)(a1 + 32) + 24);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke_3;
    v18[3] = &unk_26486D560;
    v20 = &v24;
    v16 = v13;
    v19 = v16;
    [v15 setInvalidationHandler:v18];
    [*(id *)(*(void *)(a1 + 32) + 24) activateStreamFromDate:*(void *)(a1 + 48)];
    NSLog(&cfstr_FetchingInform.isa);
    dispatch_time_t v17 = dispatch_time(0xFFFFFFFFFFFFFFFFLL, 1000000000);
    dispatch_semaphore_wait(v16, v17);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *((_DWORD *)v25 + 6);

    _Block_object_dispose(&v24, 8);
  }
}

void __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke_2(uint64_t a1)
{
  id v3 = *(id *)(a1 + 40);
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    v2 = [v3 eventStream];
    [v2 invalidate];
  }
}

intptr_t __67___DASLogExtractor_handleLogEventsLogEvents_sinceDate_withHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2 != 5)
  {
    NSLog(&cfstr_ErrorInGetting.isa);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
  }
  id v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

uint64_t __67___DASLogExtractor_summarizePolicyDenialsOverMessages_maxDuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  [v7 doubleValue];
  double v9 = v8;
  v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  [v10 doubleValue];
  double v12 = v11;

  if (v9 <= v12)
  {
    v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    [v14 doubleValue];
    double v16 = v15;
    dispatch_time_t v17 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    [v17 doubleValue];
    uint64_t v13 = v16 < v18;
  }
  else
  {
    uint64_t v13 = -1;
  }

  return v13;
}

uint64_t __71___DASLogExtractor_copyActivitySummary_startDate_endDate_detail_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  v4 = [v3 date];
  id v5 = [v3 category];
  id v6 = [v3 composedMessage];

  v7 = +[_DASLogEntry logEntryForDate:v4 category:v5 message:v6];
  [v2 addObject:v7];

  return 1;
}

uint64_t __74___DASLogExtractor_copyApplicationSummary_startDate_endDate_detail_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = a2;
  v4 = [v3 date];
  id v5 = [v3 category];
  id v6 = [v3 composedMessage];

  v7 = +[_DASLogEntry logEntryForDate:v4 category:v5 message:v6];
  [v2 addObject:v7];

  return 1;
}

uint64_t __88___DASLogExtractor_addConditionToHistory_fromMessage_atTimestamp_compactRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:&stru_26DDDA0E0] ^ 1;
}

uint64_t __55___DASLogExtractor_sysConditionsLog_startDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v5 composedMessage];
  v7 = [v5 date];

  [v3 addConditionToHistory:v4 fromMessage:v6 atTimestamp:v7 compactRepresentation:*(unsigned __int8 *)(a1 + 48)];
  return 1;
}

void __55___DASLogExtractor_sysConditionsLog_startDate_endDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = (FILE **)MEMORY[0x263EF8358];
  id v6 = (FILE *)*MEMORY[0x263EF8358];
  id v7 = [a2 description];
  double v8 = (const char *)[v7 UTF8String];
  id v9 = [v13 description];
  fprintf(v6, "%s:-----------\n%s\n\n", v8, (const char *)[v9 UTF8String]);

  v10 = [v13 idealIntervals];
  if ([v10 count])
  {
    double v11 = *(void **)(a1 + 32);
    double v12 = [v13 idealIntervals];
    [v11 addObject:v12];
  }
  else
  {
    fwrite("No ideal intervals.\n", 0x14uLL, 1uLL, *v5);
  }
}

@end