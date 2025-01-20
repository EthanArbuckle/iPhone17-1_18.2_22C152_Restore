@interface NSProgressSubscriber
@end

@implementation NSProgressSubscriber

uint64_t __29___NSProgressSubscriber_stop__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _invokeUnpublishingHandler];
}

uint64_t __61___NSProgressSubscriber_addPublisher_forID_withValues_isOld___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) lock];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 32))
  {
    [*(id *)(v2 + 40) unlock];
    v3 = *(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16);
    return v3();
  }
  else
  {
    [*(id *)(v2 + 24) removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 40) unlock];
    return 0;
  }
}

@end