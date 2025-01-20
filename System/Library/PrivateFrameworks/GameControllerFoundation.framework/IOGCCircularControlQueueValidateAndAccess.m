@interface IOGCCircularControlQueueValidateAndAccess
@end

@implementation IOGCCircularControlQueueValidateAndAccess

uint64_t ___IOGCCircularControlQueueValidateAndAccess_block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t result = 3758097112;
  unint64_t v5 = *(unsigned int *)(a1 + 64);
  unint64_t v6 = *(void *)(a1 + 40);
  if (a2 + (v5 >> 1) <= v6) {
    return 3758097127;
  }
  if (v6 + (v5 >> 1) <= a2) {
    return 3758097128;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(unsigned int *)(a1 + 68);
  v9 = (void *)(v7 + v8 * (a2 % v5) + 72);
  if ((unint64_t)v9 + v8 > v7 + (unint64_t)*(unsigned int *)(a1 + 72)) {
    return 3758097097;
  }
  if (*v9 != *(void *)(a1 + 48)) {
    return 3758097105;
  }
  unint64_t v10 = atomic_load_explicit(v9 + 1, memory_order_acquire) & 1;
  if (v9[3 * v10 + 3] == *(void *)(a1 + 56) && v9[3 * v10 + 4] == a2) {
    return (*(uint64_t (**)(uint64_t, unint64_t, void))(a3 + 16))(a3, (unint64_t)v9 + v10 * (unint64_t)*(unsigned int *)(a1 + 76) + 64, *(unsigned int *)(a1 + 80));
  }
  return result;
}

@end