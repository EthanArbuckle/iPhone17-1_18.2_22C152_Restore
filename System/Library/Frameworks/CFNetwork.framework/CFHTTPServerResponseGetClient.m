@interface CFHTTPServerResponseGetClient
@end

@implementation CFHTTPServerResponseGetClient

uint64_t ___CFHTTPServerResponseGetClient_block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end