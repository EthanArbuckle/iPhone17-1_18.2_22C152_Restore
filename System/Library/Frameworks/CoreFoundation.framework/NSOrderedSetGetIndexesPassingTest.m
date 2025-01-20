@interface NSOrderedSetGetIndexesPassingTest
@end

@implementation NSOrderedSetGetIndexesPassingTest

uint64_t ____NSOrderedSetGetIndexesPassingTest_block_invoke(uint64_t result, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(*(void *)(result + 64) + 8) + 24));
  if ((v2 & 1) == 0)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 80);
    unint64_t v5 = *(void *)(result + 72) + v4 * a2;
    if (v4 + v5 - 1 >= *(void *)(result + 88)) {
      unint64_t v6 = *(void *)(result + 88);
    }
    else {
      unint64_t v6 = v4 + v5 - 1;
    }
    result = __NSOrderedSetChunkIterate(*(void **)(result + 32), *(void *)(result + 96), v5, v6, *(void **)(result + 40), *(void *)(result + 56), 0, *(void **)(result + 48), *(pthread_mutex_t **)(result + 104));
    atomic_store(result, (unsigned __int8 *)(*(void *)(*(void *)(v3 + 64) + 8) + 24));
  }
  return result;
}

@end