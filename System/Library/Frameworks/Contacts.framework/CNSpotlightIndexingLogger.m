@interface CNSpotlightIndexingLogger
@end

@implementation CNSpotlightIndexingLogger

void __47___CNSpotlightIndexingLogger_indexingContacts___block_invoke(uint64_t a1)
{
  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __47___CNSpotlightIndexingLogger_indexingContacts___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD3A40]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59___CNSpotlightIndexingLogger_reindexingAllSearchableItems___block_invoke(uint64_t a1)
{
  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __59___CNSpotlightIndexingLogger_reindexingAllSearchableItems___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD3A40]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71___CNSpotlightIndexingLogger_reindexingSearchableItemsWithIdentifiers___block_invoke(uint64_t a1)
{
  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __71___CNSpotlightIndexingLogger_reindexingSearchableItemsWithIdentifiers___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD3A40]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45___CNSpotlightIndexingLogger_verifyingIndex___block_invoke(uint64_t a1)
{
  v1.opaque[0] = 0;
  v1.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v1);
  os_activity_scope_leave(&v1);
}

void __45___CNSpotlightIndexingLogger_verifyingIndex___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x192FD3A40]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end