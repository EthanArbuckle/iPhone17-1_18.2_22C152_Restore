@interface NSCollectionHandleConcurrentEnumerationIfSpecified
@end

@implementation NSCollectionHandleConcurrentEnumerationIfSpecified

void *____NSCollectionHandleConcurrentEnumerationIfSpecified_block_invoke(void *result)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(result[5] + 8) + 24));
  if ((v1 & 1) == 0)
  {
    v2 = result;
    if (*((unsigned char *)result + 48))
    {
      v3 = (void *)_CFAutoreleasePoolPush();
      (*(void (**)(void))(v2[4] + 16))();
      return _CFAutoreleasePoolPop(v3);
    }
    else
    {
      return (void *)(*(uint64_t (**)(void))(result[4] + 16))();
    }
  }
  return result;
}

@end