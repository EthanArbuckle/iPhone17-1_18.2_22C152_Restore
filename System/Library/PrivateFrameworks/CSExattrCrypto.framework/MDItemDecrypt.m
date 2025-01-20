@interface MDItemDecrypt
@end

@implementation MDItemDecrypt

uint64_t ___MDItemDecrypt_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___MDItemDecrypt_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  releaseConnection(v2);
}

@end