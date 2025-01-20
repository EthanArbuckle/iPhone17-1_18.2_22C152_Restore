@interface CFHTTPServerCopyProperty
@end

@implementation CFHTTPServerCopyProperty

uint64_t ___CFHTTPServerCopyProperty_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 80))(a2, *(void *)(a1 + 32));
}

uint64_t ___CFHTTPServerCopyProperty_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 64))(a2, *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end