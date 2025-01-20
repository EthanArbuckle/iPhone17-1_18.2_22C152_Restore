@interface NSCFURLSessionConnection
@end

@implementation NSCFURLSessionConnection

uint64_t __66____NSCFURLSessionConnection_initWithTask_delegate_delegateQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
  *(void *)(*(void *)(a1 + 32) + 64) = result;
  return result;
}

uint64_t __51____NSCFURLSessionConnection__storeCachedResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) _CFCachedURLResponse];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 16);

  return v6(a2, v4, v5);
}

@end