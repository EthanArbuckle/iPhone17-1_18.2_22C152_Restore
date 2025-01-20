@interface IOGCCircularControlQueueValidateAndAccess
@end

@implementation IOGCCircularControlQueueValidateAndAccess

uint64_t ___IOGCCircularControlQueueValidateAndAccess_block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = 3758097112;
  unint64_t v4 = *(unsigned int *)(a1 + 64);
  unint64_t v5 = *(void *)(a1 + 40);
  if (a2 + (v4 >> 1) <= v5) {
    return 3758097127;
  }
  if (v5 + (v4 >> 1) <= a2) {
    return 3758097128;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(unsigned int *)(a1 + 68);
  v8 = (void *)(v6 + v7 * (a2 % v4) + 72);
  if ((unint64_t)v8 + v7 > v6 + (unint64_t)*(unsigned int *)(a1 + 72)) {
    return 3758097097;
  }
  if (*v8 != *(void *)(a1 + 48))
  {
    v14 = _gc_log_debug();
    _os_log_internal(&dword_0, v14, OS_LOG_TYPE_DEBUG, "AssertMacros: %s, %s file: %s, line: %d, value: %ld\n", "entry->sentinel == queueGuard", (const char *)&unk_72F, "/Library/Caches/com.apple.xbs/Sources/CoreController_kext/IOGameControllerFamily/Utility/ControlQueue/IOGCCircularControlQueueMemory.c", 306, 0);
    return 3758097105;
  }
  unsigned int v9 = atomic_load_explicit((atomic_ullong *volatile)(v6 + v7 * (a2 % v4) + 80), memory_order_acquire) & 1;
  if (v8[3 * v9 + 3] != *(void *)(a1 + 56) || v8[3 * v9 + 4] != a2) {
    return v3;
  }
  uint64_t v10 = *(unsigned int *)(a1 + 80);
  unint64_t v11 = (unint64_t)v8 + v9 * (unint64_t)*(unsigned int *)(a1 + 76) + 64;
  v12 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a3 + 16);

  return v12(a3, v11, v10);
}

@end