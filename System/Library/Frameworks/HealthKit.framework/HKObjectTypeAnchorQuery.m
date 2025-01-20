@interface HKObjectTypeAnchorQuery
@end

@implementation HKObjectTypeAnchorQuery

void __55___HKObjectTypeAnchorQuery_client_deliverAnchor_query___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55___HKObjectTypeAnchorQuery_client_deliverAnchor_query___block_invoke_2;
  v6[3] = &unk_1E58BB9A0;
  id v8 = v2;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 48);
  id v5 = v2;
  objc_msgSend(v4, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v3, 0, v6);
}

uint64_t __55___HKObjectTypeAnchorQuery_client_deliverAnchor_query___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5], 0);
}

@end