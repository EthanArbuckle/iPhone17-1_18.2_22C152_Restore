@interface IOGCFastPathRoyaReplayInputQueueSampleCommit
@end

@implementation IOGCFastPathRoyaReplayInputQueueSampleCommit

uint64_t ____IOGCFastPathRoyaReplayInputQueueSampleCommit_block_invoke(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_lock_with_options();
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a2 + 8) = v5;
  *(void *)(a2 + 16) = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)a2);
  unint64_t v6 = *(void *)(v5 + 24);
  unint64_t v7 = atomic_load((unint64_t *)(*(void *)(a1 + 32) + 160));
  if (v6 >= v7)
  {
    atomic_store(v6, (unint64_t *)(*(void *)(a1 + 32) + 160));
    atomic_store(atomic_load_explicit((atomic_ushort *volatile)(*(void *)(a1 + 32) + 144), memory_order_acquire), (unsigned __int16 *)(*(void *)(a1 + 32) + 146));
  }
  return 0;
}

@end