@interface CFHTTPServerConnectionCopyProperty
@end

@implementation CFHTTPServerConnectionCopyProperty

uint64_t ___CFHTTPServerConnectionCopyProperty_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 56))(a2, *(void *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end