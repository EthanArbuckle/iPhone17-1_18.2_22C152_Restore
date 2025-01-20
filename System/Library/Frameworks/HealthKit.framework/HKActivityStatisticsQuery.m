@interface HKActivityStatisticsQuery
@end

@implementation HKActivityStatisticsQuery

uint64_t __52___HKActivityStatisticsQuery_setQueryUpdateHandler___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 192) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __49___HKActivityStatisticsQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

uint64_t __49___HKActivityStatisticsQuery_queue_deliverError___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

void __57___HKActivityStatisticsQuery_client_deliverResult_query___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 152)) {
    v3 = &OBJC_IVAR____HKActivityStatisticsQuery__queryUpdateHandler;
  }
  else {
    v3 = &OBJC_IVAR____HKActivityStatisticsQuery__initialQueryResultsHandler;
  }
  v4 = _Block_copy(*(const void **)(v2 + *v3));
  *(unsigned char *)(*(void *)(a1 + 32) + 152) = 1;
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "queue_shouldDeactivateAfterInitialResults");
  if (v4)
  {
    uint64_t v6 = v5;
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57___HKActivityStatisticsQuery_client_deliverResult_query___block_invoke_2;
    v11[3] = &unk_1E58BB9A0;
    id v9 = v4;
    uint64_t v10 = *(void *)(a1 + 32);
    id v13 = v9;
    v11[4] = v10;
    id v12 = *(id *)(a1 + 48);
    objc_msgSend(v7, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v8, v6, v11);
  }
}

uint64_t __57___HKActivityStatisticsQuery_client_deliverResult_query___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

@end