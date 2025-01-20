@interface NSSetEnumerate
@end

@implementation NSSetEnumerate

uint64_t ____NSSetEnumerate_block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^ 1u;
}

void *____NSSetEnumerate_block_invoke(void *result)
{
  uint64_t v9 = *(void *)off_1ECE0A5B0;
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(result[6] + 8) + 24));
  if ((v1 & 1) == 0)
  {
    v2 = result;
    v3 = (char *)&v8 - ((8 * result[7] + 15) & 0xFFFFFFFFFFFFFFF0);
    v4 = (void *)_CFAutoreleasePoolPush();
    pthread_mutex_lock((pthread_mutex_t *)v2[8]);
    if (v2[7])
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = [(id)v2[4] nextObject];
        *(void *)&v3[8 * v5] = v6;
        if (!v6) {
          break;
        }
        ++v5;
      }
      while (v5 < v2[7]);
    }
    pthread_mutex_unlock((pthread_mutex_t *)v2[8]);
    HIBYTE(v8) = 0;
    if (v2[7])
    {
      uint64_t v7 = 0;
      while (*(void *)&v3[8 * v7])
      {
        __NSSET_IS_CALLING_OUT_TO_A_BLOCK__(v2[5]);
        if (HIBYTE(v8))
        {
          atomic_store(1u, (unsigned __int8 *)(*(void *)(v2[6] + 8) + 24));
          return _CFAutoreleasePoolPop(v4);
        }
        if ((unint64_t)++v7 >= v2[7]) {
          return _CFAutoreleasePoolPop(v4);
        }
      }
    }
    return _CFAutoreleasePoolPop(v4);
  }
  return result;
}

@end