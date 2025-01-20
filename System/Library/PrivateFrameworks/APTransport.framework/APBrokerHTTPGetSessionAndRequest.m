@interface APBrokerHTTPGetSessionAndRequest
@end

@implementation APBrokerHTTPGetSessionAndRequest

uint64_t ___APBrokerHTTPGetSessionAndRequest_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

@end