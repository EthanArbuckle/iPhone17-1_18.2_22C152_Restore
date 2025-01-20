@interface NSSetI
@end

@implementation NSSetI

uint64_t __27____NSSetI_containsObject___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

unint64_t ____NSSetI_new_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t v4 = *(void *)(a1 + 48);
  unint64_t result = [(id)a2 hash];
  if (v4)
  {
    unint64_t v7 = result % v4;
    unint64_t v8 = v4;
    while (1)
    {
      unint64_t result = *(void *)(v5 + 8 * v7);
      if (!result || result == a2) {
        break;
      }
      unint64_t result = [(id)result isEqual:a2];
      if (result) {
        break;
      }
      if (v7 + 1 >= v4) {
        unint64_t v10 = v4;
      }
      else {
        unint64_t v10 = 0;
      }
      unint64_t v7 = v7 + 1 - v10;
      if (!--v8)
      {
        unint64_t v7 = v4;
        break;
      }
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (!*(void *)(v11 + 8 * v7))
  {
    *(void *)(v11 + 8 * v7) = a2;
    if (a2 >= 1 && !*(unsigned char *)(a1 + 56)) {
      unint64_t result = (unint64_t)(id)a2;
    }
    *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(*(void *)(a1 + 32) + 8) & 0xFC00000000000000 | (*(void *)(*(void *)(a1 + 32) + 8) + 1) & 0x3FFFFFFFFFFFFFFLL;
  }
  return result;
}

uint64_t __27____NSSetI_countForObject___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

uint64_t __19____NSSetI_member___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = a2;
  return result;
}

void *__51____NSSetI_enumerateObjectsWithOptions_usingBlock___block_invoke(void *result, uint64_t a2)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(result[6] + 8) + 24));
  if ((v2 & 1) == 0)
  {
    v3 = result;
    if (*(void *)(result[4] + 16 + 8 * a2))
    {
      unint64_t v4 = (void *)_CFAutoreleasePoolPush();
      __NSSET_IS_CALLING_OUT_TO_A_BLOCK__(v3[5]);
      return _CFAutoreleasePoolPop(v4);
    }
  }
  return result;
}

@end