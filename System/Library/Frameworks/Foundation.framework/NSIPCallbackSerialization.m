@interface NSIPCallbackSerialization
@end

@implementation NSIPCallbackSerialization

uint64_t __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 16));
  if (v1) {
    __assert_rtn("-[_NSIPCallbackSerialization sendBeginBlock:]_block_invoke", "NSItemProvider.m", 106, "!_hasBegun");
  }
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 16));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 8);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t __43___NSIPCallbackSerialization_sendEndBlock___block_invoke(uint64_t a1)
{
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 17));
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  LOBYTE(v3) = atomic_load((unsigned __int8 *)(v3 + 16));
  if (v3)
  {
    v5 = (uint64_t (*)(void))v2[2];
    return v5();
  }
  else
  {
    uint64_t result = [v2 copy];
    *(void *)(*(void *)(a1 + 32) + 8) = result;
  }
  return result;
}

@end