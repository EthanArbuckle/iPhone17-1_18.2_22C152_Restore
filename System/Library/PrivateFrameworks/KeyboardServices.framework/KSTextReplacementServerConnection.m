@interface KSTextReplacementServerConnection
@end

@implementation KSTextReplacementServerConnection

uint64_t __73___KSTextReplacementServerConnection_addEntries_removeEntries_withReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59___KSTextReplacementServerConnection_requestSyncWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68___KSTextReplacementServerConnection_cancelPendingUpdatesWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75___KSTextReplacementServerConnection_queryTextReplacementEntriesWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __79___KSTextReplacementServerConnection_queryTextReplacementsWithPredicate_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60___KSTextReplacementServerConnection_textReplacementEntries__block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __60___KSTextReplacementServerConnection_textReplacementEntries__block_invoke_2(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3 ^ 1;
  return result;
}

@end