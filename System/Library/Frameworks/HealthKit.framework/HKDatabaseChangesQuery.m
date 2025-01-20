@interface HKDatabaseChangesQuery
@end

@implementation HKDatabaseChangesQuery

uint64_t __46___HKDatabaseChangesQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, 0, a1[5]);
}

void __81___HKDatabaseChangesQuery_client_deliverQueryAnchor_sampleTypeChanges_queryUUID___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 168));
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __81___HKDatabaseChangesQuery_client_deliverQueryAnchor_sampleTypeChanges_queryUUID___block_invoke_2;
    v8[3] = &unk_1E58C6260;
    id v6 = v2;
    uint64_t v7 = *(void *)(a1 + 32);
    id v11 = v6;
    v8[4] = v7;
    id v9 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 56);
    objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v5, 0, v8);
  }
}

uint64_t __81___HKDatabaseChangesQuery_client_deliverQueryAnchor_sampleTypeChanges_queryUUID___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], 0);
}

@end