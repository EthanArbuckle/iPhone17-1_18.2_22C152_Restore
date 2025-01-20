@interface NSOQOpFinished
@end

@implementation NSOQOpFinished

void ____NSOQOpFinished_block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 16);
  LODWORD(v2) = atomic_load((unsigned __int8 *)(v2 + 237));
  if (v2 == 244)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = v4;
    if (!v4) {
      uint64_t v5 = *(void *)(a1 + 32);
    }
    *(void *)(v5 + 16) = v3;
    if (v3) {
      v6 = (void *)(v3 + 8);
    }
    else {
      v6 = (void *)(*(void *)(a1 + 32) + 24);
    }
    void *v6 = v4;
    if (*(unsigned __int8 *)(a1 + 48) >= 0x88u)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = *(_DWORD *)(v7 + 172);
      BOOL v9 = __OFSUB__(v8, 1);
      int v10 = v8 - 1;
      if (v10 < 0 == v9) {
        *(_DWORD *)(v7 + 172) = v10;
      }
    }
    *(void *)(*(void *)(a1 + 40) + 8) = 0;
    *(void *)(*(void *)(a1 + 40) + 16) = 0;
    op_invalidate_queue_and_schedule_locked(*(void *)(a1 + 40));
  }
  if (!*(unsigned char *)(a1 + 49)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)(a1 + 32) + 144), 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed);
  }
  v11 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);

  os_unfair_lock_unlock(v11);
}

@end